"""Adversarial tests for the local-only v2→v3 adoption adapter."""

from __future__ import annotations

import os
from pathlib import Path

import adopt_exact17_two_kalmanson_v2_canary_into_v3 as adoption
import pytest

from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes


def _private(path: Path, raw: bytes) -> None:
    path.parent.mkdir(mode=0o700, parents=True, exist_ok=True)
    path.write_bytes(raw)
    os.chmod(path, 0o600)


def _rejection_tree(root: Path) -> tuple[Path, list[dict[str, object]]]:
    base = root / "events" / f"{adoption.CELL_ID}.jsonl"
    digest = sha256_bytes(b"checkpoint")
    records: list[dict[str, object]] = [
        {
            "outcome": "CHECKPOINT",
            "record_sha256": "a" * 64,
            "event": {},
            "artifacts": {"checkpoint_sha256": digest},
        },
        {
            "outcome": "ERROR",
            "record_sha256": "b" * 64,
            "event": {
                "phase": "PREPARE",
                "disposition": "ERROR",
                "detail": "PIQD returned existing=true; no adoption or recovery owner is authorized",
            },
            "artifacts": {"checkpoint_sha256": digest},
        },
    ]
    journal = b"one\ntwo\n"
    _private(base, journal)
    _private(base.with_name(base.name + ".lock"), b"")
    _private(base.with_name(base.name + ".artifacts") / digest, b"checkpoint")
    seal: dict[str, object] = {
        "schema": "p97-cegar-wave-journal-seal/v1",
        "record_count": 2,
        "terminal_attempt_sha256": "b" * 64,
        "journal_sha256": sha256_bytes(journal),
        "wave_manifest_sha256": adoption.EXPECTED_WAVE_SHA256,
    }
    seal["seal_sha256"] = adoption._self_hash(seal, "seal_sha256")
    _private(
        base.with_name(base.name + ".seal.json"), canonical_json_bytes(seal) + b"\n"
    )
    return base, records


def test_rejection_requires_exact_duplicate_detail(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base, records = _rejection_tree(tmp_path)
    wave = {
        "encoding": {
            "cnf_sha256": adoption.EXPECTED_CNF_SHA256,
            "producer_manifest_sha256": adoption.EXPECTED_PRODUCER_SHA256,
        }
    }
    monkeypatch.setattr(
        adoption.runner, "_load_cell_inputs", lambda *args: (b"", b"", wave)
    )
    monkeypatch.setattr(adoption.runner, "_read_journal_records", lambda *args: records)
    monkeypatch.setattr(adoption.runner, "_journal_job_id", lambda rows: None)
    monkeypatch.setattr(
        adoption.runner,
        "_validate_artifact_directory",
        lambda path: {sha256_bytes(b"checkpoint")},
    )
    inventory, paths = adoption._validate_rejection(
        tmp_path, {"portfolio_cell_id": adoption.CELL_ID}
    )
    assert inventory["journal"]["sha256"] == sha256_bytes(b"one\ntwo\n")
    assert paths[0] == base
    records[-1]["event"]["detail"] = "different"
    with pytest.raises(adoption.AdoptionError, match="duplicate rejection"):
        adoption._validate_rejection(tmp_path, {"portfolio_cell_id": adoption.CELL_ID})


def test_archive_is_move_only_and_resumable(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _, records = _rejection_tree(tmp_path)
    wave = {
        "encoding": {
            "cnf_sha256": adoption.EXPECTED_CNF_SHA256,
            "producer_manifest_sha256": adoption.EXPECTED_PRODUCER_SHA256,
        }
    }
    monkeypatch.setattr(
        adoption.runner, "_load_cell_inputs", lambda *args: (b"", b"", wave)
    )
    monkeypatch.setattr(adoption.runner, "_read_journal_records", lambda *args: records)
    monkeypatch.setattr(adoption.runner, "_journal_job_id", lambda rows: None)
    monkeypatch.setattr(
        adoption.runner,
        "_validate_artifact_directory",
        lambda path: {sha256_bytes(b"checkpoint")},
    )
    complete = adoption._archive_rejection(
        tmp_path, {"portfolio_cell_id": adoption.CELL_ID}
    )
    assert complete.exists()
    assert not (tmp_path / "events" / f"{adoption.CELL_ID}.jsonl").exists()
    assert (
        adoption._archive_rejection(tmp_path, {"portfolio_cell_id": adoption.CELL_ID})
        == complete
    )
    _private(tmp_path / "events" / f"{adoption.CELL_ID}.jsonl", b"adopted terminal\n")
    assert (
        adoption._archive_rejection(tmp_path, {"portfolio_cell_id": adoption.CELL_ID})
        == complete
    )
    archived_artifact = (
        complete.parent
        / f"{adoption.CELL_ID}.jsonl.artifacts"
        / sha256_bytes(b"checkpoint")
    )
    archived_artifact.write_bytes(b"tampered")
    with pytest.raises(adoption.AdoptionError, match="archived artifact drifted"):
        adoption._archive_rejection(tmp_path, {"portfolio_cell_id": adoption.CELL_ID})


def test_create_once_rejects_tampering(tmp_path: Path) -> None:
    source, target = tmp_path / "source", tmp_path / "target"
    _private(source, b"sealed")
    adoption._copy_create_once(source, target, "sealed")
    adoption._copy_create_once(source, target, "sealed")
    target.write_bytes(b"tampered")
    with pytest.raises(adoption.AdoptionError, match="drifted"):
        adoption._copy_create_once(source, target, "sealed")


def test_json_validation_rejects_noncanonical() -> None:
    with pytest.raises(adoption.AdoptionError, match="canonical"):
        adoption._json(b'{"b": 1, "a": 2}', "payload")
    with pytest.raises(adoption.AdoptionError, match="duplicate JSON key"):
        adoption._json(b'{"a":1,"a":1}', "payload")
    with pytest.raises(adoption.AdoptionError, match="non-finite JSON constant"):
        adoption._json(b'{"a":NaN}', "payload")


def test_no_live_client_or_daemon_call(monkeypatch: pytest.MonkeyPatch) -> None:
    def forbidden(*args: object, **kwargs: object) -> object:
        raise AssertionError("live PIQD access is forbidden")

    monkeypatch.setattr(adoption, "PiqdRawDimacsClient", forbidden, raising=False)
    assert not hasattr(adoption, "_live_reverify")


def test_archive_rejects_symlinked_custody(tmp_path: Path) -> None:
    real = tmp_path / "real"
    _private(real, b"x")
    link = tmp_path / "link"
    link.symlink_to(real)
    with pytest.raises(adoption.AdoptionError, match="private regular"):
        adoption._read(link, label="symlink")
