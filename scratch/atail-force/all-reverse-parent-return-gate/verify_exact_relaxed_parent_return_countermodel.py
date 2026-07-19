#!/usr/bin/env python3
"""Exact replay of a relaxed target-negating parent-return model.

All coordinates are rational.  The verdict is an external exact-arithmetic
check, not a Lean theorem and not a model of global K4/minimality/CSS.
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
    u, v = sub(b, a), sub(c, a)
    return u[0] * v[1] - u[1] * v[0]


def sqdist(a: Point, b: Point) -> F:
    d = sub(a, b)
    return d[0] * d[0] + d[1] * d[1]


def interpolate(a: Point, b: Point, t: F) -> Point:
    return add(scale(1 - t, a), scale(t, b))


def outward_bump(a: Point, b: Point, t: F, eps: F) -> Point:
    base = interpolate(a, b, t)
    edge = sub(b, a)
    return add(base, scale(eps * t * (1 - t), (edge[1], -edge[0])))


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
    x = add(c0, rotate_rational(sub(q0, c0), F(-47, 149)))
    y = add(c0, rotate_rational(sub(q0, c0), F(-28, 95)))
    frontier_a = add(right, rotate_rational(sub(x, right), F(11, 80)))
    cap0 = outward_bump(o, x, F(1, 2), F(1, 5000))
    cap1 = outward_bump(y, left, F(1, 2), F(1, 50))
    surplus0 = outward_bump(right, o, F(1, 3), F(1, 50))
    surplus1 = outward_bump(right, o, F(2, 3), F(1, 50))

    names = [
        "o", "cap0", "x", "y", "cap1", "left", "q0", "frontier_a",
        "c0", "c2", "q1", "c1", "q2", "right", "surplus0", "surplus1",
    ]
    boundary = [
        o, cap0, x, y, cap1, left, q0, frontier_a, c0, c2, q1, c1,
        q2, right, surplus0, surplus1,
    ]
    by_name = dict(zip(names, boundary))

    # Strict convexity and distinctness.
    hull_margins: list[F] = []
    for i, edge_start in enumerate(boundary):
        edge_end = boundary[(i + 1) % len(boundary)]
        for j, point in enumerate(boundary):
            if j in (i, (i + 1) % len(boundary)):
                continue
            margin = cross(edge_start, edge_end, point)
            assert margin > 0, (names[i], names[(i + 1) % len(boundary)], names[j])
            hull_margins.append(margin)
    pairwise = [sqdist(boundary[i], boundary[j])
                for i in range(len(boundary)) for j in range(i)]
    assert min(pairwise) > 0

    physical_cap = ["left", "q0", "frontier_a", "c0", "c2", "q1", "c1", "q2", "right"]
    opposite_cap1 = ["o", "cap0", "x", "y", "cap1", "left"]
    surplus_cap = ["right", "surplus0", "surplus1", "o"]
    assert len(physical_cap) >= 6
    assert len(opposite_cap1) >= 6
    assert len(surplus_cap) >= 4
    assert all(cross(left, right, by_name[n]) < 0 for n in physical_cap[1:-1])
    assert all(cross(left, right, by_name[n]) > 0 for n in opposite_cap1[:-1])
    assert all(cross(o, left, by_name[n]) < 0 for n in opposite_cap1[1:-1])
    assert cross(o, left, right) > 0
    assert all(cross(right, o, by_name[n]) < 0 for n in surplus_cap[1:-1])
    assert cross(right, o, left) > 0

    # Exact physical-apex class and directed source/blocker cycle.
    physical_class = {"left", "q0", "q1", "q2", "right"}
    assert {n for n, p in by_name.items() if sqdist(o, p) == 1} == physical_class
    row0_radius_sq = sqdist(c0, q0)
    row1_radius_sq = sqdist(c1, q1)
    row2_radius_sq = sqdist(c2, q2)
    assert sqdist(c0, q1) == row0_radius_sq
    assert sqdist(c1, q2) == row1_radius_sq
    assert sqdist(c2, q0) == row2_radius_sq
    row0_class = {n for n, p in by_name.items() if sqdist(c0, p) == row0_radius_sq}
    assert row0_class == {"q0", "q1", "x", "y"}
    assert {n for n, p in by_name.items() if sqdist(c1, p) == row1_radius_sq} == {"q1", "q2"}
    assert {n for n, p in by_name.items() if sqdist(c2, p) == row2_radius_sq} == {"q0", "q2"}

    # Retained first-apex pair: exact co-radiality, off the surplus cap,
    # deletion survival at o through the untouched five-point physical class,
    # and inequality with the one complete reverse outside pair {x,y}.
    frontier_radius_sq = sqdist(right, x)
    assert sqdist(right, frontier_a) == frontier_radius_sq
    assert x != frontier_a
    assert "x" not in surplus_cap and "frontier_a" not in surplus_cap
    assert sqdist(o, x) != sqdist(o, frontier_a)
    assert {"x", "frontier_a"} != {"x", "y"}
    assert len(physical_class - {"x"}) >= 4
    assert len(physical_class - {"frontier_a"}) >= 4

    # This is deliberately not a full first-apex K4/frontier model.  The
    # exact named class records the missing hypothesis rather than hiding it.
    first_apex_class = {n for n, p in by_name.items()
                        if n != "right" and sqdist(right, p) == frontier_radius_sq}
    assert first_apex_class == {"x", "frontier_a"}

    mec_center: Point = (F(1, 2), (1 - right[0]) / (2 * right[1]))
    mec_radius_sq = sqdist(mec_center, o)
    assert sqdist(mec_center, left) == mec_radius_sq
    assert sqdist(mec_center, right) == mec_radius_sq
    disk_margins = [mec_radius_sq - sqdist(mec_center, p) for p in boundary]
    assert min(disk_margins) >= 0
    ol, ore, lr = sqdist(o, left), sqdist(o, right), sqdist(left, right)
    assert lr <= ol + ore and ore <= lr + ol and ol <= ore + lr

    print("PASS: exact relaxed parent-return countermodel")
    print("boundary=" + ",".join(names))
    print("frontier_pair={x,frontier_a}")
    print("complete_reverse_pair_row0={x,y}")
    print("first_apex_class={x,frontier_a} (not K4)")
    print(f"physical_cap_card={len(physical_cap)}")
    print(f"opposite_cap1_card={len(opposite_cap1)}")
    print(f"surplus_cap_card={len(surplus_cap)}")
    print(f"min_strict_hull_margin={min(hull_margins)}")
    print(f"min_pairwise_dist_sq={min(pairwise)}")
    print(f"frontier_radius_sq={frontier_radius_sq}")


if __name__ == "__main__":
    main()
