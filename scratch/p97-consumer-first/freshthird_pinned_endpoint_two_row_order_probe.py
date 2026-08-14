"""Reproduce one ordered two-row FreshThird theorem-discovery cut.

This probe is deliberately single-case and fail-closed.  It does not enumerate
the 2,688 compatible total orders and does not claim a trusted certificate.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    probe_metric_rows,
)

RESULT_PATH = Path(__file__).with_name(
    "freshthird_pinned_endpoint_two_row_order_probe_result.json"
)


def run_probe(timeout_s: float) -> dict[str, object]:
    # Role order:
    # q₁, fresh center, q₂, source center, canonical source,
    # canonical second source, fresh remainder 0, fresh remainder 1.
    rows = (
        MetricRow(3, (0, 2, 4, 5), False),
        MetricRow(1, (0, 2, 6, 7), False),
    )
    result = probe_metric_rows(
        8,
        rows,
        order=tuple(range(8)),
        timeout_s=timeout_s,
        backend="legacy-local-z3",
    )
    stages = result.get("stages")
    if not isinstance(stages, list):
        raise TypeError("probe returned no stage list")
    metric_stage = next(
        (stage for stage in stages if stage.get("stage") == "exact-metric-relaxation"),
        None,
    )
    return {
        "system_id": result.get("system_id"),
        "status": result.get("status"),
        "decisive_stage": result.get("decisive_stage"),
        "metric_relaxation_status": (
            metric_stage.get("status") if isinstance(metric_stage, dict) else None
        ),
        "constraint_counts": result.get("constraint_counts"),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=float, default=20.0)
    args = parser.parse_args()
    observed = run_probe(args.timeout)
    expected = json.loads(RESULT_PATH.read_text())["classification"]
    if observed != expected:
        raise SystemExit(
            "probe result differs from the recorded artifact:\n"
            + json.dumps({"expected": expected, "observed": observed}, indent=2)
        )
    print(json.dumps(observed, sort_keys=True))


if __name__ == "__main__":
    main()
