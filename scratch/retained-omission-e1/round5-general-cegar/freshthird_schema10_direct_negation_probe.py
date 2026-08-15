#!/usr/bin/env python3
"""Schema-10 direct form of the Schema-9 coherent-pair negation.

Schema 9 encoded ``Not (Or_{c,a,b} Good(c,a,b))`` as one large disjunction.
Schema 10 keeps the same source ingress and dynamic boundary roles, but adds
the pointwise equivalent constraints

    b != c -> Avalid(c,a) ->
      (at most one shared point strictly between c,b) and
      (at most one shared point outside the open interval).

This is bounded Z3 evidence only; it is not a Euclidean realization or a
general-cardinality Lean lift.
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
import freshthird_schema9_coherent_shared_pair_probe as v9  # noqa: E402
import n17_freshthird_incidence_probe as base  # noqa: E402


SCHEMA_VERSION = 10
N = 17
LIVE_ARGS = {
    "n": 17,
    "arm": "equalCrossRowCenters",
    "radius_mode": "common",
    "slot": 0,
    "surface_scope": "live-equal-common-dual",
}


def _at_most_one(bits: list[z3.BoolRef]) -> z3.BoolRef:
    return z3.PbLe([(bit, 1) for bit in bits], 1)


def direct_negation_terms(probe, selected, deleted, pos):
    """Return direct per-triple negations and construction statistics."""
    # Cache the source terms shared by all b choices for each (c,a), and the
    # interval predicates shared by all a choices for each (c,b).
    avalid_cache: dict[tuple[int, int], z3.BoolRef] = {}
    aclass_cache: dict[tuple[int, int], dict[int, z3.BoolRef]] = {}
    btw_cache: dict[tuple[int, int], dict[int, z3.BoolRef]] = {}
    terms: list[z3.BoolRef] = []
    for c in base.ALL:
        for b in base.ALL:
            btw_cache[c, b] = {
                p: z3.Or(
                    z3.And(pos[c] < pos[p], pos[p] < pos[b]),
                    z3.And(pos[b] < pos[p], pos[p] < pos[c]),
                )
                for p in base.ALL
            }
        for a in base.ALL:
            aclass = {
                p: z3.And(p != c, z3.Not(deleted[p]), probe.E(c, a, p))
                for p in base.ALL
            }
            aclass_cache[c, a] = aclass
            avalid_cache[c, a] = z3.And(
                selected[c],
                a != c,
                z3.Not(deleted[a]),
                z3.PbGe([(aclass[p], 1) for p in base.ALL], 4),
            )
            for b in base.ALL:
                shared = {
                    p: z3.And(aclass[p], probe.m[b, p]) for p in base.ALL
                }
                inside = _at_most_one(
                    [z3.And(shared[p], btw_cache[c, b][p]) for p in base.ALL]
                )
                outside = _at_most_one(
                    [z3.And(shared[p], z3.Not(btw_cache[c, b][p])) for p in base.ALL]
                )
                # For b=c, Good is statically false because of b != c; True
                # is its exact negation.  Keeping these 17^3 terms makes the
                # direct form visibly aligned with the Schema-9 candidate set.
                terms.append(
                    z3.Or(
                        b == c,
                        z3.Not(avalid_cache[c, a]),
                        z3.And(inside, outside),
                    )
                )
    return terms, {
        "candidate_count": len(terms),
        "aclass_count": len(aclass_cache),
        "avalid_count": len(avalid_cache),
        "btw_count": len(btw_cache),
    }


def build(args: argparse.Namespace):
    for key, expected in LIVE_ARGS.items():
        if getattr(args, key) != expected:
            raise ValueError(f"Schema 10 is restricted to {key}={expected!r}")
    probe, _, order_case = v7.build_query(args)
    pos, roles, _ = v9.add_source_boundary_order(
        probe, args.endpoint_mapping, args.order_arm, args.slot
    )
    selected = probe.q1_is if order_case.selected_endpoint == "q1" else probe.q2_is
    other = probe.q2_is if order_case.selected_endpoint == "q1" else probe.q1_is
    deleted = (
        {p: probe.c_source_is[args.slot, p] for p in base.ALL}
        if args.query == "canonical-survives" else other
    )
    terms, stats = direct_negation_terms(probe, selected, deleted, pos)
    for term in terms:
        probe.add("schema10_direct_negation", term)
    return probe, order_case, pos, roles, selected, deleted, stats


def _args(**overrides) -> argparse.Namespace:
    values = dict(
        n=17, arm="equalCrossRowCenters", radius_mode="common", slot=0,
        surface_scope="live-equal-common-dual", endpoint_mapping="q1-outside",
        order_arm=1, query="canonical-survives", timeout_ms=1000,
    )
    values.update(overrides)
    return argparse.Namespace(**values)


def finite_equivalence_check() -> dict[str, object]:
    """Exhaustively check the Boolean/count polarity on a small finite domain."""
    checks = 0
    for avalid in (False, True):
        for bneq in (False, True):
            for inside_count in range(4):
                for outside_count in range(4):
                    good = avalid and bneq and (inside_count >= 2 or outside_count >= 2)
                    direct = (not bneq) or (not avalid) or (
                        inside_count <= 1 and outside_count <= 1
                    )
                    assert (not good) == direct
                    checks += 1
    return {"status": "PASS", "checks": checks}


def polarity_canary() -> str:
    """Small exact Z3 canary for ``Good`` versus its direct negation."""
    avalid = z3.Bool("schema10_canary_avalid")
    inside = [z3.Bool(f"schema10_canary_inside_{i}") for i in range(2)]
    outside = [z3.Bool(f"schema10_canary_outside_{i}") for i in range(2)]
    good = z3.And(
        avalid,
        z3.Or(z3.PbGe([(bit, 1) for bit in inside], 2),
              z3.PbGe([(bit, 1) for bit in outside], 2)),
    )
    direct = z3.Or(
        z3.Not(avalid),
        z3.And(
            z3.PbLe([(bit, 1) for bit in inside], 1),
            z3.PbLe([(bit, 1) for bit in outside], 1),
        ),
    )
    solver = z3.Solver()
    solver.add(good, direct)
    assert solver.check() == z3.unsat
    return "UNSAT"


def self_check() -> dict[str, object]:
    finite = finite_equivalence_check()
    cases = []
    counts = set()
    first = None
    for mapping in ("q1-outside", "q2-outside"):
        for arm in (1, 2, 3, 4):
            for query in ("canonical-survives", "other-survives"):
                built = build(_args(endpoint_mapping=mapping, order_arm=arm, query=query))
                probe, _, pos, _, _, _, stats = built
                assert stats["candidate_count"] == base.N ** 3 == 4913
                assert stats["aclass_count"] == stats["avalid_count"] == base.N ** 2
                assert stats["btw_count"] == base.N ** 2
                assert {var.decl().name() for var in pos.values()} == {
                    f"schema9_boundary_position_{p}" for p in base.ALL
                }
                counts.add(len(probe.solver.assertions()))
                if first is None:
                    first = built
                cases.append((mapping, arm, query))

    # A small exact Z3 canary avoids conflating a timeout on the 49k-assertion
    # full packet with a polarity failure; the finite exhaustive check above
    # covers all Boolean/count combinations.
    canary = polarity_canary()
    return {
        "status": "PASS",
        "schema_version": SCHEMA_VERSION,
        "case_count": len(cases),
        "candidate_count": 4913,
        "assertion_counts": sorted(counts),
        "finite_equivalence": finite,
        "polarity_canary": canary,
        "solver_check_called_for_cases": False,
    }


def run_one(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    probe, order_case, pos, _, _, _, stats = build(args)
    status = probe.solver.check()
    result = {
        "schema_version": SCHEMA_VERSION,
        "status": v7.ingress.status_name(status),
        "endpoint_mapping": args.endpoint_mapping,
        "order_arm": args.order_arm,
        "query": args.query,
        "candidate_count": stats["candidate_count"],
        "assertion_count": len(probe.solver.assertions()),
        "selected_endpoint": order_case.selected_endpoint,
        "boundary_positions": len(pos),
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "trust_boundary": "bounded exact-incidence evidence; no Euclidean realization or universal lift",
    }
    if status == z3.unknown:
        result["reason_unknown"] = probe.solver.reason_unknown()
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--run-one", action="store_true")
    parser.add_argument("--endpoint-mapping", choices=("q1-outside", "q2-outside"), default="q1-outside")
    parser.add_argument("--order-arm", type=int, choices=(1, 2, 3, 4), default=1)
    parser.add_argument("--query", choices=("canonical-survives", "other-survives"), default="canonical-survives")
    parser.add_argument("--timeout-ms", type=int, default=30000)
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()
    result = self_check() if args.self_check else (
        run_one(_args(endpoint_mapping=args.endpoint_mapping, order_arm=args.order_arm, query=args.query, timeout_ms=args.timeout_ms))
        if args.run_one else {"schema_version": SCHEMA_VERSION, "status": "DESCRIBE"}
    )
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
