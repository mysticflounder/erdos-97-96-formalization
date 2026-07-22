#!/usr/bin/env python3
"""Exact strict-Kalmanson audit of the saved 15-role finite fixture.

The companion fixture is intentionally only a finite radius/incidence model.
This check asks whether its declared distance equalities can coexist with the
cyclic order forced by its three cap sets.  It uses only equality closure and
the two strict Kalmanson inequalities; no floating point or solver is used.
"""

from __future__ import annotations

from collections import Counter
from itertools import combinations, permutations

from verify_reoriented_unique5_abstract_countermodel import (
    CARRIER_ROW,
    CRITICAL_SUPPORT,
    NEW_FIRST_APEX,
    NEW_SECOND_APEX,
    ORIGINAL_FIRST_EXACT_FIVE,
    ORIGINAL_SECOND_RADIUS_CLASSES,
    PHYSICAL_ORDER,
    SURPLUS_CAP,
    NEW_FIRST_OPPOSITE_CAP,
)


CARRIER_CARD = 15
PAIR_LIST = list(combinations(range(CARRIER_CARD), 2))
PAIR_INDEX = {pair: index for index, pair in enumerate(PAIR_LIST)}


def pair_index(a: int, b: int) -> int:
    assert a != b
    return PAIR_INDEX[tuple(sorted((a, b)))]


class DisjointSet:
    def __init__(self, size: int) -> None:
        self.parent = list(range(size))

    def find(self, item: int) -> int:
        if self.parent[item] != item:
            self.parent[item] = self.find(self.parent[item])
        return self.parent[item]

    def union(self, left: int, right: int) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def distance_equality_quotient() -> DisjointSet:
    quotient = DisjointSet(len(PAIR_LIST))
    radius_classes: dict[int, list[frozenset[int]]] = {
        NEW_SECOND_APEX: [ORIGINAL_FIRST_EXACT_FIVE],
        NEW_FIRST_APEX: list(ORIGINAL_SECOND_RADIUS_CLASSES),
    }
    for center, support in CARRIER_ROW.items():
        radius_classes.setdefault(center, []).append(support)
    for center, support in CRITICAL_SUPPORT.items():
        radius_classes.setdefault(center, []).append(support)

    for center, classes in radius_classes.items():
        for radius_class in classes:
            points = sorted(radius_class)
            for point in points[1:]:
                quotient.union(
                    pair_index(center, points[0]),
                    pair_index(center, point),
                )
    return quotient


def first_equal_sum_core(
    order: tuple[int, ...], quotient: DisjointSet
) -> tuple[int, int, int, int, int] | None:
    """Return a strict Kalmanson inequality whose two sides quotient equally.

    The last result component is 1 or 2 for

      d(a,c) + d(b,d) > d(a,b) + d(c,d),
      d(a,c) + d(b,d) > d(a,d) + d(b,c).
    """

    for i, j, k, ell in combinations(range(CARRIER_CARD), 4):
        a, b, c, d = order[i], order[j], order[k], order[ell]
        left = sorted(
            (
                quotient.find(pair_index(a, c)),
                quotient.find(pair_index(b, d)),
            )
        )
        right_one = sorted(
            (
                quotient.find(pair_index(a, b)),
                quotient.find(pair_index(c, d)),
            )
        )
        if left == right_one:
            return (a, b, c, d, 1)
        right_two = sorted(
            (
                quotient.find(pair_index(a, d)),
                quotient.find(pair_index(b, c)),
            )
        )
        if left == right_two:
            return (a, b, c, d, 2)
    return None


def check() -> Counter[tuple[int, int, int, int, int]]:
    surplus_interior = tuple(sorted(SURPLUS_CAP - {0, 1}))
    first_opposite_interior = tuple(
        sorted(NEW_FIRST_OPPOSITE_CAP - {1, 2})
    )
    physical_interior = tuple(PHYSICAL_ORDER[1:-1])
    assert set(physical_interior) == {4, 11, 12, 13, 14}

    quotient = distance_equality_quotient()
    cores: Counter[tuple[int, int, int, int, int]] = Counter()
    for surplus_order in permutations(surplus_interior):
        for first_opposite_order in permutations(first_opposite_interior):
            order = (
                0,
                *surplus_order,
                1,
                *first_opposite_order,
                2,
                *physical_interior,
            )
            assert len(order) == CARRIER_CARD
            assert len(set(order)) == CARRIER_CARD
            core = first_equal_sum_core(order, quotient)
            assert core is not None
            cores[core] += 1
    assert sum(cores.values()) == 144
    return cores


if __name__ == "__main__":
    result = check()
    print("PASS: every cap-compatible cyclic order is strict-Kalmanson UNSAT")
    print("status=EXACT_FINITE_EQUALITY_QUOTIENT_NOT_EUCLIDEAN")
    print(f"orders=144 core_signatures={len(result)}")
    for core, count in sorted(result.items()):
        print(f"core={core} count={count}")
