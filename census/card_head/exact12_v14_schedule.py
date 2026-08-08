"""Hash-stable enumeration contract for the exact-12 full-v14 cells.

The coordinates in this module mirror the checked Lean normalization and
branch ingress.  They define a finite work schedule only: cells may overlap or
be empty, and enumerating them proves neither solver coverage nor a geometric
contradiction.
"""

from __future__ import annotations

import hashlib
import json
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

SCHEDULE_SCHEMA = "p97_rigid221_exact12_full_v14_schedule.v1"
MANIFEST_SCHEMA = "p97_rigid221_exact12_full_v14_manifest.v1"
SEMANTIC_STATUS = "ENUMERATION_ONLY"
FROZEN_SCHEDULE_SHA256 = (
    "b183cab096266e597362c6919df121cd311c7fc20e155f8b24ef12d23f4bd05b"
)

# Membership in this list is kernel checked by
# ``frozenSeparatedPlacementRepresentativeList_toFinset``.  The tuple order is
# frozen by this module's authenticated payload and regression tests.
PLACEMENT_REPRESENTATIVES: tuple[tuple[int, int], ...] = (
    (0, 2),
    (0, 3),
    (2, 0),
    (2, 10),
    (2, 11),
    (3, 0),
    (3, 10),
    (3, 11),
    (10, 2),
    (10, 3),
    (11, 2),
    (11, 3),
)

NAMED_DELETION_ARMS: tuple[str, ...] = (
    "u_q",
    "u_w",
    "xv_q",
    "xv_w",
    "xu_q",
    "xu_w",
)

# ``FrozenDistinguishedDCommonMissingAwayFromEight`` excludes 1, 7, and 8.
DISTINGUISHED_D_CENTERS: tuple[int, ...] = (0, 2, 3, 4, 5, 6, 9, 10, 11)

LEAN_CONTRACT_SYMBOL = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "exists_source_normalized_v14_physicalCycle_namedArm_distinguishedD"
)
LEAN_CONTRACT_FILES: tuple[str, ...] = (
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221PlacementTransport.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221PlacementOrbits.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NormalizedSafeIngress.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221PhysicalCycleIngress.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221BranchTransport.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NormalizedV14Ingress.lean"
    ),
)


class Exact12V14ScheduleError(ValueError):
    """The schedule or its authenticated source contract is malformed."""


@dataclass(frozen=True, order=True)
class Exact12V14Cell:
    placement_index: int
    joint_deletion: int
    v: int
    arm: str
    distinguished_d: int


def cells() -> tuple[Exact12V14Cell, ...]:
    """Return all 12 x 6 x 9 cells in a deterministic order."""

    return tuple(
        Exact12V14Cell(index, joint_deletion, v, arm, distinguished_d)
        for index, (joint_deletion, v) in enumerate(PLACEMENT_REPRESENTATIVES)
        for arm in NAMED_DELETION_ARMS
        for distinguished_d in DISTINGUISHED_D_CENTERS
    )


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def json_sha256(value: Any) -> str:
    return hashlib.sha256(_canonical_bytes(value)).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def source_contract(repo_root: Path) -> dict[str, Any]:
    """Bind a schedule to the exact Lean files supplying its semantics."""

    files: list[dict[str, Any]] = []
    for relative in LEAN_CONTRACT_FILES:
        path = repo_root / relative
        if not path.is_file():
            raise Exact12V14ScheduleError(f"missing Lean contract file: {relative}")
        files.append(
            {
                "path": relative,
                "bytes": path.stat().st_size,
                "sha256": _sha256_file(path),
            }
        )
    return {"symbol": LEAN_CONTRACT_SYMBOL, "files": files}


def schedule_payload() -> dict[str, Any]:
    schedule_cells = [asdict(cell) for cell in cells()]
    return {
        "schema": SCHEDULE_SCHEMA,
        "semantic_status": SEMANTIC_STATUS,
        "scope": (
            "deterministic enumeration of the checked exact-12 full-v14 "
            "coordinates; cells may overlap or be empty; no SAT, coverage, "
            "UNSAT, certificate-replay, or Lean-closure claim"
        ),
        "coordinates": {
            "placement_representatives": [
                {"joint_deletion": joint_deletion, "v": v}
                for joint_deletion, v in PLACEMENT_REPRESENTATIVES
            ],
            "named_deletion_arms": list(NAMED_DELETION_ARMS),
            "distinguished_d_centers": list(DISTINGUISHED_D_CENTERS),
        },
        "counts": {
            "placements": len(PLACEMENT_REPRESENTATIVES),
            "arms": len(NAMED_DELETION_ARMS),
            "distinguished_d_centers": len(DISTINGUISHED_D_CENTERS),
            "cells": len(schedule_cells),
        },
        "cells": schedule_cells,
    }


def build_manifest(repo_root: Path) -> dict[str, Any]:
    schedule = schedule_payload()
    return {
        "schema": MANIFEST_SCHEMA,
        "source_contract": source_contract(repo_root),
        "schedule_sha256": json_sha256(schedule),
        "schedule": schedule,
    }


def validate_manifest(manifest: dict[str, Any], repo_root: Path) -> None:
    """Fail closed unless a manifest is the current complete schedule."""

    if set(manifest) != {
        "schema",
        "source_contract",
        "schedule_sha256",
        "schedule",
    }:
        raise Exact12V14ScheduleError("manifest fields differ from the frozen schema")
    if manifest["schema"] != MANIFEST_SCHEMA:
        raise Exact12V14ScheduleError("manifest schema is not supported")
    expected_schedule = schedule_payload()
    if _canonical_bytes(manifest["schedule"]) != _canonical_bytes(expected_schedule):
        raise Exact12V14ScheduleError("manifest does not contain the complete schedule")
    expected_schedule_sha256 = json_sha256(expected_schedule)
    if expected_schedule_sha256 != FROZEN_SCHEDULE_SHA256:
        raise Exact12V14ScheduleError(
            "implemented schedule differs from the frozen schema payload"
        )
    if manifest["schedule_sha256"] != FROZEN_SCHEDULE_SHA256:
        raise Exact12V14ScheduleError("schedule hash does not authenticate the payload")
    if _canonical_bytes(manifest["source_contract"]) != _canonical_bytes(
        source_contract(repo_root)
    ):
        raise Exact12V14ScheduleError("Lean source contract differs from the manifest")
