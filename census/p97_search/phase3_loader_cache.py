"""Fail-closed compiled state for the successor Phase-3 loader.

This module is an accelerator boundary, not a certificate boundary.  A cache
is useful only when the authenticated source stream, configuration, loader
identity, and cache payload all agree.  The v3 driver still performs a full
source replay at terminal/publication audit boundaries.
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

from census.p97_search import phase3_cegar_runtime as cegar_runtime

CACHE_SCHEMA = "p97-phase3-compiled-loader-cache-v1"
INDEX_SCHEMA = "p97-phase3-indexed-antichain-v1"
ORDERING_SCHEMA = "p97-phase3-v3-loader-order-v1"


class CacheError(ValueError):
    """A malformed cache or source identity which must not be trusted."""


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _sha256_value(value: Any) -> str:
    return _sha256_bytes(_canonical_bytes(value))


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


def source_identity(path: Path) -> SourceIdentity:
    """Scan source bytes and framing without replaying certificate semantics."""

    digest = hashlib.sha256()
    record_count = 0
    byte_count = 0
    terminal: str | None = None
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
    return SourceIdentity(
        record_count=record_count,
        byte_count=byte_count,
        terminal_record_sha256=terminal,
        file_sha256=digest.hexdigest(),
    )


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


def _validate_payload(payload: Any) -> dict[str, Any]:
    if not isinstance(payload, dict):
        raise CacheError("cache payload is not an object")
    records = payload.get("records")
    clauses = payload.get("clauses")
    active = payload.get("active_entries")
    index = payload.get("index")
    if not isinstance(records, list) or not all(
        isinstance(record, dict) for record in records
    ):
        raise CacheError("cache records are not a list of objects")
    if not isinstance(clauses, list) or len(clauses) != len(records):
        raise CacheError("cache clauses do not match record count")
    normalized_clauses: list[tuple[int, ...]] = []
    for position, clause in enumerate(clauses):
        normalized = _validate_clause(clause, where=f"cache clause {position}")
        record_clause = records[position].get("clause")
        if record_clause is not None and record_clause != list(normalized):
            raise CacheError(f"cache record {position} clause mismatch")
        normalized_clauses.append(normalized)
    if not isinstance(active, list):
        raise CacheError("cache active_entries are not a list")
    for position, entry in enumerate(active):
        if not isinstance(entry, dict):
            raise CacheError(f"cache active entry {position} is not an object")
        if not isinstance(entry.get("key"), list) or "certificate" not in entry:
            raise CacheError(f"cache active entry {position} is malformed")
    if not isinstance(index, dict) or index.get("schema") != INDEX_SCHEMA:
        raise CacheError("cache antichain index schema mismatch")
    return {
        **payload,
        "records": [dict(record) for record in records],
        "clauses": normalized_clauses,
        "active_entries": [dict(entry) for entry in active],
    }


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

    payload = {
        "records": [dict(record) for record in records],
        "clauses": [list(clause) for clause in clauses],
        "active_entries": [dict(entry) for entry in active_entries],
        "index": {"schema": INDEX_SCHEMA, **dict(index)},
    }
    payload = _validate_payload(payload)
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
    source = source_identity(source_path)
    try:
        raw = json.loads(
            path.read_bytes(),
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
        expected_identity = _cache_identity(source, configuration, loader_source_sha256)
        if raw.get("identity") != expected_identity:
            raise CacheError("cache source/configuration identity mismatch")
        return CacheResult(True, "hit", _validate_payload(payload), source)
    except (CacheError, OSError, UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
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
        self.active[key] = dict(certificate)
        bucket = self.size_buckets.setdefault(len(key), set())
        bucket.add(key)
        for row in key:
            self.postings[self._row_id(row)].add(key)
        if not key:
            self.empty = key
        return key, superseded, True

    def load_active(
        self, entries: Sequence[tuple[tuple[Any, ...], Mapping[str, Any]]]
    ) -> None:
        """Load already-audited active entries without changing their order."""

        for key, certificate in entries:
            if key in self.active:
                raise CacheError("duplicate active antichain key")
            self.active[key] = dict(certificate)
            self.size_buckets.setdefault(len(key), set()).add(key)
            for row in key:
                self.postings.setdefault(self._row_id(row), set()).add(key)
            if not key:
                if self.empty is not None:
                    raise CacheError("duplicate empty antichain key")
                self.empty = key

    def index_snapshot(self) -> dict[str, Any]:
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
    for entry in payload["active_entries"]:
        key = _tupleize(entry["key"])
        if not isinstance(key, tuple):
            raise CacheError("cached antichain key is not a tuple")
        entries.append((key, entry["certificate"]))
    bank.load_active(entries)
    expected = _jsonable(payload["index"])
    actual = _jsonable(bank.index_snapshot())
    expected.pop("schema", None)
    if expected != actual:
        raise CacheError("serialized antichain index does not replay")
    return bank
