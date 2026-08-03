from __future__ import annotations

import sys
from collections.abc import Sequence

import pytest
import z3

import round5_cegar_v16 as v16
import round5_cegar_v19 as v19
import round5_cegar_v21 as v21

Fix = v16.Fix


def fixes(*items: tuple[z3.BoolRef, bool]) -> tuple[Fix, ...]:
    return tuple(Fix(variable, value) for variable, value in items)


def authenticated_full_check(
    full: Sequence[Fix], raw_formula_sha256: str = "raw-formula"
) -> dict[str, object]:
    assignment_sha256 = v19.canonical_sha256(v21._fix_record(full))
    return {
        "status": "unsat",
        "generalized": False,
        "blocker_scope": "complete_semantic_assignment",
        "assignment_sha256": assignment_sha256,
        "frozen_full_formula_sha256": raw_formula_sha256,
        "expected_complete_blocker_sha256": v21._complete_blocker_sha256(full),
        "primary": {"status": "unsat"},
        "fresh_normalized_full_replay": {
            "status": "unsat",
            "replay_status": "unsat",
            "assignment_sha256": assignment_sha256,
            "raw_formula_sha256": raw_formula_sha256,
            "complete_assignment_size": len(full),
        },
    }


def project(
    master_assertions: Sequence[z3.BoolRef],
    full: Sequence[Fix],
    cube: Sequence[Fix],
    retained_names: Sequence[str],
    *,
    full_check: dict[str, object] | None = None,
    expected_master: str = "master",
    authenticated_master: str = "master",
    expected_blockers: str = "blockers",
    authenticated_blockers: str = "blockers",
) -> tuple[tuple[Fix, ...], dict[str, object]]:
    return v21.project_or_fallback(
        master_assertions=master_assertions,
        full_fixes=full,
        cube_fixes=cube,
        retained_names=retained_names,
        full_check=full_check or authenticated_full_check(full),
        raw_formula_sha256="raw-formula",
        expected_master_formula_sha256=expected_master,
        authenticated_master_formula_sha256=authenticated_master,
        expected_cumulative_blocker_sha256=expected_blockers,
        authenticated_cumulative_blocker_sha256=authenticated_blockers,
        timeout_ms=1_000,
    )


def test_cube_entailment_projects_only_cube_union_retained_literals() -> None:
    a, b, c = z3.Bools("a b c")
    full = fixes((a, True), (b, True), (c, False))
    core, record = project([z3.Implies(a, b)], full, fixes((a, True)), ["c"])

    assert record["status"] == "projected"
    assert [(str(fix.variable), fix.value) for fix in core] == [
        ("a", True),
        ("c", False),
    ]
    assert len(core) < len(full)

    blocker = v16.blocker_for_core(core)
    assigned = z3.Solver()
    assigned.add(a, b, z3.Not(c), blocker)
    assert assigned.check() == z3.unsat
    outside_cube = z3.Solver()
    outside_cube.add(z3.Not(a), z3.Not(blocker))
    assert outside_cube.check() == z3.unsat


def test_sat_entailment_falls_back_to_complete_blocker_with_countermodel() -> None:
    a, b, c = z3.Bools("a b c")
    full = fixes((a, True), (b, True), (c, False))
    core, record = project([z3.BoolVal(True)], full, fixes((a, True)), ["c"])

    assert core == tuple(sorted(full, key=lambda fix: str(fix.variable)))
    assert record["status"] == "fallback_complete"
    assert record["reason"] == "master_entailment_sat"
    assert record["primary"]["countermodel_violated_invariant_count"] >= 1


def test_unknown_or_dual_replay_disagreement_falls_back(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    a, b, c = z3.Bools("a b c")
    full = fixes((a, True), (b, True), (c, False))
    calls = 0

    def replay(*args, **kwargs) -> dict[str, object]:
        nonlocal calls
        calls += 1
        return {"outcome": "unsat" if calls == 1 else "unknown"}

    monkeypatch.setattr(v21, "_entailment_replay", replay)
    core, record = project([z3.Implies(a, b)], full, fixes((a, True)), ["c"])

    assert len(core) == len(full)
    assert record["reason"] == "fresh_master_entailment_unknown"
    assert calls == 2


@pytest.mark.parametrize(
    ("kwargs", "reason"),
    [
        (
            {"expected_master": "expected", "authenticated_master": "other"},
            "master_formula_hash_mismatch",
        ),
        (
            {"expected_blockers": "expected", "authenticated_blockers": "other"},
            "cumulative_blocker_hash_mismatch",
        ),
    ],
)
def test_identity_mismatch_falls_back_before_solver(
    monkeypatch: pytest.MonkeyPatch,
    kwargs: dict[str, str],
    reason: str,
) -> None:
    a, b, c = z3.Bools("a b c")
    full = fixes((a, True), (b, True), (c, False))

    def forbidden(*args, **kwargs):
        raise AssertionError("identity mismatch must not reach Z3")

    monkeypatch.setattr(v21, "_entailment_replay", forbidden)
    core, record = project(
        [z3.Implies(a, b)], full, fixes((a, True)), ["c"], **kwargs
    )
    assert len(core) == len(full)
    assert record["reason"] == reason


def test_tampered_full_check_and_cube_conflict_fail_closed() -> None:
    a, b, c = z3.Bools("a b c")
    full = fixes((a, True), (b, True), (c, False))
    tampered = authenticated_full_check(full)
    tampered["fresh_normalized_full_replay"] = {
        **tampered["fresh_normalized_full_replay"],
        "assignment_sha256": "tampered",
    }
    _, replay_record = project(
        [z3.Implies(a, b)],
        full,
        fixes((a, True)),
        ["c"],
        full_check=tampered,
    )
    assert replay_record["reason"] == "full_check_fresh_assignment_hash_mismatch"

    _, cube_record = project(
        [z3.Implies(a, b)], full, fixes((a, False)), ["c"]
    )
    assert cube_record["reason"] == "cube_not_satisfied_by_assignment"


def test_cli_refuses_to_run_without_explicit_saved_pilot(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(sys, "argv", ["round5_cegar_v21.py"])
    with pytest.raises(SystemExit, match="offline-only"):
        v21.main()
