"""Contract tests for the reduced Rigid221 BlockerV midpoint controls."""

from __future__ import annotations

import subprocess
import sys
from fractions import Fraction
from pathlib import Path

import pytest

z3 = pytest.importorskip("z3")

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_blockerv_midpoint_core_control as mod


def test_reference_witnesses_replay_exactly() -> None:
    forward = mod.replay_reference_witness(mod.FORWARD)
    reverse = mod.replay_reference_witness(mod.REVERSE)

    assert forward["physical_radius2"] == "289/100"
    assert reverse["physical_radius2"] == "289/100"
    assert forward["c3_members"] == sorted(mod.EXPECTED_C3)
    assert reverse["c3_members"] == sorted(mod.EXPECTED_C3)
    assert forward["first_turn"] == "1156/1625"
    assert reverse["first_turn"] == "-1156/1625"
    # The unreduced calculation is 3757/21125; Fraction serializes its
    # canonical reduced value for durable output.
    assert forward["midpoint_distance2"] == "289/1625"


def test_reference_points_have_the_expected_disk_values() -> None:
    points = mod.reference_points(mod.FORWARD)

    assert mod.dist2(mod.MEC_CENTER, points["u"]) == Fraction(10049, 16900)
    assert mod.dist2(mod.MEC_CENTER, points["v"]) == Fraction(49, 100)
    assert mod.dist2(mod.MEC_CENTER, points["delta"]) == Fraction(89, 100)


def test_both_cells_emit_deterministic_qf_nra_without_pseudo_booleans() -> None:
    formulas: list[str] = []
    for cell in mod.CELLS:
        first = mod.export_smt2(cell)
        second = mod.export_smt2(cell)
        session = mod.export_smt2(cell, include_check_sat=False)
        assert first == second
        assert first == f"{session}(check-sat)\n"
        assert first.startswith("(set-logic QF_NRA)\n")
        assert all(token not in first for token in ("pbeq", "pbge", "pble"))
        assert "(^ " not in first
        formulas.append(first)
    assert formulas[0] != formulas[1]


def test_formula_hashes_do_not_depend_on_the_process_hash_seed() -> None:
    snippet = (
        "import hashlib; "
        "import rigid221_s0_blockerv_midpoint_core_control as m; "
        "print(hashlib.sha256(m.export_smt2(m.FORWARD).encode()).hexdigest())"
    )
    hashes: set[str] = set()
    for seed in ("1", "2"):
        completed = subprocess.run(
            [sys.executable, "-c", snippet],
            check=True,
            capture_output=True,
            cwd=Path(__file__).resolve().parent,
            env={"PYTHONHASHSEED": seed},
            text=True,
        )
        hashes.add(completed.stdout.strip())
    assert len(hashes) == 1


def test_contradictory_mutation_is_unsat_for_each_cell() -> None:
    for cell in mod.CELLS:
        solver = mod.build_solver(cell, timeout_ms=100)
        solver.add(False)
        assert solver.check() == z3.unsat


def test_smoke_records_both_exact_positive_controls() -> None:
    result = mod.run_smoke(timeout_ms=1)

    assert result["status"] == "SMOKE_OK"
    assert [row["cell"] for row in result["cells"]] == ["forward", "reverse"]
