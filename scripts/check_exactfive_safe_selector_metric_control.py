# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact finite-metric negative control, NOT a planar/Lean counterexample.

The large-distance graph is the square of a 13-cycle plus edge {0,6}.
Every other unordered pair has a different rational distance between 1
and 1.1. Rich radius classes, deletion witnesses, and proper-subset
minimality are checked from the distance matrix, not from graph degrees.

Cap/triangle names below are only labels. Known planar constraints fail;
the output deliberately records that failure instead of promoting it.
No solver, generated files, or floating-point arithmetic is used.
"""

import json
from collections import defaultdict
from fractions import Fraction
from itertools import combinations, permutations

N = 13
A = frozenset(range(N))
O, V = 0, 6
Q, W = 1, 2
BLOCKER = 4
RADIUS = Fraction(3, 2)
E = frozenset({1, 2, 6, 11, 12})
B = frozenset({2, 3, 5, 6})
L = frozenset({0, 4, 5, 7})
TRIANGLE_LABELS = frozenset({O, V, 5})
INTERIOR_LABELS = frozenset({Q, W, 11})
CAP_LABELS = INTERIOR_LABELS | {V, 5}
H = (1, 3, 4, 1, 2, 3, 4, 5, 7, 7, 8, 9, 1)


def distance_matrix() -> tuple[tuple[Fraction, ...], ...]:
    """Construct the explicitly rational symmetric metric candidate."""
    matrix = [[Fraction(0) for _ in A] for _ in A]
    for index, (i, j) in enumerate(combinations(range(N), 2), start=1):
        cycle_edge = (j - i) % N in {1, 2, N - 1, N - 2}
        distance = (
            RADIUS if cycle_edge or (i, j) == (O, V) else Fraction(1000 + index, 1000)
        )
        matrix[i][j] = matrix[j][i] = distance
    return tuple(tuple(row) for row in matrix)


def radius_classes(matrix, center, carrier):
    """Read positive-radius classes directly from the matrix on this carrier."""
    classes = defaultdict(set)
    for point in carrier:
        if matrix[center][point] > 0:
            classes[matrix[center][point]].add(point)
    return dict(classes)


def rich_classes(matrix, center, carrier):
    return {
        radius: row
        for radius, row in radius_classes(matrix, center, carrier).items()
        if len(row) >= 4
    }


def has_k4(matrix, center, carrier):
    return bool(rich_classes(matrix, center, carrier))


def verify(matrix=None) -> dict:
    """Check all retained metric/source claims and expose geometric failures."""
    matrix = distance_matrix() if matrix is None else matrix
    for i in A:
        assert matrix[i][i] == 0, "diagonal"
        for j in A - {i}:
            assert matrix[i][j] > 0, "positivity"
            assert matrix[i][j] == matrix[j][i], "symmetry"
    for i, j, k in permutations(range(N), 3):
        assert matrix[i][k] < matrix[i][j] + matrix[j][k], "triangle inequality"

    assert all(has_k4(matrix, center, A) for center in A), "global metric K4"
    proper_subsets = 0
    for mask in range(1, (1 << N) - 1):
        subset = {i for i in A if mask & (1 << i)}
        assert any(not has_k4(matrix, center, subset) for center in subset), (
            "metric cardinal minimality"
        )
        proper_subsets += 1

    actual_rows = []
    for source, center in enumerate(H):
        assert center in A - {source}, "actual center membership"
        rich = rich_classes(matrix, center, A)
        assert len(rich) == 1, "unique actual rich radius"
        row = next(iter(rich.values()))
        assert len(row) == 4 and source in row, "exact actual row/source membership"
        assert not has_k4(matrix, center, A - {source}), "actual deletion failure"
        actual_rows.append(row)

    assert rich_classes(matrix, O, A) == {RADIUS: set(E)}, "exact unique first class"
    assert actual_rows[W] == B and H[W] == BLOCKER, "retained actual row"
    assert H[Q] != H[W], "distinct endpoint blockers"
    assert Q not in B and W in B, "directed cross-deletion survival"
    assert W not in L and Q not in L, "joint omission from second row"
    assert L <= radius_classes(matrix, V, A)[RADIUS], "selected second row"
    assert len(L) == len(B) == 4 and O not in E and V not in L and BLOCKER not in B
    assert all(has_k4(matrix, apex, A - {source}) for apex in (O, V) for source in A), (
        "robust apices"
    )
    assert not has_k4(matrix, O, A - {Q, W}), "first-apex double deletion"
    assert has_k4(matrix, V, A - {Q, W}), "second-apex joint survival"
    assert (E - {Q}) <= radius_classes(matrix, O, A - {Q})[RADIUS]
    assert E - {W} <= radius_classes(matrix, O, A - {W})[RADIUS]

    all_rich = [rich_classes(matrix, center, A) for center in A]
    assert all(len(classes) == 1 for classes in all_rich), (
        "all rich classes accounted for"
    )
    rich_rows = [next(iter(classes.values())) for classes in all_rich]
    assert all(len(left & right) <= 2 for left, right in combinations(rich_rows, 2)), (
        "rich-row intersections"
    )
    assert INTERIOR_LABELS <= E and len(INTERIOR_LABELS) == 3
    assert INTERIOR_LABELS.isdisjoint(TRIANGLE_LABELS)
    union = E | B | L
    fresh = A - union
    safe = CAP_LABELS | TRIANGLE_LABELS | {x for x in A if RADIUS <= matrix[O][x]}
    assert fresh, "strict fresh existence"
    assert safe <= union, "negated marked safe selector"
    assert all(x != Q and x not in (E - {Q}) | B | L for x in fresh)

    # A necessary planar inequality fails. This is a rejection certificate,
    # not a check of a purported geometric realization.
    ptolemy = None
    for a, b, c, d in permutations(range(N), 4):
        left = matrix[a][c] * matrix[b][d]
        right = matrix[a][b] * matrix[c][d] + matrix[a][d] * matrix[b][c]
        if left > right:
            ptolemy = {"points": [a, b, c, d], "left": str(left), "right": str(right)}
            break
    assert ptolemy is not None, "expected nonplanarity diagnostic"

    # With Q,W marked as cap-interior points on the O-radius, the source
    # radius-drop theorem would force dist(H(Q),Q) < RADIUS. It fails here.
    assert H[Q] != O and matrix[H[Q]][Q] == matrix[H[Q]][W] == RADIUS
    return {
        "scope": "finite metric and marked-set relaxation; NOT CounterexampleData",
        "cardinality": N,
        "proper_nonempty_subsets_checked": proper_subsets,
        "global_metric_k4": True,
        "metric_cardinal_minimality": True,
        "actual_sources_checked": len(H),
        "rich_row_pair_intersections_at_most_two": True,
        "fresh": sorted(fresh),
        "marked_safe": sorted(safe),
        "safe_selector_in_marked_relaxation": False,
        "ptolemy_violation": ptolemy,
        "source_radius_drop_holds": False,
        "planar_source_realized": False,
    }


if __name__ == "__main__":
    print(json.dumps(verify(), sort_keys=True))
