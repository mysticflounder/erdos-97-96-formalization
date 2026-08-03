from __future__ import annotations

import sys
from pathlib import Path

import pytest
import z3

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import round5_source_assertion_min_v27 as v27


def test_group_clauses_preserves_original_conjunct_order() -> None:
    tracker, x, y = z3.Bools("track_test x y")
    assertion = z3.Implies(tracker, z3.And(x, z3.Not(y)))
    clauses = v27.group_clauses(assertion, "track_test")
    assert [item.sexpr() for item in clauses] == ["x", "(not y)"]


def test_group_clauses_rejects_a_mismatched_tracker() -> None:
    tracker, x = z3.Bools("track_test x")
    with pytest.raises(RuntimeError, match="expected implication"):
        v27.group_clauses(z3.Implies(tracker, x), "track_other")


def test_group_minimization_fails_closed_on_replay_disagreement(monkeypatch) -> None:
    calls: list[tuple[str, ...]] = []

    def disagree(*_args, **kwargs):
        calls.append(tuple(kwargs.get("selected", ())))
        return {"status": "authentication_disagreement", "authenticated": False}

    monkeypatch.setattr(v27, "paired_group_replay", disagree)
    selected, trials, status = v27.minimize_groups(
        Path("unused.smt2.gz"), "raw-hash", (), timeout_ms=1, seed=1
    )
    assert status == "unknown_fail_closed"
    assert selected == list(v27.SOURCE_ORDER)
    assert len(trials) == len(calls) == 1


def test_clause_pair_fails_closed_on_formula_hash_disagreement(monkeypatch) -> None:
    returns = iter(
        [
            {"status": "unsat", "formula_sha256": "a", "clause_ids_sha256": "ids", "fixes_sha256": "fix"},
            {"status": "unsat", "formula_sha256": "b", "clause_ids_sha256": "ids", "fixes_sha256": "fix"},
        ]
    )
    monkeypatch.setattr(v27, "raw_clause_replay", lambda *_args, **_kwargs: next(returns))
    result = v27.paired_clause_replay(
        Path("unused.smt2.gz"), "raw-hash", (), (), (), timeout_ms=1, seed=1
    )
    assert result["status"] == "fail_closed"
    assert result["admitted"] is False
