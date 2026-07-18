#!/usr/bin/env python3
"""Find an exact rank-two Euclidean obstruction in an exact CEGAR ALIVE table.

The abstract Kalmanson surface is invariant under adding one constant to every
off-diagonal distance.  This checker chooses an integral translation making
all distances and all triangle slacks at least one, replays the Kalmanson
slacks and selected-row equalities, and computes exact four-point
Cayley--Menger determinants.  A nonzero determinant proves that the translated
table is not the distance table of points in `R^2`.

This is a witness audit, not a proof that every structural assignment is
non-Euclidean.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from fractions import Fraction
from pathlib import Path


def rational(value: object) -> Fraction:
    if isinstance(value, int):
        return Fraction(value)
    if isinstance(value, str):
        return Fraction(value)
    raise ValueError(f"unsupported rational value {value!r}")


def determinant(matrix: list[list[Fraction]]) -> Fraction:
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
            if not work[row][column]:
                continue
            ratio = work[row][column] / pivot_value
            for entry in range(column + 1, len(work)):
                work[row][entry] -= ratio * work[column][entry]
    return result


def cayley_menger(
    points: tuple[int, int, int, int],
    dist,
) -> Fraction:
    size = len(points) + 1
    matrix = [[Fraction(0) for _ in range(size)] for _ in range(size)]
    for index in range(1, size):
        matrix[0][index] = Fraction(1)
        matrix[index][0] = Fraction(1)
    for left in range(len(points)):
        for right in range(left + 1, len(points)):
            squared = dist(points[left], points[right]) ** 2
            matrix[left + 1][right + 1] = squared
            matrix[right + 1][left + 1] = squared
    return determinant(matrix)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--alive", type=Path, required=True)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    alive_bytes = args.alive.read_bytes()
    alive = json.loads(alive_bytes)
    if alive.get("schema") != "p97-exact6-integrated-exact-kalmanson-alive-v1":
        raise ValueError("unexpected ALIVE schema")
    raw_table = alive.get("distance_table")
    raw_rows = alive.get("rows")
    if not isinstance(raw_table, dict) or not isinstance(raw_rows, dict):
        raise ValueError("ALIVE is missing its exact distance or row table")
    n = len(raw_rows)
    expected = {f"{left},{right}" for left in range(n) for right in range(left + 1, n)}
    if set(raw_table) != expected:
        raise ValueError("distance table is not complete and canonical")
    original = {
        tuple(map(int, key.split(","))): rational(value)
        for key, value in raw_table.items()
    }

    def old_dist(left: int, right: int) -> Fraction:
        if left == right:
            return Fraction(0)
        return original[tuple(sorted((left, right)))]

    minimum_distance = min(original.values())
    minimum_triangle = min(
        old_dist(a, b) + old_dist(b, c) - old_dist(a, c)
        for a, b, c in itertools.permutations(range(n), 3)
        if len({a, b, c}) == 3
    )
    translation = max(
        Fraction(0),
        Fraction(1) - minimum_distance,
        Fraction(1) - minimum_triangle,
    )
    translation = Fraction((translation.numerator + translation.denominator - 1) // translation.denominator)

    def dist(left: int, right: int) -> Fraction:
        if left == right:
            return Fraction(0)
        return old_dist(left, right) + translation

    translated_minimum = min(dist(left, right) for left, right in original)
    translated_triangle = min(
        dist(a, b) + dist(b, c) - dist(a, c)
        for a, b, c in itertools.permutations(range(n), 3)
        if len({a, b, c}) == 3
    )
    if translated_minimum < 1 or translated_triangle < 1:
        raise AssertionError("translation failed its positivity/triangle contract")

    minimum_kalmanson: Fraction | None = None
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonal = dist(a, c) + dist(b, d)
        for sides in (
            dist(a, b) + dist(c, d),
            dist(a, d) + dist(b, c),
        ):
            slack = diagonal - sides
            if slack < 1:
                raise ValueError(f"strict Kalmanson replay fails at {(a,b,c,d)}")
            minimum_kalmanson = (
                slack if minimum_kalmanson is None else min(minimum_kalmanson, slack)
            )

    for raw_center, raw_support in raw_rows.items():
        center = int(raw_center)
        if not isinstance(raw_support, list) or len(raw_support) != 4:
            raise ValueError(f"row {center} is not a four-list")
        values = {dist(center, int(point)) for point in raw_support}
        if len(values) != 1:
            raise ValueError(f"translated row {center} is not equidistant")

    obstruction = None
    for points in itertools.combinations(range(n), 4):
        value = cayley_menger(points, dist)
        if value:
            obstruction = {"points": list(points), "determinant": str(value)}
            break

    result = {
        "schema": "p97-exact-kalmanson-alive-planarity-audit-v1",
        "epistemic_status": "EXACT_WITNESS_SPECIFIC_NOT_COVERAGE",
        "alive_path": str(args.alive),
        "alive_sha256": hashlib.sha256(alive_bytes).hexdigest(),
        "n": n,
        "translation": str(translation),
        "minimum_original_distance": str(minimum_distance),
        "minimum_original_triangle_slack": str(minimum_triangle),
        "minimum_translated_distance": str(translated_minimum),
        "minimum_translated_triangle_slack": str(translated_triangle),
        "minimum_translated_kalmanson_slack": str(minimum_kalmanson),
        "row_equality_replay": "PASS",
        "first_nonzero_planar_cayley_menger": obstruction,
        "verdict": (
            "EXACT_TRANSLATED_STRICT_METRIC_NOT_PLANAR_EUCLIDEAN"
            if obstruction is not None
            else "NO_FOUR_POINT_RANK_OBSTRUCTION_FOUND"
        ),
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
