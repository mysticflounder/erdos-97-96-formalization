#!/usr/bin/env python3
"""Extract a source-assertion UNSAT core from the ordinal decision surface.

This works before bit-blasting: every assumption marker guards one assertion
returned by ``asymmetric_ordinal_rank.build``.  The result is therefore useful
for selecting a theorem-sized Lean circuit, unlike a Tseitin-clause core.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import z3

import asymmetric_ordinal_rank as ordinal


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--orbit",
        choices=("asymmetricSourceLeft", "asymmetricSourceRight"),
        default="asymmetricSourceLeft",
    )
    parser.add_argument("--seconds", type=float, default=300.0)
    parser.add_argument("--seed", type=int, default=17)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    outer, _rank, counts = ordinal.build(args.orbit, args.seed)
    assertions = list(outer.solver.assertions())
    solver = z3.Solver()
    solver.set(timeout=max(1, int(1000 * args.seconds)), random_seed=args.seed)
    markers = [z3.Bool(f"source_assertion_{index}")
               for index in range(len(assertions))]
    solver.add(*(z3.Implies(marker, assertion)
                 for marker, assertion in zip(markers, assertions, strict=True)))
    status = solver.check(*markers)
    payload: dict[str, object] = {
        "schema": "p97-exact5-card13-ordinal-source-core-v1",
        "orbit": args.orbit,
        "source_counts": counts,
        "status": str(status).upper(),
    }
    if status == z3.unsat:
        by_name = {str(marker): index for index, marker in enumerate(markers)}
        core = sorted(by_name[str(marker)] for marker in solver.unsat_core())
        payload.update({
            "core_size": len(core),
            "core": [
                {"index": index, "assertion": assertions[index].sexpr()}
                for index in core
            ],
        })
    elif status == z3.unknown:
        payload["reason"] = solver.reason_unknown()
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": payload["status"],
        "core_size": payload.get("core_size"),
        "output": str(args.output),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
