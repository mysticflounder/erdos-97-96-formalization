#!/usr/bin/env python3
"""Independent exact check of the normalized six-vertex angular obstruction."""

from __future__ import annotations

import importlib.util
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
MINER = HERE.parent / "exact_euclidean_subset_core_miner.py"
TIMEOUT_MS = 30_000


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
    u, v, a, b, c, d = z3.Reals("u v a b c d")
    radius2 = u * u + v * v
    projection = a * u + b * v
    constraints = [
        radius2 == 2 * u,
        u > 0,
        u < 1,
        v > 0,
        -a * v - b * u > 0,
        a * v - b * u > 0,
        radius2 * (c + a) == 2 * projection * u,
        radius2 * (d + b) == 2 * projection * v,
        a * d - b * c > 0,
    ]
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=TIMEOUT_MS, unsat_core=True, random_seed=0)
    names = [
        "circle",
        "u_positive",
        "u_below_one",
        "v_positive",
        "q7_before_q9",
        "q7_before_q11",
        "q12_reflection_x",
        "q12_reflection_y",
        "q7_before_q12",
    ]
    for name, constraint in zip(names, constraints, strict=True):
        solver.assert_and_track(constraint, z3.Bool(f"track_{name}"))
    started = time.monotonic()
    verdict = solver.check()
    z3_result = {
        "status": str(verdict).upper(),
        "elapsed_seconds": time.monotonic() - started,
        "unsat_core": (
            [str(item).removeprefix("track_") for item in solver.unsat_core()]
            if verdict == z3.unsat
            else None
        ),
        "reason_unknown": solver.reason_unknown() if verdict == z3.unknown else None,
    }

    direct = z3.SolverFor("QF_NRA")
    direct.add(*constraints)
    smt2 = direct.to_smt2()
    smt2_path = HERE / "core6-normalized-obstruction.smt2"
    smt2_path.write_text(smt2)
    cvc5_result = miner.run_cvc5_text(smt2, TIMEOUT_MS)
    status = (
        "VALIDATED_UNSAT"
        if verdict == z3.unsat and cvc5_result["status"] == "UNSAT"
        else "UNKNOWN_FAIL_CLOSED"
    )
    output = {
        "schema": "v16-core6-normalized-obstruction-v1",
        "epistemic_status": status,
        "source_subset": [5, 7, 9, 10, 11, 12],
        "normalization": {
            "q5": [0, 0],
            "q10": [1, 0],
            "q9": ["u", "-v"],
            "q11": ["u", "v"],
            "q7": ["a", "b"],
            "q12": ["c", "d"],
        },
        "bridge": [
            "Sources 19,22,23 and cyclic order force q9=(u,-v), q11=(u,v).",
            "The common q10 radius gives u^2+v^2=2u.",
            "Opposite sides of chord q9-q11 give 0<u<1 and v>0.",
            "cyclic(q5,q7,q9) and cyclic(q5,q7,q11) give the two determinant inequalities.",
            "Sources 16,34 make q12 the reflection of q7 across line q5-q11; the two polynomial reflection equations encode this without division.",
            "cyclic(q5,q7,q12) selects the distinct reflection branch.",
            "The q9/q11 angle forced by the first circle is too wide for the second reflected pair to retain the cyclic order.",
        ],
        "constraints": dict(zip(names, map(str, constraints), strict=True)),
        "z3": z3_result,
        "cvc5": cvc5_result,
        "smt2": str(smt2_path),
        "trust_scope": (
            "Independent exact QF_NRA check of the normalized algebraic "
            "obstruction. The bridge is an auditable Euclidean derivation, not "
            "yet a kernel-checked Lean proof."
        ),
    }
    output_path = HERE / "core6-normalized-obstruction.json"
    output_path.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output_path),
                "status": status,
                "z3": z3_result["status"],
                "z3_seconds": z3_result["elapsed_seconds"],
                "cvc5": cvc5_result["status"],
                "cvc5_seconds": cvc5_result["elapsed_seconds"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
