#!/usr/bin/env python3
"""Deterministic scope test for extending the pinned period-three core.

This is a floating-point regression only.  It samples each exact blocker
circle, keeps points on the side of the physical-cap chord opposite the cap
and inside the displayed MEC disk, and asks whether adjoining the point keeps
all ten points as vertices of their convex hull.
"""

from __future__ import annotations

import math


Point = tuple[float, float]


def point(x: int, xd: int, y: int, yd: int) -> Point:
    return (x / xd, y / yd)


O = (0.0, 0.0)
LEFT = point(399, 401, -40, 401)
Q0 = (1.0, 0.0)
C0 = point(7007, 7400, 3003, 9250)
C2 = point(1001, 1250, 3003, 5000)
Q1 = point(1081, 1369, 840, 1369)
C1 = point(13013, 23125, 153153, 185000)
Q2 = point(7, 25, 24, 25)
RIGHT = point(11, 61, 60, 61)

BOUNDARY = [O, LEFT, Q0, C0, C2, Q1, C1, Q2, RIGHT]
MEC_CENTER = point(25, 46, 47, 115)
MEC_RADIUS_SQ = 24461 / 52900

ROWS: list[tuple[str, Point, Point]] = [
    ("c0:{q0,q1}", C0, Q0),
    ("c1:{q1,q2}", C1, Q1),
    ("c2:{q2,q0}", C2, Q2),
]


def cross(a: Point, b: Point, c: Point) -> float:
    return (b[0] - a[0]) * (c[1] - a[1]) - (
        b[1] - a[1]
    ) * (c[0] - a[0])


def sqdist(a: Point, b: Point) -> float:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def convex_hull(points: list[Point]) -> list[Point]:
    ordered = sorted(set(points))
    if len(ordered) <= 1:
        return ordered

    lower: list[Point] = []
    for p in ordered:
        while len(lower) >= 2 and cross(lower[-2], lower[-1], p) <= 1e-12:
            lower.pop()
        lower.append(p)

    upper: list[Point] = []
    for p in reversed(ordered):
        while len(upper) >= 2 and cross(upper[-2], upper[-1], p) <= 1e-12:
            upper.pop()
        upper.append(p)

    return lower[:-1] + upper[:-1]


def main() -> None:
    samples = 20_000
    apex_side = cross(LEFT, RIGHT, O)
    if apex_side <= 0:
        raise AssertionError("unexpected physical-cap chord orientation")
    if len(convex_hull(BOUNDARY)) != len(BOUNDARY):
        raise AssertionError("pinned carrier is not strictly convex")

    for name, center, target in ROWS:
        radius = math.sqrt(sqdist(center, target))
        eligible = 0
        full_hull_extensions = 0
        for k in range(samples):
            theta = 2 * math.pi * (k + 0.5) / samples
            candidate = (
                center[0] + radius * math.cos(theta),
                center[1] + radius * math.sin(theta),
            )
            if cross(LEFT, RIGHT, candidate) <= 1e-12:
                continue
            if sqdist(candidate, MEC_CENTER) > MEC_RADIUS_SQ + 1e-12:
                continue
            eligible += 1
            if len(convex_hull(BOUNDARY + [candidate])) == len(BOUNDARY) + 1:
                full_hull_extensions += 1
        print(
            f"{name}: samples={samples} eligible={eligible} "
            f"full_hull_extensions={full_hull_extensions}"
        )

    print("status=EMPIRICAL_PINNED_CORE_ONLY")
    print("not an exact UNSAT result; the core coordinates were not deformed")


if __name__ == "__main__":
    main()
