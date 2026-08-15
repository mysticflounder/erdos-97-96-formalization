"""Focused fail-closed tests for the current-root-v2 wave mine."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import pytest

import replay_and_mine as mine


def test_sealed_model_is_current_and_total() -> None:
    model = mine.strict_json(mine.MODEL)
    literals, values = mine.assignment_from_model(model)
    assert len(literals) == 308
    assert set(values) == set(range(1, 309))
    assert mine.sha256(mine.MODEL) == mine.MODEL_SHA
    assert [c for c in range(17) if values[290 + c]] == [14]
    assert [i for i in range(2) if values[307 + i]] == [1]


def test_assignment_rejects_duplicate_literal() -> None:
    with pytest.raises(ValueError, match="malformed"):
        mine.assignment_from_model(
            {"job_id": mine.JOB, "result": "SAT", "backend": "cadical", "assignment": [1] * 308}
        )


def test_dimacs_replay_helper_checks_header_and_hash(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    cnf = tmp_path / "tiny.cnf"
    cnf.write_text("p cnf 1 1\n1 0\n", encoding="ascii")
    monkeypatch.setattr(mine, "VARS", 1)
    monkeypatch.setattr(mine, "CLAUSES", 1)
    monkeypatch.setattr(mine, "CNF_SHA", hashlib.sha256(cnf.read_bytes()).hexdigest())
    assert mine.replay_dimacs({1: True}, cnf)["satisfies_all"] is True
    with pytest.raises(ValueError, match="falsifies clause"):
        mine.replay_dimacs({1: False}, cnf)


def test_authentication_and_parent_export_are_pass() -> None:
    _model, _literals, values, _auth = mine.authenticate()
    replay = mine.replay_dimacs(values)
    assert replay["clauses_checked"] == 7_037_176
    coverage = mine.package_coverage(values)
    assert coverage["validator"]["status"] == "PASS"
    assert coverage["serialized_support_count"] == 54
    assert coverage["positive_support_hits_in_current_model"] == 0
    assert coverage["omitted_banked_clause_count"] == 0


def test_published_analysis_reports_only_existing_family() -> None:
    result = json.loads((Path(__file__).parent / "analysis.json").read_text(encoding="utf-8"))
    assert result["status"] == "PASS"
    mine_result = result["two_kalmanson_occurrences"][0]
    assert mine_result["new_occurrence_count"] == 81
    assert mine_result["bank_exact_count"] == 0
    assert mine_result["bank_strict_subsumed_count"] == 0
    assert result["conclusion"]["new_general_source_valid_schema"] is False
    assert result["cross_wave_motif_scan"]["direct_two_triple_row_hits"] == 0
    assert result["scanner_inventory"]["formalized_two_row_and_related_cores"]["source_valid_new"] == 0
    assert all(item["source_validation"]["lean_occurrence_check"] for item in mine_result["candidates"])
