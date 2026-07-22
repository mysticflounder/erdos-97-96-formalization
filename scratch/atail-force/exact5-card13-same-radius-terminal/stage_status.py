#!/usr/bin/env python3
"""Check which encoder stage first refutes the asymmetric same-radius arm."""

from __future__ import annotations

import argparse
import json

import z3

import run_asymmetric_same as runner


def verdict(solver: z3.Solver) -> dict[str, str]:
    result = solver.check()
    payload = {"status": str(result).upper()}
    if result == z3.unknown:
        payload["reason"] = solver.reason_unknown()
    return payload


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--orbit",
        choices=("asymmetricSourceLeft", "asymmetricSourceRight"),
        default="asymmetricSourceLeft",
    )
    parser.add_argument("--seconds", type=float, default=300.0)
    parser.add_argument("--seed", type=int, default=17)
    args = parser.parse_args()
    timeout_ms = max(1, int(args.seconds * 1000))

    outer = runner.AsymmetricFocusOuter.__new__(runner.AsymmetricFocusOuter)
    outer.radius_arm = "same"
    runner.gate.BaseOuter.__init__(outer, args.orbit, timeout_ms, args.seed)
    stages: dict[str, dict[str, str]] = {"base": verdict(outer.solver)}

    finite_assertions = outer.solver.assertions()
    outer.solver = z3.Solver()
    outer.solver.set(timeout=timeout_ms, random_seed=args.seed)
    outer.solver.add(*finite_assertions)
    outer.parent_first = [
        z3.Bool(f"parent_first_{point}") for point in runner.gate.VERTICES
    ]
    outer.parent_second = [
        z3.Bool(f"parent_second_{point}") for point in runner.gate.VERTICES
    ]
    outer._add_focused_contract()
    stages["base_plus_focused"] = verdict(outer.solver)

    outer._add_ordinal_prefilter()
    stages["base_plus_focused_plus_ordinal"] = verdict(outer.solver)
    print(json.dumps(stages, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
