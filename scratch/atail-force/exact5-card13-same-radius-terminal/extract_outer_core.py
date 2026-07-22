#!/usr/bin/env python3
"""Extract a deletion-minimal assertion core for the asymmetric same arm."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import z3

from run_asymmetric_same import AsymmetricFocusOuter


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--orbit",
        choices=("asymmetricSourceLeft", "asymmetricSourceRight"),
        default="asymmetricSourceLeft",
    )
    parser.add_argument("--seconds", type=float, default=600.0)
    parser.add_argument("--seed", type=int, default=17)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    outer = AsymmetricFocusOuter(
        args.orbit, "same", max(1, int(args.seconds * 1000)), args.seed
    )
    assertions = list(outer.solver.assertions())
    solver = z3.Solver()
    solver.set(timeout=max(1, int(args.seconds * 1000)), random_seed=args.seed)
    markers = [z3.Bool(f"assertion_{index}") for index in range(len(assertions))]
    for marker, assertion in zip(markers, assertions, strict=True):
        solver.add(z3.Implies(marker, assertion))
    status = solver.check(*markers)
    if status != z3.unsat:
        payload = {
            "status": str(status).upper(),
            "reason": solver.reason_unknown() if status == z3.unknown else None,
            "assertion_count": len(assertions),
        }
    else:
        by_name = {str(marker): index for index, marker in enumerate(markers)}
        core = [by_name[str(marker)] for marker in solver.unsat_core()]
        position = 0
        while position < len(core):
            trial = core[:position] + core[position + 1 :]
            verdict = solver.check(*(markers[index] for index in trial))
            if verdict == z3.unsat:
                core = trial
            else:
                position += 1
        payload = {
            "status": "UNSAT",
            "assertion_count": len(assertions),
            "core_size": len(core),
            "core": [
                {"index": index, "assertion": str(assertions[index])}
                for index in core
            ],
        }
    output = json.dumps(payload, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(output + "\n")
    print(output)


if __name__ == "__main__":
    main()
