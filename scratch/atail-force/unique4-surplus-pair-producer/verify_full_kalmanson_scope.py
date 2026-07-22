#!/usr/bin/env python3
"""Exact full-order Kalmanson audit of the unique-four incidence guard.

The represented carrier has three closed cyclic cap blocks of cardinalities
6, 4, and 5, sharing only the three Moser vertices.  The strict block sizes
are therefore 4, 2, and 3.  The named roles in the Lean guard fix the three
blocks; this script enumerates every within-block order in both orientations.

For every cyclic order it quotients all distance variables by every equality
from all twelve represented four-point rows.  It then checks every cyclic
quadruple and both strict Kalmanson inequalities.  If an inequality has equal
sides in the quotient, that order is impossible over the reals.

This is an exact finite linear-order certificate for this fixed incidence
guard.  It is not a coverage theorem for `OriginalUniqueFourResidual`.
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

# Closed cap blocks are
#   C0 = 0 -- (1,2,3,4) -- 5,
#   C1 = 5 -- (7,8)     -- 6,
#   C2 = 6 -- (9,10,11) -- 0.
# Their sizes are (6,4,5), their union is the full carrier, and pairwise
# intersections are precisely the named endpoints.
BLOCK0 = (1, 2, 3, 4)
BLOCK1 = (7, 8)
BLOCK2 = (9, 10, 11)


def edge(first: int, second: int) -> tuple[int, int]:
    if first == second:
        raise AssertionError("distance variables require distinct endpoints")
    return (first, second) if first < second else (second, first)


EDGES = tuple(combinations(LABELS, 2))


class DisjointSet:
    def __init__(self) -> None:
        self.parent = {item: item for item in EDGES}

    def find(self, item: tuple[int, int]) -> tuple[int, int]:
        root = item
        while self.parent[root] != root:
            root = self.parent[root]
        while self.parent[item] != item:
            parent = self.parent[item]
            self.parent[item] = root
            item = parent
        return root

    def union(self, first: tuple[int, int], second: tuple[int, int]) -> None:
        first_root = self.find(first)
        second_root = self.find(second)
        if first_root != second_root:
            self.parent[second_root] = first_root


def row_quotient(centers: tuple[int, ...]) -> DisjointSet:
    quotient = DisjointSet()
    for center in centers:
        terms = tuple(edge(center, target) for target in ROWS[center])
        assert len(terms) == 4
        for term in terms[1:]:
            quotient.union(terms[0], term)
    return quotient


FULL_QUOTIENT = row_quotient(LABELS)
SUPPORT_QUOTIENTS = tuple(
    (support, row_quotient(support))
    for size in range(1, len(LABELS) + 1)
    for support in combinations(LABELS, size)
)


def equal_sum(
    quotient: DisjointSet,
    left: tuple[tuple[int, int], tuple[int, int]],
    right: tuple[tuple[int, int], tuple[int, int]],
) -> bool:
    return sorted(quotient.find(term) for term in left) == sorted(
        quotient.find(term) for term in right
    )


def minimal_row_core(
    left: tuple[tuple[int, int], tuple[int, int]],
    right: tuple[tuple[int, int], tuple[int, int]],
) -> tuple[int, ...]:
    for support, quotient in SUPPORT_QUOTIENTS:
        if equal_sum(quotient, left, right):
            return support
    raise AssertionError("full row quotient equality has no row support")


def orders_in_positive_orientation():
    for block0 in permutations(BLOCK0):
        for block1 in permutations(BLOCK1):
            for block2 in permutations(BLOCK2):
                yield (0, *block0, 5, *block1, 6, *block2)


def all_oriented_orders():
    for order in orders_in_positive_orientation():
        yield "positive", order
        # Reverse the same cyclic order while retaining the cut at label 0.
        yield "negative", (order[0], *reversed(order[1:]))


def first_strict_kalmanson_equality(order: tuple[int, ...]):
    for ia, ib, ic, id_ in combinations(range(len(order)), 4):
        a, b, c, d = order[ia], order[ib], order[ic], order[id_]
        diagonals = (edge(a, c), edge(b, d))
        side_pairs = (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        )
        for inequality, side_pair in enumerate(side_pairs, start=1):
            if equal_sum(FULL_QUOTIENT, diagonals, side_pair):
                return {
                    "quadruple": (a, b, c, d),
                    "inequality": inequality,
                    "row_core": minimal_row_core(diagonals, side_pair),
                }
    return None


def check_fixture() -> None:
    cap0 = frozenset((0, *BLOCK0, 5))
    cap1 = frozenset((5, *BLOCK1, 6))
    cap2 = frozenset((6, *BLOCK2, 0))
    assert tuple(map(len, (cap0, cap1, cap2))) == (6, 4, 5)
    assert cap0 | cap1 | cap2 == frozenset(LABELS)
    assert cap0 & cap1 == {5}
    assert cap1 & cap2 == {6}
    assert cap2 & cap0 == {0}
    assert all(len(row) == 4 and center not in row for center, row in enumerate(ROWS))


def main() -> None:
    check_fixture()
    results = []
    for orientation, order in all_oriented_orders():
        core = first_strict_kalmanson_equality(order)
        if core is None:
            raise AssertionError(f"Kalmanson-feasible order escaped: {orientation} {order}")
        results.append((orientation, order, core))

    orientation_counts = Counter(orientation for orientation, _, _ in results)
    row_core_counts = Counter(tuple(core["row_core"]) for _, _, core in results)
    first_signature_counts = Counter(
        (orientation, tuple(core["quadruple"]), core["inequality"])
        for orientation, _, core in results
    )
    assert orientation_counts == {"positive": 288, "negative": 288}
    assert len(results) == 576

    print("PASS: full unique-four incidence guard is strict-Kalmanson impossible")
    print("orders_checked=576 positive=288 negative=288 killed=576")
    print(f"distinct_minimal_row_cores={len(row_core_counts)}")
    print(f"minimal_row_core_counts={sorted(row_core_counts.items())}")
    print(f"distinct_first_signatures={len(first_signature_counts)}")
    print(f"first_signature_counts={sorted(first_signature_counts.items())}")


if __name__ == "__main__":
    main()
