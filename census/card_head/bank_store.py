"""Transactional AHEAD certificate-bank publication and recovery.

One certified CEGAR iteration has three durable effects: certificate payloads,
append-only bank rows, and the matching run-protocol measurement.  A journal
bridges those effects.  If a process dies after the bank replace but before the
event append, the next locked open appends the missing event; if it dies before
the bank replace, recovery removes the uncommitted certificate files.

The bank is exact external-certificate state within a finite abstraction.  It
is not a checked finite cover or a Lean/geometric theorem.
"""

from __future__ import annotations

import fcntl
import hashlib
import json
import os
import uuid
from collections.abc import Callable, Mapping, Sequence
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from .candidate_surface import build_model, cube_ok
from .cegar_adapter import PreparedIteration
from .historical_bank import (
    canonical_pattern_key,
    normalize_pattern,
    pattern_orbit,
    window_shape_canon,
)
from .pattern_certificate import verify_pattern_certificate
from .run_manifest import json_sha256, validate_manifest
from .run_protocol import (
    RUNNING,
    append_chunk_completed,
    read_run_state,
)


BANK_ROW_SCHEMA = "p97_ahead_bank_row.v1"
BANKED_CERTIFICATE_SCHEMA = "p97_ahead_banked_certificate.v1"
TRANSACTION_SCHEMA = "p97_ahead_bank_transaction.v1"
BANK_STATUS_SCHEMA = "p97_ahead_bank_status.v1"


class BankStoreError(RuntimeError):
    """The AHEAD bank is corrupt, stale, locked, or unrecoverable."""


class BankLockBusy(BankStoreError):
    """Another process currently owns the bank transaction lock."""


@dataclass(frozen=True, slots=True)
class BankCommitResult:
    rows: tuple[dict[str, Any], ...]
    run_state: dict[str, Any]


def _canonical_bytes(value: Any) -> bytes:
    try:
        encoded = json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        )
    except (TypeError, ValueError) as exc:
        raise BankStoreError("bank artifact is not finite JSON data") from exc
    return encoded.encode("utf-8")


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_bytes(value)).hexdigest()


def _fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _atomic_replace(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(
        f".{path.name}.tmp-{os.getpid()}-{uuid.uuid4().hex}"
    )
    try:
        with open(temporary, "xb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
        _fsync_directory(path.parent)
    finally:
        try:
            temporary.unlink()
        except FileNotFoundError:
            pass


def _atomic_replace_json(path: Path, value: Any) -> None:
    _atomic_replace(path, _canonical_bytes(value) + b"\n")


def _publish_new_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists():
        raise BankStoreError(f"refusing to overwrite certificate: {path}")
    temporary = path.with_name(
        f".{path.name}.tmp-{os.getpid()}-{uuid.uuid4().hex}"
    )
    try:
        with open(temporary, "xb") as handle:
            handle.write(_canonical_bytes(value) + b"\n")
            handle.flush()
            os.fchmod(handle.fileno(), 0o444)
            os.fsync(handle.fileno())
        try:
            os.link(temporary, path)
        except FileExistsError as exc:
            raise BankStoreError(f"certificate appeared concurrently: {path}") from exc
        _fsync_directory(path.parent)
    finally:
        try:
            temporary.unlink()
        except FileNotFoundError:
            pass


def _unlink_durable(path: Path) -> None:
    try:
        path.unlink()
    except FileNotFoundError:
        return
    _fsync_directory(path.parent)


@contextmanager
def _bank_lock(root: Path):
    root.mkdir(parents=True, exist_ok=True)
    lock_path = root / "bank.lock"
    handle = open(lock_path, "a+", encoding="utf-8")
    try:
        try:
            fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except (BlockingIOError, OSError) as exc:
            raise BankLockBusy(f"AHEAD bank lock is already held: {lock_path}") from exc
        handle.seek(0)
        handle.truncate()
        handle.write(f"pid={os.getpid()}\n")
        handle.flush()
        os.fsync(handle.fileno())
        yield
    finally:
        try:
            fcntl.flock(handle, fcntl.LOCK_UN)
        finally:
            handle.close()


def _read_bank(path: Path) -> tuple[list[dict[str, Any]], bytes]:
    try:
        raw = path.read_bytes()
    except FileNotFoundError:
        return [], b""
    if raw and not raw.endswith(b"\n"):
        raise BankStoreError("bank has an unterminated final row")
    rows: list[dict[str, Any]] = []
    for line_number, line in enumerate(raw.splitlines(), 1):
        if not line.strip():
            raise BankStoreError(f"bank row {line_number} is blank")
        try:
            value = json.loads(line)
        except json.JSONDecodeError as exc:
            raise BankStoreError(f"bank row {line_number} is invalid JSON") from exc
        if not isinstance(value, dict):
            raise BankStoreError(f"bank row {line_number} is not an object")
        rows.append(value)
    return rows, raw


def _safe_child(root: Path, relative: Any) -> Path:
    if not isinstance(relative, str) or not relative:
        raise BankStoreError("certificate path must be a nonempty string")
    candidate = Path(relative)
    if candidate.is_absolute() or ".." in candidate.parts:
        raise BankStoreError("certificate path must not escape the bank root")
    resolved_root = root.resolve()
    resolved = (resolved_root / candidate).resolve()
    try:
        resolved.relative_to(resolved_root)
    except ValueError as exc:
        raise BankStoreError("certificate path escapes the bank root") from exc
    return resolved


def _shape(pattern) -> str:
    return json.dumps(window_shape_canon(pattern), separators=(",", ":"))


def _pattern_json(pattern) -> dict[str, list[int]]:
    return {
        str(center): sorted(members)
        for center, members in sorted(pattern.items())
    }


def _canonical_pattern_json(model, pattern) -> str:
    return json.dumps(
        canonical_pattern_key(model, pattern),
        separators=(",", ":"),
    )


_BANK_ROW_KEYS = {
    "schema",
    "pid",
    "run_id",
    "manifest_sha256",
    "iteration",
    "pattern",
    "canonical_pattern",
    "kill",
    "orbit_size",
    "shape",
    "certificate",
    "certificate_payload_sha256",
    "verification_sha256",
    "source_cube_sha256",
    "proposal_sha256",
}

_WRAPPER_KEYS = {
    "schema",
    "pid",
    "run_id",
    "manifest_sha256",
    "proposal_sha256",
    "iteration",
    "source_cube",
    "certificate",
    "verification",
}


def _validate_bank_rows(
    root: Path,
    manifest: Mapping[str, Any],
    rows: Sequence[Mapping[str, Any]],
    *,
    replay_identities: bool,
) -> tuple[set[str], set[str]]:
    model = build_model(manifest["cardinality"], manifest["profile"])
    manifest_digest = json_sha256(manifest)
    canonical_patterns: set[str] = set()
    shapes: set[str] = set()
    for index, row in enumerate(rows):
        if set(row) != _BANK_ROW_KEYS:
            raise BankStoreError(f"bank row {index} has drifted keys")
        pid = f"pat_{index:05d}"
        if row["schema"] != BANK_ROW_SCHEMA or row["pid"] != pid:
            raise BankStoreError(f"bank PID/schema sequence breaks at {pid}")
        if row["run_id"] != manifest["run_id"]:
            raise BankStoreError(f"{pid}: run_id differs from the manifest")
        if row["manifest_sha256"] != manifest_digest:
            raise BankStoreError(f"{pid}: manifest digest differs")
        if (
            isinstance(row["iteration"], bool)
            or not isinstance(row["iteration"], int)
            or row["iteration"] < 0
        ):
            raise BankStoreError(f"{pid}: invalid iteration")
        pattern = normalize_pattern(model, row["pattern"])
        canonical = _canonical_pattern_json(model, pattern)
        if row["canonical_pattern"] != canonical:
            raise BankStoreError(f"{pid}: canonical pattern is stale")
        if canonical in canonical_patterns:
            raise BankStoreError(f"{pid}: duplicate raw orbit")
        canonical_patterns.add(canonical)
        shape = _shape(pattern)
        if row["shape"] != shape:
            raise BankStoreError(f"{pid}: shape is stale")
        shapes.add(shape)
        orbit_size = len(pattern_orbit(model, pattern))
        if row["orbit_size"] != orbit_size:
            raise BankStoreError(f"{pid}: orbit size is stale")

        certificate_path = _safe_child(root, row["certificate"])
        if certificate_path.name != f"{pid}.json" or not certificate_path.is_file():
            raise BankStoreError(f"{pid}: certificate payload is missing")
        if certificate_path.stat().st_mode & 0o222:
            raise BankStoreError(f"{pid}: certificate payload is writable")
        try:
            wrapper = json.loads(certificate_path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as exc:
            raise BankStoreError(f"{pid}: certificate payload is unreadable") from exc
        if not isinstance(wrapper, dict) or set(wrapper) != _WRAPPER_KEYS:
            raise BankStoreError(f"{pid}: banked certificate wrapper has drifted")
        if wrapper["schema"] != BANKED_CERTIFICATE_SCHEMA or wrapper["pid"] != pid:
            raise BankStoreError(f"{pid}: certificate wrapper identity differs")
        for field in ("run_id", "manifest_sha256", "proposal_sha256", "iteration"):
            if wrapper[field] != row[field]:
                raise BankStoreError(f"{pid}: wrapper {field} differs from bank row")
        if _sha256_json(wrapper) != row["certificate_payload_sha256"]:
            raise BankStoreError(f"{pid}: certificate payload digest differs")
        if _sha256_json(wrapper["verification"]) != row["verification_sha256"]:
            raise BankStoreError(f"{pid}: verification digest differs")
        if _sha256_json(wrapper["source_cube"]) != row["source_cube_sha256"]:
            raise BankStoreError(f"{pid}: source cube digest differs")
        try:
            source_cube = {
                int(center): [int(member) for member in members]
                for center, members in wrapper["source_cube"].items()
            }
        except (AttributeError, TypeError, ValueError) as exc:
            raise BankStoreError(f"{pid}: source cube is malformed") from exc
        if not cube_ok(model, source_cube):
            raise BankStoreError(f"{pid}: source cube fails cube_ok")
        if not all(
            set(required) <= set(source_cube[center])
            for center, required in pattern.items()
        ):
            raise BankStoreError(f"{pid}: pattern is absent from source cube")
        verification = wrapper["verification"]
        if verification.get("certificate_sha256") != _sha256_json(
            wrapper["certificate"]
        ):
            raise BankStoreError(f"{pid}: raw certificate digest differs")
        if verification.get("kill") != row["kill"]:
            raise BankStoreError(f"{pid}: kill differs from verification")
        if verification.get("shape") != row["shape"]:
            raise BankStoreError(f"{pid}: shape differs from verification")
        if replay_identities:
            replay = verify_pattern_certificate(
                model,
                pattern,
                wrapper["certificate"],
            )
            if replay != verification:
                raise BankStoreError(f"{pid}: exact verification replay drifted")
    return canonical_patterns, shapes


def _event_metrics(journal: Mapping[str, Any]) -> dict[str, Any]:
    value = journal.get("event_metrics")
    if not isinstance(value, dict):
        raise BankStoreError("transaction journal has no event metrics")
    required = {
        "elapsed_seconds",
        "bank_rows_before",
        "bank_rows_after",
        "shape_count_before",
        "shape_count_after",
        "fresh_shape_count",
    }
    if set(value) != required:
        raise BankStoreError("transaction event metrics have drifted keys")
    return value


def _reconcile_event(
    manifest: Mapping[str, Any],
    event_dir: Path,
    journal: Mapping[str, Any],
) -> dict[str, Any]:
    metrics = _event_metrics(journal)
    state = read_run_state(manifest, event_dir)
    before = metrics["bank_rows_before"]
    after = metrics["bank_rows_after"]
    if (
        state["bank_rows_total"] == after
        and state["shape_count_total"] == metrics["shape_count_after"]
        and state["elapsed_seconds"] == float(metrics["elapsed_seconds"])
        and state["last_fresh_shape_count"] == metrics["fresh_shape_count"]
    ):
        return state
    if (
        state["status"] != RUNNING
        or state["bank_rows_total"] != before
        or state["shape_count_total"] != metrics["shape_count_before"]
    ):
        raise BankStoreError("run event state cannot reconcile the bank transaction")
    return append_chunk_completed(
        event_dir,
        manifest,
        elapsed_seconds=metrics["elapsed_seconds"],
        bank_rows_total=after,
        shape_count_total=metrics["shape_count_after"],
        fresh_shape_count=metrics["fresh_shape_count"],
    )


def _recover_locked(
    root: Path,
    event_dir: Path,
    manifest: Mapping[str, Any],
) -> dict[str, Any] | None:
    journal_path = root / ".bank-transaction.json"
    if not journal_path.exists():
        return None
    try:
        journal = json.loads(journal_path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise BankStoreError("bank transaction journal is unreadable") from exc
    journal_keys = {
        "schema",
        "run_id",
        "manifest_sha256",
        "pids",
        "certificates",
        "bank_sha256_before",
        "event_metrics",
    }
    if (
        not isinstance(journal, dict)
        or set(journal) != journal_keys
        or journal.get("schema") != TRANSACTION_SCHEMA
    ):
        raise BankStoreError("bank transaction journal schema is invalid")
    if journal.get("run_id") != manifest["run_id"]:
        raise BankStoreError("bank transaction journal belongs to another run")
    if journal.get("manifest_sha256") != json_sha256(manifest):
        raise BankStoreError("bank transaction journal manifest differs")
    pids = journal.get("pids")
    certificate_paths = journal.get("certificates")
    if not isinstance(pids, list) or not isinstance(certificate_paths, list):
        raise BankStoreError("bank transaction journal inventory is invalid")
    certificates = [_safe_child(root, path) for path in certificate_paths]
    rows, raw = _read_bank(root / "bank.jsonl")
    present = {str(row.get("pid")) for row in rows} & set(pids)
    if present and present != set(pids):
        raise BankStoreError("bank contains only part of a transaction")
    if not present:
        if hashlib.sha256(raw).hexdigest() != journal["bank_sha256_before"]:
            raise BankStoreError("uncommitted transaction bank boundary changed")
        for certificate in certificates:
            _unlink_durable(certificate)
        _unlink_durable(journal_path)
        return None
    missing = [str(path) for path in certificates if not path.is_file()]
    if missing:
        raise BankStoreError(f"committed bank transaction has missing certs: {missing}")
    _validate_bank_rows(
        root,
        manifest,
        rows,
        replay_identities=False,
    )
    state = _reconcile_event(manifest, event_dir, journal)
    _unlink_durable(journal_path)
    return state


def recover_bank_store(
    root: Path,
    event_dir: Path,
    manifest_value: Mapping[str, Any],
) -> dict[str, Any] | None:
    """Recover one interrupted transaction under the exclusive bank lock."""

    manifest = validate_manifest(manifest_value)
    with _bank_lock(root):
        return _recover_locked(root, event_dir, manifest)


def _prepare_publication(
    root: Path,
    manifest: Mapping[str, Any],
    prepared: PreparedIteration,
) -> tuple[list[dict[str, Any]], list[tuple[Path, dict[str, Any]]]]:
    model = build_model(manifest["cardinality"], manifest["profile"])
    rows: list[dict[str, Any]] = []
    certificates: list[tuple[Path, dict[str, Any]]] = []
    source_cube = {
        str(center): list(members)
        for center, members in sorted(prepared.source_cube.items())
    }
    if not cube_ok(model, prepared.source_cube):
        raise BankStoreError("prepared source cube changed before commit")
    for offset, item in enumerate(prepared.patterns):
        pid = f"pat_{prepared.bank_rows_before + offset:05d}"
        pattern = normalize_pattern(model, item.pattern)
        verification = verify_pattern_certificate(
            model,
            pattern,
            item.certificate,
        )
        if verification != item.verification:
            raise BankStoreError(f"{pid}: prepared verification changed before commit")
        if canonical_pattern_key(model, pattern) != item.canonical_key:
            raise BankStoreError(f"{pid}: prepared canonical orbit changed")
        if pattern_orbit(model, pattern) != item.orbit:
            raise BankStoreError(f"{pid}: prepared orbit changed")
        if _shape(pattern) != item.shape:
            raise BankStoreError(f"{pid}: prepared shape changed")
        if not all(
            set(required) <= set(prepared.source_cube[center])
            for center, required in pattern.items()
        ):
            raise BankStoreError(f"{pid}: pattern left the prepared source cube")
        wrapper = {
            "schema": BANKED_CERTIFICATE_SCHEMA,
            "pid": pid,
            "run_id": prepared.run_id,
            "manifest_sha256": prepared.manifest_sha256,
            "proposal_sha256": prepared.proposal_sha256,
            "iteration": prepared.iteration,
            "source_cube": source_cube,
            "certificate": item.certificate,
            "verification": verification,
        }
        relative_certificate = f"certificates/{pid}.json"
        row = {
            "schema": BANK_ROW_SCHEMA,
            "pid": pid,
            "run_id": prepared.run_id,
            "manifest_sha256": prepared.manifest_sha256,
            "iteration": prepared.iteration,
            "pattern": _pattern_json(pattern),
            "canonical_pattern": _canonical_pattern_json(model, pattern),
            "kill": verification["kill"],
            "orbit_size": len(item.orbit),
            "shape": item.shape,
            "certificate": relative_certificate,
            "certificate_payload_sha256": _sha256_json(wrapper),
            "verification_sha256": _sha256_json(verification),
            "source_cube_sha256": _sha256_json(source_cube),
            "proposal_sha256": prepared.proposal_sha256,
        }
        rows.append(row)
        certificates.append((root / relative_certificate, wrapper))
    return rows, certificates


def commit_prepared_iteration(
    root: Path,
    event_dir: Path,
    manifest_value: Mapping[str, Any],
    prepared: PreparedIteration,
    *,
    fault_hook: Callable[[str], None] | None = None,
) -> BankCommitResult:
    """Atomically publish certificates/bank rows and reconcile the run event."""

    manifest = validate_manifest(manifest_value)
    manifest_digest = json_sha256(manifest)
    if (
        prepared.run_id != manifest["run_id"]
        or prepared.manifest_sha256 != manifest_digest
    ):
        raise BankStoreError("prepared iteration does not belong to the manifest")
    root.mkdir(parents=True, exist_ok=True)
    (root / "certificates").mkdir(parents=True, exist_ok=True)
    with _bank_lock(root):
        _recover_locked(root, event_dir, manifest)
        bank_path = root / "bank.jsonl"
        rows, raw_bank = _read_bank(bank_path)
        _canonical, shapes = _validate_bank_rows(
            root,
            manifest,
            rows,
            replay_identities=False,
        )
        state = read_run_state(manifest, event_dir)
        if (
            state["status"] != RUNNING
            or state["bank_rows_total"] != len(rows)
            or state["shape_count_total"] != len(shapes)
        ):
            raise BankStoreError("run state is not aligned with the current bank")
        if (
            prepared.bank_rows_before != len(rows)
            or prepared.shape_count_before != len(shapes)
        ):
            raise BankStoreError("prepared iteration was built from a stale bank snapshot")
        new_rows, certificates = _prepare_publication(root, manifest, prepared)
        existing_certificate_paths = [
            str(path) for path, _wrapper in certificates if path.exists()
        ]
        if existing_certificate_paths:
            raise BankStoreError(
                "certificate targets already exist: "
                + ", ".join(existing_certificate_paths)
            )
        for row in new_rows:
            if row["canonical_pattern"] in _canonical:
                raise BankStoreError("prepared iteration duplicates the current bank")
            _canonical.add(row["canonical_pattern"])
        actual_fresh_shapes = {row["shape"] for row in new_rows} - shapes
        if (
            len(actual_fresh_shapes) != prepared.fresh_shape_count
            or len(shapes | actual_fresh_shapes) != prepared.shape_count_after
        ):
            raise BankStoreError("prepared shape-growth accounting changed")
        metrics = {
            "elapsed_seconds": prepared.elapsed_seconds,
            "bank_rows_before": len(rows),
            "bank_rows_after": len(rows) + len(new_rows),
            "shape_count_before": len(shapes),
            "shape_count_after": prepared.shape_count_after,
            "fresh_shape_count": prepared.fresh_shape_count,
        }
        journal = {
            "schema": TRANSACTION_SCHEMA,
            "run_id": manifest["run_id"],
            "manifest_sha256": manifest_digest,
            "pids": [row["pid"] for row in new_rows],
            "certificates": [
                str(path.relative_to(root)) for path, _wrapper in certificates
            ],
            "bank_sha256_before": hashlib.sha256(raw_bank).hexdigest(),
            "event_metrics": metrics,
        }
        journal_path = root / ".bank-transaction.json"
        _atomic_replace_json(journal_path, journal)
        if fault_hook:
            fault_hook("after_journal")
        for path, wrapper in certificates:
            _publish_new_json(path, wrapper)
        if fault_hook:
            fault_hook("after_certificates")
        additions = b"".join(_canonical_bytes(row) + b"\n" for row in new_rows)
        _atomic_replace(bank_path, raw_bank + additions)
        if fault_hook:
            fault_hook("after_bank")
        run_state = _reconcile_event(manifest, event_dir, journal)
        if fault_hook:
            fault_hook("after_event")
        _unlink_durable(journal_path)
        return BankCommitResult(tuple(new_rows), run_state)


def bank_status(
    root: Path,
    event_dir: Path,
    manifest_value: Mapping[str, Any],
    *,
    replay_identities: bool = False,
) -> dict[str, Any]:
    """Recover, validate, and summarize a manifest-owned bank."""

    manifest = validate_manifest(manifest_value)
    with _bank_lock(root):
        _recover_locked(root, event_dir, manifest)
        rows, raw = _read_bank(root / "bank.jsonl")
        _canonical, shapes = _validate_bank_rows(
            root,
            manifest,
            rows,
            replay_identities=replay_identities,
        )
        state = read_run_state(manifest, event_dir)
        if state["bank_rows_total"] != len(rows):
            raise BankStoreError("bank row count differs from derived run state")
        if state["shape_count_total"] != len(shapes):
            raise BankStoreError("bank shape count differs from derived run state")
        return {
            "schema": BANK_STATUS_SCHEMA,
            "status": "PASS",
            "run_id": manifest["run_id"],
            "manifest_sha256": json_sha256(manifest),
            "bank_rows": len(rows),
            "distinct_shapes": len(shapes),
            "bank_sha256": hashlib.sha256(raw).hexdigest(),
            "identity_replay": "ALL" if replay_identities else "NEW_WRITES_ONLY",
            "run_state": state,
            "scope": (
                "Exact external-certificate bank state within one finite "
                "abstraction; not finite coverage or a geometric theorem"
            ),
        }
