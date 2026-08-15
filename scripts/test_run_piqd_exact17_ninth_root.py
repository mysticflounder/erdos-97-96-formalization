"""Regression tests for the exact17 runner's trust boundaries."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import multiprocessing
import time
from pathlib import Path

import pytest

RUNNER_PATH = Path(__file__).with_name("run_piqd_exact17_ninth_root.py")


def runner_module():
    spec = importlib.util.spec_from_file_location("exact17_ninth_root_test_runner", RUNNER_PATH)
    assert spec and spec.loader
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def hold_lock(path: str, ready: multiprocessing.Queue[str]) -> None:
    module = runner_module()
    with module.transaction_lock(Path(path)):
        ready.put("locked")
        time.sleep(0.35)


def test_transaction_lock_excludes_concurrent_processes(tmp_path: Path) -> None:
    lock = tmp_path / "transaction.lock"
    ready: multiprocessing.Queue[str] = multiprocessing.Queue()
    process = multiprocessing.Process(target=hold_lock, args=(str(lock), ready))
    process.start()
    assert ready.get(timeout=3) == "locked"
    module = runner_module()
    started = time.monotonic()
    with module.transaction_lock(lock):
        elapsed = time.monotonic() - started
    process.join(timeout=3)
    assert process.exitcode == 0
    assert elapsed >= 0.25


def test_strict_json_rejects_duplicate_keys() -> None:
    module = runner_module()
    with pytest.raises(SystemExit, match="duplicate JSON key"):
        module.strict_json_loads('{"status":"PASS","status":"FAIL"}')


def test_atomic_json_preserves_existing_artifact_on_serialization_failure(tmp_path: Path) -> None:
    module = runner_module()
    destination = tmp_path / "state.json"
    destination.write_text('{"old":true}\n', encoding="utf-8")

    class NotJSON:
        pass

    with pytest.raises(TypeError):
        module.atomic_json(destination, {"new": NotJSON()})
    assert destination.read_text(encoding="utf-8") == '{"old":true}\n'
    assert list(tmp_path.glob("*.tmp")) == []


def test_verified_snapshot_survives_source_mutation_for_model_replay(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    module = runner_module()
    cnf = tmp_path / "root.cnf"
    original = b"p cnf 1 1\n1 0\n"
    cnf.write_bytes(original)
    monkeypatch.setattr(module, "SCRATCH", tmp_path)
    monkeypatch.setattr(module, "BYTES", len(original))
    monkeypatch.setattr(module, "VARIABLES", 1)
    monkeypatch.setattr(module, "CLAUSES", 1)
    monkeypatch.setattr(module, "CNF_SHA256", hashlib.sha256(original).hexdigest())

    with module.verified_cnf_snapshot(cnf) as snapshot:
        cnf.write_bytes(b"p cnf 1 1\n-1 0\n")
        assert module.replay_model([1], snapshot) == {
            "clauses_checked": 1,
            "satisfies_all": True,
        }
        assert snapshot.is_file()
    assert not snapshot.exists()


def test_tampered_ingress_report_hash_is_rejected(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    module = runner_module()
    cnf = tmp_path / "root.cnf"
    cnf.write_bytes(b"p cnf 1 1\n1 0\n")
    report = tmp_path / "report.json"
    report.write_text(json.dumps({
        "status": "PASS", "dimacs_sha256": "", "manifest_sha256": "",
        "piqd_daemon_sha256": "daemon", "variables": 1, "clauses": 1,
    }), encoding="utf-8")
    manifest = tmp_path / "manifest.json"
    report_hash = hashlib.sha256(report.read_bytes()).hexdigest()
    manifest.write_text(json.dumps({
        "validation": {"report": str(report), "report_sha256": report_hash},
        "piqd": {"ingress": "raw-dimacs/v1", "daemon_sha256": "daemon",
                  "backend": "cadical", "solver_profile": "sat"},
    }), encoding="utf-8")
    monkeypatch.setattr(module, "CNF", cnf)
    monkeypatch.setattr(module, "ROOT", tmp_path)
    monkeypatch.setattr(module, "INGRESS_REPORT", report)
    monkeypatch.setattr(module, "INGRESS_MANIFEST", manifest)
    monkeypatch.setattr(module, "BYTES", cnf.stat().st_size)
    monkeypatch.setattr(module, "VARIABLES", 1)
    monkeypatch.setattr(module, "CLAUSES", 1)
    monkeypatch.setattr(module, "CNF_SHA256", hashlib.sha256(cnf.read_bytes()).hexdigest())
    monkeypatch.setattr(module, "MANIFEST_SHA256", hashlib.sha256(manifest.read_bytes()).hexdigest())
    monkeypatch.setattr(module, "DAEMON_SHA256", "daemon")

    report.write_text(report.read_text(encoding="utf-8").replace("PASS", "FAIL"), encoding="utf-8")
    with pytest.raises(SystemExit, match="ingress report hash changed"):
        module.validate_local()


def test_runner_report_must_be_manifest_declared_report(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    module = runner_module()
    cnf = tmp_path / "root.cnf"
    cnf.write_bytes(b"p cnf 1 1\n1 0\n")
    declared_report = tmp_path / "declared-report.json"
    runner_report = tmp_path / "runner-report.json"
    payload = {
        "status": "PASS",
        "dimacs_sha256": hashlib.sha256(cnf.read_bytes()).hexdigest(),
        "manifest_sha256": "placeholder",
        "piqd_daemon_sha256": "daemon",
        "variables": 1,
        "clauses": 1,
    }
    declared_report.write_text(json.dumps(payload), encoding="utf-8")
    runner_report.write_text(json.dumps(payload), encoding="utf-8")
    manifest = tmp_path / "manifest.json"
    manifest.write_text(
        json.dumps(
            {
                "validation": {
                    "report": str(declared_report),
                    "report_sha256": hashlib.sha256(declared_report.read_bytes()).hexdigest(),
                },
                "piqd": {
                    "ingress": "raw-dimacs/v1",
                    "daemon_sha256": "daemon",
                    "backend": "cadical",
                    "solver_profile": "sat",
                },
            }
        ),
        encoding="utf-8",
    )
    monkeypatch.setattr(module, "CNF", cnf)
    monkeypatch.setattr(module, "INGRESS_REPORT", runner_report)
    monkeypatch.setattr(module, "INGRESS_MANIFEST", manifest)
    monkeypatch.setattr(module, "BYTES", cnf.stat().st_size)
    monkeypatch.setattr(module, "VARIABLES", 1)
    monkeypatch.setattr(module, "CLAUSES", 1)
    monkeypatch.setattr(module, "CNF_SHA256", payload["dimacs_sha256"])
    monkeypatch.setattr(module, "MANIFEST_SHA256", hashlib.sha256(manifest.read_bytes()).hexdigest())
    monkeypatch.setattr(module, "DAEMON_SHA256", "daemon")
    with pytest.raises(SystemExit, match="report path differs"):
        module.validate_local()


def test_successor_export_report_schema_is_accepted(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    module = runner_module()
    cnf = tmp_path / "root.cnf"
    cnf.write_bytes(b"p cnf 1 1\n1 0\n")
    report = tmp_path / "successor-export.json"
    report.write_text(
        json.dumps(
            {
                "schema": "p97-successor-export-validation/v1",
                "variables": 1,
                "clauses": 1,
                "parent_prefix_byte_identical": True,
                "all_new_clauses_independently_regenerated": True,
            }
        ),
        encoding="utf-8",
    )
    manifest = tmp_path / "manifest.json"
    manifest.write_text(
        json.dumps(
            {
                "validation": {
                    "report": str(report),
                    "report_sha256": hashlib.sha256(report.read_bytes()).hexdigest(),
                    "parent_prefix_byte_identical": True,
                    "all_new_clauses_independently_regenerated": True,
                },
                "piqd": {
                    "ingress": "raw-dimacs/v1",
                    "daemon_sha256": "daemon",
                    "backend": "cadical",
                    "solver_profile": "sat",
                },
            }
        ),
        encoding="utf-8",
    )
    monkeypatch.setattr(module, "CNF", cnf)
    monkeypatch.setattr(module, "ROOT", tmp_path)
    monkeypatch.setattr(module, "INGRESS_REPORT", report)
    monkeypatch.setattr(module, "INGRESS_MANIFEST", manifest)
    monkeypatch.setattr(module, "BYTES", cnf.stat().st_size)
    monkeypatch.setattr(module, "VARIABLES", 1)
    monkeypatch.setattr(module, "CLAUSES", 1)
    monkeypatch.setattr(module, "CNF_SHA256", hashlib.sha256(cnf.read_bytes()).hexdigest())
    monkeypatch.setattr(module, "MANIFEST_SHA256", hashlib.sha256(manifest.read_bytes()).hexdigest())
    monkeypatch.setattr(module, "DAEMON_SHA256", "daemon")

    result = module.validate_local()
    assert result["ingress_report"] == str(report.relative_to(module.ROOT))


def test_false_successor_validation_gate_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    module = runner_module()
    cnf = tmp_path / "root.cnf"
    cnf.write_bytes(b"p cnf 1 1\n1 0\n")
    report = tmp_path / "successor-export.json"
    report.write_text(json.dumps({"schema": "successor/v1", "variables": 1, "clauses": 1}), encoding="utf-8")
    manifest = tmp_path / "manifest.json"
    manifest.write_text(
        json.dumps(
            {
                "validation": {
                    "report": str(report),
                    "report_sha256": hashlib.sha256(report.read_bytes()).hexdigest(),
                    "all_new_clauses_independently_regenerated": False,
                },
                "piqd": {
                    "ingress": "raw-dimacs/v1",
                    "daemon_sha256": "daemon",
                    "backend": "cadical",
                    "solver_profile": "sat",
                },
            }
        ),
        encoding="utf-8",
    )
    monkeypatch.setattr(module, "CNF", cnf)
    monkeypatch.setattr(module, "INGRESS_REPORT", report)
    monkeypatch.setattr(module, "INGRESS_MANIFEST", manifest)
    monkeypatch.setattr(module, "BYTES", cnf.stat().st_size)
    monkeypatch.setattr(module, "VARIABLES", 1)
    monkeypatch.setattr(module, "CLAUSES", 1)
    monkeypatch.setattr(module, "CNF_SHA256", hashlib.sha256(cnf.read_bytes()).hexdigest())
    monkeypatch.setattr(module, "MANIFEST_SHA256", hashlib.sha256(manifest.read_bytes()).hexdigest())
    monkeypatch.setattr(module, "DAEMON_SHA256", "daemon")

    with pytest.raises(SystemExit, match="manifest validation gate is false"):
        module.validate_local()


def test_successor_report_dimension_mismatch_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    module = runner_module()
    cnf = tmp_path / "root.cnf"
    cnf.write_bytes(b"p cnf 1 1\n1 0\n")
    report = tmp_path / "successor-export.json"
    report.write_text(json.dumps({"schema": "successor/v1", "variables": 2, "clauses": 1}), encoding="utf-8")
    manifest = tmp_path / "manifest.json"
    manifest.write_text(
        json.dumps(
            {
                "validation": {
                    "report": str(report),
                    "report_sha256": hashlib.sha256(report.read_bytes()).hexdigest(),
                },
                "piqd": {
                    "ingress": "raw-dimacs/v1",
                    "daemon_sha256": "daemon",
                    "backend": "cadical",
                    "solver_profile": "sat",
                },
            }
        ),
        encoding="utf-8",
    )
    monkeypatch.setattr(module, "CNF", cnf)
    monkeypatch.setattr(module, "INGRESS_REPORT", report)
    monkeypatch.setattr(module, "INGRESS_MANIFEST", manifest)
    monkeypatch.setattr(module, "BYTES", cnf.stat().st_size)
    monkeypatch.setattr(module, "VARIABLES", 1)
    monkeypatch.setattr(module, "CLAUSES", 1)
    monkeypatch.setattr(module, "CNF_SHA256", hashlib.sha256(cnf.read_bytes()).hexdigest())
    monkeypatch.setattr(module, "MANIFEST_SHA256", hashlib.sha256(manifest.read_bytes()).hexdigest())
    monkeypatch.setattr(module, "DAEMON_SHA256", "daemon")

    with pytest.raises(SystemExit, match="wrong variables"):
        module.validate_local()


def test_tampered_status_identity_is_rejected() -> None:
    module = runner_module()
    status = {
        "id": "job-1", "identity_hash": "identity", "cnf_blob_hash": module.CNF_SHA256,
        "producer_manifest_hash": module.MANIFEST_SHA256, "project": module.PROJECT,
        "backend": module.BACKEND, "status": "completed",
    }
    module.check_job_binding(status, job_id="job-1", identity_hash="identity", expected_status="completed")
    status["producer_manifest_hash"] = "tampered"
    with pytest.raises(SystemExit, match="wrong manifest"):
        module.check_job_binding(status, job_id="job-1", identity_hash="identity", expected_status="completed")
