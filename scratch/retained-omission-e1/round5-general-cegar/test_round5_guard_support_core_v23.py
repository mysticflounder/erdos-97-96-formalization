from __future__ import annotations

import round5_guard_support_core_v23 as v23
import z3


def test_named_core_maps_back_to_exact_guard_support(monkeypatch) -> None:
    ctx = z3.Context()
    a, b = z3.Bools("a b", ctx=ctx)
    x = z3.Real("x", ctx=ctx)
    assertions = (z3.And(z3.Implies(a, x > 0), z3.Implies(a, x < 0), z3.Or(b, z3.Not(b))),)
    monkeypatch.setattr(v23.v17, "TRACKER_ALLOWLIST", frozenset())
    assignment = ({"bool": "a", "value": True}, {"bool": "b", "value": False})
    records, constraints, provenance = v23.named_normalized_constraints(assertions, assignment)
    core = v23.extract_named_core(records, constraints, timeout_ms=5_000, seed=97)
    assert provenance["logic_audit"]["accepted"] is True
    assert core["status"] == "unsat"
    assert core["projected_support"] == ["a"]


def test_unknown_boolean_guard_fails_closed(monkeypatch) -> None:
    ctx = z3.Context()
    a, hidden = z3.Bools("a hidden", ctx=ctx)
    monkeypatch.setattr(v23.v17, "TRACKER_ALLOWLIST", frozenset())
    try:
        v23.named_normalized_constraints((z3.Or(a, hidden),), ({"bool": "a", "value": True},))
    except RuntimeError as exc:
        assert "unclassified Boolean guards" in str(exc)
    else:
        raise AssertionError("unclassified guard was accepted")


def test_core_timeout_cannot_admit_support() -> None:
    ctx = z3.Context()
    record = {"name": "v23_norm_atom_000000", "support": ["a"]}
    result = v23.extract_named_core(
        (record,), (z3.BoolVal(True, ctx=ctx),), timeout_ms=1, seed=97,
    )
    assert result["status"] == "sat"
    assert result["projected_support"] == []
