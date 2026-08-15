#!/usr/bin/env python3
"""Schema-13: Schema-11 Z3 ingress plus the universal escape dichotomy.

The finite row quantifier is expanded over every four-subset of the n=17
carrier.  A subset is a candidate ``SelectedFourClass`` exactly when its
members have the same abstract radius at the pinned center.  The canonical
blocker/support for an outside-seed point ``z`` is represented by the existing
``row_center[z]``/``source_row[z,*]`` pair in the n=17 encoder.  Deletion
robustness is not introduced as an unconstrained Boolean: the existing
``critical_no_K4_after_source_deletion`` clauses make any source mapped to a
center a checked critical deletion witness, so ``Or_s row_center[s] = c`` is
the source-level representation of ``¬FullyDeletionRobustAt`` in this finite
model.

This remains bounded abstract Z3 evidence.  It has no Euclidean realization,
no arbitrary-cardinality lift, and no Lean closure claim.
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from functools import cache
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_schema11_pinned_seed_probe as v11  # noqa: E402
import n17_freshthird_incidence_probe as base  # noqa: E402

SCHEMA_VERSION = 13


def add_universal_escape(probe, pinned_center_is):
    """Add the exact finite expansion of the Lean universal dichotomy."""
    seed = {
        p: z3.Or(probe.c_source_row[0, p], probe.q1_row[p]) for p in base.ALL
    }
    terms = []
    for center in base.ALL:
        critical_deletion = z3.Or(*(probe.row_center[s] == center for s in base.ALL))
        row_bits = [z3.Bool(f"schema13_row_{center}_{p}") for p in base.ALL]
        valid_row = z3.And(
            z3.PbEq([(bit, 1) for bit in row_bits], 4),
            z3.Not(row_bits[center]),
            z3.Or(
                *(
                    z3.And(
                        row_bits[anchor],
                        *(
                            z3.Implies(row_bits[point], probe.E(center, anchor, point))
                            for point in base.ALL
                            if point != center and point != anchor
                        ),
                    )
                    for anchor in base.ALL
                    if anchor != center
                ),
            ),
        )
        for point in base.ALL:
            outside_seed = z3.Not(seed[point])
            overlap = z3.PbLe(
                [(z3.And(row_bits[p], probe.source_row[point, p]), 1) for p in base.ALL],
                2,
            )
            branch_a = z3.And(
                probe.row_center[point] == center,
                z3.And(*(probe.source_row[point, p] == row_bits[p] for p in base.ALL)),
                critical_deletion,
            )
            branch_b = z3.And(probe.row_center[point] != center, overlap)
            terms.append(
                z3.ForAll(
                    row_bits,
                    z3.Implies(
                        z3.And(pinned_center_is[center], valid_row, row_bits[point], outside_seed),
                        z3.Or(branch_a, branch_b),
                    ),
                )
            )
    for term in terms:
        probe.add("schema13_universal_escape", term)
    return {
        "candidate_row_count": 2380,
        "candidate_point_count": len(base.ALL),
        "universal_term_count": len(terms),
        "canonical_blocker_field": "row_center[z]",
        "canonical_support_field": "source_row[z,*]",
        "deletion_robustness_field": "Or_s(row_center[s] = center), backed by critical_no_K4_after_source_deletion",
    }


def _args(**overrides) -> argparse.Namespace:
    return v11._args(**overrides)


def build(args: argparse.Namespace):
    probe, order_case, pos, roles, pinned_center_is, deleted, stats = v11.build(args)
    schema13_stats = add_universal_escape(probe, pinned_center_is)
    stats = {**stats, "schema13": schema13_stats}
    return probe, order_case, pos, roles, pinned_center_is, deleted, stats


@cache
def self_check() -> dict[str, object]:
    probe, _, _, _, _, _, stats = build(_args())
    assert stats["schema13"]["candidate_row_count"] == 2380
    assert stats["schema13"]["universal_term_count"] == 17 * 17
    assert stats["schema13"]["canonical_blocker_field"] == "row_center[z]"
    assert "critical_no_K4_after_source_deletion" in stats["schema13"]["deletion_robustness_field"]
    assert len(probe.solver.assertions()) > 0
    return {
        "status": "PASS",
        "schema_version": SCHEMA_VERSION,
        "case_count": 1,
        "solver_check_called_for_cases": False,
        "construction_stats": stats["schema13"],
    }


def run_one(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    probe, order_case, pos, _, _, _, stats = build(args)
    status = probe.solver.check()
    result = {
        "schema_version": SCHEMA_VERSION,
        "status": "SAT" if status == z3.sat else "UNSAT" if status == z3.unsat else "UNKNOWN",
        "assertion_count": len(probe.solver.assertions()),
        "selected_endpoint": order_case.selected_endpoint,
        "boundary_positions": len(pos),
        "construction_stats": stats,
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "trust_boundary": "bounded finite Z3 evidence only; no Euclidean or universal lift",
    }
    if status == z3.unknown:
        result["reason_unknown"] = probe.solver.reason_unknown()
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--run-one", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=250)
    args = parser.parse_args()
    if args.self_check:
        result = self_check()
    elif args.run_one:
        result = run_one(_args(timeout_ms=args.timeout_ms))
    else:
        result = {"schema_version": SCHEMA_VERSION, "status": "DESCRIBE"}
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
