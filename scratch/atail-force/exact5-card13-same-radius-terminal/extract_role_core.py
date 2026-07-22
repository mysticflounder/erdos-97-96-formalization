#!/usr/bin/env python3
"""Minimize the eleven source-role assertions over the ordinal background."""

from __future__ import annotations

import json

import z3

import run_asymmetric_same as runner


TIMEOUT_MS = 600_000


def main() -> None:
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
    role = [item for item in focus if "parent_" not in str(item)]
    outer._add_ordinal_prefilter()
    ordinal = list(outer.solver.assertions())[len(after_focus) :]

    solver = z3.Solver()
    solver.set(timeout=TIMEOUT_MS, random_seed=17)
    solver.add(*(base + ordinal))
    markers = [z3.Bool(f"role_{index}") for index in range(len(role))]
    for marker, assertion in zip(markers, role, strict=True):
        solver.add(z3.Implies(marker, assertion))
    result = solver.check(*markers)
    if result != z3.unsat:
        print(json.dumps({
            "status": str(result).upper(),
            "reason": solver.reason_unknown() if result == z3.unknown else None,
        }, indent=2))
        return
    names = {str(marker): index for index, marker in enumerate(markers)}
    core = [names[str(marker)] for marker in solver.unsat_core()]
    position = 0
    while position < len(core):
        trial = core[:position] + core[position + 1 :]
        if solver.check(*(markers[index] for index in trial)) == z3.unsat:
            core = trial
        else:
            position += 1
    print(json.dumps({
        "status": "UNSAT",
        "role_assertion_count": len(role),
        "core_size": len(core),
        "core": [
            {"index": index, "assertion": str(role[index])} for index in core
        ],
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
