#!/usr/bin/env python3
"""Hand-known smoke gate for the BitVec/CNF/CaDiCaL/DRAT pipeline."""

from __future__ import annotations

import argparse
import json
import subprocess
import tempfile
from pathlib import Path

import z3


def pipeline(ctx: z3.Context):
    return z3.Then(
        "simplify", "propagate-values", "elim-term-ite", "solve-eqs",
        "lia2card", "card2bv", "bit-blast", "tseitin-cnf", ctx=ctx,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    result: dict[str, object] = {
        "schema": "p97-distinct-aggregate-bitblast-smoke-v1",
        "hand_expectations": {
            "sat": "x=0,y=1 satisfies y>x",
            "unsat": "x=y and x>y is impossible",
        },
    }
    with tempfile.TemporaryDirectory() as raw:
        root = Path(raw)
        for name in ("sat", "unsat"):
            # One context per export prevents Z3's context-local fresh-name
            # counters from producing an invalid DIMACS header.
            ctx = z3.Context()
            x = z3.BitVec(f"{name}_x", 2, ctx=ctx)
            y = z3.BitVec(f"{name}_y", 2, ctx=ctx)
            formula = [
                z3.ULT(x, z3.BitVecVal(3, 2, ctx=ctx)),
                z3.ULT(y, z3.BitVecVal(3, 2, ctx=ctx)),
            ]
            formula.extend([z3.UGT(y, x)] if name == "sat" else [
                x == y, z3.UGT(x, y),
            ])
            goal = z3.Goal(ctx=ctx)
            goal.add(*formula)
            transformed = pipeline(ctx)(goal)
            if len(transformed) != 1:
                raise AssertionError("smoke bitblast did not produce one CNF")
            cnf = root / f"{name}.cnf"
            proof = root / f"{name}.drat"
            cnf.write_text(transformed[0].dimacs(include_names=True), encoding="utf-8")
            source = z3.Solver(ctx=ctx)
            source.add(*formula)
            source_status = str(source.check()).upper()
            run = subprocess.run(
                ["cadical", "--plain", str(cnf), str(proof)],
                text=True, capture_output=True, check=False,
            )
            cadical = {10: "SAT", 20: "UNSAT"}.get(run.returncode, "UNKNOWN")
            drat = None
            if cadical == "UNSAT":
                replay = subprocess.run(
                    ["drat-trim", str(cnf), str(proof)],
                    text=True, capture_output=True, check=False,
                )
                drat = replay.returncode == 0 and "s VERIFIED" in replay.stdout
            result[name] = {
                "source_z3": source_status,
                "cadical": cadical,
                "cadical_returncode": run.returncode,
                "drat_verified": drat,
                "cadical_output_tail": (run.stdout + run.stderr)[-500:],
            }
    if result["sat"]["source_z3"] != "SAT" or result["sat"]["cadical"] != "SAT":
        raise AssertionError(result["sat"])
    if (result["unsat"]["source_z3"] != "UNSAT"
            or result["unsat"]["cadical"] != "UNSAT"
            or result["unsat"]["drat_verified"] is not True):
        raise AssertionError(result["unsat"])
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
