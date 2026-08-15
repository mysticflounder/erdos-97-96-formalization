#!/usr/bin/env python3
"""Schema-11 FreshThird direct-negation probe with proved pinned multiplicity.

Schema 11 extends the source-faithful Schema-10 query by encoding the exact
two-shell ingress now proved in ``TwoSourceFreshThirdResidual.lean``:

* the canonical source row is exactly the two C sources and two Q sources;
* its intersection with the Q row is exactly the Q source pair, so their
  union is an exact six-point seed; and
* some carrier center in that seed is distinct from both exposed shell
  centers and every positive physical radius class at it meets the seed in
  at most three points.

The finite query still negates the Schema-9 shared-pair producer.  SAT is only
bounded abstract countermodel evidence; UNSAT would still require a general
Lean extraction/lift before it could close a live theorem.
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
import freshthird_schema10_direct_negation_probe as v10  # noqa: E402
import n17_freshthird_incidence_probe as base  # noqa: E402


SCHEMA_VERSION = 11


def _named_source(probe, point: int) -> z3.BoolRef:
    return z3.Or(
        probe.c_source_is[0, point],
        probe.c_source_is[1, point],
        probe.q1_is[point],
        probe.q2_is[point],
    )


def add_pinned_two_shell_ingress(probe):
    """Add the exact six-point seed and existential pinned-center contract."""
    source_row = {p: probe.c_source_row[0, p] for p in base.ALL}
    fresh_row = {p: probe.q1_row[p] for p in base.ALL}
    seed = {p: z3.Or(source_row[p], fresh_row[p]) for p in base.ALL}

    for p in base.ALL:
        probe.add(
            "schema11_exact_source_support",
            source_row[p] == _named_source(probe, p),
        )
        probe.add(
            "schema11_exact_cross_row_overlap",
            z3.And(source_row[p], fresh_row[p]) ==
                z3.Or(probe.q1_is[p], probe.q2_is[p]),
        )
    probe.add(
        "schema11_exact_seed_card",
        z3.PbEq([(seed[p], 1) for p in base.ALL], 6),
    )

    pinned_center_is = {
        center: z3.Bool(f"schema11_pinned_center_is_{center}")
        for center in base.ALL
    }
    probe.add(
        "schema11_unique_pinned_center",
        z3.PbEq([(pinned_center_is[center], 1) for center in base.ALL], 1),
    )
    for center in base.ALL:
        radius_bounds = []
        for anchor in base.ALL:
            if anchor == center:
                continue
            radius_bounds.append(
                z3.PbLe(
                    [
                        (z3.And(seed[p], probe.E(center, anchor, p)), 1)
                        for p in base.ALL
                    ],
                    3,
                )
            )
        probe.add(
            "schema11_pinned_center_multiplicity",
            z3.Implies(
                pinned_center_is[center],
                z3.And(
                seed[center],
                probe.c_center[0] != center,
                probe.q1_center != center,
                *radius_bounds,
                ),
            )
        )
    return pinned_center_is, {
        "seed_membership_variable_count": len(seed),
        "seed_cardinality": 6,
        "pinned_center_candidate_count": len(pinned_center_is),
        "radius_bound_count": len(base.ALL) * (len(base.ALL) - 1),
    }


def build(args: argparse.Namespace):
    for key, expected in v10.LIVE_ARGS.items():
        if getattr(args, key) != expected:
            raise ValueError(f"Schema 11 is restricted to {key}={expected!r}")
    probe, _, order_case = v10.v7.build_query(args)
    pos, roles, _ = v10.v9.add_source_boundary_order(
        probe, args.endpoint_mapping, args.order_arm, args.slot
    )
    pinned_center_is, schema11_stats = add_pinned_two_shell_ingress(probe)
    deleted = {p: z3.BoolVal(False) for p in base.ALL}
    terms, direct_stats = v10.direct_negation_terms(
        probe, pinned_center_is, deleted, pos
    )
    for term in terms:
        probe.add("schema11_pinned_direct_negation", term)
    return (
        probe,
        order_case,
        pos,
        roles,
        pinned_center_is,
        deleted,
        {"direct": direct_stats, "schema11": schema11_stats},
    )


def _args(**overrides) -> argparse.Namespace:
    return v10._args(**overrides)


def escape_canary() -> str:
    """An exact four-row with at most three seed hits must escape the seed."""
    solver = z3.Solver()
    row = [z3.Bool(f"schema11_canary_row_{i}") for i in range(7)]
    seed = [z3.Bool(f"schema11_canary_seed_{i}") for i in range(7)]
    solver.add(z3.PbEq([(bit, 1) for bit in row], 4))
    solver.add(z3.PbLe([(z3.And(row[i], seed[i]), 1) for i in range(7)], 3))
    solver.add(z3.Not(z3.Or(*(z3.And(row[i], z3.Not(seed[i])) for i in range(7)))))
    assert solver.check() == z3.unsat
    return "UNSAT"


def self_check() -> dict[str, object]:
    cases = []
    assertion_counts = set()
    for mapping in ("q1-outside", "q2-outside"):
        for arm in (1, 2, 3, 4):
            for query in ("canonical-survives", "other-survives"):
                probe, _, _, _, _, _, stats = build(
                    _args(endpoint_mapping=mapping, order_arm=arm, query=query)
                )
                assert stats["direct"]["candidate_count"] == 4913
                assert stats["schema11"]["pinned_center_candidate_count"] == 17
                assert stats["schema11"]["radius_bound_count"] == 272
                assertion_counts.add(len(probe.solver.assertions()))
                cases.append((mapping, arm, query))
    return {
        "status": "PASS",
        "schema_version": SCHEMA_VERSION,
        "case_count": len(cases),
        "assertion_counts": sorted(assertion_counts),
        "escape_canary": escape_canary(),
        "solver_check_called_for_cases": False,
    }


def run_one(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    probe, order_case, pos, _, _, _, stats = build(args)
    status = probe.solver.check()
    result = {
        "schema_version": SCHEMA_VERSION,
        "status": v10.v7.ingress.status_name(status),
        "endpoint_mapping": args.endpoint_mapping,
        "order_arm": args.order_arm,
        "query": args.query,
        "assertion_count": len(probe.solver.assertions()),
        "selected_endpoint": order_case.selected_endpoint,
        "boundary_positions": len(pos),
        "construction_stats": stats,
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "trust_boundary": (
            "bounded exact-incidence evidence; proved pinned-seed ingress, "
            "but no Euclidean realization or universal certificate lift"
        ),
    }
    if status == z3.unknown:
        result["reason_unknown"] = probe.solver.reason_unknown()
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--run-one", action="store_true")
    parser.add_argument(
        "--endpoint-mapping",
        choices=("q1-outside", "q2-outside"),
        default="q1-outside",
    )
    parser.add_argument("--order-arm", type=int, choices=(1, 2, 3, 4), default=1)
    parser.add_argument(
        "--query",
        choices=("canonical-survives", "other-survives"),
        default="canonical-survives",
    )
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()
    result = self_check() if args.self_check else (
        run_one(
            _args(
                endpoint_mapping=args.endpoint_mapping,
                order_arm=args.order_arm,
                query=args.query,
                timeout_ms=args.timeout_ms,
            )
        )
        if args.run_one
        else {"schema_version": SCHEMA_VERSION, "status": "DESCRIBE"}
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
