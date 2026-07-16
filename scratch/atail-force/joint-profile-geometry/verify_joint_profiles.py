#!/usr/bin/env python3
"""Exact five-point audit for paired equilateral continuation profiles.

The old rows centered at ``x`` and ``y`` make ``x,y,a`` equilateral.  A point
``b`` in the row centered at ``y`` receives a generated row with exact profile
``{x,a}`` or ``{y,a}``.  Symmetrically, a point ``c`` in the row centered at
``x`` receives profile ``{y,a}`` or ``{x,a}``.

This script checks all four profile pairs over Q(sqrt(3)), including the full
five-point strict-convexity condition and the exact squared-distance equality
partition.  It is a named local regression, not a CounterexampleData model.
"""

from dataclasses import dataclass
from fractions import Fraction
from itertools import permutations


@dataclass(frozen=True, order=True)
class QS3:
    rat: Fraction = Fraction(0)
    root: Fraction = Fraction(0)

    def __add__(self, other: "QS3") -> "QS3":
        return QS3(self.rat + other.rat, self.root + other.root)

    def __neg__(self) -> "QS3":
        return QS3(-self.rat, -self.root)

    def __sub__(self, other: "QS3") -> "QS3":
        return self + (-other)

    def __mul__(self, other: "QS3") -> "QS3":
        return QS3(
            self.rat * other.rat + 3 * self.root * other.root,
            self.rat * other.root + self.root * other.rat,
        )

    def sign(self) -> int:
        """Exact sign of rat + root * sqrt(3)."""
        a, b = self.rat, self.root
        if b == 0:
            return (a > 0) - (a < 0)
        if b > 0:
            if a >= 0:
                return 1
            return 1 if 3 * b * b > a * a else -1
        if a <= 0:
            return -1
        return 1 if a * a > 3 * b * b else -1

    def __str__(self) -> str:
        if self.root == 0:
            return str(self.rat)
        return f"{self.rat}+({self.root})sqrt3"


def q(value: int | Fraction) -> QS3:
    return QS3(Fraction(value), Fraction(0))


Point = tuple[QS3, QS3]


def sqdist(p: Point, r: Point) -> QS3:
    dx, dy = p[0] - r[0], p[1] - r[1]
    return dx * dx + dy * dy


def orient(p: Point, r: Point, t: Point) -> QS3:
    return (r[0] - p[0]) * (t[1] - p[1]) - (r[1] - p[1]) * (t[0] - p[0])


def strict_hull_order(points: dict[str, Point]) -> tuple[str, ...] | None:
    """Return a supporting-edge cyclic order if every point is a hull vertex."""
    names = tuple(points)
    first = names[0]
    for tail in permutations(names[1:]):
        order = (first, *tail)
        good = True
        for i, left_name in enumerate(order):
            right_name = order[(i + 1) % len(order)]
            left, right = points[left_name], points[right_name]
            for other_name in order:
                if other_name in (left_name, right_name):
                    continue
                if orient(left, right, points[other_name]).sign() <= 0:
                    good = False
                    break
            if not good:
                break
        if good:
            return order
    return None


zero = q(0)
one = q(1)
half = q(Fraction(1, 2))
three_halves = q(Fraction(3, 2))
sqrt3_half = QS3(Fraction(0), Fraction(1, 2))

x: Point = (zero, zero)
y: Point = (one, zero)
a: Point = (half, sqrt3_half)

# ``b`` lies in row(y); ``c`` lies in row(x).
b_profiles: dict[str, Point] = {
    "xa": (one - sqrt3_half, half),
    "ya": (three_halves, sqrt3_half),
}
c_profiles: dict[str, Point] = {
    "ya": (sqrt3_half, half),
    "xa": (-half, sqrt3_half),
}


def verify_generated_profile(
    center: Point, old_center: Point, hits: tuple[Point, Point], omitted: Point
) -> None:
    assert sqdist(center, old_center) == one
    radius = sqdist(center, hits[0])
    assert sqdist(center, hits[1]) == radius
    assert sqdist(center, omitted) != radius


def equality_partition(points: dict[str, Point]) -> list[list[str]]:
    buckets: dict[QS3, list[str]] = {}
    names = list(points)
    for i, left in enumerate(names):
        for right in names[i + 1 :]:
            buckets.setdefault(sqdist(points[left], points[right]), []).append(
                f"{left}{right}"
            )
    return sorted(buckets.values(), key=lambda edges: (-len(edges), edges))


def main() -> None:
    assert sqdist(x, y) == sqdist(x, a) == sqdist(y, a) == one
    for b_profile, b in b_profiles.items():
        b_hits = (x, a) if b_profile == "xa" else (y, a)
        b_omitted = y if b_profile == "xa" else x
        verify_generated_profile(b, y, b_hits, b_omitted)

        for c_profile, c in c_profiles.items():
            c_hits = (y, a) if c_profile == "ya" else (x, a)
            c_omitted = x if c_profile == "ya" else y
            verify_generated_profile(c, x, c_hits, c_omitted)

            points = {"x": x, "y": y, "a": a, "b": b, "c": c}
            order = strict_hull_order(points)
            partition = equality_partition(points)
            status = "STRICT_CONVEX" if order is not None else "NOT_STRICT_CONVEX"
            print(
                f"b={b_profile} c={c_profile}: {status}; "
                f"order={order}; equality_classes={partition}"
            )


if __name__ == "__main__":
    main()
