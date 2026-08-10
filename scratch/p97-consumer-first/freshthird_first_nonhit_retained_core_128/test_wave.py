from __future__ import annotations

import importlib.util
from pathlib import Path

from z3 import sat, unsat

HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("wave", HERE / "run_wave.py")
assert SPEC and SPEC.loader
wave = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(wave)


def test_constructor_and_raw_products() -> None:
    assert len(wave.pair_records()) == 8
    assert len(wave.endpoint_arms()) == 16
    assert len(wave.pair_records()) * len(wave.endpoint_arms()) == 128


def test_common_omission_is_only_derived() -> None:
    arm = (0, 0, 1, 1)
    assert wave.common_tag(arm)["applicable"] is False
    solver, _ = wave.build_schema(fixed_arm=arm)
    assert solver.check() == sat


def test_malformed_controls_are_unsat() -> None:
    solver, _ = wave.build_schema(fixed_arm=(0, 0, 1, 0), overfull_row=0)
    assert solver.check() == unsat
    solver, _ = wave.build_schema(fixed_arm=(0, 0, 1, 0), force_present=(0, "x0"))
    assert solver.check() == unsat


def test_scope_and_origin_table() -> None:
    objects, cuts = wave.object_tables()
    assert {item["object"] for item in objects} >= {
        "two_source_rows",
        "deletion_choices",
        "common_endpoint_omission",
    }
    assert any(item["admission"] == "derived_conditional_tag" for item in cuts)
    assert all(
        item["admission"] != "admitted"
        for item in cuts
        if item["cut"]
        in {
            "Euclidean_metric_realizability",
            "universal_extraction_lift",
            "Lean_consumer_closure",
        }
    )
