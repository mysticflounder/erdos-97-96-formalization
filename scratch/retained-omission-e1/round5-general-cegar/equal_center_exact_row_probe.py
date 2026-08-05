#!/usr/bin/env python3
"""Scratch refinement of the n=17 FreshThird equal-center arm.

This imports the existing bounded incidence/metric model and adds only data
that is already present in the live Lean packet:

* both equal-center C rows are exactly the four named C/Q sources;
* the equal arm retains only noncanonical interactions; and
* each noncanonical overlap with the fresh Q row is exactly Q's source pair.

The result is external Z3 evidence for this finite abstraction, never a Lean
closure claim.
"""

from __future__ import annotations

import importlib.util
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
BASE = HERE / "n17_freshthird_incidence_probe.py"
spec = importlib.util.spec_from_file_location("freshthird_base", BASE)
if spec is None or spec.loader is None:
    raise RuntimeError(f"cannot import {BASE}")
base = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = base
spec.loader.exec_module(base)


def add_equal_packet(model: object) -> None:
    """Encode FreshThirdEqualCenterExactFourRow and noncanonical overlap."""
    eq = model.residual["equalCrossRowCenters"]
    q_sources = lambda p: z3.Or(model.q1_is[p], model.q2_is[p])
    for slot in (0, 1):
        for p in base.ALL:
            named = z3.Or(
                model.c_source_is[0, p], model.c_source_is[1, p],
                model.q1_is[p], model.q2_is[p],
            )
            model.add(
                "equal_exact_four_row",
                z3.Or(z3.Not(eq), model.c_source_row[slot, p] == named),
            )
            model.add(
                "equal_noncanonical_overlap",
                z3.Or(
                    z3.Not(eq),
                    z3.Not(model.c_source_row[slot, p]),
                    z3.Not(model.q1_row[p]),
                    q_sources(p),
                ),
            )
    model.add(
        "equal_cap_center_ne_fresh",
        z3.Or(z3.Not(eq), model.c_center[0] != model.q1_center),
    )
    for source in (base.IDX["q1"], base.IDX["q2"]):
        model.add(
            "equal_noncanonical_interaction",
            z3.Or(
                z3.Not(eq),
                model.interaction[source, "distinctBlockersDifferentCaps"],
                model.interaction[source, "sameCapWithInternalFiberSource"],
            ),
        )
    # Both noncanonical constructors retain actual cap-interior membership
    # for the cap-source center and the fresh blocker center.  The base probe
    # intentionally left row-cap labels abstract; recover that live packet
    # invariant here without asserting any extra geometry.
    for slot, source in enumerate((base.IDX["q1"], base.IDX["q2"])):
        noncanonical = z3.Or(
            model.interaction[source, "distinctBlockersDifferentCaps"],
            model.interaction[source, "sameCapWithInternalFiberSource"],
        )
        c_in_cap = z3.Or(*(
            z3.And(model.c_cap[slot] == i, model.c_center[slot] == center,
                   model.cap_interior[i, center])
            for i in range(3) for center in base.ALL
        ))
        q_in_cap = z3.Or(*(
            z3.And(model.q1_cap == i, model.q1_center == center,
                   model.cap_interior[i, center])
            for i in range(3) for center in base.ALL
        ))
        model.add("equal_source_center_cap_interior", z3.Or(z3.Not(eq), z3.Not(noncanonical), c_in_cap))
        model.add("equal_fresh_center_cap_interior", z3.Or(z3.Not(eq), z3.Not(noncanonical), q_in_cap))


def run(timeout_ms: int, cyclic_metric: bool) -> dict[str, object]:
    started = time.monotonic()
    model = base.FreshThirdN17(timeout_ms=timeout_ms, cyclic_metric=cyclic_metric)
    add_equal_packet(model)
    # This probe is intentionally restricted to the equal-center residual arm.
    model.add("force_equal_center_arm", model.residual["equalCrossRowCenters"])
    result = model.solver.check()
    out: dict[str, object] = {
        "status": str(result),
        "timeout_ms": timeout_ms,
        "cyclic_metric": cyclic_metric,
        "elapsed_ms": round((time.monotonic() - started) * 1000),
        "trust_boundary": "external Z3 only; bounded n=17 lane; no Lean/universal claim",
        "added_constraints": {
            "exact_equal_four_row": True,
            "noncanonical_interaction": True,
            "exact_Q_overlap": True,
        },
    }
    if result == z3.sat:
        zmodel = model.solver.model()
        out["residual_mode"] = next(
            tag for tag, term in model.residual.items()
            if z3.is_true(zmodel.eval(term, model_completion=True))
        )
        out["C_sources"] = [
            next(base.NAMES[s] for s in base.ALL
                 if z3.is_true(zmodel.eval(model.c_source_is[slot, s], model_completion=True)))
            for slot in (0, 1)
        ]
        out["Q_sources"] = [
            next(base.NAMES[s] for s in base.ALL
                 if z3.is_true(zmodel.eval(term[s], model_completion=True)))
            for term in (model.q1_is, model.q2_is)
        ]
        out["C_rows"] = [
            [base.NAMES[p] for p in base.ALL
             if z3.is_true(zmodel.eval(model.c_source_row[slot, p], model_completion=True))]
            for slot in (0, 1)
        ]
        out["C_centers"] = [
            int(zmodel.eval(model.c_center[slot], model_completion=True).as_long())
            for slot in (0, 1)
        ]
        out["Q_center"] = int(zmodel.eval(model.q1_center, model_completion=True).as_long())
        out["C_caps"] = [
            int(zmodel.eval(model.c_cap[slot], model_completion=True).as_long())
            for slot in (0, 1)
        ]
        out["Q_cap"] = int(zmodel.eval(model.q1_cap, model_completion=True).as_long())
        out["interactions"] = [
            next(tag for tag in model.TAGS
                 if z3.is_true(zmodel.eval(model.interaction[source, tag], model_completion=True)))
            for source in (base.IDX["q1"], base.IDX["q2"])
        ]
        if cyclic_metric:
            out["positions"] = {
                base.NAMES[v]: int(zmodel.eval(model.position[v], model_completion=True).as_long())
                for v in base.ALL
            }
    return out


if __name__ == "__main__":
    timeout_ms = int(sys.argv[1]) if len(sys.argv) > 1 else 60_000
    cyclic_metric = len(sys.argv) > 2 and sys.argv[2] == "--cyclic-metric"
    print(json.dumps(run(timeout_ms, cyclic_metric), indent=2, sort_keys=True))
