from __future__ import annotations

import os
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import adopt_exact17_two_kalmanson_v1_canary_into_v2 as adoption
import pytest

from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes


def _cell() -> dict[str, Any]:
    return {
        "portfolio_cell_id": adoption.runner.CANARY_PORTFOLIO_CELL_ID,
        "source_cell_id": "physical-canary",
        "center": 2,
        "category": "none",
        "ordinal": 0,
        "source_cnf": {
            "path": "one/wave.cnf",
            "sha256": adoption.EXPECTED_CNF_SHA256,
            "bytes": 17,
        },
        "producer_manifest": {
            "path": "one/producer.json",
            "sha256": adoption.EXPECTED_PRODUCER_SHA256,
            "bytes": 19,
        },
        "wave_manifest": {
            "path": "one/wave.json",
            "sha256": adoption.EXPECTED_WAVE_SHA256,
            "bytes": 23,
        },
        "expected_identity_hash": adoption.EXPECTED_IDENTITY_HASH,
    }


def _terminal() -> dict[str, Any]:
    return {
        "portfolio_cell_id": adoption.runner.CANARY_PORTFOLIO_CELL_ID,
        "job_id": adoption.EXPECTED_JOB_ID,
        "outcome": adoption.runner.STRUCTURAL_SAT,
        "terminal_record_sha256": adoption.EXPECTED_TERMINAL_RECORD_SHA256,
        "journal_record_count": 16,
        "seal_sha256": adoption.EXPECTED_SEAL_SHA256,
        "artifacts": {
            "cnf_sha256": adoption.EXPECTED_CNF_SHA256,
            "model_sha256": adoption.EXPECTED_MODEL_SHA256,
            "solver_log_sha256": adoption.EXPECTED_SOLVER_LOG_SHA256,
        },
    }


def _private(path: Path, raw: bytes) -> None:
    path.parent.mkdir(mode=0o700, parents=True, exist_ok=True)
    path.write_bytes(raw)
    path.chmod(0o600)


def test_same_cell_identity_ignores_only_paths() -> None:
    source = _cell()
    target = _cell()
    target["source_cnf"]["path"] = "two/wave.cnf"
    target["producer_manifest"]["path"] = "two/producer.json"
    target["wave_manifest"]["path"] = "two/wave.json"
    observed = adoption.require_same_cell_identity(source, target)
    assert observed["cnf_sha256"] == adoption.EXPECTED_CNF_SHA256


@pytest.mark.parametrize(
    ("section", "key", "value"),
    [
        ("source_cnf", "sha256", "0" * 64),
        ("producer_manifest", "bytes", 20),
        ("wave_manifest", "sha256", "1" * 64),
        (None, "expected_identity_hash", "2" * 64),
        (None, "center", 3),
    ],
)
def test_same_cell_identity_rejects_semantic_or_byte_drift(
    section: str | None, key: str, value: Any
) -> None:
    source = _cell()
    target = _cell()
    if section is None:
        target[key] = value
    else:
        target[section][key] = value
    with pytest.raises(adoption.AdoptionError, match="identity drifted"):
        adoption.require_same_cell_identity(source, target)


def test_expected_source_terminal_accepts_exact_pins() -> None:
    adoption.require_expected_source_terminal(_terminal())


@pytest.mark.parametrize(
    ("location", "key", "value"),
    [
        ("terminal", "job_id", "wrong"),
        ("terminal", "seal_sha256", "0" * 64),
        ("artifacts", "model_sha256", "1" * 64),
        ("artifacts", "solver_log_sha256", "2" * 64),
    ],
)
def test_expected_source_terminal_rejects_pin_drift(
    location: str, key: str, value: Any
) -> None:
    terminal = _terminal()
    if location == "terminal":
        terminal[key] = value
    else:
        terminal["artifacts"][key] = value
    with pytest.raises(adoption.AdoptionError, match="drifted"):
        adoption.require_expected_source_terminal(terminal)


def test_rejected_attempt_validation_is_exact(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    identifier = adoption.runner.CANARY_PORTFOLIO_CELL_ID
    base = tmp_path / "events" / f"{identifier}.jsonl"
    lock = base.with_name(f"{base.name}.lock")
    artifacts = base.with_name(f"{base.name}.artifacts")
    seal_path = base.with_name(f"{base.name}.seal.json")
    _private(base, b"journal\n")
    _private(lock, b"")
    artifacts.mkdir(mode=0o700)
    event_digest = sha256_bytes(b"event")
    _private(artifacts / event_digest, b"event")
    records = [
        {
            "outcome": "CHECKPOINT",
            "record_sha256": "b" * 64,
            "event": {
                "phase": "DRIVER_START",
                "disposition": "SUCCESS",
                "job_id": None,
                "detail": "bounded piqd lifecycle started",
            },
            "artifacts": {"checkpoint_sha256": event_digest},
        },
        {
            "outcome": "ERROR",
            "record_sha256": "c" * 64,
            "event": {
                "phase": "PREPARE",
                "disposition": "ERROR",
                "job_id": None,
                "detail": adoption.REJECTED_DETAIL,
            },
            "artifacts": {"checkpoint_sha256": event_digest},
        },
    ]
    wave = {
        "encoding": {
            "cnf_sha256": adoption.EXPECTED_CNF_SHA256,
            "producer_manifest_sha256": adoption.EXPECTED_PRODUCER_SHA256,
        }
    }
    seal = {
        "record_count": 2,
        "terminal_attempt_sha256": "c" * 64,
        "journal_sha256": sha256_bytes(b"journal\n"),
    }
    seal["seal_sha256"] = adoption.runner._self_hash(seal, "seal_sha256")
    _private(seal_path, canonical_json_bytes(seal) + b"\n")
    monkeypatch.setattr(
        adoption.runner, "_load_cell_inputs", lambda *args: (b"", b"", wave)
    )
    monkeypatch.setattr(adoption.runner, "_read_journal_records", lambda *args: records)
    monkeypatch.setattr(
        adoption.runner, "_validate_artifact_directory", lambda *args: {event_digest}
    )
    inventory, paths = adoption._validate_rejected_attempt(tmp_path, _cell())
    assert inventory["journal"]["sha256"] == sha256_bytes(b"journal\n")
    assert paths == (base, lock, artifacts, seal_path)
    records[-1]["event"]["detail"] = "some other error"
    with pytest.raises(adoption.AdoptionError, match="not the pinned"):
        adoption._validate_rejected_attempt(tmp_path, _cell())
    records[-1]["event"]["detail"] = adoption.REJECTED_DETAIL
    complete = adoption._archive_rejected_attempt(tmp_path, _cell())
    assert complete.exists()
    assert adoption._archive_rejected_attempt(tmp_path, _cell()) == complete


def test_live_reverification_checks_exact_remote_artifacts(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    cnf = b"p cnf 1 1\n1 0\n"

    class Client:
        def __init__(self, base_url: str) -> None:
            assert base_url == "http://piqd"

        def status(self, job_id: str) -> dict[str, Any]:
            assert job_id == adoption.EXPECTED_JOB_ID
            return {
                "id": adoption.EXPECTED_JOB_ID,
                "status": "completed",
                "result": "SAT",
                "backend": adoption.runner.BACKEND,
                "solver_profile": adoption.runner.SOLVER_PROFILE,
                "project": adoption.runner.PROJECT,
                "cnf_blob_hash": adoption.EXPECTED_CNF_SHA256,
                "identity_hash": adoption.EXPECTED_IDENTITY_HASH,
                "requested_core_limit": adoption.runner.REQUESTED_CORE_LIMIT,
            }

        def verify_stored_cnf(self, job: Any, observed: bytes) -> str:
            assert job.job_id == adoption.EXPECTED_JOB_ID and observed == cnf
            return adoption.EXPECTED_CNF_SHA256

        def checked_model(self, job: Any, *, cnf: bytes) -> Any:
            del job, cnf
            return SimpleNamespace(
                response_body=b"model", response_sha256=sha256_bytes(b"model")
            )

        def log(self, job: Any) -> tuple[bytes, str]:
            del job
            return b"log", sha256_bytes(b"log")

    monkeypatch.setattr(adoption, "PiqdRawDimacsClient", Client)
    monkeypatch.setattr(adoption.runner, "_read_ref", lambda *args, **kwargs: cnf)
    monkeypatch.setattr(adoption, "EXPECTED_MODEL_SHA256", sha256_bytes(b"model"))
    monkeypatch.setattr(adoption, "EXPECTED_SOLVER_LOG_SHA256", sha256_bytes(b"log"))
    terminal = _terminal()
    terminal["artifacts"]["model_sha256"] = sha256_bytes(b"model")
    observed = adoption._live_reverify(
        base_url="http://piqd", source_cell=_cell(), terminal=terminal
    )
    assert observed["model_sha256"] == sha256_bytes(b"model")


def test_copy_rejects_symlink_source(tmp_path: Path) -> None:
    real = tmp_path / "real"
    _private(real, b"payload")
    link = tmp_path / "link"
    os.symlink(real, link)
    with pytest.raises(adoption.AdoptionError, match="regular file"):
        adoption._copy_file_create_once_or_validate(link, tmp_path / "target", "copy")
