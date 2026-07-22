#!/usr/bin/env python3
"""Exact countermodel to the bare boundary-ingress-to-M44 implication.

This is not a model of ``OriginalUniqueFourResidual``.  It checks only the
Euclidean/MEC/cap claim isolated in REPORT.md: a fourth MEC-boundary point in
the strict interior of a displayed cap does not by itself produce an
alternative nonobtuse ``(m,4,4)`` support triangle.
"""

from __future__ import annotations

import itertools
import json

import sympy as sp


SQRT3 = sp.sqrt(3)
INNER_RADIUS = sp.Rational(999, 1000)
BOUNDARY = frozenset({0, 1, 5, 9})
ORIGINAL = (0, 5, 9)
FRESH = 1


def unit_point(index: int) -> tuple[sp.Expr, sp.Expr]:
    """Point at ``index * 30 degrees`` on the unit circle."""

    table = (
        (1, 0),
        (SQRT3 / 2, sp.Rational(1, 2)),
        (sp.Rational(1, 2), SQRT3 / 2),
        (0, 1),
        (-sp.Rational(1, 2), SQRT3 / 2),
        (-SQRT3 / 2, sp.Rational(1, 2)),
        (-1, 0),
        (-SQRT3 / 2, -sp.Rational(1, 2)),
        (-sp.Rational(1, 2), -SQRT3 / 2),
        (0, -1),
        (sp.Rational(1, 2), -SQRT3 / 2),
        (SQRT3 / 2, -sp.Rational(1, 2)),
    )
    return table[index]


def scale(point: tuple[sp.Expr, sp.Expr], radius: sp.Expr) -> tuple[sp.Expr, sp.Expr]:
    return (sp.expand(radius * point[0]), sp.expand(radius * point[1]))


POINTS = tuple(
    unit_point(index)
    if index in BOUNDARY
    else scale(unit_point(index), INNER_RADIUS)
    for index in range(12)
)


def sub(
    first: tuple[sp.Expr, sp.Expr], second: tuple[sp.Expr, sp.Expr]
) -> tuple[sp.Expr, sp.Expr]:
    return (sp.expand(first[0] - second[0]), sp.expand(first[1] - second[1]))


def dot(first: tuple[sp.Expr, sp.Expr], second: tuple[sp.Expr, sp.Expr]) -> sp.Expr:
    return sp.expand(first[0] * second[0] + first[1] * second[1])


def cross(first: tuple[sp.Expr, sp.Expr], second: tuple[sp.Expr, sp.Expr]) -> sp.Expr:
    return sp.expand(first[0] * second[1] - first[1] * second[0])


def squared_norm(point: tuple[sp.Expr, sp.Expr]) -> sp.Expr:
    return dot(point, point)


def strictly_positive(value: sp.Expr) -> bool:
    sign = sp.sign(sp.simplify(value))
    assert sign in (-1, 0, 1), value
    return sign == 1


def cyclic_gap(first: int, second: int) -> int:
    return (second - first) % len(POINTS)


def cap_profile(triple: tuple[int, int, int]) -> tuple[int, int, int]:
    ordered = tuple(sorted(triple))
    gaps = (
        cyclic_gap(ordered[0], ordered[1]),
        cyclic_gap(ordered[1], ordered[2]),
        cyclic_gap(ordered[2], ordered[0]),
    )
    return tuple(gap + 1 for gap in gaps)


def nonobtuse(triple: tuple[int, int, int]) -> bool:
    points = [POINTS[index] for index in triple]
    for vertex in range(3):
        left = sub(points[(vertex + 1) % 3], points[vertex])
        right = sub(points[(vertex + 2) % 3], points[vertex])
        if not sp.simplify(dot(left, right)) >= 0:
            return False
    return True


def main() -> None:
    # Exact disk and boundary set.
    radii = tuple(sp.simplify(squared_norm(point)) for point in POINTS)
    assert all(radius <= 1 for radius in radii)
    assert frozenset(index for index, radius in enumerate(radii) if radius == 1) == BOUNDARY

    # The origin is the equal-weight convex combination of boundary points
    # 1, 5, 9.  Hence every enclosing disk has radius at least one, while the
    # unit disk encloses all points: it is the MEC.
    origin_sum = tuple(
        sp.simplify(sum(POINTS[index][coordinate] for index in (1, 5, 9)) / 3)
        for coordinate in range(2)
    )
    assert origin_sum == (0, 0)

    # Every oriented edge has every other point strictly on its left.  This is
    # the exact half-plane test for the displayed cyclic order to be a strictly
    # convex polygon.
    for index, first in enumerate(POINTS):
        second = POINTS[(index + 1) % len(POINTS)]
        edge = sub(second, first)
        for offset in range(2, len(POINTS)):
            point = POINTS[(index + offset) % len(POINTS)]
            assert strictly_positive(cross(edge, sub(point, first)))

    # The displayed support triple is nonobtuse and has profile (6,5,4).
    assert nonobtuse(ORIGINAL)
    assert cap_profile(ORIGINAL) == (6, 5, 4)
    # Index 1 is a fourth boundary point in the strict interior of the
    # six-point chain from index 0 to index 5.
    assert FRESH in BOUNDARY
    assert 0 < FRESH < 5

    boundary_triples = tuple(itertools.combinations(sorted(BOUNDARY), 3))
    profiles = {
        triple: cap_profile(triple)
        for triple in boundary_triples
        if nonobtuse(triple)
    }
    assert profiles == {
        (0, 5, 9): (6, 5, 4),
        (1, 5, 9): (5, 5, 5),
    }
    assert all(sorted(profile).count(4) < 2 for profile in profiles.values())

    print(
        json.dumps(
            {
                "status": "PASS_EXACT_BOUNDARY_INGRESS_NOT_M44",
                "epistemic_status": (
                    "EXACT_REAL_ALGEBRAIC_COUNTERMODEL_TO_BOUNDARY_INGRESS_ONLY;"
                    "NOT_COUNTEREXAMPLE_DATA"
                ),
                "carrier_card": len(POINTS),
                "mec_boundary_indices": sorted(BOUNDARY),
                "displayed_support_triangle": ORIGINAL,
                "displayed_cap_profile": cap_profile(ORIGINAL),
                "fresh_strict_cap_boundary_index": FRESH,
                "nonobtuse_boundary_triples_and_profiles": {
                    str(triple): profile for triple, profile in profiles.items()
                },
                "has_m44_support_triangle": False,
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
