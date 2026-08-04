"""Fail-closed compiled state for the successor Phase-3 loader.

This module is an accelerator boundary, not a certificate boundary.  A cache
is useful only when the authenticated source stream, configuration, loader
identity, and cache payload all agree.  The v3 driver still performs a full
source replay at terminal/publication audit boundaries.  The compiled cache
stores authenticated metadata and antichain references plus a version-pinned
compact learned-record table.  A cache hit checks the raw source identity and
decodes that table; it never treats the sidecar as proof-bearing.
"""

from __future__ import annotations

import hashlib
import json
import marshal
import os
import sys
import tempfile
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search import phase3_cegar_runtime as cegar_runtime

CACHE_SCHEMA = "p97-phase3-compiled-loader-cache-v5"
INDEX_SCHEMA = "p97-phase3-indexed-antichain-v2"
ORDERING_SCHEMA = "p97-phase3-v3-loader-order-v1"
RECORD_TABLE_SCHEMA = "p97-phase3-record-table-marshal-v1"
RECORD_TABLE_SUFFIX = ".records.marshal"
MARSHAL_VERSION = marshal.version


class CacheError(ValueError):
    """A malformed cache or source identity which must not be trusted."""


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _sha256_value(value: Any) -> str:
    """Hash canonical JSON incrementally instead of materializing it."""

    encoder = json.JSONEncoder(
        sort_keys=True, separators=(",", ":"), allow_nan=False
    )
    digest = hashlib.sha256()
    for chunk in encoder.iterencode(value):
        digest.update(chunk.encode("utf-8"))
    return digest.hexdigest()


def _without_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise CacheError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def _jsonable(value: Any) -> Any:
    if isinstance(value, tuple):
        return [_jsonable(item) for item in value]
    if isinstance(value, list):
        return [_jsonable(item) for item in value]
    if isinstance(value, Mapping):
        return {
            str(key): _jsonable(item)
            for key, item in sorted(value.items(), key=lambda pair: str(pair[0]))
        }
    return value


def _tupleize(value: Any) -> Any:
    if isinstance(value, list):
        return tuple(_tupleize(item) for item in value)
    if isinstance(value, dict):
        return {key: _tupleize(item) for key, item in value.items()}
    return value


@dataclass(frozen=True)
class SourceIdentity:
    """Byte and authenticated-chain identity of one JSONL source stream."""

    record_count: int
    byte_count: int
    terminal_record_sha256: str | None
    file_sha256: str

    def as_dict(self) -> dict[str, Any]:
        return {
            "record_count": self.record_count,
            "byte_count": self.byte_count,
            "terminal_record_sha256": self.terminal_record_sha256,
            "file_sha256": self.file_sha256,
        }


@dataclass(frozen=True)
class CacheResult:
    """Result of trying to use a compiled loader cache."""

    hit: bool
    reason: str
    payload: dict[str, Any] | None = None
    source: SourceIdentity | None = None


def _record_table_path(cache_path: Path) -> Path:
    """Return the fixed sibling path for the compact record table."""

    return cache_path.with_name(cache_path.name + RECORD_TABLE_SUFFIX)


def _stream_file_digest(path: Path) -> tuple[int, str]:
    """Hash a file without parsing its contents."""

    if not path.is_file():
        raise CacheError(f"missing source stream {path}")
    digest = hashlib.sha256()
    byte_count = 0
    with path.open("rb") as handle:
        for raw in iter(lambda: handle.read(1 << 20), b""):
            byte_count += len(raw)
            digest.update(raw)
    return byte_count, digest.hexdigest()


def _scan_source(
    path: Path, *, retain_records: bool
) -> tuple[SourceIdentity, list[dict[str, Any]] | None]:
    """Authenticate a JSONL source, optionally retaining parsed records."""

    digest = hashlib.sha256()
    record_count = 0
    byte_count = 0
    terminal: str | None = None
    records: list[dict[str, Any]] | None = [] if retain_records else None
    if not path.is_file():
        raise CacheError(f"missing source stream {path}")
    with path.open("rb") as handle:
        for line_number, raw in enumerate(handle, start=1):
            if not raw.endswith(b"\n"):
                raise CacheError(f"{path}:{line_number}: truncated JSONL line")
            payload = raw[:-1]
            if not payload.strip():
                raise CacheError(f"{path}:{line_number}: blank JSONL line")
            try:
                record = json.loads(
                    payload,
                    parse_constant=lambda token: (_ for _ in ()).throw(
                        ValueError(f"invalid JSON constant {token}")
                    ),
                    object_pairs_hook=_without_duplicate_keys,
                )
            except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
                raise CacheError(f"{path}:{line_number}: invalid JSON: {exc}") from exc
            if not isinstance(record, dict):
                raise CacheError(f"{path}:{line_number}: expected object")
            if type(record.get("index")) is not int or record.get("index") != record_count:
                raise CacheError(f"{path}:{line_number}: non-dense record index")
            if record.get("previous_record_sha256") != terminal:
                raise CacheError(f"{path}:{line_number}: broken record hash chain")
            unsigned = dict(record)
            claimed = unsigned.pop("record_sha256", None)
            if not isinstance(claimed, str) or claimed != _sha256_value(unsigned):
                raise CacheError(f"{path}:{line_number}: invalid record hash")
            terminal = claimed
            record_count += 1
            byte_count += len(raw)
            digest.update(raw)
            if records is not None:
                records.append(record)
    return (
        SourceIdentity(
            record_count=record_count,
            byte_count=byte_count,
            terminal_record_sha256=terminal,
            file_sha256=digest.hexdigest(),
        ),
        records,
    )


def source_identity(path: Path) -> SourceIdentity:
    """Scan source bytes and framing without retaining parsed records."""

    source, records = _scan_source(path, retain_records=False)
    assert records is None
    return source


def prime_journal_scan(
    scan: cegar_runtime.JournalScan, source: SourceIdentity, path: Path
) -> None:
    """Populate a runtime scan after the cache identity scan succeeds."""

    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for raw in handle:
            digest.update(raw)
    if digest.hexdigest() != source.file_sha256:
        raise CacheError(f"source changed while priming scan: {path}")
    scan.byte_count = source.byte_count
    scan._digest = digest


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


def _cache_identity(
    source: SourceIdentity,
    configuration: Mapping[str, Any],
    loader_source_sha256: str,
) -> dict[str, Any]:
    return {
        "source": source.as_dict(),
        "configuration_sha256": _sha256_value(configuration),
        "loader_source_sha256": loader_source_sha256,
        "ordering_schema": ORDERING_SCHEMA,
    }


def _validate_clause(value: Any, *, where: str) -> tuple[int, ...]:
    if not isinstance(value, list) or any(type(item) is not int for item in value):
        raise CacheError(f"{where}: non-canonical clause")
    return tuple(value)


def _source_identity_from_dict(value: Any) -> SourceIdentity:
    if not isinstance(value, dict) or set(value) != {
        "record_count",
        "byte_count",
        "terminal_record_sha256",
        "file_sha256",
    }:
        raise CacheError("cache source identity is malformed")
    record_count = value["record_count"]
    byte_count = value["byte_count"]
    terminal = value["terminal_record_sha256"]
    file_sha256 = value["file_sha256"]
    if type(record_count) is not int or record_count < 0:
        raise CacheError("cache source record count is invalid")
    if type(byte_count) is not int or byte_count < 0:
        raise CacheError("cache source byte count is invalid")
    if terminal is not None and (
        not isinstance(terminal, str)
        or len(terminal) != 64
        or any(character not in "0123456789abcdef" for character in terminal)
    ):
        raise CacheError("cache source terminal digest is invalid")
    if (
        not isinstance(file_sha256, str)
        or len(file_sha256) != 64
        or any(character not in "0123456789abcdef" for character in file_sha256)
    ):
        raise CacheError("cache source file digest is invalid")
    return SourceIdentity(record_count, byte_count, terminal, file_sha256)


def _validate_record_table(value: Any) -> int:
    if not isinstance(value, dict) or set(value) != {
        "schema",
        "marshal_version",
        "python_implementation",
        "python_version",
        "record_count",
        "byte_count",
        "sha256",
        "terminal_record_sha256",
    }:
        raise CacheError("cache record table metadata is malformed")
    if value["schema"] != RECORD_TABLE_SCHEMA:
        raise CacheError("cache record table schema mismatch")
    if value["marshal_version"] != MARSHAL_VERSION:
        raise CacheError("cache record table marshal version mismatch")
    if value["python_implementation"] != sys.implementation.name:
        raise CacheError("cache record table Python implementation mismatch")
    if value["python_version"] != list(sys.version_info[:3]):
        raise CacheError("cache record table Python version mismatch")
    record_count = value["record_count"]
    byte_count = value["byte_count"]
    if type(record_count) is not int or record_count < 0:
        raise CacheError("cache record table count is invalid")
    if type(byte_count) is not int or byte_count < 0:
        raise CacheError("cache record table byte count is invalid")
    digest = value["sha256"]
    if (
        not isinstance(digest, str)
        or len(digest) != 64
        or any(character not in "0123456789abcdef" for character in digest)
    ):
        raise CacheError("cache record table digest is invalid")
    terminal = value["terminal_record_sha256"]
    if terminal is not None and (
        not isinstance(terminal, str)
        or len(terminal) != 64
        or any(character not in "0123456789abcdef" for character in terminal)
    ):
        raise CacheError("cache record table terminal digest is invalid")
    return record_count


def _record_terminal(
    records: Sequence[Mapping[str, Any]], *, verify_hashes: bool
) -> str | None:
    """Validate record framing and return its authenticated terminal hash."""

    terminal: str | None = None
    for position, record in enumerate(records):
        if not isinstance(record, dict):
            raise CacheError(f"record table entry {position} is not an object")
        if type(record.get("index")) is not int or record.get("index") != position:
            raise CacheError(f"record table entry {position} has a non-dense index")
        if record.get("previous_record_sha256") != terminal:
            raise CacheError(f"record table entry {position} breaks the hash chain")
        unsigned = dict(record)
        claimed = unsigned.pop("record_sha256", None)
        if not isinstance(claimed, str):
            raise CacheError(f"record table entry {position} has no record hash")
        if verify_hashes and claimed != _sha256_value(unsigned):
            raise CacheError(f"record table entry {position} has an invalid record hash")
        terminal = claimed
    return terminal


def _validate_payload(
    payload: Any, *, record_count: int | None = None
) -> dict[str, Any]:
    if not isinstance(payload, dict):
        raise CacheError("cache payload is not an object")
    record_table = payload.get("record_table")
    active_indices = payload.get("active_record_indices")
    index = payload.get("index")
    if set(payload) != {"record_table", "active_record_indices", "index"}:
        raise CacheError("cache payload has redundant or missing fields")
    serialized_record_count = _validate_record_table(record_table)
    if record_count is not None and serialized_record_count != record_count:
        raise CacheError("cache record count does not match source")
    if not isinstance(index, dict) or index.get("schema") != INDEX_SCHEMA:
        raise CacheError("cache antichain index schema mismatch")
    if set(index) != {"schema", "active_order", "full_index_sha256"}:
        raise CacheError("cache antichain index is not compact")
    active_order = index.get("active_order")
    if not isinstance(active_order, list):
        raise CacheError("cache antichain active_order is not a list")
    full_index_sha256 = index.get("full_index_sha256")
    if (
        not isinstance(full_index_sha256, str)
        or len(full_index_sha256) != 64
        or any(character not in "0123456789abcdef" for character in full_index_sha256)
    ):
        raise CacheError("cache antichain full index digest is invalid")
    if not isinstance(active_indices, list) or len(active_indices) != len(active_order):
        raise CacheError("cache active record indices do not match antichain order")
    for position, record_index in enumerate(active_indices):
        if (
            type(record_index) is not int
            or not 0 <= record_index < serialized_record_count
        ):
            raise CacheError(f"cache active record index {position} is invalid")
    return {
        **payload,
        "active_record_indices": list(active_indices),
    }


def _validate_active_records(
    payload: Mapping[str, Any], records: Sequence[Mapping[str, Any]]
) -> None:
    """Validate source-backed records referenced by the compact payload."""

    expected_count = payload["record_table"]["record_count"]
    if expected_count != len(records):
        raise CacheError("source record count does not match cache")
    for position, record in enumerate(records):
        if not isinstance(record, Mapping):
            raise CacheError(f"source record {position} is not an object")
        _validate_clause(record.get("clause"), where=f"source record {position} clause")
    for position, record_index in enumerate(payload["active_record_indices"]):
        if not isinstance(records[record_index].get("certificate"), dict):
            raise CacheError(
                f"cache active record {record_index} has no certificate object"
            )


def _active_record_indices(
    records: Sequence[Mapping[str, Any]],
    active_entries: Sequence[Mapping[str, Any]],
) -> list[int]:
    """Resolve active certificates to their already-stored learned records."""

    by_certificate: dict[str, list[int]] = {}
    for index, record in enumerate(records):
        certificate = record.get("certificate")
        if isinstance(certificate, dict):
            by_certificate.setdefault(_sha256_value(certificate), []).append(index)

    result: list[int] = []
    for position, entry in enumerate(active_entries):
        certificate = entry.get("certificate")
        if not isinstance(certificate, dict):
            raise CacheError(f"active entry {position} has no certificate object")
        candidates = by_certificate.get(_sha256_value(certificate), [])
        exact = [
            index
            for index in candidates
            if records[index].get("certificate") == certificate
        ]
        if not exact:
            raise CacheError(
                f"active entry {position} has no corresponding learned record"
            )
        # Duplicate certificate records are semantically identical for the
        # indexed bank; retain the first deterministic occurrence.
        result.append(exact[0])
    return result


def write_cache(
    path: Path,
    *,
    source: SourceIdentity,
    configuration: Mapping[str, Any],
    loader_source_sha256: str,
    records: Sequence[Mapping[str, Any]],
    clauses: Sequence[Sequence[int]],
    active_entries: Sequence[Mapping[str, Any]],
    index: Mapping[str, Any],
) -> None:
    """Atomically write a self-authenticating, source-bound cache."""

    if len(records) != source.record_count:
        raise CacheError("cache records do not match source record count")
    terminal = _record_terminal(records, verify_hashes=True)
    if terminal != source.terminal_record_sha256:
        raise CacheError("cache records do not match source terminal hash")
    active_record_indices = _active_record_indices(records, active_entries)
    if len(clauses) != len(records):
        raise CacheError("cache clauses do not match record count")
    for position, clause in enumerate(clauses):
        normalized = _validate_clause(
            list(clause), where=f"cache clause {position}"
        )
        if records[position].get("clause") != list(normalized):
            raise CacheError(f"cache record {position} clause mismatch")
    active_order = index.get("active_order")
    if not isinstance(active_order, list) or len(active_order) != len(
        active_record_indices
    ):
        raise CacheError("active entries do not match serialized antichain order")
    for position, entry in enumerate(active_entries):
        if entry.get("key") != active_order[position]:
            raise CacheError("active entry order does not match antichain index")
    compact_index = {
        "schema": INDEX_SCHEMA,
        "active_order": active_order,
        "full_index_sha256": _sha256_value(
            {"schema": INDEX_SCHEMA, **dict(index)}
        ),
    }
    try:
        record_table_bytes = marshal.dumps(list(records), MARSHAL_VERSION)
    except (TypeError, ValueError) as exc:
        raise CacheError(f"cache record table is not marshalable: {exc}") from exc
    record_table = {
        "schema": RECORD_TABLE_SCHEMA,
        "marshal_version": MARSHAL_VERSION,
        "python_implementation": sys.implementation.name,
        "python_version": list(sys.version_info[:3]),
        "record_count": len(records),
        "byte_count": len(record_table_bytes),
        "sha256": _sha256_bytes(record_table_bytes),
        "terminal_record_sha256": terminal,
    }
    payload = {
        "record_table": record_table,
        "active_record_indices": active_record_indices,
        "index": compact_index,
    }
    payload = _validate_payload(payload)
    _validate_active_records(payload, records)
    unsigned = {
        "schema": CACHE_SCHEMA,
        "identity": _cache_identity(source, configuration, loader_source_sha256),
        "payload": _jsonable(payload),
    }
    envelope = {
        **unsigned,
        "payload_sha256": _sha256_value(unsigned["payload"]),
    }
    envelope["cache_sha256"] = _sha256_value(envelope)
    _file_atomic_write(_record_table_path(path), record_table_bytes)
    _file_atomic_write(
        path,
        json.dumps(envelope, sort_keys=True, separators=(",", ":"), allow_nan=False).encode()
        + b"\n",
    )


def try_load(
    path: Path,
    *,
    source_path: Path,
    configuration: Mapping[str, Any],
    loader_source_sha256: str,
) -> CacheResult:
    """Return a validated cache hit, or a reasoned miss for full replay."""

    if not path.is_file():
        return CacheResult(False, "missing-cache")
    source: SourceIdentity | None = None
    try:
        with path.open("r", encoding="utf-8") as handle:
            raw = json.load(
                handle,
                parse_constant=lambda token: (_ for _ in ()).throw(
                    ValueError(f"invalid JSON constant {token}")
                ),
                object_pairs_hook=_without_duplicate_keys,
            )
        if not isinstance(raw, dict) or raw.get("schema") != CACHE_SCHEMA:
            raise CacheError("cache schema mismatch")
        unsigned = {key: value for key, value in raw.items() if key != "cache_sha256"}
        if raw.get("cache_sha256") != _sha256_value(unsigned):
            raise CacheError("cache envelope hash mismatch")
        payload = raw.get("payload")
        if raw.get("payload_sha256") != _sha256_value(payload):
            raise CacheError("cache payload hash mismatch")
        raw_identity = raw.get("identity")
        if not isinstance(raw_identity, dict):
            raise CacheError("cache identity is not an object")
        expected_source = _source_identity_from_dict(raw_identity.get("source"))
        source_byte_count, source_file_sha256 = _stream_file_digest(source_path)
        if (
            source_byte_count != expected_source.byte_count
            or source_file_sha256 != expected_source.file_sha256
        ):
            raise CacheError("cache source byte identity mismatch")
        source = SourceIdentity(
            record_count=expected_source.record_count,
            byte_count=source_byte_count,
            terminal_record_sha256=expected_source.terminal_record_sha256,
            file_sha256=source_file_sha256,
        )
        expected_identity = _cache_identity(source, configuration, loader_source_sha256)
        if raw.get("identity") != expected_identity:
            raise CacheError("cache source/configuration identity mismatch")
        payload = _validate_payload(payload, record_count=source.record_count)
        record_table = payload["record_table"]
        if record_table["terminal_record_sha256"] != source.terminal_record_sha256:
            raise CacheError("cache record table terminal hash mismatch")
        record_table_path = _record_table_path(path)
        record_table_bytes = record_table_path.read_bytes()
        if (
            len(record_table_bytes) != record_table["byte_count"]
            or _sha256_bytes(record_table_bytes) != record_table["sha256"]
        ):
            raise CacheError("cache record table digest mismatch")
        try:
            records = marshal.loads(record_table_bytes)
        except (EOFError, TypeError, ValueError) as exc:
            raise CacheError(f"cache record table decode failed: {exc}") from exc
        if not isinstance(records, list):
            raise CacheError("cache record table is not a list")
        if _record_terminal(records, verify_hashes=False) != source.terminal_record_sha256:
            raise CacheError("cache record table hash chain mismatch")
        _validate_active_records(payload, records)
        # The on-disk payload intentionally has no learned-record object graph.
        # Attach the compact-table decode only to the in-memory result.
        payload = {**payload, "records": records}
        return CacheResult(True, "hit", payload, source)
    except (
        CacheError,
        OSError,
        UnicodeDecodeError,
        json.JSONDecodeError,
        EOFError,
        TypeError,
        ValueError,
    ) as exc:
        return CacheResult(False, str(exc), source=source)


class IndexedNogoodBank:
    """Semantics-preserving antichain with row postings and size buckets."""

    def __init__(self) -> None:
        self.active: dict[tuple[Any, ...], dict[str, Any]] = {}
        self.empty: tuple[Any, ...] | None = None
        self._row_ids: dict[Any, int] = {}
        self._rows: list[Any] = []
        self.postings: dict[int, set[tuple[Any, ...]]] = {}
        self.size_buckets: dict[int, set[tuple[Any, ...]]] = {}
        # A cache hit validates one complete snapshot.  Reuse that exact
        # snapshot for the immediate state digest; all mutating operations
        # invalidate it before changing the bank.
        self._index_snapshot_cache: dict[str, Any] | None = None

    def _row_id(self, row: Any) -> int:
        try:
            return self._row_ids[row]
        except KeyError:
            identifier = len(self._rows)
            self._row_ids[row] = identifier
            self._rows.append(row)
            self.postings[identifier] = set()
            return identifier

    def _remove(self, key: tuple[Any, ...]) -> None:
        self._index_snapshot_cache = None
        del self.active[key]
        bucket = self.size_buckets[len(key)]
        bucket.remove(key)
        if not bucket:
            del self.size_buckets[len(key)]
        for row in key:
            self.postings[self._row_ids[row]].remove(key)
        if not key:
            self.empty = None

    def _candidate_keys(self, key: tuple[Any, ...]) -> set[tuple[Any, ...]]:
        """Return active keys containing every row in ``key``.

        This direction is used for strict-superset elimination when adding a
        key.  Matching a prefix needs the dual union query below.
        """
        if not key:
            return set(self.active)
        postings = []
        for row in key:
            row_id = self._row_ids.get(row)
            postings.append(set() if row_id is None else self.postings[row_id])
        if not postings or any(not posting for posting in postings):
            return set()
        return set.intersection(*(set(posting) for posting in postings))

    def _subset_candidates(self, prefix: tuple[Any, ...]) -> set[tuple[Any, ...]]:
        """Return active keys having at least one row in ``prefix``.

        Every nonempty key contained in a prefix occurs in the posting list of
        each of its rows, so the union is a complete candidate set.  The
        caller still performs the exact subset check.  This is distinct from
        ``_candidate_keys``: intersecting postings would find supersets, not
        subsets.
        """
        if not prefix:
            return set(self.active)
        candidates: set[tuple[Any, ...]] = set()
        for row in prefix:
            row_id = self._row_ids.get(row)
            if row_id is not None:
                candidates.update(self.postings[row_id])
        return candidates

    def match(self, prefix: tuple[Any, ...]) -> tuple[Any, ...] | None:
        if self.empty is not None:
            return self.empty
        prefix_set = frozenset(prefix)
        candidates = {
            key
            for key in self._subset_candidates(prefix)
            if len(key) <= len(prefix) and frozenset(key) <= prefix_set
        }
        return min(candidates, key=lambda key: (len(key), key)) if candidates else None

    def add(
        self, key: tuple[Any, ...], certificate: Mapping[str, Any]
    ) -> tuple[tuple[Any, ...], tuple[tuple[Any, ...], ...], bool]:
        existing = self.match(key)
        if existing is not None:
            return existing, (), False
        key_set = frozenset(key)
        superseded = tuple(
            sorted(
                old
                for old in self._candidate_keys(key)
                if len(key) < len(old) and key_set < frozenset(old)
            )
        )
        for old in superseded:
            self._remove(old)
        self._index_snapshot_cache = None
        self.active[key] = dict(certificate)
        bucket = self.size_buckets.setdefault(len(key), set())
        bucket.add(key)
        for row in key:
            self.postings[self._row_id(row)].add(key)
        if not key:
            self.empty = key
        return key, superseded, True

    def load_active(
        self,
        entries: Sequence[tuple[tuple[Any, ...], Mapping[str, Any]]],
        *,
        copy_certificates: bool = True,
    ) -> None:
        """Load already-audited active entries without changing their order."""

        self._index_snapshot_cache = None
        for key, certificate in entries:
            if key in self.active:
                raise CacheError("duplicate active antichain key")
            self.active[key] = (
                dict(certificate) if copy_certificates else certificate
            )
            self.size_buckets.setdefault(len(key), set()).add(key)
            for row in key:
                self.postings.setdefault(self._row_id(row), set()).add(key)
            if not key:
                if self.empty is not None:
                    raise CacheError("duplicate empty antichain key")
                self.empty = key

    def index_snapshot(self) -> dict[str, Any]:
        if self._index_snapshot_cache is not None:
            return self._index_snapshot_cache
        keys = list(self.active)
        key_ids = {key: index for index, key in enumerate(keys)}
        active_rows = {
            row
            for key in keys
            for row in key
        }
        rows = [row for row in self._rows if row in active_rows]
        row_ids = {row: row_id for row_id, row in enumerate(rows)}
        postings = {
            row_id: {
                key
                for key in keys
                if row in key
            }
            for row, row_id in row_ids.items()
        }
        return {
            "active_order": [_jsonable(key) for key in keys],
            "row_universe": [_jsonable(row) for row in rows],
            "postings": [
                [row_id, sorted(key_ids[key] for key in postings[row_id])]
                for row_id in range(len(rows))
            ],
            "size_buckets": [
                [size, sorted(key_ids[key] for key in bucket)]
                for size, bucket in sorted(self.size_buckets.items())
            ],
        }


def cached_bank(payload: Mapping[str, Any]) -> IndexedNogoodBank:
    """Reconstruct the indexed antichain and verify its serialized index."""

    bank = IndexedNogoodBank()
    entries: list[tuple[tuple[Any, ...], Mapping[str, Any]]] = []
    active_order = payload["index"]["active_order"]
    for key_value, record_index in zip(
        active_order, payload["active_record_indices"], strict=True
    ):
        key = _tupleize(key_value)
        if not isinstance(key, tuple):
            raise CacheError("cached antichain key is not a tuple")
        certificate = payload["records"][record_index].get("certificate")
        if not isinstance(certificate, dict):
            raise CacheError("cached active record has no certificate object")
        entries.append((key, certificate))
    bank.load_active(entries, copy_certificates=False)
    expected_digest = payload["index"]["full_index_sha256"]
    snapshot = bank.index_snapshot()
    actual_digest = _sha256_value({"schema": INDEX_SCHEMA, **snapshot})
    if expected_digest != actual_digest:
        raise CacheError("serialized antichain index does not replay")
    bank._index_snapshot_cache = snapshot
    return bank
