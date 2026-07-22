#!/usr/bin/env python3
"""Exact-Z3 replay and irreducibility check for one recorded L1 core."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import z3

from l1 import build_linear_problem
from verify import verify_decoded


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("result", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    args = parser.parse_args()

    result = json.loads(args.result.read_text())
    recorded = result.get("first_minimized_core")
    if recorded is None:
        raise SystemExit("result has no first_minimized_core")
    core = recorded["core"]
    if core.get("minimal") is not True:
        raise SystemExit("recorded core is not marked minimal")
    decoded = recorded["decoded"]
    errors = verify_decoded(decoded)
    if errors:
        raise SystemExit("invalid decoded B0 assignment: " + "; ".join(errors))

    solver, _table, tracked = build_linear_problem(
        decoded, result["sign"], args.timeout_ms, seed=1
    )
    by_name = {str(record["name"]): record for record in tracked}
    assumptions = []
    for constraint in core["constraints"]:
        name = str(constraint["name"])
        if name not in by_name:
            raise SystemExit(f"unknown core constraint {name}")
        expected = {"name": name, **by_name[name]["metadata"]}
        if constraint != expected:
            raise SystemExit(f"metadata mismatch for {name}")
        assumptions.append(by_name[name]["assumption"])

    if solver.check(*assumptions) != z3.unsat:
        raise SystemExit("recorded core does not replay as exact-LRA UNSAT")
    for index, assumption in enumerate(assumptions):
        trial = assumptions[:index] + assumptions[index + 1:]
        status = solver.check(*trial)
        if status != z3.sat:
            raise SystemExit(
                f"core is not deletion-minimal at {assumption}: {status}"
            )
    print(
        "VERIFIED exact-LRA deletion-minimal core "
        f"({len(assumptions)} tracked constraints)"
    )


if __name__ == "__main__":
    main()
