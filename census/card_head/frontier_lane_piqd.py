# Copyright (c) 2026 Adam McKenna
# SPDX-License-Identifier: MIT
# Author: Adam McKenna

"""Certified PIQD integration for the finite/local DE, DR, and E callers.

This module deliberately does not register B or C.  Each call of the returned
``PiqdPerQueryCertifiedSolver`` captures the current lane sources, builds one
authenticated package for the exact effective DIMACS bytes, creates one fresh
transport attempt, and creates one fresh independent Lean LRAT replayer.
"""

from __future__ import annotations

import argparse
import hashlib
import uuid
from collections.abc import Callable, Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Protocol

from census.card_head.piqd_certified_solver import (
    PiqdCertifiedSolver,
    PiqdPerQueryCertifiedSolver,
)
from census.card_head.piqd_frontier_package import (
    BuildAllocation,
    BuildPhase,
    BuildQuery,
    FrontierLaneProfile,
    FrontierPackageLimits,
    build_complete_variable_map,
    build_frontier_authenticated_package,
    build_phase_ledger,
    capture_source_file,
)
from census.card_head.sat_encoding import CadicalResult
from census.p97_search.phase3_cegar_wave import UNSAT_MEANS_OBSTRUCTION
from census.p97_search.phase3_piqd_card_head_adapter import (
    make_current_piqd_packet_transport,
)
from census.p97_search.phase3_piqd_replay import LeanLratReplayer

DEFAULT_PIQD_BASE_URL = "http://127.0.0.1:7272"
PIQD_BACKEND = "piqd"
LEGACY_LOCAL_BACKEND = "legacy-local"
SUPPORTED_BACKENDS = (PIQD_BACKEND, LEGACY_LOCAL_BACKEND)

_REPO_ROOT = Path(__file__).resolve().parents[2]


class FrontierSolver(Protocol):
    def __call__(
        self,
        instance: Any,
        cnf_path: Path,
        *,
        extra_clauses: Any = (),
        timeout_seconds: int = 30,
        nice: int = 10,
        proof_path: Path | None = None,
    ) -> CadicalResult: ...


@dataclass(frozen=True, slots=True)
class _LaneSource:
    lane: str
    encoding_path: str
    spec_path: str
    live_leaf: str
    finite_schema: str
    cardinality_scope: str
    source_theorem: str


_LANES: dict[str, _LaneSource] = {
    "DE": _LaneSource(
        lane="DE",
        encoding_path="census/frontier-packages/de_core/encoding.py",
        spec_path="census/frontier-packages/D-E-ENCODING-SPEC.md",
        live_leaf="D3-D4-named-local-diagnostic",
        finite_schema="named-local-propositional-projection",
        cardinality_scope="open-carrier-symbolic-lower-bounds",
        source_theorem="NONE: finite/local D3-D4 residual projection only",
    ),
    "DR": _LaneSource(
        lane="DR",
        encoding_path="census/frontier-packages/dr_core/encoding.py",
        spec_path="census/frontier-packages/D-R-ENCODING-SPEC.md",
        live_leaf="D1-D2-named-local-incidence-shadow",
        finite_schema="named-local-incidence-shadow",
        cardinality_scope="open-carrier-non-enumerative",
        source_theorem="NONE: finite/local D1-D2 incidence projection only",
    ),
    "E": _LaneSource(
        lane="E",
        encoding_path="census/frontier-packages/e_core/encoding.py",
        spec_path="census/frontier-packages/E-ENCODING-SPEC.md",
        live_leaf="E-triapex-directed-omission",
        finite_schema="named-local-layer-1-projection",
        cardinality_scope="symbolic-cardinality-abstraction",
        source_theorem="NONE: finite/local E layer-1 projection only",
    ),
}


def add_solver_arguments(parser: argparse.ArgumentParser) -> None:
    """Add the closed backend choice shared by the owned frontier callers."""

    parser.add_argument(
        "--solver-backend",
        choices=SUPPORTED_BACKENDS,
        default=PIQD_BACKEND,
        help="certified PIQD by default; raw local DRAT only when explicitly selected",
    )
    parser.add_argument("--piqd-base-url", default=DEFAULT_PIQD_BASE_URL)
    parser.add_argument("--piqd-max-polls", type=int, default=300)
    parser.add_argument("--piqd-poll-interval", type=float, default=2.0)
    parser.add_argument("--lean-replay-timeout", type=int, default=300)
    parser.add_argument(
        "--workers",
        type=int,
        choices=(1,),
        default=1,
        help="frontier certificate custody is intentionally sequential",
    )


def _named_variables(encoder: Any) -> dict[str, int]:
    names = getattr(encoder, "names", None)
    if type(names) is not dict:
        raise ValueError("frontier encoder must expose an exact names dictionary")
    return dict(names)


def _source_snapshots(source: _LaneSource) -> tuple[Any, ...]:
    snapshots = (
        capture_source_file(_REPO_ROOT, source.encoding_path),
        capture_source_file(_REPO_ROOT, source.spec_path),
    )
    return tuple(sorted(snapshots, key=lambda snapshot: snapshot.logical_path))


def _query_records(
    *, lane: str, cnf: bytes, named_variables: dict[str, int]
) -> tuple[bytes, bytes, FrontierLaneProfile]:
    digest = hashlib.sha256(cnf).hexdigest()
    query_id = f"{lane.lower()}:{digest}"
    query = BuildQuery.from_cnf(query_id, cnf)
    variable_map = build_complete_variable_map(cnf, named_variables)
    ledger = build_phase_ledger(
        (
            BuildPhase(
                phase_name="encoder-allocation",
                allocations=(
                    BuildAllocation(
                        first_id=1,
                        last_id=query.num_variables,
                        purpose=f"{lane.lower()}-encoder-variables",
                    ),
                ),
                allocator_num_variables=query.num_variables,
            ),
            BuildPhase(
                phase_name="effective-query",
                allocations=(),
                allocator_num_variables=query.num_variables,
                query=query,
            ),
        ),
        query_id,
    )
    source = _LANES[lane]
    profile = FrontierLaneProfile(
        lane=lane,
        query_id=query_id,
        wave_id=f"frontier:{query_id}",
        live_leaf=source.live_leaf,
        finite_schema=source.finite_schema,
        cardinality_scope=source.cardinality_scope,
        source_theorem=source.source_theorem,
        query_polarity=UNSAT_MEANS_OBSTRUCTION,
    )
    return variable_map, ledger, profile


def make_query_factory(
    *,
    lane: str,
    encoder: Any,
    artifact_root: Path,
    base_url: str = DEFAULT_PIQD_BASE_URL,
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
    replay_timeout_s: int = 300,
    package_limits: FrontierPackageLimits | None = None,
    packet_transport_builder: Callable[..., Any] = make_current_piqd_packet_transport,
    replayer_builder: Callable[..., Any] = LeanLratReplayer,
) -> Callable[[bytes, Path], PiqdCertifiedSolver]:
    """Build the exact per-query construction seam used by the shared solver."""

    if lane not in _LANES:
        raise ValueError("certified frontier integration supports only DE, DR, and E")
    if not isinstance(artifact_root, Path):
        raise TypeError("artifact_root must be a pathlib.Path")
    if type(base_url) is not str or not base_url:
        raise ValueError("base_url must be a nonempty string")
    named_variables = _named_variables(encoder)
    source = _LANES[lane]

    def query_factory(cnf: bytes, cnf_path: Path) -> PiqdCertifiedSolver:
        variable_map, ledger, profile = _query_records(
            lane=lane, cnf=cnf, named_variables=named_variables
        )
        package_kwargs: dict[str, Any] = {
            "cnf": cnf,
            "variable_map_bytes": variable_map,
            "source_snapshots": _source_snapshots(source),
            "build_phase_ledger_bytes": ledger,
            "lane_profile": profile,
        }
        if package_limits is not None:
            package_kwargs["limits"] = package_limits
        package = build_frontier_authenticated_package(**package_kwargs)

        attempts_parent = artifact_root / "piqd-attempts"
        attempts_parent.mkdir(parents=True, exist_ok=True)
        attempt_root = attempts_parent / (
            f"{cnf_path.stem}-{hashlib.sha256(cnf).hexdigest()[:16]}-{uuid.uuid4().hex}"
        )
        transport = packet_transport_builder(
            package.snapshot,
            output_root=attempt_root,
            base_url=base_url,
            max_polls=max_polls,
            poll_interval_s=poll_interval_s,
            fetch_certified_kept_blob=True,
        )
        replayer = replayer_builder(
            lean_root=_REPO_ROOT,
            work_dir=attempt_root / "lean-replay",
            timeout_s=replay_timeout_s,
        )
        return PiqdCertifiedSolver(package.snapshot, transport, replayer)

    return query_factory


def make_solver(
    *,
    lane: str,
    encoder: Any,
    artifact_root: Path,
    base_url: str = DEFAULT_PIQD_BASE_URL,
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
    replay_timeout_s: int = 300,
) -> PiqdPerQueryCertifiedSolver:
    """Return the required shared certified per-effective-query solver."""

    query_factory = make_query_factory(
        lane=lane,
        encoder=encoder,
        artifact_root=artifact_root,
        base_url=base_url,
        max_polls=max_polls,
        poll_interval_s=poll_interval_s,
        replay_timeout_s=replay_timeout_s,
    )
    return PiqdPerQueryCertifiedSolver(query_factory)


def solver_from_args(
    *,
    args: argparse.Namespace,
    lane: str,
    encoder: Any,
    artifact_root: Path,
    legacy_solver: FrontierSolver,
) -> FrontierSolver:
    """Select PIQD or the explicitly requested legacy-local callable.

    There is intentionally no exception handler and no fallback path.
    """

    if args.workers != 1:
        raise ValueError("frontier solver execution requires exactly one worker")
    if args.solver_backend == LEGACY_LOCAL_BACKEND:
        return legacy_solver
    if args.solver_backend != PIQD_BACKEND:
        raise ValueError("unknown frontier solver backend")
    return make_solver(
        lane=lane,
        encoder=encoder,
        artifact_root=artifact_root,
        base_url=args.piqd_base_url,
        max_polls=args.piqd_max_polls,
        poll_interval_s=args.piqd_poll_interval,
        replay_timeout_s=args.lean_replay_timeout,
    )


def proof_manifest_fields(
    *,
    backend: str,
    requested_proof_path: Path,
    result: CadicalResult,
    relative_to: Path,
) -> Mapping[str, Any]:
    """Describe proof custody without relabeling PIQD LRAT as raw DRAT."""

    fields: dict[str, Any] = {
        "solver_backend": backend,
        "proof_format": None,
        "proof_file": None,
        "requested_proof_file": str(requested_proof_path.relative_to(relative_to)),
    }
    if result.verdict != "UNSAT":
        return fields
    if backend == LEGACY_LOCAL_BACKEND:
        fields.update(
            proof_format="DRAT",
            proof_file=str(requested_proof_path.relative_to(relative_to)),
        )
        return fields
    if backend != PIQD_BACKEND:
        raise ValueError("unknown frontier solver backend")
    paths = {
        "proof_file": requested_proof_path.with_suffix(".lrat"),
        "kept_cnf_file": requested_proof_path.with_suffix(".kept.cnf"),
        "proof_clause_map_file": requested_proof_path.with_suffix(".clause-map.json"),
        "lean_replay_source_file": requested_proof_path.with_suffix(".replay.lean"),
        "lean_replay_receipt_file": requested_proof_path.with_suffix(".replay.json"),
        "certified_receipt_file": requested_proof_path.with_suffix(
            ".piqd-certified.json"
        ),
    }
    fields["proof_format"] = "LRAT"
    fields.update(
        {name: str(path.relative_to(relative_to)) for name, path in paths.items()}
    )
    return fields


__all__ = [
    "DEFAULT_PIQD_BASE_URL",
    "LEGACY_LOCAL_BACKEND",
    "PIQD_BACKEND",
    "SUPPORTED_BACKENDS",
    "FrontierSolver",
    "add_solver_arguments",
    "make_query_factory",
    "make_solver",
    "proof_manifest_fields",
    "solver_from_args",
]
