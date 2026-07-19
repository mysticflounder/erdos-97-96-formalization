"""Exact local projection model for the two alternating-bisector packets.

This is deliberately not a model of CounterexampleData or global K4.  It only
checks that the equal-radius, cap-membership, and strict convex-order facts
extracted by `rootedTwoBisectorAlternation` are jointly realizable.
"""

from fractions import Fraction


Point = tuple[Fraction, Fraction]


def point(x: int, y: int) -> Point:
    return Fraction(x), Fraction(y)


def sub(p: Point, q: Point) -> Point:
    return p[0] - q[0], p[1] - q[1]


def cross(u: Point, v: Point) -> Fraction:
    return u[0] * v[1] - u[1] * v[0]


def dist_sq(p: Point, q: Point) -> Fraction:
    dx, dy = sub(p, q)
    return dx * dx + dy * dy


P = {
    "a": point(0, 0),
    "z": point(33, -56),
    "b": point(66, 0),
    "y": point(33, 56),
    "q": point(16, 63),
    "c": point(0, 66),
    "w": point(-16, 63),
}

# Cyclic boundary order.  The surplus cap is the short chain a-z-b.
ORDER = ["a", "z", "b", "y", "q", "c", "w"]


def main() -> None:
    turns = []
    for i, name in enumerate(ORDER):
        prev = P[ORDER[i - 1]]
        here = P[name]
        nxt = P[ORDER[(i + 1) % len(ORDER)]]
        turns.append(cross(sub(here, prev), sub(nxt, here)))
    assert all(turn > 0 for turn in turns), turns

    # On-radius frontier pair and surplus/marginal pair at the first apex a.
    assert dist_sq(P["a"], P["z"]) == dist_sq(P["a"], P["y"])
    assert dist_sq(P["a"], P["q"]) == dist_sq(P["a"], P["w"])
    assert dist_sq(P["a"], P["z"]) == dist_sq(P["a"], P["q"])

    # The surplus/marginal pair returns to the physical second apex b.
    assert dist_sq(P["b"], P["z"]) == dist_sq(P["b"], P["y"])

    # The frontier pair has a distinct actual blocker c outside the surplus cap.
    assert dist_sq(P["c"], P["q"]) == dist_sq(P["c"], P["w"])
    assert "c" not in {"a", "z", "b"}
    assert "y" not in {"a", "z", "b"}

    print("PASS: exact rational local projection is strictly convex and realizable")


if __name__ == "__main__":
    main()
