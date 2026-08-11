"""Projected-static-v3 caller adapter for PIQD incremental discovery.

The stable ``out/base.cnf`` is the PIQD session seed.  The driver's current
``out/.solver.cnf`` is then presented to the producer-neutral adapter, which
authenticates and appends its bootstrap/restored suffix.  Terminal proof calls
remain fresh local CaDiCaL calls and never enter PIQD.
"""

from __future__ import annotations

import hashlib
import json
import os
from collections.abc import Mapping
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

from census.p97_search import phase3_piqd_incremental_discovery as incremental
from census.p97_search import phase3_piqd_projected_v3_qualification as qualification
from census.p97_search import phase3_piqd_static_solver_runner as static
from census.p97_search.phase3_cegar_runtime import SolverBackend, SolverResultLike
from census.p97_search.phase3_piqd_oracle import Transport

SCHEMA = "p97-piqd-incremental-v3-caller/v1"
TEST_SCHEMA = "p97-piqd-incremental-v3-caller-test-only/v1"
MAX_NORMALIZED_LOG_BYTES = 2_048
_RECEIPT_NAME = ".piqd-incremental-v3.jsonl"
_RESULT_DIGEST_VERSION = "piqd-solve-result/v1"
_FRONTIER_SCHEMA = "p97-piqd-clause-frontier-v1"
_RECEIPT_REQUIRED = frozenset(
    {
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
)
_RECEIPT_OPTIONAL = frozenset(
    {
        "conflict_limit",
        "timeout_ms",
        "interrupted_by",
        "core",
        "batch_key",
        "batch_position",
        "batch_size",
        "batch_request_sha256",
    }
)
_LEGACY_RECEIPT_OPTIONAL = _RECEIPT_OPTIONAL | {"effective_deadline_ms"}
_RECEIPT_BATCH_FIELDS = frozenset(
    {"batch_key", "batch_position", "batch_size", "batch_request_sha256"}
)


class PiqdIncrementalV3Error(RuntimeError):
    """The projected-static-v3 PIQD caller contract was violated."""


@dataclass(frozen=True)
class LegacyDiscoveryResult:
    """Structural match for the driver's legacy solver-result boundary."""

    verdict: str
    assignment: Mapping[int, bool]
    returncode: int
    stdout: str = ""
    stderr: str = ""


def _absolute_normalized(path: str | Path) -> Path:
    return Path(os.path.abspath(os.fspath(path)))


def _hex64(value: Any, *, label: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in "0123456789abcdef" for character in value)
    ):
        raise PiqdIncrementalV3Error(f"{label} must be lowercase 64-hex")
    return value


def _builtin_int(value: Any, *, label: str, minimum: int | None = None) -> int:
    if type(value) is not int or (minimum is not None and value < minimum):
        raise PiqdIncrementalV3Error(f"{label} must be a builtin int")
    return value


def _canonical_uuid(value: Any, *, label: str) -> str:
    if (
        type(value) is not str
        or len(value) != 36
        or any(value[index] != "-" for index in (8, 13, 18, 23))
        or any(
            index not in {8, 13, 18, 23} and character not in "0123456789abcdef"
            for index, character in enumerate(value)
        )
    ):
        raise PiqdIncrementalV3Error(f"{label} must be a canonical lowercase UUID")
    return value


def _literal_bytes(literals: tuple[int, ...] | list[int] | None) -> bytes:
    if literals is None:
        return b"-"
    ordered = sorted(literals, key=lambda literal: (abs(literal), literal))
    return " ".join(str(literal) for literal in ordered).encode("ascii")


def _result_digest(
    status: str,
    interrupted_by: str | None,
    core: list[int] | None,
    model: tuple[int, ...] | None,
) -> str:
    """Recompute PIQD's result identity without trusting the generic adapter."""

    digest = hashlib.sha256()
    digest.update(_RESULT_DIGEST_VERSION.encode("ascii"))
    digest.update(b"\nstatus=")
    digest.update(status.encode("ascii"))
    digest.update(b"\ninterrupted_by=")
    digest.update((interrupted_by or "").encode("utf-8"))
    digest.update(b"\ncore=")
    digest.update(_literal_bytes(core))
    digest.update(b"\nmodel=")
    digest.update(_literal_bytes(model))
    return digest.hexdigest()


def _frontier_journal_bytes(clauses: tuple[tuple[int, ...], ...]) -> bytes:
    return b"".join(
        (
            " ".join(str(literal) for literal in clause)
            + (" " if clause else "")
            + "0\n"
        ).encode("ascii")
        for clause in clauses
    )


def _frontier_digest(variable_count: int, clauses: tuple[tuple[int, ...], ...]) -> str:
    digest = hashlib.sha256()
    digest.update(
        f"{_FRONTIER_SCHEMA}\np cnf {variable_count} {len(clauses)}\n".encode()
    )
    for clause in clauses:
        digest.update((" ".join(str(literal) for literal in clause) + " 0\n").encode())
    return digest.hexdigest()


def _normalized_assignment(result: incremental.DiscoveryResult) -> dict[int, bool]:
    if type(result.assignment) is not tuple:
        raise PiqdIncrementalV3Error("PIQD assignment must be an exact tuple")
    if result.status != "SAT":
        if result.assignment:
            raise PiqdIncrementalV3Error(
                "PIQD non-SAT discovery returned an assignment"
            )
        return {}
    assignment: dict[int, bool] = {}
    for literal in result.assignment:
        if type(literal) is not int or literal == 0:
            raise PiqdIncrementalV3Error(
                "PIQD SAT assignment contains an invalid signed literal"
            )
        variable = abs(literal)
        if variable in assignment:
            raise PiqdIncrementalV3Error(
                "PIQD SAT assignment contains a duplicate variable"
            )
        assignment[variable] = literal > 0
    if result.status == "SAT" and set(assignment) != set(range(1, len(assignment) + 1)):
        raise PiqdIncrementalV3Error(
            "PIQD SAT assignment is not a total contiguous model"
        )
    return assignment


def _validated_receipt(
    result: incremental.DiscoveryResult,
    assignment: Mapping[int, bool],
    frontier_variable_count: int | None,
    frontier_clauses: tuple[tuple[int, ...], ...] | None,
    *,
    strict_current_sat: bool,
) -> None:
    receipt = result.receipt
    if type(receipt) is not dict or any(type(key) is not str for key in receipt):
        raise PiqdIncrementalV3Error(
            "PIQD receipt must be an exact builtin dict with builtin string keys"
        )
    keys = set(receipt)
    optional = _RECEIPT_OPTIONAL if strict_current_sat else _LEGACY_RECEIPT_OPTIONAL
    if keys - (_RECEIPT_REQUIRED | optional) or not (_RECEIPT_REQUIRED <= keys):
        missing = sorted(_RECEIPT_REQUIRED - keys)
        extra = sorted(keys - (_RECEIPT_REQUIRED | optional))
        raise PiqdIncrementalV3Error(
            f"PIQD receipt has an inexact schema (missing={missing}, extra={extra})"
        )

    _builtin_int(receipt["solve_index"], label="PIQD receipt solve_index", minimum=1)
    _builtin_int(receipt["base_clauses"], label="PIQD receipt base_clauses", minimum=1)
    _builtin_int(receipt["base_bytes"], label="PIQD receipt base_bytes", minimum=1)
    _hex64(receipt["base_sha256"], label="PIQD receipt base_sha256")
    if type(receipt["assumptions"]) is not list or receipt["assumptions"] != []:
        raise PiqdIncrementalV3Error(
            "PIQD receipt assumptions must be an exact empty builtin list"
        )
    if type(receipt["status"]) is not str or receipt["status"] not in {
        "SAT",
        "UNSAT",
        "UNKNOWN",
    }:
        raise PiqdIncrementalV3Error("PIQD receipt status is invalid")
    if type(receipt["model_recorded"]) is not bool:
        raise PiqdIncrementalV3Error(
            "PIQD receipt model_recorded must be a builtin bool"
        )
    _hex64(receipt["result_sha256"], label="PIQD receipt result_sha256")
    _builtin_int(receipt["at"], label="PIQD receipt at")

    if bool(keys & _RECEIPT_BATCH_FIELDS) and not _RECEIPT_BATCH_FIELDS <= keys:
        raise PiqdIncrementalV3Error("PIQD receipt has a partial batch quartet")
    if _RECEIPT_BATCH_FIELDS <= keys:
        _canonical_uuid(receipt["batch_key"], label="PIQD receipt batch_key")
        _builtin_int(
            receipt["batch_position"],
            label="PIQD receipt batch_position",
            minimum=0,
        )
        _builtin_int(receipt["batch_size"], label="PIQD receipt batch_size", minimum=1)
        _hex64(
            receipt["batch_request_sha256"],
            label="PIQD receipt batch_request_sha256",
        )
    if "timeout_ms" in receipt:
        _builtin_int(receipt["timeout_ms"], label="PIQD receipt timeout_ms", minimum=0)
    if not strict_current_sat:
        if ("timeout_ms" in receipt) != ("effective_deadline_ms" in receipt):
            raise PiqdIncrementalV3Error(
                "legacy PIQD timed receipt lacks its exact effective deadline"
            )
        if "effective_deadline_ms" in receipt:
            effective_deadline_ms = _builtin_int(
                receipt["effective_deadline_ms"],
                label="PIQD receipt effective_deadline_ms",
                minimum=30_000,
            )
            if effective_deadline_ms != receipt["timeout_ms"] + 30_000:
                raise PiqdIncrementalV3Error(
                    "legacy PIQD receipt effective deadline is not timeout_ms + 30000"
                )
    if "conflict_limit" in receipt:
        _builtin_int(
            receipt["conflict_limit"],
            label="PIQD receipt conflict_limit",
            minimum=1,
        )
    if "interrupted_by" in receipt and (
        type(receipt["interrupted_by"]) is not str or not receipt["interrupted_by"]
    ):
        raise PiqdIncrementalV3Error(
            "PIQD receipt interrupted_by must be a nonempty builtin string"
        )
    if "core" in receipt:
        core_value = receipt["core"]
        if (
            type(core_value) is not list
            or any(type(literal) is not int or literal == 0 for literal in core_value)
            or len(set(core_value)) != len(core_value)
        ):
            raise PiqdIncrementalV3Error(
                "PIQD receipt core must be an exact builtin literal list"
            )

    if (
        receipt["status"] != result.status
        or receipt["solve_index"] != result.solve_index
        or receipt["result_sha256"] != result.result_sha256
        or receipt["base_clauses"] != result.frontier_count
    ):
        raise PiqdIncrementalV3Error(
            "PIQD receipt identity disagrees with the discovery result"
        )

    if frontier_variable_count is None or frontier_clauses is None:
        raise PiqdIncrementalV3Error(
            "PIQD normalization requires authenticated frontier evidence"
        )
    _builtin_int(
        frontier_variable_count,
        label="PIQD frontier variable_count",
        minimum=0,
    )
    if type(frontier_clauses) is not tuple or any(
        type(clause) is not tuple
        or any(
            type(literal) is not int
            or literal == 0
            or abs(literal) > frontier_variable_count
            for literal in clause
        )
        for clause in frontier_clauses
    ):
        raise PiqdIncrementalV3Error(
            "PIQD frontier must be an exact tuple of bounded literal tuples"
        )
    if len(frontier_clauses) != result.frontier_count:
        raise PiqdIncrementalV3Error(
            "PIQD frontier clause count disagrees with the result"
        )
    journal = _frontier_journal_bytes(frontier_clauses)
    if (
        len(journal) != receipt["base_bytes"]
        or hashlib.sha256(journal).hexdigest() != receipt["base_sha256"]
        or _frontier_digest(frontier_variable_count, frontier_clauses)
        != result.frontier_sha256
    ):
        raise PiqdIncrementalV3Error(
            "PIQD frontier journal identity disagrees with the receipt/result"
        )

    interrupted_by = receipt.get("interrupted_by")
    if result.status == "SAT":
        if (
            receipt["model_recorded"] is not True
            or "core" in receipt
            or "interrupted_by" in receipt
        ):
            raise PiqdIncrementalV3Error(
                "PIQD SAT receipt has invalid model/core/interruption semantics"
            )
        if set(assignment) != set(range(1, frontier_variable_count + 1)):
            raise PiqdIncrementalV3Error(
                "PIQD SAT assignment is not total over the frontier universe"
            )
        values = {
            variable if truth else -variable for variable, truth in assignment.items()
        }
        if any(
            any(abs(literal) not in assignment for literal in clause)
            or not any(literal in values for literal in clause)
            for clause in frontier_clauses
        ):
            raise PiqdIncrementalV3Error(
                "PIQD SAT assignment fails independent frontier replay"
            )
        digest_model: tuple[int, ...] | None = result.assignment
        digest_core = None
    elif result.status == "UNSAT":
        if (
            receipt["model_recorded"] is not False
            or receipt.get("core") != []
            or type(receipt.get("core")) is not list
            or "interrupted_by" in receipt
        ):
            raise PiqdIncrementalV3Error(
                "PIQD UNSAT receipt is not assumption-free observational UNSAT"
            )
        digest_model = None
        digest_core = receipt["core"]
    else:
        if receipt["model_recorded"] is not False or "core" in receipt or assignment:
            raise PiqdIncrementalV3Error(
                "PIQD UNKNOWN receipt has invalid result semantics"
            )
        digest_model = None
        digest_core = None
    if (
        _result_digest(result.status, interrupted_by, digest_core, digest_model)
        != result.result_sha256
    ):
        raise PiqdIncrementalV3Error(
            "PIQD result digest does not match receipt/model semantics"
        )


def normalize_discovery_result(
    result: incremental.DiscoveryResult,
    *,
    frontier_variable_count: int | None = None,
    frontier_clauses: tuple[tuple[int, ...], ...] | None = None,
    strict_current_sat: bool = False,
) -> LegacyDiscoveryResult:
    """Normalize authenticated PIQD results without adding solver authority."""

    if type(strict_current_sat) is not bool:
        raise PiqdIncrementalV3Error(
            "strict_current_sat must be an exact builtin boolean"
        )
    if type(result) is not incremental.DiscoveryResult:
        raise PiqdIncrementalV3Error("PIQD returned an invalid discovery result")
    if type(result.status) is not str or result.status not in {
        "SAT",
        "UNSAT",
        "UNKNOWN",
    }:
        raise PiqdIncrementalV3Error("PIQD returned an unsupported status")
    if result.proof_verified is not False or result.closure_claim is not False:
        raise PiqdIncrementalV3Error(
            "PIQD discovery must not claim proof verification or closure"
        )
    _builtin_int(result.solve_index, label="PIQD solve_index", minimum=1)
    _builtin_int(result.frontier_count, label="PIQD frontier_count", minimum=1)
    _hex64(result.result_sha256, label="PIQD result_sha256")
    _hex64(result.frontier_sha256, label="PIQD frontier_sha256")
    assignment = _normalized_assignment(result)
    _validated_receipt(
        result,
        assignment,
        frontier_variable_count,
        frontier_clauses,
        strict_current_sat=strict_current_sat,
    )
    record = {
        "adapter_schema": SCHEMA,
        "closure_claim": False,
        "frontier_count": result.frontier_count,
        "frontier_sha256": result.frontier_sha256,
        "proof_verified": False,
        "result_sha256": result.result_sha256,
        "solve_index": result.solve_index,
        "status": result.status,
    }
    stdout = json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n"
    if len(stdout.encode("utf-8")) > MAX_NORMALIZED_LOG_BYTES:
        raise PiqdIncrementalV3Error("normalized PIQD result log exceeds its bound")
    return LegacyDiscoveryResult(
        verdict=result.status,
        assignment=assignment,
        returncode={"SAT": 10, "UNSAT": 20, "UNKNOWN": 0}[result.status],
        stdout=stdout,
        stderr=(
            "PIQD incremental discovery returned UNKNOWN\n"
            if result.status == "UNKNOWN"
            else ""
        ),
    )


@dataclass
class PiqdIncrementalV3SolverRunner:
    """Lazy composite: PIQD discovery plus a fresh local proof solver."""

    base_url: str
    custody_root: Path
    base_cnf_path: Path
    source_manifest: bytes
    producer_manifest: bytes
    producer_job_id: str
    solver_name: str
    local_proof_runner: SolverBackend
    production_authority: qualification.ProductionAuthorityV3 | None = None
    source_manifest_path: Path | None = None
    producer_manifest_path: Path | None = None
    transport: Transport | None = None
    expected_solver_sha256: str | None = None
    expected_solver_signature: str | None = None
    session_identity_evidence_path: Path | None = None
    allow_unqualified_test_profile: bool = False
    _authenticated: static.StaticManifestContract = field(init=False, repr=False)
    _runner: incremental.PiqdIncrementalDiscoveryRunner | None = field(
        default=None, init=False, repr=False
    )
    _qualification_contract: qualification.ProductionQualificationV3 | None = field(
        default=None, init=False, repr=False
    )
    _closed: bool = field(default=False, init=False, repr=False)

    def __post_init__(self) -> None:
        # Authenticate the canonical source/producer pair before any PIQD
        # descriptor can be constructed.
        self._authenticated = static.authenticate_static_manifests(
            source_manifest=self.source_manifest,
            producer_manifest=self.producer_manifest,
        )
        self.custody_root = _absolute_normalized(self.custody_root)
        self.base_cnf_path = _absolute_normalized(self.base_cnf_path)
        if self.base_cnf_path.name != "base.cnf":
            raise PiqdIncrementalV3Error(
                "PIQD incremental v3 requires an exact base.cnf seed path"
            )
        incremental._relative_parts(self.base_cnf_path, self.custody_root)
        incremental._relative_parts(self.solver_cnf_path, self.custody_root)
        incremental._relative_parts(self.receipt_path, self.custody_root)
        if type(self.allow_unqualified_test_profile) is not bool:
            raise PiqdIncrementalV3Error(
                "allow_unqualified_test_profile must be a builtin boolean"
            )
        if self.production_authority is not None:
            if (
                type(self.production_authority)
                is not qualification.ProductionAuthorityV3
            ):
                raise PiqdIncrementalV3Error(
                    "production_authority must be exact qualification v3 authority"
                )
            if self.allow_unqualified_test_profile:
                raise PiqdIncrementalV3Error(
                    "production authority cannot select an unqualified test profile"
                )
            if any(
                value is not None
                for value in (
                    self.expected_solver_sha256,
                    self.expected_solver_signature,
                    self.session_identity_evidence_path,
                )
            ):
                raise PiqdIncrementalV3Error(
                    "production authority cannot be combined with legacy qualification pins"
                )
            if self.source_manifest_path is None or self.producer_manifest_path is None:
                raise PiqdIncrementalV3Error(
                    "production authority requires exact manifest custody paths"
                )
            qualification.validate_production_launch_authority_v3(
                self.production_authority,
                daemon_url=self.base_url,
                source_manifest=self.source_manifest,
                producer_manifest=self.producer_manifest,
                producer_job_id=self.producer_job_id,
                solver_name=self.solver_name,
            )
            return
        qualification_fields = (
            self.expected_solver_sha256,
            self.expected_solver_signature,
            self.session_identity_evidence_path,
        )
        qualification_complete = (
            all(value is not None for value in qualification_fields)
            and self.transport is not None
        )
        if not self.allow_unqualified_test_profile and not qualification_complete:
            raise PiqdIncrementalV3Error(
                "production PIQD requires transport, solver SHA/signature, and session identity custody"
            )
        if (
            any(value is not None for value in qualification_fields)
            and not qualification_complete
        ):
            raise PiqdIncrementalV3Error(
                "qualified solver identity requires all pins and a transport"
            )
        if (
            not self.allow_unqualified_test_profile
            and type(self.transport) is not qualification.QualificationTransport
        ):
            raise PiqdIncrementalV3Error(
                "production PIQD requires the preflight qualification transport"
            )
        if qualification_complete:
            evidence_path = _absolute_normalized(self.session_identity_evidence_path)
            incremental._relative_parts(evidence_path, self.custody_root)
            if evidence_path != self.custody_root / qualification.IDENTITY_NAME:
                raise PiqdIncrementalV3Error(
                    "session identity evidence must use the canonical custody path"
                )
            if type(self.transport) is qualification.QualificationTransport:
                if (
                    self.transport.root != self.custody_root
                    or self.transport.expected
                    != (
                        self.solver_name,
                        self.expected_solver_sha256,
                        self.expected_solver_signature,
                    )
                ):
                    raise PiqdIncrementalV3Error(
                        "qualification transport pins disagree with runner"
                    )
            else:
                self.transport = qualification.QualificationTransport(
                    self.transport,
                    root=self.custody_root,
                    solver_name=self.solver_name,
                    solver_sha256=self.expected_solver_sha256,
                    solver_signature=self.expected_solver_signature,
                )

    @property
    def solver_cnf_path(self) -> Path:
        return self.base_cnf_path.parent / ".solver.cnf"

    @property
    def receipt_path(self) -> Path:
        return self.base_cnf_path.parent / _RECEIPT_NAME

    def _discovery_runner(self) -> incremental.PiqdIncrementalDiscoveryRunner:
        if self._closed:
            raise PiqdIncrementalV3Error("PIQD incremental v3 runner is closed")
        if self._runner is None:
            # Critical seed distinction: the stable base is captured first.
            # The full current .solver.cnf is forwarded only after construction,
            # so its bootstrap/restored suffix is appended by the generic adapter.
            seed_cnf = incremental._safe_read(
                self.base_cnf_path,
                self.custody_root,
                label="projected-static-v3 stable base CNF",
            )
            descriptor = incremental.DiscoveryDescriptor(
                seed_cnf=seed_cnf,
                producer_manifest=self._authenticated.producer_bytes,
                source_manifest=self._authenticated.source_bytes,
                solver_name=self.solver_name,
                producer_job_id=self.producer_job_id,
            )
            selected_transport = self.transport
            if self.production_authority is not None:
                if selected_transport is None:
                    from census.p97_search.phase3_piqd_oracle import _stdlib_transport

                    selected_transport = _stdlib_transport
                try:
                    self._qualification_contract = (
                        qualification.prepare_production_qualification_v3(
                            authority=self.production_authority,
                            output_dir=self.custody_root,
                            base_cnf_path=self.base_cnf_path,
                            runtime_cnf_path=self.solver_cnf_path,
                            source_manifest_path=self.source_manifest_path,
                            producer_manifest_path=self.producer_manifest_path,
                            source_manifest=self.source_manifest,
                            producer_manifest=self.producer_manifest,
                            daemon_url=self.base_url,
                            producer_job_id=self.producer_job_id,
                            solver_name=self.solver_name,
                            descriptor=descriptor,
                            transport=selected_transport,
                        )
                    )
                except qualification.QualificationError as exc:
                    raise PiqdIncrementalV3Error(str(exc)) from exc
                selected_transport = self._qualification_contract.transport
            self._runner = incremental.PiqdIncrementalDiscoveryRunner(
                self.base_url,
                descriptor,
                receipt_path=self.receipt_path,
                transport=selected_transport,
                custody_root=self.custody_root,
                sat_contract_version=(
                    incremental.SAT_CONTRACT_CURRENT_V1
                    if self.production_authority is not None
                    else incremental.SAT_CONTRACT_LEGACY_V1
                ),
            )
        return self._runner

    def __call__(
        self,
        cnf_path: Path,
        timeout_s: int,
        proof_path: Path | None,
    ) -> SolverResultLike:
        if proof_path is not None:
            return self.local_proof_runner(cnf_path, timeout_s, proof_path)
        current = _absolute_normalized(cnf_path)
        if current != self.solver_cnf_path:
            raise PiqdIncrementalV3Error(
                "PIQD incremental v3 discovery requires out/.solver.cnf"
            )
        # UNKNOWN and every adapter/transport error are returned or propagated
        # directly.  There is intentionally no local discovery fallback.
        discovery_runner = self._discovery_runner()
        result = discovery_runner(current, timeout_s, None)
        return normalize_discovery_result(
            result,
            frontier_variable_count=discovery_runner._variable_count,
            frontier_clauses=tuple(discovery_runner._clauses),
            strict_current_sat=self.production_authority is not None,
        )

    def manifest_metadata(self) -> dict[str, Any]:
        generic = None if self._runner is None else self._runner.manifest_metadata()
        return {
            "schema": TEST_SCHEMA if self.allow_unqualified_test_profile else SCHEMA,
            "enabled": True,
            "state": (
                "closed-before-open"
                if self._closed and self._runner is None
                else "closed"
                if self._closed
                else "open"
                if self._runner is not None
                else "lazy-unopened"
            ),
            "producer_job_id": self.producer_job_id,
            "source_manifest_sha256": hashlib.sha256(
                self._authenticated.source_bytes
            ).hexdigest(),
            "producer_manifest_sha256": hashlib.sha256(
                self._authenticated.producer_bytes
            ).hexdigest(),
            "proof_verified": False,
            "closure_claim": False,
            "seed_policy": "exact stable out/base.cnf",
            "resume_policy": "fresh session only; driver resume rejected",
            "terminal_policy": "PIQD UNSAT is discovery-only; local DRAT required",
            "producer_job_requested_core_limit": 1,
            "session_resource_attestation": {
                "core_limit_attested": False,
                "solver_processes_attested": False,
                "cpu_affinity_attested": False,
            },
            "incremental_session": generic,
        }

    def close(self) -> None:
        if self._closed:
            return
        if self._runner is not None:
            # The generic adapter exclusively owns DELETE and any reconciliation
            # after true transport loss.  This wrapper must never retry close.
            self._runner.close()
        self._closed = True

    def finalize_qualification(self, driver_status: str) -> dict[str, Any] | None:
        """Finalize authority-v3 only after the driver has closed this runner."""

        if self.production_authority is None:
            return None
        if not self._closed:
            raise PiqdIncrementalV3Error(
                "production qualification finalization must follow close"
            )
        if self._qualification_contract is None:
            # A successful driver status without a discovery solve is outside
            # the authority policy and cannot manufacture a seal.
            if driver_status in qualification.PRODUCTION_V3_SUCCESS_STATUSES:
                raise PiqdIncrementalV3Error(
                    "successful production status has no PIQD session custody"
                )
            return None
        try:
            return qualification.finalize_production_qualification_v3(
                self._qualification_contract, driver_status=driver_status
            )
        except qualification.QualificationError as exc:
            raise PiqdIncrementalV3Error(str(exc)) from exc


def make_piqd_incremental_v3_solver_runner(
    *,
    base_url: str,
    custody_root: Path,
    base_cnf_path: Path,
    source_manifest: bytes,
    producer_manifest: bytes,
    producer_job_id: str,
    solver_name: str,
    local_proof_runner: SolverBackend,
    production_authority: qualification.ProductionAuthorityV3 | None = None,
    source_manifest_path: Path | None = None,
    producer_manifest_path: Path | None = None,
    transport: Transport | None = None,
    expected_solver_sha256: str | None = None,
    expected_solver_signature: str | None = None,
    session_identity_evidence_path: Path | None = None,
    allow_unqualified_test_profile: bool = False,
) -> PiqdIncrementalV3SolverRunner:
    return PiqdIncrementalV3SolverRunner(
        base_url=base_url,
        custody_root=custody_root,
        base_cnf_path=base_cnf_path,
        source_manifest=source_manifest,
        producer_manifest=producer_manifest,
        producer_job_id=producer_job_id,
        solver_name=solver_name,
        local_proof_runner=local_proof_runner,
        production_authority=production_authority,
        source_manifest_path=source_manifest_path,
        producer_manifest_path=producer_manifest_path,
        transport=transport,
        expected_solver_sha256=expected_solver_sha256,
        expected_solver_signature=expected_solver_signature,
        session_identity_evidence_path=session_identity_evidence_path,
        allow_unqualified_test_profile=allow_unqualified_test_profile,
    )
