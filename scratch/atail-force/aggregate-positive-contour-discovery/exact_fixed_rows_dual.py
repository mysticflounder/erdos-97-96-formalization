#!/usr/bin/env python3
"""Extract a sparse exact Kalmanson/Farkas dual for one fixed row table.

This is theorem-discovery instrumentation, not a coverage checker.  The input
JSON must contain ``n`` and a four-target ``rows`` map.  A floating HiGHS
feasibility solve selects a sparse support; Z3 then reconstructs and replays
an exact rational dual on that support.  SAT of the dual proves that the fixed
row table is incompatible with every strict Kalmanson distance table.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from collections import defaultdict
from fractions import Fraction
from pathlib import Path

import numpy as np
import scipy.optimize
import scipy.sparse
import z3


Edge = tuple[int, int]


def edge(left: int, right: int) -> Edge:
    if left == right:
        raise ValueError("distance loop")
    return (left, right) if left < right else (right, left)


def kalmanson_terms(kind: int, a: int, b: int, c: int, d: int) -> dict[Edge, int]:
    result: dict[Edge, int] = {
        edge(a, c): 1,
        edge(b, d): 1,
    }
    negative = ((a, b), (c, d)) if kind == 1 else ((a, d), (b, c))
    for left, right in negative:
        item = edge(left, right)
        result[item] = result.get(item, 0) - 1
    return {item: value for item, value in result.items() if value}


def row_terms(center: int, anchor: int, point: int) -> dict[Edge, int]:
    return {edge(center, point): 1, edge(center, anchor): -1}


def rational(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--active-tolerance", type=float, default=1e-9)
    parser.add_argument(
        "--kalmanson-core-vertices",
        action="store_true",
        help="restrict strict inequalities to vertices named by the input equality core",
    )
    args = parser.parse_args()

    source = json.loads(args.input.read_text(encoding="utf-8"))
    n = int(source["n"])
    rows = {
        int(center): tuple(sorted(map(int, support)))
        for center, support in source["rows"].items()
    }
    if set(rows) != set(range(n)):
        raise ValueError("row centers do not cover the carrier")
    if any(len(support) != 4 or center in support for center, support in rows.items()):
        raise ValueError("every row must have four non-center targets")

    edges = tuple(itertools.combinations(range(n), 2))
    edge_index = {item: index for index, item in enumerate(edges)}
    core_vertices = set(range(n))
    if args.kalmanson_core_vertices:
        if not source.get("core"):
            raise ValueError("--kalmanson-core-vertices requires an input core")
        core_vertices = {
            int(vertex)
            for equality in source["core"]
            for vertex in equality
        }
    kal_names: list[str] = []
    kal_vectors: list[dict[Edge, int]] = []
    for a, b, c, d in itertools.combinations(sorted(core_vertices), 4):
        for kind in (1, 2):
            kal_names.append(f"kal{kind}_{a}_{b}_{c}_{d}")
            kal_vectors.append(kalmanson_terms(kind, a, b, c, d))
    row_names: list[str] = []
    row_vectors: list[dict[Edge, int]] = []
    if source.get("core"):
        # The fixed-row oracle's assumption core is already an exact subset
        # of the selected-row equalities.  Restricting to it avoids asking
        # HiGHS for an arbitrary dense basic solution on the whole row table.
        for center, left, right in source["core"]:
            center, left, right = int(center), int(left), int(right)
            row_names.append(f"row_{center}_{left}_{right}")
            row_vectors.append(row_terms(center, left, right))
    else:
        for center, support in rows.items():
            anchor = support[0]
            for point in support[1:]:
                row_names.append(f"row_{center}_{anchor}_{point}")
                row_vectors.append(row_terms(center, anchor, point))

    column_count = len(kal_vectors) + len(row_vectors)
    matrix_row: list[int] = []
    matrix_col: list[int] = []
    matrix_value: list[int] = []
    for column, vector in enumerate((*kal_vectors, *row_vectors)):
        for item, coefficient in vector.items():
            matrix_row.append(edge_index[item])
            matrix_col.append(column)
            matrix_value.append(coefficient)
    # Last equation normalizes the nonnegative strict weight to one.
    normalization_row = len(edges)
    for column in range(len(kal_vectors)):
        matrix_row.append(normalization_row)
        matrix_col.append(column)
        matrix_value.append(1)
    equality_matrix = scipy.sparse.csc_matrix(
        (matrix_value, (matrix_row, matrix_col)),
        shape=(len(edges) + 1, column_count),
        dtype=float,
    )
    equality_rhs = np.zeros(len(edges) + 1)
    equality_rhs[-1] = 1.0
    bounds = [(0.0, None)] * len(kal_vectors) + [(None, None)] * len(row_vectors)
    lp = scipy.optimize.linprog(
        np.zeros(column_count),
        A_eq=equality_matrix,
        b_eq=equality_rhs,
        bounds=bounds,
        method="highs-ds",
        options={"presolve": True},
    )
    payload: dict[str, object] = {
        "schema": "p97-fixed-row-positive-kalmanson-dual-v1",
        "epistemic_status": "EXACT_ONLY_IF_Z3_REPLAY_VALID",
        "input": str(args.input),
        "n": n,
        "row_count": len(rows),
        "kalmanson_variable_count": len(kal_vectors),
        "lp_status": int(lp.status),
        "lp_message": lp.message,
    }
    if not lp.success:
        payload["status"] = "NO_DUAL_FOUND_BY_HIGHS"
    else:
        active_kal = [
            index for index, value in enumerate(lp.x[: len(kal_vectors)])
            if value > args.active_tolerance
        ]
        active_rows = [
            index for index, value in enumerate(lp.x[len(kal_vectors) :])
            if abs(value) > args.active_tolerance
        ]
        exact_variables = {
            ("kal", index): z3.Real(f"lk_{position}")
            for position, index in enumerate(active_kal)
        }
        exact_variables.update({
            ("row", index): z3.Real(f"lr_{position}")
            for position, index in enumerate(active_rows)
        })
        solver = z3.Solver()
        for index in active_kal:
            solver.add(exact_variables["kal", index] >= 0)
        solver.add(sum(exact_variables["kal", index] for index in active_kal) == 1)
        for item in edges:
            solver.add(
                sum(
                    exact_variables["kal", index] * kal_vectors[index].get(item, 0)
                    for index in active_kal
                )
                + sum(
                    exact_variables["row", index] * row_vectors[index].get(item, 0)
                    for index in active_rows
                )
                == 0
            )
        exact_status = solver.check()
        payload["lp_active_kalmanson"] = len(active_kal)
        payload["lp_active_rows"] = len(active_rows)
        payload["exact_status"] = str(exact_status).upper()
        if exact_status == z3.sat:
            model = solver.model()
            exact: dict[str, Fraction] = {}
            for index in active_kal:
                value = rational(model.eval(exact_variables["kal", index], model_completion=True))
                if value:
                    exact[kal_names[index]] = value
            for index in active_rows:
                value = rational(model.eval(exact_variables["row", index], model_completion=True))
                if value:
                    exact[row_names[index]] = value
            denominator = math.lcm(*(value.denominator for value in exact.values()))
            integers = {name: int(value * denominator) for name, value in exact.items()}
            divisor = math.gcd(*(abs(value) for value in integers.values() if value))
            integers = {name: value // divisor for name, value in integers.items() if value}
            residue: dict[Edge, int] = defaultdict(int)
            strict_weight = 0
            for name, multiplier in integers.items():
                if name.startswith("kal"):
                    index = kal_names.index(name)
                    vector = kal_vectors[index]
                    if multiplier <= 0:
                        raise AssertionError("nonpositive strict multiplier")
                    strict_weight += multiplier
                else:
                    index = row_names.index(name)
                    vector = row_vectors[index]
                for item, coefficient in vector.items():
                    residue[item] += multiplier * coefficient
            residue = {item: value for item, value in residue.items() if value}
            if residue or strict_weight <= 0:
                raise AssertionError(f"exact replay failed: {residue}, weight={strict_weight}")
            payload.update({
                "status": "EXACT_POSITIVE_DUAL",
                "strict_weight": strict_weight,
                "active_kalmanson": sum(name.startswith("kal") for name in integers),
                "active_row_equalities": sum(name.startswith("row") for name in integers),
                "used_row_centers": sorted({
                    int(name.split("_")[1])
                    for name in integers if name.startswith("row")
                }),
                "multipliers": {name: value for name, value in sorted(integers.items())},
                "exact_vector_cancellation": True,
            })
        else:
            payload["status"] = "FLOAT_SUPPORT_FAILED_EXACT_REPLAY"

    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
