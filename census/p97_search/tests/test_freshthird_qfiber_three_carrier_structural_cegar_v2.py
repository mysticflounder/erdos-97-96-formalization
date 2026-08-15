from __future__ import annotations

import json
import subprocess
from pathlib import Path
from typing import ClassVar

import pytest

import census.p97_search.freshthird_qfiber_three_carrier_structural_cegar_v2 as runner


def test_known_cadical_return_codes_are_exact() -> None:
    assert runner._solver_status(10) == "SAT"
    assert runner._solver_status(20) == "UNSAT"
    assert runner._solver_status(0) == "UNKNOWN"
    assert runner._solver_status(-1) == "UNKNOWN"


def test_known_sat_and_unsat_model_smoke() -> None:
    # DIMACS x and ¬x are respectively known SAT and UNSAT fixtures.  The
    # runner's exact status parser is intentionally independent of CaDiCaL.
    assert runner._solver_status(10) == "SAT"
    assert runner._solver_status(20) == "UNSAT"
    assert runner._parse_cadical_model("s SATISFIABLE\nv 1 0\n", 1) == {1: True}
    with pytest.raises(runner.StructuralCegarError, match="incomplete"):
        runner._parse_cadical_model("s SATISFIABLE\nv 0\n", 1)


class _FakeReplay:
    def __init__(self, accepted: bool) -> None:
        self.accepted = accepted
        self.detail = "accepted" if accepted else "rejected"


class _FakeRefinement:
    def record(self) -> dict[str, object]:
        return {"schema": "fake-source-theorem", "clause": [-1]}

    clause = (-1,)


class _FakeEncoding:
    num_vars = 1
    semantic_vars: ClassVar[list[int]] = [1]

    def __init__(self, boundary_index: int) -> None:
        self.boundary_index = boundary_index

    def cnf_bytes(self, extra=()):
        suffix = b"".join(
            (b" " + b" ".join(str(x).encode() for x in clause)) for clause in extra
        )
        return b"p cnf 1 1\n1 0\n" + suffix

    def variable_map(self):
        return {
            "schema": "fake",
            "boundary_index": self.boundary_index,
            "variables": {"1": ["x"]},
        }

    def encoding_manifest(self):
        return {"schema": "fake", "boundary_index": self.boundary_index}

    def validate(self, assignment):
        if assignment != {1: True}:
            raise runner.StructuralCegarError("bad fake assignment")

    def model_signature(self, assignment):
        return {"point_classes": {}, "order": {}, "in_cap": {}}

    def semantic_replay(self, assignment, *, timeout_ms):
        return _FakeReplay(False)

    def cap_alternation_refinement_from_signature(self, signature):
        return _FakeRefinement()


class _AcceptAfterCutEncoding(_FakeEncoding):
    def validate(self, assignment):
        if set(assignment) != {1} or type(assignment[1]) is not bool:
            raise runner.StructuralCegarError("bad fake assignment")

    def semantic_replay(self, assignment, *, timeout_ms):
        return _FakeReplay(not assignment[1])


def test_all_four_cells_unsat_discovery_writes_prelaunch_manifest(
    tmp_path: Path,
) -> None:
    calls = 0

    def fake_solver(command, timeout):
        nonlocal calls
        calls += 1
        return subprocess.CompletedProcess(command, 20, b"s UNSATISFIABLE\n", b"")

    result = runner.run_wave(
        tmp_path / "wave",
        source_snapshot={"commit": "known"},
        solver_runner=fake_solver,
    )
    assert calls == 4
    assert result["run_state"] == "TERMINAL"
    assert result["statuses"] == {str(i): "COVERAGE_UNSAT_DISCOVERY" for i in range(4)}
    manifest = json.loads((tmp_path / "wave" / "manifest.json").read_text())
    assert manifest["source_snapshot"] == {"commit": "known"}
    assert (tmp_path / "wave" / "cell-0" / "step-000.cnf").exists()
    assert (tmp_path / "wave" / "cell-0" / "step-000.var-map.json").exists()
    assert (
        json.loads((tmp_path / "wave" / "cell-0" / "step-000.result.json").read_text())[
            "status"
        ]
        == "COVERAGE_UNSAT_DISCOVERY"
    )


def test_rejected_model_that_ignores_cut_is_stuck_and_terminal_run_is_idempotent(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(runner, "FreshThirdCarrierCnfEncoding", _FakeEncoding)
    monkeypatch.setattr(
        runner,
        "_admit_cut",
        lambda encoding, assignment, signature, prior, prior_records, variable_map_bytes: (
            None if prior else ((-1,), {"record_sha256": "0" * 64, "clause": [-1]})
        ),
    )
    calls = 0

    def fake_solver(command, timeout):
        nonlocal calls
        calls += 1
        return subprocess.CompletedProcess(command, 10, b"s SATISFIABLE\nv 1 0\n", b"")

    out = tmp_path / "wave"
    first = runner.run_wave(
        out,
        source_snapshot={"commit": "known"},
        max_cuts=1,
        solver_runner=fake_solver,
    )
    assert calls == 8
    assert first["statuses"] == {str(i): "STUCK_NO_ADMISSIBLE_CUT" for i in range(4)}
    second = runner.run_wave(
        out,
        source_snapshot={"commit": "known"},
        max_cuts=1,
        solver_runner=fake_solver,
    )
    assert calls == 8
    assert second["statuses"] == first["statuses"]


def test_final_budget_cut_is_solved_before_stopping(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(runner, "FreshThirdCarrierCnfEncoding", _AcceptAfterCutEncoding)
    monkeypatch.setattr(
        runner,
        "_admit_cut",
        lambda encoding, assignment, signature, prior, prior_records, variable_map_bytes: (
            ((-1,), {"record_sha256": "0" * 64, "clause": [-1]})
        ),
    )
    calls = 0

    def fake_solver(command, timeout):
        nonlocal calls
        value = 1 if calls % 2 == 0 else -1
        calls += 1
        return subprocess.CompletedProcess(
            command, 10, f"s SATISFIABLE\nv {value} 0\n".encode(), b""
        )

    result = runner.run_wave(
        tmp_path / "wave",
        source_snapshot={"commit": "known"},
        max_cuts=1,
        solver_runner=fake_solver,
    )
    assert calls == 8
    assert result["statuses"] == {str(i): "SAT_ABSTRACTION" for i in range(4)}


def test_terminal_reuse_rejects_artifact_tampering(tmp_path: Path) -> None:
    def fake_solver(command, timeout):
        return subprocess.CompletedProcess(command, 20, b"s UNSATISFIABLE\n", b"")

    out = tmp_path / "wave"
    runner.run_wave(
        out,
        source_snapshot={"commit": "known"},
        solver_runner=fake_solver,
    )
    (out / "cell-0" / "step-000.stdout").write_text("tampered\n")
    with pytest.raises(runner.StructuralCegarError, match="artifact inventory"):
        runner.run_wave(
            out,
            source_snapshot={"commit": "known"},
            solver_runner=fake_solver,
        )


def test_nonempty_unmanifested_output_is_rejected(tmp_path: Path) -> None:
    out = tmp_path / "wave"
    out.mkdir()
    (out / "foreign.txt").write_text("do not overwrite\n")
    with pytest.raises(runner.StructuralCegarError, match="nonempty output"):
        runner.run_wave(
            out,
            source_snapshot={"commit": "known"},
            solver_runner=lambda command, timeout: subprocess.CompletedProcess(
                command, 20, b"s UNSATISFIABLE\n", b""
            ),
        )
