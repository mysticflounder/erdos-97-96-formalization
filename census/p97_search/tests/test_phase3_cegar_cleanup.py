from __future__ import annotations

import json
import os
from pathlib import Path
from typing import Any

import pytest

import census.p97_search.phase3_cegar_cleanup as cleanup_module
from census.p97_search.phase3_cegar_cleanup import (
    RECEIPT_NAME,
    RECEIPT_SCHEMA,
    CleanupExecutionError,
    execute_quarantine_plan,
    validate_cleanup_plan,
    validate_quarantine_receipt,
)
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_cegar_wave_control import (
    ARTIFACT,
    NOT_RUN,
    PROTECTED_ARTIFACT,
    build_cleanup_plan,
)
from census.p97_search.tests.test_phase3_cegar_wave_control import _entry, _inventory


def _fixture(tmp_path: Path) -> tuple[bytes, bytes, dict[str, str], dict[str, object]]:
    tmp_path = tmp_path.resolve()
    entry = _entry(tmp_path)
    inventory_raw = _inventory(entry)
    approved = {str(entry["path"]): str(entry["sha256"])}
    plan = build_cleanup_plan(
        inventory_raw,
        tmp_path,
        expected_inventory_sha256=sha256_bytes(inventory_raw),
        approved_entrypoints=approved,
    )
    return inventory_raw, canonical_json_bytes(plan), approved, entry


def _engine_evidence(tmp_path: Path) -> tuple[list[dict[str, object]], list[str]]:
    paths = [
        "engine-envelope.json",
        "attempt-00000001/attempt.jsonl",
        "attempt-00000001/attempt.jsonl.lock",
        "attempt-00000001/attempt.jsonl.artifacts",
        "attempt-00000001/attempt.jsonl.seal.json",
        "attempt-00000001/solver-receipt.json",
        "attempt-00000001/custody-seal.json",
    ]
    entries: list[dict[str, object]] = []
    for index, relative in enumerate(paths):
        path = tmp_path / relative
        if relative.endswith(".artifacts"):
            path.mkdir(parents=True, exist_ok=True)
            payload = b"protected engine artifact directory\n"
        else:
            payload = f"protected engine evidence {index}\n".encode()
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(payload)
        entries.append(
            {
                "path": relative,
                "sha256": sha256_bytes(payload),
                "wave_id": "engine-wave",
                "kind": ARTIFACT,
                "lifecycle": PROTECTED_ARTIFACT,
                "replacement": None,
                "runtime_callers": [],
                "active_manifest_references": [],
                "static_callers": [],
                "receipt_paths": [],
                "artifact_paths": [],
                "archive_manifest": None,
                "rollback_pointer": None,
                "shadow_replay": {"status": NOT_RUN, "receipt": None},
                "historical_replay": {"status": NOT_RUN, "receipt": None},
                "active_writer": False,
                "cleanup_approved": False,
            }
        )
    return entries, paths


def test_quarantine_is_atomic_create_once_and_receipted(tmp_path: Path) -> None:
    tmp_path = tmp_path.resolve()
    inventory_raw, plan_raw, approved, entry = _fixture(tmp_path)
    target = tmp_path / str(entry["path"])
    quarantine = tmp_path / "quarantine"

    receipt = execute_quarantine_plan(
        plan_raw,
        inventory_raw,
        tmp_path,
        quarantine,
        expected_plan_sha256=sha256_bytes(plan_raw),
        approved_entrypoints=approved,
    )

    assert receipt["schema"] == RECEIPT_SCHEMA
    assert receipt["claims"] == {"deleted": False, "purge_supported": False}
    assert not target.exists()
    quarantined = quarantine / receipt["targets"][0]["quarantine_path"]
    assert quarantined.read_bytes() == b"print('legacy')\n"
    receipt_path = quarantine / RECEIPT_NAME
    receipt_raw = receipt_path.read_bytes()
    assert json.loads(receipt_raw) == receipt
    assert validate_quarantine_receipt(receipt_raw) == receipt
    with pytest.raises(CleanupExecutionError, match="plan no longer"):
        execute_quarantine_plan(
            plan_raw,
            inventory_raw,
            tmp_path,
            quarantine,
            expected_plan_sha256=sha256_bytes(plan_raw),
            approved_entrypoints=approved,
        )


def test_quarantine_requires_exact_plan_digest_and_canonical_plan(
    tmp_path: Path,
) -> None:
    tmp_path = tmp_path.resolve()
    inventory_raw, plan_raw, approved, _ = _fixture(tmp_path)
    with pytest.raises(CleanupExecutionError, match="approved digest"):
        execute_quarantine_plan(
            plan_raw,
            inventory_raw,
            tmp_path,
            tmp_path / "quarantine",
            expected_plan_sha256="0" * 64,
            approved_entrypoints=approved,
        )


def test_quarantine_rejects_noncanonical_repo_root_before_creation(
    tmp_path: Path,
) -> None:
    tmp_path = tmp_path.resolve()
    inventory_raw, plan_raw, approved, _entry_record = _fixture(tmp_path)
    alias = tmp_path.parent / f"{tmp_path.name}-alias"
    alias.symlink_to(tmp_path, target_is_directory=True)
    quarantine = tmp_path / "quarantine"
    try:
        with pytest.raises(CleanupExecutionError, match="canonical no-symlink"):
            execute_quarantine_plan(
                plan_raw,
                inventory_raw,
                alias,
                quarantine,
                expected_plan_sha256=sha256_bytes(plan_raw),
                approved_entrypoints=approved,
            )
        assert not quarantine.exists()
    finally:
        alias.unlink()
    with pytest.raises(CleanupExecutionError, match="canonical"):
        validate_cleanup_plan(plan_raw + b"\n")


def test_quarantine_rejects_globs_and_symlink_targets(tmp_path: Path) -> None:
    tmp_path = tmp_path.resolve()
    inventory_raw, plan_raw, approved, entry = _fixture(tmp_path)
    plan = json.loads(plan_raw)
    plan["targets"][0]["path"] = "scripts/*.py"
    with pytest.raises(CleanupExecutionError, match="non-glob"):
        validate_cleanup_plan(canonical_json_bytes(plan))

    target = tmp_path / str(entry["path"])
    target.unlink()
    target.symlink_to("wave-framework.py")
    with pytest.raises(CleanupExecutionError, match="plan no longer"):
        execute_quarantine_plan(
            plan_raw,
            inventory_raw,
            tmp_path,
            tmp_path / "quarantine",
            expected_plan_sha256=sha256_bytes(plan_raw),
            approved_entrypoints=approved,
        )


def test_engine_envelope_and_attempt_evidence_are_never_cleanup_targets(
    tmp_path: Path,
) -> None:
    tmp_path = tmp_path.resolve()
    entry = _entry(tmp_path)
    protected_entries, protected_paths = _engine_evidence(tmp_path)
    entry["artifact_paths"] = sorted(["artifacts/legacy-proof.lrat", *protected_paths])
    inventory_raw = _inventory(entry, *protected_entries)
    approved = {str(entry["path"]): str(entry["sha256"])}
    plan = build_cleanup_plan(
        inventory_raw,
        tmp_path,
        expected_inventory_sha256=sha256_bytes(inventory_raw),
        approved_entrypoints=approved,
    )
    plan_raw = canonical_json_bytes(plan)
    validated = validate_cleanup_plan(plan_raw)

    assert {target["path"] for target in validated["targets"]} == {str(entry["path"])}
    blocked = {item["path"] for item in validated["blocked"]}
    assert set(protected_paths) <= blocked

    for protected in protected_paths:
        forged = json.loads(plan_raw)
        forged["targets"][0]["path"] = protected
        forged["targets"][0]["preserved_artifact_paths"] = [
            "artifacts/legacy-proof.lrat"
        ]
        forged_raw = canonical_json_bytes(forged)
        validate_cleanup_plan(forged_raw)
        with pytest.raises(CleanupExecutionError, match="plan no longer matches"):
            execute_quarantine_plan(
                forged_raw,
                inventory_raw,
                tmp_path,
                tmp_path / "quarantine",
                expected_plan_sha256=sha256_bytes(forged_raw),
                approved_entrypoints=approved,
            )

    for relative in protected_paths:
        assert (tmp_path / relative).exists()
    assert not (tmp_path / "quarantine").exists()


def test_quarantine_rejects_replacement_after_source_capture(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    tmp_path = tmp_path.resolve()
    inventory_raw, plan_raw, approved, entry = _fixture(tmp_path)
    target = tmp_path / str(entry["path"])
    quarantine = tmp_path / "quarantine"
    original_move = cleanup_module._atomic_quarantine_move

    def replace_before_move(
        source: Path, destination_name: str, expected: Any, destination_fd: int
    ) -> dict[str, Any]:
        replacement = source.with_name(f"{source.name}.replacement")
        replacement.write_bytes(b"replacement\n")
        os.replace(replacement, source)
        return original_move(source, destination_name, expected, destination_fd)

    monkeypatch.setattr(cleanup_module, "_atomic_quarantine_move", replace_before_move)
    with pytest.raises(CleanupExecutionError, match="identity crossed"):
        execute_quarantine_plan(
            plan_raw,
            inventory_raw,
            tmp_path,
            quarantine,
            expected_plan_sha256=sha256_bytes(plan_raw),
            approved_entrypoints=approved,
        )

    assert target.read_bytes() == b"replacement\n"
    assert quarantine.is_dir()
    assert not (quarantine / RECEIPT_NAME).exists()


def test_quarantine_root_rebind_cannot_redirect_move_or_receipt(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    tmp_path = tmp_path.resolve()
    inventory_raw, plan_raw, approved, _entry = _fixture(tmp_path)
    quarantine = tmp_path / "quarantine"
    held_root = tmp_path / "quarantine-held"
    original_move = cleanup_module._atomic_quarantine_move

    def rebind_root(
        source: Path, destination_name: str, expected: Any, destination_fd: int
    ) -> dict[str, Any]:
        quarantine.rename(held_root)
        quarantine.mkdir()
        (quarantine / "attacker-marker").write_bytes(b"untouched\n")
        return original_move(source, destination_name, expected, destination_fd)

    monkeypatch.setattr(cleanup_module, "_atomic_quarantine_move", rebind_root)
    receipt = execute_quarantine_plan(
        plan_raw,
        inventory_raw,
        tmp_path,
        quarantine,
        expected_plan_sha256=sha256_bytes(plan_raw),
        approved_entrypoints=approved,
    )

    assert (quarantine / "attacker-marker").read_bytes() == b"untouched\n"
    assert (held_root / RECEIPT_NAME).is_file()
    assert json.loads((held_root / RECEIPT_NAME).read_bytes()) == receipt
    assert not (quarantine / RECEIPT_NAME).exists()


def test_same_length_content_mutation_is_detected_after_held_move(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    tmp_path = tmp_path.resolve()
    inventory_raw, plan_raw, approved, entry = _fixture(tmp_path)
    target = tmp_path / str(entry["path"])
    quarantine = tmp_path / "quarantine"
    original_rename = cleanup_module._rename_noreplace

    def mutate_then_rename(
        source_fd: int, source_name: str, destination_fd: int, destination_name: str
    ) -> None:
        descriptor = os.open(source_name, os.O_WRONLY, dir_fd=source_fd)
        try:
            os.pwrite(descriptor, b"X" * len(b"print('legacy')\n"), 0)
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
        original_rename(source_fd, source_name, destination_fd, destination_name)

    monkeypatch.setattr(cleanup_module, "_rename_noreplace", mutate_then_rename)
    with pytest.raises(CleanupExecutionError, match="digest crossed"):
        execute_quarantine_plan(
            plan_raw,
            inventory_raw,
            tmp_path,
            quarantine,
            expected_plan_sha256=sha256_bytes(plan_raw),
            approved_entrypoints=approved,
        )

    assert not target.exists()
    assert quarantine.is_dir()
    assert not (quarantine / RECEIPT_NAME).exists()
