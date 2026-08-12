from __future__ import annotations

import hashlib
import importlib
import json
import os
import shutil
import sys
from collections.abc import Mapping
from pathlib import Path
from typing import Any

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

equality_ideal_probe = importlib.import_module(
    "census.global_confinement.equality_ideal_probe"
)
piqd_backend = importlib.import_module(
    "census.global_confinement.piqd_singular_backend"
)
realize = importlib.import_module("census.p97_search.realize")
screen = importlib.import_module("census.p97_search.structural_screen")


CURRENT_RUN = (
    ROOT
    / "census/p97_search/tests/fixtures"
    / "phase3_legacy_bounded100_current"
)


@pytest.fixture(scope="module")
def source() -> realize.VerifiedSource:
    return realize.load_verified_source(CURRENT_RUN)


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _canonical(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode()


def _fake_result(path: Path, value: Mapping[str, Any]) -> screen.SingularExecutionResult:
    stdout = value["stdout"].encode()
    stderr = value["stderr"].encode()
    return screen.SingularExecutionResult(
        run_id=value["run_id"],
        run_status=value["run_status"],
        exit_code=value["exit_code"],
        stdout=stdout,
        stderr=stderr,
        script_path=path / "script.sing",
        stdout_path=path / "stdout.bin",
        stderr_path=path / "stderr.bin",
        receipt_path=path / "receipt.json",
        manifest_path=path / "manifest.json",
        request_sha256=value["request_sha256"],
        result_sha256=value["result_sha256"],
        script_sha256=value["script_sha256"],
        stdout_sha256=value["stdout_sha256"],
        stderr_sha256=value["stderr_sha256"],
        source_context_sha256=value["source_context_sha256"],
        receipt_sha256=value["receipt_sha256"],
        artifact_sha256=value["artifact_sha256"],
        replayed=value["replayed"],
    )


class FakePiqdRunner:
    def __init__(
        self,
        *,
        fail: bool = False,
        use_shared_parent_precondition: bool = False,
        rebind_custody_root: bool = False,
    ) -> None:
        self.fail = fail
        self.use_shared_parent_precondition = use_shared_parent_precondition
        self.rebind_custody_root = rebind_custody_root
        self.calls: list[dict[str, Any]] = []
        self.active = 0
        self.max_active = 0

    def execute(
        self,
        script: bytes,
        *,
        source: str,
        project: str,
        request_id: str,
        timeout_s: int,
        output_directory: Path,
        source_context: Mapping[str, Any],
    ) -> screen.SingularExecutionResult:
        if self.fail:
            raise RuntimeError("injected PIQD failure")
        self.active += 1
        self.max_active = max(self.max_active, self.active)
        try:
            request = source_context["request"]
            verdict = (
                "NONUNIT"
                if request.get("kind") == "smoke"
                and request.get("name") == "known_nonunit"
                else "UNIT"
            )
            payload = "0" if verdict == "UNIT" else "1"
            stdout = (
                f"{equality_ideal_probe.VERDICT_BEGIN}\n"
                f"{payload}\n"
                f"{equality_ideal_probe.VERDICT_END}\n"
            ).encode()
            stderr = b""
            context = dict(source_context)
            script_sha256 = _sha(script)
            source_context_sha256 = _sha(_canonical(context))
            request_sha256 = _sha(
                _canonical(
                    {
                        "source": source,
                        "project": project,
                        "request_id": request_id,
                        "timeout_s": timeout_s,
                        "script_sha256": script_sha256,
                        "source_context_sha256": source_context_sha256,
                    }
                )
            )
            stdout_sha256 = _sha(stdout)
            stderr_sha256 = _sha(stderr)
            result_sha256 = _sha((request_sha256 + "result").encode())
            receipt_sha256 = _sha((result_sha256 + "receipt").encode())
            artifact_sha256 = _sha((receipt_sha256 + "artifact").encode())
            marker = {
                "run_id": f"fake-{request_id}",
                "run_status": "RAN",
                "exit_code": 0,
                "stdout": stdout.decode(),
                "stderr": stderr.decode(),
                "request_sha256": request_sha256,
                "result_sha256": result_sha256,
                "script_sha256": script_sha256,
                "stdout_sha256": stdout_sha256,
                "stderr_sha256": stderr_sha256,
                "source_context_sha256": source_context_sha256,
                "receipt_sha256": receipt_sha256,
                "artifact_sha256": artifact_sha256,
                "replayed": False,
            }
            if self.use_shared_parent_precondition:
                descriptor = piqd_backend._secure_new_directory(output_directory)
                os.close(descriptor)
            else:
                output_directory.mkdir()
            (output_directory / "fake-result.json").write_text(
                json.dumps(marker, sort_keys=True) + "\n"
            )
            self.calls.append(
                {
                    "request_id": request_id,
                    "source": source,
                    "project": project,
                    "timeout_s": timeout_s,
                    "source_context": context,
                }
            )
            if self.rebind_custody_root:
                custody_root = output_directory.parent
                displaced = custody_root.parent.parent / "displaced-piqd-artifacts"
                custody_root.rename(displaced)
                custody_root.mkdir(mode=0o700)
            return _fake_result(output_directory, marker)
        finally:
            self.active -= 1


def _install_fake_custody(monkeypatch: pytest.MonkeyPatch) -> None:
    def validate(path: Path) -> screen.SingularExecutionResult:
        marker = json.loads((path / "fake-result.json").read_text())
        return _fake_result(path, marker)

    monkeypatch.setattr(screen, "validate_artifact_directory", validate)


def _run_piqd(
    out: Path,
    runner: FakePiqdRunner,
    **overrides: Any,
) -> dict[str, Any]:
    options = {
        "runner": runner,
        "workers": 1,
        "solver_threads": 1,
        "singular_timeout": 7,
        "singular_audit_sample": 5,
    }
    options.update(overrides)
    return screen.run_driver(CURRENT_RUN, out, **options)


def test_current_source_uses_inexact_rows_and_replays_certificate(
    source: realize.VerifiedSource,
) -> None:
    model = screen._models_in_source_order(source)[0]
    analysis = screen._analyze_model(model)

    assert len(analysis["rows"]) == 10
    assert all(row.exact is False for row in analysis["rows"])
    assert analysis["detection"]["stage"] in screen.ORDER_INDEPENDENT_STAGES
    assert analysis["certificate_validation"]["passed"] is True
    assert analysis["lean_match"] == {
        "alternative": "Problem97.Census554.MetricCoreAlternative",
        "generic_consumer": ("Problem97.Census554.false_of_metricCoreAlternative"),
        "detector_stage": analysis["detection"]["stage"],
        "phase3_kernel_status": "NOT_LANDED",
    }


def test_piqd_is_sequential_ordered_and_source_context_bound(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    source: realize.VerifiedSource,
) -> None:
    _install_fake_custody(monkeypatch)
    monkeypatch.setattr(
        screen.equality_ideal,
        "run_singular_script",
        lambda *args, **kwargs: pytest.fail("PIQD attempted local Singular"),
    )
    runner = FakePiqdRunner()
    out = tmp_path / "screen"

    partial = _run_piqd(out, runner, max_new_records=3)
    assert partial["record_count"] == 3
    custody_stat = (out / screen.PIQD_ARTIFACT_DIRECTORY).stat()
    custody_identity = (custody_stat.st_dev, custody_stat.st_ino)
    summary = _run_piqd(out, runner, resume=True)
    resumed_custody_stat = (out / screen.PIQD_ARTIFACT_DIRECTORY).stat()

    assert summary["status"] == "COMPLETE"
    assert (resumed_custody_stat.st_dev, resumed_custody_stat.st_ino) == custody_identity
    assert runner.max_active == 1
    assert [call["request_id"] for call in runner.calls] == [
        "smoke-known_unit",
        "smoke-known_nonunit",
        "model-000-source-000",
        "model-001-source-001",
        "model-002-source-002",
        "model-003-source-003",
        "model-004-source-004",
    ]
    expected_artifacts = {
        "manifest.json": source.manifest_sha256,
        **{
            name: source.manifest["artifact_hashes"][name]
            for name in ("base.cnf", "models.jsonl", "bank.jsonl")
        },
    }
    for call in runner.calls:
        context = call["source_context"]
        assert call["project"] == screen.PIQD_PROJECT
        assert call["timeout_s"] == 7
        assert context["artifact_sha256"] == expected_artifacts
        assert context["cell"] == source.manifest["cell"]
        assert context["status"] == source.manifest["status"]
        assert context["backend"] == "piqd"
        assert context["solver_profile"] == screen.DEFAULT_SOLVER_PROFILE
    model_calls = runner.calls[2:]
    assert [call["source_context"]["request"]["screen_index"] for call in model_calls] == list(
        range(5)
    )
    assert all(
        call["source_context"]["request"]["metric_rows_sha256"]
        == _sha(_canonical(call["source_context"]["request"]["metric_rows"]))
        for call in model_calls
    )

    calls_before_resume = len(runner.calls)
    assert _run_piqd(out, runner, resume=True) == summary
    assert len(runner.calls) == calls_before_resume


def test_piqd_prepares_real_adapter_parent_and_rejects_rebinding(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _install_fake_custody(monkeypatch)
    compatible = FakePiqdRunner(use_shared_parent_precondition=True)
    out = tmp_path / "shared-parent"

    result = _run_piqd(out, compatible, max_new_records=1)
    custody_stat = (out / screen.PIQD_ARTIFACT_DIRECTORY).stat()
    custody_identity = (custody_stat.st_dev, custody_stat.st_ino)
    resumed = _run_piqd(out, compatible, resume=True)
    resumed_stat = (out / screen.PIQD_ARTIFACT_DIRECTORY).stat()

    assert result["record_count"] == 1
    assert resumed["status"] == "COMPLETE"
    assert (resumed_stat.st_dev, resumed_stat.st_ino) == custody_identity
    assert [call["request_id"] for call in compatible.calls] == [
        "smoke-known_unit",
        "smoke-known_nonunit",
        "model-000-source-000",
        "model-001-source-001",
        "model-002-source-002",
        "model-003-source-003",
        "model-004-source-004",
    ]
    assert (out / screen.PIQD_ARTIFACT_DIRECTORY).is_dir()

    rebinding = FakePiqdRunner(rebind_custody_root=True)
    with pytest.raises(screen.StructuralScreenError, match="custody root was rebound"):
        _run_piqd(tmp_path / "rebound", rebinding, max_new_records=1)
    assert len(rebinding.calls) == 1

    preexisting = tmp_path / "preexisting"
    preexisting.mkdir()
    (preexisting / screen.PIQD_ARTIFACT_DIRECTORY).mkdir(mode=0o700)
    untouched = FakePiqdRunner()
    with pytest.raises(screen.StructuralScreenError, match="output is nonempty"):
        _run_piqd(preexisting, untouched, max_new_records=1)
    assert untouched.calls == []


def test_piqd_resume_rejects_symlinked_custody_root_before_runner(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _install_fake_custody(monkeypatch)
    runner = FakePiqdRunner()
    out = tmp_path / "symlink-resume"
    _run_piqd(out, runner, max_new_records=1)
    calls_before_resume = len(runner.calls)
    custody_root = out / screen.PIQD_ARTIFACT_DIRECTORY
    displaced = tmp_path / "original-piqd-artifacts"
    custody_root.rename(displaced)
    custody_root.symlink_to(displaced, target_is_directory=True)

    with pytest.raises(screen.StructuralScreenError, match="custody root"):
        _run_piqd(out, runner, resume=True)
    assert len(runner.calls) == calls_before_resume


def test_piqd_workers_two_is_rejected_before_runner(
    tmp_path: Path,
) -> None:
    runner = FakePiqdRunner()
    with pytest.raises(screen.StructuralScreenError, match="requires workers=1"):
        _run_piqd(tmp_path / "workers", runner, workers=2)
    assert runner.calls == []


def test_piqd_failure_has_no_local_fallback(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    local_calls: list[str] = []

    def local(*args: Any, **kwargs: Any) -> None:
        local_calls.append("called")
        pytest.fail("PIQD failure fell back to local Singular")

    monkeypatch.setattr(screen.equality_ideal, "run_singular_script", local)
    runner = FakePiqdRunner(fail=True)
    with pytest.raises(screen.StructuralScreenError, match="PIQD Singular execution failed"):
        _run_piqd(tmp_path / "no-fallback", runner, max_new_records=1)
    assert local_calls == []


def test_resume_rejects_backend_profile_request_and_context_mismatches(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _install_fake_custody(monkeypatch)
    runner = FakePiqdRunner()
    base = tmp_path / "base"
    _run_piqd(base, runner, max_new_records=1)

    backend = tmp_path / "backend"
    shutil.copytree(base, backend)
    with pytest.raises(screen.StructuralScreenError, match="manifest/configuration"):
        screen.run_driver(
            CURRENT_RUN,
            backend,
            backend="legacy-local",
            workers=1,
            singular_timeout=7,
            singular_audit_sample=5,
            resume=True,
        )

    profile = tmp_path / "profile"
    shutil.copytree(base, profile)
    manifest_path = profile / "manifest.json"
    manifest = json.loads(manifest_path.read_text())
    manifest["configuration"]["solver_profile"] = "drifted-profile"
    manifest_path.write_text(json.dumps(manifest, sort_keys=True) + "\n")
    with pytest.raises(screen.StructuralScreenError, match="manifest/configuration"):
        _run_piqd(profile, runner, resume=True)

    for field in ("request_sha256", "stdout_sha256", "artifact_sha256"):
        digest = tmp_path / f"digest-{field}"
        shutil.copytree(base, digest)
        results_path = digest / "results.jsonl"
        record = json.loads(results_path.read_text())
        record["singular"][field] = "0" * 64
        unsigned = dict(record)
        del unsigned["record_sha256"]
        record["record_sha256"] = _sha(_canonical(unsigned))
        results_path.write_text(json.dumps(record, sort_keys=True) + "\n")
        with pytest.raises(
            screen.StructuralScreenError, match=f"stored {field}"
        ):
            _run_piqd(digest, runner, resume=True)

    context = tmp_path / "context"
    shutil.copytree(base, context)
    results_path = context / "results.jsonl"
    record = json.loads(results_path.read_text())
    record["singular"]["source_context"]["artifact_sha256"]["base.cnf"] = "0" * 64
    record["singular"]["source_context_sha256"] = _sha(
        _canonical(record["singular"]["source_context"])
    )
    unsigned = dict(record)
    del unsigned["record_sha256"]
    record["record_sha256"] = _sha(_canonical(unsigned))
    results_path.write_text(json.dumps(record, sort_keys=True) + "\n")
    with pytest.raises(screen.StructuralScreenError, match="source context mismatch"):
        _run_piqd(context, runner, resume=True)


def test_append_only_result_and_summary_tampering_fail_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _install_fake_custody(monkeypatch)
    runner = FakePiqdRunner()
    out = tmp_path / "complete"
    summary = _run_piqd(out, runner)
    assert summary["model_count"] == 100
    assert summary["structurally_unresolved_count"] == 0
    assert summary["singular_probe_count"] == 5
    assert summary["forbidden_claims_emitted"] == []

    tampered = tmp_path / "record-tampered"
    shutil.copytree(out, tampered)
    lines = (tampered / "results.jsonl").read_text().splitlines()
    first = json.loads(lines[0])
    first["classification"] = "NONUNIT"
    lines[0] = json.dumps(first, sort_keys=True, separators=(",", ":"))
    (tampered / "results.jsonl").write_text("\n".join(lines) + "\n")
    with pytest.raises(screen.StructuralScreenError, match="invalid record hash"):
        _run_piqd(tampered, runner, resume=True)

    summary_tampered = tmp_path / "summary-tampered"
    shutil.copytree(out, summary_tampered)
    summary_path = summary_tampered / "summary.json"
    changed = json.loads(summary_path.read_text())
    changed["model_count"] = 99
    summary_path.write_text(json.dumps(changed, sort_keys=True) + "\n")
    with pytest.raises(screen.StructuralScreenError, match="invalid summary hash"):
        _run_piqd(summary_tampered, runner, resume=True)


def test_certificate_replay_failure_stops_before_results(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _install_fake_custody(monkeypatch)
    monkeypatch.setattr(
        screen.certificates,
        "_validate_certificate",
        lambda certificate, *, n: False,
    )
    out = tmp_path / "bad-certificate"
    with pytest.raises(
        screen.StructuralScreenError, match="certificate did not replay"
    ):
        _run_piqd(out, FakePiqdRunner(), max_new_records=1)
    assert not (out / "results.jsonl").exists()


def test_legacy_local_is_explicit_and_never_uses_a_runner(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    calls: list[tuple[str, str]] = []

    def local(script: str, *, timeout_s: int, executable: str) -> Any:
        calls.append((os.environ.get("OMP_NUM_THREADS", ""), executable))
        verdict = "NONUNIT" if len(calls) == 2 else "UNIT"
        return equality_ideal_probe.OracleResult(verdict, returncode=0)

    monkeypatch.setattr(screen.equality_ideal, "run_singular_script", local)
    result = screen.run_driver(
        CURRENT_RUN,
        tmp_path / "legacy",
        backend="legacy-local",
        workers=2,
        singular_timeout=7,
        singular_executable="fake-singular",
        singular_audit_sample=1,
        max_new_records=1,
    )
    assert result["record_count"] == 1
    assert len(calls) == 3
    assert calls[-1] == ("1", "fake-singular")
    with pytest.raises(screen.StructuralScreenError, match="forbids a PIQD runner"):
        screen.run_driver(
            CURRENT_RUN,
            tmp_path / "legacy-runner",
            backend="legacy-local",
            runner=FakePiqdRunner(),
        )


@pytest.mark.parametrize(
    ("verdict", "expected"),
    [
        ("UNIT", "SINGULAR_UNIT_UNCERTIFIED"),
        ("NONUNIT", "NONUNIT"),
        ("TIMEOUT", "TIMEOUT"),
        ("ERROR", "ERROR"),
    ],
)
def test_singular_classification_is_fail_closed(verdict: str, expected: str) -> None:
    assert screen._singular_classification(verdict) == expected


def test_resource_caps_and_unknown_verdict_fail_closed(tmp_path: Path) -> None:
    with pytest.raises(screen.StructuralScreenError, match="1..24"):
        screen.run_driver(CURRENT_RUN, tmp_path / "workers", workers=25)
    with pytest.raises(screen.StructuralScreenError, match="exactly 1"):
        screen.run_driver(CURRENT_RUN, tmp_path / "threads", solver_threads=2)
    with pytest.raises(screen.StructuralScreenError, match="unsupported"):
        screen._singular_classification("PROVED_INFEASIBLE")
