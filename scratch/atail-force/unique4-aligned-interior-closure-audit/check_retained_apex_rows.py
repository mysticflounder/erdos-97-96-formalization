#!/usr/bin/env python3
"""Exact cyclic audit of the two retained apex rows on the n=11 aligned arm.

This is a finite check of the current boundary-index abstraction, not a
Euclidean realization and not a source theorem.  The normalized cap profile is

    O1 = 0, O2 = 4, V = 8, strict first-opposite-cap points = {5, 6, 7}.

The complete first-apex class contains all three strict points and one other
carrier point.  The aligned pair is any two strict points.  The retained
second-apex row is any four-subset which omits that pair and satisfies the two
source-proved intersection upper bounds.  We ask whether the two outer arcs of
each of these two rows form four pairwise turn-disjoint supports.
"""

from __future__ import annotations

import itertools
import json


N = 11
FIRST_APEX = 0
SECOND_APEX = 4
STRICT = frozenset({5, 6, 7})
VERTICES = tuple(range(N))


def outer_turn_supports(center: int, support: frozenset[int]) -> tuple[frozenset[int], frozenset[int]]:
    """Match the turn-index convention in run_curvature_cegar.py."""

    offsets = sorted((center - point) % N for point in support)
    assert len(offsets) == 4 and offsets[0] != 0
    global_start = (-center) % N
    left = frozenset(
        (global_start + offset) % N for offset in range(offsets[1] - 1)
    )
    right = frozenset(
        (global_start + offset) % N for offset in range(offsets[2], N - 1)
    )
    assert left and right
    return left, right


def pairwise_disjoint(sets: tuple[frozenset[int], ...]) -> bool:
    return all(left.isdisjoint(right) for left, right in itertools.combinations(sets, 2))


def main() -> None:
    total = 0
    favorable = 0
    first_nonfavorable: dict[str, object] | None = None

    fourth_points = tuple(point for point in VERTICES if point not in STRICT | {FIRST_APEX})
    for fourth in fourth_points:
        first_row = STRICT | {fourth}
        for q, w in itertools.combinations(sorted(STRICT), 2):
            available = tuple(
                point for point in VERTICES
                if point not in {SECOND_APEX, q, w}
            )
            for chosen in itertools.combinations(available, 4):
                second_row = frozenset(chosen)
                if len(second_row & STRICT) > 1:
                    continue
                if len(second_row & first_row) > 2:
                    continue

                total += 1
                arcs = (*outer_turn_supports(FIRST_APEX, first_row),
                        *outer_turn_supports(SECOND_APEX, second_row))
                if pairwise_disjoint(arcs):
                    favorable += 1
                elif first_nonfavorable is None:
                    first_nonfavorable = {
                        "first_row": sorted(first_row),
                        "aligned_pair": [q, w],
                        "second_row": sorted(second_row),
                        "turn_supports": [sorted(arc) for arc in arcs],
                    }

    result = {
        "schema": "p97-unique4-aligned-retained-apex-row-curvature-audit-v1",
        "epistemic_status": "EXACT_FINITE_CYCLIC_ABSTRACTION_N11",
        "candidate_pairs": total,
        "four_turn_disjoint": favorable,
        "not_four_turn_disjoint": total - favorable,
        "first_nonfavorable": first_nonfavorable,
    }
    assert total == 1470
    assert favorable == 0
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
