# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import importlib.util
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
SCRIPT = Path(__file__).with_name("replay_and_mine.py")
spec = importlib.util.spec_from_file_location("child44_mine_under_test", SCRIPT)
assert spec is not None and spec.loader is not None
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


def test_assignment_rejects_duplicate_variable() -> None:
    model = {"model": {"assignment": list(range(1, module.VARS + 1))}}
    model["model"]["assignment"][-1] = 1
    with pytest.raises(ValueError, match="duplicate"):
        module.exact_assignment(model)


def test_custody_rejects_artifact_hash_drift() -> None:
    final = module.load_strict(module.FINAL)
    model = module.load_strict(module.MODEL)
    with pytest.raises(ValueError, match="artifact bytes drifted"):
        module.validate_custody(final, model, module.FINAL_SHA, "0" * 64)


def test_strict_parser_rejects_duplicate_keys() -> None:
    with pytest.raises(ValueError, match="duplicate JSON key"):
        module.load_strict_bytes(b'{"model": {}, "model": {}}', source="test")


def test_prior_analysis_is_pinned() -> None:
    expected = dict(module.PRIOR_SOURCES[module.CHILD43])
    expected["sha256"] = "0" * 64
    with pytest.raises(ValueError, match="prior source bytes drifted"):
        module.validate_prior_source(module.CHILD43, expected)


def test_diagnostic_record_cannot_enter_accepted_family() -> None:
    candidate = {"support": [[1, 2]], "producer": {"stage": "equality-convex-five-point"}}
    with pytest.raises(ValueError, match="diagnostic/non-Kalmanson"):
        module.validate_candidate_envelope(candidate, module.support(candidate))


def test_authenticated_output_census() -> None:
    result = module.load_strict(module.OUT)
    assert result["status"] == "PASS"
    assert result["independent_replay"] == {
        "clauses_checked": module.CLAUSES,
        "satisfies_all": True,
        "sha256": module.CNF_SHA,
        "variables": module.VARS,
    }
    assert result["decoded_model"]["next_centers"] == [15]
    assert result["decoded_model"]["named_order_indices"] == [1]
    occurrence = result["two_kalmanson_occurrences"][0]
    assert occurrence["order_index"] == 1
    assert all(item["occurrence_clause_count"] == 4 for item in occurrence["candidates"] if item["bank_relation"] == "new-occurrence-existing-family")
    summary = {
        key: occurrence[key]
        for key in (
            "bank_exact_count",
            "bank_strict_subsumed_count",
            "distinct_support_count",
            "new_occurrence_count",
            "producer_record_count",
            "subset_minimal_count",
        )
    }
    assert summary == {
        "bank_exact_count": 0,
        "bank_strict_subsumed_count": 0,
        "distinct_support_count": 212,
        "new_occurrence_count": 99,
        "producer_record_count": 500,
        "subset_minimal_count": 99,
    }
    source = result["source_validation"]
    assert source["schema"] == "p97-exact17-child44-source-validation/v1"
    assert source["paired_source_checked"] == 99
    assert source["diagnostic_records_excluded"] == 10
    assert result["conclusion"]["new_general_source_valid_schema"] is False
