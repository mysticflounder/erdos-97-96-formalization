"""SolverRunner-compatible PIQD boundary for static DIMACS discovery.

This module deliberately stops at finite discovery evidence.  SAT assignments
are total and replayed against the exact local CNF bytes.  UNSAT is the PIQD
driver's ``DISCOVERY_UNSAT`` outcome and never populates a legacy DRAT path.
"""

from __future__ import annotations

import fcntl
import http.client
import json
import os
import stat
import threading
import time
import urllib.parse
from collections.abc import Callable, Iterator, Mapping
from contextlib import contextmanager
from dataclasses import dataclass, field, replace
from pathlib import Path
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    DISCOVERY_UNSAT,
    ERROR,
    LOCAL_CERTIFICATE,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    validate_attempt_journal,
    validate_wave_manifest,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_driver import (
    EVENT_SCHEMA,
    SEAL_SCHEMA,
    DriverPolicy,
    DriverResult,
    DurableAttemptJournal,
    PiqdCegarDriver,
    PiqdDriverError,
    _validate_event,
)
from census.p97_search.phase3_piqd_oracle import (
    CheckedModel,
    HttpResponse,
    MultipartBody,
    PiqdOracleError,
    PiqdRawDimacsClient,
    PreparedJob,
    Transport,
    scan_dimacs,
)

SOURCE_SCHEMA = "p97-piqd-static-source/v1"
PRODUCER_SCHEMA = "p97-piqd-static-producer/v1"
RECEIPT_SCHEMA = "p97-piqd-static-solver-receipt/v1"
CUSTODY_SEAL_SCHEMA = "p97-piqd-static-attempt-custody-seal/v1"
CERTIFICATE_BLOCKER = "CERT-001"
ATTESTED_SOLVER_RESULT = "ATTESTED_SOLVER_RESULT"
DEPLOYMENT_NO_SOLVER = "DEPLOYMENT_NO_SOLVER"
INVALID_STATUS_ATTESTATION = "INVALID_STATUS_ATTESTATION"
SOLVER_UNKNOWN = "SOLVER_UNKNOWN"

_STARTED_ATTESTATION_BASIS = "SINGLE_PROCESS_NO_PARALLEL_FLAG"
_NO_SOLVER_ATTESTATION_BASIS = "SOLVER_DID_NOT_START"

_SOURCE_KEYS = frozenset(
    {
        "schema",
        "source_id",
        "source_path",
        "source_sha256",
        "finite_schema",
        "cardinality_scope",
        "source_theorem",
        "claims",
    }
)
_PRODUCER_KEYS = frozenset(
    {
        "schema",
        "producer_id",
        "producer_kind",
        "source_manifest",
        "source_manifest_sha256",
        "variable_map_sha256",
        "backend",
        "solver_profile",
        "query_polarity",
        "claims",
    }
)
_SOURCE_CLAIMS = frozenset(
    {"source_entitlement", "theorem_coverage", "universal_lift", "lean_closure"}
)
_PRODUCER_CLAIMS = _SOURCE_CLAIMS | frozenset({"one_process", "one_core"})
_HEX = frozenset("0123456789abcdef")
_MAX_MANIFEST_BYTES = 64 * 1024
_MAX_JSON_DEPTH = 16
_MAX_JSON_NODES = 512
_DEFAULT_MAX_CNF_BYTES = 1 << 30
_MAX_CONTROL_RESPONSE_BYTES = 1024 * 1024
_MAX_MODEL_RESPONSE_BYTES = 64 * 1024 * 1024
_MAX_LOG_BYTES = 64 * 1024 * 1024
_MAX_JOURNAL_BYTES = 64 * 1024 * 1024
_MAX_RECEIPT_BYTES = 1024 * 1024
_MAX_RESPONSE_JSON_DEPTH = 32
_MAX_RESPONSE_JSON_NODES = 4_000_000
_JOURNAL_NAME = "attempt.jsonl"
_LOCK_NAME = "attempt.jsonl.lock"
_ARTIFACT_DIRECTORY_NAME = "attempt.jsonl.artifacts"
_DRIVER_SEAL_NAME = "attempt.jsonl.seal.json"
_RECEIPT_NAME = "solver-receipt.json"
_CUSTODY_SEAL_NAME = "custody-seal.json"
_CUSTODY_RETRY_POLICY = "REMOVE_UNSEALED_RESERVED_ATTEMPT"


class StaticPiqdRunnerError(RuntimeError):
    """The static runner contract or local custody check failed."""


@dataclass(frozen=True)
class StaticSolverResult:
    """Structural match for the legacy SolverResult protocol."""

    verdict: str
    assignment: Mapping[int, bool]
    returncode: int
    stdout: str = ""
    stderr: str = ""


@dataclass(frozen=True)
class StaticManifestContract:
    """Canonical source and producer bytes authenticated for every invocation."""

    source_bytes: bytes
    producer_bytes: bytes
    source: Mapping[str, Any]
    producer: Mapping[str, Any]
    source_sha256: str
    producer_sha256: str


@dataclass(frozen=True)
class StaticPiqdRunnerConfig:
    base_url: str
    journal_root: Path
    manifests: StaticManifestContract
    policy: DriverPolicy = field(
        default_factory=lambda: DriverPolicy(requested_core_limit=1)
    )
    max_cnf_bytes: int = _DEFAULT_MAX_CNF_BYTES

    def __post_init__(self) -> None:
        if type(self.base_url) is not str or not self.base_url.strip():
            raise StaticPiqdRunnerError("base_url must be a non-empty string")
        if type(self.max_cnf_bytes) is not int or self.max_cnf_bytes <= 0:
            raise StaticPiqdRunnerError("max_cnf_bytes must be a positive builtin int")
        if self.policy.requested_core_limit != 1:
            raise StaticPiqdRunnerError(
                "the static canary must request exactly one core; this is not an "
                "attestation of one process or one core"
            )


def _reject_constant(value: str) -> None:
    raise ValueError(f"invalid JSON constant: {value}")


def _reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _bounded_json_shape(value: Any, *, depth: int = 0) -> int:
    if depth > _MAX_JSON_DEPTH:
        raise StaticPiqdRunnerError("manifest JSON exceeds the depth bound")
    nodes = 1
    if isinstance(value, dict):
        for key, item in value.items():
            if type(key) is not str:
                raise StaticPiqdRunnerError("manifest object keys must be strings")
            nodes += _bounded_json_shape(item, depth=depth + 1)
    elif isinstance(value, list):
        for item in value:
            nodes += _bounded_json_shape(item, depth=depth + 1)
    elif value is not None and type(value) not in {str, int, float, bool}:
        raise StaticPiqdRunnerError("manifest contains an unsupported JSON value")
    if nodes > _MAX_JSON_NODES:
        raise StaticPiqdRunnerError("manifest JSON exceeds the node bound")
    return nodes


def _strict_canonical_object(raw: bytes, *, name: str) -> dict[str, Any]:
    if type(raw) is not bytes:
        raise StaticPiqdRunnerError(f"{name} must be bytes")
    if len(raw) > _MAX_MANIFEST_BYTES:
        raise StaticPiqdRunnerError(f"{name} exceeds the byte bound")
    try:
        value = json.loads(
            raw,
            object_pairs_hook=_reject_duplicates,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise StaticPiqdRunnerError(f"{name} must be strict JSON: {exc}") from exc
    if type(value) is not dict:
        raise StaticPiqdRunnerError(f"{name} must be a JSON object")
    _bounded_json_shape(value)
    if canonical_json_bytes(value) != raw:
        raise StaticPiqdRunnerError(f"{name} must use canonical JSON bytes")
    return value


def _exact_keys(value: Mapping[str, Any], expected: frozenset[str], name: str) -> None:
    keys = frozenset(value)
    missing = sorted(expected - keys)
    extra = sorted(keys - expected)
    if missing or extra:
        raise StaticPiqdRunnerError(
            f"{name} keys mismatch: missing={missing}, extra={extra}"
        )


def _string(value: Any, name: str) -> str:
    if type(value) is not str or not value.strip():
        raise StaticPiqdRunnerError(f"{name} must be a non-empty string")
    return value


def _digest(value: Any, name: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in _HEX for character in value)
    ):
        raise StaticPiqdRunnerError(f"{name} must be a lowercase SHA-256 digest")
    return value


def _false_claims(value: Any, expected: frozenset[str], name: str) -> None:
    if type(value) is not dict:
        raise StaticPiqdRunnerError(f"{name} must be an object")
    _exact_keys(value, expected, name)
    for claim in sorted(expected):
        if value[claim] is not False:
            raise StaticPiqdRunnerError(f"{name}.{claim} must be false")


def authenticate_static_manifests(
    *, source_manifest: bytes, producer_manifest: bytes
) -> StaticManifestContract:
    """Validate exact schemas and bind the producer to the full source manifest."""

    source = _strict_canonical_object(source_manifest, name="source_manifest")
    producer = _strict_canonical_object(producer_manifest, name="producer_manifest")
    _exact_keys(source, _SOURCE_KEYS, "source_manifest")
    _exact_keys(producer, _PRODUCER_KEYS, "producer_manifest")
    if source["schema"] != SOURCE_SCHEMA:
        raise StaticPiqdRunnerError(f"source_manifest.schema must be {SOURCE_SCHEMA!r}")
    for source_field in (
        "source_id",
        "source_path",
        "finite_schema",
        "cardinality_scope",
        "source_theorem",
    ):
        _string(source[source_field], f"source_manifest.{source_field}")
    _digest(source["source_sha256"], "source_manifest.source_sha256")
    _false_claims(source["claims"], _SOURCE_CLAIMS, "source_manifest.claims")

    if producer["schema"] != PRODUCER_SCHEMA:
        raise StaticPiqdRunnerError(
            f"producer_manifest.schema must be {PRODUCER_SCHEMA!r}"
        )
    for producer_field in ("producer_id", "producer_kind"):
        _string(producer[producer_field], f"producer_manifest.{producer_field}")
    if producer["producer_kind"] != "static-dimacs":
        raise StaticPiqdRunnerError(
            "producer_manifest.producer_kind must be 'static-dimacs'"
        )
    if producer["backend"] != "cadical" or producer["solver_profile"] != "sat":
        raise StaticPiqdRunnerError(
            "producer_manifest must select the cadical/sat PIQD profile"
        )
    if producer["query_polarity"] not in {
        "SAT_MEANS_COUNTEREXAMPLE",
        "UNSAT_MEANS_OBSTRUCTION",
    }:
        raise StaticPiqdRunnerError("producer_manifest has invalid query_polarity")
    _digest(
        producer["variable_map_sha256"],
        "producer_manifest.variable_map_sha256",
    )
    source_hash = sha256_bytes(source_manifest)
    if producer["source_manifest_sha256"] != source_hash:
        raise StaticPiqdRunnerError(
            "producer_manifest.source_manifest_sha256 does not bind source_manifest"
        )
    if producer["source_manifest"] != source:
        raise StaticPiqdRunnerError(
            "producer_manifest.source_manifest does not equal source_manifest"
        )
    _false_claims(producer["claims"], _PRODUCER_CLAIMS, "producer_manifest.claims")
    return StaticManifestContract(
        source_bytes=source_manifest,
        producer_bytes=producer_manifest,
        source=source,
        producer=producer,
        source_sha256=source_hash,
        producer_sha256=sha256_bytes(producer_manifest),
    )


def _read_exact_cnf(path: Path, *, limit: int) -> bytes:
    """Capture one regular, singly linked CNF through a held absolute path chain."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    parts = absolute.parts
    if not parts or parts[0] != os.path.sep or len(parts) == 1:
        raise StaticPiqdRunnerError(
            "CNF path must name a file below the filesystem root"
        )

    directory_flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    file_flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
        | getattr(os, "O_NONBLOCK", 0)
    )
    directory_descriptors: list[int] = []
    directory_chain: list[tuple[int, str, int, os.stat_result]] = []
    descriptor: int | None = None
    try:
        try:
            root_descriptor = os.open(os.path.sep, directory_flags)
        except OSError as exc:
            raise StaticPiqdRunnerError(
                f"cannot anchor the CNF path without following links: {exc}"
            ) from exc
        directory_descriptors.append(root_descriptor)
        root_before = os.fstat(root_descriptor)
        if not stat.S_ISDIR(root_before.st_mode):
            raise StaticPiqdRunnerError("CNF filesystem root is not a directory")

        parent_descriptor = root_descriptor
        for component in parts[1:-1]:
            try:
                child_descriptor = os.open(
                    component, directory_flags, dir_fd=parent_descriptor
                )
            except OSError as exc:
                raise StaticPiqdRunnerError(
                    f"cannot open a CNF parent component without following links: {exc}"
                ) from exc
            directory_descriptors.append(child_descriptor)
            child_before = os.fstat(child_descriptor)
            if not stat.S_ISDIR(child_before.st_mode):
                raise StaticPiqdRunnerError(
                    "every CNF parent component must be a directory"
                )
            try:
                named_child = os.stat(
                    component, dir_fd=parent_descriptor, follow_symlinks=False
                )
            except OSError as exc:
                raise StaticPiqdRunnerError(
                    f"cannot authenticate a CNF parent component: {exc}"
                ) from exc
            if _inode_anchor(named_child) != _inode_anchor(child_before):
                raise StaticPiqdRunnerError(
                    "CNF parent component changed while it was being opened"
                )
            directory_chain.append(
                (parent_descriptor, component, child_descriptor, child_before)
            )
            parent_descriptor = child_descriptor

        try:
            descriptor = os.open(parts[-1], file_flags, dir_fd=parent_descriptor)
        except OSError as exc:
            raise StaticPiqdRunnerError(
                f"cannot open CNF without following links: {exc}"
            ) from exc
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode):
            raise StaticPiqdRunnerError("CNF path must name a regular file")
        if before.st_nlink != 1:
            raise StaticPiqdRunnerError("CNF input must have link count one")
        try:
            named_before = os.stat(
                parts[-1], dir_fd=parent_descriptor, follow_symlinks=False
            )
        except OSError as exc:
            raise StaticPiqdRunnerError(
                f"cannot authenticate the CNF input: {exc}"
            ) from exc
        if _file_identity(named_before) != _file_identity(before):
            raise StaticPiqdRunnerError("CNF input changed while it was being opened")
        if before.st_size > limit:
            raise StaticPiqdRunnerError("CNF exceeds the configured byte bound")

        chunks: list[bytes] = []
        remaining = limit + 1
        while remaining:
            chunk = os.read(descriptor, min(1 << 20, remaining))
            if not chunk:
                break
            chunks.append(chunk)
            remaining -= len(chunk)
        payload = b"".join(chunks)
        if len(payload) > limit:
            raise StaticPiqdRunnerError("CNF exceeds the configured byte bound")

        after = os.fstat(descriptor)
        if (
            _file_identity(before) != _file_identity(after)
            or after.st_nlink != 1
            or len(payload) != before.st_size
        ):
            raise StaticPiqdRunnerError("CNF changed while it was being snapshotted")

        root_after = os.fstat(root_descriptor)
        try:
            named_root = os.stat(os.path.sep, follow_symlinks=False)
        except OSError as exc:
            raise StaticPiqdRunnerError(
                f"cannot revalidate the CNF root: {exc}"
            ) from exc
        if _inode_anchor(root_before) != _inode_anchor(root_after) or _inode_anchor(
            named_root
        ) != _inode_anchor(root_after):
            raise StaticPiqdRunnerError("CNF filesystem root changed during capture")

        for (
            held_parent,
            component,
            held_child,
            child_before,
        ) in directory_chain:
            child_after = os.fstat(held_child)
            try:
                named_child = os.stat(
                    component, dir_fd=held_parent, follow_symlinks=False
                )
            except OSError as exc:
                raise StaticPiqdRunnerError(
                    f"CNF parent component disappeared during capture: {exc}"
                ) from exc
            if _inode_anchor(child_before) != _inode_anchor(
                child_after
            ) or _inode_anchor(named_child) != _inode_anchor(child_after):
                raise StaticPiqdRunnerError(
                    "CNF parent component changed or was repointed during capture"
                )

        final_after = os.fstat(descriptor)
        try:
            named_after = os.stat(
                parts[-1], dir_fd=parent_descriptor, follow_symlinks=False
            )
        except OSError as exc:
            raise StaticPiqdRunnerError(
                f"CNF input disappeared during final revalidation: {exc}"
            ) from exc
        if (
            _file_identity(after) != _file_identity(final_after)
            or _file_identity(named_after) != _file_identity(final_after)
            or final_after.st_nlink != 1
        ):
            raise StaticPiqdRunnerError(
                "CNF input changed or was repointed during final revalidation"
            )
        return payload
    except StaticPiqdRunnerError:
        raise
    except OSError as exc:
        raise StaticPiqdRunnerError(f"CNF capture failed: {exc}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        for directory_descriptor in reversed(directory_descriptors):
            os.close(directory_descriptor)


def _file_identity(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _inode_anchor(info: os.stat_result) -> tuple[int, int, int]:
    return info.st_dev, info.st_ino, stat.S_IFMT(info.st_mode)


def _open_directory_nofollow(path: Path, *, create: bool) -> int:
    """Open an absolute directory component by component, creating as needed."""

    absolute = Path(os.path.abspath(path))
    descriptor = os.open("/", os.O_RDONLY | os.O_DIRECTORY)
    try:
        for component in absolute.parts[1:]:
            if component in {"", ".", ".."}:
                raise StaticPiqdRunnerError("journal_root has an unsafe component")
            try:
                child = os.open(
                    component,
                    os.O_RDONLY
                    | os.O_DIRECTORY
                    | getattr(os, "O_NOFOLLOW", 0)
                    | getattr(os, "O_CLOEXEC", 0),
                    dir_fd=descriptor,
                )
            except FileNotFoundError:
                if not create:
                    raise
                try:
                    os.mkdir(component, 0o700, dir_fd=descriptor)
                except FileExistsError:
                    pass
                child = os.open(
                    component,
                    os.O_RDONLY
                    | os.O_DIRECTORY
                    | getattr(os, "O_NOFOLLOW", 0)
                    | getattr(os, "O_CLOEXEC", 0),
                    dir_fd=descriptor,
                )
            os.close(descriptor)
            descriptor = child
        return descriptor
    except OSError as exc:
        os.close(descriptor)
        raise StaticPiqdRunnerError(
            "journal_root is missing, unsafe, or contains a symlink"
        ) from exc
    except Exception:
        os.close(descriptor)
        raise


def _open_or_create_directory_nofollow(path: Path) -> int:
    return _open_directory_nofollow(path, create=True)


def _descriptor_rooted_directory(descriptor: int) -> Path:
    """Return a descendant path tied to the held directory inode."""

    anchor = _inode_anchor(os.fstat(descriptor))
    candidates = [
        (Path("/.vol") / str(anchor[0]) / str(anchor[1]), True),
        (Path("/proc/self/fd") / str(descriptor), False),
    ]
    for candidate, final_nofollow in candidates:
        flags = os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_CLOEXEC", 0)
        if final_nofollow:
            flags |= getattr(os, "O_NOFOLLOW", 0)
        try:
            check = os.open(candidate, flags)
        except OSError:
            continue
        try:
            if _inode_anchor(os.fstat(check)) == anchor:
                return candidate
        finally:
            os.close(check)
    raise StaticPiqdRunnerError(
        "platform lacks a verified descriptor-rooted attempt-directory path"
    )


def _capture_file_at(
    directory_fd: int,
    name: str,
    *,
    maximum_bytes: int,
    allow_empty: bool = False,
    expected_identity: tuple[int, ...] | None = None,
) -> tuple[bytes, tuple[int, ...]]:
    if name in {"", ".", ".."} or Path(name).name != name:
        raise StaticPiqdRunnerError("unsafe custody filename")
    try:
        descriptor = os.open(
            name,
            os.O_RDONLY
            | os.O_NONBLOCK
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0),
            dir_fd=directory_fd,
        )
    except OSError as exc:
        raise StaticPiqdRunnerError(f"cannot safely open custody file {name}") from exc
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise StaticPiqdRunnerError(f"{name} is not a private regular file")
        if before.st_size > maximum_bytes or (before.st_size == 0 and not allow_empty):
            raise StaticPiqdRunnerError(f"{name} has a forbidden size")
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(
                descriptor,
                min(1024 * 1024, maximum_bytes + 1 - total),
            )
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
            if total > maximum_bytes:
                raise StaticPiqdRunnerError(f"{name} exceeds its size bound")
        after = os.fstat(descriptor)
        pathname = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        identity = _file_identity(after)
        if _file_identity(before) != identity:
            raise StaticPiqdRunnerError(f"{name} changed while being snapshotted")
        if _file_identity(pathname) != identity:
            raise StaticPiqdRunnerError(f"{name} was substituted")
        if expected_identity is not None and identity != expected_identity:
            raise StaticPiqdRunnerError(f"{name} inode identity changed")
        payload = b"".join(chunks)
        if len(payload) != after.st_size:
            raise StaticPiqdRunnerError(f"{name} was only partly read")
        return payload, identity
    finally:
        os.close(descriptor)


def _write_once_at(directory_fd: int, name: str, payload: bytes) -> tuple[int, ...]:
    if type(payload) is not bytes or not payload:
        raise StaticPiqdRunnerError(
            "create-once custody payload must be nonempty bytes"
        )
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0),
            0o600,
            dir_fd=directory_fd,
        )
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            if written <= 0:
                raise OSError("custody write made no progress")
            offset += written
        os.fsync(descriptor)
        identity = _file_identity(os.fstat(descriptor))
    except OSError as exc:
        raise StaticPiqdRunnerError(
            f"custody output {name} already exists or is unsafe"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
    os.fsync(directory_fd)
    installed, installed_identity = _capture_file_at(
        directory_fd,
        name,
        maximum_bytes=len(payload),
        expected_identity=identity,
    )
    if installed != payload:
        raise StaticPiqdRunnerError(f"installed custody output {name} changed")
    return installed_identity


def _remove_reserved_attempt(root_fd: int, name: str, directory_fd: int) -> bool:
    """Remove one exact, not-yet-published reservation without following links."""

    try:
        entries = sorted(os.listdir(directory_fd))
        for entry in entries:
            info = os.stat(entry, dir_fd=directory_fd, follow_symlinks=False)
            if stat.S_ISDIR(info.st_mode):
                artifact_fd = os.open(
                    entry,
                    os.O_RDONLY
                    | os.O_DIRECTORY
                    | getattr(os, "O_NOFOLLOW", 0)
                    | getattr(os, "O_CLOEXEC", 0),
                    dir_fd=directory_fd,
                )
                try:
                    for artifact in os.listdir(artifact_fd):
                        artifact_info = os.stat(
                            artifact, dir_fd=artifact_fd, follow_symlinks=False
                        )
                        if stat.S_ISDIR(artifact_info.st_mode):
                            return False
                        os.unlink(artifact, dir_fd=artifact_fd)
                    os.fsync(artifact_fd)
                finally:
                    os.close(artifact_fd)
                os.rmdir(entry, dir_fd=directory_fd)
            else:
                os.unlink(entry, dir_fd=directory_fd)
        os.fsync(directory_fd)
        os.rmdir(name, dir_fd=root_fd)
        os.fsync(root_fd)
        return True
    except (OSError, StaticPiqdRunnerError):
        return False


@dataclass
class _AttemptCustody:
    root_fd: int
    public_root: Path
    directory_name: str
    directory_fd: int
    journal_fd: int
    lock_fd: int
    artifact_fd: int
    capability_path: Path
    directory_anchor: tuple[int, int, int]
    closed: bool = False

    @property
    def public_directory(self) -> Path:
        return self.public_root / self.directory_name

    @property
    def public_journal(self) -> Path:
        return self.public_directory / _JOURNAL_NAME

    def _require_directory_binding(self) -> None:
        public_root_fd = _open_directory_nofollow(self.public_root, create=False)
        try:
            if _inode_anchor(os.fstat(public_root_fd)) != _inode_anchor(
                os.fstat(self.root_fd)
            ):
                raise StaticPiqdRunnerError("journal_root pathname was substituted")
        finally:
            os.close(public_root_fd)
        held = _inode_anchor(os.fstat(self.directory_fd))
        try:
            named = os.stat(
                self.directory_name,
                dir_fd=self.root_fd,
                follow_symlinks=False,
            )
        except OSError as exc:
            raise StaticPiqdRunnerError(
                "attempt directory pathname disappeared"
            ) from exc
        if (
            held != self.directory_anchor
            or _inode_anchor(named) != self.directory_anchor
        ):
            raise StaticPiqdRunnerError("attempt directory pathname was substituted")

    def require_held_file(self, name: str, descriptor: int) -> None:
        self._require_directory_binding()
        held = os.fstat(descriptor)
        try:
            named = os.stat(name, dir_fd=self.directory_fd, follow_symlinks=False)
        except OSError as exc:
            raise StaticPiqdRunnerError(
                f"held custody file {name} disappeared"
            ) from exc
        if (
            not stat.S_ISREG(held.st_mode)
            or held.st_nlink != 1
            or _inode_anchor(held) != _inode_anchor(named)
        ):
            raise StaticPiqdRunnerError(f"held custody file {name} was substituted")

    def require_held_directory(self, name: str, descriptor: int) -> None:
        self._require_directory_binding()
        held = os.fstat(descriptor)
        try:
            named = os.stat(name, dir_fd=self.directory_fd, follow_symlinks=False)
        except OSError as exc:
            raise StaticPiqdRunnerError(
                f"held custody directory {name} disappeared"
            ) from exc
        if (
            not stat.S_ISDIR(held.st_mode)
            or held.st_nlink < 1
            or _inode_anchor(held) != _inode_anchor(named)
        ):
            raise StaticPiqdRunnerError(
                f"held custody directory {name} was substituted"
            )

    def close(self) -> None:
        if self.closed:
            return
        for descriptor in (
            self.artifact_fd,
            self.lock_fd,
            self.journal_fd,
            self.directory_fd,
        ):
            try:
                os.close(descriptor)
            except OSError:
                pass
        self.closed = True

    def cleanup_for_retry(self) -> bool:
        """Remove only this reserved attempt through held descriptors."""

        try:
            self._require_directory_binding()
            for descriptor in (self.artifact_fd, self.lock_fd, self.journal_fd):
                try:
                    os.close(descriptor)
                except OSError:
                    pass
            if not _remove_reserved_attempt(
                self.root_fd, self.directory_name, self.directory_fd
            ):
                return False
            os.close(self.directory_fd)
            self.closed = True
            return True
        except (OSError, StaticPiqdRunnerError):
            return False


class _CustodiedAttemptJournal(DurableAttemptJournal):
    """DurableAttemptJournal format with descriptor-rooted filesystem I/O."""

    def __init__(
        self,
        custody: _AttemptCustody,
        *,
        manifest: Mapping[str, Any],
        max_artifact_bytes: int,
    ) -> None:
        validate_wave_manifest(manifest)
        self.custody = custody
        self.path = custody.capability_path / _JOURNAL_NAME
        self.manifest = dict(manifest)
        self.artifact_dir = custody.capability_path / _ARTIFACT_DIRECTORY_NAME
        self.seal_path = custody.capability_path / _DRIVER_SEAL_NAME
        self.lock_path = custody.capability_path / _LOCK_NAME
        self._raw = b""
        self.records: list[dict[str, Any]] = []
        self._seal: dict[str, Any] | None = None
        self._max_artifact_bytes = max_artifact_bytes
        self._artifact_identities: dict[str, tuple[int, ...]] = {}
        custody.require_held_file(_JOURNAL_NAME, custody.journal_fd)
        custody.require_held_file(_LOCK_NAME, custody.lock_fd)

    @contextmanager
    def _exclusive_lock(self) -> Iterator[None]:
        self.custody.require_held_file(_LOCK_NAME, self.custody.lock_fd)
        fcntl.flock(self.custody.lock_fd, fcntl.LOCK_EX)
        try:
            yield
        finally:
            try:
                self.custody.require_held_file(_LOCK_NAME, self.custody.lock_fd)
            finally:
                fcntl.flock(self.custody.lock_fd, fcntl.LOCK_UN)

    def _require_artifact(self, digest: Any, *, source: str) -> str:
        value = self._validate_digest(digest, source=source)
        expected = self._artifact_identities.get(value)
        payload, identity = _capture_file_at(
            self.custody.artifact_fd,
            value,
            maximum_bytes=self._max_artifact_bytes,
            allow_empty=True,
            expected_identity=expected,
        )
        if sha256_bytes(payload) != value:
            raise PiqdDriverError(f"{source} artifact hash mismatch")
        self._artifact_identities.setdefault(value, identity)
        return value

    def store_artifact(self, payload: bytes) -> str:
        if type(payload) is not bytes or len(payload) > self._max_artifact_bytes:
            raise PiqdDriverError("artifact is not bounded built-in bytes")
        digest = sha256_bytes(payload)
        try:
            os.stat(digest, dir_fd=self.custody.artifact_fd, follow_symlinks=False)
        except FileNotFoundError:
            identity = _write_once_at(self.custody.artifact_fd, digest, payload)
            self._artifact_identities[digest] = identity
        self._require_artifact(digest, source="stored")
        return digest

    def append_event(
        self,
        *,
        event: Mapping[str, Any],
        outcome: str,
        detail: str | None,
        artifact_overrides: Mapping[str, str | None] | None = None,
    ) -> dict[str, Any]:
        _validate_event(event)
        try:
            event_bytes = canonical_json_bytes(event)
        except (TypeError, ValueError) as exc:
            raise PiqdDriverError("piqd event is not canonical JSON data") from exc
        with self._exclusive_lock():
            if self._seal is not None:
                raise PiqdDriverError("a sealed attempt journal cannot be extended")
            try:
                os.stat(
                    _DRIVER_SEAL_NAME,
                    dir_fd=self.custody.directory_fd,
                    follow_symlinks=False,
                )
            except FileNotFoundError:
                pass
            else:
                raise PiqdDriverError("a sealed attempt journal cannot be extended")
            return self._append_event_locked(
                event_bytes=event_bytes,
                outcome=outcome,
                detail=detail,
                artifact_overrides=artifact_overrides,
            )

    def _append_serialized(self, record: Mapping[str, Any], serialized: bytes) -> None:
        self.custody.require_held_file(_JOURNAL_NAME, self.custody.journal_fd)
        descriptor = self.custody.journal_fd
        fcntl.flock(descriptor, fcntl.LOCK_EX)
        try:
            os.lseek(descriptor, 0, os.SEEK_SET)
            chunks: list[bytes] = []
            total = 0
            while True:
                chunk = os.read(
                    descriptor, min(1024 * 1024, _MAX_JOURNAL_BYTES + 1 - total)
                )
                if not chunk:
                    break
                chunks.append(chunk)
                total += len(chunk)
                if total > _MAX_JOURNAL_BYTES:
                    raise PiqdDriverError("attempt journal exceeds its byte bound")
            if b"".join(chunks) != self._raw:
                raise PiqdDriverError("attempt journal changed since it was opened")
            if len(self._raw) + len(serialized) > _MAX_JOURNAL_BYTES:
                raise PiqdDriverError("attempt journal exceeds its byte bound")
            os.lseek(descriptor, 0, os.SEEK_END)
            offset = 0
            while offset < len(serialized):
                written = os.write(descriptor, serialized[offset:])
                if written <= 0:
                    raise OSError("journal write made no progress")
                offset += written
            os.fsync(descriptor)
            self.custody.require_held_file(_JOURNAL_NAME, descriptor)
        finally:
            fcntl.flock(descriptor, fcntl.LOCK_UN)
        self._raw += serialized
        self.records.append(dict(record))

    def _load_existing_seal(self) -> dict[str, Any] | None:
        try:
            raw, _identity = _capture_file_at(
                self.custody.directory_fd,
                _DRIVER_SEAL_NAME,
                maximum_bytes=_MAX_CONTROL_RESPONSE_BYTES,
            )
        except StaticPiqdRunnerError:
            try:
                os.stat(
                    _DRIVER_SEAL_NAME,
                    dir_fd=self.custody.directory_fd,
                    follow_symlinks=False,
                )
            except FileNotFoundError:
                return None
            raise
        if not raw.endswith(b"\n"):
            raise PiqdDriverError("journal seal is not newline-terminated")
        try:
            seal = _strict_canonical_object(raw[:-1], name="journal_seal")
        except StaticPiqdRunnerError as exc:
            raise PiqdDriverError(str(exc)) from exc
        expected_keys = {
            "schema",
            "wave_manifest_sha256",
            "record_count",
            "terminal_attempt_sha256",
            "journal_sha256",
            "seal_sha256",
        }
        if set(seal) != expected_keys or seal.get("schema") != SEAL_SCHEMA:
            raise PiqdDriverError("journal seal shape changed")
        unsigned = dict(seal)
        claimed = unsigned.pop("seal_sha256")
        if claimed != sha256_json(unsigned):
            raise PiqdDriverError("journal seal hash mismatch")
        terminal = self.records[-1]["record_sha256"] if self.records else None
        expected = {
            "wave_manifest_sha256": wave_manifest_sha256(self.manifest),
            "record_count": len(self.records),
            "terminal_attempt_sha256": terminal,
            "journal_sha256": sha256_bytes(self._raw),
        }
        if any(seal.get(key) != value for key, value in expected.items()):
            raise PiqdDriverError("journal seal does not bind current journal")
        return seal

    def seal(self) -> dict[str, Any]:
        with self._exclusive_lock():
            raw, _identity = _capture_file_at(
                self.custody.directory_fd,
                _JOURNAL_NAME,
                maximum_bytes=_MAX_JOURNAL_BYTES,
                allow_empty=True,
            )
            if raw != self._raw:
                raise PiqdDriverError("attempt journal changed before sealing")
            self._validate_archived_artifacts()
            current = self._load_existing_seal()
            if self._seal is not None:
                if current != self._seal:
                    raise PiqdDriverError("journal seal changed after validation")
                return dict(self._seal)
            if current is not None:
                self._seal = current
                return dict(current)
            terminal = validate_attempt_journal(
                self.records,
                manifest=self.manifest,
                expected_record_count=len(self.records),
                expected_terminal_sha256=(
                    self.records[-1]["record_sha256"] if self.records else None
                ),
            )
            unsigned = {
                "schema": SEAL_SCHEMA,
                "wave_manifest_sha256": wave_manifest_sha256(self.manifest),
                "record_count": len(self.records),
                "terminal_attempt_sha256": terminal,
                "journal_sha256": sha256_bytes(self._raw),
            }
            seal = {**unsigned, "seal_sha256": sha256_json(unsigned)}
            _write_once_at(
                self.custody.directory_fd,
                _DRIVER_SEAL_NAME,
                canonical_json_bytes(seal) + b"\n",
            )
            self._seal = seal
            return seal

    def custody_inventory(self) -> dict[str, Any]:
        self.custody._require_directory_binding()
        self.custody.require_held_directory(
            _ARTIFACT_DIRECTORY_NAME, self.custody.artifact_fd
        )
        journal_raw, journal_identity = _capture_file_at(
            self.custody.directory_fd,
            _JOURNAL_NAME,
            maximum_bytes=_MAX_JOURNAL_BYTES,
            allow_empty=True,
        )
        self.custody.require_held_file(_JOURNAL_NAME, self.custody.journal_fd)
        _lock_raw, lock_identity = _capture_file_at(
            self.custody.directory_fd,
            _LOCK_NAME,
            maximum_bytes=1,
            allow_empty=True,
        )
        self.custody.require_held_file(_LOCK_NAME, self.custody.lock_fd)
        artifacts: list[dict[str, Any]] = []
        names = sorted(os.listdir(self.custody.artifact_fd))
        if set(names) != set(self._artifact_identities):
            raise StaticPiqdRunnerError("artifact directory contains untracked entries")
        for name in names:
            payload, identity = _capture_file_at(
                self.custody.artifact_fd,
                name,
                maximum_bytes=self._max_artifact_bytes,
                allow_empty=True,
                expected_identity=self._artifact_identities[name],
            )
            if sha256_bytes(payload) != name:
                raise StaticPiqdRunnerError("artifact filename/hash mismatch")
            artifacts.append(
                {
                    "sha256": name,
                    "size": len(payload),
                    "device": identity[0],
                    "inode": identity[1],
                }
            )
        driver_seal = self._load_existing_seal()
        driver_seal_raw = None
        if driver_seal is not None:
            driver_seal_raw, _seal_identity = _capture_file_at(
                self.custody.directory_fd,
                _DRIVER_SEAL_NAME,
                maximum_bytes=_MAX_CONTROL_RESPONSE_BYTES,
            )
        return {
            "journal_sha256": sha256_bytes(journal_raw),
            "journal_size": len(journal_raw),
            "journal_device": journal_identity[0],
            "journal_inode": journal_identity[1],
            "lock_device": lock_identity[0],
            "lock_inode": lock_identity[1],
            "driver_seal_sha256": (
                None if driver_seal_raw is None else sha256_bytes(driver_seal_raw)
            ),
            "artifacts": artifacts,
        }


@dataclass(frozen=True)
class _RawStatusCapture:
    job_id: str
    body: bytes
    sha256: str


@dataclass(frozen=True)
class _StatusObservation:
    payload: dict[str, Any]
    raw: _RawStatusCapture
    artifact_sha256: str
    exposed_identity_fields: tuple[str, ...]


def _bounded_response_shape(value: Any) -> None:
    pending: list[tuple[Any, int]] = [(value, 0)]
    nodes = 0
    while pending:
        item, depth = pending.pop()
        if depth > _MAX_RESPONSE_JSON_DEPTH:
            raise OSError("PIQD JSON response exceeds the depth bound")
        nodes += 1
        if nodes > _MAX_RESPONSE_JSON_NODES:
            raise OSError("PIQD JSON response exceeds the node bound")
        if type(item) is dict:
            pending.extend((child, depth + 1) for child in item.values())
        elif type(item) is list:
            pending.extend((child, depth + 1) for child in item)


def _validate_json_response_body(body: bytes) -> None:
    try:
        value = json.loads(
            body,
            object_pairs_hook=_reject_duplicates,
            parse_constant=_reject_constant,
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise OSError("PIQD returned malformed strict JSON") from exc
    if type(value) is not dict:
        raise OSError("PIQD JSON response must be a built-in object")
    _bounded_response_shape(value)


def _header_values(headers: Mapping[str, str], name: str) -> list[str]:
    return [str(value) for key, value in headers.items() if key.lower() == name]


def _send_multipart(
    connection: http.client.HTTPConnection, body: MultipartBody
) -> None:
    if connection.sock is None:
        raise OSError("HTTP connection has no socket for multipart body")
    sent_total = 0
    for segment in body.segments:
        view = memoryview(segment)
        while view:
            sent = connection.sock.send(view)
            if type(sent) is not int or sent <= 0:
                raise OSError("short multipart transport write")
            sent_total += sent
            view = view[sent:]
    if sent_total != body.content_length:
        raise OSError("multipart transport length mismatch")


def _stdlib_request_bounded(
    method: str,
    url: str,
    body: bytes | MultipartBody | None,
    headers: Mapping[str, str],
    *,
    maximum_bytes: int,
) -> HttpResponse:
    parsed = urllib.parse.urlsplit(url)
    if parsed.scheme not in {"http", "https"} or not parsed.hostname:
        raise OSError(f"unsupported PIQD URL: {url}")
    try:
        port = parsed.port
    except ValueError as exc:
        raise OSError(f"invalid PIQD URL port: {url}") from exc
    connection_type = (
        http.client.HTTPSConnection
        if parsed.scheme == "https"
        else http.client.HTTPConnection
    )
    connection = connection_type(parsed.hostname, port=port, timeout=60.0)
    try:
        target = parsed.path or "/"
        if parsed.query:
            target = f"{target}?{parsed.query}"
        if isinstance(body, MultipartBody):
            lengths = _header_values(headers, "content-length")
            if lengths != [str(body.content_length)]:
                raise OSError("multipart Content-Length is not exact")
            connection.putrequest(method, target, skip_accept_encoding=True)
            for name, value in headers.items():
                connection.putheader(name, value)
            connection.endheaders()
            _send_multipart(connection, body)
        else:
            connection.request(method, target, body=body, headers=dict(headers))
        response = connection.getresponse()
        response_body = response.read(maximum_bytes + 1)
        if len(response_body) > maximum_bytes:
            raise OSError("PIQD response exceeds the adapter byte bound")
        return HttpResponse(
            response.status,
            response_body,
            dict(response.getheaders()),
        )
    except http.client.HTTPException as exc:
        raise OSError(f"PIQD HTTP transport failed: {exc}") from exc
    finally:
        connection.close()


class _BoundedRecordingTransport:
    """Exact endpoint allowlist, response bounds, and raw status capture."""

    def __init__(
        self,
        *,
        base_url: str,
        upstream: Transport | None,
        max_cnf_bytes: int,
    ) -> None:
        parsed = urllib.parse.urlsplit(base_url.rstrip("/"))
        self._origin = (parsed.scheme, parsed.netloc)
        self._upstream = upstream
        self._max_cnf_bytes = max_cnf_bytes
        self._job_id: str | None = None
        self._status_captures: list[_RawStatusCapture] = []
        self.endpoint_trace: list[dict[str, str]] = []

    def bind_job(self, job_id: str) -> None:
        allowed = frozenset(
            "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_."
        )
        if not job_id or any(char not in allowed for char in job_id):
            raise PiqdOracleError("PIQD job id is not a safe path component")
        if self._job_id is not None and self._job_id != job_id:
            raise PiqdOracleError("transport cannot be rebound to a crossed job")
        self._job_id = job_id

    def consume_status(self, job_id: str) -> _RawStatusCapture:
        if not self._status_captures:
            raise PiqdOracleError("status raw bytes were not captured")
        capture = self._status_captures.pop(0)
        if capture.job_id != job_id:
            raise PiqdOracleError("captured status bytes belong to a crossed job")
        return capture

    def _route(self, method: str, parsed: urllib.parse.SplitResult) -> tuple[str, int]:
        if (parsed.scheme, parsed.netloc) != self._origin:
            raise OSError("PIQD request crossed the configured origin")
        if method == "POST" and parsed.path == "/jobs/prepare-cnf" and not parsed.query:
            if self._job_id is not None:
                raise OSError("one attempt cannot issue a second prepare request")
            return "json", _MAX_CONTROL_RESPONSE_BYTES
        job_id = self._job_id
        if job_id is None:
            raise OSError("post-prepare PIQD request has no bound job")
        root = f"/jobs/{job_id}"
        if method == "GET" and parsed.path == f"{root}/cnf" and not parsed.query:
            return "binary", self._max_cnf_bytes
        if method == "POST" and parsed.path == "/jobs/confirm":
            if urllib.parse.parse_qs(parsed.query, strict_parsing=True) != {
                "job_id": [job_id]
            }:
                raise OSError("confirm query is not scoped to the prepared job")
            return "json", _MAX_CONTROL_RESPONSE_BYTES
        if method == "GET" and parsed.path == root and not parsed.query:
            return "status", _MAX_CONTROL_RESPONSE_BYTES
        if method == "GET" and parsed.path == f"{root}/model" and not parsed.query:
            return "json", _MAX_MODEL_RESPONSE_BYTES
        if method == "GET" and parsed.path == f"{root}/log":
            query = urllib.parse.parse_qs(parsed.query, strict_parsing=True)
            if set(query) != {"from", "max"} or query["max"] != ["1048576"]:
                raise OSError("log query is not the bounded same-job shape")
            try:
                offset = int(query["from"][0])
            except (ValueError, IndexError) as exc:
                raise OSError("log offset is invalid") from exc
            if offset < 0:
                raise OSError("log offset is negative")
            return "log", 1024 * 1024
        if parsed.path == f"{root}/proof":
            raise OSError("static discovery forbids the PIQD proof endpoint")
        raise OSError("PIQD endpoint is outside the static adapter allowlist")

    def __call__(
        self,
        method: str,
        url: str,
        body: bytes | MultipartBody | None,
        headers: Mapping[str, str],
    ) -> HttpResponse:
        if type(method) is not str or type(url) is not str or type(headers) is not dict:
            raise OSError("PIQD transport request types are invalid")
        parsed = urllib.parse.urlsplit(url)
        kind, maximum_bytes = self._route(method, parsed)
        target = parsed.path + (f"?{parsed.query}" if parsed.query else "")
        self.endpoint_trace.append({"method": method, "target": target})
        if self._upstream is None:
            response = _stdlib_request_bounded(
                method,
                url,
                body,
                headers,
                maximum_bytes=maximum_bytes,
            )
        else:
            response = self._upstream(method, url, body, headers)
        if type(response) is not HttpResponse:
            raise OSError("PIQD transport did not return HttpResponse")
        if type(response.status) is not int or not 100 <= response.status <= 599:
            raise OSError("PIQD HTTP status is not a valid built-in integer")
        if type(response.body) is not bytes or len(response.body) > maximum_bytes:
            raise OSError("PIQD response body is not bounded built-in bytes")
        if type(response.headers) is not dict or any(
            type(key) is not str or type(value) is not str
            for key, value in response.headers.items()
        ):
            raise OSError("PIQD response headers are not a built-in string map")
        if kind == "log":
            totals = _header_values(response.headers, "x-log-size-bytes")
            if len(totals) == 1:
                try:
                    total = int(totals[0])
                except ValueError as exc:
                    raise OSError("PIQD log total is invalid") from exc
                if total < 0 or total > _MAX_LOG_BYTES:
                    raise OSError("PIQD log total exceeds the adapter byte bound")
        if response.status == 200:
            content_types = _header_values(response.headers, "content-type")
            if len(content_types) != 1:
                raise OSError("PIQD success response needs exactly one Content-Type")
            media_type = content_types[0].split(";", 1)[0].strip().lower()
            expected = {
                "json": "application/json",
                "status": "application/json",
                "binary": "application/octet-stream",
                "log": "text/plain",
            }[kind]
            if media_type != expected:
                raise OSError("PIQD success response has the wrong Content-Type")
            if kind in {"json", "status"}:
                _validate_json_response_body(response.body)
        if kind == "status" and response.status == 200:
            assert self._job_id is not None
            self._status_captures.append(
                _RawStatusCapture(
                    self._job_id,
                    response.body,
                    sha256_bytes(response.body),
                )
            )
        return response


class _RecordingClient:
    def __init__(
        self,
        client: PiqdRawDimacsClient,
        *,
        transport: _BoundedRecordingTransport,
        journal: _CustodiedAttemptJournal,
        project: str,
    ) -> None:
        self.client = client
        self.transport = transport
        self.journal = journal
        self.project = project
        self.prepared_job: PreparedJob | None = None
        self.checked: CheckedModel | None = None
        self.status_responses: list[_StatusObservation] = []
        self.raw_status_responses: list[tuple[_RawStatusCapture, str]] = []

    def _same_job(self, job: PreparedJob) -> None:
        if self.prepared_job is None or job != self.prepared_job:
            raise PiqdOracleError(
                "PIQD artifact read is not scoped to the prepared job"
            )

    def _same_job_id(self, job_id: str) -> None:
        if (
            self.prepared_job is None
            or type(job_id) is not str
            or job_id != self.prepared_job.job_id
        ):
            raise PiqdOracleError("PIQD status read is not scoped to the prepared job")

    def prepare_cnf(self, **kwargs: Any) -> PreparedJob:
        job = self.client.prepare_cnf(**kwargs)
        if self.prepared_job is not None:
            raise PiqdOracleError(
                "one static attempt cannot prepare multiple PIQD jobs"
            )
        self.prepared_job = job
        self.transport.bind_job(job.job_id)
        return job

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str:
        self._same_job(job)
        return self.client.confirm(job, expected_cnf=expected_cnf)

    def status(self, job_id: str) -> Mapping[str, Any]:
        self._same_job_id(job_id)
        try:
            payload = self.client.status(job_id)
        except Exception:
            try:
                raw = self.transport.consume_status(job_id)
            except PiqdOracleError:
                pass
            else:
                artifact = self.journal.store_artifact(raw.body)
                self.raw_status_responses.append((raw, artifact))
            raise
        if type(payload) is not dict:
            raise PiqdOracleError("PIQD status response must be a built-in object")
        raw = self.transport.consume_status(job_id)
        artifact = self.journal.store_artifact(raw.body)
        self.raw_status_responses.append((raw, artifact))
        if artifact != raw.sha256:
            raise PiqdOracleError("raw status archive hash changed")
        assert self.prepared_job is not None
        expected = {
            "backend": self.prepared_job.backend,
            "solver_profile": self.prepared_job.solver_profile,
            "project": self.project,
            "identity_hash": self.prepared_job.identity_hash,
            "cnf_blob_hash": self.prepared_job.cnf_blob_hash,
        }
        exposed: list[str] = []
        for identity_field, value in expected.items():
            if identity_field in payload:
                exposed.append(identity_field)
                if (
                    type(payload[identity_field]) is not str
                    or payload[identity_field] != value
                ):
                    raise PiqdOracleError(
                        f"PIQD status response has crossed {identity_field} identity"
                    )
        self.status_responses.append(
            _StatusObservation(dict(payload), raw, artifact, tuple(sorted(exposed)))
        )
        return payload

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel:
        self._same_job(job)
        checked = self.client.checked_model(job, cnf=cnf)
        artifact = self.journal.store_artifact(checked.response_body)
        if artifact != checked.response_sha256:
            raise PiqdOracleError("raw model-response archive hash changed")
        self.checked = checked
        return checked

    def log(self, job: PreparedJob) -> tuple[bytes, str]:
        self._same_job(job)
        return self.client.log(job)

    def proof(self, job: PreparedJob) -> tuple[bytes, str]:
        self._same_job(job)
        raise PiqdOracleError("static discovery must not retrieve a proof endpoint")


def _terminal_status(
    responses: list[_StatusObservation],
) -> _StatusObservation | None:
    for observation in reversed(responses):
        if observation.payload.get("status") in {"completed", "failed"}:
            return observation
    return None


def _status_assessment(payload: dict[str, Any] | None) -> tuple[str, str]:
    if payload is None:
        return INVALID_STATUS_ATTESTATION, "no terminal status response was observed"
    if type(payload.get("id")) is not str:
        return INVALID_STATUS_ATTESTATION, "terminal status id is not a string"
    status = payload.get("status")
    result = payload.get("result")
    if type(status) is not str or status not in {"completed", "failed"}:
        return INVALID_STATUS_ATTESTATION, "terminal lifecycle status is invalid"
    if type(result) is not str or result not in {"SAT", "UNSAT", "UNKNOWN"}:
        return INVALID_STATUS_ATTESTATION, "terminal solver result is invalid"
    if "requested_core_limit" not in payload:
        return (
            INVALID_STATUS_ATTESTATION,
            "requested_core_limit must be present as request metadata",
        )
    requested_core_limit = payload["requested_core_limit"]
    if requested_core_limit is not None and (
        type(requested_core_limit) is not int or requested_core_limit != 1
    ):
        return (
            INVALID_STATUS_ATTESTATION,
            "requested_core_limit must be null or the exact built-in integer one",
        )
    progress = payload.get("progress")
    if type(progress) is not dict:
        return INVALID_STATUS_ATTESTATION, "progress must be a built-in object"
    solver_started = progress.get("solver_started")
    if type(solver_started) is not bool:
        return (
            INVALID_STATUS_ATTESTATION,
            "progress.solver_started must be a built-in boolean",
        )
    processes = payload.get("attested_solver_processes")
    if type(processes) is not int:
        return (
            INVALID_STATUS_ATTESTATION,
            "attested_solver_processes must be a built-in integer",
        )
    basis = payload.get("attestation_basis")
    if type(basis) is not str:
        return INVALID_STATUS_ATTESTATION, "attestation_basis must be a string"

    # Classification is driven by the run-written basis/process count pair and
    # the echoed one-core request. Lifecycle, result, and progress must agree.
    if processes == 0 and basis == _NO_SOLVER_ATTESTATION_BASIS:
        if solver_started is not False or result != "UNKNOWN":
            return (
                INVALID_STATUS_ATTESTATION,
                "no-solver attestation disagrees with progress or result",
            )
        return DEPLOYMENT_NO_SOLVER, "PIQD attests that no solver process started"
    if processes == 1 and basis == _STARTED_ATTESTATION_BASIS:
        if requested_core_limit is None:
            return (
                INVALID_STATUS_ATTESTATION,
                "started solver requires exact built-in requested_core_limit=1",
            )
        if solver_started is not True:
            return (
                INVALID_STATUS_ATTESTATION,
                "started-solver attestation disagrees with progress",
            )
        if result == "UNKNOWN":
            return SOLVER_UNKNOWN, "one solver process started and returned UNKNOWN"
        return ATTESTED_SOLVER_RESULT, f"one solver process returned {result}"
    return (
        INVALID_STATUS_ATTESTATION,
        "terminal lifecycle/result and solver-start attestation disagree",
    )


class StaticPiqdSolverRunner:
    """Injected callable with the legacy ``SolverRunner`` signature."""

    def __init__(
        self,
        config: StaticPiqdRunnerConfig,
        *,
        transport: Transport | None = None,
        sleep: Callable[[float], None] = time.sleep,
    ) -> None:
        self.config = config
        self.transport = transport
        self.sleep = sleep
        self._lock = threading.Lock()
        self._next_attempt = 0
        self._root_fd = self._prepare_journal_root()

    def _prepare_journal_root(self) -> int:
        return _open_or_create_directory_nofollow(self.config.journal_root)

    def _reserve_journal(self, cnf_sha256: str) -> tuple[int, _AttemptCustody]:
        with self._lock:
            while True:
                attempt = self._next_attempt
                self._next_attempt += 1
                name = f"attempt-{attempt:08d}-{cnf_sha256[:16]}"
                try:
                    os.mkdir(name, 0o700, dir_fd=self._root_fd)
                except FileExistsError:
                    continue
                directory_fd = os.open(
                    name,
                    os.O_RDONLY
                    | os.O_DIRECTORY
                    | getattr(os, "O_NOFOLLOW", 0)
                    | getattr(os, "O_CLOEXEC", 0),
                    dir_fd=self._root_fd,
                )
                journal_fd: int | None = None
                lock_fd: int | None = None
                artifact_fd: int | None = None
                try:
                    journal_fd = os.open(
                        _JOURNAL_NAME,
                        os.O_RDWR
                        | os.O_CREAT
                        | os.O_EXCL
                        | getattr(os, "O_NOFOLLOW", 0)
                        | getattr(os, "O_CLOEXEC", 0),
                        0o600,
                        dir_fd=directory_fd,
                    )
                    lock_fd = os.open(
                        _LOCK_NAME,
                        os.O_RDWR
                        | os.O_CREAT
                        | os.O_EXCL
                        | getattr(os, "O_NOFOLLOW", 0)
                        | getattr(os, "O_CLOEXEC", 0),
                        0o600,
                        dir_fd=directory_fd,
                    )
                    os.mkdir(_ARTIFACT_DIRECTORY_NAME, 0o700, dir_fd=directory_fd)
                    artifact_fd = os.open(
                        _ARTIFACT_DIRECTORY_NAME,
                        os.O_RDONLY
                        | os.O_DIRECTORY
                        | getattr(os, "O_NOFOLLOW", 0)
                        | getattr(os, "O_CLOEXEC", 0),
                        dir_fd=directory_fd,
                    )
                    os.fsync(directory_fd)
                    capability = _descriptor_rooted_directory(directory_fd)
                    custody = _AttemptCustody(
                        root_fd=self._root_fd,
                        public_root=Path(os.path.abspath(self.config.journal_root)),
                        directory_name=name,
                        directory_fd=directory_fd,
                        journal_fd=journal_fd,
                        lock_fd=lock_fd,
                        artifact_fd=artifact_fd,
                        capability_path=capability,
                        directory_anchor=_inode_anchor(os.fstat(directory_fd)),
                    )
                    custody._require_directory_binding()
                    return attempt, custody
                except Exception as exc:
                    for descriptor in (artifact_fd, lock_fd, journal_fd):
                        if descriptor is not None:
                            os.close(descriptor)
                    removed = _remove_reserved_attempt(
                        self._root_fd, name, directory_fd
                    )
                    os.close(directory_fd)
                    if not removed:
                        raise StaticPiqdRunnerError(
                            "failed reservation could not be removed under the "
                            "explicit retry policy"
                        ) from exc
                    raise

    def _wave_manifest(
        self,
        *,
        cnf_sha256: str,
        num_vars: int,
        num_clauses: int,
        attempt: int,
    ) -> dict[str, Any]:
        source = self.config.manifests.source
        producer = self.config.manifests.producer
        manifest = {
            "schema": "p97-cegar-wave/v1",
            "wave_id": f"static-{cnf_sha256[:32]}-{attempt:08d}",
            "iteration": 0,
            "parent_checkpoint_sha256": None,
            "source": {
                "live_leaf": source["source_id"],
                "ingress_hypotheses_sha256": source["source_sha256"],
                "finite_schema": source["finite_schema"],
                "cardinality_scope": source["cardinality_scope"],
                "source_theorem": source["source_theorem"],
            },
            "encoding": {
                "cnf_sha256": cnf_sha256,
                "variable_map_sha256": producer["variable_map_sha256"],
                "producer_manifest_sha256": self.config.manifests.producer_sha256,
                "num_variables": num_vars,
                "num_clauses": num_clauses,
                "query_polarity": producer["query_polarity"],
            },
            "execution": {
                "backend": producer["backend"],
                "solver_profile": producer["solver_profile"],
                "shard_id": 0,
                "shard_count": 1,
                "order_sha256": sha256_bytes(
                    canonical_json_bytes(
                        {
                            "cnf_sha256": cnf_sha256,
                            "producer_manifest_sha256": (
                                self.config.manifests.producer_sha256
                            ),
                        }
                    )
                ),
                "seed": 97,
            },
            "promotion": {
                "evidence_classification": LOCAL_CERTIFICATE,
                "producer_theorem": None,
                "lift_theorem": None,
                "consumer_theorem": None,
            },
        }
        validate_wave_manifest(manifest)
        return manifest

    def _unknown(
        self, detail: str, receipt: Mapping[str, Any] | None = None
    ) -> StaticSolverResult:
        stdout = ""
        if receipt is not None:
            stdout = canonical_json_bytes(receipt).decode("utf-8") + "\n"
        return StaticSolverResult(
            verdict="UNKNOWN",
            assignment={},
            returncode=1,
            stdout=stdout,
            stderr=f"PIQD static discovery failed closed: {detail}",
        )

    @staticmethod
    def _bounded_failure_detail(exc: Exception) -> str:
        detail = f"{type(exc).__name__}: {exc}"
        encoded = detail.encode("utf-8")
        if len(encoded) > 4096:
            detail = encoded[:4096].decode("utf-8", errors="replace")
        return detail

    def _seal_adapter_failure(
        self,
        journal: _CustodiedAttemptJournal,
        *,
        cnf: bytes,
        job_id: str | None,
        detail: str,
    ) -> DriverResult:
        if journal._seal is None:
            journal.store_artifact(cnf)
            journal.store_artifact(self.config.manifests.producer_bytes)
            event = {
                "schema": EVENT_SCHEMA,
                "phase": "STATIC_ADAPTER_BOUNDARY",
                "disposition": "ERROR",
                "retry_index": None,
                "poll_index": None,
                "job_id": job_id,
                "status": None,
                "result": None,
                "detail": detail,
                "response": None,
            }
            record = journal.append_event(event=event, outcome=ERROR, detail=detail)
            seal = journal.seal()
        else:
            seal = journal.seal()
            if not journal.records:
                raise StaticPiqdRunnerError(
                    "sealed driver journal has no terminal failure record"
                )
            record = journal.records[-1]
        return DriverResult(
            job_id=job_id,
            outcome=str(record["outcome"]),
            terminal_record_sha256=str(record["record_sha256"]),
            journal_record_count=int(seal["record_count"]),
            seal_sha256=str(seal["seal_sha256"]),
        )

    def _make_receipt(
        self,
        *,
        attempt: int,
        custody: _AttemptCustody,
        cnf_sha256: str,
        num_vars: int,
        num_clauses: int,
        result: DriverResult,
        recording: _RecordingClient,
        transport: _BoundedRecordingTransport,
        terminal: _StatusObservation | None,
        status_classification: str,
        status_detail: str,
        adapter_result: StaticSolverResult,
        failure_detail: str | None,
    ) -> dict[str, Any]:
        job = recording.prepared_job
        raw_status: _RawStatusCapture | None = None
        raw_artifact: str | None = None
        if terminal is not None:
            raw_status = terminal.raw
            raw_artifact = terminal.artifact_sha256
        elif recording.raw_status_responses:
            raw_status, raw_artifact = recording.raw_status_responses[-1]
        terminal_payload = None if terminal is None else terminal.payload
        unsigned = {
            "schema": RECEIPT_SCHEMA,
            "attempt": attempt,
            "attempt_directory": str(custody.public_directory),
            "journal": str(custody.public_journal),
            "receipt_path": str(custody.public_directory / _RECEIPT_NAME),
            "custody_seal_path": str(custody.public_directory / _CUSTODY_SEAL_NAME),
            "job_id": result.job_id,
            "job_identity": (
                None
                if job is None
                else {
                    "job_id": job.job_id,
                    "backend": job.backend,
                    "solver_profile": job.solver_profile,
                    "project": self.config.policy.project,
                    "cnf_blob_hash": job.cnf_blob_hash,
                    "identity_hash": job.identity_hash,
                    "num_vars": job.num_vars,
                    "num_clauses": job.num_clauses,
                    "existing": job.existing,
                    "requested_core_limit": job.requested_core_limit,
                }
            ),
            # PIQD's raw prepare flag reports identity reuse only.  In
            # particular, the current raw-DIMACS endpoint does not reset an
            # already-terminal UNKNOWN job, so neither flag value establishes
            # that this attempt caused a fresh solve.
            "prepare_freshness_claimed": False,
            "outcome": result.outcome,
            "adapter_verdict": adapter_result.verdict,
            "adapter_returncode": adapter_result.returncode,
            "cnf_sha256": cnf_sha256,
            "num_variables": num_vars,
            "num_clauses": num_clauses,
            "source_manifest_sha256": self.config.manifests.source_sha256,
            "producer_manifest_sha256": self.config.manifests.producer_sha256,
            "terminal_record_sha256": result.terminal_record_sha256,
            "journal_record_count": result.journal_record_count,
            "seal_sha256": result.seal_sha256,
            "status_classification": status_classification,
            "status_detail": status_detail,
            "terminal_status": terminal_payload,
            "terminal_status_canonical_sha256": (
                None
                if terminal_payload is None
                else sha256_bytes(canonical_json_bytes(terminal_payload))
            ),
            "terminal_status_raw_sha256": (
                None if raw_status is None else raw_status.sha256
            ),
            "terminal_status_raw_size": (
                None if raw_status is None else len(raw_status.body)
            ),
            "terminal_status_raw_artifact_sha256": raw_artifact,
            "terminal_status_identity_scope": (
                "NO_PARSED_TERMINAL_STATUS"
                if terminal is None
                else (
                    "EXPOSED_FIELDS_BOUND"
                    if terminal.exposed_identity_fields
                    else "JOB_ID_ONLY"
                )
            ),
            "terminal_status_exposed_identity_fields": (
                [] if terminal is None else list(terminal.exposed_identity_fields)
            ),
            "model_response_sha256": (
                None if recording.checked is None else recording.checked.response_sha256
            ),
            "endpoint_trace": list(transport.endpoint_trace),
            "failure_detail": failure_detail,
            "custody_retry_policy": _CUSTODY_RETRY_POLICY,
            "legacy_drat_proof_path_written": False,
            "proof_endpoint_called": False,
            "certificate_blocker": CERTIFICATE_BLOCKER,
            "claims": {
                "source_entitlement": False,
                "theorem_coverage": False,
                "universal_lift": False,
                "lean_closure": False,
                "one_process": False,
                "one_core": False,
            },
        }
        return {**unsigned, "receipt_sha256": sha256_json(unsigned)}

    @staticmethod
    def _publish_receipt(
        custody: _AttemptCustody,
        journal: _CustodiedAttemptJournal,
        receipt: Mapping[str, Any],
    ) -> str:
        receipt_bytes = canonical_json_bytes(receipt) + b"\n"
        if len(receipt_bytes) > _MAX_RECEIPT_BYTES:
            raise StaticPiqdRunnerError("solver receipt exceeds its byte bound")
        receipt_identity = _write_once_at(
            custody.directory_fd, _RECEIPT_NAME, receipt_bytes
        )
        inventory = journal.custody_inventory()
        unsigned_seal = {
            "schema": CUSTODY_SEAL_SCHEMA,
            "attempt_directory_device": custody.directory_anchor[0],
            "attempt_directory_inode": custody.directory_anchor[1],
            "receipt_sha256": receipt["receipt_sha256"],
            "receipt_file_sha256": sha256_bytes(receipt_bytes),
            "receipt_file_size": len(receipt_bytes),
            "receipt_device": receipt_identity[0],
            "receipt_inode": receipt_identity[1],
            "inventory": inventory,
            "retry_policy": _CUSTODY_RETRY_POLICY,
        }
        custody_seal = {
            **unsigned_seal,
            "custody_seal_sha256": sha256_json(unsigned_seal),
        }
        custody_seal_bytes = canonical_json_bytes(custody_seal) + b"\n"
        custody_seal_identity = _write_once_at(
            custody.directory_fd, _CUSTODY_SEAL_NAME, custody_seal_bytes
        )
        installed_receipt, _ = _capture_file_at(
            custody.directory_fd,
            _RECEIPT_NAME,
            maximum_bytes=_MAX_RECEIPT_BYTES,
            expected_identity=receipt_identity,
        )
        installed_seal, _ = _capture_file_at(
            custody.directory_fd,
            _CUSTODY_SEAL_NAME,
            maximum_bytes=_MAX_RECEIPT_BYTES,
            expected_identity=custody_seal_identity,
        )
        if installed_receipt != receipt_bytes or installed_seal != custody_seal_bytes:
            raise StaticPiqdRunnerError("published custody files changed")
        if journal.custody_inventory() != inventory:
            raise StaticPiqdRunnerError("custodied attempt changed during publication")
        expected_entries = {
            _JOURNAL_NAME,
            _LOCK_NAME,
            _ARTIFACT_DIRECTORY_NAME,
            _DRIVER_SEAL_NAME,
            _RECEIPT_NAME,
            _CUSTODY_SEAL_NAME,
        }
        if set(os.listdir(custody.directory_fd)) != expected_entries:
            raise StaticPiqdRunnerError("sealed attempt contains an unexpected entry")
        os.fsync(custody.directory_fd)
        os.fsync(custody.root_fd)
        return receipt_bytes.decode("utf-8")

    def __call__(
        self, cnf_path: Path, timeout_s: int, proof_path: Path | None
    ) -> StaticSolverResult:
        if type(timeout_s) is not int or timeout_s < 0:
            raise StaticPiqdRunnerError("timeout_s must be a non-negative builtin int")
        cnf = _read_exact_cnf(cnf_path, limit=self.config.max_cnf_bytes)
        try:
            num_vars, num_clauses = scan_dimacs(cnf)
        except PiqdOracleError as exc:
            raise StaticPiqdRunnerError(f"invalid DIMACS input: {exc}") from exc
        if num_clauses == 0:
            return self._unknown(
                "PIQD-VAC-001: current PIQD raw ingress rejects clause-free DIMACS; "
                "no job was prepared"
            )
        cnf_sha256 = sha256_bytes(cnf)
        attempt, custody = self._reserve_journal(cnf_sha256)
        try:
            manifest = self._wave_manifest(
                cnf_sha256=cnf_sha256,
                num_vars=num_vars,
                num_clauses=num_clauses,
                attempt=attempt,
            )
            bounded_transport = _BoundedRecordingTransport(
                base_url=self.config.base_url,
                upstream=self.transport,
                max_cnf_bytes=self.config.max_cnf_bytes,
            )
            client = PiqdRawDimacsClient(
                self.config.base_url, transport=bounded_transport
            )
            if self.transport is None:
                client._segmented_transport = True
            journal = _CustodiedAttemptJournal(
                custody,
                manifest=manifest,
                max_artifact_bytes=max(
                    self.config.max_cnf_bytes,
                    _MAX_MODEL_RESPONSE_BYTES,
                    _MAX_LOG_BYTES,
                ),
            )
            journal.store_artifact(self.config.manifests.source_bytes)
            recording = _RecordingClient(
                client,
                transport=bounded_transport,
                journal=journal,
                project=self.config.policy.project,
            )
            policy = replace(
                self.config.policy,
                solver_timeout_s=timeout_s,
                march_timeout_s=timeout_s,
            )
            driver = PiqdCegarDriver(
                client=recording,
                journal=journal,
                policy=policy,
                proof_replayer=None,
                sleep=self.sleep,
            )
            failure_detail: str | None = None
            try:
                result = driver.run(
                    wave_manifest=manifest,
                    cnf=cnf,
                    producer_manifest=self.config.manifests.producer_bytes,
                )
            except (OSError, PiqdDriverError, PiqdOracleError) as exc:
                failure_detail = self._bounded_failure_detail(exc)
                result = self._seal_adapter_failure(
                    journal,
                    cnf=cnf,
                    job_id=(
                        None
                        if recording.prepared_job is None
                        else recording.prepared_job.job_id
                    ),
                    detail=failure_detail,
                )
            if result.outcome == ERROR and failure_detail is None and journal.records:
                terminal_detail = journal.records[-1].get("detail")
                if type(terminal_detail) is str:
                    failure_detail = terminal_detail

            job = recording.prepared_job
            terminal = _terminal_status(recording.status_responses)
            terminal_payload = None if terminal is None else terminal.payload
            status_classification, status_detail = _status_assessment(terminal_payload)
            if terminal is not None and (
                job is None or terminal.payload.get("id") != job.job_id
            ):
                status_classification = INVALID_STATUS_ATTESTATION
                status_detail = "terminal status is not scoped to the prepared job"

            if status_classification == INVALID_STATUS_ATTESTATION:
                terminal_detail = None
                if journal.records:
                    candidate = journal.records[-1].get("detail")
                    if type(candidate) is str and candidate:
                        terminal_detail = candidate
                detail = status_detail
                if terminal_detail is not None:
                    detail += f"; {terminal_detail}"
                adapter_result = self._unknown(detail)
            elif status_classification == DEPLOYMENT_NO_SOLVER:
                adapter_result = self._unknown(
                    "DEPLOYMENT_NO_SOLVER: progress.solver_started=false, "
                    "attestation_basis=SOLVER_DID_NOT_START, and "
                    "attested_solver_processes=0"
                )
            elif status_classification == SOLVER_UNKNOWN:
                adapter_result = self._unknown(
                    "SOLVER_UNKNOWN: an attested solver process started and returned "
                    "UNKNOWN"
                )
            elif result.outcome == STRUCTURAL_SAT:
                checked = recording.checked
                if job is None or checked is None or result.job_id != job.job_id:
                    adapter_result = self._unknown(
                        "SAT result lacks a same-job checked model"
                    )
                else:
                    try:
                        replay_dimensions = scan_dimacs(cnf, checked.assignment)
                    except PiqdOracleError as exc:
                        adapter_result = self._unknown(
                            f"local SAT model replay failed: {exc}"
                        )
                    else:
                        assignment = {
                            abs(literal): literal > 0 for literal in checked.assignment
                        }
                        if replay_dimensions != (num_vars, num_clauses):
                            adapter_result = self._unknown(
                                "local SAT replay dimensions changed"
                            )
                        elif set(assignment) != set(range(1, num_vars + 1)):
                            adapter_result = self._unknown("SAT model is not total")
                        else:
                            adapter_result = StaticSolverResult(
                                verdict="SAT",
                                assignment=assignment,
                                returncode=10,
                            )
            elif result.outcome == DISCOVERY_UNSAT:
                if job is None or result.job_id != job.job_id:
                    adapter_result = self._unknown(
                        "UNSAT result lacks a same-job prepare receipt"
                    )
                else:
                    requested = "none" if proof_path is None else str(proof_path)
                    adapter_result = StaticSolverResult(
                        verdict="UNSAT",
                        assignment={},
                        returncode=20,
                        stderr=(
                            "PIQD observational UNSAT only; CERT-001 leaves "
                            "source-to-proof linkage open. No legacy DRAT proof was "
                            f"written; requested proof_path={requested}."
                        ),
                    )
            else:
                terminal_detail = None
                if journal.records:
                    candidate = journal.records[-1].get("detail")
                    if type(candidate) is str and candidate:
                        terminal_detail = candidate
                detail = f"driver terminal outcome is {result.outcome}"
                if terminal_detail is not None:
                    detail += f": {terminal_detail}"
                adapter_result = self._unknown(detail)

            receipt = self._make_receipt(
                attempt=attempt,
                custody=custody,
                cnf_sha256=cnf_sha256,
                num_vars=num_vars,
                num_clauses=num_clauses,
                result=result,
                recording=recording,
                transport=bounded_transport,
                terminal=terminal,
                status_classification=status_classification,
                status_detail=status_detail,
                adapter_result=adapter_result,
                failure_detail=failure_detail,
            )
            stdout = self._publish_receipt(custody, journal, receipt)
            return replace(adapter_result, stdout=stdout)
        except Exception as exc:
            detail = self._bounded_failure_detail(exc)
            removed = custody.cleanup_for_retry()
            if not removed:
                raise StaticPiqdRunnerError(
                    "reserved PIQD attempt could neither be canonically sealed nor "
                    "cleanly removed"
                ) from exc
            return self._unknown(
                f"{detail}; reservation removed under {_CUSTODY_RETRY_POLICY}"
            )
        finally:
            custody.close()


def make_static_piqd_solver_runner(
    *,
    base_url: str,
    journal_root: Path,
    source_manifest: bytes,
    producer_manifest: bytes,
    transport: Transport | None = None,
    policy: DriverPolicy | None = None,
    max_cnf_bytes: int = _DEFAULT_MAX_CNF_BYTES,
    sleep: Callable[[float], None] = time.sleep,
) -> StaticPiqdSolverRunner:
    """Create the clean callable seam for legacy ``solver_runner=...`` injection."""

    manifests = authenticate_static_manifests(
        source_manifest=source_manifest,
        producer_manifest=producer_manifest,
    )
    config = StaticPiqdRunnerConfig(
        base_url=base_url,
        journal_root=journal_root,
        manifests=manifests,
        policy=policy or DriverPolicy(requested_core_limit=1),
        max_cnf_bytes=max_cnf_bytes,
    )
    return StaticPiqdSolverRunner(config, transport=transport, sleep=sleep)


__all__ = [
    "ATTESTED_SOLVER_RESULT",
    "CERTIFICATE_BLOCKER",
    "DEPLOYMENT_NO_SOLVER",
    "INVALID_STATUS_ATTESTATION",
    "PRODUCER_SCHEMA",
    "RECEIPT_SCHEMA",
    "SOLVER_UNKNOWN",
    "SOURCE_SCHEMA",
    "StaticManifestContract",
    "StaticPiqdRunnerConfig",
    "StaticPiqdRunnerError",
    "StaticPiqdSolverRunner",
    "StaticSolverResult",
    "authenticate_static_manifests",
    "make_static_piqd_solver_runner",
]
