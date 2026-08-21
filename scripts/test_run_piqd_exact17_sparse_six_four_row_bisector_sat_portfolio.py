# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Offline adversarial tests for the six-job SAT-profile portfolio runner."""

from __future__ import annotations

import json
import threading
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest
import run_piqd_exact17_sparse_six_four_row_bisector_sat_portfolio as subject
import test_prepare_exact17_sparse_six_four_row_bisector_sat_portfolio as fixtures


def _prepared(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> dict[str, Any]:
    return fixtures.prepare_fixture(tmp_path, monkeypatch)


def _live() -> dict[str, Any]:
    solver = {
        "name": subject.SOLVER_NAME,
        "sha256": subject.SOLVER_SHA256,
        "solver_signature": subject.SOLVER_SIGNATURE,
        "protocol_version": 1,
        "solver": "cadical",
        "lane": "sat",
        "usable": True,
    }
    return {
        "version": {"daemon": subject.DAEMON_IDENTITY},
        "solver": solver,
        "fetched_endpoints": ["/version", "/solvers"],
    }


def _reserve_test_journal(
    fixture: dict[str, Any], *, name: str
) -> tuple[Path, dict[str, Any]]:
    checked = subject.static_check(root=fixture["root"], run_root=fixture["output"])
    path = fixture["output"] / "events" / f"{name}.jsonl"
    path.touch(mode=0o600)
    path.chmod(0o600)
    lock = path.with_name(f"{path.name}.lock")
    lock.touch(mode=0o600)
    lock.chmod(0o600)
    return path, checked["cells"][0]["wave"]


def _journaled_fake_result(
    root: Path,
    run_root: Path,
    cell: dict[str, Any],
    *,
    job_id: str,
    outcome: str,
    solver_result: str,
) -> dict[str, Any]:
    identifier = cell["portfolio_cell_id"]
    path = run_root / "events" / f"{identifier}.jsonl"
    journal = subject.DescriptorAttemptJournal(
        path,
        manifest=cell["wave"],
        root=root,
        expected_journal_identity=cell["_journal_reservation_identity"],
        expected_lock_identity=cell["_journal_lock_reservation_identity"],
    )
    try:
        event = subject._driver._event(
            phase="TEST_TERMINAL",
            disposition="SUCCESS" if outcome == "STRUCTURAL_SAT" else "ERROR",
            job_id=job_id,
            status="completed",
            result=solver_result,
            detail="offline authenticated fake terminal",
        )
        record = journal.append_event(
            event=event,
            outcome=outcome,
            detail="offline authenticated fake terminal",
        )
        seal = journal.seal()
    finally:
        journal.close()
    return {
        "portfolio_cell_id": identifier,
        "job_id": job_id,
        "outcome": outcome,
        "terminal_record_sha256": record["record_sha256"],
        "journal_record_count": seal["record_count"],
        "seal_sha256": seal["seal_sha256"],
    }


def _start_authenticated_unknown_canary(fixture: dict[str, Any]) -> dict[str, Any]:
    def runner(
        root: Path,
        run_root: Path,
        cell: dict[str, Any],
        _base_url: str,
    ) -> dict[str, Any]:
        return _journaled_fake_result(
            root,
            run_root,
            cell,
            job_id="authenticated-unknown-canary",
            outcome="ERROR",
            solver_result="UNKNOWN",
        )

    return subject.start_canary(
        root=fixture["root"],
        run_root=fixture["output"],
        identity_fetcher=lambda _url: _live(),
        cell_runner=runner,
    )


def test_static_check_authenticates_exact_prepared_package(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    checked = subject.static_check(root=fixture["root"], run_root=fixture["output"])
    assert checked["status"] == "PASS"
    assert len(checked["cells"]) == 6
    assert len(set(checked["identities"].values())) == 6
    assert checked["policy"] == {
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
        "requested_core_limit_per_job": 1,
        "solve_timeout_s": 3600,
        "replay_timeout_s": 3600,
        "maximum_concurrency": 6,
        "duplicate_recovery_owner": None,
    }


def test_static_check_rejects_manifest_mutation_and_hardlink(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    campaign = json.loads(
        (fixture["output"] / "artifacts/campaign-manifest.json").read_bytes()
    )
    producer = fixture["root"] / campaign["cells"][0]["producer_manifest"]["path"]
    producer.write_bytes(producer.read_bytes() + b" ")
    with pytest.raises(
        (subject.PortfolioRunnerError, subject.preparation.PreparationError),
        match="drifted|canonical|identity",
    ):
        subject.static_check(root=fixture["root"], run_root=fixture["output"])

    producer.write_bytes(
        subject.preparation.build_producer(
            json.loads(
                (
                    fixture["root"]
                    / campaign["cells"][0]["source_producer_manifest"]["path"]
                ).read_bytes()
            ),
            campaign["cells"][0]["source_producer_manifest"]["sha256"],
            "none",
        )
    )
    target = producer.with_name("hardlink-target.json")
    producer.replace(target)
    producer.hardlink_to(target)
    with pytest.raises(subject.preparation.PreparationError, match="private regular"):
        subject.static_check(root=fixture["root"], run_root=fixture["output"])


def test_live_identity_captures_only_pinned_daemon_and_solver() -> None:
    solver = _live()["solver"]

    def fetch(_base: str, target: str) -> dict[str, Any]:
        if target == "/version":
            return {"daemon": subject.DAEMON_IDENTITY}
        return {"daemon": subject.DAEMON_IDENTITY, "solvers": [solver]}

    assert subject.live_identity("http://127.0.0.1:7272", fetch_json=fetch) == _live()
    bad = dict(solver)
    bad["sha256"] = "0" * 64

    def drift(_base: str, target: str) -> dict[str, Any]:
        if target == "/version":
            return {"daemon": subject.DAEMON_IDENTITY}
        return {"daemon": subject.DAEMON_IDENTITY, "solvers": [bad]}

    with pytest.raises(subject.PortfolioRunnerError, match="SHA-256"):
        subject.live_identity("http://127.0.0.1:7272", fetch_json=drift)


def test_start_reserves_once_and_runs_exact_six_job_concurrency(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    barrier = threading.Barrier(6)
    observed: list[str] = []
    lock = threading.Lock()

    def fake_runner(
        _root: Path,
        _run_root: Path,
        cell: dict[str, Any],
        base_url: str,
    ) -> dict[str, Any]:
        assert base_url == "http://127.0.0.1:7272"
        barrier.wait(timeout=5)
        with lock:
            observed.append(cell["portfolio_cell_id"])
        return {
            "portfolio_cell_id": cell["portfolio_cell_id"],
            "job_id": f"job-{cell['ordinal']}",
            "outcome": "STRUCTURAL_SAT",
            "terminal_record_sha256": f"{cell['ordinal'] + 1:064x}",
            "journal_record_count": 4,
            "seal_sha256": f"{cell['ordinal'] + 7:064x}",
        }

    result = subject.start(
        root=fixture["root"],
        run_root=fixture["output"],
        identity_fetcher=lambda _url: _live(),
        cell_runner=fake_runner,
    )
    assert result["status"] == "COMPLETE"
    assert len(observed) == len(set(observed)) == 6
    launch = json.loads(
        (fixture["output"] / "artifacts/launch-manifest.json").read_bytes()
    )
    assert launch["live_identity"] == _live()
    assert launch["execution"]["solve_timeout_s"] == 3600
    assert launch["execution"]["replay_timeout_s"] == 3600
    assert launch["execution"]["maximum_concurrency"] == 6
    event_names = {path.name for path in (fixture["output"] / "events").iterdir()}
    for identifier in observed:
        assert f"{identifier}.jsonl" in event_names
        assert f"{identifier}.jsonl.lock" in event_names
    with pytest.raises(subject.PortfolioRunnerError, match="launch-empty"):
        subject.start(
            root=fixture["root"],
            run_root=fixture["output"],
            identity_fetcher=lambda _url: _live(),
            cell_runner=fake_runner,
        )


def test_unknown_single_cell_canary_aggregates_with_rest_without_portfolio_complete(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    checked = subject.static_check(root=fixture["root"], run_root=fixture["output"])
    all_cell_ids = {cell["portfolio_cell_id"] for cell in checked["cells"]}
    canary_id = "four-row-bisector-next-center-02-physical-none-sat-profile-v1"
    assert len(checked["cells"]) == len(all_cell_ids) == 6
    assert canary_id in all_cell_ids
    observed: list[str] = []

    with pytest.raises(subject.PortfolioRunnerError, match="custody"):
        subject.start_rest(
            root=fixture["root"],
            run_root=fixture["output"],
            identity_fetcher=lambda _url: _live(),
            cell_runner=lambda *_args: {},
        )

    def fake_runner(
        root: Path,
        run_root: Path,
        cell: dict[str, Any],
        _base_url: str,
    ) -> dict[str, Any]:
        observed.append(cell["portfolio_cell_id"])
        return _journaled_fake_result(
            root,
            run_root,
            cell,
            job_id="canary-job",
            outcome="ERROR",
            solver_result="UNKNOWN",
        )

    result = subject.start_canary(
        root=fixture["root"],
        run_root=fixture["output"],
        identity_fetcher=lambda _url: _live(),
        cell_runner=fake_runner,
    )
    assert result["launch_mode"] == "SINGLE_CELL_CANARY"
    assert result["portfolio_cell_count"] == 6
    assert result["cell_count"] == 1
    assert result["status"] == "COMPLETE_WITH_NON_SAT_RESULTS"
    assert observed == [canary_id]
    assert len(set(observed)) == 1
    launch = json.loads(
        (fixture["output"] / "artifacts/canary-launch-manifest.json").read_bytes()
    )
    assert launch["portfolio_cell_count"] == 6
    assert launch["selected_cell_count"] == 1
    assert launch["execution"]["launch_concurrency"] == 1
    assert len(list((fixture["output"] / "events").glob("*.jsonl"))) == 1
    with pytest.raises(subject.PortfolioRunnerError, match="launch-empty"):
        subject.start(
            root=fixture["root"],
            run_root=fixture["output"],
            identity_fetcher=lambda _url: _live(),
            cell_runner=lambda *_args: {},
        )

    rest_observed: list[str] = []

    def rest_runner(
        _root: Path,
        _run_root: Path,
        cell: dict[str, Any],
        _base_url: str,
    ) -> dict[str, Any]:
        rest_observed.append(cell["portfolio_cell_id"])
        return {
            "portfolio_cell_id": cell["portfolio_cell_id"],
            "job_id": f"rest-{cell['ordinal']}",
            "outcome": "STRUCTURAL_SAT",
            "terminal_record_sha256": f"{cell['ordinal'] + 10:064x}",
            "journal_record_count": 4,
            "seal_sha256": f"{cell['ordinal'] + 20:064x}",
        }

    rest = subject.start_rest(
        root=fixture["root"],
        run_root=fixture["output"],
        identity_fetcher=lambda _url: _live(),
        cell_runner=rest_runner,
    )
    assert rest["launch_mode"] == "REMAINING_FIVE"
    assert rest["portfolio_cell_count"] == 6
    assert rest["selected_cell_count"] == 5
    assert rest["inherited_cell_count"] == 1
    assert rest["cell_count"] == 6
    assert rest["status"] == "COMPLETE_WITH_NON_SAT_RESULTS"
    assert len(rest["selected_results"]) == 5
    assert rest["inherited_results"] == [result["results"][0]]
    assert rest["inherited_results"][0]["outcome"] == "ERROR"
    assert len(rest["results"]) == 6
    assert len(rest_observed) == len(set(rest_observed)) == 5
    assert set(rest_observed) == all_cell_ids - {canary_id}
    assert set(observed).isdisjoint(rest_observed)
    assert len(list((fixture["output"] / "events").glob("*.jsonl"))) == 6


@pytest.mark.parametrize(
    "tamper",
    [
        "missing_job_id",
        "malformed_outcome",
        "swapped_job_id",
        "swapped_terminal_hash",
        "swapped_record_count",
        "swapped_seal_hash",
    ],
)
def test_rest_rejects_malformed_or_cross_drifted_canary_terminal(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, tamper: str
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    _start_authenticated_unknown_canary(fixture)
    result_path = fixture["output"] / "artifacts/canary-result.json"
    result = json.loads(result_path.read_bytes())
    terminals = [result["results"][0], result["selected_results"][0]]
    if tamper == "missing_job_id":
        for terminal in terminals:
            terminal.pop("job_id")
    elif tamper == "malformed_outcome":
        for terminal in terminals:
            terminal["outcome"] = 7
    elif tamper == "swapped_job_id":
        for terminal in terminals:
            terminal["job_id"] = "different-job"
    elif tamper == "swapped_terminal_hash":
        for terminal in terminals:
            terminal["terminal_record_sha256"] = "3" * 64
    elif tamper == "swapped_record_count":
        for terminal in terminals:
            terminal["journal_record_count"] += 1
    else:
        for terminal in terminals:
            terminal["seal_sha256"] = "4" * 64
    result_path.write_bytes(subject.canonical_json_bytes(result))
    with pytest.raises(
        (subject.PortfolioRunnerError, subject.PiqdDriverError),
        match="canary|terminal|journal|seal",
    ):
        subject.start_rest(
            root=fixture["root"],
            run_root=fixture["output"],
            identity_fetcher=lambda _url: _live(),
            cell_runner=lambda *_args: {},
        )


@pytest.mark.parametrize("smuggle", ["events", "tmp"])
def test_rest_rejects_prefix_smuggling_outside_exact_canary_allowlist(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, smuggle: str
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    _start_authenticated_unknown_canary(fixture)
    canary = subject.preparation.portfolio_cell_id("none")
    if smuggle == "events":
        (fixture["output"] / "events" / f"{canary}.jsonl.evil").touch()
        match = "foreign event"
    else:
        (fixture["output"] / "tmp" / f"{canary}-replay-work.evil").mkdir()
        match = "foreign replay"
    with pytest.raises(subject.PortfolioRunnerError, match=match):
        subject.start_rest(
            root=fixture["root"],
            run_root=fixture["output"],
            identity_fetcher=lambda _url: _live(),
            cell_runner=lambda *_args: {},
        )


def test_driver_adapter_uses_phase3_semantics_and_fixed_timeouts(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    checked = subject.static_check(root=fixture["root"], run_root=fixture["output"])
    cell = checked["cells"][0]
    journal = fixture["output"] / "events" / f"{cell['portfolio_cell_id']}.jsonl"
    journal.touch(mode=0o600)
    journal.chmod(0o600)
    journal.with_name(f"{journal.name}.lock").touch(mode=0o600)
    journal.with_name(f"{journal.name}.lock").chmod(0o600)
    cell = {
        **cell,
        "_journal_reservation_identity": subject.DescriptorAttemptJournal._file_identity(
            journal.stat()
        ),
        "_journal_lock_reservation_identity": subject.DescriptorAttemptJournal._file_identity(
            journal.with_name(f"{journal.name}.lock").stat()
        ),
    }
    captured: dict[str, Any] = {}

    class FakeReplayer:
        def __init__(self, *, lean_root: Path, work_dir: Path, timeout_s: int) -> None:
            captured["lean_root"] = lean_root
            captured["work_dir"] = work_dir
            captured["replay_timeout_s"] = timeout_s

    class FakeDriver:
        def __init__(self, **kwargs: Any) -> None:
            captured.update(kwargs)

        def run(self, **kwargs: Any) -> SimpleNamespace:
            captured["run"] = kwargs
            return SimpleNamespace(
                job_id="job",
                outcome="STRUCTURAL_SAT",
                terminal_record_sha256="1" * 64,
                journal_record_count=4,
                seal_sha256="2" * 64,
            )

    monkeypatch.setattr(subject, "LeanLratReplayer", FakeReplayer)
    monkeypatch.setattr(subject, "PiqdCegarDriver", FakeDriver)
    monkeypatch.setattr(subject, "PiqdRawDimacsClient", lambda url: ("client", url))
    result = subject._run_cell(
        fixture["root"], fixture["output"], cell, "http://127.0.0.1:7272"
    )
    policy = captured["policy"]
    assert result["outcome"] == "STRUCTURAL_SAT"
    assert policy.requested_core_limit == 1
    assert policy.solver_timeout_s == 3600
    assert policy.march_timeout_s == 3600
    assert policy.max_prepare_attempts == 1
    assert policy.max_confirm_attempts == 1
    assert policy.max_result_attempts == 1
    assert captured["replay_timeout_s"] == 3600
    assert isinstance(captured["client"], subject.FreshOnlyPiqdClient)
    assert isinstance(captured["journal"], subject.DescriptorAttemptJournal)
    assert captured["run"]["producer_manifest"]
    assert captured["run"]["cnf"].startswith(b"p cnf")


def test_run_cell_rejects_existing_piqd_job_even_when_driver_returns_error(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    checked = subject.static_check(root=fixture["root"], run_root=fixture["output"])
    cell = checked["cells"][0]
    journal = fixture["output"] / "events" / f"{cell['portfolio_cell_id']}.jsonl"
    journal.touch(mode=0o600)
    journal.chmod(0o600)
    journal.with_name(f"{journal.name}.lock").touch(mode=0o600)
    journal.with_name(f"{journal.name}.lock").chmod(0o600)
    cell = {
        **cell,
        "_journal_reservation_identity": subject.DescriptorAttemptJournal._file_identity(
            journal.stat()
        ),
        "_journal_lock_reservation_identity": subject.DescriptorAttemptJournal._file_identity(
            journal.with_name(f"{journal.name}.lock").stat()
        ),
    }

    class ExistingClient:
        def prepare_cnf(self, **_kwargs: Any) -> SimpleNamespace:
            return SimpleNamespace(existing=True)

    monkeypatch.setattr(subject, "PiqdRawDimacsClient", lambda _url: ExistingClient())
    monkeypatch.setattr(subject, "LeanLratReplayer", lambda **_kwargs: object())
    with pytest.raises(subject.PortfolioRunnerError, match="existing=true"):
        subject._run_cell(
            fixture["root"], fixture["output"], cell, "http://127.0.0.1:7272"
        )
    records = [json.loads(line) for line in journal.read_bytes().splitlines()]
    assert [record["outcome"] for record in records] == ["CHECKPOINT", "ERROR"]
    assert "existing=true" in records[-1]["detail"]
    assert journal.with_name(f"{journal.name}.seal.json").is_file()


@pytest.mark.parametrize("linked", ["journal", "lock"])
def test_descriptor_journal_rejects_symlinked_custody_file(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, linked: str
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    checked = subject.static_check(root=fixture["root"], run_root=fixture["output"])
    wave = checked["cells"][0]["wave"]
    events = fixture["output"] / "events"
    path = events / "symlink-attack.jsonl"
    lock = path.with_name(f"{path.name}.lock")
    target = events / "symlink-target"
    target.touch(mode=0o600)
    target.chmod(0o600)
    real = lock if linked == "journal" else path
    real.touch(mode=0o600)
    real.chmod(0o600)
    attacked = path if linked == "journal" else lock
    attacked.symlink_to(target.name)
    with pytest.raises(subject.PiqdDriverError, match="linked|unsafe"):
        subject.DescriptorAttemptJournal(path, manifest=wave, root=fixture["root"])


@pytest.mark.parametrize("swapped", ["journal", "lock"])
def test_descriptor_journal_rejects_reservation_swap_before_open(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, swapped: str
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    path, wave = _reserve_test_journal(fixture, name=f"reserved-swap-{swapped}")
    lock = path.with_name(f"{path.name}.lock")
    journal_identity = subject.DescriptorAttemptJournal._file_identity(path.stat())
    lock_identity = subject.DescriptorAttemptJournal._file_identity(lock.stat())
    target = path if swapped == "journal" else lock
    target.rename(target.with_name(f"{target.name}.moved"))
    target.touch(mode=0o600)
    target.chmod(0o600)
    with pytest.raises(subject.PiqdDriverError, match="reservation identity"):
        subject.DescriptorAttemptJournal(
            path,
            manifest=wave,
            root=fixture["root"],
            expected_journal_identity=journal_identity,
            expected_lock_identity=lock_identity,
        )


@pytest.mark.parametrize("swapped", ["journal", "lock"])
def test_descriptor_journal_rejects_custody_path_swap(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, swapped: str
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    path, wave = _reserve_test_journal(fixture, name=f"swap-{swapped}")
    journal = subject.DescriptorAttemptJournal(
        path, manifest=wave, root=fixture["root"]
    )
    target = path if swapped == "journal" else path.with_name(f"{path.name}.lock")
    moved = target.with_name(f"{target.name}.moved")
    target.rename(moved)
    target.touch(mode=0o600)
    target.chmod(0o600)
    try:
        with pytest.raises(subject.PiqdDriverError, match="custody identity"):
            journal.seal()
    finally:
        journal.close()


def test_descriptor_journal_rejects_emitted_artifact_path_swap(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    path, wave = _reserve_test_journal(fixture, name="artifact-swap")
    journal = subject.DescriptorAttemptJournal(
        path, manifest=wave, root=fixture["root"]
    )
    payload = b"descriptor-bound runtime evidence"
    digest = journal.store_artifact(payload)
    artifact = path.with_name(f"{path.name}.artifacts") / digest
    moved = artifact.with_name(f"{artifact.name}.moved")
    artifact.rename(moved)
    artifact.write_bytes(payload)
    artifact.chmod(0o600)
    try:
        with pytest.raises(subject.PiqdDriverError, match="artifact identity"):
            journal.store_artifact(payload)
    finally:
        journal.close()


def test_descriptor_journal_rejects_emitted_seal_path_swap(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    fixture = _prepared(tmp_path, monkeypatch)
    path, wave = _reserve_test_journal(fixture, name="seal-swap")
    journal = subject.DescriptorAttemptJournal(
        path, manifest=wave, root=fixture["root"]
    )
    journal.seal()
    seal = path.with_name(f"{path.name}.seal.json")
    moved = seal.with_name(f"{seal.name}.moved")
    seal.rename(moved)
    seal.symlink_to(moved.name)
    try:
        with pytest.raises(subject.PiqdDriverError, match="seal.*linked|seal.*unsafe"):
            journal.seal()
    finally:
        journal.close()
