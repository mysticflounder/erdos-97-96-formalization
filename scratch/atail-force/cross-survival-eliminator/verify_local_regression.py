#!/usr/bin/env python3
"""Exact local regression for one q-deleted continuation row.

The calculation deliberately models only the local convex/circle/cap-order
interface stated in REPORT.md.  It is not a CounterexampleData instance.
"""

from __future__ import annotations

from fractions import Fraction

Point = tuple[Fraction, Fraction]


def point(x: int, y: int) -> Point:
    return Fraction(x), Fraction(y)


def sub(a: Point, b: Point) -> Point:
    return a[0] - b[0], a[1] - b[1]


def cross(a: Point, b: Point, c: Point) -> Fraction:
    ab = sub(b, a)
    ac = sub(c, a)
    return ab[0] * ac[1] - ab[1] * ac[0]


def dist_sq(a: Point, b: Point) -> Fraction:
    d = sub(a, b)
    return d[0] * d[0] + d[1] * d[1]


def strict_convex_ccw(vertices: tuple[Point, ...]) -> bool:
    if len(set(vertices)) != len(vertices):
        return False
    n = len(vertices)
    return all(cross(vertices[i], vertices[(i + 1) % n], vertices[(i + 2) % n]) > 0
               for i in range(n))


def check() -> dict[str, object]:
    z1 = point(0, 0)
    z2 = point(65, 0)
    cap_end = point(63, 16)
    outside_a = point(60, 25)
    outside_b = point(52, 39)
    first_apex = point(16, 63)

    # Exact cyclic hull order.  The ordered cap wraps from first_apex through
    # z1,z2 to cap_end; z1 and z2 are its two strict interior positions.
    hull = (z1, z2, cap_end, outside_a, outside_b, first_apex)
    ordered_cap = (first_apex, z1, z2, cap_end)

    # Four points at radius 65 from z1 survive deletion of z2.
    survivor_support = (cap_end, outside_a, outside_b, first_apex)
    radius_sq = Fraction(65 * 65)

    assert strict_convex_ccw(hull)
    assert len(set(survivor_support)) == 4
    assert z1 not in survivor_support
    assert z2 not in survivor_support
    assert all(dist_sq(z1, x) == radius_sq for x in survivor_support)
    assert ordered_cap[1] == z1 and ordered_cap[2] == z2

    outside_support = tuple(x for x in survivor_support if x not in ordered_cap)
    assert outside_support == (outside_a, outside_b)

    first_apex_radii = tuple(dist_sq(first_apex, x) for x in outside_support)
    assert first_apex_radii == (Fraction(3380), Fraction(1872))
    assert len(set(first_apex_radii)) == len(first_apex_radii)

    return {
        "strict_convex_vertices": len(hull),
        "survivor_support_card": len(survivor_support),
        "survivor_radius_squared": int(radius_sq),
        "deleted_point_absent": z2 not in survivor_support,
        "outside_cap_support_card": len(outside_support),
        "outside_first_apex_radii_squared": [int(x) for x in first_apex_radii],
        "repeated_first_apex_radius": len(set(first_apex_radii)) != len(first_apex_radii),
    }


if __name__ == "__main__":
    result = check()
    for key, value in result.items():
        print(f"{key}: {value}")
