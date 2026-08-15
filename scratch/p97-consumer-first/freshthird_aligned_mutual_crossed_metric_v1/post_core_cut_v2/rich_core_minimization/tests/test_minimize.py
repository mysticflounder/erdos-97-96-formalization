"""Regression tests for the frozen rich-radius core minimization."""

from __future__ import annotations

import importlib.util
import sys
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(HERE))

import minimize

VERIFY_SPEC = importlib.util.spec_from_file_location(
    "rich_core_verify", HERE / "verify.py"
)
assert VERIFY_SPEC is not None and VERIFY_SPEC.loader is not None
verify = importlib.util.module_from_spec(VERIFY_SPEC)
VERIFY_SPEC.loader.exec_module(verify)


def test_rebuilds_expected_global_core_members() -> None:
    encoding = minimize.load_encoding()
    clauses = minimize.canonical_clauses(encoding)
    by_name = {clause.name: clause for clause in clauses}
    core = [by_name[name] for name in verify.EXPECTED_CORE]
    verdict, _model, _solver = minimize.fresh_z3_check(core, 10_000)
    assert verdict.status == "UNSAT"
    for dropped in core:
        candidate = [clause for clause in core if clause.name != dropped.name]
        verdict, model, _solver = minimize.fresh_z3_check(candidate, 10_000)
        assert verdict.status == "SAT"
        assert model is not None
        replay = minimize.validate_sat_model(encoding, candidate, model)
        assert replay["exact_z3_substitution"] == "PASS"
        assert replay["fraction_replay"] == "PASS"


def test_direct_opposite_detector_and_canonical_absence() -> None:
    encoding = minimize.load_encoding()
    canonical = minimize.canonical_clauses(encoding)
    assert minimize.direct_opposites(canonical) == []
    x = z3.Real("opposite_detector_x")
    controls = [
        minimize.metric.Clause("zero", x == 0, "test"),
        minimize.metric.Clause("not_zero", x != 0, "test"),
    ]
    assert minimize.direct_opposites(controls) == [
        {"left": "not_zero", "right": "zero"}
    ]


def test_static_artifact_bundle() -> None:
    verify.verify()
