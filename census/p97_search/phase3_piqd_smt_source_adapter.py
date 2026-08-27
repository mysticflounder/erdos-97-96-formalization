"""Producer-neutral, source-semantic adapter for PIQD SMT sessions.

The adapter preserves a producer's exact SMT-LIB2 bytes, derives the exact
state-command journal PIQD will retain, and cross-binds the exported journal,
solve response, and durable receipt.  SAT is useful only after a producer-
supplied semantic verifier accepts PIQD's raw model and get-value text.

This is diagnostic infrastructure.  In particular, it does not establish
source entitlement, a theorem, a universal result, a Lean result, or a
Euclidean result.
"""

from __future__ import annotations

import ctypes
import errno
import hashlib
import json
import os
import stat
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
import uuid
from collections.abc import Callable, Mapping
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any, Protocol, Self

QUERY_SCHEMA = "p97-piqd-source-semantic-query/v1"
MANIFEST_SCHEMA = "p97-piqd-smt-source-manifest/v1"
RESULT_SCHEMA = "p97-piqd-smt-source-adapter-result/v1"
SOLVER_PROFILE_SCHEMA = "piqd-smt-sequential-z3-cvc5/v1"
PIQD_RESULT_DIGEST_VERSION = b"piqd-smt-solve-result/v1"
PIQD_SOLVE_REQUEST_DIGEST_VERSION = b"piqd-smt-solve-request/v1"
PIQD_SESSION_LIFECYCLE_SCHEMA = "piqd-smt-session-lifecycle/v1"
PIQD_RESUME_REQUIRE_EXISTING = "require_existing_session"
PIQD_RESUME_ALLOW_CREATE_IF_MISSING = "allow_create_if_prefix_proves_no_mutation"
SOLVERS = ("z3", "cvc5")

MAX_DESCRIPTOR_BYTES = 2 * 1024 * 1024
MAX_SOURCE_BYTES = 32 * 1024 * 1024
MAX_SOURCE_TOTAL_BYTES = 128 * 1024 * 1024
MAX_SMT2_BYTES = 64 * 1024 * 1024
MAX_EXPORT_BYTES = 64 * 1024 * 1024
PIQD_EFFECTIVE_DEADLINE_GRACE_MS = 30_000
PIQD_HTTP_RESPONSE_MARGIN_MS = 5_000
MAX_OUTPUT_BYTES = 96 * 1024 * 1024
MAX_OUTPUT_TOTAL_BYTES = 768 * 1024 * 1024
MAX_JSON_DEPTH = 64
MAX_JSON_NODES = 250_000
MAX_COMMANDS = 250_000
MAX_SMT_DEPTH = 512

# A solve response can time out at the client a few milliseconds before PIQD
# commits its terminal session fields and append-only receipt.  Reconciliation
# is deliberately small and finite: it never resubmits POST /solve, and its
# total sleeping budget is below one second.
TRANSPORT_RECONCILIATION_DELAYS_S = (0.0, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5)

STATE_COMMANDS = frozenset(
    {
        "set-logic",
        "set-option",
        "set-info",
        "declare-sort",
        "define-sort",
        "declare-fun",
        "define-fun",
        "declare-const",
        "define-const",
        "declare-datatype",
        "declare-datatypes",
        "define-fun-rec",
        "define-funs-rec",
        "assert",
        "push",
        "pop",
    }
)
RESERVED_OPTIONS = frozenset(
    {
        "print-success",
        "produce-models",
        "produce-unsat-assumptions",
        "produce-unsat-cores",
        "regular-output-channel",
        "diagnostic-output-channel",
        "timeout",
        "tlimit-per",
    }
)
FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem": False,
    "universal": False,
    "lean": False,
    "euclidean": False,
}


class SmtSourceAdapterError(RuntimeError):
    """The source packet, PIQD response, or custody boundary failed closed."""


class PiqdTransportLoss(SmtSourceAdapterError):
    """A request may have reached PIQD, but its response was not received."""


@dataclass(frozen=True)
class JsonResponse:
    status: int
    body: object


@dataclass(frozen=True)
class BytesResponse:
    status: int
    body: bytes


class PiqdTransport(Protocol):
    """The exact transport surface used by this adapter."""

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> JsonResponse: ...

    def request_bytes(self, method: str, path: str) -> BytesResponse: ...


@dataclass(frozen=True)
class SemanticVerification:
    """A producer verifier's typed answer for one SAT model/readback."""

    accepted: bool
    evidence: object


@dataclass(frozen=True)
class SourceSnapshot:
    """One descriptor-named source file and its authenticated exact bytes."""

    path: str
    payload: bytes


@dataclass(frozen=True)
class SourceSemanticQuery:
    """An authenticated source-semantic query and its exact source bytes."""

    descriptor: dict[str, Any]
    descriptor_bytes: bytes
    original_smt2: bytes
    journal_commands: tuple[str, ...]
    journal_smt2: bytes
    source_files: tuple[SourceSnapshot, ...]

    @property
    def assumptions(self) -> tuple[str, ...]:
        by_id = {
            entry["id"]: entry["assumption_term"]
            for entry in self.descriptor["named_atoms"]
        }
        return tuple(by_id[item] for item in self.descriptor["solve"]["assumption_ids"])

    @property
    def get_values(self) -> tuple[str, ...]:
        by_id = {entry["id"]: entry["term"] for entry in self.descriptor["variables"]}
        return tuple(
            by_id[item] for item in self.descriptor["solve"]["readback_variable_ids"]
        )


SemanticVerifier = Callable[
    [SourceSemanticQuery, str, str, str | None], SemanticVerification
]


def _fail(condition: bool, message: str) -> None:
    if not condition:
        raise SmtSourceAdapterError(message)


def _sha256(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _snapshot_builtin_json(value: object, where: str) -> object:
    """Copy a JSON tree while rejecting Python's lookalike/subclass values."""

    nodes = 0

    def visit(item: object, depth: int) -> object:
        nonlocal nodes
        nodes += 1
        _fail(nodes <= MAX_JSON_NODES, f"{where} exceeds the JSON node cap")
        _fail(depth <= MAX_JSON_DEPTH, f"{where} exceeds the JSON depth cap")
        if item is None or type(item) in {bool, int, str}:
            return item
        if type(item) is list:
            return [visit(child, depth + 1) for child in item]
        if type(item) is dict:
            result: dict[str, object] = {}
            for key, child in item.items():
                _fail(type(key) is str, f"{where} has a non-string object key")
                result[key] = visit(child, depth + 1)
            return result
        raise SmtSourceAdapterError(
            f"{where} contains a non-builtin JSON value of type {type(item).__name__}"
        )

    return visit(value, 0)


def _canonical_json(value: object) -> bytes:
    snap = _snapshot_builtin_json(value, "canonical JSON")
    return json.dumps(
        snap,
        ensure_ascii=False,
        allow_nan=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")


def _json_artifact(value: object) -> bytes:
    return _canonical_json(value) + b"\n"


def _strict_json(payload: bytes, where: str) -> object:
    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in items:
            if key in result:
                raise ValueError(f"duplicate key {key!r}")
            result[key] = value
        return result

    def constant(value: str) -> object:
        raise ValueError(f"non-JSON constant {value}")

    try:
        value = json.loads(
            payload.decode("utf-8"),
            object_pairs_hook=pairs,
            parse_constant=constant,
        )
    except (UnicodeDecodeError, ValueError, json.JSONDecodeError) as exc:
        raise SmtSourceAdapterError(f"{where} is not strict UTF-8 JSON") from exc
    return _snapshot_builtin_json(value, where)


def _object(
    value: object,
    required: set[str],
    where: str,
    *,
    optional: set[str] | frozenset[str] = frozenset(),
) -> dict[str, Any]:
    _fail(type(value) is dict, f"{where} must be an exact object")
    keys = set(value)
    _fail(required <= keys <= required | optional, f"{where} has unexpected keys")
    return value


def _string(value: object, where: str, *, allow_empty: bool = False) -> str:
    _fail(
        type(value) is str and (allow_empty or bool(value)),
        f"{where} must be exact text",
    )
    return value


def _integer(value: object, where: str, *, minimum: int = 0) -> int:
    _fail(
        type(value) is int and value >= minimum,
        f"{where} must be an exact integer >= {minimum}",
    )
    return value


def effective_deadline_ms(timeout_ms: object, where: str = "timeout_ms") -> int:
    """Return the exact bounded-solve deadline disclosed by current PIQD."""

    timeout = _integer(timeout_ms, where, minimum=1)
    return timeout + PIQD_EFFECTIVE_DEADLINE_GRACE_MS


def bounded_solve_http_timeout_s(timeout_ms: object) -> float:
    """Leave a transport-only response margin beyond PIQD's solver deadline."""

    return (effective_deadline_ms(timeout_ms) + PIQD_HTTP_RESPONSE_MARGIN_MS) / 1000


def _digest(value: object, where: str) -> str:
    text = _string(value, where)
    _fail(
        len(text) == 64 and all(character in "0123456789abcdef" for character in text),
        f"{where} must be a lowercase SHA-256",
    )
    return text


def _canonical_uuid(value: object, where: str) -> str:
    text = _string(value, where)
    try:
        parsed = uuid.UUID(text)
    except ValueError as exc:
        raise SmtSourceAdapterError(f"{where} is not a canonical UUID") from exc
    _fail(str(parsed) == text, f"{where} is not a canonical UUID")
    return text


def _safe_relative_path(value: object, where: str) -> str:
    text = _string(value, where)
    _fail("\\" not in text and "\x00" not in text, f"{where} is not a POSIX path")
    path = PurePosixPath(text)
    _fail(
        not path.is_absolute()
        and path.parts
        and all(part not in {"", ".", ".."} for part in path.parts),
        f"{where} must be a normalized relative path",
    )
    _fail(path.as_posix() == text, f"{where} is not a canonical relative path")
    return text


def _open_directory_nofollow(path: Path) -> int:
    absolute = Path(os.path.abspath(os.fspath(path)))
    try:
        descriptor = os.open("/", os.O_RDONLY | os.O_DIRECTORY)
    except OSError as exc:
        raise SmtSourceAdapterError("cannot open artifact root") from exc
    try:
        for part in absolute.parts[1:]:
            next_descriptor = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=descriptor,
            )
            os.close(descriptor)
            descriptor = next_descriptor
        info = os.fstat(descriptor)
        _fail(stat.S_ISDIR(info.st_mode), "artifact root is not a directory")
        return descriptor
    except SmtSourceAdapterError:
        os.close(descriptor)
        raise
    except OSError as exc:
        os.close(descriptor)
        raise SmtSourceAdapterError(
            "cannot open artifact root without following links"
        ) from exc
    except BaseException:
        os.close(descriptor)
        raise


def _read_relative(root_fd: int, relative: str, cap: int, where: str) -> bytes:
    parts = PurePosixPath(relative).parts
    directory_fd = os.dup(root_fd)
    descriptor: int | None = None
    try:
        for part in parts[:-1]:
            next_fd = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=directory_fd,
            )
            os.close(directory_fd)
            directory_fd = next_fd
        descriptor = os.open(
            parts[-1], os.O_RDONLY | os.O_NOFOLLOW, dir_fd=directory_fd
        )
        before = os.fstat(descriptor)
        _fail(stat.S_ISREG(before.st_mode), f"{where} is not a regular file")
        _fail(before.st_nlink == 1, f"{where} is hard-linked")
        _fail(before.st_size <= cap, f"{where} exceeds its byte cap")
        chunks: list[bytes] = []
        remaining = cap + 1
        while remaining:
            chunk = os.read(descriptor, min(1024 * 1024, remaining))
            if not chunk:
                break
            chunks.append(chunk)
            remaining -= len(chunk)
        payload = b"".join(chunks)
        after = os.fstat(descriptor)
        _fail(after.st_nlink == 1, f"{where} became hard-linked during capture")
        before_identity = (
            before.st_dev,
            before.st_ino,
            before.st_mode,
            before.st_nlink,
            before.st_size,
            before.st_mtime_ns,
            before.st_ctime_ns,
        )
        after_identity = (
            after.st_dev,
            after.st_ino,
            after.st_mode,
            after.st_nlink,
            after.st_size,
            after.st_mtime_ns,
            after.st_ctime_ns,
        )
        _fail(
            len(payload) <= cap
            and len(payload) == before.st_size
            and before_identity == after_identity,
            f"{where} changed during capture",
        )
        return payload
    except OSError as exc:
        raise SmtSourceAdapterError(
            f"cannot read {where} without following links"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        os.close(directory_fd)


@dataclass
class _OutputStaging:
    parent_fd: int
    staging_fd: int
    staging_name: str
    final_name: str
    parent_path: Path
    installed: bool = False


class SmtOutputTransaction:
    """Public create-once transaction for one authenticated SMT output tree.

    The held directory descriptors, cleanup quarantine, immutable writes, and
    atomic no-replace publication remain implemented by this module.  Engines
    can compose additional custody artifacts without importing those private
    primitives or gaining a path-based overwrite operation.
    """

    def __init__(self, output_directory: Path) -> None:
        _fail(
            type(output_directory) is type(Path()) and output_directory.is_absolute(),
            "output directory must be an absolute native Path",
        )
        self._staging = _reserve_output_staging(output_directory)
        self._closed = False

    @property
    def file_descriptor(self) -> int:
        _fail(not self._closed, "output transaction is closed")
        return self._staging.staging_fd

    def write_bytes(self, name: str, payload: bytes) -> dict[str, object]:
        _fail(not self._closed, "output transaction is closed")
        _fail(type(name) is str and type(payload) is bytes, "invalid output artifact")
        return _write_immutable(self._staging.staging_fd, name, payload)

    def publish(self) -> None:
        _fail(not self._closed, "output transaction is closed")
        _fail(not self._staging.installed, "output transaction is already published")
        _publish_output(self._staging)

    def close(self) -> None:
        if self._closed:
            return
        self._closed = True
        _close_output_staging(self._staging, keep=self._staging.installed)

    def __enter__(self) -> Self:
        _fail(not self._closed, "output transaction is closed")
        return self

    def __exit__(self, exc_type: object, exc: object, traceback: object) -> None:
        self.close()


def _reserve_output_staging(path: Path) -> _OutputStaging:
    _fail(path.name not in {"", ".", ".."}, "unsafe output directory")
    _fail(len(os.fsencode(path.name)) <= 128, "output directory name is too long")
    parent_fd = _open_directory_nofollow(path.parent)
    staging_name: str | None = None
    staging_fd: int | None = None
    try:
        try:
            os.stat(path.name, dir_fd=parent_fd, follow_symlinks=False)
        except FileNotFoundError:
            pass
        else:
            raise SmtSourceAdapterError("output directory already exists")
        for _ in range(16):
            staging_name = f".piqd-smt-staging-{uuid.uuid4()}"
            try:
                os.mkdir(staging_name, 0o700, dir_fd=parent_fd)
                break
            except FileExistsError:
                continue
        else:
            raise SmtSourceAdapterError("cannot allocate private output staging")
        _fail(staging_name is not None, "private output staging was not allocated")
        staging_fd = os.open(
            staging_name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
            dir_fd=parent_fd,
        )
        _fail(not os.listdir(staging_fd), "new output staging is not empty")
        return _OutputStaging(
            parent_fd, staging_fd, staging_name, path.name, path.parent
        )
    except BaseException:
        if staging_fd is not None:
            os.close(staging_fd)
        # If acquisition failed, no capability proves what the reserved name
        # denotes now.  Never delete it by name; the random staging entry is a
        # fail-closed tombstone and cannot block the requested final name.
        os.close(parent_fd)
        raise


def _rename_directory_noreplace(root_fd: int, source: str, target: str) -> None:
    """Atomically install a directory without replacing an existing entry."""

    libc = ctypes.CDLL(None, use_errno=True)
    source_bytes = os.fsencode(source)
    target_bytes = os.fsencode(target)
    if sys.platform == "darwin" and hasattr(libc, "renameatx_np"):
        renameatx_np = libc.renameatx_np
        renameatx_np.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        renameatx_np.restype = ctypes.c_int
        result = renameatx_np(root_fd, source_bytes, root_fd, target_bytes, 0x4)
    elif sys.platform.startswith("linux") and hasattr(libc, "renameat2"):
        renameat2 = libc.renameat2
        renameat2.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        renameat2.restype = ctypes.c_int
        result = renameat2(root_fd, source_bytes, root_fd, target_bytes, 0x1)
    else:
        raise SmtSourceAdapterError(
            "platform lacks atomic no-replace directory publication"
        )
    if result != 0:
        error = ctypes.get_errno()
        if error in {errno.EEXIST, errno.ENOTEMPTY}:
            raise SmtSourceAdapterError("output directory already exists")
        if error == errno.ENOENT:
            raise FileNotFoundError(error, os.strerror(error), source)
        raise SmtSourceAdapterError(
            f"cannot atomically publish output directory: {os.strerror(error)}"
        )


def _publish_output(staging: _OutputStaging) -> None:
    _validate_output_parent_identity(staging)
    _fail(
        _find_staging_entry(staging) == staging.staging_name,
        "private output staging identity changed before publication",
    )
    for child in os.listdir(staging.staging_fd):
        info = os.stat(child, dir_fd=staging.staging_fd, follow_symlinks=False)
        _fail(
            stat.S_ISREG(info.st_mode) and info.st_nlink == 1,
            "unexpected non-file or hard-linked file in private output staging",
        )
    os.fsync(staging.staging_fd)
    _rename_directory_noreplace(
        staging.parent_fd, staging.staging_name, staging.final_name
    )
    staging.installed = True
    os.fsync(staging.parent_fd)
    _validate_output_parent_identity(staging)
    rebound_fd: int | None = None
    try:
        rebound_fd = os.open(
            staging.final_name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
            dir_fd=staging.parent_fd,
        )
        staged = os.fstat(staging.staging_fd)
        rebound = os.fstat(rebound_fd)
        _fail(
            (staged.st_dev, staged.st_ino) == (rebound.st_dev, rebound.st_ino),
            "published output directory identity changed",
        )
        for child in os.listdir(rebound_fd):
            info = os.stat(child, dir_fd=rebound_fd, follow_symlinks=False)
            _fail(
                stat.S_ISREG(info.st_mode) and info.st_nlink == 1,
                "unexpected non-file or hard-linked file in published output",
            )
    except OSError as exc:
        raise SmtSourceAdapterError("cannot rebind published output directory") from exc
    finally:
        if rebound_fd is not None:
            os.close(rebound_fd)


def _validate_output_parent_identity(staging: _OutputStaging) -> None:
    current_fd = _open_directory_nofollow(staging.parent_path)
    try:
        held = os.fstat(staging.parent_fd)
        current = os.fstat(current_fd)
        _fail(
            (held.st_dev, held.st_ino) == (current.st_dev, current.st_ino),
            "output parent identity changed",
        )
    finally:
        os.close(current_fd)


def _find_staging_entry(staging: _OutputStaging) -> str | None:
    """Find the held staging inode below the held parent, without following links."""

    held = os.fstat(staging.staging_fd)
    found: list[str] = []
    for name in os.listdir(staging.parent_fd):
        try:
            current = os.stat(name, dir_fd=staging.parent_fd, follow_symlinks=False)
        except FileNotFoundError:
            continue
        if (current.st_dev, current.st_ino) == (held.st_dev, held.st_ino):
            _fail(stat.S_ISDIR(current.st_mode), "staging identity is not a directory")
            found.append(name)
    _fail(len(found) <= 1, "private staging identity has multiple directory entries")
    return found[0] if found else None


def _quarantine_staging_for_cleanup(staging: _OutputStaging) -> str | None:
    """Move the held inode, not a remembered name, to a fresh tombstone."""

    for _ in range(16):
        source = _find_staging_entry(staging)
        if source is None:
            return None
        cleanup_name = f".piqd-smt-tombstone-{uuid.uuid4()}"
        try:
            _rename_directory_noreplace(staging.parent_fd, source, cleanup_name)
        except FileNotFoundError:
            # The descriptor scan raced a rename.  Rescan for the held inode;
            # never fall back to deleting the now-unbound source name.
            continue
        rebound_fd: int | None = None
        matches = False
        try:
            rebound_fd = os.open(
                cleanup_name,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=staging.parent_fd,
            )
            held = os.fstat(staging.staging_fd)
            rebound = os.fstat(rebound_fd)
            matches = (held.st_dev, held.st_ino) == (
                rebound.st_dev,
                rebound.st_ino,
            )
        except (FileNotFoundError, NotADirectoryError):
            matches = False
        finally:
            if rebound_fd is not None:
                os.close(rebound_fd)
        if matches:
            return cleanup_name
        # This invocation has successfully reserved its one tombstone name.
        # If a concurrent rename substituted another inode, preserve both the
        # tombstone occupant and the held staging inode wherever they now are;
        # allocating a second tombstone would violate the per-run bound.
        raise SmtSourceAdapterError(
            "cleanup tombstone identity changed after quarantine; preserved fail-closed"
        )
    raise SmtSourceAdapterError("private staging identity remained unstable")


def _preserve_cleanup_tombstone(staging: _OutputStaging, cleanup_name: str) -> None:
    """Seal an identity-bound tombstone without a later name-based delete.

    POSIX has no directory equivalent of an inode-conditional unlink.  An
    identity check followed by ``rmdir(name)`` therefore has an unavoidable
    rename/rebind window.  V1 fails closed: after descriptor-relative child
    cleanup it preserves the bounded tombstone, which does not occupy the
    caller's requested output name.
    """

    current = os.stat(cleanup_name, dir_fd=staging.parent_fd, follow_symlinks=False)
    held = os.fstat(staging.staging_fd)
    _fail(
        stat.S_ISDIR(current.st_mode)
        and (current.st_dev, current.st_ino) == (held.st_dev, held.st_ino),
        "cleanup tombstone identity changed",
    )
    _fail(
        _find_staging_entry(staging) == cleanup_name,
        "cleanup tombstone was concurrently rebound",
    )
    os.fsync(staging.staging_fd)
    os.fsync(staging.parent_fd)


def _cleanup_output_staging(staging: _OutputStaging) -> None:
    cleanup_name = _quarantine_staging_for_cleanup(staging)
    if cleanup_name is None:
        return
    hostile_directories: list[str] = []
    for child in os.listdir(staging.staging_fd):
        try:
            # unlinkat never follows the final component.  This safely removes
            # regular files, symlinks, FIFOs, and sockets inserted into the
            # private directory without touching what a symlink names.
            os.unlink(child, dir_fd=staging.staging_fd)
        except FileNotFoundError:
            continue
        except (IsADirectoryError, PermissionError):
            hostile_directories.append(child)
    if hostile_directories:
        raise SmtSourceAdapterError(
            "private staging contains hostile directories; preserved fail-closed"
        )
    _preserve_cleanup_tombstone(staging, cleanup_name)


def _close_output_staging(staging: _OutputStaging, *, keep: bool) -> None:
    try:
        if not keep:
            _cleanup_output_staging(staging)
    finally:
        os.close(staging.staging_fd)
        os.close(staging.parent_fd)


def _write_all(descriptor: int, payload: bytes) -> None:
    view = memoryview(payload)
    while view:
        written = os.write(descriptor, view)
        _fail(written > 0, "short write while installing artifact")
        view = view[written:]


def _write_immutable(root_fd: int, name: str, payload: bytes) -> dict[str, object]:
    _fail(
        name not in {"", ".", ".."} and "/" not in name and "\\" not in name,
        "unsafe output artifact name",
    )
    _fail(len(payload) <= MAX_OUTPUT_BYTES, "output artifact exceeds byte cap")
    installed_bytes = 0
    for installed_name in os.listdir(root_fd):
        installed = os.stat(installed_name, dir_fd=root_fd, follow_symlinks=False)
        _fail(
            stat.S_ISREG(installed.st_mode) and installed.st_nlink == 1,
            "non-file or hard-linked file in private output staging",
        )
        installed_bytes += installed.st_size
    _fail(
        installed_bytes + len(payload) <= MAX_OUTPUT_TOTAL_BYTES,
        "output tree exceeds total byte cap",
    )
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o400,
            dir_fd=root_fd,
        )
        _write_all(descriptor, payload)
        os.fsync(descriptor)
        info = os.fstat(descriptor)
        _fail(
            stat.S_ISREG(info.st_mode)
            and info.st_nlink == 1
            and info.st_size == len(payload),
            "immutable output verification failed",
        )
    except OSError as exc:
        raise SmtSourceAdapterError(f"cannot create immutable artifact {name}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
    os.fsync(root_fd)
    return {"path": name, "bytes": len(payload), "sha256": _sha256(payload)}


def _write_or_verify_immutable(
    root_fd: int, name: str, payload: bytes, *, allow_existing: bool
) -> dict[str, object]:
    if not allow_existing:
        return _write_immutable(root_fd, name, payload)
    try:
        info = os.stat(name, dir_fd=root_fd, follow_symlinks=False)
    except FileNotFoundError:
        return _write_immutable(root_fd, name, payload)
    except OSError as exc:
        raise SmtSourceAdapterError(
            f"cannot inspect immutable artifact {name}"
        ) from exc
    _fail(
        stat.S_ISREG(info.st_mode) and info.st_nlink == 1,
        f"existing immutable artifact {name} is unsafe",
    )
    existing = _read_relative(root_fd, name, MAX_OUTPUT_BYTES, name)
    _fail(existing == payload, f"existing immutable artifact {name} disagrees")
    return {"path": name, "bytes": len(payload), "sha256": _sha256(payload)}


def _read_existing_output(root_fd: int, name: str) -> bytes | None:
    try:
        info = os.stat(name, dir_fd=root_fd, follow_symlinks=False)
    except FileNotFoundError:
        return None
    except OSError as exc:
        raise SmtSourceAdapterError(f"cannot inspect output artifact {name}") from exc
    _fail(
        stat.S_ISREG(info.st_mode) and info.st_nlink == 1,
        f"existing output artifact {name} is unsafe",
    )
    return _read_relative(root_fd, name, MAX_OUTPUT_BYTES, name)


def _ascii_space(byte: int) -> bool:
    return byte in {9, 10, 11, 12, 13, 32}


def split_smt2_commands(text: str) -> list[str]:
    """Split commands exactly as PIQD's top-level scanner does."""

    data = text.encode("utf-8")
    commands: list[str] = []
    depth = 0
    start = 0
    index = 0
    while index < len(data):
        byte = data[index]
        if byte == ord(";"):
            while index < len(data) and data[index] != ord("\n"):
                index += 1
        elif byte == ord('"') and depth > 0:
            index += 1
            while True:
                _fail(index < len(data), "SMT-LIB input ends inside a string")
                if data[index] == ord('"'):
                    if index + 1 < len(data) and data[index + 1] == ord('"'):
                        index += 2
                        continue
                    index += 1
                    break
                index += 1
        elif byte == ord("|") and depth > 0:
            index += 1
            while index < len(data) and data[index] != ord("|"):
                index += 1
            _fail(index < len(data), "SMT-LIB input ends inside a quoted symbol")
            index += 1
        elif byte == ord("("):
            if depth == 0:
                start = index
            depth += 1
            _fail(depth <= MAX_SMT_DEPTH, "SMT-LIB input exceeds nesting cap")
            index += 1
        elif byte == ord(")"):
            _fail(depth > 0, "unbalanced SMT-LIB closing parenthesis")
            depth -= 1
            index += 1
            if depth == 0:
                commands.append(data[start:index].decode("utf-8"))
                _fail(
                    len(commands) <= MAX_COMMANDS, "SMT-LIB command count exceeds cap"
                )
        else:
            _fail(
                depth > 0 or _ascii_space(byte),
                "bare SMT-LIB token outside a command",
            )
            index += 1
    _fail(depth == 0, "SMT-LIB input ends inside a command")
    return commands


def _command_head(command: str) -> str | None:
    inner = command[1:] if command.startswith("(") else ""
    rest = inner.lstrip()
    end = len(rest)
    for index, character in enumerate(rest):
        if character.isspace() or character in "()":
            end = index
            break
    return rest[:end] or None


def _option_key(command: str) -> str | None:
    marker = command.find("set-option")
    if marker < 0:
        return None
    rest = command[marker + len("set-option") :].lstrip()
    if not rest.startswith(":"):
        return None
    keyword = rest[1:]
    end = len(keyword)
    for index, character in enumerate(keyword):
        if character.isspace() or character in "()":
            end = index
            break
    return keyword[:end]


def normalize_state_journal(original_smt2: bytes) -> tuple[tuple[str, ...], bytes]:
    """Return PIQD-admissible commands and its exact LF-normalized journal."""

    _fail(len(original_smt2) <= MAX_SMT2_BYTES, "original SMT2 exceeds byte cap")
    try:
        text = original_smt2.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise SmtSourceAdapterError("original SMT2 is not UTF-8") from exc
    commands = split_smt2_commands(text)
    _fail(bool(commands), "original SMT2 contains no commands")
    for command in commands:
        head = _command_head(command)
        _fail(head is not None, "SMT-LIB command has no leading symbol")
        _fail(
            head in STATE_COMMANDS,
            f"SMT-LIB command {head!r} is not a PIQD state command",
        )
        if head == "set-option":
            option = _option_key(command)
            _fail(
                option not in RESERVED_OPTIONS,
                f"SMT-LIB option :{option} is reserved by PIQD",
            )
    journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    _fail(len(journal) <= MAX_SMT2_BYTES, "normalized journal exceeds byte cap")
    return tuple(commands), journal


def _validate_identity(value: object, where: str) -> dict[str, Any]:
    obj = _object(value, {"id", "version"}, where)
    for key in ("id", "version"):
        text = _string(obj[key], f"{where}.{key}")
        _fail(len(text.encode("utf-8")) <= 256, f"{where}.{key} is too long")
    return obj


def _validate_descriptor_for_solver_profile(
    value: object,
    *,
    descriptor_schema: str,
    solver_profile_schema: str,
    solvers: tuple[str, ...],
) -> dict[str, Any]:
    obj = _object(
        value,
        {
            "schema",
            "producer",
            "semantic_verifier",
            "stage_id",
            "query_id",
            "sources",
            "semantic_input",
            "semantic_sha256",
            "original_smt2",
            "variables",
            "named_atoms",
            "solve",
            "solver_profile",
        },
        "descriptor",
    )
    _fail(obj["schema"] == descriptor_schema, "descriptor schema mismatch")
    _validate_identity(obj["producer"], "descriptor.producer")
    _validate_identity(obj["semantic_verifier"], "descriptor.semantic_verifier")
    for key in ("stage_id", "query_id"):
        text = _string(obj[key], f"descriptor.{key}")
        _fail(len(text.encode("utf-8")) <= 256, f"descriptor.{key} is too long")

    _fail(type(obj["sources"]) is list and obj["sources"], "sources must be a list")
    source_paths: list[str] = []
    for index, source in enumerate(obj["sources"]):
        entry = _object(source, {"path", "bytes", "sha256"}, f"sources[{index}]")
        source_paths.append(
            _safe_relative_path(entry["path"], f"sources[{index}].path")
        )
        _integer(entry["bytes"], f"sources[{index}].bytes")
        _digest(entry["sha256"], f"sources[{index}].sha256")
    _fail(
        source_paths == sorted(set(source_paths)),
        "sources must be unique and path-sorted",
    )

    semantic = _snapshot_builtin_json(obj["semantic_input"], "semantic_input")
    obj["semantic_input"] = semantic
    _fail(
        _digest(obj["semantic_sha256"], "semantic_sha256")
        == _sha256(_canonical_json(semantic)),
        "semantic input hash mismatch",
    )
    original = _object(
        obj["original_smt2"], {"path", "bytes", "sha256"}, "original_smt2"
    )
    _safe_relative_path(original["path"], "original_smt2.path")
    _integer(original["bytes"], "original_smt2.bytes")
    _digest(original["sha256"], "original_smt2.sha256")

    _fail(type(obj["variables"]) is list, "variables must be a list")
    variable_ids: list[str] = []
    variable_terms: list[str] = []
    for index, variable in enumerate(obj["variables"]):
        entry = _object(variable, {"id", "term", "sort"}, f"variables[{index}]")
        variable_ids.append(_string(entry["id"], f"variables[{index}].id"))
        variable_terms.append(_string(entry["term"], f"variables[{index}].term"))
        _string(entry["sort"], f"variables[{index}].sort")
    _fail(
        variable_ids == sorted(set(variable_ids)),
        "variables must be uniquely id-sorted",
    )
    _fail(
        len(variable_terms) == len(set(variable_terms)), "variable terms must be unique"
    )

    _fail(type(obj["named_atoms"]) is list, "named_atoms must be a list")
    atom_ids: list[str] = []
    assumption_terms: list[str] = []
    for index, atom in enumerate(obj["named_atoms"]):
        entry = _object(atom, {"id", "assumption_term"}, f"named_atoms[{index}]")
        atom_ids.append(_string(entry["id"], f"named_atoms[{index}].id"))
        assumption_terms.append(
            _string(entry["assumption_term"], f"named_atoms[{index}].assumption_term")
        )
    _fail(atom_ids == sorted(set(atom_ids)), "named_atoms must be uniquely id-sorted")
    _fail(
        len(assumption_terms) == len(set(assumption_terms)),
        "assumption terms must be unique",
    )

    solve = _object(
        obj["solve"],
        {"assumption_ids", "readback_variable_ids", "include_model"},
        "solve",
    )
    _fail(type(solve["assumption_ids"]) is list, "assumption_ids must be a list")
    _fail(
        type(solve["readback_variable_ids"]) is list,
        "readback_variable_ids must be a list",
    )
    for index, atom_id in enumerate(solve["assumption_ids"]):
        _string(atom_id, f"solve.assumption_ids[{index}]")
    for index, variable_id in enumerate(solve["readback_variable_ids"]):
        _string(variable_id, f"solve.readback_variable_ids[{index}]")
    _fail(
        len(solve["assumption_ids"]) == len(set(solve["assumption_ids"]))
        and set(solve["assumption_ids"]) <= set(atom_ids),
        "solve assumption IDs are duplicate or unregistered",
    )
    _fail(
        len(solve["readback_variable_ids"]) == len(set(solve["readback_variable_ids"]))
        and set(solve["readback_variable_ids"]) <= set(variable_ids),
        "solve readback variable IDs are duplicate or unregistered",
    )
    _fail(
        bool(solve["readback_variable_ids"]),
        "SAT semantic replay requires at least one get-value readback",
    )
    _fail(
        solve["include_model"] is True,
        "SAT semantic replay requires include_model=true",
    )

    profile = _object(
        obj["solver_profile"], {"schema", "solvers", "timeout_ms"}, "solver_profile"
    )
    _fail(
        profile["schema"] == solver_profile_schema,
        "solver profile schema mismatch",
    )
    _fail(
        profile["solvers"] == list(solvers),
        f"solver profile must run {' then '.join(solvers)}",
    )
    timeout_ms = _integer(profile["timeout_ms"], "solver_profile.timeout_ms", minimum=1)
    _fail(timeout_ms <= 3_600_000, "solver timeout exceeds one hour")
    return obj


def _validate_descriptor(value: object) -> dict[str, Any]:
    """Validate the maintained public two-solver descriptor contract."""

    return _validate_descriptor_for_solver_profile(
        value,
        descriptor_schema=QUERY_SCHEMA,
        solver_profile_schema=SOLVER_PROFILE_SCHEMA,
        solvers=SOLVERS,
    )


def load_source_semantic_query(
    descriptor_root: Path, descriptor_path: str
) -> SourceSemanticQuery:
    """Load every packet artifact relative to one no-follow descriptor root."""

    descriptor_name = _safe_relative_path(descriptor_path, "descriptor_path")
    root_fd = _open_directory_nofollow(descriptor_root)
    try:
        descriptor_bytes = _read_relative(
            root_fd, descriptor_name, MAX_DESCRIPTOR_BYTES, "descriptor"
        )
        descriptor = _validate_descriptor(_strict_json(descriptor_bytes, "descriptor"))
        original_entry = descriptor["original_smt2"]
        original_smt2 = _read_relative(
            root_fd, original_entry["path"], MAX_SMT2_BYTES, "original SMT2"
        )
        _fail(
            len(original_smt2) == original_entry["bytes"]
            and _sha256(original_smt2) == original_entry["sha256"],
            "original SMT2 custody mismatch",
        )
        total = len(original_smt2) + len(descriptor_bytes)
        sources: list[SourceSnapshot] = []
        for index, entry in enumerate(descriptor["sources"]):
            payload = _read_relative(
                root_fd,
                entry["path"],
                MAX_SOURCE_BYTES,
                f"source[{index}]",
            )
            total += len(payload)
            _fail(
                total <= MAX_SOURCE_TOTAL_BYTES, "source packet exceeds total byte cap"
            )
            _fail(
                len(payload) == entry["bytes"] and _sha256(payload) == entry["sha256"],
                f"source hash mismatch for {entry['path']}",
            )
            sources.append(SourceSnapshot(path=entry["path"], payload=payload))
        commands, journal = normalize_state_journal(original_smt2)
        return SourceSemanticQuery(
            descriptor=descriptor,
            descriptor_bytes=descriptor_bytes,
            original_smt2=original_smt2,
            journal_commands=commands,
            journal_smt2=journal,
            source_files=tuple(sources),
        )
    finally:
        os.close(root_fd)


def load_authenticated_single_solver_query(
    descriptor_root: Path,
    descriptor_path: str,
    *,
    solver: str,
    descriptor_schema: str,
    solver_profile_schema: str,
) -> SourceSemanticQuery:
    """Load one exact descriptor-root packet for a registered one-shot solver.

    Unlike :func:`load_source_semantic_query`, this public loader does not
    assume the maintained z3-then-cvc5 profile.  The caller supplies only
    code-defined contract constants; descriptor JSON still cannot select an
    import, callback, executable, argument vector, credential, or transport.
    """

    _fail(type(solver) is str and solver in SOLVERS, "unsupported one-shot solver")
    for schema, where in (
        (descriptor_schema, "descriptor schema"),
        (solver_profile_schema, "solver profile schema"),
    ):
        _fail(
            type(schema) is str and bool(schema) and len(schema.encode("utf-8")) <= 256,
            f"authenticated {where} is invalid",
        )
    descriptor_name = _safe_relative_path(descriptor_path, "descriptor_path")
    root_fd = _open_directory_nofollow(descriptor_root)
    try:
        descriptor_bytes = _read_relative(
            root_fd, descriptor_name, MAX_DESCRIPTOR_BYTES, "descriptor"
        )
        descriptor = _validate_descriptor_for_solver_profile(
            _strict_json(descriptor_bytes, "descriptor"),
            descriptor_schema=descriptor_schema,
            solver_profile_schema=solver_profile_schema,
            solvers=(solver,),
        )
        original_entry = descriptor["original_smt2"]
        original_smt2 = _read_relative(
            root_fd, original_entry["path"], MAX_SMT2_BYTES, "original SMT2"
        )
        _fail(
            len(original_smt2) == original_entry["bytes"]
            and _sha256(original_smt2) == original_entry["sha256"],
            "original SMT2 custody mismatch",
        )
        total = len(original_smt2) + len(descriptor_bytes)
        sources: list[SourceSnapshot] = []
        for index, entry in enumerate(descriptor["sources"]):
            payload = _read_relative(
                root_fd, entry["path"], MAX_SOURCE_BYTES, f"source[{index}]"
            )
            total += len(payload)
            _fail(
                total <= MAX_SOURCE_TOTAL_BYTES, "source packet exceeds total byte cap"
            )
            _fail(
                len(payload) == entry["bytes"] and _sha256(payload) == entry["sha256"],
                f"source hash mismatch for {entry['path']}",
            )
            sources.append(SourceSnapshot(path=entry["path"], payload=payload))
        commands, journal = normalize_state_journal(original_smt2)
        return SourceSemanticQuery(
            descriptor=descriptor,
            descriptor_bytes=descriptor_bytes,
            original_smt2=original_smt2,
            journal_commands=commands,
            journal_smt2=journal,
            source_files=tuple(sources),
        )
    finally:
        os.close(root_fd)


def _revalidate_query_snapshot_for_contract(
    value: SourceSemanticQuery,
    *,
    descriptor_schema: str,
    solver_profile_schema: str,
    solvers: tuple[str, ...],
    authenticated_journal_commands: tuple[str, ...] | None,
) -> SourceSemanticQuery:
    """Rebuild all derived fields against one explicit descriptor contract."""

    _fail(type(value) is SourceSemanticQuery, "query has the wrong type")
    _fail(type(value.descriptor_bytes) is bytes, "descriptor bytes are not immutable")
    _fail(
        len(value.descriptor_bytes) <= MAX_DESCRIPTOR_BYTES,
        "descriptor exceeds byte cap",
    )
    descriptor = _validate_descriptor_for_solver_profile(
        _strict_json(value.descriptor_bytes, "embedded descriptor"),
        descriptor_schema=descriptor_schema,
        solver_profile_schema=solver_profile_schema,
        solvers=solvers,
    )
    supplied_descriptor = _snapshot_builtin_json(
        value.descriptor, "embedded query descriptor"
    )
    _fail(
        _canonical_json(supplied_descriptor) == _canonical_json(descriptor),
        "query descriptor disagrees with its exact bytes",
    )
    _fail(type(value.original_smt2) is bytes, "original SMT2 is not immutable bytes")
    original_smt2 = value.original_smt2
    original_entry = descriptor["original_smt2"]
    _fail(
        len(original_smt2) <= MAX_SMT2_BYTES
        and len(original_smt2) == original_entry["bytes"]
        and _sha256(original_smt2) == original_entry["sha256"],
        "embedded original SMT2 custody mismatch",
    )
    if authenticated_journal_commands is None:
        commands, journal = normalize_state_journal(original_smt2)
    else:
        _fail(
            type(authenticated_journal_commands) is tuple
            and bool(authenticated_journal_commands)
            and len(authenticated_journal_commands) <= MAX_COMMANDS
            and all(
                type(command) is str and "\x00" not in command
                for command in authenticated_journal_commands
            ),
            "authenticated journal commands are not an immutable nonempty tuple",
        )
        commands = authenticated_journal_commands
        try:
            journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
        except UnicodeEncodeError as exc:
            raise SmtSourceAdapterError(
                "authenticated journal command is not UTF-8 encodable"
            ) from exc
        _fail(
            len(journal) <= MAX_SMT2_BYTES,
            "authenticated journal exceeds byte cap",
        )
    _fail(
        type(value.journal_commands) is tuple
        and all(type(command) is str for command in value.journal_commands)
        and value.journal_commands == commands
        and type(value.journal_smt2) is bytes
        and value.journal_smt2 == journal,
        "embedded normalized journal cross-binding mismatch",
    )
    _fail(type(value.source_files) is tuple, "source snapshots are not immutable")
    _fail(
        len(value.source_files) == len(descriptor["sources"]),
        "source snapshot count mismatch",
    )
    total = len(value.descriptor_bytes) + len(original_smt2)
    sources: list[SourceSnapshot] = []
    for index, (snapshot, declared) in enumerate(
        zip(value.source_files, descriptor["sources"], strict=True)
    ):
        _fail(type(snapshot) is SourceSnapshot, f"source[{index}] has wrong type")
        _fail(type(snapshot.path) is str, f"source[{index}] path has wrong type")
        _fail(
            type(snapshot.payload) is bytes, f"source[{index}] is not immutable bytes"
        )
        total += len(snapshot.payload)
        _fail(
            len(snapshot.payload) <= MAX_SOURCE_BYTES
            and total <= MAX_SOURCE_TOTAL_BYTES,
            "embedded source packet exceeds byte cap",
        )
        _fail(
            snapshot.path == declared["path"]
            and len(snapshot.payload) == declared["bytes"]
            and _sha256(snapshot.payload) == declared["sha256"],
            f"embedded source custody mismatch for source[{index}]",
        )
        sources.append(SourceSnapshot(snapshot.path, snapshot.payload))
    return SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=value.descriptor_bytes,
        original_smt2=original_smt2,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=tuple(sources),
    )


def _revalidate_query_snapshot(value: SourceSemanticQuery) -> SourceSemanticQuery:
    """Rebuild the maintained two-solver query at its public execution boundary."""

    return _revalidate_query_snapshot_for_contract(
        value,
        descriptor_schema=QUERY_SCHEMA,
        solver_profile_schema=SOLVER_PROFILE_SCHEMA,
        solvers=SOLVERS,
        authenticated_journal_commands=None,
    )


def validate_authenticated_single_solver_query(
    value: SourceSemanticQuery,
    *,
    solver: str,
    descriptor_schema: str,
    solver_profile_schema: str,
    authenticated_journal_commands: tuple[str, ...],
) -> SourceSemanticQuery:
    """Validate one producer-authenticated descriptor for exactly one solver.

    The producer adapter must independently reconstruct the descriptor schema,
    solver-profile schema, and complete state-command journal before supplying
    them here.  This boundary then re-parses the immutable descriptor bytes,
    binds its one-element solver list to ``solver``, and rechecks every source,
    original-SMT2, descriptor, and journal cross-binding.  It is deliberately
    separate from, and does not weaken, the maintained z3-then-cvc5 wave.
    """

    _fail(
        type(solver) is str and solver in SOLVERS,
        "single-solver selection is not supported",
    )
    for schema, where in (
        (descriptor_schema, "descriptor schema"),
        (solver_profile_schema, "solver profile schema"),
    ):
        _fail(
            type(schema) is str and bool(schema) and len(schema.encode("utf-8")) <= 256,
            f"authenticated {where} is invalid",
        )
    return _revalidate_query_snapshot_for_contract(
        value,
        descriptor_schema=descriptor_schema,
        solver_profile_schema=solver_profile_schema,
        solvers=(solver,),
        authenticated_journal_commands=authenticated_journal_commands,
    )


def _source_artifact_name(index: int, source: SourceSnapshot) -> str:
    return f"source-{index:04d}-{_sha256(source.payload)[:16]}.bin"


def _source_manifest_entry(index: int, source: SourceSnapshot) -> dict[str, object]:
    return {
        "path": source.path,
        "bytes": len(source.payload),
        "sha256": _sha256(source.payload),
        "custody_artifact": _source_artifact_name(index, source),
    }


def _manifest(query: SourceSemanticQuery) -> dict[str, object]:
    descriptor = query.descriptor
    return {
        "schema": MANIFEST_SCHEMA,
        "producer": descriptor["producer"],
        "semantic_verifier": descriptor["semantic_verifier"],
        "stage_id": descriptor["stage_id"],
        "query_id": descriptor["query_id"],
        "descriptor": {
            "bytes": len(query.descriptor_bytes),
            "sha256": _sha256(query.descriptor_bytes),
        },
        "sources": [
            _source_manifest_entry(index, source)
            for index, source in enumerate(query.source_files)
        ],
        "semantic_input": descriptor["semantic_input"],
        "semantic_sha256": descriptor["semantic_sha256"],
        "original_smt2": {
            "path": descriptor["original_smt2"]["path"],
            "bytes": len(query.original_smt2),
            "sha256": _sha256(query.original_smt2),
        },
        "normalized_journal": {
            "normalization": "piqd-state-commands-exact-spelling-plus-lf/v1",
            "commands": len(query.journal_commands),
            "bytes": len(query.journal_smt2),
            "sha256": _sha256(query.journal_smt2),
        },
        "variables": descriptor["variables"],
        "named_atoms": descriptor["named_atoms"],
        "solve": {
            **descriptor["solve"],
            "assumptions": list(query.assumptions),
            "get_values": list(query.get_values),
            "unsat_assumption_basis": "get-unsat-assumptions",
            "named_core_support": False,
            "daemon_unsat_assumption_field": "core",
        },
        "solver_profile": {
            **descriptor["solver_profile"],
            "fresh_session_per_solver": True,
            "sequential": True,
            "daemon_owned_solver_arguments": True,
            "cvc5_nl_cov_requested": False,
        },
        "claims": dict(FALSE_CLAIMS),
    }


def _json_call(
    transport: PiqdTransport,
    method: str,
    path: str,
    body: Mapping[str, object] | None = None,
    *,
    status: int = 200,
) -> object:
    response_status, response_body = _json_call_with_status(
        transport, method, path, body
    )
    _fail(response_status == status, "PIQD HTTP status mismatch")
    return response_body


def _json_call_with_status(
    transport: PiqdTransport,
    method: str,
    path: str,
    body: Mapping[str, object] | None = None,
) -> tuple[int, object]:
    try:
        response = transport.request_json(method, path, body)
    except PiqdTransportLoss:
        raise
    except SmtSourceAdapterError:
        raise
    except Exception as exc:
        raise PiqdTransportLoss("PIQD JSON transport failed") from exc
    _fail(type(response) is JsonResponse, "PIQD JSON transport returned wrong type")
    _fail(type(response.status) is int, "PIQD JSON HTTP status has wrong type")
    return response.status, _snapshot_builtin_json(response.body, "PIQD JSON response")


def _bytes_call(transport: PiqdTransport, path: str) -> bytes:
    try:
        response = transport.request_bytes("GET", path)
    except PiqdTransportLoss:
        raise
    except SmtSourceAdapterError:
        raise
    except Exception as exc:
        raise PiqdTransportLoss("PIQD byte transport failed") from exc
    _fail(type(response) is BytesResponse, "PIQD byte transport returned wrong type")
    _fail(
        type(response.status) is int and response.status == 200,
        "PIQD byte HTTP status mismatch",
    )
    _fail(type(response.body) is bytes, "PIQD byte response is not exact bytes")
    _fail(len(response.body) <= MAX_EXPORT_BYTES, "PIQD byte response exceeds cap")
    return response.body


_SESSION_KEYS = {
    "id",
    "lane",
    "state",
    "solver_name",
    "solver_sha256",
    "solver_signature",
    "protocol_version",
    "journal_path",
    "created_at",
    "updated_at",
    "clauses",
    "max_var",
    "solves",
    "last_status",
    "declared_num_vars",
    "last_solve_index",
    "last_assumption_free",
    "last_terminal_unsat",
    "label",
}


def _validate_session_record(value: object, where: str = "session") -> dict[str, Any]:
    obj = _object(value, _SESSION_KEYS, where)
    session_id = _string(obj["id"], f"{where}.id")
    try:
        _fail(
            str(uuid.UUID(session_id)) == session_id,
            f"{where}.id is not canonical UUID",
        )
    except ValueError as exc:
        raise SmtSourceAdapterError(f"{where}.id is not canonical UUID") from exc
    _fail(obj["lane"] in {"sat", "smt"}, f"{where}.lane has wrong value")
    _fail(
        obj["state"] in {"live", "detached", "closed"},
        f"{where}.state has wrong value",
    )
    _string(obj["solver_name"], f"{where}.solver_name")
    _digest(obj["solver_sha256"], f"{where}.solver_sha256")
    _string(obj["solver_signature"], f"{where}.solver_signature")
    _string(obj["journal_path"], f"{where}.journal_path")
    _string(obj["label"], f"{where}.label", allow_empty=True)
    for key in (
        "protocol_version",
        "created_at",
        "updated_at",
        "clauses",
        "max_var",
        "solves",
    ):
        _integer(obj[key], f"{where}.{key}")
    _fail(obj["protocol_version"] == 1, f"{where} protocol version mismatch")
    _fail(obj["updated_at"] >= obj["created_at"], f"{where} timestamps are reversed")
    for key in ("declared_num_vars", "last_solve_index"):
        _fail(
            obj[key] is None or type(obj[key]) is int,
            f"{where}.{key} has wrong type",
        )
    for key in ("last_assumption_free", "last_terminal_unsat"):
        _fail(
            obj[key] is None or type(obj[key]) is bool,
            f"{where}.{key} has wrong type",
        )
    _fail(
        obj["last_status"] is None
        or (
            type(obj["last_status"]) is str
            and obj["last_status"] in {"SAT", "UNSAT", "UNKNOWN"}
        ),
        f"{where}.last_status has wrong type or value",
    )
    if obj["lane"] == "smt":
        _fail(
            obj["declared_num_vars"] is None and obj["max_var"] == 0,
            f"{where} SMT CNF fields mismatch",
        )
    return obj


def _validate_session(
    value: object, *, solver: str, label: str, expected_state: str
) -> dict[str, Any]:
    obj = _validate_session_record(value)
    _fail(
        obj["lane"] == "smt"
        and obj["state"] == expected_state
        and obj["solver_name"] == solver
        and obj["label"] == label,
        "session identity mismatch",
    )
    return obj


def _validate_session_listing(value: object) -> list[dict[str, Any]]:
    listing = _object(value, {"sessions", "live"}, "session listing")
    live = _integer(listing["live"], "session listing.live")
    _fail(type(listing["sessions"]) is list, "session listing.sessions is not a list")
    sessions = [
        _validate_session_record(item, f"session listing.sessions[{index}]")
        for index, item in enumerate(listing["sessions"])
    ]
    _fail(live <= len(sessions), "session listing live count exceeds inventory")
    ids = [session["id"] for session in sessions]
    _fail(len(ids) == len(set(ids)), "session listing repeats an identity")
    return sessions


def _validate_fresh_session(session: Mapping[str, object]) -> None:
    _fail(
        session["clauses"] == 0
        and session["max_var"] == 0
        and session["solves"] == 0
        and session["updated_at"] == session["created_at"]
        and session["last_status"] is None
        and session["last_solve_index"] is None
        and session["last_assumption_free"] is None
        and session["last_terminal_unsat"] is None,
        "created PIQD session is not fresh",
    )


def _recover_session_id(value: object) -> str | None:
    if type(value) is not dict or type(value.get("id")) is not str:
        return None
    candidate = value["id"]
    try:
        return candidate if str(uuid.UUID(candidate)) == candidate else None
    except ValueError:
        return None


def _reconcile_lost_create_response(
    *, transport: PiqdTransport, solver: str, label: str
) -> dict[str, Any]:
    sessions = _validate_session_listing(_json_call(transport, "GET", "/sessions"))
    matching_label = [session for session in sessions if session["label"] == label]
    _fail(
        len(matching_label) == 1,
        "lost PIQD create response has no unique label match",
    )
    session = _validate_session(
        matching_label[0], solver=solver, label=label, expected_state="live"
    )
    _validate_fresh_session(session)
    return session


def _discover_named_session(
    *,
    transport: PiqdTransport,
    solver: str,
    label: str,
    allow_missing: bool,
) -> dict[str, Any] | None:
    sessions = _validate_session_listing(_json_call(transport, "GET", "/sessions"))
    matching_label = [session for session in sessions if session["label"] == label]
    _fail(len(matching_label) <= 1, "named PIQD session label is ambiguous")
    if not matching_label:
        _fail(allow_missing, "named PIQD session is absent during required resume")
        return None
    candidate = matching_label[0]
    return _validate_session(
        candidate,
        solver=solver,
        label=label,
        expected_state=candidate["state"],
    )


def _validate_unsolved_session_frontier(
    session: Mapping[str, object], *, commands: int
) -> None:
    _fail(
        session["clauses"] == commands
        and session["solves"] == 0
        and session["last_status"] is None
        and session["last_solve_index"] is None
        and session["last_assumption_free"] is None
        and session["last_terminal_unsat"] is None,
        "unsolved PIQD session frontier mismatch",
    )


def _validate_session_frontier(
    observed: Mapping[str, object],
    *,
    created: Mapping[str, object],
    query: SourceSemanticQuery,
    solve: Mapping[str, object] | None,
) -> None:
    identity_keys = (
        "id",
        "solver_name",
        "solver_sha256",
        "solver_signature",
        "protocol_version",
        "journal_path",
        "created_at",
        "label",
    )
    _fail(
        all(observed[key] == created[key] for key in identity_keys),
        "PIQD session identity changed",
    )
    _fail(
        observed["clauses"] == len(query.journal_commands),
        "PIQD session command count mismatch",
    )
    if solve is None:
        _fail(
            observed["solves"] == 0
            and observed["last_status"] is None
            and observed["last_solve_index"] is None
            and observed["last_assumption_free"] is None
            and observed["last_terminal_unsat"] is None,
            "unreceipted PIQD session state mismatch",
        )
        return
    _fail(
        observed["solves"] == 1
        and observed["last_status"] == solve["status"]
        and observed["last_solve_index"] == solve["solve_index"] == 1
        and observed["last_assumption_free"] is (not bool(query.assumptions))
        and observed["last_terminal_unsat"] == solve.get("terminal_unsat"),
        "PIQD session solve state mismatch",
    )


def _validate_closed_session(
    closed: Mapping[str, object],
    *,
    created: Mapping[str, object],
    query: SourceSemanticQuery,
    solve: Mapping[str, object] | None,
) -> None:
    _fail(closed["state"] == "closed", "closed PIQD session has wrong state")
    _validate_session_frontier(closed, created=created, query=query, solve=solve)


def _validated_assumption_labels(
    query: SourceSemanticQuery, value: object
) -> tuple[str, ...]:
    _fail(type(value) is tuple, "assumption_labels must be an exact tuple")
    labels: list[str] = []
    for index, label in enumerate(value):
        labels.append(_string(label, f"assumption_labels[{index}]"))
    _fail(
        len(labels) == len(query.assumptions),
        "assumption_labels must label every assumption",
    )
    return tuple(labels)


def piqd_solve_request_digest(
    query: SourceSemanticQuery, assumption_labels: tuple[str, ...]
) -> str:
    """Reproduce current ``smt_receipts::solve_request_digest`` byte-for-byte."""

    _fail(type(query) is SourceSemanticQuery, "request digest query has wrong type")
    labels = _validated_assumption_labels(query, assumption_labels)
    timeout_ms = _integer(
        query.descriptor["solver_profile"]["timeout_ms"],
        "solver_profile.timeout_ms",
        minimum=1,
    )
    digest = hashlib.sha256(PIQD_SOLVE_REQUEST_DIGEST_VERSION)
    digest.update(
        (
            f"\nbase={len(query.journal_commands)}:{len(query.journal_smt2)}:"
            f"{_sha256(query.journal_smt2)}"
        ).encode("ascii")
    )
    digest.update(f"\ntimeout={timeout_ms}\nmodel=true".encode("ascii"))

    def text_list(name: str, values: tuple[str, ...]) -> None:
        digest.update(f"\n{name}={len(values)}".encode("ascii"))
        for value in values:
            encoded = value.encode("utf-8")
            digest.update(f"\n{len(encoded)}:".encode("ascii"))
            digest.update(encoded)

    text_list("assumptions", query.assumptions)
    text_list("get_values", query.get_values)
    # PIQD deliberately omits the labels block when the request is unlabelled,
    # preserving request digests minted before labels existed.
    if labels:
        text_list("assumption_labels", labels)
    return digest.hexdigest()


def piqd_result_digest(result: Mapping[str, object]) -> str:
    """Reproduce current `smt_receipts::result_digest` byte-for-byte."""

    digest = hashlib.sha256()
    digest.update(PIQD_RESULT_DIGEST_VERSION)

    def field(name: str, value: object | None) -> None:
        if value is None:
            digest.update(f"\n{name}=-".encode())
        else:
            _fail(type(value) is str, f"digest field {name} is not text")
            encoded = value.encode("utf-8")
            digest.update(f"\n{name}={len(encoded)}:".encode())
            digest.update(encoded)

    field("status", result.get("status"))
    field("interrupted_by", result.get("interrupted_by"))
    terminal = result.get("terminal_unsat")
    _fail(terminal is None or type(terminal) is bool, "terminal_unsat has wrong type")
    field("terminal_unsat", None if terminal is None else str(terminal).lower())
    core = result.get("core")
    if core is None:
        digest.update(b"\ncore=-")
    else:
        _fail(type(core) is list, "core is not a list")
        digest.update(f"\ncore={len(core)}".encode())
        for member in core:
            _fail(type(member) is str, "core member is not text")
            encoded = member.encode("utf-8")
            digest.update(f"\n{len(encoded)}:".encode())
            digest.update(encoded)
    field("model", result.get("model"))
    field("values", result.get("values"))
    if "core_labels" in result:
        labels = result["core_labels"]
        _fail(type(labels) is list, "core_labels is not a list")
        digest.update(f"\ncore_labels={len(labels)}".encode())
        for label in labels:
            if label is None:
                digest.update(b"\n-")
            else:
                _fail(type(label) is str, "core label is not text or null")
                encoded = label.encode("utf-8")
                digest.update(f"\n{len(encoded)}:".encode())
                digest.update(encoded)
    return digest.hexdigest()


_SOLVE_REQUIRED = {
    "status",
    "solve_ms",
    "solve_index",
    "result_sha256",
    "effective_deadline_ms",
}
_SOLVE_OPTIONAL = {
    "interrupted_by",
    "core",
    "core_labels",
    "terminal_unsat",
    "model",
    "values",
}
_SOLVE_RESPONSE_OPTIONAL = _SOLVE_OPTIONAL | {"replayed"}


def _validate_answer_fields(
    obj: Mapping[str, object],
    where: str,
    *,
    assumptions: tuple[str, ...],
    assumption_labels: tuple[str, ...],
) -> None:
    status = obj["status"]
    _fail(status in {"SAT", "UNSAT", "UNKNOWN"}, f"{where}.status is invalid")
    for key in ("interrupted_by", "model", "values"):
        if key in obj:
            _string(obj[key], f"{where}.{key}", allow_empty=True)
    if "interrupted_by" in obj:
        _fail(
            obj["interrupted_by"] == "daemon_deadline",
            f"{where}.interrupted_by is not a current PIQD cutoff",
        )
    if "core" in obj:
        _fail(type(obj["core"]) is list, f"{where}.core is not a list")
        for index, member in enumerate(obj["core"]):
            _string(member, f"{where}.core[{index}]")
    if "terminal_unsat" in obj:
        _fail(
            type(obj["terminal_unsat"]) is bool,
            f"{where}.terminal_unsat is not Boolean",
        )
    if "core_labels" in obj:
        _fail(type(obj["core_labels"]) is list, f"{where}.core_labels is not a list")
        for index, label in enumerate(obj["core_labels"]):
            _fail(
                label is None or type(label) is str,
                f"{where}.core_labels[{index}] is not text or null",
            )
    present = set(obj) & _SOLVE_OPTIONAL
    if status == "SAT":
        _fail(present == {"model", "values"}, f"{where} SAT payload shape mismatch")
    elif status == "UNSAT":
        expected = {"core", "terminal_unsat"}
        if assumption_labels:
            expected.add("core_labels")
        _fail(
            present == expected,
            f"{where} UNSAT payload shape mismatch",
        )
        core = obj["core"]
        _fail(type(core) is list, f"{where}.core is not a list")
        _fail(
            obj["terminal_unsat"] is (len(core) == 0),
            f"{where} terminal_unsat disagrees with unsat assumptions",
        )
        if assumption_labels:
            labels = obj["core_labels"]
            _fail(
                type(labels) is list and len(labels) == len(core),
                f"{where} core label count mismatch",
            )
            by_term = dict(zip(assumptions, assumption_labels, strict=True))
            _fail(
                labels == [by_term.get(member) for member in core],
                f"{where} core labels disagree with ordered assumption labels",
            )
    else:
        _fail(present <= {"interrupted_by"}, f"{where} UNKNOWN payload shape mismatch")


def _validate_solve(
    value: object,
    *,
    timeout_ms: int,
    assumptions: tuple[str, ...],
    assumption_labels: tuple[str, ...],
    named_request: bool,
    replay_retry: bool = False,
) -> dict[str, Any]:
    obj = _object(
        value,
        _SOLVE_REQUIRED,
        "solve response",
        optional=_SOLVE_RESPONSE_OPTIONAL,
    )
    _string(obj["status"], "solve.status")
    _integer(obj["solve_ms"], "solve.solve_ms")
    _integer(obj["solve_index"], "solve.solve_index", minimum=1)
    _digest(obj["result_sha256"], "solve.result_sha256")
    _fail(
        _integer(
            obj["effective_deadline_ms"],
            "solve.effective_deadline_ms",
            minimum=1,
        )
        == effective_deadline_ms(timeout_ms, "solve request timeout_ms"),
        "solve effective deadline does not equal request timeout_ms + 30000",
    )
    if named_request:
        _fail("replayed" in obj, "named solve response lacks replayed")
        _fail(type(obj["replayed"]) is bool, "solve.replayed is not Boolean")
        if not replay_retry:
            _fail(obj["replayed"] is False, "fresh named solve cannot be replayed")
    elif "replayed" in obj:
        _fail(
            type(obj["replayed"]) is bool and obj["replayed"] is False,
            "solve.replayed must be exact false Boolean without request_id",
        )
    _validate_answer_fields(
        obj,
        "solve",
        assumptions=assumptions,
        assumption_labels=assumption_labels,
    )
    return obj


_RECEIPT_REQUIRED = {
    "solve_index",
    "base_commands",
    "base_bytes",
    "base_sha256",
    "solver_signature",
    "solver_sha256",
    "assumptions",
    "timeout_ms",
    "effective_deadline_ms",
    "include_model",
    "get_values",
    "status",
    "solve_ms",
    "result_sha256",
    "at",
}
_RECEIPT_OPTIONAL = _SOLVE_OPTIONAL | {
    "assumption_labels",
    "request_id",
    "request_sha256",
}


def _expected_receipts_path(session: Mapping[str, object]) -> str:
    """Derive PIQD's durable receipt journal from its session journal path."""

    raw = _string(session["journal_path"], "session.journal_path")
    journal = PurePosixPath(raw)
    _fail(
        str(journal) == raw
        and "." not in journal.parts
        and ".." not in journal.parts
        and journal.name == "journal.smt2"
        and journal.parent.name == session["id"]
        and journal.parent.parent.name == "sessions",
        "session journal path is not the canonical PIQD SMT session path",
    )
    return str(journal.with_name("receipts.jsonl"))


def _validate_receipts(
    value: object,
    *,
    session: Mapping[str, object],
    query: SourceSemanticQuery,
    solve: Mapping[str, object] | None,
    expected_count: int | None = None,
    request_id: str | None = None,
    request_sha256: str | None = None,
    assumption_labels: tuple[str, ...] = (),
) -> tuple[dict[str, Any], dict[str, Any] | None]:
    envelope = _object(
        value,
        {"session_id", "lane", "journal_path", "receipts_path", "count", "receipts"},
        "receipts envelope",
    )
    _fail(
        envelope["session_id"] == session["id"]
        and envelope["lane"] == "smt"
        and envelope["journal_path"] == session["journal_path"],
        "receipts envelope identity mismatch",
    )
    _fail(
        envelope["receipts_path"] == _expected_receipts_path(session),
        "receipts path is not the daemon-derived session receipt journal",
    )
    _fail(type(envelope["receipts"]) is list, "receipts must be a list")
    count = _integer(envelope["count"], "receipts.count")
    _fail(count == len(envelope["receipts"]), "receipt count disagrees with list")
    _fail(count in {0, 1}, "fresh single-solve session has excess receipts")
    if expected_count is not None:
        _fail(count == expected_count, f"expected {expected_count} PIQD receipts")
    if count == 0:
        return envelope, None
    receipt = _object(
        envelope["receipts"][0],
        _RECEIPT_REQUIRED,
        "receipt",
        optional=_RECEIPT_OPTIONAL,
    )
    for key in ("solve_index", "base_commands", "base_bytes", "solve_ms", "at"):
        _integer(receipt[key], f"receipt.{key}")
    for key in ("base_sha256", "solver_sha256", "result_sha256"):
        _digest(receipt[key], f"receipt.{key}")
    _string(receipt["solver_signature"], "receipt.solver_signature")
    _fail(type(receipt["assumptions"]) is list, "receipt assumptions must be a list")
    _fail(type(receipt["get_values"]) is list, "receipt get_values must be a list")
    _fail(
        type(receipt["include_model"]) is bool, "receipt include_model must be Boolean"
    )
    receipt_timeout_ms = _integer(
        receipt["timeout_ms"], "receipt.timeout_ms", minimum=1
    )
    _fail(
        _integer(
            receipt["effective_deadline_ms"],
            "receipt.effective_deadline_ms",
            minimum=1,
        )
        == effective_deadline_ms(receipt_timeout_ms, "receipt.timeout_ms"),
        "receipt effective deadline does not equal receipt timeout_ms + 30000",
    )
    _validate_answer_fields(
        receipt,
        "receipt",
        assumptions=query.assumptions,
        assumption_labels=assumption_labels,
    )
    request_fields = {"request_id", "request_sha256"} & set(receipt)
    if request_id is None:
        _fail(
            not request_fields and "assumption_labels" not in receipt,
            "unnamed receipt unexpectedly carries request identity",
        )
    else:
        _fail(
            request_fields == {"request_id", "request_sha256"},
            "named receipt lacks request identity",
        )
        _fail(request_sha256 is not None, "named receipt lacks expected digest")
        _fail(
            _canonical_uuid(receipt["request_id"], "receipt.request_id") == request_id
            and _digest(receipt["request_sha256"], "receipt.request_sha256")
            == request_sha256,
            "receipt request identity or digest mismatch",
        )
        if assumption_labels:
            _fail(
                receipt.get("assumption_labels") == list(assumption_labels),
                "receipt ordered assumption labels mismatch",
            )
        else:
            _fail(
                "assumption_labels" not in receipt,
                "unlabelled receipt unexpectedly carries assumption labels",
            )
    if solve is not None:
        _fail(
            receipt["effective_deadline_ms"] == solve["effective_deadline_ms"],
            "receipt effective deadline and solve response disagree",
        )
    _fail(
        receipt["solve_index"] == 1
        and receipt["base_commands"] == len(query.journal_commands)
        and receipt["base_bytes"] == len(query.journal_smt2)
        and receipt["base_sha256"] == _sha256(query.journal_smt2)
        and receipt["solver_signature"] == session["solver_signature"]
        and receipt["solver_sha256"] == session["solver_sha256"]
        and receipt["assumptions"] == list(query.assumptions)
        and receipt["timeout_ms"] == query.descriptor["solver_profile"]["timeout_ms"]
        and receipt["include_model"] is True
        and receipt["get_values"] == list(query.get_values),
        "receipt base, request, or solver cross-binding mismatch",
    )
    if solve is not None:
        answer_keys = {
            "status",
            "interrupted_by",
            "core",
            "terminal_unsat",
            "model",
            "values",
        }
        _fail(
            solve["solve_index"] == 1
            and all(receipt.get(key) == solve.get(key) for key in answer_keys)
            and (
                (solve.get("replayed") is True and solve["solve_ms"] == 0)
                or receipt["solve_ms"] == solve["solve_ms"]
            )
            and receipt["result_sha256"] == solve["result_sha256"],
            "receipt and solve response disagree",
        )
    return envelope, receipt


def _solve_from_receipt(receipt: Mapping[str, object]) -> dict[str, object]:
    answer_keys = (
        "status",
        "interrupted_by",
        "core",
        "core_labels",
        "terminal_unsat",
        "model",
        "values",
    )
    return {
        **{key: receipt[key] for key in answer_keys if key in receipt},
        "solve_ms": receipt["solve_ms"],
        "solve_index": receipt["solve_index"],
        "result_sha256": receipt["result_sha256"],
        "effective_deadline_ms": receipt["effective_deadline_ms"],
    }


def _validate_live_reconciliation_state(
    live: Mapping[str, object],
    *,
    created: Mapping[str, object],
    query: SourceSemanticQuery,
) -> bool:
    """Validate a live session snapshot and report whether solve 1 is terminal."""

    identity_keys = (
        "id",
        "solver_name",
        "solver_sha256",
        "solver_signature",
        "protocol_version",
        "journal_path",
        "created_at",
        "label",
    )
    _fail(
        all(live[key] == created[key] for key in identity_keys),
        "reconciliation PIQD session identity changed",
    )
    _fail(
        live["clauses"] == len(query.journal_commands),
        "reconciliation PIQD session command count mismatch",
    )
    if live["solves"] == 0:
        _fail(
            live["last_status"] is None
            and live["last_solve_index"] is None
            and live["last_assumption_free"] is None
            and live["last_terminal_unsat"] is None,
            "pending reconciliation session has terminal fields",
        )
        return False
    _fail(
        live["solves"] == 1
        and live["last_solve_index"] == 1
        and live["last_status"] in {"SAT", "UNSAT", "UNKNOWN"}
        and live["last_assumption_free"] is (not bool(query.assumptions))
        and (
            (live["last_status"] == "UNSAT")
            == (type(live["last_terminal_unsat"]) is bool)
        ),
        "terminal reconciliation session state mismatch",
    )
    return True


def _bounded_reconciliation_wait(delay_s: float) -> None:
    """Sleep for one audited response-loss reconciliation delay."""

    time.sleep(delay_s)


def _reconcile_lost_solve_response(
    *,
    transport: PiqdTransport,
    route: str,
    solver: str,
    label: str,
    session: Mapping[str, object],
    query: SourceSemanticQuery,
    receipts_before: dict[str, Any],
    request_id: str | None,
    request_sha256: str | None,
    assumption_labels: tuple[str, ...],
) -> tuple[dict[str, Any], dict[str, object] | None, dict[str, Any] | None, int]:
    """Boundedly recover one durable terminal solve without resubmitting it."""

    receipts = receipts_before
    observed_receipt: dict[str, Any] | None = None
    observed_live: dict[str, Any] | None = None
    terminal_observed = False
    for attempt, delay_s in enumerate(TRANSPORT_RECONCILIATION_DELAYS_S, start=1):
        if delay_s:
            _bounded_reconciliation_wait(delay_s)
        try:
            live = _validate_session(
                _json_call(transport, "GET", route),
                solver=solver,
                label=label,
                expected_state="live",
            )
            terminal = _validate_live_reconciliation_state(
                live, created=session, query=query
            )
            candidate_receipts, candidate_receipt = _validate_receipts(
                _json_call(transport, "GET", f"{route}/receipts"),
                session=session,
                query=query,
                solve=None,
                request_id=request_id,
                request_sha256=request_sha256,
                assumption_labels=assumption_labels,
            )
        except PiqdTransportLoss:
            continue
        receipts = candidate_receipts
        observed_live = live
        terminal_observed = terminal_observed or terminal
        if candidate_receipt is not None:
            _fail(
                observed_receipt is None or candidate_receipt == observed_receipt,
                "durable PIQD receipt changed during reconciliation",
            )
            observed_receipt = candidate_receipt
        if terminal and candidate_receipt is not None:
            solve = _solve_from_receipt(candidate_receipt)
            _validate_session_frontier(live, created=session, query=query, solve=solve)
            return receipts, solve, live, attempt

    _fail(
        not terminal_observed and observed_receipt is None,
        "bounded reconciliation ended with incomplete terminal PIQD state",
    )
    return receipts, None, observed_live, len(TRANSPORT_RECONCILIATION_DELAYS_S)


def _unsat_assumption_provenance(
    query: SourceSemanticQuery,
    solve: Mapping[str, object],
    assumption_labels: tuple[str, ...] = (),
) -> dict[str, object] | None:
    if solve["status"] != "UNSAT":
        return None
    unsat_assumptions = solve["core"]
    _fail(type(unsat_assumptions) is list, "UNSAT assumption response missing")
    _fail(
        solve["terminal_unsat"] is (len(unsat_assumptions) == 0),
        "UNSAT provenance terminal flag disagrees with unsat assumptions",
    )
    assumption_to_id = {
        entry["assumption_term"]: entry["id"]
        for entry in query.descriptor["named_atoms"]
    }
    _fail(
        len(unsat_assumptions) == len(set(unsat_assumptions))
        and set(unsat_assumptions) <= set(query.assumptions),
        "PIQD unsat assumptions contain duplicates or unrequested terms",
    )
    provenance: dict[str, object] = {
        "basis": "get-unsat-assumptions",
        "named_core_support": bool(assumption_labels),
        "daemon_field": "core",
        "assumption_terms": list(unsat_assumptions),
        "source_atom_ids": [assumption_to_id[term] for term in unsat_assumptions],
        "terminal_unsat": solve["terminal_unsat"],
    }
    if assumption_labels:
        provenance["ordered_assumption_labels"] = list(assumption_labels)
        provenance["core_labels"] = list(solve["core_labels"])
    return provenance


def _validate_unsat_output_boundary(engine: Mapping[str, object]) -> None:
    """Recheck the renamed UNSAT boundary immediately before result custody."""

    provenance = engine["unsat_assumptions"]
    if engine["raw_status"] != "UNSAT":
        _fail(provenance is None, "non-UNSAT engine has UNSAT provenance")
        return
    _fail(type(provenance) is dict, "UNSAT engine lacks assumption provenance")
    terms = provenance.get("assumption_terms")
    terminal = provenance.get("terminal_unsat")
    _fail(type(terms) is list, "UNSAT output assumptions are not a list")
    _fail(
        type(terminal) is bool and terminal is (len(terms) == 0),
        "UNSAT output terminal flag disagrees with unsat assumptions",
    )


def _semantic_replay(
    verifier: SemanticVerifier,
    query: SourceSemanticQuery,
    solver: str,
    solve: Mapping[str, object],
) -> tuple[str, dict[str, object] | None]:
    if solve["status"] == "UNSAT":
        return "UNSAT_DISCOVERY_ONLY", None
    if solve["status"] == "UNKNOWN":
        return "INCONCLUSIVE_UNKNOWN", None
    model = solve["model"]
    values = solve["values"]
    _fail(type(model) is str and type(values) is str, "SAT model/readback missing")
    try:
        verifier_query = SourceSemanticQuery(
            descriptor=_snapshot_builtin_json(
                query.descriptor, "semantic verifier query descriptor"
            ),
            descriptor_bytes=query.descriptor_bytes,
            original_smt2=query.original_smt2,
            journal_commands=query.journal_commands,
            journal_smt2=query.journal_smt2,
            source_files=tuple(
                SourceSnapshot(entry.path, entry.payload)
                for entry in query.source_files
            ),
        )
        verification = verifier(verifier_query, solver, model, values)
        _fail(
            type(verification) is SemanticVerification,
            "semantic verifier returned the wrong type",
        )
        _fail(
            type(verification.accepted) is bool,
            "semantic verifier accepted is not Boolean",
        )
        evidence = _snapshot_builtin_json(
            verification.evidence, "semantic verifier evidence"
        )
    except Exception as exc:  # noqa: BLE001 -- verifier failure is evidence, not closure
        return (
            "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
            {
                "accepted": False,
                "failure": type(exc).__name__,
                "verifier": query.descriptor["semantic_verifier"],
            },
        )
    replay = {
        "accepted": verification.accepted,
        "evidence": evidence,
        "verifier": query.descriptor["semantic_verifier"],
        "model_sha256": _sha256(model.encode("utf-8")),
        "values_sha256": _sha256(values.encode("utf-8")),
    }
    if verification.accepted:
        return "SAT_SEMANTICALLY_REPLAYED", replay
    return "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED", replay


def _validate_assert_response(value: object, expected_commands: int) -> None:
    asserted = _object(value, {"added", "commands"}, "assert response")
    _fail(
        _integer(asserted["added"], "assert.added") == expected_commands
        and _integer(asserted["commands"], "assert.commands") == expected_commands,
        "PIQD assert count mismatch",
    )


def _bounded_smt2_export(
    transport: PiqdTransport,
    route: str,
    lifecycle: dict[str, object],
) -> bytes:
    for attempt in range(2):
        try:
            return _bytes_call(transport, f"{route}/smt2")
        except PiqdTransportLoss:
            losses = _integer(
                lifecycle["export_response_losses"],
                "session lifecycle export_response_losses",
            )
            lifecycle["export_response_losses"] = losses + 1
            if attempt == 1:
                raise
    raise AssertionError("bounded SMT2 export loop did not return")


def _bounded_legacy_smt2_export(transport: PiqdTransport, route: str) -> bytes:
    """Retry one unnamed export once after a transport-only response loss."""

    for attempt in range(2):
        try:
            return _bytes_call(transport, f"{route}/smt2")
        except PiqdTransportLoss:
            if attempt == 1:
                raise
    raise AssertionError("bounded legacy SMT2 export loop did not return")


def _append_named_journal(
    *,
    transport: PiqdTransport,
    route: str,
    query: SourceSemanticQuery,
    lifecycle: dict[str, object],
    pre_exported: bytes,
) -> bytes:
    _fail(pre_exported == b"", "fresh named session has nonempty pre-append journal")
    append_body = {
        "commands": list(query.journal_commands),
        "expect_commands": 0,
    }
    try:
        response = _json_call(transport, "POST", f"{route}/assert", append_body)
    except PiqdTransportLoss:
        lifecycle["append_response_losses"] = 1
        observed = _bounded_smt2_export(transport, route, lifecycle)
        if observed == query.journal_smt2:
            lifecycle["append_reconciled_from_export"] = True
            return observed
        _fail(observed == b"", "lost append response left a divergent journal")
        lifecycle["append_retry_attempted"] = True
        try:
            response = _json_call(transport, "POST", f"{route}/assert", append_body)
        except PiqdTransportLoss:
            lifecycle["append_response_losses"] = 2
            observed = _bounded_smt2_export(transport, route, lifecycle)
            _fail(
                observed == query.journal_smt2,
                "append did not reach exact post-state after bounded retry",
            )
            lifecycle["append_reconciled_from_export"] = True
            return observed
    _validate_assert_response(response, len(query.journal_commands))
    exported = _bounded_smt2_export(transport, route, lifecycle)
    _fail(exported == query.journal_smt2, "GET /smt2 differs from normalized journal")
    return exported


def _validate_absent_session_response(value: object, where: str) -> None:
    response = _object(value, {"error"}, where)
    _string(response["error"], f"{where}.error")


def _named_session_status(
    *,
    transport: PiqdTransport,
    route: str,
    solver: str,
    label: str,
    created: Mapping[str, object],
    query: SourceSemanticQuery,
    solve: Mapping[str, object] | None,
    lifecycle: dict[str, object],
) -> dict[str, Any] | None:
    status, value = _json_call_with_status(transport, "GET", route)
    _fail(status in {200, 404}, "PIQD session status HTTP mismatch")
    lifecycle["close_status_lookups"] = (
        _integer(
            lifecycle["close_status_lookups"], "session lifecycle close_status_lookups"
        )
        + 1
    )
    lifecycle["close_status_http"] = status
    if status == 404:
        _validate_absent_session_response(value, "absent session status")
        lifecycle["close_observed_state"] = "absent"
        return None
    observed = _validate_session_record(value, "session status")
    _fail(
        observed["lane"] == "smt"
        and observed["solver_name"] == solver
        and observed["label"] == label,
        "session status identity mismatch",
    )
    _validate_session_frontier(observed, created=created, query=query, solve=solve)
    lifecycle["close_observed_state"] = observed["state"]
    return observed


def _bounded_named_session_status(
    *,
    transport: PiqdTransport,
    route: str,
    solver: str,
    label: str,
    created: Mapping[str, object],
    query: SourceSemanticQuery,
    solve: Mapping[str, object] | None,
    lifecycle: dict[str, object],
) -> dict[str, Any] | None:
    """Bound close-status recovery to one retry and retain loss evidence."""

    for attempt in range(2):
        try:
            return _named_session_status(
                transport=transport,
                route=route,
                solver=solver,
                label=label,
                created=created,
                query=query,
                solve=solve,
                lifecycle=lifecycle,
            )
        except PiqdTransportLoss:
            lifecycle["close_status_response_losses"] = (
                _integer(
                    lifecycle["close_status_response_losses"],
                    "session lifecycle close_status_response_losses",
                )
                + 1
            )
            if attempt == 1:
                lifecycle["close_observed_state"] = "unknown"
                lifecycle["close_outcome"] = "closure_unproven"
                raise
    raise AssertionError("bounded close status loop did not return")


def _validate_close_response(
    *,
    status: int,
    value: object,
    solver: str,
    label: str,
    created: Mapping[str, object],
    query: SourceSemanticQuery,
    solve: Mapping[str, object] | None,
) -> dict[str, Any] | None:
    _fail(status in {200, 404}, "PIQD close HTTP status mismatch")
    if status == 404:
        _validate_absent_session_response(value, "absent close response")
        return None
    closed = _validate_session(
        value, solver=solver, label=label, expected_state="closed"
    )
    _validate_closed_session(closed, created=created, query=query, solve=solve)
    return closed


_SESSION_LIFECYCLE_KEYS = {
    "schema",
    "request_id",
    "session_id",
    "session_label",
    "solver_profile_sha256",
    "resume_policy",
    "resumed_existing_session",
    "resume_journal_state",
    "resumed_from_receipt",
    "create_response_lost",
    "create_reconciled_from_listing",
    "append_response_losses",
    "append_retry_attempted",
    "append_reconciled_from_export",
    "export_response_losses",
    "close_delete_attempted",
    "close_response_lost",
    "close_status_lookups",
    "close_status_response_losses",
    "close_status_http",
    "close_cleanup_delete_attempted",
    "close_cleanup_response_lost",
    "close_observed_state",
    "close_outcome",
}


def _validate_session_lifecycle(value: object) -> dict[str, Any]:
    record = _object(value, _SESSION_LIFECYCLE_KEYS, "session lifecycle")
    _fail(
        record["schema"] == PIQD_SESSION_LIFECYCLE_SCHEMA,
        "session lifecycle schema mismatch",
    )
    _canonical_uuid(record["request_id"], "session lifecycle.request_id")
    _canonical_uuid(record["session_id"], "session lifecycle.session_id")
    _string(record["session_label"], "session lifecycle.session_label")
    _digest(
        record["solver_profile_sha256"],
        "session lifecycle.solver_profile_sha256",
    )
    _fail(
        record["resume_policy"]
        in {
            None,
            PIQD_RESUME_REQUIRE_EXISTING,
            PIQD_RESUME_ALLOW_CREATE_IF_MISSING,
        },
        "session lifecycle resume policy mismatch",
    )
    for key in (
        "resumed_existing_session",
        "resumed_from_receipt",
        "create_response_lost",
        "create_reconciled_from_listing",
        "append_retry_attempted",
        "append_reconciled_from_export",
        "close_delete_attempted",
        "close_response_lost",
        "close_cleanup_delete_attempted",
        "close_cleanup_response_lost",
    ):
        _fail(type(record[key]) is bool, f"session lifecycle {key} is not Boolean")
    for key in (
        "append_response_losses",
        "export_response_losses",
        "close_status_lookups",
        "close_status_response_losses",
    ):
        _integer(record[key], f"session lifecycle.{key}")
    _fail(
        record["resume_journal_state"] in {"not_resumed", "exact_pre", "exact_post"},
        "session lifecycle journal state mismatch",
    )
    _fail(
        record["close_status_http"] in {None, 200, 404},
        "session lifecycle close HTTP status mismatch",
    )
    _fail(
        record["close_observed_state"] in {"closed", "absent", "unknown"},
        "session lifecycle close observed state mismatch",
    )
    _fail(
        record["close_outcome"]
        in {
            "closed_delete_response",
            "absent_delete_response",
            "closed_status",
            "absent_status",
            "closed_after_cleanup",
            "absent_after_cleanup",
            "closed_resume_status",
            "closure_unproven",
        },
        "session lifecycle close outcome mismatch",
    )
    _fail(
        record["create_reconciled_from_listing"]
        is (record["create_response_lost"] is True),
        "session lifecycle create reconciliation mismatch",
    )
    _fail(
        record["append_response_losses"] <= 2,
        "session lifecycle append loss count exceeds bound",
    )
    _fail(
        record["close_status_lookups"] <= 2,
        "session lifecycle close lookup count exceeds bound",
    )
    _fail(
        record["close_status_response_losses"] <= 2,
        "session lifecycle close status loss count exceeds bound",
    )
    if record["close_outcome"] == "closure_unproven":
        _fail(
            record["close_status_response_losses"] == 2
            and record["close_observed_state"] == "unknown",
            "unproven close lifecycle lacks bounded loss evidence",
        )
    return record


def _close_named_session(
    *,
    transport: PiqdTransport,
    route: str,
    solver: str,
    label: str,
    created: Mapping[str, object],
    query: SourceSemanticQuery,
    solve: Mapping[str, object] | None,
    lifecycle: dict[str, object],
    already_closed: bool,
) -> dict[str, Any] | None:
    if already_closed:
        observed = _bounded_named_session_status(
            transport=transport,
            route=route,
            solver=solver,
            label=label,
            created=created,
            query=query,
            solve=solve,
            lifecycle=lifecycle,
        )
        _fail(
            observed is not None and observed["state"] == "closed",
            "resumed closed session changed state",
        )
        lifecycle["close_outcome"] = "closed_resume_status"
        return observed
    lifecycle["close_delete_attempted"] = True
    try:
        status, value = _json_call_with_status(transport, "DELETE", route)
    except PiqdTransportLoss:
        lifecycle["close_response_lost"] = True
    else:
        closed = _validate_close_response(
            status=status,
            value=value,
            solver=solver,
            label=label,
            created=created,
            query=query,
            solve=solve,
        )
        lifecycle["close_observed_state"] = "absent" if closed is None else "closed"
        lifecycle["close_outcome"] = (
            "absent_delete_response" if closed is None else "closed_delete_response"
        )
        return closed

    observed = _bounded_named_session_status(
        transport=transport,
        route=route,
        solver=solver,
        label=label,
        created=created,
        query=query,
        solve=solve,
        lifecycle=lifecycle,
    )
    if observed is None or observed["state"] == "closed":
        lifecycle["close_outcome"] = (
            "absent_status" if observed is None else "closed_status"
        )
        return observed
    _fail(
        observed["state"] in {"live", "detached"},
        "lost close response left an unsupported session state",
    )
    lifecycle["close_cleanup_delete_attempted"] = True
    try:
        cleanup_status, cleanup_value = _json_call_with_status(
            transport, "DELETE", route
        )
    except PiqdTransportLoss:
        lifecycle["close_cleanup_response_lost"] = True
    else:
        _validate_close_response(
            status=cleanup_status,
            value=cleanup_value,
            solver=solver,
            label=label,
            created=created,
            query=query,
            solve=solve,
        )
    observed = _bounded_named_session_status(
        transport=transport,
        route=route,
        solver=solver,
        label=label,
        created=created,
        query=query,
        solve=solve,
        lifecycle=lifecycle,
    )
    _fail(
        observed is None or observed["state"] == "closed",
        "bounded close cleanup did not prove the session closed",
    )
    lifecycle["close_outcome"] = (
        "absent_after_cleanup" if observed is None else "closed_after_cleanup"
    )
    return observed


def _run_solver(
    query: SourceSemanticQuery,
    solver: str,
    transport: PiqdTransport,
    verifier: SemanticVerifier,
    output_fd: int,
    used_session_ids: set[str],
    request_id: str | None = None,
    assumption_labels: tuple[str, ...] = (),
    resume_policy: str | None = None,
) -> dict[str, object]:
    _fail(
        request_id is not None or not assumption_labels,
        "assumption_labels require a caller-owned request_id",
    )
    if request_id is not None:
        request_id = _canonical_uuid(request_id, "request_id")
        assumption_labels = _validated_assumption_labels(query, assumption_labels)
    else:
        assumption_labels = ()
        _fail(resume_policy is None, "resume_policy requires a named request")
    _fail(
        resume_policy is None or type(resume_policy) is str,
        "resume_policy must be an exact string or null",
    )
    _fail(
        resume_policy
        in {
            None,
            PIQD_RESUME_REQUIRE_EXISTING,
            PIQD_RESUME_ALLOW_CREATE_IF_MISSING,
        },
        "unsupported named-session resume policy",
    )
    preexisting_output_inventory = tuple(sorted(os.listdir(output_fd)))
    allow_existing_artifacts = resume_policy is not None

    def write_artifact(name: str, payload: bytes) -> dict[str, object]:
        return _write_or_verify_immutable(
            output_fd,
            name,
            payload,
            allow_existing=allow_existing_artifacts,
        )

    base_label = (
        f"p97-smt-source/{query.descriptor['query_id']}/{solver}/"
        f"{query.descriptor['semantic_sha256'][:12]}"
    )
    solve_request: dict[str, object] = {
        "assumptions": list(query.assumptions),
        "timeout_ms": query.descriptor["solver_profile"]["timeout_ms"],
        "include_model": True,
        "get_values": list(query.get_values),
    }
    request_sha256: str | None = None
    named_artifacts: dict[str, object] = {}
    lifecycle: dict[str, object] | None = None
    if request_id is None:
        label = base_label
    else:
        profile = _snapshot_builtin_json(
            query.descriptor["solver_profile"], "named solver profile"
        )
        profile_sha256 = _sha256(_canonical_json(profile))
        label = f"{base_label}/{request_id}/{profile_sha256[:12]}"
        solve_request.update(
            {
                "assumption_labels": list(assumption_labels),
                "request_id": request_id,
            }
        )
        request_sha256 = piqd_solve_request_digest(query, assumption_labels)
        create_body = {"solver": solver, "lane": "smt", "label": label}
        named_artifacts["session_create_request"] = write_artifact(
            f"{solver}.session-create-request.json",
            _json_artifact(
                {
                    "schema": "piqd-smt-session-create-request/v1",
                    "request": create_body,
                    "request_id": request_id,
                    "session_label": label,
                    "solver_profile": profile,
                    "solver_profile_sha256": profile_sha256,
                }
            ),
        )
        named_artifacts["pre_append_smt2"] = write_artifact(
            f"{solver}.pre-append.smt2", b""
        )
        named_artifacts["expected_post_append_smt2"] = write_artifact(
            f"{solver}.expected-post-append.smt2", query.journal_smt2
        )
        append_request = {
            "commands": list(query.journal_commands),
            "expect_commands": 0,
        }
        named_artifacts["journal_frontiers"] = write_artifact(
            f"{solver}.journal-frontiers.json",
            _json_artifact(
                {
                    "schema": "piqd-smt-journal-frontiers/v1",
                    "append_request": append_request,
                    "pre": {
                        "commands": 0,
                        "bytes": 0,
                        "sha256": _sha256(b""),
                        "artifact": named_artifacts["pre_append_smt2"],
                    },
                    "post": {
                        "commands": len(query.journal_commands),
                        "bytes": len(query.journal_smt2),
                        "sha256": _sha256(query.journal_smt2),
                        "artifact": named_artifacts["expected_post_append_smt2"],
                    },
                }
            ),
        )
        named_artifacts["solve_request"] = write_artifact(
            f"{solver}.solve-request.json",
            _json_artifact(
                {
                    "schema": "piqd-smt-solve-request/v1",
                    "journal_frontier": {
                        "base_commands": len(query.journal_commands),
                        "base_bytes": len(query.journal_smt2),
                        "base_sha256": _sha256(query.journal_smt2),
                    },
                    "request": solve_request,
                    "request_id": request_id,
                    "request_sha256": request_sha256,
                }
            ),
        )
        lifecycle = {
            "schema": PIQD_SESSION_LIFECYCLE_SCHEMA,
            "request_id": request_id,
            "session_id": None,
            "session_label": label,
            "solver_profile_sha256": profile_sha256,
            "resume_policy": resume_policy,
            "resumed_existing_session": False,
            "resume_journal_state": "not_resumed",
            "resumed_from_receipt": False,
            "create_response_lost": False,
            "create_reconciled_from_listing": False,
            "append_response_losses": 0,
            "append_retry_attempted": False,
            "append_reconciled_from_export": False,
            "export_response_losses": 0,
            "close_delete_attempted": False,
            "close_response_lost": False,
            "close_status_lookups": 0,
            "close_status_response_losses": 0,
            "close_status_http": None,
            "close_cleanup_delete_attempted": False,
            "close_cleanup_response_lost": False,
            "close_observed_state": None,
            "close_outcome": None,
        }

    create_body = {"solver": solver, "lane": "smt", "label": label}
    observed_session: dict[str, Any] | None = None
    resumed_existing_session = False
    if resume_policy is not None:
        observed_session = _discover_named_session(
            transport=transport,
            solver=solver,
            label=label,
            allow_missing=(
                resume_policy == PIQD_RESUME_ALLOW_CREATE_IF_MISSING
                and not preexisting_output_inventory
            ),
        )
        resumed_existing_session = observed_session is not None
        _fail(lifecycle is not None, "named lifecycle is unavailable")
        lifecycle["resumed_existing_session"] = resumed_existing_session
    if observed_session is None:
        try:
            raw_create = _json_call(
                transport, "POST", "/sessions", create_body, status=201
            )
        except PiqdTransportLoss:
            if request_id is None:
                raise
            _fail(lifecycle is not None, "named lifecycle is unavailable")
            lifecycle["create_response_lost"] = True
            observed_session = _reconcile_lost_create_response(
                transport=transport, solver=solver, label=label
            )
            lifecycle["create_reconciled_from_listing"] = True
        else:
            recoverable_session_id = _recover_session_id(raw_create)
            try:
                observed_session = _validate_session(
                    raw_create, solver=solver, label=label, expected_state="live"
                )
                _validate_fresh_session(observed_session)
            except BaseException:
                if recoverable_session_id is not None:
                    try:
                        _json_call(
                            transport,
                            "DELETE",
                            f"/sessions/{recoverable_session_id}",
                        )
                    except Exception as cleanup_error:  # noqa: BLE001
                        _ = cleanup_error
                raise
    _fail(observed_session is not None, "PIQD session was not established")

    session = observed_session
    if resumed_existing_session:
        existing_session_payload = _read_existing_output(
            output_fd, f"{solver}.session.json"
        )
        if existing_session_payload is not None:
            session = _validate_session(
                _strict_json(existing_session_payload, "existing session artifact"),
                solver=solver,
                label=label,
                expected_state="live",
            )
            _validate_fresh_session(session)
    _fail(
        session["id"] == observed_session["id"],
        "resumed PIQD session disagrees with retained session identity",
    )
    if session["id"] in used_session_ids:
        if not resumed_existing_session:
            try:
                _json_call(transport, "DELETE", f"/sessions/{session['id']}")
            except Exception as cleanup_error:  # noqa: BLE001
                _ = cleanup_error
        raise SmtSourceAdapterError("PIQD reused a session identity")
    session_id = session["id"]
    if lifecycle is not None:
        lifecycle["session_id"] = session_id
    used_session_ids.add(session_id)
    route = f"/sessions/{session_id}"
    primary_error: BaseException | None = None
    solve_for_close: dict[str, object] | None = None
    closed: dict[str, Any] | None = None
    engine: dict[str, object] | None = None
    try:
        if request_id is not None:
            _fail(lifecycle is not None, "named lifecycle is unavailable")
            pre_exported = _bounded_smt2_export(transport, route, lifecycle)
            if resumed_existing_session and pre_exported == query.journal_smt2:
                lifecycle["resume_journal_state"] = "exact_post"
                _fail(
                    observed_session["clauses"] == len(query.journal_commands),
                    "resumed post-append command count mismatch",
                )
                exported = pre_exported
            else:
                _fail(
                    pre_exported == b"",
                    "PIQD session journal is neither exact pre-state nor exact post-state",
                )
                _validate_unsolved_session_frontier(observed_session, commands=0)
                _fail(
                    observed_session["state"] != "closed",
                    "cannot append to a resumed closed PIQD session",
                )
                if resumed_existing_session:
                    lifecycle["resume_journal_state"] = "exact_pre"
                exported = _append_named_journal(
                    transport=transport,
                    route=route,
                    query=query,
                    lifecycle=lifecycle,
                    pre_exported=pre_exported,
                )
        else:
            _validate_assert_response(
                _json_call(
                    transport,
                    "POST",
                    f"{route}/assert",
                    {
                        "commands": list(query.journal_commands),
                        "expect_commands": 0,
                    },
                ),
                len(query.journal_commands),
            )
            exported = _bounded_legacy_smt2_export(transport, route)
            _fail(
                exported == query.journal_smt2,
                "GET /smt2 differs from normalized journal",
            )

        remote_receipts, remote_receipt = _validate_receipts(
            _json_call(transport, "GET", f"{route}/receipts"),
            session=session,
            query=query,
            solve=None,
            expected_count=None if resumed_existing_session else 0,
            request_id=request_id,
            request_sha256=request_sha256,
            assumption_labels=assumption_labels,
        )
        existing_receipts_before = (
            _read_existing_output(output_fd, f"{solver}.receipts-before.json")
            if resumed_existing_session
            else None
        )
        if existing_receipts_before is None:
            receipts_before = remote_receipts
        else:
            receipts_before, retained_before_receipt = _validate_receipts(
                _strict_json(
                    existing_receipts_before, "existing pre-solve receipts artifact"
                ),
                session=session,
                query=query,
                solve=None,
                expected_count=0,
                request_id=request_id,
                request_sha256=request_sha256,
                assumption_labels=assumption_labels,
            )
            _fail(
                retained_before_receipt is None,
                "existing pre-solve receipts artifact is not empty",
            )

        response_lost = False
        request_replayed: bool | None = None
        replay_attempted = False
        reconciliation_session = None
        reconciliation_attempts = 0
        reconciled_from_receipt = False
        resumed_from_receipt = False
        if remote_receipt is not None:
            _fail(resumed_existing_session, "fresh session unexpectedly has a receipt")
            derived_solve = _solve_from_receipt(remote_receipt)
            solve_payloads = {
                "solve": _read_existing_output(output_fd, f"{solver}.solve.json"),
                "reconciled_solve": _read_existing_output(
                    output_fd, f"{solver}.reconciled-solve.json"
                ),
            }
            present = [
                key for key, payload in solve_payloads.items() if payload is not None
            ]
            _fail(len(present) <= 1, "resume has multiple retained solve artifacts")
            if present:
                solve_key = present[0]
                raw_solve = _strict_json(
                    solve_payloads[solve_key], "existing solve artifact"
                )
                if type(raw_solve) is dict and "replayed" in raw_solve:
                    _fail(
                        solve_key != "reconciled_solve"
                        or raw_solve["replayed"] is True,
                        "retained named retry lacks replay proof",
                    )
                    solve = _validate_solve(
                        raw_solve,
                        timeout_ms=solve_request["timeout_ms"],
                        assumptions=query.assumptions,
                        assumption_labels=assumption_labels,
                        named_request=True,
                        replay_retry=raw_solve.get("replayed") is True,
                    )
                else:
                    _fail(
                        raw_solve == derived_solve,
                        "retained solve artifact disagrees with receipt",
                    )
                    solve = derived_solve
                response_lost = solve_key == "reconciled_solve"
            else:
                solve = derived_solve
                response_lost = True
            receipts, receipt = _validate_receipts(
                remote_receipts,
                session=session,
                query=query,
                solve=solve,
                request_id=request_id,
                request_sha256=request_sha256,
                assumption_labels=assumption_labels,
            )
            request_replayed = True
            reconciled_from_receipt = True
            resumed_from_receipt = True
            reconciliation_session = observed_session
            _fail(lifecycle is not None, "named lifecycle is unavailable")
            lifecycle["resumed_from_receipt"] = True
            _validate_session_frontier(
                observed_session, created=session, query=query, solve=solve
            )
        else:
            if resumed_existing_session:
                observed_session = _validate_session_record(
                    _json_call(transport, "GET", route),
                    "resumed unsolved session status",
                )
                _fail(
                    observed_session["lane"] == "smt"
                    and observed_session["solver_name"] == solver
                    and observed_session["label"] == label,
                    "resumed unsolved session identity mismatch",
                )
                _validate_session_frontier(
                    observed_session,
                    created=session,
                    query=query,
                    solve=None,
                )
                _fail(
                    observed_session["state"] != "closed",
                    "resumed closed session has no solve receipt",
                )
            try:
                solve = _validate_solve(
                    _json_call(transport, "POST", f"{route}/solve", solve_request),
                    timeout_ms=solve_request["timeout_ms"],
                    assumptions=query.assumptions,
                    assumption_labels=assumption_labels,
                    named_request=request_id is not None,
                )
            except PiqdTransportLoss:
                response_lost = True
                solve = None
                if request_id is not None:
                    replay_attempted = True
                    try:
                        solve = _validate_solve(
                            _json_call(
                                transport, "POST", f"{route}/solve", solve_request
                            ),
                            timeout_ms=solve_request["timeout_ms"],
                            assumptions=query.assumptions,
                            assumption_labels=assumption_labels,
                            named_request=True,
                            replay_retry=True,
                        )
                        _fail(
                            solve["replayed"] is True,
                            "named solve retry did not prove request replay",
                        )
                        request_replayed = solve["replayed"]
                    except PiqdTransportLoss:
                        solve = None
            if (
                solve is not None
                and request_id is not None
                and request_replayed is None
            ):
                request_replayed = solve["replayed"]

        if response_lost and solve is None:
            receipts, solve, reconciliation_session, reconciliation_attempts = (
                _reconcile_lost_solve_response(
                    transport=transport,
                    route=route,
                    solver=solver,
                    label=label,
                    session=session,
                    query=query,
                    receipts_before=receipts_before,
                    request_id=request_id,
                    request_sha256=request_sha256,
                    assumption_labels=assumption_labels,
                )
            )
            reconciled_from_receipt = solve is not None
            receipt = None if solve is None else receipts["receipts"][0]
        elif remote_receipt is None:
            receipts, receipt = _validate_receipts(
                _json_call(transport, "GET", f"{route}/receipts"),
                session=session,
                query=query,
                solve=solve,
                request_id=request_id,
                request_sha256=request_sha256,
                assumption_labels=assumption_labels,
            )
        if solve is None:
            _fail(receipt is None, "receipt reconciliation state is inconsistent")
            artifacts = {
                **named_artifacts,
                "session": write_artifact(
                    f"{solver}.session.json", _json_artifact(session)
                ),
                "smt2": write_artifact(f"{solver}.smt2", exported),
                "receipts_before": write_artifact(
                    f"{solver}.receipts-before.json",
                    _json_artifact(receipts_before),
                ),
                "receipts": write_artifact(
                    f"{solver}.receipts.json", _json_artifact(receipts)
                ),
            }
            engine = {
                "solver": solver,
                "session_id": session_id,
                "solver_signature": session["solver_signature"],
                "solver_sha256": session["solver_sha256"],
                "raw_status": None,
                "effective_status": "INCONCLUSIVE_TRANSPORT_LOSS",
                "solve_index": None,
                "result_sha256": None,
                "response_lost": True,
                "reconciled_from_receipt": False,
                "reconciliation_attempts": reconciliation_attempts,
                "result_digest_advisory": None,
                "unsat_assumptions": None,
                "semantic_replay": None,
                "artifacts": artifacts,
                "claims": dict(FALSE_CLAIMS),
            }
        else:
            _fail(receipt is not None, "completed solve has no durable receipt")
            solve_for_close = solve
            effective_status, semantic = _semantic_replay(
                verifier, query, solver, solve
            )
            unsat_assumptions = _unsat_assumption_provenance(
                query, solve, assumption_labels
            )
            locally_recomputed_digest = piqd_result_digest(solve)
            artifacts = {
                **named_artifacts,
                "session": write_artifact(
                    f"{solver}.session.json", _json_artifact(session)
                ),
                "smt2": write_artifact(f"{solver}.smt2", exported),
                "receipts_before": write_artifact(
                    f"{solver}.receipts-before.json",
                    _json_artifact(receipts_before),
                ),
                "receipts": write_artifact(
                    f"{solver}.receipts.json", _json_artifact(receipts)
                ),
            }
            solve_artifact = (
                f"{solver}.reconciled-solve.json"
                if response_lost
                else f"{solver}.solve.json"
            )
            artifacts["reconciled_solve" if response_lost else "solve"] = (
                write_artifact(solve_artifact, _json_artifact(solve))
            )
            if reconciliation_session is not None:
                artifacts["reconciliation_session"] = write_artifact(
                    f"{solver}.reconciliation-session.json",
                    _json_artifact(reconciliation_session),
                )
            if semantic is not None:
                artifacts["semantic"] = write_artifact(
                    f"{solver}.semantic.json", _json_artifact(semantic)
                )
            engine = {
                "solver": solver,
                "session_id": session_id,
                "solver_signature": session["solver_signature"],
                "solver_sha256": session["solver_sha256"],
                "raw_status": solve["status"],
                "effective_status": effective_status,
                "solve_index": solve["solve_index"],
                "result_sha256": receipt["result_sha256"],
                "response_lost": response_lost,
                "reconciled_from_receipt": reconciled_from_receipt,
                "reconciliation_attempts": reconciliation_attempts,
                "result_digest_advisory": {
                    "algorithm": "piqd-smt-solve-result/v1",
                    "locally_recomputed": locally_recomputed_digest,
                    "matches_daemon": locally_recomputed_digest
                    == receipt["result_sha256"],
                },
                "unsat_assumptions": unsat_assumptions,
                "semantic_replay": semantic,
                "artifacts": artifacts,
                "claims": dict(FALSE_CLAIMS),
            }
        if request_id is not None:
            _fail(request_sha256 is not None, "named request lacks expected digest")
            engine.update(
                {
                    "request_id": request_id,
                    "request_sha256": request_sha256,
                    "assumption_labels": list(assumption_labels),
                    "request_replay_attempted": replay_attempted,
                    "request_replayed": request_replayed,
                    "resumed_from_receipt": resumed_from_receipt,
                }
            )
    except BaseException as exc:
        primary_error = exc
        raise
    finally:
        try:
            if request_id is None:
                closed = _validate_session(
                    _json_call(transport, "DELETE", route),
                    solver=solver,
                    label=label,
                    expected_state="closed",
                )
                _validate_closed_session(
                    closed, created=session, query=query, solve=solve_for_close
                )
            else:
                _fail(lifecycle is not None, "named lifecycle is unavailable")
                closed = _close_named_session(
                    transport=transport,
                    route=route,
                    solver=solver,
                    label=label,
                    created=session,
                    query=query,
                    solve=solve_for_close,
                    lifecycle=lifecycle,
                    already_closed=(
                        resumed_existing_session
                        and observed_session["state"] == "closed"
                    ),
                )
        except BaseException:
            if (
                request_id is not None
                and lifecycle is not None
                and lifecycle.get("close_outcome") == "closure_unproven"
            ):
                try:
                    write_artifact(
                        f"{solver}.session-lifecycle.json",
                        _json_artifact(lifecycle),
                    )
                except Exception:
                    if primary_error is None:
                        raise
            if primary_error is None:
                raise
    _fail(
        engine is not None and (request_id is not None or closed is not None),
        "PIQD solver run did not complete",
    )
    if closed is not None:
        engine["artifacts"]["closed_session"] = write_artifact(
            f"{solver}.closed-session.json", _json_artifact(closed)
        )
    if request_id is not None:
        _fail(lifecycle is not None, "named lifecycle is unavailable")
        lifecycle = _validate_session_lifecycle(lifecycle)
        lifecycle_payload = _json_artifact(lifecycle)
        existing_lifecycle = _read_existing_output(
            output_fd, f"{solver}.session-lifecycle.json"
        )
        if existing_lifecycle is None:
            lifecycle_record = lifecycle
            lifecycle_artifact = write_artifact(
                f"{solver}.session-lifecycle.json", lifecycle_payload
            )
        else:
            lifecycle_record = _validate_session_lifecycle(
                _strict_json(existing_lifecycle, "existing session lifecycle"),
            )
            for key in (
                "schema",
                "request_id",
                "session_id",
                "session_label",
                "solver_profile_sha256",
            ):
                _fail(
                    lifecycle_record[key] == lifecycle[key],
                    "existing session lifecycle identity disagrees",
                )
            lifecycle_artifact = {
                "path": f"{solver}.session-lifecycle.json",
                "bytes": len(existing_lifecycle),
                "sha256": _sha256(existing_lifecycle),
            }
            if (
                lifecycle_record["close_outcome"] == "closure_unproven"
                and lifecycle["close_outcome"] != "closure_unproven"
            ):
                # The first run's loss/identity record is immutable evidence.  A
                # resumed run publishes its proved close under a distinct name;
                # never replace or unlink the original record.
                engine["artifacts"]["final_session_lifecycle"] = write_artifact(
                    f"{solver}.session-lifecycle-final.json", lifecycle_payload
                )
                lifecycle_record = lifecycle
        engine["session_lifecycle"] = lifecycle_record
        engine["artifacts"]["session_lifecycle"] = lifecycle_artifact
    _validate_unsat_output_boundary(engine)
    return engine


def run_authenticated_single_solver_query(
    query: SourceSemanticQuery,
    *,
    solver: str,
    descriptor_schema: str,
    solver_profile_schema: str,
    authenticated_journal_commands: tuple[str, ...],
    transport: PiqdTransport,
    semantic_verifier: SemanticVerifier,
    output_fd: int,
    used_session_ids: set[str] | None = None,
    request_id: str | None = None,
    assumption_labels: tuple[str, ...] | None = None,
    resume_policy: str | None = None,
) -> dict[str, object]:
    """Run one authenticated solver in one fresh PIQD session and one solve.

    This is the low-level production boundary for a producer that owns its
    create-once output staging.  The exact one-solver descriptor and complete
    journal are validated before transport.  There is no second solver or
    fallback.  Durable receipt reconciliation and semantic SAT replay use the
    same hardened machinery as the public two-solver wave.  PIQD's maintained
    receipt/solve digest agreement remains binding, while this adapter's local
    recomputation of ``result_sha256`` remains explicitly advisory.
    """

    query = validate_authenticated_single_solver_query(
        query,
        solver=solver,
        descriptor_schema=descriptor_schema,
        solver_profile_schema=solver_profile_schema,
        authenticated_journal_commands=authenticated_journal_commands,
    )
    _fail(
        type(output_fd) is int and output_fd >= 0,
        "single-solver output descriptor is invalid",
    )
    if request_id is None:
        _fail(
            assumption_labels is None,
            "assumption_labels require a caller-owned request_id",
        )
        _fail(resume_policy is None, "resume_policy requires a named request")
        labels: tuple[str, ...] = ()
    else:
        request_id = _canonical_uuid(request_id, "request_id")
        _fail(
            assumption_labels is not None,
            "named request requires an exact assumption_labels tuple",
        )
        labels = _validated_assumption_labels(query, assumption_labels)
    if used_session_ids is None:
        used_session_ids = set()
    _fail(
        type(used_session_ids) is set
        and all(type(session_id) is str for session_id in used_session_ids),
        "used session identities must be an exact string set",
    )
    return _run_solver(
        query,
        solver,
        transport,
        semantic_verifier,
        output_fd,
        used_session_ids,
        request_id,
        labels,
        resume_policy,
    )


def run_source_semantic_query(
    query: SourceSemanticQuery,
    output_directory: Path,
    transport: PiqdTransport,
    semantic_verifier: SemanticVerifier,
) -> dict[str, object]:
    """Run fresh z3 then cvc5 sessions and install a create-once receipt tree."""

    query = _revalidate_query_snapshot(query)
    staging = _reserve_output_staging(output_directory)
    keep = False
    try:
        manifest = _manifest(query)
        manifest_bytes = _json_artifact(manifest)
        custody = {
            "descriptor": _write_immutable(
                staging.staging_fd, "descriptor.json", query.descriptor_bytes
            ),
            "original_smt2": _write_immutable(
                staging.staging_fd, "original.smt2", query.original_smt2
            ),
            "journal_smt2": _write_immutable(
                staging.staging_fd, "journal.smt2", query.journal_smt2
            ),
            "manifest": _write_immutable(
                staging.staging_fd, "source-manifest.json", manifest_bytes
            ),
            "sources": [
                _write_immutable(
                    staging.staging_fd,
                    _source_artifact_name(index, source),
                    source.payload,
                )
                for index, source in enumerate(query.source_files)
            ],
        }
        engines: list[dict[str, object]] = []
        used_session_ids: set[str] = set()
        for solver in SOLVERS:
            engines.append(
                _run_solver(
                    query,
                    solver,
                    transport,
                    semantic_verifier,
                    staging.staging_fd,
                    used_session_ids,
                )
            )
        effective = [engine["effective_status"] for engine in engines]
        raw = [engine["raw_status"] for engine in engines]
        if any(status.startswith("INCONCLUSIVE") for status in effective):
            overall = "INCONCLUSIVE"
        elif len(set(raw)) != 1:
            overall = "INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT"
        else:
            overall = "FINITE_DIAGNOSTIC_COMPLETE"
        result = {
            "schema": RESULT_SCHEMA,
            "source_manifest_sha256": _sha256(manifest_bytes),
            "custody": custody,
            "engines": engines,
            "overall_status": overall,
            "claims": dict(FALSE_CLAIMS),
        }
        _write_immutable(staging.staging_fd, "result.json", _json_artifact(result))
        _publish_output(staging)
        keep = True
        return result
    finally:
        _close_output_staging(staging, keep=keep)


class UrllibPiqdTransport:
    """Small standard-library transport for the real PIQD route shapes."""

    def __init__(self, server: str, *, http_timeout_s: float = 3_900.0) -> None:
        parsed = urllib.parse.urlsplit(server)
        _fail(
            parsed.scheme in {"http", "https"}
            and parsed.netloc
            and parsed.username is None
            and parsed.password is None
            and not parsed.query
            and not parsed.fragment,
            "invalid PIQD server URL",
        )
        self._server = server.rstrip("/")
        self._timeout = http_timeout_s
        self._opener = urllib.request.build_opener(_NoRedirect())

    def _request(
        self, method: str, path: str, body: Mapping[str, object] | None
    ) -> tuple[int, bytes]:
        _fail(
            path.startswith("/") and "?" not in path and "#" not in path,
            "unsafe PIQD path",
        )
        payload = None if body is None else _canonical_json(body)
        request = urllib.request.Request(
            self._server + path,
            data=payload,
            method=method,
            headers={"Content-Type": "application/json", "Accept": "application/json"},
        )
        try:
            with self._opener.open(request, timeout=self._timeout) as response:
                raw = response.read(MAX_EXPORT_BYTES + 1)
                return response.status, raw
        except urllib.error.HTTPError as exc:
            return exc.code, exc.read(MAX_EXPORT_BYTES + 1)
        except (urllib.error.URLError, TimeoutError, OSError) as exc:
            raise PiqdTransportLoss("PIQD HTTP request failed") from exc

    def request_json(
        self,
        method: str,
        path: str,
        body: Mapping[str, object] | None = None,
    ) -> JsonResponse:
        status, raw = self._request(method, path, body)
        _fail(len(raw) <= MAX_EXPORT_BYTES, "PIQD JSON response exceeds cap")
        return JsonResponse(status, _strict_json(raw, "PIQD JSON response"))

    def request_bytes(self, method: str, path: str) -> BytesResponse:
        status, raw = self._request(method, path, None)
        _fail(len(raw) <= MAX_EXPORT_BYTES, "PIQD byte response exceeds cap")
        return BytesResponse(status, raw)


class _NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        raise SmtSourceAdapterError("PIQD redirect refused")


__all__ = [
    "MANIFEST_SCHEMA",
    "PIQD_EFFECTIVE_DEADLINE_GRACE_MS",
    "PIQD_HTTP_RESPONSE_MARGIN_MS",
    "PIQD_RESUME_ALLOW_CREATE_IF_MISSING",
    "PIQD_RESUME_REQUIRE_EXISTING",
    "PIQD_SESSION_LIFECYCLE_SCHEMA",
    "PIQD_SOLVE_REQUEST_DIGEST_VERSION",
    "QUERY_SCHEMA",
    "RESULT_SCHEMA",
    "SOLVER_PROFILE_SCHEMA",
    "BytesResponse",
    "JsonResponse",
    "PiqdTransport",
    "PiqdTransportLoss",
    "SemanticVerification",
    "SmtSourceAdapterError",
    "SourceSemanticQuery",
    "SourceSnapshot",
    "UrllibPiqdTransport",
    "bounded_solve_http_timeout_s",
    "effective_deadline_ms",
    "load_source_semantic_query",
    "normalize_state_journal",
    "piqd_result_digest",
    "piqd_solve_request_digest",
    "run_authenticated_single_solver_query",
    "run_source_semantic_query",
    "split_smt2_commands",
    "validate_authenticated_single_solver_query",
]
