#!/usr/bin/env python3
"""Kalmanson/metric LP census for every cyclic order of the E1 shadow.

The three Moser apices separate the three four-point strict-cap interiors, so
there are 4!^3 label orders after fixing orientation and the apex labels.  For
each order this script substitutes the shadow's forced distance equalities
into every strict Kalmanson inequality.  Optionally it also adds all strict
triangle inequalities.  Homogeneity lets every strict slack and every
positive distance be normalized to at least one.

This is an exact rational linear system tested through floating-point HiGHS;
the census is theorem-discovery evidence until an infeasible case is replayed
with a rational Farkas/Motzkin certificate or reduced to a banked Lean kernel.
"""

from __future__ import annotations

import argparse
from concurrent.futures import ProcessPoolExecutor
import hashlib
import importlib.util
import itertools
import json
import os
from pathlib import Path

import numpy as np
from scipy.optimize import linprog
from scipy.sparse import csr_matrix


REPO = Path(__file__).resolve().parents[2]
SHADOW_PATH = REPO / "scratch" / "triapex-incidence-obstruction" / "check_model.py"
CAPS = ((0, 1, 2, 3), (4, 5, 6, 7), (8, 9, 10, 11))
PERMS = tuple(itertools.permutations(range(4)))


def load_shadow():
    spec = importlib.util.spec_from_file_location("triapex_check_model", SHADOW_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {SHADOW_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


SHADOW = load_shadow()
EDGE_ROOTS = SHADOW.install_equal_distance_classes()
ROOTS = tuple(sorted(set(EDGE_ROOTS.values())))
ROOT_INDEX = {root: index for index, root in enumerate(ROOTS)}
EDGE_VARIABLE = {edge: ROOT_INDEX[root] for edge, root in EDGE_ROOTS.items()}


def edge_variable(left: int, right: int) -> int:
    return EDGE_VARIABLE[tuple(sorted((left, right)))]


def labels(cap: int, permutation_index: int) -> tuple[int, ...]:
    source = CAPS[cap]
    return tuple(source[index] for index in PERMS[permutation_index])


def cyclic_order(indices: tuple[int, int, int]) -> tuple[int, ...]:
    p0, p1, p2 = indices
    # cap 2 is between apices 12 and 13, cap 0 between 13 and 14,
    # and cap 1 between 14 and 12.
    return (
        12,
        *labels(2, p2),
        13,
        *labels(0, p0),
        14,
        *labels(1, p1),
    )


def normalized_row(positive: tuple[int, ...], negative: tuple[int, ...]) -> np.ndarray:
    """Return coefficients for ``sum(positive)-sum(negative) >= 1``."""
    row = np.zeros(len(ROOTS), dtype=float)
    for variable in positive:
        row[variable] += 1.0
    for variable in negative:
        row[variable] -= 1.0
    return row


def solve_order(payload: tuple[int, int, int, bool]) -> dict[str, object]:
    p0, p1, p2, with_triangle = payload
    order = cyclic_order((p0, p1, p2))
    rows: list[np.ndarray] = []
    origins: list[tuple[str, tuple[int, ...]]] = []

    for i, j, k, ell in itertools.combinations(range(15), 4):
        a, b, c, d = order[i], order[j], order[k], order[ell]
        diagonals = (edge_variable(a, c), edge_variable(b, d))
        rows.append(
            normalized_row(
                diagonals,
                (edge_variable(a, b), edge_variable(c, d)),
            )
        )
        origins.append(("K1", (a, b, c, d)))
        rows.append(
            normalized_row(
                diagonals,
                (edge_variable(a, d), edge_variable(b, c)),
            )
        )
        origins.append(("K2", (a, b, c, d)))

    if with_triangle:
        for a, b, c in itertools.combinations(range(15), 3):
            ab, ac, bc = edge_variable(a, b), edge_variable(a, c), edge_variable(b, c)
            rows.append(normalized_row((ab, bc), (ac,)))
            origins.append(("T", (a, b, c, 0)))
            rows.append(normalized_row((ab, ac), (bc,)))
            origins.append(("T", (a, c, b, 0)))
            rows.append(normalized_row((ac, bc), (ab,)))
            origins.append(("T", (b, c, a, 0)))

    collapsed = [index for index, row in enumerate(rows) if not np.any(row)]
    if collapsed:
        first = collapsed[0]
        return {
            "permutation_indices": (p0, p1, p2),
            "order": order,
            "status": "collapsed_strict_inequality",
            "origin": origins[first],
        }

    # >= 1 becomes -row <= -1.  Positivity is encoded by variable bounds.
    matrix = csr_matrix(-np.vstack(rows))
    result = linprog(
        np.zeros(len(ROOTS)),
        A_ub=matrix,
        b_ub=-np.ones(len(rows)),
        bounds=[(1.0, None)] * len(ROOTS),
        method="highs",
        options={"presolve": True},
    )
    if result.status == 0:
        slacks = np.asarray(result.ineqlin.residual)
        return {
            "permutation_indices": (p0, p1, p2),
            "order": order,
            "status": "feasible",
            "minimum_reported_slack": float(np.min(slacks)),
            "maximum_distance_variable": float(np.max(result.x)),
        }
    return {
        "permutation_indices": (p0, p1, p2),
        "order": order,
        "status": "infeasible" if result.status == 2 else "solver_other",
        "solver_status": int(result.status),
        "solver_message": str(result.message),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--workers", type=int, default=min(24, os.cpu_count() or 1))
    parser.add_argument("--with-triangle", action="store_true")
    parser.add_argument("--limit", type=int)
    parser.add_argument("--keep", type=int, default=100)
    parser.add_argument(
        "--out",
        type=Path,
        default=REPO / "scratch" / "retained-omission-e1" / "round4-kalmanson-lp.json",
    )
    args = parser.parse_args()

    payloads = [
        (p0, p1, p2, args.with_triangle)
        for p0 in range(24)
        for p1 in range(24)
        for p2 in range(24)
    ]
    if args.limit is not None:
        payloads = payloads[: args.limit]

    with ProcessPoolExecutor(max_workers=args.workers) as pool:
        results = list(pool.map(solve_order, payloads, chunksize=8))

    counts: dict[str, int] = {}
    for result in results:
        status = str(result["status"])
        counts[status] = counts.get(status, 0) + 1
    representatives: dict[str, list[dict[str, object]]] = {}
    for status in counts:
        representatives[status] = [
            result for result in results if result["status"] == status
        ][: args.keep]

    report = {
        "schema": "retained-omission-e1-kalmanson-lp-v1",
        "scope": "literal n=15 equality shadow; floating HiGHS discovery census",
        "shadow_path": str(SHADOW_PATH.relative_to(REPO)),
        "shadow_sha256": hashlib.sha256(SHADOW_PATH.read_bytes()).hexdigest(),
        "distance_equality_variables": len(ROOTS),
        "orders_tested": len(results),
        "orders_exhaustive": len(results) == 24**3,
        "with_strict_triangle_inequalities": args.with_triangle,
        "status_counts": counts,
        "representatives": representatives,
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(report, indent=2) + "\n")
    print(
        f"orders={len(results)} exhaustive={report['orders_exhaustive']} "
        f"variables={len(ROOTS)} counts={json.dumps(counts, sort_keys=True)}"
    )
    print(f"out={args.out}")


if __name__ == "__main__":
    main()
