#!/usr/bin/env python3
"""Schema-8 hypothesis probe for the FreshThird shared-late-pair producer.

This is intentionally a *diagnostic* extension of schema 7.  It asks whether
the current bounded incidence packet has a countermodel in which the
order-selected surviving row ``A`` has no second named selected row ``B`` and
no ordered ``ia < ib < ic < id`` with the two late boundary points in both
supports.  The clause is represented dynamically: B is selected from the
named Q/C rows, and all four boundary positions are fresh permutation
variables.  No schema-7 witness labels or fixed boundary order are used.

The source-level producer is not yet proved.  Consequently SAT/UNSAT/UNKNOWN
is bounded external evidence only; this file supplies no Lean ingress,
Euclidean realizability, or arbitrary-cardinality lift.  This historical
round is additionally invalid as a countermodel test: the selector variables
introduced below are existentially chosen by Z3, while ``build`` adds
``Not(shared)``.  The query is therefore ``exists selectors, not shared``;
the intended negation of the producer is ``not (exists selectors, shared)``.
The old SAT artifacts must not be promoted or interpreted as countermodels.
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_dynamic_endpoint_deletion_probe as v7  # noqa: E402
import n17_freshthird_incidence_probe as base  # noqa: E402


SCHEMA_VERSION = 8
OUT = HERE / "artifacts-schema-v8"
RUN_DISABLED_MESSAGE = (
    "Schema 8 is historical and invalid: shared_late_pair_terms introduces "
    "existential selectors, so build encodes exists selectors, not shared "
    "rather than not (exists selectors, shared).  Its arbitrary boundary "
    "permutation is also not source-entitled; production --run is disabled."
)


def exactly(solver: z3.Solver, terms, k: int) -> None:
    solver.add(z3.PbEq([(term, 1) for term in terms], k))


def point_selector(value: z3.ArithRef) -> dict[int, z3.BoolRef]:
    return {p: value == p for p in base.ALL}


def selector_value(selector: dict[int, z3.BoolRef]) -> z3.ArithRef:
    return z3.Sum(*(z3.If(selector[p], p, 0) for p in base.ALL))


def dynamic_row(
    probe: v7.ingress.FreshThirdN19Global,
    center_selector: dict[int, z3.BoolRef],
    anchor_selector: dict[int, z3.BoolRef],
    deleted_selector: dict[int, z3.BoolRef],
) -> dict[int, z3.BoolRef]:
    """Radius class selected at a dynamic center/anchor, avoiding deletion."""
    return {
        p: z3.Or(*(
            z3.And(
                center_selector[c],
                anchor_selector[a],
                z3.Not(deleted_selector[p]),
                p != c,
                probe.E(c, a, p),
            )
            for c in base.ALL for a in base.ALL if a != c
        ))
        for p in base.ALL
    }


def source_selected_row_candidates(probe):
    """Rows named by the live packet, with their actual blocker centers."""
    return (
        ("q1", probe.q1_row, probe.q1_center),
        ("q2", probe.q2_row, probe.q2_center),
        ("c1", {p: probe.c_source_row[0, p] for p in base.ALL}, probe.c_center[0]),
        ("c2", {p: probe.c_source_row[1, p] for p in base.ALL}, probe.c_center[1]),
    )


def shared_late_pair_terms(probe, selected_endpoint: str, slot: int, query: str):
    """Return the dynamic producer clause and its named selectors.

    ``query`` chooses which deletion-surviving A row is being tested.  A's
    center is the order-selected endpoint source, while B is one of the four
    named Q/C selected rows.  Boundary positions are existential permutation
    variables rather than the accidental labels of schema 7.  This is
    intentionally preserved as the historical bug: no quantifier closure is
    performed here.
    """
    selected = probe.q1_is if selected_endpoint == "q1" else probe.q2_is
    other = probe.q2_is if selected_endpoint == "q1" else probe.q1_is
    canonical = {p: probe.c_source_is[slot, p] for p in base.ALL}
    deleted = canonical if query == "canonical-survives" else other

    anchor = {p: z3.Bool(f"schema8_A_anchor_{p}") for p in base.ALL}
    exactly(probe.solver, anchor.values(), 1)
    for p in base.ALL:
        probe.add("schema8_A_anchor_valid", z3.Implies(anchor[p], z3.Not(selected[p])))
        probe.add("schema8_A_anchor_not_deleted", z3.Implies(anchor[p], z3.Not(deleted[p])))
    arow = dynamic_row(probe, selected, anchor, deleted)
    probe.add("schema8_A_row_card_ge_four", z3.PbGe([(arow[p], 1) for p in base.ALL], 4))

    candidates = source_selected_row_candidates(probe)
    bsel = {name: z3.Bool(f"schema8_B_is_{name}") for name, _, _ in candidates}
    exactly(probe.solver, bsel.values(), 1)
    bcenter = {
        p: z3.Or(*(z3.And(bsel[name], center == p) for name, _, center in candidates))
        for p in base.ALL
    }
    brow = {
        p: z3.Or(*(z3.And(bsel[name], row[p]) for name, row, _ in candidates))
        for p in base.ALL
    }

    # The positions are a fresh arbitrary boundary permutation.  This is an
    # explicit hypothesis-probe relaxation, not the source five-point order.
    pos = {p: z3.Int(f"schema8_boundary_position_{p}") for p in base.ALL}
    for p in base.ALL:
        probe.add("schema8_boundary_position_range", pos[p] >= 0, pos[p] < base.N)
    probe.add("schema8_boundary_position_permutation", z3.Distinct(*pos.values()))
    ia = selector_value(selected)
    ib = selector_value(bcenter)
    ic = z3.Int("schema8_ic")
    id_ = z3.Int("schema8_id")
    for term, label in ((ic, "ic"), (id_, "id")):
        probe.add(f"schema8_{label}_range", term >= 0, term < base.N)
    # Dynamic point selectors for the two later witnesses.
    ic_sel, id_sel = point_selector(ic), point_selector(id_)
    probe.add("schema8_distinct_quadruple", z3.Distinct(ia, ib, ic, id_))
    pos_of = lambda value: z3.Sum(*(z3.If(value == p, pos[p], 0) for p in base.ALL))
    probe.add("schema8_ordered_quadruple", pos_of(ia) < pos_of(ib), pos_of(ib) < pos_of(ic), pos_of(ic) < pos_of(id_))
    shared = z3.And(
        z3.Or(*(z3.And(ic_sel[p], arow[p]) for p in base.ALL)),
        z3.Or(*(z3.And(id_sel[p], arow[p]) for p in base.ALL)),
        z3.Or(*(z3.And(ic_sel[p], brow[p]) for p in base.ALL)),
        z3.Or(*(z3.And(id_sel[p], brow[p]) for p in base.ALL)),
    )
    return shared, {
        "a_row": arow,
        "b_row": brow,
        "bsel": bsel,
        "pos": pos,
        "ia": ia,
        "ib": ib,
        "ic": ic,
        "id": id_,
    }


def build(args):
    """Reproduce the historical, invalid Schema-8 formula.

    Selector terms are free solver variables.  Thus adding ``Not(shared)``
    asks Z3 for one selector assignment that fails ``shared``; it does not
    encode the negation of an existential producer.  Keep this builder for
    audit/reproduction, but do not use it for production closure.
    """
    # Reuse schema-7's source branches and dynamic Kalmanson cut exactly.
    probe, terms, order_case = v7.build_query(args)
    shared, selectors = shared_late_pair_terms(
        probe, order_case.selected_endpoint, args.slot, args.query
    )
    # Negating the producer is the actual countermodel query for this round.
    probe.add("schema8_negated_shared_late_pair_hypothesis", z3.Not(shared))
    return probe, order_case, shared, selectors


def eval_point(model, term):
    return model.eval(term, model_completion=True).as_long()


def run(args):
    """Historical reproduction helper; the public ``--run`` path is blocked."""
    probe, order_case, shared, selectors = build(args)
    started = time.monotonic()
    status = probe.solver.check()
    result = {
        "schema_version": SCHEMA_VERSION,
        "n": args.n,
        "arm": args.arm,
        "radius_mode": args.radius_mode,
        "canonical_slot": args.slot,
        "surface_scope": args.surface_scope,
        "source_order_case": {
            "endpoint_mapping": order_case.mapping,
            "order_arm": order_case.arm,
            "selected_endpoint": order_case.selected_endpoint,
        },
        "survivor_query": args.query,
        "status": v7.ingress.status_name(status),
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "timeout_ms": args.timeout_ms,
        "assertion_count": len(probe.solver.assertions()),
        "constraint_counts": probe.counts,
        "hypothesis": "dynamic shared-late-pair producer negated",
        "trust_boundary": (
            "bounded external Z3 incidence/radius evidence; schema-8 adds a "
            "fresh arbitrary boundary permutation and dynamic Q/C row choice. "
            "The shared-late-pair producer is NOT source-entitled; no Euclidean "
            "realizability, universal lift, or Lean closure."
        ),
    }
    if status == z3.sat:
        model = probe.solver.model()
        bname = next(name for name, sel in selectors["bsel"].items() if z3.is_true(model.eval(sel, model_completion=True)))
        a_support = [base.NAMES[p] for p in base.ALL if z3.is_true(model.eval(selectors["a_row"][p], model_completion=True))]
        b_support = [base.NAMES[p] for p in base.ALL if z3.is_true(model.eval(selectors["b_row"][p], model_completion=True))]
        result["countermodel"] = {
            "B_named_row": bname,
            "ia": base.NAMES[eval_point(model, selectors["ia"])],
            "ib": base.NAMES[eval_point(model, selectors["ib"])],
            "ic": base.NAMES[eval_point(model, selectors["ic"])],
            "id": base.NAMES[eval_point(model, selectors["id"])],
            "A_support": a_support,
            "B_support": b_support,
            "boundary_order": [
                base.NAMES[p]
                for p, _ in sorted(
                    ((p, eval_point(model, selectors["pos"][p])) for p in base.ALL),
                    key=lambda pair: pair[1],
                )
            ],
            "shared_late_pair": z3.is_true(model.eval(shared, model_completion=True)),
        }
    elif status == z3.unknown:
        result["reason_unknown"] = probe.solver.reason_unknown()
    return result


def self_check():
    args = argparse.Namespace(
        n=17, arm="equalCrossRowCenters", radius_mode="common", slot=0,
        surface_scope="live-equal-common-dual", endpoint_mapping="q1-outside",
        order_arm=1, query="canonical-survives", timeout_ms=1000,
    )
    probe, case, shared, selectors = build(args)
    assert SCHEMA_VERSION == 8
    assert case.selected_endpoint == "q2"
    assert len(selectors["bsel"]) == 4
    assert len(probe.solver.assertions()) > 0
    return {"status": "PASS", "schema_version": SCHEMA_VERSION, "assertions": len(probe.solver.assertions())}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, choices=(17, 19), default=17)
    parser.add_argument("--arm", choices=base.FreshThirdN17.RESIDUALS, default="equalCrossRowCenters")
    parser.add_argument("--radius-mode", choices=("aligned", "common"), default="common")
    parser.add_argument("--slot", type=int, choices=(0, 1), default=0)
    parser.add_argument("--surface-scope", choices=v7.SURFACE_SCOPES, default="live-equal-common-dual")
    parser.add_argument("--endpoint-mapping", choices=("q1-outside", "q2-outside"), default="q1-outside")
    parser.add_argument("--order-arm", type=int, choices=(1, 2, 3, 4), default=1)
    parser.add_argument("--query", choices=("canonical-survives", "other-survives"), default="canonical-survives")
    parser.add_argument("--timeout-ms", type=int, default=30000)
    parser.add_argument("--run", action="store_true")
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()
    if args.run:
        parser.error(RUN_DISABLED_MESSAGE)
    result = self_check() if args.self_check else {"schema_version": SCHEMA_VERSION, "status": "DESCRIBE", "trust_boundary": "diagnostic only"}
    payload = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(payload)
        print(json.dumps({"out": str(args.out), "status": result.get("status")}, sort_keys=True))
    else:
        print(payload)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
