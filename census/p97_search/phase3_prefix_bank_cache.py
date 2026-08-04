"""Fail-closed accelerator cache for the authenticated three-rhombus bank.

The cache is never a certificate authority.  It is written only after the
caller has completed the full authenticated bank replay, and a hit still
checks the pinned ``SHA256SUMS`` root, the manifest bytes, and the exact
canonical certificate stream.  A miss falls back to the authoritative replay.
"""

from __future__ import annotations

import hashlib
import json
import os
import tempfile
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search import phase3_three_rhombus_prefix_bank as prefix_bank

CACHE_SCHEMA = "p97-phase3-three-rhombus-prefix-cache-v1"


class PrefixCacheError(ValueError):
    """Raised for a malformed cache or a source/cache identity mismatch."""


@dataclass(frozen=True)
class CacheResult:
    hit: bool
    reason: str
    descriptor: dict[str, Any] | None = None
    entries: list[dict[str, Any]] | None = None


def _canonical_bytes(value: Any) -> bytes:
    return prefix_bank.canonical_bytes(value)


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _certificate_stream_bytes(entries: Sequence[Mapping[str, Any]]) -> bytes:
    return b"".join(_canonical_bytes(entry) + b"\n" for entry in entries)


def _read_bank_identity(
    bank_path: Path,
    *,
    expected_root_sha256: str,
) -> tuple[dict[str, str], dict[str, Any]]:
    sums_path = bank_path / "SHA256SUMS"
    sums_raw = sums_path.read_bytes()
    actual_root = _sha256_bytes(sums_raw)
    if actual_root != expected_root_sha256:
        raise PrefixCacheError(
            "prefix-bank SHA256SUMS root mismatch: "
            f"expected={expected_root_sha256}, actual={actual_root}"
        )
    try:
        sums = prefix_bank._read_sha256sums_bytes(sums_raw)
    except (KeyError, TypeError, ValueError) as exc:
        raise PrefixCacheError(f"invalid prefix-bank SHA256SUMS: {exc}") from exc
    manifest_path = bank_path / "manifest.json"
    manifest_raw = manifest_path.read_bytes()
    if _sha256_bytes(manifest_raw) != sums["manifest.json"]:
        raise PrefixCacheError("prefix-bank manifest hash mismatch")
    try:
        manifest = prefix_bank.strict_json_bytes(manifest_raw, str(manifest_path))
    except (KeyError, TypeError, ValueError) as exc:
        raise PrefixCacheError(f"invalid prefix-bank manifest: {exc}") from exc
    return sums, manifest


def _identity(
    *,
    bank_root_sha256: str,
    source_prefix_sha256: str,
    artifact_sha256: Mapping[str, str],
    producer_source_sha256: str,
) -> dict[str, Any]:
    return {
        "bank_root_sha256": bank_root_sha256,
        "source_prefix_sha256": source_prefix_sha256,
        "artifact_sha256": dict(sorted(artifact_sha256.items())),
        "producer_source_sha256": producer_source_sha256,
    }


def _file_atomic_write(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary = tempfile.mkstemp(
        dir=str(path.parent), prefix=f".{path.name}-", suffix=".tmp"
    )
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
        directory_flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0)
        directory = os.open(path.parent, directory_flags)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    except BaseException:
        try:
            os.unlink(temporary)
        except FileNotFoundError:
            pass
        raise


def write_cache(
    path: Path,
    *,
    bank_path: Path,
    expected_root_sha256: str,
    expected_source_prefix_sha256: str,
    producer_source_sha256: str,
    descriptor: Mapping[str, Any],
    entries: Sequence[Mapping[str, Any]],
) -> None:
    """Write a cache after a successful full authenticated bank replay."""

    sums, manifest = _read_bank_identity(
        bank_path.resolve(), expected_root_sha256=expected_root_sha256
    )
    entries_copy = [dict(entry) for entry in entries]
    if _sha256_bytes(_certificate_stream_bytes(entries_copy)) != sums[
        "certificates.jsonl"
    ]:
        raise PrefixCacheError("cache entries do not match bank certificates")
    descriptor_copy = dict(descriptor)
    if descriptor_copy.get("manifest") != manifest:
        raise PrefixCacheError("cache descriptor manifest mismatch")
    if descriptor_copy.get("manifest_sha256") != sums["manifest.json"]:
        raise PrefixCacheError("cache descriptor manifest SHA mismatch")
    if descriptor_copy.get("entry_count") != len(entries_copy):
        raise PrefixCacheError("cache descriptor entry count mismatch")
    if descriptor_copy.get("source_prefix_sha256") != expected_source_prefix_sha256:
        raise PrefixCacheError("cache descriptor source-prefix SHA mismatch")
    payload = {
        "schema": CACHE_SCHEMA,
        "identity": _identity(
            bank_root_sha256=expected_root_sha256,
            source_prefix_sha256=expected_source_prefix_sha256,
            artifact_sha256=sums,
            producer_source_sha256=producer_source_sha256,
        ),
        "descriptor": descriptor_copy,
        "entries": entries_copy,
    }
    envelope = {
        **payload,
        "payload_sha256": _sha256_bytes(_canonical_bytes(payload)),
    }
    envelope["cache_sha256"] = _sha256_bytes(_canonical_bytes(envelope))
    _file_atomic_write(path, _canonical_bytes(envelope) + b"\n")


def try_load(
    path: Path,
    *,
    bank_path: Path,
    expected_root_sha256: str,
    expected_source_prefix_sha256: str,
    producer_source_sha256: str,
) -> CacheResult:
    """Return a validated hit; callers must full-replay on every miss."""

    if not path.is_file():
        return CacheResult(False, "missing-cache")
    try:
        sums, manifest = _read_bank_identity(
            bank_path.resolve(), expected_root_sha256=expected_root_sha256
        )
        raw = json.loads(
            path.read_bytes(),
            parse_constant=lambda token: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {token}")
            ),
            object_pairs_hook=prefix_bank._object_without_duplicate_keys,
        )
        if not isinstance(raw, dict) or raw.get("schema") != CACHE_SCHEMA:
            raise PrefixCacheError("cache schema mismatch")
        unsigned = {key: value for key, value in raw.items() if key != "cache_sha256"}
        if raw.get("cache_sha256") != _sha256_bytes(_canonical_bytes(unsigned)):
            raise PrefixCacheError("cache envelope hash mismatch")
        payload = dict(unsigned)
        payload.pop("payload_sha256", None)
        if raw.get("payload_sha256") != _sha256_bytes(_canonical_bytes(payload)):
            raise PrefixCacheError("cache payload hash mismatch")
        expected_identity = _identity(
            bank_root_sha256=expected_root_sha256,
            source_prefix_sha256=expected_source_prefix_sha256,
            artifact_sha256=sums,
            producer_source_sha256=producer_source_sha256,
        )
        if raw.get("identity") != expected_identity:
            raise PrefixCacheError("cache source/producer identity mismatch")
        descriptor = raw.get("descriptor")
        entries = raw.get("entries")
        if not isinstance(descriptor, dict) or not isinstance(entries, list):
            raise PrefixCacheError("cache descriptor or entries malformed")
        if not all(isinstance(entry, dict) for entry in entries):
            raise PrefixCacheError("cache entries are not objects")
        if descriptor.get("manifest") != manifest:
            raise PrefixCacheError("cache descriptor manifest drift")
        if descriptor.get("manifest_sha256") != sums["manifest.json"]:
            raise PrefixCacheError("cache descriptor manifest SHA drift")
        if descriptor.get("source_prefix_sha256") != expected_source_prefix_sha256:
            raise PrefixCacheError("cache descriptor source-prefix drift")
        if descriptor.get("entry_count") != len(entries):
            raise PrefixCacheError("cache descriptor entry count drift")
        if _sha256_bytes(_certificate_stream_bytes(entries)) != sums[
            "certificates.jsonl"
        ]:
            raise PrefixCacheError("cache certificate stream hash mismatch")
        return CacheResult(True, "hit", descriptor, [dict(entry) for entry in entries])
    except (
        OSError,
        UnicodeDecodeError,
        json.JSONDecodeError,
        KeyError,
        TypeError,
        ValueError,
    ) as exc:
        return CacheResult(False, str(exc))
