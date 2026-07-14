#!/usr/bin/env python3
r"""Exact rational falsifier for combining two single-deletion K4 facts.

This checks only the logical transport

    K4(A \ {q}, c) and K4(A \ {w}, c)
      implies K4(A \ {q,w}, c).

It deliberately does not claim a model of the full geometric ATAIL packet.
Squared Euclidean distances are computed over ``Fraction``; equality classes
therefore exactly coincide with positive Euclidean-distance classes.
"""

from __future__ import annotations

import argparse
from collections import Counter
from fractions import Fraction

Point = tuple[Fraction, Fraction]


def point(x: int, y: int) -> Point:
    return Fraction(x), Fraction(y)


CENTER = point(0, 0)
INNER = frozenset({point(1, 0), point(-1, 0), point(0, 1), point(0, -1)})
OUTER = frozenset({point(2, 0), point(-2, 0), point(0, 2), point(0, -2)})
CARRIER = INNER | OUTER
Q = point(1, 0)
W = point(2, 0)


def squared_distance(a: Point, b: Point) -> Fraction:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def positive_radius_profile(carrier: frozenset[Point]) -> Counter[Fraction]:
    return Counter(
        squared_distance(CENTER, x)
        for x in carrier
        if squared_distance(CENTER, x) > 0
    )


def has_k4(carrier: frozenset[Point]) -> bool:
    return max(positive_radius_profile(carrier).values(), default=0) >= 4


def check() -> dict[str, object]:
    erase_q = CARRIER - {Q}
    erase_w = CARRIER - {W}
    erase_both = CARRIER - {Q, W}

    q_profile = positive_radius_profile(erase_q)
    w_profile = positive_radius_profile(erase_w)
    both_profile = positive_radius_profile(erase_both)

    assert q_profile == Counter({Fraction(4): 4, Fraction(1): 3})
    assert w_profile == Counter({Fraction(1): 4, Fraction(4): 3})
    assert both_profile == Counter({Fraction(1): 3, Fraction(4): 3})
    assert has_k4(erase_q)
    assert has_k4(erase_w)
    assert not has_k4(erase_both)

    return {
        "arithmetic": "exact rational squared Euclidean distance",
        "carrier_card": len(CARRIER),
        "erase_q_profile": dict(sorted(q_profile.items())),
        "erase_w_profile": dict(sorted(w_profile.items())),
        "erase_both_profile": dict(sorted(both_profile.items())),
        "separate_single_deletions_have_k4": True,
        "cumulative_deletion_has_k4": False,
        "scope": "pure deletion transport only; not the full ATAIL antecedent",
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    parser.parse_args()
    result = check()
    for key, value in result.items():
        print(f"{key}: {value}")


if __name__ == "__main__":
    main()
