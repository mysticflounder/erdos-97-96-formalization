#!/usr/bin/env python3
"""Exact checker for a six-distinct-role cap-local Euclidean model."""

from fractions import Fraction as Q

Point = tuple[Q, Q]


def point(x: int, y: int) -> Point:
    return Q(x), Q(y)


P: dict[str, Point] = {
    "O": point(0, 0),
    "L": point(10, -1),
    "a": point(25, 0),
    "u": point(36, 15),
    "c": point(36, 27),
    "d": point(34, 34),
    "v": point(15, 36),
    "b": point(7, 24),
    "R": point(1, 10),
}

# Counterclockwise hull order.  L and R are optional closed-cap endpoints;
# the six named roles are therefore all in the open cap from L to R avoiding O.
HULL = ("O", "L", "a", "u", "c", "d", "v", "b", "R")
CAP_INTERIOR = HULL[2:-1]


def sub(p: Point, q: Point) -> Point:
    return p[0] - q[0], p[1] - q[1]


def dot(p: Point, q: Point) -> Q:
    return p[0] * q[0] + p[1] * q[1]


def cross(p: Point, q: Point) -> Q:
    return p[0] * q[1] - p[1] * q[0]


def dist2(p: Point, q: Point) -> Q:
    v = sub(p, q)
    return dot(v, v)


def is_subsequence(needle: tuple[str, ...], haystack: tuple[str, ...]) -> bool:
    cursor = iter(haystack)
    return all(any(label == wanted for label in cursor) for wanted in needle)


def main() -> None:
    assert len(set(P.values())) == len(P)
    assert CAP_INTERIOR == ("a", "u", "c", "d", "v", "b")
    assert is_subsequence(("a", "c", "b"), CAP_INTERIOR)
    assert is_subsequence(("u", "d", "v"), CAP_INTERIOR)

    oa2 = dist2(P["O"], P["a"])
    ob2 = dist2(P["O"], P["b"])
    ou2 = dist2(P["O"], P["u"])
    ov2 = dist2(P["O"], P["v"])
    ca2 = dist2(P["c"], P["a"])
    cb2 = dist2(P["c"], P["b"])
    du2 = dist2(P["d"], P["u"])
    dv2 = dist2(P["d"], P["v"])
    assert oa2 == ob2 == Q(625)
    assert ou2 == ov2 == Q(1521)
    assert oa2 != ou2
    assert ca2 == cb2 == Q(850)
    assert du2 == dv2 == Q(365)

    # Strong exact convexity certificate: for every counterclockwise hull
    # edge, every other point is strictly in its open left half-plane.
    edge_margins: list[tuple[str, str, Q]] = []
    n = len(HULL)
    for i, left_name in enumerate(HULL):
        right_name = HULL[(i + 1) % n]
        edge = sub(P[right_name], P[left_name])
        margins = [
            cross(edge, sub(P[name], P[left_name]))
            for name in HULL
            if name not in (left_name, right_name)
        ]
        assert all(margin > 0 for margin in margins)
        edge_margins.append((left_name, right_name, min(margins)))

    # Optional strengthening: O,L,R is a non-obtuse (indeed right isosceles)
    # endpoint triangle.  No circumscribed-MEC claim is made.
    assert dist2(P["O"], P["L"]) == Q(101)
    assert dist2(P["O"], P["R"]) == Q(101)
    assert dist2(P["L"], P["R"]) == Q(202)
    assert dot(sub(P["L"], P["O"]), sub(P["R"], P["O"])) == 0

    print("PASS: exact rational six-distinct cap-local model")
    print(f"hull order: {' '.join(HULL)}")
    print(f"open cap L->R avoiding O: {' '.join(CAP_INTERIOR)}")
    print(f"|Oa|^2=|Ob|^2={oa2}; |Ou|^2=|Ov|^2={ou2}")
    print(f"|ca|^2=|cb|^2={ca2}; |du|^2=|dv|^2={du2}")
    print("strict supporting-edge minima:")
    for left_name, right_name, margin in edge_margins:
        print(f"  {left_name}->{right_name}: {margin}")
    print(f"global minimum strict margin: {min(x[2] for x in edge_margins)}")


if __name__ == "__main__":
    main()
