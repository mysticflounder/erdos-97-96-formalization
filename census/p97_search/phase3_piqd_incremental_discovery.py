"""Producer-neutral, fail-closed adapter for PIQD SAT sessions.

This is a discovery producer, never a proof or closure producer.  It binds a
PIQD session to exact producer bytes, a canonical descriptor, an ordered local
frontier, and durable solve receipts.  The local journal is deliberately
self-authenticating: a restart restores only the logical frontier and receipt
identity, never learned solver state.
"""

from __future__ import annotations

import hashlib
import json
import os
import stat
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

SCHEMA = "p97-piqd-incremental-discovery-v1"
FRONTIER_SCHEMA = "p97-piqd-clause-frontier-v1"
RESULT_DIGEST_VERSION = "piqd-solve-result/v1"
SOLVE_REQUEST_DIGEST_VERSION = "piqd-solve-request/v1"
DEFAULT_PROJECT = "erdos-97-96-formalization"
MAX_CAPTURE_BYTES = 64 * 1024 * 1024
HEX64 = frozenset("0123456789abcdef")
UUID_HYPHENS = (8, 13, 18, 23)


class PiqdIncrementalDiscoveryError(RuntimeError):
    """The PIQD session or its custody contract is not trustworthy."""


@dataclass(frozen=True)
class HttpResponse:
    status: int
    body: bytes
    headers: Mapping[str, str]


Transport = Callable[[str, str, bytes | None, Mapping[str, str]], HttpResponse]


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _reject_constant(value: str) -> None:
    raise ValueError(f"non-standard JSON constant: {value}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _json_bytes(value: Any) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=False,
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError, UnicodeError) as exc:
        raise PiqdIncrementalDiscoveryError("value is not strict JSON") from exc


def _strict_value(data: bytes, *, label: str) -> Any:
    try:
        return json.loads(
            data.decode("utf-8"),
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise PiqdIncrementalDiscoveryError(f"{label} must be strict JSON") from exc


def _strict_object(data: bytes, *, label: str) -> bytes:
    value = _strict_value(data, label=label)
    if not isinstance(value, dict):
        raise PiqdIncrementalDiscoveryError(f"{label} must be a JSON object")
    canonical = _json_bytes(value)
    if data != canonical:
        raise PiqdIncrementalDiscoveryError(f"{label} is not canonical JSON bytes")
    return canonical


def _require_keys(value: Mapping[str, Any], expected: set[str], *, label: str) -> None:
    if set(value) != expected:
        missing = sorted(expected - set(value))
        extra = sorted(set(value) - expected)
        raise PiqdIncrementalDiscoveryError(
            f"{label} has wrong keys (missing={missing}, extra={extra})"
        )


def _string(value: Any, *, label: str, nonempty: bool = False) -> str:
    if type(value) is not str or (nonempty and not value):
        raise PiqdIncrementalDiscoveryError(f"{label} must be a builtin string")
    return value


def _integer(value: Any, *, label: str, minimum: int | None = None) -> int:
    if type(value) is not int or (minimum is not None and value < minimum):
        raise PiqdIncrementalDiscoveryError(f"{label} must be a builtin integer")
    return value


def _boolean(value: Any, *, label: str) -> bool:
    if type(value) is not bool:
        raise PiqdIncrementalDiscoveryError(f"{label} must be a builtin boolean")
    return value


def _hex64(value: Any, *, label: str) -> str:
    value = _string(value, label=label)
    if len(value) != 64 or any(char not in HEX64 for char in value):
        raise PiqdIncrementalDiscoveryError(f"{label} must be lowercase 64-hex")
    return value


def _uuid(value: Any, *, label: str) -> str:
    value = _string(value, label=label)
    if (
        len(value) != 36
        or any(value[index] != "-" for index in UUID_HYPHENS)
        or any(
            index not in UUID_HYPHENS and char not in HEX64
            for index, char in enumerate(value)
        )
    ):
        raise PiqdIncrementalDiscoveryError(f"{label} must be canonical lowercase UUID")
    return value


def _literal_bytes(literals: Sequence[int] | None) -> bytes:
    if literals is None:
        return b"-"
    ordered = sorted(literals, key=lambda literal: (abs(literal), literal))
    return " ".join(str(literal) for literal in ordered).encode("ascii")


def _journal_bytes(clauses: Sequence[Sequence[int]]) -> bytes:
    """Render PIQD's headerless SAT journal exactly, not its CNF export."""

    return b"".join(
        (
            " ".join(str(literal) for literal in clause)
            + (" " if clause else "")
            + "0\n"
        ).encode("ascii")
        for clause in clauses
    )


def _result_digest(
    status: str,
    interrupted_by: str | None,
    core: Sequence[int] | None,
    model: Sequence[int] | None,
) -> str:
    digest = hashlib.sha256()
    digest.update(RESULT_DIGEST_VERSION.encode("ascii"))
    digest.update(b"\nstatus=")
    digest.update(status.encode("ascii"))
    digest.update(b"\ninterrupted_by=")
    digest.update((interrupted_by or "").encode("utf-8"))
    digest.update(b"\ncore=")
    digest.update(_literal_bytes(core))
    digest.update(b"\nmodel=")
    digest.update(_literal_bytes(model))
    return digest.hexdigest()


def _solve_request_digest(
    *,
    base_clauses: int,
    base_bytes: int,
    base_sha256: str,
    assumptions: Sequence[int],
    conflict_limit: int | None,
    timeout_ms: int | None,
) -> str:
    digest = hashlib.sha256()
    digest.update(SOLVE_REQUEST_DIGEST_VERSION.encode("ascii"))
    digest.update(f"\nbase={base_clauses}:{base_bytes}:{base_sha256}".encode("ascii"))
    digest.update(
        (
            f"\nlimit={'' if conflict_limit is None else conflict_limit}"
            f"\ntimeout={'' if timeout_ms is None else timeout_ms}"
            "\nmodel=true\nassumptions="
        ).encode("ascii")
    )
    digest.update(_literal_bytes(assumptions))
    return digest.hexdigest()


def _safe_root(root: Path) -> Path:
    root = Path(root)
    if not root.is_absolute() or any(part in {".", ".."} for part in root.parts):
        raise PiqdIncrementalDiscoveryError(
            "custody root must be an absolute rooted path"
        )
    return root


def _private_directory(st: os.stat_result, *, label: str) -> None:
    """Require a custody directory owned by this user with no public bits."""

    if not stat.S_ISDIR(st.st_mode) or st.st_uid != os.getuid() or st.st_mode & 0o077:
        raise PiqdIncrementalDiscoveryError(
            f"{label} is not a private directory owned by the current user"
        )


def _private_regular(st: os.stat_result, *, label: str) -> None:
    if (
        not stat.S_ISREG(st.st_mode)
        or st.st_nlink != 1
        or st.st_uid != os.getuid()
        or st.st_mode & 0o077
    ):
        raise PiqdIncrementalDiscoveryError(
            f"{label} is not a private regular file owned by the current user"
        )


def _relative_parts(path: Path, root: Path) -> list[str]:
    path = Path(path)
    if not path.is_absolute() or any(part in {".", ".."} for part in path.parts):
        raise PiqdIncrementalDiscoveryError(
            "custody paths must be absolute and normalized"
        )
    try:
        relative = path.relative_to(root)
    except ValueError as exc:
        raise PiqdIncrementalDiscoveryError("path escapes the custody root") from exc
    parts = list(relative.parts)
    if not parts or any(part in {"", ".", ".."} for part in parts):
        raise PiqdIncrementalDiscoveryError(
            "custody path must name a file below its root"
        )
    return parts


def _open_root(root: Path) -> int:
    flags = os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC | os.O_NOFOLLOW
    fd = os.open(os.sep, flags)
    try:
        for part in root.parts[1:]:
            next_fd = os.open(part, flags, dir_fd=fd)
            os.close(fd)
            fd = next_fd
        st = os.fstat(fd)
        _private_directory(st, label="custody root")
        return fd
    except BaseException:
        os.close(fd)
        raise


def _open_parent(path: Path, root: Path) -> tuple[int, str]:
    parts = _relative_parts(path, root)
    fd = _open_root(root)
    flags = os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC | os.O_NOFOLLOW
    try:
        for part in parts[:-1]:
            next_fd = os.open(part, flags, dir_fd=fd)
            os.close(fd)
            fd = next_fd
            st = os.fstat(fd)
            _private_directory(st, label="custody component")
        return fd, parts[-1]
    except BaseException:
        os.close(fd)
        raise


def _safe_read(path: Path, root: Path, *, label: str) -> bytes:
    parent, name = _open_parent(path, root)
    flags = os.O_RDONLY | os.O_CLOEXEC | os.O_NOFOLLOW
    try:
        try:
            fd = os.open(name, flags, dir_fd=parent)
        except OSError as exc:
            raise PiqdIncrementalDiscoveryError(
                f"{label} cannot be opened without following links"
            ) from exc
        try:
            before = os.fstat(fd)
            _private_regular(before, label=label)
            if before.st_size > MAX_CAPTURE_BYTES:
                raise PiqdIncrementalDiscoveryError(
                    f"{label} exceeds the bounded capture size"
                )
            chunks: list[bytes] = []
            total = 0
            while True:
                chunk = os.read(fd, min(1024 * 1024, MAX_CAPTURE_BYTES - total + 1))
                if not chunk:
                    break
                total += len(chunk)
                if total > MAX_CAPTURE_BYTES:
                    raise PiqdIncrementalDiscoveryError(
                        f"{label} changed beyond the bounded capture size"
                    )
                chunks.append(chunk)
            after = os.fstat(fd)
            identity = (
                "st_dev",
                "st_ino",
                "st_size",
                "st_mtime_ns",
                "st_ctime_ns",
                "st_nlink",
            )
            if any(getattr(before, key) != getattr(after, key) for key in identity):
                raise PiqdIncrementalDiscoveryError(f"{label} changed during capture")
            return b"".join(chunks)
        finally:
            os.close(fd)
    finally:
        os.close(parent)


def _claim_journal(path: Path, root: Path) -> None:
    parent, name = _open_parent(path, root)
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_CLOEXEC | os.O_NOFOLLOW
    try:
        try:
            fd = os.open(name, flags, 0o600, dir_fd=parent)
        except FileExistsError as exc:
            raise PiqdIncrementalDiscoveryError(
                "fresh PIQD session refuses a preexisting custody journal"
            ) from exc
        try:
            st = os.fstat(fd)
            _private_regular(st, label="new custody journal")
            os.fsync(fd)
        finally:
            os.close(fd)
    finally:
        os.close(parent)


def _append_file(path: Path, root: Path, data: bytes) -> None:
    parent, name = _open_parent(path, root)
    flags = os.O_RDWR | os.O_APPEND | os.O_CLOEXEC | os.O_NOFOLLOW
    try:
        fd = os.open(name, flags, dir_fd=parent)
        try:
            before = os.fstat(fd)
            _private_regular(before, label="custody journal")
            if before.st_size + len(data) > MAX_CAPTURE_BYTES:
                raise PiqdIncrementalDiscoveryError(
                    "custody journal exceeds the bounded capture size"
                )
            prefix = os.pread(fd, before.st_size, 0)
            if len(prefix) != before.st_size:
                raise PiqdIncrementalDiscoveryError(
                    "custody journal could not be captured before append"
                )
            view = memoryview(data)
            while view:
                written = os.write(fd, view)
                view = view[written:]
            os.fsync(fd)
            after = os.fstat(fd)
            if (
                (
                    before.st_dev,
                    before.st_ino,
                    before.st_nlink,
                )
                != (
                    after.st_dev,
                    after.st_ino,
                    after.st_nlink,
                )
                or after.st_size != before.st_size + len(data)
                or os.pread(fd, before.st_size, 0) != prefix
            ):
                raise PiqdIncrementalDiscoveryError(
                    "custody journal changed during append"
                )
        finally:
            os.close(fd)
    finally:
        os.close(parent)


def parse_dimacs(data: bytes) -> tuple[int, tuple[tuple[int, ...], ...]]:
    """Parse DIMACS without normalising clause or literal order."""

    try:
        text = data.decode("ascii")
    except UnicodeDecodeError as exc:
        raise PiqdIncrementalDiscoveryError("seed/CNF is not ASCII DIMACS") from exc
    variables: int | None = None
    declared: int | None = None
    clauses: list[tuple[int, ...]] = []
    pending: list[int] = []
    for line_no, raw in enumerate(text.splitlines(), 1):
        line = raw.strip()
        if not line or line.startswith("c"):
            continue
        tokens = line.split()
        if tokens[0] == "p":
            if variables is not None or len(tokens) != 4 or tokens[1] != "cnf":
                raise PiqdIncrementalDiscoveryError(
                    f"invalid DIMACS header at line {line_no}"
                )
            try:
                variables, declared = int(tokens[2]), int(tokens[3])
            except ValueError as exc:
                raise PiqdIncrementalDiscoveryError(
                    "DIMACS header counts are not integers"
                ) from exc
            if variables <= 0 or declared <= 0 or pending:
                raise PiqdIncrementalDiscoveryError(
                    "DIMACS requires a positive variable and clause universe"
                )
            continue
        if variables is None:
            raise PiqdIncrementalDiscoveryError("DIMACS clause appeared before header")
        for token in tokens:
            try:
                literal = int(token)
            except ValueError as exc:
                raise PiqdIncrementalDiscoveryError(
                    f"invalid DIMACS literal {token!r}"
                ) from exc
            if literal == 0:
                clauses.append(tuple(pending))
                pending.clear()
            else:
                if abs(literal) > variables:
                    raise PiqdIncrementalDiscoveryError(
                        f"literal {literal} exceeds declared variable count {variables}"
                    )
                pending.append(literal)
    if variables is None or declared is None:
        raise PiqdIncrementalDiscoveryError("DIMACS header is missing")
    if pending:
        raise PiqdIncrementalDiscoveryError("DIMACS has an unterminated clause")
    if len(clauses) != declared:
        raise PiqdIncrementalDiscoveryError(
            f"DIMACS declares {declared} clauses but contains {len(clauses)}"
        )
    return variables, tuple(clauses)


def _frontier_hash(variable_count: int, clauses: Sequence[Sequence[int]]) -> str:
    digest = hashlib.sha256()
    digest.update(
        f"{FRONTIER_SCHEMA}\np cnf {variable_count} {len(clauses)}\n".encode()
    )
    for clause in clauses:
        digest.update((" ".join(str(lit) for lit in clause) + " 0\n").encode())
    return digest.hexdigest()


def _check_clause(
    clause: Sequence[int], variable_count: int | None = None
) -> tuple[int, ...]:
    if not isinstance(clause, (list, tuple)):
        raise PiqdIncrementalDiscoveryError("clauses must be lists or tuples")
    result: list[int] = []
    for literal in clause:
        if type(literal) is not int or literal == 0:
            raise PiqdIncrementalDiscoveryError(
                "clauses contain only non-zero integer literals"
            )
        if variable_count is not None and abs(literal) > variable_count:
            raise PiqdIncrementalDiscoveryError(
                f"clause literal {literal} exceeds the current variable universe"
            )
        result.append(literal)
    return tuple(result)


def _canonical_assumptions(
    value: Any,
    variable_count: int,
    *,
    label: str,
    container_type: type[tuple[Any, ...] | list[Any]],
) -> tuple[int, ...]:
    if type(value) is not container_type:
        raise PiqdIncrementalDiscoveryError(
            f"{label} must be a builtin {container_type.__name__}"
        )
    assumptions: list[int] = []
    for literal in value:
        if type(literal) is not int or literal == 0:
            raise PiqdIncrementalDiscoveryError(
                f"{label} must contain only non-zero builtin integer literals"
            )
        if abs(literal) > variable_count:
            raise PiqdIncrementalDiscoveryError(
                f"{label} literal {literal} exceeds the current variable universe"
            )
        assumptions.append(literal)
    canonical = tuple(
        sorted(set(assumptions), key=lambda literal: (abs(literal), literal))
    )
    if tuple(assumptions) != canonical:
        raise PiqdIncrementalDiscoveryError(
            f"{label} is not in canonical daemon literal order"
        )
    if any(-literal in canonical for literal in canonical):
        raise PiqdIncrementalDiscoveryError(f"{label} is contradictory")
    return canonical


@dataclass(frozen=True)
class DiscoveryDescriptor:
    """Immutable root for a producer's session custody contract."""

    seed_cnf: bytes
    producer_manifest: bytes
    source_manifest: bytes
    solver_name: str
    producer_job_id: str
    backend: str = "cadical"
    solver_profile: str = "sat"
    project: str = DEFAULT_PROJECT
    seed_blob_hash: str | None = None

    def __post_init__(self) -> None:
        if type(self.seed_cnf) is not bytes:
            raise PiqdIncrementalDiscoveryError("seed_cnf must be exact builtin bytes")
        if (
            type(self.producer_manifest) is not bytes
            or type(self.source_manifest) is not bytes
        ):
            raise PiqdIncrementalDiscoveryError("manifests must be exact builtin bytes")
        variables, clauses = parse_dimacs(self.seed_cnf)
        if variables <= 0 or not clauses:
            raise PiqdIncrementalDiscoveryError(
                "PIQD sessions require a non-vacuous seed"
            )
        _string(self.solver_name, label="solver_name", nonempty=True)
        _uuid(self.producer_job_id, label="producer_job_id")
        _string(self.backend, label="backend", nonempty=True)
        _string(self.solver_profile, label="solver_profile", nonempty=True)
        _string(self.project, label="project", nonempty=True)
        _strict_object(self.producer_manifest, label="producer_manifest")
        _strict_object(self.source_manifest, label="source_manifest")
        expected = _sha256(self.seed_cnf)
        if self.seed_blob_hash is not None and self.seed_blob_hash != expected:
            raise PiqdIncrementalDiscoveryError(
                "seed_blob_hash does not match exact seed bytes"
            )
        _hex64(expected, label="seed_blob_hash")
        object.__setattr__(self, "seed_blob_hash", expected)
        if self.backend != "cadical" or self.solver_profile not in {
            "sat",
            "plain",
            "default",
        }:
            raise PiqdIncrementalDiscoveryError(
                "descriptor is outside the PIQD SAT discovery lane"
            )
        if any(not isinstance(clause, tuple) for clause in clauses):
            raise PiqdIncrementalDiscoveryError("invalid parsed seed")

    @property
    def seed_sha256(self) -> str:
        return _sha256(self.seed_cnf)

    @property
    def producer_manifest_sha256(self) -> str:
        return _sha256(self.producer_manifest)

    @property
    def source_manifest_sha256(self) -> str:
        return _sha256(self.source_manifest)

    @property
    def descriptor_root(self) -> str:
        return _sha256(
            _json_bytes(
                {
                    "schema": SCHEMA,
                    "backend": self.backend,
                    "solver_profile": self.solver_profile,
                    "solver_name": self.solver_name,
                    "project": self.project,
                    "producer_job_id": self.producer_job_id,
                    "seed_blob_hash": self.seed_blob_hash,
                    "producer_manifest_sha256": self.producer_manifest_sha256,
                    "source_manifest_sha256": self.source_manifest_sha256,
                }
            )
        )


@dataclass(frozen=True)
class DiscoveryResult:
    status: str
    assignment: tuple[int, ...]
    solve_index: int
    result_sha256: str
    receipt: Mapping[str, Any]
    frontier_count: int
    frontier_sha256: str
    proof_verified: bool = False
    closure_claim: bool = False


SESSION_KEYS = {
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
# PIQD forwards solver_stats opaquely.  This is the exact telemetry profile
# selected by this caller's SAT-worker adapter, not a daemon response schema.
# Absence means only that worker telemetry was unavailable for that status read.
CALLER_SATWORKER_STATS_KEYS = {
    "vars",
    "active",
    "irredundant",
    "clauses_added",
    "solves",
    "solve_ms_total",
}
RECEIPT_REQUIRED = {
    "solve_index",
    "base_clauses",
    "base_bytes",
    "base_sha256",
    "assumptions",
    "status",
    "model_recorded",
    "result_sha256",
    "at",
}
RECEIPT_OPTIONAL = {
    "conflict_limit",
    "timeout_ms",
    "effective_deadline_ms",
    "interrupted_by",
    "core",
    "batch_key",
    "batch_position",
    "batch_size",
    "batch_request_sha256",
    "request_id",
    "request_sha256",
}
RESPONSE_KEYS = {
    "status",
    "solve_ms",
    "solve_index",
    "result_sha256",
    "model",
    "core",
    "terminal_unsat",
    "interrupted_by",
    "effective_deadline_ms",
}
SAT_CONTRACT_LEGACY_V1 = "legacy-v1"
SAT_CONTRACT_CURRENT_V1 = "current-sat-v1"


class PiqdIncrementalDiscoveryRunner:
    """A durable PIQD session discovery runner, assumption-free by default."""

    def __init__(
        self,
        base_url: str,
        descriptor: DiscoveryDescriptor,
        *,
        receipt_path: Path,
        transport: Transport | None = None,
        session_id: str | None = None,
        custody_root: Path | None = None,
        sat_contract_version: str = SAT_CONTRACT_CURRENT_V1,
        permit_assumptions: bool = False,
    ) -> None:
        self.base_url = _string(base_url, label="base_url", nonempty=True).rstrip("/")
        if type(sat_contract_version) is not str or sat_contract_version not in {
            SAT_CONTRACT_LEGACY_V1,
            SAT_CONTRACT_CURRENT_V1,
        }:
            raise PiqdIncrementalDiscoveryError(
                "sat_contract_version is not a supported exact version"
            )
        self._sat_contract_version = sat_contract_version
        if type(permit_assumptions) is not bool:
            raise PiqdIncrementalDiscoveryError(
                "permit_assumptions must be a builtin boolean"
            )
        self._permit_assumptions = permit_assumptions
        self.descriptor = descriptor
        if transport is None:
            from census.p97_search.phase3_piqd_oracle import _stdlib_transport

            transport = _stdlib_transport
        self._transport = transport
        self.receipt_path = Path(receipt_path)
        self.custody_root = _safe_root(custody_root or self.receipt_path.parent)
        _relative_parts(self.receipt_path, self.custody_root)
        self._seed_variables, seed_clauses = parse_dimacs(descriptor.seed_cnf)
        self._clauses = list(seed_clauses)
        self._variable_count = self._seed_variables
        self._remote_cnf = b""
        self._remote_journal = b""
        self._remote_cnf_sha256 = ""
        self._solve_count = 0
        self._journal_sequence = -1
        self._journal_tail: str | None = None
        self._journal_solves: list[Mapping[str, Any]] = []
        self._pending_request: Mapping[str, Any] | None = None
        self._solver_sha256: str | None = None
        self._solver_signature: str | None = None
        self._close_attempted = False
        self._close_uncertain = False
        self._closed = False
        if session_id is None:
            _claim_journal(self.receipt_path, self.custody_root)
            self._verify_blob()
            try:
                self._session_id = self._create_session()
                self._verify_remote_frontier()
                self._append_local(
                    {
                        "event": "open",
                        "session_id": self._session_id,
                        "producer_job_id": descriptor.producer_job_id,
                        "seed_blob_hash": descriptor.seed_blob_hash,
                        "seed_sha256": descriptor.seed_sha256,
                        "descriptor_root": descriptor.descriptor_root,
                        "frontier_count": self.frontier_count,
                        "frontier_sha256": self.frontier_sha256,
                        "learned_state": "not_claimed",
                    }
                )
            except BaseException:
                if getattr(self, "_session_id", None) is not None:
                    self._close_session_once()
                raise
        else:
            self._session_id = _uuid(session_id, label="session_id")
            self._load_local_journal()
            self._verify_blob()
            self._revive()

    @property
    def session_id(self) -> str:
        return self._session_id

    @property
    def clauses(self) -> tuple[tuple[int, ...], ...]:
        return tuple(self._clauses)

    @property
    def frontier_count(self) -> int:
        return len(self._clauses)

    @property
    def frontier_sha256(self) -> str:
        return _frontier_hash(self._variable_count, self._clauses)

    @property
    def exported_cnf_sha256(self) -> str:
        """Hash of the exact daemon CNF export, including its header."""

        if not self._remote_cnf:
            raise PiqdIncrementalDiscoveryError(
                "PIQD exported CNF identity is not yet available"
            )
        return self._remote_cnf_sha256

    @property
    def solve_count(self) -> int:
        return self._solve_count

    @property
    def solver_sha256(self) -> str:
        if self._solver_sha256 is None:
            raise PiqdIncrementalDiscoveryError(
                "PIQD solver identity is not yet available"
            )
        return self._solver_sha256

    def _request(
        self,
        method: str,
        path: str,
        body: bytes | None = None,
        *,
        expected_status: int,
    ) -> HttpResponse:
        response = self._transport(
            method,
            self.base_url + path,
            body,
            {"content-type": "application/json"} if body is not None else {},
        )
        if (
            type(response.status) is not int
            or response.status != expected_status
            or type(response.body) is not bytes
        ):
            detail = (
                response.body[:300].decode("utf-8", errors="replace")
                if isinstance(response.body, bytes)
                else "invalid body"
            )
            raise PiqdIncrementalDiscoveryError(
                f"PIQD {method} {path} returned HTTP {response.status}: {detail}"
            )
        return response

    def _json(
        self,
        method: str,
        path: str,
        body: Mapping[str, Any] | None = None,
        *,
        expected_status: int,
    ) -> dict[str, Any]:
        value = _strict_value(
            self._request(
                method,
                path,
                None if body is None else _json_bytes(body),
                expected_status=expected_status,
            ).body,
            label=f"PIQD {method} {path}",
        )
        if not isinstance(value, dict):
            raise PiqdIncrementalDiscoveryError("PIQD JSON response must be an object")
        return value

    def _create_session(self) -> str:
        payload = self._json(
            "POST",
            "/sessions",
            {
                "solver": self.descriptor.solver_name,
                "lane": "sat",
                "label": f"{SCHEMA}:{self.descriptor.descriptor_root}",
                "seed_blob_hash": self.descriptor.seed_blob_hash,
            },
            expected_status=201,
        )
        session_id = _uuid(payload.get("id"), label="session_id")
        self._session_id = session_id
        try:
            _require_keys(payload, SESSION_KEYS, label="PIQD session creation")
            self._check_session_descriptor(payload, creation=True)
        except BaseException:
            self._close_session_once()
            raise
        return session_id

    def _check_session_descriptor(
        self,
        payload: Mapping[str, Any],
        *,
        creation: bool = False,
        reconcile: bool = False,
        closing: bool = False,
        status_get: bool = False,
    ) -> None:
        allowed = SESSION_KEYS | ({"solver_stats"} if status_get else set())
        if set(payload) - allowed or set(payload) & SESSION_KEYS != SESSION_KEYS:
            raise PiqdIncrementalDiscoveryError(
                "PIQD session response has an inexact schema"
            )
        _uuid(payload["id"], label="session.id")
        if payload["id"] != self._session_id or payload["lane"] != "sat":
            raise PiqdIncrementalDiscoveryError("PIQD session identity/lane mismatch")
        if payload["state"] not in {"live", "detached", "closed"}:
            raise PiqdIncrementalDiscoveryError("PIQD session has an unknown state")
        if creation and payload["state"] != "live":
            raise PiqdIncrementalDiscoveryError("new PIQD session is not live")
        expected_label = f"{SCHEMA}:{self.descriptor.descriptor_root}"
        if _string(payload["label"], label="session.label") != expected_label:
            raise PiqdIncrementalDiscoveryError(
                "PIQD session label is not descriptor-rooted"
            )
        if payload["solver_name"] != self.descriptor.solver_name:
            raise PiqdIncrementalDiscoveryError(
                "PIQD session solver is not descriptor-rooted"
            )
        solver_sha256 = _hex64(payload["solver_sha256"], label="session.solver_sha256")
        if self._solver_sha256 is None:
            self._solver_sha256 = solver_sha256
        elif self._solver_sha256 != solver_sha256:
            raise PiqdIncrementalDiscoveryError(
                "PIQD session solver binary changed during custody"
            )
        solver_signature = _string(
            payload["solver_signature"], label="session.solver_signature", nonempty=True
        )
        if self._solver_signature is None:
            self._solver_signature = solver_signature
        elif self._solver_signature != solver_signature:
            raise PiqdIncrementalDiscoveryError(
                "PIQD session solver signature changed during custody"
            )
        if "solver_stats" in payload:
            if payload["state"] != "live" or payload["lane"] != "sat":
                raise PiqdIncrementalDiscoveryError(
                    "PIQD solver_stats requires a live SAT status response"
                )
            solver_stats = payload["solver_stats"]
            if type(solver_stats) is not dict:
                raise PiqdIncrementalDiscoveryError(
                    "PIQD solver_stats must be an exact object"
                )
            _require_keys(
                solver_stats,
                CALLER_SATWORKER_STATS_KEYS,
                label="PIQD solver_stats",
            )
            for key in CALLER_SATWORKER_STATS_KEYS:
                _integer(
                    solver_stats[key],
                    label=f"PIQD solver_stats.{key}",
                    minimum=0,
                )
        _integer(
            payload["protocol_version"], label="session.protocol_version", minimum=1
        )
        _string(payload["journal_path"], label="session.journal_path", nonempty=True)
        _integer(payload["created_at"], label="session.created_at")
        _integer(payload["updated_at"], label="session.updated_at")
        expected_declared = self._seed_variables
        if (
            payload["declared_num_vars"] is not None
            and payload["declared_num_vars"] != expected_declared
        ):
            raise PiqdIncrementalDiscoveryError(
                "PIQD session changed the seed variable universe"
            )
        _integer(payload["clauses"], label="session.clauses", minimum=0)
        _integer(payload["max_var"], label="session.max_var", minimum=0)
        _integer(payload["solves"], label="session.solves", minimum=0)
        if payload["last_status"] is not None and payload["last_status"] not in {
            "SAT",
            "UNSAT",
            "UNKNOWN",
        }:
            raise PiqdIncrementalDiscoveryError("session.last_status is invalid")
        if payload["last_solve_index"] is not None:
            _integer(
                payload["last_solve_index"], label="session.last_solve_index", minimum=1
            )
        if payload["last_assumption_free"] is not None:
            _boolean(
                payload["last_assumption_free"], label="session.last_assumption_free"
            )
        if payload["last_terminal_unsat"] is not None:
            _boolean(
                payload["last_terminal_unsat"], label="session.last_terminal_unsat"
            )
        if not creation and (not reconcile or closing):
            if payload["state"] == "closed" and not closing:
                raise PiqdIncrementalDiscoveryError(
                    "closed PIQD sessions cannot be revived"
                )
            if closing and payload["state"] != "closed":
                raise PiqdIncrementalDiscoveryError(
                    "PIQD close did not return a closed session"
                )
            if (
                payload["clauses"] != self.frontier_count
                or payload["max_var"] != self._variable_count
                or payload["solves"] != self._solve_count
            ):
                raise PiqdIncrementalDiscoveryError(
                    "remote session state is not the local logical state"
                )
            if self._solve_count:
                latest = self._journal_solves[-1]
                latest_assumptions = _canonical_assumptions(
                    latest["receipt"].get("assumptions", []),
                    self._variable_count,
                    label="latest receipt assumptions",
                    container_type=list,
                )
                expected_terminal_unsat = (
                    latest["receipt"].get("core") == []
                    if latest["status"] == "UNSAT"
                    else None
                )
                if (
                    payload["last_status"] != latest["status"]
                    or payload["last_solve_index"] != latest["solve_index"]
                    or payload["last_assumption_free"]
                    is not (not bool(latest_assumptions))
                    or payload["last_terminal_unsat"] != expected_terminal_unsat
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "remote session last-solve state is not bound"
                    )
            elif any(
                payload[key] is not None
                for key in (
                    "last_status",
                    "last_solve_index",
                    "last_assumption_free",
                    "last_terminal_unsat",
                )
            ):
                raise PiqdIncrementalDiscoveryError(
                    "remote session claims an unrecorded solve"
                )

    def _verify_blob(self) -> None:
        response = self._request(
            "GET",
            f"/jobs/{self.descriptor.producer_job_id}/blobs/{self.descriptor.seed_blob_hash}",
            expected_status=200,
        )
        if (
            response.body != self.descriptor.seed_cnf
            or _sha256(response.body) != self.descriptor.seed_blob_hash
        ):
            raise PiqdIncrementalDiscoveryError(
                "PIQD producer job blob bytes differ from descriptor bytes"
            )

    def _export(self) -> tuple[int, tuple[tuple[int, ...], ...]]:
        response = self._request(
            "GET", f"/sessions/{self._session_id}/cnf", expected_status=200
        )
        variables, clauses = parse_dimacs(response.body)
        self._remote_cnf = response.body
        self._remote_cnf_sha256 = _sha256(response.body)
        self._remote_journal = _journal_bytes(clauses)
        return variables, clauses

    def _verify_remote_frontier(self) -> None:
        variables, clauses = self._export()
        if variables != self._variable_count or clauses != tuple(self._clauses):
            raise PiqdIncrementalDiscoveryError(
                "PIQD session CNF is not the descriptor frontier"
            )

    def _reconcile_remote_frontier(self) -> None:
        """Adopt only an authoritative append-only remote suffix.

        A successful daemon append may precede a lost response or local journal
        write.  The exported CNF is the authoritative ordered frontier, so a
        strict local prefix can be repaired without resending the append.
        """

        variables, remote = self._export()
        if variables != self._seed_variables:
            raise PiqdIncrementalDiscoveryError(
                "remote CNF changed the descriptor variable universe"
            )
        local = tuple(self._clauses)
        if len(remote) < len(local) or remote[: len(local)] != local:
            raise PiqdIncrementalDiscoveryError(
                "remote CNF is not an append-only extension of local custody"
            )
        additions = remote[len(local) :]
        if not additions:
            return
        checked = [_check_clause(clause, self._variable_count) for clause in additions]
        prior = self.frontier_sha256
        self._clauses.extend(checked)
        self._append_local(
            {
                "event": "append",
                "session_id": self._session_id,
                "producer_job_id": self.descriptor.producer_job_id,
                "descriptor_root": self.descriptor.descriptor_root,
                "clauses": [list(clause) for clause in checked],
                "prior_frontier_sha256": prior,
                "frontier_count": self.frontier_count,
                "frontier_sha256": self.frontier_sha256,
                "learned_state": "not_claimed",
            }
        )

    def _event_common(self, event: Mapping[str, Any]) -> dict[str, Any]:
        if set(event) & {"schema", "sequence", "prior_event_sha256", "event_sha256"}:
            raise PiqdIncrementalDiscoveryError(
                "local event contains reserved journal keys"
            )
        payload: dict[str, Any] = {
            "schema": SCHEMA,
            "sequence": self._journal_sequence + 1,
            "prior_event_sha256": self._journal_tail,
            **event,
        }
        digest = _sha256(_json_bytes(payload))
        payload["event_sha256"] = digest
        return payload

    def _append_local(self, event: Mapping[str, Any]) -> None:
        payload = self._event_common(event)
        kind = payload.get("event")
        required = {
            "schema",
            "sequence",
            "prior_event_sha256",
            "event_sha256",
            "event",
            "session_id",
            "producer_job_id",
            "descriptor_root",
            "frontier_count",
            "frontier_sha256",
            "learned_state",
        }
        if kind == "open":
            required |= {"seed_blob_hash", "seed_sha256"}
        elif kind == "append":
            required |= {"clauses", "prior_frontier_sha256"}
        elif kind == "solve_request":
            required |= {
                "solve_index",
                "base_clauses",
                "base_bytes",
                "base_sha256",
                "assumptions",
                "timeout_ms",
                "conflict_limit",
                "include_model",
                "request_id",
                "request_sha256",
            }
        elif kind == "solve":
            required |= {
                "solve_index",
                "status",
                "result_sha256",
                "receipt",
                "model",
                "proof_verified",
                "closure_claim",
                "learned_state",
            }
            if "assumptions" in payload:
                required.add("assumptions")
        elif kind == "revive":
            pass
        else:
            raise PiqdIncrementalDiscoveryError("unknown local custody event")
        _require_keys(payload, required, label=f"local {kind} event")
        _append_file(self.receipt_path, self.custody_root, _json_bytes(payload) + b"\n")
        self._journal_sequence = payload["sequence"]
        self._journal_tail = payload["event_sha256"]

    def _validate_common_event(self, value: Mapping[str, Any], index: int) -> None:
        _require_keys(value, set(value), label="local event")
        _string(value.get("schema"), label="event.schema")
        if (
            value.get("schema") != SCHEMA
            or value.get("sequence") != index
            or value.get("prior_event_sha256")
            != (None if index == 0 else self._journal_tail)
        ):
            raise PiqdIncrementalDiscoveryError(
                "local journal sequence/hash chain is broken"
            )
        _hex64(value.get("event_sha256"), label="event.event_sha256")
        unsigned = dict(value)
        unsigned.pop("event_sha256")
        if _sha256(_json_bytes(unsigned)) != value["event_sha256"]:
            raise PiqdIncrementalDiscoveryError(
                "local event authentication hash is invalid"
            )
        if (
            value.get("session_id") != self._session_id
            or value.get("producer_job_id") != self.descriptor.producer_job_id
            or value.get("descriptor_root") != self.descriptor.descriptor_root
        ):
            raise PiqdIncrementalDiscoveryError(
                "local custody event is not descriptor-rooted"
            )
        _integer(value.get("frontier_count"), label="event.frontier_count", minimum=1)
        _hex64(value.get("frontier_sha256"), label="event.frontier_sha256")
        if value.get("learned_state") != "not_claimed":
            raise PiqdIncrementalDiscoveryError(
                "local event makes a forbidden proof or learned-state claim"
            )
        if "proof_verified" in value:
            _boolean(value["proof_verified"], label="event.proof_verified")
            if value["proof_verified"] is True:
                raise PiqdIncrementalDiscoveryError(
                    "local event makes a forbidden proof claim"
                )
        if "closure_claim" in value:
            _boolean(value["closure_claim"], label="event.closure_claim")
            if value["closure_claim"] is True:
                raise PiqdIncrementalDiscoveryError(
                    "local event makes a forbidden closure claim"
                )

    def _load_local_journal(self) -> None:
        data = _safe_read(self.receipt_path, self.custody_root, label="custody journal")
        if not data or not data.endswith(b"\n"):
            raise PiqdIncrementalDiscoveryError(
                "revival journal is empty or not line-delimited"
            )
        self._journal_sequence = -1
        self._journal_tail = None
        self._journal_solves = []
        self._pending_request = None
        for index, line in enumerate(data.splitlines(keepends=True)):
            if not line.endswith(b"\n"):
                raise PiqdIncrementalDiscoveryError(
                    "local journal has an incomplete final event"
                )
            raw_event = line[:-1]
            value = _strict_value(raw_event, label="local custody event")
            if not isinstance(value, dict):
                raise PiqdIncrementalDiscoveryError(
                    "local custody event must be an object"
                )
            if raw_event != _json_bytes(value):
                raise PiqdIncrementalDiscoveryError(
                    "local custody event is not canonical JSON"
                )
            self._validate_common_event(value, index)
            kind = value.get("event")
            if index == 0 and kind != "open":
                raise PiqdIncrementalDiscoveryError(
                    "local custody journal has no open record"
                )
            if index > 0 and kind == "open":
                raise PiqdIncrementalDiscoveryError(
                    "local custody journal has duplicate open record"
                )
            if kind == "open":
                _require_keys(
                    value,
                    {
                        "schema",
                        "sequence",
                        "prior_event_sha256",
                        "event_sha256",
                        "event",
                        "session_id",
                        "producer_job_id",
                        "seed_blob_hash",
                        "seed_sha256",
                        "descriptor_root",
                        "frontier_count",
                        "frontier_sha256",
                        "learned_state",
                    },
                    label="local open event",
                )
                if (
                    value["seed_blob_hash"] != self.descriptor.seed_blob_hash
                    or value["seed_sha256"] != self.descriptor.seed_sha256
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "local open event has another seed identity"
                    )
                if (
                    value["frontier_count"] != self.frontier_count
                    or value["frontier_sha256"] != self.frontier_sha256
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "local open event frontier is invalid"
                    )
            elif kind == "append":
                if self._pending_request is not None:
                    raise PiqdIncrementalDiscoveryError(
                        "local journal appends across a pending solve request"
                    )
                _require_keys(
                    value,
                    {
                        "schema",
                        "sequence",
                        "prior_event_sha256",
                        "event_sha256",
                        "event",
                        "session_id",
                        "producer_job_id",
                        "descriptor_root",
                        "clauses",
                        "prior_frontier_sha256",
                        "frontier_count",
                        "frontier_sha256",
                        "learned_state",
                    },
                    label="local append event",
                )
                if value["prior_frontier_sha256"] != self.frontier_sha256:
                    raise PiqdIncrementalDiscoveryError(
                        "local append chain has a frontier mismatch"
                    )
                additions = value["clauses"]
                if type(additions) is not list:
                    raise PiqdIncrementalDiscoveryError(
                        "local append record has malformed clauses"
                    )
                if not additions:
                    raise PiqdIncrementalDiscoveryError(
                        "local append record must add at least one clause"
                    )
                checked = [
                    _check_clause(clause, self._seed_variables) for clause in additions
                ]
                self._clauses.extend(checked)
                self._variable_count = max(
                    self._variable_count,
                    max(
                        (abs(lit) for clause in checked for lit in clause),
                        default=self._variable_count,
                    ),
                )
                if (
                    value["frontier_count"] != self.frontier_count
                    or value["frontier_sha256"] != self.frontier_sha256
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "local append event frontier is invalid"
                    )
            elif kind == "solve_request":
                _require_keys(
                    value,
                    {
                        "schema",
                        "sequence",
                        "prior_event_sha256",
                        "event_sha256",
                        "event",
                        "session_id",
                        "producer_job_id",
                        "descriptor_root",
                        "solve_index",
                        "base_clauses",
                        "base_bytes",
                        "base_sha256",
                        "assumptions",
                        "timeout_ms",
                        "conflict_limit",
                        "include_model",
                        "request_id",
                        "request_sha256",
                        "frontier_count",
                        "frontier_sha256",
                        "learned_state",
                    },
                    label="local solve request event",
                )
                if self._pending_request is not None:
                    raise PiqdIncrementalDiscoveryError(
                        "local journal has overlapping solve requests"
                    )
                if self._sat_contract_version != SAT_CONTRACT_CURRENT_V1:
                    raise PiqdIncrementalDiscoveryError(
                        "local solve request requires the current SAT contract"
                    )
                assumptions = _canonical_assumptions(
                    value["assumptions"],
                    self._variable_count,
                    label="local solve request assumptions",
                    container_type=list,
                )
                self._check_assumptions_enabled(assumptions)
                request_id = _uuid(
                    value["request_id"], label="local solve request request_id"
                )
                request_sha256 = _hex64(
                    value["request_sha256"],
                    label="local solve request request_sha256",
                )
                _integer(
                    value["solve_index"],
                    label="local solve request solve_index",
                    minimum=1,
                )
                _integer(
                    value["base_clauses"],
                    label="local solve request base_clauses",
                    minimum=1,
                )
                _integer(
                    value["base_bytes"],
                    label="local solve request base_bytes",
                    minimum=1,
                )
                _hex64(
                    value["base_sha256"],
                    label="local solve request base_sha256",
                )
                timeout_ms = value["timeout_ms"]
                if timeout_ms is not None:
                    _integer(
                        timeout_ms,
                        label="local solve request timeout_ms",
                        minimum=0,
                    )
                conflict_limit = value["conflict_limit"]
                if conflict_limit is not None:
                    _integer(
                        conflict_limit,
                        label="local solve request conflict_limit",
                        minimum=1,
                    )
                if value["include_model"] is not True:
                    raise PiqdIncrementalDiscoveryError(
                        "local solve request must include the model"
                    )
                local_journal = _journal_bytes(self._clauses)
                local_journal_sha256 = _sha256(local_journal)
                if (
                    value["solve_index"] != len(self._journal_solves) + 1
                    or value["base_clauses"] != self.frontier_count
                    or value["base_bytes"] != len(local_journal)
                    or value["base_sha256"] != local_journal_sha256
                    or value["frontier_count"] != self.frontier_count
                    or value["frontier_sha256"] != self.frontier_sha256
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "local solve request is bound to another frontier"
                    )
                expected_request_sha256 = _solve_request_digest(
                    base_clauses=self.frontier_count,
                    base_bytes=len(local_journal),
                    base_sha256=local_journal_sha256,
                    assumptions=assumptions,
                    conflict_limit=conflict_limit,
                    timeout_ms=timeout_ms,
                )
                if request_sha256 != expected_request_sha256:
                    raise PiqdIncrementalDiscoveryError(
                        "local solve request digest is invalid"
                    )
                self._pending_request = value
            elif kind == "solve":
                solve_keys = {
                    "schema",
                    "sequence",
                    "prior_event_sha256",
                    "event_sha256",
                    "event",
                    "session_id",
                    "producer_job_id",
                    "descriptor_root",
                    "status",
                    "solve_index",
                    "result_sha256",
                    "receipt",
                    "model",
                    "frontier_count",
                    "frontier_sha256",
                    "learned_state",
                    "proof_verified",
                    "closure_claim",
                }
                if "assumptions" in value:
                    solve_keys.add("assumptions")
                _require_keys(
                    value,
                    solve_keys,
                    label="local solve event",
                )
                if (
                    value["frontier_count"] != self.frontier_count
                    or value["frontier_sha256"] != self.frontier_sha256
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "local solve event frontier is invalid"
                    )
                if value["solve_index"] != len(self._journal_solves) + 1 or value[
                    "status"
                ] not in {"SAT", "UNSAT", "UNKNOWN"}:
                    raise PiqdIncrementalDiscoveryError(
                        "local solve sequence is not dense"
                    )
                assumptions = _canonical_assumptions(
                    value.get("assumptions", []),
                    self._variable_count,
                    label="local solve assumptions",
                    container_type=list,
                )
                if bool(assumptions) != ("assumptions" in value):
                    raise PiqdIncrementalDiscoveryError(
                        "local solve event assumptions field is not exact"
                    )
                self._check_assumptions_enabled(assumptions)
                pending = self._pending_request
                request_id = None if pending is None else pending["request_id"]
                request_sha256 = None if pending is None else pending["request_sha256"]
                if assumptions and request_id is None:
                    raise PiqdIncrementalDiscoveryError(
                        "local assumption solve has no authenticated request identity"
                    )
                self._validate_receipt(
                    value["receipt"],
                    value["status"],
                    value["receipt"].get("timeout_ms"),
                    value["receipt"].get("conflict_limit"),
                    value["model"],
                    assumptions=assumptions,
                    request_id=request_id,
                    request_sha256=request_sha256,
                    expected_index=value["solve_index"],
                    expected_hash=value["result_sha256"],
                    check_base=False,
                )
                if value["receipt"]["base_clauses"] != value["frontier_count"]:
                    raise PiqdIncrementalDiscoveryError(
                        "local solve receipt is bound to another frontier"
                    )
                if value["model"] is not None and type(value["model"]) is not list:
                    raise PiqdIncrementalDiscoveryError(
                        "local solve model is malformed"
                    )
                if value["status"] == "SAT" and assumptions:
                    model = value["model"]
                    if (
                        type(model) is not list
                        or any(
                            type(literal) is not int or literal == 0
                            for literal in model
                        )
                        or len(model) != self._variable_count
                        or {abs(literal) for literal in model}
                        != set(range(1, self._variable_count + 1))
                    ):
                        raise PiqdIncrementalDiscoveryError(
                            "local SAT solve model is not total"
                        )
                    model_values = set(model)
                    if any(
                        not any(literal in model_values for literal in clause)
                        for clause in self._clauses
                    ):
                        raise PiqdIncrementalDiscoveryError(
                            "local SAT solve model fails formula replay"
                        )
                    if any(literal not in model_values for literal in assumptions):
                        raise PiqdIncrementalDiscoveryError(
                            "local SAT solve model fails assumption replay"
                        )
                self._journal_solves.append(value)
                self._pending_request = None
            elif kind == "revive":
                _require_keys(
                    value,
                    {
                        "schema",
                        "sequence",
                        "prior_event_sha256",
                        "event_sha256",
                        "event",
                        "session_id",
                        "producer_job_id",
                        "descriptor_root",
                        "frontier_count",
                        "frontier_sha256",
                        "learned_state",
                    },
                    label="local revive event",
                )
                if (
                    value["frontier_count"] != self.frontier_count
                    or value["frontier_sha256"] != self.frontier_sha256
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "local revive event frontier is invalid"
                    )
            else:
                raise PiqdIncrementalDiscoveryError(
                    "local custody journal has an unknown event"
                )
            self._journal_sequence = index
            self._journal_tail = value["event_sha256"]
        self._solve_count = len(self._journal_solves)

    def _revive(self) -> None:
        pending_at_start = self._pending_request
        session = self._json(
            "GET", f"/sessions/{self._session_id}", expected_status=200
        )
        self._check_session_descriptor(session, reconcile=True, status_get=True)
        payload = self._json(
            "GET", f"/sessions/{self._session_id}/receipts", expected_status=200
        )
        _require_keys(
            payload,
            {
                "session_id",
                "lane",
                "journal_path",
                "receipts_path",
                "count",
                "receipts",
            },
            label="PIQD receipts",
        )
        if payload["session_id"] != self._session_id or payload["lane"] != "sat":
            raise PiqdIncrementalDiscoveryError(
                "remote receipt identity is not local custody"
            )
        if type(payload["count"]) is not int or payload["count"] < 0:
            raise PiqdIncrementalDiscoveryError("PIQD receipt count is malformed")
        if type(payload["receipts"]) is not list:
            raise PiqdIncrementalDiscoveryError("PIQD receipts is not a list")
        if payload["count"] != len(payload["receipts"]):
            raise PiqdIncrementalDiscoveryError(
                "PIQD receipt count disagrees with the receipt list"
            )
        remote_receipts = payload["receipts"]
        if len(remote_receipts) < self._solve_count:
            raise PiqdIncrementalDiscoveryError(
                "remote receipt list lost a locally authenticated solve"
            )
        remote_suffix = remote_receipts[self._solve_count :]
        if pending_at_start is not None:
            if len(remote_suffix) > 1:
                raise PiqdIncrementalDiscoveryError(
                    "pending solve revival permits at most one remote receipt"
                )
            if remote_suffix:
                pending_receipt = remote_suffix[0]
                if not isinstance(pending_receipt, dict) or any(
                    pending_receipt.get(key) != pending_at_start[key]
                    for key in ("request_id", "request_sha256")
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "pending solve revival receipt has another request identity"
                    )
            self._verify_remote_frontier()
        else:
            self._reconcile_remote_frontier()
        for local, remote in zip(
            self._journal_solves, remote_receipts[: self._solve_count], strict=True
        ):
            local_assumptions = _canonical_assumptions(
                local["receipt"]["assumptions"],
                self._variable_count,
                label="local receipt assumptions",
                container_type=list,
            )
            local_request_id = local["receipt"].get("request_id")
            local_request_sha256 = local["receipt"].get("request_sha256")
            self._validate_receipt(
                remote,
                local["status"],
                local["receipt"].get("timeout_ms"),
                local["receipt"].get("conflict_limit"),
                local["model"],
                assumptions=local_assumptions,
                request_id=local_request_id,
                request_sha256=local_request_sha256,
                expected_index=local["solve_index"],
                expected_hash=local["result_sha256"],
                check_base=False,
            )
            if remote != local["receipt"]:
                raise PiqdIncrementalDiscoveryError(
                    "remote receipt differs from local authenticated receipt"
                )
        for remote in remote_suffix:
            if not isinstance(remote, dict):
                raise PiqdIncrementalDiscoveryError(
                    "remote receipt reconciliation found a malformed receipt"
                )
            status = remote.get("status")
            index = remote.get("solve_index")
            if status != "SAT" and remote.get("model_recorded") is True:
                raise PiqdIncrementalDiscoveryError(
                    "remote non-SAT receipt claims an unrecorded model"
                )
            if status not in {"SAT", "UNSAT", "UNKNOWN"}:
                raise PiqdIncrementalDiscoveryError(
                    "remote receipt reconciliation found an invalid status"
                )
            expected_index = self._solve_count + 1
            _integer(index, label="remote receipt.solve_index", minimum=1)
            if index != expected_index:
                raise PiqdIncrementalDiscoveryError(
                    "remote receipt solve indices are not dense"
                )
            remote_assumptions = _canonical_assumptions(
                remote.get("assumptions"),
                self._variable_count,
                label="remote receipt assumptions",
                container_type=list,
            )
            self._check_assumptions_enabled(remote_assumptions)
            remote_has_request_identity = bool(
                {"request_id", "request_sha256"} & set(remote)
            )
            pending = self._pending_request
            if remote_has_request_identity and pending is None:
                raise PiqdIncrementalDiscoveryError(
                    "remote solve receipt has no authenticated pending request"
                )
            remote_request_id = None if pending is None else pending["request_id"]
            remote_request_sha256 = (
                None if pending is None else pending["request_sha256"]
            )
            if status == "SAT":
                if (
                    session["last_status"] != "SAT"
                    or session["last_solve_index"] != index
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "remote SAT receipt cannot be repaired without current session last_status SAT"
                    )
                try:
                    model_payload = self._json(
                        "GET",
                        f"/sessions/{self._session_id}/model",
                        expected_status=200,
                    )
                except BaseException as exc:
                    raise PiqdIncrementalDiscoveryError(
                        "remote SAT receipt lacks the exact model needed for journal repair"
                    ) from exc
                _require_keys(
                    model_payload, {"vars", "model"}, label="PIQD model recovery"
                )
                if model_payload["vars"] != self._variable_count:
                    raise PiqdIncrementalDiscoveryError(
                        "remote SAT model recovery changed the variable universe"
                    )
                model = model_payload["model"]
                if (
                    type(model) is not list
                    or any(type(lit) is not int or lit == 0 for lit in model)
                    or len(set(model)) != len(model)
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "remote SAT model recovery is malformed"
                    )
                if len(model) != self._variable_count or {
                    abs(lit) for lit in model if type(lit) is int
                } != set(range(1, self._variable_count + 1)):
                    raise PiqdIncrementalDiscoveryError(
                        "remote SAT model recovery is not total"
                    )
                _check_clause(model, self._variable_count)
                values = set(model)
                if any(
                    not any(lit in values for lit in clause) for clause in self._clauses
                ):
                    raise PiqdIncrementalDiscoveryError(
                        "remote SAT model recovery fails local formula replay"
                    )
                if any(literal not in values for literal in remote_assumptions):
                    raise PiqdIncrementalDiscoveryError(
                        "remote SAT model recovery fails assumption replay"
                    )
            else:
                model = None
            self._validate_receipt(
                remote,
                status,
                remote.get("timeout_ms"),
                remote.get("conflict_limit"),
                model,
                assumptions=remote_assumptions,
                request_id=remote_request_id,
                request_sha256=remote_request_sha256,
                expected_index=expected_index,
                expected_hash=remote.get("result_sha256"),
            )
            if remote["base_clauses"] != self.frontier_count:
                raise PiqdIncrementalDiscoveryError(
                    "remote solve receipt lacks the historical frontier needed for repair"
                )
            self._solve_count += 1
            self._journal_solves.append(
                {
                    "status": status,
                    "solve_index": expected_index,
                    "result_sha256": remote["result_sha256"],
                    "receipt": remote,
                    "model": model,
                }
            )
            solve_event: dict[str, Any] = {
                "event": "solve",
                "session_id": self._session_id,
                "producer_job_id": self.descriptor.producer_job_id,
                "descriptor_root": self.descriptor.descriptor_root,
                "status": status,
                "solve_index": expected_index,
                "result_sha256": remote["result_sha256"],
                "receipt": remote,
                "model": model,
                "frontier_count": self.frontier_count,
                "frontier_sha256": self.frontier_sha256,
                "learned_state": "not_claimed",
                "proof_verified": False,
                "closure_claim": False,
            }
            if remote_assumptions:
                solve_event["assumptions"] = list(remote_assumptions)
            self._append_local(solve_event)
            self._pending_request = None
        self._check_session_descriptor(session, status_get=True)
        self._append_local(
            {
                "event": "revive",
                "session_id": self._session_id,
                "producer_job_id": self.descriptor.producer_job_id,
                "descriptor_root": self.descriptor.descriptor_root,
                "frontier_count": self.frontier_count,
                "frontier_sha256": self.frontier_sha256,
                "learned_state": "not_claimed",
            }
        )

    def append_clauses(self, clauses: Sequence[Sequence[int]]) -> int:
        if self._pending_request is not None:
            raise PiqdIncrementalDiscoveryError(
                "cannot append clauses while a solve request is pending"
            )
        additions = [_check_clause(clause, self._variable_count) for clause in clauses]
        if not additions:
            return 0
        current_contract = self._sat_contract_version == SAT_CONTRACT_CURRENT_V1
        request: dict[str, Any] = {"clauses": [list(clause) for clause in additions]}
        if current_contract:
            # PIQD's current append contract is compare-and-set.  These guards
            # make a resend after a lost reply idempotent instead of silently
            # appending the batch twice.
            request.update(
                {
                    "expect_clauses": self.frontier_count,
                    "if_match_root": _sha256(_journal_bytes(self._clauses)),
                    "expect_solve_index": self._solve_count,
                }
            )
        response = self._json(
            "POST",
            f"/sessions/{self._session_id}/clauses",
            request,
            expected_status=200,
        )
        if current_contract:
            _require_keys(
                response,
                {"added", "clauses", "max_var", "replayed", "root"},
                label="PIQD current clause response",
            )
            added = _integer(
                response["added"], label="clause response.added", minimum=0
            )
            response_clauses = _integer(
                response["clauses"], label="clause response.clauses", minimum=0
            )
            max_var = _integer(
                response["max_var"], label="clause response.max_var", minimum=0
            )
            replayed = _boolean(response["replayed"], label="clause response.replayed")
            response_root = _hex64(response["root"], label="clause response.root")
        else:
            _require_keys(
                response,
                {"added", "clauses", "max_var"},
                label="PIQD clause response",
            )
            added = response["added"]
            response_clauses = response["clauses"]
            max_var = response["max_var"]
            replayed = False
            response_root = ""
        expected_count = self.frontier_count + len(additions)
        if response_clauses != expected_count:
            raise PiqdIncrementalDiscoveryError(
                "PIQD did not acknowledge the exact appended frontier"
            )
        if current_contract:
            expected_added = 0 if replayed else len(additions)
            if added != expected_added:
                raise PiqdIncrementalDiscoveryError(
                    "PIQD current clause response has an invalid replay acknowledgement"
                )
            expected_root = _sha256(_journal_bytes((*self._clauses, *tuple(additions))))
            if response_root != expected_root:
                raise PiqdIncrementalDiscoveryError(
                    "PIQD current clause response root disagrees with the append"
                )
        elif added != len(additions):
            raise PiqdIncrementalDiscoveryError(
                "PIQD did not acknowledge the exact appended frontier"
            )
        if max_var != self._variable_count:
            raise PiqdIncrementalDiscoveryError(
                "PIQD max_var disagrees with the logical frontier"
            )
        prior = self.frontier_sha256
        previous = self._clauses.copy()
        self._clauses.extend(additions)
        try:
            self._verify_remote_frontier()
            if current_contract and _sha256(self._remote_journal) != response_root:
                raise PiqdIncrementalDiscoveryError(
                    "PIQD current clause response root disagrees with the remote frontier"
                )
        except BaseException:
            self._clauses[:] = previous
            raise
        self._append_local(
            {
                "event": "append",
                "session_id": self._session_id,
                "producer_job_id": self.descriptor.producer_job_id,
                "descriptor_root": self.descriptor.descriptor_root,
                "clauses": [list(clause) for clause in additions],
                "prior_frontier_sha256": prior,
                "frontier_count": self.frontier_count,
                "frontier_sha256": self.frontier_sha256,
                "learned_state": "not_claimed",
            }
        )
        return len(additions)

    def _check_assumptions_enabled(self, assumptions: tuple[int, ...]) -> None:
        if not assumptions:
            return
        if self._sat_contract_version != SAT_CONTRACT_CURRENT_V1:
            raise PiqdIncrementalDiscoveryError(
                "nonempty assumptions require the current SAT contract"
            )
        if not self._permit_assumptions:
            raise PiqdIncrementalDiscoveryError(
                "nonempty assumptions require permit_assumptions=True"
            )

    def _validate_receipt(
        self,
        receipt: Any,
        status: str,
        timeout_ms: int | None,
        conflict_limit: int | None,
        model: Any,
        *,
        assumptions: tuple[int, ...] = (),
        request_id: str | None = None,
        request_sha256: str | None = None,
        expected_index: int,
        expected_hash: str,
        check_base: bool = True,
    ) -> None:
        receipt_optional = RECEIPT_OPTIONAL
        if self._sat_contract_version == SAT_CONTRACT_CURRENT_V1:
            receipt_optional = receipt_optional - {"effective_deadline_ms"}
        if (
            not isinstance(receipt, dict)
            or set(receipt) - (RECEIPT_REQUIRED | receipt_optional)
            or not RECEIPT_REQUIRED <= set(receipt)
        ):
            raise PiqdIncrementalDiscoveryError("PIQD receipt has an inexact schema")
        _integer(receipt["solve_index"], label="receipt.solve_index", minimum=1)
        _integer(receipt["base_clauses"], label="receipt.base_clauses", minimum=1)
        _integer(receipt["base_bytes"], label="receipt.base_bytes", minimum=1)
        _hex64(receipt["base_sha256"], label="receipt.base_sha256")
        if check_base and (
            receipt["base_clauses"] != self.frontier_count
            or receipt["base_bytes"] != len(self._remote_journal)
            or receipt["base_sha256"] != _sha256(self._remote_journal)
        ):
            raise PiqdIncrementalDiscoveryError(
                "PIQD receipt base identity is not the current frontier"
            )
        if (
            receipt["solve_index"] != expected_index
            or receipt["result_sha256"] != expected_hash
            or receipt["status"] != status
        ):
            raise PiqdIncrementalDiscoveryError("PIQD receipt solve identity mismatch")
        receipt_assumptions = _canonical_assumptions(
            receipt["assumptions"],
            self._variable_count,
            label="receipt.assumptions",
            container_type=list,
        )
        self._check_assumptions_enabled(receipt_assumptions)
        if receipt_assumptions != assumptions:
            raise PiqdIncrementalDiscoveryError(
                "PIQD receipt assumptions disagree with the solve request"
            )
        _boolean(receipt["model_recorded"], label="receipt.model_recorded")
        _integer(receipt["at"], label="receipt.at")
        _hex64(receipt["result_sha256"], label="receipt.result_sha256")
        if receipt["status"] not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise PiqdIncrementalDiscoveryError("PIQD receipt status is invalid")
        batch_fields = {
            "batch_key",
            "batch_position",
            "batch_size",
            "batch_request_sha256",
        }
        if bool(batch_fields & set(receipt)) and not batch_fields <= set(receipt):
            raise PiqdIncrementalDiscoveryError(
                "PIQD receipt has a partial batch quartet"
            )
        if batch_fields <= set(receipt):
            _uuid(receipt["batch_key"], label="receipt.batch_key")
            _integer(
                receipt["batch_position"], label="receipt.batch_position", minimum=0
            )
            _integer(receipt["batch_size"], label="receipt.batch_size", minimum=1)
            _hex64(
                receipt["batch_request_sha256"],
                label="receipt.batch_request_sha256",
            )
        for key, expected in (
            ("timeout_ms", timeout_ms),
            ("conflict_limit", conflict_limit),
        ):
            if key in receipt:
                _integer(
                    receipt[key],
                    label=f"receipt.{key}",
                    minimum=0 if key == "timeout_ms" else 1,
                )
            if expected is None:
                if key in receipt:
                    raise PiqdIncrementalDiscoveryError(
                        f"receipt unexpectedly records {key}"
                    )
            elif receipt.get(key) != expected:
                raise PiqdIncrementalDiscoveryError(
                    f"receipt {key} disagrees with solve request"
                )
        request_fields = {"request_id", "request_sha256"}
        if bool(request_fields & set(receipt)) and not request_fields <= set(receipt):
            raise PiqdIncrementalDiscoveryError(
                "PIQD receipt has a partial request identity pair"
            )
        if (request_id is None) != (request_sha256 is None):
            raise PiqdIncrementalDiscoveryError(
                "expected solve request identity is partial"
            )
        if request_id is None:
            if request_fields & set(receipt):
                raise PiqdIncrementalDiscoveryError(
                    "PIQD receipt unexpectedly records a request identity"
                )
            if assumptions:
                raise PiqdIncrementalDiscoveryError(
                    "nonempty assumptions have no solve request identity"
                )
        else:
            expected_request_id = _uuid(request_id, label="expected request_id")
            expected_request_sha256 = _hex64(
                request_sha256, label="expected request_sha256"
            )
            if request_fields - set(receipt):
                raise PiqdIncrementalDiscoveryError(
                    "PIQD receipt lacks the solve request identity"
                )
            receipt_request_id = _uuid(
                receipt["request_id"], label="receipt.request_id"
            )
            receipt_request_sha256 = _hex64(
                receipt["request_sha256"], label="receipt.request_sha256"
            )
            recomputed_request_sha256 = _solve_request_digest(
                base_clauses=receipt["base_clauses"],
                base_bytes=receipt["base_bytes"],
                base_sha256=receipt["base_sha256"],
                assumptions=receipt_assumptions,
                conflict_limit=conflict_limit,
                timeout_ms=timeout_ms,
            )
            if (
                receipt_request_id != expected_request_id
                or receipt_request_sha256 != expected_request_sha256
                or recomputed_request_sha256 != expected_request_sha256
            ):
                raise PiqdIncrementalDiscoveryError(
                    "PIQD receipt solve request identity mismatch"
                )
        if self._sat_contract_version == SAT_CONTRACT_LEGACY_V1:
            expected_deadline = None if timeout_ms is None else timeout_ms + 30_000
            if expected_deadline is None:
                if "effective_deadline_ms" in receipt:
                    raise PiqdIncrementalDiscoveryError(
                        "receipt unexpectedly records effective_deadline_ms"
                    )
            else:
                if "effective_deadline_ms" not in receipt:
                    raise PiqdIncrementalDiscoveryError(
                        "receipt lacks effective_deadline_ms for a timed solve"
                    )
                effective_deadline = _integer(
                    receipt["effective_deadline_ms"],
                    label="receipt.effective_deadline_ms",
                    minimum=30_000,
                )
                if effective_deadline != expected_deadline:
                    raise PiqdIncrementalDiscoveryError(
                        "receipt effective_deadline_ms disagrees with solve request"
                    )
        interrupted = receipt.get("interrupted_by")
        if interrupted is not None:
            _string(interrupted, label="receipt.interrupted_by", nonempty=True)
        core = receipt.get("core")
        if core is not None and (
            type(core) is not list
            or any(type(lit) is not int or lit == 0 for lit in core)
            or len(set(core)) != len(core)
        ):
            raise PiqdIncrementalDiscoveryError("receipt core is malformed")
        if core is not None:
            core_assumptions = _canonical_assumptions(
                core,
                self._variable_count,
                label="receipt.core",
                container_type=list,
            )
        else:
            core_assumptions = None
        if status == "SAT":
            if (
                receipt["model_recorded"] is not True
                or core is not None
                or interrupted is not None
                or type(model) is not list
            ):
                raise PiqdIncrementalDiscoveryError(
                    "SAT receipt/model fields are malformed"
                )
            digest_model: Sequence[int] | None = model
            digest_core = None
        elif status == "UNSAT":
            if (
                receipt["model_recorded"] is not False
                or core_assumptions is None
                or not set(core_assumptions) <= set(assumptions)
                or interrupted is not None
                or model is not None
            ):
                raise PiqdIncrementalDiscoveryError(
                    "UNSAT receipt core is not a source-derived assumption subset"
                    if assumptions
                    else "UNSAT receipt is not assumption-free terminal UNSAT"
                )
            digest_model = None
            digest_core = core_assumptions
        else:
            if (
                receipt["model_recorded"] is not False
                or core is not None
                or model is not None
            ):
                raise PiqdIncrementalDiscoveryError(
                    "UNKNOWN receipt/model fields are malformed"
                )
            digest_model = None
            digest_core = None
        if (
            _result_digest(status, interrupted, digest_core, digest_model)
            != receipt["result_sha256"]
        ):
            raise PiqdIncrementalDiscoveryError(
                "PIQD result digest does not match the current receipt/model"
            )

    def solve(
        self,
        *,
        timeout_ms: int | None = None,
        conflict_limit: int | None = None,
        assumptions: tuple[int, ...] = (),
        request_id: str | None = None,
    ) -> DiscoveryResult:
        if timeout_ms is not None and (type(timeout_ms) is not int or timeout_ms < 0):
            raise PiqdIncrementalDiscoveryError(
                "timeout_ms must be a non-negative builtin int"
            )
        if conflict_limit is not None and (
            type(conflict_limit) is not int or conflict_limit <= 0
        ):
            raise PiqdIncrementalDiscoveryError(
                "conflict_limit must be a positive builtin int"
            )
        checked_assumptions = _canonical_assumptions(
            assumptions,
            self._variable_count,
            label="assumptions",
            container_type=tuple,
        )
        self._check_assumptions_enabled(checked_assumptions)
        if request_id is not None:
            if self._sat_contract_version != SAT_CONTRACT_CURRENT_V1:
                raise PiqdIncrementalDiscoveryError(
                    "request_id requires the current SAT contract"
                )
            request_id = _uuid(request_id, label="request_id")
        if checked_assumptions and request_id is None:
            raise PiqdIncrementalDiscoveryError(
                "nonempty assumptions require a canonical request_id"
            )
        if self._pending_request is not None and request_id is None:
            raise PiqdIncrementalDiscoveryError(
                "an authenticated solve request is pending reconciliation"
            )
        used = {abs(lit) for clause in self._clauses for lit in clause}
        if not any(not clause for clause in self._clauses) and used != set(
            range(1, self._variable_count + 1)
        ):
            raise PiqdIncrementalDiscoveryError(
                "SAT solve refuses unconstrained or vacuous variables"
            )
        session_before = self._json(
            "GET", f"/sessions/{self._session_id}", expected_status=200
        )
        self._check_session_descriptor(session_before, reconcile=True, status_get=True)
        request: dict[str, Any] = {
            "assumptions": list(checked_assumptions),
            "include_model": True,
        }
        if timeout_ms is not None:
            request["timeout_ms"] = timeout_ms
        if conflict_limit is not None:
            request["conflict_limit"] = conflict_limit
        request_sha256: str | None = None
        if request_id is not None:
            request["request_id"] = request_id
            local_journal = _journal_bytes(self._clauses)
            local_journal_sha256 = _sha256(local_journal)
            request_sha256 = _solve_request_digest(
                base_clauses=self.frontier_count,
                base_bytes=len(local_journal),
                base_sha256=local_journal_sha256,
                assumptions=checked_assumptions,
                conflict_limit=conflict_limit,
                timeout_ms=timeout_ms,
            )
            request_event: dict[str, Any] = {
                "event": "solve_request",
                "session_id": self._session_id,
                "producer_job_id": self.descriptor.producer_job_id,
                "descriptor_root": self.descriptor.descriptor_root,
                "solve_index": self._solve_count + 1,
                "base_clauses": self.frontier_count,
                "base_bytes": len(local_journal),
                "base_sha256": local_journal_sha256,
                "assumptions": list(checked_assumptions),
                "timeout_ms": timeout_ms,
                "conflict_limit": conflict_limit,
                "include_model": True,
                "request_id": request_id,
                "request_sha256": request_sha256,
                "frontier_count": self.frontier_count,
                "frontier_sha256": self.frontier_sha256,
                "learned_state": "not_claimed",
            }
            if self._pending_request is None:
                self._append_local(request_event)
                self._pending_request = request_event
            elif any(
                self._pending_request.get(key) != value
                for key, value in request_event.items()
            ):
                raise PiqdIncrementalDiscoveryError(
                    "solve retry differs from the authenticated pending request"
                )
        try:
            response = self._json(
                "POST",
                f"/sessions/{self._session_id}/solve",
                request,
                expected_status=200,
            )
        except OSError:
            if request_id is None:
                raise
            response = self._json(
                "POST",
                f"/sessions/{self._session_id}/solve",
                request,
                expected_status=200,
            )
        response_keys = RESPONSE_KEYS
        response_required = {
            "status",
            "solve_ms",
            "solve_index",
            "result_sha256",
        }
        if self._sat_contract_version == SAT_CONTRACT_CURRENT_V1:
            response_keys = (response_keys - {"effective_deadline_ms"}) | {
                "replayed",
            }
            response_required = response_required | {"replayed"}
        if set(response) - response_keys or not response_required <= set(response):
            raise PiqdIncrementalDiscoveryError(
                "PIQD solve response has an inexact schema"
            )
        status = response["status"]
        if status not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise PiqdIncrementalDiscoveryError("PIQD solve status is invalid")
        _integer(response["solve_ms"], label="solve_ms", minimum=0)
        index = _integer(response["solve_index"], label="solve_index", minimum=1)
        result_hash = _hex64(response["result_sha256"], label="result_sha256")
        if self._sat_contract_version == SAT_CONTRACT_CURRENT_V1:
            if type(response["replayed"]) is not bool or (
                response["replayed"] and request_id is None
            ):
                raise PiqdIncrementalDiscoveryError(
                    "current SAT solve response replayed is not request-bound"
                )
        else:
            expected_deadline = None if timeout_ms is None else timeout_ms + 30_000
            if expected_deadline is None:
                if "effective_deadline_ms" in response:
                    raise PiqdIncrementalDiscoveryError(
                        "solve response unexpectedly records effective_deadline_ms"
                    )
            else:
                if "effective_deadline_ms" not in response:
                    raise PiqdIncrementalDiscoveryError(
                        "solve response lacks effective_deadline_ms for a timed solve"
                    )
                effective_deadline = _integer(
                    response["effective_deadline_ms"],
                    label="solve.effective_deadline_ms",
                    minimum=30_000,
                )
                if effective_deadline != expected_deadline:
                    raise PiqdIncrementalDiscoveryError(
                        "solve response effective_deadline_ms disagrees with solve request"
                    )
        if index != self._solve_count + 1:
            raise PiqdIncrementalDiscoveryError("PIQD solve index is not dense")
        model = response.get("model")
        core = response.get("core")
        interrupted = response.get("interrupted_by")
        terminal = response.get("terminal_unsat")
        if interrupted is not None:
            _string(interrupted, label="solve.interrupted_by", nonempty=True)
        if model is not None and (
            type(model) is not list
            or any(type(lit) is not int or lit == 0 for lit in model)
            or len(set(model)) != len(model)
        ):
            raise PiqdIncrementalDiscoveryError("solve model is malformed")
        if core is not None:
            core_assumptions = _canonical_assumptions(
                core,
                self._variable_count,
                label="solve.core",
                container_type=list,
            )
        else:
            core_assumptions = None
        if status == "SAT":
            if (
                model is None
                or core is not None
                or interrupted is not None
                or terminal is not None
            ):
                raise PiqdIncrementalDiscoveryError("SAT terminal fields are malformed")
            if len(model) != self._variable_count or {abs(lit) for lit in model} != set(
                range(1, self._variable_count + 1)
            ):
                raise PiqdIncrementalDiscoveryError(
                    "SAT model is not total over the session universe"
                )
            values = set(model)
            if any(
                not any(lit in values for lit in clause) for clause in self._clauses
            ):
                raise PiqdIncrementalDiscoveryError(
                    "PIQD SAT model fails local formula replay"
                )
            if any(literal not in values for literal in checked_assumptions):
                raise PiqdIncrementalDiscoveryError(
                    "PIQD SAT model fails assumption replay"
                )
            assignment = tuple(model)
        elif status == "UNSAT":
            if (
                model is not None
                or interrupted is not None
                or core_assumptions is None
                or type(terminal) is not bool
                or not set(core_assumptions) <= set(checked_assumptions)
                or terminal is not (not bool(core_assumptions))
            ):
                raise PiqdIncrementalDiscoveryError(
                    "UNSAT fields are not a source-derived assumption result"
                    if checked_assumptions
                    else "UNSAT terminal fields are not assumption-free terminal UNSAT"
                )
            assignment = ()
        else:
            if model is not None or core is not None or terminal is not None:
                raise PiqdIncrementalDiscoveryError(
                    "UNKNOWN terminal fields are malformed"
                )
            assignment = ()
        receipts = self._json(
            "GET", f"/sessions/{self._session_id}/receipts", expected_status=200
        )
        _require_keys(
            receipts,
            {
                "session_id",
                "lane",
                "journal_path",
                "receipts_path",
                "count",
                "receipts",
            },
            label="PIQD receipts",
        )
        if (
            receipts["session_id"] != self._session_id
            or receipts["lane"] != "sat"
            or receipts["count"] != self._solve_count + 1
            or type(receipts["receipts"]) is not list
            or len(receipts["receipts"]) != self._solve_count + 1
        ):
            raise PiqdIncrementalDiscoveryError(
                "PIQD solve has no exact durable receipt list"
            )
        receipt = receipts["receipts"][-1]
        self._validate_receipt(
            receipt,
            status,
            timeout_ms,
            conflict_limit,
            model,
            assumptions=checked_assumptions,
            request_id=request_id,
            request_sha256=request_sha256,
            expected_index=index,
            expected_hash=result_hash,
        )
        self._solve_count += 1
        self._journal_solves.append(
            {
                "status": status,
                "solve_index": index,
                "result_sha256": result_hash,
                "receipt": receipt,
                "model": model,
            }
        )
        solve_event: dict[str, Any] = {
            "event": "solve",
            "session_id": self._session_id,
            "producer_job_id": self.descriptor.producer_job_id,
            "descriptor_root": self.descriptor.descriptor_root,
            "status": status,
            "solve_index": index,
            "result_sha256": result_hash,
            "receipt": receipt,
            "model": model,
            "frontier_count": self.frontier_count,
            "frontier_sha256": self.frontier_sha256,
            "learned_state": "not_claimed",
            "proof_verified": False,
            "closure_claim": False,
        }
        if checked_assumptions:
            solve_event["assumptions"] = list(checked_assumptions)
        self._append_local(solve_event)
        self._pending_request = None
        session_after = self._json(
            "GET", f"/sessions/{self._session_id}", expected_status=200
        )
        self._check_session_descriptor(session_after, status_get=True)
        return DiscoveryResult(
            status,
            assignment,
            index,
            result_hash,
            receipt,
            self.frontier_count,
            self.frontier_sha256,
        )

    def __call__(
        self, cnf_path: Path, timeout_s: int, proof_path: Path | None
    ) -> DiscoveryResult:
        if proof_path is not None:
            raise PiqdIncrementalDiscoveryError(
                "PIQD incremental discovery is proof-free; use a terminal proof adapter"
            )
        if type(timeout_s) is not int or timeout_s < 0:
            raise PiqdIncrementalDiscoveryError(
                "timeout_s must be a non-negative builtin int"
            )
        variables, clauses = parse_dimacs(
            _safe_read(Path(cnf_path), self.custody_root, label="input CNF")
        )
        if (
            variables != self._variable_count
            or tuple(self._clauses) != clauses[: len(self._clauses)]
        ):
            raise PiqdIncrementalDiscoveryError(
                "input CNF is not an append-only extension of the session"
            )
        self.append_clauses(clauses[len(self._clauses) :])
        return self.solve(timeout_ms=timeout_s * 1000)

    def manifest_metadata(self) -> dict[str, Any]:
        return {
            "schema": SCHEMA,
            "session_id": self._session_id,
            "descriptor_root": self.descriptor.descriptor_root,
            "producer_job_id": self.descriptor.producer_job_id,
            "seed_blob_hash": self.descriptor.seed_blob_hash,
            "seed_sha256": self.descriptor.seed_sha256,
            "producer_manifest_sha256": self.descriptor.producer_manifest_sha256,
            "source_manifest_sha256": self.descriptor.source_manifest_sha256,
            "frontier_count": self.frontier_count,
            "frontier_sha256": self.frontier_sha256,
            "solve_count": self._solve_count,
            "proof_verified": False,
            "closure_claim": False,
            "learned_state": "not_claimed",
        }

    def _close_session_once(self) -> None:
        if self._closed:
            return
        if self._pending_request is not None:
            raise PiqdIncrementalDiscoveryError(
                "cannot close PIQD session while a request-bound solve is pending "
                "reconciliation"
            )

        if self._close_uncertain:
            try:
                payload = self._json(
                    "GET", f"/sessions/{self._session_id}", expected_status=200
                )
            except PiqdIncrementalDiscoveryError as exc:
                # A transport/HTTP failure leaves the outcome unknown; retry
                # the idempotent DELETE.  A malformed successful GET is not a
                # basis for mutating the remote session again.
                if not str(exc).startswith(
                    f"PIQD GET /sessions/{self._session_id} returned HTTP"
                ):
                    raise
            except BaseException:  # noqa: BLE001 - transport failure is uncertain
                # The transport failed before producing a response.  A retry
                # is safe because PIQD DELETE is idempotent.
                self._close_uncertain = True
            else:
                if payload.get("state") == "closed":
                    self._check_session_descriptor(
                        payload, closing=True, status_get=True
                    )
                    self._closed = True
                    self._close_uncertain = False
                    return
                self._check_session_descriptor(payload, reconcile=True, status_get=True)

        self._close_attempted = True
        try:
            response = self._request(
                "DELETE",
                f"/sessions/{self._session_id}",
                expected_status=200,
            )
        except BaseException:
            self._close_uncertain = True
            raise
        parsed_closed = False
        try:
            payload = _strict_value(response.body, label="PIQD close")
            if not isinstance(payload, dict):
                raise PiqdIncrementalDiscoveryError(
                    "PIQD close response must be a session object"
                )
            parsed_closed = payload.get("state") == "closed"
            self._check_session_descriptor(payload, closing=True)
        except BaseException:
            # Once a canonical response object says the DELETE reached closed,
            # a later local custody mismatch is a committed close, not transport
            # uncertainty.  Never send a second mutating DELETE for that case.
            self._close_uncertain = not parsed_closed
            self._closed = parsed_closed
            raise
        self._closed = True
        self._close_uncertain = False

    def close(self) -> None:
        if self._sat_contract_version != SAT_CONTRACT_CURRENT_V1:
            self._close_session_once()
            return
        try:
            self._close_session_once()
        except BaseException:
            if not self._close_uncertain:
                raise
            # Current production delegates transport-loss reconciliation to
            # this generic owner within the same public close invocation.
            self._close_session_once()


PiqdSessionDiscovery = PiqdIncrementalDiscoveryRunner
PiqdIncrementalDiscoveryAdapter = PiqdIncrementalDiscoveryRunner
