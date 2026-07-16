#!/usr/bin/env python3
"""Exact Q(sqrt(3)) certificate for the alternating local regression.

The certificate is deliberately scoped to the local metric and strict-convex
facts exported by the symmetric selector.  It is not a CounterexampleData
model and makes no global-K4 claim.
"""

from __future__ import annotations

from dataclasses import dataclass
from fractions import Fraction as F


@dataclass(frozen=True)
class Q3:
    """An exact value p + q*sqrt(3)."""

    p: F = F(0)
    q: F = F(0)

    def __add__(self, other: Q3) -> Q3:
        return Q3(self.p + other.p, self.q + other.q)

    def __sub__(self, other: Q3) -> Q3:
        return Q3(self.p - other.p, self.q - other.q)

    def __mul__(self, other: Q3) -> Q3:
        return Q3(
            self.p * other.p + 3 * self.q * other.q,
            self.p * other.q + self.q * other.p,
        )

    def __neg__(self) -> Q3:
        return Q3(-self.p, -self.q)

    def interval(self) -> tuple[F, F]:
        # 1.732 < sqrt(3) < 1.733, since both inequalities square correctly.
        lo, hi = F(1732, 1000), F(1733, 1000)
        if self.q < 0:
            lo, hi = hi, lo
        return self.p + self.q * lo, self.p + self.q * hi

    def sign(self) -> int:
        lo, hi = self.interval()
        if 0 < lo:
            return 1
        if hi < 0:
            return -1
        if self.p == 0 and self.q == 0:
            return 0
        raise AssertionError(f"coarse sqrt(3) interval did not decide {self}")


Point = tuple[Q3, Q3]


def q(x: F | int) -> Q3:
    return Q3(F(x), F(0))


def sub(x: Point, y: Point) -> Point:
    return x[0] - y[0], x[1] - y[1]


def d2(x: Point, y: Point) -> Q3:
    dx, dy = sub(x, y)
    return dx * dx + dy * dy


def area(x: Point, y: Point, z: Point) -> Q3:
    yx, zx = sub(y, x), sub(z, x)
    return yx[0] * zx[1] - yx[1] * zx[0]


def main() -> None:
    z1 = (q(0), q(0))
    z2 = (q(1), q(0))
    o2 = (q(F(1, 2)), Q3(F(0), F(-1, 2)))
    a = (q(F(51, 149)), q(F(-140, 149)))
    b = (q(F(1, 25)), q(F(-7, 25)))
    o1 = (q(F(1759, 1490)), q(F(-233, 1490)))
    points = {"z1": z1, "b": b, "a": a, "O2": o2, "O1": o1, "z2": z2}
    order = list(points)

    one = q(1)
    assert d2(z1, z2) == one
    assert d2(z1, o2) == one
    assert d2(z2, o2) == one
    assert d2(z1, a) == one
    assert d2(z2, b) == one
    assert d2(o1, a) == d2(o1, b)

    # Every non-endpoint is strictly on the same side of every oriented hull
    # edge, certifying the displayed cyclic order and strict convexity.
    edge_signs: list[tuple[str, str, int]] = []
    for i, x_name in enumerate(order):
        y_name = order[(i + 1) % len(order)]
        signs = {
            area(points[x_name], points[y_name], points[z_name]).sign()
            for z_name in order
            if z_name not in (x_name, y_name)
        }
        assert len(signs) == 1 and 0 not in signs
        edge_signs.append((x_name, y_name, signs.pop()))

    tails = {
        "|b-z1|^2-|b-a|^2": d2(b, z1) - d2(b, a),
        "|a-z2|^2-|a-O2|^2": d2(a, z2) - d2(a, o2),
        "|O2-b|^2-|O2-a|^2": d2(o2, b) - d2(o2, a),
    }
    assert all(value.sign() != 0 for value in tails.values())

    print("exact cyclic hull:", " ".join(order))
    print("all hull-edge side signs:", edge_signs)
    for name, value in tails.items():
        lo, hi = value.interval()
        print(f"{name}: {value.p} + ({value.q})*sqrt(3); interval [{float(lo)}, {float(hi)}]")


if __name__ == "__main__":
    main()
