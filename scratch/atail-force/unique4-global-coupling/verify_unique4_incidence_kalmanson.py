#!/usr/bin/env python3
"""Audit the old unique-four incidence fixture against strict Kalmanson order.

This is an exact finite equality/order check.  It is not a Euclidean model.
The cap completion is stated explicitly because the original Lean fixture
records only the six-point cap and the three cap cardinalities, not the other
two cap memberships.
"""

from __future__ import annotations

from collections import Counter
from itertools import combinations, permutations


LABELS = tuple(range(12))
ROWS = (
    frozenset((5, 6, 7, 8)),
    frozenset((0, 2, 7, 9)),
    frozenset((1, 3, 7, 10)),
    frozenset((2, 4, 8, 9)),
    frozenset((3, 5, 8, 10)),
    frozenset((0, 6, 9, 10)),
    frozenset((0, 1, 2, 3)),
    frozenset((0, 1, 4, 5)),
    frozenset((0, 1, 6, 7)),
    frozenset((0, 1, 8, 10)),
    frozenset((0, 1, 9, 11)),
    frozenset((0, 2, 4, 6)),
)

# Source-faithful natural completion of the named roles in the old fixture:
# 0,5,6 are the Moser vertices; 7,8 are the stipulated strict interior of
# the exact-four first opposite cap.  The other strict blocks have sizes four
# and three, giving the recorded closed-cap profile (6,4,5).
CAP0 = (0, (1, 2, 3, 4), 5)
CAP1 = (5, (7, 8), 6)
CAP2 = (6, (9, 10, 11), 0)


def edge(a: int, b: int) -> tuple[int, int]:
    assert a != b
    return (a, b) if a < b else (b, a)


EDGES = tuple(combinations(LABELS, 2))


class DSU:
    def __init__(self) -> None:
        self.parent = {e: e for e in EDGES}

    def find(self, x: tuple[int, int]) -> tuple[int, int]:
        while self.parent[x] != x:
            self.parent[x] = self.parent[self.parent[x]]
            x = self.parent[x]
        return x

    def union(self, x: tuple[int, int], y: tuple[int, int]) -> None:
        x = self.find(x)
        y = self.find(y)
        if x != y:
            self.parent[y] = x


def quotient_for_centers(centers: tuple[int, ...]) -> DSU:
    dsu = DSU()
    for center in centers:
        row_edges = [edge(center, target) for target in ROWS[center]]
        for other in row_edges[1:]:
            dsu.union(row_edges[0], other)
    return dsu


SUPPORT_QUOTIENTS = [
    (support, quotient_for_centers(support))
    for size in range(1, len(LABELS) + 1)
    for support in combinations(LABELS, size)
]


def forced_equal_sum(
    dsu: DSU,
    lhs: tuple[tuple[int, int], tuple[int, int]],
    rhs: tuple[tuple[int, int], tuple[int, int]],
) -> bool:
    return sorted(dsu.find(term) for term in lhs) == sorted(
        dsu.find(term) for term in rhs
    )


def minimal_row_support(
    lhs: tuple[tuple[int, int], tuple[int, int]],
    rhs: tuple[tuple[int, int], tuple[int, int]],
) -> tuple[int, ...]:
    for support, dsu in SUPPORT_QUOTIENTS:
        if forced_equal_sum(dsu, lhs, rhs):
            return support
    raise AssertionError("full row quotient forced equality without a row core")


def within_cap_orders():
    for p0 in permutations(CAP0[1]):
        for p1 in permutations(CAP1[1]):
            for p2 in permutations(CAP2[1]):
                yield (CAP0[0], *p0, CAP0[2], *p1, CAP1[2], *p2)


def strict_kalmanson_core(order: tuple[int, ...]):
    full = quotient_for_centers(LABELS)
    for ia, ib, ic, id_ in combinations(range(len(order)), 4):
        a, b, c, d = order[ia], order[ib], order[ic], order[id_]
        diagonal = (edge(a, c), edge(b, d))
        sides = (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        )
        for inequality, side in enumerate(sides, start=1):
            if forced_equal_sum(full, diagonal, side):
                return (a, b, c, d), inequality, minimal_row_support(diagonal, side)
    return None


def main() -> None:
    cap_sets = [
        frozenset((CAP0[0], *CAP0[1], CAP0[2])),
        frozenset((CAP1[0], *CAP1[1], CAP1[2])),
        frozenset((CAP2[0], *CAP2[1], CAP2[2])),
    ]
    assert tuple(map(len, cap_sets)) == (6, 4, 5)
    assert set().union(*cap_sets) == set(LABELS)
    assert cap_sets[0] & cap_sets[1] == {5}
    assert cap_sets[1] & cap_sets[2] == {6}
    assert cap_sets[2] & cap_sets[0] == {0}
    assert {7, 8} == set(CAP1[1])

    orders = list(within_cap_orders())
    assert len(orders) == 288
    results = [(order, strict_kalmanson_core(order)) for order in orders]
    assert all(core is not None for _, core in results)

    supports = sorted({core[2] for _, core in results if core is not None})
    core_counts = Counter(
        (core[0], core[1]) for _, core in results if core is not None
    )
    assert core_counts == Counter(
        {
            ((0, 1, 5, 7), 1): 72,
            ((0, 2, 1, 7), 2): 72,
            ((0, 3, 8, 6), 2): 72,
            ((0, 4, 5, 7), 2): 36,
            ((0, 4, 5, 8), 2): 36,
        }
    )
    example_order = next(order for order in orders if order[:2] == (0, 1))
    example_core = strict_kalmanson_core(example_order)
    assert example_core is not None

    print("PASS: old unique-four globalRowFour is strict-Kalmanson impossible")
    print(f"within_cap_orders={len(orders)} killed={len(results)}")
    print(f"minimal_row_supports={supports}")
    print(f"first_core_counts={sorted(core_counts.items())}")
    print(f"example_order={example_order}")
    print(f"example_core={example_core}")


if __name__ == "__main__":
    main()
