from __future__ import annotations

import copy
import json
import os
from fractions import Fraction
from pathlib import Path

import pytest

from census.card_head import (
    exactfive_profile0034_new_mirror_reduced_cell_confirmation_piqd as subject,
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
        if prepared.key == "cvc5-control-positive":
            return _fake_engine(prepared, "SAT")
        if prepared.key == "cvc5-control-negative":
            return _fake_engine(prepared, "UNSAT")
        return _fake_engine(prepared, "UNKNOWN")

    monkeypatch.setattr(subject.adapter, "run_authenticated_single_solver_query", run)


_install_fake_adapter.prepared = {}  # type: ignore[attr-defined]


def test_parent_authenticates_full_recovery(custody: dict[str, object]) -> None:
    assert custody["manifest_sha256"] == subject.PARENT_PINS["manifest"]
    assert custody["launch_sha256"] == subject.PARENT_PINS["launch"]
    assert custody["terminal_sha256"] == subject.PARENT_PINS["terminal"]
    assert custody["execution_commit"] == subject.PARENT_PINS["execution_commit"]
    assert len(custody["query_result_sha256s"]) == 60
    assert custody["branch_groups"] == {
        branch: list(subject.BRANCH_GROUP_IDS[branch])
        for branch in subject.BRANCH_IDS
    }
    assert custody["z3_controls"]["z3-control-positive"]["disposition"] == "SAT_REPLAYED"
    assert custody["z3_controls"]["z3-control-negative"]["disposition"] == "UNSAT_CUSTODY_VALID"
    assert all(value is False for value in custody["claims"].values())


def test_frozen_six_cell_matrix() -> None:
    assert subject.QUERY_PLAN == (
        ("z3-target-gt", "z3", "gt"),
        ("cvc5-target-gt", "cvc5", "gt"),
        ("z3-target-lt", "z3", "lt"),
        ("cvc5-target-lt", "cvc5", "lt"),
        ("cvc5-control-positive", "cvc5", "positive"),
        ("cvc5-control-negative", "cvc5", "negative"),
    )


@pytest.mark.parametrize(
    ("key", "solver", "branch", "digest", "assertions", "commands", "size"),
    [
        ("z3-target-gt", "z3", "gt", subject.TARGET_PINS["gt"]["journal_sha256"], 48, 69, 5365),
        ("cvc5-target-gt", "cvc5", "gt", subject.TARGET_PINS["gt"]["journal_sha256"], 48, 69, 5365),
        ("z3-target-lt", "z3", "lt", subject.TARGET_PINS["lt"]["journal_sha256"], 59, 80, 6340),
        ("cvc5-target-lt", "cvc5", "lt", subject.TARGET_PINS["lt"]["journal_sha256"], 59, 80, 6340),
    ],
)
def test_exact_target_journals(
    custody: dict[str, object],
    key: str,
    solver: str,
    branch: str,
    digest: str,
    assertions: int,
    commands: int,
    size: int,
) -> None:
    prepared = subject.prepare_query(key, custody=custody)
    assert prepared.solver == solver
    assert prepared.branch == branch
    assert prepared.system["retained_group_ids"] == list(subject.BRANCH_GROUP_IDS[branch])
    assert subject._sha(prepared.query.journal_smt2) == digest
    assert len(prepared.query.journal_smt2) == size
    assert len(prepared.query.journal_commands) == commands
    assert sum(row.startswith("(assert ") for row in prepared.query.journal_commands) == assertions
    assert prepared.query.assumptions == ()
    assert prepared.query.descriptor["named_atoms"] == []
    assert prepared.query.descriptor["solve"]["assumption_ids"] == []
    text = prepared.query.journal_smt2.decode("ascii")
    assert "(=>" not in text
    assert " Bool" not in text
    assert "(check-sat" not in text


def test_fresh_cvc5_controls_and_exact_semantics(custody: dict[str, object]) -> None:
    positive = subject.prepare_query("cvc5-control-positive", custody=custody)
    negative = subject.prepare_query("cvc5-control-negative", custody=custody)
    assert positive.solver == negative.solver == "cvc5"
    accepted = subject.verify_sat_model(positive.query, "cvc5", "model", "((t 1))")
    assert accepted.accepted is True
    rejected = subject.verify_sat_model(positive.query, "cvc5", "model", "((t (root-obj (+ (^ x 2) (- 2)) 1)))")
    assert rejected.accepted is False
    assert rejected.evidence["reason"] == "exact_readback_unsupported"

    target = subject.prepare_query("z3-target-gt", custody=custody)

    def smt_fraction(value: str) -> str:
        fraction = Fraction(value)
        if fraction.denominator == 1:
            return str(fraction.numerator)
        body = f"(/ {abs(fraction.numerator)} {fraction.denominator})"
        return body if fraction > 0 else f"(- {body})"

    witness = subject.parent.BASE_WITNESS_VALUES["gt"]
    exact_values = "(" + " ".join(
        f"({term} {smt_fraction(witness[term])})" for term in target.query.get_values
    ) + ")"
    target_rejected = subject.verify_sat_model(
        target.query, "z3", "model", exact_values
    )
    assert target_rejected.accepted is False


@pytest.mark.parametrize("timeout_ms", [0, 1, 59_999, 60_001, True])
def test_prepare_rejects_timeout_drift(custody: dict[str, object], timeout_ms: int) -> None:
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.prepare_query("z3-target-gt", custody=custody, timeout_ms=timeout_ms)


@pytest.mark.parametrize("workers", [0, 2, 20, True])
def test_campaign_rejects_worker_drift(
    custody: dict[str, object], monkeypatch: pytest.MonkeyPatch, workers: int
) -> None:
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (Path("unused"), {}))
    monkeypatch.setattr(subject, "authenticate_parent_run", lambda: custody)
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.run_campaign(workers=workers)


def test_solver_identity_and_raw_unsat_scope(custody: dict[str, object]) -> None:
    prepared = subject.prepare_query("z3-target-gt", custody=custody)
    engine = _fake_engine(prepared, "UNSAT")
    assert subject.classify_engine(prepared, engine) == "UNSAT_CUSTODY_VALID"
    crossed = dict(engine)
    crossed["solver"] = "cvc5"
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.classify_engine(prepared, crossed)
    guarded = dict(engine)
    guarded["resumed_from_receipt"] = True
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.classify_engine(prepared, guarded)
    repeated = dict(engine)
    repeated["solve_index"] = 2
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.classify_engine(prepared, repeated)


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
    prepared = subject.prepare_query("z3-target-gt", custody=custody)
    engine = _fake_engine(prepared, "UNKNOWN")
    lifecycle = copy.deepcopy(engine["session_lifecycle"])
    lifecycle[field] = replacement
    engine["session_lifecycle"] = lifecycle
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.classify_engine(prepared, engine)


@pytest.mark.parametrize("raw", ["UNKNOWN", "UNSAT", "SAT"])
def test_coordinated_lifecycle_mutation_fails_for_all_statuses(
    custody: dict[str, object], raw: str
) -> None:
    prepared = subject.prepare_query("z3-target-lt", custody=custody)
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
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.classify_engine(prepared, engine)


def test_cell_custody_rejects_symlink_hardlink_fifo(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-target-gt", custody=custody)
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
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.verify_cell_tree(prepared, output)
    journal.unlink()
    journal.write_bytes(backup.read_bytes())
    alias = tmp_path / "journal-hardlink"
    os.link(journal, alias)
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.verify_cell_tree(prepared, output)
    alias.unlink()
    if hasattr(os, "mkfifo"):
        fifo = tmp_path / "custody-fifo"
        os.mkfifo(fifo)
        with pytest.raises(subject.ReducedCellConfirmationError):
            subject._read(fifo)


def test_cell_count_tamper_fails_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-target-lt", custody=custody)
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
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.verify_cell_tree(prepared, output)


def test_coordinated_lifecycle_and_self_hash_tamper_fails_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    custody: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-target-gt", custody=custody)
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
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.verify_cell_tree(prepared, output)


def test_six_cells_are_fresh_sequential_and_offline_verify_has_no_transport(
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
    initialized = subject.run_campaign(init_only=True, transport=NoTransport())
    assert initialized["status"] == "INITIALIZED"
    assert {path.name for path in run_root.iterdir()} == {"run_manifest.json"}
    with pytest.raises(subject.ReducedCellConfirmationError):
        subject.run_campaign(verify=True, transport=NoTransport())
    terminal = subject.run_campaign(transport=NoTransport())
    assert calls == list(subject.QUERY_KEYS)
    assert terminal["status"] == "TARGET_INCONCLUSIVE"
    calls.clear()
    verified = subject.run_campaign(verify=True, transport=NoTransport())
    assert verified == terminal
    assert calls == []
    launch_path = run_root / "events/launch.json"
    launch = json.loads(launch_path.read_bytes())
    launch["timeout_ms"] = 60_001
    launch["launch_sha256"] = subject._self_hash(launch, "launch_sha256")
    launch_path.write_bytes(subject._json(launch))
    with pytest.raises(subject.ReducedCellConfirmationError):
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
        raise subject.ReducedCellConfirmationError("blocked")

    monkeypatch.setattr(subject, "run_campaign", fail)
    assert subject.main([]) == 2
    captured = capsys.readouterr()
    assert captured.out == ""
    assert captured.err == "error: blocked\n"
