from __future__ import annotations

import hashlib
import json
import os
import uuid
from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest

from census.card_head import (
    exactfive_hard_source_swap_adaptive_equality_core_piqd as subject,
)


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


class PublishingFakeRunner:
    def __init__(self, verdicts: list[str]) -> None:
        self.verdicts = list(verdicts)
        self.calls: list[dict[str, Any]] = []

    def execute(self, script: bytes, **kwargs: Any) -> object:
        case = self.verdicts.pop(0)
        self.calls.append({"case": case, "script": script, **kwargs})
        backend = subject.singular_backend
        marker = subject.equality_probe
        stdout = {
            "UNIT": f"{marker.VERDICT_BEGIN}\n0\n{marker.VERDICT_END}\n".encode(),
            "NONUNIT": f"{marker.VERDICT_BEGIN}\n1\n{marker.VERDICT_END}\n".encode(),
            "MALFORMED": b"0\n",
            "EXTRA_STDOUT": f"diagnostic\n{marker.VERDICT_BEGIN}\n0\n{marker.VERDICT_END}\n".encode(),
            "DIAGNOSTIC": f"{marker.VERDICT_BEGIN}\n0\n{marker.VERDICT_END}\n".encode(),
            "TIMED_OUT": b"",
            "ERRORED": b"",
            "TRUNCATED": f"{marker.VERDICT_BEGIN}\n0\n{marker.VERDICT_END}\n".encode(),
        }[case]
        stderr = b"Singular warning\n" if case == "DIAGNOSTIC" else b""
        run_status = case if case in {"TIMED_OUT", "ERRORED"} else "RAN"
        exit_code = 124 if case == "TIMED_OUT" else 9 if case == "ERRORED" else 0
        context = kwargs["source_context"]
        context_hash = _sha(subject._canonical(context))
        effective_source = f"{kwargs['source']}#source_context_sha256={context_hash}"
        request = {
            "script_blob_hash": _sha(script),
            "source": effective_source,
            "profile": backend.PROFILE,
            "timeout_s": kwargs["timeout_s"],
            "project": kwargs["project"],
            "request_id": kwargs["request_id"],
        }
        run_id = str(uuid.UUID(int=len(self.calls), version=4))
        receipt: dict[str, Any] = {
            "id": run_id,
            "project": request["project"],
            "request_id": request["request_id"],
            "request_sha256": backend._request_sha256(
                request["project"],
                request["script_blob_hash"],
                request["source"],
                request["profile"],
                request["timeout_s"],
            ),
            "script_blob_hash": request["script_blob_hash"],
            "source": request["source"],
            "profile": request["profile"],
            "timeout_s": request["timeout_s"],
            "state": "finished",
            "run_status": run_status,
            "exit_code": exit_code,
            "argv": [
                *backend.ARGV_PREFIX,
                f"/var/lib/piqd/singular/{run_id}/script.sing",
            ],
            "binary_path": "/opt/homebrew/bin/Singular",
            "binary_sha256": "1" * 64,
            "env_sha256": "2" * 64,
            "stdout_blob_hash": _sha(stdout),
            "stderr_blob_hash": _sha(stderr),
            "stdout_truncated": case == "TRUNCATED",
            "stderr_truncated": False,
            "attested_processes": 1,
            "attestation_basis": backend.STARTED_ATTESTATION,
            "result_sha256": None,
            "wall_ms": 5,
            "created_at": 10,
            "started_at": 11,
            "finished_at": 12,
        }
        receipt["result_sha256"] = backend._result_sha256(receipt)
        return backend._publish(
            kwargs["output_directory"],
            script,
            stdout,
            stderr,
            kwargs["source"],
            effective_source,
            context,
            context_hash,
            request,
            False,
            receipt,
        )


@pytest.fixture(scope="module")
def prior() -> dict[str, Any]:
    return subject.revalidate_prior_adaptive_run()


def _run(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    prior: dict[str, Any],
    verdicts: list[str],
) -> tuple[dict[str, Any], PublishingFakeRunner]:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    fake = PublishingFakeRunner(verdicts)
    made: list[tuple[tuple[Any, ...], dict[str, Any]]] = []

    def factory(*args: Any, **kwargs: Any) -> PublishingFakeRunner:
        made.append((args, kwargs))
        return fake

    result = subject.run_diagnostic(
        prior_revalidator=lambda: prior,
        runner_factory=factory,
    )
    assert len(made) == 1
    assert made[0][1] == {"max_poll_s": 1200.0}
    return result, fake


def test_prior_adaptive_replay_binds_exact_completed_files(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    class ForbiddenTransport:
        def __init__(self, *_args: object, **_kwargs: object) -> None:
            raise AssertionError("completed predecessor replay constructed transport")

    monkeypatch.setattr(subject.adaptive.adapter, "UrllibPiqdTransport", ForbiddenTransport)
    prior = subject.revalidate_prior_adaptive_run()
    assert prior["completed_no_transport_replay"] is True
    assert prior["terminal_sha256"] == "e783b4a715dffaf73079381f3d5e978b0cdb7de0c2c1044a1424b4a5217f1af4"
    assert prior["files"]["run_manifest"]["sha256"] == "f170fa1bce24fa7c297ac957f2dff2d9c91c97f4602b26ee3eeb3027851bd327"
    assert prior["files"]["launch"]["sha256"] == "0703b9daace34c06fafe16c9611527f8d8da5feeb774e2bb6378dca7be9065dc"
    assert prior["files"]["terminal"]["sha256"] == "8e2934c3605bd46836732568bd74d6e598b3d8a7503c5e8dfc37070f93413f31"
    assert prior["files"]["durable_summary"]["sha256"] == "2aabff254f6d754e03afc9c55377d9f9d59301022db94ecf696c63ce3d3c90de"


def test_replay_rejects_rehashed_summary_field_tamper(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    summary = json.loads(subject.PRIOR_SUMMARY_PATH.read_text())
    summary["fresh_orders"][0]["planar_result_sha256"] = "0" * 64
    summary["summary_sha256"] = subject.adaptive._self_hash(summary, "summary_sha256")
    path = tmp_path / "summary.json"
    path.write_text(json.dumps(summary, sort_keys=True, separators=(",", ":")) + "\n")
    monkeypatch.setattr(subject, "PRIOR_SUMMARY_PATH", path)
    original_repo_path = subject._repo_path
    monkeypatch.setattr(
        subject,
        "_repo_path",
        lambda candidate: "test-summary.json"
        if candidate == path
        else original_repo_path(candidate),
    )
    with pytest.raises(subject.EqualityCoreError, match="does not bind"):
        subject.revalidate_prior_adaptive_run()


def test_replay_reports_malformed_summary_as_controlled_error(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    summary = json.loads(subject.PRIOR_SUMMARY_PATH.read_text())
    summary["fresh_orders"] = [{}]
    summary["summary_sha256"] = subject.adaptive._self_hash(summary, "summary_sha256")
    payload = json.dumps(summary, sort_keys=True, separators=(",", ":")) + "\n"
    path = tmp_path / "summary.json"
    path.write_text(payload)
    monkeypatch.setattr(subject, "PRIOR_SUMMARY_PATH", path)
    original_repo_path = subject._repo_path
    monkeypatch.setattr(
        subject,
        "_repo_path",
        lambda candidate: "test-summary.json"
        if candidate == path
        else original_repo_path(candidate),
    )
    hashes = dict(subject.EXPECTED_PRIOR_HASHES)
    hashes["durable_summary_file"] = _sha(payload.encode())
    hashes["durable_summary_self"] = summary["summary_sha256"]
    monkeypatch.setattr(subject, "EXPECTED_PRIOR_HASHES", hashes)
    with pytest.raises(subject.EqualityCoreError, match="fresh orders are malformed"):
        subject.revalidate_prior_adaptive_run()


def test_generation_counts_order_independence_and_distinct_gauges(
    prior: dict[str, Any],
) -> None:
    queries = subject.prepare_queries(prior, timeout_s=900)
    assert [query.key for query in queries] == list(subject.QUERY_KEYS)
    left, right = queries[-2:]
    assert len(prior["classes"]) == 11
    assert len(left.variables) == len(right.variables) == 18
    assert len(left.polynomials) == len(right.polynomials) == 13
    assert left.source_context["order_independent_polynomial_template"] == right.source_context["order_independent_polynomial_template"]
    assert left.source_context["order_independent_polynomial_template_sha256"] == right.source_context["order_independent_polynomial_template_sha256"]
    assert left.source_context["anchors"] != right.source_context["anchors"]
    assert left.source_context["anchors"]["rank_zero"]["class_id"] == "c000"
    assert {left.source_context["anchors"]["rank_one"]["class_id"], right.source_context["anchors"]["rank_one"]["class_id"]} == {"c010", "c008"}
    assert [row["id"] for row in left.source_context["row_records"]] == ["T0", "K1", "K2", "L"]
    assert left.source_context["omitted"] == subject.OMITTED_LEDGER
    assert not any(subject.FALSE_CLAIMS.values())


def test_control_scripts_and_canonical_uuid_ids(prior: dict[str, Any]) -> None:
    queries = subject.prepare_queries(prior, timeout_s=37)
    expected = [
        (("z", "z-1"), "UNIT"),
        (("z^2-1",), "NONUNIT"),
        (("x^2+y^2", "x^2+y^2-1"), "UNIT"),
        (("x^2+y^2-1",), "NONUNIT"),
    ]
    for query, (polynomials, verdict) in zip(queries[:4], expected, strict=True):
        assert query.polynomials == polynomials
        assert query.expected == verdict
        assert query.script.count(subject.equality_probe.VERDICT_BEGIN) == 1
        assert query.script.count(subject.equality_probe.VERDICT_END) == 1
    for query in queries:
        parsed = uuid.UUID(query.request_id)
        assert parsed.version == 5
        assert str(parsed) == query.request_id
        assert query == subject.prepare_queries(prior, timeout_s=37)[queries.index(query)]


@pytest.mark.parametrize(
    ("targets", "status"),
    [
        (["UNIT", "UNIT"], "BOTH_GAUGES_UNIT"),
        (["NONUNIT", "NONUNIT"], "BOTH_GAUGES_NONUNIT"),
        (["UNIT", "NONUNIT"], "GAUGE_DISAGREEMENT"),
        (["MALFORMED", "UNIT"], "TARGET_INCONCLUSIVE"),
        (["TIMED_OUT", "UNIT"], "TARGET_INCONCLUSIVE"),
    ],
)
def test_statuses_and_sequential_control_first_execution(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    prior: dict[str, Any],
    targets: list[str],
    status: str,
) -> None:
    result, fake = _run(
        monkeypatch,
        tmp_path,
        prior,
        ["UNIT", "NONUNIT", "UNIT", "NONUNIT", *targets],
    )
    assert result["status"] == status
    assert [call["source_context"]["query"]["key"] for call in fake.calls] == list(subject.QUERY_KEYS)
    assert all(call["source_context"]["execution_profile"]["workers"] == 1 for call in fake.calls)
    assert all(call["source_context"]["execution_profile"]["local_fallback"] is False for call in fake.calls)


def test_control_mismatch_aborts_without_terminal(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    fake = PublishingFakeRunner(["NONUNIT"])
    with pytest.raises(subject.EqualityCoreError, match="control-unit-linear"):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: fake,
        )
    assert not (subject.RUN_ROOT / "events" / "terminal.json").exists()
    assert len(fake.calls) == 1


@pytest.mark.parametrize("case", ["DIAGNOSTIC", "EXTRA_STDOUT", "ERRORED"])
def test_target_diagnostics_and_bad_process_outcomes_are_inconclusive(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    prior: dict[str, Any],
    case: str,
) -> None:
    result, _fake = _run(
        monkeypatch,
        tmp_path,
        prior,
        ["UNIT", "NONUNIT", "UNIT", "NONUNIT", case, "UNIT"],
    )
    assert result["status"] == "TARGET_INCONCLUSIVE"
    assert result["targets"][0]["verdict"] == "ERROR"
    assert result["targets"][0]["detail"]


def test_completed_resume_instantiates_no_runner_and_replays_every_query(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    first, fake = _run(
        monkeypatch,
        tmp_path,
        prior,
        ["UNIT", "NONUNIT", "UNIT", "NONUNIT", "UNIT", "UNIT"],
    )
    calls = 0

    def replay_prior() -> dict[str, Any]:
        nonlocal calls
        calls += 1
        return prior

    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("completed resume instantiated a runner")

    second = subject.run_diagnostic(
        prior_revalidator=replay_prior,
        runner_factory=forbidden,
    )
    assert second == first
    assert calls == 1
    assert len(fake.calls) == 6


def test_completed_resume_rejects_backend_script_tamper(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    _run(
        monkeypatch,
        tmp_path,
        prior,
        ["UNIT", "NONUNIT", "UNIT", "NONUNIT", "UNIT", "UNIT"],
    )
    directory = subject.RUN_ROOT / "artifacts" / subject.TARGET_KEYS[0]
    script = directory / "script.sing"
    os.chmod(directory, 0o700)
    os.chmod(script, 0o600)
    script.write_bytes(script.read_bytes() + b"// tamper\n")
    os.chmod(script, 0o400)
    os.chmod(directory, 0o500)
    with pytest.raises(subject.EqualityCoreError, match="custody failed"):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: (_ for _ in ()).throw(AssertionError()),
        )


def test_completed_resume_rejects_terminal_tamper(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    _run(
        monkeypatch,
        tmp_path,
        prior,
        ["UNIT", "NONUNIT", "UNIT", "NONUNIT", "UNIT", "UNIT"],
    )
    path = subject.RUN_ROOT / "events" / "terminal.json"
    value = json.loads(path.read_text())
    value["status"] = "BOTH_GAUGES_NONUNIT"
    os.chmod(path, 0o600)
    path.write_text(json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n")
    os.chmod(path, 0o400)
    with pytest.raises(subject.EqualityCoreError, match="terminal record is malformed"):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: (_ for _ in ()).throw(AssertionError()),
        )


def test_completed_resume_rejects_missing_immutable_launch(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    _run(
        monkeypatch,
        tmp_path,
        prior,
        ["UNIT", "NONUNIT", "UNIT", "NONUNIT", "UNIT", "UNIT"],
    )
    launch = subject.RUN_ROOT / "events" / "launch.json"
    launch.unlink()
    with pytest.raises(subject.EqualityCoreError, match="terminal exists without"):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: (_ for _ in ()).throw(
                AssertionError()
            ),
        )
    assert not launch.exists()


def test_truncated_stream_fails_closed_before_terminal(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    fake = PublishingFakeRunner(["UNIT", "NONUNIT", "UNIT", "NONUNIT", "TRUNCATED"])
    with pytest.raises(subject.EqualityCoreError, match="execution failed"):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: fake,
        )
    assert not (subject.RUN_ROOT / "events" / "terminal.json").exists()


@pytest.mark.parametrize("timeout", [True, 0, 1.0, 86401])
def test_timeout_is_bounded_integral_seconds(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    prior: dict[str, Any],
    timeout: object,
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    with pytest.raises(subject.EqualityCoreError, match="timeout must be an integer"):
        subject.run_diagnostic(
            timeout_s=timeout,  # type: ignore[arg-type]
            prior_revalidator=lambda: prior,
        )


def test_returned_execution_mismatch_fails_closed(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    fake = PublishingFakeRunner(["UNIT"])

    class TamperingRunner:
        def execute(self, *args: Any, **kwargs: Any) -> object:
            result = fake.execute(*args, **kwargs)
            return replace(result, artifact_sha256="0" * 64)

    with pytest.raises(subject.EqualityCoreError, match="differs from local replay"):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: TamperingRunner(),
        )
    assert not (subject.RUN_ROOT / "events" / "terminal.json").exists()
