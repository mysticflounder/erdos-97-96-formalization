# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import os
from pathlib import Path

import pytest

from census.card_head import (
    exactfive_profile0034_direct_blocker_radius_guard_piqd as subject,
)


@pytest.fixture(scope="module")
def custody() -> dict[str, object]:
    return subject.authenticate_parent_run()


def _fake_engine(prepared: subject.PreparedQuery, raw: str) -> dict[str, object]:
    label, profile_sha256 = subject._session_identity(prepared)
    engine: dict[str, object] = {
        "solver": prepared.solver,
        "session_id": f"fake-{prepared.key}",
        "solver_signature": f"{prepared.solver}-test",
        "solver_sha256": "a" * 64,
        "raw_status": raw,
        "effective_status": "INCONCLUSIVE_UNKNOWN",
        "solve_index": 1,
        "result_sha256": "1" * 64,
        "response_lost": False,
        "reconciled_from_receipt": False,
        "reconciliation_attempts": 0,
        "result_digest_advisory": {},
        "semantic_replay": None,
        "artifacts": {},
        "request_id": subject._request_id(prepared.key),
        "request_sha256": subject.adapter.piqd_solve_request_digest(prepared.query, ()),
        "assumption_labels": [],
        "claims": dict(subject.adapter.FALSE_CLAIMS),
        "unsat_assumptions": None,
        "request_replay_attempted": False,
        "request_replayed": False,
        "resumed_from_receipt": False,
        "session_lifecycle": {
            "schema": "piqd-smt-session-lifecycle/v1",
            "request_id": subject._request_id(prepared.key),
            "session_id": f"fake-{prepared.key}",
            "session_label": label,
            "solver_profile_sha256": profile_sha256,
            "resumed_existing_session": False,
            "resumed_from_receipt": False,
            "resume_journal_state": "not_resumed",
            "resume_policy": None,
            "close_observed_state": "closed",
        },
    }
    if raw == "UNSAT":
        engine["effective_status"] = "UNSAT_DISCOVERY_ONLY"
        engine["unsat_assumptions"] = {
            "basis": "get-unsat-assumptions",
            "daemon_field": "core",
            "named_core_support": False,
            "terminal_unsat": True,
            "assumption_terms": [],
            "source_atom_ids": [],
            "ordered_assumption_labels": [],
            "core_labels": [],
        }
    elif raw == "SAT":
        engine["effective_status"] = "SAT_SEMANTICALLY_REPLAYED"
        engine["semantic_replay"] = {"accepted": True}
    return engine


def _install_fake_adapter(
    monkeypatch: pytest.MonkeyPatch,
    prepared: dict[str, subject.PreparedQuery],
    calls: list[str],
) -> None:
    def run(query: object, **kwargs: object) -> dict[str, object]:
        item = prepared[query.descriptor["query_id"]]
        calls.append(item.key)
        assert kwargs["solver"] == item.solver
        assert kwargs["assumption_labels"] == ()
        assert kwargs["request_id"] == subject._request_id(item.key)
        if item.kind == "control":
            return _fake_engine(item, "SAT" if item.key.endswith("positive") else "UNSAT")
        return _fake_engine(item, "UNKNOWN")

    monkeypatch.setattr(subject.adapter, "run_authenticated_single_solver_query", run)


def _exact_values(prepared: subject.PreparedQuery, overrides: dict[str, str]) -> str:
    return "(" + " ".join(
        f"({term} {overrides.get(term, '0')})" for term in prepared.query.get_values
    ) + ")"


def test_parent_and_lean_guard_are_cryptographically_bound(
    custody: dict[str, object],
) -> None:
    assert custody["manifest_sha256"] == subject.PARENT_PINS["manifest"]
    assert custody["launch_sha256"] == subject.PARENT_PINS["launch"]
    assert custody["terminal_sha256"] == subject.PARENT_PINS["terminal"]
    assert custody["execution_head"] == subject.PARENT_PINS["execution_head"]
    assert custody["lean_source_sha256"] == subject.LEAN_SOURCE_SHA256
    assert custody["lean_declaration"] == subject.THEOREM_NAME
    assert custody["claims"] == subject.FALSE_CLAIMS
    assert custody["parent_custody_sha256"] == subject._self_hash(
        custody, "parent_custody_sha256"
    )
    for branch in subject.BRANCH_IDS:
        assert custody["anchors"][branch]["journal_sha256"] == subject.ANCHOR_PINS[
            branch
        ]["journal"]


def test_rehashed_parent_custody_mutation_is_rejected(
    custody: dict[str, object],
) -> None:
    forged = copy.deepcopy(custody)
    forged["anchor_systems"]["lt"]["forged_metadata"] = True
    forged["parent_custody_sha256"] = subject._self_hash(
        forged, "parent_custody_sha256"
    )
    for branch in subject.BRANCH_IDS:
        with pytest.raises(subject.DirectBlockerRadiusGuardError):
            subject.prepare_query(f"z3-target-{branch}", custody=forged)


def test_frozen_eight_cell_plan_and_fresh_controls() -> None:
    assert subject.QUERY_PLAN == (
        ("z3-target-lt", "z3", "target", "lt"),
        ("z3-target-gt", "z3", "target", "gt"),
        ("cvc5-target-lt", "cvc5", "target", "lt"),
        ("cvc5-target-gt", "cvc5", "target", "gt"),
        ("z3-control-positive", "z3", "control", "positive"),
        ("z3-control-negative", "z3", "control", "negative"),
        ("cvc5-control-positive", "cvc5", "control", "positive"),
        ("cvc5-control-negative", "cvc5", "control", "negative"),
    )
    assert set(subject.CONTROL_KEYS) == {
        f"{solver}-control-{polarity}"
        for solver in subject.SOLVERS
        for polarity in ("positive", "negative")
    }


@pytest.mark.parametrize("solver", subject.SOLVERS)
@pytest.mark.parametrize("branch", subject.BRANCH_IDS)
def test_exact_full_formula_plus_one_guard(
    custody: dict[str, object], solver: str, branch: str
) -> None:
    prepared = subject.prepare_query(f"{solver}-target-{branch}", custody=custody)
    commands = prepared.query.journal_commands
    parent_commands = subject.parent.build_smt_commands(prepared.system["parent_system"])
    assert commands[:-1] == parent_commands
    assert commands[-1] == subject.GUARD_ASSERTION
    assert subject.GUARD_ASSERTION not in parent_commands
    assert commands.count(subject.GUARD_ASSERTION) == 1
    assert len(commands) == 178
    assert sum(row.startswith("(assert ") for row in commands) == 157
    assert len(prepared.query.journal_smt2) == 16_214
    assert subject._sha(prepared.query.journal_smt2) == subject.ANCHOR_PINS[branch][
        "guarded_journal"
    ]
    assert prepared.system["guard"]["role_class"] == {
        "c2": "c002",
        "O": "c001",
        "U": "c000",
    }
    assert prepared.system["guard"]["lean_declaration"] == subject.THEOREM_NAME
    assert prepared.system["guard"]["lean_ingress_binding"] is None
    assert prepared.query.descriptor["solver_profile"] == {
        "schema": subject.SOLVER_PROFILE_SCHEMA,
        "solvers": [solver],
        "timeout_ms": 300_000,
    }
    text = prepared.query.journal_smt2.decode("ascii")
    assert "(=>" not in text
    assert " Bool" not in text
    assert "(check-sat" not in text


@pytest.mark.parametrize("solver", subject.SOLVERS)
def test_fresh_controls_replay_exact_rationals(
    custody: dict[str, object], solver: str
) -> None:
    positive = subject.prepare_query(f"{solver}-control-positive", custody=custody)
    negative = subject.prepare_query(f"{solver}-control-negative", custody=custody)
    assert len(positive.query.journal_commands) == 3
    assert len(negative.query.journal_commands) == 4
    accepted = subject.verify_sat_model(positive.query, solver, "model", "((witness 1))")
    assert accepted.accepted is True
    rejected = subject.verify_sat_model(
        positive.query,
        solver,
        "model",
        "((witness (root-obj (+ (^ x 2) (- 2)) 1)))",
    )
    assert rejected.accepted is False
    assert rejected.evidence["reason"] == "exact_readback_unsupported"


def test_target_replay_checks_guard_and_rejects_relaxed_models(
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-target-lt", custody=custody)
    guard_false = subject.verify_sat_model(
        prepared.query,
        "z3",
        "model",
        _exact_values(prepared, {}),
    )
    assert guard_false.accepted is False
    assert guard_false.evidence["guard_accepted"] is False
    guard_true = subject.verify_sat_model(
        prepared.query,
        "z3",
        "model",
        _exact_values(prepared, {"x_c002": "2"}),
    )
    assert guard_true.accepted is False
    assert guard_true.evidence["guard_accepted"] is True
    assert guard_true.evidence["lean_declaration"] == subject.THEOREM_NAME


@pytest.mark.parametrize("timeout_ms", [0, 1, 299_999, 300_001, True])
def test_prepare_rejects_timeout_drift(
    custody: dict[str, object], timeout_ms: int
) -> None:
    with pytest.raises(subject.DirectBlockerRadiusGuardError):
        subject.prepare_query(
            "z3-target-lt", custody=custody, timeout_ms=timeout_ms
        )


@pytest.mark.parametrize("workers", [0, 21, -1, True])
def test_campaign_rejects_worker_drift(workers: int) -> None:
    with pytest.raises(subject.DirectBlockerRadiusGuardError):
        subject.run_campaign(workers=workers)


def test_solver_identity_and_discovery_only_unsat_scope(
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query("cvc5-target-gt", custody=custody)
    assert subject.classify_engine(prepared, _fake_engine(prepared, "UNKNOWN")) == "UNKNOWN"
    assert (
        subject.classify_engine(prepared, _fake_engine(prepared, "UNSAT"))
        == "UNSAT_CUSTODY_VALID"
    )
    mutated = _fake_engine(prepared, "UNKNOWN")
    mutated["request_id"] = "wrong"
    with pytest.raises(subject.DirectBlockerRadiusGuardError):
        subject.classify_engine(prepared, mutated)


def test_source_snapshots_bind_parent_formulas_and_lean_source(
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-target-gt", custody=custody)
    sources = prepared.query.descriptor["sources"]
    paths = {row["path"] for row in sources}
    assert any("ExactFiveDistinctProfile0034SourceAdapter.lean" in path for path in paths)
    assert any("z3-direct-gt-r000-anchor--journal.smt2" in path for path in paths)
    assert any("z3-direct-lt-r000-anchor--journal.smt2" in path for path in paths)
    assert len(paths) == len(sources)


def test_eight_fresh_cells_and_offline_verification_use_no_transport(
    custody: dict[str, object],
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    root = tmp_path / "run"
    artifacts = root / "artifacts"
    events = root / "events"
    tmp = root / "tmp"
    artifacts.mkdir(parents=True)
    events.mkdir()
    tmp.mkdir()
    manifest = {
        "created_utc": "2026-09-05T00:00:00Z",
        "manifest_sha256": "b" * 64,
    }
    (root / "run_manifest.json").write_bytes(subject._json(manifest))
    launch = subject._launch_record(manifest, "c" * 40, "http://127.0.0.1:7272", 4)
    (events / "launch.json").write_bytes(subject._json(launch))
    prepared = {
        key: subject.prepare_query(key, custody=custody) for key in subject.QUERY_KEYS
    }
    calls: list[str] = []
    _install_fake_adapter(monkeypatch, prepared, calls)
    results = {
        key: subject.run_cell(prepared[key], artifacts / key, object())
        for key in subject.QUERY_KEYS
    }
    terminal = subject._terminal_record(manifest, launch, custody, results)
    (events / "terminal.json").write_bytes(subject._json(terminal))
    assert calls == list(subject.QUERY_KEYS)

    def no_transport(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("offline verification must not contact PIQD")

    monkeypatch.setattr(subject.adapter, "run_authenticated_single_solver_query", no_transport)
    monkeypatch.setattr(subject, "RUN_ROOT", root)
    monkeypatch.setattr(subject, "_expected_manifest", lambda _created_utc: manifest)
    monkeypatch.setattr(
        subject,
        "_authenticate_source_commit",
        lambda _manifest, commit: commit,
    )
    verified = subject.verify_terminal_run(root, manifest, launch, custody)
    assert verified["status"] == "TARGET_INCONCLUSIVE"
    assert verified["fresh_controls"] == {"z3": True, "cvc5": True}
    assert verified["claims"] == subject.FALSE_CLAIMS
    forged_manifest = dict(manifest)
    forged_manifest["created_utc"] = "2026-09-05T00:00:01Z"
    with pytest.raises(subject.DirectBlockerRadiusGuardError):
        subject.verify_terminal_run(root, forged_manifest, launch, custody)


def test_check_parent_does_not_initialize_run_root(
    custody: dict[str, object], monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(subject, "authenticate_parent_run", lambda: custody)

    def no_initialize() -> object:
        raise AssertionError("check-parent must not initialize the run root")

    monkeypatch.setattr(subject, "ensure_run_root", no_initialize)
    assert subject.run_campaign(check_parent=True)["status"] == "PARENT_AUTHENTICATED"


def test_cell_inventory_rejects_symlink(
    custody: dict[str, object],
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
) -> None:
    prepared = subject.prepare_query("z3-target-lt", custody=custody)
    calls: list[str] = []
    _install_fake_adapter(monkeypatch, {prepared.key: prepared}, calls)
    output = tmp_path / "cell"
    subject.run_cell(prepared, output, object())
    os.symlink(output / "journal.smt2", output / "unbound-link")
    with pytest.raises(subject.DirectBlockerRadiusGuardError):
        subject.verify_cell_tree(prepared, output)


def test_coordinated_lifecycle_mutation_still_fails_closed(
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-target-gt", custody=custody)
    engine = _fake_engine(prepared, "UNKNOWN")
    engine["request_id"] = "coordinated"
    lifecycle = dict(engine["session_lifecycle"])
    lifecycle["request_id"] = "coordinated"
    engine["session_lifecycle"] = lifecycle
    with pytest.raises(subject.DirectBlockerRadiusGuardError):
        subject.classify_engine(prepared, engine)
