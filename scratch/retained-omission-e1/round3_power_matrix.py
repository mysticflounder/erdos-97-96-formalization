#!/usr/bin/env python3
"""Exhaust the rank-four power-pattern test on the literal E1 shadow.

Each row in ``check_model.SHELLS`` is treated as a *full* positive-radius
carrier circle class.  Consequently membership is a forced-zero power entry
and every off-support carrier point is a forced-nonzero power entry.  A 5x5
minor with exactly one possible perfect matching contradicts rank <= 4.

This is a model-specific discovery audit.  A hit still needs a Lean producer
showing that the live E1 hypotheses force the displayed finite pattern.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
SCRATCH = ROOT / "scratch"
MODEL_PATH = SCRATCH / "triapex-incidence-obstruction" / "check_model.py"


def load_model():
    spec = importlib.util.spec_from_file_location("triapex_check_model", MODEL_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {MODEL_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def matching_count(
    available: tuple[int, ...], *, cap: int = 2
) -> tuple[int, tuple[int, ...] | None]:
    """Count perfect matchings up to ``cap``; return one row-indexed witness."""
    n = len(available)
    count = 0
    witness: tuple[int, ...] | None = None

    def visit(remaining_rows: int, used: int, assignment: list[int]) -> None:
        nonlocal count, witness
        if count >= cap:
            return
        if remaining_rows == 0:
            count += 1
            if witness is None:
                witness = tuple(assignment)
            return

        best_row = -1
        best_options = 0
        best_size = n + 1
        bits = remaining_rows
        while bits:
            row_bit = bits & -bits
            row = row_bit.bit_length() - 1
            options = available[row] & ~used
            size = options.bit_count()
            if size < best_size:
                best_row, best_options, best_size = row, options, size
                if size <= 1:
                    break
            bits ^= row_bit
        if best_size == 0:
            return

        next_rows = remaining_rows & ~(1 << best_row)
        options = best_options
        while options and count < cap:
            column_bit = options & -options
            column = column_bit.bit_length() - 1
            assignment[best_row] = column
            visit(next_rows, used | column_bit, assignment)
            assignment[best_row] = -1
            options ^= column_bit

    visit((1 << n) - 1, 0, [-1] * n)
    return count, witness


def permutation_zero_witnesses(
    matrix: tuple[tuple[bool, ...], ...], matching: tuple[int, ...]
) -> list[dict[str, object]]:
    """Give one forced-zero entry for every nonmatching permutation."""
    witnesses: list[dict[str, object]] = []
    for permutation in itertools.permutations(range(5)):
        if permutation == matching:
            continue
        zero = next(
            ((row, permutation[row]) for row in range(5) if not matrix[row][permutation[row]]),
            None,
        )
        if zero is None:
            raise AssertionError("reported matching was not unique")
        witnesses.append({"permutation": permutation, "zero_entry": zero})
    assert len(witnesses) == 119
    return witnesses


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--out",
        type=Path,
        default=SCRATCH / "retained-omission-e1" / "round3-power-matrix.json",
    )
    parser.add_argument("--all-hits", action="store_true")
    args = parser.parse_args()

    model = load_model()
    shells = tuple(frozenset(row) for row in model.SHELLS)
    points = tuple(sorted(model.POINTS))
    hits: list[dict[str, object]] = []
    tested = 0

    for rows in itertools.combinations(range(len(shells)), 5):
        for columns in itertools.combinations(points, 5):
            tested += 1
            matrix = tuple(
                tuple(column not in shells[row] for column in columns)
                for row in rows
            )
            available = tuple(
                sum((1 << j) for j, is_nonzero in enumerate(matrix_row) if is_nonzero)
                for matrix_row in matrix
            )
            count, matching = matching_count(available)
            if count != 1 or matching is None:
                continue
            assert all(matrix[i][matching[i]] for i in range(5))
            hit = {
                "rows": rows,
                "row_supports": [sorted(shells[row]) for row in rows],
                "columns": columns,
                "nonzero_matrix": matrix,
                "unique_matching_column_indices": matching,
                "unique_matching_points": [columns[j] for j in matching],
                "other_permutation_zero_witnesses": permutation_zero_witnesses(
                    matrix, matching
                ),
            }
            hits.append(hit)
            if not args.all_hits:
                break
        if hits and not args.all_hits:
            break

    source_bytes = MODEL_PATH.read_bytes()
    report = {
        "schema": "retained-omission-e1-power-pattern-v1",
        "scope": "literal exact n=15 incidence shadow; discovery only",
        "model_path": str(MODEL_PATH.relative_to(ROOT)),
        "model_sha256": hashlib.sha256(source_bytes).hexdigest(),
        "rows": len(shells),
        "columns": len(points),
        "minors_tested": tested,
        "search_exhaustive": args.all_hits or not hits,
        "hit_count": len(hits),
        "hits": hits,
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(report, indent=2) + "\n")
    print(
        f"tested={tested} exhaustive={report['search_exhaustive']} "
        f"hits={len(hits)} out={args.out}"
    )
    if hits:
        first = hits[0]
        print(
            "first_rows=" + ",".join(map(str, first["rows"]))
            + " first_columns=" + ",".join(map(str, first["columns"]))
            + " matching_points=" + ",".join(
                map(str, first["unique_matching_points"])
            )
        )


if __name__ == "__main__":
    main()
