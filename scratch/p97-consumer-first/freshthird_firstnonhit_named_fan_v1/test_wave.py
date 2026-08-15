from __future__ import annotations

import importlib.util
from pathlib import Path

from z3 import sat, unsat

HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("named_fan", HERE / "run_wave.py")
assert SPEC and SPEC.loader
wave = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(wave)
READBACK = importlib.util.spec_from_file_location("readback", HERE / "verify_readback.py")
assert READBACK and READBACK.loader
readback = importlib.util.module_from_spec(READBACK)
READBACK.loader.exec_module(readback)


def test_two_source_constructor_products_are_sat() -> None:
    assert wave.build_packet(nonhit="sameBlocker", interaction="sameBlocker")[0].check() == sat
    assert wave.build_packet(nonhit="sourceRowOmission", interaction="distinctBlockersDifferentCaps")[0].check() == sat
    assert wave.build_packet(nonhit="sourceRowOmission", interaction="sameCapWithInternalFiberSource")[0].check() == sat


def test_negative_controls_are_unsat() -> None:
    for control in ("duplicate_q_support", "overfull_q", "source_membership", "missing_survival", "multiple_selectors"):
        assert wave.build_packet(malformed=control)[0].check() == unsat


def test_duplicate_gate_and_no_frozen_order() -> None:
    solver, ctx = wave.build_packet()
    assert len(ctx["clauses"]) == len({tuple(item["key"]) for item in ctx["clauses"]})
    source = (HERE / "run_wave.py").read_text(encoding="utf-8")
    assert "ORDER_ARMS" not in source
    assert "fixed_arm" not in source


def test_independent_artifact_readback(tmp_path: Path) -> None:
    solver, ctx = wave.build_packet()
    assert solver.check() == sat
    wave.emit_artifact(solver, ctx, tmp_path / "sat.smt2", "sat", wave.model_summary(solver.model(), ctx))
    assert readback.validate(tmp_path) == []


def test_smoke_control_inventory() -> None:
    results = wave.smoke_controls()
    assert [item["status"] for item in results] == ["sat", "sat", "unsat", "unsat", "unsat", "unsat"]
