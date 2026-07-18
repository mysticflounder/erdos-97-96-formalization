#!/usr/bin/env python3
"""Exact rational replay of the period-three one-target-per-row model."""

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
    right = unit_point(F(15091, 15143))
    q0 = unit_point(F(943, 92200))
    q1 = unit_point(F(9643, 22662))
    q2 = unit_point(F(194, 199))

    c0 = scale(F(12637, 25058), add(q0, q1))
    c1 = scale(F(45957, 91523), add(q1, q2))
    c2 = scale(F(66359, 95986), add(q2, q0))

    x0 = add(c0, rotate_rational(sub(q0, c0), F(-12309, 65752)))
    x1 = add(c1, rotate_rational(sub(q1, c1), F(-174207, 42424)))
    x2 = add(c2, rotate_rational(sub(q2, c2), F(71631, 59831)))

    points = {
        "o": o,
        "x2": x2,
        "x0": x0,
        "left": left,
        "q0": q0,
        "c0": c0,
        "c2": c2,
        "q1": q1,
        "c1": c1,
        "q2": q2,
        "right": right,
        "x1": x1,
    }
    names = tuple(points)
    boundary = tuple(points.values())

    hull_margins: list[F] = []
    for i, a in enumerate(boundary):
        b = boundary[(i + 1) % len(boundary)]
        for j, point in enumerate(boundary):
            if j in (i, (i + 1) % len(boundary)):
                continue
            margin = cross(a, b, point)
            assert margin > 0, (names[i], names[(i + 1) % len(boundary)], names[j], margin)
            hull_margins.append(margin)

    pairwise_distances = [
        sqdist(boundary[i], boundary[j])
        for i in range(len(boundary))
        for j in range(i)
    ]
    assert all(distance > 0 for distance in pairwise_distances)

    physical_class = {"left", "q0", "q1", "q2", "right"}
    assert all(sqdist(o, points[name]) == 1 for name in physical_class)
    assert all(
        sqdist(o, point) != 1
        for name, point in points.items()
        if name not in physical_class and name != "o"
    )

    rows = (
        ("c0", ("q0", "q1"), "x0"),
        ("c1", ("q1", "q2"), "x1"),
        ("c2", ("q2", "q0"), "x2"),
    )
    row_exclusions: list[F] = []
    for center_name, sources, target_name in rows:
        center = points[center_name]
        radius_sq = sqdist(center, points[sources[0]])
        assert sqdist(center, points[sources[1]]) == radius_sq
        assert sqdist(center, points[target_name]) == radius_sq
        support = {*sources, target_name}
        for name, point in points.items():
            if name not in support and name != center_name:
                gap = abs(sqdist(center, point) - radius_sq)
                assert gap > 0, (center_name, name)
                row_exclusions.append(gap)

    # The fixed physical-cap order is
    # left < q0 < c0 < c2 < q1 < c1 < q2 < right.
    cap_order = ("left", "q0", "c0", "c2", "q1", "c1", "q2", "right")
    position = {name: index for index, name in enumerate(cap_order)}
    assert position["q0"] < position["c0"] < position["q1"]
    assert position["q1"] < position["c1"] < position["q2"]
    assert position["q0"] < position["c2"] < position["q2"]

    outside_margins = [cross(left, right, points[name]) for name in ("o", "x0", "x1", "x2")]
    cap_margins = [-cross(left, right, points[name]) for name in cap_order[1:-1]]
    assert all(margin > 0 for margin in outside_margins)
    assert all(margin > 0 for margin in cap_margins)

    mec_center: Point = (F(1, 2), (1 - right[0]) / (2 * right[1]))
    mec_radius_sq = sqdist(mec_center, o)
    assert sqdist(mec_center, left) == mec_radius_sq
    assert sqdist(mec_center, right) == mec_radius_sq
    disk_margins = {
        name: mec_radius_sq - sqdist(mec_center, point)
        for name, point in points.items()
    }
    assert all(margin >= 0 for margin in disk_margins.values())
    assert all(
        margin > 0
        for name, margin in disk_margins.items()
        if name not in {"o", "left", "right"}
    )

    ol = sqdist(o, left)
    ore = sqdist(o, right)
    lr = sqdist(left, right)
    assert lr <= ol + ore
    assert ore <= lr + ol
    assert ol <= ore + lr

    print("PASS: exact rational period-three core with one target per blocker row")
    print("boundary=" + ",".join(names))
    print("physical_class={left,q0,q1,q2,right}")
    print("row0_class={q0,q1,x0}")
    print("row1_class={q1,q2,x1}")
    print("row2_class={q2,q0,x2}")
    print(f"min_strict_hull_margin={min(hull_margins)}")
    print(f"min_pairwise_dist_sq={min(pairwise_distances)}")
    print(f"min_outside_cap_margin={min(outside_margins)}")
    print(f"min_physical_cap_margin={min(cap_margins)}")
    print(f"min_mec_disk_margin_nontriangle={min(margin for name, margin in disk_margins.items() if name not in {'o', 'left', 'right'})}")
    print(f"min_row_class_exclusion={min(row_exclusions)}")


if __name__ == "__main__":
    main()
