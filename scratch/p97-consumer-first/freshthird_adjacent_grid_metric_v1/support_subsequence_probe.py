#!/usr/bin/env python3
"""Exact projection to the apex and the two four-point radius supports.

Every full Euclidean replay projects to this subsystem: strict convex order is
inherited by a boundary subsequence, and all selected-class member equations
remain true.  SAT here is only a projection witness, not a full realization.
"""

from __future__ import annotations

import argparse
import json
import time
from itertools import combinations
from pathlib import Path

import z3

import freshthird_adjacent_grid_metric_v1 as core


HERE = Path(__file__).resolve().parent


def solve(orientation: str, branch: int, timeout_ms: int) -> dict[str, object]:
    sig = core.freeze_signature(orientation, branch)
    if sig is None:
        return {"orientation": orientation, "radial_branch": branch, "structural": "unsat"}

    center = core.APICES[0]
    labels = {center} | set(sig.radius_supports[0]) | set(sig.radius_supports[1])
    boundary = tuple(point for point in sig.boundary if point in labels)
    x = {point: z3.Real(f"probe_{orientation}_b{branch}_x_{point}") for point in labels}
    y = {point: z3.Real(f"probe_{orientation}_b{branch}_y_{point}") for point in labels}
    q = [z3.Real(f"probe_{orientation}_b{branch}_radius{r}_sq") for r in range(2)]

    def signed_area(a: int, b: int, c: int) -> z3.ArithRef:
        return (x[b] - x[a]) * (y[c] - y[a]) - (x[c] - x[a]) * (y[b] - y[a])

    def squared_distance(a: int, b: int) -> z3.ArithRef:
        return (x[a] - x[b]) ** 2 + (y[a] - y[b]) ** 2

    assertions: list[z3.BoolRef] = []
    for i, j, k in combinations(range(len(boundary)), 3):
        assertions.append(signed_area(boundary[i], boundary[j], boundary[k]) < 0)
    # Translation/rotation/scaling gauge.  A support point is nonzero because
    # its selected-class squared radius is positive.
    anchor = next(point for point in boundary if point != center)
    assertions += [x[center] == 0, y[center] == 0, x[anchor] == 1, y[anchor] == 0]
    for radius in range(2):
        assertions.append(q[radius] > 0)
        assertions.extend(
            squared_distance(center, point) == q[radius]
            for point in sig.radius_supports[radius]
        )
    assertions.append(q[0] < q[1] if branch < 2 else q[1] < q[0])

    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    solver.add(*assertions)
    start = time.monotonic()
    answer = solver.check()
    elapsed = time.monotonic() - start
    answer_name = core.status(answer, solver)
    validation: str | list[str] = "n/a"
    if answer == z3.sat:
        model = solver.model()
        failures = [
            index
            for index, term in enumerate(assertions)
            if not z3.is_true(model.eval(term, model_completion=True))
        ]
        validation = "pass" if not failures else [f"constraint {index}" for index in failures]
        if failures:
            raise RuntimeError(f"projection model validation failed: {failures[:5]}")

    smt_path = core.write_smt(f"support_probe_{orientation}_b{branch}", solver)
    return {
        "orientation": orientation,
        "radial_branch": branch,
        "structural": "sat",
        "boundary_subsequence": boundary,
        "radius_supports": sig.radius_supports,
        "z3": answer_name,
        "seconds": round(elapsed, 3),
        "independent_validation": validation,
        "cvc5": core.cvc5_status(solver.to_smt2(), timeout_ms),
        "smt2": smt_path.name,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    args = parser.parse_args()
    report = {
        "classification": "necessary support-subsequence projection; SAT does not lift",
        "omitted": [
            "the other carrier labels",
            "MEC and cap equations",
            "selected-class nonmember inequalities",
            "source rows and singleton slices",
            "strict Kalmanson conclusion",
        ],
        "arms": [
            solve(orientation, branch, args.timeout_ms)
            for orientation in ("direct", "mirror")
            for branch in range(4)
        ],
    }
    (HERE / "support_probe_results.json").write_text(
        json.dumps(report, indent=2) + "\n", encoding="utf-8"
    )
    for item in report["arms"]:
        prefix = f"{item['orientation']} branch {item['radial_branch']}"
        if item["structural"] == "unsat":
            print(f"{prefix}: structural=unsat")
        else:
            print(
                f"{prefix}: z3={item['z3']} cvc5={item['cvc5']} "
                f"validation={item['independent_validation']}"
            )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
