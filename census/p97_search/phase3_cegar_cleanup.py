"""Reviewed quarantine-only execution for authenticated P97 cleanup plans.

This module is intentionally separate from the Phase 0 planner and the wave
engine.  It accepts only a canonical ``p97-cegar-wave-cleanup-plan/v1`` plus
the externally authenticated inventory and allowlist used to produce it.  It
has no deletion or purge operation.  A later source-removal change must be a
separate review over the immutable quarantine receipt supporting later rollback
and its rollback window.  A failed multi-target move may leave a partial
quarantine root without a receipt; that root is rollback-window state until
separately reviewed.
"""

from __future__ import annotations

import ctypes
import errno
import hashlib
import json
import os
import stat
import sys
from pathlib import Path, PurePosixPath
from typing import Any

from census.p97_search.phase3_cegar_runtime import (
    ExactFileCapture,
    ExactFileCaptureError,
    capture_exact_regular_file,
)
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_cegar_wave_control import (
    CLEANUP_PLAN_SCHEMA,
    build_cleanup_plan,
    load_entrypoint_inventory,
)

RECEIPT_SCHEMA = "p97-cegar-cleanup-quarantine-receipt/v1"
RECEIPT_NAME = "quarantine-receipt.json"
MAX_PLAN_BYTES = 8 * 1024 * 1024
MAX_RECEIPT_BYTES = 8 * 1024 * 1024
MAX_ENTRYPOINT_BYTES = 8 * 1024 * 1024

_PLAN_KEYS = frozenset(
    {
        "schema",
        "inventory_sha256",
        "approved_entrypoints_sha256",
        "targets",
        "blocked",
        "claims",
    }
)
_TARGET_KEYS = frozenset(
    {
        "path",
        "sha256",
        "replacement",
        "shadow_replay_receipt",
        "historical_replay_receipt",
        "archive_manifest",
        "rollback_pointer",
        "preserved_receipt_paths",
        "preserved_artifact_paths",
    }
)
_CLAIM_KEYS = frozenset(
    {"dry_run_only", "filesystem_mutation", "protected_artifacts_deleted"}
)
_RECEIPT_KEYS = frozenset(
    {
        "schema",
        "plan_sha256",
        "inventory_sha256",
        "approved_entrypoints_sha256",
        "quarantine_root",
        "targets",
        "claims",
        "receipt_sha256",
    }
)
_RECEIPT_TARGET_KEYS = frozenset(
    {"source_path", "source_sha256", "quarantine_path", "identity"}
)
_RECEIPT_IDENTITY_KEYS = frozenset({"device", "inode", "bytes", "nlink", "mode"})
_HEX = frozenset("0123456789abcdef")
_NATIVE_PATH_TYPE = type(Path())
_GLOB_CHARS = frozenset("*?[]{}!")


class CleanupExecutionError(ValueError):
    """An authenticated quarantine operation failed closed."""


def _strict_json(raw: bytes, *, label: str, maximum: int) -> dict[str, Any]:
    if type(raw) is not bytes or len(raw) > maximum:
        raise CleanupExecutionError(f"{label} exceeds its byte bound")

    def reject_duplicate(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise CleanupExecutionError(f"{label} has duplicate key {key!r}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw.decode("utf-8"),
            object_pairs_hook=reject_duplicate,
            parse_constant=lambda value: (_ for _ in ()).throw(
                CleanupExecutionError(f"{label} contains {value}")
            ),
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise CleanupExecutionError(f"{label} is not valid JSON") from exc
    if type(value) is not dict:
        raise CleanupExecutionError(f"{label} must be an exact object")
    return value


def _keys(value: dict[str, Any], expected: frozenset[str], label: str) -> None:
    if frozenset(value) != expected:
        raise CleanupExecutionError(
            f"{label} keys mismatch: missing={sorted(expected - frozenset(value))}, "
            f"extra={sorted(frozenset(value) - expected)}"
        )


def _hex(value: Any, label: str) -> str:
    if type(value) is not str or len(value) != 64 or frozenset(value) - _HEX:
        raise CleanupExecutionError(f"{label} must be a lowercase SHA-256")
    return value


def _path(value: Any, label: str) -> str:
    if type(value) is not str or not value or "\\" in value or "\x00" in value:
        raise CleanupExecutionError(f"{label} must be a relative POSIX path")
    parsed = PurePosixPath(value)
    if (
        parsed.is_absolute()
        or parsed.as_posix() != value
        or any(part in {"", ".", ".."} for part in parsed.parts)
        or frozenset(value) & _GLOB_CHARS
    ):
        raise CleanupExecutionError(f"{label} must be one exact non-glob path")
    return value


def _pointer(value: Any, label: str) -> dict[str, str]:
    if type(value) is not dict or frozenset(value) != {"path", "sha256"}:
        raise CleanupExecutionError(f"{label} must be an exact pointer")
    return {
        "path": _path(value["path"], f"{label}.path"),
        "sha256": _hex(value["sha256"], f"{label}.sha256"),
    }


def _validate_plan_target(value: Any, index: int) -> dict[str, Any]:
    label = f"cleanup plan target[{index}]"
    if type(value) is not dict:
        raise CleanupExecutionError(f"{label} must be an exact object")
    _keys(value, _TARGET_KEYS, label)
    normalized = {
        "path": _path(value["path"], f"{label}.path"),
        "sha256": _hex(value["sha256"], f"{label}.sha256"),
    }
    for field in (
        "replacement",
        "shadow_replay_receipt",
        "historical_replay_receipt",
        "archive_manifest",
        "rollback_pointer",
    ):
        normalized[field] = _pointer(value[field], f"{label}.{field}")
    for field in ("preserved_receipt_paths", "preserved_artifact_paths"):
        paths = value[field]
        if type(paths) is not list or any(type(item) is not str for item in paths):
            raise CleanupExecutionError(f"{label}.{field} must be a path list")
        normalized[field] = [_path(item, f"{label}.{field}[]") for item in paths]
        if normalized[field] != sorted(set(normalized[field])):
            raise CleanupExecutionError(f"{label}.{field} must be sorted and unique")
    protected = set(normalized["preserved_receipt_paths"]) | set(
        normalized["preserved_artifact_paths"]
    )
    if normalized["path"] in protected:
        raise CleanupExecutionError(f"{label} aliases protected evidence")
    return normalized


def validate_cleanup_plan(raw: bytes) -> dict[str, Any]:
    """Validate and return a canonical cleanup plan without touching the FS."""

    value = _strict_json(raw, label="cleanup plan", maximum=MAX_PLAN_BYTES)
    _keys(value, _PLAN_KEYS, "cleanup plan")
    if value["schema"] != CLEANUP_PLAN_SCHEMA:
        raise CleanupExecutionError(
            f"cleanup plan schema must be {CLEANUP_PLAN_SCHEMA!r}"
        )
    _hex(value["inventory_sha256"], "cleanup plan.inventory_sha256")
    _hex(
        value["approved_entrypoints_sha256"], "cleanup plan.approved_entrypoints_sha256"
    )
    claims = value["claims"]
    if type(claims) is not dict or frozenset(claims) != _CLAIM_KEYS:
        raise CleanupExecutionError("cleanup plan claims keys are not exact")
    if claims != {
        "dry_run_only": True,
        "filesystem_mutation": False,
        "protected_artifacts_deleted": False,
    }:
        raise CleanupExecutionError("cleanup plan claims are not dry-run claims")
    targets = value["targets"]
    if type(targets) is not list:
        raise CleanupExecutionError("cleanup plan.targets must be an exact list")
    normalized_targets = [
        _validate_plan_target(item, index) for index, item in enumerate(targets)
    ]
    if [item["path"] for item in normalized_targets] != sorted(
        {item["path"] for item in normalized_targets}
    ):
        raise CleanupExecutionError(
            "cleanup plan targets must be path-sorted and unique"
        )
    blocked = value["blocked"]
    if type(blocked) is not list:
        raise CleanupExecutionError("cleanup plan.blocked must be an exact list")
    normalized_blocked: list[dict[str, Any]] = []
    for index, item in enumerate(blocked):
        if type(item) is not dict or frozenset(item) != {"path", "reasons"}:
            raise CleanupExecutionError(f"cleanup plan blocked[{index}] is not exact")
        reasons = item["reasons"]
        if type(reasons) is not list or any(
            type(reason) is not str for reason in reasons
        ):
            raise CleanupExecutionError(
                f"cleanup plan blocked[{index}].reasons is invalid"
            )
        normalized_blocked.append(
            {
                "path": _path(item["path"], f"cleanup plan blocked[{index}].path"),
                "reasons": reasons,
            }
        )
    normalized = {
        "schema": CLEANUP_PLAN_SCHEMA,
        "inventory_sha256": value["inventory_sha256"],
        "approved_entrypoints_sha256": value["approved_entrypoints_sha256"],
        "targets": normalized_targets,
        "blocked": normalized_blocked,
        "claims": claims,
    }
    if canonical_json_bytes(normalized) != raw:
        raise CleanupExecutionError("cleanup plan is not canonical")
    return normalized


def validate_quarantine_receipt(raw: bytes) -> dict[str, Any]:
    """Validate an immutable quarantine receipt and its self-digest."""

    value = _strict_json(raw, label="quarantine receipt", maximum=MAX_RECEIPT_BYTES)
    _keys(value, _RECEIPT_KEYS, "quarantine receipt")
    if value["schema"] != RECEIPT_SCHEMA:
        raise CleanupExecutionError(
            f"quarantine receipt schema must be {RECEIPT_SCHEMA!r}"
        )
    for field in (
        "plan_sha256",
        "inventory_sha256",
        "approved_entrypoints_sha256",
        "receipt_sha256",
    ):
        _hex(value[field], f"quarantine receipt.{field}")
    if type(value["quarantine_root"]) is not str or not value["quarantine_root"]:
        raise CleanupExecutionError("quarantine receipt root is invalid")
    if value["claims"] != {"deleted": False, "purge_supported": False}:
        raise CleanupExecutionError("quarantine receipt claims are invalid")
    targets = value["targets"]
    if type(targets) is not list:
        raise CleanupExecutionError("quarantine receipt.targets must be an exact list")
    for index, target in enumerate(targets):
        label = f"quarantine receipt target[{index}]"
        if type(target) is not dict:
            raise CleanupExecutionError(f"{label} must be an exact object")
        _keys(target, _RECEIPT_TARGET_KEYS, label)
        _path(target["source_path"], f"{label}.source_path")
        _hex(target["source_sha256"], f"{label}.source_sha256")
        _path(target["quarantine_path"], f"{label}.quarantine_path")
        identity = target["identity"]
        if type(identity) is not dict or frozenset(identity) != _RECEIPT_IDENTITY_KEYS:
            raise CleanupExecutionError(f"{label}.identity is not exact")
        for field in _RECEIPT_IDENTITY_KEYS:
            if type(identity[field]) is not int or identity[field] < 0:
                raise CleanupExecutionError(f"{label}.identity.{field} is invalid")
    without_digest = dict(value)
    del without_digest["receipt_sha256"]
    if sha256_bytes(canonical_json_bytes(without_digest)) != value["receipt_sha256"]:
        raise CleanupExecutionError("quarantine receipt self-digest crossed")
    if canonical_json_bytes(value) != raw:
        raise CleanupExecutionError("quarantine receipt is not canonical")
    return value


def _open_directory_nofollow(path: Path) -> int:
    if type(path) is not _NATIVE_PATH_TYPE or not hasattr(os, "O_NOFOLLOW"):
        raise CleanupExecutionError("directory path or platform is unsafe")
    absolute = Path(os.path.abspath(os.fspath(path)))
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | os.O_NOFOLLOW
    descriptor: int | None = None
    try:
        descriptor = os.open(os.path.sep, flags)
        for component in absolute.parts[1:]:
            child = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = child
        return descriptor
    except OSError as exc:
        if descriptor is not None:
            os.close(descriptor)
        raise CleanupExecutionError(
            f"cannot open directory without following links: {path}"
        ) from exc


def _create_quarantine_root(path: Path) -> int:
    if type(path) is not _NATIVE_PATH_TYPE:
        raise CleanupExecutionError("quarantine_root must be an exact native Path")
    parent_fd = _open_directory_nofollow(path.parent)
    try:
        os.mkdir(path.name, 0o700, dir_fd=parent_fd)
        return os.open(
            path.name,
            os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | os.O_NOFOLLOW,
            dir_fd=parent_fd,
        )
    except FileExistsError as exc:
        raise CleanupExecutionError("quarantine root must be create-once") from exc
    except OSError as exc:
        raise CleanupExecutionError("cannot create quarantine root safely") from exc
    finally:
        os.close(parent_fd)


def _rename_noreplace(
    source_fd: int, source: str, destination_fd: int, destination: str
) -> None:
    libc = ctypes.CDLL(None, use_errno=True)
    source_bytes = os.fsencode(source)
    destination_bytes = os.fsencode(destination)
    if sys.platform == "darwin" and hasattr(libc, "renameatx_np"):
        function = libc.renameatx_np
        function.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        function.restype = ctypes.c_int
        result = function(
            source_fd, source_bytes, destination_fd, destination_bytes, 0x4
        )
    elif sys.platform.startswith("linux") and hasattr(libc, "renameat2"):
        function = libc.renameat2
        function.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        function.restype = ctypes.c_int
        result = function(
            source_fd, source_bytes, destination_fd, destination_bytes, 0x1
        )
    else:
        raise CleanupExecutionError("platform lacks atomic no-replace rename")
    if result != 0:
        error = ctypes.get_errno()
        if error == errno.EEXIST:
            raise CleanupExecutionError("quarantine destination already exists")
        raise CleanupExecutionError(
            f"atomic quarantine move failed: {os.strerror(error)}"
        )


def _capture_held_regular_file(
    descriptor: int,
    *,
    max_bytes: int,
    require_nonempty: bool,
    keep_bytes: bool,
    label: str,
) -> ExactFileCapture:
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode):
            raise ExactFileCaptureError(f"{label} is not a regular file")
        if before.st_nlink != 1:
            raise ExactFileCaptureError(f"{label} has multiple hard links")
        if require_nonempty and before.st_size == 0:
            raise ExactFileCaptureError(f"{label} is empty")
        if before.st_size > max_bytes:
            raise ExactFileCaptureError(f"{label} exceeds its byte bound")
        digest = hashlib.sha256()
        chunks: list[bytes] = []
        offset = 0
        while offset < before.st_size:
            chunk = os.pread(descriptor, min(1 << 20, before.st_size - offset), offset)
            if not chunk:
                raise ExactFileCaptureError(f"{label} changed during capture")
            digest.update(chunk)
            if keep_bytes:
                chunks.append(chunk)
            offset += len(chunk)
        after = os.fstat(descriptor)
    except OSError as exc:
        raise ExactFileCaptureError(f"{label} could not be captured") from exc
    if (
        before.st_dev,
        before.st_ino,
        before.st_mode,
        before.st_nlink,
        before.st_size,
    ) != (after.st_dev, after.st_ino, after.st_mode, after.st_nlink, after.st_size):
        raise ExactFileCaptureError(f"{label} changed during capture")
    return ExactFileCapture(
        device=after.st_dev,
        inode=after.st_ino,
        byte_count=after.st_size,
        link_count=after.st_nlink,
        sha256=digest.hexdigest(),
        data=b"".join(chunks) if keep_bytes else None,
    )


def _atomic_quarantine_move(
    source: Path,
    destination_name: str,
    expected: ExactFileCapture,
    destination_fd: int,
) -> dict[str, Any]:
    source_parent = _open_directory_nofollow(source.parent)
    source_descriptor: int | None = None
    try:
        source_descriptor = os.open(
            source.name,
            os.O_RDONLY
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_NONBLOCK", 0)
            | os.O_NOFOLLOW,
            dir_fd=source_parent,
        )
        held = _capture_held_regular_file(
            source_descriptor,
            max_bytes=MAX_ENTRYPOINT_BYTES,
            require_nonempty=True,
            keep_bytes=False,
            label="cleanup target",
        )
        before = os.stat(source.name, dir_fd=source_parent, follow_symlinks=False)
        if not held.same_identity_and_content(expected) or (
            before.st_dev,
            before.st_ino,
            before.st_size,
            before.st_nlink,
        ) != (held.device, held.inode, held.byte_count, held.link_count):
            raise CleanupExecutionError(
                "cleanup target identity crossed before atomic quarantine move"
            )
        _rename_noreplace(source_parent, source.name, destination_fd, destination_name)
        after = os.stat(destination_name, dir_fd=destination_fd, follow_symlinks=False)
        if (before.st_dev, before.st_ino) != (after.st_dev, after.st_ino):
            raise CleanupExecutionError("quarantine destination inode changed")
        os.fsync(source_parent)
        os.fsync(destination_fd)
        try:
            os.stat(source.name, dir_fd=source_parent, follow_symlinks=False)
        except FileNotFoundError:
            pass
        else:
            raise CleanupExecutionError("cleanup source still exists after quarantine")
        return {
            "device": after.st_dev,
            "inode": after.st_ino,
            "bytes": after.st_size,
            "nlink": after.st_nlink,
            "mode": stat.S_IFMT(after.st_mode),
        }
    finally:
        if source_descriptor is not None:
            os.close(source_descriptor)
        os.close(source_parent)


def _write_immutable_at(parent_fd: int, name: str, payload: bytes) -> None:
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_RDWR | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o600,
            dir_fd=parent_fd,
        )
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            if written <= 0:
                raise CleanupExecutionError("short immutable receipt write")
            offset += written
        os.fsync(descriptor)
        os.fsync(parent_fd)
        try:
            captured = _capture_held_regular_file(
                descriptor,
                max_bytes=MAX_RECEIPT_BYTES,
                require_nonempty=True,
                keep_bytes=True,
                label="quarantine receipt",
            )
        except ExactFileCaptureError as exc:
            raise CleanupExecutionError(
                "installed receipt failed revalidation"
            ) from exc
        if captured.data != payload:
            raise CleanupExecutionError("installed receipt bytes changed")
    except OSError as exc:
        raise CleanupExecutionError("receipt path already exists or is unsafe") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def execute_quarantine_plan(
    plan_raw: bytes,
    inventory_raw: bytes,
    repo_root: Path,
    quarantine_root: Path,
    *,
    expected_plan_sha256: str,
    approved_entrypoints: dict[str, str],
) -> dict[str, Any]:
    """Atomically quarantine every authenticated target and emit one receipt.

    The operation is explicit and create-once.  It never removes a path.  Each
    rename and receipt write uses held no-follow quarantine descriptors.  The
    source is re-digested through a held descriptor immediately before rename;
    a post-move digest failure can leave the source already moved into a
    partial quarantine root without a receipt; preserve it for rollback-window
    review and do not retry or purge automatically.
    """

    plan = validate_cleanup_plan(plan_raw)
    if sha256_bytes(plan_raw) != _hex(expected_plan_sha256, "expected plan SHA-256"):
        raise CleanupExecutionError("cleanup plan digest is not the approved digest")
    if (
        type(repo_root) is not _NATIVE_PATH_TYPE
        or type(quarantine_root) is not _NATIVE_PATH_TYPE
    ):
        raise CleanupExecutionError(
            "repo_root and quarantine_root must be native Paths"
        )
    repo_absolute = Path(os.path.abspath(os.fspath(repo_root)))
    repo_canonical = Path(os.path.realpath(os.fspath(repo_absolute)))
    if repo_root != repo_absolute or repo_canonical != repo_absolute:
        raise CleanupExecutionError(
            "repo_root must be an absolute canonical no-symlink path"
        )
    try:
        repo_metadata = os.stat(repo_absolute, follow_symlinks=False)
    except OSError as exc:
        raise CleanupExecutionError("repo_root cannot be inspected") from exc
    if not stat.S_ISDIR(repo_metadata.st_mode):
        raise CleanupExecutionError("repo_root must be a directory")
    quarantine_absolute = Path(os.path.abspath(os.fspath(quarantine_root)))
    if quarantine_absolute == repo_absolute:
        raise CleanupExecutionError("quarantine root cannot be the repository root")
    if not sha256_bytes(inventory_raw) == plan["inventory_sha256"]:
        raise CleanupExecutionError("inventory bytes do not match cleanup plan")
    inventory = load_entrypoint_inventory(inventory_raw)
    expected_plan = build_cleanup_plan(
        inventory_raw,
        repo_absolute,
        expected_inventory_sha256=plan["inventory_sha256"],
        approved_entrypoints=approved_entrypoints,
    )
    if canonical_json_bytes(expected_plan) != plan_raw:
        raise CleanupExecutionError(
            "cleanup plan no longer matches inventory and allowlist"
        )
    root_fd = _create_quarantine_root(quarantine_absolute)
    entries_fd: int | None = None
    try:
        try:
            os.mkdir("entries", 0o700, dir_fd=root_fd)
            entries_fd = os.open(
                "entries",
                os.O_RDONLY
                | getattr(os, "O_CLOEXEC", 0)
                | getattr(os, "O_DIRECTORY", 0)
                | os.O_NOFOLLOW,
                dir_fd=root_fd,
            )
        except FileExistsError as exc:
            raise CleanupExecutionError(
                "quarantine entries directory already exists"
            ) from exc
        except OSError as exc:
            raise CleanupExecutionError(
                "cannot create quarantine entries directory"
            ) from exc
        quarantined: list[dict[str, Any]] = []
        inventory_paths = {entry["path"]: entry for entry in inventory["entries"]}
        for index, target in enumerate(plan["targets"]):
            inventory_entry = inventory_paths.get(target["path"])
            if inventory_entry is None or inventory_entry["sha256"] != target["sha256"]:
                raise CleanupExecutionError(
                    "cleanup inventory target disappeared or crossed"
                )
            source = repo_absolute / Path(*PurePosixPath(target["path"]).parts)
            destination_name = (
                f"{index:08d}-{target['sha256']}-{PurePosixPath(target['path']).name}"
            )
            try:
                captured = capture_exact_regular_file(
                    source,
                    max_bytes=MAX_ENTRYPOINT_BYTES,
                    require_nonempty=True,
                    require_single_link=True,
                    keep_bytes=False,
                    label="cleanup target",
                )
            except ExactFileCaptureError as exc:
                raise CleanupExecutionError(
                    "cleanup target failed no-follow revalidation"
                ) from exc
            if captured.sha256 != target["sha256"]:
                raise CleanupExecutionError(
                    "cleanup target digest crossed before quarantine"
                )
            assert entries_fd is not None
            identity = _atomic_quarantine_move(
                source, destination_name, captured, entries_fd
            )
            destination_descriptor = os.open(
                destination_name,
                os.O_RDONLY
                | getattr(os, "O_CLOEXEC", 0)
                | getattr(os, "O_NONBLOCK", 0)
                | os.O_NOFOLLOW,
                dir_fd=entries_fd,
            )
            try:
                quarantined_capture = _capture_held_regular_file(
                    destination_descriptor,
                    max_bytes=MAX_ENTRYPOINT_BYTES,
                    require_nonempty=True,
                    keep_bytes=False,
                    label="quarantine target",
                )
            except ExactFileCaptureError as exc:
                raise CleanupExecutionError(
                    "quarantine target failed descriptor revalidation"
                ) from exc
            finally:
                os.close(destination_descriptor)
            if quarantined_capture.sha256 != target["sha256"]:
                raise CleanupExecutionError("quarantine target digest crossed")
            quarantined.append(
                {
                    "source_path": target["path"],
                    "source_sha256": target["sha256"],
                    "quarantine_path": f"entries/{destination_name}",
                    "identity": identity,
                }
            )
        body = {
            "schema": RECEIPT_SCHEMA,
            "plan_sha256": sha256_bytes(plan_raw),
            "inventory_sha256": plan["inventory_sha256"],
            "approved_entrypoints_sha256": plan["approved_entrypoints_sha256"],
            "quarantine_root": quarantine_absolute.name,
            "targets": quarantined,
            "claims": {"deleted": False, "purge_supported": False},
        }
        body["receipt_sha256"] = sha256_bytes(canonical_json_bytes(body))
        receipt_raw = canonical_json_bytes(body)
        if len(receipt_raw) > MAX_RECEIPT_BYTES:
            raise CleanupExecutionError("quarantine receipt exceeds its byte bound")
        assert entries_fd is not None
        _write_immutable_at(root_fd, RECEIPT_NAME, receipt_raw)
        return validate_quarantine_receipt(receipt_raw)
    finally:
        if entries_fd is not None:
            os.close(entries_fd)
        os.close(root_fd)


__all__ = [
    "RECEIPT_NAME",
    "RECEIPT_SCHEMA",
    "CleanupExecutionError",
    "execute_quarantine_plan",
    "validate_cleanup_plan",
    "validate_quarantine_receipt",
]
