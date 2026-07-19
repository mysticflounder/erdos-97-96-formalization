#!/usr/bin/env python3
"""Uniform local cores for the dead merge types.

The merge census kills every e~p and p~p2 identification (and the p0~p1
double), but Z3's minimized cores often mention stray fresh points via
conditional Kalmanson implications, so they do not transfer verbatim to
multi-merge patterns.  This script certifies, per dead single-merge TYPE
and bag, a UNIFORM LOCAL core: a mini-schema containing ONLY the named
system plus the single fused point (no other fresh roles) is UNSAT.

Containment argument closed by this certificate: in any multi-merge
pattern containing a dead pair, the mini-schema's constraints map, under
the pattern's renaming, into constraints the full schema also asserts —
class memberships only grow under further fusion, the core's Kalmanson
quadruples contain at most one bag point (the fused point itself), hence
are static or conditional only on that point's own block range, and named
points are never fusable.  The p0~p1 double needs no argument (all 200
enumerated and UNSAT censally).

Expected: all 10 mini-schemas UNSAT with cores touching only the fused
point and named points.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from gate_encoder import check_schema  # noqa: E402

CAP_INTERIOR = ["s0", "b0", "s1", "b1", "s2"]
NAMED = {"EA", "W", "O", "s0", "b0", "s1", "b1", "s2"}

ROW_MEMBERS = {"b0": ["s0", "s1"], "b1": ["s1", "s2"], "s1": ["s2", "s0"]}

DEAD_TYPES = {
    "e-p0": ("O", "b0"),
    "e-p1": ("O", "b1"),
    "e-p2": ("O", "s1"),
    "p0-p2": ("b0", "s1"),
    "p1-p2": ("b1", "s1"),
}


def mini_schema(kind: str, bag: str) -> dict:
    first, second = DEAD_TYPES[kind]
    fused = "m"
    points = ["EA", "O", "W"] + CAP_INTERIOR + [fused]
    blocks = [
        {"points": ["EA"], "ordered": True},
        {"points": [fused] if bag == "S" else [], "ordered": False},
        {"points": ["O"], "ordered": True},
        {"points": [fused] if bag == "O1" else [], "ordered": False},
        {"points": ["W"], "ordered": True},
        {"points": CAP_INTERIOR, "ordered": True},
    ]
    point_set = set(points)

    def members_of(center: str) -> list[str]:
        if center == "O":
            return ["s0", "s1", "s2", fused]
        return ROW_MEMBERS[center] + [fused]

    exact_classes = []
    for center in (first, second):
        members = members_of(center)
        exact_classes.append(
            {
                "center": center,
                "members": members,
                "exclude": sorted(point_set - {center} - set(members)),
            }
        )

    return {
        "id": f"local.{kind}.{bag}",
        "points": points,
        "blocks": blocks,
        "exact_classes": exact_classes,
        "timeout_ms": 120_000,
    }


def main() -> None:
    results = {}
    failures = []
    for kind in DEAD_TYPES:
        for bag in ("S", "O1"):
            verdict = check_schema(mini_schema(kind, bag))
            results[verdict["schema_id"]] = verdict
            ok = verdict["verdict"] == "unsat"
            core_points: set[str] = set()
            if ok:
                for label in verdict["core"]:
                    parts = label.split("|")
                    if parts[0] in ("cls_eq", "cls_ne"):
                        core_points.add(parts[1])
                        core_points.update(parts[2].split(","))
                    elif parts[0] == "kal":
                        core_points.update(parts[1].split(","))
                    elif parts[0] == "pos":
                        core_points.update(parts[2].split(","))
                stray = core_points - NAMED - {"m"}
                ok = not stray
            status = "PASS" if ok else "FAIL"
            if not ok:
                failures.append(verdict["schema_id"])
            print(
                f"{status} {verdict['schema_id']}: {verdict['verdict']}"
                + (
                    f" core_size={verdict['core_size']}"
                    f" families={verdict['families']} core={verdict['core']}"
                    if verdict["verdict"] == "unsat"
                    else ""
                )
            )
    (HERE / "dead_type_local_cores.json").write_text(json.dumps(results, indent=1))
    print(f"output={HERE / 'dead_type_local_cores.json'}")
    if failures:
        raise SystemExit(f"failures: {failures}")
    print("ALL DEAD-TYPE LOCAL CORES CERTIFIED")


if __name__ == "__main__":
    main()
