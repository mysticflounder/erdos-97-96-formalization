#!/usr/bin/env python3
"""Exact checker for the 13-point exact-five finite-metric regression.

This is deliberately a finite-metric/model audit, not a Euclidean
realizability checker and not a model of CounterexampleData.
"""

from __future__ import annotations

import argparse
from collections import defaultdict
from fractions import Fraction
from itertools import combinations


A = frozenset(range(13))
O1, O2 = 11, 12

CLASSES = {
    0: frozenset({1, 2, 3, 4}),
    1: frozenset({2, 4, 9, 11}),
    2: frozenset({3, 6, 9, 10}),
    3: frozenset({1, 4, 9, 10}),
    4: frozenset({5, 8, 9, 10}),
    5: frozenset({1, 6, 7, 10}),
    6: frozenset({1, 4, 7, 8}),
    7: frozenset({1, 2, 8, 10}),
    8: frozenset({1, 3, 5, 9}),
    9: frozenset({0, 5, 6, 10}),
    10: frozenset({0, 6, 11, 12}),
    O1: frozenset({2, 3, 5, 6, 7, 8}),
    O2: frozenset({0, 1, 2, 6, 9}),
}

H = {0: 10, 11: 10, 12: 10, **{i: i - 1 for i in range(1, 11)}}

C0 = frozenset({11, 7, 8, 9, 12})
C1 = frozenset({12, 3, 4, 5, 6, 10})
C2 = frozenset({10, 0, 1, 2, 11})
CAPS = (C0, C1, C2)
P = frozenset({0, 1, 2})

Q, W = 3, 5
B1 = frozenset({2, 5, 6, 7})
B2 = frozenset({0, 1, 2, 6})

HUB, SPOKE1, SPOKE2 = 0, 1, 2

PAIRS = tuple(combinations(sorted(A), 2))
PAIR_RANK = {pair: rank for rank, pair in enumerate(PAIRS)}


def radius(center: int) -> Fraction:
    return Fraction(1000 + center, 1000)


def pair_key(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a < b else (b, a)


def dist(a: int, b: int) -> Fraction:
    if a == b:
        return Fraction(0)
    if b in CLASSES[a]:
        return radius(a)
    if a in CLASSES[b]:
        return radius(b)
    return Fraction(21, 20) + Fraction(PAIR_RANK[pair_key(a, b)], 100000)


def distance_classes(
    center: int, carrier: frozenset[int] = A
) -> list[frozenset[int]]:
    fibers: dict[Fraction, set[int]] = defaultdict(set)
    for x in carrier:
        if x != center:
            fibers[dist(center, x)].add(x)
    return [frozenset(xs) for xs in fibers.values()]


def has_k4_at(center: int, carrier: frozenset[int] = A) -> bool:
    return any(len(xs) >= 4 for xs in distance_classes(center, carrier))


def witness_closed(carrier: frozenset[int]) -> bool:
    return bool(carrier) and all(has_k4_at(center, carrier) for center in carrier)


def deletion_survives(center: int, deleted: int) -> bool:
    return has_k4_at(center, A - {deleted})


def check() -> None:
    assert set(CLASSES) == set(A)
    assert set(H) == set(A)
    assert len(PAIRS) == 78
    assert all(center not in shell for center, shell in CLASSES.items())
    assert len(CLASSES[O1]) == 6
    assert len(CLASSES[O2]) == 5
    assert all(len(CLASSES[c]) == 4 for c in range(11))

    # No directed class incidence is mutual; this makes dist well-defined.
    assert all(
        not (b in CLASSES[a] and a in CLASSES[b])
        for a, b in combinations(sorted(A), 2)
    )

    # Exact symmetric metric with strict triangle inequalities.
    assert all(dist(a, b) == dist(b, a) for a in A for b in A)
    assert all(dist(a, b) > 0 for a, b in PAIRS)
    assert all(
        dist(a, c) < dist(a, b) + dist(b, c)
        for a in A
        for b in A
        for c in A
        if len({a, b, c}) == 3
    )

    # Each displayed shell is the unique radius class of cardinality >= 4.
    for center in A:
        large = [xs for xs in distance_classes(center) if len(xs) >= 4]
        assert large == [CLASSES[center]], (center, large, CLASSES[center])

    # Global K4 and a total source-faithful deletion-critical map.
    assert all(has_k4_at(center) for center in A)
    assert all(H[source] != source for source in A)
    for source in A:
        blocker = H[source]
        assert source in CLASSES[blocker]
        assert not has_k4_at(blocker, A - {source})

    # Both opposite apices are fully singleton-deletion robust, and the
    # retained frontier pair can be deleted simultaneously at both.
    for apex in (O1, O2):
        assert all(deletion_survives(apex, deleted) for deleted in A)
        assert has_k4_at(apex, A - {Q, W})

    # Abstract cardinal minimality: no nonempty proper subcarrier has K4 at
    # each of its own centers.
    proper_witness_closed = []
    ordered = sorted(A)
    for mask in range(1, (1 << len(ordered)) - 1):
        carrier = frozenset(
            ordered[i] for i in range(len(ordered)) if mask & (1 << i)
        )
        if witness_closed(carrier):
            proper_witness_closed.append(carrier)
    assert not proper_witness_closed, proper_witness_closed[:5]

    # Abstract cap partition and exact-five physical strict part.
    assert frozenset().union(*CAPS) == A
    assert tuple(map(len, CAPS)) == (5, 6, 5)
    assert C0 & C1 == {12}
    assert C1 & C2 == {10}
    assert C2 & C0 == {11}
    assert P == C2 - {10, 11}
    assert P <= CLASSES[O2]

    # Pairwise two-circle and same-cap hit shadows.
    assert all(
        len(CLASSES[a] & CLASSES[b]) <= 2
        for a, b in combinations(sorted(A), 2)
    )
    assert all(
        len(CLASSES[center] & cap) <= 2
        for cap in CAPS
        for center in cap
    )

    # Retained parent rows and q,w deletion roles.
    assert Q != W and {Q, W} <= CLASSES[O1]
    assert len(CLASSES[O1] - {Q, W}) == 4
    assert not ({Q, W} & CLASSES[O2])
    assert len(B1) == len(B2) == 4
    assert B1 <= CLASSES[O1] - {Q}
    assert B2 <= CLASSES[O2] - {Q}
    assert B1 & B2 == {2, 6}

    # Each star edge covers every possible center by survival of at least one
    # endpoint deletion.
    for spoke in (SPOKE1, SPOKE2):
        assert all(
            deletion_survives(center, HUB) or deletion_survives(center, spoke)
            for center in A
        )

    # The asymmetric two-hit normal form occurs at spoke 1.
    assert CLASSES[H[HUB]] & P == {HUB}
    assert CLASSES[H[SPOKE1]] & P == {SPOKE1, SPOKE2}
    assert CLASSES[H[SPOKE2]] & P == {SPOKE2}
    outside_pair = CLASSES[H[SPOKE1]] - C2
    assert outside_pair == {3, 4}
    assert [c for c in A if outside_pair <= CLASSES[c]] == [H[SPOKE1]]
    a, b = sorted(outside_pair)
    assert dist(O1, a) != dist(O1, b)
    assert not outside_pair <= B1

    # The forced nontrivial critical fiber has no source-faithful second
    # displayed class through a pair, and cannot start the ordered core at O1.
    fiber = frozenset(source for source in A if H[source] == 10)
    assert fiber == {0, 11, 12}
    second_centers = [
        center
        for center in A - {10}
        if len(CLASSES[center] & fiber) >= 2
    ]
    assert not second_centers
    assert not (CLASSES[O1] & fiber)

    print("PASS exact-13 finite-metric parent-role model")
    print("minimal proper witness-closed subsets: 0")
    print("strict metric / unique K4 classes / pairwise intersections / cap hits: PASS")
    print(f"asymmetric outside pair: {sorted(outside_pair)} first-apex equal? False")
    print(f"critical fiber: {sorted(fiber)} second classes through a fiber pair: []")
    print("scope: exact finite metric only; planar Euclidean/convex/MEC/noM44 not checked")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--check",
        action="store_true",
        help="run all exact assertions and print the regression summary",
    )
    args = parser.parse_args()
    if not args.check:
        parser.error("pass --check to run the regression")
    check()


if __name__ == "__main__":
    main()
