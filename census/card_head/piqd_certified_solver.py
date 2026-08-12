# Copyright (c) 2026 Adam McKenna
# SPDX-License-Identifier: MIT
# Author: Adam McKenna

"""Certified PIQD solver seam for finite CardHead frontier callers.

The legacy CardHead PIQD adapter is intentionally observational for UNSAT.
This module is the explicit promotion boundary: it rebinds every daemon
artifact to the authenticated package, independently reconstructs PIQD's kept
CNF, and requires a verified local Lean LRAT replay before returning certified
UNSAT.
"""

from __future__ import annotations

import os
from collections.abc import Callable, Collection, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.card_head.sat_encoding import CadicalResult, CoverInstance, EncodingError
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_piqd_card_head_adapter import (
    CERTIFICATE_KIND,
    REQUEST_SCHEMA,
    AuthenticatedPackageSnapshot,
    CardHeadPiqdAdapterError,
    CardHeadPiqdPacket,
    CardHeadPiqdRequest,
    PacketTransport,
    _capture_existing,
    _digest,
    _exact_keys,
    _json,
    _open_directory_nofollow,
    _validate_job,
    _validate_lrat,
    _write_create_once,
)
from census.p97_search.phase3_piqd_clause_map import (
    ClauseMapContractError,
    consume_clause_map,
)
from census.p97_search.phase3_piqd_driver import DriverResult
from census.p97_search.phase3_piqd_oracle import PiqdOracleError, scan_dimacs
from census.p97_search.phase3_piqd_replay import (
    LeanLratReplayer,
    LratReplayError,
    LratReplayResult,
    validate_replay_result,
)

CERTIFIED_RECEIPT_SCHEMA = "p97-piqd-certified-frontier-solver/v1"
EXPECTED_PROJECT = "erdos-97-96-formalization"
_MODEL_KEYS = frozenset({"job_id", "result", "num_assigned", "assignment"})


class PiqdCertifiedSolverError(EncodingError):
    """Certified PIQD evidence is absent, inconsistent, or unsafe to custody."""


def _raise_certified(exc: Exception) -> PiqdCertifiedSolverError:
    return PiqdCertifiedSolverError(str(exc))


def _strict_status(
    packet: CardHeadPiqdPacket,
    request: CardHeadPiqdRequest,
    package: AuthenticatedPackageSnapshot,
) -> Mapping[str, Any]:
    status = _json(
        packet.status_response,
        "certified status response",
        canonical=False,
        limits=package.limits,
    )
    if status.get("backend") == "march_cu":
        raise PiqdCertifiedSolverError(
            "march_cu cannot enter the certified seam because it has no kept CNF"
        )
    if canonical_json_bytes(status) != packet.status_canonical_receipt:
        raise PiqdCertifiedSolverError("status canonical receipt mismatch")
    expected = {
        "id": packet.job.job_id,
        "backend": "cadical",
        "project": EXPECTED_PROJECT,
        "identity_hash": packet.job.identity_hash,
        "cnf_blob_hash": package.cnf_sha256,
        "producer_manifest_hash": package.producer_manifest_sha256,
    }
    for field, wanted in expected.items():
        if status.get(field) != wanted or type(status.get(field)) is not str:
            raise PiqdCertifiedSolverError(f"status {field} binding mismatch")
    if status.get("status") not in {"completed", "failed"}:
        raise PiqdCertifiedSolverError("status is not terminal")
    if status.get("result") != packet.result:
        raise PiqdCertifiedSolverError("status and packet result mismatch")
    if packet.result in {"SAT", "UNSAT"} and status["status"] != "completed":
        raise PiqdCertifiedSolverError("solver result lacks completed status")
    if request.backend != "cadical":
        raise PiqdCertifiedSolverError("certified solver requires CaDiCaL")
    return status


def _validate_packet(
    packet: CardHeadPiqdPacket,
    request: CardHeadPiqdRequest,
    package: AuthenticatedPackageSnapshot,
) -> Mapping[str, Any]:
    if type(packet) is not CardHeadPiqdPacket:
        raise PiqdCertifiedSolverError("transport returned wrong packet type")
    if packet.job.backend == "march_cu":
        raise PiqdCertifiedSolverError(
            "march_cu jobs cannot enter the CaDiCaL certified seam"
        )
    try:
        _validate_job(packet.job, request)
    except CardHeadPiqdAdapterError as exc:
        raise _raise_certified(exc) from exc
    if type(packet.driver_result) is not DriverResult:
        raise PiqdCertifiedSolverError("packet driver result has wrong concrete type")
    if (
        packet.driver_result.job_id != packet.job.job_id
        or packet.terminal_record_sha256 != packet.driver_result.terminal_record_sha256
    ):
        raise PiqdCertifiedSolverError("packet/driver terminal binding mismatch")
    try:
        _digest(packet.terminal_record_sha256, "terminal record digest")
        _digest(packet.journal_sha256, "journal digest")
        _digest(packet.seal_sha256, "journal seal digest")
    except CardHeadPiqdAdapterError as exc:
        raise _raise_certified(exc) from exc
    return _strict_status(packet, request, package)


def _custody_paths(proof_path: Path) -> Mapping[str, Path]:
    if not isinstance(proof_path, Path):
        raise PiqdCertifiedSolverError("proof_path must be a native Path value")
    return {
        "proof": proof_path.with_suffix(".lrat"),
        "kept_cnf": proof_path.with_suffix(".kept.cnf"),
        "clause_map": proof_path.with_suffix(".clause-map.json"),
        "checker": proof_path.with_suffix(".replay.lean"),
        "replay": proof_path.with_suffix(".replay.json"),
        "receipt": proof_path.with_suffix(".piqd-certified.json"),
    }


def _require_create_once_targets(paths: Mapping[str, Path]) -> None:
    values = tuple(paths.values())
    if len(set(values)) != len(values):
        raise PiqdCertifiedSolverError("certified custody paths collide")
    parents = {path.parent for path in values}
    if len(parents) != 1:
        raise PiqdCertifiedSolverError("certified custody must share one directory")
    parent = next(iter(parents))
    try:
        directory = _open_directory_nofollow(parent)
    except CardHeadPiqdAdapterError as exc:
        raise _raise_certified(exc) from exc
    try:
        for path in values:
            try:
                os.stat(path.name, dir_fd=directory, follow_symlinks=False)
            except FileNotFoundError:
                continue
            except OSError as exc:
                raise PiqdCertifiedSolverError(
                    f"cannot inspect custody target: {path.name}"
                ) from exc
            raise PiqdCertifiedSolverError(
                f"certified custody target already exists: {path.name}"
            )
    finally:
        os.close(directory)


def _write_custody(paths: Mapping[str, Path], payloads: Mapping[str, bytes]) -> None:
    _require_create_once_targets(paths)
    for label in ("proof", "kept_cnf", "clause_map", "checker", "replay", "receipt"):
        try:
            _write_create_once(paths[label], payloads[label])
        except CardHeadPiqdAdapterError as exc:
            raise _raise_certified(exc) from exc


def _effective_dimacs(
    instance: CoverInstance, extra_clauses: Sequence[Collection[int]]
) -> bytes:
    try:
        return instance.dimacs(extra_clauses).encode("ascii")
    except (AttributeError, UnicodeEncodeError, ValueError, TypeError) as exc:
        raise PiqdCertifiedSolverError(
            "instance cannot emit exact ASCII DIMACS"
        ) from exc


def _install_or_capture_cnf(path: Path, cnf: bytes) -> None:
    try:
        _write_create_once(path, cnf)
    except CardHeadPiqdAdapterError as exc:
        if not str(exc).startswith("artifact already exists:"):
            raise _raise_certified(exc) from exc
        try:
            _capture_existing(path, cnf)
        except CardHeadPiqdAdapterError as capture_exc:
            raise _raise_certified(capture_exc) from capture_exc


@dataclass(frozen=True, slots=True)
class PiqdCertifiedSolver:
    """Frozen, ``solve_cadical``-compatible certified PIQD runner.

    ``transport`` must not fall back to a local solver.  A fake replayer may be
    injected to test rejection paths, but only the exact concrete
    :class:`LeanLratReplayer` can promote an UNSAT result.
    """

    package: AuthenticatedPackageSnapshot
    transport: PacketTransport
    replayer: LeanLratReplayer

    def __post_init__(self) -> None:
        if type(self.package) is not AuthenticatedPackageSnapshot:
            raise PiqdCertifiedSolverError(
                "certified solver requires an authenticated package snapshot"
            )
        if not callable(self.transport):
            raise PiqdCertifiedSolverError("certified transport must be callable")
        if not callable(getattr(self.replayer, "replay", None)):
            raise PiqdCertifiedSolverError("certified replayer must expose replay")

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
            raise PiqdCertifiedSolverError(
                "timeout_seconds must be positive builtin int"
            )
        if type(nice) is not int or not 1 <= nice <= 19:
            raise PiqdCertifiedSolverError("nice must be builtin int in 1..19")
        if not isinstance(cnf_path, Path) or (
            proof_path is not None and not isinstance(proof_path, Path)
        ):
            raise PiqdCertifiedSolverError("artifact paths must be Path values")
        cnf = _effective_dimacs(instance, extra_clauses)
        if cnf != self.package.cnf:
            raise PiqdCertifiedSolverError(
                "solver CNF differs from authenticated package"
            )
        _install_or_capture_cnf(cnf_path, cnf)
        request = self._request(timeout_seconds, nice, proof_path is not None)
        try:
            packet = self.transport(request)
        except Exception as exc:
            if isinstance(exc, (KeyboardInterrupt, SystemExit)):
                raise
            raise PiqdCertifiedSolverError(f"PIQD transport failed: {exc}") from exc
        status = _validate_packet(packet, request, self.package)
        if packet.result == "SAT":
            return self._sat_result(instance, packet)
        if packet.result == "UNSAT":
            return self._unsat_result(packet, status, proof_path)
        if any(
            value is not None
            for value in (
                packet.model_response,
                packet.model_canonical_receipt,
                packet.model_response_journal_sha256,
                packet.clause_map_response,
                packet.certificate_kind,
                packet.certificate,
                packet.lean_response,
                packet.proof_blob_hash,
                packet.kept_cnf_blob_hash,
                packet.kept_cnf_blob,
            )
        ):
            raise PiqdCertifiedSolverError("non-result packet carries artifacts")
        return CadicalResult(
            "UNKNOWN",
            None,
            None,
            False,
            "PIQD non-promotable terminal result; no fallback attempted",
            None,
        )

    def _sat_result(
        self, instance: CoverInstance, packet: CardHeadPiqdPacket
    ) -> CadicalResult:
        if (
            type(packet.model_response) is not bytes
            or type(packet.model_canonical_receipt) is not bytes
        ):
            raise PiqdCertifiedSolverError("SAT packet lacks exact model evidence")
        if any(
            value is not None
            for value in (
                packet.clause_map_response,
                packet.certificate_kind,
                packet.certificate,
                packet.lean_response,
                packet.proof_blob_hash,
                packet.kept_cnf_blob_hash,
                packet.kept_cnf_blob,
            )
        ):
            raise PiqdCertifiedSolverError("SAT packet carries UNSAT artifacts")
        model = _json(
            packet.model_response,
            "certified model response",
            canonical=False,
            limits=self.package.limits,
        )
        try:
            _exact_keys(model, _MODEL_KEYS, "model response")
        except CardHeadPiqdAdapterError as exc:
            raise _raise_certified(exc) from exc
        if canonical_json_bytes(model) != packet.model_canonical_receipt:
            raise PiqdCertifiedSolverError("model canonical receipt mismatch")
        if packet.model_response_journal_sha256 != sha256_bytes(packet.model_response):
            raise PiqdCertifiedSolverError("model bytes disagree with journal hash")
        if model["job_id"] != packet.job.job_id or model["result"] != "SAT":
            raise PiqdCertifiedSolverError("model job/result mismatch")
        assignment = model["assignment"]
        count = model["num_assigned"]
        if (
            type(assignment) is not list
            or type(count) is not int
            or count != len(assignment)
            or count != packet.job.num_vars
            or any(type(literal) is not int for literal in assignment)
        ):
            raise PiqdCertifiedSolverError("SAT model is not a total assignment")
        try:
            scan_dimacs(self.package.cnf, assignment=assignment)
            positive = frozenset(literal for literal in assignment if literal > 0)
            cube = instance.decode_model(positive)
        except (EncodingError, PiqdOracleError, TypeError, ValueError) as exc:
            raise PiqdCertifiedSolverError(f"SAT replay/decode failed: {exc}") from exc
        return CadicalResult(
            "SAT",
            cube,
            10,
            False,
            "PIQD SAT; total model replayed against exact CNF and decoder",
            positive,
        )

    def _unsat_result(
        self,
        packet: CardHeadPiqdPacket,
        status: Mapping[str, Any],
        proof_path: Path | None,
    ) -> CadicalResult:
        if proof_path is None:
            raise PiqdCertifiedSolverError(
                "certified UNSAT requires a proof_path for local custody"
            )
        if (
            packet.model_response is not None
            or packet.certificate_kind != CERTIFICATE_KIND
        ):
            raise PiqdCertifiedSolverError("UNSAT packet artifact kinds mismatch")
        proof = packet.certificate
        clause_map_raw = packet.clause_map_response
        kept_hash = packet.kept_cnf_blob_hash
        kept_cnf = packet.kept_cnf_blob
        proof_hash = packet.proof_blob_hash
        if not all(type(value) is bytes for value in (proof, clause_map_raw, kept_cnf)):
            raise PiqdCertifiedSolverError(
                "UNSAT packet lacks exact proof/map/kept-CNF bytes"
            )
        assert proof is not None and clause_map_raw is not None and kept_cnf is not None
        try:
            kept_hash = _digest(kept_hash, "packet kept CNF hash")
            proof_hash = _digest(proof_hash, "packet proof header hash")
            _validate_lrat(proof, max_bytes=self.package.limits.proof_bytes)
        except CardHeadPiqdAdapterError as exc:
            raise _raise_certified(exc) from exc
        if status.get("kept_cnf_blob_hash") != kept_hash:
            raise PiqdCertifiedSolverError("status/packet kept CNF hash mismatch")
        if sha256_bytes(kept_cnf) != kept_hash:
            raise PiqdCertifiedSolverError("kept CNF bytes hash mismatch")
        if sha256_bytes(proof) != proof_hash:
            raise PiqdCertifiedSolverError("compact LRAT header/hash mismatch")
        try:
            clause_map = consume_clause_map(
                clause_map_raw, self.package.cnf, packet.job
            )
        except ClauseMapContractError as exc:
            raise PiqdCertifiedSolverError(
                f"clause-map validation failed: {exc}"
            ) from exc
        if (
            clause_map.kept_sha256 != kept_hash
            or clause_map.canonical_kept_cnf != kept_cnf
        ):
            raise PiqdCertifiedSolverError(
                "clause-map canonical kept CNF disagrees with fetched blob"
            )
        try:
            replay = self.replayer.replay(
                job=packet.job,
                wave_manifest=self.package.wave_manifest,
                cnf=self.package.cnf,
                proof=proof,
                proof_sha256=proof_hash,
            )
            if type(replay) is not LratReplayResult:
                raise LratReplayError("replayer returned wrong concrete result type")
            validate_replay_result(
                result=replay,
                job=packet.job,
                wave_manifest=self.package.wave_manifest,
                cnf=self.package.cnf,
                proof=proof,
                proof_sha256=proof_hash,
            )
        except (LratReplayError, OSError, TypeError, ValueError) as exc:
            raise PiqdCertifiedSolverError(f"local Lean replay failed: {exc}") from exc
        if not replay.verified:
            raise PiqdCertifiedSolverError("local Lean replay rejected compact LRAT")
        if type(self.replayer) is not LeanLratReplayer:
            raise PiqdCertifiedSolverError(
                "only the concrete Lean LRAT replayer may certify UNSAT"
            )

        paths = _custody_paths(proof_path)
        unsigned_receipt = {
            "schema": CERTIFIED_RECEIPT_SCHEMA,
            "classification": "FINITE_LOCAL_CERTIFICATE",
            "job": {
                "id": packet.job.job_id,
                "backend": packet.job.backend,
                "solver_profile": packet.job.solver_profile,
                "identity_hash": packet.job.identity_hash,
            },
            "bindings": {
                "submitted_cnf_sha256": self.package.cnf_sha256,
                "producer_manifest_sha256": self.package.producer_manifest_sha256,
                "kept_cnf_sha256": kept_hash,
                "compact_lrat_sha256": proof_hash,
                "clause_map_response_sha256": clause_map.response_sha256,
                "status_response_sha256": sha256_bytes(packet.status_response),
                "journal_sha256": packet.journal_sha256,
                "journal_seal_sha256": packet.seal_sha256,
            },
            "custody": {
                "requested_proof_path": str(proof_path),
                "compact_lrat_path": str(paths["proof"]),
                "kept_cnf_path": str(paths["kept_cnf"]),
                "clause_map_path": str(paths["clause_map"]),
                "checker_source_path": str(paths["checker"]),
                "replay_receipt_path": str(paths["replay"]),
            },
            "replay": {
                "verified": True,
                "checker_source_sha256": sha256_bytes(replay.checker_source),
                "receipt_sha256": sha256_bytes(replay.receipt),
                "concrete_replayer": True,
            },
            "proof_verified": True,
            "source_entitlement_established": False,
            "source_coverage_established": False,
            "universal_result_established": False,
            "lean_theorem_closure_established": False,
        }
        unsigned_bytes = canonical_json_bytes(unsigned_receipt)
        receipt = dict(unsigned_receipt)
        receipt["receipt_sha256"] = sha256_bytes(unsigned_bytes)
        receipt_bytes = canonical_json_bytes(receipt)
        payloads = {
            "proof": proof,
            "kept_cnf": kept_cnf,
            "clause_map": clause_map_raw,
            "checker": replay.checker_source,
            "replay": replay.receipt,
            "receipt": receipt_bytes,
        }
        _write_custody(paths, payloads)
        return CadicalResult(
            "UNSAT",
            None,
            20,
            True,
            "PIQD UNSAT; exact artifacts bound and locally replayed in Lean",
            None,
        )


CertifiedQueryFactory = Callable[[bytes, Path], PiqdCertifiedSolver]


@dataclass(frozen=True, slots=True)
class PiqdPerQueryCertifiedSolver:
    """Route each effective DIMACS query through its own exact package.

    Frontier lanes may reuse this callable across discovery and residual
    queries.  ``query_factory`` must mint a fresh authenticated package,
    transport, and (for production) concrete replay boundary for the exact
    bytes passed to it.  The returned fixed solver is checked again before any
    transport call.
    """

    query_factory: CertifiedQueryFactory

    def __post_init__(self) -> None:
        if not callable(self.query_factory):
            raise PiqdCertifiedSolverError("query_factory must be callable")

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
        if not isinstance(cnf_path, Path):
            raise PiqdCertifiedSolverError("cnf_path must be a native Path value")
        cnf = _effective_dimacs(instance, extra_clauses)
        try:
            solver = self.query_factory(cnf, cnf_path)
        except Exception as exc:
            if isinstance(exc, (KeyboardInterrupt, SystemExit)):
                raise
            raise PiqdCertifiedSolverError(
                f"per-query certified solver construction failed: {exc}"
            ) from exc
        if type(solver) is not PiqdCertifiedSolver:
            raise PiqdCertifiedSolverError(
                "query_factory returned wrong concrete solver type"
            )
        if solver.package.cnf != cnf:
            raise PiqdCertifiedSolverError(
                "per-query package CNF differs from effective DIMACS"
            )
        return solver(
            instance,
            cnf_path,
            extra_clauses=extra_clauses,
            timeout_seconds=timeout_seconds,
            nice=nice,
            proof_path=proof_path,
        )


__all__ = [
    "CERTIFIED_RECEIPT_SCHEMA",
    "CertifiedQueryFactory",
    "PiqdCertifiedSolver",
    "PiqdCertifiedSolverError",
    "PiqdPerQueryCertifiedSolver",
]
