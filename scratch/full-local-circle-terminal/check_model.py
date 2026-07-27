#!/usr/bin/env python3
"""Exact rational checker for the full local two-circle terminal witness."""

from fractions import Fraction as Q
from itertools import combinations


Point = tuple[Q, Q]

P: dict[str, Point] = {
    "p": (Q(-1), Q(0)),
    "c": (Q(0), Q(1, 4)),
    "q": (Q(1), Q(0)),
    "O": (Q(0), Q(-1, 4)),
    "e": (Q(659, 641), Q(-225, 1282)),
    "f": (Q(38, 37), Q(-6, 37)),
    "g": (Q(-32, 37), Q(-23, 74)),
    "h": (Q(304, 325), Q(-119, 650)),
}

# Counterclockwise boundary order.  The cap itself is ordered clockwise as p<c<q.
HULL = ("p", "g", "O", "h", "e", "f", "q", "c")
CAP = ("p", "c", "q")
OFF_CAP = ("O", "e", "f", "g", "h")


def sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def dot(a: Point, b: Point) -> Q:
    return a[0] * b[0] + a[1] * b[1]


def signed_area2(a: Point, b: Point, x: Point) -> Q:
    ba, xa = sub(b, a), sub(x, a)
    return ba[0] * xa[1] - ba[1] * xa[0]


def dist2(a: Point, b: Point) -> Q:
    return dot(sub(a, b), sub(a, b))


def main() -> None:
    assert len(set(P.values())) == len(P)

    # Both carrier circles are exact four-point classes, not merely subsets.
    radius2 = Q(17, 16)
    assert {name for name, x in P.items() if dist2(P["O"], x) == radius2} == {
        "p",
        "q",
        "e",
        "f",
    }
    assert {name for name, x in P.items() if dist2(P["c"], x) == radius2} == {
        "p",
        "q",
        "g",
        "h",
    }

    # The endpoint chord strictly separates the sole interior cap point from
    # O and all four off-cap circle points.
    assert signed_area2(P["p"], P["q"], P["c"]) == Q(1, 2)
    assert all(signed_area2(P["p"], P["q"], P[x]) < 0 for x in OFF_CAP)
    assert signed_area2(P["p"], P["q"], P["O"]) == Q(-1, 2)
    assert dist2(P["O"], P["c"]) == Q(1, 4) < radius2

    # Exact StrictCapOrder checks for L=[p,c,q].
    assert signed_area2(P["p"], P["c"], P["q"]) == Q(-1, 2)
    chord = sub(P["q"], P["p"])
    for left, right in combinations(CAP, 2):
        assert dot(sub(P[right], P[left]), chord) > 0
    cap_indices = {name: i for i, name in enumerate(CAP)}
    for left, right in combinations(CAP, 2):
        between = {
            name
            for name in CAP
            if cap_indices[left] < cap_indices[name] < cap_indices[right]
        }
        positive_side = {
            name
            for name, x in P.items()
            if signed_area2(P[left], P[right], x) > 0
        }
        assert positive_side == between

    # Every directed boundary edge has every other carrier point strictly on
    # its left.  This is an exact strict-convexity certificate.
    margins: list[Q] = []
    for i, left in enumerate(HULL):
        right = HULL[(i + 1) % len(HULL)]
        edge_margins = [
            signed_area2(P[left], P[right], P[x])
            for x in HULL
            if x not in (left, right)
        ]
        assert all(margin > 0 for margin in edge_margins)
        margins.extend(edge_margins)

    print("PASS: exact rational full local two-circle terminal witness")
    print("counterclockwise hull:", " ".join(HULL))
    print("ordered cap: p < c < q")
    print("off cap:", " ".join(OFF_CAP))
    print("O-circle support: p q e f; squared radius 17/16")
    print("c-circle support: p q g h; squared radius 17/16")
    print(f"checked {len(margins)} positive supporting-edge determinants")
    print(f"smallest supporting-edge determinant: {min(margins)}")


if __name__ == "__main__":
    main()
