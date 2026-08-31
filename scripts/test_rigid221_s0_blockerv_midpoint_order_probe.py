"""Contract tests for source-consistent BlockerV midpoint-order cells."""

from __future__ import annotations

import sys
from pathlib import Path

import pytest

z3 = pytest.importorskip("z3")

sys.path.insert(0, str(Path(__file__).resolve().parent))

import rigid221_s0_blockerv_exactfive_probe as legacy
import rigid221_s0_blockerv_midpoint_order_probe as mod


def test_cells_preserve_roles_and_satisfy_source_midpoint_order() -> None:
    assert tuple(cell.name for cell in mod.CELLS) == ("forward", "reverse")
    assert all(set(cell.order) == set(legacy.ROLE_ORDER) for cell in mod.CELLS)
    assert all(mod.source_midpoint_order_holds(cell.order) for cell in mod.CELLS)
    assert not mod.source_midpoint_order_holds(legacy.ORDER)


def test_source_midpoint_order_requires_v_between_source_roles() -> None:
    bad_order = (
        "O",
        "au",
        "av",
        "delta",
        "m1",
        "u",
        "xu",
        "v",
        "m2",
        "xv",
        "bv",
        "bu",
        "cv",
    )
    assert not mod.source_midpoint_order_holds(bad_order)


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
        formulas.append(first)
    assert formulas[0] != formulas[1]


def test_contradictory_mutation_is_unsat_for_each_cell() -> None:
    for cell in mod.CELLS:
        solver = mod.build_solver(cell, timeout_ms=100)
        solver.add(False)
        assert solver.check() == z3.unsat


def test_smoke_records_both_repaired_cells() -> None:
    result = mod.run_smoke(timeout_ms=1)

    assert result["status"] == "SMOKE_OK"
    assert [row["cell"] for row in result["cells"]] == ["forward", "reverse"]
