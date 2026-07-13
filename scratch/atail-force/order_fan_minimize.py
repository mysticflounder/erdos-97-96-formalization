#!/usr/bin/env python3
"""Minimize the first ATAIL three-center order-fan UNSAT proposal.

This is a theorem-discovery diagnostic, not a certificate.  It rebuilds the
smallest frozen full-inequality pilot case, keeps only the first seven cyclic
order inequalities (the fan based at the oriented edge ``v2 -> s1``), and
uses conservative deletion minimization.  A constraint is discarded only
when Z3 still reports UNSAT; SAT and UNKNOWN both retain it.

The output deliberately distinguishes a repeatable solver proposal from an
independently replayed proof.  The latter remains required before any cut is
promoted into the census or Lean.
"""

from __future__ import annotations

import argparse
import json
import time
from dataclasses import dataclass
from typing import Callable, Sequence

import sympy as sp
import z3

from census.atail_force import inequality_pilot as pilot


CASE_INDEX = 0
FAN_SIZE = 7
EXPECTED_CASE_ID = "ineq_m06_e51_c2256"
EXPECTED_SYSTEM_SHA256 = (
    "310a55892127556c56ce4454dec06077bdd7c87412ff44a7578826b456d02050"
)


@dataclass(frozen=True)
class Constraint:
    name: str
    expression: sp.Expr
    relation: str


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def _load() -> tuple[dict[str, object], object, list[Constraint]]:
    manifest = pilot._read_manifest(pilot.DEFAULT_MANIFEST)
    case = manifest["cases"][CASE_INDEX]
    _require(case["case_id"] == EXPECTED_CASE_ID, "frozen case-id drift")
    _require(
        case["system_input_sha256"] == EXPECTED_SYSTEM_SHA256,
        "frozen system digest drift",
    )
    system = pilot._validated_case_system(case)
    interior = int(case["interior_points"])
    base_strict = 4 + 3 * interior
    constraints = [
        *(
            Constraint(f"eq_{index}", expression, "eq")
            for index, expression in enumerate(system.eqs)
        ),
        *(
            Constraint(f"ge_{index}", expression, "ge")
            for index, expression in enumerate(system.ge)
        ),
        *(
            Constraint(f"gt_{index}", expression, "gt")
            for index, expression in enumerate(system.gt[:base_strict])
        ),
        *(
            Constraint(f"fan_{index}", expression, "gt")
            for index, expression in enumerate(
                system.gt[base_strict : base_strict + FAN_SIZE]
            )
        ),
    ]
    _require(len(constraints) == 52, "constraint-count drift")
    return case, system, constraints


def _relation(kind: str) -> Callable[[z3.ArithRef], z3.BoolRef]:
    if kind == "eq":
        return lambda value: value == 0
    if kind == "ge":
        return lambda value: value >= 0
    if kind == "gt":
        return lambda value: value > 0
    raise AssertionError(kind)


def check(
    system: object,
    constraints: Sequence[Constraint],
    *,
    timeout_seconds: float,
    seed: int = 0,
) -> tuple[str, float, str]:
    sympy_variables = list(system.vars)
    z3_variables = [z3.Real(str(variable)) for variable in sympy_variables]
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=max(1, int(timeout_seconds * 1000)), random_seed=seed)
    for constraint in constraints:
        polynomial = pilot._poly_to_z3(
            constraint.expression, sympy_variables, z3_variables
        )
        solver.add(_relation(constraint.relation)(polynomial))
    started = time.monotonic()
    answer = solver.check()
    elapsed = time.monotonic() - started
    reason = solver.reason_unknown() if answer == z3.unknown else ""
    return str(answer).upper(), round(elapsed, 3), reason


def minimize(
    system: object,
    constraints: Sequence[Constraint],
    *,
    timeout_seconds: float,
) -> tuple[list[Constraint], list[dict[str, object]]]:
    current = list(constraints)
    attempts: list[dict[str, object]] = []
    changed = True
    while changed:
        changed = False
        for candidate in tuple(current):
            trial = [row for row in current if row.name != candidate.name]
            verdict, elapsed, reason = check(
                system, trial, timeout_seconds=timeout_seconds
            )
            removed = verdict == "UNSAT"
            attempts.append(
                {
                    "candidate": candidate.name,
                    "verdict_without": verdict,
                    "elapsed_seconds": elapsed,
                    "reason_unknown": reason,
                    "removed": removed,
                }
            )
            if removed:
                current = trial
                changed = True
    return current, attempts


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=float, default=2.0)
    parser.add_argument("--no-minimize", action="store_true")
    args = parser.parse_args()
    case, system, constraints = _load()
    base_constraints = [
        constraint for constraint in constraints
        if not constraint.name.startswith("fan_")
    ]
    base_verdict, base_elapsed, base_reason = check(
        system,
        base_constraints,
        timeout_seconds=max(5.0, args.timeout),
    )
    _require(
        base_verdict == "SAT",
        "frozen equality/disk/nonobtuse/cap base is no longer SAT",
    )
    repeated = []
    for seed in (0, 1, 2):
        verdict, elapsed, reason = check(
            system, constraints, timeout_seconds=max(5.0, args.timeout), seed=seed
        )
        repeated.append(
            {
                "seed": seed,
                "verdict": verdict,
                "elapsed_seconds": elapsed,
                "reason_unknown": reason,
            }
        )
    _require(
        all(row["verdict"] == "UNSAT" for row in repeated),
        "frozen fan subsystem is no longer repeatably UNSAT",
    )
    if args.no_minimize:
        core, attempts = list(constraints), []
    else:
        core, attempts = minimize(
            system, constraints, timeout_seconds=args.timeout
        )
    final_verdict, final_elapsed, final_reason = check(
        system, core, timeout_seconds=max(10.0, args.timeout)
    )
    _require(final_verdict == "UNSAT", "minimized proposal did not replay UNSAT")
    document = {
        "schema": "p97_atail_force_order_fan_minimize.v1",
        "case_id": case["case_id"],
        "system_input_sha256": case["system_input_sha256"],
        "scope": {
            "full_configuration_claim": False,
            "inventory_coverage_claim": False,
            "lean_claim": False,
            "independent_unsat_certificate": False,
            "solver_proposal_only": True,
        },
        "initial_constraint_count": len(constraints),
        "base_without_order_fan": {
            "constraint_count": len(base_constraints),
            "verdict": base_verdict,
            "elapsed_seconds": base_elapsed,
            "reason_unknown": base_reason,
        },
        "initial_replays": repeated,
        "deletion_timeout_seconds": args.timeout,
        "attempt_count": len(attempts),
        "retained_constraint_count": len(core),
        "retained_constraints": [
            {
                "name": row.name,
                "relation": row.relation,
                "expression": str(row.expression),
            }
            for row in core
        ],
        "final_replay": {
            "verdict": final_verdict,
            "elapsed_seconds": final_elapsed,
            "reason_unknown": final_reason,
        },
        "attempts": attempts,
    }
    print(json.dumps(document, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
