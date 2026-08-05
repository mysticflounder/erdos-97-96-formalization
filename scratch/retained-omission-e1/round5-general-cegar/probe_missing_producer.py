#!/usr/bin/env python3
"""Targeted diagnostics for the FreshThird producer contract.

This imports the existing n=17 model and asks only whether a proposed
cap-wide disjunction is forced.  Results are external evidence, never Lean
closure: the model is a fixed bounded incidence relaxation.
"""

from __future__ import annotations

import importlib.util
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SOURCE = HERE / "n17_freshthird_incidence_probe.py"
SPEC = importlib.util.spec_from_file_location("freshthird_probe", SOURCE)
assert SPEC and SPEC.loader
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)

FreshThirdN17 = MODULE.FreshThirdN17
IDX = MODULE.IDX
ALL = MODULE.ALL


def outside_source_cap(model: FreshThirdN17, slot: int):
    """Both Q sources are outside the physical cap carrying C's source row."""
    disj = []
    for cap_index in range(3):
        q1_in = z3.Or(*(z3.And(model.q1_is[s], model.cap[cap_index, s]) for s in ALL))
        q2_in = z3.Or(*(z3.And(model.q2_is[s], model.cap[cap_index, s]) for s in ALL))
        disj.append(z3.And(model.c_cap[slot] == cap_index,
                           z3.Not(q1_in), z3.Not(q2_in)))
    return z3.Or(*disj)


def status(solver: z3.Solver) -> str:
    result = solver.check()
    return "SAT" if result == z3.sat else "UNSAT" if result == z3.unsat else "UNKNOWN"


def witness(model: FreshThirdN17):
    if model.solver.check() != z3.sat:
        return {}
    m = model.solver.model()
    q1 = next(s for s in ALL if z3.is_true(m.eval(model.q1_is[s], model_completion=True)))
    q2 = next(s for s in ALL if z3.is_true(m.eval(model.q2_is[s], model_completion=True)))
    interactions = {}
    for source in (IDX["q1"], IDX["q2"]):
        interactions[source] = next(
            tag for tag in model.TAGS
            if z3.is_true(m.eval(model.interaction[source, tag], model_completion=True))
        )
    return {
        "residual": next(tag for tag in model.RESIDUALS
                          if z3.is_true(m.eval(model.residual[tag], model_completion=True))),
        "C_sources": [
            next(s for s in ALL if z3.is_true(m.eval(model.c_source_is[slot, s], model_completion=True)))
            for slot in (0, 1)
        ],
        "Q_sources": [q1, q2],
        "interactions": interactions,
    }


def run_case(name: str, residual: str, forbidden_disjunction) -> dict[str, object]:
    model = FreshThirdN17(timeout_ms=20_000, cyclic_metric=False)
    model.solver.add(model.residual[residual])
    model.solver.add(z3.Not(forbidden_disjunction(model)))
    result = status(model.solver)
    row: dict[str, object] = {"case": name, "status": result}
    if result == "SAT":
        row["witness"] = witness(model)
    return row


def main() -> None:
    q1, q2 = IDX["q1"], IDX["q2"]
    rows = [
        run_case(
            "firstNonHit_requires_second_hit_or_first_cap_escape",
            "firstNonHit",
            lambda m: z3.Or(m.cross_hit[q2], outside_source_cap(m, 0)),
        ),
        run_case(
            "secondNonHit_requires_first_hit_or_second_cap_escape",
            "secondNonHit",
            lambda m: z3.Or(m.cross_hit[q1], outside_source_cap(m, 1)),
        ),
    ]
    for row in rows:
        print(row)


if __name__ == "__main__":
    main()
