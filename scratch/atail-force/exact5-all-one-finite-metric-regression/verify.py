"""Exact finite-metric regression for the exact-five allRowsOneHit arm.

This is deliberately not a Euclidean/MEC model. It verifies that all finite
metric, K4/minimality, critical-map, cap-incidence, robust-apex, retained-row,
and global-cover-star consequences used by the current branch are mutually
consistent. Hence any closing theorem must visibly use additional planar
Euclidean/MEC/noM44 structure.
"""

from fractions import Fraction
from itertools import combinations

A = frozenset(range(13))
O1, O2 = 11, 12

ROWS = {
    0: frozenset({1, 4, 8, 11}),
    1: frozenset({2, 8, 9, 11}),
    2: frozenset({0, 3, 5, 10}),
    3: frozenset({4, 5, 7, 9}),
    4: frozenset({1, 5, 6, 11}),
    5: frozenset({1, 6, 8, 12}),
    6: frozenset({1, 3, 7, 10}),
    7: frozenset({4, 5, 8, 12}),
    8: frozenset({3, 4, 6, 9}),
    9: frozenset({4, 6, 7, 10}),
    10: frozenset({0, 5, 11, 12}),
    11: frozenset({2, 3, 5, 6, 7, 8}),
    12: frozenset({0, 1, 2, 6, 9}),
}

# Fixed total singleton-critical choice.
H = {0: 10, 11: 10, 12: 10, **{i: i - 1 for i in range(1, 11)}}

# Abstract closed-cap partition: cardinalities (5,6,5), with P the strict
# interior of the exact-five second cap.
C0 = frozenset({11, 7, 8, 9, 12})
C1 = frozenset({12, 3, 4, 5, 6, 10})
C2 = frozenset({10, 0, 1, 2, 11})
CAPS = (C0, C1, C2)
P = frozenset({0, 1, 2})

q, w = 3, 5
B1 = frozenset({2, 5, 6, 7})
B2 = frozenset({0, 1, 2, 6})


def radius(c: int) -> Fraction:
    return Fraction(1000 + c, 1000)


PAIR_RANK = {pair: i for i, pair in enumerate(combinations(sorted(A), 2), 1)}


def dist(a: int, b: int) -> Fraction:
    if a == b:
        return Fraction(0)
    if b in ROWS[a]:
        return radius(a)
    if a in ROWS[b]:
        return radius(b)
    return Fraction(11, 10) + Fraction(PAIR_RANK[tuple(sorted((a, b)))], 100000)


def classes_at(c: int) -> dict[Fraction, frozenset[int]]:
    result: dict[Fraction, set[int]] = {}
    for x in A - {c}:
        result.setdefault(dist(c, x), set()).add(x)
    return {r: frozenset(xs) for r, xs in result.items()}


def has_k4(carrier: frozenset[int], c: int) -> bool:
    return any(len(xs & carrier) >= 4 for xs in classes_at(c).values())


def main() -> None:
    assert set(ROWS) == set(A)
    assert all(c not in ROWS[c] for c in A)
    assert all(not (b in ROWS[a] and a in ROWS[b]) for a, b in combinations(A, 2))
    assert all(dist(a, b) == dist(b, a) for a in A for b in A)
    assert all(dist(a, b) > 0 for a, b in combinations(A, 2))
    assert all(
        dist(a, c) < dist(a, b) + dist(b, c)
        for a, b, c in combinations(A, 3)
    )

    # Each displayed row is the unique radius class of size >= 4 at its center.
    for c in A:
        large = [xs for xs in classes_at(c).values() if len(xs) >= 4]
        assert large == [ROWS[c]]

    # K4 holds globally and no proper nonempty subset is witness-closed.
    assert all(has_k4(A, c) for c in A)
    ordered = sorted(A)
    for mask in range(1, (1 << len(ordered)) - 1):
        carrier = frozenset(ordered[i] for i in range(len(ordered)) if mask >> i & 1)
        assert not all(has_k4(carrier, c) for c in carrier)

    # H is total singleton-critical: its exact four-class contains the source.
    assert all(H[x] not in {O1, O2} for x in A)
    assert all(x in ROWS[H[x]] and len(ROWS[H[x]]) == 4 for x in A)
    assert all(not has_k4(A - {x}, H[x]) for x in A)

    # Abstract cap partition and the standard two-circle/cap-hit shadows.
    assert set().union(*CAPS) == set(A)
    assert [len(c) for c in CAPS] == [5, 6, 5]
    assert sum(map(len, CAPS)) == len(A) + 3
    assert P == C2 - {10, 11}
    assert all(len(ROWS[a] & ROWS[b]) <= 2 for a, b in combinations(A, 2))
    assert all(len(ROWS[c] & cap) <= 2 for cap in CAPS for c in cap)

    # Exact-five profile at O2 and all-one actual rows on its physical triple.
    assert len(ROWS[O2]) == 5 and P <= ROWS[O2]
    assert all(ROWS[H[p]] & P == {p} for p in P)
    assert len({H[p] for p in P}) == 3

    # Both apices are robust under every singleton deletion.
    assert all(has_k4(A - {x}, O1) and has_k4(A - {x}, O2) for x in A)

    # Retained pair and q-deleted rows satisfy the parent residual shadows.
    assert q != w and q not in C0 and w not in C0
    assert dist(O1, q) == dist(O1, w)
    assert has_k4(A - {q, w}, O1) and has_k4(A - {q, w}, O2)
    assert B1 <= A - {q} and B2 <= A - {q}
    assert len(B1) == len(B2) == 4 and len(B1 & B2) == 2
    assert all(dist(O1, x) == dist(O1, next(iter(B1))) for x in B1)
    assert all(dist(O2, x) == dist(O2, next(iter(B2))) for x in B2)
    assert H[q] not in {O1, O2}

    # Cover-star hub 0, spokes 1 and 2: at every center, deleting at least one
    # endpoint of each edge preserves a K4 witness.
    for c in A:
        assert has_k4(A - {0}, c) or has_k4(A - {1}, c)
        assert has_k4(A - {0}, c) or has_k4(A - {2}, c)

    # The only nontrivial H-fiber has no distinct second row through any pair.
    fiber = frozenset(x for x in A if H[x] == 10)
    assert fiber == {0, 11, 12}
    assert all(len(ROWS[c] & fiber) <= 1 for c in A - {10})

    # Nor can its ordered-core arm start: no member C of this fiber has a
    # distinct J co-radial with it at O1.
    assert all(
        not any(j != c and dist(O1, j) == dist(O1, c) for j in A)
        for c in fiber
    )

    print("PASS exact-five allRowsOneHit finite-metric regression")
    print("carrier=13 caps=(5,6,5) physical={0,1,2} star=(0;1,2)")
    print("retained=(q,w)=(3,5) H-fiber(10)={0,11,12}")


if __name__ == "__main__":
    main()
