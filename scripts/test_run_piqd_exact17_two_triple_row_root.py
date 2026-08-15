"""Focused lifecycle tests for the two-triple-row one-shot PIQD runner."""

from __future__ import annotations

import json
import urllib.parse
from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest
import run_piqd_exact17_two_triple_row_root as subject


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
                "bytes": 3_813,
                "schema": "p97-exact17-two-triple-row-immutable-export-receipt/v2",
            },
        },
    }


def _receipt(
    paths: subject.RunnerPaths,
    *,
    verdict: str,
    source_sha256: str,
    producer_sha256: str,
) -> str:
    spec = subject.PRODUCTION_RUNNER_SPEC
    job_id = "job-two-triple-row"
    trace = [
        {"method": "POST", "target": "/jobs/prepare-cnf"},
        {"method": "GET", "target": f"/jobs/{job_id}/cnf"},
        {"method": "POST", "target": f"/jobs/confirm?job_id={job_id}"},
        {"method": "GET", "target": f"/jobs/{job_id}"},
    ]
    if verdict == "SAT":
        trace.append({"method": "GET", "target": f"/jobs/{job_id}/model"})
    trace.append({"method": "GET", "target": f"/jobs/{job_id}/log?from=0&max=1048576"})
    unsigned = {
        "schema": subject.RECEIPT_SCHEMA,
        "receipt_path": str(
            paths.journal_root / "attempt-00000000-fixture" / "solver-receipt.json"
        ),
        "custody_seal_path": str(
            paths.journal_root / "attempt-00000000-fixture" / "custody-seal.json"
        ),
        "job_id": job_id,
        "job_identity": {
            "job_id": job_id,
            "backend": "cadical",
            "solver_profile": "sat",
            "project": spec.project,
            "cnf_blob_hash": spec.root_sha256,
            "identity_hash": "1" * 64,
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
        "terminal_status": {"status": "completed", "result": verdict},
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

    def make_runner(**kwargs: Any):
        captured.update(kwargs)

        def run(cnf: Path, timeout_s: int, proof_path: Path | None):
            captured["call"] = (cnf, timeout_s, proof_path)
            kwargs["transport"]._verification = {
                "job_id": "job-two-triple-row",
                "path": "/jobs/job-two-triple-row/blobs/fixture",
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
    return captured


def test_production_static_check_pins_manifests_timeout_and_core_limit() -> None:
    report = subject.static_check()

    assert report["status"] == "PASS"
    assert report["source_manifest_sha256"] == subject.SOURCE_MANIFEST_SHA256
    assert report["producer_manifest_sha256"] == subject.PRODUCER_MANIFEST_SHA256
    assert report["timeout_s"] == 3_600
    assert report["requested_core_limit"] == 1
    assert report["maximum_requested_core_limit"] == 12


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
        subject.TwoTripleRowRunnerError, match="daemon identity drifted"
    ):
        subject.live_identity("http://127.0.0.1:7272", fetch_json=fetch)


def test_manifest_transport_checks_returned_and_retrieved_bytes_before_confirm() -> (
    None
):
    producer = b'{"producer":"bound"}'
    digest = subject.sha256_bytes(producer)
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
                    "num_vars": 308,
                    "num_clauses": 7_036_960,
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
        expected_variables=308,
        expected_clauses=7_036_960,
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
                    "num_vars": 308,
                    "num_clauses": 7_036_960,
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
        expected_variables=308,
        expected_clauses=7_036_960,
    )
    transport(
        "POST",
        "http://127.0.0.1:7272/jobs/prepare-cnf",
        b"request",
        {},
    )
    with pytest.raises(subject.TwoTripleRowRunnerError, match="bytes drifted"):
        transport(
            "POST",
            "http://127.0.0.1:7272/jobs/confirm?job_id=job-bound",
            None,
            {},
        )
    assert all(target != "/jobs/confirm" for _method, target in calls)


def test_sat_launch_uses_one_attempt_policy_and_seals_terminal(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "runs" / "production")
    captured = _install_fake_boundary(monkeypatch, paths, verdict="SAT")
    identities: list[str] = []

    result = subject.start(
        paths=paths,
        transport=object(),  # type: ignore[arg-type]
        identity_fetcher=lambda base_url, _spec: (
            identities.append(base_url) or {"live": True}
        ),
        sleep=lambda _seconds: None,
        max_polls=7,
        poll_interval_s=0,
    )

    policy = captured["policy"]
    assert policy.max_prepare_attempts == 1
    assert policy.max_confirm_attempts == 1
    assert policy.max_result_attempts == 1
    assert policy.solver_timeout_s == 3_600
    assert policy.requested_core_limit == 1
    assert captured["max_cnf_bytes"] >= 333_016_856
    assert captured["call"] == (paths.ingress.child, 3_600, None)
    assert identities == ["http://127.0.0.1:7272"]
    assert result["status"] == "PASS"
    assert result["certification"] == "SAT_MODEL_INDEPENDENTLY_REPLAYED"
    assert paths.launch.is_file()
    assert paths.terminal.is_file()
    assert paths.lock.is_file()


def test_unsat_launch_is_explicitly_uncertified(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "runs" / "production-unsat")
    _install_fake_boundary(monkeypatch, paths, verdict="UNSAT")

    result = subject.start(
        paths=paths,
        identity_fetcher=lambda _base_url, _spec: {"live": True},
        sleep=lambda _seconds: None,
        max_polls=1,
        poll_interval_s=0,
    )

    assert result["status"] == "UNSAT_UNCERTIFIED"
    assert result["certification"] == "UNSAT_UNCERTIFIED_PROOF_REPLAY_REQUIRED"
    assert "proof" in result["next_gate"]


def test_duplicate_reentry_fails_before_a_second_identity_fetch(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = subject.RunnerPaths(run_root=tmp_path / "runs" / "production")
    _install_fake_boundary(monkeypatch, paths, verdict="SAT")
    calls = 0

    def identity(_base_url: str, _spec: subject.RunnerSpec) -> dict[str, Any]:
        nonlocal calls
        calls += 1
        return {"live": True}

    subject.start(paths=paths, identity_fetcher=identity, sleep=lambda _seconds: None)
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

    with pytest.raises(subject.TwoTripleRowRunnerError, match="prepare exactly once"):
        subject._validate_terminal_receipt(
            receipt,
            result,
            paths,
            subject.PRODUCTION_RUNNER_SPEC,
            source_sha256,
            producer_sha256,
        )


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
