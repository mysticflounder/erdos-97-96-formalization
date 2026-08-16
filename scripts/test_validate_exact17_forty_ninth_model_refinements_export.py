from __future__ import annotations

import json
from pathlib import Path

import pytest
import validate_exact17_forty_ninth_model_refinements_export as validator


def test_authenticated_forty_ninth_export_passes() -> None:
    result = validator.validate_export()
    assert result["status"] == "PASS"
    assert result["child"]["clauses"] == 7_198_668
    assert result["child"]["bytes"] == 338_661_334
    assert result["suffix"]["clauses"] == 196
    assert result["parent_subsumption_census"]["complete"] is True
    assert result["parent_subsumption_census"]["witness_total"] == 128


def test_mutated_mine_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    payload = json.loads(validator.MINE_PATH.read_text(encoding="utf-8"))
    payload["status"] = "MUTATED"
    mutated = tmp_path / "mine.json"
    mutated.write_text(json.dumps(payload), encoding="utf-8")
    monkeypatch.setattr(validator, "MINE_PATH", mutated)
    with pytest.raises(ValueError, match="mine hash"):
        validator._mine()


def test_mutated_child_is_rejected(tmp_path: Path) -> None:
    child = tmp_path / "child.cnf"
    child.write_bytes(validator.CHILD_PATH.read_bytes() + b"\n")
    with pytest.raises(ValueError, match="child byte count|child hash|suffix"):
        validator.validate_export(validator.PARENT_PATH, child)
