#!/usr/bin/env python3
"""Bounded exact scan adding the live cap-cardinality marginals.

Starting from the exact one-point-overlap frontier-pair witness, insert two
rational outward bumps in the cap opposite ``right`` and two in the closing
cap from ``right`` to ``o``.  This tests whether the local witness can retain
the live cap lower bounds without changing any metric equalities.
"""

from __future__ import annotations

from fractions import Fraction as F

from search_rational_pair import (
    Point,
    add,
    cross,
    rotate_rational,
    scale,
    sqdist,
    strict_hull,
    sub,
    unit_point,
)


def interpolate(a: Point, b: Point, t: F) -> Point:
    return add(scale(1 - t, a), scale(t, b))


def outward_bump(a: Point, b: Point, t: F, eps: F) -> Point:
    base = interpolate(a, b, t)
    edge = sub(b, a)
    right_normal = (edge[1], -edge[0])
    return add(base, scale(eps * t * (1 - t), right_normal))


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

    mec_center: Point = (F(1, 2), (1 - right[0]) / (2 * right[1]))
    mec_radius_sq = sqdist(mec_center, o)

    epsilons = [F(1, d) for d in (50, 80, 100, 150, 200, 300, 500, 800,
                                   1000, 1500, 2000, 3000, 5000, 8000,
                                   10000, 20000, 50000, 100000)]
    tested = 0
    for e0 in epsilons:
        cap0 = outward_bump(o, x, F(1, 2), e0)
        for e1 in epsilons:
            cap1 = outward_bump(y, left, F(1, 2), e1)
            for es in epsilons:
                surplus0 = outward_bump(right, o, F(1, 3), es)
                surplus1 = outward_bump(right, o, F(2, 3), es)
                boundary = [
                    o, cap0, x, y, cap1, left, q0, frontier_a, c0, c2,
                    q1, c1, q2, right, surplus0, surplus1,
                ]
                tested += 1
                margin = strict_hull(boundary)
                if margin is None:
                    continue
                disk_margins = [mec_radius_sq - sqdist(mec_center, p) for p in boundary]
                if min(disk_margins) < 0:
                    continue
                print("SAT_EXACT_PADDED")
                print(f"eps_cap0={e0}")
                print(f"eps_cap1={e1}")
                print(f"eps_surplus={es}")
                print("boundary=o,cap0,x,y,cap1,left,q0,frontier_a,c0,c2,q1,c1,q2,right,surplus0,surplus1")
                print(f"min_strict_hull_margin={margin}")
                print(f"min_mec_disk_margin={min(disk_margins)}")
                print(f"tested={tested}")
                return

    print("UNKNOWN_NO_HIT")
    print(f"tested={tested}")


if __name__ == "__main__":
    main()
