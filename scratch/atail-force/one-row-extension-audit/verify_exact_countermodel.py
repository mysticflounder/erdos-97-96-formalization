#!/usr/bin/env python3
"""Exact rational replay of a normalized one-row extension countermodel."""

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
    left: Point = (F(1), F(0))
    right = unit_point(F(163, 192))
    q = unit_point(F(4, 231))
    q_prime = unit_point(F(123, 184))
    third_source = unit_point(F(3, 4))

    center = scale(F(45, 86), add(q, q_prime))
    target = add(center, rotate_rational(sub(q, center), F(-47, 149)))

    boundary = [o, target, left, q, center, q_prime, third_source, right]
    names = [
        "o",
        "target",
        "left",
        "q",
        "center",
        "q_prime",
        "third_source",
        "right",
    ]

    # Strong exact convexity certificate: every non-edge vertex is strictly
    # left of every displayed CCW boundary edge.
    edge_margins: list[F] = []
    for i, a in enumerate(boundary):
        b = boundary[(i + 1) % len(boundary)]
        for j, p in enumerate(boundary):
            if j in (i, (i + 1) % len(boundary)):
                continue
            margin = cross(a, b, p)
            assert margin > 0, (names[i], names[(i + 1) % len(boundary)], names[j], margin)
            edge_margins.append(margin)

    # The physical apex class is exactly the five named unit-circle points.
    physical_class = [left, q, q_prime, third_source, right]
    assert all(sqdist(o, p) == 1 for p in physical_class)
    assert sqdist(o, center) != 1
    assert sqdist(o, target) != 1

    # The blocker circle contains the same-cap pair and the outside target.
    row_radius_sq = sqdist(center, q)
    assert sqdist(center, q_prime) == row_radius_sq
    assert sqdist(center, target) == row_radius_sq

    # The center lies in the physical cap between q and q_prime, while the
    # target lies on the complementary side of the endpoint chord.
    apex_side = cross(left, right, o)
    assert apex_side > 0
    assert cross(left, right, q) < 0
    assert cross(left, right, center) < 0
    assert cross(left, right, q_prime) < 0
    assert cross(left, right, third_source) < 0
    assert cross(left, right, target) > 0

    # Exact circumdisk of (o,left,right).  Since o=(0,0), left=(1,0),
    # its center is (1/2, (1-right.x)/(2*right.y)).
    mec_center: Point = (F(1, 2), (1 - right[0]) / (2 * right[1]))
    mec_radius_sq = sqdist(mec_center, o)
    assert sqdist(mec_center, left) == mec_radius_sq
    assert sqdist(mec_center, right) == mec_radius_sq
    assert all(sqdist(mec_center, p) <= mec_radius_sq for p in boundary)

    # The Moser triangle is nonobtuse (three squared-side inequalities).
    ol = sqdist(o, left)
    ore = sqdist(o, right)
    lr = sqdist(left, right)
    assert lr <= ol + ore
    assert ore <= lr + ol
    assert ol <= ore + lr

    target_disk_margin = mec_radius_sq - sqdist(mec_center, target)
    assert target_disk_margin > 0
    print("PASS: exact rational normalized one-row extension countermodel")
    print("boundary=o,target,left,q,center,q_prime,third_source,right")
    print(f"physical_class_card={len(physical_class)}")
    print(f"min_strict_hull_margin={min(edge_margins)}")
    print(f"target_outside_cap_margin={cross(left, right, target)}")
    print(f"target_mec_disk_margin={target_disk_margin}")
    print(f"row_radius_sq={row_radius_sq}")


if __name__ == "__main__":
    main()
