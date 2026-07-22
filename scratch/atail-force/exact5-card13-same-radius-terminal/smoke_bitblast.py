#!/usr/bin/env python3
"""Hand-check the BitVec-to-CNF and CaDiCaL/DRAT pipeline."""

from __future__ import annotations

import argparse
import json
import subprocess
import tempfile
from pathlib import Path

import z3


def pipeline(ctx: z3.Context):
    return z3.Then(
        "simplify",
        "propagate-values",
        "elim-term-ite",
        "solve-eqs",
        "lia2card",
        "card2bv",
        "bit-blast",
        "tseitin-cnf",
        ctx=ctx,
    )


def export(ctx: z3.Context, formula: list[z3.BoolRef], path: Path) -> None:
    goal = z3.Goal(ctx=ctx)
    goal.add(*formula)
    result = pipeline(ctx)(goal)
    if len(result) != 1:
        raise AssertionError(f"expected one CNF subgoal, got {len(result)}")
    path.write_text(result[0].dimacs(include_names=True), encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    output: dict[str, object] = {
        "schema": "p97-bitblast-ordinal-hand-smoke-v1",
        "hand_expectation": {
            "sat": "x=0,y=1 satisfies y>x",
            "unsat": "x=y and x>y is impossible",
        },
    }
    with tempfile.TemporaryDirectory() as raw:
        root = Path(raw)
        for name in ("sat", "unsat"):
            # A fresh context per export is intentional.  Z3's DIMACS name
            # printer uses context-local fresh symbols; this also exercises
            # the one-export-per-process discipline of the production driver.
            ctx = z3.Context()
            x = z3.BitVec("smoke_x", 2, ctx=ctx)
            y = z3.BitVec("smoke_y", 2, ctx=ctx)
            bounds = [
                z3.ULT(x, z3.BitVecVal(3, 2, ctx=ctx)),
                z3.ULT(y, z3.BitVecVal(3, 2, ctx=ctx)),
            ]
            formula = bounds + ([z3.UGT(y, x)] if name == "sat" else [
                x == y, z3.UGT(x, y)
            ])
            cnf = root / f"{name}.cnf"
            proof = root / f"{name}.drat"
            export(ctx, formula, cnf)
            z3_solver = z3.Solver(ctx=ctx)
            z3_solver.add(*formula)
            original = str(z3_solver.check()).upper()
            completed = subprocess.run(
                ["cadical", "--plain", str(cnf), str(proof)],
                text=True,
                capture_output=True,
                check=False,
            )
            cadical = {10: "SAT", 20: "UNSAT"}.get(
                completed.returncode, "UNKNOWN"
            )
            checked = None
            if cadical == "UNSAT":
                replay = subprocess.run(
                    ["drat-trim", str(cnf), str(proof)],
                    text=True,
                    capture_output=True,
                    check=False,
                )
                checked = replay.returncode == 0 and "s VERIFIED" in replay.stdout
            output[name] = {
                "original_z3": original,
                "cadical": cadical,
                "drat_verified": checked,
                "cadical_returncode": completed.returncode,
                "cadical_output_tail": (completed.stdout + completed.stderr)[-500:],
            }
    if not (output["sat"]["original_z3"] == "SAT"
            and output["sat"]["cadical"] == "SAT"):
        raise AssertionError(output["sat"])
    if not (output["unsat"]["original_z3"] == "UNSAT"
            and output["unsat"]["cadical"] == "UNSAT"
            and output["unsat"]["drat_verified"] is True):
        raise AssertionError(output["unsat"])
    args.output.write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(output, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
