from __future__ import annotations

import importlib
from pathlib import Path
from typing import Any

import pytest

incremental = importlib.import_module(
    "census.p97_search.phase3_incremental_cadical"
)
v3 = importlib.import_module(
    "census.p97_search.phase3_structural_cegar_projected_static_v3"
)


def _write_cnf(path: Path, clauses: list[tuple[int, ...]]) -> None:
    path.write_text(
        "p cnf 2 " + str(len(clauses)) + "\n"
        + "".join(" ".join(map(str, clause)) + " 0\n" for clause in clauses)
    )


class FakeIncrementalSolver:
    def __init__(self, outcomes: list[Any]) -> None:
        self.clauses: list[tuple[int, ...]] = []
        self.outcomes = outcomes
        self.solve_calls = 0
        self.closed = False

    def add_clause(self, clause: tuple[int, ...]) -> None:
        self.clauses.append(tuple(clause))

    def solve(self, _timeout_s: int) -> Any:
        outcome = self.outcomes[self.solve_calls]
        self.solve_calls += 1
        return outcome

    def close(self) -> None:
        self.closed = True


class FakeFactory:
    def __init__(self, outcomes: list[Any]) -> None:
        self.outcomes = outcomes
        self.instances: list[FakeIncrementalSolver] = []

    def __call__(self, _variable_count: int) -> FakeIncrementalSolver:
        solver = FakeIncrementalSolver(self.outcomes)
        self.instances.append(solver)
        return solver

    def descriptor(self) -> dict[str, Any]:
        return {"api": "fake-ipasir", "options": ["differential-test"]}


def test_parse_dimacs_is_exact_and_allows_empty_clause(tmp_path: Path) -> None:
    path = tmp_path / "formula.cnf"
    path.write_bytes(b"c comment\np cnf 2 2\n1 0\n0\n")

    assert incremental.parse_dimacs(path.read_bytes()) == (2, ((1,), ()))

    path.write_bytes(b"p cnf 2 1\n1 0\n-2 0\n")
    with pytest.raises(incremental.IncrementalCadicalError, match="count mismatch"):
        incremental.parse_dimacs(path.read_bytes())


def test_persistent_runner_reuses_solver_and_requires_append_only_formula(
    tmp_path: Path,
) -> None:
    sat_result = incremental.IncrementalSolveResult(
        "SAT", {1: True, 2: False}, 10, "sat", ""
    )
    factory = FakeFactory([sat_result, incremental.IncrementalSolveResult("UNSAT", {}, 20)])
    proof_calls: list[Path | None] = []

    def proof_solver(_cnf: Path, _timeout: int, proof: Path | None) -> Any:
        proof_calls.append(proof)
        return v3.sat.SolverResult("UNSAT", {}, 20, "", "")

    runner = incremental.PersistentDiscoveryRunner(factory, proof_solver=proof_solver)
    first = tmp_path / "first.cnf"
    second = tmp_path / "second.cnf"
    _write_cnf(first, [(1,)])
    _write_cnf(second, [(1,), (-2,)])

    first_result = runner(first, 5, None)
    second_result = runner(second, 5, None)
    assert first_result.verdict == "SAT"
    assert second_result.verdict == "UNSAT"
    assert len(factory.instances) == 1
    assert factory.instances[0].clauses == [(1,), (-2,)]
    assert runner.solve_count == 2
    assert runner.rebuild_count == 1

    proof_result = runner(second, 5, tmp_path / "proof.drat")
    assert proof_result.verdict == "UNSAT"
    assert proof_calls == [tmp_path / "proof.drat"]
    assert factory.instances[0].solve_calls == 2

    bad = tmp_path / "bad.cnf"
    _write_cnf(bad, [(-1,), (-2,)])
    with pytest.raises(incremental.IncrementalCadicalError, match="append-only"):
        runner(bad, 5, None)


def test_restart_rebuilds_from_complete_formula(tmp_path: Path) -> None:
    outcome = incremental.IncrementalSolveResult("UNSAT", {}, 20)
    first_factory = FakeFactory([outcome])
    first = incremental.PersistentDiscoveryRunner(first_factory)
    path = tmp_path / "formula.cnf"
    _write_cnf(path, [(1,), (-2,)])
    assert first(path, 5, None).verdict == "UNSAT"
    first.close()
    assert first_factory.instances[0].closed is True

    second_factory = FakeFactory([outcome])
    restarted = incremental.PersistentDiscoveryRunner(second_factory)
    assert restarted(path, 5, None).verdict == "UNSAT"
    assert second_factory.instances[0].clauses == [(1,), (-2,)]
    assert restarted.manifest_metadata()["rebuild_count"] == 1


def test_v3_persistent_feature_flag_preserves_fresh_terminal_proof(
    tmp_path: Path,
) -> None:
    factory = FakeFactory(
        [incremental.IncrementalSolveResult("UNSAT", {}, 20)]
    )
    calls: list[Path | None] = []

    def proof_solver(_cnf: Path, _timeout: int, proof: Path | None) -> Any:
        calls.append(proof)
        if proof is not None:
            proof.write_bytes(b"0\n")
        return v3.sat.SolverResult("UNSAT", {}, 20, "", "")

    result = v3.run_driver(
        tmp_path / "persistent",
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=(),
        projected_static_v3=True,
        persistent_discovery=True,
        incremental_solver_factory=factory,
        solver_runner=proof_solver,
        checker_runner=lambda *_args: v3.sat.CheckerResult(
            True, 0, "s VERIFIED\n", ""
        ),
    )

    assert result["status"] == "STRUCTURAL_UNSAT_VERIFIED"
    assert result["configuration"]["solver_protocol"]["incremental"]["enabled"]
    assert result["incremental_discovery"]["solve_count"] == 1
    assert result["incremental_discovery"]["rebuild_count"] == 1
    assert calls == [tmp_path / "persistent" / ".solver.drat"]
    assert factory.instances[0].closed is True
