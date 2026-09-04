"""Deterministically verify a strict all-center Kalmanson survivor.

The verifier is deliberately solver-free.  It accepts integer distances and
performs every comparison and the Cayley--Menger determinant calculation over
Python integers.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

INPUT_SCHEMA = "p97-strict-kalmanson-survivor/v1"
OUTPUT_SCHEMA = "p97-strict-kalmanson-survivor-verification/v1"
INPUT_KEYS = frozenset(
    {"schema", "n", "rows", "distance_matrix", "cayley_menger_probe"}
)


class VerificationError(ValueError):
    """Raised when the witness is malformed or violates a required condition."""


def _canonical_json(value: Any) -> str:
    return json.dumps(value, ensure_ascii=True, sort_keys=True, separators=(",", ":"))


def _is_int(value: object) -> bool:
    return isinstance(value, int) and not isinstance(value, bool)


def _require_int(value: object, label: str) -> int:
    if not _is_int(value):
        raise VerificationError(f"{label} must be an integer")
    return value


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise VerificationError(f"duplicate JSON key: {key!r}")
        result[key] = value
    return result


def parse_document(raw: bytes) -> Mapping[str, Any]:
    """Parse JSON while rejecting duplicate keys and non-object roots."""

    try:
        text = raw.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise VerificationError(f"input is not UTF-8: {exc}") from exc
    try:
        value = json.loads(text, object_pairs_hook=_reject_duplicate_keys)
    except VerificationError:
        raise
    except json.JSONDecodeError as exc:
        raise VerificationError(
            f"invalid JSON at line {exc.lineno}, column {exc.colno}: {exc.msg}"
        ) from exc
    except (ValueError, RecursionError) as exc:
        raise VerificationError(f"invalid JSON value: {exc}") from exc
    if not isinstance(value, Mapping):
        raise VerificationError("input root must be a JSON object")
    return value


def exact_determinant(matrix: Sequence[Sequence[int]]) -> int:
    """Return an exact determinant using fraction-free Bareiss elimination."""

    size = len(matrix)
    if any(len(row) != size for row in matrix):
        raise VerificationError("determinant matrix must be square")
    if any(not _is_int(entry) for row in matrix for entry in row):
        raise VerificationError("determinant matrix entries must be integers")
    if size == 0:
        return 1
    work = [list(row) for row in matrix]
    sign = 1
    previous_pivot = 1
    for pivot_index in range(size - 1):
        pivot_row = next(
            (
                row
                for row in range(pivot_index, size)
                if work[row][pivot_index] != 0
            ),
            None,
        )
        if pivot_row is None:
            return 0
        if pivot_row != pivot_index:
            work[pivot_index], work[pivot_row] = work[pivot_row], work[pivot_index]
            sign = -sign
        pivot = work[pivot_index][pivot_index]
        for row in range(pivot_index + 1, size):
            for column in range(pivot_index + 1, size):
                numerator = (
                    work[row][column] * pivot
                    - work[row][pivot_index] * work[pivot_index][column]
                )
                if numerator % previous_pivot != 0:
                    raise VerificationError("internal nonintegral Bareiss division")
                work[row][column] = numerator // previous_pivot
            work[row][pivot_index] = 0
        previous_pivot = pivot
    return sign * work[-1][-1]


def cayley_menger_determinant(
    distance_matrix: Sequence[Sequence[int]], vertices: Sequence[int]
) -> int:
    """Compute the four-point Cayley--Menger determinant from distances."""

    if len(vertices) != 4:
        raise VerificationError("cayley_menger_probe must contain exactly four vertices")
    cm = [[0] * 5 for _ in range(5)]
    for index in range(1, 5):
        cm[0][index] = 1
        cm[index][0] = 1
    for left in range(4):
        for right in range(4):
            distance = distance_matrix[vertices[left]][vertices[right]]
            cm[left + 1][right + 1] = distance * distance
    return exact_determinant(cm)


def check_nonplanar_probe(
    distance_matrix: Sequence[Sequence[int]], vertices: Sequence[int]
) -> int:
    """Return the exact probe determinant, rejecting a planar probe."""

    determinant = cayley_menger_determinant(distance_matrix, vertices)
    if determinant == 0:
        raise VerificationError(
            "nonplanarity check failed: Cayley--Menger determinant is zero"
        )
    return determinant


def validate_rows(value: object, n: int) -> list[tuple[int, int, int, int]]:
    if not isinstance(value, list) or len(value) != n:
        raise VerificationError(f"rows must be a list of length n={n}")
    rows: list[tuple[int, int, int, int]] = []
    for center, raw_row in enumerate(value):
        if not isinstance(raw_row, list) or len(raw_row) != 4:
            raise VerificationError(f"rows[{center}] must contain exactly four members")
        row = tuple(
            _require_int(member, f"rows[{center}][{index}]")
            for index, member in enumerate(raw_row)
        )
        if any(member < 0 or member >= n for member in row):
            raise VerificationError(f"rows[{center}] contains an out-of-range member")
        if len(set(row)) != 4:
            raise VerificationError(f"rows[{center}] members must be distinct")
        if center in row:
            raise VerificationError(f"rows[{center}] must exclude its center")
        rows.append(row)
    return rows


def validate_distance_matrix(value: object, n: int) -> list[list[int]]:
    if not isinstance(value, list) or len(value) != n:
        raise VerificationError(f"distance_matrix must have n={n} rows")
    matrix: list[list[int]] = []
    for row_index, raw_row in enumerate(value):
        if not isinstance(raw_row, list) or len(raw_row) != n:
            raise VerificationError(
                f"distance_matrix[{row_index}] must have n={n} entries"
            )
        matrix.append(
            [
                _require_int(entry, f"distance_matrix[{row_index}][{column}]")
                for column, entry in enumerate(raw_row)
            ]
        )
    for left in range(n):
        if matrix[left][left] != 0:
            raise VerificationError(f"distance_matrix[{left}][{left}] must be zero")
        for right in range(left + 1, n):
            if matrix[left][right] != matrix[right][left]:
                raise VerificationError(
                    f"distance matrix is not symmetric at ({left}, {right})"
                )
            if matrix[left][right] <= 0:
                raise VerificationError(
                    f"off-diagonal distance ({left}, {right}) must be positive"
                )
    return matrix


def validate_probe(value: object, n: int) -> tuple[int, int, int, int]:
    if not isinstance(value, list) or len(value) != 4:
        raise VerificationError("cayley_menger_probe must contain exactly four vertices")
    probe = tuple(
        _require_int(vertex, f"cayley_menger_probe[{index}]")
        for index, vertex in enumerate(value)
    )
    if len(set(probe)) != 4:
        raise VerificationError("cayley_menger_probe vertices must be distinct")
    if any(vertex < 0 or vertex >= n for vertex in probe):
        raise VerificationError("cayley_menger_probe contains an out-of-range vertex")
    return probe


def check_row_equalities(
    rows: Sequence[Sequence[int]], distance_matrix: Sequence[Sequence[int]]
) -> tuple[list[int], int]:
    radii: list[int] = []
    checked = 0
    for center, row in enumerate(rows):
        radius = distance_matrix[center][row[0]]
        radii.append(radius)
        for member in row[1:]:
            checked += 1
            observed = distance_matrix[center][member]
            if observed != radius:
                raise VerificationError(
                    "row equality failed at center "
                    f"{center}: d({center},{row[0]})={radius}, "
                    f"d({center},{member})={observed}"
                )
    return radii, checked


def kalmanson_slacks(
    distance_matrix: Sequence[Sequence[int]], i: int, j: int, k: int, l: int
) -> tuple[int, int]:
    crossing = distance_matrix[i][k] + distance_matrix[j][l]
    return (
        crossing - (distance_matrix[i][j] + distance_matrix[k][l]),
        crossing - (distance_matrix[i][l] + distance_matrix[j][k]),
    )


def check_kalmanson(distance_matrix: Sequence[Sequence[int]]) -> tuple[int, int]:
    minimum: int | None = None
    checked = 0
    for i, j, k, l in itertools.combinations(range(len(distance_matrix)), 4):
        for direction, slack in enumerate(
            kalmanson_slacks(distance_matrix, i, j, k, l), start=1
        ):
            checked += 1
            if slack <= 0:
                raise VerificationError(
                    "strict Kalmanson comparison failed for "
                    f"({i},{j},{k},{l}), direction {direction}: slack={slack}"
                )
            minimum = slack if minimum is None else min(minimum, slack)
    if minimum is None:
        raise VerificationError("at least four vertices are required")
    return minimum, checked


def triangle_slacks(
    distance_matrix: Sequence[Sequence[int]], i: int, j: int, k: int
) -> tuple[int, int, int]:
    dij = distance_matrix[i][j]
    dik = distance_matrix[i][k]
    djk = distance_matrix[j][k]
    return (dij + dik - djk, dij + djk - dik, dik + djk - dij)


def check_triangles(distance_matrix: Sequence[Sequence[int]]) -> tuple[int, int]:
    minimum: int | None = None
    checked = 0
    for i, j, k in itertools.combinations(range(len(distance_matrix)), 3):
        for direction, slack in enumerate(
            triangle_slacks(distance_matrix, i, j, k), start=1
        ):
            checked += 1
            if slack <= 0:
                raise VerificationError(
                    "strict triangle comparison failed for "
                    f"({i},{j},{k}), direction {direction}: slack={slack}"
                )
            minimum = slack if minimum is None else min(minimum, slack)
    if minimum is None:
        raise VerificationError("at least three vertices are required")
    return minimum, checked


def verify_document(document: Mapping[str, Any], input_sha256: str) -> dict[str, Any]:
    """Validate a parsed witness and return its canonical verification payload."""

    actual_keys = frozenset(document)
    if actual_keys != INPUT_KEYS:
        missing = sorted(INPUT_KEYS - actual_keys)
        extra = sorted(actual_keys - INPUT_KEYS)
        raise VerificationError(f"input keys mismatch: missing={missing}, extra={extra}")
    if document["schema"] != INPUT_SCHEMA:
        raise VerificationError(
            f"schema must be {INPUT_SCHEMA!r}, got {document['schema']!r}"
        )
    n = _require_int(document["n"], "n")
    if n < 5:
        raise VerificationError("n must be at least 5 for four center-excluded members")
    rows = validate_rows(document["rows"], n)
    distance_matrix = validate_distance_matrix(document["distance_matrix"], n)
    probe = validate_probe(document["cayley_menger_probe"], n)

    radii, row_count = check_row_equalities(rows, distance_matrix)
    minimum_kalmanson, kalmanson_count = check_kalmanson(distance_matrix)
    minimum_triangle, triangle_count = check_triangles(distance_matrix)
    determinant = check_nonplanar_probe(distance_matrix, probe)

    return {
        "cayley_menger": {"determinant": determinant, "vertices": list(probe)},
        "check_counts": {
            "kalmanson_comparisons": kalmanson_count,
            "row_equality_comparisons": row_count,
            "triangle_comparisons": triangle_count,
        },
        "input_sha256": input_sha256,
        "minimum_kalmanson_slack": minimum_kalmanson,
        "minimum_triangle_slack": minimum_triangle,
        "n": n,
        "row_radius_summary": {
            "maximum": max(radii),
            "minimum": min(radii),
            "radii": radii,
        },
        "schema": OUTPUT_SCHEMA,
        "status": "PASS",
    }


def verify_file(path: Path) -> dict[str, Any]:
    try:
        raw = path.read_bytes()
    except OSError as exc:
        raise VerificationError(f"cannot read {path}: {exc}") from exc
    document = parse_document(raw)
    return verify_document(document, hashlib.sha256(raw).hexdigest())


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("witness", type=Path, help="strict survivor JSON witness")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        result = verify_file(args.witness)
    except VerificationError as exc:
        print(_canonical_json({"error": str(exc), "status": "FAIL"}), file=sys.stderr)
        return 1
    print(_canonical_json(result))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
