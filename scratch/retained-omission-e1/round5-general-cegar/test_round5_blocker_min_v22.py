from __future__ import annotations

from pathlib import Path

import round5_blocker_min_v22 as v22
import round5_cegar_v16 as v16
import z3


def test_partial_preprocessor_preserves_simple_unsat() -> None:
    x, y = z3.Bools("v22_test_x v22_test_y")
    assertions = (z3.Bool("track_test"), z3.Or(x, y), z3.Not(x), z3.Not(y))
    old = v22.v17.TRACKER_ALLOWLIST
    try:
        v22.v17.TRACKER_ALLOWLIST = frozenset({"track_test"})
        normalized, record = v22.preprocess_partial_assignment(assertions, ())
    finally:
        v22.v17.TRACKER_ALLOWLIST = old
    solver = z3.Solver()
    solver.add(*normalized)
    assert solver.check() == z3.unsat
    assert record["tracker_count"] == 1


def test_fix_records_and_hash_are_deterministic() -> None:
    fixes = (v16.Fix(z3.Bool("a"), True), v16.Fix(z3.Bool("b"), False))
    records = v22.fix_records(fixes)
    assert records == [{"bool": "a", "value": True}, {"bool": "b", "value": False}]
    assert v22.canonical_sha256(records) == v22.canonical_sha256(list(records))


def test_raw_identity_failure_fails_closed(monkeypatch) -> None:
    def reject(*_args, **_kwargs):
        raise RuntimeError("raw identity mismatch")

    monkeypatch.setattr(v22, "_parse_authenticated_raw", reject)
    replay = v22.replay_projection(
        Path("unused.gz"), "bad-hash", (), timeout_ms=1, seed=97,
        replay_label="test",
    )
    assert replay["status"] == "preprocess_error"
    assert "raw identity mismatch" in replay["error"]
