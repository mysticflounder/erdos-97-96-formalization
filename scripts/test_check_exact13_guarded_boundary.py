"""Regression tests for the guarded predicate, independent of source entitlement."""

from __future__ import annotations

import itertools
import json
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parent))

import cardge13_exact13_witnessed_key_root_piqd as root
import check_exact13_guarded_boundary as subject


def partial_key(*, apex: bool = True, inactive: bool = False, mirror: bool = False):
    """Isolate the predicate; this fixture does not claim full Key.Valid."""
    order = root.MIRROR_ORDER if mirror else root.DIRECT_ORDER
    position = {raw: index for index, raw in enumerate(order)}
    rows = {row: [] for row in root.ROWS}
    rows["G3"] = [0 if apex else 2, 10, 11, 12]
    rows["L"] = [3, 8, 11, 12]
    return {
        "orientation": "mirror" if mirror else "direct",
        "roles": {"b0": 3 if inactive else 10, "b1": 12},
        "supportOf": {
            row: sorted(position[raw] for raw in values)
            for row, values in rows.items()
        },
    }


def test_full_and_nontrivial_clause_counts_and_no_new_variables():
    cnf, _ = root.emit_root()
    before = dict(cnf.names)
    full = subject.guarded_clauses(cnf)
    reduced = subject.guarded_clauses(cnf, nontrivial=True)
    assert len(full) == 2574
    assert len(reduced) == 1815
    assert set(reduced) <= set(full)
    assert all(len(clause) == 7 for clause in full)
    assert cnf.names == before


def test_blocker_labels_remain_allowed_in_intersection():
    cnf, _ = root.emit_root()
    expected = tuple(cnf.names[name] * sign for name, sign in (
        ("is_b0_3", 1), ("is_b1_3", 1), ("m_G3_0", -1),
        ("m_G3_11", -1), ("m_G3_12", -1),
        ("m_L_11", -1), ("m_L_12", -1),
    ))
    assert expected in subject.guarded_clauses(cnf, nontrivial=True)
    assert len(subject.guarded_violations(partial_key())) == 1


def test_missing_apex_does_not_trigger_unguarded_bound():
    assert subject.guarded_violations(partial_key(apex=False)) == []


def test_inactive_global_center_disables_bound():
    assert subject.guarded_violations(partial_key(inactive=True)) == []


def test_raw_label_predicate_respects_both_orientations():
    assert subject.guarded_violations(partial_key()) == subject.guarded_violations(
        partial_key(mirror=True)
    )


def test_seven_literal_guard_truth_table():
    cnf, _ = root.emit_root()
    names = (
        "is_b0_3", "is_b1_3", "m_G3_0", "m_G3_11", "m_G3_12",
        "m_L_11", "m_L_12",
    )
    ids = [cnf.names[name] for name in names]
    clause = tuple(ids[:2] + [-item for item in ids[2:]])
    assert clause in subject.guarded_clauses(cnf)
    for bits in itertools.product((False, True), repeat=7):
        positive = {var for var, bit in zip(ids, bits, strict=True) if bit}
        satisfied = any((abs(lit) in positive) == (lit > 0) for lit in clause)
        violation = not bits[0] and not bits[1] and all(bits[2:])
        assert satisfied is not violation


def test_retained_valid_key_is_a_counterexample_to_root_entailment():
    repo = Path(__file__).resolve().parents[1]
    path = repo / (
        "scratch/runs/exact13-witnessed-key-cegar-wave2-20260906/"
        "run-0001/events/models/imported-0003.json"
    )
    event = json.loads(path.read_text())
    key = event["projected_key"]
    assert all(root.replay_key(key).values())
    assert len(subject.guarded_violations(key)) > 0
    assert root.raw_support(key, "G3") == {0, 10, 11, 12}
    assert root.raw_support(key, "L") == {3, 8, 11, 12}


def test_terminal_retained_model_has_expected_exact_zero_form():
    repo = Path(__file__).resolve().parents[1]
    path = repo / (
        "scratch/runs/exact13-witnessed-key-cegar-wave2-20260906/"
        "run-0001/events/models/model-6000.json"
    )
    key = json.loads(path.read_text())["projected_key"]
    assert subject.guarded_violations(key)
    assert subject.zero_form_index(key) == 225


@pytest.mark.parametrize("literals", [
    [1], [1, 1], [1, -1], [1, 3], [1, 0], [1, True], [1, 2.0], "1 -2",
])
def test_assignment_authentication_rejects_malformed_literals(literals):
    with pytest.raises(subject.AuditError):
        subject._assignment(literals, 2)


def test_assignment_authentication_accepts_complete_signed_assignment():
    assert subject._assignment([1, -2], 2) == {1}


def test_duplicate_json_keys_rejected():
    with pytest.raises(subject.AuditError, match="duplicate JSON key"):
        json.loads('{"model":1,"model":2}', object_pairs_hook=subject._pairs)


def test_retained_path_cannot_escape_root():
    with pytest.raises(subject.AuditError, match="escapes run root"):
        subject._inside(Path("scripts/elsewhere.json"), subject.RUN_ROOT)


def test_report_replay_rejects_forged_counts_even_when_resealed():
    expected = {"model_count": 6001, "zero_form_witnesses": [{"form_index": 225}]}
    subject.verify_report(subject.seal(expected), expected)
    altered = {**expected, "model_count": 6000}
    with pytest.raises(subject.AuditError, match="differs from independent replay"):
        subject.verify_report(subject.seal(altered), expected)


def test_report_replay_rejects_changed_witness_even_when_resealed():
    expected = {"model_count": 6001, "zero_form_witnesses": [{"form_index": 225}]}
    altered = {**expected, "zero_form_witnesses": [{"form_index": 226}]}
    with pytest.raises(subject.AuditError, match="differs from independent replay"):
        subject.verify_report(subject.seal(altered), expected)


def test_report_seal_is_required():
    with pytest.raises(subject.AuditError, match="self-hash"):
        subject.verify_report({"model_count": 6001}, {"model_count": 6001})
