#!/usr/bin/env python3
"""Exact rational local models of both alternating incidence arms.

This is intentionally a local metric model: it checks four exact selected
rows, each directed hit/omission pattern, and deletion-criticality of those
four rows.  It records, but does not assume, the convex-hull count.  In
particular, it does not claim convex independence, full CounterexampleData,
global K4 at every added point, an MEC cap packet, or a total
CriticalShellSystem.
"""

from __future__ import annotations

from collections import Counter
from fractions import Fraction
from itertools import combinations
import json

Point = tuple[Fraction, Fraction]


def point(x: int, y: int) -> Point:
    return Fraction(x), Fraction(y)


def add(p: Point, q: Point) -> Point:
    return p[0] + q[0], p[1] + q[1]


def sub(p: Point, q: Point) -> Point:
    return p[0] - q[0], p[1] - q[1]


def rotate(v: Point, t: Fraction) -> Point:
    """Rational rotation with tan(theta / 2) = t."""
    den = 1 + t * t
    cos = (1 - t * t) / den
    sin = 2 * t / den
    return cos * v[0] - sin * v[1], sin * v[0] + cos * v[1]


def sqdist(p: Point, q: Point) -> Fraction:
    dx, dy = sub(p, q)
    return dx * dx + dy * dy


def cross(o: Point, a: Point, b: Point) -> Fraction:
    ax, ay = sub(a, o)
    bx, by = sub(b, o)
    return ax * by - ay * bx


def strict_hull(points: list[Point]) -> list[Point]:
    ordered = sorted(set(points))
    lower: list[Point] = []
    for p in ordered:
        while len(lower) >= 2 and cross(lower[-2], lower[-1], p) <= 0:
            lower.pop()
        lower.append(p)
    upper: list[Point] = []
    for p in reversed(ordered):
        while len(upper) >= 2 and cross(upper[-2], upper[-1], p) <= 0:
            upper.pop()
        upper.append(p)
    return lower[:-1] + upper[:-1]


def encode_fraction(value: Fraction) -> str:
    return str(value.numerator) if value.denominator == 1 else f"{value.numerator}/{value.denominator}"


def encode_point(value: Point) -> tuple[str, str]:
    return encode_fraction(value[0]), encode_fraction(value[1])


def build_model(
    name: str,
    main_points: dict[str, Point],
    directed_edges: tuple[tuple[str, str], ...],
    opposite_omission: dict[str, str],
    expected_distinct_radii: int,
) -> dict[str, object]:
    parameters = (Fraction(1, 100), Fraction(1, 50), Fraction(3, 100))

    all_points = dict(main_points)
    supports: dict[str, tuple[str, ...]] = {}
    for source, center in directed_edges:
        vector = sub(main_points[source], main_points[center])
        labels = [source]
        for index, parameter in enumerate(parameters, start=1):
            label = f"{center}_sat_{index}"
            all_points[label] = add(main_points[center], rotate(vector, parameter))
            labels.append(label)
        supports[center] = tuple(labels)

    coordinates = list(all_points.values())
    assert len(set(coordinates)) == len(coordinates)
    hull = strict_hull(coordinates)
    hull_labels = [
        next(label for label, value in all_points.items() if value == vertex)
        for vertex in hull
    ]

    source_at_center = {center: source for source, center in directed_edges}
    exact_rows: dict[str, dict[str, object]] = {}
    for center, support in supports.items():
        center_point = all_points[center]
        source = source_at_center[center]
        radius_sq = sqdist(center_point, all_points[source])
        assert radius_sq > 0
        assert all(sqdist(center_point, all_points[label]) == radius_sq for label in support)
        assert opposite_omission[center] not in support

        full_class = tuple(
            label for label, value in all_points.items()
            if label != center and sqdist(center_point, value) == radius_sq
        )
        assert set(full_class) == set(support), (center, full_class, support)

        after_deletion = {
            label: value for label, value in all_points.items() if label != source
        }
        multiplicities = Counter(
            sqdist(center_point, value)
            for label, value in after_deletion.items()
            if label != center
        )
        assert max(multiplicities.values(), default=0) <= 3, (center, multiplicities)
        exact_rows[center] = {
            "source": source,
            "omitted_opposite": opposite_omission[center],
            "radius_squared": encode_fraction(radius_sq),
            "support": support,
            "max_class_after_source_deletion": max(multiplicities.values(), default=0),
        }

    distinct_radii = {sqdist(all_points[center], all_points[source])
                      for source, center in directed_edges}
    assert len(distinct_radii) == expected_distinct_radii

    equilateral_triples = []
    for left, middle, right in combinations(all_points, 3):
        radius_sq = sqdist(all_points[left], all_points[middle])
        if radius_sq > 0 and radius_sq == sqdist(
            all_points[middle], all_points[right]
        ) == sqdist(all_points[right], all_points[left]):
            equilateral_triples.append((left, middle, right))
    assert not equilateral_triples

    support_intersections = {
        f"{left}/{right}": len(set(supports[left]) & set(supports[right]))
        for left, right in combinations(sorted(supports), 2)
    }
    assert max(support_intersections.values(), default=0) < 2

    return {
        "name": name,
        "point_count": len(all_points),
        "strict_hull_count": len(hull),
        "convex_independent": len(hull) == len(coordinates),
        "hull_order": hull_labels,
        "main_points": {
            label: encode_point(value) for label, value in main_points.items()
        },
        "rows": exact_rows,
        "distinct_directed_edge_radius_count": len(distinct_radii),
        "equilateral_triple_count": len(equilateral_triples),
        "row_support_pair_intersection_cardinalities": support_intersections,
    }


def main() -> None:
    main_points: dict[str, Point] = {
        "a": point(0, 0),
        "c": point(12, 0),
        "b": point(12, 8),
        "d": point(0, 10),
    }
    cyclic = build_model(
        "genuine_directed_four_cycle",
        main_points,
        (("a", "c"), ("c", "b"), ("b", "d"), ("d", "a")),
        {"c": "b", "d": "a", "a": "c", "b": "d"},
        expected_distinct_radii=4,
    )
    reciprocal = build_model(
        "two_reciprocal_pairs",
        main_points,
        (("a", "c"), ("c", "a"), ("b", "d"), ("d", "b")),
        {"c": "b", "d": "a", "a": "d", "b": "c"},
        expected_distinct_radii=2,
    )

    print(
        json.dumps(
            {
                "status": "EXACT_RATIONAL_LOCAL_METRIC_MODEL",
                "models": [cyclic, reciprocal],
                "scope_exclusions": [
                    "not convex independent",
                    "not a CounterexampleData",
                    "no global K4 assertion at the twelve satellite points",
                    "no MEC or cap-packet assertion",
                    "no total CriticalShellSystem assertion",
                ],
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
