"""Contract tests for the bounded Rigid221 C3 two-row positive controls."""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path

import pytest

z3 = pytest.importorskip("z3")

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_c3_two_row_relational_probe as mod


def test_cli_exposes_the_relational_probe_controls() -> None:
    parser = mod.build_parser()
    option_dests = {action.dest for action in parser._actions}

    assert {"smoke", "direct_solve", "cell", "timeout_ms", "output_root", "verbose"} <= option_dests


def test_exact_reference_replay_in_both_turn_orientations() -> None:
    forward = mod.replay_reference_witness(mod.FORWARD)
    reverse = mod.replay_reference_witness(mod.REVERSE)

    for report in (forward, reverse):
        assert report["physical_radius2"] == "289/100"
        assert report["ku_radius2"] == "289/1625"
        assert report["kv_radius2"] == "221/400"
        assert report["midpoint_distance2"] == "289/1625"
        assert report["c3_orientation"] == "64/25"
    assert forward["first_turn"] == "1156/1625"
    assert forward["second_turn"] == "1156/1625"
    assert reverse["first_turn"] == "-1156/1625"
    assert reverse["second_turn"] == "-1156/1625"


def test_reference_witnesses_have_exact_named_carrier_radius_fibers() -> None:
    for cell in mod.CELLS:
        points = mod.reference_points(cell)
        report = mod.replay_reference_witness(cell)

        assert mod.radius_fiber(points, "O", mod.PHYSICAL_RADIUS2) == mod.PHYSICAL
        assert mod.radius_fiber(points, "v", mod.KU_RADIUS2) == mod.KU
        assert mod.radius_fiber(points, "cv", mod.KV_RADIUS2) == mod.KV
        assert report["physical_fiber"] == list(mod.PHYSICAL)
        assert report["ku_fiber"] == list(mod.KU)
        assert report["kv_fiber"] == list(mod.KV)


def test_exact_reference_bindings_are_sat_for_each_qf_nra_cell() -> None:
    for cell in mod.CELLS:
        solver = mod.build_solver(cell, timeout_ms=100)
        mod._add_reference_witness(solver, cell)

        assert solver.check() == z3.sat


def test_both_cells_emit_deterministic_flat_qf_nra_without_exponentiation() -> None:
    formulas: list[str] = []
    for cell in mod.CELLS:
        first = mod.export_smt2(cell)
        second = mod.export_smt2(cell)
        session = mod.export_smt2(cell, include_check_sat=False)

        assert first == second
        assert first == f"{session}(check-sat)\n"
        assert first.startswith("(set-logic QF_NRA)\n")
        assert "(^ " not in first
        assert all(token not in first for token in ("pbeq", "pbge", "pble"))
        formulas.append(first)
    assert formulas[0] != formulas[1]


def test_formula_hashes_do_not_depend_on_the_process_hash_seed() -> None:
    snippet = (
        "import hashlib; "
        "import rigid221_s0_c3_two_row_relational_probe as m; "
        "text = m.export_smt2(m.FORWARD) + m.export_smt2(m.REVERSE); "
        "print(hashlib.sha256(text.encode()).hexdigest())"
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


def test_known_false_mutation_is_unsat_for_each_cell() -> None:
    for cell in mod.CELLS:
        solver = mod.build_solver(cell, timeout_ms=100)
        solver.add(False)
        assert solver.check() == z3.unsat


def test_smoke_records_both_exact_relational_positive_controls() -> None:
    result = mod.run_smoke(timeout_ms=1)

    assert result["status"] == "SMOKE_OK"
    assert [row["cell"] for row in result["cells"]] == ["forward", "reverse"]
