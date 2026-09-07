from __future__ import annotations

import hashlib

import audit_exact13_wave6_partial_replay as subject
import cardge13_exact13_witnessed_key_guarded_cegar_wave6_piqd as wave6
import pytest


def synthetic_key(orientation: str, blockers: tuple[int, int], rows: dict[str, set[int]]) -> dict[str, object]:
    orders = (2, 6, 7, 0, 3, 4, 5, 1, 8, 9, 10, 11, 12) if orientation == "mirror" else (2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7)
    oi = {raw: position for position, raw in enumerate(orders)}
    all_rows = {name: rows.get(name, set()) for name in wave6.root.ROWS}
    support_of = {name: sorted(oi[raw] for raw in support) for name, support in all_rows.items()}
    return {"orientation": orientation, "roles": {"b0": blockers[0], "b1": blockers[1]},
            "supportOf": support_of}


def test_third_guard_has_both_activation_guards() -> None:
    cnf, _projection = wave6.guarded_cnf()
    clauses = subject.third_apex_guard_clauses(cnf)
    assert len(clauses) == 550
    assert all(len(clause) == 9 for clause in clauses)
    clause = clauses[0]
    assert cnf.names["is_b0_3"] in clause and cnf.names["is_b1_3"] in clause
    assert cnf.names["is_b0_2"] in clause and cnf.names["is_b1_2"] in clause


def test_suppressed_g2_makes_guard_vacuous() -> None:
    rows = {f"G{center}": set() for center in range(2, 13)}
    rows["G2"] = {1, 3, 4, 6}
    rows["G3"] = {2, 3, 4}
    key = synthetic_key("mirror", (2, 5), rows)
    assert subject.third_apex_violations(key) == []


@pytest.mark.parametrize("orientation", ["direct", "mirror"])
def test_guard_decodes_positional_supports(orientation: str) -> None:
    rows = {f"G{center}": set() for center in range(2, 13)}
    rows["G2"] = {1, 3, 4, 6}
    rows["G3"] = {2, 3, 4}
    key = synthetic_key(orientation, (5, 6), rows)
    violations = subject.third_apex_violations(key)
    assert violations == [{"center": 3, "apex": 2, "target": "G2", "intersection": [3, 4]}]


def test_digest_corruption_is_rejected() -> None:
    class CorruptArtifact:
        def read_bytes(self) -> bytes:
            return b"corrupt"

    expected = hashlib.sha256(b"original").hexdigest()
    with pytest.raises(ValueError, match="digest drifted"):
        subject.verify_digest(CorruptArtifact(), expected, "test artifact")


def test_raw_solve_index_must_follow_wave6_producer_contract() -> None:
    assert subject.expected_raw_solve_index(56_000) == 1
    assert subject.expected_raw_solve_index(63_508) == 7_509
    with pytest.raises(ValueError, match="raw solve index drifted"):
        subject.verify_raw_solve_index(56_000, 56_000)


def test_input_output_overlap_is_rejected() -> None:
    source = subject.SOURCE_RUN
    output = source / "output"
    with pytest.raises(ValueError, match="overlaps"):
        subject._reject_overlap(source, output)
    with pytest.raises(ValueError, match="overlaps"):
        subject._reject_overlap(output, source)


def test_unknown_kind_and_count_are_rejected() -> None:
    with pytest.raises(ValueError, match="unknown cut kind"):
        subject.validate_new_cut_kind("unrecognized", 56_000)
    with pytest.raises(ValueError, match="kind counts drifted"):
        subject.validate_new_cut_counts(5_701, 1_808)


def test_retained_import_replay_contract() -> None:
    source = subject.SOURCE_RUN
    bank = source / "events/cut-bank.jsonl"
    immutable = source / "artifacts/immutable-imported-wave3-final-bank.jsonl"
    records = subject._bank_records(bank)
    report = subject._verify_import_replay(source, bank, immutable, records)
    assert report["event_sha256"] == subject.EXPECTED_IMPORT_REPLAY_EVENT_SHA256
