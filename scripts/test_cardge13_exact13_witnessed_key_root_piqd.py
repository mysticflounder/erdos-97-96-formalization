from __future__ import annotations

import json
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parent))
import cardge13_exact13_witnessed_key_root_piqd as subject


def assignment_for_synthetic_key(cnf: subject.Cnf) -> set[int]:
    rows = {
        "C0": {11, 12, 6, 7},
        "C1": {0, 2, 1, 5},
        "K": {3, 4, 9, 10},
        "L": {2, 8, 11, 12},
        "T": {8, 5, 6, 7},
    }
    for center in subject.GLOBAL_CENTERS:
        rows[f"G{center}"] = set() if center in {2, 11} else {
            point for point in subject.LABELS if point != center
        }
        rows[f"G{center}"] = set(sorted(rows[f"G{center}"])[:4])
    roles = {"b0": 2, "b1": 11, "z": 8, "s0": 11, "s1": 0,
             "d": 8, "ell": 2, "a": 11, "b": 12}
    true_names = {f"m_{row}_{point}" for row, points in rows.items() for point in points}
    true_names |= {f"is_{name}_{point}" for name, point in roles.items()}
    true_names.add("other_c0")
    true_names |= {"e_1", "e_5", "c_0", "c_1", "c_2", "c_5",
                   "pair_11", "pair_12", "chosen_6", "chosen_7",
                   "chosen_11", "chosen_12", "u_1", "u_5", "u_6", "u_7",
                   "u_not_e_6", "u_not_e_7", "inter_C0_L_11", "inter_C0_L_12",
                   "inter_C1_L_2"}
    return {variable for name, variable in cnf.names.items() if name in true_names}


def test_synthetic_model_replays_all_key_fields() -> None:
    cnf, projection = subject.emit_root()
    assignment = assignment_for_synthetic_key(cnf)
    assert cnf.satisfied(assignment)
    key = subject.key_from_assignment(assignment, projection)
    checks = subject.replay_assignment(assignment, key, projection)
    assert checks == {
        "CenterValid": True,
        "RowValid": True,
        "CoarseValid": True,
        "RoleValid": True,
        "OccurrenceValid": True,
        "OrderValid": True,
        "Valid": True,
    }


def test_root_is_boolean_and_has_no_metric_or_conflict_symbols() -> None:
    cnf, projection = subject.emit_root()
    assert len(cnf.names) == 432
    assert len(cnf.clauses) == 29464
    assert not any(name.startswith("d_") or "kalmanson" in name for name in cnf.names)
    assert projection["orientation"] == cnf.names["orientation_mirror"]


def test_projection_block_uses_key_fields_only() -> None:
    cnf, projection = subject.emit_root()
    assignment = assignment_for_synthetic_key(cnf)
    block = subject.projected_key_block(assignment, projection)
    assert len(block) == 16 * 13 + 1 + 5 + 1
    assert all(abs(literal) not in {
        variable for name, variable in cnf.names.items()
        if name.startswith(("u_", "e_", "pair_", "c_", "chosen_"))
    } for literal in block)


def test_piqd_session_normalization_identity_is_pinned() -> None:
    cnf, _projection = subject.emit_root()
    emitted = cnf.dimacs((subject.SCHEMA, f"producer={subject.PRODUCER}",
                          "producer_commit=d405f50b4575bd9b3a3e5e7d817b7ac81851d973"))
    journal, metadata = subject.normalize_for_piqd_session(emitted)
    assert journal == b"".join(emitted.splitlines(keepends=True)[4:])
    assert metadata == {
        "schema": subject.PIQD_NORMALIZATION_SCHEMA,
        "operation": "remove exactly three leading comment lines and one p-cnf header line",
        "removed_prefix_lines": 4,
        "removed_prefix_bytes": 176,
        "emitted_cnf_bytes": 894075,
        "emitted_cnf_sha256": "18ff5514bed6bdc05791a4782328a2c81d456e1d54c828fe024cc3479f069a4c",
        "piqd_normalized_journal_bytes": 893899,
        "piqd_normalized_journal_sha256": "35d66a8cab1be7230654fc25905b8b5967106fbb5f1a6843d8739d7972d75d8d",
        "clause_body_preserved_byte_for_byte": True,
    }


def test_custody_verifier_rebinds_retained_receipt_without_solver(tmp_path: Path) -> None:
    source = Path(
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "CardGeThirteenExact13SourceIndexedFiniteKey.lean"
    )
    report = subject.write_root(tmp_path, source, "d405f50b4575bd9b3a3e5e7d817b7ac81851d973")
    journal, _metadata = subject.normalize_for_piqd_session(report["cnf_bytes"])
    journal_path = tmp_path / "source-journal.cnf"
    journal_path.write_bytes(journal)
    result_sha256 = "4" * 64
    session_id = "test-session"
    receipts_path = tmp_path / "receipts.json"
    receipts_path.write_text(json.dumps({
        "count": 1,
        "session_id": session_id,
        "receipts": [{"base_bytes": len(journal), "base_clauses": 29464,
                      "base_sha256": subject.sha256(journal), "model_recorded": True,
                      "status": "SAT", "solve_index": 1, "result_sha256": result_sha256}],
    }))
    model_path = tmp_path / "model.json"
    model_path.write_text(json.dumps({"model": [], "session_id": session_id,
                                      "result_sha256": result_sha256}))
    run_event_path = tmp_path / "events" / "piqd-run.json"
    run_event_path.write_text(json.dumps({
        "schema": "test-run/v1", "piqd_session_id": session_id,
        "result_sha256": result_sha256, "cnf_bytes": len(journal),
        "cnf_sha256": report["emitted_cnf_sha256"],
    }))
    custody = subject.verify_piqd_custody(
        tmp_path, report, journal_path, receipts_path, model_path
    )
    assert custody["normalization_relation_verified"] is True
    assert custody["rebound_without_solver_rerun"] is True
    assert custody["piqd_normalized_journal_sha256"] == subject.sha256(journal)
    assert (tmp_path / "artifacts" / "piqd-normalized-journal.cnf").read_bytes() == journal
    unsigned = {key: value for key, value in custody.items() if key != "event_sha256"}
    assert custody["event_sha256"] == subject.sha256(subject.canonical(unsigned))
    repaired_run = json.loads(run_event_path.read_text())
    assert "cnf_bytes" not in repaired_run and "cnf_sha256" not in repaired_run
    assert repaired_run["emitted_cnf_sha256"] == report["emitted_cnf_sha256"]
    assert repaired_run["piqd_normalized_journal_sha256"] == subject.sha256(journal)
    assert repaired_run["model_replay_sha256"] is None
    assert repaired_run["rebound_without_solver_rerun"] is True


def test_custody_verifier_rejects_nonmatching_journal(tmp_path: Path) -> None:
    source = Path(
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "CardGeThirteenExact13SourceIndexedFiniteKey.lean"
    )
    report = subject.write_root(tmp_path, source, "d405f50b4575bd9b3a3e5e7d817b7ac81851d973")
    journal_path = tmp_path / "source-journal.cnf"
    journal_path.write_bytes(b"1 0\n")
    receipts_path = tmp_path / "receipts.json"
    receipts_path.write_text("{}")
    with pytest.raises(ValueError, match="deterministic normalization"):
        subject.verify_piqd_custody(tmp_path, report, journal_path, receipts_path, None)
