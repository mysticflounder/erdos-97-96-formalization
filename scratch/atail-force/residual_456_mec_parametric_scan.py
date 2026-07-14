#!/usr/bin/env python3
"""Sample the two-parameter unit-edge core of the `(4,5,6)` MEC residual.

Discovery only.  Points 2 and 3 run over the unit circles centered at 1 and
0, respectively; point 7 is each intersection of their unit circles.  The
script filters for the strict cyclic order ``0,1,3,2,7`` and measures the
circumdisk polynomial for ``(0,1,2)``.
"""

from __future__ import annotations

import math
import random


Point = tuple[float, float]
ORDER = (0, 1, 3, 2, 7)


def cross(a: Point, b: Point, c: Point) -> float:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def intersections(a: Point, b: Point) -> tuple[Point, Point] | None:
    dx = b[0] - a[0]
    dy = b[1] - a[1]
    distance = math.hypot(dx, dy)
    if not 0.0 < distance < 2.0:
        return None
    mx = (a[0] + b[0]) / 2.0
    my = (a[1] + b[1]) / 2.0
    height = math.sqrt(1.0 - distance * distance / 4.0)
    nx = -dy / distance
    ny = dx / distance
    return (
        (mx + height * nx, my + height * ny),
        (mx - height * nx, my - height * ny),
    )


def strict_order(points: dict[int, Point]) -> bool:
    return all(
        cross(points[ORDER[i]], points[ORDER[j]], points[ORDER[k]]) > 1e-10
        for i in range(len(ORDER))
        for j in range(i + 1, len(ORDER))
        for k in range(j + 1, len(ORDER))
    )


def main() -> int:
    rng = random.Random(4569796)
    accepted = 0
    minimum: tuple[float, tuple[float, float, Point]] | None = None
    for _ in range(2_000_000):
        alpha = rng.uniform(0.0, math.pi)
        beta = rng.uniform(0.0, math.pi)
        points: dict[int, Point] = {
            0: (0.0, 0.0),
            1: (1.0, 0.0),
            2: (1.0 + math.cos(beta), math.sin(beta)),
            3: (math.cos(alpha), math.sin(alpha)),
        }
        pair = intersections(points[2], points[3])
        if pair is None:
            continue
        for point7 in pair:
            points[7] = point7
            if not strict_order(points):
                continue
            accepted += 1
            x2, y2 = points[2]
            x7, y7 = point7
            disk_polynomial = y2 * (x7 * x7 + y7 * y7 - x7) - x2 * y7
            if minimum is None or disk_polynomial < minimum[0]:
                minimum = (disk_polynomial, (alpha, beta, point7))
    print(f"accepted={accepted}")
    print(f"minimum={minimum}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
