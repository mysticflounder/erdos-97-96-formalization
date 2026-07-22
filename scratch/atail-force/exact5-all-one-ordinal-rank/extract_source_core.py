#!/usr/bin/env python3
"""Extract a source-assertion core from one all-one ordinal formula.

Each pre-bitblast assertion is guarded by one assumption marker.  A returned
core therefore selects source expressions rather than anonymous Tseitin CNF
clauses.  `UNKNOWN` remains an honest bounded result.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import time

import z3

import all_one_ordinal_rank as ordinal


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orbit", choices=ordinal.ORBITS, required=True)
    parser.add_argument("--seconds", type=float, default=600.0)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    started = time.monotonic()
    outer, _rank, counts = ordinal.build(args.orbit, args.seed, 0)
    assertions = list(outer.solver.assertions())
    built = time.monotonic()

    solver = z3.Solver()
    solver.set(timeout=max(1, int(1000 * args.seconds)), random_seed=args.seed)
    markers = [
        z3.Bool(f"source_assertion_{index}")
        for index in range(len(assertions))
    ]
    solver.add(*(
        z3.Implies(marker, assertion)
        for marker, assertion in zip(markers, assertions, strict=True)
    ))
    status = solver.check(*markers)
    finished = time.monotonic()

    payload: dict[str, object] = {
        "schema": "p97-exact5-card13-all-one-ordinal-source-core-v1",
        "orbit": args.orbit,
        "seed": args.seed,
        "status": str(status).upper(),
        "source_counts": counts,
        "build_seconds": built - started,
        "solve_seconds": finished - built,
        "total_seconds": finished - started,
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
        payload["reason_unknown"] = solver.reason_unknown()

    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "status": payload["status"],
        "core_size": payload.get("core_size"),
        "reason_unknown": payload.get("reason_unknown"),
        "solve_seconds": payload["solve_seconds"],
        "output": str(args.output),
    }, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
