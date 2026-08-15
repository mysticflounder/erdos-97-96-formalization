"""Regression tests for the frozen blocker-core minimization."""

from __future__ import annotations

import importlib.util
import sys
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(HERE))

import minimize

VERIFY_SPEC = importlib.util.spec_from_file_location(
    "blocker_core_verify", HERE / "verify.py"
)
assert VERIFY_SPEC is not None and VERIFY_SPEC.loader is not None
verify = importlib.util.module_from_spec(VERIFY_SPEC)
VERIFY_SPEC.loader.exec_module(verify)


def test_all_seventeen_selected_rows_equal_blocker_k4_rows() -> None:
    audit = minimize.selected_row_identity_audit(minimize.load_encoding())
    assert audit["source_count"] == 17
    assert audit["match_count"] == 17
    assert audit["mismatch_count"] == 0


def test_every_drop_one_has_an_exact_witness() -> None:
    encoding = minimize.load_encoding()
    clauses = minimize.canonical_clauses(encoding)
    by_name = {clause.name: clause for clause in clauses}
    core = [by_name[name] for name in verify.EXPECTED_CORE]
    for dropped in core:
        candidate = [clause for clause in core if clause.name != dropped.name]
        replay = minimize.exact_witness_validation(
            encoding, candidate, minimize.DROP_WITNESSES[dropped.name]
        )
        assert replay["exact_z3_substitution"] == "PASS"
        assert replay["fraction_replay"] in {"PASS", "SKIP_ALGEBRAIC"}


def test_direct_opposite_detector_and_derived_core() -> None:
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
