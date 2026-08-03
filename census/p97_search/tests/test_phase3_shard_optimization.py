from __future__ import annotations

import json
from itertools import product
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_shard_optimization as optimization
from census.p97_search import phase3_structural_cegar_projected_static_v3 as v3


def _satisfies(
    clauses: tuple[tuple[int, ...], ...],
    assignment: dict[int, bool],
) -> bool:
    return all(
        any(
            assignment[abs(literal)] == (literal > 0)
            for literal in clause
        )
        for clause in clauses
    )


def test_simplification_preserves_fixed_shard_formula() -> None:
    clauses = (
        (1, 3),
        (-1, 3),
        (3, 4),
        (3,),
        (3,),
        (5, -5),
        (-2, 6),
    )
    assumptions = (1, -2)
    result = optimization.simplify_clauses(clauses, assumptions)

    assert result.residual_clauses == ((1,), (-2,), (3,))
    assert result.satisfied_clause_count == 2
    assert result.falsified_literal_count == 1
    assert result.tautological_clause_count == 1
    assert result.duplicate_clause_count == 2
    assert result.subsumed_clause_count == 1
    assert result.empty_clause is False
    metadata = result.as_dict()
    assert metadata["schema"] == optimization.SCHEMA
    assert metadata["residual_clause_count"] == 3
    assert metadata["transform_sha256"] == result.transform_sha256

    variables = (1, 2, 3, 4, 5, 6)
    for values in product((False, True), repeat=len(variables)):
        assignment = dict(zip(variables, values))
        if any(assignment[abs(literal)] != (literal > 0) for literal in assumptions):
            continue
        assert _satisfies(clauses, assignment) == _satisfies(
            result.residual_clauses, assignment
        )


def test_empty_residual_is_explicit_and_subsumes_other_clauses() -> None:
    result = optimization.simplify_clauses(
        ((-1,), (2, 3), (2,)),
        (1,),
    )
    assert result.residual_clauses == ((1,), ())
    assert result.empty_clause is True
    assert result.subsumed_clause_count == 2


def test_contradictory_shard_assumptions_fail_closed() -> None:
    with pytest.raises(
        optimization.SimplificationError,
        match="both signs",
    ):
        optimization.simplify_clauses(((1,),), (1, -1))


def test_fixed_cube_partition_is_deterministic_and_exact() -> None:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    depth = 3
    cubes = v3._cube_partition(encoding, depth)
    variables = tuple(
        variable
        for _name, variable, _key in v3._stable_semantic_variables(
            encoding, depth
        )
    )

    assert len(cubes) == 1 << depth
    assert len(set(cubes)) == len(cubes)
    assert {
        tuple(literal > 0 for literal in cube) for cube in cubes
    } == set(product((False, True), repeat=depth))
    assert all(
        tuple(abs(literal) for literal in cube) == variables for cube in cubes
    )


def test_fixed_shard_driver_records_residual_transform_and_replays(
    tmp_path: Path,
) -> None:
    def solver(cnf: Path, _timeout: int, proof: Path | None) -> Any:
        if proof is not None:
            proof.write_bytes(b"0\n")
        return v3.sat.SolverResult(
            "UNSAT", {}, 20, "s UNSATISFIABLE\n", ""
        )

    def checker(_cnf: Path, _proof: Path, _timeout: int) -> Any:
        return v3.sat.CheckerResult(True, 0, "s VERIFIED\n", "")

    out = tmp_path / "simplified-shard"
    result = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=(),
        projected_static_v3=True,
        shard_depth=1,
        shard_index=0,
        shard_local_simplification=True,
        solver_runner=solver,
        checker_runner=checker,
    )

    assert result["status"] == "SHARD_STRUCTURAL_UNSAT_VERIFIED"
    contract = result["configuration"]["shard_local_simplification"]
    assert contract["enabled"] is True
    assert contract["base_snapshot"]["schema"] == optimization.SCHEMA
    summary = result["shard_local_simplification"]
    assert summary["attempt_count"] == 1
    entry = summary["attempts"][0]
    assert entry["residual_clause_count"] == result["terminal_clause_count"]
    log = json.loads((out / "solver-logs.jsonl").read_text().splitlines()[0])
    assert log["shard_local_simplification"] == {
        key: value
        for key, value in entry.items()
        if key not in {"attempt", "solver_log_record_sha256"}
    }
    assert v3._sha256_file(out / "terminal.cnf") == log["cnf_sha256"]

    resumed = v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=2,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=(),
        projected_static_v3=True,
        shard_depth=1,
        shard_index=0,
        shard_local_simplification=True,
        resume=True,
        solver_runner=lambda *_args: pytest.fail(
            "completed shard resume must not invoke the solver"
        ),
        checker_runner=checker,
    )
    assert resumed == result
