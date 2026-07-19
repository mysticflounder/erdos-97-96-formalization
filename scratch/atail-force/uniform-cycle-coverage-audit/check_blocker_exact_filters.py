#!/usr/bin/env python3
"""Replay full exact-radius filtering at every represented blocker center."""

from __future__ import annotations

import argparse
import json
from fractions import Fraction
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("full_lra", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    payload = json.loads(args.full_lra.read_text(encoding="utf-8"))
    if payload.get("status") != "SAT_VERIFIED_FULL_KALMANSON_METRIC":
        raise ValueError("input is not a verified full-metric SAT payload")
    n = int(payload["n"])
    rows = {int(center): set(support) for center, support in payload["rows"].items()}
    blockers = {int(source): int(center) for source, center in payload["blockers"].items()}
    distances = {
        tuple(int(value) for value in edge.split(",")): Fraction(distance)
        for edge, distance in payload["distances"].items()
    }

    def dist(left: int, right: int) -> Fraction:
        if left == right:
            return Fraction(0)
        return distances[tuple(sorted((left, right)))]

    checks = []
    all_exact = True
    for source, center in sorted(blockers.items()):
        support = rows[center]
        radii = {dist(center, point) for point in support}
        if len(radii) != 1:
            raise ValueError(f"row {center} is not equidistant")
        radius = next(iter(radii))
        full_filter = {point for point in range(n) if dist(center, point) == radius}
        exact = full_filter == support
        all_exact = all_exact and exact
        checks.append(
            {
                "source": source,
                "blocker_center": center,
                "radius": str(radius),
                "selected_support": sorted(support),
                "full_exact_radius_filter": sorted(full_filter),
                "exact": exact,
            }
        )

    output = {
        "schema": "p97-blocker-exact-radius-filter-replay-v1",
        "epistemic_status": "EXACT_RATIONAL_SUBSTITUTION_CHECK",
        "source": str(args.full_lra),
        "n": n,
        "source_count": len(blockers),
        "distinct_blocker_center_count": len(set(blockers.values())),
        "all_blocker_rows_exact": all_exact,
        "checks": checks,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({key: output[key] for key in (
        "n", "source_count", "distinct_blocker_center_count", "all_blocker_rows_exact"
    )}, sort_keys=True))
    return 0 if all_exact else 1


if __name__ == "__main__":
    raise SystemExit(main())
