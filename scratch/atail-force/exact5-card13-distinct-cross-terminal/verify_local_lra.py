#!/usr/bin/env python3
"""Independent exact verifier for ``local-lra.json``."""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path


VERTICES = tuple(range(13))
FIRST_APEX = 4
SECOND_APEX = 8
PHYSICAL = frozenset({1, 2, 3})
STRICT_FIRST = frozenset({9, 10, 11, 12})
PHYSICAL_CAP = frozenset({0, 1, 2, 3, 4})
SURPLUS_CAP = frozenset({4, 5, 6, 7, 8})
FIRST_CAP = frozenset({0, 8, 9, 10, 11, 12})


def edge(left: int, right: int) -> str:
    if left > right:
        left, right = right, left
    return f"{left}-{right}"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    args = parser.parse_args()
    payload = json.loads(args.input.read_text())
    if payload.get("status") != "SAT":
        raise ValueError("input is not a SAT witness")
    raw = payload["distances"]
    distances = {name: Fraction(value) for name, value in raw.items()}

    def d(left: int, right: int) -> Fraction:
        if left == right:
            return Fraction(0)
        return distances[edge(left, right)]

    assert len(distances) == 78
    assert all(value >= 1 for value in distances.values())
    minimum_triangle_slack: Fraction | None = None
    for a, b, c in itertools.combinations(VERTICES, 3):
        slacks = (
            d(a, b) + d(b, c) - d(a, c),
            d(a, c) + d(b, c) - d(a, b),
            d(a, b) + d(a, c) - d(b, c),
        )
        minimum_triangle_slack = min(
            *slacks,
            minimum_triangle_slack if minimum_triangle_slack is not None else slacks[0],
        )
        assert all(slack >= 1 for slack in slacks)
    minimum_kalmanson_slack: Fraction | None = None
    for a, b, c, d0 in itertools.combinations(VERTICES, 4):
        diagonal = d(a, c) + d(b, d0)
        slacks = (
            diagonal - d(a, b) - d(c, d0),
            diagonal - d(a, d0) - d(b, c),
        )
        minimum_kalmanson_slack = min(
            *slacks,
            minimum_kalmanson_slack
            if minimum_kalmanson_slack is not None else slacks[0],
        )
        assert all(slack >= 1 for slack in slacks)

    retained = frozenset(payload["retained"])
    double = frozenset(payload["double"])
    second = frozenset(payload["second"])
    outside = frozenset(payload["outside"])

    def row(center: int, support: frozenset[int]) -> None:
        reference = min(support)
        assert all(d(center, point) == d(center, reference) for point in support)

    def exact_row(center: int, support: frozenset[int]) -> None:
        row(center, support)
        radius = d(center, min(support))
        assert all(
            d(center, point) != radius
            for point in VERTICES
            if point != center and point not in support
        )

    exact_row(FIRST_APEX, retained)
    exact_row(FIRST_APEX, double)
    exact_row(SECOND_APEX, second)
    exact_row(2, frozenset({1, 3}) | outside)
    assert retained.isdisjoint(double)
    assert (retained | double) & STRICT_FIRST == STRICT_FIRST
    assert len(retained & STRICT_FIRST) == 2
    assert len(double & STRICT_FIRST) == 2
    assert len(retained & PHYSICAL) == 1
    assert len(double & PHYSICAL) == 1
    assert len(outside & retained) == 1
    assert len(outside & double) == 1
    assert len(retained & PHYSICAL_CAP) == 1
    assert len(retained & SURPLUS_CAP) == 1
    assert len(double & PHYSICAL_CAP) == 1
    assert len(double & SURPLUS_CAP) == 1
    assert PHYSICAL <= second
    assert len(second & (SURPLUS_CAP - {SECOND_APEX})) == 1
    assert len(second & (FIRST_CAP - {SECOND_APEX})) == 1
    q = int(payload["q"])
    w = int(payload["w"])
    parent_first = frozenset(payload["parent_first"])
    parent_second = frozenset(payload["parent_second"])
    assert q != w
    assert {q, w} <= retained
    assert q not in parent_first and q not in parent_second
    assert parent_first == double
    assert parent_second <= second
    assert len(parent_first) == 4 and len(parent_second) == 4
    assert len(parent_first & parent_second) <= 2
    assert len(second - {q, w}) >= 4
    retained_radius = d(FIRST_APEX, min(retained))
    double_radius = d(FIRST_APEX, min(double))
    if payload["orientation"] == "retained_lt_double":
        assert retained_radius + 1 <= double_radius
    else:
        assert double_radius + 1 <= retained_radius

    def large_radius_classes(center: int) -> list[frozenset[int]]:
        by_radius: dict[Fraction, set[int]] = {}
        for point in VERTICES:
            if point == center:
                continue
            by_radius.setdefault(d(center, point), set()).add(point)
        return [frozenset(points) for points in by_radius.values() if len(points) >= 4]

    assert set(large_radius_classes(FIRST_APEX)) == {retained, double}
    assert large_radius_classes(SECOND_APEX) == [second]
    assert large_radius_classes(2) == [frozenset({1, 3}) | outside]

    print(json.dumps({
        "status": "VERIFIED",
        "input": str(args.input),
        "distance_variables": len(distances),
        "minimum_triangle_slack": str(minimum_triangle_slack),
        "minimum_kalmanson_slack": str(minimum_kalmanson_slack),
        "retained_radius": str(retained_radius),
        "double_radius": str(double_radius),
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
