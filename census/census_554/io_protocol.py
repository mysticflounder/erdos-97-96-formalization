"""Crash-recoverable publication protocol for Census554 bank rows.

The bank is authoritative only after an exact certificate validator accepts
the row/certificate pair. A transaction publishes certificates first and then
atomically replaces the bank. A small journal makes the one possible crash
residue, certificates without a bank row, recoverable on the next transaction.
"""

from __future__ import annotations

import fcntl
import hashlib
import json
import os
import re
import uuid
from contextlib import contextmanager, nullcontext
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Callable, Iterable, Mapping


PID_RE = re.compile(r"^pat_(\d+)$")


class LockBusy(RuntimeError):
    """Raised when a non-blocking Census554 lease cannot be acquired."""


class DuplicatePattern(RuntimeError):
    """Raised when callers request strict handling of an existing motif."""


class BankFormatError(RuntimeError):
    """Raised when the bank is not a complete JSON-lines file."""


class RecoveryError(RuntimeError):
    """Raised when a previous transaction cannot be recovered safely."""


def resolve_under(root: Path, relative: str) -> Path:
    """Resolve a relative artifact path without permitting root escape."""

    candidate = Path(relative)
    if candidate.is_absolute():
        raise ValueError(f"absolute artifact path is not allowed: {relative}")
    resolved_root = root.resolve()
    resolved = (resolved_root / candidate).resolve()
    try:
        resolved.relative_to(resolved_root)
    except ValueError as exc:
        raise ValueError(f"artifact path escapes root: {relative}") from exc
    return resolved


@dataclass(frozen=True)
class BankEntry:
    """A validated certificate and the non-core fields for its bank row."""

    pattern: Mapping[int | str, Iterable[int]]
    certificate: Mapping[str, Any]
    fields: Mapping[str, Any]


@dataclass(frozen=True)
class CommitResult:
    """Rows published by a bank transaction and motifs skipped as duplicates."""

    records: tuple[dict[str, Any], ...]
    skipped_duplicates: int


def _fsync_directory(path: Path) -> None:
    fd = os.open(path, os.O_RDONLY)
    try:
        os.fsync(fd)
    finally:
        os.close(fd)


def _unlink_durable(path: Path) -> None:
    try:
        path.unlink()
    except FileNotFoundError:
        return
    _fsync_directory(path.parent)


def atomic_write_bytes(path: Path, data: bytes) -> None:
    """Write bytes through a same-directory temp file, fsync, and rename."""

    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(f".{path.name}.tmp-{os.getpid()}-{uuid.uuid4().hex}")
    try:
        with open(tmp, "xb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(tmp, path)
        _fsync_directory(path.parent)
    finally:
        try:
            tmp.unlink()
        except FileNotFoundError:
            pass


def atomic_write_text(path: Path, text: str) -> None:
    """Write text without materializing a second full-size byte buffer."""

    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(f".{path.name}.tmp-{os.getpid()}-{uuid.uuid4().hex}")
    try:
        with open(tmp, "x", encoding="utf-8", newline="") as handle:
            handle.write(text)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(tmp, path)
        _fsync_directory(path.parent)
    finally:
        try:
            tmp.unlink()
        except FileNotFoundError:
            pass


def atomic_write_json(path: Path, value: Any, *, compact: bool = False) -> None:
    """Stream JSON through a same-directory temp file, fsync, and rename."""

    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(f".{path.name}.tmp-{os.getpid()}-{uuid.uuid4().hex}")
    try:
        with open(tmp, "x", encoding="utf-8", newline="") as handle:
            if compact:
                json.dump(value, handle, sort_keys=True, separators=(",", ":"))
            else:
                json.dump(value, handle, sort_keys=True, indent=2)
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


@contextmanager
def _exclusive_lock(path: Path, description: str):
    path.parent.mkdir(parents=True, exist_ok=True)
    handle = open(path, "a+", encoding="utf-8")
    try:
        try:
            fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except (BlockingIOError, OSError) as exc:
            raise LockBusy(f"{description} is already held: {path}") from exc
        handle.seek(0)
        handle.truncate()
        handle.write(f"pid={os.getpid()}\n")
        handle.flush()
        os.fsync(handle.fileno())
        yield handle
    finally:
        try:
            fcntl.flock(handle, fcntl.LOCK_UN)
        finally:
            handle.close()


def driver_lease(root: str | os.PathLike[str]):
    """Acquire the lifetime-exclusive lease shared by all census drivers."""

    return _exclusive_lock(Path(root) / "driver.lock", "Census554 driver lease")


def bank_transaction_lock(root: str | os.PathLike[str]):
    """Acquire the short bank transaction/snapshot lock."""

    return _exclusive_lock(
        Path(root) / "bank.jsonl.lock", "Census554 bank transaction lock"
    )


def read_jsonl_strict(path: Path) -> tuple[list[dict[str, Any]], bytes]:
    """Read complete JSONL, rejecting a torn final record or non-object row."""

    try:
        raw = path.read_bytes()
    except FileNotFoundError:
        return [], b""
    if raw and not raw.endswith(b"\n"):
        raise BankFormatError(f"{path} has an unterminated final row")
    rows: list[dict[str, Any]] = []
    for line_number, line in enumerate(raw.splitlines(), 1):
        if not line.strip():
            raise BankFormatError(f"{path}:{line_number} is blank")
        try:
            row = json.loads(line)
        except json.JSONDecodeError as exc:
            raise BankFormatError(f"{path}:{line_number}: {exc}") from exc
        if not isinstance(row, dict):
            raise BankFormatError(f"{path}:{line_number} is not a JSON object")
        rows.append(row)
    return rows, raw


def row_sha256(row: Mapping[str, Any]) -> str:
    """Stable digest for identifying a row even when historical PIDs repeat."""

    payload = json.dumps(row, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def _native_pattern(
    pattern: Mapping[int | str, Iterable[int]],
) -> dict[int, frozenset[int]]:
    return {int(center): frozenset(int(member) for member in members)
            for center, members in pattern.items()}


def _json_pattern(
    pattern: Mapping[int | str, Iterable[int]],
) -> dict[str, list[int]]:
    native = _native_pattern(pattern)
    return {str(center): sorted(native[center]) for center in sorted(native)}


def _next_pid(rows: Iterable[Mapping[str, Any]]) -> int:
    suffixes = []
    for row in rows:
        match = PID_RE.fullmatch(str(row.get("pid", "")))
        if match:
            suffixes.append(int(match.group(1)))
    return max(suffixes, default=-1) + 1


def _recover_transaction(root: Path, rows: list[dict[str, Any]]) -> None:
    journal_path = root / ".bank-transaction.json"
    if not journal_path.exists():
        return
    try:
        journal = json.loads(journal_path.read_text(encoding="utf-8"))
        pids = set(journal["pids"])
        cert_paths = [resolve_under(root, rel) for rel in journal["certificates"]]
    except (KeyError, TypeError, ValueError, json.JSONDecodeError) as exc:
        raise RecoveryError(f"invalid transaction journal: {journal_path}") from exc
    committed = {str(row.get("pid")) for row in rows} & pids
    if committed and committed != pids:
        raise RecoveryError("bank contains only part of an atomic transaction")
    if committed == pids:
        missing = [str(path) for path in cert_paths if not path.is_file()]
        if missing:
            raise RecoveryError(f"committed transaction has missing certs: {missing}")
    else:
        for path in cert_paths:
            _unlink_durable(path)
    _unlink_durable(journal_path)


def commit_bank_records(
    root: str | os.PathLike[str],
    entries: Iterable[BankEntry],
    *,
    canonical_key: Callable[[dict[int, frozenset[int]]], Any],
    validate: Callable[[dict[str, Any], dict[str, Any]], Any],
    lock_held: bool = False,
    strict_duplicates: bool = False,
    fault_hook: Callable[[str], None] | None = None,
) -> CommitResult:
    """Validate and atomically publish a batch of certificates and bank rows.

    Existing malformed historical IDs do not affect allocation: the next ID is
    one greater than the maximum numeric suffix. Canonical motif deduplication
    happens while the bank lock is held.
    """

    root_path = Path(root)
    root_path.mkdir(parents=True, exist_ok=True)
    cert_dir = root_path / "certs"
    cert_dir.mkdir(parents=True, exist_ok=True)
    lock = nullcontext() if lock_held else bank_transaction_lock(root_path)
    with lock:
        bank_path = root_path / "bank.jsonl"
        rows, raw_bank = read_jsonl_strict(bank_path)
        _recover_transaction(root_path, rows)

        known_keys = {
            canonical_key(_native_pattern(row["pattern"]))
            for row in rows
            if "pattern" in row
        }
        next_index = _next_pid(rows)
        prepared: list[tuple[dict[str, Any], dict[str, Any], Path]] = []
        skipped = 0
        for entry in entries:
            native = _native_pattern(entry.pattern)
            key = canonical_key(native)
            if key in known_keys:
                if strict_duplicates:
                    raise DuplicatePattern("canonical motif already exists in bank")
                skipped += 1
                continue
            known_keys.add(key)

            pid = f"pat_{next_index:05d}"
            next_index += 1
            pattern_json = _json_pattern(native)
            certificate = dict(entry.certificate)
            if "pattern" in certificate and certificate["pattern"] != pattern_json:
                raise ValueError(f"{pid}: certificate pattern does not match entry")
            certificate["pattern"] = pattern_json
            certificate["pid"] = pid

            protected = {"pid", "pattern", "kill", "cert"}
            overlap = protected & set(entry.fields)
            if overlap:
                raise ValueError(f"{pid}: protected bank fields supplied: {sorted(overlap)}")
            if "kill" not in certificate:
                raise ValueError(f"{pid}: certificate has no kill")
            row = {
                "pid": pid,
                "pattern": pattern_json,
                "kill": certificate["kill"],
                **dict(entry.fields),
                "cert": f"certs/{pid}.json",
            }
            validate(row, certificate)
            prepared.append((row, certificate, root_path / row["cert"]))

        if not prepared:
            return CommitResult((), skipped)

        journal_path = root_path / ".bank-transaction.json"
        journal = {
            "schema": "census554_bank_transaction.v1",
            "pids": [row["pid"] for row, _, _ in prepared],
            "certificates": [str(path.relative_to(root_path))
                             for _, _, path in prepared],
            "bank_sha256_before": hashlib.sha256(raw_bank).hexdigest(),
        }
        atomic_write_json(journal_path, journal)
        bank_committed = False
        try:
            if fault_hook:
                fault_hook("after_journal")
            for _, certificate, cert_path in prepared:
                atomic_write_json(cert_path, certificate, compact=True)
            if fault_hook:
                fault_hook("after_certificates")

            additions = b"".join(
                json.dumps(row, sort_keys=True, separators=(",", ":")).encode()
                + b"\n"
                for row, _, _ in prepared
            )
            atomic_write_bytes(bank_path, raw_bank + additions)
            if fault_hook:
                fault_hook("after_bank_replace_before_commit_flag")
            bank_committed = True
            if fault_hook:
                fault_hook("after_bank")
        except BaseException:
            if not bank_committed:
                try:
                    current_rows, _ = read_jsonl_strict(bank_path)
                    expected = {row["pid"] for row, _, _ in prepared}
                    current = {str(row.get("pid")) for row in current_rows}
                    bank_committed = expected <= current
                except (OSError, BankFormatError):
                    # Preserve the journal and certs when commit state cannot be
                    # determined; the next locked recovery can adjudicate it.
                    bank_committed = True
            if not bank_committed:
                for _, _, cert_path in prepared:
                    _unlink_durable(cert_path)
                _unlink_durable(journal_path)
            raise
        _unlink_durable(journal_path)
        return CommitResult(tuple(row for row, _, _ in prepared), skipped)


def snapshot_bank(root: str | os.PathLike[str]) -> tuple[list[dict[str, Any]], bytes]:
    """Take a lock-consistent bank snapshot after recovering any transaction."""

    root_path = Path(root)
    with bank_transaction_lock(root_path):
        rows, raw = read_jsonl_strict(root_path / "bank.jsonl")
        _recover_transaction(root_path, rows)
        return rows, raw
