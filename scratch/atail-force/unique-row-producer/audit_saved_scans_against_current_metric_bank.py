#!/usr/bin/env python3
"""Replay saved source-indexed witnesses against the current equality bank.

The source-indexed scans are long-running artifacts.  Their verdicts can become
stale when a new generic core is promoted after the scan completed.  The
profile reconstructs the canonical cyclic boundary order, so this replay also
checks the current order-sensitive bank.  Saved reports store the fixed apex
row as their top-level support rather than duplicating it in the retained-row
list, so the replay reconstructs that row before calling either bank.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _formalized_metric_core,
)
from census.global_confinement import shadow
from census.multi_center import multi_center_census as mc
from card_five_source_indexed_target_probe import (
    FIRST_APEX,
    LOCAL_EXACT_QQ_NOGOODS,
    has_exact_qq_core_up_to_relabeling,
    local_exact_qq_nogood,
    merged_metric_rows,
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("scans", nargs="+", type=Path)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    results: list[dict[str, object]] = []
    for path in args.scans:
        payload = json.loads(path.read_text(encoding="utf-8"))
        reports = payload.get("reports")
        if not isinstance(reports, list):
            raise AssertionError(f"{path}: reports is not a list")
        profile = payload.get("profile")
        if not (
            isinstance(profile, list)
            and len(profile) == 3
            and all(isinstance(size, int) for size in profile)
        ):
            raise AssertionError(f"{path}: malformed profile")
        frame, _candidates = mc.cached_candidate_lists(
            tuple(profile), set(mc.PROVEN_ROWS)
        )
        order = shadow.hull_order(frame)
        for report_index, report in enumerate(reports):
            raw_rows = report.get("rows")
            if report.get("status") != "SAT" or not isinstance(raw_rows, list):
                continue
            retained_rows = tuple(
                MetricRow(
                    center=int(row["center"]),
                    support=tuple(int(point) for point in row["support"]),
                    exact=bool(row["exact"]),
                )
                for row in raw_rows
            )
            raw_support = report.get("support")
            if not (
                isinstance(raw_support, list)
                and all(isinstance(point, int) for point in raw_support)
            ):
                raise AssertionError(f"{path}: malformed pinned support")
            pseudo = MetricRow(
                center=FIRST_APEX,
                support=tuple(sorted(raw_support)),
                exact=True,
            )
            rows = merged_metric_rows((pseudo, *retained_rows))
            core = _formalized_metric_core(
                rows,
                frame.n,
                order,
                include_extended=True,
                include_ordered=True,
            )
            local_core = local_exact_qq_nogood(rows)
            isomorphic_local_cores = sorted(
                name
                for name, pattern in LOCAL_EXACT_QQ_NOGOODS.items()
                if has_exact_qq_core_up_to_relabeling(rows, pattern)
            )
            results.append(
                {
                    "path": str(path),
                    "report_index": report_index,
                    "support_offset": payload.get("support_offset"),
                    "assignment_signature_sha256": report.get(
                        "assignment_signature_sha256"
                    ),
                    "current_metric_core": core,
                    "current_exact_qq_local_core": local_core,
                    "current_exact_qq_isomorphic_cores": isomorphic_local_cores,
                }
            )
    print(json.dumps(results, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
