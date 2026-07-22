#!/usr/bin/env python3
"""Ablate focused-field groups from the asymmetric same-radius gate."""

from __future__ import annotations

import argparse
import json

import z3

import run_asymmetric_same as runner


TIMEOUT_MS = 300_000


def check(assertions: list[z3.BoolRef]) -> dict[str, object]:
    solver = z3.Solver()
    solver.set(timeout=TIMEOUT_MS, random_seed=17)
    solver.add(*assertions)
    result = solver.check()
    payload: dict[str, object] = {"status": str(result).upper()}
    if result == z3.unknown:
        payload["reason"] = solver.reason_unknown()
    return payload


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--case",
        choices=("base", "role", "parent", "full"),
        required=True,
    )
    args = parser.parse_args()
    outer = runner.AsymmetricFocusOuter.__new__(runner.AsymmetricFocusOuter)
    outer.radius_arm = "same"
    runner.gate.BaseOuter.__init__(
        outer, "asymmetricSourceLeft", TIMEOUT_MS, 17
    )
    base = list(outer.solver.assertions())

    finite_assertions = outer.solver.assertions()
    outer.solver = z3.Solver()
    outer.solver.set(timeout=TIMEOUT_MS, random_seed=17)
    outer.solver.add(*finite_assertions)
    outer.parent_first = [
        z3.Bool(f"parent_first_{point}") for point in runner.gate.VERTICES
    ]
    outer.parent_second = [
        z3.Bool(f"parent_second_{point}") for point in runner.gate.VERTICES
    ]
    outer._add_focused_contract()
    after_focus = list(outer.solver.assertions())
    focus = after_focus[len(base) :]

    outer._add_ordinal_prefilter()
    after_ordinal = list(outer.solver.assertions())
    ordinal = after_ordinal[len(after_focus) :]

    role = [item for item in focus if "parent_" not in str(item)]
    parent = [item for item in focus if "parent_" in str(item)]
    chosen = {
        "base": base + ordinal,
        "role": base + role + ordinal,
        "parent": base + parent + ordinal,
        "full": base + focus + ordinal,
    }[args.case]
    payload = {
        "counts": {
            "base": len(base),
            "focus": len(focus),
            "role": len(role),
            "parent": len(parent),
            "ordinal": len(ordinal),
        },
        "case": args.case,
        "result": check(chosen),
        "role_assertions": [str(item) for item in role]
          if args.case == "role" else [],
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
