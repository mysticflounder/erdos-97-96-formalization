"""Focused Wave7 producer and provenance tests."""

from __future__ import annotations

import json
from pathlib import Path

import cardge13_exact13_third_apex_guarded_cegar_wave7_piqd as subject


def test_wave7_inputs_are_pinned() -> None:
    assert subject.BASE_HEAD == "427d96c66139235abc05ce12edbca3845c4d1b4e"
    assert subject.WAVE6_REPLAY_COMMIT == "31ffc3a38"
    assert subject.sha256(subject.SOURCE.read_bytes()) == subject.SOURCE_SHA256
    assert subject.sha256(subject.WAVE6_BANK.read_bytes()) == subject.WAVE6_BANK_SHA256
    assert subject.IMPORTED_CUT_COUNT == 63_509


def test_third_apex_has_exact_guarded_clause_inventory() -> None:
    base, _projection = subject.wave6.guarded_cnf()
    before = len(base.names)
    clauses = subject.third_apex_guard_clauses(base)
    assert len(clauses) == 550
    assert all(len(clause) == 9 for clause in clauses)
    for clause in clauses:
        assert clause[0] > 0 and clause[1] > 0
        assert base.names["is_b0_2"] in clause
        assert base.names["is_b1_2"] in clause
    assert len(base.names) == before


def test_successor_dimensions_add_only_550_clauses() -> None:
    base, _projection = subject.wave6.guarded_cnf()
    before = len(base.names)
    for clause in subject.third_apex_guard_clauses(base):
        base.add(*clause)
    assert len(base.names) == before == 432
    assert len(base.clauses) == 31_283 + 550


def test_partial_replay_receipt_is_sealed_and_complete() -> None:
    receipt = json.loads(subject.WAVE6_REPLAY_RECEIPT.read_text())
    subject.w1._verify_seal(receipt, str(subject.WAVE6_REPLAY_RECEIPT))
    assert receipt["copied_bank_count"] == 63_509
    assert receipt["copied_bank_sha256"] == subject.WAVE6_BANK_SHA256
    assert receipt["third_apex_guard_clause_count"] == 550
    assert receipt["formula_scoped_only"] is True


def test_cut_admission_carries_f1_f7_and_solver_is_piqd_only() -> None:
    text = Path(subject.__file__).read_text()
    assert "f1_f7_evidence" in text
    assert "/Users/adam/bin/piqc" in text or "wave6._isolated_run_piqc" in text
    assert "subprocess.run([\"cadical\"" not in text
