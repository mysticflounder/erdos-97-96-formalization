#!/usr/bin/env python3
"""Exact checks for the descent-history ambient-lift obstruction.

The first block is an exact Euclidean radius-class example, computed with
integer coordinates and squared distances.  The second block is deliberately
weaker: it is an exact finite model of the *exported critical-row incidence
interface* (source in an exact four-row, deletion kills that row, and blocker
centers in the carrier).  It is not claimed to realize those rows by Euclidean
circles or to instantiate CounterexampleData.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter


Point = tuple[int, int]


def squared_distance(p: Point, q: Point) -> int:
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def radius_classes(points: set[Point], center: Point) -> dict[int, set[Point]]:
    result: dict[int, set[Point]] = {}
    for point in points:
        result.setdefault(squared_distance(center, point), set()).add(point)
    return result


def euclidean_history_check() -> dict[str, object]:
    center = (0, 0)
    radius_r = {(5, 0), (-5, 0), (0, 5), (0, -5), (3, 4), (-3, 4)}
    radius_s = {(2, 3), (-2, 3), (2, -3), (-2, -3)}

    # Extra points give the abstract row model enough labels.  Their radii are
    # all distinct, so none creates another K4 class about `center`.
    fillers = {(0, 0)} | {(n, 1) for n in range(10, 24)}
    ambient = radius_r | radius_s | fillers

    first_pair = ((2, 3), (-2, 3))
    second_pair = ((5, 0), (-5, 0))
    after_first = ambient - set(first_pair)
    terminal = after_first - set(second_pair)
    history = ambient - terminal

    ambient_classes = radius_classes(ambient, center)
    after_first_classes = radius_classes(after_first, center)
    terminal_classes = radius_classes(terminal, center)

    assert squared_distance(center, first_pair[0]) == 13
    assert squared_distance(center, first_pair[1]) == 13
    assert squared_distance(center, second_pair[0]) == 25
    assert squared_distance(center, second_pair[1]) == 25
    assert len(ambient_classes[13]) == 4
    assert len(ambient_classes[25]) == 6
    assert len(after_first_classes[13]) == 2
    assert len(after_first_classes[25]) == 6
    assert len(terminal_classes[13]) == 2
    assert len(terminal_classes[25]) == 4

    terminal_k4_radii = {
        radius for radius, points in terminal_classes.items()
        if radius > 0 and len(points) >= 4
    }
    ambient_k4_radii = {
        radius for radius, points in ambient_classes.items()
        if radius > 0 and len(points) >= 4
    }
    assert terminal_k4_radii == {25}
    assert {13, 25} <= ambient_k4_radii

    # Both possible ambient-lift conclusions fail.
    assert ambient_classes[25] != terminal_classes[25]
    assert ambient_k4_radii != terminal_k4_radii

    # The replacement invariant is exact in this example.
    assert ambient_classes[13] & history == set(first_pair)
    assert ambient_classes[25] & history == set(second_pair)

    return {
        "ambient_size": len(ambient),
        "terminal_size": len(terminal),
        "ambient_k4_squared_radii": sorted(ambient_k4_radii),
        "terminal_k4_squared_radii": sorted(terminal_k4_radii),
        "terminal_radius_ambient_card": len(ambient_classes[25]),
        "terminal_radius_terminal_card": len(terminal_classes[25]),
        "alternate_radius_erased_pair_card": len(ambient_classes[13] & history),
    }


def critical_row_interface_check() -> dict[str, object]:
    """Check that diagonal exact rows alone need not create cross incidence."""

    r_points = [f"R{i}" for i in range(6)]
    s_points = [f"S{i}" for i in range(4)]
    fillers = [f"F{i}" for i in range(14)]
    carrier = set(r_points + s_points + fillers)

    groups = [
        {"R0", "S0", "F0", "F1"},
        {"R1", "S1", "F2", "F3"},
        {"R2", "S2", "F4", "F5"},
        {"R3", "S3", "F6", "F7"},
        {"R4", "F8", "F9", "F10"},
        {"R5", "F11", "F12", "F13"},
    ]
    assert set().union(*groups) == carrier
    assert sum(map(len, groups)) == len(carrier)

    group_of = {
        source: index for index, group in enumerate(groups) for source in group
    }
    centers = ["F2", "F4", "F6", "F8", "F11", "F0"]
    rows = {source: groups[group_of[source]] for source in carrier}
    center_at = {source: centers[group_of[source]] for source in carrier}

    # Exact diagonal critical-row interface.
    assert all(len(rows[source]) == 4 for source in carrier)
    assert all(source in rows[source] for source in carrier)
    assert all(center_at[source] in carrier for source in carrier)
    assert all(center_at[source] not in rows[source] for source in carrier)
    assert all(len(rows[source] - {source}) == 3 for source in carrier)

    retained_pairs = [("S0", "S1"), ("R0", "R1"), ("R2", "R3")]
    for q, w in retained_pairs:
        assert w not in rows[q]
        assert q not in rows[w]
        assert len(rows[q] & rows[w]) == 0

    # Rows at distinct abstract blocker centers share no pair at all.
    distinct_center_intersections = []
    for q in carrier:
        for w in carrier:
            if q < w and center_at[q] != center_at[w]:
                distinct_center_intersections.append(len(rows[q] & rows[w]))
    assert max(distinct_center_intersections, default=0) == 0

    center_multiplicities = Counter(center_at.values())
    return {
        "carrier_size": len(carrier),
        "row_count": len(rows),
        "row_cardinalities": sorted({len(row) for row in rows.values()}),
        "blocker_center_count": len(center_multiplicities),
        "max_distinct_center_row_intersection": max(
            distinct_center_intersections, default=0
        ),
        "tested_pairs_have_cross_incidence": False,
        "scope": "finite critical-row incidence interface only",
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check", action="store_true", help="run assertions and emit the certificate"
    )
    args = parser.parse_args()
    if not args.check:
        parser.error("pass --check")
    result = {
        "euclidean_radius_history": euclidean_history_check(),
        "critical_row_interface": critical_row_interface_check(),
        "rigor": {
            "euclidean_radius_history": "exact",
            "critical_row_interface": "exact within the stated abstraction",
            "full_counterexample_data": False,
        },
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
