#!/usr/bin/env python3
"""Bounded source-ingress coverage smoke for the FreshThird encoder.

This is deliberately structural only.  It enumerates the four cyclic order
arms, both ``hnames`` assignments, all four non-first fresh/row cap pairs, and
both terminal branches.  Endpoint equates the two modeled centres and
pointwise-identifies ROW with DROW (a declared support relabeling); off-endpoint
asserts distinct centres.  No metric solve, blocker-partition enumeration, or
deletion predicate is claimed.  The swapped ``hnames`` assignment remains
metadata-only until explicit source₁/source₂ roles are added.
"""

from __future__ import annotations

import argparse
import json
import sys
from itertools import product
from pathlib import Path
from time import monotonic

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_full_fidelity_cegar as F  # noqa: E402


SWAP = {"qOutside": "qBetween", "qBetween": "qOutside"}
ARM_KEYS = tuple(F.ORDER_ARMS)
CAP_PAIRS = tuple(product((1, 2), repeat=2))


def _swapped_order(order: tuple[str, ...]) -> tuple[str, ...]:
    return tuple(SWAP.get(role, role) for role in order)


def _build_for_names(order_name: str, hnames: str, timeout_ms: int):
    """Build the base arm; ``hnames`` is metadata-only until source roles exist.

    Lean's ``hnames`` disjunction maps qOutside/qBetween to source₁/source₂;
    it does not rename the cyclic-order roles or endpoint.  The current finite
    encoder has no explicit source₁/source₂ roles, so both assignments reuse
    the base arm and are marked unsupported in the manifest rather than being
    unsoundly role-swapped.
    """
    base = F.ORDER_ARMS[order_name]
    return F.build_pure_arm(base, timeout_ms), base


def _record(config_id: int, order_name: str, hnames: str, fresh_cap: int,
            row_cap: int, terminal_branch: str, timeout_ms: int) -> dict:
    started = monotonic()
    (solver, base_stats, context), order = _build_for_names(
        order_name, hnames, timeout_ms
    )
    ranks = context["ranks"]
    if terminal_branch == "endpoint":
        # Endpoint hterminal: the selected row centre is the boundary centre.
        # Pointwise ROW/DROW equalities are an explicit finite support
        # relabeling, so fan-on-ROW is fan-on-DROW in this branch.
        solver.add(ranks["pinnedCenter"] == ranks["drowCenter"])
        for row_point, drow_point in zip(F.ROW, F.DROW):
            solver.add(ranks[row_point] == ranks[drow_point])
        support_relabeling = "ROW[i]=DROW[i] for i=0..3"
    elif terminal_branch == "off_endpoint":
        # Off-endpoint hterminal: selected row centre differs from boundary.
        solver.add(ranks["pinnedCenter"] != ranks["drowCenter"])
        support_relabeling = None
    else:
        raise ValueError(f"unknown terminal branch: {terminal_branch}")
    added_stats = F.add_full_fidelity_constraints(
        solver, context, fresh_cap, row_cap,
        enforce_equal_shell_slots_in_row=True,
    )
    result = solver.check()
    endpoint_original = (
        "qBetween"
        if order_name in {
            "outside_fresh_between_source_canonical",
            "canonical_source_between_fresh_outside",
        }
        else "qOutside"
    )
    endpoint = endpoint_original
    # The off-endpoint branch requires a distinct row center and an escaping
    # point; this encoder has only the endpoint-centered DROW witness.
    return {
        "config_id": config_id,
        "order_arm": order_name,
        "order": list(order),
        "hnames": hnames,
        "hnames_map": {"qOutside": SWAP["qOutside"], "qBetween": SWAP["qBetween"]}
        if hnames == "swapped" else {"qOutside": "qOutside", "qBetween": "qBetween"},
        "fresh_cap": fresh_cap,
        "row_cap": row_cap,
        "terminal_branch": terminal_branch,
        "endpoint_id": endpoint,
        "encoder_endpoint_id": endpoint,
        "hnames_encoding": "base-source-role metadata only; unsupported"
        if hnames == "swapped" else "base-source-role identity",
        "terminal_encoding": {
            "center_relation": "pinnedCenter=drowCenter"
            if terminal_branch == "endpoint" else "pinnedCenter!=drowCenter",
            "support_relabeling": support_relabeling,
            "escape_witness": "ROW[0] (and DROW[0] under relabeling)"
            if terminal_branch == "endpoint" else "ROW[0]",
        },
        "structural_result": str(result),
        "structural_sat": result.r == 1,
        "assertions": len(solver.assertions()),
        "base_assertions": base_stats["assertions"],
        "added": added_stats,
        "timeout_ms": timeout_ms,
        "elapsed_seconds": round(monotonic() - started, 4),
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout-ms", type=int, default=250)
    parser.add_argument("--smoke-limit", type=int, default=64,
                        help="maximum configurations (default: all 64)")
    parser.add_argument(
        "--manifest", type=Path,
        default=HERE / "freshthird_source_faithful_round.manifest.json",
    )
    args = parser.parse_args(argv)
    configs = list(product(
        ARM_KEYS, ("identity", "swapped"), CAP_PAIRS,
        ("endpoint", "off_endpoint"),
    ))
    if args.smoke_limit < len(configs):
        configs = configs[: max(0, args.smoke_limit)]
    records = []
    for config_id, (order_name, hnames, (fresh_cap, row_cap), terminal_branch) in enumerate(configs):
        records.append(_record(
            config_id, order_name, hnames, fresh_cap, row_cap,
            terminal_branch, args.timeout_ms,
        ))

    manifest = {
        "campaign": "freshthird_source_faithful_round",
        "scope": "4 order arms x 2 hnames assignments x 4 fresh/row cap pairs x 2 terminal branches",
        "requested_configurations": 64,
        "generated_configurations": len(records),
        "terminal_branch_contract": {
            "endpoint": "pinnedCenter=drowCenter with pointwise ROW/DROW support relabeling",
            "off_endpoint": "pinnedCenter!=drowCenter; fan remains on the selected ROW",
        },
        "not_covered": ["swapped hnames source₁/source₂ role adapter (metadata-only)", "blocker-center set partitions", "per-row blockerCap existential", "nonrobust-center predicate", "both cross-deletion directions"],
        "encoder_soundness_notes": [
            "cross-cap blocker clause is retained as the contrapositive shape of crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair; final source-level soundness confirmation remains pending",
        ],
        "claim_scope": "diagnostic structural smoke; not source-faithful closure due metadata-only swapped hnames and unencoded blocker/deletion ingress",
        "records": records,
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    sat_count = sum(r["structural_sat"] for r in records)
    print(f"manifest={args.manifest}")
    print(f"generated={len(records)} requested=64 structural_sat={sat_count}")
    print("scope=structural-smoke-only; endpoint support relabeling explicit; no metric campaign")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
