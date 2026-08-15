from __future__ import annotations

import importlib.util
import json
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
SCRIPT = Path(__file__).with_name("replay_and_mine.py")
spec = importlib.util.spec_from_file_location("child43_mine_under_test", SCRIPT)
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
    expected = dict(module.PRIOR_SOURCES[module.CHILD42])
    expected["sha256"] = "0" * 64
    with pytest.raises(ValueError, match="prior source bytes drifted"):
        module.validate_prior_source(module.CHILD42, expected)


def test_diagnostic_record_cannot_enter_accepted_family() -> None:
    result = module.load_strict(module.OUT)
    candidate = json.loads(json.dumps(result["two_kalmanson_occurrences"][0]["candidates"][0]))
    candidate["producer"]["stage"] = "equality-convex-five-point"
    with pytest.raises(ValueError, match="diagnostic/non-Kalmanson"):
        module.validate_candidate_envelope(candidate, module.miner.support(candidate))


def test_authenticated_output_census() -> None:
    result = module.load_strict(module.OUT)
    assert result["status"] == "PASS"
    assert result["independent_replay"] == {
        "clauses_checked": module.CLAUSES,
        "satisfies_all": True,
        "sha256": module.CNF_SHA,
        "variables": module.VARS,
    }
    occurrence = result["two_kalmanson_occurrences"][0]
    assert occurrence["producer_record_count"] == 155
    assert occurrence["distinct_support_count"] == 100
    assert occurrence["subset_minimal_count"] == 57
    assert len(occurrence["candidates"]) == 57
    assert all(item["occurrence_clause_count"] == 4 for item in occurrence["candidates"])
    assert result["source_validation"] == {
        "clauses_per_occurrence": 4,
        "diagnostic_records_excluded": 4,
        "forward_producer_replayed": 57,
        "new_occurrence_clauses": 228,
        "occurrence_clause_directions": 2,
        "occurrence_clause_orders": 2,
        "paired_source_checked": 57,
        "reflected_producer_replayed": 57,
        "schema": "p97-exact17-child43-source-validation/v1",
    }
