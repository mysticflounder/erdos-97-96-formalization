#!/usr/bin/env python3
"""Schema-9 coherent shared-pair probe for the FreshThird residual.

Schema 8 was invalid because selector variables were left free under
``Not(shared)``.  Schema 9 enumerates every finite anchor/center candidate
inside one ``good_exists`` disjunction.  The only new solver variables are a
full boundary-position permutation constrained by the source-proved
five-role order arm; there are no A/B/pair selector variables.

This remains bounded external Z3 evidence.  The source order and K4 packet are
reused from schema 7, and no claim of Euclidean realizability or an
arbitrary-cardinality lift is made here.
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from dataclasses import dataclass
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_dynamic_endpoint_deletion_probe as v7  # noqa: E402
import n17_freshthird_incidence_probe as base  # noqa: E402


SCHEMA_VERSION = 9
N = 17
LIVE_ARGS = {
    "n": 17,
    "arm": "equalCrossRowCenters",
    "radius_mode": "common",
    "slot": 0,
    "surface_scope": "live-equal-common-dual",
}


@dataclass(frozen=True)
class SourceRoles:
    q_outside: dict[int, z3.BoolRef]
    q_between: dict[int, z3.BoolRef]
    fresh_center: dict[int, z3.BoolRef]
    source_center: dict[int, z3.BoolRef]
    canonical_source: dict[int, z3.BoolRef]


def selected_value(selector: dict[int, z3.BoolRef]) -> z3.ArithRef:
    return z3.Sum(*(z3.If(selector[p], p, 0) for p in base.ALL))


def source_roles(probe, mapping: str, slot: int) -> SourceRoles:
    q_outside = probe.q1_is if mapping == "q1-outside" else probe.q2_is
    q_between = probe.q2_is if mapping == "q1-outside" else probe.q1_is
    return SourceRoles(
        q_outside=q_outside,
        q_between=q_between,
        fresh_center={p: probe.q1_center == p for p in base.ALL},
        source_center={p: probe.c_center[slot] == p for p in base.ALL},
        canonical_source={p: probe.c_source_is[slot, p] for p in base.ALL},
    )


def add_source_boundary_order(probe, mapping: str, arm: int, slot: int):
    """Add the full BoundaryIndexing.indexOf permutation and exact five-role order."""
    roles = source_roles(probe, mapping, slot)
    pos = {p: z3.Int(f"schema9_boundary_position_{p}") for p in base.ALL}
    for p in base.ALL:
        probe.add("schema9_boundary_position_range", pos[p] >= 0, pos[p] < base.N)
    probe.add("schema9_boundary_position_permutation", z3.Distinct(*pos.values()))

    def pos_of(selector: dict[int, z3.BoolRef]) -> z3.ArithRef:
        return z3.Sum(*(z3.If(selector[p], pos[p], 0) for p in base.ALL))

    q_out = pos_of(roles.q_outside)
    fresh = pos_of(roles.fresh_center)
    q_between = pos_of(roles.q_between)
    source = pos_of(roles.source_center)
    canonical = pos_of(roles.canonical_source)
    probe.add("schema9_source_role_distinct", z3.Distinct(q_out, fresh, q_between, source, canonical))
    if arm == 1:
        order = (q_out < fresh, fresh < q_between, q_between < source, source < canonical)
    elif arm == 2:
        order = (q_out < fresh, fresh < q_between, q_between < canonical, canonical < source)
    elif arm == 3:
        order = (canonical < source, source < q_between, q_between < fresh, fresh < q_out)
    elif arm == 4:
        order = (source < canonical, canonical < q_between, q_between < fresh, fresh < q_out)
    else:
        raise ValueError(f"order arm must be 1..4, got {arm}")
    probe.add("schema9_source_five_role_order", *order)
    return pos, roles, pos_of


def coherent_good_terms(probe, selected, deleted, pos):
    """Return the finite producer disjunction and deterministic candidate count."""
    def pos_of_point(point: int) -> z3.ArithRef:
        return pos[point]

    def btw(c: int, b: int, p: int) -> z3.BoolRef:
        pc, pb, pp = pos_of_point(c), pos_of_point(b), pos_of_point(p)
        return z3.Or(z3.And(pc < pp, pp < pb), z3.And(pb < pp, pp < pc))

    goods = []
    for c in base.ALL:
        for a in base.ALL:
            a_valid = z3.And(
                selected[c],
                a != c,
                z3.Not(deleted[a]),
                z3.PbGe(
                    [
                        (z3.And(p != c, z3.Not(deleted[p]), probe.E(c, a, p)), 1)
                        for p in base.ALL
                    ],
                    4,
                ),
            )
            aclass = {
                p: z3.And(p != c, z3.Not(deleted[p]), probe.E(c, a, p))
                for p in base.ALL
            }
            for b in base.ALL:
                shared = {p: z3.And(aclass[p], probe.m[b, p]) for p in base.ALL}
                inside = z3.PbGe(
                    [(z3.And(shared[p], btw(c, b, p)), 1) for p in base.ALL], 2
                )
                outside = z3.PbGe(
                    [(z3.And(shared[p], z3.Not(btw(c, b, p))), 1) for p in base.ALL], 2
                )
                goods.append(z3.And(a_valid, b != c, z3.Or(inside, outside)))
    return z3.Or(*goods), len(goods)


def build(args: argparse.Namespace, *, negate: bool = True):
    for key, expected in LIVE_ARGS.items():
        if getattr(args, key) != expected:
            raise ValueError(f"Schema 9 is restricted to {key}={expected!r}")
    probe, _, order_case = v7.build_query(args)
    pos, roles, _ = add_source_boundary_order(
        probe, args.endpoint_mapping, args.order_arm, args.slot
    )
    selected = probe.q1_is if order_case.selected_endpoint == "q1" else probe.q2_is
    other = probe.q2_is if order_case.selected_endpoint == "q1" else probe.q1_is
    deleted = (
        {p: probe.c_source_is[args.slot, p] for p in base.ALL}
        if args.query == "canonical-survives"
        else other
    )
    good_exists, candidate_count = coherent_good_terms(probe, selected, deleted, pos)
    if negate:
        probe.add("schema9_negated_good_exists", z3.Not(good_exists))
    return probe, order_case, pos, roles, good_exists, candidate_count


def _args(**overrides) -> argparse.Namespace:
    values = dict(
        n=17, arm="equalCrossRowCenters", radius_mode="common", slot=0,
        surface_scope="live-equal-common-dual", endpoint_mapping="q1-outside",
        order_arm=1, query="canonical-survives", timeout_ms=1000,
    )
    values.update(overrides)
    return argparse.Namespace(**values)


def self_check() -> dict[str, object]:
    cases = []
    candidate_counts = set()
    first_probe = None
    first_good = None
    for mapping in ("q1-outside", "q2-outside"):
        for arm in (1, 2, 3, 4):
            for query in ("canonical-survives", "other-survives"):
                args = _args(endpoint_mapping=mapping, order_arm=arm, query=query)
                built = build(args)
                probe, _, pos, _, good_exists, count = built
                if first_probe is None:
                    first_probe, first_good = probe, good_exists
                assert count == base.N ** 3 == 4913
                candidate_counts.add(count)
                # `good_exists` is built entirely from source/schema-7 terms.
                # The only declarations introduced by schema 9 are the full
                # boundary-position permutation; inspect those declarations
                # directly instead of recursively traversing the huge OR AST
                # (z3util.get_vars stringifies that AST and is prohibitively
                # slow for 4,913 candidates).
                assert {
                    var.decl().name() for var in pos.values()
                } == {
                    f"schema9_boundary_position_{p}" for p in base.ALL
                }
                assert len(pos) == base.N
                cases.append((mapping, arm, query, len(probe.solver.assertions())))

    assert first_probe is not None and first_good is not None
    first_probe.solver.push()
    first_probe.add("schema9_canary", first_good, z3.Not(first_good))
    canary = first_probe.solver.check()
    first_probe.solver.pop()
    assert canary == z3.unsat

    smoke_probe, _, _, _, _, _ = build(_args(timeout_ms=1000), negate=False)
    smoke_status = smoke_probe.solver.check()
    assert smoke_status in (z3.sat, z3.unknown)
    return {
        "status": "PASS",
        "schema_version": SCHEMA_VERSION,
        "case_count": len(cases),
        "candidate_count": next(iter(candidate_counts)),
        "assertion_counts": {f"{m}/arm{a}/{q}": n for m, a, q, n in cases},
        "canary": "UNSAT",
        "base_smoke": {"status": str(smoke_status)},
    }


def run(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    probe, order_case, pos, _, _, candidate_count = build(args)
    status = probe.solver.check()
    result = {
        "schema_version": SCHEMA_VERSION,
        "status": v7.ingress.status_name(status),
        "n": args.n,
        "endpoint_mapping": args.endpoint_mapping,
        "order_arm": args.order_arm,
        "selected_endpoint": order_case.selected_endpoint,
        "query": args.query,
        "candidate_count": candidate_count,
        "assertion_count": len(probe.solver.assertions()),
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "boundary_positions": len(pos),
        "trust_boundary": "bounded exact-incidence evidence; no Euclidean realization or universal lift",
    }
    if status == z3.unknown:
        result["reason_unknown"] = probe.solver.reason_unknown()
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, choices=(17,), default=17)
    parser.add_argument("--arm", choices=("equalCrossRowCenters",), default="equalCrossRowCenters")
    parser.add_argument("--radius-mode", choices=("common",), default="common")
    parser.add_argument("--slot", type=int, choices=(0,), default=0)
    parser.add_argument("--surface-scope", choices=("live-equal-common-dual",), default="live-equal-common-dual")
    parser.add_argument("--endpoint-mapping", choices=("q1-outside", "q2-outside"), default="q1-outside")
    parser.add_argument("--order-arm", type=int, choices=(1, 2, 3, 4), default=1)
    parser.add_argument("--query", choices=("canonical-survives", "other-survives"), default="canonical-survives")
    parser.add_argument("--timeout-ms", type=int, default=30000)
    parser.add_argument("--run", action="store_true")
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()
    if args.run:
        check = self_check()
        if check["status"] != "PASS":
            parser.error("Schema 9 self-check failed; refusing production run")
        result = run(args)
    elif args.self_check:
        result = self_check()
    else:
        result = {
            "schema_version": SCHEMA_VERSION,
            "status": "DESCRIBE",
            "contract": "finite OR over all c,a,b candidates; source-constrained boundary permutation",
        }
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
