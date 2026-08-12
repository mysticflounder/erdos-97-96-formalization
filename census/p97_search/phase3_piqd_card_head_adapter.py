"""Current-PIQD adapter for the exact12-v14 card-head solver seam.

The adapter authenticates the current prepare/status/model/proof/clause-map/lean
HTTP shapes and the shared driver's sealed journal.  SAT is replayed locally.
UNSAT is an observational compact-LRAT handoff only: CERT-001 does not yet bind
the independently fetched proof to the submitted source CNF.
"""

from __future__ import annotations

import json
import math
import os
import re
import stat
import urllib.parse
from collections.abc import Callable, Collection, Mapping, Sequence
from dataclasses import dataclass, field
from pathlib import Path
from types import SimpleNamespace
from typing import Any

from census.card_head import exact12_v14_cell_run
from census.card_head.exact12_v14_bound_jobs import (
    build_bound_job,
    instantiate_validated_bound_job,
)
from census.card_head.exact12_v14_schedule import build_manifest, json_sha256
from census.card_head.exact12_v14_valuation import (
    added_constraints_hold,
    decode_blockers,
)
from census.card_head.sat_encoding import CadicalResult, CoverInstance, EncodingError
from census.card_head.source_faithful_candidate_surface import source_faithful_cube_ok
from census.p97_search.phase3_cegar_wave import (
    DISCOVERY_UNSAT,
    ERROR,
    LOCAL_CERTIFICATE,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    sha256_bytes,
    validate_attempt_journal,
    validate_wave_manifest,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_clause_map import (
    ClauseMapContractError,
    consume_clause_map,
)
from census.p97_search.phase3_piqd_driver import (
    DriverPolicy,
    DriverResult,
    DurableAttemptJournal,
    PiqdCegarDriver,
    PiqdDriverError,
)
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    MultipartBody,
    PiqdOracleError,
    PiqdRawDimacsClient,
    PreparedJob,
    Transport,
    raw_dimacs_identity,
    scan_dimacs,
    stdlib_http_transport,
)

PACKAGE_IDENTITY_SCHEMA = "p97-piqd-card-head-package-identity/v1"
REQUEST_SCHEMA = "p97-piqd-card-head-request/v1"
OBSERVATION_SCHEMA = "p97-piqd-card-head-unsat-observation/v1"
CERTIFICATE_KIND = "piqd-cadical-compact-lrat"
LEAN_TOOLCHAIN = "leanprover/lean4:v4.27.0"
REQUESTED_CORE_LIMIT = 1
PRODUCTION_PACKAGE_SCHEMA = "p97-piqd-card-head-production-package/v1"
PRODUCTION_RECEIPT_SCHEMA = "p97-piqd-card-head-production-canary/v1"
PRODUCTION_PACKET_SCHEMA = "p97-piqd-card-head-production-packet/v1"
PRODUCTION_RECEIPT_NAME = "canary-receipt.json"
_PRODUCTION_FALSE_CLAIMS = {
    "certificate_source_link_authenticated": False,
    "lean_replay_executed": False,
    "theorem_promotion_allowed": False,
    "source_entitlement_established": False,
    "theorem_coverage_established": False,
    "universal_lift_established": False,
    "lean_closure_established": False,
}

_HEX = frozenset("0123456789abcdef")
_JOB_ID = re.compile(r"[A-Za-z0-9][A-Za-z0-9._-]{0,127}\Z")
_MODEL_KEYS = frozenset({"job_id", "result", "num_assigned", "assignment"})


class CardHeadPiqdAdapterError(EncodingError):
    """A current PIQD response, shared journal, or artifact failed closed."""


@dataclass(frozen=True, slots=True)
class EndpointLimits:
    """Local ingress bounds, configurable only to make boundary tests small."""

    json_bytes: int = 8 * 1024 * 1024
    json_depth: int = 32
    json_nodes: int = 1_000_000
    model_bytes: int = 16 * 1024 * 1024
    proof_bytes: int = 512 * 1024 * 1024
    lean_bytes: int = 512 * 1024 * 1024
    cnf_bytes: int = 512 * 1024 * 1024
    log_bytes: int = 64 * 1024 * 1024
    journal_bytes: int = 64 * 1024 * 1024
    artifact_bytes: int = 512 * 1024 * 1024

    def __post_init__(self) -> None:
        for name in self.__dataclass_fields__:
            value = getattr(self, name)
            if type(value) is not int or value <= 0:
                raise CardHeadPiqdAdapterError(f"{name} must be a positive builtin int")


DEFAULT_LIMITS = EndpointLimits()


def _strict_json(
    raw: bytes,
    *,
    source: str,
    canonical: bool,
    max_bytes: int,
    max_depth: int,
    max_nodes: int,
) -> dict[str, Any]:
    if type(raw) is not bytes:
        raise CardHeadPiqdAdapterError(f"{source} must be builtin bytes")
    if len(raw) > max_bytes:
        raise CardHeadPiqdAdapterError(f"{source} exceeds byte limit")

    def duplicate_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate key {key!r}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw.decode("utf-8"),
            object_pairs_hook=duplicate_pairs,
            parse_constant=lambda token: (_ for _ in ()).throw(
                ValueError(f"non-finite JSON constant {token}")
            ),
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise CardHeadPiqdAdapterError(f"{source} is not strict JSON") from exc
    if type(value) is not dict:
        raise CardHeadPiqdAdapterError(f"{source} must contain one JSON object")
    nodes = 0
    pending: list[tuple[object, int]] = [(value, 1)]
    while pending:
        current, depth = pending.pop()
        nodes += 1
        if nodes > max_nodes:
            raise CardHeadPiqdAdapterError(f"{source} exceeds JSON node limit")
        if depth > max_depth:
            raise CardHeadPiqdAdapterError(f"{source} exceeds JSON depth limit")
        if type(current) is dict:
            pending.extend((child, depth + 1) for child in current.values())
        elif type(current) is list:
            pending.extend((child, depth + 1) for child in current)
    if canonical and canonical_json_bytes(value) != raw:
        raise CardHeadPiqdAdapterError(f"{source} must be canonical JSON")
    return value


def _json(
    raw: bytes, source: str, *, canonical: bool = True, limits: EndpointLimits
) -> dict[str, Any]:
    return _strict_json(
        raw,
        source=source,
        canonical=canonical,
        max_bytes=limits.json_bytes,
        max_depth=limits.json_depth,
        max_nodes=limits.json_nodes,
    )


def _exact_keys(
    value: Mapping[str, Any], expected: frozenset[str], source: str
) -> None:
    actual = frozenset(value)
    if actual != expected:
        raise CardHeadPiqdAdapterError(
            f"{source} keys mismatch: missing={sorted(expected - actual)}, "
            f"extra={sorted(actual - expected)}"
        )


def _digest(value: object, source: str) -> str:
    if type(value) is not str or len(value) != 64 or any(c not in _HEX for c in value):
        raise CardHeadPiqdAdapterError(f"{source} must be a lowercase SHA-256")
    return value


def _job_id(value: object, source: str) -> str:
    if type(value) is not str or _JOB_ID.fullmatch(value) is None:
        raise CardHeadPiqdAdapterError(f"{source} is not a safe PIQD job id")
    return value


@dataclass(frozen=True, slots=True)
class AuthenticatedPackageSnapshot:
    """Exact immutable package inputs bound by the existing wave manifest."""

    cnf: bytes
    producer_manifest: bytes
    wave_manifest_bytes: bytes
    limits: EndpointLimits = field(default=DEFAULT_LIMITS, repr=False)
    wave_manifest: Mapping[str, Any] = field(init=False, repr=False)
    cnf_sha256: str = field(init=False)
    producer_manifest_sha256: str = field(init=False)
    wave_manifest_sha256: str = field(init=False)
    package_identity: str = field(init=False)
    num_vars: int = field(init=False)
    num_clauses: int = field(init=False)

    def __post_init__(self) -> None:
        if type(self.limits) is not EndpointLimits:
            raise CardHeadPiqdAdapterError(
                "package limits must be exactly EndpointLimits"
            )
        if type(self.cnf) is not bytes or len(self.cnf) > self.limits.cnf_bytes:
            raise CardHeadPiqdAdapterError("package CNF bytes are invalid or oversized")
        producer = _json(
            self.producer_manifest, "producer manifest", limits=self.limits
        )
        wave = _json(self.wave_manifest_bytes, "wave manifest", limits=self.limits)
        if not producer:
            raise CardHeadPiqdAdapterError("producer manifest must not be empty")
        try:
            validate_wave_manifest(wave)
            num_vars, num_clauses = scan_dimacs(self.cnf)
        except (ValueError, PiqdOracleError) as exc:
            raise CardHeadPiqdAdapterError(str(exc)) from exc
        encoding = wave["encoding"]
        if encoding["cnf_sha256"] != sha256_bytes(self.cnf):
            raise CardHeadPiqdAdapterError("wave manifest CNF identity mismatch")
        if encoding["producer_manifest_sha256"] != sha256_bytes(self.producer_manifest):
            raise CardHeadPiqdAdapterError("wave manifest producer identity mismatch")
        if (encoding["num_variables"], encoding["num_clauses"]) != (
            num_vars,
            num_clauses,
        ):
            raise CardHeadPiqdAdapterError("wave manifest DIMACS dimensions mismatch")
        if wave["execution"]["backend"] != "cadical":
            raise CardHeadPiqdAdapterError("card-head adapter requires CaDiCaL")
        if wave["promotion"] != {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        }:
            raise CardHeadPiqdAdapterError(
                "package must carry only finite local claims"
            )
        wave_hash = wave_manifest_sha256(wave)
        identity = sha256_bytes(
            canonical_json_bytes(
                {
                    "schema": PACKAGE_IDENTITY_SCHEMA,
                    "cnf_sha256": encoding["cnf_sha256"],
                    "producer_manifest_sha256": encoding["producer_manifest_sha256"],
                    "wave_manifest_sha256": wave_hash,
                    "num_variables": num_vars,
                    "num_clauses": num_clauses,
                }
            )
        )
        object.__setattr__(self, "wave_manifest", wave)
        object.__setattr__(self, "cnf_sha256", encoding["cnf_sha256"])
        object.__setattr__(
            self, "producer_manifest_sha256", encoding["producer_manifest_sha256"]
        )
        object.__setattr__(self, "wave_manifest_sha256", wave_hash)
        object.__setattr__(self, "package_identity", identity)
        object.__setattr__(self, "num_vars", num_vars)
        object.__setattr__(self, "num_clauses", num_clauses)


@dataclass(frozen=True, slots=True)
class SourceFaithfulCanaryPackage:
    """Rebuilt exact12-v14 bound cell and its immutable PIQD package bytes."""

    cell_index: int
    schedule_manifest_bytes: bytes
    bound_job_bytes: bytes
    variable_map_bytes: bytes
    snapshot: AuthenticatedPackageSnapshot


@dataclass(frozen=True, slots=True)
class ProductionCanaryResult:
    """Validated terminal receipt; ``restarted`` means no transport was invoked."""

    receipt: Mapping[str, Any]
    receipt_path: Path
    restarted: bool


@dataclass(frozen=True, slots=True)
class CardHeadPiqdRequest:
    schema: str
    request_id: str
    package_identity: str
    cnf_sha256: str
    producer_manifest_sha256: str
    num_vars: int
    num_clauses: int
    backend: str
    solver_profile: str
    timeout_seconds: int
    legacy_nice: int
    proof_requested: bool
    requested_core_limit: int = field(default=REQUESTED_CORE_LIMIT, init=False)
    nice_forwarded: bool = field(default=False, init=False)
    one_process_execution_claimed: bool = field(default=False, init=False)
    one_core_execution_authenticated: bool = field(default=False, init=False)


@dataclass(frozen=True, slots=True)
class CurrentPiqdRun:
    """Shared production driver plus its strict current-HTTP observer."""

    runner: PiqdCegarDriver
    http: BoundedCurrentPiqdHttpTransport


@dataclass(frozen=True, slots=True)
class CardHeadPiqdPacket:
    """Locally assembled, authenticated view of current PIQD outputs."""

    job: PreparedJob
    driver_result: DriverResult
    terminal_record_sha256: str
    journal_sha256: str
    seal_sha256: str
    status_response: bytes
    status_canonical_receipt: bytes
    state: str
    result: str | None
    model_response: bytes | None = None
    model_canonical_receipt: bytes | None = None
    model_response_journal_sha256: str | None = None
    clause_map_response: bytes | None = None
    certificate_kind: str | None = None
    certificate: bytes | None = None
    lean_response: bytes | None = None
    proof_blob_hash: str | None = None
    kept_cnf_blob_hash: str | None = None
    kept_cnf_blob: bytes | None = None


@dataclass(frozen=True, slots=True)
class UnsatCertificateHandoff:
    certificate_kind: str
    certificate_path: Path
    clause_map_path: Path
    lean_source_path: Path
    observation_path: Path
    certificate_sha256: str
    job_id: str
    job_identity_hash: str
    clause_map_response_sha256: str
    clause_map_numbering_identity: bool
    clause_map_content_identity: bool
    lean_source_sha256: str
    journal_sha256: str
    seal_sha256: str
    replay_receipt_sha256: None = field(default=None, init=False)
    requested_core_limit: int = field(default=REQUESTED_CORE_LIMIT, init=False)
    nice_forwarded: bool = field(default=False, init=False)
    one_process_execution_authenticated: bool = field(default=True, init=False)
    one_core_execution_authenticated: bool = field(default=False, init=False)
    certificate_source_link_authenticated: bool = field(default=False, init=False)
    lean_replay_executed: bool = field(default=False, init=False)
    certificate_contract_complete: bool = field(default=False, init=False)
    theorem_promotion_allowed: bool = field(default=False, init=False)
    source_entitlement_established: bool = field(default=False, init=False)
    theorem_coverage_established: bool = field(default=False, init=False)
    universal_lift_established: bool = field(default=False, init=False)
    lean_closure_established: bool = field(default=False, init=False)


def _content_type(headers: Mapping[str, str]) -> str | None:
    found = [value for key, value in headers.items() if key.lower() == "content-type"]
    if len(found) != 1 or type(found[0]) is not str:
        return None
    return found[0].lower()


class BoundedCurrentPiqdHttpTransport:
    """Strict status/type/size wrapper for the currently deployed HTTP API."""

    def __init__(
        self,
        base_url: str,
        transport: Transport,
        *,
        limits: EndpointLimits = DEFAULT_LIMITS,
    ) -> None:
        if (
            type(base_url) is not str
            or not base_url.rstrip("/")
            or not callable(transport)
        ):
            raise CardHeadPiqdAdapterError(
                "invalid current PIQD transport configuration"
            )
        self.base_url = base_url.rstrip("/")
        self.transport = transport
        self.limits = limits
        self.responses: list[tuple[str, str, HttpResponse]] = []

    def __call__(
        self,
        method: str,
        url: str,
        body: bytes | MultipartBody | None,
        headers: Mapping[str, str],
    ) -> HttpResponse:
        prefix = f"{self.base_url}/"
        if type(url) is not str or not url.startswith(prefix):
            raise PiqdOracleError("current PIQD request escaped configured base URL")
        parsed = urllib.parse.urlsplit(url)
        path_query = parsed.path + (f"?{parsed.query}" if parsed.query else "")
        try:
            expected_type, limit = self._request_contract(method, path_query)
        except CardHeadPiqdAdapterError as exc:
            raise PiqdOracleError(str(exc)) from exc
        response = self.transport(method, url, body, headers)
        try:
            self._validate(method, path_query, response, expected_type, limit)
        except CardHeadPiqdAdapterError as exc:
            raise PiqdOracleError(str(exc)) from exc
        self.responses.append((method, path_query, response))
        return response

    def get(self, path: str) -> HttpResponse:
        return self("GET", f"{self.base_url}{path}", None, {})

    def _request_contract(self, method: str, path: str) -> tuple[str, int]:
        if method == "POST" and path == "/jobs/prepare-cnf":
            expected_type, limit = "application/json", self.limits.json_bytes
        elif method == "POST" and path.startswith("/jobs/confirm?job_id="):
            _job_id(
                urllib.parse.parse_qs(path.partition("?")[2]).get("job_id", [None])[0],
                "confirm job id",
            )
            expected_type, limit = "application/json", self.limits.json_bytes
        elif method == "GET":
            route = path.partition("?")[0]
            parts = route.strip("/").split("/")
            if len(parts) not in {2, 3, 4} or parts[0] != "jobs":
                raise CardHeadPiqdAdapterError("unsupported current PIQD GET path")
            _job_id(parts[1], "endpoint job id")
            if len(parts) == 4:
                if parts[2] != "blobs":
                    raise CardHeadPiqdAdapterError("unsupported current PIQD GET path")
                _digest(parts[3], "endpoint blob digest")
                expected_type, limit = (
                    "application/octet-stream",
                    self.limits.cnf_bytes,
                )
                suffix = "blob"
            else:
                suffix = parts[2] if len(parts) == 3 else "status"
            if suffix in {"status", "model", "clause-map"}:
                expected_type = "application/json"
                limit = (
                    self.limits.model_bytes
                    if suffix == "model"
                    else self.limits.json_bytes
                )
            elif suffix == "cnf":
                expected_type, limit = "application/octet-stream", self.limits.cnf_bytes
            elif suffix == "proof":
                expected_type, limit = (
                    "text/plain; charset=utf-8",
                    self.limits.proof_bytes,
                )
            elif suffix == "lean":
                expected_type, limit = (
                    "text/plain; charset=utf-8",
                    self.limits.lean_bytes,
                )
                query = urllib.parse.parse_qs(
                    path.partition("?")[2], strict_parsing=True
                )
                if query != {"toolchain": [LEAN_TOOLCHAIN]}:
                    raise CardHeadPiqdAdapterError(
                        "lean endpoint toolchain query mismatch"
                    )
            elif suffix == "log":
                expected_type, limit = (
                    "text/plain; charset=utf-8",
                    self.limits.log_bytes,
                )
            elif suffix == "blob":
                pass
            else:
                raise CardHeadPiqdAdapterError("unsupported current PIQD GET path")
        else:
            raise CardHeadPiqdAdapterError("unsupported current PIQD method/path")
        return expected_type, limit

    def _validate(
        self,
        method: str,
        path: str,
        response: HttpResponse,
        expected_type: str,
        limit: int,
    ) -> None:
        if (
            type(response) is not HttpResponse
            or type(response.status) is not int
            or type(response.body) is not bytes
        ):
            raise CardHeadPiqdAdapterError("transport returned malformed HttpResponse")
        if type(response.headers) is not dict or any(
            type(key) is not str or type(value) is not str
            for key, value in response.headers.items()
        ):
            raise CardHeadPiqdAdapterError(
                "transport returned malformed HttpResponse headers"
            )
        if response.status != 200:
            raise CardHeadPiqdAdapterError(
                f"current PIQD endpoint returned HTTP {response.status}"
            )
        if _content_type(response.headers) != expected_type:
            raise CardHeadPiqdAdapterError(
                "current PIQD endpoint content-type mismatch"
            )
        if len(response.body) > limit:
            raise CardHeadPiqdAdapterError("current PIQD endpoint body exceeds limit")
        if expected_type == "application/json":
            _json(
                response.body, f"{method} {path}", canonical=False, limits=self.limits
            )


def _read_bounded_nofollow(path: Path, *, max_bytes: int) -> bytes:
    directory = _open_directory_nofollow(path.parent)
    try:
        try:
            descriptor = os.open(
                path.name,
                os.O_RDONLY | os.O_NONBLOCK | getattr(os, "O_NOFOLLOW", 0),
                dir_fd=directory,
            )
        except OSError as exc:
            raise CardHeadPiqdAdapterError(
                f"cannot read no-follow: {path.name}"
            ) from exc
        try:
            before = os.fstat(descriptor)
            if (
                not stat.S_ISREG(before.st_mode)
                or before.st_nlink != 1
                or before.st_size > max_bytes
            ):
                raise CardHeadPiqdAdapterError(
                    f"file is unsafe or oversized: {path.name}"
                )
            chunks: list[bytes] = []
            remaining = before.st_size
            while remaining:
                chunk = os.read(descriptor, min(1024 * 1024, remaining))
                if not chunk:
                    raise CardHeadPiqdAdapterError(f"short read: {path.name}")
                chunks.append(chunk)
                remaining -= len(chunk)
            if os.read(descriptor, 1):
                raise CardHeadPiqdAdapterError(f"file grew during read: {path.name}")
            after = os.fstat(descriptor)
            if (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns) != (
                after.st_dev,
                after.st_ino,
                after.st_size,
                after.st_mtime_ns,
            ):
                raise CardHeadPiqdAdapterError(f"file changed during read: {path.name}")
            return b"".join(chunks)
        finally:
            os.close(descriptor)
    finally:
        os.close(directory)


def _open_directory_nofollow(path: Path) -> int:
    absolute = Path(os.path.abspath(path))
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    descriptor: int | None = None
    try:
        descriptor = os.open(absolute.anchor, flags)
        for component in absolute.parts[1:]:
            if component in {"", ".", ".."}:
                raise CardHeadPiqdAdapterError("unsafe path component")
            child = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = child
        return descriptor
    except OSError as exc:
        if descriptor is not None:
            os.close(descriptor)
        raise CardHeadPiqdAdapterError("parent missing, unsafe, or symlinked") from exc


def _write_create_once(path: Path, payload: bytes) -> None:
    directory = _open_directory_nofollow(path.parent)
    try:
        try:
            descriptor = os.open(
                path.name,
                os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
                0o600,
                dir_fd=directory,
            )
        except FileExistsError as exc:
            raise CardHeadPiqdAdapterError(
                f"artifact already exists: {path.name}"
            ) from exc
        try:
            offset = 0
            while offset < len(payload):
                written = os.write(descriptor, payload[offset:])
                if written <= 0:
                    raise CardHeadPiqdAdapterError("artifact write made no progress")
                offset += written
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
        if _read_bounded_nofollow(path, max_bytes=len(payload)) != payload:
            raise CardHeadPiqdAdapterError("artifact custody readback mismatch")
        os.fsync(directory)
    finally:
        os.close(directory)


def _capture_existing(path: Path, expected: bytes) -> None:
    if _read_bounded_nofollow(path, max_bytes=len(expected)) != expected:
        raise CardHeadPiqdAdapterError("runner-owned CNF differs from package bytes")


def _validate_job(job: PreparedJob, request: CardHeadPiqdRequest) -> None:
    if type(job) is not PreparedJob:
        raise CardHeadPiqdAdapterError("prepared job has wrong concrete type")
    _job_id(job.job_id, "prepared job id")
    if (job.backend, job.solver_profile) != (request.backend, request.solver_profile):
        raise CardHeadPiqdAdapterError("prepared job backend/profile mismatch")
    if (job.cnf_blob_hash, job.num_vars, job.num_clauses) != (
        request.cnf_sha256,
        request.num_vars,
        request.num_clauses,
    ):
        raise CardHeadPiqdAdapterError("prepared job CNF identity/dimensions mismatch")
    if (
        type(job.existing) is not bool
        or type(job.requested_core_limit) is not int
        or job.requested_core_limit != 1
    ):
        raise CardHeadPiqdAdapterError("prepared job core/existing fields invalid")
    identity = raw_dimacs_identity(
        backend=request.backend,
        solver_profile=request.solver_profile,
        cnf_sha256=request.cnf_sha256,
        producer_manifest_sha256=request.producer_manifest_sha256,
        requested_core_limit=1,
    )
    if job.identity_hash != identity:
        raise CardHeadPiqdAdapterError("prepared job identity hash mismatch")


def _journal_event(
    journal: DurableAttemptJournal,
    record: Mapping[str, Any],
    limits: EndpointLimits,
) -> dict[str, Any]:
    digest = _digest(record["artifacts"]["checkpoint_sha256"], "checkpoint digest")
    raw = _read_bounded_nofollow(
        journal.artifact_dir / digest, max_bytes=limits.artifact_bytes
    )
    if sha256_bytes(raw) != digest:
        raise CardHeadPiqdAdapterError("journal checkpoint hash mismatch")
    return _json(raw, "journal checkpoint", limits=limits)


def _prepared_from_journal(
    journal: DurableAttemptJournal,
    events: Sequence[Mapping[str, Any]],
    request: CardHeadPiqdRequest,
) -> PreparedJob:
    successes = [
        event
        for event in events
        if event["phase"] == "PREPARE" and event["disposition"] == "SUCCESS"
    ]
    if len(successes) != 1:
        raise CardHeadPiqdAdapterError("journal must contain one successful PREPARE")
    event = successes[0]
    response = event["response"]
    if type(response) is not dict:
        raise CardHeadPiqdAdapterError("journal PREPARE response malformed")
    expected = {
        "backend": request.backend,
        "solver_profile": request.solver_profile,
        "cnf_blob_hash": request.cnf_sha256,
        "identity_hash": raw_dimacs_identity(
            backend=request.backend,
            solver_profile=request.solver_profile,
            cnf_sha256=request.cnf_sha256,
            producer_manifest_sha256=request.producer_manifest_sha256,
            requested_core_limit=1,
        ),
        "num_vars": request.num_vars,
        "num_clauses": request.num_clauses,
    }
    for key, wanted in expected.items():
        if response.get(key) != wanted or type(response.get(key)) is not type(wanted):
            raise CardHeadPiqdAdapterError(f"journal PREPARE {key} mismatch")
    if type(response.get("existing")) is not bool:
        raise CardHeadPiqdAdapterError("journal PREPARE existing malformed")
    return PreparedJob(
        _job_id(event["job_id"], "journal PREPARE job id"),
        request.backend,
        request.solver_profile,
        request.cnf_sha256,
        expected["identity_hash"],
        request.num_vars,
        request.num_clauses,
        response["existing"],
        1,
    )


def _authenticate_journal(
    run: CurrentPiqdRun,
    result: DriverResult,
    request: CardHeadPiqdRequest,
    limits: EndpointLimits,
) -> tuple[PreparedJob, str]:
    journal = run.runner.journal
    if type(journal) is not DurableAttemptJournal or type(result) is not DriverResult:
        raise CardHeadPiqdAdapterError("runner did not expose exact durable evidence")
    if wave_manifest_sha256(journal.manifest) != request.request_id:
        raise CardHeadPiqdAdapterError("journal wave identity mismatch")
    raw = _read_bounded_nofollow(journal.path, max_bytes=limits.journal_bytes)
    if not raw.endswith(b"\n"):
        raise CardHeadPiqdAdapterError("journal is not newline terminated")
    decoded: list[dict[str, Any]] = []
    for index, line in enumerate(raw.splitlines(), start=1):
        decoded.append(_json(line, f"journal line {index}", limits=limits))
    try:
        validate_attempt_journal(decoded, manifest=journal.manifest)
    except ValueError as exc:
        raise CardHeadPiqdAdapterError(f"journal validation failed: {exc}") from exc
    if decoded != journal.records:
        raise CardHeadPiqdAdapterError("journal file disagrees with runner records")
    seal_raw = _read_bounded_nofollow(journal.seal_path, max_bytes=limits.json_bytes)
    if not seal_raw.endswith(b"\n"):
        raise CardHeadPiqdAdapterError("journal seal is not newline terminated")
    seal = _json(seal_raw[:-1], "journal seal", limits=limits)
    expected = {
        "record_count": len(decoded),
        "terminal_attempt_sha256": decoded[-1]["record_sha256"],
        "journal_sha256": sha256_bytes(raw),
        "wave_manifest_sha256": request.request_id,
    }
    for key, wanted in expected.items():
        if seal.get(key) != wanted or type(seal.get(key)) is not type(wanted):
            raise CardHeadPiqdAdapterError(f"journal seal {key} mismatch")
    unsigned = dict(seal)
    claimed = _digest(unsigned.pop("seal_sha256", None), "journal seal digest")
    if sha256_bytes(canonical_json_bytes(unsigned)) != claimed:
        raise CardHeadPiqdAdapterError("journal seal digest mismatch")
    events = [_journal_event(journal, record, limits) for record in decoded]
    if (
        result.job_id,
        result.outcome,
        result.terminal_record_sha256,
        result.journal_record_count,
        result.seal_sha256,
    ) != (
        events[-1]["job_id"],
        decoded[-1]["outcome"],
        decoded[-1]["record_sha256"],
        len(decoded),
        claimed,
    ):
        raise CardHeadPiqdAdapterError("DriverResult disagrees with sealed journal")
    for record in decoded:
        for digest in record["artifacts"].values():
            if digest is not None:
                artifact = _read_bounded_nofollow(
                    journal.artifact_dir / _digest(digest, "journal artifact digest"),
                    max_bytes=limits.artifact_bytes,
                )
                if sha256_bytes(artifact) != digest:
                    raise CardHeadPiqdAdapterError("journal artifact hash mismatch")
    starts = [event for event in events if event["phase"] == "DRIVER_START"]
    if len(starts) != 1 or starts[0]["response"].get("requested_core_limit") != 1:
        raise CardHeadPiqdAdapterError(
            "journal does not authenticate core-limit request"
        )
    return _prepared_from_journal(journal, events, request), sha256_bytes(raw)


def _validate_status(
    raw: bytes,
    job: PreparedJob,
    result: DriverResult,
    request: CardHeadPiqdRequest,
    limits: EndpointLimits,
) -> tuple[dict[str, Any], str | None]:
    status = _json(raw, "status response", canonical=False, limits=limits)
    if status.get("id") != job.job_id or type(status.get("id")) is not str:
        raise CardHeadPiqdAdapterError("status job id mismatch")
    if (
        status.get("backend") != request.backend
        or status.get("project") != "erdos-97-96-formalization"
    ):
        raise CardHeadPiqdAdapterError("status backend/project mismatch")
    if status.get("status") not in {"completed", "failed"}:
        raise CardHeadPiqdAdapterError("status is not terminal")
    solver_result = status.get("result")
    if solver_result not in {"SAT", "UNSAT", "UNKNOWN", None}:
        raise CardHeadPiqdAdapterError("status result invalid")
    if status["status"] == "completed" and solver_result is None:
        raise CardHeadPiqdAdapterError("completed status lacks result")
    if (
        status.get("requested_core_limit") != 1
        or type(status.get("requested_core_limit")) is not int
    ):
        raise CardHeadPiqdAdapterError("status core-limit evidence mismatch")
    if (
        status.get("attested_solver_processes") != 1
        or type(status.get("attested_solver_processes")) is not int
    ):
        raise CardHeadPiqdAdapterError("status process attestation mismatch")
    if status.get("attestation_basis") != "SINGLE_PROCESS_NO_PARALLEL_FLAG":
        raise CardHeadPiqdAdapterError("status attestation basis mismatch")
    expected_outcome = {"SAT": STRUCTURAL_SAT, "UNSAT": DISCOVERY_UNSAT}.get(
        solver_result
    )
    if result.outcome != expected_outcome and not (
        solver_result == "UNKNOWN" and result.outcome == ERROR
    ):
        raise CardHeadPiqdAdapterError("status and journal terminal result disagree")
    return status, solver_result


def _validate_lrat(proof: bytes, *, max_bytes: int) -> None:
    if type(proof) is not bytes or not proof or len(proof) > max_bytes:
        raise CardHeadPiqdAdapterError("compact LRAT is empty or oversized")
    try:
        text = proof.decode("ascii")
    except UnicodeDecodeError as exc:
        raise CardHeadPiqdAdapterError("compact LRAT must be ASCII") from exc
    if not text.endswith("\n"):
        raise CardHeadPiqdAdapterError("compact LRAT must be newline terminated")
    saw_empty = False
    for line in text.splitlines():
        tokens = line.split()
        try:
            values = [int(token) for token in tokens]
        except ValueError as exc:
            raise CardHeadPiqdAdapterError(
                "compact LRAT contains a non-integer"
            ) from exc
        if not values or values[0] <= 0 or 0 not in values[1:]:
            raise CardHeadPiqdAdapterError("compact LRAT record is malformed")
        first_zero = values.index(0, 1)
        if first_zero == 1:
            saw_empty = True
        if values[-1] != 0:
            raise CardHeadPiqdAdapterError("compact LRAT record lacks final zero")
    if not saw_empty:
        raise CardHeadPiqdAdapterError("compact LRAT lacks an empty-clause record")


def _lean_quote(value: bytes) -> str:
    text = value.decode("ascii")
    return json.dumps(text, ensure_ascii=True)


def _validate_lean_observation(
    raw: bytes, *, job: PreparedJob, kept_cnf: bytes, proof: bytes
) -> None:
    try:
        text = raw.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise CardHeadPiqdAdapterError("lean endpoint is not UTF-8") from exc
    theorem = f"theorem piqd_job_{job.job_id.replace('-', '_')}_unsat"
    if f"def cnfText : String :=\n  {_lean_quote(kept_cnf)}" not in text:
        raise CardHeadPiqdAdapterError("lean endpoint CNF text mismatch")
    if f"def lratText : String :=\n  {_lean_quote(proof)}" not in text:
        raise CardHeadPiqdAdapterError("lean endpoint LRAT text mismatch")
    if theorem not in text:
        raise CardHeadPiqdAdapterError("lean endpoint theorem/job mismatch")


RunFactory = Callable[[CardHeadPiqdRequest], CurrentPiqdRun]


class CurrentPiqdPacketAssembler:
    """Run the shared driver and assemble only current endpoint contracts."""

    def __init__(
        self,
        package: AuthenticatedPackageSnapshot,
        run_factory: RunFactory,
        *,
        fetch_certified_kept_blob: bool = False,
    ) -> None:
        if type(fetch_certified_kept_blob) is not bool:
            raise CardHeadPiqdAdapterError(
                "fetch_certified_kept_blob must be builtin bool"
            )
        self.package = package
        self.run_factory = run_factory
        self.fetch_certified_kept_blob = fetch_certified_kept_blob

    @staticmethod
    def _get(run: CurrentPiqdRun, path: str) -> HttpResponse:
        try:
            return run.http.get(path)
        except PiqdOracleError as exc:
            raise CardHeadPiqdAdapterError(
                f"current PIQD observation failed: {exc}"
            ) from exc

    def __call__(self, request: CardHeadPiqdRequest) -> CardHeadPiqdPacket:
        run = self.run_factory(request)
        if (
            type(run) is not CurrentPiqdRun
            or type(run.http) is not BoundedCurrentPiqdHttpTransport
        ):
            raise CardHeadPiqdAdapterError(
                "run factory returned unsupported current core"
            )
        try:
            driver_result = run.runner.run(
                wave_manifest=self.package.wave_manifest,
                cnf=self.package.cnf,
                producer_manifest=self.package.producer_manifest,
            )
        except (PiqdDriverError, PiqdOracleError) as exc:
            raise CardHeadPiqdAdapterError(f"shared PIQD runner failed: {exc}") from exc
        job, journal_hash = _authenticate_journal(
            run, driver_result, request, self.package.limits
        )
        _validate_job(job, request)
        status_response = self._get(run, f"/jobs/{job.job_id}")
        status, solver_result = _validate_status(
            status_response.body, job, driver_result, request, self.package.limits
        )
        canonical_status = canonical_json_bytes(status)
        if solver_result == "SAT":
            model_response = self._get(run, f"/jobs/{job.job_id}/model").body
            model = _json(
                model_response,
                "model response",
                canonical=False,
                limits=self.package.limits,
            )
            journal_model_hash = run.runner.journal.records[-1]["artifacts"][
                "model_sha256"
            ]
            if journal_model_hash != sha256_bytes(model_response):
                raise CardHeadPiqdAdapterError(
                    "model endpoint disagrees with journal artifact"
                )
            return CardHeadPiqdPacket(
                job,
                driver_result,
                driver_result.terminal_record_sha256,
                journal_hash,
                driver_result.seal_sha256,
                status_response.body,
                canonical_status,
                str(status["status"]),
                "SAT",
                model_response,
                canonical_json_bytes(model),
                journal_model_hash,
            )
        if solver_result == "UNSAT":
            proof_response = self._get(run, f"/jobs/{job.job_id}/proof")
            header_values = [
                value
                for key, value in proof_response.headers.items()
                if key.lower() == "x-proof-blob-hash"
            ]
            if header_values != [sha256_bytes(proof_response.body)]:
                raise CardHeadPiqdAdapterError("proof endpoint hash header mismatch")
            proof_blob_hash = header_values[0]
            _validate_lrat(
                proof_response.body, max_bytes=self.package.limits.proof_bytes
            )
            clause_map = self._get(run, f"/jobs/{job.job_id}/clause-map").body
            lean_path = f"/jobs/{job.job_id}/lean?{urllib.parse.urlencode({'toolchain': LEAN_TOOLCHAIN})}"
            lean = self._get(run, lean_path).body
            kept_cnf_blob_hash: str | None = None
            kept_cnf_blob: bytes | None = None
            if self.fetch_certified_kept_blob:
                kept_cnf_blob_hash = _digest(
                    status.get("kept_cnf_blob_hash"),
                    "status kept_cnf_blob_hash",
                )
                kept_cnf_blob = self._get(
                    run,
                    f"/jobs/{job.job_id}/blobs/{kept_cnf_blob_hash}",
                ).body
                if sha256_bytes(kept_cnf_blob) != kept_cnf_blob_hash:
                    raise CardHeadPiqdAdapterError(
                        "kept CNF blob bytes disagree with status hash"
                    )
            return CardHeadPiqdPacket(
                job,
                driver_result,
                driver_result.terminal_record_sha256,
                journal_hash,
                driver_result.seal_sha256,
                status_response.body,
                canonical_status,
                str(status["status"]),
                "UNSAT",
                clause_map_response=clause_map,
                certificate_kind=CERTIFICATE_KIND,
                certificate=proof_response.body,
                lean_response=lean,
                proof_blob_hash=proof_blob_hash,
                kept_cnf_blob_hash=kept_cnf_blob_hash,
                kept_cnf_blob=kept_cnf_blob,
            )
        return CardHeadPiqdPacket(
            job,
            driver_result,
            driver_result.terminal_record_sha256,
            journal_hash,
            driver_result.seal_sha256,
            status_response.body,
            canonical_status,
            str(status["status"]),
            solver_result,
        )


PacketTransport = Callable[[CardHeadPiqdRequest], CardHeadPiqdPacket]


class CardHeadPiqdAdapter:
    """Callable solver adapter for ``exact12_v14_cell_run.run_cell``."""

    def __init__(
        self, package: AuthenticatedPackageSnapshot, *, transport: PacketTransport
    ) -> None:
        if type(package) is not AuthenticatedPackageSnapshot or not callable(transport):
            raise CardHeadPiqdAdapterError(
                "adapter requires authenticated package/transport"
            )
        self.package = package
        self.transport = transport
        self.last_request: CardHeadPiqdRequest | None = None
        self.last_packet: CardHeadPiqdPacket | None = None
        self.last_unsat_handoff: UnsatCertificateHandoff | None = None

    def _request(
        self, timeout_seconds: int, nice: int, proof_requested: bool
    ) -> CardHeadPiqdRequest:
        execution = self.package.wave_manifest["execution"]
        return CardHeadPiqdRequest(
            REQUEST_SCHEMA,
            self.package.wave_manifest_sha256,
            self.package.package_identity,
            self.package.cnf_sha256,
            self.package.producer_manifest_sha256,
            self.package.num_vars,
            self.package.num_clauses,
            execution["backend"],
            execution["solver_profile"],
            timeout_seconds,
            nice,
            proof_requested,
        )

    def __call__(
        self,
        instance: CoverInstance,
        cnf_path: Path,
        *,
        extra_clauses: Sequence[Collection[int]] = (),
        timeout_seconds: int = 30,
        nice: int = 10,
        proof_path: Path | None = None,
    ) -> CadicalResult:
        if type(timeout_seconds) is not int or timeout_seconds <= 0:
            raise CardHeadPiqdAdapterError(
                "timeout_seconds must be positive builtin int"
            )
        if type(nice) is not int or not 1 <= nice <= 19:
            raise CardHeadPiqdAdapterError("nice must be builtin int in 1..19")
        if not isinstance(cnf_path, Path) or (
            proof_path is not None and not isinstance(proof_path, Path)
        ):
            raise CardHeadPiqdAdapterError("artifact paths must be Path values")
        try:
            cnf = instance.dimacs(extra_clauses).encode("ascii")
        except (AttributeError, UnicodeEncodeError, ValueError, TypeError) as exc:
            raise CardHeadPiqdAdapterError(
                "instance cannot emit exact ASCII DIMACS"
            ) from exc
        if cnf != self.package.cnf:
            raise CardHeadPiqdAdapterError(
                "solver CNF differs from authenticated package"
            )
        _capture_existing(cnf_path, cnf)
        request = self._request(timeout_seconds, nice, proof_path is not None)
        self.last_request = request
        self.last_packet = None
        self.last_unsat_handoff = None
        packet = self.transport(request)
        if type(packet) is not CardHeadPiqdPacket:
            raise CardHeadPiqdAdapterError("transport returned wrong packet type")
        self.last_packet = packet
        _validate_job(packet.job, request)
        if (
            packet.driver_result.job_id != packet.job.job_id
            or packet.terminal_record_sha256
            != packet.driver_result.terminal_record_sha256
        ):
            raise CardHeadPiqdAdapterError(
                "packet/driver job or terminal record mismatch"
            )
        if packet.result == "SAT":
            return self._sat_result(instance, packet)
        if packet.result == "UNSAT":
            return self._unsat_result(packet, proof_path)
        if any(
            value is not None
            for value in (
                packet.model_response,
                packet.clause_map_response,
                packet.certificate,
                packet.lean_response,
            )
        ):
            raise CardHeadPiqdAdapterError("non-result packet carries artifacts")
        return CadicalResult(
            "UNKNOWN", None, None, False, "PIQD non-promotable terminal result", None
        )

    def _sat_result(
        self, instance: CoverInstance, packet: CardHeadPiqdPacket
    ) -> CadicalResult:
        if (
            type(packet.model_response) is not bytes
            or type(packet.model_canonical_receipt) is not bytes
        ):
            raise CardHeadPiqdAdapterError(
                "SAT packet lacks raw/canonical model evidence"
            )
        if any(
            value is not None
            for value in (
                packet.clause_map_response,
                packet.certificate,
                packet.lean_response,
            )
        ):
            raise CardHeadPiqdAdapterError("SAT packet carries UNSAT artifacts")
        terminal = packet.driver_result
        journal_record = terminal.terminal_record_sha256
        if packet.terminal_record_sha256 != journal_record:
            raise CardHeadPiqdAdapterError("SAT terminal record mismatch")
        model = _json(
            packet.model_response,
            "model response",
            canonical=False,
            limits=self.package.limits,
        )
        _exact_keys(model, _MODEL_KEYS, "model response")
        if canonical_json_bytes(model) != packet.model_canonical_receipt:
            raise CardHeadPiqdAdapterError("model canonical receipt mismatch")
        if packet.model_response_journal_sha256 != sha256_bytes(packet.model_response):
            raise CardHeadPiqdAdapterError("raw model bytes disagree with journal hash")
        if model["job_id"] != packet.job.job_id or model["result"] != "SAT":
            raise CardHeadPiqdAdapterError("model job/result mismatch")
        assignment, count = model["assignment"], model["num_assigned"]
        if (
            type(assignment) is not list
            or type(count) is not int
            or count != len(assignment)
            or count != packet.job.num_vars
        ):
            raise CardHeadPiqdAdapterError("SAT model is not a total assignment")
        if any(type(literal) is not int for literal in assignment):
            raise CardHeadPiqdAdapterError("SAT model literals must be builtin ints")
        try:
            scan_dimacs(self.package.cnf, assignment=assignment)
            positive = frozenset(literal for literal in assignment if literal > 0)
            cube = instance.decode_model(positive)
        except (EncodingError, PiqdOracleError, TypeError, ValueError) as exc:
            raise CardHeadPiqdAdapterError(f"SAT replay failed: {exc}") from exc
        if not source_faithful_cube_ok(instance.model, cube):
            raise CardHeadPiqdAdapterError("SAT cube fails source-faithful semantics")
        return CadicalResult(
            "SAT",
            cube,
            10,
            False,
            "PIQD SAT; raw model authenticated and semantics replayed",
            positive,
        )

    def _unsat_result(
        self, packet: CardHeadPiqdPacket, proof_path: Path | None
    ) -> CadicalResult:
        if (
            packet.model_response is not None
            or packet.certificate_kind != CERTIFICATE_KIND
        ):
            raise CardHeadPiqdAdapterError("UNSAT artifact kinds mismatch")
        if not all(
            type(value) is bytes
            for value in (
                packet.certificate,
                packet.clause_map_response,
                packet.lean_response,
            )
        ):
            raise CardHeadPiqdAdapterError("UNSAT lacks exact proof/map/lean bytes")
        proof = packet.certificate
        clause_map_raw = packet.clause_map_response
        lean = packet.lean_response
        assert proof is not None and clause_map_raw is not None and lean is not None
        _validate_lrat(proof, max_bytes=self.package.limits.proof_bytes)
        try:
            clause_map = consume_clause_map(
                clause_map_raw, self.package.cnf, packet.job
            )
        except ClauseMapContractError as exc:
            raise CardHeadPiqdAdapterError(
                f"clause-map validation failed: {exc}"
            ) from exc
        if not clause_map.numbering_identity or not clause_map.content_identity:
            raise CardHeadPiqdAdapterError(
                "UNSAT requires exact clause numbering/content"
            )
        _validate_lean_observation(
            lean, job=packet.job, kept_cnf=clause_map.canonical_kept_cnf, proof=proof
        )
        if proof_path is None:
            return CadicalResult(
                "UNSAT",
                None,
                20,
                False,
                "PIQD UNSAT observation; typed handoff deferred to terminal call",
                None,
            )
        certificate_path = proof_path.with_suffix(".lrat")
        if certificate_path == proof_path:
            raise CardHeadPiqdAdapterError(
                "compact LRAT may not occupy legacy .drat path"
            )
        map_path = proof_path.with_suffix(".clause-map.json")
        lean_path = proof_path.with_suffix(".lean")
        observation_path = proof_path.with_suffix(".piqd-observation.json")
        observation = canonical_json_bytes(
            {
                "schema": OBSERVATION_SCHEMA,
                "certificate_kind": CERTIFICATE_KIND,
                "certificate_path": str(certificate_path),
                "certificate_sha256": sha256_bytes(proof),
                "clause_map_path": str(map_path),
                "clause_map_response_sha256": sha256_bytes(clause_map_raw),
                "clause_map_numbering_identity": True,
                "clause_map_content_identity": True,
                "lean_source_path": str(lean_path),
                "lean_source_sha256": sha256_bytes(lean),
                "job_id": packet.job.job_id,
                "job_identity_hash": packet.job.identity_hash,
                "journal_sha256": packet.journal_sha256,
                "seal_sha256": packet.seal_sha256,
                "certificate_source_link_authenticated": False,
                "lean_replay_executed": False,
                "replay_receipt_sha256": None,
                "theorem_promotion_allowed": False,
                "source_entitlement_established": False,
                "theorem_coverage_established": False,
                "universal_lift_established": False,
                "lean_closure_established": False,
            }
        )
        _write_create_once(certificate_path, proof)
        _write_create_once(map_path, clause_map_raw)
        _write_create_once(lean_path, lean)
        _write_create_once(observation_path, observation)
        self.last_unsat_handoff = UnsatCertificateHandoff(
            CERTIFICATE_KIND,
            certificate_path,
            map_path,
            lean_path,
            observation_path,
            sha256_bytes(proof),
            packet.job.job_id,
            packet.job.identity_hash,
            sha256_bytes(clause_map_raw),
            True,
            True,
            sha256_bytes(lean),
            packet.journal_sha256,
            packet.seal_sha256,
        )
        return CadicalResult(
            "UNSAT",
            None,
            20,
            False,
            "PIQD UNSAT observation; CERT-001 source-proof linkage absent",
            None,
        )


def build_source_faithful_canary_package(
    repo_root: Path, cell_index: int, *, limits: EndpointLimits = DEFAULT_LIMITS
) -> SourceFaithfulCanaryPackage:
    """Rebuild the current bound-cell producer path and bind its decoder map."""

    if not isinstance(repo_root, Path) or type(cell_index) is not int:
        raise CardHeadPiqdAdapterError("repo_root/cell_index types are invalid")
    schedule = build_manifest(repo_root)
    job = build_bound_job(schedule, repo_root, cell_index)
    materialized = instantiate_validated_bound_job(job, schedule, repo_root)
    instance = materialized.instance
    compiled = materialized.compiled
    cnf = instance.dimacs().encode("ascii")
    schedule_bytes = canonical_json_bytes(schedule)
    job_bytes = canonical_json_bytes(job)
    variable_map_bytes = canonical_json_bytes(
        {
            "schema": "p97-piqd-card-head-total-variable-map/v1",
            "cell_index": cell_index,
            "num_variables": instance.cnf.n_variables,
            "choice_variables": [
                {
                    "center": center,
                    "candidate_index": index,
                    "candidate": list(instance.candidates[center][index]),
                    "variable": variable,
                }
                for (center, index), variable in sorted(
                    instance.choice_variables.items()
                )
            ],
            "blocker_variables": [
                {"source": source, "center": center, "variable": variable}
                for (source, center), variable in sorted(
                    compiled.blocker_variables.items()
                )
            ],
        }
    )
    producer = canonical_json_bytes(
        {
            "schema": PRODUCTION_PACKAGE_SCHEMA,
            "semantic_status": "FINITE_LOCAL",
            "cell_index": cell_index,
            "bound_job_id": job["job_id"],
            "bound_job_sha256": sha256_bytes(job_bytes),
            "schedule_manifest_sha256": sha256_bytes(schedule_bytes),
            "source_to_cnf_contract_sha256": json_sha256(job["source_to_cnf_contract"]),
            "variable_map_sha256": sha256_bytes(variable_map_bytes),
            "cnf_sha256": sha256_bytes(cnf),
            "claims": dict(_PRODUCTION_FALSE_CLAIMS),
        }
    )
    wave = canonical_json_bytes(
        {
            "schema": "p97-cegar-wave/v1",
            "wave_id": f"card-head-{job['job_id']}",
            "iteration": 0,
            "parent_checkpoint_sha256": None,
            "source": {
                "live_leaf": "Problem97.ExactTwelveRigid221",
                "ingress_hypotheses_sha256": json_sha256(job["source_to_cnf_contract"]),
                "finite_schema": job["source_to_cnf_contract"]["candidate_schema"],
                "cardinality_scope": f"exactly one finite cell {cell_index}",
                "source_theorem": "Problem97.ExactTwelveRigid221",
            },
            "encoding": {
                "cnf_sha256": sha256_bytes(cnf),
                "variable_map_sha256": sha256_bytes(variable_map_bytes),
                "producer_manifest_sha256": sha256_bytes(producer),
                "num_variables": instance.cnf.n_variables,
                "num_clauses": len(instance.cnf.clauses),
                "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
            },
            "execution": {
                "backend": "cadical",
                "solver_profile": "sat",
                "shard_id": 0,
                "shard_count": 1,
                "order_sha256": schedule["schedule_sha256"],
                "seed": 97,
            },
            "promotion": {
                "evidence_classification": LOCAL_CERTIFICATE,
                "producer_theorem": None,
                "lift_theorem": None,
                "consumer_theorem": None,
            },
        }
    )
    return SourceFaithfulCanaryPackage(
        cell_index,
        schedule_bytes,
        job_bytes,
        variable_map_bytes,
        AuthenticatedPackageSnapshot(cnf, producer, wave, limits),
    )


def _mkdir_create_once(path: Path) -> None:
    if path.name in {"", ".", ".."}:
        raise CardHeadPiqdAdapterError("unsafe output directory name")
    parent = _open_directory_nofollow(path.parent)
    try:
        try:
            os.mkdir(path.name, 0o700, dir_fd=parent)
        except FileExistsError as exc:
            raise CardHeadPiqdAdapterError("output root already exists") from exc
        os.fsync(parent)
    finally:
        os.close(parent)
    descriptor = _open_directory_nofollow(path)
    os.close(descriptor)


def _snapshot_tree(
    root: Path, *, exclude: frozenset[str] = frozenset(), limits: EndpointLimits
) -> tuple[list[str], dict[str, dict[str, Any]]]:
    """Hash one rooted tree without following any component or hard link."""

    root_fd = _open_directory_nofollow(root)
    directories: list[str] = []
    files: dict[str, dict[str, Any]] = {}
    total_bytes = 0
    total_nodes = 0

    def walk(directory_fd: int, prefix: str) -> None:
        nonlocal total_bytes, total_nodes
        for name in sorted(os.listdir(directory_fd)):
            if name in {"", ".", ".."} or "/" in name:
                raise CardHeadPiqdAdapterError("unsafe output component")
            relative = f"{prefix}/{name}" if prefix else name
            if relative in exclude:
                continue
            total_nodes += 1
            if total_nodes > limits.json_nodes:
                raise CardHeadPiqdAdapterError("output tree exceeds node limit")
            before = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
            if stat.S_ISDIR(before.st_mode):
                child = os.open(
                    name,
                    os.O_RDONLY
                    | getattr(os, "O_DIRECTORY", 0)
                    | getattr(os, "O_NOFOLLOW", 0),
                    dir_fd=directory_fd,
                )
                try:
                    directories.append(relative)
                    walk(child, relative)
                finally:
                    os.close(child)
                after = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
                if (before.st_dev, before.st_ino, before.st_mtime_ns) != (
                    after.st_dev,
                    after.st_ino,
                    after.st_mtime_ns,
                ):
                    raise CardHeadPiqdAdapterError(
                        "output directory changed during snapshot"
                    )
                continue
            if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
                raise CardHeadPiqdAdapterError("output contains unsafe file kind")
            if before.st_size > limits.artifact_bytes:
                raise CardHeadPiqdAdapterError("output artifact exceeds byte limit")
            descriptor = os.open(
                name,
                os.O_RDONLY | os.O_NONBLOCK | getattr(os, "O_NOFOLLOW", 0),
                dir_fd=directory_fd,
            )
            try:
                raw = bytearray()
                while len(raw) < before.st_size:
                    chunk = os.read(
                        descriptor, min(1024 * 1024, before.st_size - len(raw))
                    )
                    if not chunk:
                        raise CardHeadPiqdAdapterError("short output snapshot read")
                    raw.extend(chunk)
                if os.read(descriptor, 1):
                    raise CardHeadPiqdAdapterError("output file grew during snapshot")
                after = os.fstat(descriptor)
            finally:
                os.close(descriptor)
            if (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns) != (
                after.st_dev,
                after.st_ino,
                after.st_size,
                after.st_mtime_ns,
            ):
                raise CardHeadPiqdAdapterError("output file changed during snapshot")
            total_bytes += len(raw)
            if total_bytes > 4 * limits.artifact_bytes:
                raise CardHeadPiqdAdapterError("output tree exceeds total byte limit")
            files[relative] = {
                "bytes": len(raw),
                "sha256": sha256_bytes(bytes(raw)),
            }

    try:
        walk(root_fd, "")
    finally:
        os.close(root_fd)
    return directories, dict(sorted(files.items()))


class _FreshCardHeadPiqdClient(PiqdRawDimacsClient):
    """Reject deduplicated jobs for a newly created qualification output."""

    def prepare_cnf(
        self,
        *,
        wave_manifest: Mapping[str, Any],
        cnf: bytes,
        producer_manifest: bytes,
        timeout_s: int = 900,
        march_timeout_s: int = 900,
        project: str = "erdos-97-96-formalization",
        requested_core_limit: int | None = None,
    ) -> PreparedJob:
        job = super().prepare_cnf(
            wave_manifest=wave_manifest,
            cnf=cnf,
            producer_manifest=producer_manifest,
            timeout_s=timeout_s,
            march_timeout_s=march_timeout_s,
            project=project,
            requested_core_limit=requested_core_limit,
        )
        if job.existing:
            raise CardHeadPiqdAdapterError(
                "fresh CardHead qualification requires prepare existing=false"
            )
        return job


class _ProductionRunFactory:
    def __init__(
        self,
        package: AuthenticatedPackageSnapshot,
        output_root: Path,
        base_url: str,
        transport: Transport,
        *,
        max_polls: int,
        poll_interval_s: float,
    ) -> None:
        self.package = package
        self.output_root = output_root
        self.base_url = base_url
        self.transport = transport
        self.segmented_multipart = transport is stdlib_http_transport
        self.max_polls = max_polls
        self.poll_interval_s = poll_interval_s
        self.journal_paths: list[Path] = []

    def __call__(self, request: CardHeadPiqdRequest) -> CurrentPiqdRun:
        index = len(self.journal_paths)
        journal_path = self.output_root / f"piqd-attempt-{index}.jsonl"
        strict_http = BoundedCurrentPiqdHttpTransport(
            self.base_url, self.transport, limits=self.package.limits
        )
        client = _FreshCardHeadPiqdClient(
            self.base_url,
            transport=strict_http,
            segmented_multipart=self.segmented_multipart,
        )
        journal = DurableAttemptJournal(
            journal_path, manifest=self.package.wave_manifest
        )
        driver = PiqdCegarDriver(
            client=client,
            journal=journal,
            policy=DriverPolicy(
                max_prepare_attempts=1,
                max_confirm_attempts=1,
                max_result_attempts=1,
                max_polls=self.max_polls,
                poll_interval_s=self.poll_interval_s,
                solver_timeout_s=request.timeout_seconds,
                march_timeout_s=request.timeout_seconds,
                project="erdos-97-96-formalization",
                requested_core_limit=REQUESTED_CORE_LIMIT,
            ),
            proof_replayer=None,
            sleep=lambda seconds: (
                None if self.poll_interval_s == 0 else __import__("time").sleep(seconds)
            ),
        )
        self.journal_paths.append(journal_path)
        return CurrentPiqdRun(driver, strict_http)


def make_current_piqd_packet_transport(
    package: AuthenticatedPackageSnapshot,
    *,
    output_root: Path,
    base_url: str,
    transport: Transport | None = None,
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
    fetch_certified_kept_blob: bool = True,
) -> CurrentPiqdPacketAssembler:
    """Create the production packet transport used by certified callers.

    ``output_root`` is an attempt-journal root owned by this transport.  Its
    parent must already exist as a real, no-follow directory and
    ``output_root`` itself must not exist; this function creates it once with
    mode 0700.  This keeps its lifecycle separate from the legacy canary's
    already-owned output tree.
    """

    if type(package) is not AuthenticatedPackageSnapshot:
        raise CardHeadPiqdAdapterError(
            "production transport requires an authenticated package snapshot"
        )
    if not isinstance(output_root, Path):
        raise CardHeadPiqdAdapterError("output_root must be a native Path value")
    if type(max_polls) is not int or max_polls <= 0:
        raise CardHeadPiqdAdapterError("max_polls must be a positive builtin int")
    if (
        type(poll_interval_s) not in {int, float}
        or not math.isfinite(poll_interval_s)
        or poll_interval_s < 0
    ):
        raise CardHeadPiqdAdapterError(
            "poll_interval_s must be a finite nonnegative builtin number"
        )
    if type(fetch_certified_kept_blob) is not bool:
        raise CardHeadPiqdAdapterError("fetch_certified_kept_blob must be builtin bool")
    selected_transport = stdlib_http_transport if transport is None else transport
    # Validate the URL/transport pair before claiming the create-once root.
    BoundedCurrentPiqdHttpTransport(base_url, selected_transport, limits=package.limits)
    _mkdir_create_once(output_root)
    run_factory = _ProductionRunFactory(
        package,
        output_root,
        base_url,
        selected_transport,
        max_polls=max_polls,
        poll_interval_s=float(poll_interval_s),
    )
    return CurrentPiqdPacketAssembler(
        package,
        run_factory,
        fetch_certified_kept_blob=fetch_certified_kept_blob,
    )


def _write_package_snapshot(root: Path, package: SourceFaithfulCanaryPackage) -> None:
    directory = root / "package"
    _mkdir_create_once(directory)
    for name, payload in (
        ("discovery.cnf", package.snapshot.cnf),
        ("producer-manifest.json", package.snapshot.producer_manifest),
        ("wave-manifest.json", package.snapshot.wave_manifest_bytes),
        ("schedule-manifest.json", package.schedule_manifest_bytes),
        ("bound-job.json", package.bound_job_bytes),
        ("variable-map.json", package.variable_map_bytes),
    ):
        _write_create_once(directory / name, payload)


def _packet_metadata(
    packet: CardHeadPiqdPacket,
    request: CardHeadPiqdRequest,
    journal_paths: Sequence[Path],
    root: Path,
) -> dict[str, Any]:
    metadata = {
        "schema": PRODUCTION_PACKET_SCHEMA,
        "request": {
            name: getattr(request, name)
            for name in CardHeadPiqdRequest.__dataclass_fields__
        },
        "job": {
            "job_id": packet.job.job_id,
            "backend": packet.job.backend,
            "solver_profile": packet.job.solver_profile,
            "cnf_blob_hash": packet.job.cnf_blob_hash,
            "identity_hash": packet.job.identity_hash,
            "num_vars": packet.job.num_vars,
            "num_clauses": packet.job.num_clauses,
            "existing": packet.job.existing,
            "requested_core_limit": packet.job.requested_core_limit,
        },
        "result": packet.result,
        "state": packet.state,
        "terminal_record_sha256": packet.terminal_record_sha256,
        "journal_sha256": packet.journal_sha256,
        "seal_sha256": packet.seal_sha256,
        "journal_paths": [path.relative_to(root).as_posix() for path in journal_paths],
        "terminal_journal_path": journal_paths[-1].relative_to(root).as_posix(),
        "status_response_sha256": sha256_bytes(packet.status_response),
        "status_canonical_sha256": sha256_bytes(packet.status_canonical_receipt),
        "model_response_sha256": (
            sha256_bytes(packet.model_response)
            if packet.model_response is not None
            else None
        ),
        "model_canonical_sha256": (
            sha256_bytes(packet.model_canonical_receipt)
            if packet.model_canonical_receipt is not None
            else None
        ),
        "certificate_kind": packet.certificate_kind,
        "certificate_sha256": (
            sha256_bytes(packet.certificate) if packet.certificate is not None else None
        ),
        "clause_map_response_sha256": (
            sha256_bytes(packet.clause_map_response)
            if packet.clause_map_response is not None
            else None
        ),
        "lean_response_sha256": (
            sha256_bytes(packet.lean_response)
            if packet.lean_response is not None
            else None
        ),
        "requested_core_limit": REQUESTED_CORE_LIMIT,
        "one_process_execution_authenticated": True,
        "one_core_execution_authenticated": False,
        "nice_forwarded": False,
        "claims": dict(_PRODUCTION_FALSE_CLAIMS),
    }
    return metadata


def _write_packet_snapshot(
    root: Path,
    packet: CardHeadPiqdPacket,
    request: CardHeadPiqdRequest,
    journal_paths: Sequence[Path],
) -> None:
    _write_create_once(root / "packet-status.raw.json", packet.status_response)
    _write_create_once(
        root / "packet-status.canonical.json", packet.status_canonical_receipt
    )
    if packet.model_response is not None:
        assert packet.model_canonical_receipt is not None
        _write_create_once(root / "packet-model.raw.json", packet.model_response)
        _write_create_once(
            root / "packet-model.canonical.json", packet.model_canonical_receipt
        )
    metadata = _packet_metadata(packet, request, journal_paths, root)
    _write_create_once(root / "packet.json", canonical_json_bytes(metadata))


def run_production_canary(
    repo_root: Path,
    output_root: Path,
    cell_index: int,
    *,
    base_url: str = "http://127.0.0.1:7272",
    transport: Transport | None = None,
    timeout_seconds: int = 900,
    nice: int = 10,
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
    limits: EndpointLimits = DEFAULT_LIMITS,
) -> ProductionCanaryResult:
    """Run or idempotently revalidate one current source-faithful cell canary."""

    package = build_source_faithful_canary_package(repo_root, cell_index, limits=limits)
    if output_root.exists() or output_root.is_symlink():
        receipt = validate_production_output(
            repo_root, output_root, cell_index, limits=limits
        )
        return ProductionCanaryResult(
            receipt, output_root / PRODUCTION_RECEIPT_NAME, True
        )
    _mkdir_create_once(output_root)
    _write_package_snapshot(output_root, package)
    run_factory = _ProductionRunFactory(
        package.snapshot,
        output_root,
        base_url,
        transport if transport is not None else stdlib_http_transport,
        max_polls=max_polls,
        poll_interval_s=poll_interval_s,
    )
    assembler = CurrentPiqdPacketAssembler(package.snapshot, run_factory)
    adapter = CardHeadPiqdAdapter(package.snapshot, transport=assembler)
    summary = exact12_v14_cell_run.run_cell(
        repo_root,
        output_root / "cell-run",
        cell_index,
        timeout_seconds=timeout_seconds,
        nice=nice,
        solver=adapter,
    )
    packet = adapter.last_packet
    request = adapter.last_request
    if packet is None or request is None or not run_factory.journal_paths:
        raise CardHeadPiqdAdapterError("canary produced no authenticated PIQD packet")
    _write_packet_snapshot(
        output_root, packet, request, tuple(run_factory.journal_paths)
    )
    directories, inventory = _snapshot_tree(output_root, limits=limits)
    receipt: dict[str, Any] = {
        "schema": PRODUCTION_RECEIPT_SCHEMA,
        "cell_index": cell_index,
        "package_identity": package.snapshot.package_identity,
        "bound_job_sha256": sha256_bytes(package.bound_job_bytes),
        "schedule_manifest_sha256": sha256_bytes(package.schedule_manifest_bytes),
        "variable_map_sha256": sha256_bytes(package.variable_map_bytes),
        "packet_sha256": inventory["packet.json"]["sha256"],
        "summary_sha256": inventory["cell-run/summary.json"]["sha256"],
        "result": packet.result,
        "run_status": summary["status"],
        "requested_core_limit": REQUESTED_CORE_LIMIT,
        "one_process_execution_authenticated": True,
        "one_core_execution_authenticated": False,
        "nice_forwarded": False,
        "directories": directories,
        "inventory": inventory,
        "claims": dict(_PRODUCTION_FALSE_CLAIMS),
    }
    receipt["receipt_sha256"] = sha256_bytes(canonical_json_bytes(receipt))
    _write_create_once(
        output_root / PRODUCTION_RECEIPT_NAME,
        canonical_json_bytes(receipt) + b"\n",
    )
    validated = validate_production_output(
        repo_root, output_root, cell_index, limits=limits
    )
    return ProductionCanaryResult(
        validated, output_root / PRODUCTION_RECEIPT_NAME, False
    )


def _rooted_file(root: Path, relative: object) -> Path:
    if type(relative) is not str:
        raise CardHeadPiqdAdapterError("output path must be a builtin string")
    path = Path(relative)
    if (
        path.is_absolute()
        or not path.parts
        or any(part in {"", ".", ".."} for part in path.parts)
        or path.as_posix() != relative
    ):
        raise CardHeadPiqdAdapterError("output path escaped its root")
    return root.joinpath(*path.parts)


def _load_packet_metadata(root: Path, limits: EndpointLimits) -> dict[str, Any]:
    raw = _read_bounded_nofollow(root / "packet.json", max_bytes=limits.json_bytes)
    return _json(raw, "production packet", limits=limits)


def _reconstruct_request(
    package: AuthenticatedPackageSnapshot, value: object
) -> CardHeadPiqdRequest:
    if type(value) is not dict:
        raise CardHeadPiqdAdapterError("packet request is malformed")
    expected_keys = frozenset(CardHeadPiqdRequest.__dataclass_fields__)
    _exact_keys(value, expected_keys, "packet request")
    timeout = value.get("timeout_seconds")
    nice = value.get("legacy_nice")
    proof_requested = value.get("proof_requested")
    if (
        type(timeout) is not int
        or type(nice) is not int
        or type(proof_requested) is not bool
    ):
        raise CardHeadPiqdAdapterError("packet request scalar types are invalid")
    expected = CardHeadPiqdAdapter(package, transport=lambda _request: None)._request(
        timeout, nice, proof_requested
    )
    expected_value = {
        name: getattr(expected, name)
        for name in CardHeadPiqdRequest.__dataclass_fields__
    }
    if value != expected_value:
        raise CardHeadPiqdAdapterError("packet request/package binding mismatch")
    return expected


def _reconstruct_job(value: object) -> PreparedJob:
    if type(value) is not dict:
        raise CardHeadPiqdAdapterError("packet job is malformed")
    _exact_keys(
        value,
        frozenset(
            {
                "job_id",
                "backend",
                "solver_profile",
                "cnf_blob_hash",
                "identity_hash",
                "num_vars",
                "num_clauses",
                "existing",
                "requested_core_limit",
            }
        ),
        "packet job",
    )
    if (
        type(value["backend"]) is not str
        or type(value["solver_profile"]) is not str
        or type(value["num_vars"]) is not int
        or type(value["num_clauses"]) is not int
        or type(value["existing"]) is not bool
        or type(value["requested_core_limit"]) is not int
    ):
        raise CardHeadPiqdAdapterError("packet job scalar types are invalid")
    return PreparedJob(
        _job_id(value["job_id"], "packet job id"),
        value["backend"],
        value["solver_profile"],
        _digest(value["cnf_blob_hash"], "packet CNF digest"),
        _digest(value["identity_hash"], "packet identity digest"),
        value["num_vars"],
        value["num_clauses"],
        value["existing"],
        value["requested_core_limit"],
    )


def _validate_journal_snapshots(
    root: Path,
    metadata: Mapping[str, Any],
    package: AuthenticatedPackageSnapshot,
    request: CardHeadPiqdRequest,
    job: PreparedJob,
    limits: EndpointLimits,
) -> DriverResult:
    paths = metadata.get("journal_paths")
    terminal_path = metadata.get("terminal_journal_path")
    if (
        type(paths) is not list
        or not paths
        or any(type(path) is not str for path in paths)
        or len(set(paths)) != len(paths)
        or terminal_path != paths[-1]
    ):
        raise CardHeadPiqdAdapterError("packet journal path set is invalid")
    terminal_result: DriverResult | None = None
    for relative in paths:
        path = _rooted_file(root, relative)
        journal = DurableAttemptJournal(path, manifest=package.wave_manifest)
        if not journal.records:
            raise CardHeadPiqdAdapterError("packet journal is empty")
        seal_raw = _read_bounded_nofollow(
            journal.seal_path, max_bytes=limits.json_bytes
        )
        if not seal_raw.endswith(b"\n"):
            raise CardHeadPiqdAdapterError("journal seal is not terminated")
        seal = _json(seal_raw[:-1], "journal seal", limits=limits)
        result = DriverResult(
            job.job_id,
            journal.records[-1]["outcome"],
            journal.records[-1]["record_sha256"],
            len(journal.records),
            _digest(seal.get("seal_sha256"), "journal seal digest"),
        )
        owner = SimpleNamespace(runner=SimpleNamespace(journal=journal))
        observed_job, journal_hash = _authenticate_journal(
            owner, result, request, limits
        )
        if (
            observed_job.job_id,
            observed_job.backend,
            observed_job.solver_profile,
            observed_job.cnf_blob_hash,
            observed_job.identity_hash,
            observed_job.num_vars,
            observed_job.num_clauses,
            observed_job.requested_core_limit,
        ) != (
            job.job_id,
            job.backend,
            job.solver_profile,
            job.cnf_blob_hash,
            job.identity_hash,
            job.num_vars,
            job.num_clauses,
            job.requested_core_limit,
        ):
            raise CardHeadPiqdAdapterError("crossed job among packet journals")
        if relative == terminal_path:
            if (
                observed_job != job
                or metadata.get("terminal_record_sha256")
                != result.terminal_record_sha256
                or metadata.get("journal_sha256") != journal_hash
                or metadata.get("seal_sha256") != result.seal_sha256
            ):
                raise CardHeadPiqdAdapterError(
                    "terminal packet/journal binding mismatch"
                )
            terminal_result = result
    assert terminal_result is not None
    return terminal_result


def _validate_sat_output(
    repo_root: Path,
    root: Path,
    metadata: Mapping[str, Any],
    package: SourceFaithfulCanaryPackage,
    job: PreparedJob,
    result: DriverResult,
    summary: Mapping[str, Any],
    limits: EndpointLimits,
) -> None:
    raw = _read_bounded_nofollow(
        root / "packet-model.raw.json", max_bytes=limits.model_bytes
    )
    canonical = _read_bounded_nofollow(
        root / "packet-model.canonical.json", max_bytes=limits.model_bytes
    )
    model = _json(raw, "packet raw model", canonical=False, limits=limits)
    if canonical_json_bytes(model) != canonical:
        raise CardHeadPiqdAdapterError("packet model canonicalization mismatch")
    if sha256_bytes(raw) != metadata.get("model_response_sha256") or sha256_bytes(
        canonical
    ) != metadata.get("model_canonical_sha256"):
        raise CardHeadPiqdAdapterError("packet model digest mismatch")
    assignment = model.get("assignment")
    if (
        model.get("job_id") != job.job_id
        or model.get("result") != "SAT"
        or type(assignment) is not list
        or type(model.get("num_assigned")) is not int
        or model["num_assigned"] != job.num_vars
        or len(assignment) != job.num_vars
        or any(type(literal) is not int for literal in assignment)
    ):
        raise CardHeadPiqdAdapterError("standalone SAT model is not exact and total")
    scan_dimacs(package.snapshot.cnf, assignment=assignment)
    materialized = instantiate_validated_bound_job(
        _json(package.bound_job_bytes, "bound job", limits=limits),
        _json(package.schedule_manifest_bytes, "schedule manifest", limits=limits),
        repo_root,
    )
    positive = frozenset(literal for literal in assignment if literal > 0)
    instance = materialized.instance
    cube = instance.decode_model(positive)
    if not source_faithful_cube_ok(instance.model, cube):
        raise CardHeadPiqdAdapterError("standalone SAT source-semantic replay failed")
    blockers = decode_blockers(positive, materialized.compiled.blocker_variables)
    if not added_constraints_hold(materialized.compiled.cell, cube, blockers):
        raise CardHeadPiqdAdapterError("standalone SAT cell replay failed")
    run_model = _json(
        _read_bounded_nofollow(
            root / "cell-run" / "model.json", max_bytes=limits.model_bytes
        ),
        "cell-run model",
        canonical=False,
        limits=limits,
    )
    expected_cube = {str(center): row for center, row in cube.items()}
    expected_blockers = {
        str(source): center for source, center in sorted(blockers.items())
    }
    if (
        run_model.get("positive_variables") != sorted(positive)
        or run_model.get("cube") != expected_cube
        or run_model.get("blockers") != expected_blockers
    ):
        raise CardHeadPiqdAdapterError("cell-run/model endpoint assignment mismatch")
    if summary.get("status") != "SAT_WITNESS_REPLAYED" or summary.get("replay") != {
        "model": True,
        "candidate": True,
        "added_constraints": True,
        "exact_cnf": True,
    }:
        raise CardHeadPiqdAdapterError("SAT summary lacks all replay gates")
    if result.outcome != STRUCTURAL_SAT:
        raise CardHeadPiqdAdapterError("SAT packet journal outcome mismatch")


def _validate_unsat_output(
    root: Path,
    metadata: Mapping[str, Any],
    package: SourceFaithfulCanaryPackage,
    job: PreparedJob,
    result: DriverResult,
    summary: Mapping[str, Any],
    limits: EndpointLimits,
) -> None:
    proof_path = root / "cell-run" / "terminal.lrat"
    map_path = root / "cell-run" / "terminal.clause-map.json"
    lean_path = root / "cell-run" / "terminal.lean"
    observation_path = root / "cell-run" / "terminal.piqd-observation.json"
    proof = _read_bounded_nofollow(proof_path, max_bytes=limits.proof_bytes)
    clause_map_raw = _read_bounded_nofollow(map_path, max_bytes=limits.json_bytes)
    lean = _read_bounded_nofollow(lean_path, max_bytes=limits.lean_bytes)
    observation = _json(
        _read_bounded_nofollow(observation_path, max_bytes=limits.json_bytes),
        "UNSAT observation",
        limits=limits,
    )
    _validate_lrat(proof, max_bytes=limits.proof_bytes)
    try:
        clause_map = consume_clause_map(clause_map_raw, package.snapshot.cnf, job)
    except ClauseMapContractError as exc:
        raise CardHeadPiqdAdapterError(
            f"standalone clause-map replay failed: {exc}"
        ) from exc
    if not clause_map.numbering_identity or not clause_map.content_identity:
        raise CardHeadPiqdAdapterError("standalone clause-map identity failed")
    _validate_lean_observation(
        lean, job=job, kept_cnf=clause_map.canonical_kept_cnf, proof=proof
    )
    if (
        metadata.get("certificate_kind") != CERTIFICATE_KIND
        or metadata.get("certificate_sha256") != sha256_bytes(proof)
        or metadata.get("clause_map_response_sha256") != sha256_bytes(clause_map_raw)
        or metadata.get("lean_response_sha256") != sha256_bytes(lean)
        or observation.get("job_id") != job.job_id
        or observation.get("job_identity_hash") != job.identity_hash
        or observation.get("certificate_sha256") != sha256_bytes(proof)
        or observation.get("clause_map_response_sha256") != sha256_bytes(clause_map_raw)
        or observation.get("lean_source_sha256") != sha256_bytes(lean)
        or observation.get("journal_sha256") != metadata.get("journal_sha256")
        or observation.get("seal_sha256") != metadata.get("seal_sha256")
    ):
        raise CardHeadPiqdAdapterError("UNSAT packet/artifact binding mismatch")
    for claim, expected in _PRODUCTION_FALSE_CLAIMS.items():
        if claim in observation and observation[claim] is not expected:
            raise CardHeadPiqdAdapterError("UNSAT observation asserts closure")
    if (
        (root / "cell-run" / "terminal.drat").exists()
        or summary.get("status") != "DISCOVERY_UNSAT_UNVERIFIED"
        or summary.get("terminal_proof_verified") is not False
        or result.outcome != DISCOVERY_UNSAT
    ):
        raise CardHeadPiqdAdapterError("UNSAT was not kept observational")


def validate_production_output(
    repo_root: Path,
    output_root: Path,
    cell_index: int,
    *,
    limits: EndpointLimits = DEFAULT_LIMITS,
) -> Mapping[str, Any]:
    """Standalone no-transport validator for a completed canary output root."""

    package = build_source_faithful_canary_package(repo_root, cell_index, limits=limits)
    receipt_raw = _read_bounded_nofollow(
        output_root / PRODUCTION_RECEIPT_NAME, max_bytes=limits.json_bytes
    )
    if not receipt_raw.endswith(b"\n"):
        raise CardHeadPiqdAdapterError("production receipt is not terminated")
    receipt = _json(
        receipt_raw[:-1], "production receipt", canonical=True, limits=limits
    )
    unsigned = dict(receipt)
    claimed_receipt = _digest(
        unsigned.pop("receipt_sha256", None), "production receipt digest"
    )
    if sha256_bytes(canonical_json_bytes(unsigned)) != claimed_receipt:
        raise CardHeadPiqdAdapterError("production receipt self-hash mismatch")
    if (
        receipt.get("schema") != PRODUCTION_RECEIPT_SCHEMA
        or receipt.get("cell_index") != cell_index
        or type(receipt.get("cell_index")) is not int
        or receipt.get("package_identity") != package.snapshot.package_identity
        or receipt.get("bound_job_sha256") != sha256_bytes(package.bound_job_bytes)
        or receipt.get("schedule_manifest_sha256")
        != sha256_bytes(package.schedule_manifest_bytes)
        or receipt.get("variable_map_sha256")
        != sha256_bytes(package.variable_map_bytes)
        or receipt.get("requested_core_limit") != REQUESTED_CORE_LIMIT
        or receipt.get("one_process_execution_authenticated") is not True
        or receipt.get("one_core_execution_authenticated") is not False
        or receipt.get("nice_forwarded") is not False
        or receipt.get("claims") != _PRODUCTION_FALSE_CLAIMS
    ):
        raise CardHeadPiqdAdapterError("production receipt identity/claims mismatch")
    for name, expected in (
        ("discovery.cnf", package.snapshot.cnf),
        ("producer-manifest.json", package.snapshot.producer_manifest),
        ("wave-manifest.json", package.snapshot.wave_manifest_bytes),
        ("schedule-manifest.json", package.schedule_manifest_bytes),
        ("bound-job.json", package.bound_job_bytes),
        ("variable-map.json", package.variable_map_bytes),
    ):
        if (
            _read_bounded_nofollow(
                output_root / "package" / name, max_bytes=limits.artifact_bytes
            )
            != expected
        ):
            raise CardHeadPiqdAdapterError("package snapshot differs from source")
    directories, inventory = _snapshot_tree(
        output_root,
        exclude=frozenset({PRODUCTION_RECEIPT_NAME}),
        limits=limits,
    )
    if (
        receipt.get("directories") != directories
        or receipt.get("inventory") != inventory
    ):
        raise CardHeadPiqdAdapterError("production output inventory mismatch")
    metadata = _load_packet_metadata(output_root, limits)
    if (
        receipt.get("packet_sha256") != inventory["packet.json"]["sha256"]
        or metadata.get("schema") != PRODUCTION_PACKET_SCHEMA
        or metadata.get("claims") != _PRODUCTION_FALSE_CLAIMS
        or metadata.get("requested_core_limit") != REQUESTED_CORE_LIMIT
        or metadata.get("one_process_execution_authenticated") is not True
        or metadata.get("one_core_execution_authenticated") is not False
        or metadata.get("nice_forwarded") is not False
    ):
        raise CardHeadPiqdAdapterError("production packet identity/claims mismatch")
    request = _reconstruct_request(package.snapshot, metadata.get("request"))
    job = _reconstruct_job(metadata.get("job"))
    _validate_job(job, request)
    result = _validate_journal_snapshots(
        output_root, metadata, package.snapshot, request, job, limits
    )
    status_raw = _read_bounded_nofollow(
        output_root / "packet-status.raw.json", max_bytes=limits.json_bytes
    )
    status_canonical = _read_bounded_nofollow(
        output_root / "packet-status.canonical.json", max_bytes=limits.json_bytes
    )
    status, observed_result = _validate_status(status_raw, job, result, request, limits)
    if (
        canonical_json_bytes(status) != status_canonical
        or sha256_bytes(status_raw) != metadata.get("status_response_sha256")
        or sha256_bytes(status_canonical) != metadata.get("status_canonical_sha256")
        or metadata.get("state") != status["status"]
        or metadata.get("result") != observed_result
        or receipt.get("result") != observed_result
    ):
        raise CardHeadPiqdAdapterError("status/packet/receipt binding mismatch")
    summary_raw = _read_bounded_nofollow(
        output_root / "cell-run" / "summary.json", max_bytes=limits.json_bytes
    )
    summary = _json(summary_raw, "cell-run summary", canonical=False, limits=limits)
    if (
        sha256_bytes(summary_raw) != receipt.get("summary_sha256")
        or summary.get("cell_index") != cell_index
        or summary.get("run_status", summary.get("status")) != receipt.get("run_status")
        or summary.get("nice") != request.legacy_nice
        or summary.get("timeout_seconds") != request.timeout_seconds
    ):
        raise CardHeadPiqdAdapterError("cell-run summary binding mismatch")
    if observed_result == "SAT":
        _validate_sat_output(
            repo_root,
            output_root,
            metadata,
            package,
            job,
            result,
            summary,
            limits,
        )
    elif observed_result == "UNSAT":
        _validate_unsat_output(
            output_root, metadata, package, job, result, summary, limits
        )
    elif observed_result == "UNKNOWN":
        if result.outcome != ERROR or summary.get("status") != "UNKNOWN":
            raise CardHeadPiqdAdapterError("UNKNOWN output classification mismatch")
    else:
        raise CardHeadPiqdAdapterError("failed/nonterminal canary cannot validate")
    return receipt


def main(argv: Sequence[str] | None = None) -> int:
    import argparse

    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    run_parser = subparsers.add_parser("run", help="run or revalidate one canary")
    validate_parser = subparsers.add_parser(
        "validate", help="standalone replay of an existing output"
    )
    for command_parser in (run_parser, validate_parser):
        command_parser.add_argument("--repo-root", type=Path, required=True)
        command_parser.add_argument("--output-root", type=Path, required=True)
        command_parser.add_argument("--cell-index", type=int, required=True)
    run_parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    run_parser.add_argument("--timeout-seconds", type=int, default=900)
    run_parser.add_argument("--nice", type=int, default=10)
    run_parser.add_argument("--max-polls", type=int, default=300)
    run_parser.add_argument("--poll-interval-seconds", type=float, default=2.0)
    args = parser.parse_args(argv)
    try:
        if args.command == "run":
            outcome = run_production_canary(
                args.repo_root.resolve(),
                args.output_root,
                args.cell_index,
                base_url=args.base_url,
                timeout_seconds=args.timeout_seconds,
                nice=args.nice,
                max_polls=args.max_polls,
                poll_interval_s=args.poll_interval_seconds,
            )
            receipt = outcome.receipt
        else:
            receipt = validate_production_output(
                args.repo_root.resolve(), args.output_root, args.cell_index
            )
    except (CardHeadPiqdAdapterError, EncodingError, OSError, ValueError) as exc:
        print(f"card-head PIQD canary failed closed: {exc}")
        return 2
    print(json.dumps(receipt, sort_keys=True))
    return 0 if receipt["result"] == "SAT" else 3


if __name__ == "__main__":
    raise SystemExit(main())
