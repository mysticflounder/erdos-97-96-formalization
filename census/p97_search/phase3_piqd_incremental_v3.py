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
from census.p97_search import phase3_piqd_static_solver_runner as static
from census.p97_search.phase3_cegar_runtime import SolverBackend, SolverResultLike
from census.p97_search.phase3_piqd_oracle import Transport

SCHEMA = "p97-piqd-incremental-v3-caller/v1"
MAX_NORMALIZED_LOG_BYTES = 2_048
_RECEIPT_NAME = ".piqd-incremental-v3.jsonl"


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
    return assignment


def normalize_discovery_result(
    result: incremental.DiscoveryResult,
) -> LegacyDiscoveryResult:
    """Normalize authenticated PIQD results without adding solver authority."""

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
    if type(result.solve_index) is not int or result.solve_index < 1:
        raise PiqdIncrementalV3Error("PIQD solve_index must be a positive builtin int")
    if type(result.frontier_count) is not int or result.frontier_count < 1:
        raise PiqdIncrementalV3Error(
            "PIQD frontier_count must be a positive builtin int"
        )
    _hex64(result.result_sha256, label="PIQD result_sha256")
    _hex64(result.frontier_sha256, label="PIQD frontier_sha256")
    if type(result.receipt) is not dict:
        raise PiqdIncrementalV3Error("PIQD receipt must be an exact builtin dict")
    for key, expected, expected_type in (
        ("status", result.status, str),
        ("solve_index", result.solve_index, int),
        ("result_sha256", result.result_sha256, str),
        ("base_clauses", result.frontier_count, int),
    ):
        value = result.receipt.get(key)
        if type(value) is not expected_type or value != expected:
            raise PiqdIncrementalV3Error(
                f"PIQD receipt {key} disagrees with the discovery result"
            )
    assignment = _normalized_assignment(result)
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
    transport: Transport | None = None
    _authenticated: static.StaticManifestContract = field(init=False, repr=False)
    _runner: incremental.PiqdIncrementalDiscoveryRunner | None = field(
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
            self._runner = incremental.PiqdIncrementalDiscoveryRunner(
                self.base_url,
                descriptor,
                receipt_path=self.receipt_path,
                transport=self.transport,
                custody_root=self.custody_root,
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
        return normalize_discovery_result(
            self._discovery_runner()(current, timeout_s, None)
        )

    def manifest_metadata(self) -> dict[str, Any]:
        generic = None if self._runner is None else self._runner.manifest_metadata()
        return {
            "schema": SCHEMA,
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
            "terminal_policy": "fresh local proof-producing solver",
            "incremental_session": generic,
        }

    def close(self) -> None:
        if self._closed:
            return
        if self._runner is not None:
            self._runner.close()
        self._closed = True


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
    transport: Transport | None = None,
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
        transport=transport,
    )
