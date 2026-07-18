#!/usr/bin/env python3
"""Exact Kalmanson falsifier on high-girth four-uniform incidence designs.

The projective plane `PG(2,3)` gives a 13-by-13, four-regular incidence
graph of girth six.  The symplectic generalized quadrangle `W(3,3)` gives a
40-by-40, four-regular incidence graph of girth eight.  A random relabeling of
the points supplies the cyclic order; a rejection-sampled line assignment
ensures that no center belongs to its own selected row.  The resulting fixed
row table is sent to the sibling exact rational Kalmanson oracle.

SAT is an exact countermodel to the alternating-four-row positive-contour
lemma.  UNSAT supplies only a fixed-design core, not generic coverage.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import random
from pathlib import Path


def normalize(vector: tuple[int, ...], field: int = 3) -> tuple[int, ...]:
    for entry in vector:
        if entry % field:
            inverse = pow(entry % field, -1, field)
            return tuple((inverse * value) % field for value in vector)
    raise ValueError("zero vector has no projective normalization")


def projective_points(dimension: int) -> tuple[tuple[int, ...], ...]:
    return tuple(
        sorted(
            {
                normalize(vector)
                for vector in itertools.product(range(3), repeat=dimension)
                if any(vector)
            }
        )
    )


def projective_plane() -> tuple[tuple[int, ...], ...]:
    points = projective_points(3)
    index = {point: position for position, point in enumerate(points)}
    lines = {
        tuple(
            sorted(
                index[point]
                for point in points
                if sum(left * right for left, right in zip(form, point)) % 3 == 0
            )
        )
        for form in points
    }
    assert len(points) == 13 and len(lines) == 13
    assert all(len(line) == 4 for line in lines)
    return tuple(sorted(lines))


def symplectic(left: tuple[int, ...], right: tuple[int, ...]) -> int:
    return (
        left[0] * right[2]
        + left[1] * right[3]
        - left[2] * right[0]
        - left[3] * right[1]
    ) % 3


def symplectic_generalized_quadrangle() -> tuple[tuple[int, ...], ...]:
    points = projective_points(4)
    index = {point: position for position, point in enumerate(points)}
    lines: set[tuple[int, ...]] = set()
    for left, right in itertools.combinations(points, 2):
        if symplectic(left, right) != 0:
            continue
        span = {
            normalize(
                tuple((a * x + b * y) % 3 for x, y in zip(left, right))
            )
            for a, b in itertools.product(range(3), repeat=2)
            if a or b
        }
        lines.add(tuple(sorted(index[point] for point in span)))
    assert len(points) == 40 and len(lines) == 40
    assert all(len(line) == 4 for line in lines)
    return tuple(sorted(lines))


def assigned_rows(
    lines: tuple[tuple[int, ...], ...], seed: int
) -> dict[int, tuple[int, ...]]:
    rng = random.Random(seed)
    n = len(lines)
    point_permutation = list(range(n))
    rng.shuffle(point_permutation)
    relabeled = [
        tuple(sorted(point_permutation[point] for point in line)) for line in lines
    ]
    for _ in range(100_000):
        rng.shuffle(relabeled)
        if all(center not in relabeled[center] for center in range(n)):
            return {center: relabeled[center] for center in range(n)}
    raise RuntimeError("failed to find a center-avoiding line assignment")


def load_oracle_module(repo: Path):
    source = (
        repo
        / "scratch/atail-force/variable-card-kalmanson-positive-dual"
        / "search_countermodel.py"
    )
    spec = importlib.util.spec_from_file_location("variable_card_oracle", source)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load exact oracle from {source}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--design", choices=("pg23", "w33"), required=True)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--timeout-ms", type=int, default=600_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    repo = Path(__file__).resolve().parents[3]
    lines = (
        projective_plane()
        if args.design == "pg23"
        else symplectic_generalized_quadrangle()
    )
    rows = assigned_rows(lines, args.seed)
    oracle_module = load_oracle_module(repo)
    oracle = oracle_module.MetricOracle(len(lines), False, args.timeout_ms)
    status, core, payload = oracle.check(rows)
    result = {
        "schema": "p97-structured-design-kalmanson-falsifier-v1",
        "epistemic_status": "EXACT_IF_SAT_FIXED_DESIGN_ONLY_IF_UNSAT",
        "design": args.design,
        "seed": args.seed,
        "n": len(lines),
        "status": str(status).upper(),
        "core": core,
        "rows": {str(center): list(row) for center, row in rows.items()},
    }
    if str(status) == "sat":
        result["distances"] = payload
    elif str(status) == "unknown":
        result["reason_unknown"] = payload
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
