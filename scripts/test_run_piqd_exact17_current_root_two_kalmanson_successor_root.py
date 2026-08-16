"""Focused lifecycle tests for the current-root-two-kalmanson-successor one-shot PIQD runner."""

from __future__ import annotations

import hashlib
import inspect
import json
import os
import urllib.parse
from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest
import run_piqd_exact17_current_root_two_kalmanson_successor_root as subject


def _checked() -> dict[str, Any]:
    spec = subject.PRODUCTION_RUNNER_SPEC
    return {
        "status": "PASS",
        "ingress": {
            "status": "PASS",
            "dimacs": {
                "path": str(subject.PRODUCTION_INGRESS_PATHS.child.resolve()),
                "sha256": spec.root_sha256,
                "bytes": spec.root_bytes,
                "variables": spec.variables,
                "clauses": spec.clauses,
            },
            "export_receipt": {
                "path": str(subject.PRODUCTION_INGRESS_PATHS.export_receipt.resolve()),
                "sha256": spec.receipt_sha256,
                "bytes": 4_607,
                "schema": "p97-exact17-current-root-two-kalmanson-successor-immutable-export-receipt/v2",
            },
        },
    }


def _receipt(
    paths: subject.RunnerPaths,
    *,
    verdict: str,
    source_sha256: str,
    producer_sha256: str,
    status_polls: int = 1,
) -> str:
    spec = subject.PRODUCTION_RUNNER_SPEC
    job_id = "job-current-root-two-kalmanson-successor"
    attempt_path = paths.journal_root / f"attempt-00000000-{spec.root_sha256[:16]}"
    trace = [
        {"method": "POST", "target": "/jobs/prepare-cnf"},
        {"method": "GET", "target": f"/jobs/{job_id}/cnf"},
        {"method": "POST", "target": f"/jobs/confirm?job_id={job_id}"},
        *({"method": "GET", "target": f"/jobs/{job_id}"} for _ in range(status_polls)),
    ]
    if verdict == "SAT":
        trace.append({"method": "GET", "target": f"/jobs/{job_id}/model"})
    trace.append({"method": "GET", "target": f"/jobs/{job_id}/log?from=0&max=1048576"})
    terminal_status: dict[str, Any] = {"status": "completed", "result": verdict}
    if verdict == "SAT":
        terminal_status.update(
            {
                "id": job_id,
                "backend": spec.ingress.backend,
                "solver_profile": spec.ingress.solver_profile,
                "project": spec.project,
                "cnf_blob_hash": spec.root_sha256,
                "producer_manifest_hash": producer_sha256,
                "producer_manifest_blob_hash": producer_sha256,
                "identity_hash": subject.expected_identity_hash(spec, producer_sha256),
                "requested_core_limit": spec.requested_core_limit,
                "timeout_s": spec.timeout_s,
                "march_timeout_s": spec.timeout_s,
                "run_epoch": 1,
                "attested_solver_processes": 1,
                "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
                "daemon_sha256": spec.ingress.daemon_sha256,
                "recovery_action": None,
                "progress": {"solver_started": True, "spawn_failure": None},
                "created_at": 1,
                "confirmed_at": 2,
                "started_at": 3,
                "completed_at": 4,
            }
        )
    unsigned = {
        "schema": subject.RECEIPT_SCHEMA,
        "attempt": 0,
        "attempt_directory": str(attempt_path),
        "journal": str(attempt_path / "attempt.jsonl"),
        "receipt_path": str(attempt_path / "solver-receipt.json"),
        "custody_seal_path": str(attempt_path / "custody-seal.json"),
        "job_id": job_id,
        "job_identity": {
            "job_id": job_id,
            "backend": "cadical",
            "solver_profile": "sat",
            "project": spec.project,
            "cnf_blob_hash": spec.root_sha256,
            "identity_hash": subject.expected_identity_hash(spec, producer_sha256),
            "num_vars": spec.variables,
            "num_clauses": spec.clauses,
            "existing": False,
            "requested_core_limit": 1,
        },
        "cnf_sha256": spec.root_sha256,
        "num_variables": spec.variables,
        "num_clauses": spec.clauses,
        "source_manifest_sha256": source_sha256,
        "producer_manifest_sha256": producer_sha256,
        "adapter_verdict": verdict,
        "adapter_returncode": 10 if verdict == "SAT" else 20,
        "status_classification": subject.ATTESTED_SOLVER_RESULT,
        "certificate_blocker": subject.CERTIFICATE_BLOCKER,
        "legacy_drat_proof_path_written": False,
        "proof_endpoint_called": False,
        "terminal_status": terminal_status,
        "terminal_status_canonical_sha256": "2" * 64,
        "model_response_sha256": "3" * 64 if verdict == "SAT" else None,
        "endpoint_trace": trace,
    }
    receipt = {**unsigned, "receipt_sha256": subject.sha256_json(unsigned)}
    return (subject.canonical_json_bytes(receipt) + b"\n").decode()


def _install_fake_boundary(
    monkeypatch: pytest.MonkeyPatch,
    paths: subject.RunnerPaths,
    *,
    verdict: str,
) -> dict[str, Any]:
    source = b'{"source":"fixture"}'
    producer = b'{"producer":"fixture"}'
    captured: dict[str, Any] = {}
    monkeypatch.setattr(subject, "static_check", lambda _paths, _spec: _checked())
    monkeypatch.setattr(
        subject,
        "build_static_manifests",
        lambda _ingress, _spec: (source, producer),
    )
    monkeypatch.setattr(subject, "_validate_lane_checkpoint", lambda _paths: None)

    def make_runner(**kwargs: Any):
        captured.update(kwargs)

        def run(cnf: Path, timeout_s: int, proof_path: Path | None):
            captured["call"] = (cnf, timeout_s, proof_path)
            kwargs["transport"]._verification = {
                "job_id": "job-current-root-two-kalmanson-successor",
                "path": "/jobs/job-current-root-two-kalmanson-successor/blobs/fixture",
                "sha256": subject.sha256_bytes(producer),
                "bytes": len(producer),
                "verified_before_confirm": True,
            }
            return subject.StaticSolverResult(
                verdict=verdict,
                assignment=(
                    {index: True for index in range(1, 309)} if verdict == "SAT" else {}
                ),
                returncode=10 if verdict == "SAT" else 20,
                stdout=_receipt(
                    paths,
                    verdict=verdict,
                    source_sha256=subject.sha256_bytes(source),
                    producer_sha256=subject.sha256_bytes(producer),
                ),
                stderr=("" if verdict == "SAT" else "observational UNSAT only"),
            )

        return run

    monkeypatch.setattr(subject, "make_static_piqd_solver_runner", make_runner)
    sat_receipt = json.loads(
        _receipt(
            paths,
            verdict="SAT",
            source_sha256=subject.sha256_bytes(source),
            producer_sha256=subject.sha256_bytes(producer),
        )
    )
    captured["attempt_validator_calls"] = 0

    def attempt_validator(*_args: object) -> dict[str, Any]:
        captured["attempt_validator_calls"] += 1
        return {
            "receipt_sha256": sat_receipt["receipt_sha256"],
            "job_id": sat_receipt["job_id"],
            "model_response_sha256": sat_receipt["model_response_sha256"],
            "replay_variables": 308,
            "replay_clauses": 7_037_500,
        }

    captured["attempt_validator"] = attempt_validator
    return captured


def test_production_static_check_pins_manifests_timeout_and_core_limit() -> None:
    report = subject.static_check()

    assert report["status"] == "PASS"
    assert report["source_manifest_sha256"] == subject.SOURCE_MANIFEST_SHA256
    assert report["producer_manifest_sha256"] == subject.PRODUCER_MANIFEST_SHA256
    assert report["timeout_s"] == 3_600
    assert report["requested_core_limit"] == 1
    assert report["maximum_requested_core_limit"] == 12


def test_production_run_manifest_uses_registered_fixed_policy_layout() -> None:
    manifest = subject._run_manifest_object(
        subject.PRODUCTION_RUNNER_PATHS,
        subject.PRODUCTION_RUNNER_SPEC,
        created_utc="2026-08-16T00:00:00Z",
    )

    assert subject.RUN_ROOT == (
        subject.ROOT
        / "scratch/runs/exact17-current-root-two-kalmanson-successor-piqd/successor-v1"
    )
    assert manifest["schema"] == "worktree-run-manifest/v1"
    assert manifest["root"] == (
        "scratch/runs/exact17-current-root-two-kalmanson-successor-piqd/successor-v1"
    )
    assert manifest["output_classes"] == ["artifacts", "events", "tmp"]
    assert manifest["input_digests"][
        "scratch/exact17-current-root-two-kalmanson-successor-package-v2/"
        "exact17-current-root-two-kalmanson-successor.cnf"
    ] == ("c2d5a4472eea783152919078da45083ad31835a407a75e22150bf2eae63cd3e8")
    unsigned = {
        key: value for key, value in manifest.items() if key != "manifest_sha256"
    }
    assert manifest["manifest_sha256"] == subject.sha256_json(unsigned)


def test_lane_checkpoint_must_register_exact_successor_run_root(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    unsigned = {
        "schema": "worktree-lane-checkpoint/v1",
        "lane_id": subject.LANE_ID,
        "owner": subject.RUN_OWNER,
        "base_head": subject.RUN_BASE_HEAD,
        "created_utc": "2026-08-16T00:00:00Z",
        "owned_paths": sorted(subject.OWNED_PATHS),
        "durable_paths": [],
        "generated_roots": [
            (
                "scratch/runs/exact17-current-root-two-kalmanson-successor-piqd/"
                "successor-v1"
            )
        ],
    }
    checkpoint = {**unsigned, "manifest_sha256": subject.sha256_json(unsigned)}
    checkpoint_path = tmp_path / "checkpoint.json"
    checkpoint_path.write_bytes(subject.canonical_json_bytes(checkpoint) + b"\n")
    monkeypatch.setattr(subject, "CHECKPOINT_PATH", checkpoint_path)

    subject._validate_lane_checkpoint(subject.PRODUCTION_RUNNER_PATHS)
    checkpoint["generated_roots"] = []
    changed = {
        key: value for key, value in checkpoint.items() if key != "manifest_sha256"
    }
    checkpoint["manifest_sha256"] = subject.sha256_json(changed)
    checkpoint_path.write_bytes(subject.canonical_json_bytes(checkpoint) + b"\n")
    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match="does not register",
    ):
        subject._validate_lane_checkpoint(subject.PRODUCTION_RUNNER_PATHS)


def test_live_identity_fetches_version_and_solver_registry() -> None:
    spec = subject.PRODUCTION_RUNNER_SPEC
    daemon = {
        "name": "piqd",
        "version": "0.1.0",
        "protocol_version": spec.ingress.daemon_protocol_version,
        "sha256": spec.ingress.daemon_sha256,
    }
    solver = {
        "name": spec.ingress.solver_name,
        "sha256": spec.ingress.solver_sha256,
        "solver_signature": spec.ingress.solver_signature,
        "protocol_version": spec.ingress.daemon_protocol_version,
        "solver": "cadical",
        "lane": "sat",
        "usable": True,
    }
    calls: list[str] = []

    def fetch(_base_url: str, target: str) -> dict[str, Any]:
        calls.append(target)
        return (
            {"daemon": daemon}
            if target == "/version"
            else {"daemon": daemon, "solvers": [solver]}
        )

    identity = subject.live_identity("http://127.0.0.1:7272", fetch_json=fetch)

    assert calls == ["/version", "/solvers"]
    assert identity["version"]["daemon"] == daemon
    assert identity["solver"] == solver


def test_live_identity_rejects_daemon_drift() -> None:
    def fetch(_base_url: str, _target: str) -> dict[str, Any]:
        return {"daemon": {"sha256": "0" * 64}}

    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match="daemon identity drifted",
    ):
        subject.live_identity("http://127.0.0.1:7272", fetch_json=fetch)


def test_manifest_transport_checks_returned_and_retrieved_bytes_before_confirm() -> (
    None
):
    producer = b'{"producer":"bound"}'
    digest = subject.sha256_bytes(producer)
    identity = subject.expected_identity_hash(subject.PRODUCTION_RUNNER_SPEC, digest)
    calls: list[tuple[str, str]] = []

    def upstream(
        method: str,
        url: str,
        _body: object,
        _headers: object,
    ) -> subject.HttpResponse:
        target = urllib.parse.urlsplit(url).path
        calls.append((method, target))
        if target.endswith("/jobs/prepare-cnf"):
            body = subject.canonical_json_bytes(
                {
                    "job_id": "job-bound",
                    "producer_manifest_hash": digest,
                    "producer_manifest_blob_hash": digest,
                    "cnf_blob_hash": "c" * 64,
                    "identity_hash": identity,
                    "num_vars": 308,
                    "num_clauses": 7_037_500,
                    "existing": False,
                }
            )
            return subject.HttpResponse(200, body, {})
        if "/blobs/" in target:
            return subject.HttpResponse(200, producer, {})
        return subject.HttpResponse(200, b'{"status":"confirmed"}', {})

    transport = subject._ManifestVerifyingTransport(
        upstream,
        producer,
        expected_cnf_sha256="c" * 64,
        expected_identity_sha256=identity,
        expected_variables=308,
        expected_clauses=7_037_500,
    )
    transport(
        "POST",
        "http://127.0.0.1:7272/jobs/prepare-cnf",
        b"request",
        {},
    )
    transport(
        "POST",
        "http://127.0.0.1:7272/jobs/confirm?job_id=job-bound",
        None,
        {},
    )

    assert calls == [
        ("POST", "/jobs/prepare-cnf"),
        ("GET", f"/jobs/job-bound/blobs/{digest}"),
        ("POST", "/jobs/confirm"),
    ]
    assert transport.verification == {
        "job_id": "job-bound",
        "path": f"/jobs/job-bound/blobs/{digest}",
        "sha256": digest,
        "bytes": len(producer),
        "verified_before_confirm": True,
    }


def test_manifest_transport_rejects_substituted_remote_bytes_before_confirm() -> None:
    producer = b'{"producer":"bound"}'
    digest = subject.sha256_bytes(producer)
    identity = subject.expected_identity_hash(subject.PRODUCTION_RUNNER_SPEC, digest)
    calls: list[tuple[str, str]] = []

    def upstream(
        method: str,
        url: str,
        _body: object,
        _headers: object,
    ) -> subject.HttpResponse:
        target = urllib.parse.urlsplit(url).path
        calls.append((method, target))
        if target.endswith("/jobs/prepare-cnf"):
            body = subject.canonical_json_bytes(
                {
                    "job_id": "job-bound",
                    "producer_manifest_hash": digest,
                    "producer_manifest_blob_hash": digest,
                    "cnf_blob_hash": "c" * 64,
                    "identity_hash": identity,
                    "num_vars": 308,
                    "num_clauses": 7_037_500,
                    "existing": False,
                }
            )
            return subject.HttpResponse(200, body, {})
        if "/blobs/" in target:
            return subject.HttpResponse(200, b"substituted", {})
        raise AssertionError(
            "confirm must not be forwarded after manifest substitution"
        )

    transport = subject._ManifestVerifyingTransport(
        upstream,
        producer,
        expected_cnf_sha256="c" * 64,
        expected_identity_sha256=identity,
        expected_variables=308,
        expected_clauses=7_037_500,
    )
    transport(
        "POST",
        "http://127.0.0.1:7272/jobs/prepare-cnf",
        b"request",
        {},
    )
    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError, match="bytes drifted"
    ):
        transport(
            "POST",
            "http://127.0.0.1:7272/jobs/confirm?job_id=job-bound",
            None,
            {},
        )
    assert all(target != "/jobs/confirm" for _method, target in calls)


def test_manifest_transport_rejects_existing_job_before_confirm() -> None:
    producer = b'{"producer":"bound"}'
    digest = subject.sha256_bytes(producer)
    identity = subject.expected_identity_hash(subject.PRODUCTION_RUNNER_SPEC, digest)
    calls: list[tuple[str, str]] = []

    def upstream(
        method: str,
        url: str,
        _body: object,
        _headers: object,
    ) -> subject.HttpResponse:
        target = urllib.parse.urlsplit(url).path
        calls.append((method, target))
        if target.endswith("/jobs/prepare-cnf"):
            body = subject.canonical_json_bytes(
                {
                    "job_id": "job-existing",
                    "producer_manifest_hash": digest,
                    "producer_manifest_blob_hash": digest,
                    "cnf_blob_hash": "c" * 64,
                    "identity_hash": identity,
                    "num_vars": 308,
                    "num_clauses": 7_037_500,
                    "existing": True,
                }
            )
            return subject.HttpResponse(200, body, {})
        raise AssertionError("no request may follow an existing-job response")

    transport = subject._ManifestVerifyingTransport(
        upstream,
        producer,
        expected_cnf_sha256="c" * 64,
        expected_identity_sha256=identity,
        expected_variables=308,
        expected_clauses=7_037_500,
    )
    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match="reused an existing job",
    ):
        transport(
            "POST",
            "http://127.0.0.1:7272/jobs/prepare-cnf",
            b"request",
            {},
        )
    assert calls == [("POST", "/jobs/prepare-cnf")]


def test_sat_launch_uses_one_attempt_policy_and_seals_terminal(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "runs" / "production")
    captured = _install_fake_boundary(monkeypatch, paths, verdict="SAT")
    identities: list[str] = []

    result = subject._start(
        paths=paths,
        transport=object(),  # type: ignore[arg-type]
        identity_fetcher=lambda base_url, _spec: (
            identities.append(base_url) or {"live": True}
        ),
        sleep=lambda _seconds: None,
        max_polls=subject.MAX_POLLS,
        poll_interval_s=subject.POLL_INTERVAL_S,
        attempt_validator=captured["attempt_validator"],
    )

    policy = captured["policy"]
    assert policy.max_prepare_attempts == 1
    assert policy.max_confirm_attempts == 1
    assert policy.max_result_attempts == 1
    assert policy.max_polls == subject.MAX_POLLS
    assert policy.solver_timeout_s == 3_600
    assert policy.requested_core_limit == 1
    assert captured["max_cnf_bytes"] >= 333_050_318
    assert captured["call"] == (paths.ingress.child, 3_600, None)
    assert identities == ["http://127.0.0.1:7272"]
    assert result["status"] == "PASS"
    assert result["certification"] == "SAT_MODEL_INDEPENDENTLY_REPLAYED"
    assert captured["attempt_validator_calls"] == 1
    assert paths.launch.is_file()
    assert paths.terminal.is_file()
    assert paths.lock.is_file()
    assert paths.run_manifest.is_file()
    assert {path.name for path in paths.run_root.iterdir()} == {
        "run_manifest.json",
        "artifacts",
        "events",
        "tmp",
    }
    manifest = json.loads(paths.run_manifest.read_text(encoding="utf-8"))
    assert manifest["schema"] == subject.RUN_MANIFEST_SCHEMA
    assert manifest["lane_id"] == subject.LANE_ID
    assert manifest["run_id"] == subject.RUN_ID
    assert manifest["output_classes"] == list(subject.RUN_OUTPUT_CLASSES)
    run_fd = subject._open_directory_nofollow(paths.run_root, create=False)
    artifacts_fd = subject._validate_run_layout(
        run_fd, paths, subject.PRODUCTION_RUNNER_SPEC
    )
    os.close(artifacts_fd)
    os.close(run_fd)


def test_unsat_launch_is_explicitly_uncertified(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "runs" / "production-unsat")
    _install_fake_boundary(monkeypatch, paths, verdict="UNSAT")

    result = subject.start(
        paths=paths,
        identity_fetcher=lambda _base_url, _spec: {"live": True},
        sleep=lambda _seconds: None,
        max_polls=subject.MAX_POLLS,
        poll_interval_s=subject.POLL_INTERVAL_S,
    )

    assert result["status"] == "UNSAT_UNCERTIFIED"
    assert result["certification"] == "UNSAT_UNCERTIFIED_PROOF_REPLAY_REQUIRED"
    assert "proof" in result["next_gate"]


def test_sat_launch_refuses_unbound_sealed_replay_evidence(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "runs" / "bad-evidence")
    _install_fake_boundary(monkeypatch, paths, verdict="SAT")

    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match="disagrees with sealed offline replay evidence",
    ):
        subject._start(
            paths=paths,
            identity_fetcher=lambda _base_url, _spec: {"live": True},
            sleep=lambda _seconds: None,
            attempt_validator=lambda *_args: {
                "receipt_sha256": "0" * 64,
                "job_id": "job-current-root-two-kalmanson-successor",
                "model_response_sha256": "3" * 64,
                "replay_variables": 308,
                "replay_clauses": 7_037_500,
            },
        )

    assert not paths.terminal.exists()


def test_duplicate_reentry_fails_before_a_second_identity_fetch(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "runs" / "production")
    captured = _install_fake_boundary(monkeypatch, paths, verdict="SAT")
    calls = 0

    def identity(_base_url: str, _spec: subject.RunnerSpec) -> dict[str, Any]:
        nonlocal calls
        calls += 1
        return {"live": True}

    subject._start(
        paths=paths,
        identity_fetcher=identity,
        sleep=lambda _seconds: None,
        attempt_validator=captured["attempt_validator"],
    )
    with pytest.raises(FileExistsError, match="duplicate"):
        subject.start(
            paths=paths, identity_fetcher=identity, sleep=lambda _seconds: None
        )
    assert calls == 1


def test_duplicate_prepare_trace_is_rejected(tmp_path: Path) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "run")
    source_sha256 = "4" * 64
    producer_sha256 = "5" * 64
    raw = _receipt(
        paths,
        verdict="SAT",
        source_sha256=source_sha256,
        producer_sha256=producer_sha256,
    )
    receipt = json.loads(raw)
    receipt["endpoint_trace"].append({"method": "POST", "target": "/jobs/prepare-cnf"})
    unsigned = {key: value for key, value in receipt.items() if key != "receipt_sha256"}
    receipt["receipt_sha256"] = subject.sha256_json(unsigned)
    result = subject.StaticSolverResult(
        verdict="SAT",
        assignment={index: True for index in range(1, 309)},
        returncode=10,
    )

    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match="prepare exactly once",
    ):
        subject._validate_terminal_receipt(
            receipt,
            result,
            paths,
            subject.PRODUCTION_RUNNER_SPEC,
            source_sha256,
            producer_sha256,
        )


@pytest.mark.parametrize(
    ("target_suffix", "message"),
    (
        (
            "confirm?job_id=job-current-root-two-kalmanson-successor",
            "confirm exactly once",
        ),
        ("job-current-root-two-kalmanson-successor/model", "model endpoint count"),
    ),
)
def test_duplicate_confirm_and_model_traces_are_rejected(
    tmp_path: Path, target_suffix: str, message: str
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "run")
    source_sha256 = "4" * 64
    producer_sha256 = "5" * 64
    receipt = json.loads(
        _receipt(
            paths,
            verdict="SAT",
            source_sha256=source_sha256,
            producer_sha256=producer_sha256,
        )
    )
    receipt["endpoint_trace"].append(
        {
            "method": "POST" if target_suffix.startswith("confirm") else "GET",
            "target": f"/jobs/{target_suffix}",
        }
    )
    result = subject.StaticSolverResult(
        verdict="SAT",
        assignment={index: True for index in range(1, 309)},
        returncode=10,
    )

    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError, match=message
    ):
        subject._validate_terminal_receipt(
            receipt,
            result,
            paths,
            subject.PRODUCTION_RUNNER_SPEC,
            source_sha256,
            producer_sha256,
        )


@pytest.mark.parametrize("status_polls", (0, subject.MAX_POLLS + 1))
def test_status_poll_count_must_be_nonzero_and_bounded(
    tmp_path: Path, status_polls: int
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "run")
    source_sha256 = "4" * 64
    producer_sha256 = "5" * 64
    receipt = json.loads(
        _receipt(
            paths,
            verdict="SAT",
            source_sha256=source_sha256,
            producer_sha256=producer_sha256,
            status_polls=status_polls,
        )
    )
    result = subject.StaticSolverResult(
        verdict="SAT",
        assignment={index: True for index in range(1, 309)},
        returncode=10,
    )

    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match="status-poll count",
    ):
        subject._validate_terminal_receipt(
            receipt,
            result,
            paths,
            subject.PRODUCTION_RUNNER_SPEC,
            source_sha256,
            producer_sha256,
        )


def test_432_status_polls_are_accepted(tmp_path: Path) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "run")
    source_sha256 = "4" * 64
    producer_sha256 = "5" * 64
    receipt = json.loads(
        _receipt(
            paths,
            verdict="SAT",
            source_sha256=source_sha256,
            producer_sha256=producer_sha256,
            status_polls=432,
        )
    )
    result = subject.StaticSolverResult(
        verdict="SAT",
        assignment={index: True for index in range(1, 309)},
        returncode=10,
    )

    subject._validate_terminal_receipt(
        receipt,
        result,
        paths,
        subject.PRODUCTION_RUNNER_SPEC,
        source_sha256,
        producer_sha256,
    )


@pytest.mark.parametrize(
    ("field", "value"),
    (("run_epoch", 2), ("attested_solver_processes", 2)),
)
def test_terminal_sat_rejects_non_single_execution(
    tmp_path: Path, field: str, value: int
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "run")
    source_sha256 = "4" * 64
    producer_sha256 = "5" * 64
    receipt = json.loads(
        _receipt(
            paths,
            verdict="SAT",
            source_sha256=source_sha256,
            producer_sha256=producer_sha256,
        )
    )
    receipt["terminal_status"][field] = value
    result = subject.StaticSolverResult(
        verdict="SAT",
        assignment={index: True for index in range(1, 309)},
        returncode=10,
    )

    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match=f"terminal SAT status {field} drifted",
    ):
        subject._validate_terminal_receipt(
            receipt,
            result,
            paths,
            subject.PRODUCTION_RUNNER_SPEC,
            source_sha256,
            producer_sha256,
        )


def test_receipt_paths_must_name_the_exact_governed_attempt(tmp_path: Path) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "run")
    source_sha256 = "4" * 64
    producer_sha256 = "5" * 64
    receipt = json.loads(
        _receipt(
            paths,
            verdict="SAT",
            source_sha256=source_sha256,
            producer_sha256=producer_sha256,
        )
    )
    receipt["receipt_path"] = str(paths.journal_root / "../forged-receipt.json")
    result = subject.StaticSolverResult(
        verdict="SAT",
        assignment={index: True for index in range(1, 309)},
        returncode=10,
    )

    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match="escaped or renamed",
    ):
        subject._validate_terminal_receipt(
            receipt,
            result,
            paths,
            subject.PRODUCTION_RUNNER_SPEC,
            source_sha256,
            producer_sha256,
        )


def test_cnf_retrieval_must_precede_confirmation(tmp_path: Path) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "run")
    source_sha256 = "4" * 64
    producer_sha256 = "5" * 64
    receipt = json.loads(
        _receipt(
            paths,
            verdict="SAT",
            source_sha256=source_sha256,
            producer_sha256=producer_sha256,
        )
    )
    receipt["endpoint_trace"][1], receipt["endpoint_trace"][2] = (
        receipt["endpoint_trace"][2],
        receipt["endpoint_trace"][1],
    )
    result = subject.StaticSolverResult(
        verdict="SAT",
        assignment={index: True for index in range(1, 309)},
        returncode=10,
    )

    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match="reordered",
    ):
        subject._validate_terminal_receipt(
            receipt,
            result,
            paths,
            subject.PRODUCTION_RUNNER_SPEC,
            source_sha256,
            producer_sha256,
        )


def test_unsat_receipt_rejects_any_model_retrieval(tmp_path: Path) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "run")
    source_sha256 = "4" * 64
    producer_sha256 = "5" * 64
    receipt = json.loads(
        _receipt(
            paths,
            verdict="UNSAT",
            source_sha256=source_sha256,
            producer_sha256=producer_sha256,
        )
    )
    receipt["endpoint_trace"].append(
        {
            "method": "GET",
            "target": "/jobs/job-current-root-two-kalmanson-successor/model",
        }
    )
    result = subject.StaticSolverResult(verdict="UNSAT", assignment={}, returncode=20)

    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match="UNSAT unexpectedly retrieved a model",
    ):
        subject._validate_terminal_receipt(
            receipt,
            result,
            paths,
            subject.PRODUCTION_RUNNER_SPEC,
            source_sha256,
            producer_sha256,
        )


def test_mutated_embedded_seal_is_rejected() -> None:
    unsigned = {"schema": "fixture/v1", "value": 7}
    seal = {**unsigned, "seal_sha256": subject.sha256_json(unsigned)}
    seal["value"] = 8

    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError, match="seal hash drifted"
    ):
        subject._require_embedded_hash(seal, "seal_sha256", "fixture seal")


@pytest.mark.parametrize("artifact_kind", ("model", "CNF"))
def test_mutated_content_addressed_model_and_cnf_are_rejected(
    tmp_path: Path, artifact_kind: str
) -> None:
    artifact_root = tmp_path / "artifacts"
    artifact_root.mkdir()
    original = f"{artifact_kind}-original".encode()
    digest = hashlib.sha256(original).hexdigest()
    artifact = artifact_root / digest
    artifact.write_bytes(original)
    info = artifact.stat()
    inventory = [
        {
            "sha256": digest,
            "size": len(original),
            "device": info.st_dev,
            "inode": info.st_ino,
        }
    ]
    artifact.write_bytes(f"{artifact_kind}-mutated!".encode())
    directory_fd = os.open(artifact_root, os.O_RDONLY | os.O_DIRECTORY)
    try:
        with pytest.raises(
            subject.CurrentRootTwoKalmansonSuccessorRunnerError,
            match="filename/hash mismatch",
        ):
            subject._validate_artifact_inventory(directory_fd, inventory)
    finally:
        os.close(directory_fd)


def test_offline_finalization_never_contacts_piqd(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "run")
    paths.run_root.mkdir()
    paths.artifacts_root.mkdir()
    paths.events_root.mkdir()
    paths.tmp_root.mkdir()
    paths.run_manifest.write_text("{}\n", encoding="utf-8")
    paths.lock.write_bytes(b"")
    source = b'{"source":"offline"}'
    producer = b'{"producer":"offline"}'
    monkeypatch.setattr(
        subject, "build_static_manifests", lambda _ingress, _spec: (source, producer)
    )

    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("offline finalization attempted PIQD I/O")

    monkeypatch.setattr(subject, "_http_json", forbidden)
    monkeypatch.setattr(subject, "stdlib_http_transport", forbidden)
    monkeypatch.setattr(subject, "make_static_piqd_solver_runner", forbidden)
    monkeypatch.setattr(
        subject,
        "_validate_run_layout",
        lambda _run_fd, _paths, _spec: os.open(
            paths.artifacts_root, os.O_RDONLY | os.O_DIRECTORY
        ),
    )
    evidence = {
        "launch_sha256": "1" * 64,
        "job_id": "job-offline",
        "receipt_path": str(tmp_path / "receipt.json"),
        "receipt_sha256": "2" * 64,
        "custody_seal_path": str(tmp_path / "custody.json"),
        "custody_seal_sha256": "3" * 64,
        "model_response_sha256": "4" * 64,
        "solver_log_sha256": "5" * 64,
        "terminal_status_canonical_sha256": "6" * 64,
        "poll_count": 432,
        "journal_record_count": 436,
        "run_epoch": 1,
        "attested_solver_processes": 1,
        "producer_manifest_sha256": subject.sha256_bytes(producer),
        "producer_manifest_bytes": len(producer),
        "replay_variables": 308,
        "replay_clauses": 7_037_500,
    }
    result = subject._finalize_existing(
        paths=paths,
        static_checker=lambda _paths, _spec: {"status": "PASS", "ingress": {}},
        attempt_validator=lambda *_args: evidence,
    )

    assert result["status"] == "PASS"
    assert result["offline_finalization"]["network_requests"] == 0
    assert paths.terminal.is_file()
    with pytest.raises(FileExistsError, match="already exists"):
        subject._finalize_existing(
            paths=paths,
            static_checker=lambda _paths, _spec: {"status": "PASS", "ingress": {}},
            attempt_validator=lambda *_args: evidence,
        )


def test_public_entrypoints_do_not_allow_validator_substitution() -> None:
    assert "attempt_validator" not in inspect.signature(subject.start).parameters
    parameters = inspect.signature(subject.finalize_existing).parameters
    assert "attempt_validator" not in parameters
    assert "static_checker" not in parameters


def test_custody_reads_refuse_symlinks_and_multiply_linked_files(
    tmp_path: Path,
) -> None:
    custody = tmp_path / "custody"
    custody.mkdir()
    target = custody / "target"
    target.write_bytes(b"sealed")
    (custody / "symlink").symlink_to(target)
    os.link(target, custody / "hardlink")
    directory_fd = os.open(custody, os.O_RDONLY | os.O_DIRECTORY)
    try:
        with pytest.raises(subject.CurrentRootTwoKalmansonSuccessorRunnerError):
            subject._read_regular_at(directory_fd, "symlink", maximum_bytes=1024)
        with pytest.raises(
            subject.CurrentRootTwoKalmansonSuccessorRunnerError, match="substituted"
        ):
            subject._read_regular_at(directory_fd, "target", maximum_bytes=1024)
    finally:
        os.close(directory_fd)


def test_runner_rejects_any_core_request_other_than_one_and_all_requests_over_twelve() -> (
    None
):
    with pytest.raises(ValueError, match="exactly one core"):
        replace(subject.PRODUCTION_RUNNER_SPEC, requested_core_limit=2)
    with pytest.raises(ValueError, match="1..12"):
        replace(
            subject.PRODUCTION_RUNNER_SPEC,
            requested_core_limit=13,
            maximum_requested_core_limit=13,
        )


def test_start_rejects_poll_policy_override_before_launch(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(
        subject,
        "static_check",
        lambda *_args: (_ for _ in ()).throw(
            AssertionError("static check must not run after policy drift")
        ),
    )
    with pytest.raises(
        subject.CurrentRootTwoKalmansonSuccessorRunnerError,
        match="polling policy is fixed",
    ):
        subject._start(
            paths=subject.RunnerPaths(run_root=tmp_path / "run"),
            max_polls=432,
            attempt_validator=lambda *_args: {},
        )
