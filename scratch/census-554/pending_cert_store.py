#!/usr/bin/env python3
"""Crash-safe, bounded-retention storage for retry certificates.

The retry certificates are routinely gigabytes each.  Keeping them in one
JSON array or JSONL file forces every drainer restart to decode the complete
certificate payload merely to recover a few small pattern keys.  This module
instead stores one frontier-add-compatible row per file and maintains a small
append-only index of canonical pattern digests.

Two operations that must still decode a large JSON value run in short-lived
helper processes:

* one-time migration/indexing of the legacy JSON/JSONL pending files; and
* conversion of a queue result into a per-certificate record.

The helpers may have a large transient heap, but process exit returns that heap
to the OS.  The long-lived drainer only reads compact indexes and status JSON.
"""

from __future__ import annotations

import argparse
import fcntl
import hashlib
import json
import os
import subprocess
import sys
import tempfile
import uuid
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Iterable


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import cover_probe as cp  # noqa: E402
import miner  # noqa: E402


STORE_SCHEMA = "census554-pending-certificate-store-v1"
INDEX_SCHEMA = "census554-pending-certificate-index-v1"
LEGACY_INDEX_SCHEMA = "census554-legacy-pending-index-v1"


class PendingStoreError(RuntimeError):
    """The pending store or a helper operation is inconsistent."""


class LegacySourceChanged(PendingStoreError):
    """A legacy source changed while its compact index was being built."""


def _pattern(pattern_json) -> dict[int, frozenset[int]]:
    if not isinstance(pattern_json, dict):
        raise PendingStoreError("pattern must be a JSON object")
    try:
        return {
            int(center): frozenset(int(point) for point in members)
            for center, members in pattern_json.items()
        }
    except (TypeError, ValueError) as exc:
        raise PendingStoreError(f"invalid pattern: {exc}") from exc


def canonical_pattern_payload(pattern_json) -> list[list[object]]:
    """JSON form of the exact unlabeled key used by the frontier miner."""

    key = cp.unlabeled_key(_pattern(pattern_json))
    return [[int(center), [int(point) for point in members]]
            for center, members in key]


def pattern_digest(pattern_json) -> str:
    """Legacy broad-isomorphism digest used by the v1 record layout."""

    payload = canonical_pattern_payload(pattern_json)
    raw = json.dumps(payload, separators=(",", ":"), ensure_ascii=True)
    return hashlib.sha256(raw.encode("ascii")).hexdigest()


def bank_canonical_pattern_payload(pattern_json) -> list[list[object]]:
    """JSON form of the exact AUTOS key used by ``bank.jsonl``."""

    key = miner.canon_key(_pattern(pattern_json))
    return [
        [int(center), [int(point) for point in members]]
        for center, members in key
    ]


def bank_pattern_digest(pattern_json) -> str:
    """Digest under the bank's AUTOS action, not arbitrary relabeling."""

    payload = bank_canonical_pattern_payload(pattern_json)
    raw = json.dumps(payload, separators=(",", ":"), ensure_ascii=True)
    return hashlib.sha256(raw.encode("ascii")).hexdigest()


def _read_atomic_record_pattern(path: Path):
    """Read the small trailing pattern without decoding a multi-GB cert.

    ``atomic_write_json(..., sort_keys=True)`` orders a pending row as
    ``cert``, ``cube``, ``pattern``.  The exact pattern therefore lives at the
    tail even when the certificate occupies gigabytes.  This is used only for
    authoritative records written by this module.
    """

    size = path.stat().st_size
    window = min(size, 128 * 1024)
    marker = b'"pattern":'
    while window:
        with path.open("rb") as handle:
            handle.seek(size - window)
            tail = handle.read()
        offset = tail.rfind(marker)
        if offset >= 0:
            try:
                pattern, _ = json.JSONDecoder().raw_decode(
                    tail[offset + len(marker):].decode("utf-8").lstrip()
                )
            except (UnicodeDecodeError, json.JSONDecodeError) as exc:
                raise PendingStoreError(
                    f"cannot decode trailing pattern in {path}: {exc}"
                ) from exc
            _pattern(pattern)  # structural validation
            return pattern
        if window == size or window >= 8 * 1024 * 1024:
            break
        window = min(size, window * 2)
    raise PendingStoreError(f"atomic record has no trailing pattern: {path}")


def read_json_pattern_tail(path: Path):
    """Recover a sorted JSON object's trailing ``pattern`` without loading it.

    Worker result files place the potentially multi-gigabyte certificate before
    the small pattern field.  This lets a restarted drainer recover orphaned
    results in a disposable decoder process instead of discarding completed
    exact work or retaining the certificate heap in its supervisor.
    """

    return _read_atomic_record_pattern(Path(path))


def _fsync_directory(path: Path) -> None:
    fd = os.open(path, os.O_RDONLY)
    try:
        os.fsync(fd)
    finally:
        os.close(fd)


def atomic_write_json(path: Path, value) -> None:
    """Stream JSON through a same-directory temp file, fsync, and rename."""

    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(f".{path.name}.tmp-{os.getpid()}-{uuid.uuid4().hex}")
    try:
        with open(tmp, "x", encoding="utf-8", newline="") as handle:
            # json.dump uses the encoder's iterator; unlike json.dumps it does
            # not create a second complete multi-gigabyte string in memory.
            json.dump(value, handle, sort_keys=True, separators=(",", ":"))
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(tmp, path)
        _fsync_directory(path.parent)
    finally:
        try:
            tmp.unlink()
        except FileNotFoundError:
            pass


@dataclass(frozen=True)
class StoreResult:
    key_sha256: str
    bank_key_sha256: str
    record_path: Path
    stored: bool


class PendingCertificateStore:
    """One atomic record per canonical pattern plus a compact audit index."""

    def __init__(self, root: Path):
        self.root = Path(root)
        self.records_dir = self.root / "records"
        self.index_path = self.root / "index.jsonl"
        self.lock_path = self.root / "store.lock"

    def ensure_layout(self) -> None:
        self.records_dir.mkdir(parents=True, exist_ok=True)

    @contextmanager
    def _lock(self):
        self.ensure_layout()
        with open(self.lock_path, "a+b") as handle:
            fcntl.flock(handle.fileno(), fcntl.LOCK_EX)
            try:
                yield
            finally:
                fcntl.flock(handle.fileno(), fcntl.LOCK_UN)

    def record_path(self, digest: str) -> Path:
        return self.records_dir / f"{digest}.json"

    def done_digests(self) -> set[str]:
        """Return authoritative keys from atomic record filenames.

        The index is deliberately not authoritative: a crash can happen after
        an index append but before an unrelated later operation.  Publication
        order is record first, index second, so an existing record is the
        durable success marker.
        """

        try:
            entries = list(self.records_dir.iterdir())
        except FileNotFoundError:
            return set()
        return {
            entry.stem
            for entry in entries
            if entry.suffix == ".json"
            and len(entry.stem) == 64
            and all(ch in "0123456789abcdef" for ch in entry.stem)
        }

    def done_bank_digests(self) -> set[str]:
        """Return exact bank-identity keys from authoritative records.

        Filenames in the original store use the broader unlabeled digest and
        cannot distinguish every AUTOS orbit.  Reading only each record tail
        recovers the original pattern without decoding its certificate.
        """

        return {
            bank_pattern_digest(_read_atomic_record_pattern(path))
            for path in self.records_dir.glob("*.json")
            if len(path.stem) == 64
            and all(ch in "0123456789abcdef" for ch in path.stem)
        }

    def _append_index(
        self,
        digest: str,
        canonical_payload,
        bank_digest: str,
        bank_canonical_payload,
    ) -> None:
        entry = {
            "schema": INDEX_SCHEMA,
            "key_sha256": digest,
            "canonical_pattern": canonical_payload,
            "bank_key_sha256": bank_digest,
            "bank_canonical_pattern": bank_canonical_payload,
            "record": f"records/{digest}.json",
        }
        raw = (json.dumps(entry, sort_keys=True, separators=(",", ":"))
               + "\n").encode("utf-8")
        fd = os.open(self.index_path,
                     os.O_APPEND | os.O_CREAT | os.O_WRONLY, 0o644)
        try:
            offset = 0
            while offset < len(raw):
                written = os.write(fd, raw[offset:])
                if written <= 0:
                    raise OSError("short append to pending certificate index")
                offset += written
            os.fsync(fd)
        finally:
            os.close(fd)

    def store_row(
        self,
        row: dict,
        *,
        fault_hook: Callable[[str], None] | None = None,
    ) -> StoreResult:
        pattern_json = row.get("pattern")
        cert = row.get("cert")
        if not isinstance(cert, dict) or "kill" not in cert:
            raise PendingStoreError("pending row must contain a certified kill")
        canonical_payload = canonical_pattern_payload(pattern_json)
        broad_digest = hashlib.sha256(
            json.dumps(canonical_payload, separators=(",", ":"))
            .encode("ascii")
        ).hexdigest()
        bank_canonical_payload = bank_canonical_pattern_payload(pattern_json)
        bank_digest = hashlib.sha256(
            json.dumps(bank_canonical_payload, separators=(",", ":"))
            .encode("ascii")
        ).hexdigest()
        with self._lock():
            record_digest = broad_digest
            record_path = self.record_path(record_digest)
            if record_path.exists():
                existing_bank_digest = bank_pattern_digest(
                    _read_atomic_record_pattern(record_path)
                )
                if existing_bank_digest == bank_digest:
                    return StoreResult(
                        record_digest, bank_digest, record_path, False
                    )
                # Broad-isomorphic patterns can occupy different Census-AUTOS
                # orbits.  Preserve the second record under its exact bank key
                # instead of silently treating it as already stored.
                record_digest = bank_digest
                record_path = self.record_path(record_digest)
            if record_path.exists():
                existing_bank_digest = bank_pattern_digest(
                    _read_atomic_record_pattern(record_path)
                )
                if existing_bank_digest != bank_digest:
                    raise PendingStoreError(
                        "pending record digest collision across bank keys"
                    )
                return StoreResult(
                    record_digest, bank_digest, record_path, False
                )
            atomic_write_json(record_path, row)
            if fault_hook is not None:
                fault_hook("after_record_publish")
            self._append_index(
                record_digest,
                canonical_payload,
                bank_digest,
                bank_canonical_payload,
            )
            if fault_hook is not None:
                fault_hook("after_index_append")
        return StoreResult(record_digest, bank_digest, record_path, True)

    def audit(self) -> dict:
        records = self.done_digests()
        indexed: set[str] = set()
        malformed: list[int] = []
        try:
            with open(self.index_path, encoding="utf-8") as handle:
                for line_number, line in enumerate(handle, 1):
                    try:
                        row = json.loads(line)
                        if row.get("schema") != INDEX_SCHEMA:
                            raise ValueError("wrong schema")
                        digest = row["key_sha256"]
                        if not isinstance(digest, str) or len(digest) != 64:
                            raise ValueError("bad digest")
                        indexed.add(digest)
                    except (KeyError, TypeError, ValueError,
                            json.JSONDecodeError):
                        malformed.append(line_number)
        except FileNotFoundError:
            pass
        return {
            "schema": STORE_SCHEMA,
            "record_count": len(records),
            "index_count": len(indexed),
            "records_missing_from_index": sorted(records - indexed),
            "index_entries_missing_records": sorted(indexed - records),
            "malformed_index_lines": malformed,
        }


def _source_signature(path: Path) -> dict:
    stat = path.stat()
    return {
        "path": str(path.resolve()),
        "size": stat.st_size,
        "mtime_ns": stat.st_mtime_ns,
    }


def _source_signatures(sources: Iterable[Path]) -> list[dict]:
    return [_source_signature(path) for path in sources if path.exists()]


def _iter_legacy_rows(path: Path):
    if path.suffix == ".jsonl":
        with open(path, encoding="utf-8") as handle:
            for line_number, line in enumerate(handle, 1):
                if not line.strip():
                    continue
                try:
                    yield json.loads(line)
                except json.JSONDecodeError as exc:
                    raise PendingStoreError(
                        f"{path}:{line_number}: invalid JSONL: {exc}"
                    ) from exc
        return
    with open(path, encoding="utf-8") as handle:
        rows = json.load(handle)
    if not isinstance(rows, list):
        raise PendingStoreError(f"legacy JSON source is not an array: {path}")
    yield from rows


def build_legacy_index(
    index_path: Path,
    sources: Iterable[Path],
    *,
    store_root: Path | None = None,
) -> dict:
    """Build a compact index and optionally migrate rows to atomic records.

    Call this only in a helper process: legacy JSON decoding has a large heap
    high-water mark.  A source-drift failure may leave already published store
    records, which is intentional and safe; they are atomic and the next run
    canonical-deduplicates them before finishing the index.
    """

    sources = [Path(path) for path in sources]
    pending_store = (
        PendingCertificateStore(Path(store_root))
        if store_root is not None else None
    )
    before = _source_signatures(sources)
    digests: set[str] = set()
    source_rows: dict[str, int] = {}
    migrated_new = migrated_existing = 0
    for path in sources:
        if not path.exists():
            continue
        count = 0
        for row in _iter_legacy_rows(path):
            try:
                digests.add(pattern_digest(row["pattern"]))
            except (KeyError, TypeError) as exc:
                raise PendingStoreError(
                    f"legacy row in {path} has no valid pattern"
                ) from exc
            if pending_store is not None:
                result = pending_store.store_row(row)
                if result.stored:
                    migrated_new += 1
                else:
                    migrated_existing += 1
            count += 1
        source_rows[str(path.resolve())] = count
    after = _source_signatures(sources)
    if after != before:
        raise LegacySourceChanged(
            "legacy pending source changed while compact index was built"
        )
    payload = {
        "schema": LEGACY_INDEX_SCHEMA,
        "sources": before,
        "source_rows": source_rows,
        "digests": sorted(digests),
        "migrated_store": (
            str(Path(store_root).resolve()) if store_root is not None else None
        ),
        "migrated_new": migrated_new,
        "migrated_existing": migrated_existing,
    }
    atomic_write_json(Path(index_path), payload)
    return payload


def load_legacy_index(
    index_path: Path,
    sources: Iterable[Path],
    *,
    store_root: Path | None = None,
) -> set[str]:
    with open(index_path, encoding="utf-8") as handle:
        payload = json.load(handle)
    if payload.get("schema") != LEGACY_INDEX_SCHEMA:
        raise PendingStoreError("legacy pending index has the wrong schema")
    current = _source_signatures(Path(path) for path in sources)
    if payload.get("sources") != current:
        raise PendingStoreError("legacy pending index is absent or stale")
    digests = payload.get("digests")
    if not isinstance(digests, list) or not all(
        isinstance(value, str) and len(value) == 64 for value in digests
    ):
        raise PendingStoreError("legacy pending index has invalid digests")
    digest_set = set(digests)
    if store_root is not None:
        expected_root = str(Path(store_root).resolve())
        if payload.get("migrated_store") != expected_root:
            raise PendingStoreError(
                "legacy pending index does not cover the per-certificate store"
            )
        missing = digest_set - PendingCertificateStore(
            Path(store_root)
        ).done_digests()
        if missing:
            raise PendingStoreError(
                f"legacy migration is missing {len(missing)} atomic record(s)"
            )
    return digest_set


def ensure_legacy_index(
    index_path: Path,
    sources: Iterable[Path],
    *,
    store_root: Path | None = None,
) -> set[str]:
    """Load a current index or build it in a short-lived helper process."""

    index_path = Path(index_path)
    sources = [Path(path) for path in sources]
    try:
        return load_legacy_index(
            index_path, sources, store_root=store_root
        )
    except (FileNotFoundError, PendingStoreError, json.JSONDecodeError):
        pass
    command = [
        sys.executable,
        str(Path(__file__).resolve()),
        "index-legacy",
        "--index",
        str(index_path),
    ]
    if store_root is not None:
        command.extend(["--store", str(store_root)])
    command.extend(str(path) for path in sources)
    completed = subprocess.run(
        command, capture_output=True, text=True, check=False
    )
    if completed.returncode != 0:
        detail = completed.stderr.strip() or completed.stdout.strip()
        raise PendingStoreError(f"legacy index helper failed: {detail}")
    return load_legacy_index(
        index_path, sources, store_root=store_root
    )


def consume_queue_result(
    result_path: Path,
    context_path: Path,
    store_root: Path,
) -> dict:
    """Decode and persist one queue result inside a disposable process."""

    with open(context_path, encoding="utf-8") as handle:
        context = json.load(handle)
    with open(result_path, encoding="utf-8") as handle:
        data = json.load(handle)
    expected_pattern = context["pattern"]
    actual_pattern = data.get("pattern")
    cert = data.get("certificate")
    status = {
        "elapsed": float(data.get("elapsed", 0.0)),
        "worker": data.get("worker", "?"),
    }
    if isinstance(data.get("certification"), dict):
        status["certification"] = data["certification"]
    if cert is not None and isinstance(cert, dict) and "kill" in cert:
        if _pattern(actual_pattern) != _pattern(expected_pattern):
            raise PendingStoreError("queue result pattern does not match request")
        stored = PendingCertificateStore(store_root).store_row({
            "pattern": expected_pattern,
            "cert": cert,
            "cube": context.get("cube"),
        })
        status.update({
            "outcome": "certified",
            "kill": cert["kill"],
            "key_sha256": stored.key_sha256,
            "bank_key_sha256": stored.bank_key_sha256,
            "stored": stored.stored,
        })
    else:
        status.update({
            "outcome": "failed",
            "error": data.get("error"),
        })
    return status


def consume_queue_result_isolated(
    result_path: Path,
    pattern_json,
    cube,
    store_root: Path,
) -> dict:
    """Run large result decoding in a child and return only small metadata."""

    store_root = Path(store_root)
    store_root.mkdir(parents=True, exist_ok=True)
    fd, context_name = tempfile.mkstemp(
        prefix=".consume-context-", suffix=".json", dir=store_root
    )
    context_path = Path(context_name)
    try:
        with os.fdopen(fd, "w", encoding="utf-8", newline="") as handle:
            json.dump({"pattern": pattern_json, "cube": cube}, handle,
                      sort_keys=True, separators=(",", ":"))
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        command = [
            sys.executable,
            str(Path(__file__).resolve()),
            "consume-result",
            "--result",
            str(result_path),
            "--context",
            str(context_path),
            "--store",
            str(store_root),
        ]
        completed = subprocess.run(
            command, capture_output=True, text=True, check=False
        )
        if completed.returncode != 0:
            detail = completed.stderr.strip() or completed.stdout.strip()
            raise PendingStoreError(f"result helper failed: {detail}")
        try:
            return json.loads(completed.stdout)
        except json.JSONDecodeError as exc:
            raise PendingStoreError(
                f"result helper emitted invalid status: {completed.stdout!r}"
            ) from exc
    finally:
        try:
            context_path.unlink()
        except FileNotFoundError:
            pass


def _parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    subparsers = parser.add_subparsers(dest="command", required=True)

    index = subparsers.add_parser("index-legacy")
    index.add_argument("--index", type=Path, required=True)
    index.add_argument("--store", type=Path)
    index.add_argument("sources", nargs="*", type=Path)

    consume = subparsers.add_parser("consume-result")
    consume.add_argument("--result", type=Path, required=True)
    consume.add_argument("--context", type=Path, required=True)
    consume.add_argument("--store", type=Path, required=True)

    audit = subparsers.add_parser("audit")
    audit.add_argument("--store", type=Path, required=True)
    return parser.parse_args(argv)


def main(argv=None) -> int:
    args = _parse_args(argv)
    try:
        if args.command == "index-legacy":
            payload = build_legacy_index(
                args.index, args.sources, store_root=args.store
            )
            print(json.dumps({
                "status": "ok",
                "digest_count": len(payload["digests"]),
                "source_rows": payload["source_rows"],
                "migrated_new": payload["migrated_new"],
                "migrated_existing": payload["migrated_existing"],
            }, sort_keys=True), flush=True)
        elif args.command == "consume-result":
            status = consume_queue_result(
                args.result, args.context, args.store
            )
            print(json.dumps(status, sort_keys=True), flush=True)
        elif args.command == "audit":
            print(json.dumps(
                PendingCertificateStore(args.store).audit(),
                sort_keys=True,
            ), flush=True)
        else:  # pragma: no cover - argparse enforces the choices
            raise AssertionError(args.command)
    except (OSError, PendingStoreError, json.JSONDecodeError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr, flush=True)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
