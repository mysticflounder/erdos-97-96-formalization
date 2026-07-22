#!/usr/bin/env python3
"""Shrink an existing source-level ordinal UNSAT core with Z3 assumptions."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import z3

import asymmetric_ordinal_rank as ordinal


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--seconds", type=float, default=600.0)
    parser.add_argument("--seed", type=int, default=17)
    parser.add_argument(
        "--no-minimize",
        action="store_true",
        help="Request one cheap assumption-core pass without subset minimization.",
    )
    args = parser.parse_args()

    old = json.loads(args.input.read_text(encoding="utf-8"))
    outer, _rank, counts = ordinal.build(old["orbit"], args.seed)
    assertions = list(outer.solver.assertions())
    indices: list[int] = []
    for saved in old["core"]:
        assertion = assertions[saved["index"]]
        if assertion.sexpr() != saved["assertion"]:
            raise AssertionError(f"source assertion drift at {saved['index']}")
        indices.append(saved["index"])

    solver = z3.Solver()
    options: dict[str, object] = {
        "timeout": max(1, int(1000 * args.seconds)),
        "random_seed": args.seed,
    }
    if not args.no_minimize:
        options["core.minimize"] = True
    solver.set(**options)
    markers = [z3.Bool(f"core_assertion_{index}") for index in indices]
    solver.add(*(z3.Implies(marker, assertions[index])
                 for marker, index in zip(markers, indices, strict=True)))
    status = solver.check(*markers)
    payload: dict[str, object] = {
        "schema": "p97-exact5-card13-minimized-ordinal-source-core-v1",
        "orbit": old["orbit"],
        "source_counts": counts,
        "input_core_size": len(indices),
        "status": str(status).upper(),
    }
    if status == z3.unsat:
        by_name = {str(marker): index for marker, index in zip(markers, indices, strict=True)}
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
        "input_core_size": len(indices),
        "core_size": payload.get("core_size"),
        "output": str(args.output),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
