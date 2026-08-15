from __future__ import annotations

import importlib.util
import json
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "mine_exact17_cdefg_model_bank.py"
ANALYSIS = ROOT / "scratch" / "exact17-lean-to-sat" / "piqd-thirty-first-root-model-analysis.json"


def module():
    spec = importlib.util.spec_from_file_location("exact17_cdefg_miner", SCRIPT)
    assert spec and spec.loader
    loaded = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(loaded)
    return loaded


def test_duplicate_analysis_key_is_rejected(tmp_path: Path) -> None:
    miner = module()
    path = tmp_path / "analysis.json"
    path.write_text('{"rows":{},"rows":{}}', encoding="utf-8")
    with pytest.raises(ValueError, match="duplicate JSON key"):
        miner.load_json(path)


def test_historical_pass_is_diagnostic_without_authenticated_identity() -> None:
    miner = module()
    analysis = json.loads(ANALYSIS.read_text(encoding="utf-8"))
    rows, authenticated = miner.validate_analysis(analysis)
    assert len(rows) == 17
    assert authenticated is False


def test_tampered_identity_does_not_authenticate() -> None:
    miner = module()
    analysis = json.loads(ANALYSIS.read_text(encoding="utf-8"))
    analysis.update(
        {
            "authentication": {
                "scheme": "piqd-sat-response/v1",
                "cnf_sha256": miner.PINNED_CNF_SHA256,
                "model_sha256": "f" * 64,
                "job_id": miner.PINNED_JOB_ID,
            },
            "production_authenticated": True,
        }
    )
    _, authenticated = miner.validate_analysis(analysis)
    assert authenticated is False
