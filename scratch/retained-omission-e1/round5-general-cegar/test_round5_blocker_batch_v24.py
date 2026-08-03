from __future__ import annotations

import json

import round5_blocker_batch_v24 as v24


def test_hash_journal_round_trip_and_tamper_detection(tmp_path) -> None:
    journal = v24.HashJournal(tmp_path / "journal")
    first = journal.append({"phase": "start", "task_id": "x"})
    second = journal.append({"phase": "terminal", "task_id": "x"})
    state = journal.recover()
    assert state["record_count"] == 2
    assert state["head_sha256"] == second["record_sha256"]
    path = tmp_path / "journal" / "000001.json"
    damaged = json.loads(path.read_text())
    damaged["payload"]["task_id"] = "y"
    path.write_text(json.dumps(damaged))
    try:
        journal.recover()
    except RuntimeError as exc:
        assert "payload hash mismatch" in str(exc)
    else:
        raise AssertionError("tampered journal was accepted")


def test_blocker_subsumption_is_literal_sensitive() -> None:
    small = [{"bool": "a", "value": True}]
    large = [{"bool": "a", "value": True}, {"bool": "b", "value": False}]
    opposite = [{"bool": "a", "value": False}, {"bool": "b", "value": False}]
    assert v24.blocker_subsumes(small, large)
    assert not v24.blocker_subsumes(large, small)
    assert not v24.blocker_subsumes(small, opposite)


def test_admission_requires_two_unsat_replays_with_identical_identities() -> None:
    base = {
        "status": "unsat", "raw_formula_sha256": "r", "raw_blob_sha256": "b",
        "fix_count": 3, "fixes_sha256": "f", "derived_replay_assertion_count": 7,
        "derived_replay_formula_sha256": "d",
    }
    assert v24.replays_agree_and_unsat(base, dict(base))
    unknown = {**base, "status": "unknown"}
    assert not v24.replays_agree_and_unsat(base, unknown)
    drift = {**base, "derived_replay_formula_sha256": "other"}
    assert not v24.replays_agree_and_unsat(base, drift)


def test_validate_core_rejects_non_subset() -> None:
    assignment = [{"bool": "a", "value": True}, {"bool": "b", "value": False}]
    assert v24.validate_core([{"bool": "a", "value": True}], assignment)
    try:
        v24.validate_core([{"bool": "a", "value": False}], assignment)
    except RuntimeError as exc:
        assert "not a subset" in str(exc)
    else:
        raise AssertionError("non-subset core was accepted")
