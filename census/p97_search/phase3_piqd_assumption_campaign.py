"""Streaming, proof-free PIQD assumption campaigns over a reviewed parent CNF.

The adapter deliberately retains only hashes, counts, and filesystem identity for
the parent.  Every SAT witness is replayed by streaming the parent again.  UNSAT
and UNKNOWN are discovery observations only; this module never produces proof or
closure evidence.
"""

from __future__ import annotations

import hashlib
import os
import re
import stat
import urllib.request
from collections.abc import Callable, Iterable, Mapping, Sequence
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

from census.p97_search.phase3_piqd_incremental_discovery import (
    HttpResponse,
    PiqdIncrementalDiscoveryError,
    Transport,
    _boolean,
    _canonical_assumptions,
    _hex64,
    _integer,
    _json_bytes,
    _require_keys,
    _result_digest,
    _solve_request_digest,
    _strict_value,
    _string,
    _uuid,
)

SCHEMA = "p97-piqd-assumption-campaign-v1"
EXECUTION_POLICY = "one-core-sequential-v1"
MAX_PARENT_BYTES = 512 * 1024 * 1024
MAX_PARENT_VARIABLES = 1_000_000
MAX_LINE_BYTES = 8 * 1024 * 1024
I32_MIN = -(2**31)
I32_MAX = 2**31 - 1
_NATIVE_PATH_TYPE = type(Path("/"))
_CELL_ID = re.compile(r"[a-z0-9][a-z0-9._-]*\Z")

AssumptionCampaignError = PiqdIncrementalDiscoveryError


@dataclass(frozen=True)
class CnfStreamIdentity:
    """Bounded metadata produced without retaining the CNF bytes or clauses."""

    sha256: str
    num_bytes: int
    num_vars: int
    num_clauses: int
    max_var: int
    journal_sha256: str
    journal_bytes: int
    all_variables_used: bool
    source_dev: int | None = None
    source_ino: int | None = None
    path_chain: tuple[tuple[int, int], ...] = ()


@dataclass(frozen=True)
class AssumptionCampaignSpec:
    parent_cnf_path: Path
    parent_sha256: str
    parent_num_bytes: int
    parent_num_vars: int
    parent_num_clauses: int
    producer_job_id: str
    producer_job_status: str
    producer_manifest_sha256: str
    solver_name: str
    solver_sha256: str
    solver_signature: str
    protocol_version: int
    conflict_limit: int
    timeout_ms: int | None = None
    execution_policy: str = EXECUTION_POLICY
    max_parent_variables: int = MAX_PARENT_VARIABLES

    def __post_init__(self) -> None:
        if type(self.parent_cnf_path) is not _NATIVE_PATH_TYPE:
            raise AssumptionCampaignError(
                "parent_cnf_path must be an exact native Path"
            )
        if not self.parent_cnf_path.is_absolute():
            raise AssumptionCampaignError("parent_cnf_path must be absolute")
        _hex64(self.parent_sha256, label="parent_sha256")
        _integer(self.parent_num_bytes, label="parent_num_bytes", minimum=1)
        _integer(self.parent_num_vars, label="parent_num_vars", minimum=1)
        _integer(self.parent_num_clauses, label="parent_num_clauses", minimum=1)
        if self.parent_num_bytes > MAX_PARENT_BYTES:
            raise AssumptionCampaignError("reviewed parent exceeds the 512 MiB bound")
        _uuid(self.producer_job_id, label="producer_job_id")
        _string(self.producer_job_status, label="producer_job_status", nonempty=True)
        if self.producer_job_status not in {
            "prepared",
            "confirmed",
            "running",
            "completed",
        }:
            raise AssumptionCampaignError("producer_job_status is not seedable")
        _hex64(self.producer_manifest_sha256, label="producer_manifest_sha256")
        _string(self.solver_name, label="solver_name", nonempty=True)
        _hex64(self.solver_sha256, label="solver_sha256")
        _string(self.solver_signature, label="solver_signature", nonempty=True)
        _integer(self.protocol_version, label="protocol_version", minimum=1)
        _integer(self.conflict_limit, label="conflict_limit", minimum=1)
        if self.timeout_ms is not None:
            _integer(self.timeout_ms, label="timeout_ms", minimum=0)
        if self.execution_policy != EXECUTION_POLICY:
            raise AssumptionCampaignError(
                "assumption campaigns require the exact one-core sequential policy"
            )
        if type(self.max_parent_variables) is not int or not (
            1 <= self.max_parent_variables <= MAX_PARENT_VARIABLES
        ):
            raise AssumptionCampaignError(
                "max_parent_variables exceeds the safe P97 campaign ceiling"
            )
        if self.parent_num_vars > self.max_parent_variables:
            raise AssumptionCampaignError(
                "reviewed parent exceeds the configured variable ceiling"
            )

    @property
    def descriptor_root(self) -> str:
        return hashlib.sha256(
            _json_bytes(
                {
                    "schema": SCHEMA,
                    "parent_sha256": self.parent_sha256,
                    "parent_num_bytes": self.parent_num_bytes,
                    "parent_num_vars": self.parent_num_vars,
                    "parent_num_clauses": self.parent_num_clauses,
                    "producer_job_id": self.producer_job_id,
                    "producer_job_status": self.producer_job_status,
                    "producer_manifest_sha256": self.producer_manifest_sha256,
                    "solver_name": self.solver_name,
                    "solver_sha256": self.solver_sha256,
                    "solver_signature": self.solver_signature,
                    "protocol_version": self.protocol_version,
                    "conflict_limit": self.conflict_limit,
                    "timeout_ms": self.timeout_ms,
                    "execution_policy": self.execution_policy,
                    "max_parent_variables": self.max_parent_variables,
                }
            )
        ).hexdigest()


@dataclass(frozen=True)
class AssumptionCell:
    cell_id: str
    assumptions: tuple[int, ...]

    def checked(self, num_vars: int) -> AssumptionCell:
        if type(self.cell_id) is not str or not _CELL_ID.fullmatch(self.cell_id):
            raise AssumptionCampaignError("cell_id is not canonical")
        checked = _canonical_assumptions(
            self.assumptions,
            num_vars,
            label="cell assumptions",
            container_type=tuple,
        )
        if not checked:
            raise AssumptionCampaignError("an assumption cell must be nonempty")
        return AssumptionCell(self.cell_id, checked)


@dataclass(frozen=True)
class CampaignReceipt:
    session_id: str
    solve_index: int
    base_clauses: int
    base_bytes: int
    base_sha256: str
    assumptions: tuple[int, ...]
    status: str
    model_recorded: bool
    result_sha256: str
    request_id: str
    request_sha256: str
    conflict_limit: int
    timeout_ms: int | None
    interrupted_by: str | None
    core: tuple[int, ...] | None
    at: int


@dataclass(frozen=True)
class AssumptionCampaignResult:
    session_id: str
    cell_id: str
    assumptions: tuple[int, ...]
    status: str
    assignment: tuple[int, ...]
    core: tuple[int, ...] | None
    discovery_scope: str
    solve_index: int
    request_id: str
    request_sha256: str
    result_sha256: str
    replayed: bool
    parent_sha256: str
    export_sha256: str
    receipt: CampaignReceipt
    source_replayed: bool
    proof_verified: bool = False
    closure_claim: bool = False


@dataclass(frozen=True)
class _PendingRequest:
    cell: AssumptionCell
    request_id: str
    request_sha256: str
    body: bytes


ExportDigest = Callable[[str], CnfStreamIdentity]


class _CnfScanner:
    def __init__(
        self,
        model: frozenset[int] | None = None,
        *,
        max_variables: int = MAX_PARENT_VARIABLES,
    ) -> None:
        if type(max_variables) is not int or not (1 <= max_variables <= I32_MAX):
            raise AssumptionCampaignError("CNF scanner variable ceiling is invalid")
        self.max_variables = max_variables
        self.raw = hashlib.sha256()
        self.journal = hashlib.sha256()
        self.raw_bytes = 0
        self.journal_bytes = 0
        self.num_vars: int | None = None
        self.declared_clauses: int | None = None
        self.clauses = 0
        self.max_var = 0
        self.used = bytearray()
        self.in_clause = False
        self.clause_satisfied = False
        self.model = model
        self.buffer = b""

    def feed(self, chunk: bytes) -> None:
        if type(chunk) is not bytes:
            raise AssumptionCampaignError("CNF stream chunks must be exact bytes")
        self.raw.update(chunk)
        self.raw_bytes += len(chunk)
        if self.raw_bytes > MAX_PARENT_BYTES:
            raise AssumptionCampaignError("CNF stream exceeds the 512 MiB bound")
        self.buffer += chunk
        if len(self.buffer) > MAX_LINE_BYTES and b"\n" not in self.buffer:
            raise AssumptionCampaignError("CNF contains an unbounded line")
        while b"\n" in self.buffer:
            line, self.buffer = self.buffer.split(b"\n", 1)
            self._line(line)

    def _line(self, raw_line: bytes) -> None:
        try:
            line = raw_line.decode("ascii").strip()
        except UnicodeDecodeError as exc:
            raise AssumptionCampaignError("CNF must be ASCII DIMACS") from exc
        if not line or line.startswith("c"):
            return
        fields = line.split()
        if fields[0] == "p":
            if (
                self.num_vars is not None
                or fields[:2] != ["p", "cnf"]
                or len(fields) != 4
            ):
                raise AssumptionCampaignError("CNF has a malformed or duplicate header")
            try:
                variables, clauses = int(fields[2]), int(fields[3])
            except ValueError as exc:
                raise AssumptionCampaignError(
                    "CNF header counts are not integers"
                ) from exc
            if variables <= 0 or clauses <= 0:
                raise AssumptionCampaignError("CNF header must be non-vacuous")
            if variables > I32_MAX:
                raise AssumptionCampaignError(
                    "CNF variable count exceeds Rust i32 DIMACS"
                )
            if variables > self.max_variables:
                raise AssumptionCampaignError(
                    "CNF variable count exceeds the safe campaign ceiling"
                )
            self.num_vars = variables
            self.declared_clauses = clauses
            self.used = bytearray(variables + 1)
            return
        if self.num_vars is None:
            raise AssumptionCampaignError("CNF data precedes its header")
        for field in fields:
            try:
                literal = int(field)
            except ValueError as exc:
                raise AssumptionCampaignError(
                    "CNF contains a non-integer token"
                ) from exc
            if literal == 0:
                suffix = b" 0\n" if self.in_clause else b"0\n"
                self.journal.update(suffix)
                self.journal_bytes += len(suffix)
                self.clauses += 1
                if self.model is not None and not self.clause_satisfied:
                    raise AssumptionCampaignError(
                        "SAT model fails streamed parent replay"
                    )
                self.in_clause = False
                self.clause_satisfied = False
                continue
            if literal < I32_MIN or literal > I32_MAX or literal == I32_MIN:
                raise AssumptionCampaignError(
                    "CNF literal is outside safe Rust i32 DIMACS"
                )
            if abs(literal) > self.num_vars:
                raise AssumptionCampaignError(
                    "CNF literal exceeds the declared universe"
                )
            token = str(literal).encode("ascii")
            if self.in_clause:
                self.journal.update(b" ")
                self.journal_bytes += 1
            self.journal.update(token)
            self.journal_bytes += len(token)
            self.in_clause = True
            self.max_var = max(self.max_var, abs(literal))
            self.used[abs(literal)] = 1
            if self.model is not None and literal in self.model:
                self.clause_satisfied = True

    def finish(self) -> CnfStreamIdentity:
        if self.buffer:
            self._line(self.buffer)
            self.buffer = b""
        if self.num_vars is None or self.declared_clauses is None:
            raise AssumptionCampaignError("CNF has no header")
        if self.in_clause:
            raise AssumptionCampaignError("CNF ends inside a clause")
        if self.clauses != self.declared_clauses:
            raise AssumptionCampaignError("CNF clause count disagrees with its header")
        return CnfStreamIdentity(
            self.raw.hexdigest(),
            self.raw_bytes,
            self.num_vars,
            self.clauses,
            self.max_var,
            self.journal.hexdigest(),
            self.journal_bytes,
            all(self.used[1:]),
        )


def _scan_chunks(
    chunks: Iterable[bytes],
    *,
    model: frozenset[int] | None = None,
    max_variables: int = MAX_PARENT_VARIABLES,
) -> CnfStreamIdentity:
    scanner = _CnfScanner(model, max_variables=max_variables)
    for chunk in chunks:
        scanner.feed(chunk)
    return scanner.finish()


def _open_parent_fd(path: Path) -> tuple[int, tuple[tuple[int, int], ...]]:
    flags_dir = os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC | os.O_NOFOLLOW
    fd = os.open(os.sep, flags_dir)
    root_stat = os.fstat(fd)
    chain = [(root_stat.st_dev, root_stat.st_ino)]
    try:
        for component in path.parts[1:-1]:
            next_fd = os.open(component, flags_dir, dir_fd=fd)
            os.close(fd)
            fd = next_fd
            component_stat = os.fstat(fd)
            if not stat.S_ISDIR(component_stat.st_mode):
                raise AssumptionCampaignError("CNF path component is not a directory")
            chain.append((component_stat.st_dev, component_stat.st_ino))
        file_fd = os.open(
            path.name, os.O_RDONLY | os.O_CLOEXEC | os.O_NOFOLLOW, dir_fd=fd
        )
        file_stat = os.fstat(file_fd)
        chain.append((file_stat.st_dev, file_stat.st_ino))
    except BaseException:
        os.close(fd)
        raise
    os.close(fd)
    return file_fd, tuple(chain)


def stream_parent_identity(
    path: Path,
    *,
    assignment: Sequence[int] | None = None,
    max_variables: int = MAX_PARENT_VARIABLES,
) -> CnfStreamIdentity:
    """Securely stream a native absolute DIMACS path and optionally replay a model."""

    if type(path) is not _NATIVE_PATH_TYPE or not path.is_absolute():
        raise AssumptionCampaignError("CNF path must be an exact native absolute Path")
    try:
        fd, path_chain = _open_parent_fd(path)
    except OSError as exc:
        raise AssumptionCampaignError(
            "CNF path cannot be opened componentwise without following links"
        ) from exc
    try:
        before = os.fstat(fd)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise AssumptionCampaignError("CNF source must be a unique regular file")
        if before.st_size <= 0 or before.st_size > MAX_PARENT_BYTES:
            raise AssumptionCampaignError(
                "CNF source size is outside the bounded capture"
            )
        model = None if assignment is None else frozenset(assignment)

        def chunks() -> Iterable[bytes]:
            while True:
                chunk = os.read(fd, 1024 * 1024)
                if not chunk:
                    return
                yield chunk

        identity = _scan_chunks(chunks(), model=model, max_variables=max_variables)
        after = os.fstat(fd)
        keys = ("st_dev", "st_ino", "st_size", "st_mtime_ns", "st_ctime_ns", "st_nlink")
        if any(getattr(before, key) != getattr(after, key) for key in keys):
            raise AssumptionCampaignError("CNF source changed during streaming capture")
        if identity.num_bytes != before.st_size:
            raise AssumptionCampaignError("CNF source size changed during capture")
        try:
            check_fd, check_chain = _open_parent_fd(path)
        except OSError as exc:
            raise AssumptionCampaignError(
                "CNF path changed during componentwise revalidation"
            ) from exc
        else:
            check_stat = os.fstat(check_fd)
            os.close(check_fd)
        if (
            check_chain != path_chain
            or not stat.S_ISREG(check_stat.st_mode)
            or check_stat.st_nlink != 1
        ):
            raise AssumptionCampaignError(
                "CNF pathname chain changed during streaming capture"
            )
        return replace(
            identity,
            source_dev=before.st_dev,
            source_ino=before.st_ino,
            path_chain=path_chain,
        )
    finally:
        os.close(fd)


def _default_export_digest(url: str) -> CnfStreamIdentity:
    request = urllib.request.Request(url, method="GET")
    with urllib.request.urlopen(request) as response:
        if response.status != 200:
            raise AssumptionCampaignError(
                f"PIQD session CNF export returned HTTP {response.status}"
            )

        def chunks() -> Iterable[bytes]:
            while True:
                chunk = response.read(1024 * 1024)
                if not chunk:
                    return
                yield chunk

        return _scan_chunks(chunks())


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
_RECEIPT_REQUIRED = {
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
_RECEIPT_OPTIONAL = {
    "conflict_limit",
    "timeout_ms",
    "interrupted_by",
    "core",
    "request_id",
    "request_sha256",
}
_RESPONSE_ALLOWED = {
    "status",
    "solve_ms",
    "solve_index",
    "result_sha256",
    "model",
    "core",
    "terminal_unsat",
    "interrupted_by",
    "replayed",
}


class AssumptionCampaignSession:
    """One fresh, append-free, sequential PIQD SAT assumption session."""

    def __init__(
        self,
        base_url: str,
        spec: AssumptionCampaignSpec,
        *,
        transport: Transport | None = None,
        export_digest: ExportDigest | None = None,
        job_blob_digest: ExportDigest | None = None,
    ) -> None:
        self.base_url = _string(base_url, label="base_url", nonempty=True).rstrip("/")
        self.spec = spec
        if transport is None:
            from census.p97_search.phase3_piqd_oracle import _stdlib_transport

            transport = _stdlib_transport
        self._transport = transport
        self._export_digest = export_digest or _default_export_digest
        self._job_blob_digest = job_blob_digest or _default_export_digest
        self.parent_identity = stream_parent_identity(
            spec.parent_cnf_path, max_variables=spec.max_parent_variables
        )
        self._check_parent(self.parent_identity)
        if not self.parent_identity.all_variables_used:
            raise AssumptionCampaignError(
                "parent CNF does not constrain every variable"
            )
        self._solve_count = 0
        self._last_status: str | None = None
        self._last_terminal_unsat: bool | None = None
        self._seen_cells: set[str] = set()
        self._pending: _PendingRequest | None = None
        self._closed = False
        self._close_attempted = False
        self._request_failed = False
        self._session_id = ""
        self._verify_producer()
        self._create()
        self.export_identity = self._export_digest(
            f"{self.base_url}/sessions/{self._session_id}/cnf"
        )
        self._check_export(self.export_identity)

    @property
    def session_id(self) -> str:
        return self._session_id

    @property
    def pending_request_id(self) -> str | None:
        return None if self._pending is None else self._pending.request_id

    def _check_parent(self, identity: CnfStreamIdentity) -> None:
        expected = (
            self.spec.parent_sha256,
            self.spec.parent_num_bytes,
            self.spec.parent_num_vars,
            self.spec.parent_num_clauses,
        )
        actual = (
            identity.sha256,
            identity.num_bytes,
            identity.num_vars,
            identity.num_clauses,
        )
        if actual != expected:
            raise AssumptionCampaignError("parent CNF disagrees with reviewed identity")
        if (
            hasattr(self, "parent_identity")
            and identity is not self.parent_identity
            and (
                identity.source_dev != self.parent_identity.source_dev
                or identity.source_ino != self.parent_identity.source_ino
                or identity.path_chain != self.parent_identity.path_chain
            )
        ):
            raise AssumptionCampaignError("parent CNF pathname/inode custody changed")

    def _check_export(self, identity: CnfStreamIdentity) -> None:
        if (
            identity.num_vars != self.parent_identity.num_vars
            or identity.num_clauses != self.parent_identity.num_clauses
            or identity.max_var != self.parent_identity.max_var
            or identity.journal_bytes != self.parent_identity.journal_bytes
            or identity.journal_sha256 != self.parent_identity.journal_sha256
        ):
            raise AssumptionCampaignError("PIQD CNF export is not the reviewed parent")

    def _verify_producer(self) -> None:
        job = self._json("GET", f"/jobs/{self.spec.producer_job_id}", None, 200)
        required = {
            "id",
            "status",
            "cnf_blob_hash",
            "producer_manifest_hash",
        }
        if not required <= set(job):
            raise AssumptionCampaignError(
                "PIQD producer status lacks authenticated identity fields"
            )
        if (
            _uuid(job["id"], label="producer.id") != self.spec.producer_job_id
            or _string(job["status"], label="producer.status", nonempty=True)
            != self.spec.producer_job_status
            or _hex64(job["cnf_blob_hash"], label="producer.cnf_blob_hash")
            != self.spec.parent_sha256
            or _hex64(
                job["producer_manifest_hash"],
                label="producer.producer_manifest_hash",
            )
            != self.spec.producer_manifest_sha256
        ):
            raise AssumptionCampaignError(
                "PIQD producer job/status identity is crossed"
            )
        blob = self._job_blob_digest(
            f"{self.base_url}/jobs/{self.spec.producer_job_id}/blobs/"
            f"{self.spec.parent_sha256}"
        )
        if (
            blob.sha256 != self.parent_identity.sha256
            or blob.num_bytes != self.parent_identity.num_bytes
            or blob.num_vars != self.parent_identity.num_vars
            or blob.num_clauses != self.parent_identity.num_clauses
            or blob.journal_bytes != self.parent_identity.journal_bytes
            or blob.journal_sha256 != self.parent_identity.journal_sha256
        ):
            raise AssumptionCampaignError(
                "PIQD producer blob is not the reviewed parent CNF"
            )

    def _request(
        self, method: str, path: str, body: bytes | None, expected_status: int
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
            raise AssumptionCampaignError(
                f"PIQD {method} {path} returned an invalid HTTP response"
            )
        return response

    def _json(
        self,
        method: str,
        path: str,
        body: Mapping[str, Any] | None,
        expected_status: int,
    ) -> dict[str, Any]:
        response = self._request(
            method, path, None if body is None else _json_bytes(body), expected_status
        )
        value = _strict_value(response.body, label=f"PIQD {method} {path}")
        if type(value) is not dict:
            raise AssumptionCampaignError("PIQD response must be a JSON object")
        return value

    def _create(self) -> None:
        payload = self._json(
            "POST",
            "/sessions",
            {
                "solver": self.spec.solver_name,
                "lane": "sat",
                "label": f"{SCHEMA}:{self.spec.descriptor_root}",
                "seed_blob_hash": self.spec.parent_sha256,
            },
            201,
        )
        self._session_id = _uuid(payload.get("id"), label="session.id")
        self._check_session(payload, expected_state="live")

    def _check_session(
        self, payload: Mapping[str, Any], *, expected_state: str = "live"
    ) -> None:
        allowed = _SESSION_KEYS | (
            {"solver_stats"} if "solver_stats" in payload else set()
        )
        if set(payload) != allowed:
            raise AssumptionCampaignError("PIQD session response has an inexact schema")
        if "solver_stats" in payload and type(payload["solver_stats"]) is not dict:
            raise AssumptionCampaignError(
                "session.solver_stats must be an exact object"
            )
        if (
            _uuid(payload["id"], label="session.id") != self._session_id
            or _string(payload["lane"], label="session.lane") != "sat"
            or _string(payload["state"], label="session.state") != expected_state
            or _string(
                payload["solver_name"], label="session.solver_name", nonempty=True
            )
            != self.spec.solver_name
            or _hex64(payload["solver_sha256"], label="session.solver_sha256")
            != self.spec.solver_sha256
            or _string(
                payload["solver_signature"],
                label="session.solver_signature",
                nonempty=True,
            )
            != self.spec.solver_signature
            or _integer(
                payload["protocol_version"], label="session.protocol_version", minimum=1
            )
            != self.spec.protocol_version
            or _string(payload["label"], label="session.label", nonempty=True)
            != f"{SCHEMA}:{self.spec.descriptor_root}"
        ):
            raise AssumptionCampaignError(
                "PIQD session identity is not descriptor-bound"
            )
        for key in ("journal_path",):
            _string(payload[key], label=f"session.{key}", nonempty=True)
        for key in ("created_at", "updated_at"):
            _integer(payload[key], label=f"session.{key}")
        if (
            _integer(payload["clauses"], label="session.clauses", minimum=1)
            != self.spec.parent_num_clauses
            or _integer(payload["max_var"], label="session.max_var", minimum=1)
            != self.parent_identity.max_var
            or _integer(
                payload["declared_num_vars"],
                label="session.declared_num_vars",
                minimum=1,
            )
            != self.spec.parent_num_vars
            or _integer(payload["solves"], label="session.solves", minimum=0)
            != self._solve_count
        ):
            raise AssumptionCampaignError("PIQD session frontier/counter is not bound")
        if self._solve_count == 0:
            if any(
                payload[key] is not None
                for key in (
                    "last_status",
                    "last_solve_index",
                    "last_assumption_free",
                    "last_terminal_unsat",
                )
            ):
                raise AssumptionCampaignError("fresh session claims a prior solve")
        else:
            if (
                _string(payload["last_status"], label="session.last_status")
                != self._last_status
            ):
                raise AssumptionCampaignError("session last status is not result-bound")
            if (
                _integer(
                    payload["last_solve_index"],
                    label="session.last_solve_index",
                    minimum=1,
                )
                != self._solve_count
            ):
                raise AssumptionCampaignError("session last solve index is not dense")
            if _boolean(
                payload["last_assumption_free"], label="session.last_assumption_free"
            ):
                raise AssumptionCampaignError(
                    "campaign session recorded an assumption-free solve"
                )
            terminal = payload["last_terminal_unsat"]
            if terminal is not None:
                _boolean(terminal, label="session.last_terminal_unsat")
            if terminal is not self._last_terminal_unsat:
                raise AssumptionCampaignError(
                    "session terminal-UNSAT state is not result-bound"
                )

    def append_clauses(self, _clauses: object) -> None:
        raise AssumptionCampaignError("assumption campaign sessions refuse append")

    def _validate_model(
        self, model: Any, assumptions: tuple[int, ...]
    ) -> tuple[int, ...]:
        if type(model) is not list or any(
            type(lit) is not int or lit == 0 for lit in model
        ):
            raise AssumptionCampaignError("SAT model is malformed")
        if len(model) != self.spec.parent_num_vars or {
            abs(lit) for lit in model
        } != set(range(1, self.spec.parent_num_vars + 1)):
            raise AssumptionCampaignError("SAT model is not total")
        values = frozenset(model)
        if any(literal not in values for literal in assumptions):
            raise AssumptionCampaignError("SAT model fails assumption replay")
        replay = stream_parent_identity(
            self.spec.parent_cnf_path,
            assignment=model,
            max_variables=self.spec.max_parent_variables,
        )
        self._check_parent(replay)
        return tuple(model)

    def _receipt(
        self,
        raw: Any,
        *,
        cell: AssumptionCell,
        request_id: str,
        request_sha256: str,
        status: str,
        result_sha256: str,
        model: Any,
        core: tuple[int, ...] | None,
        interrupted: str | None,
    ) -> CampaignReceipt:
        if (
            type(raw) is not dict
            or not _RECEIPT_REQUIRED <= set(raw)
            or set(raw) - (_RECEIPT_REQUIRED | _RECEIPT_OPTIONAL)
        ):
            raise AssumptionCampaignError("PIQD receipt has an inexact current schema")
        if {"request_id", "request_sha256"} - set(raw):
            raise AssumptionCampaignError("PIQD receipt lacks request identity")
        receipt_assumptions = _canonical_assumptions(
            raw["assumptions"],
            self.spec.parent_num_vars,
            label="receipt.assumptions",
            container_type=list,
        )
        receipt_status = _string(raw["status"], label="receipt.status")
        receipt_conflict_limit = _integer(
            raw.get("conflict_limit"),
            label="receipt.conflict_limit",
            minimum=1,
        )
        if (
            _integer(raw["solve_index"], label="receipt.solve_index", minimum=1)
            != self._solve_count + 1
            or _integer(raw["base_clauses"], label="receipt.base_clauses", minimum=1)
            != self.parent_identity.num_clauses
            or _integer(raw["base_bytes"], label="receipt.base_bytes", minimum=1)
            != self.parent_identity.journal_bytes
            or _hex64(raw["base_sha256"], label="receipt.base_sha256")
            != self.parent_identity.journal_sha256
            or receipt_assumptions != cell.assumptions
            or receipt_status != status
            or _hex64(raw["result_sha256"], label="receipt.result_sha256")
            != result_sha256
            or _uuid(raw["request_id"], label="receipt.request_id") != request_id
            or _hex64(raw["request_sha256"], label="receipt.request_sha256")
            != request_sha256
        ):
            raise AssumptionCampaignError("PIQD receipt is crossed or not source-bound")
        if receipt_conflict_limit != self.spec.conflict_limit:
            raise AssumptionCampaignError(
                "receipt conflict limit is not campaign-bound"
            )
        if self.spec.timeout_ms is None:
            if "timeout_ms" in raw:
                raise AssumptionCampaignError(
                    "untimed campaign receipt records a timeout"
                )
        else:
            receipt_timeout = _integer(
                raw.get("timeout_ms"), label="receipt.timeout_ms", minimum=0
            )
            if receipt_timeout != self.spec.timeout_ms:
                raise AssumptionCampaignError("receipt timeout is not campaign-bound")
        if _boolean(raw["model_recorded"], label="receipt.model_recorded") is not (
            status == "SAT"
        ):
            raise AssumptionCampaignError("receipt model flag disagrees with status")
        receipt_interrupted = raw.get("interrupted_by")
        if receipt_interrupted is not None:
            _string(receipt_interrupted, label="receipt.interrupted_by", nonempty=True)
        receipt_core = raw.get("core")
        checked_core = None
        if receipt_core is not None:
            checked_core = _canonical_assumptions(
                receipt_core,
                self.spec.parent_num_vars,
                label="receipt.core",
                container_type=list,
            )
        if checked_core != core or receipt_interrupted != interrupted:
            raise AssumptionCampaignError(
                "receipt result fields disagree with response"
            )
        digest_model: Sequence[int] | None = model if status == "SAT" else None
        if _result_digest(status, interrupted, core, digest_model) != result_sha256:
            raise AssumptionCampaignError("receipt result digest is invalid")
        return CampaignReceipt(
            self._session_id,
            raw["solve_index"],
            raw["base_clauses"],
            raw["base_bytes"],
            raw["base_sha256"],
            receipt_assumptions,
            status,
            raw["model_recorded"],
            result_sha256,
            request_id,
            request_sha256,
            self.spec.conflict_limit,
            self.spec.timeout_ms,
            interrupted,
            core,
            _integer(raw["at"], label="receipt.at"),
        )

    def _capture_bound_parent(
        self, *, assignment: Sequence[int] | None = None
    ) -> CnfStreamIdentity:
        identity = stream_parent_identity(
            self.spec.parent_cnf_path,
            assignment=assignment,
            max_variables=self.spec.max_parent_variables,
        )
        self._check_parent(identity)
        return identity

    def _accept_pending_response(
        self, response_bytes: bytes
    ) -> AssumptionCampaignResult:
        pending = self._pending
        if pending is None:
            raise AssumptionCampaignError("there is no pending solve request")
        response = _strict_value(response_bytes, label="PIQD solve response")
        if (
            type(response) is not dict
            or not {
                "status",
                "solve_ms",
                "solve_index",
                "result_sha256",
                "replayed",
            }
            <= set(response)
            or set(response) - _RESPONSE_ALLOWED
        ):
            raise AssumptionCampaignError(
                "PIQD solve response has an inexact current schema"
            )
        status = _string(response["status"], label="solve.status")
        if status not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise AssumptionCampaignError("PIQD solve status is invalid")
        _integer(response["solve_ms"], label="solve.solve_ms", minimum=0)
        solve_index = _integer(
            response["solve_index"], label="solve.solve_index", minimum=1
        )
        if solve_index != self._solve_count + 1:
            raise AssumptionCampaignError("PIQD solve index is not dense")
        result_sha256 = _hex64(response["result_sha256"], label="solve.result_sha256")
        replayed = _boolean(response["replayed"], label="solve.replayed")
        model = response.get("model")
        raw_core = response.get("core")
        terminal = response.get("terminal_unsat")
        interrupted = response.get("interrupted_by")
        if interrupted is not None:
            _string(interrupted, label="solve.interrupted_by", nonempty=True)
        assignment: tuple[int, ...] = ()
        core: tuple[int, ...] | None = None
        if status == "SAT":
            if raw_core is not None or terminal is not None or interrupted is not None:
                raise AssumptionCampaignError("SAT terminal fields are malformed")
            assignment = self._validate_model(model, pending.cell.assumptions)
            scope = "sat-witness-replayed"
        elif status == "UNSAT":
            if (
                model is not None
                or interrupted is not None
                or type(terminal) is not bool
            ):
                raise AssumptionCampaignError("UNSAT terminal fields are malformed")
            core = _canonical_assumptions(
                raw_core,
                self.spec.parent_num_vars,
                label="solve.core",
                container_type=list,
            )
            if not set(core) <= set(pending.cell.assumptions) or terminal is not (
                not core
            ):
                raise AssumptionCampaignError(
                    "UNSAT core is not a canonical assumption subset"
                )
            self._capture_bound_parent()
            scope = "terminal-discovery-only" if not core else "cell-discovery-only"
        else:
            if model is not None or raw_core is not None or terminal is not None:
                raise AssumptionCampaignError("UNKNOWN terminal fields are malformed")
            self._capture_bound_parent()
            scope = "inconclusive"
        receipts = self._json(
            "GET", f"/sessions/{self._session_id}/receipts", None, 200
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
        receipt_session_id = _uuid(receipts["session_id"], label="receipts.session_id")
        receipt_lane = _string(receipts["lane"], label="receipts.lane")
        _string(receipts["journal_path"], label="receipts.journal_path", nonempty=True)
        _string(
            receipts["receipts_path"], label="receipts.receipts_path", nonempty=True
        )
        receipt_count = _integer(receipts["count"], label="receipts.count", minimum=0)
        receipt_list = receipts["receipts"]
        if (
            receipt_session_id != self._session_id
            or receipt_lane != "sat"
            or receipt_count != self._solve_count + 1
            or type(receipt_list) is not list
            or len(receipt_list) != self._solve_count + 1
        ):
            raise AssumptionCampaignError(
                "PIQD durable receipt list is not session-bound"
            )
        receipt = self._receipt(
            receipt_list[-1],
            cell=pending.cell,
            request_id=pending.request_id,
            request_sha256=pending.request_sha256,
            status=status,
            result_sha256=result_sha256,
            model=model,
            core=core,
            interrupted=interrupted,
        )
        prior_status = self._last_status
        prior_terminal_unsat = self._last_terminal_unsat
        self._solve_count += 1
        self._last_status = status
        self._last_terminal_unsat = not core if status == "UNSAT" else None
        try:
            after = self._json("GET", f"/sessions/{self._session_id}", None, 200)
            self._check_session(after)
            self._capture_bound_parent()
        except BaseException:
            self._solve_count -= 1
            self._last_status = prior_status
            self._last_terminal_unsat = prior_terminal_unsat
            self._request_failed = True
            raise
        self._seen_cells.add(pending.cell.cell_id)
        self._pending = None
        self._request_failed = False
        return AssumptionCampaignResult(
            self._session_id,
            pending.cell.cell_id,
            pending.cell.assumptions,
            status,
            assignment,
            core,
            scope,
            solve_index,
            pending.request_id,
            pending.request_sha256,
            result_sha256,
            replayed,
            self.parent_identity.sha256,
            self.export_identity.sha256,
            receipt,
            True,
        )

    def _send_pending(self, *, retry_once: bool) -> AssumptionCampaignResult:
        pending = self._pending
        if pending is None:
            raise AssumptionCampaignError("there is no pending solve request")
        try:
            response = self._request(
                "POST", f"/sessions/{self._session_id}/solve", pending.body, 200
            )
        except (OSError, TimeoutError):
            if not retry_once:
                self._request_failed = True
                raise
            response = self._request(
                "POST", f"/sessions/{self._session_id}/solve", pending.body, 200
            )
        return self._accept_pending_response(response.body)

    def solve(
        self, cell: AssumptionCell, *, request_id: str
    ) -> AssumptionCampaignResult:
        if self._closed:
            raise AssumptionCampaignError("campaign session is closed")
        if self._pending is not None:
            raise AssumptionCampaignError(
                "an authenticated solve request is unresolved; use retry_pending()"
            )
        checked_cell = cell.checked(self.spec.parent_num_vars)
        if checked_cell.cell_id in self._seen_cells:
            raise AssumptionCampaignError("campaign cell was already solved")
        request_id = _uuid(request_id, label="request_id")
        self._capture_bound_parent()
        before = self._json("GET", f"/sessions/{self._session_id}", None, 200)
        self._check_session(before)
        request: dict[str, Any] = {
            "assumptions": list(checked_cell.assumptions),
            "include_model": True,
            "conflict_limit": self.spec.conflict_limit,
            "request_id": request_id,
        }
        if self.spec.timeout_ms is not None:
            request["timeout_ms"] = self.spec.timeout_ms
        request_sha256 = _solve_request_digest(
            base_clauses=self.parent_identity.num_clauses,
            base_bytes=self.parent_identity.journal_bytes,
            base_sha256=self.parent_identity.journal_sha256,
            assumptions=checked_cell.assumptions,
            conflict_limit=self.spec.conflict_limit,
            timeout_ms=self.spec.timeout_ms,
        )
        self._pending = _PendingRequest(
            checked_cell, request_id, request_sha256, _json_bytes(request)
        )
        try:
            return self._send_pending(retry_once=True)
        except BaseException:
            self._request_failed = True
            raise

    def retry_pending(self) -> AssumptionCampaignResult:
        """Retry exactly the authenticated pending body and reconcile its receipt."""

        if self._closed:
            raise AssumptionCampaignError("campaign session is closed")
        if self._pending is None:
            raise AssumptionCampaignError("there is no pending solve request")
        self._capture_bound_parent()
        try:
            return self._send_pending(retry_once=False)
        except BaseException:
            self._request_failed = True
            raise

    def close(self) -> None:
        if self._closed:
            return
        if self._pending is not None:
            raise AssumptionCampaignError(
                "cannot close with an unresolved solve request"
            )
        if self._close_attempted:
            status = self._json("GET", f"/sessions/{self._session_id}", None, 200)
            if status.get("state") != "closed":
                raise AssumptionCampaignError("prior close outcome is unresolved")
            self._check_session(status, expected_state="closed")
            self._closed = True
            return
        self._close_attempted = True
        response = self._request("DELETE", f"/sessions/{self._session_id}", None, 200)
        payload = _strict_value(response.body, label="PIQD close response")
        if type(payload) is not dict:
            raise AssumptionCampaignError("PIQD close response must be an object")
        self._check_session(payload, expected_state="closed")
        self._closed = True
