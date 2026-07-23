#!/usr/bin/env python3
"""Audit positive selected-row equalities in strict convex cyclic order.

This intentionally omits MEC constraints, negative radius-class atoms,
criticality, and `noM44`.  It is an exact QF_NRA query over reals with a hard
timeout.  `UNKNOWN` is unresolved under budget, never evidence of
infeasibility.
"""

from __future__ import annotations

import argparse
import json
import time
from pathlib import Path
from typing import Any

import z3


def squared_distance(
    xs: list[z3.ArithRef], ys: list[z3.ArithRef], left: int, right: int
) -> z3.ArithRef:
    return (xs[left] - xs[right]) ** 2 + (ys[left] - ys[right]) ** 2


def orientation(
    xs: list[z3.ArithRef], ys: list[z3.ArithRef], a: int, b: int, c: int
) -> z3.ArithRef:
    return (
        (xs[b] - xs[a]) * (ys[c] - ys[a])
        - (ys[b] - ys[a]) * (xs[c] - xs[a])
    )


def audit(path: Path, timeout_seconds: int) -> dict[str, Any]:
    artifact = json.loads(path.read_text(encoding="utf-8"))
    order = tuple(map(int, artifact["boundary_order"]))
    n = int(artifact["n"])
    if order != tuple(range(n)):
        raise ValueError("the current audit expects canonical boundary labels")
    rows = {
        int(center): tuple(sorted(map(int, support)))
        for center, support in artifact["decoded"]["rows"].items()
    }
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_seconds * 1000)
    xs = [z3.Real(f"x_{point}") for point in range(n)]
    ys = [z3.Real(f"y_{point}") for point in range(n)]

    # Any strict convex realization can be sent to this normalization by an
    # orientation-preserving Euclidean similarity.
    solver.add(xs[0] == 0, ys[0] == 0, xs[1] == 1, ys[1] == 0)

    # Every other carrier point lies strictly to the left of each oriented
    # boundary edge.  This is the exact supporting-line form of strict convex
    # CCW cyclic order and uses fewer atoms than enumerating all triples.
    orientation_atom_count = 0
    for edge_start in range(n):
        edge_finish = (edge_start + 1) % n
        for point in range(n):
            if point in {edge_start, edge_finish}:
                continue
            solver.add(
                orientation(xs, ys, edge_start, edge_finish, point) > 0
            )
            orientation_atom_count += 1

    row_equality_count = 0
    for center, support in sorted(rows.items()):
        anchor = support[0]
        radius_square = squared_distance(xs, ys, center, anchor)
        for point in support[1:]:
            solver.add(
                squared_distance(xs, ys, center, point) == radius_square
            )
            row_equality_count += 1

    started = time.monotonic()
    status = solver.check()
    elapsed = time.monotonic() - started
    result: dict[str, Any] = {
        "input": str(path),
        "opp1_card": int(artifact["opp1_card"]),
        "solver": "Z3 SolverFor(QF_NRA)",
        "solver_status": str(status).upper(),
        "reason_unknown": solver.reason_unknown() if status == z3.unknown else None,
        "elapsed_seconds": elapsed,
        "timeout_seconds": timeout_seconds,
        "normalization": ["p0=(0,0)", "p1=(1,0)"],
        "strict_supporting_line_atom_count": orientation_atom_count,
        "positive_selected_row_equality_count": row_equality_count,
        "rows": {str(center): list(support) for center, support in sorted(rows.items())},
    }
    if status == z3.sat:
        model = solver.model()
        result["coordinate_model"] = {
            str(point): {
                "x": str(model.eval(xs[point], model_completion=True)),
                "y": str(model.eval(ys[point], model_completion=True)),
            }
            for point in range(n)
        }
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("artifacts", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=120)
    args = parser.parse_args()
    result = {
        "schema": "p97-unique4-corrected-survivor-qf-nra-audit-v1",
        "epistemic_status": "EXACT QF_NRA STATUS UNDER EXPLICIT TIMEOUT",
        "claim_scope": (
            "Positive selected-row equalities plus strict convex cyclic order only; "
            "MEC, negative radius atoms, criticality, and noM44 are omitted"
        ),
        "records": [
            audit(path, args.timeout_seconds) for path in args.artifacts
        ],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            [
                {
                    "opp1_card": record["opp1_card"],
                    "solver_status": record["solver_status"],
                    "reason_unknown": record["reason_unknown"],
                    "elapsed_seconds": record["elapsed_seconds"],
                }
                for record in result["records"]
            ],
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
