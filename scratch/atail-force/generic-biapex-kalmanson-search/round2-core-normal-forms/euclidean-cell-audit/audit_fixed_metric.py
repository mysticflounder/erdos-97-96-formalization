#!/usr/bin/env python3
"""Audit exact Euclidean realizability of one full-Kalmanson metric payload.

This script is deliberately solver-independent.  It parses the rational
distance table, constructs every basepoint Gram matrix from squared distances,
and performs exact rational row reduction and determinant calculations.
"""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Sequence


def determinant(matrix: Sequence[Sequence[Fraction]]) -> Fraction:
    """Return the determinant by exact fraction Gaussian elimination."""

    size = len(matrix)
    if any(len(row) != size for row in matrix):
        raise ValueError("determinant expects a square matrix")
    work = [list(row) for row in matrix]
    result = Fraction(1)
    for column in range(size):
        pivot = next(
            (row for row in range(column, size) if work[row][column] != 0),
            None,
        )
        if pivot is None:
            return Fraction(0)
        if pivot != column:
            work[column], work[pivot] = work[pivot], work[column]
            result = -result
        pivot_value = work[column][column]
        result *= pivot_value
        for row in range(column + 1, size):
            if work[row][column] == 0:
                continue
            factor = work[row][column] / pivot_value
            for inner in range(column + 1, size):
                work[row][inner] -= factor * work[column][inner]
    return result


def rank(matrix: Sequence[Sequence[Fraction]]) -> int:
    """Return the exact rank by rational row reduction."""

    if not matrix:
        return 0
    rows = [list(row) for row in matrix]
    height = len(rows)
    width = len(rows[0])
    if any(len(row) != width for row in rows):
        raise ValueError("rank expects a rectangular matrix")
    pivot_row = 0
    for column in range(width):
        pivot = next(
            (row for row in range(pivot_row, height) if rows[row][column] != 0),
            None,
        )
        if pivot is None:
            continue
        rows[pivot_row], rows[pivot] = rows[pivot], rows[pivot_row]
        pivot_value = rows[pivot_row][column]
        rows[pivot_row] = [entry / pivot_value for entry in rows[pivot_row]]
        for row in range(height):
            if row == pivot_row or rows[row][column] == 0:
                continue
            factor = rows[row][column]
            rows[row] = [
                entry - factor * pivot_entry
                for entry, pivot_entry in zip(rows[row], rows[pivot_row], strict=True)
            ]
        pivot_row += 1
        if pivot_row == height:
            break
    return pivot_row


def parse_fraction(value: str) -> Fraction:
    if value.endswith("?"):
        raise ValueError(f"inexact rational value: {value}")
    return Fraction(value)


def render_fraction(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


def parse_distances(
    payload: dict[str, object],
) -> tuple[int, dict[tuple[int, int], Fraction]]:
    n = int(payload["n"])
    raw = payload["distances"]
    if not isinstance(raw, dict):
        raise ValueError("distances is not an object")
    distances: dict[tuple[int, int], Fraction] = {}
    for key, value in raw.items():
        left_text, right_text = str(key).split(",")
        pair = (int(left_text), int(right_text))
        distances[pair] = parse_fraction(str(value))
    expected = set(itertools.combinations(range(n), 2))
    if set(distances) != expected:
        raise ValueError("distance table is not complete")
    return n, distances


def distance(
    distances: dict[tuple[int, int], Fraction], left: int, right: int
) -> Fraction:
    if left == right:
        return Fraction(0)
    return distances[tuple(sorted((left, right)))]


def gram_matrix(
    distances: dict[tuple[int, int], Fraction],
    base: int,
    points: Sequence[int],
) -> list[list[Fraction]]:
    return [
        [
            (
                distance(distances, base, left) ** 2
                + distance(distances, base, right) ** 2
                - distance(distances, left, right) ** 2
            )
            / 2
            for right in points
        ]
        for left in points
    ]


def principal_submatrix(
    matrix: Sequence[Sequence[Fraction]], indices: Sequence[int]
) -> list[list[Fraction]]:
    return [[matrix[left][right] for right in indices] for left in indices]


def cayley_menger(
    distances: dict[tuple[int, int], Fraction], points: Sequence[int]
) -> Fraction:
    size = len(points)
    matrix: list[list[Fraction]] = [
        [Fraction(0)] + [Fraction(1) for _ in points]
    ]
    for left in points:
        matrix.append(
            [Fraction(1)]
            + [distance(distances, left, right) ** 2 for right in points]
        )
    return determinant(matrix)


def negative_principal_minor(
    matrix: Sequence[Sequence[Fraction]], labels: Sequence[int]
) -> dict[str, object] | None:
    for size in range(1, len(labels) + 1):
        candidates: list[tuple[Fraction, tuple[int, ...], tuple[int, ...]]] = []
        for indices in itertools.combinations(range(len(labels)), size):
            value = determinant(principal_submatrix(matrix, indices))
            if value < 0:
                candidates.append((abs(value), indices, tuple(labels[i] for i in indices)))
        if candidates:
            _magnitude, indices, vertices = min(candidates)
            value = determinant(principal_submatrix(matrix, indices))
            return {
                "order": size,
                "vertices": list(vertices),
                "determinant": render_fraction(value),
            }
    return None


def triangle_violations(
    n: int, distances: dict[tuple[int, int], Fraction]
) -> list[dict[str, object]]:
    violations: list[dict[str, object]] = []
    for triple in itertools.combinations(range(n), 3):
        a, b, c = triple
        sides = {
            (a, b): distance(distances, a, b),
            (a, c): distance(distances, a, c),
            (b, c): distance(distances, b, c),
        }
        for opposite, other_left, other_right in (
            ((a, b), (a, c), (b, c)),
            ((a, c), (a, b), (b, c)),
            ((b, c), (a, b), (a, c)),
        ):
            slack = sides[other_left] + sides[other_right] - sides[opposite]
            if slack < 0:
                violations.append(
                    {
                        "vertices": list(triple),
                        "opposite": list(opposite),
                        "slack": render_fraction(slack),
                    }
                )
    return violations


def four_point_obstructions(
    n: int, distances: dict[tuple[int, int], Fraction]
) -> list[dict[str, object]]:
    results: list[dict[str, object]] = []
    for points in itertools.combinations(range(n), 4):
        base, *others = points
        gram_det = determinant(gram_matrix(distances, base, others))
        cm_det = cayley_menger(distances, points)
        if cm_det != 8 * gram_det:
            raise RuntimeError(
                f"Cayley-Menger/Gram identity failed for {points}: "
                f"{cm_det} != 8 * {gram_det}"
            )
        if gram_det != 0:
            results.append(
                {
                    "vertices": list(points),
                    "basepoint": base,
                    "gram_determinant": render_fraction(gram_det),
                    "cayley_menger_determinant": render_fraction(cm_det),
                    "sign": "negative" if gram_det < 0 else "positive",
                }
            )
    return results


def choose_smallest(
    records: Iterable[dict[str, object]], determinant_key: str
) -> dict[str, object] | None:
    records = list(records)
    if not records:
        return None
    return min(records, key=lambda record: abs(Fraction(str(record[determinant_key]))))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--quiet", action="store_true")
    args = parser.parse_args()

    payload = json.loads(args.input.read_text(encoding="utf-8"))
    if payload.get("status") != "SAT_VERIFIED_FULL_KALMANSON_METRIC":
        raise ValueError("input is not a verified full-Kalmanson metric payload")
    n, distances = parse_distances(payload)

    basepoint_audits: list[dict[str, object]] = []
    for base in range(n):
        points = tuple(point for point in range(n) if point != base)
        gram = gram_matrix(distances, base, points)
        exact_rank = rank(gram)
        basepoint_audits.append(
            {
                "basepoint": base,
                "gram_order": len(points),
                "exact_rank": exact_rank,
                "rank_le_two": exact_rank <= 2,
                "smallest_order_negative_principal_minor": negative_principal_minor(
                    gram, points
                ),
            }
        )

    triangles = triangle_violations(n, distances)
    four_points = four_point_obstructions(n, distances)
    negative_four_points = [item for item in four_points if item["sign"] == "negative"]
    positive_four_points = [item for item in four_points if item["sign"] == "positive"]

    output = {
        "schema": "p97-exact-fixed-metric-euclidean-audit-v1",
        "epistemic_status": "EXACT_RATIONAL_REPLAY",
        "source": str(args.input),
        "n": n,
        "distance_count": len(distances),
        "triangle_violation_count": len(triangles),
        "triangle_violations": triangles,
        "basepoint_gram_audits": basepoint_audits,
        "four_point_subset_count": len(list(itertools.combinations(range(n), 4))),
        "nonzero_four_point_gram_count": len(four_points),
        "negative_four_point_gram_count": len(negative_four_points),
        "positive_four_point_gram_count": len(positive_four_points),
        "zero_four_point_gram_count": len(list(itertools.combinations(range(n), 4)))
        - len(four_points),
        "smallest_absolute_nonzero_four_point_gram": choose_smallest(
            four_points, "gram_determinant"
        ),
        "smallest_absolute_negative_four_point_gram": choose_smallest(
            negative_four_points, "gram_determinant"
        ),
        "smallest_absolute_positive_four_point_gram": choose_smallest(
            positive_four_points, "gram_determinant"
        ),
        "all_four_point_obstructions": four_points,
        "conclusion_for_fixed_metric": (
            "NOT_EUCLIDEAN_ANY_DIMENSION"
            if negative_four_points
            else "NOT_PLANAR"
            if four_points
            else "NO_FOUR_POINT_OBSTRUCTION_FOUND"
        ),
        "cell_level_conclusion": "NOT_TESTED_BY_THIS_FIXED_METRIC_REPLAY",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    if not args.quiet:
        print(json.dumps(output, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
