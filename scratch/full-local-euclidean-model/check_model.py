#!/usr/bin/env python3
"""Exact checker for the full two-shell local Euclidean witness."""

from itertools import combinations

import sympy as sp


Q = sp.Rational
sqrt = sp.sqrt


def point(t: sp.Expr) -> tuple[sp.Expr, sp.Expr]:
    """The strictly convex parabola P(t) = (t,t^2)."""
    return (t, t**2)


T: dict[str, sp.Expr] = {
    "O": -Q(21, 10),
    "g": -Q(5, 4) - sqrt(59) / 20,
    "e": -1 - sqrt(26) / 10,
    "h": -Q(5, 4) + sqrt(59) / 20,
    "f": -1 + sqrt(26) / 10,
    "a": 1 - sqrt(186) / 10,
    "u": Q(5, 4) - sqrt(603) / 20,
    "c": Q(8, 5),
    "d": Q(17, 10),
    "b": 1 + sqrt(186) / 10,
    "v": Q(5, 4) + sqrt(603) / 20,
}

ORDER = ("O", "g", "e", "h", "f", "a", "u", "c", "d", "b", "v")
CAP = ("a", "u", "c", "d", "b", "v")
OUTSIDE = ("O", "g", "e", "h", "f")
P = {name: point(t) for name, t in T.items()}


def sub(p: tuple[sp.Expr, sp.Expr], q: tuple[sp.Expr, sp.Expr]):
    return (p[0] - q[0], p[1] - q[1])


def dot(p: tuple[sp.Expr, sp.Expr], q: tuple[sp.Expr, sp.Expr]):
    return sp.expand(p[0] * q[0] + p[1] * q[1])


def cross(p: tuple[sp.Expr, sp.Expr], q: tuple[sp.Expr, sp.Expr]):
    return sp.expand(p[0] * q[1] - p[1] * q[0])


def orient(a, b, c):
    return sp.simplify(cross(sub(b, a), sub(c, a)))


def dist2(a, b):
    delta = sub(a, b)
    return sp.simplify(dot(delta, delta))


def exact_equal(values: list[sp.Expr]) -> None:
    assert all(sp.simplify(value - values[0]) == 0 for value in values[1:])


def main() -> None:
    # SymPy decides every adjacent radical inequality exactly.
    gaps = [sp.simplify(T[y] - T[x]) for x, y in zip(ORDER, ORDER[1:])]
    assert all(gap.is_positive is True for gap in gaps)
    assert tuple(name for name in ORDER if name in CAP) == CAP
    assert tuple(name for name in ORDER if name in OUTSIDE) == OUTSIDE

    # x = -2/5 strictly separates the cap from O and all four off-cap points.
    separator = -Q(2, 5)
    assert all((T[name] - separator).is_positive is True for name in CAP)
    assert all((separator - T[name]).is_positive is True for name in OUTSIDE)

    # The two apex-radius collisions.
    exact_equal([dist2(P["O"], P[name]) for name in ("a", "b")])
    exact_equal([dist2(P["O"], P[name]) for name in ("u", "v")])
    assert dist2(P["O"], P["a"]) == Q(341, 16)
    assert dist2(P["O"], P["u"]) == Q(957899, 40000)

    # Both complete blocker-centered four-point shells.
    exact_equal([dist2(P["c"], P[name]) for name in ("a", "b", "e", "f")])
    exact_equal([dist2(P["d"], P[name]) for name in ("u", "v", "g", "h")])
    assert dist2(P["c"], P["a"]) == Q(39, 4)
    assert dist2(P["d"], P["u"]) == Q(446571, 40000)

    # Strong strict-convexity certificate: every directed hull edge has every
    # nonincident point in its open left half-plane.
    edge_margins: list[sp.Expr] = []
    n = len(ORDER)
    for i, left_name in enumerate(ORDER):
        right_name = ORDER[(i + 1) % n]
        margins = [
            orient(P[left_name], P[right_name], P[name])
            for name in ORDER
            if name not in (left_name, right_name)
        ]
        assert all(margin.is_positive is True for margin in margins)
        edge_margins.extend(margins)

    # An independent all-triples check of the increasing parabola order.
    for x, y, z in combinations(ORDER, 3):
        assert orient(P[x], P[y], P[z]).is_positive is True

    print("PASS: exact algebraic full local Euclidean model")
    print(f"hull order: {' '.join(ORDER)}")
    print(f"strict cap x > -2/5: {' '.join(CAP)}")
    print(f"outside x < -2/5: {' '.join(OUTSIDE)}")
    print("|Oa|^2=|Ob|^2=341/16")
    print("|Ou|^2=|Ov|^2=957899/40000")
    print("|ca|^2=|cb|^2=|ce|^2=|cf|^2=39/4")
    print("|du|^2=|dv|^2=|dg|^2=|dh|^2=446571/40000")
    print("parameters:")
    for name in ORDER:
        print(f"  {name}: {T[name]} ~= {sp.N(T[name], 12)}")
    print(f"checked {len(edge_margins)} exact positive supporting-edge determinants")


if __name__ == "__main__":
    main()
