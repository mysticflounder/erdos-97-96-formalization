#!/usr/bin/env python3
"""Replay the complete-radius equality closure on two stored no-packing fixtures.

The fixtures contain one selected K4 row at each carrier center and a total
fixed blocker map.  A center in the blocker image is deletion-critical for at
least one source, so the selected row at that center must equal the complete
critical shell (`CriticalShellSystem.selectedFourClass_support_eq_shell`).

The audit searches for the smallest three-center equality chain that forces a
recorded omission in such a complete row.  It is an exact finite replay of the
two JSON fixtures, not arbitrary-cardinality occurrence coverage.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_DIR = HERE.parent / "unique4-three-row-placement-source-audit"
FIXTURES = {
    4: SOURCE_DIR / "critical_map_profile4.json",
    5: SOURCE_DIR / "critical_map_profile5.json",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def atomic_write_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp.{os.getpid()}")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    temporary.replace(path)


def validate_fixture(payload: dict[str, Any], profile: int) -> tuple[list[set[int]], list[int]]:
    if payload.get("status") != "SAT_NO_FOUR_ARC_PACKING":
        raise AssertionError(f"profile {profile}: not a stored SAT no-packing fixture")
    if int(payload.get("n", -1)) != 11:
        raise AssertionError(f"profile {profile}: carrier cardinality drift")
    if int(payload.get("exact_two_profile", -1)) != profile:
        raise AssertionError(f"profile {profile}: profile tag drift")
    rows = payload["rows"]
    blockers = list(map(int, payload["blockers"]))
    if len(rows) != 11 or len(blockers) != 11:
        raise AssertionError(f"profile {profile}: row/blocker cardinality drift")
    supports: list[set[int]] = []
    for center, row in enumerate(rows):
        if int(row["center"]) != center:
            raise AssertionError(f"profile {profile}: row order drift at {center}")
        support = set(map(int, row["support"]))
        if len(support) != 4 or center in support:
            raise AssertionError(f"profile {profile}: malformed selected row at {center}")
        supports.append(support)
    for source, blocker in enumerate(blockers):
        if not 0 <= blocker < 11 or blocker == source:
            raise AssertionError(f"profile {profile}: malformed blocker at {source}")
        if source not in supports[blocker]:
            raise AssertionError(f"profile {profile}: source absent from blocker row")
    first_fiber = {source for source, blocker in enumerate(blockers) if blocker == 0}
    if first_fiber != supports[0]:
        raise AssertionError(f"profile {profile}: exact first-apex fiber drift")
    return supports, blockers


def triangle_certificates(
    supports: list[set[int]], blockers: list[int]
) -> list[dict[str, Any]]:
    blocker_image = set(blockers)
    certificates: list[dict[str, Any]] = []
    for anchor in range(len(supports)):
        for middle in range(len(supports)):
            for blocker in range(len(supports)):
                if len({anchor, middle, blocker}) != 3 or blocker not in blocker_image:
                    continue
                conditions = {
                    "middle_mem_anchor_row": middle in supports[anchor],
                    "blocker_mem_anchor_row": blocker in supports[anchor],
                    "anchor_mem_middle_row": anchor in supports[middle],
                    "blocker_mem_middle_row": blocker in supports[middle],
                    "middle_mem_blocker_row": middle in supports[blocker],
                    "anchor_omitted_by_blocker_row": anchor not in supports[blocker],
                }
                if not all(conditions.values()):
                    continue
                sources = [
                    source for source, center in enumerate(blockers) if center == blocker
                ]
                if not sources or any(source not in supports[blocker] for source in sources):
                    raise AssertionError("blocker-image exact-row source replay failed")
                certificates.append(
                    {
                        "anchor": anchor,
                        "middle": middle,
                        "blocker_center": blocker,
                        "critical_sources_at_blocker": sources,
                        "conditions": conditions,
                        "forced_conclusion": {
                            "point": anchor,
                            "support_center": blocker,
                            "membership": True,
                        },
                        "recorded_fixture_membership": anchor in supports[blocker],
                    }
                )
    return certificates


def generate() -> dict[str, Any]:
    records = []
    for profile, fixture in FIXTURES.items():
        payload = json.loads(fixture.read_text())
        supports, blockers = validate_fixture(payload, profile)
        certificates = triangle_certificates(supports, blockers)
        if not certificates:
            raise AssertionError(f"profile {profile}: no complete-radius violation found")
        records.append(
            {
                "profile": profile,
                "fixture": str(fixture.relative_to(ROOT)),
                "fixture_sha256": sha256(fixture),
                "blocker_image": sorted(set(blockers)),
                "certificate_count": len(certificates),
                "lexicographically_first_certificate": certificates[0],
                "all_certificates": certificates,
                "fixture_violates_complete_radius_triangle_closure": True,
                "all_fixture_constraints_replayed": True,
            }
        )
    return {
        "schema": "p97-unique4-complete-radius-placement-audit-v1",
        "epistemic_status": "EXACT_FINITE_REPLAY_OF_TWO_STORED_COUNTERPATTERNS",
        "claim_scope": (
            "The two n=11 fixtures only; this is not a source-level occurrence "
            "theorem and not arbitrary-cardinality coverage"
        ),
        "audit_source": str(Path(__file__).resolve().relative_to(ROOT.resolve())),
        "audit_source_sha256": sha256(Path(__file__).resolve()),
        "checked_lean_producer": (
            "Problem97.ATailUniqueFourCompleteRadiusPlacementAuditScratch."
            "mem_blockerImageSelectedRow_of_twoStep_mutualTriangle"
        ),
        "existing_negative_consumer": (
            "Problem97.false_of_mutualClassPair_sharedMember_thirdClassExcludes"
        ),
        "records": records,
        "all_counterpatterns_rejected_by_complete_radius_triangle_closure": True,
        "two_completion_rows_same_center_adjudicated": False,
        "two_completion_rows_note": (
            "Each fixture exports only one selected row per center, so it cannot "
            "test a packet whose left and right completion arcs use distinct rows "
            "at one center"
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    current = generate()
    if args.check:
        recorded = json.loads(args.output.read_text())
        if recorded != current:
            raise SystemExit("FAIL: complete-radius placement checkpoint drift")
        print("PASS: both no-packing fixtures violate checked complete-radius closure")
        return
    atomic_write_json(args.output, current)
    print(
        json.dumps(
            {
                "profiles": [record["profile"] for record in current["records"]],
                "certificate_counts": {
                    str(record["profile"]): record["certificate_count"]
                    for record in current["records"]
                },
                "all_rejected": current[
                    "all_counterpatterns_rejected_by_complete_radius_triangle_closure"
                ],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
