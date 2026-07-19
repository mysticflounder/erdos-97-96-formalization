#!/usr/bin/env python3
"""Exact rational replay of a period-three cycle-core target extension.

The verdict is external exact arithmetic, not a Lean kernel proof.  Every
metric equality and strict inequality used by the scoped countermodel is
checked with ``fractions.Fraction``.
"""

from __future__ import annotations

from fractions import Fraction as F


Point = tuple[F, F]


def add(a: Point, b: Point) -> Point:
    return (a[0] + b[0], a[1] + b[1])


def sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def scale(s: F, a: Point) -> Point:
    return (s * a[0], s * a[1])


def unit_point(t: F) -> Point:
    denominator = 1 + t * t
    return ((1 - t * t) / denominator, 2 * t / denominator)


def rotate_rational(a: Point, t: F) -> Point:
    denominator = 1 + t * t
    cosine = (1 - t * t) / denominator
    sine = 2 * t / denominator
    return (cosine * a[0] - sine * a[1], sine * a[0] + cosine * a[1])


def cross(a: Point, b: Point, c: Point) -> F:
    u = sub(b, a)
    v = sub(c, a)
    return u[0] * v[1] - u[1] * v[0]


def sqdist(a: Point, b: Point) -> F:
    d = sub(a, b)
    return d[0] * d[0] + d[1] * d[1]


def main() -> None:
    o: Point = (F(0), F(0))
    left = unit_point(F(0))
    right = unit_point(F(163, 192))
    q0 = unit_point(F(4, 231))
    q1 = unit_point(F(123, 184))
    q2 = unit_point(F(3, 4))

    # Each blocker is on the perpendicular-bisector ray of its source pair.
    # The rational multipliers were discovered numerically and then rounded
    # inward; every property below is rechecked exactly.
    c0 = scale(F(45, 86), add(q0, q1))
    c1 = scale(F(251, 500), add(q1, q2))
    c2 = scale(F(271, 500), add(q2, q0))

    # One target on c0's exact source-radius circle.
    target = add(c0, rotate_rational(sub(q0, c0), F(-47, 149)))

    boundary = [o, target, left, q0, c0, c2, q1, c1, q2, right]
    names = ["o", "target", "left", "q0", "c0", "c2", "q1", "c1", "q2", "right"]

    # Strong exact convexity certificate: every non-edge vertex is strictly
    # left of every displayed counterclockwise boundary edge.
    hull_margins: list[F] = []
    for i, a in enumerate(boundary):
        b = boundary[(i + 1) % len(boundary)]
        for j, point in enumerate(boundary):
            if j in (i, (i + 1) % len(boundary)):
                continue
            margin = cross(a, b, point)
            assert margin > 0, (
                names[i],
                names[(i + 1) % len(boundary)],
                names[j],
                margin,
            )
            hull_margins.append(margin)

    # The physical-apex radius class on this named carrier has exactly five
    # members: the two cap endpoints and three cycle sources.
    physical_class = [left, q0, q1, q2, right]
    assert all(sqdist(o, point) == 1 for point in physical_class)
    assert all(sqdist(o, point) != 1 for point in [target, c0, c1, c2])

    # Exact directed period-three bisector cycle.
    row0_radius_sq = sqdist(c0, q0)
    row1_radius_sq = sqdist(c1, q1)
    row2_radius_sq = sqdist(c2, q2)
    assert sqdist(c0, q1) == row0_radius_sq
    assert sqdist(c1, q2) == row1_radius_sq
    assert sqdist(c2, q0) == row2_radius_sq

    # The retained outside target lies on row 0's exact blocker circle.
    assert sqdist(c0, target) == row0_radius_sq

    # No other named physical-cap vertex accidentally joins any blocker
    # radius class.  Thus each retained cap intersection is exactly its named
    # source pair on this carrier.
    cap_points = [left, q0, c0, c2, q1, c1, q2, right]
    for center, radius_sq, support in (
        (c0, row0_radius_sq, {q0, q1}),
        (c1, row1_radius_sq, {q1, q2}),
        (c2, row2_radius_sq, {q2, q0}),
    ):
        for point in cap_points:
            if point in support:
                assert sqdist(center, point) == radius_sq
            else:
                assert sqdist(center, point) != radius_sq

    # The displayed cap order makes each blocker straddle its two sources:
    # c0 lies between q0,q1; c1 between q1,q2; c2 between q0,q2.
    cap_order = [left, q0, c0, c2, q1, c1, q2, right]
    positions = {point: i for i, point in enumerate(cap_order)}
    assert positions[q0] < positions[c0] < positions[q1]
    assert positions[q1] < positions[c1] < positions[q2]
    assert positions[q0] < positions[c2] < positions[q2]

    # The blockers and sources are on the physical-cap side of the endpoint
    # chord.  The apex and target are strictly on the complementary side.
    assert cross(left, right, o) > 0
    assert cross(left, right, target) > 0
    assert all(cross(left, right, point) < 0 for point in cap_order[1:-1])

    # Exact circumdisk of (o,left,right).  Since o=(0,0), left=(1,0),
    # its center is (1/2, (1-right.x)/(2*right.y)).
    mec_center: Point = (F(1, 2), (1 - right[0]) / (2 * right[1]))
    mec_radius_sq = sqdist(mec_center, o)
    assert sqdist(mec_center, left) == mec_radius_sq
    assert sqdist(mec_center, right) == mec_radius_sq
    disk_margins = [mec_radius_sq - sqdist(mec_center, point) for point in boundary]
    assert all(margin >= 0 for margin in disk_margins)

    # The physical Moser triangle is nonobtuse by all three squared-side
    # inequalities.
    ol = sqdist(o, left)
    ore = sqdist(o, right)
    lr = sqdist(left, right)
    assert lr <= ol + ore
    assert ore <= lr + ol
    assert ol <= ore + lr

    print("PASS: exact rational period-three cycle-core target extension")
    print("boundary=o,target,left,q0,c0,c2,q1,c1,q2,right")
    print("physical_class_card=5")
    print(f"min_strict_hull_margin={min(hull_margins)}")
    print(f"target_outside_cap_margin={cross(left, right, target)}")
    print(f"target_mec_disk_margin={mec_radius_sq - sqdist(mec_center, target)}")
    print(f"c1_multiplier={F(251, 500)}")
    print(f"c2_multiplier={F(271, 500)}")
    print(f"row0_radius_sq={row0_radius_sq}")


if __name__ == "__main__":
    main()
