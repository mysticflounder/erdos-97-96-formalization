"""Regression tests for the exact13 guarded witnessed-Key wave4 custody lane."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import cardge13_exact13_witnessed_key_guarded_cegar_wave4_piqd as subject


def test_wave4_root_identity_and_guarded_clause_shape() -> None:
    cnf, _projection = subject.guarded_cnf()
    assert len(cnf.names) == subject.EXPECTED_ROOT_VARIABLES == 432
    assert len(cnf.clauses) == subject.EXPECTED_ROOT_CLAUSES == 31_283
    clauses = subject.wave3.guarded_clauses(subject.root.emit_root()[0])
    assert len(clauses) == subject.EXPECTED_GUARDED_COUNT == 1_815
    assert len({tuple(clause) for clause in clauses}) == 1_815
    assert all(len(clause) == 7 for clause in clauses)
    assert all(sum(literal > 0 for literal in clause) == 2 for clause in clauses)
    assert all(len({abs(literal) for literal in clause}) == 7 for clause in clauses)


def test_wave3_immutable_inputs_are_pinned() -> None:
    root_path = subject.WAVE3_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"
    bank_path = subject.WAVE3_RUN / "events/cut-bank.jsonl"
    assert hashlib.sha256(root_path.read_bytes()).hexdigest() == subject.WAVE3_ROOT_SHA256
    assert hashlib.sha256(bank_path.read_bytes()).hexdigest() == subject.WAVE3_BANK_SHA256
    assert sum(1 for _line in bank_path.open()) == subject.IMPORTED_CUT_COUNT


def test_import_parent_partition_is_honest_if_run_exists() -> None:
    path = subject.RUN_ROOT / "events/wave3-import-replay.json"
    if not path.exists():
        return
    value = json.loads(path.read_text())
    assert value["first_6000_parent_partition"] == {
        "outside_StrongValid": subject.EXPECTED_WAVE2_OUTSIDE_STRONGVALID,
        "StrongValid": subject.EXPECTED_WAVE2_STRONGVALID,
    }
    assert value["last_10000_cut_parent_partition"] == {
        "StrongValid": subject.EXPECTED_WAVE3_STRONGVALID,
    }
    assert value["historical_parent_StrongValid_not_required_for_cut_soundness"] is True
    assert value["all_paths_resolved_under_immutable_wave3_root"] is True
    assert value["all_zero_projections_replayed"] is True
    assert value["all_atoms_and_clauses_reconstructed"] is True


def test_imported_and_live_bank_paths_and_hashes_are_distinct_if_run_exists() -> None:
    path = subject.RUN_ROOT / "events/wave3-import-replay.json"
    if not path.exists():
        return
    value = json.loads(path.read_text())
    imported = Path(value["immutable_imported_bank"]).resolve()
    final = Path(value["final_live_bank"]).resolve()
    assert imported != final
    assert hashlib.sha256(imported.read_bytes()).hexdigest() == value["immutable_imported_bank_sha256"]
    assert hashlib.sha256(final.read_bytes()).hexdigest() == value["final_live_bank_sha256"]
    assert value["immutable_imported_bank_sha256"] == subject.WAVE3_BANK_SHA256
    assert value["immutable_imported_bank_sha256"] != value["final_live_bank_sha256"]


def test_new_models_replay_strongvalid_if_run_exists() -> None:
    path = subject.RUN_ROOT / "events/new-model-strongvalid-replay.json"
    if not path.exists():
        return
    value = json.loads(path.read_text())
    assert value["new_model_count"] == value["guarded_root_replays"]
    assert value["new_model_count"] == value["key_valid_replays"]
    assert value["new_model_count"] == value["global_one_boundary_valid_replays"]
    assert value["new_model_count"] == value["strong_valid_replays"]
    assert value["all_new_models_pass"] is True
    assert value["historical_imported_parents_excluded"] is True


def test_root_and_cut_identity_if_run_exists() -> None:
    root_path = subject.RUN_ROOT / "artifacts/exact13-witnessed-key-effective-root.cnf"
    bank_path = subject.RUN_ROOT / "events/cut-bank.jsonl"
    if not root_path.exists() or not bank_path.exists():
        return
    first_lines = root_path.read_bytes().splitlines()
    header = next(line for line in first_lines if line.startswith(b"p cnf "))
    assert header == b"p cnf 432 31283"
    assert hashlib.sha256(root_path.read_bytes()).hexdigest() == subject.WAVE3_ROOT_SHA256
    rows = [json.loads(line) for line in bank_path.read_text().splitlines()]
    assert len(rows) >= subject.IMPORTED_CUT_COUNT
    assert [row["index"] for row in rows[:subject.IMPORTED_CUT_COUNT]] == list(range(subject.IMPORTED_CUT_COUNT))
    for row in rows[:subject.IMPORTED_CUT_COUNT]:
        cert = Path(row["certificate"])
        assert cert.is_relative_to(subject.RUN_ROOT)
        assert hashlib.sha256(cert.read_bytes()).hexdigest() == row["certificate_sha256"]


def test_reseal_strips_stale_event_seal() -> None:
    value = subject.reseal({"event_sha256": "stale", "answer": 7})
    unsigned = {key: item for key, item in value.items() if key != "event_sha256"}
    assert value["event_sha256"] == hashlib.sha256(
        json.dumps(unsigned, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def test_producer_declares_formula_only_boundary_and_no_witness_atoms() -> None:
    source = Path(subject.__file__).read_text()
    assert "formula-scoped discovery" in source
    assert subject.NO_EXACT_KEY_ENUMERATION_BLOCKS is True
    assert subject.NO_EXISTENTIAL_WITNESS_CUT_VARIABLES is True
    assert "historical_parent_StrongValid_not_required_for_cut_soundness" in source
