"""Focused fail-closed tests for the current-root-v2 wave mine."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import pytest
import replay_and_mine as mine


def test_sealed_model_is_total_and_current() -> None:
    model = mine.strict_json(mine.MODEL)
    literals, values = mine.assignment_from_model(model)
    assert len(literals) == 308
    assert set(values) == set(range(1, 309))
    assert mine.sha256(mine.MODEL) == mine.MODEL_SHA


def test_assignment_rejects_duplicate_literal() -> None:
    with pytest.raises(ValueError, match="malformed"):
        mine.assignment_from_model(
            {
                "job_id": mine.JOB,
                "result": "SAT",
                "backend": "cadical",
                "assignment": [1] * 308,
            }
        )


def test_dimacs_replay_helper_checks_header_and_hash(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    cnf = tmp_path / "tiny.cnf"
    cnf.write_text("p cnf 1 1\n1 0\n", encoding="ascii")
    monkeypatch.setattr(mine, "VARS", 1)
    monkeypatch.setattr(mine, "CLAUSES", 1)
    monkeypatch.setattr(mine, "CNF_SHA", hashlib.sha256(cnf.read_bytes()).hexdigest())
    assert mine.replay_dimacs({1: True}, cnf)["satisfies_all"] is True
    with pytest.raises(ValueError, match="falsifies clause"):
        mine.replay_dimacs({1: False}, cnf)


def test_published_analysis_has_only_existing_family_and_no_direct_triple_hit() -> None:
    result = json.loads(
        (Path(__file__).parent / "analysis.json").read_text(encoding="utf-8")
    )
    assert result["status"] == "PASS"
    mine_result = result["two_kalmanson_occurrences"][0]
    assert mine_result["new_occurrence_count"] == 54
    assert mine_result["bank_exact_count"] == 0
    assert mine_result["bank_strict_subsumed_count"] == 0
    assert result["conclusion"]["new_general_source_valid_schema"] is False
    assert result["cross_wave_motif_scan"]["direct_two_triple_row_hits"] == 0
    assert all(
        item["source_validation"]["lean_occurrence_check"]
        for item in mine_result["candidates"]
    )
