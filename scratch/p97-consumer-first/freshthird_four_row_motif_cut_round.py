#!/usr/bin/env python3
"""FreshThird CEGAR round with the exact four-row Kalmanson motif cut.

The learned cut is cardinality-independent.  For distinct deletion indices
``i, j, k`` it forbids the increasing boundary pattern

    x < qOutside < freshCenter < pinnedCenter < w[k] < b[j]
      < w[j] < b[i] < b[k] < w[i]

when ``x`` belongs to blocker shells ``i`` and ``j``, while blocker shell
``k`` contains both ``pinnedCenter`` and ``w[i]``.  The pinned row already
contains ``w[i]``, ``w[j]``, and ``w[k]``.  Those incidences give exactly the
five row equalities in the replay-checked eight-term weighted-Kalmanson
certificate.

This script is theorem-discovery/coverage evidence only.  It reuses the
source-faithful finite ingress and all previously proved shared-pair cuts; a
structural or metric verdict is not Lean closure until the finite coverage
and source adapter are kernel checked.
"""

from __future__ import annotations

import argparse
import sys
from itertools import permutations
from pathlib import Path
from time import monotonic

from z3 import And, Not, Or, sat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_all_row_shared_pair_cut_round as RowCuts  # noqa: E402
import freshthird_all_selected_row_pair_cut_round as PairCuts  # noqa: E402
import freshthird_full_fidelity_cegar as F  # noqa: E402
from freshthird_lazy_metric import lazy_metric_check, render_compact  # noqa: E402


def shell_has(ranks, blocker: int, role: str):
    """Physical membership in one represented exact blocker shell."""

    return Or(
        ranks[role] == ranks[f"w{blocker}"],
        *[
            ranks[role] == ranks[f"a{blocker}_{slot}"]
            for slot in range(3)
        ],
    )


def four_row_motif_witnesses(context):
    """Return every represented orientation-specific motif witness."""

    ranks = context["ranks"]
    witnesses = []
    for i, j, k in permutations(range(4), 3):
        for x in context["all_roles"]:
            order = (
                x,
                "qOutside",
                "freshCenter",
                "pinnedCenter",
                f"w{k}",
                f"b{j}",
                f"w{j}",
                f"b{i}",
                f"b{k}",
                f"w{i}",
            )
            witnesses.append(
                And(
                    *[
                        ranks[left] < ranks[right]
                        for left, right in zip(order, order[1:])
                    ],
                    shell_has(ranks, i, x),
                    shell_has(ranks, j, x),
                    shell_has(ranks, k, "pinnedCenter"),
                    shell_has(ranks, k, f"w{i}"),
                )
            )
    return witnesses


def add_four_row_motif_cut(solver, context):
    witnesses = four_row_motif_witnesses(context)
    solver.add(Not(Or(*witnesses)))
    return len(witnesses)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout-ms", type=int, default=600_000)
    parser.add_argument("--core-timeout-ms", type=int, default=30_000)
    parser.add_argument("--no-core", action="store_true")
    parser.add_argument("--max-cuts-per-iteration", type=int, default=256)
    parser.add_argument("--structural-only", action="store_true")
    args = parser.parse_args(argv)

    order_name = "outside_fresh_between_source_canonical"
    structural, _stats, context = F.build_pure_arm(
        F.ORDER_ARMS[order_name], max(F.STRUCTURAL_TIMEOUT_MS, 10_000)
    )
    F.add_full_fidelity_constraints(
        structural,
        context,
        fresh_cap=1,
        row_cap=1,
        enforce_equal_shell_slots_in_row=True,
    )
    row_cut_count = RowCuts.add_all_named_row_shared_pair_cuts(structural, context)
    pair_cut_count = PairCuts.add_all_named_row_pair_cuts(structural, context)
    motif_count = add_four_row_motif_cut(structural, context)

    structural_started = monotonic()
    structural_result = structural.check()
    structural_seconds = monotonic() - structural_started
    print("campaign=freshthird_four_row_motif_cut_round_v1")
    print(f"configuration={order_name} fresh_cap=1 row_cap=1")
    print("scope=first corrected arm only; exact finite ingress; diagnostic")
    print(f"row_blocker_shared_pair_cuts={row_cut_count}")
    print(f"named_row_pair_shared_pair_cuts={pair_cut_count}")
    print(f"four_row_motif_witnesses={motif_count}")
    print(f"structural_result={structural_result}")
    print(f"structural_runtime_seconds={structural_seconds:.3f}")
    if structural_result != sat:
        return 0

    summary = F.model_summary(structural.model(), context)
    print(f"alias_classes={summary['alias_classes']}")
    print(f"blocker_rows={summary['blocker_rows']}")
    print(f"blocker_caps={summary['blocker_caps']}")
    print(f"cap_profiles={summary['cap_profiles']}")
    if args.structural_only:
        return 0

    report = lazy_metric_check(
        structural.model(),
        context,
        timeout_ms=args.timeout_ms,
        extract_unsat_core=not args.no_core,
        core_timeout_ms=args.core_timeout_ms,
        progress=True,
        max_cuts_per_iteration=args.max_cuts_per_iteration,
    )
    print(render_compact(report))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
