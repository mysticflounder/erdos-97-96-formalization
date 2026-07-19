#!/usr/bin/env python3
"""Extract an exact planar-rank obstruction from a uniform tight-graph metric."""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path
from typing import Any, Callable, Sequence

import sympy


Matrix = list[list[Fraction]]


def determinant(matrix: Matrix) -> Fraction:
    work = [row[:] for row in matrix]
    result = Fraction(1)
    for column in range(len(work)):
        pivot = next(
            (row for row in range(column, len(work)) if work[row][column]), None
        )
        if pivot is None:
            return Fraction(0)
        if pivot != column:
            work[column], work[pivot] = work[pivot], work[column]
            result = -result
        pivot_value = work[column][column]
        result *= pivot_value
        for row in range(column + 1, len(work)):
            if work[row][column] == 0:
                continue
            ratio = work[row][column] / pivot_value
            for entry in range(column + 1, len(work)):
                work[row][entry] -= ratio * work[column][entry]
    return result


def centered_gram(points: Sequence[int], dist: Callable[[int, int], int]) -> Matrix:
    base, *vectors = points
    return [
        [
            Fraction(
                dist(base, left) ** 2
                + dist(base, right) ** 2
                - dist(left, right) ** 2,
                2,
            )
            for right in vectors
        ]
        for left in vectors
    ]


def cayley_menger(points: Sequence[int], dist: Callable[[int, int], int]) -> Matrix:
    size = len(points) + 1
    matrix = [[Fraction(0) for _ in range(size)] for _ in range(size)]
    for index in range(1, size):
        matrix[0][index] = Fraction(1)
        matrix[index][0] = Fraction(1)
    for left, right in itertools.combinations(range(len(points)), 2):
        squared = Fraction(dist(points[left], points[right]) ** 2)
        matrix[left + 1][right + 1] = squared
        matrix[right + 1][left + 1] = squared
    return matrix


def audit(source: dict[str, Any]) -> dict[str, Any]:
    assert source["schema"] == (
        "p97-uniform-positive-circular-split-degree-four-tight-graph-v1"
    )
    n = int(source["n"])
    assert n >= 12 and n % 2 == 0
    intervals = tuple(frozenset(map(int, interval)) for interval in source["intervals"])
    weights = tuple(map(int, source["weights"]))
    assert len(intervals) == len(weights)
    assert all(weight > 0 for weight in weights)

    def dist(left: int, right: int) -> int:
        if left == right:
            return 0
        return sum(
            weight
            for interval, weight in zip(intervals, weights, strict=True)
            if (left in interval) != (right in interval)
        )

    minimum_distance = min(
        dist(left, right) for left, right in itertools.combinations(range(n), 2)
    )
    minimum_triangle_slack = min(
        dist(a, b) + dist(b, c) - dist(a, c)
        for a, b, c in itertools.permutations(range(n), 3)
        if len({a, b, c}) == 3
    )
    assert minimum_distance > 0
    assert minimum_triangle_slack >= 0

    triple_determinants = tuple(
        determinant(centered_gram(points, dist))
        for points in itertools.combinations(range(n), 3)
    )
    assert min(triple_determinants) >= 0

    quadruple_results = tuple(
        (
            points,
            centered_gram(points, dist),
            determinant(centered_gram(points, dist)),
            determinant(cayley_menger(points, dist)),
        )
        for points in itertools.combinations(range(n), 4)
    )
    first_nonzero = next(result for result in quadruple_results if result[2] != 0)
    points, gram, gram_determinant, cayley_menger_determinant = first_nonzero
    assert points == (0, 1, 2, 3)
    assert cayley_menger_determinant == 8 * gram_determinant

    h = 3 * n - 21
    q = 7 * n - 47
    assert dist(0, 1) == dist(1, 2) == dist(2, 3) == h
    assert dist(0, 2) == dist(1, 3) == 2 * h
    assert dist(0, 3) == q
    symbolic_gram_determinant = -36 * (n - 7) ** 2 * (n - 8) ** 2 * (8 * n - 55) ** 2
    symbolic_cayley_menger = 8 * symbolic_gram_determinant
    assert gram_determinant == symbolic_gram_determinant
    assert cayley_menger_determinant == symbolic_cayley_menger
    assert gram_determinant < 0

    # The additive-tight equations use target potentials.  A symmetric weak-sum
    # correction makes every selected row constant only when p_x - beta_x is
    # constant on each target co-occurrence component.  This table has one such
    # component, leaving exactly the one-parameter normalization
    # D_K(i,j) = D(i,j) - beta_i - beta_j + K for i != j.
    rows = tuple(tuple(map(int, row)) for row in source["rows"])
    beta_values = tuple(map(int, source["beta"]))
    assert all(
        len({
            dist(center, target) - beta_values[center] - beta_values[target]
            for target in row
        }) == 1
        for center, row in enumerate(rows)
    )
    target_neighbors = {target: set() for target in range(n)}
    for row in rows:
        for left, right in itertools.permutations(row, 2):
            target_neighbors[left].add(right)
    seen = {0}
    pending = [0]
    while pending:
        vertex = pending.pop()
        for neighbor in target_neighbors[vertex]:
            if neighbor not in seen:
                seen.add(neighbor)
                pending.append(neighbor)
    assert seen == set(range(n))

    symbolic_n, symbolic_k = sympy.symbols("n K")
    symbolic_h = 3 * symbolic_n - 21
    symbolic_q = 7 * symbolic_n - 47
    symbolic_r = 8 * symbolic_n - 54
    symbolic_offsets = {
        0: sympy.Integer(0),
        1: symbolic_h,
        2: 2 * symbolic_h,
        3: symbolic_q,
        4: symbolic_r,
    }

    def symbolic_beta(vertex: int):
        return 2 * symbolic_h if vertex % 2 == 0 else symbolic_h

    def symbolic_adjusted_distance(left: int, right: int):
        if left == right:
            return sympy.Integer(0)
        return (
            symbolic_k
            + symbolic_offsets[abs(left - right)]
            - symbolic_beta(left)
            - symbolic_beta(right)
        )

    def symbolic_gram(points: tuple[int, int, int, int]):
        base, *vectors = points
        return sympy.Matrix([
            [
                (
                    symbolic_adjusted_distance(base, left) ** 2
                    + symbolic_adjusted_distance(base, right) ** 2
                    - symbolic_adjusted_distance(left, right) ** 2
                ) / 2
                for right in vectors
            ]
            for left in vectors
        ])

    twice_det_0123 = sympy.factor(2 * symbolic_gram((0, 1, 2, 3)).det())
    twice_det_0134 = sympy.factor(2 * symbolic_gram((0, 1, 3, 4)).det())
    symbolic_resultant = sympy.factor(
        sympy.resultant(twice_det_0123, twice_det_0134, symbolic_k)
    )
    specialized_det_0123 = sympy.factor(twice_det_0123.subs(symbolic_n, n))
    specialized_det_0134 = sympy.factor(twice_det_0134.subs(symbolic_n, n))
    specialized_resultant = sympy.factor(symbolic_resultant.subs(symbolic_n, n))
    assert specialized_resultant != 0

    return {
        "schema": "p97-uniform-counterfamily-planar-rank-audit-v1",
        "epistemic_status": "EXACT_INTEGER_N12_PLUS_SYMBOLIC_UNIFORM_FORMULA",
        "n": n,
        "minimum_distance": minimum_distance,
        "minimum_triangle_slack": minimum_triangle_slack,
        "three_point_centered_gram_determinant_minimum": str(min(triple_determinants)),
        "three_point_degenerate_count": sum(value == 0 for value in triple_determinants),
        "smallest_obstruction_cardinality": 4,
        "certificate_points": list(points),
        "six_distances": {
            f"{left},{right}": dist(left, right)
            for left, right in itertools.combinations(points, 2)
        },
        "centered_gram": [[str(value) for value in row] for row in gram],
        "centered_gram_determinant": str(gram_determinant),
        "cayley_menger_determinant": str(cayley_menger_determinant),
        "quadruple_count": len(quadruple_results),
        "quadruple_nonzero_gram_count": sum(
            gram_det != 0 for _points, _gram, gram_det, _cm_det in quadruple_results
        ),
        "quadruple_negative_gram_count": sum(
            gram_det < 0 for _points, _gram, gram_det, _cm_det in quadruple_results
        ),
        "quadruple_positive_gram_count": sum(
            gram_det > 0 for _points, _gram, gram_det, _cm_det in quadruple_results
        ),
        "symbolic_family": {
            "domain": "even n >= 12",
            "h": "3*n - 21",
            "q": "7*n - 47",
            "distance_pattern": {
                "d01=d12=d23": "h",
                "d02=d13": "2*h",
                "d03": "q",
            },
            "centered_gram_determinant": (
                "-36*(n-7)^2*(n-8)^2*(8*n-55)^2"
            ),
            "cayley_menger_determinant": (
                "-288*(n-7)^2*(n-8)^2*(8*n-55)^2"
            ),
            "sign_on_domain": "STRICTLY_NEGATIVE",
        },
        "weak_sum_row_equal_family": {
            "target_cooccurrence_connected": True,
            "normal_form": "D_K(i,j)=D(i,j)-beta_i-beta_j+K for i!=j",
            "twice_gram_det_0123": str(twice_det_0123),
            "twice_gram_det_0134": str(twice_det_0134),
            "resultant_in_K": str(symbolic_resultant),
            "specialized_n": n,
            "specialized_twice_gram_det_0123": str(specialized_det_0123),
            "specialized_twice_gram_det_0134": str(specialized_det_0134),
            "specialized_resultant": str(specialized_resultant),
            "verdict": "NO_TRANSLATION_K_MAKES_BOTH_MINORS_PLANAR",
        },
        "verdict": "NOT_EUCLIDEAN_IN_ANY_DIMENSION_AND_HENCE_NOT_PLANAR",
        "replay": "EXACT_INTEGER_PASS",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("counterexample", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    source = json.loads(args.counterexample.read_text(encoding="utf-8"))
    payload = audit(source)
    rendered = json.dumps(payload, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(rendered + "\n", encoding="utf-8")
    print(rendered)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
