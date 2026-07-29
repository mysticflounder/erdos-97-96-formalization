#!/usr/bin/env python3
"""Independently check a consequence-only core of the v16 six-vertex system."""

from __future__ import annotations

import importlib.util
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
MINER = HERE.parent / "exact_euclidean_subset_core_miner.py"
SYSTEM = HERE / "positive-system.json"
SUBSET = (5, 7, 9, 10, 11, 12)
TIMEOUT_MS = 180_000


def load_miner():
    spec = importlib.util.spec_from_file_location("exact_subset_miner", MINER)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {MINER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    miner = load_miner()
    raw = json.loads(SYSTEM.read_text())
    equations = miner.normalize_equations(
        raw["equations"],
        expected_class_count=19,
        expected_equation_count=38,
    )
    induced = miner.induced_equations(SUBSET, equations)
    local = {vertex: index for index, vertex in enumerate(SUBSET)}
    x = [z3.Real(f"x_{vertex}") for vertex in SUBSET]
    y = [z3.Real(f"y_{vertex}") for vertex in SUBSET]

    def orientation(a: int, b: int, c: int):
        return miner.orient(x, y, local[a], local[b], local[c])

    named: list[tuple[str, z3.BoolRef]] = [
        ("gauge_q5_x", x[local[5]] == 0),
        ("gauge_q5_y", y[local[5]] == 0),
        ("gauge_q10_x", x[local[10]] == 1),
        ("gauge_q10_y", y[local[10]] == 0),
        # These five cyclic triples are direct consequences of strict convexity
        # in the frozen order q5 < q7 < q9 < q10 < q11 < q12.
        ("cyclic_5_7_9", orientation(5, 7, 9) > 0),
        ("cyclic_5_7_11", orientation(5, 7, 11) > 0),
        ("cyclic_5_7_12", orientation(5, 7, 12) > 0),
        ("cyclic_5_9_11", orientation(5, 9, 11) > 0),
        ("cyclic_9_10_11", orientation(9, 10, 11) > 0),
    ]
    for equation in induced:
        la, lb = (local[v] for v in equation.left_edge)
        ra, rb = (local[v] for v in equation.right_edge)
        named.append(
            (
                f"eq_source_{equation.source_index}",
                miner.dist2(x, y, la, lb) == miner.dist2(x, y, ra, rb),
            )
        )

    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=TIMEOUT_MS, unsat_core=True, random_seed=0)
    for name, expression in named:
        solver.assert_and_track(expression, z3.Bool(f"track_{name}"))
    started = time.monotonic()
    verdict = solver.check()
    elapsed = time.monotonic() - started
    z3_result = {
        "status": str(verdict).upper(),
        "elapsed_seconds": elapsed,
        "reason_unknown": solver.reason_unknown() if verdict == z3.unknown else None,
        "unsat_core": (
            [str(item).removeprefix("track_") for item in solver.unsat_core()]
            if verdict == z3.unsat
            else None
        ),
    }

    direct = z3.SolverFor("QF_NRA")
    direct.add(*(expression for _, expression in named))
    smt2 = direct.to_smt2()
    smt2_path = HERE / "core6-reduced-obstruction.smt2"
    smt2_path.write_text(smt2)
    cvc5_result = miner.run_cvc5_text(smt2, TIMEOUT_MS)
    status = (
        "VALIDATED_UNSAT"
        if verdict == z3.unsat and cvc5_result["status"] == "UNSAT"
        else "UNKNOWN_FAIL_CLOSED"
    )
    output = {
        "schema": "v16-core6-reduced-obstruction-v1",
        "epistemic_status": status,
        "subset": list(SUBSET),
        "source_equations": [equation.as_json() for equation in induced],
        "retained_orientation_constraints": [
            name for name, _ in named if name.startswith("cyclic_")
        ],
        "z3": z3_result,
        "cvc5": cvc5_result,
        "smt2": str(smt2_path),
        "scope": (
            "This formula retains only consequences of the full six-vertex "
            "strict-convex system, so its UNSAT implies full-system UNSAT."
        ),
    }
    output_path = HERE / "core6-reduced-obstruction.json"
    output_path.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output_path),
                "status": status,
                "z3": z3_result["status"],
                "z3_seconds": elapsed,
                "z3_core": z3_result["unsat_core"],
                "cvc5": cvc5_result["status"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
