#!/usr/bin/env python3
"""Exact lazy Kalmanson replay for the corrected 96+36 FreshThird cut round.

The structural model includes every named-row/canonical-blocker shared-pair
cut and every pair-of-named-rows shared-pair cut.  Metric checking delegates to
``lazy_metric_check``, which asserts the complete non-Kalmanson packet and then
adds every currently violated member of the finite Kalmanson family.  A SAT
verdict is emitted only when one exact rational model satisfies the complete
family; active-packet UNSAT implies full-packet UNSAT.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path
from time import monotonic

from z3 import sat

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_all_row_shared_pair_cut_round as RowCuts  # noqa: E402
import freshthird_all_selected_row_pair_cut_round as PairCuts  # noqa: E402
import freshthird_full_fidelity_cegar as F  # noqa: E402
from freshthird_lazy_metric import lazy_metric_check, render_compact  # noqa: E402


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout-ms", type=int, default=600_000)
    parser.add_argument("--core-timeout-ms", type=int, default=30_000)
    parser.add_argument("--no-core", action="store_true")
    parser.add_argument("--max-cuts-per-iteration", type=int, default=256)
    args = parser.parse_args(argv)

    order_name = "outside_fresh_between_source_canonical"
    structural, _stats, context = F.build_pure_arm(
        F.ORDER_ARMS[order_name], max(F.STRUCTURAL_TIMEOUT_MS, 5_000)
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

    print("stage=structural_check", flush=True)
    structural_started = monotonic()
    structural_result = structural.check()
    structural_seconds = monotonic() - structural_started
    if structural_result != sat:
        raise SystemExit(
            f"corrected structural model was {structural_result}, not sat"
        )

    print(
        f"stage=metric_packet structural_runtime_seconds={structural_seconds:.3f}",
        flush=True,
    )
    report = lazy_metric_check(
        structural.model(),
        context,
        timeout_ms=args.timeout_ms,
        extract_unsat_core=not args.no_core,
        core_timeout_ms=args.core_timeout_ms,
        progress=True,
        max_cuts_per_iteration=args.max_cuts_per_iteration,
    )
    print("stage=complete", flush=True)
    print("campaign=freshthird_all_selected_row_pair_lazy_metric_v1")
    print(f"configuration={order_name} fresh_cap=1 row_cap=1")
    print("source_fidelity=explicit w0/e0 outside six-point seed")
    print(f"row_blocker_shared_pair_cuts={row_cut_count}")
    print(f"named_row_pair_shared_pair_cuts={pair_cut_count}")
    print(f"structural_runtime_seconds={structural_seconds:.3f}")
    print(render_compact(report))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
