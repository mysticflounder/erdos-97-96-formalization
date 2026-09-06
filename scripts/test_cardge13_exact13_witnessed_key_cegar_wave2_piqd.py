from __future__ import annotations

import hashlib
import json
from pathlib import Path

import cardge13_exact13_witnessed_key_cegar_wave2_piqd as subject


def test_wave2_frontier_import_rebinds_all_cut_records(tmp_path: Path) -> None:
    subject._configure_wave1_delegate()
    report = subject.import_wave1_frontier(tmp_path)
    assert report["imported_cut_count"] == 1000
    assert report["parent_models_rebound"] == 1000
    assert report["raw_solve_records_rebound"] == 1000
    assert report["all_paths_rewritten_and_resealed"] is True
    assert report["imported_root_sha256"] == subject.WAVE1_ROOT_SHA256
    bank = tmp_path / "events" / "cut-bank.jsonl"
    rows = [json.loads(line) for line in bank.read_text().splitlines()]
    assert len(rows) == 1000
    assert rows[0]["index"] == 0
    assert rows[-1]["index"] == 999
    assert all(Path(row["certificate"]).exists() for row in rows)
    first_cert = json.loads(Path(rows[0]["certificate"]).read_text())
    assert first_cert["parent_model"].startswith(str(tmp_path))
    subject.wave1._verify_seal(first_cert, "imported cut")


def test_wave2_root_rebind_matches_corrected_root(tmp_path: Path) -> None:
    subject._configure_wave1_delegate()
    _cnf, _projection, report = subject.wave1.initial_root(
        tmp_path,
        subject.wave1.DEFAULT_SOURCE,
        "be28c8c1c44f57a69009f33da061062f70207ff4",
    )
    assert report["variables"] == 432
    assert report["clauses"] == 29468
    assert report["piqd_normalized_journal_sha256"] == subject.WAVE1_JOURNAL_SHA256


def test_wave2_budget_is_additional_and_preserves_projection_boundary() -> None:
    assert subject.WAVE1_CUT_COUNT + 5000 == 6000
    assert subject.NO_EXACT_KEY_ENUMERATION_BLOCKS is True
    assert subject.NO_EXISTENTIAL_WITNESS_CUT_VARIABLES is True


def test_retained_run_event_hash_recomputes_independently() -> None:
    path = subject.RUN_ROOT / "events" / "run.json"
    value = json.loads(path.read_text())
    recorded = value.pop("event_sha256")
    recomputed = hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()
    assert recorded == recomputed


def test_reseal_replaces_an_inherited_event_hash() -> None:
    sealed = subject.reseal({"payload": 1, "event_sha256": "stale"})
    expected = hashlib.sha256(
        json.dumps({"payload": 1}, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()
    assert sealed["event_sha256"] == expected
