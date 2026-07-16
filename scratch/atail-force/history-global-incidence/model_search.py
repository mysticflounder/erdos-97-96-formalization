#!/usr/bin/env python3
"""Audit finite all-center row shadows augmented by one erased history pair.

This is theorem-discovery code.  It checks only the explicitly listed finite
incidence/equality consequences; it does not claim Euclidean realizability.
"""

from __future__ import annotations

import json
from itertools import combinations, permutations, product
from pathlib import Path


N = 12

# Current formalized-core survivor shard zero.
ROWS = (
    frozenset((1, 2, 3, 4)),
    frozenset((0, 2, 6, 7)),
    frozenset((0, 1, 9, 10)),
    frozenset((1, 4, 7, 11)),
    frozenset((3, 5, 6, 10)),
    frozenset((0, 3, 8, 11)),
    frozenset((2, 7, 8, 10)),
    frozenset((4, 6, 9, 11)),
    frozenset((3, 5, 7, 9)),
    frozenset((0, 4, 5, 10)),
    frozenset((2, 5, 8, 11)),
    frozenset((1, 6, 8, 9)),
)

BLOCKER = (1, 0, 0, 0, 0, 4, 7, 6, 5, 2, 2, 3)
APEX = 1
PAIR = (6, 7)
ORDER = (0, 9, 10, 11, 1, 3, 4, 5, 2, 6, 7, 8)


class UnionFind:
    def __init__(self, items: list[tuple[int, int]]) -> None:
        self.parent = {x: x for x in items}

    def find(self, x: tuple[int, int]) -> tuple[int, int]:
        while self.parent[x] != x:
            self.parent[x] = self.parent[self.parent[x]]
            x = self.parent[x]
        return x

    def union(self, x: tuple[int, int], y: tuple[int, int]) -> None:
        x, y = self.find(x), self.find(y)
        if x != y:
            self.parent[y] = x


def edge(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a <= b else (b, a)


def equality_classes(rows: tuple[frozenset[int], ...]) -> UnionFind:
    uf = UnionFind([edge(a, b) for a in range(N) for b in range(a, N)])
    for center, row in enumerate(rows):
        spokes = [edge(center, point) for point in row]
        for spoke in spokes[1:]:
            uf.union(spokes[0], spoke)
    return uf


def eq(uf: UnionFind, a: int, b: int, c: int, d: int) -> bool:
    return uf.find(edge(a, b)) == uf.find(edge(c, d))


def first_duplicate_center_core(uf: UnionFind):
    for p, q, r in combinations(range(N), 3):
        centers = [
            a
            for a in range(N)
            if eq(uf, a, p, a, q) and eq(uf, a, p, a, r)
        ]
        if len(centers) >= 2:
            return (p, q, r, centers[0], centers[1])
    return None


def first_exact_off_circle_core(
    uf: UnionFind, rows: tuple[frozenset[int], ...]
):
    for center, row in enumerate(rows):
        for support_point in row:
            for excluded in range(N):
                if excluded == center or excluded in row:
                    continue
                if eq(uf, center, support_point, center, excluded):
                    return (center, support_point, excluded)
    return None


def first_equal_k4_core(uf: UnionFind):
    for p, t1, t2, t3 in product(range(N), repeat=4):
        if p == t1:
            continue
        e = (p, t1)
        if all(
            eq(uf, *e, *other)
            for other in ((p, t2), (p, t3), (t1, t2), (t1, t3), (t2, t3))
        ):
            return (p, t1, t2, t3)
    return None


def first_equilateral_bisector_core(uf: UnionFind):
    for p, a, b, c, x in product(range(N), repeat=5):
        if p == a or p == x or c == b:
            continue
        base = (p, a)
        others = ((p, b), (p, c), (a, b), (a, x), (b, x))
        if all(eq(uf, *base, *other) for other in others) and eq(uf, c, x, c, a):
            return (p, a, b, c, x)
    return None


def first_three_triad_core(uf: UnionFind):
    for A, B, C, D, E in product(range(N), repeat=5):
        if A == B:
            continue
        if (
            eq(uf, B, C, B, D)
            and eq(uf, B, D, D, A)
            and eq(uf, C, A, C, D)
            and eq(uf, C, D, C, E)
            and eq(uf, E, A, E, B)
            and eq(uf, E, B, E, D)
        ):
            return (A, B, C, D, E)
    return None


def between(a: int, b: int, x: int, order: tuple[int, ...]) -> bool:
    """Strict cyclic interval from a to b in ``order``."""
    index = {label: position for position, label in enumerate(order)}
    return 0 < (index[x] - index[a]) % N < (index[b] - index[a]) % N


def first_bad_shared_pair(
    rows: tuple[frozenset[int], ...], order: tuple[int, ...] = tuple(range(N))
):
    for c1, c2 in combinations(range(N), 2):
        for x, y in combinations(rows[c1] & rows[c2], 2):
            if y in (c1, c2):
                continue
            if between(c1, c2, x, order) == between(c1, c2, y, order):
                return (c1, c2, x, y)
    return None


def audit() -> dict[str, object]:
    uf = equality_classes(ROWS)
    x, y = PAIR
    return {
        "row_cards": [len(row) for row in ROWS],
        "rows_omit_centers": all(c not in row for c, row in enumerate(ROWS)),
        "max_row_intersection": max(
            len(ROWS[a] & ROWS[b]) for a, b in combinations(range(N), 2)
        ),
        "blocker_nonfixed": all(BLOCKER[s] != s for s in range(N)),
        "source_in_blocker_row": all(s in ROWS[BLOCKER[s]] for s in range(N)),
        "history_pair_in_apex_row": {x, y} <= ROWS[APEX],
        "second_center_with_history_pair": next(
            (c for c in range(N) if c != APEX and {x, y} <= ROWS[c]), None
        ),
        "history_pair_common_blocker": BLOCKER[x] == BLOCKER[y],
        "history_pair_mutual_cross": y in ROWS[BLOCKER[x]] and x in ROWS[BLOCKER[y]],
        "duplicate_center_core": first_duplicate_center_core(uf),
        "exact_off_circle_core": first_exact_off_circle_core(uf, ROWS),
        "equal_k4_core": first_equal_k4_core(uf),
        "equilateral_bisector_core": first_equilateral_bisector_core(uf),
        "three_triad_core": first_three_triad_core(uf),
        "bad_shared_pair": first_bad_shared_pair(ROWS, ORDER),
    }


def find_blockers(
    rows: tuple[frozenset[int], ...], pair: tuple[int, int]
) -> tuple[int, ...] | None:
    """Choose exact critical blockers, separating and uncrossing ``pair``."""
    candidates = tuple(
        tuple(c for c, row in enumerate(rows) if source in row and c != source)
        for source in range(N)
    )
    x, y = pair
    for bx in candidates[x]:
        for by in candidates[y]:
            if bx == by or y in rows[bx] or x in rows[by]:
                continue
            result = [options[0] for options in candidates]
            result[x] = bx
            result[y] = by
            return tuple(result)
    return None


def scan_current_survivors() -> list[dict[str, object]]:
    checkpoint = Path(__file__).parents[1] / "second_center_query" / (
        "formalized_core_shards_after_seven_point_six_circle_checkpoint.json"
    )
    payload = json.loads(checkpoint.read_text())
    results: list[dict[str, object]] = []
    for case in payload["cases"]:
        rows = tuple(
            frozenset(row["support"])
            for row in case["survivor"]["distinct_metric_rows"]
        )
        order = tuple(case["survivor"]["frame"]["cyclic_order"])
        assert len(rows) == N
        for pair in combinations(rows[0], 2):
            if any(set(pair) <= rows[c] for c in range(1, N)):
                continue
            blockers = find_blockers(rows, pair)
            if blockers is None:
                continue
            uf = equality_classes(rows)
            results.append(
                {
                    "shard": case["partition"]["shard_index"],
                    "pair": pair,
                    "blockers": blockers,
                    "rows": rows,
                    "duplicate_center_core": first_duplicate_center_core(uf),
                    "equal_k4_core": first_equal_k4_core(uf),
                    "equilateral_bisector_core": first_equilateral_bisector_core(uf),
                    "three_triad_core": first_three_triad_core(uf),
                    "bad_shared_pair": first_bad_shared_pair(rows, order),
                }
            )
    return results


def bank_gap_history_alignments() -> list[dict[str, object]]:
    """Find U1 near-matches whose h4/h5 gap uses an off-S apex pair."""
    checkpoint = Path(__file__).parents[1] / "second_center_query" / (
        "formalized_core_shards_after_seven_point_six_circle_checkpoint.json"
    )
    payload = json.loads(checkpoint.read_text())
    aligned: list[dict[str, object]] = []
    for case in payload["cases"]:
        rows = tuple(
            frozenset(row["support"])
            for row in case["survivor"]["distinct_metric_rows"]
        )
        uf = equality_classes(rows)
        for assignment in permutations(range(N), 5):
            a, c, d, e, f = assignment
            fields = (
                eq(uf, c, a, c, d),
                eq(uf, c, a, c, f),
                eq(uf, d, c, d, e),
                eq(uf, d, c, d, f),
                eq(uf, f, a, f, d),
                eq(uf, f, a, f, e),
                eq(uf, e, a, e, c),
            )
            missing = tuple(i + 1 for i, present in enumerate(fields) if not present)
            # For surplus cap S, label 1 is oppApex1 and label 2 is
            # oppApex2.  History pairs are off S = {1,2,3,4,5}.
            first_apex = 1
            off_surplus = set(range(N)) - {1, 2, 3, 4, 5}
            candidates = []
            if missing == (4,):
                candidates.append(("h4", {c, f}, d))
            if missing == (5,):
                candidates.append(("h5", {a, d}, f))
            if missing == (5, 7):
                candidates.extend((
                    ("h5-of-h5+h7", {a, d}, f),
                    ("h7-of-h5+h7", {a, c}, e),
                ))
            for name, pair, second_center in candidates:
                if pair <= rows[first_apex] and pair <= off_surplus:
                    aligned.append({
                        "shard": case["partition"]["shard_index"],
                        "missing": name,
                        "whole_missing_set": missing,
                        "assignment_a_c_d_e_f": assignment,
                        "first_apex": first_apex,
                        "history_pair": tuple(sorted(pair)),
                        "wanted_second_center": second_center,
                    })
    return aligned


if __name__ == "__main__":
    for key, value in audit().items():
        print(f"{key}: {value}")
    print("current-survivor candidates:")
    for result in scan_current_survivors()[:20]:
        print(result)
    alignments = bank_gap_history_alignments()
    print(f"bank-gap/history alignments: {len(alignments)}")
    for result in alignments[:40]:
        print(result)
