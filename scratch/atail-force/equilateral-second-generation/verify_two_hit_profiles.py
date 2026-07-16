#!/usr/bin/env python3
"""Exact Q(sqrt(3)) audit of the three possible two-anchor hit profiles.

This is deliberately a local named-point verifier.  It checks the metric
equalities used by the equilateral continuation and the generated row, plus
strict convexity of the four named points.  It is not a CounterexampleData,
does not supply four witnesses at every center, and does not assert global K4.
"""

from dataclasses import dataclass
from fractions import Fraction


@dataclass(frozen=True)
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


def q(value: int | Fraction) -> QS3:
    return QS3(Fraction(value), Fraction(0))


Point = tuple[QS3, QS3]


def sqdist(p: Point, r: Point) -> QS3:
    dx, dy = p[0] - r[0], p[1] - r[1]
    return dx * dx + dy * dy


def orient(p: Point, r: Point, t: Point) -> QS3:
    return (r[0] - p[0]) * (t[1] - p[1]) - (r[1] - p[1]) * (t[0] - p[0])


zero = q(0)
one = q(1)
half = q(Fraction(1, 2))
sqrt3_half = QS3(Fraction(0), Fraction(1, 2))

x: Point = (zero, zero)
y: Point = (one, zero)
a: Point = (half, sqrt3_half)


def verify_profile(
    name: str,
    b: Point,
    hull_order: list[Point],
    hits: tuple[Point, Point],
    omitted: Point,
) -> None:
    # Parent equilateral triangle and b-membership in the row centered at y.
    assert sqdist(x, y) == one
    assert sqdist(x, a) == one
    assert sqdist(y, a) == one
    assert sqdist(y, b) == one

    # The generated row at b hits exactly the named pair, not the third anchor.
    generated_radius_sq = sqdist(b, hits[0])
    assert sqdist(b, hits[1]) == generated_radius_sq
    assert sqdist(b, omitted) != generated_radius_sq

    # The four named points are pairwise distinct and strictly convex in the
    # displayed cyclic order.
    points = [x, y, a, b]
    assert len(set(points)) == 4
    signs = [
        orient(hull_order[i], hull_order[(i + 1) % 4], hull_order[(i + 2) % 4]).sign()
        for i in range(4)
    ]
    assert signs == [1, 1, 1, 1]

    print(f"PASS {name}: radius^2={generated_radius_sq}, hull signs={signs}")


def main() -> None:
    # Hits {x,y}; the other equilateral apex.  This is locally convex, but x,y
    # are not one contiguous boundary block opposite a,b.
    b_xy: Point = (half, -sqrt3_half)
    verify_profile("{x,y}", b_xy, [b_xy, y, a, x], (x, y), a)

    # Hits {x,a}; compatible with cyclic block order x,y,a,b.
    b_xa: Point = (one - sqrt3_half, half)
    verify_profile("{x,a}", b_xa, [x, y, a, b_xa], (x, a), y)

    # Hits {y,a}; compatible with cyclic block order x,y,b,a.
    b_ya: Point = (q(Fraction(3, 2)), sqrt3_half)
    verify_profile("{y,a}", b_ya, [x, y, b_ya, a], (y, a), x)


if __name__ == "__main__":
    main()
