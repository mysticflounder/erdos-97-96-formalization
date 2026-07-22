#!/usr/bin/env python3
"""Exact finite interval/support regression for the exact-five curvature route.

This checks the current exported incidence and interval consequences. It is
not a Euclidean realization or a Problem 97 counterexample.
"""

from itertools import combinations


PERIOD = 360
N = 13
CAP = set(range(5))
EDGE = [0, 5, 10, 15, 20, 110, 130, 150, 170, 190, 210, 230, 250]
SUPPORT = {
    0: {1, 6, 7, 8},
    1: {2, 6, 9, 10},
    2: {3, 6, 11, 12},
    3: {4, 7, 9, 11},
    4: {0, 7, 10, 12},
}


def after(center: int, vertex: int) -> int:
    return (vertex - center) % N


def edge_lift(index: int) -> int:
    quotient, residue = divmod(index, N)
    return EDGE[residue] + quotient * PERIOD


def row_arcs(center: int):
    order = sorted(SUPPORT[center], key=lambda vertex: after(center, vertex))
    offsets = [after(center, vertex) for vertex in order]
    assert 0 < offsets[0] < offsets[1] < offsets[2] < offsets[3] < N
    arcs = []
    for middle_offset in offsets[1:3]:
        middle = center + middle_offset
        arcs.append((edge_lift(center), edge_lift(middle - 1)))
        arcs.append((edge_lift(middle), edge_lift(center + N - 1)))
    return order, offsets, arcs


def outside_pairs(center: int):
    return set(combinations(sorted(SUPPORT[center] - CAP), 2))


def max_nonoverlap(base_arcs):
    copies = []
    for arc_id, (start, end) in enumerate(base_arcs):
        for shift in (-PERIOD, 0, PERIOD):
            copies.append((arc_id, start + shift, end + shift))
    best = ()
    for size in range(1, 5):
        for chosen in combinations(copies, size):
            if len({arc_id for arc_id, _, _ in chosen}) != size:
                continue
            ordered = tuple(sorted(chosen, key=lambda item: (item[1], item[2])))
            if any(ordered[i][2] > ordered[i + 1][1] for i in range(size - 1)):
                continue
            if ordered[-1][2] - ordered[0][1] > PERIOD:
                continue
            if size > len(best):
                best = ordered
    return best


def main():
    all_pairs = set()
    all_arcs = []
    for center in range(5):
        support = SUPPORT[center]
        assert len(support) == 4
        assert center not in support
        assert len(support & CAP) <= (1 if center in (0, 4) else 2)
        pairs = outside_pairs(center)
        assert all_pairs.isdisjoint(pairs)
        all_pairs |= pairs

        order, offsets, arcs = row_arcs(center)
        full_budget = edge_lift(center + N - 1) - edge_lift(center)
        assert full_budget < PERIOD
        assert all(end - start > PERIOD // 4 for start, end in arcs)
        all_arcs.extend(arcs)
        print(
            f"center={center} support={order} offsets={offsets} "
            f"arc_lengths={[end - start for start, end in arcs]} "
            f"full_budget={full_budget}"
        )

    best = max_nonoverlap(all_arcs)
    print(f"distinct_outside_pairs={sorted(all_pairs)}")
    print(f"max_nonoverlap={len(best)} witness={best}")
    assert len(best) == 3


if __name__ == "__main__":
    main()
