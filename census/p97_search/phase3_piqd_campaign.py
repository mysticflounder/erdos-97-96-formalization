"""Bounded, fail-closed custody and repeated-survivor controller for P97 piqd.

This is deliberately not a scheduler.  It processes one predeclared cell at a
time, authenticates its finite-local evidence, and emits a stop/pivot result
after three adjacent diagnostic-equivalent structural SAT survivors.
"""

from __future__ import annotations

import argparse
import fcntl
import hashlib
import json
import os
import stat
import sys
import uuid
from collections.abc import Iterator, Mapping, Sequence
from contextlib import contextmanager
from pathlib import Path
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    STRUCTURAL_SAT,
    validate_wave_manifest,
)
from census.p97_search.phase3_piqd_driver import DurableAttemptJournal
from census.p97_search.phase3_piqd_exact12_replay import (
    REPLAY_SCHEMA,
    Exact12PiqdReplayError,
    canonical_json_bytes,
    derive_source_duplicate_center_classifier_snapshot,
    validate_source_duplicate_center_classifier,
)

CAMPAIGN_SCHEMA = "p97-cegar-campaign/v2"
CLASSIFIER_SCHEMA = "p97-cegar-diagnostic-classifier/v1"
RECORD_SCHEMA = "p97-cegar-campaign-record/v2"
RESULT_SCHEMA = "p97-cegar-campaign-result/v2"
PACKAGE_IDENTITY_SCHEMA = "p97-phase3-piqd-package-identity/v1"
_LEGACY_CAMPAIGN_SCHEMA = "p97-cegar-campaign/v1"
_LEGACY_RECORD_SCHEMA = "p97-cegar-campaign-record/v1"
_LEGACY_RESULT_SCHEMA = "p97-cegar-campaign-result/v1"
DIAGNOSTIC_STATUS = "DIAGNOSTIC_ONLY_NOT_SOURCE_ENTITLED"
CAMPAIGN_SCOPE = (
    "bounded finite-local source-derived custody and repeated-survivor stop "
    "control only; no scheduling, aggregate coverage, universal lift, or Lean "
    "theorem closure"
)
DIAGNOSTIC_SCOPE = (
    "self-declared diagnostic classifier only; no source entitlement, campaign "
    "admission, aggregate coverage, universal lift, or Lean theorem closure"
)
NO_CLAIMS = {
    "aggregate_coverage": False,
    "universal_lift": False,
    "lean_theorem_closure": False,
}
THRESHOLD = 3
MAX_IN_FLIGHT = 1
_HEX = frozenset("0123456789abcdef")
_PACKAGE_FILES = (
    "clause-delta.json",
    "compiler-manifest.json",
    "discovery.cnf",
    "ingress-contract.json",
    "order-cell.json",
    "producer-manifest.json",
    "source-bundle.json",
    "source-job.json",
    "variable-map.json",
    "wave-manifest.json",
)
_CAMPAIGN_KEYS = frozenset(
    {"schema", "scope", "claims", "threshold", "max_in_flight", "pivot_id", "cells"}
)
_CELL_KEYS = frozenset(
    {
        "ordinal",
        "cell_index",
        "package_dir",
        "package_identity_sha256",
        "wave_manifest_sha256",
        "source_bundle_sha256",
    }
)
_CLASSIFIER_KEYS = frozenset(
    {
        "schema",
        "status",
        "scope",
        "model_sha256",
        "source_bundle_sha256",
        "detector_contract_sha256",
        "certificate_sha256",
        "stage",
    }
)
_RECORD_KEYS = frozenset(
    {
        "schema",
        "campaign_sha256",
        "ordinal",
        "cell_index",
        "package_identity_sha256",
        "wave_manifest_sha256",
        "journal_seal_sha256",
        "terminal_record_sha256",
        "model_sha256",
        "receipt_sha256",
        "classifier_sha256",
        "equivalence_key",
        "evidence_status",
        "claims",
        "previous_record_sha256",
        "record_sha256",
    }
)


class PiqdCampaignError(ValueError):
    """Campaign input, evidence, or durable state failed closed."""


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def sha256_json(value: Any) -> str:
    return sha256_bytes(canonical_json_bytes(value))


def _exact_keys(value: Mapping[str, Any], keys: frozenset[str], path: str) -> None:
    missing = sorted(keys - value.keys())
    extra = sorted(value.keys() - keys)
    if missing or extra:
        raise PiqdCampaignError(
            f"{path} keys mismatch: missing={missing}, extra={extra}"
        )


def _string(value: Any, path: str) -> str:
    if not isinstance(value, str) or not value.strip():
        raise PiqdCampaignError(f"{path} must be a non-empty string")
    return value


def _integer(value: Any, path: str, *, minimum: int = 0) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value < minimum:
        raise PiqdCampaignError(f"{path} must be an integer >= {minimum}")
    return value


def _digest(value: Any, path: str) -> str:
    if (
        not isinstance(value, str)
        or len(value) != 64
        or any(c not in _HEX for c in value)
    ):
        raise PiqdCampaignError(f"{path} must be a lowercase SHA-256 digest")
    return value


def _strict_json(
    raw: bytes, *, source: str, canonical: bool = True
) -> Mapping[str, Any]:
    def reject_constant(value: str) -> None:
        raise ValueError(f"nonstandard JSON constant: {value}")

    def reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate object key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw, parse_constant=reject_constant, object_pairs_hook=reject_duplicates
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise PiqdCampaignError(f"{source} is not strict JSON") from exc
    if not isinstance(value, Mapping):
        raise PiqdCampaignError(f"{source} must be a JSON object")
    if canonical and raw != canonical_json_bytes(value):
        raise PiqdCampaignError(f"{source} is not canonical JSON")
    return value


def _open_parent_no_follow(absolute: Path, label: str) -> int:
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        parent = os.open(absolute.anchor, flags)
    except OSError as exc:
        raise PiqdCampaignError(
            f"cannot safely open parent for {label}: {absolute}"
        ) from exc
    try:
        for component in absolute.parts[1:-1]:
            nxt = os.open(component, flags, dir_fd=parent)
            os.close(parent)
            parent = nxt
        return parent
    except OSError as exc:
        os.close(parent)
        raise PiqdCampaignError(
            f"parent for {label} contains a symlink or is unavailable: {absolute.parent}"
        ) from exc


def _safe_read(path: Path, label: str) -> bytes:
    absolute = Path(os.path.abspath(os.fspath(path)))
    parent = _open_parent_no_follow(absolute, label)
    try:
        fd = os.open(
            absolute.name,
            os.O_RDONLY | os.O_NONBLOCK | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=parent,
        )
        try:
            if not stat.S_ISREG(os.fstat(fd).st_mode):
                raise PiqdCampaignError(f"{label} is not a regular file: {absolute}")
            chunks: list[bytes] = []
            while chunk := os.read(fd, 1024 * 1024):
                chunks.append(chunk)
            return b"".join(chunks)
        finally:
            os.close(fd)
    except OSError as exc:
        raise PiqdCampaignError(f"cannot safely read {label}: {absolute}") from exc
    finally:
        os.close(parent)


def _regular_file_exists(path: Path, label: str) -> bool:
    """Check optional state without following a final-component symlink."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    parent = _open_parent_no_follow(absolute, label)
    try:
        try:
            metadata = os.stat(absolute.name, dir_fd=parent, follow_symlinks=False)
        except FileNotFoundError:
            return False
        if not stat.S_ISREG(metadata.st_mode):
            raise PiqdCampaignError(f"{label} is not a regular file: {absolute}")
        return True
    finally:
        os.close(parent)


def _safe_directory_entries(path: Path, label: str) -> tuple[str, ...]:
    """Open a directory without symlinks and validate each entry as regular."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    parent = _open_parent_no_follow(absolute, label)
    descriptor: int | None = None
    try:
        descriptor = os.open(
            absolute.name,
            os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=parent,
        )
        if not stat.S_ISDIR(os.fstat(descriptor).st_mode):
            raise PiqdCampaignError(f"{label} is not a directory: {absolute}")
        entries = tuple(sorted(os.listdir(descriptor)))
        for name in entries:
            try:
                metadata = os.stat(name, dir_fd=descriptor, follow_symlinks=False)
            except OSError as exc:
                raise PiqdCampaignError(
                    f"cannot safely inspect {label} artifact: {absolute / name}"
                ) from exc
            if not stat.S_ISREG(metadata.st_mode):
                raise PiqdCampaignError(
                    f"{label} artifact is not a regular file: {absolute / name}"
                )
            artifact_fd = os.open(
                name,
                os.O_RDONLY | os.O_NONBLOCK | getattr(os, "O_NOFOLLOW", 0),
                dir_fd=descriptor,
            )
            try:
                if not stat.S_ISREG(os.fstat(artifact_fd).st_mode):
                    raise PiqdCampaignError(
                        f"{label} artifact is not a regular file: {absolute / name}"
                    )
            finally:
                os.close(artifact_fd)
        return entries
    except OSError as exc:
        raise PiqdCampaignError(f"cannot safely open {label}: {absolute}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        os.close(parent)


def _preflight_driver_storage(journal_path: Path) -> None:
    """Fail closed before the adjacent journal implementation touches paths."""

    journal_path = Path(journal_path)
    _safe_read(journal_path, "driver journal")
    _safe_read(
        journal_path.with_name(f"{journal_path.name}.seal.json"),
        "driver journal seal",
    )
    entries = _safe_directory_entries(
        journal_path.with_name(f"{journal_path.name}.artifacts"),
        "driver artifact directory",
    )
    if not entries:
        raise PiqdCampaignError("driver artifact directory is empty")
    for name in entries:
        _digest(name, "driver artifact filename")


@contextmanager
def _campaign_lock(state_path: Path) -> Iterator[None]:
    """Serialize validation, evidence authentication, and campaign writes."""

    lock_path = state_path.with_name(f"{state_path.name}.lock")
    absolute = Path(os.path.abspath(os.fspath(lock_path)))
    parent = _open_parent_no_follow(absolute, "campaign lock")
    descriptor: int | None = None
    try:
        try:
            metadata = os.stat(absolute.name, dir_fd=parent, follow_symlinks=False)
        except FileNotFoundError:
            metadata = None
        if metadata is not None and not stat.S_ISREG(metadata.st_mode):
            raise PiqdCampaignError(f"campaign lock is not a regular file: {absolute}")
        flags = os.O_RDWR | os.O_CREAT | getattr(os, "O_NOFOLLOW", 0)
        try:
            descriptor = os.open(absolute.name, flags, 0o600, dir_fd=parent)
        except FileNotFoundError:
            # Some platforms transiently report ENOENT when concurrent creators
            # race on O_CREAT|O_NOFOLLOW. Re-open once against the held parent fd.
            descriptor = os.open(absolute.name, flags, 0o600, dir_fd=parent)
        if not stat.S_ISREG(os.fstat(descriptor).st_mode):
            raise PiqdCampaignError(f"campaign lock is not a regular file: {absolute}")
        fcntl.flock(descriptor, fcntl.LOCK_EX)
        yield
    except OSError as exc:
        raise PiqdCampaignError(
            f"cannot safely lock campaign state: {absolute}"
        ) from exc
    finally:
        if descriptor is not None:
            try:
                fcntl.flock(descriptor, fcntl.LOCK_UN)
            finally:
                os.close(descriptor)
        os.close(parent)


def _atomic_write(path: Path, payload: bytes) -> None:
    absolute = Path(os.path.abspath(os.fspath(path)))
    parent = _open_parent_no_follow(absolute, "atomic write")
    temporary = f".{absolute.name}.{uuid.uuid4().hex}.tmp"
    try:
        try:
            current = os.stat(absolute.name, dir_fd=parent, follow_symlinks=False)
        except FileNotFoundError:
            current = None
        if current is not None and not stat.S_ISREG(current.st_mode):
            raise PiqdCampaignError(f"write target is not a regular file: {absolute}")
        fd = os.open(
            temporary,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
            0o600,
            dir_fd=parent,
        )
        try:
            offset = 0
            while offset < len(payload):
                written = os.write(fd, payload[offset:])
                if written <= 0:
                    raise OSError("write made no progress")
                offset += written
            os.fsync(fd)
        finally:
            os.close(fd)
        os.replace(temporary, absolute.name, src_dir_fd=parent, dst_dir_fd=parent)
        os.fsync(parent)
    except OSError as exc:
        raise PiqdCampaignError(f"cannot atomically write {absolute}") from exc
    finally:
        try:
            os.unlink(temporary, dir_fd=parent)
        except FileNotFoundError:
            pass
        os.close(parent)


def _canonical_file(path: Path, label: str) -> tuple[Mapping[str, Any], bytes]:
    raw = _safe_read(path, label)
    return _strict_json(raw, source=label), raw


def _package_snapshot(package_dir: Path) -> dict[str, bytes]:
    return {
        name: _safe_read(package_dir / name, f"package artifact {name}")
        for name in _PACKAGE_FILES
    }


def _package_identity_from_snapshot(raw: Mapping[str, bytes]) -> dict[str, Any]:
    artifacts = {name: sha256_bytes(raw[name]) for name in _PACKAGE_FILES}
    return {"schema": PACKAGE_IDENTITY_SCHEMA, "artifacts": artifacts}


def package_identity(package_dir: Path) -> dict[str, Any]:
    """Return the content identity of one no-follow package snapshot."""

    return _package_identity_from_snapshot(_package_snapshot(Path(package_dir)))


def _mapping(value: Any, path: str) -> Mapping[str, Any]:
    if not isinstance(value, Mapping):
        raise PiqdCampaignError(f"{path} must be an object")
    return value


def _validate_package_bindings(
    raw: Mapping[str, bytes], wave: Mapping[str, Any], expected_cell_index: int
) -> Mapping[str, Any]:
    """Cross-bind the wave, producer, and package-side identity surfaces."""

    documents = {
        name: _strict_json(payload, source=f"package artifact {name}")
        for name, payload in raw.items()
        if name != "discovery.cnf"
    }
    source_job = documents["source-job.json"]
    producer = documents["producer-manifest.json"]
    variable_map = documents["variable-map.json"]
    order_cell = documents["order-cell.json"]
    clause_delta = documents["clause-delta.json"]
    compiler_manifest = documents["compiler-manifest.json"]

    encoding = _mapping(wave.get("encoding"), "wave.encoding")
    execution = _mapping(wave.get("execution"), "wave.execution")
    source = _mapping(wave.get("source"), "wave.source")
    if (
        _integer(source_job.get("cell_index"), "source_job.cell_index")
        != expected_cell_index
    ):
        raise PiqdCampaignError(
            "source-job cell_index differs from campaign cell_index"
        )
    if (
        _integer(execution.get("shard_id"), "wave.execution.shard_id")
        != expected_cell_index
    ):
        raise PiqdCampaignError("wave shard_id differs from campaign cell_index")

    expected_wave_hashes = {
        "discovery.cnf": encoding.get("cnf_sha256"),
        "variable-map.json": encoding.get("variable_map_sha256"),
        "producer-manifest.json": encoding.get("producer_manifest_sha256"),
        "order-cell.json": execution.get("order_sha256"),
        "ingress-contract.json": source.get("ingress_hypotheses_sha256"),
    }
    for name, expected in expected_wave_hashes.items():
        if _digest(expected, f"wave binding for {name}") != sha256_bytes(raw[name]):
            raise PiqdCampaignError(f"wave hash differs from package artifact {name}")

    artifacts = _mapping(producer.get("artifacts"), "producer.artifacts")
    artifact_names = {
        "clause_delta": "clause-delta.json",
        "cnf": "discovery.cnf",
        "compiler_manifest": "compiler-manifest.json",
        "ingress_contract": "ingress-contract.json",
        "order_cell": "order-cell.json",
        "source_bundle": "source-bundle.json",
        "source_job": "source-job.json",
        "variable_map": "variable-map.json",
    }
    for logical_name, filename in artifact_names.items():
        reference = _mapping(
            artifacts.get(logical_name), f"producer.artifacts.{logical_name}"
        )
        if reference.get("path") != filename:
            raise PiqdCampaignError(
                f"producer artifact {logical_name} path is not {filename}"
            )
        if _digest(
            reference.get("sha256"), f"producer.artifacts.{logical_name}.sha256"
        ) != sha256_bytes(raw[filename]):
            raise PiqdCampaignError(
                f"producer artifact {logical_name} hash differs from package file"
            )

    cnf = _mapping(source_job.get("cnf"), "source_job.cnf")
    cnf_reference = _mapping(artifacts.get("cnf"), "producer.artifacts.cnf")
    for field, expected in (
        ("sha256", encoding.get("cnf_sha256")),
        ("n_variables", encoding.get("num_variables")),
        ("n_clauses", encoding.get("num_clauses")),
        ("bytes", cnf_reference.get("bytes")),
    ):
        if cnf.get(field) != expected:
            raise PiqdCampaignError(f"source-job CNF {field} binding mismatch")
    if cnf.get("bytes") != len(raw["discovery.cnf"]):
        raise PiqdCampaignError("source-job CNF byte-count binding mismatch")
    if cnf_reference.get("num_variables") != encoding.get(
        "num_variables"
    ) or cnf_reference.get("num_clauses") != encoding.get("num_clauses"):
        raise PiqdCampaignError("producer CNF count binding mismatch")

    job_id = _string(source_job.get("job_id"), "source_job.job_id")
    if variable_map.get("job_id") != job_id or order_cell.get("job_id") != job_id:
        raise PiqdCampaignError("package job_id binding mismatch")
    if (
        _integer(variable_map.get("cell_index"), "variable_map.cell_index")
        != expected_cell_index
    ):
        raise PiqdCampaignError("variable-map cell_index binding mismatch")
    if (
        _integer(order_cell.get("shard_id"), "order_cell.shard_id")
        != expected_cell_index
    ):
        raise PiqdCampaignError("order-cell shard_id binding mismatch")
    if _integer(
        order_cell.get("shard_count"), "order_cell.shard_count", minimum=1
    ) != execution.get("shard_count"):
        raise PiqdCampaignError("order-cell shard_count binding mismatch")

    compiler_hash = sha256_bytes(raw["compiler-manifest.json"])
    delta_hash = sha256_bytes(raw["clause-delta.json"])
    if source_job.get("compiler_manifest_sha256") != compiler_hash:
        raise PiqdCampaignError("source-job compiler manifest hash mismatch")
    if source_job.get("clause_delta_artifact_sha256") != delta_hash:
        raise PiqdCampaignError("source-job clause-delta hash mismatch")
    if source_job.get("compiler_manifest") != compiler_manifest:
        raise PiqdCampaignError("source-job embedded compiler manifest mismatch")
    if source_job.get("clause_delta_artifact") != clause_delta:
        raise PiqdCampaignError("source-job embedded clause-delta mismatch")
    delta_hashes = _mapping(clause_delta.get("hashes"), "clause_delta.hashes")
    if delta_hashes.get("dimacs_sha256") != encoding.get("cnf_sha256"):
        raise PiqdCampaignError("clause-delta DIMACS hash binding mismatch")

    provenance = _mapping(producer.get("provenance"), "producer.provenance")
    provenance_expected = {
        "source_bundle_sha256": sha256_bytes(raw["source-bundle.json"]),
        "compiler_manifest_sha256": compiler_hash,
        "clause_delta_artifact_sha256": delta_hash,
    }
    for field, expected in provenance_expected.items():
        if provenance.get(field) != expected:
            raise PiqdCampaignError(f"producer provenance {field} binding mismatch")
    return source_job


def make_campaign_manifest(
    package_dirs: Sequence[Path], pivot_id: str
) -> dict[str, Any]:
    """Construct a canonical campaign manifest from ordered package directories."""

    _string(pivot_id, "pivot_id")
    if not package_dirs:
        raise PiqdCampaignError("campaign must contain at least one cell")
    cells: list[dict[str, Any]] = []
    for ordinal, raw_dir in enumerate(package_dirs):
        directory = Path(os.path.abspath(os.fspath(raw_dir)))
        raw = _package_snapshot(directory)
        wave_raw = raw["wave-manifest.json"]
        wave = _strict_json(wave_raw, source="package artifact wave-manifest.json")
        validate_wave_manifest(wave)
        source_job = _strict_json(
            raw["source-job.json"], source="package artifact source-job.json"
        )
        bundle_raw = raw["source-bundle.json"]
        _strict_json(bundle_raw, source="source bundle")
        cell_index = _integer(source_job.get("cell_index"), "source_job.cell_index")
        if wave["execution"]["shard_id"] != cell_index:
            raise PiqdCampaignError("wave shard_id differs from source-job cell_index")
        _validate_package_bindings(raw, wave, cell_index)
        identity = _package_identity_from_snapshot(raw)
        cells.append(
            {
                "ordinal": ordinal,
                "cell_index": cell_index,
                "package_dir": os.fspath(directory),
                "package_identity_sha256": sha256_json(identity),
                "wave_manifest_sha256": sha256_bytes(wave_raw),
                "source_bundle_sha256": sha256_bytes(bundle_raw),
            }
        )
    manifest = {
        "schema": CAMPAIGN_SCHEMA,
        "scope": CAMPAIGN_SCOPE,
        "claims": dict(NO_CLAIMS),
        "threshold": THRESHOLD,
        "max_in_flight": MAX_IN_FLIGHT,
        "pivot_id": pivot_id,
        "cells": cells,
    }
    validate_campaign_manifest(manifest)
    return manifest


def validate_campaign_manifest(manifest: Mapping[str, Any]) -> None:
    _exact_keys(manifest, _CAMPAIGN_KEYS, "campaign")
    if manifest["schema"] == _LEGACY_CAMPAIGN_SCHEMA:
        raise PiqdCampaignError(
            "legacy v1 campaign manifest is not admissible; regenerate a v2 campaign"
        )
    if manifest["schema"] != CAMPAIGN_SCHEMA or manifest["scope"] != CAMPAIGN_SCOPE:
        raise PiqdCampaignError("campaign schema or scope mismatch")
    if manifest["claims"] != NO_CLAIMS:
        raise PiqdCampaignError(
            "campaign claims must explicitly deny coverage and closure"
        )
    if (
        _integer(manifest["threshold"], "campaign.threshold", minimum=1) != THRESHOLD
        or _integer(manifest["max_in_flight"], "campaign.max_in_flight", minimum=1)
        != MAX_IN_FLIGHT
    ):
        raise PiqdCampaignError(
            "campaign threshold must be 3 and max_in_flight must be 1"
        )
    _string(manifest["pivot_id"], "campaign.pivot_id")
    cells = manifest["cells"]
    if not isinstance(cells, list) or not cells:
        raise PiqdCampaignError("campaign.cells must be a non-empty array")
    seen: set[int] = set()
    for ordinal, item in enumerate(cells):
        if not isinstance(item, Mapping):
            raise PiqdCampaignError(f"campaign.cells[{ordinal}] must be an object")
        _exact_keys(item, _CELL_KEYS, f"campaign.cells[{ordinal}]")
        if _integer(item["ordinal"], f"campaign.cells[{ordinal}].ordinal") != ordinal:
            raise PiqdCampaignError("campaign cell ordinals must be dense and ordered")
        cell_index = _integer(
            item["cell_index"], f"campaign.cells[{ordinal}].cell_index"
        )
        if cell_index in seen:
            raise PiqdCampaignError("campaign cell_index values must be unique")
        seen.add(cell_index)
        _string(item["package_dir"], f"campaign.cells[{ordinal}].package_dir")
        for key in (
            "package_identity_sha256",
            "wave_manifest_sha256",
            "source_bundle_sha256",
        ):
            _digest(item[key], f"campaign.cells[{ordinal}].{key}")


def make_classifier(
    *,
    model_sha256: str,
    source_bundle_sha256: str,
    detector_contract_sha256: str,
    certificate_sha256: str,
    stage: str,
) -> dict[str, Any]:
    """Construct a canonical diagnostic-only classifier artifact."""

    artifact = {
        "schema": CLASSIFIER_SCHEMA,
        "status": DIAGNOSTIC_STATUS,
        "scope": DIAGNOSTIC_SCOPE,
        "model_sha256": _digest(model_sha256, "model_sha256"),
        "source_bundle_sha256": _digest(source_bundle_sha256, "source_bundle_sha256"),
        "detector_contract_sha256": _digest(
            detector_contract_sha256, "detector_contract_sha256"
        ),
        "certificate_sha256": _digest(certificate_sha256, "certificate_sha256"),
        "stage": _string(stage, "stage"),
    }
    validate_classifier(artifact)
    return artifact


def validate_classifier(value: Mapping[str, Any]) -> None:
    _exact_keys(value, _CLASSIFIER_KEYS, "classifier")
    if value["schema"] != CLASSIFIER_SCHEMA or value["status"] != DIAGNOSTIC_STATUS:
        raise PiqdCampaignError("classifier schema or diagnostic status mismatch")
    if value["scope"] != DIAGNOSTIC_SCOPE:
        raise PiqdCampaignError("classifier scope mismatch")
    for key in (
        "model_sha256",
        "source_bundle_sha256",
        "detector_contract_sha256",
        "certificate_sha256",
    ):
        _digest(value[key], f"classifier.{key}")
    _string(value["stage"], "classifier.stage")


def write_canonical_json(path: Path, value: Mapping[str, Any]) -> None:
    _atomic_write(path, canonical_json_bytes(value) + b"\n")


def _load_canonical_line(path: Path, label: str) -> tuple[Mapping[str, Any], bytes]:
    raw = _safe_read(path, label)
    if not raw.endswith(b"\n") or b"\n" in raw[:-1]:
        raise PiqdCampaignError(
            f"{label} must be one newline-terminated canonical JSON object"
        )
    return _strict_json(raw[:-1], source=label), raw


def _equivalence_key(classifier: Mapping[str, Any]) -> str:
    return sha256_json(
        {
            "source_bundle_sha256": classifier["source_bundle_sha256"],
            "detector_contract_sha256": classifier["detector_contract_sha256"],
            "stage": classifier["stage"],
        }
    )


def _authenticate_cell(
    manifest: Mapping[str, Any],
    ordinal: int,
    journal_path: Path,
    receipt_path: Path,
    classifier_path: Path,
    repo_root: Path,
) -> dict[str, Any]:
    cell = manifest["cells"][ordinal]
    package_dir = Path(cell["package_dir"])
    package_raw = _package_snapshot(package_dir)
    if (
        sha256_json(_package_identity_from_snapshot(package_raw))
        != cell["package_identity_sha256"]
    ):
        raise PiqdCampaignError("package identity mismatch")
    wave_raw = package_raw["wave-manifest.json"]
    wave = _strict_json(wave_raw, source="package artifact wave-manifest.json")
    validate_wave_manifest(wave)
    if sha256_bytes(wave_raw) != cell["wave_manifest_sha256"]:
        raise PiqdCampaignError("wave manifest identity mismatch")
    source_job = _validate_package_bindings(package_raw, wave, cell["cell_index"])
    bundle_raw = package_raw["source-bundle.json"]
    if sha256_bytes(bundle_raw) != cell["source_bundle_sha256"]:
        raise PiqdCampaignError("source bundle identity mismatch")

    _preflight_driver_storage(Path(journal_path))
    journal = DurableAttemptJournal(Path(journal_path), manifest=wave)
    if journal._seal is None:  # validated on load; do not manufacture a missing seal
        raise PiqdCampaignError("driver journal is not sealed")
    if not journal.records:
        raise PiqdCampaignError("driver journal is empty")
    terminal = journal.records[-1]
    if terminal["outcome"] != STRUCTURAL_SAT:
        raise PiqdCampaignError("terminal driver outcome is not STRUCTURAL_SAT")
    model_sha256 = _digest(terminal["artifacts"].get("model_sha256"), "terminal model")
    model_path = journal.artifact_dir / model_sha256
    model_raw = _safe_read(model_path, "archived piqd model")
    if sha256_bytes(model_raw) != model_sha256:
        raise PiqdCampaignError("archived model hash mismatch")
    model = _strict_json(model_raw, source="archived piqd model", canonical=False)
    piqd_job_id = _string(model.get("job_id"), "model.job_id")
    if model.get("result") != "SAT":
        raise PiqdCampaignError("archived model result is not SAT")
    checkpoint_sha256 = _digest(
        terminal["artifacts"].get("checkpoint_sha256"), "terminal checkpoint"
    )
    checkpoint_raw = _safe_read(
        journal.artifact_dir / checkpoint_sha256, "terminal checkpoint event"
    )
    if sha256_bytes(checkpoint_raw) != checkpoint_sha256:
        raise PiqdCampaignError("terminal checkpoint event hash mismatch")
    checkpoint = _strict_json(checkpoint_raw, source="terminal checkpoint event")
    if (
        checkpoint.get("job_id") != piqd_job_id
        or checkpoint.get("status") != "completed"
        or checkpoint.get("result") != "SAT"
        or checkpoint.get("phase") != "MODEL"
        or checkpoint.get("disposition") != "SUCCESS"
    ):
        raise PiqdCampaignError(
            "terminal checkpoint event is not completed SAT for the archived model"
        )

    receipt, receipt_raw = _load_canonical_line(receipt_path, "source-semantic receipt")
    if receipt.get("schema") != REPLAY_SCHEMA or receipt.get("status") != "ACCEPTED":
        raise PiqdCampaignError(
            "source-semantic receipt is not ACCEPTED exact12 replay"
        )
    gates = receipt.get("gates")
    if (
        not isinstance(gates, Mapping)
        or not gates
        or any(
            not isinstance(gate, Mapping) or gate.get("ok") is not True
            for gate in gates.values()
        )
    ):
        raise PiqdCampaignError("source-semantic receipt does not have all gates true")
    receipt_hashes = _mapping(receipt.get("hashes"), "source-semantic receipt hashes")
    expected_receipt_hashes = {
        "source_job_sha256": sha256_bytes(package_raw["source-job.json"]),
        "discovery_cnf_sha256": sha256_bytes(package_raw["discovery.cnf"]),
        "model_sha256": model_sha256,
    }
    for field, expected in expected_receipt_hashes.items():
        actual = _digest(
            receipt_hashes.get(field), f"source-semantic receipt hashes.{field}"
        )
        if actual != expected:
            raise PiqdCampaignError(
                f"source-semantic receipt {field.removesuffix('_sha256')} hash mismatch"
            )
    receipt_job = _mapping(receipt.get("job"), "source-semantic receipt job")
    if (
        _integer(receipt_job.get("cell_index"), "source-semantic receipt cell_index")
        != cell["cell_index"]
    ):
        raise PiqdCampaignError("source-semantic receipt cell_index mismatch")
    if receipt_job.get("piqd_job_id") != piqd_job_id:
        raise PiqdCampaignError("source-semantic receipt job identity mismatch")
    inputs = receipt.get("inputs")
    if not isinstance(inputs, Mapping):
        raise PiqdCampaignError("source-semantic receipt inputs are missing")
    replay_paths = {
        "source_job": package_dir / "source-job.json",
        "discovery_cnf": package_dir / "discovery.cnf",
        "model": model_path,
    }
    for name, expected_path in replay_paths.items():
        archived_path = inputs.get(name)
        if not isinstance(archived_path, str) or not archived_path:
            raise PiqdCampaignError(f"source-semantic receipt input {name} is invalid")
        if Path(os.path.abspath(archived_path)) != Path(os.path.abspath(expected_path)):
            raise PiqdCampaignError(
                f"source-semantic receipt input {name} identity mismatch"
            )
    if inputs.get("expected_piqd_job_id") != piqd_job_id:
        raise PiqdCampaignError("source-semantic receipt piqd job identity mismatch")
    if source_job.get("cell_index") != cell["cell_index"]:
        raise PiqdCampaignError("source-job cell_index changed during admission")
    try:
        fresh, source_classifier = derive_source_duplicate_center_classifier_snapshot(
            repo_root,
            source_job_path=Path(inputs["source_job"]),
            source_job_bytes=package_raw["source-job.json"],
            discovery_cnf_path=Path(inputs["discovery_cnf"]),
            discovery_cnf_bytes=package_raw["discovery.cnf"],
            model_path=Path(inputs["model"]),
            model_bytes=model_raw,
            source_bundle_bytes=bundle_raw,
            expected_piqd_job_id=piqd_job_id,
        )
    except Exact12PiqdReplayError as exc:
        raise PiqdCampaignError(f"fresh exact12 replay failed: {exc}") from exc
    fresh_raw = canonical_json_bytes(fresh) + b"\n"
    if fresh_raw != receipt_raw:
        raise PiqdCampaignError(
            "fresh exact12 replay differs byte-for-byte from archived receipt: "
            f"fresh={sha256_bytes(fresh_raw)}, archived={sha256_bytes(receipt_raw)}"
        )

    classifier, classifier_raw = _load_canonical_line(classifier_path, "classifier")
    try:
        validate_source_duplicate_center_classifier(classifier)
    except Exact12PiqdReplayError as exc:
        raise PiqdCampaignError(f"source classifier validation failed: {exc}") from exc
    source_classifier_raw = canonical_json_bytes(source_classifier) + b"\n"
    if source_classifier_raw != classifier_raw:
        raise PiqdCampaignError(
            "fresh source-derived classifier differs byte-for-byte from archived "
            f"classifier: fresh={sha256_bytes(source_classifier_raw)}, "
            f"archived={sha256_bytes(classifier_raw)}"
        )
    unsigned = {
        "schema": RECORD_SCHEMA,
        "campaign_sha256": sha256_json(manifest),
        "ordinal": ordinal,
        "cell_index": cell["cell_index"],
        "package_identity_sha256": cell["package_identity_sha256"],
        "wave_manifest_sha256": cell["wave_manifest_sha256"],
        "journal_seal_sha256": journal._seal["seal_sha256"],
        "terminal_record_sha256": terminal["record_sha256"],
        "model_sha256": model_sha256,
        "receipt_sha256": sha256_bytes(receipt_raw),
        "classifier_sha256": sha256_bytes(classifier_raw),
        "equivalence_key": _equivalence_key(classifier),
        "evidence_status": "AUTHENTICATED_SOURCE_DERIVED_DUPLICATE_CENTER_SURVIVOR",
        "claims": dict(NO_CLAIMS),
    }
    return unsigned


def _validate_campaign_record(
    record: Mapping[str, Any], manifest: Mapping[str, Any], ordinal: int
) -> None:
    if record.get("schema") == _LEGACY_RECORD_SCHEMA:
        raise PiqdCampaignError(
            "legacy v1 campaign record is not restart-admissible; regenerate v2 state"
        )
    _exact_keys(record, _RECORD_KEYS, f"campaign record {ordinal}")
    if record["schema"] != RECORD_SCHEMA:
        raise PiqdCampaignError("campaign record schema mismatch")
    if record["campaign_sha256"] != sha256_json(manifest):
        raise PiqdCampaignError("campaign record campaign digest mismatch")
    if _integer(record["ordinal"], f"campaign record {ordinal}.ordinal") != ordinal:
        raise PiqdCampaignError("campaign record ordinal mismatch")
    cell = manifest["cells"][ordinal]
    _integer(record["cell_index"], f"campaign record {ordinal}.cell_index")
    bindings = {
        "cell_index": cell["cell_index"],
        "package_identity_sha256": cell["package_identity_sha256"],
        "wave_manifest_sha256": cell["wave_manifest_sha256"],
    }
    for field, expected in bindings.items():
        if record[field] != expected:
            raise PiqdCampaignError(f"campaign record {field} binding mismatch")
    for field in (
        "package_identity_sha256",
        "wave_manifest_sha256",
        "journal_seal_sha256",
        "terminal_record_sha256",
        "model_sha256",
        "receipt_sha256",
        "classifier_sha256",
        "equivalence_key",
        "record_sha256",
    ):
        _digest(record[field], f"campaign record {ordinal}.{field}")
    previous = record["previous_record_sha256"]
    if previous is not None:
        _digest(previous, f"campaign record {ordinal}.previous_record_sha256")
    if (
        record["evidence_status"]
        != "AUTHENTICATED_SOURCE_DERIVED_DUPLICATE_CENTER_SURVIVOR"
    ):
        raise PiqdCampaignError("campaign record evidence status mismatch")
    if record["claims"] != NO_CLAIMS:
        raise PiqdCampaignError("campaign record claims mismatch")
    unsigned = dict(record)
    claimed = unsigned.pop("record_sha256")
    if claimed != sha256_json(unsigned):
        raise PiqdCampaignError("campaign record digest mismatch")


def _read_records(
    path: Path, manifest: Mapping[str, Any]
) -> tuple[list[dict[str, Any]], bytes]:
    if not _regular_file_exists(path, "campaign journal"):
        return [], b""
    raw = _safe_read(path, "campaign journal")
    if raw and not raw.endswith(b"\n"):
        raise PiqdCampaignError("campaign journal ends inside a JSONL record")
    records: list[dict[str, Any]] = []
    previous: str | None = None
    lines = raw.splitlines()
    consecutive = 0
    equivalence_key: str | None = None
    for ordinal, line in enumerate(lines):
        record = dict(_strict_json(line, source=f"campaign journal line {ordinal}"))
        if ordinal >= len(manifest["cells"]):
            raise PiqdCampaignError("campaign journal exceeds predeclared cells")
        _validate_campaign_record(record, manifest, ordinal)
        claimed = record["record_sha256"]
        if record["previous_record_sha256"] != previous:
            raise PiqdCampaignError("campaign journal order or hash chain mismatch")
        records.append(record)
        previous = claimed
        if record["equivalence_key"] == equivalence_key:
            consecutive += 1
        else:
            equivalence_key = record["equivalence_key"]
            consecutive = 1
        if consecutive >= THRESHOLD and ordinal != len(lines) - 1:
            raise PiqdCampaignError(
                "campaign journal contains a pivot-worthy prefix overrun"
            )
    return records, raw


def _result(
    manifest: Mapping[str, Any], records: Sequence[Mapping[str, Any]]
) -> dict[str, Any]:
    consecutive = 0
    key: str | None = None
    first: int | None = None
    for record in records:
        if record["equivalence_key"] == key:
            consecutive += 1
        else:
            key = record["equivalence_key"]
            consecutive = 1
            first = record["ordinal"]
    pivot = consecutive >= THRESHOLD
    unsigned = {
        "schema": RESULT_SCHEMA,
        "campaign_sha256": sha256_json(manifest),
        "status": "PIVOT_REQUIRED" if pivot else "CONTINUE",
        "record_count": len(records),
        "terminal_record_sha256": records[-1]["record_sha256"] if records else None,
        "consecutive_count": consecutive,
        "equivalence_key": key,
        "first_ordinal": first if pivot else None,
        "last_ordinal": records[-1]["ordinal"] if pivot else None,
        "threshold": THRESHOLD,
        "pivot_id": manifest["pivot_id"] if pivot else None,
        "claims": dict(NO_CLAIMS),
        "scope": CAMPAIGN_SCOPE,
    }
    return {**unsigned, "result_sha256": sha256_json(unsigned)}


def _reject_incompatible_existing_result(path: Path) -> None:
    """Reject legacy/unknown result contracts before mutating authoritative state."""

    if not _regular_file_exists(path, "campaign result"):
        return
    result, _raw = _load_canonical_line(path, "campaign result")
    schema = result.get("schema")
    if schema == _LEGACY_RESULT_SCHEMA:
        raise PiqdCampaignError(
            "legacy v1 campaign result is not restart-admissible; regenerate v2 result"
        )
    if schema != RESULT_SCHEMA:
        raise PiqdCampaignError("campaign result schema mismatch")


def process_cell(
    manifest_path: Path,
    state_path: Path,
    *,
    ordinal: int,
    journal_path: Path,
    receipt_path: Path,
    classifier_path: Path,
    repo_root: Path,
) -> dict[str, Any]:
    """Authenticate and durably admit the next ordered campaign cell."""

    with _campaign_lock(state_path):
        result_path = state_path.with_name(f"{state_path.name}.result.json")
        _reject_incompatible_existing_result(result_path)
        manifest, _manifest_raw = _load_canonical_line(
            manifest_path, "campaign manifest"
        )
        validate_campaign_manifest(manifest)
        records, raw = _read_records(state_path, manifest)
        current_result = _result(manifest, records)
        if ordinal < len(records):
            candidate = _authenticate_cell(
                manifest,
                ordinal,
                journal_path,
                receipt_path,
                classifier_path,
                repo_root,
            )
            expected = dict(candidate)
            expected["previous_record_sha256"] = (
                records[ordinal - 1]["record_sha256"] if ordinal else None
            )
            expected["record_sha256"] = sha256_json(expected)
            if records[ordinal] != expected:
                raise PiqdCampaignError("divergent duplicate campaign record")
            # The JSONL is authoritative. A locked idempotent retry deliberately
            # repairs a result missing after a crash between the two writes.
            _atomic_write(
                result_path,
                canonical_json_bytes(current_result) + b"\n",
            )
            return current_result
        if current_result["status"] == "PIVOT_REQUIRED":
            raise PiqdCampaignError(
                "campaign already reached PIVOT_REQUIRED; no early-stop overrun allowed"
            )
        if ordinal != len(records):
            raise PiqdCampaignError(
                "campaign cells must be processed strictly in manifest order"
            )
        if ordinal >= len(manifest["cells"]):
            raise PiqdCampaignError("ordinal is outside the predeclared campaign")
        record = _authenticate_cell(
            manifest,
            ordinal,
            journal_path,
            receipt_path,
            classifier_path,
            repo_root,
        )
        record["previous_record_sha256"] = (
            records[-1]["record_sha256"] if records else None
        )
        record["record_sha256"] = sha256_json(record)
        _validate_campaign_record(record, manifest, ordinal)
        new_raw = raw + canonical_json_bytes(record) + b"\n"
        _atomic_write(state_path, new_raw)
        records.append(record)
        result = _result(manifest, records)
        _atomic_write(
            result_path,
            canonical_json_bytes(result) + b"\n",
        )
        return result


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    init = sub.add_parser("init")
    init.add_argument("--package-dir", action="append", type=Path, required=True)
    init.add_argument("--pivot-id", required=True)
    init.add_argument("--manifest", type=Path, required=True)
    classifier = sub.add_parser("classifier")
    for name in (
        "model-sha256",
        "source-bundle-sha256",
        "detector-contract-sha256",
        "certificate-sha256",
        "stage",
    ):
        classifier.add_argument(f"--{name}", required=True)
    classifier.add_argument("--output", type=Path, required=True)
    admit = sub.add_parser("admit")
    admit.add_argument("--manifest", type=Path, required=True)
    admit.add_argument("--state", type=Path, required=True)
    admit.add_argument("--ordinal", type=int, required=True)
    admit.add_argument("--journal", type=Path, required=True)
    admit.add_argument("--receipt", type=Path, required=True)
    admit.add_argument("--classifier", type=Path, required=True)
    admit.add_argument("--repo-root", type=Path, required=True)
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        if args.command == "init":
            value = make_campaign_manifest(args.package_dir, args.pivot_id)
            write_canonical_json(args.manifest, value)
        elif args.command == "classifier":
            value = make_classifier(
                model_sha256=args.model_sha256,
                source_bundle_sha256=args.source_bundle_sha256,
                detector_contract_sha256=args.detector_contract_sha256,
                certificate_sha256=args.certificate_sha256,
                stage=args.stage,
            )
            write_canonical_json(args.output, value)
        else:
            value = process_cell(
                args.manifest,
                args.state,
                ordinal=args.ordinal,
                journal_path=args.journal,
                receipt_path=args.receipt,
                classifier_path=args.classifier,
                repo_root=args.repo_root,
            )
        sys.stdout.buffer.write(canonical_json_bytes(value) + b"\n")
        return 0
    except (PiqdCampaignError, OSError, KeyError, TypeError, ValueError) as exc:
        print(f"phase3_piqd_campaign: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
