#!/usr/bin/env python3
"""Exact rational replay of the period-three core plus one complete 2+2 row."""

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
    u, v = sub(b, a), sub(c, a)
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
    c0 = scale(F(45, 86), add(q0, q1))
    c1 = scale(F(251, 500), add(q1, q2))
    c2 = scale(F(271, 500), add(q2, q0))

    # Two distinct rational rotations of the same c0-to-q0 radius vector.
    x = add(c0, rotate_rational(sub(q0, c0), F(-47, 149)))
    y = add(c0, rotate_rational(sub(q0, c0), F(-28, 95)))

    boundary = [o, x, y, left, q0, c0, c2, q1, c1, q2, right]
    names = ["o", "x", "y", "left", "q0", "c0", "c2", "q1", "c1", "q2", "right"]
    by_name = dict(zip(names, boundary))

    # Every named point is a strict boundary vertex in the displayed order.
    hull_margins: list[F] = []
    for i, a in enumerate(boundary):
        b = boundary[(i + 1) % len(boundary)]
        for j, point in enumerate(boundary):
            if j in (i, (i + 1) % len(boundary)):
                continue
            margin = cross(a, b, point)
            assert margin > 0, (names[i], names[(i + 1) % len(boundary)], names[j], margin)
            hull_margins.append(margin)

    distinct_margins = [
        sqdist(boundary[i], boundary[j])
        for i in range(len(boundary)) for j in range(i)
    ]
    assert min(distinct_margins) > 0

    physical_class = {"left", "q0", "q1", "q2", "right"}
    for name, point in by_name.items():
        if name in physical_class:
            assert sqdist(o, point) == 1
        elif name != "o":
            assert sqdist(o, point) != 1

    row0_radius_sq = sqdist(c0, q0)
    row1_radius_sq = sqdist(c1, q1)
    row2_radius_sq = sqdist(c2, q2)
    assert sqdist(c0, q1) == row0_radius_sq
    assert sqdist(c1, q2) == row1_radius_sq
    assert sqdist(c2, q0) == row2_radius_sq

    # On this eleven-point carrier the c0 class is exactly q0,q1,x,y.
    row0_class = {"q0", "q1", "x", "y"}
    row0_exclusions: list[F] = []
    for name, point in by_name.items():
        if name in row0_class:
            assert sqdist(c0, point) == row0_radius_sq
        else:
            margin = abs(sqdist(c0, point) - row0_radius_sq)
            assert margin > 0
            row0_exclusions.append(margin)

    # Retain the predecessor's exact named exclusions for the two incomplete
    # cycle rows as well: among these eleven names they meet only their source
    # pairs.  Their future second-row targets are simply not part of this model.
    other_row_exclusions: list[F] = []
    for center, radius_sq, support in (
        (c1, row1_radius_sq, {"q1", "q2"}),
        (c2, row2_radius_sq, {"q2", "q0"}),
    ):
        for name, point in by_name.items():
            if name in support:
                assert sqdist(center, point) == radius_sq
            else:
                margin = abs(sqdist(center, point) - radius_sq)
                assert margin > 0
                other_row_exclusions.append(margin)

    cap_order = ["left", "q0", "c0", "c2", "q1", "c1", "q2", "right"]
    positions = {name: i for i, name in enumerate(cap_order)}
    assert positions["q0"] < positions["c0"] < positions["q1"]
    assert positions["q1"] < positions["c1"] < positions["q2"]
    assert positions["q0"] < positions["c2"] < positions["q2"]

    # The physical cap is opposite o across the endpoint chord; x,y follow o
    # on the complementary chain and lie strictly on o's side.
    outside_margins = [cross(left, right, point) for point in (o, x, y)]
    assert min(outside_margins) > 0
    cap_margins = [-cross(left, right, by_name[name]) for name in cap_order[1:-1]]
    assert min(cap_margins) > 0

    mec_center: Point = (F(1, 2), (1 - right[0]) / (2 * right[1]))
    mec_radius_sq = sqdist(mec_center, o)
    assert sqdist(mec_center, left) == mec_radius_sq
    assert sqdist(mec_center, right) == mec_radius_sq
    disk_margins = [mec_radius_sq - sqdist(mec_center, point) for point in boundary]
    assert min(disk_margins) >= 0
    nontriangle_disk_margins = [
        mec_radius_sq - sqdist(mec_center, by_name[name])
        for name in ("x", "y", "q0", "c0", "c2", "q1", "c1", "q2")
    ]
    assert min(nontriangle_disk_margins) > 0

    ol, ore, lr = sqdist(o, left), sqdist(o, right), sqdist(left, right)
    assert lr <= ol + ore
    assert ore <= lr + ol
    assert ol <= ore + lr

    print("PASS: exact rational period-three cycle core plus complete c0 row")
    print("boundary=o,x,y,left,q0,c0,c2,q1,c1,q2,right")
    print("physical_class={left,q0,q1,q2,right}")
    print("c0_class={q0,q1,x,y}")
    print(f"x_rotation_t={F(-47,149)}")
    print(f"y_rotation_t={F(-28,95)}")
    print(f"min_strict_hull_margin={min(hull_margins)}")
    print(f"min_pairwise_dist_sq={min(distinct_margins)}")
    print(f"min_outside_cap_margin={min(outside_margins)}")
    print(f"min_physical_cap_margin={min(cap_margins)}")
    print(f"min_mec_disk_margin_nontriangle={min(nontriangle_disk_margins)}")
    print(f"min_row0_class_exclusion={min(row0_exclusions)}")
    print(f"min_other_row_exclusion={min(other_row_exclusions)}")
    print(f"row0_radius_sq={row0_radius_sq}")


if __name__ == "__main__":
    main()
