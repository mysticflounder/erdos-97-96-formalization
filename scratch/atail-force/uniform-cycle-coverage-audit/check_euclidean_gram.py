#!/usr/bin/env python3
"""Check the exact rational distance payload against Euclidean Gram conditions."""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path


def matrix_rank(matrix: list[list[Fraction]]) -> int:
    work = [row[:] for row in matrix]
    rows = len(work)
    columns = len(work[0]) if rows else 0
    rank = 0
    for column in range(columns):
        pivot = next((index for index in range(rank, rows) if work[index][column]), None)
        if pivot is None:
            continue
        work[rank], work[pivot] = work[pivot], work[rank]
        scale = work[rank][column]
        work[rank] = [value / scale for value in work[rank]]
        for index in range(rows):
            if index == rank or not work[index][column]:
                continue
            factor = work[index][column]
            work[index] = [
                value - factor * pivot_value
                for value, pivot_value in zip(work[index], work[rank], strict=True)
            ]
        rank += 1
        if rank == rows:
            break
    return rank


def determinant(matrix: list[list[Fraction]]) -> Fraction:
    if not matrix:
        return Fraction(1)
    if len(matrix) == 1:
        return matrix[0][0]
    return sum(
        (-1 if column % 2 else 1)
        * matrix[0][column]
        * determinant([row[:column] + row[column + 1 :] for row in matrix[1:]])
        for column in range(len(matrix))
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("full_lra", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    payload = json.loads(args.full_lra.read_text(encoding="utf-8"))
    if payload.get("status") != "SAT_VERIFIED_FULL_KALMANSON_METRIC":
        raise ValueError("input is not a verified full-metric SAT payload")
    n = int(payload["n"])
    distances = {
        tuple(int(value) for value in edge.split(",")): Fraction(distance)
        for edge, distance in payload["distances"].items()
    }

    def dist(left: int, right: int) -> Fraction:
        if left == right:
            return Fraction(0)
        return distances[tuple(sorted((left, right)))]

    # With vertex 0 as origin, every Euclidean realization has this Gram
    # matrix.  Euclidean realizability in any dimension requires it to be PSD;
    # realizability in R^2 additionally requires rank at most two.
    gram = [
        [
            (dist(0, left) ** 2 + dist(0, right) ** 2 - dist(left, right) ** 2)
            / 2
            for right in range(1, n)
        ]
        for left in range(1, n)
    ]
    negative_witness = None
    for size in range(1, min(4, n)):
        for indices in itertools.combinations(range(n - 1), size):
            principal = [[gram[i][j] for j in indices] for i in indices]
            value = determinant(principal)
            if value < 0:
                negative_witness = {
                    "vertices": [index + 1 for index in indices],
                    "gram_principal_submatrix": [
                        [str(entry) for entry in row] for row in principal
                    ],
                    "determinant": str(value),
                }
                break
        if negative_witness is not None:
            break

    rank = matrix_rank(gram)
    output = {
        "schema": "p97-exact-distance-euclidean-gram-audit-v1",
        "epistemic_status": "EXACT_RATIONAL_LINEAR_ALGEBRA",
        "source": str(args.full_lra),
        "n": n,
        "reference_vertex": 0,
        "gram_rank": rank,
        "rank_at_most_two": rank <= 2,
        "negative_principal_minor": negative_witness,
        "euclidean_any_dimension": negative_witness is None,
        "euclidean_R2": negative_witness is None and rank <= 2,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(output, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
