from __future__ import annotations

import json
import os
from pathlib import Path

import pytest

from census.card_head import (
    exactfive_hard_source_swap_profile282_named_core_piqd as subject,
)


@pytest.fixture(scope="module")
def parent() -> dict[str, object]:
    return subject.authenticate_parent_run()


@pytest.mark.parametrize("key", subject.TARGET_KEYS)
def test_target_has_exact_named_inventory_and_family_order(
    parent: dict[str, object], key: str
) -> None:
    prepared = subject.prepare_query(key, parent=parent)
    system = prepared.system
    bindings = system["assumption_bindings"]
    assert len(bindings) == 302
    assert [binding["family"] for binding in bindings[:16]] == [
        "normalization",
        *("row-equality" for _ in range(13)),
        "radius-disequality",
        "source-strict",
    ]
    assert all(
        binding["family"] == "strict-signed-area" for binding in bindings[16:]
    )
    assert [atom["id"] for atom in prepared.query.descriptor["named_atoms"]] == sorted(
        atom["id"] for atom in prepared.query.descriptor["named_atoms"]
    )
    assert prepared.query.descriptor["solve"]["assumption_ids"] == [
        binding["assumption_id"] for binding in bindings
    ]
    assert prepared.assumption_labels == tuple(
        binding["label_sha256"] for binding in bindings
    )
    for binding in bindings:
        assert binding["source_system_sha256"] == system["source_system_sha256"]
        assert binding["source_ledger_sha256"] == system["source_ledger_sha256"]
        assert binding["label_sha256"] == subject._self_hash(
            binding, "label_sha256"
        )


@pytest.mark.parametrize("key", subject.TARGET_KEYS)
def test_target_state_journal_guards_every_retained_source_entry(
    parent: dict[str, object], key: str
) -> None:
    prepared = subject.prepare_query(key, parent=parent)
    commands = prepared.query.journal_commands
    assert len(commands) == 1 + 19 + 302 + 302
    assert "(check-sat)" not in commands
    assert "(get-model)" not in commands
    assert sum(command.startswith("(declare-fun assume_") for command in commands) == 302
    assert sum(command.startswith("(assert (=> assume_") for command in commands) == 302
    assert commands[-1] == (
        f"(assert (=> {prepared.system['assumption_bindings'][-1]['assumption_term']} "
        f"{prepared.system['assumption_bindings'][-1]['source_body']}))"
    )
    areas = prepared.system["source_system"]["area_ledger"]
    assert len(areas) == 286
    assert [row["source_ledger_entry"] for row in prepared.system["assumption_bindings"][16:]] == areas


def test_target_solver_and_order_pairing(parent: dict[str, object]) -> None:
    mirror = subject.prepare_query("z3-target-mirror", parent=parent)
    direct = subject.prepare_query("cvc5-target-direct", parent=parent)
    assert mirror.solver == "z3"
    assert mirror.system["source_id"] == "parent-z3-mirror"
    assert direct.solver == "cvc5"
    assert direct.system["source_id"] == "parent-cvc5-direct"
    assert mirror.query.descriptor["solver_profile"]["timeout_ms"] == 60_000
    assert direct.query.descriptor["solver_profile"]["timeout_ms"] == 60_000


@pytest.mark.parametrize(
    ("key", "count"),
    [
        ("z3-control-positive", 1),
        ("z3-control-negative", 2),
        ("cvc5-control-positive", 1),
        ("cvc5-control-negative", 2),
    ],
)
def test_controls_are_named_and_retain_predecessor_assertions(
    parent: dict[str, object], key: str, count: int
) -> None:
    prepared = subject.prepare_query(key, parent=parent)
    assert len(prepared.query.assumptions) == count
    assert len(prepared.assumption_labels) == count
    assert all(command.startswith("(assert (=> assume_") for command in prepared.query.journal_commands[-count:])


class FakeTransport:
    pass


def _fake_unsat_engine(prepared: subject.PreparedQuery) -> dict[str, object]:
    chosen = [
        prepared.system["assumption_bindings"][0],
        prepared.system["assumption_bindings"][-1],
    ]
    if len(prepared.system["assumption_bindings"]) == 1:
        chosen = chosen[:1]
    solve = {
        "status": "UNSAT",
        "core": [binding["assumption_term"] for binding in chosen],
        "core_labels": [binding["label_sha256"] for binding in chosen],
        "terminal_unsat": False,
        "solve_ms": 1,
        "solve_index": 1,
        "effective_deadline_ms": (
            prepared.query.descriptor["solver_profile"]["timeout_ms"] + 30_000
        ),
        "replayed": False,
    }
    solve["result_sha256"] = subject.adapter.piqd_result_digest(solve)
    return {
        "solver": prepared.solver,
        "session_id": f"fake-{prepared.key}",
        "raw_status": "UNSAT",
        "effective_status": "UNSAT_DISCOVERY_ONLY",
        "solve_index": 1,
        "result_sha256": solve["result_sha256"],
        "response_lost": False,
        "reconciled_from_receipt": False,
        "reconciliation_attempts": 0,
        "result_digest_advisory": {
            "algorithm": "piqd-smt-solve-result/v1",
            "locally_recomputed": solve["result_sha256"],
            "matches_daemon": True,
        },
        "semantic_replay": None,
        "artifacts": {},
        "request_id": subject._query_request_id(prepared.key),
        "request_sha256": subject.adapter.piqd_solve_request_digest(
            prepared.query, prepared.assumption_labels
        ),
        "assumption_labels": list(prepared.assumption_labels),
        "claims": dict(subject.adapter.FALSE_CLAIMS),
        "unsat_assumptions": {
            "basis": "get-unsat-assumptions",
            "named_core_support": True,
            "daemon_field": "core",
            "assumption_terms": [binding["assumption_term"] for binding in chosen],
            "source_atom_ids": [binding["assumption_id"] for binding in chosen],
            "terminal_unsat": False,
            "ordered_assumption_labels": list(prepared.assumption_labels),
            "core_labels": [binding["label_sha256"] for binding in chosen],
        },
        "_test_solve": solve,
    }


def _install_fake_solve(
    prepared: subject.PreparedQuery, output_fd: int
) -> dict[str, object]:
    engine = _fake_unsat_engine(prepared)
    solve = engine.pop("_test_solve")
    payload = subject._json(solve)
    name = f"{prepared.solver}.solve.json"
    descriptor = os.open(
        name,
        os.O_WRONLY | os.O_CREAT | os.O_EXCL,
        0o600,
        dir_fd=output_fd,
    )
    try:
        os.write(descriptor, payload)
    finally:
        os.close(descriptor)
    engine["artifacts"] = {"solve": subject._artifact_record(name, payload)}
    return engine


@pytest.mark.parametrize("key", subject.TARGET_KEYS)
def test_fake_transport_accepts_exact_named_core_for_each_solver(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    parent: dict[str, object],
    key: str,
) -> None:
    prepared = subject.prepare_query(key, parent=parent)
    fake_transport = FakeTransport()

    def fake_run(query: object, **kwargs: object) -> dict[str, object]:
        assert query is prepared.query
        assert kwargs["transport"] is fake_transport
        assert kwargs["solver"] == prepared.solver
        assert kwargs["assumption_labels"] == prepared.assumption_labels
        assert kwargs["request_id"] == subject._query_request_id(key)
        assert kwargs["used_session_ids"] is shared_session_ids
        return _install_fake_solve(prepared, kwargs["output_fd"])

    monkeypatch.setattr(
        subject.adapter, "run_authenticated_single_solver_query", fake_run
    )
    output = tmp_path / key
    shared_session_ids: set[str] = set()
    result = subject.run_query(
        prepared, output, fake_transport, shared_session_ids
    )
    assert result["engine"]["unsat_assumptions"]["terminal_unsat"] is False
    assert result["engine"]["unsat_assumptions"]["core_labels"]


def test_wrong_core_label_and_terminal_unsat_fail_closed(
    parent: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-target-mirror", parent=parent)
    wrong_label = _fake_unsat_engine(prepared)
    wrong_label["unsat_assumptions"]["core_labels"][0] = "0" * 64
    with pytest.raises(subject.Profile282NamedCoreError, match="labels"):
        subject._validate_core(prepared, wrong_label)
    terminal = _fake_unsat_engine(prepared)
    terminal["unsat_assumptions"]["assumption_terms"] = []
    terminal["unsat_assumptions"]["source_atom_ids"] = []
    terminal["unsat_assumptions"]["core_labels"] = []
    terminal["unsat_assumptions"]["terminal_unsat"] = True
    with pytest.raises(subject.Profile282NamedCoreError, match="empty"):
        subject._validate_core(prepared, terminal)


def test_target_sat_replay_delegates_to_unguarded_exact_checker(
    monkeypatch: pytest.MonkeyPatch, parent: dict[str, object]
) -> None:
    prepared = subject.prepare_query("z3-target-mirror", parent=parent)
    observed: dict[str, object] = {}

    def exact_replay(query: object, solver: str, model: str, values: str) -> object:
        observed.update(query=query, solver=solver, model=model, values=values)
        return subject.adapter.SemanticVerification(True, {"exact": True})

    monkeypatch.setattr(subject.source, "verify_sat_model", exact_replay)
    verification = subject.verify_sat_model(
        prepared.query, "z3", "(model)", "((r (/ 3 4)))"
    )
    assert verification.accepted is True
    assert observed["solver"] == "z3"
    assert observed["query"].journal_commands == tuple(
        prepared.system["source_unguarded_commands"]
    )


def test_mutated_source_ledger_is_rejected(parent: dict[str, object]) -> None:
    system = subject.build_named_system("parent-z3-mirror", "z3")
    system["assumption_bindings"][0]["source_body"] = "true"
    with pytest.raises(subject.Profile282NamedCoreError, match="source ledger"):
        subject._validate_named_system(system)


def test_parent_terminal_tamper_fails_closed(monkeypatch: pytest.MonkeyPatch) -> None:
    original = subject._read_regular

    def tampered(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
        payload = original(path, limit)
        return payload + b" " if path == subject.PARENT_TERMINAL_PATH else payload

    monkeypatch.setattr(subject, "_read_regular", tampered)
    with pytest.raises(subject.Profile282NamedCoreError, match="root records"):
        subject.authenticate_parent_run()


def test_existing_query_tree_resumes_without_transport(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    parent: dict[str, object],
) -> None:
    prepared = subject.prepare_query("z3-target-mirror", parent=parent)
    fake_transport = FakeTransport()
    monkeypatch.setattr(
        subject.adapter,
        "run_authenticated_single_solver_query",
        lambda *_args, **kwargs: _install_fake_solve(
            prepared, kwargs["output_fd"]
        ),
    )
    output = tmp_path / "resume"
    first = subject.run_query(prepared, output, fake_transport)

    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("resume attempted PIQD transport")

    monkeypatch.setattr(
        subject.adapter, "run_authenticated_single_solver_query", forbidden
    )
    assert subject.run_query(prepared, output, fake_transport) == first


def test_query_tree_tamper_symlink_and_hardlink_fail_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    parent: dict[str, object],
) -> None:
    prepared = subject.prepare_query("cvc5-target-direct", parent=parent)
    monkeypatch.setattr(
        subject.adapter,
        "run_authenticated_single_solver_query",
        lambda *_args, **kwargs: _install_fake_solve(
            prepared, kwargs["output_fd"]
        ),
    )
    output = tmp_path / "custody"
    subject.run_query(prepared, output, FakeTransport())
    result_path = output / "result.json"
    result = json.loads(result_path.read_bytes())
    result["source_id"] = "crossed"
    result_path.chmod(0o600)
    result_path.write_text(json.dumps(result), encoding="utf-8")
    with pytest.raises(subject.Profile282NamedCoreError, match="identity"):
        subject.verify_query_tree(prepared, output)

    unsafe = tmp_path / "unsafe"
    unsafe.symlink_to(output, target_is_directory=True)
    with pytest.raises(subject.Profile282NamedCoreError, match="unsafe"):
        subject.verify_query_tree(prepared, unsafe)

    hardlink_output = tmp_path / "hardlink"
    subject.run_query(prepared, hardlink_output, FakeTransport())
    source_record = hardlink_output / "source-record.json"
    duplicate = tmp_path / "duplicate-source-record.json"
    source_record.unlink()
    os.link(duplicate if duplicate.exists() else output / "source-record.json", source_record)
    with pytest.raises(subject.Profile282NamedCoreError, match="unsafe artifact"):
        subject.verify_query_tree(prepared, hardlink_output)


def test_run_root_rejects_symlinked_lane_ancestor(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repository_root = tmp_path / "repository"
    runs_root = repository_root / "scratch/runs"
    runs_root.mkdir(parents=True)
    outside = tmp_path / "outside"
    outside.mkdir()
    lane = runs_root / subject.LANE_ID
    lane.symlink_to(outside, target_is_directory=True)
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository_root)
    monkeypatch.setattr(subject, "RUN_ROOT", lane / subject.RUN_ID)

    with pytest.raises(subject.Profile282NamedCoreError, match="ancestor is a symlink"):
        subject.ensure_run_root()
    assert not (outside / subject.RUN_ID).exists()


def test_default_output_sparse_verbose_json_and_errors(
    monkeypatch: pytest.MonkeyPatch,
    capsys: pytest.CaptureFixture[str],
) -> None:
    manifest = {"schema": subject.RUN_MANIFEST_SCHEMA, "manifest_sha256": "a" * 64}
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (subject.RUN_ROOT, manifest))
    assert subject.main(["--init-only"]) == 0
    assert capsys.readouterr() == ("", "")
    assert subject.main(["--init-only", "--verbose"]) == 0
    captured = capsys.readouterr()
    assert json.loads(captured.out) == manifest
    assert captured.err == ""

    def failed() -> tuple[Path, dict[str, object]]:
        raise subject.Profile282NamedCoreError("broken custody")

    monkeypatch.setattr(subject, "ensure_run_root", failed)
    assert subject.main(["--init-only"]) == 1
    captured = capsys.readouterr()
    assert captured.out == ""
    assert captured.err == "error: broken custody\n"


def test_campaign_contract_is_six_sequential_single_solves() -> None:
    assert subject.WORKERS == 1
    assert subject.DEFAULT_TIMEOUT_S == 60.0
    assert len(subject.QUERY_PLAN) == 6
    assert [solver for _, solver, _ in subject.QUERY_PLAN] == [
        "z3", "z3", "z3", "cvc5", "cvc5", "cvc5"
    ]
    with pytest.raises(subject.Profile282NamedCoreError, match="exactly 1"):
        subject.run_campaign(workers=2)


def test_claims_remain_false(parent: dict[str, object]) -> None:
    assert all(value is False for value in subject.FALSE_CLAIMS.values())
    prepared = subject.prepare_query("cvc5-target-direct", parent=parent)
    assert prepared.system["claims"] == subject.FALSE_CLAIMS
    assert prepared.query.descriptor["semantic_input"]["claims"] == subject.FALSE_CLAIMS
