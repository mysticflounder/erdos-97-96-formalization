#!/usr/bin/env python3
"""Exact replay for the partial fixed-cell seed and complete-row mismatch.

This checker uses only ``fractions.Fraction``.  It verifies the rational
geometry imported into ``SEED.json``; it does not claim that the unmapped
fixed roles can be added while retaining the live equations.
"""

from __future__ import annotations

from fractions import Fraction as F
import json
from pathlib import Path


Point = tuple[F, F]


def point(raw: list[str]) -> Point:
    return F(raw[0]), F(raw[1])


def cross(a: Point, b: Point, c: Point) -> F:
    return ((b[0] - a[0]) * (c[1] - a[1])
            - (b[1] - a[1]) * (c[0] - a[0]))


def sqdist(a: Point, b: Point) -> F:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def strict_hull_margins(boundary: list[Point]) -> list[F]:
    margins: list[F] = []
    for i, a in enumerate(boundary):
        b = boundary[(i + 1) % len(boundary)]
        for j, p in enumerate(boundary):
            if j not in (i, (i + 1) % len(boundary)):
                margins.append(cross(a, b, p))
    assert margins and min(margins) > 0
    return margins


def main() -> None:
    payload = json.loads(Path(__file__).with_name("SEED.json").read_text())
    roles = {
        name: point(record["xy"])
        for name, record in payload["mapped_roles"].items()
    }
    mapped_names = payload["mapped_boundary_cycle_starting_at_second"]
    mapped = [roles[name] for name in mapped_names]
    margins = strict_hull_margins(mapped)

    positions = payload["fixed_boundary_positions"]
    relative_positions = [
        (positions[name] - positions["second"]) % 25 for name in mapped_names
    ]
    assert relative_positions == sorted(relative_positions)

    physical = [roles[name] for name in ("nI", "c0", "c1", "c2", "nS")]
    assert all(sqdist(roles["second"], p) == 1 for p in physical)
    assert all(
        sqdist(roles["second"], roles[name]) != 1
        for name in ("b0", "b1", "b2")
    )

    row_data = (
        ("b0", "c0", "c1"),
        ("b1", "c1", "c2"),
        ("b2", "c2", "c0"),
    )
    row_radii: list[F] = []
    for center, first, second in row_data:
        radius = sqdist(roles[center], roles[first])
        assert sqdist(roles[center], roles[second]) == radius
        row_radii.append(radius)

    complete = payload["unmapped_complete_reverse0_targets"]
    source_x = point(complete["targets"]["source_x"]["xy"])
    source_y = point(complete["targets"]["source_y"]["xy"])
    assert sqdist(roles["b0"], source_x) == row_radii[0]
    assert sqdist(roles["b0"], source_y) == row_radii[0]

    full_names = [
        "second", "source_x", "source_y", "nI", "c0", "b0", "b2",
        "c1", "b1", "c2", "nS",
    ]
    full_points = {
        **roles,
        "source_x": source_x,
        "source_y": source_y,
    }
    full_margins = strict_hull_margins([full_points[name] for name in full_names])

    # The complete row cannot map to the fixed fully-disjoint word: both
    # exact targets precede nI, while every fixed target slot follows nI.
    assert full_names.index("source_x") < full_names.index("nI")
    assert full_names.index("source_y") < full_names.index("nI")
    assert all(
        positions[name] > positions["nI"]
        for name in ("x0", "y0", "x1", "y1", "x2", "y2")
    )

    disk_center = point(payload["exact_margins"]["auxiliary_disk_center"])
    disk_radius_sq = F(payload["exact_margins"]["auxiliary_disk_radius_sq"])
    assert all(disk_radius_sq - sqdist(disk_center, p) >= 0
               for p in full_points.values())

    print("PASS: exact rational partial seed and complete-row order audit")
    print(f"mapped_roles={len(roles)}")
    print(f"mapped_min_hull_margin={min(margins)}")
    print(f"complete_row_min_hull_margin={min(full_margins)}")
    print("complete_row_fixed_word_mapping=ORDER_INCOMPATIBLE")


if __name__ == "__main__":
    main()
