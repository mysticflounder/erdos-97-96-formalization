# Copyright (c) 2026 Adam McKenna
# SPDX-License-Identifier: MIT
# Author: Adam McKenna

"""Certified PIQD integration for the finite/local B- and C-core callers.

Every invocation materializes one authenticated package from the exact
effective DIMACS bytes.  The module contains no local-solver fallback: callers
must select ``legacy-local`` explicitly before this seam is bypassed.
"""

from __future__ import annotations

import hashlib
import uuid
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.card_head.frontier_lane_piqd import (
    DEFAULT_PIQD_BASE_URL,
    LEGACY_LOCAL_BACKEND,
    PIQD_BACKEND,
    FrontierSolver,
)
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
from census.p97_search.phase3_cegar_wave import UNSAT_MEANS_OBSTRUCTION
from census.p97_search.phase3_piqd_card_head_adapter import (
    make_current_piqd_packet_transport,
)
from census.p97_search.phase3_piqd_replay import LeanLratReplayer

_REPO_ROOT = Path(__file__).resolve().parents[2]

B_RUN_SOURCES = (
    "census/frontier-packages/b_core/encoding.py",
    "census/frontier-packages/b_core/run.py",
    "census/frontier-packages/b_core/producer_contract.json",
    "census/frontier-packages/B-ENCODING-SPEC.md",
    "lean/scratch/b-family-bank/B2Arm3.lean",
)
B_SMOKE_SOURCES = (
    "census/frontier-packages/b_core/encoding.py",
    "census/frontier-packages/b_core/smoke.py",
    "census/frontier-packages/B-ENCODING-SPEC.md",
    "lean/scratch/b-family-bank/B2Arm3.lean",
)
C_RUN_SOURCES = (
    "census/frontier-packages/c_core/encoding.py",
    "census/frontier-packages/c_core/run.py",
    "census/frontier-packages/C-CORE-ENCODING-SPEC.md",
    "census/frontier-packages/A-CORE-ENCODING-SPEC.md",
    "docs/solve-prompts/2026-07-27-physical-apex-boundary.md",
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean",
    "lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean",
)
C_SMOKE_SOURCES = (
    "census/frontier-packages/c_core/encoding.py",
    "census/frontier-packages/c_core/smoke.py",
    "census/frontier-packages/C-CORE-ENCODING-SPEC.md",
    "census/frontier-packages/A-CORE-ENCODING-SPEC.md",
    "docs/solve-prompts/2026-07-27-physical-apex-boundary.md",
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean",
    "lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean",
)


@dataclass(frozen=True, slots=True)
class AllocationPhase:
    """One chronological, cumulative encoder allocation watermark."""

    phase_name: str
    last_id: int
    purpose: str

    def __post_init__(self) -> None:
        if type(self.phase_name) is not str or not self.phase_name:
            raise ValueError("allocation phase_name must be nonempty text")
        if type(self.last_id) is not int or self.last_id <= 0:
            raise ValueError("allocation last_id must be a positive builtin int")
        if type(self.purpose) is not str or not self.purpose:
            raise ValueError("allocation purpose must be nonempty text")


@dataclass(frozen=True, slots=True)
class BcCallerPackageProfile:
    """Finite/local caller metadata and exact source/allocation custody."""

    lane: str
    source_paths: tuple[str, ...]
    allocation_phases: tuple[AllocationPhase, ...]
    live_leaf: str
    finite_schema: str
    cardinality_scope: str
    source_theorem: str

    def __post_init__(self) -> None:
        if self.lane not in {"B", "C"}:
            raise ValueError("B/C caller profile lane must be B or C")
        if (
            type(self.source_paths) is not tuple
            or not self.source_paths
            or any(type(path) is not str or not path for path in self.source_paths)
            or len(set(self.source_paths)) != len(self.source_paths)
        ):
            raise ValueError("source_paths must be a unique nonempty tuple")
        if (
            type(self.allocation_phases) is not tuple
            or not self.allocation_phases
            or any(
                type(phase) is not AllocationPhase for phase in self.allocation_phases
            )
        ):
            raise ValueError(
                "allocation_phases must contain exact AllocationPhase values"
            )
        previous = 0
        names: set[str] = set()
        for phase in self.allocation_phases:
            if phase.phase_name in names or phase.last_id <= previous:
                raise ValueError(
                    "allocation phases must be unique and strictly increasing"
                )
            names.add(phase.phase_name)
            previous = phase.last_id
        for field in (
            self.live_leaf,
            self.finite_schema,
            self.cardinality_scope,
            self.source_theorem,
        ):
            if type(field) is not str or not field:
                raise ValueError("caller profile metadata must be nonempty text")


def _named_variables(encoder: Any) -> dict[str, int]:
    names = getattr(encoder, "names", None)
    if type(names) is not dict:
        raise ValueError("frontier encoder must expose an exact names dictionary")
    return dict(names)


def _source_snapshots(paths: tuple[str, ...]) -> tuple[Any, ...]:
    return tuple(capture_source_file(_REPO_ROOT, path) for path in paths)


def _query_records(
    *, cnf: bytes, profile: BcCallerPackageProfile, named_variables: dict[str, int]
) -> tuple[bytes, bytes, FrontierLaneProfile]:
    digest = hashlib.sha256(cnf).hexdigest()
    query_id = f"{profile.lane.lower()}:{digest}"
    query = BuildQuery.from_cnf(query_id, cnf)
    if profile.allocation_phases[-1].last_id != query.num_variables:
        raise ValueError(
            "final allocation watermark differs from effective DIMACS header"
        )

    phases: list[BuildPhase] = []
    first_id = 1
    for allocation in profile.allocation_phases:
        phases.append(
            BuildPhase(
                phase_name=allocation.phase_name,
                allocations=(
                    BuildAllocation(first_id, allocation.last_id, allocation.purpose),
                ),
                allocator_num_variables=allocation.last_id,
            )
        )
        first_id = allocation.last_id + 1
    phases.append(
        BuildPhase(
            phase_name="effective query materialization",
            allocations=(),
            allocator_num_variables=query.num_variables,
            query=query,
        )
    )
    ledger = build_phase_ledger(tuple(phases), query_id)
    variable_map = build_complete_variable_map(cnf, named_variables)
    lane_profile = FrontierLaneProfile(
        lane=profile.lane,
        query_id=query_id,
        wave_id=f"frontier:{query_id}",
        live_leaf=profile.live_leaf,
        finite_schema=profile.finite_schema,
        cardinality_scope=profile.cardinality_scope,
        source_theorem=profile.source_theorem,
        query_polarity=UNSAT_MEANS_OBSTRUCTION,
    )
    return variable_map, ledger, lane_profile


def make_query_factory(
    *,
    encoder: Any,
    profile: BcCallerPackageProfile,
    artifact_root: Path,
    base_url: str = DEFAULT_PIQD_BASE_URL,
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
    replay_timeout_s: int = 300,
    package_limits: FrontierPackageLimits | None = None,
    packet_transport_builder: Callable[..., Any] = make_current_piqd_packet_transport,
    replayer_builder: Callable[..., Any] = LeanLratReplayer,
) -> Callable[[bytes, Path], PiqdCertifiedSolver]:
    """Construct a fresh exact package, transport, and replayer per query."""

    if not isinstance(artifact_root, Path):
        raise TypeError("artifact_root must be a pathlib.Path")
    if type(base_url) is not str or not base_url:
        raise ValueError("base_url must be a nonempty string")
    named_variables = _named_variables(encoder)

    def query_factory(cnf: bytes, cnf_path: Path) -> PiqdCertifiedSolver:
        variable_map, ledger, lane_profile = _query_records(
            cnf=cnf, profile=profile, named_variables=named_variables
        )
        package_kwargs: dict[str, Any] = {
            "cnf": cnf,
            "variable_map_bytes": variable_map,
            "source_snapshots": _source_snapshots(profile.source_paths),
            "build_phase_ledger_bytes": ledger,
            "lane_profile": lane_profile,
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
    encoder: Any,
    profile: BcCallerPackageProfile,
    artifact_root: Path,
    base_url: str = DEFAULT_PIQD_BASE_URL,
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
    replay_timeout_s: int = 300,
) -> PiqdPerQueryCertifiedSolver:
    """Return the shared certified per-effective-query solver."""

    return PiqdPerQueryCertifiedSolver(
        make_query_factory(
            encoder=encoder,
            profile=profile,
            artifact_root=artifact_root,
            base_url=base_url,
            max_polls=max_polls,
            poll_interval_s=poll_interval_s,
            replay_timeout_s=replay_timeout_s,
        )
    )


def solver_from_args(
    *,
    args: Any,
    encoder: Any,
    profile: BcCallerPackageProfile,
    artifact_root: Path,
    legacy_solver: FrontierSolver,
) -> FrontierSolver:
    """Select certified PIQD or explicit legacy-local, with no fallback."""

    if args.workers != 1:
        raise ValueError("frontier solver execution requires exactly one worker")
    if args.solver_backend == LEGACY_LOCAL_BACKEND:
        return legacy_solver
    if args.solver_backend != PIQD_BACKEND:
        raise ValueError("unknown frontier solver backend")
    return make_solver(
        encoder=encoder,
        profile=profile,
        artifact_root=artifact_root,
        base_url=args.piqd_base_url,
        max_polls=args.piqd_max_polls,
        poll_interval_s=args.piqd_poll_interval,
        replay_timeout_s=args.lean_replay_timeout,
    )


__all__ = [
    "B_RUN_SOURCES",
    "B_SMOKE_SOURCES",
    "C_RUN_SOURCES",
    "C_SMOKE_SOURCES",
    "AllocationPhase",
    "BcCallerPackageProfile",
    "make_query_factory",
    "make_solver",
    "solver_from_args",
]
