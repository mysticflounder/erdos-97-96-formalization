"""Random search for two collision kites in one MEC cap.

This is an exploratory necessary-condition test for the live ATAIL leaf.  The
minimum enclosing circle is fixed to the unit disk and its boundary triangle
is equilateral.  A successful sample would show that the MEC packet plus the
two local equal-blocker kites is still geometrically consistent.
"""

from __future__ import annotations

import math

import numpy as np
from scipy.spatial import ConvexHull


O = np.array([1.0, 0.0])
V2 = np.array([-0.5, math.sqrt(3.0) / 2.0])
V3 = np.array([-0.5, -math.sqrt(3.0) / 2.0])


def reflect(point: np.ndarray, line_point: np.ndarray) -> np.ndarray:
    """Reflect point across the line through O and line_point."""
    direction = line_point - O
    direction /= np.linalg.norm(direction)
    projection = O + direction * np.dot(point - O, direction)
    return 2.0 * projection - point


def in_open_opposite_segment(point: np.ndarray) -> bool:
    return point[0] < -0.5001 and np.dot(point, point) < 0.9999


def all_strict_hull(points: np.ndarray) -> bool:
    hull = ConvexHull(points)
    return len(hull.vertices) == len(points)


def sample_segment(rng: np.random.Generator) -> np.ndarray:
    while True:
        point = rng.uniform((-0.999, -0.86), (-0.501, 0.86))
        if in_open_opposite_segment(point):
            return point


def main() -> None:
    rng = np.random.default_rng(9796)
    for trial in range(5_000_000):
        c = sample_segment(rng)
        d = sample_segment(rng)
        a = sample_segment(rng)
        u = sample_segment(rng)
        b = reflect(a, c)
        v = reflect(u, d)
        if not in_open_opposite_segment(b) or not in_open_opposite_segment(v):
            continue
        points = np.array([O, V2, a, u, c, d, b, v, V3])
        if len({tuple(np.round(p, 12)) for p in points}) != len(points):
            continue
        if not all_strict_hull(points):
            continue
        names = ("O", "V2", "a", "u", "c", "d", "b", "v", "V3")
        hull = ConvexHull(points)
        order = [names[index] for index in hull.vertices]
        print(f"success trial={trial}")
        print("order", order)
        for name, point in zip(names, points, strict=True):
            print(name, repr(tuple(float(x) for x in point)))
        return
    print("no sample")


if __name__ == "__main__":
    main()
