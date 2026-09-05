from __future__ import annotations

import copy
import json
import os
from fractions import Fraction
from pathlib import Path

import pytest

from census.card_head import (
    exactfive_profile0034_new_mirror_reduced_singleton_deletion_piqd as subject,
)


class NoTransport:
    def request_json(self, *_args: object, **_kwargs: object) -> object:
        raise AssertionError("transport must not be used")

    def request_bytes(self, *_args: object, **_kwargs: object) -> object:
        raise AssertionError("transport must not be used")


@pytest.fixture(scope="module")
def custody() -> dict[str, object]:
    return subject.authenticate_parent_run()


def _fake_engine(prepared: subject.PreparedQuery, raw: str) -> dict[str, object]:
    session_label, profile_sha256 = subject._session_identity(prepared)
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
        "request_sha256": subject.adapter.piqd_solve_request_digest(
            prepared.query, ()
        ),
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
            "session_label": session_label,
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
    calls: list[str],
) -> None:
    def run(query: object, **kwargs: object) -> dict[str, object]:
        key = query.descriptor["query_id"]
        prepared = _install_fake_adapter.prepared[key]
        calls.append(prepared.key)
        assert kwargs["solver"] == prepared.solver
        assert kwargs["assumption_labels"] == ()
        assert kwargs["request_id"] == subject._request_id(prepared.key)
        used = kwargs["used_session_ids"]
        session_id = f"fake-{prepared.key}"
        assert session_id not in used
        used.add(session_id)
        if prepared.key == "z3-control-positive":
            return _fake_engine(prepared, "SAT")
        if prepared.key == "z3-control-negative":
            return _fake_engine(prepared, "UNSAT")
        return _fake_engine(prepared, "UNKNOWN")

    def validate(
        prepared: subject.PreparedQuery,
        engine: dict[str, object],
        payloads: dict[str, bytes],
    ) -> str:
        assert payloads == {}
        return subject.classify_engine(prepared, engine)

    monkeypatch.setattr(subject.adapter, "run_authenticated_single_solver_query", run)
    monkeypatch.setattr(subject, "_validate_engine_artifacts", validate)


_install_fake_adapter.prepared = {}  # type: ignore[attr-defined]


def test_parent_authenticates_all_six_confirmation_cells(custody: dict[str, object]) -> None:
    assert custody["manifest_sha256"] == subject.PARENT_PINS["manifest"]
    assert custody["launch_sha256"] == subject.PARENT_PINS["launch"]
    assert custody["terminal_sha256"] == subject.PARENT_PINS["terminal"]
    assert custody["execution_commit"] == subject.PARENT_PINS["execution_commit"]
    assert custody["confirmation_parent_custody_sha256"] == subject.PARENT_PINS["confirmation_parent_custody"]
    assert custody["parent_custody_sha256"] == subject.PARENT_PINS["custody"]
    assert len(custody["cell_result_sha256s"]) == 6
    assert custody["cell_states"] == {
        "cvc5-control-negative": "UNSAT_CUSTODY_VALID",
        "cvc5-control-positive": "SAT_REPLAYED",
        "cvc5-target-gt": "UNKNOWN",
        "cvc5-target-lt": "UNKNOWN",
        "z3-target-gt": "UNSAT_CUSTODY_VALID",
        "z3-target-lt": "UNSAT_CUSTODY_VALID",
    }
    assert custody["branch_groups"] == {
        branch: list(subject.BRANCH_GROUP_IDS[branch])
        for branch in subject.BRANCH_IDS
    }
    assert custody["branch_group_sha256s"] == {
        branch: subject.PARENT_TARGET_PINS[branch]["group_sha256"]
        for branch in subject.BRANCH_IDS
    }
    assert custody["branch_journal_sha256s"] == {
        branch: subject.PARENT_TARGET_PINS[branch]["journal_sha256"]
        for branch in subject.BRANCH_IDS
    }
    assert all(value is False for value in custody["claims"].values())


def test_frozen_nineteen_query_matrix() -> None:
    assert len(subject.QUERY_PLAN) == 19
    assert len(subject.QUERY_PLAN[:-2]) == 17
    assert subject.QUERY_PLAN[-2:] == (
        ("z3-control-positive", "z3", "positive", None),
        ("z3-control-negative", "z3", "negative", None),
    )
    assert len({row[0] for row in subject.QUERY_PLAN}) == 19


def test_exact_leave_one_target_journals(custody: dict[str, object]) -> None:
    for key, solver, branch, removed_group_id in subject.QUERY_PLAN[:-2]:
        prepared = subject.prepare_query(key, custody=custody)
        pin = subject.TARGET_PINS[branch][removed_group_id]
        retained = [
            group_id
            for group_id in subject.BRANCH_GROUP_IDS[branch]
            if group_id != removed_group_id
        ]
        assert prepared.solver == solver == "z3"
        assert prepared.branch == branch
        assert prepared.removed_group_id == removed_group_id
        assert prepared.system["original_group_ids"] == list(
            subject.BRANCH_GROUP_IDS[branch]
        )
        assert prepared.system["retained_group_ids"] == retained
        assert len(retained) + 1 == len(subject.BRANCH_GROUP_IDS[branch])
        assert prepared.system["retained_group_sha256"] == pin[0]
        assert subject._sha(prepared.query.journal_smt2) == pin[1]
        assert sum(
            row.startswith("(assert ") for row in prepared.query.journal_commands
        ) == pin[2]
        assert len(prepared.query.journal_commands) == pin[3]
        assert len(prepared.query.journal_smt2) == pin[4]
        assert prepared.query.assumptions == ()
        assert prepared.query.descriptor["named_atoms"] == []
        assert prepared.query.descriptor["solve"]["assumption_ids"] == []
        text = prepared.query.journal_smt2.decode("ascii")
        assert "(=>" not in text
        assert " Bool" not in text
        assert "(check-sat" not in text


def test_fresh_z3_controls_and_exact_semantics(custody: dict[str, object]) -> None:
    positive = subject.prepare_query("z3-control-positive", custody=custody)
    negative = subject.prepare_query("z3-control-negative", custody=custody)
    assert positive.solver == negative.solver == "z3"
    accepted = subject.verify_sat_model(positive.query, "z3", "model", "((t 1))")
    assert accepted.accepted is True
    rejected = subject.verify_sat_model(positive.query, "z3", "model", "((t (root-obj (+ (^ x 2) (- 2)) 1)))")
    assert rejected.accepted is False
    assert rejected.evidence["reason"] == "exact_readback_unsupported"
    status, replay = subject._expected_semantic(
        positive, {"model": "model", "values": "((t 1))"}
    )
    assert status == "SAT_SEMANTICALLY_REPLAYED"
    assert replay["accepted"] is True
    assert replay["model_sha256"] == subject._sha(b"model")
    rejected_status, rejected_replay = subject._expected_semantic(
        positive,
        {"model": "model", "values": "((t (root-obj (+ (^ x 2) (- 2)) 1)))"},
    )
    assert rejected_status == "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
    assert rejected_replay["accepted"] is False

    target = subject.prepare_query(subject.QUERY_PLAN[0][0], custody=custody)

    def smt_fraction(value: str) -> str:
        fraction = Fraction(value)
        if fraction.denominator == 1:
            return str(fraction.numerator)
        body = f"(/ {abs(fraction.numerator)} {fraction.denominator})"
        return body if fraction > 0 else f"(- {body})"

    witness = subject.parent.parent.BASE_WITNESS_VALUES["gt"]
    exact_values = "(" + " ".join(
        f"({term} {smt_fraction(witness[term])})" for term in target.query.get_values
    ) + ")"
    target_rejected = subject.verify_sat_model(
        target.query, "z3", "model", exact_values
    )
    assert target_rejected.accepted is False


def test_target_group_order_and_hash_mutations_fail_closed(
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query(subject.QUERY_PLAN[0][0], custody=custody)
    reordered = copy.deepcopy(prepared.system)
    reordered["retained_group_ids"] = list(reversed(reordered["retained_group_ids"]))
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.build_smt_commands(reordered)
    rehashed = copy.deepcopy(prepared.system)
    rehashed["retained_group_sha256"] = "0" * 64
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.build_smt_commands(rehashed)


def test_forged_self_hashed_parent_custody_is_rejected(
    custody: dict[str, object],
) -> None:
    forged = copy.deepcopy(custody)
    forged["cell_states"]["z3-target-gt"] = "SAT_REPLAYED"
    forged["parent_custody_sha256"] = subject._self_hash(
        forged, "parent_custody_sha256"
    )
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.prepare_query(subject.QUERY_KEYS[0], custody=forged)


def test_target_pin_mutation_fails_before_transport(
    custody: dict[str, object], monkeypatch: pytest.MonkeyPatch
) -> None:
    key, _, branch, removed_group_id = subject.QUERY_PLAN[0]
    mutated = dict(subject.TARGET_PINS[branch])
    pin = list(mutated[removed_group_id])
    pin[1] = "0" * 64
    mutated[removed_group_id] = tuple(pin)
    monkeypatch.setitem(subject.TARGET_PINS, branch, mutated)
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.prepare_query(key, custody=custody)


def test_parent_cell_state_mutation_fails_closed(
    custody: dict[str, object], monkeypatch: pytest.MonkeyPatch
) -> None:
    manifest = subject._strict(subject._read(subject.PARENT_MANIFEST_PATH), "manifest")
    launch = subject._strict(subject._read(subject.PARENT_LAUNCH_PATH), "launch")
    terminal = subject._strict(subject._read(subject.PARENT_TERMINAL_PATH), "terminal")
    terminal["cells"]["z3-target-gt"]["state"] = "UNKNOWN"
    monkeypatch.setattr(subject.parent, "ensure_run_root", lambda: (subject.PARENT_ROOT, manifest))
    monkeypatch.setattr(subject.parent, "authenticate_parent_run", lambda: custody)
    monkeypatch.setattr(subject.parent, "_authenticate_source_commit", lambda *_args: None)
    monkeypatch.setattr(subject.parent, "verify_terminal_run", lambda *_args: terminal)
    monkeypatch.setattr(
        subject,
        "_pinned_json",
        lambda path, *_args: launch if path == subject.PARENT_LAUNCH_PATH else terminal,
    )
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.authenticate_parent_run()


@pytest.mark.parametrize("timeout_ms", [0, 1, 59_999, 60_001, True])
def test_prepare_rejects_timeout_drift(custody: dict[str, object], timeout_ms: int) -> None:
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.prepare_query(subject.QUERY_PLAN[0][0], custody=custody, timeout_ms=timeout_ms)


@pytest.mark.parametrize("workers", [0, 21, -1, True])
def test_campaign_rejects_worker_drift(
    custody: dict[str, object], monkeypatch: pytest.MonkeyPatch, workers: int
) -> None:
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.run_campaign(workers=workers)


@pytest.mark.parametrize("workers", [1, 2, 19, 20])
def test_launch_accepts_bounded_worker_counts(workers: int) -> None:
    launch = subject._launch_record(
        {"manifest_sha256": "1" * 64}, "2" * 40, "http://127.0.0.1:7272", workers
    )
    assert launch["workers"] == workers


def test_solver_identity_and_raw_unsat_scope(custody: dict[str, object]) -> None:
    prepared = subject.prepare_query("z3-gt-drop-edge-index-00", custody=custody)
    engine = _fake_engine(prepared, "UNSAT")
    assert subject.classify_engine(prepared, engine) == "UNSAT_CUSTODY_VALID"
    crossed = dict(engine)
    crossed["solver"] = "cvc5"
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.classify_engine(prepared, crossed)
    guarded = dict(engine)
    guarded["resumed_from_receipt"] = True
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.classify_engine(prepared, guarded)
    repeated = dict(engine)
    repeated["solve_index"] = 2
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.classify_engine(prepared, repeated)
    boolean_index = dict(engine)
    boolean_index["solve_index"] = True
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.classify_engine(prepared, boolean_index)
    forged_semantic = dict(engine)
    forged_semantic["semantic_replay"] = {"accepted": True}
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.classify_engine(prepared, forged_semantic)


@pytest.mark.parametrize("raw", ["SAT", "UNSAT"])
@pytest.mark.parametrize(
    ("field", "replacement"),
    [
        ("response_lost", True),
        ("reconciled_from_receipt", True),
        ("reconciliation_attempts", 1),
        ("request_replay_attempted", True),
        ("request_replayed", True),
    ],
)
def test_completed_solve_loss_and_replay_mutations_fail_closed(
    custody: dict[str, object], raw: str, field: str, replacement: object
) -> None:
    prepared = subject.prepare_query("z3-gt-drop-edge-index-00", custody=custody)
    engine = _fake_engine(prepared, raw)
    engine[field] = replacement
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.classify_engine(prepared, engine)


def test_engine_key_set_mutations_fail_closed(custody: dict[str, object]) -> None:
    prepared = subject.prepare_query("z3-gt-drop-edge-index-00", custody=custody)
    missing = _fake_engine(prepared, "UNKNOWN")
    missing.pop("response_lost")
    extra = _fake_engine(prepared, "UNKNOWN")
    extra["unexpected"] = False
    for engine in (missing, extra):
        with pytest.raises(subject.ReducedSingletonDeletionError):
            subject.classify_engine(prepared, engine)


def test_offline_engine_validation_recomputes_digest_and_semantics(
    custody: dict[str, object], monkeypatch: pytest.MonkeyPatch
) -> None:
    prepared = subject.prepare_query("z3-control-positive", custody=custody)
    engine = _fake_engine(prepared, "SAT")
    solve: dict[str, object] = {
        "status": "SAT",
        "solve_index": 1,
        "model": "model",
        "values": "((t 1))",
    }
    digest = subject.adapter.piqd_result_digest(solve)
    solve["result_sha256"] = digest
    expected_status, semantic = subject._expected_semantic(prepared, solve)
    engine["effective_status"] = expected_status
    engine["result_sha256"] = digest
    engine["result_digest_advisory"] = {
        "algorithm": "piqd-smt-solve-result/v1",
        "locally_recomputed": digest,
        "matches_daemon": True,
    }
    engine["semantic_replay"] = semantic
    payloads = {
        label: b"{}"
        for label in (
            "session_create_request",
            "pre_append_smt2",
            "expected_post_append_smt2",
            "journal_frontiers",
            "solve_request",
            "session",
            "smt2",
            "receipts_before",
            "receipts",
            "session_lifecycle",
            "closed_session",
        )
    }
    payloads["solve"] = subject._json(solve)
    payloads["semantic"] = subject._json(semantic)
    monkeypatch.setattr(
        subject,
        "_validate_transport_artifacts",
        lambda _prepared, _engine, _payloads: (
            {
                "id": engine["session_id"],
                "solver_signature": engine["solver_signature"],
                "solver_sha256": engine["solver_sha256"],
            },
            {"result_sha256": digest},
        ),
    )
    assert (
        subject._validate_engine_artifacts(prepared, engine, payloads)
        == "SAT_REPLAYED"
    )

    forged_semantic = copy.deepcopy(engine)
    forged_semantic["semantic_replay"] = {
        **semantic,
        "values_sha256": "0" * 64,
    }
    forged_payloads = dict(payloads)
    forged_payloads["semantic"] = subject._json(
        forged_semantic["semantic_replay"]
    )
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject._validate_engine_artifacts(
            prepared, forged_semantic, forged_payloads
        )

    forged_digest = copy.deepcopy(engine)
    forged_digest["result_digest_advisory"] = {
        **engine["result_digest_advisory"],
        "locally_recomputed": "0" * 64,
    }
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject._validate_engine_artifacts(prepared, forged_digest, payloads)


def test_rejected_sat_replay_is_unresolved(custody: dict[str, object]) -> None:
    prepared = subject.prepare_query("z3-gt-drop-edge-index-00", custody=custody)
    engine = _fake_engine(prepared, "SAT")
    engine["effective_status"] = "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
    engine["semantic_replay"] = {"accepted": False, "reason": "exact_readback_unsupported"}
    assert subject.classify_engine(prepared, engine) == "SAT_REPLAY_UNRESOLVED"


def test_cross_cell_session_reuse_fails_closed(custody: dict[str, object]) -> None:
    first = subject.prepare_query(subject.QUERY_PLAN[0][0], custody=custody)
    second = subject.prepare_query(subject.QUERY_PLAN[1][0], custody=custody)
    first_result = {"engine": _fake_engine(first, "UNKNOWN")}
    second_engine = _fake_engine(second, "UNKNOWN")
    second_engine["session_id"] = first_result["engine"]["session_id"]
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject._require_distinct_session_ids(
            {"first": first_result, "second": {"engine": second_engine}}
        )


@pytest.mark.parametrize(
    ("field", "replacement"),
    [
        ("request_id", "00000000-0000-0000-0000-000000000000"),
        ("session_label", "corrupted-session-label"),
        ("solver_profile_sha256", "b" * 64),
    ],
)
def test_unknown_lifecycle_single_field_mutations_fail_closed(
    custody: dict[str, object], field: str, replacement: str
) -> None:
    prepared = subject.prepare_query("z3-gt-drop-edge-index-00", custody=custody)
    engine = _fake_engine(prepared, "UNKNOWN")
    lifecycle = copy.deepcopy(engine["session_lifecycle"])
    lifecycle[field] = replacement
    engine["session_lifecycle"] = lifecycle
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.classify_engine(prepared, engine)


@pytest.mark.parametrize("raw", ["UNKNOWN", "UNSAT", "SAT"])
def test_coordinated_lifecycle_mutation_fails_for_all_statuses(
    custody: dict[str, object], raw: str
) -> None:
    prepared = subject.prepare_query("z3-lt-drop-edge-index-00", custody=custody)
    engine = _fake_engine(prepared, raw)
    lifecycle = copy.deepcopy(engine["session_lifecycle"])
    lifecycle.update(
        {
            "request_id": "00000000-0000-0000-0000-000000000000",
            "session_label": "coordinated-corrupt-label",
            "solver_profile_sha256": "b" * 64,
        }
    )
    engine["session_lifecycle"] = lifecycle
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.classify_engine(prepared, engine)


def test_cell_custody_rejects_symlink_hardlink_fifo(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-gt-drop-edge-index-00", custody=custody)
    calls: list[str] = []
    _install_fake_adapter.prepared = {prepared.key: prepared}  # type: ignore[attr-defined]
    _install_fake_adapter(monkeypatch, calls)
    output = tmp_path / prepared.key
    result = subject.run_cell(prepared, output, NoTransport(), set())
    assert result["state"] == "UNKNOWN"
    journal = output / "journal.smt2"
    backup = tmp_path / "journal-copy"
    backup.write_bytes(journal.read_bytes())
    journal.unlink()
    journal.symlink_to(backup)
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.verify_cell_tree(prepared, output)
    journal.unlink()
    journal.write_bytes(backup.read_bytes())
    alias = tmp_path / "journal-hardlink"
    os.link(journal, alias)
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.verify_cell_tree(prepared, output)
    alias.unlink()
    if hasattr(os, "mkfifo"):
        fifo = tmp_path / "custody-fifo"
        os.mkfifo(fifo)
        with pytest.raises(subject.ReducedSingletonDeletionError):
            subject._read(fifo)


def test_cell_count_tamper_fails_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-lt-drop-edge-index-00", custody=custody)
    calls: list[str] = []
    _install_fake_adapter.prepared = {prepared.key: prepared}  # type: ignore[attr-defined]
    _install_fake_adapter(monkeypatch, calls)
    output = tmp_path / prepared.key
    subject.run_cell(prepared, output, NoTransport(), set())
    result_path = output / "result.json"
    result = json.loads(result_path.read_bytes())
    result["assertion_count"] += 1
    result["result_sha256"] = subject._self_hash(result, "result_sha256")
    result_path.chmod(0o600)
    result_path.write_bytes(subject._json(result))
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.verify_cell_tree(prepared, output)


def test_coordinated_lifecycle_and_self_hash_tamper_fails_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-gt-drop-edge-index-00", custody=custody)
    calls: list[str] = []
    _install_fake_adapter.prepared = {prepared.key: prepared}  # type: ignore[attr-defined]
    _install_fake_adapter(monkeypatch, calls)
    output = tmp_path / prepared.key
    subject.run_cell(prepared, output, NoTransport(), set())

    result_path = output / "result.json"
    result = json.loads(result_path.read_bytes())
    lifecycle = result["engine"]["session_lifecycle"]
    lifecycle.update(
        {
            "request_id": "00000000-0000-0000-0000-000000000000",
            "session_label": "coordinated-corrupt-label",
            "solver_profile_sha256": "b" * 64,
        }
    )
    observation_path = output / "engine-observation.json"
    observation_path.chmod(0o600)
    observation = subject._json(result["engine"])
    observation_path.write_bytes(observation)
    observation_record = next(
        item
        for item in result["artifacts"]
        if item["path"] == "engine-observation.json"
    )
    observation_record.update(
        {"bytes": len(observation), "sha256": subject._sha(observation)}
    )
    result["result_sha256"] = subject._self_hash(result, "result_sha256")
    result_path.chmod(0o600)
    result_path.write_bytes(subject._json(result))
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.verify_cell_tree(prepared, output)


def test_terminal_decision_ledger_is_scoped_to_each_singleton(
    custody: dict[str, object],
) -> None:
    results: dict[str, dict[str, object]] = {}
    for key in subject.QUERY_KEYS:
        prepared = subject.prepare_query(key, custody=custody)
        if key == "z3-control-positive":
            state = "SAT_REPLAYED"
        elif key == "z3-control-negative":
            state = "UNSAT_CUSTODY_VALID"
        elif key == subject.QUERY_PLAN[0][0]:
            state = "SAT_REPLAYED"
        elif key == subject.QUERY_PLAN[1][0]:
            state = "UNSAT_CUSTODY_VALID"
        else:
            state = "UNKNOWN"
        results[key] = subject._result_record(prepared, state, None, [], None)
    terminal = subject._terminal_record(
        {"manifest_sha256": "1" * 64},
        {"launch_sha256": "2" * 64},
        custody,
        results,
    )
    first = terminal["decision_ledger"][subject.QUERY_PLAN[0][0]]
    second = terminal["decision_ledger"][subject.QUERY_PLAN[1][0]]
    assert first["decision"] == "GROUP_NECESSARY_RELATIVE_TO_ORIGINAL_FIXED_CELL"
    assert second["decision"] == "CANDIDATE_REMOVAL_REQUIRES_FRESH_SEQUENTIAL_RERUN"
    assert first["simultaneously_removable"] is False
    assert second["minimality_established"] is False
    missing = dict(results)
    missing.pop(subject.QUERY_PLAN[2][0])
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject._terminal_record(
            {"manifest_sha256": "1" * 64},
            {"launch_sha256": "2" * 64},
            custody,
            missing,
        )


def test_nineteen_cells_are_fresh_concurrent_and_offline_verify_has_no_transport(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    custody: dict[str, object],
) -> None:
    run_root = tmp_path / "scratch/runs" / subject.LANE_ID / subject.RUN_ID
    monkeypatch.setattr(subject, "RUN_ROOT", run_root)
    monkeypatch.setattr(subject, "_require_safe_root", lambda: None)
    monkeypatch.setattr(subject, "authenticate_parent_run", lambda: custody)
    monkeypatch.setattr(subject, "authenticate_execution_commit", lambda _manifest: "2" * 40)
    monkeypatch.setattr(subject, "_authenticate_source_commit", lambda _manifest, commit: commit)
    calls: list[str] = []
    prepared = {key: subject.prepare_query(key, custody=custody) for key in subject.QUERY_KEYS}
    _install_fake_adapter.prepared = prepared  # type: ignore[attr-defined]
    _install_fake_adapter(monkeypatch, calls)
    checked = subject.run_campaign(check_parent=True, transport=NoTransport())
    assert checked["status"] == "PARENT_AUTHENTICATED"
    initialized = subject.run_campaign(init_only=True, transport=NoTransport())
    assert initialized["status"] == "INITIALIZED"
    assert {path.name for path in run_root.iterdir()} == {"run_manifest.json"}
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.run_campaign(verify=True, transport=NoTransport())
    terminal = subject.run_campaign(transport=NoTransport())
    assert sorted(calls) == sorted(subject.QUERY_KEYS)
    assert len(calls) == 19
    assert terminal["status"] == "SINGLETON_DELETION_GRID_COMPLETE"
    assert len(terminal["decision_ledger"]) == 17
    assert all(
        row["decision"] == "UNRESOLVED"
        for row in terminal["decision_ledger"].values()
    )
    calls.clear()
    verified = subject.run_campaign(verify=True, transport=NoTransport())
    assert verified == terminal
    assert calls == []
    launch_path = run_root / "events/launch.json"
    launch = json.loads(launch_path.read_bytes())
    launch["timeout_ms"] = 60_001
    launch["launch_sha256"] = subject._self_hash(launch, "launch_sha256")
    launch_path.write_bytes(subject._json(launch))
    with pytest.raises(subject.ReducedSingletonDeletionError):
        subject.run_campaign(verify=True, transport=NoTransport())


def test_default_sparse_verbose_and_errors(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    monkeypatch.setattr(subject, "run_campaign", lambda **_kwargs: {"status": "ok"})
    assert subject.main([]) == 0
    captured = capsys.readouterr()
    assert captured.out == captured.err == ""
    assert subject.main(["--verbose"]) == 0
    assert json.loads(capsys.readouterr().out) == {"status": "ok"}

    def fail(**_kwargs: object) -> dict[str, object]:
        raise subject.ReducedSingletonDeletionError("blocked")

    monkeypatch.setattr(subject, "run_campaign", fail)
    assert subject.main([]) == 2
    captured = capsys.readouterr()
    assert captured.out == ""
    assert captured.err == "error: blocked\n"
