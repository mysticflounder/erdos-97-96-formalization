#!/usr/bin/env python3
"""Scan every normalization-anchor pair for a saved equality pattern.

Each gauge relabels one old point to 0, a second old point to 1, and the
remaining labels increasingly to 2 through 11 before applying the standard
``p0 = (0,0)``, ``p1 = (1,0)`` coordinate model.  UNIT excludes that anchor
pair from every complex realization of the row equalities.  NONUNIT is only a
proper-ideal verdict for that gauge.
"""

from __future__ import annotations

import argparse
import itertools
import json
import time
from pathlib import Path

from probe_saved_source_indexed_patterns import (
    PATTERNS,
    load_oracle,
    run_msolve_raw,
)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("pattern", choices=sorted(PATTERNS))
    parser.add_argument("--timeout-seconds", type=float, default=10.0)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if not 0 < args.timeout_seconds <= 600:
        raise ValueError("timeout must lie in (0,600]")

    oracle = load_oracle()
    canonical_variables = tuple(str(value) for value in oracle.variable_symbols(12))
    variable_orders = {
        "forward": canonical_variables,
        "reverse": tuple(reversed(canonical_variables)),
    }
    reports: list[dict[str, object]] = []
    for left, right in itertools.combinations(range(12), 2):
        remaining = [label for label in range(12) if label not in {left, right}]
        old_to_new = {left: 0, right: 1}
        old_to_new.update({label: index + 2 for index, label in enumerate(remaining)})
        if sorted(old_to_new.values()) != list(range(12)):
            raise AssertionError("anchor relabeling is not a permutation")
        relabeled = {
            old_to_new[center]: tuple(
                sorted(old_to_new[point] for point in support)
            )
            for center, support in PATTERNS[args.pattern].items()
        }
        rows = tuple(
            oracle.MetricRow(center, support, exact=False)
            for center, support in sorted(relabeled.items())
        )
        serialized = oracle.serialized_system(12, rows)
        started = time.monotonic()
        msolve = {
            name: run_msolve_raw(
                oracle,
                variables,
                serialized,
                timeout_seconds=args.timeout_seconds,
                include_output=False,
            )
            for name, variables in variable_orders.items()
        }
        reports.append({
            "old_anchor_pair": [left, right],
            "old_to_new": [old_to_new[label] for label in range(12)],
            "expanded_polynomial_sha256": oracle.canonical_sha256(list(serialized)),
            "elapsed_seconds": time.monotonic() - started,
            "msolve": msolve,
        })

    payload = {
        "schema": "p97-source-indexed-anchor-pair-gauge-scan-v1",
        "pattern": args.pattern,
        "coordinate_model": "selected_old_pair_to_p0_zero_p1_e1",
        "timeout_seconds_per_order": args.timeout_seconds,
        "reports": reports,
    }
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    counts: dict[str, int] = {}
    for report in reports:
        verdict_pair = "/".join(
            str(report["msolve"][name]["verdict"])
            for name in ("forward", "reverse")
        )
        counts[verdict_pair] = counts.get(verdict_pair, 0) + 1
    print(json.dumps({
        "output": str(args.output),
        "pattern": args.pattern,
        "gauge_count": len(reports),
        "verdict_pair_counts": counts,
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
