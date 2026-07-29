#!/usr/bin/env python3
"""Exact rebased QF_NRA check of the six-vertex v16 mirror-interleaving core."""

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
    x = [z3.Real(f"x_{i}") for i in range(len(SUBSET))]
    y = [z3.Real(f"y_{i}") for i in range(len(SUBSET))]
    named: list[tuple[str, z3.BoolRef]] = []

    # Similarity gauge on q5 and q10, which are provably distinct in a strictly
    # convex realization. This is equivalent to the source problem but exposes
    # the perpendicular-bisector symmetries directly.
    named.extend(
        [
            ("gauge_q5_x", x[local[5]] == 0),
            ("gauge_q5_y", y[local[5]] == 0),
            ("gauge_q10_x", x[local[10]] == 1),
            ("gauge_q10_y", y[local[10]] == 0),
        ]
    )
    k = len(SUBSET)
    for a in range(k):
        b = (a + 1) % k
        for c in range(k):
            if c not in (a, b):
                named.append(
                    (
                        f"orient_{SUBSET[a]}_{SUBSET[b]}_{SUBSET[c]}",
                        miner.orient(x, y, a, b, c) > 0,
                    )
                )
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
    z3_elapsed = time.monotonic() - started
    z3_result = {
        "status": str(verdict).upper(),
        "elapsed_seconds": z3_elapsed,
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
    smt2_path = HERE / "core6-rebased.smt2"
    smt2_path.write_text(smt2)
    cvc5_result = miner.run_cvc5_text(smt2, TIMEOUT_MS)
    status = (
        "VALIDATED_UNSAT"
        if verdict == z3.unsat and cvc5_result["status"] == "UNSAT"
        else "UNKNOWN_FAIL_CLOSED"
    )
    output = {
        "schema": "v16-core6-rebased-v1",
        "epistemic_status": status,
        "subset": list(SUBSET),
        "gauge": "q5=(0,0), q10=(1,0), justified by strict convex distinctness",
        "induced_equations": [equation.as_json() for equation in induced],
        "constraint_count": len(named),
        "z3": z3_result,
        "cvc5": cvc5_result,
        "smt2": str(smt2_path),
        "trust_scope": (
            "Exact QF_NRA classification of the induced six-vertex positive-row "
            "system. This is not CEGAR or Lean closure."
        ),
    }
    output_path = HERE / "core6-rebased.json"
    output_path.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output_path),
                "status": status,
                "equation_count": len(induced),
                "z3": z3_result["status"],
                "z3_seconds": z3_elapsed,
                "z3_core_size": len(z3_result["unsat_core"] or []),
                "cvc5": cvc5_result["status"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
