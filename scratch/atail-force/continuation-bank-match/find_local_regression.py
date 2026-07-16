#!/usr/bin/env python3
"""Search a six-point convex regression for the alternating hinge prefix.

This is theorem-discovery support only.  It searches the normalized metric
prefix

  z1-z2-O2 equilateral,
  |z1-a| = |z1-z2|,
  |z2-b| = |z1-z2|,
  |O1-a| = |O1-b|,

while requiring all six named points to be hull vertices, z1/z2 and a/b to
be adjacent hull pairs, and all three proposed hinge tails to fail.
"""

from __future__ import annotations

import math
import random


Point = tuple[float, float]


def cross(o: Point, a: Point, b: Point) -> float:
    return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])


def hull(points: dict[str, Point]) -> list[str]:
    ordered = sorted(points, key=lambda name: points[name])

    def half(names: list[str]) -> list[str]:
        out: list[str] = []
        for name in names:
            while len(out) >= 2 and cross(
                points[out[-2]], points[out[-1]], points[name]
            ) <= 1e-10:
                out.pop()
            out.append(name)
        return out

    lo = half(ordered)
    hi = half(list(reversed(ordered)))
    return lo[:-1] + hi[:-1]


def adjacent(order: list[str], x: str, y: str) -> bool:
    n = len(order)
    ix = order.index(x)
    iy = order.index(y)
    return (ix - iy) % n in (1, n - 1)


def d2(p: Point, q: Point) -> float:
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def main() -> None:
    rng = random.Random(0xA7A11)
    z1 = (0.0, 0.0)
    z2 = (1.0, 0.0)
    o2 = (0.5, -math.sqrt(3.0) / 2.0)

    for _ in range(2_000_000):
        alpha = rng.uniform(math.pi, 2.0 * math.pi)
        beta = rng.uniform(math.pi, 2.0 * math.pi)
        a = (math.cos(alpha), math.sin(alpha))
        b = (1.0 + math.cos(beta), math.sin(beta))
        if d2(a, b) < 1e-4:
            continue

        # O1 ranges along the perpendicular bisector of a,b.
        mid = ((a[0] + b[0]) / 2.0, (a[1] + b[1]) / 2.0)
        dx, dy = b[0] - a[0], b[1] - a[1]
        norm = math.hypot(dx, dy)
        nx, ny = -dy / norm, dx / norm
        t = rng.uniform(-4.0, 4.0)
        o1 = (mid[0] + t * nx, mid[1] + t * ny)

        points = {"z1": z1, "z2": z2, "O2": o2, "a": a, "b": b, "O1": o1}
        order = hull(points)
        if len(order) != 6:
            continue
        if not adjacent(order, "z1", "z2") or not adjacent(order, "a", "b"):
            continue
        tails = (
            abs(d2(b, z1) - d2(b, a)),
            abs(d2(a, z2) - d2(a, o2)),
            abs(d2(o2, b) - d2(o2, a)),
        )
        if min(tails) < 1e-4:
            continue
        print("cyclic hull:", " ".join(order))
        for name in order:
            print(f"{name:>2} = ({points[name][0]: .15f}, {points[name][1]: .15f})")
        print("squared tail gaps:", *(f"{x:.15g}" for x in tails))
        print("angles:", alpha, beta, "perp-bisector t:", t)
        return
    raise SystemExit("no regression found")


if __name__ == "__main__":
    main()
