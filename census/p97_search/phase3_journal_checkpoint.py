"""Authenticated prefix checkpoints for append-only Phase-3 JSONL journals.

This module is an accelerator boundary.  A checkpoint records an authenticated
prefix identity and a clause-order digest.  A later scan hashes that prefix as
raw bytes and parses only the suffix, checking the JSONL record index, hash
chain, and record hashes from the checkpoint boundary onward.

The checkpoint is not a terminal certificate and does not replace a full
semantic replay at an audit or proof boundary.  In particular, a caller must
compare the returned full-file and clause-order identities with an
independently replayed authority before promoting the optimization.
"""

from __future__ import annotations

import hashlib
import json
import os
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Mapping


CHECKPOINT_SCHEMA = "p97-phase3-authenticated-journal-checkpoint-v1"
_CLAUSE_DIGEST_SEED = hashlib.sha256(
    b"p97-phase3-clause-order-digest-v1\0"
).digest()


class CheckpointError(ValueError):
    """A malformed checkpoint, source, or suffix mismatch."""


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def _sha256_value(value: Any) -> str:
    return hashlib.sha256(_canonical_bytes(value)).hexdigest()


def _without_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise CheckpointError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def _parse_record(raw: bytes, *, where: str) -> dict[str, Any]:
    if not raw.endswith(b"\n"):
        raise CheckpointError(f"{where}: truncated JSONL line")
    payload = raw[:-1]
    if not payload.strip():
        raise CheckpointError(f"{where}: blank JSONL line")
    try:
        record = json.loads(
            payload,
            parse_constant=lambda token: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {token}")
            ),
            object_pairs_hook=_without_duplicate_keys,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise CheckpointError(f"{where}: invalid JSON: {exc}") from exc
    if not isinstance(record, dict):
        raise CheckpointError(f"{where}: expected JSON object")
    return record


def _record_hash(record: Mapping[str, Any], *, where: str) -> str:
    unsigned = dict(record)
    claimed = unsigned.pop("record_sha256", None)
    if not isinstance(claimed, str) or claimed != _sha256_value(unsigned):
        raise CheckpointError(f"{where}: invalid record hash")
    return claimed


def _clause_state_update(
    state: bytes, record: Mapping[str, Any], *, where: str
) -> bytes:
    clause = record.get("clause")
    if not isinstance(clause, list) or any(
        type(literal) is not int for literal in clause
    ):
        raise CheckpointError(f"{where}: missing canonical clause")
    return hashlib.sha256(state + _canonical_bytes(clause) + b"\n").digest()


@dataclass(frozen=True)
class PrefixIdentity:
    """Authenticated identity of the checkpointed JSONL prefix."""

    record_count: int
    byte_count: int
    terminal_record_sha256: str | None
    prefix_sha256: str
    clause_count: int
    clause_sha256: str

    def as_dict(self) -> dict[str, Any]:
        return {
            "record_count": self.record_count,
            "byte_count": self.byte_count,
            "terminal_record_sha256": self.terminal_record_sha256,
            "prefix_sha256": self.prefix_sha256,
            "clause_count": self.clause_count,
            "clause_sha256": self.clause_sha256,
        }


@dataclass(frozen=True)
class SuffixScan:
    """Result of validating one checkpoint and scanning its source suffix."""

    prefix: PrefixIdentity
    total_record_count: int
    total_byte_count: int
    terminal_record_sha256: str | None
    file_sha256: str
    clause_count: int
    clause_sha256: str
    suffix_record_count: int
    suffix_byte_count: int

    def as_dict(self) -> dict[str, Any]:
        return {
            "prefix": self.prefix.as_dict(),
            "total_record_count": self.total_record_count,
            "total_byte_count": self.total_byte_count,
            "terminal_record_sha256": self.terminal_record_sha256,
            "file_sha256": self.file_sha256,
            "clause_count": self.clause_count,
            "clause_sha256": self.clause_sha256,
            "suffix_record_count": self.suffix_record_count,
            "suffix_byte_count": self.suffix_byte_count,
        }


def _validate_prefix(value: Any) -> PrefixIdentity:
    if not isinstance(value, dict):
        raise CheckpointError("checkpoint prefix is not an object")
    integer_fields = ("record_count", "byte_count", "clause_count")
    if any(type(value.get(field)) is not int or value[field] < 0 for field in integer_fields):
        raise CheckpointError("checkpoint prefix counts are invalid")
    if value["record_count"] == 0 and value["terminal_record_sha256"] is not None:
        raise CheckpointError("empty checkpoint has a terminal record hash")
    if value["record_count"] > 0 and not isinstance(
        value["terminal_record_sha256"], str
    ):
        raise CheckpointError("nonempty checkpoint has no terminal record hash")
    for field in ("prefix_sha256", "clause_sha256"):
        if not isinstance(value.get(field), str) or len(value[field]) != 64:
            raise CheckpointError(f"checkpoint {field} is invalid")
    return PrefixIdentity(
        record_count=value["record_count"],
        byte_count=value["byte_count"],
        terminal_record_sha256=value["terminal_record_sha256"],
        prefix_sha256=value["prefix_sha256"],
        clause_count=value["clause_count"],
        clause_sha256=value["clause_sha256"],
    )


def _read_envelope(path: Path) -> dict[str, Any]:
    try:
        raw = json.loads(
            path.read_bytes(),
            parse_constant=lambda token: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {token}")
            ),
            object_pairs_hook=_without_duplicate_keys,
        )
    except (OSError, UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise CheckpointError(f"invalid checkpoint {path}: {exc}") from exc
    if not isinstance(raw, dict) or raw.get("schema") != CHECKPOINT_SCHEMA:
        raise CheckpointError("checkpoint schema mismatch")
    unsigned = {key: value for key, value in raw.items() if key != "checkpoint_sha256"}
    if raw.get("checkpoint_sha256") != _sha256_value(unsigned):
        raise CheckpointError("checkpoint envelope hash mismatch")
    payload = raw.get("payload")
    if not isinstance(payload, dict):
        raise CheckpointError("checkpoint payload is not an object")
    if raw.get("payload_sha256") != _sha256_value(payload):
        raise CheckpointError("checkpoint payload hash mismatch")
    _validate_prefix(payload.get("prefix"))
    return raw


def _scan_prefix(
    source_path: Path, record_count: int
) -> tuple[PrefixIdentity, bytes]:
    if not source_path.is_file():
        raise CheckpointError(f"missing journal source {source_path}")
    file_digest = hashlib.sha256()
    clause_state = _CLAUSE_DIGEST_SEED
    terminal: str | None = None
    byte_count = 0
    clauses = 0
    last_raw = b""
    with source_path.open("rb") as handle:
        for index in range(record_count):
            raw = handle.readline()
            if not raw:
                raise CheckpointError(
                    f"{source_path}: source ended before checkpoint record {index}"
                )
            record = _parse_record(raw, where=f"{source_path}:{index + 1}")
            if record.get("index") != index:
                raise CheckpointError(f"{source_path}:{index + 1}: non-dense record index")
            if record.get("previous_record_sha256") != terminal:
                raise CheckpointError(f"{source_path}:{index + 1}: broken hash chain")
            terminal = _record_hash(record, where=f"{source_path}:{index + 1}")
            clause_state = _clause_state_update(
                clause_state, record, where=f"{source_path}:{index + 1}"
            )
            file_digest.update(raw)
            byte_count += len(raw)
            clauses += 1
            last_raw = raw
    if record_count and not last_raw.endswith(b"\n"):
        raise CheckpointError("checkpoint does not end at a JSONL boundary")
    return (
        PrefixIdentity(
            record_count=record_count,
            byte_count=byte_count,
            terminal_record_sha256=terminal,
            prefix_sha256=file_digest.hexdigest(),
            clause_count=clauses,
            clause_sha256=clause_state.hex(),
        ),
        last_raw,
    )


def build_checkpoint(
    source_path: Path,
    checkpoint_path: Path,
    *,
    record_count: int,
    configuration: Mapping[str, Any] | None = None,
) -> PrefixIdentity:
    """Authenticate and atomically write a checkpoint for a source prefix."""

    if type(record_count) is not int or record_count <= 0:
        raise CheckpointError("record_count must be a positive integer")
    prefix, _ = _scan_prefix(source_path, record_count)
    payload = {
        "prefix": prefix.as_dict(),
        "configuration_sha256": _sha256_value(configuration or {}),
    }
    unsigned = {
        "schema": CHECKPOINT_SCHEMA,
        "payload": payload,
        "payload_sha256": _sha256_value(payload),
    }
    envelope = {**unsigned, "checkpoint_sha256": _sha256_value(unsigned)}
    checkpoint_path.parent.mkdir(parents=True, exist_ok=True)
    temporary = checkpoint_path.with_name(f".{checkpoint_path.name}.tmp")
    try:
        with temporary.open("wb") as handle:
            handle.write(_canonical_bytes(envelope) + b"\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, checkpoint_path)
    finally:
        try:
            temporary.unlink()
        except FileNotFoundError:
            pass
    return prefix


def load_checkpoint(
    checkpoint_path: Path, *, configuration: Mapping[str, Any] | None = None
) -> PrefixIdentity:
    """Load and authenticate a checkpoint envelope without touching its source."""

    raw = _read_envelope(checkpoint_path)
    payload = raw["payload"]
    expected = _sha256_value(configuration or {})
    if payload.get("configuration_sha256") != expected:
        raise CheckpointError("checkpoint configuration mismatch")
    return _validate_prefix(payload["prefix"])


def scan_suffix(
    source_path: Path,
    checkpoint_path: Path,
    *,
    configuration: Mapping[str, Any] | None = None,
) -> SuffixScan:
    """Validate the checkpointed prefix and parse/authenticate only its suffix."""

    prefix = load_checkpoint(checkpoint_path, configuration=configuration)
    if not source_path.is_file():
        raise CheckpointError(f"missing journal source {source_path}")
    file_digest = hashlib.sha256()
    with source_path.open("rb") as handle:
        remaining = prefix.byte_count
        while remaining:
            chunk = handle.read(min(1024 * 1024, remaining))
            if not chunk:
                raise CheckpointError("source ended inside checkpoint prefix")
            file_digest.update(chunk)
            remaining -= len(chunk)
        if file_digest.hexdigest() != prefix.prefix_sha256:
            raise CheckpointError("checkpoint prefix mismatch")

        terminal = prefix.terminal_record_sha256
        index = prefix.record_count
        try:
            clause_state = bytes.fromhex(prefix.clause_sha256)
        except ValueError as exc:
            raise CheckpointError("checkpoint clause digest is not hexadecimal") from exc
        suffix_records = 0
        suffix_bytes = 0
        while True:
            raw = handle.readline()
            if not raw:
                break
            where = f"{source_path}:{index + 1}"
            record = _parse_record(raw, where=where)
            if record.get("index") != index:
                raise CheckpointError(f"{where}: non-dense record index")
            if record.get("previous_record_sha256") != terminal:
                raise CheckpointError(f"{where}: broken hash chain")
            terminal = _record_hash(record, where=where)
            clause_state = _clause_state_update(clause_state, record, where=where)
            file_digest.update(raw)
            index += 1
            suffix_records += 1
            suffix_bytes += len(raw)

    return SuffixScan(
        prefix=prefix,
        total_record_count=index,
        total_byte_count=prefix.byte_count + suffix_bytes,
        terminal_record_sha256=terminal,
        file_sha256=file_digest.hexdigest(),
        clause_count=prefix.clause_count + suffix_records,
        clause_sha256=clause_state.hex(),
        suffix_record_count=suffix_records,
        suffix_byte_count=suffix_bytes,
    )


def full_scan(source_path: Path, *, configuration: Mapping[str, Any] | None = None) -> SuffixScan:
    """Produce the authority identity for a complete JSONL source scan."""
    if not source_path.is_file():
        raise CheckpointError(f"missing journal source {source_path}")
    file_digest = hashlib.sha256()
    clause_state = _CLAUSE_DIGEST_SEED
    count = 0
    byte_count = 0
    terminal: str | None = None
    with source_path.open("rb") as handle:
        for raw in handle:
            where = f"{source_path}:{count + 1}"
            record = _parse_record(raw, where=where)
            if record.get("index") != count:
                raise CheckpointError(f"{where}: non-dense record index")
            if record.get("previous_record_sha256") != terminal:
                raise CheckpointError(f"{where}: broken hash chain")
            terminal = _record_hash(record, where=where)
            clause_state = _clause_state_update(clause_state, record, where=where)
            file_digest.update(raw)
            byte_count += len(raw)
            count += 1
    if count == 0:
        raise CheckpointError("journal source is empty")
    empty_prefix = PrefixIdentity(
        record_count=0,
        byte_count=0,
        terminal_record_sha256=None,
        prefix_sha256=hashlib.sha256(b"").hexdigest(),
        clause_count=0,
        clause_sha256=_CLAUSE_DIGEST_SEED.hex(),
    )
    return SuffixScan(
        prefix=empty_prefix,
        total_record_count=count,
        total_byte_count=byte_count,
        terminal_record_sha256=terminal,
        file_sha256=file_digest.hexdigest(),
        clause_count=count,
        clause_sha256=clause_state.hex(),
        suffix_record_count=count,
        suffix_byte_count=byte_count,
    )


__all__ = [
    "CHECKPOINT_SCHEMA",
    "CheckpointError",
    "PrefixIdentity",
    "SuffixScan",
    "build_checkpoint",
    "full_scan",
    "load_checkpoint",
    "scan_suffix",
]
