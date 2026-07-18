#!/usr/bin/env python3
"""Mine small UNSAT cores from the bounded period-three representative formula.

This deliberately replays the formula in
``period-three-first-apex-kalmanson/decide_quotient.py`` with one assumption
literal per asserted constraint.  The resulting cores are discovery evidence
for the *fixed representative* formula.  They are not source-coverage
certificates and may still contain Boolean pair-choice or disjunctive
disequality constraints rather than a pure LRA/Farkas certificate.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from random import Random
from typing import Iterable

from z3 import Bool, If, Implies, Or, Real, Solver, Sum, unsat


ROOT = Path(__file__).resolve().parents[3]
SOURCE = ROOT / "scratch/atail-force/period-three-first-apex-kalmanson/decide_quotient.py"


def load_source():
    spec = importlib.util.spec_from_file_location("period3_decide_quotient", SOURCE)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


Q = load_source()


@dataclass(frozen=True)
class NamedConstraint:
    name: str
    family: str
    formula: object


def sanitize(name: str) -> str:
    return "".join(c if c.isalnum() else "_" for c in name)


def build_constraints(boundary: tuple[int, ...], arm: str, role: str):
    q, w, t0, t1, first_classes = Q.cell(arm, role)
    d = {(i, j): Real(f"d_{i}_{j}") for i, j in combinations(Q.A, 2)}
    dv = lambda i, j: d[tuple(sorted((i, j)))]
    constraints: list[NamedConstraint] = []

    def add(name: str, family: str, formula) -> None:
        constraints.append(NamedConstraint(name, family, formula))

    def different(u, v):
        return Or(u >= v + 1, v >= u + 1)

    for (i, j), value in d.items():
        add(f"positive:{i},{j}", "positive", value >= 1)
    for a, b, c in combinations(Q.A, 3):
        add(f"triangle:{a},{b}|{c}", "triangle", dv(a, b) + dv(b, c) >= dv(a, c) + 1)
        add(f"triangle:{a},{c}|{b}", "triangle", dv(a, b) + dv(a, c) >= dv(b, c) + 1)
        add(f"triangle:{b},{c}|{a}", "triangle", dv(a, c) + dv(b, c) >= dv(a, b) + 1)
    for ia, ib, ic, id_ in combinations(range(len(boundary)), 4):
        a, b, c, e = (boundary[i] for i in (ia, ib, ic, id_))
        diagonal = dv(a, c) + dv(b, e)
        add(
            f"K1:{a},{b},{c},{e}",
            "K1",
            diagonal >= dv(a, b) + dv(c, e) + 1,
        )
        add(
            f"K2:{a},{b},{c},{e}",
            "K2",
            diagonal >= dv(a, e) + dv(b, c) + 1,
        )

    r, rho = Real("first_r"), Real("first_rho")
    add("first:r:positive", "first_radius", r >= 1)
    add("first:rho:positive", "first_radius", rho >= 1)
    for x in sorted(t0):
        add(f"T0:eq:{x}", "T0_row", dv(Q.first_apex, x) == r)
    for x in sorted(t1):
        add(f"T1:eq:{x}", "T1_row", dv(Q.first_apex, x) == rho)
    add(
        f"first:arm:{arm}",
        "first_arm",
        rho == r if arm == "eq" else different(rho, r),
    )

    physical_radius = Real("physical_radius")
    add("physical:radius:positive", "physical_radius", physical_radius >= 1)
    for x in sorted(Q.physical_exact_five):
        add(f"physical:eq:{x}", "physical_row", dv(Q.second_apex, x) == physical_radius)
    for x in sorted(set(Q.A) - Q.physical_exact_five - {Q.second_apex}):
        add(
            f"physical:exact:exclude:{x}",
            "physical_exactness",
            different(dv(Q.second_apex, x), physical_radius),
        )
    add("frontier:second:neq", "frontier_second_neq", different(dv(Q.second_apex, q), dv(Q.second_apex, w)))

    pair_hit = {
        (edge, x): Bool(f"pair_{edge}_{x}")
        for edge in range(3)
        for x in Q.eligible_outside
    }
    reverse_radius = [Real(f"reverse_radius_{edge}") for edge in range(3)]
    for edge, source in enumerate(Q.cycle_sources):
        successor = Q.cycle_sources[(edge + 1) % 3]
        center = Q.reverse_centers[edge]
        add(f"R{edge}:radius:positive", "reverse_radius", reverse_radius[edge] >= 1)
        add(
            f"R{edge}:pair:card2",
            "reverse_pair_card",
            Sum([If(pair_hit[edge, x], 1, 0) for x in Q.eligible_outside]) == 2,
        )
        add(f"R{edge}:source:eq:{source}", "reverse_row", dv(center, source) == reverse_radius[edge])
        add(f"R{edge}:source:eq:{successor}", "reverse_row", dv(center, successor) == reverse_radius[edge])
        for x in Q.eligible_outside:
            add(
                f"R{edge}:pair:hit:eq:{x}",
                "reverse_pair_row",
                Or(pair_hit[edge, x] == False, dv(center, x) == reverse_radius[edge]),
            )
        exact_support_fixed = {source, successor}
        for x in sorted(set(Q.A) - {center} - exact_support_fixed):
            if x in Q.eligible_outside:
                formula = Or(pair_hit[edge, x], different(dv(center, x), reverse_radius[edge]))
            else:
                formula = different(dv(center, x), reverse_radius[edge])
            add(f"R{edge}:exact:exclude:{x}", "reverse_exactness", formula)

        add(
            f"R{edge}:not-contained:T0",
            "target_not_contained",
            Sum([If(pair_hit[edge, x], 1, 0) for x in t0 if x in Q.eligible_outside]) <= 1,
        )
        add(
            f"R{edge}:not-contained:T1",
            "target_not_contained",
            Sum([If(pair_hit[edge, x], 1, 0) for x in t1 if x in Q.eligible_outside]) <= 1,
        )
        for index, klass in enumerate(first_classes):
            add(
                f"R{edge}:not-contained:first-class:{index}",
                "target_not_contained",
                Sum([If(pair_hit[edge, x], 1, 0) for x in klass if x in Q.eligible_outside]) <= 1,
            )
        for a, b in combinations(Q.eligible_outside, 2):
            add(
                f"R{edge}:no-first-return:{a},{b}",
                "target_no_return",
                Or(
                    pair_hit[edge, a] == False,
                    pair_hit[edge, b] == False,
                    different(dv(Q.first_apex, a), dv(Q.first_apex, b)),
                ),
            )

    for e, f in combinations(range(3), 2):
        add(
            f"pairs:distinct:{e},{f}",
            "reverse_pair_injective",
            Or(*[pair_hit[e, x] != pair_hit[f, x] for x in Q.eligible_outside]),
        )
        add(
            f"pairs:inter-at-most-one:{e},{f}",
            "reverse_pair_intersection",
            Sum([If(pair_hit[e, x] & pair_hit[f, x], 1, 0) for x in Q.eligible_outside]) <= 1,
        )
    return constraints


def deletion_minimal_core(constraints: list[NamedConstraint], timeout_ms: int = 30_000):
    solver = Solver()
    solver.set(timeout=timeout_ms)
    assumptions = []
    by_lit = {}
    for index, constraint in enumerate(constraints):
        lit = Bool(f"a_{index}_{sanitize(constraint.name)}")
        assumptions.append(lit)
        by_lit[lit.decl().name()] = index
        solver.add(Implies(lit, constraint.formula))
    assert solver.check(*assumptions) == unsat
    core = [by_lit[lit.decl().name()] for lit in solver.unsat_core()]
    changed = True
    while changed:
        changed = False
        for index in tuple(core):
            trial = [assumptions[i] for i in core if i != index]
            if solver.check(*trial) == unsat:
                core.remove(index)
                changed = True
    return [constraints[i] for i in core]


def summarize(boundary: tuple[int, ...], arm: str, role: str, core: Iterable[NamedConstraint]):
    core = list(core)
    families: dict[str, int] = {}
    for constraint in core:
        families[constraint.family] = families.get(constraint.family, 0) + 1
    return {
        "boundary": list(boundary),
        "arm": arm,
        "role": role,
        "core_size": len(core),
        "families": dict(sorted(families.items())),
        "constraints": [constraint.name for constraint in core],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orders", type=int, default=1)
    parser.add_argument("--seed", type=int, default=20260717)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    orders = list(Q.compatible_orders())
    Random(args.seed).shuffle(orders)
    records = []
    for boundary in orders[: args.orders]:
        for arm in ("eq", "neq"):
            for role in ("II", "IO", "OI"):
                constraints = build_constraints(boundary, arm, role)
                core = deletion_minimal_core(constraints)
                record = summarize(boundary, arm, role, core)
                records.append(record)
                print(json.dumps(record, sort_keys=True), flush=True)
    payload = {
        "status": "FIXED_REPRESENTATIVE_BOOLEAN_CORE_SAMPLE",
        "orders": args.orders,
        "cells": len(records),
        "records": records,
    }
    if args.output:
        args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


if __name__ == "__main__":
    main()
