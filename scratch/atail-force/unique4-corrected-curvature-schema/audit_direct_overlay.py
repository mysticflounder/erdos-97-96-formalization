#!/usr/bin/env python3
"""Audit direct-curvature SAT assignments against source cap-row bounds.

The direct overlay is maintained by another lane.  This script only reads its
published result JSON and records a small, hash-bound source-gap audit.  In
particular, it checks the two cap-order consequences that are already proved
in Lean:

* a selected row centered anywhere on a closed cap has at most two hits in
  that cap; and
* a selected row centered at either endpoint of that cap has at most one hit
  in that cap.

It also reports the singleton minimal-deletion surface when the decoded model
contains one.  That report is diagnostic only: it does not promote a finite
assignment to Euclidean source data.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path
from typing import Any


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(
        json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    temporary.replace(path)


def cap_endpoints(result: dict[str, Any]) -> dict[str, set[int]]:
    first_apex = int(result["first_apex"])
    second_apex = int(result["second_apex"])
    surplus_vertex = int(result["surplus_vertex"])
    return {
        "surplus": {first_apex, second_apex},
        "first_opposite": {second_apex, surplus_vertex},
        "second_opposite": {surplus_vertex, first_apex},
    }


def cap_row_audit(result: dict[str, Any]) -> dict[str, Any]:
    rows = {
        int(center): set(map(int, support))
        for center, support in result["decoded"]["rows"].items()
    }
    caps = {
        name: set(map(int, points))
        for name, points in result["closed_caps"].items()
    }
    endpoints = cap_endpoints(result)

    incidences = []
    interior_bound_violations = []
    endpoint_bound_violations = []
    for center, support in sorted(rows.items()):
        for cap_name, cap in sorted(caps.items()):
            if center not in cap:
                continue
            hits = sorted(support & cap)
            packet = {
                "center": center,
                "cap": cap_name,
                "center_is_endpoint": center in endpoints[cap_name],
                "row_support": sorted(support),
                "cap_hits": hits,
                "cap_hit_count": len(hits),
            }
            incidences.append(packet)
            if len(hits) > 2:
                interior_bound_violations.append(packet)
            if center in endpoints[cap_name] and len(hits) > 1:
                endpoint_bound_violations.append(packet)

    return {
        "incidences": incidences,
        "own_cap_two_hit_bound_violations": interior_bound_violations,
        "endpoint_one_hit_bound_violations": endpoint_bound_violations,
        "passes_own_cap_two_hit_bound": not interior_bound_violations,
        "passes_endpoint_one_hit_bound": not endpoint_bound_violations,
    }


def singleton_surface(result: dict[str, Any]) -> dict[str, Any] | None:
    decoded = result["decoded"]
    witness = decoded.get("strict_cap_minimality_witness")
    if witness is None or len(witness["deleted_set"]) != 1:
        return None

    center = int(witness["center"])
    source = int(witness["deleted_set"][0])
    rows = {
        int(c): set(map(int, support))
        for c, support in decoded["rows"].items()
    }
    blockers = {
        int(s): int(c) for s, c in decoded["blockers"].items()
    }
    critical_supports = {
        int(s): set(map(int, support))
        for s, support in decoded["critical_supports"].items()
    }
    classes = [
        set(map(int, radius_class))
        for radius_class in decoded["radius_classes"][str(center)]
    ]
    support = rows[center]
    containing_classes = [sorted(c) for c in classes if support <= c]
    caps = {
        name: set(map(int, points))
        for name, points in result["closed_caps"].items()
        if center in points
    }

    # Model the installed singleton system: the singleton source is assigned
    # the fresh center and its displayed exact row; every other source keeps
    # the decoded fixed-system assignment.
    installed_blockers = dict(blockers)
    installed_supports = dict(critical_supports)
    installed_blockers[source] = center
    installed_supports[source] = support

    cap_reports = []
    for cap_name, cap in sorted(caps.items()):
        outside = sorted(support - cap)
        repeats = []
        for a, b in itertools.combinations(outside, 2):
            for candidate_source in sorted(installed_blockers):
                candidate_center = installed_blockers[candidate_source]
                if (
                    candidate_center in cap
                    and candidate_center != center
                    and {a, b} <= installed_supports[candidate_source]
                ):
                    repeats.append(
                        {
                            "outside_pair": [a, b],
                            "source": candidate_source,
                            "actual_center": candidate_center,
                            "actual_support": sorted(
                                installed_supports[candidate_source]
                            ),
                        }
                    )
        cap_reports.append(
            {
                "cap": cap_name,
                "row_cap_hits": sorted(support & cap),
                "row_outside_points": outside,
                "installed_same_cap_actual_row_repeats": repeats,
            }
        )

    return {
        "center": center,
        "singleton_source": source,
        "selected_row": sorted(support),
        "complete_radius_classes_containing_selected_row": containing_classes,
        "cap_reports": cap_reports,
    }


def audit(path: Path) -> dict[str, Any]:
    result = read_json(path)
    if result.get("solver_status") != "SAT":
        raise AssertionError(f"expected SAT result: {path}")
    if result.get("semantic_replay_status") != "VERIFIED_SAT_NO_FOUR_ARC_TERMINAL":
        raise AssertionError(f"expected replayed no-terminal result: {path}")
    return {
        "result_path": str(path),
        "result_sha256": sha256(path),
        "cnf_sha256": result["cnf_sha256"],
        "direct_overlay_source_sha256": result["direct_overlay_source_sha256"],
        "opp1_card": result["opp1_card"],
        "semantic_replay_status": result["semantic_replay_status"],
        "cap_row_audit": cap_row_audit(result),
        "singleton_surface": singleton_surface(result),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("results", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    output = {
        "schema": "p97-unique4-direct-overlay-source-gap-audit-v1",
        "epistemic_status": "EXACT REPLAY OF FINITE SAT ASSIGNMENTS",
        "claim_scope": (
            "Checks decoded direct-overlay assignments against already-proved "
            "cap-row cardinality consequences; not a Euclidean realization audit."
        ),
        "source_theorems": {
            "own_cap_two_hit": (
                "Problem97.CapSelectedRowCounting."
                "selectedFourClass_inter_capByIndex_card_le_two"
            ),
            "endpoint_one_hit_v2": (
                "Problem97.SurplusCapPacket."
                "capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep"
            ),
            "endpoint_one_hit_v3": (
                "Problem97.SurplusCapPacket."
                "capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep"
            ),
        },
        "audits": [audit(path) for path in args.results],
    }
    normalized = json.loads(json.dumps(output, sort_keys=True))
    if args.check:
        if read_json(args.output) != normalized:
            raise AssertionError("stored direct-overlay audit is stale")
    else:
        write_json(args.output, normalized)


if __name__ == "__main__":
    main()
