#!/usr/bin/env python3
"""Exact checks for both PG136 nested endpoint-cross-hit orders.

The two fixed rational witnesses show that strict convexity, the three live
equalities, and even the local strict nonacute cap-chain inequality on the
tail do not eliminate either surviving order.  This is a regression checker,
not a coverage or CEGAR computation.
"""

from __future__ import annotations

from fractions import Fraction as F
import itertools
import json


Point = tuple[F, F]


CASES: tuple[tuple[tuple[str, ...], dict[str, Point]], ...] = (
    (
        ("O", "A", "X", "K", "J", "C"),
        {
            "O": (F(0), F(0)),
            "A": (F(-9, 10), F(-767, 360)),
            "X": (F(-8, 15), F(-293, 120)),
            "K": (F(7, 3), F(-11, 4)),
            "J": (F(1), F(0)),
            "C": (F(3, 5), F(4, 5)),
        },
    ),
    (
        ("O", "A", "X", "C", "J", "K"),
        {
            "O": (F(0), F(0)),
            "A": (F(22, 75), F(214, 675)),
            "X": (F(23, 54), F(53, 162)),
            "C": (F(24, 25), F(7, 25)),
            "J": (F(1), F(0)),
            "K": (F(4, 9), F(-1, 3)),
        },
    ),
)


def sub(p: Point, q: Point) -> Point:
    return (p[0] - q[0], p[1] - q[1])


def dot(p: Point, q: Point) -> F:
    return p[0] * q[0] + p[1] * q[1]


def sqdist(p: Point, q: Point) -> F:
    return dot(sub(p, q), sub(p, q))


def area(p: Point, q: Point, r: Point) -> F:
    u = sub(q, p)
    v = sub(r, p)
    return u[0] * v[1] - u[1] * v[0]


def check_case(order: tuple[str, ...], points: dict[str, Point]) -> dict[str, object]:
    assert len(set(points.values())) == 6
    assert sqdist(points["O"], points["J"]) == sqdist(points["O"], points["C"])
    assert sqdist(points["A"], points["C"]) == sqdist(points["A"], points["K"])
    assert sqdist(points["X"], points["J"]) == sqdist(points["X"], points["K"])

    areas = tuple(
        area(points[order[i]], points[order[j]], points[order[k]])
        for i, j, k in itertools.combinations(range(6), 3)
    )
    assert all(a > 0 for a in areas) or all(a < 0 for a in areas)

    # In either tail orientation, J is the middle point of K,J,C or C,J,K.
    tail_dot = dot(sub(points["K"], points["J"]), sub(points["C"], points["J"]))
    assert tail_dot < 0

    return {
        "order": order,
        "strict_orientation": "positive" if areas[0] > 0 else "negative",
        "minimum_absolute_area": str(min(abs(a) for a in areas)),
        "tail_nonacute_inner_product": str(tail_dot),
    }


def main() -> int:
    results = [check_case(order, points) for order, points in CASES]
    print(
        json.dumps(
            {
                "status": "EXACT_RATIONAL_LOCAL_REALIZATIONS",
                "checked_orders": len(results),
                "results": results,
            },
            indent=2,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
