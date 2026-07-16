#!/usr/bin/env python3
"""Exhaust the two-by-two continuation membership abstraction.

Rows are selected K4 classes centered at the two strict points on one side;
columns are the two strict points selected on the opposite side.  Convex
outside-pair uniqueness forbids a row from containing both columns.

The stronger ``critical blocker lives among the two opposite centers`` model
also requires every source column to occur in the row at its chosen blocker.
Even that stronger abstraction permits permutation matrices, so the survivor
chosen by the deletion split can alternate between the two centers.
"""

from __future__ import annotations

import itertools
import json


def row_patterns() -> tuple[tuple[int, int], ...]:
    return tuple(bits for bits in itertools.product((0, 1), repeat=2) if sum(bits) <= 1)


def matrices() -> tuple[tuple[tuple[int, int], tuple[int, int]], ...]:
    rows = row_patterns()
    return tuple(itertools.product(rows, repeat=2))


def common_omitted_source(matrix: tuple[tuple[int, int], tuple[int, int]]) -> bool:
    return any(matrix[0][column] == matrix[1][column] == 0 for column in range(2))


def is_permutation_matrix(matrix: tuple[tuple[int, int], tuple[int, int]]) -> bool:
    return all(sum(row) == 1 for row in matrix) and all(
        matrix[0][column] + matrix[1][column] == 1 for column in range(2)
    )


def alternating_matrix(row_count: int) -> tuple[tuple[int, int], ...]:
    """A terminal-free membership assignment for every finite row count >= 2."""
    assert row_count >= 2
    return tuple((1, 0) if row % 2 == 0 else (0, 1) for row in range(row_count))


def main() -> None:
    one_direction = matrices()
    split_survivor = tuple(matrix for matrix in one_direction if not common_omitted_source(matrix))
    critical_bijections = tuple(matrix for matrix in one_direction if is_permutation_matrix(matrix))

    assert len(row_patterns()) == 3
    assert len(one_direction) == 9
    assert len(split_survivor) == 2
    assert split_survivor == critical_bijections

    symmetric_grids = tuple(itertools.product(critical_bijections, repeat=2))
    assert len(symmetric_grids) == 4

    for row_count in range(2, 33):
        alternating = alternating_matrix(row_count)
        assert all(sum(row) == 1 for row in alternating)
        assert all(any(row[column] == 1 for row in alternating) for column in range(2))

    witness = symmetric_grids[0]
    forward, reverse = witness
    assert not common_omitted_source(forward)
    assert not common_omitted_source(reverse)
    assert all(sum(row) <= 1 for matrix in witness for row in matrix)

    print(
        json.dumps(
            {
                "status": "EXACT_EXHAUSTIVE_WITHIN_BOOLEAN_MEMBERSHIP_ABSTRACTION",
                "row_patterns_with_no_repeated_pair": len(row_patterns()),
                "one_direction_matrices": len(one_direction),
                "matrices_with_no_common_omitted_source": len(split_survivor),
                "critical_bijection_matrices": len(critical_bijections),
                "symmetric_critical_grids": len(symmetric_grids),
                "arbitrary_finite_membership_countermodel": (
                    "For every row count n >= 2, alternate singleton hits (1,0) "
                    "and (0,1). Every row avoids the repeated-pair terminal, and "
                    "neither source is omitted from every row."
                ),
                "witness": {
                    "rows_at_second_centers_vs_first_pair": forward,
                    "rows_at_first_centers_vs_second_pair": reverse,
                },
                "interpretation": (
                    "The two deletion-survival disjunctions can split: one row omits "
                    "the first source and the other omits the second. This remains "
                    "possible even when each source chooses one of the two opposite "
                    "continuation centers as its critical blocker."
                ),
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
