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
    exactfive_hard_source_swap_adaptive_equality_core_modular_prefilter_piqd as subject,
)


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _transcript(case: str) -> bytes:
    if case == "UNIT":
        fields = ["basis_size 1", "dim -1", "reduce_one 0"]
    elif case.startswith("NONUNIT"):
        parts = case.split("_")
        basis_size = int(parts[1]) if len(parts) == 2 else 3
        fields = [f"basis_size {basis_size}", "dim 0", "vdim 2", "reduce_one 1"]
    elif case == "MALFORMED":
        return b"basis_size 1\ndim -1\nreduce_one 0\n"
    elif case == "EXTRA_STDOUT":
        return (
            f"diagnostic\n{subject.MARKER_BEGIN}\n"
            f"basis_size 1\ndim -1\nreduce_one 0\n{subject.MARKER_END}\n"
        ).encode()
    elif case == "INVALID_UTF8":
        return b"\xff\xfe"
    elif case in {"TIMED_OUT", "ERRORED"}:
        return b""
    elif case in {"TRUNCATED", "STDERR"}:
        fields = ["basis_size 1", "dim -1", "reduce_one 0"]
    else:
        raise AssertionError(case)
    return (
        "\n".join([subject.MARKER_BEGIN, *fields, subject.MARKER_END]) + "\n"
    ).encode()


class PublishingFakeRunner:
    def __init__(self, outcomes: list[str], wall_ms: list[int] | None = None) -> None:
        self.outcomes = list(outcomes)
        self.wall_ms = list(wall_ms or range(10, 10 + len(outcomes)))
        self.calls: list[dict[str, Any]] = []

    def execute(self, script: bytes, **kwargs: Any) -> object:
        case = self.outcomes.pop(0)
        wall_ms = self.wall_ms.pop(0)
        self.calls.append({"case": case, "script": script, **kwargs})
        backend = subject.singular_backend
        stdout = _transcript(case)
        stderr = b"Singular warning\n" if case == "STDERR" else b""
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
            "wall_ms": wall_ms,
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
    return subject.revalidate_prior_char0_run()


def _run(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    prior: dict[str, Any],
    outcomes: list[str],
    wall_ms: list[int] | None = None,
) -> tuple[dict[str, Any], PublishingFakeRunner]:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    fake = PublishingFakeRunner(outcomes, wall_ms)
    factories: list[tuple[tuple[Any, ...], dict[str, Any]]] = []

    def factory(*args: Any, **kwargs: Any) -> PublishingFakeRunner:
        factories.append((args, kwargs))
        return fake

    result = subject.run_diagnostic(
        prior_revalidator=lambda: prior,
        runner_factory=factory,
    )
    assert len(factories) == 1
    assert factories[0][1] == {"max_poll_s": 600.0}
    return result, fake


def _happy_outcomes(target: str = "NONUNIT_3") -> list[str]:
    return ["UNIT", "NONUNIT_2", "UNIT", "NONUNIT_2", *([target] * 4)]


def test_prior_char0_replay_binds_exact_completed_files(prior: dict[str, Any]) -> None:
    assert prior["completed_no_transport_replay"] is True
    assert prior["char0_status"] == "TARGET_INCONCLUSIVE"
    assert prior["terminal_sha256"] == subject.EXPECTED_PRIOR_HASHES["terminal_self"]
    for name, hash_key in {
        "producer_source": "producer_source_file",
        "producer_spec": "producer_spec_file",
        "run_manifest": "run_manifest_file",
        "launch": "launch_file",
        "terminal": "terminal_file",
        "durable_summary": "durable_summary_file",
    }.items():
        assert prior["files"][name]["sha256"] == subject.EXPECTED_PRIOR_HASHES[hash_key]


def test_prior_hash_drift_fails_before_replay(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    payload = subject.PRIOR_SUMMARY_PATH.read_bytes() + b" "
    path = tmp_path / "summary.json"
    path.write_bytes(payload)
    monkeypatch.setattr(subject, "PRIOR_SUMMARY_PATH", path)
    original = subject._repo_path
    monkeypatch.setattr(
        subject,
        "_repo_path",
        lambda candidate: (
            "test-summary.json" if candidate == path else original(candidate)
        ),
    )
    with pytest.raises(subject.ModularPrefilterError, match="file hash drifted"):
        subject.revalidate_prior_char0_run()


def test_fixed_matrix_reuses_each_char0_system(prior: dict[str, Any]) -> None:
    queries = subject.prepare_queries(prior, timeout_s=300)
    assert [query.key for query in queries] == list(subject.QUERY_KEYS)
    assert [query.expected for query in queries[:4]] == [
        "UNIT",
        "NONUNIT",
        "UNIT",
        "NONUNIT",
    ]
    assert all(query.algorithm == "slimgb" for query in queries[:4])
    targets = queries[4:]
    assert [query.algorithm for query in targets] == ["slimgb", "std", "slimgb", "std"]
    for gauge in range(2):
        left, right = targets[2 * gauge : 2 * gauge + 2]
        current = subject.char0.build_target_query(
            prior["source_core"], gauge, timeout_s=300
        )
        assert left.variables == right.variables == current.variables
        assert left.polynomials == right.polynomials == current.polynomials
        assert len(left.variables) == 18
        assert len(left.polynomials) == 13
    assert not any(subject.FALSE_CLAIMS.values())
    for query in targets:
        assert f"ring r = {subject.FIELD}" in query.script
        assert ", dp;" in query.script
        assert "lp" not in query.script
        assert "eliminate" not in query.script
        assert "sat(" not in query.script
        assert str(uuid.UUID(query.request_id)) == query.request_id
        assert (
            query == subject.prepare_queries(prior, timeout_s=300)[queries.index(query)]
        )


def test_renderer_and_valid_transcripts_are_exact() -> None:
    script = subject.singular_script(("x",), ("x^2-1",), algorithm="std")
    assert script.count(subject.MARKER_BEGIN) == 1
    assert script.count(subject.MARKER_END) == 1
    assert "ideal G = std(I);" in script
    assert 'if (d == 0) { print("vdim " + string(vdim(G))); }' in script
    assert "string(reduce(1,G))" in script
    assert subject.parse_transcript(_transcript("UNIT").decode()) == {
        "basis_size": 1,
        "dim": -1,
        "vdim": None,
        "reduce_one": 0,
        "basis_verdict": "UNIT",
    }
    assert subject.parse_transcript(_transcript("NONUNIT_7").decode()) == {
        "basis_size": 7,
        "dim": 0,
        "vdim": 2,
        "reduce_one": 1,
        "basis_verdict": "NONUNIT",
    }


@pytest.mark.parametrize(
    "transcript",
    [
        "",
        f"{subject.MARKER_BEGIN}\nbasis_size 1\ndim 0\nreduce_one 1\n{subject.MARKER_END}\n",
        f"{subject.MARKER_BEGIN}\nbasis_size 1\ndim 1\nvdim 2\nreduce_one 1\n{subject.MARKER_END}\n",
        f"{subject.MARKER_BEGIN}\nbasis_size 2\ndim -1\nreduce_one 0\n{subject.MARKER_END}\n",
        f"{subject.MARKER_BEGIN}\nbasis_size 1\ndim -1\nreduce_one 1\n{subject.MARKER_END}\n",
        f"{subject.MARKER_BEGIN}\nbasis_size +1\ndim -1\nreduce_one 0\n{subject.MARKER_END}\n",
        f"{subject.MARKER_BEGIN}\nbasis_size 01\ndim -1\nreduce_one 0\n{subject.MARKER_END}\n",
        f" {subject.MARKER_BEGIN}\nbasis_size 1\ndim -1\nreduce_one 0\n{subject.MARKER_END}\n",
        f"{subject.MARKER_BEGIN}\nbasis_size 1 \ndim -1\nreduce_one 0\n{subject.MARKER_END}\n",
        f"{subject.MARKER_BEGIN}\nbasis_size 100000000000000000000\ndim -1\nreduce_one 0\n{subject.MARKER_END}\n",
        f"{subject.MARKER_BEGIN}\nbasis_size 1\ndim -1\nreduce_one 0\n{subject.MARKER_END}\n\n",
        f"extra\n{subject.MARKER_BEGIN}\nbasis_size 1\ndim -1\nreduce_one 0\n{subject.MARKER_END}\n",
    ],
)
def test_parser_rejects_malformed_transcripts(transcript: str) -> None:
    with pytest.raises(subject.ModularPrefilterError):
        subject.parse_transcript(transcript)


def test_controls_are_sequential_and_all_required(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    result, fake = _run(monkeypatch, tmp_path, prior, _happy_outcomes())
    assert [call["source_context"]["query"]["key"] for call in fake.calls] == list(
        subject.QUERY_KEYS
    )
    assert [row["diagnostic"] for row in result["controls"]] == [
        "UNIT",
        "NONUNIT",
        "UNIT",
        "NONUNIT",
    ]
    assert all(
        call["source_context"]["execution_profile"]["workers"] == 1
        and call["source_context"]["execution_profile"]["sequential"] is True
        and call["source_context"]["execution_profile"]["local_fallback"] is False
        for call in fake.calls
    )


@pytest.mark.parametrize("bad", ["NONUNIT_2", "TIMED_OUT", "MALFORMED"])
def test_control_failure_stops_without_terminal(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    prior: dict[str, Any],
    bad: str,
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    fake = PublishingFakeRunner([bad])
    with pytest.raises(subject.ModularPrefilterError):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: fake,
        )
    assert len(fake.calls) == 1
    assert not (subject.RUN_ROOT / "events" / "terminal.json").exists()


@pytest.mark.parametrize(
    "case", ["MALFORMED", "EXTRA_STDOUT", "INVALID_UTF8", "STDERR", "ERRORED"]
)
def test_target_transcript_and_process_defects_fail_closed(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    prior: dict[str, Any],
    case: str,
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    fake = PublishingFakeRunner(["UNIT", "NONUNIT_2", "UNIT", "NONUNIT_2", case])
    with pytest.raises(subject.ModularPrefilterError):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: fake,
        )
    assert not (subject.RUN_ROOT / "events" / "terminal.json").exists()


def test_truncated_stream_fails_closed(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    fake = PublishingFakeRunner(["UNIT", "NONUNIT_2", "UNIT", "NONUNIT_2", "TRUNCATED"])
    with pytest.raises(
        (
            subject.ModularPrefilterError,
            subject.singular_backend.PiqdSingularCustodyError,
        )
    ):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: fake,
        )
    assert not (subject.RUN_ROOT / "events" / "terminal.json").exists()


def test_basis_disagreement_stops_before_second_gauge(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    fake = PublishingFakeRunner(
        ["UNIT", "NONUNIT_2", "UNIT", "NONUNIT_2", "UNIT", "NONUNIT_2"]
    )
    with pytest.raises(
        subject.ModularPrefilterError, match="basis verdict disagreement"
    ):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: fake,
        )
    assert len(fake.calls) == 6
    assert not (subject.RUN_ROOT / "events" / "terminal.json").exists()


def test_selection_prefers_wall_time_then_basis_size(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    outcomes = [
        "UNIT",
        "NONUNIT_2",
        "UNIT",
        "NONUNIT_2",
        "NONUNIT_5",
        "NONUNIT_9",
        "NONUNIT_8",
        "NONUNIT_3",
    ]
    result, _fake = _run(
        monkeypatch,
        tmp_path,
        prior,
        outcomes,
        [1, 2, 3, 4, 50, 40, 30, 30],
    )
    assert result["status"] == "MOD_BOTH_GAUGES_NONUNIT"
    assert [row["selected_key"] for row in result["gauge_selections"]] == [
        "target-gauge-z3-std",
        "target-gauge-cvc5-std",
    ]
    assert [row["wall_ms"] for row in result["gauge_selections"]] == [40, 30]
    assert [row["basis_size"] for row in result["gauge_selections"]] == [9, 3]


def test_one_completion_and_one_missing_gauge_are_recorded(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    result, _fake = _run(
        monkeypatch,
        tmp_path,
        prior,
        [
            "UNIT",
            "NONUNIT_2",
            "UNIT",
            "NONUNIT_2",
            "TIMED_OUT",
            "NONUNIT_4",
            "TIMED_OUT",
            "TIMED_OUT",
        ],
    )
    assert result["status"] == "MOD_PARTIAL_TIMEOUT"
    assert result["targets"][0]["diagnostic"] == "MOD_TIMEOUT"
    assert result["gauge_selections"][0]["selected_key"] == "target-gauge-z3-std"
    assert result["gauge_selections"][1]["selected_key"] is None


def test_all_target_timeouts_are_recorded_and_replay_without_transport(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    fake = PublishingFakeRunner(
        ["UNIT", "NONUNIT_2", "UNIT", "NONUNIT_2", *(["TIMED_OUT"] * 4)]
    )
    first = subject.run_diagnostic(
        prior_revalidator=lambda: prior,
        runner_factory=lambda *_args, **_kwargs: fake,
    )
    assert first["status"] == "MOD_ALL_TIMEOUT"
    assert len(fake.calls) == 8
    assert (subject.RUN_ROOT / "events" / "terminal.json").exists()

    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("completed replay constructed transport")

    replay = subject.run_diagnostic(
        prior_revalidator=lambda: prior,
        runner_factory=forbidden,
    )
    assert replay == first


def test_completed_resume_uses_no_runner(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    first, fake = _run(monkeypatch, tmp_path, prior, _happy_outcomes())

    def forbidden(*_args: object, **_kwargs: object) -> object:
        raise AssertionError("completed replay constructed transport")

    second = subject.run_diagnostic(
        prior_revalidator=lambda: prior,
        runner_factory=forbidden,
    )
    assert second == first
    assert len(fake.calls) == 8


def test_completed_transcript_tampering_is_detected(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    _run(monkeypatch, tmp_path, prior, _happy_outcomes())
    path = subject.RUN_ROOT / "artifacts" / subject.TARGET_KEYS[0] / "stdout.bin"
    directory = path.parent
    os.chmod(directory, 0o700)
    os.chmod(path, 0o600)
    path.write_bytes(path.read_bytes() + b"tamper\n")
    os.chmod(path, 0o400)
    os.chmod(directory, 0o500)
    with pytest.raises(subject.ModularPrefilterError, match="custody failed"):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: (_ for _ in ()).throw(
                AssertionError()
            ),
        )


def test_source_context_drift_is_detected(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    _result, _fake = _run(monkeypatch, tmp_path, prior, _happy_outcomes())
    query = subject.prepare_queries(prior, timeout_s=300)[4]
    context = dict(query.source_context)
    context["coefficient_field"] = {"kind": "prime_field", "characteristic": 7}
    drifted = replace(query, source_context=context)
    with pytest.raises(
        subject.ModularPrefilterError, match="request or source context drifted"
    ):
        subject._validate_query_artifact(
            drifted, subject.RUN_ROOT / "artifacts" / query.key
        )


def test_immutable_inventory_and_events_are_enforced(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, prior: dict[str, Any]
) -> None:
    _run(monkeypatch, tmp_path, prior, _happy_outcomes())
    foreign = subject.RUN_ROOT / "foreign.txt"
    foreign.write_text("foreign")
    with pytest.raises(subject.ModularPrefilterError, match="unbound entry"):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: (_ for _ in ()).throw(
                AssertionError()
            ),
        )
    foreign.unlink()
    launch = subject.RUN_ROOT / "events" / "launch.json"
    os.chmod(launch, 0o600)
    with pytest.raises(subject.ModularPrefilterError, match="events contain"):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: (_ for _ in ()).throw(
                AssertionError()
            ),
        )


@pytest.mark.parametrize("event_name", ["launch.json", "terminal.json"])
def test_completed_replay_requires_canonical_event_bytes(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    prior: dict[str, Any],
    event_name: str,
) -> None:
    _run(monkeypatch, tmp_path, prior, _happy_outcomes())
    path = subject.RUN_ROOT / "events" / event_name
    value = json.loads(path.read_text())
    os.chmod(path, 0o600)
    path.write_text(json.dumps(value, indent=2) + "\n")
    os.chmod(path, 0o400)
    error = "launch record differs" if event_name == "launch.json" else "canonical"
    with pytest.raises(subject.ModularPrefilterError, match=error):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: (_ for _ in ()).throw(
                AssertionError()
            ),
        )


def test_run_root_rejects_symlinked_parent(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    actual = tmp_path / "actual"
    actual.mkdir()
    link = tmp_path / "redirect"
    link.symlink_to(actual, target_is_directory=True)
    monkeypatch.setattr(subject, "RUN_ROOT", link / "run")
    with pytest.raises(subject.ModularPrefilterError, match="parent is unsafe"):
        subject.ensure_run_root()
    assert not (actual / "run").exists()


@pytest.mark.parametrize("timeout", [True, 0, 1.0, 86401])
def test_timeout_is_bounded_integral_seconds(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    prior: dict[str, Any],
    timeout: object,
) -> None:
    monkeypatch.setattr(subject, "RUN_ROOT", tmp_path / "run")
    with pytest.raises(
        subject.ModularPrefilterError, match="timeout must be an integer"
    ):
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

    with pytest.raises(
        subject.ModularPrefilterError, match="differs from local replay"
    ):
        subject.run_diagnostic(
            prior_revalidator=lambda: prior,
            runner_factory=lambda *_args, **_kwargs: TamperingRunner(),
        )
    assert not (subject.RUN_ROOT / "events" / "terminal.json").exists()
