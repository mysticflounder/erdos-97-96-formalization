#!/usr/bin/env python3
"""Mine metric/order obstructions from the exact-12 incidence survivor.

This is a theorem-discovery probe.  Its input omits several hypotheses of the
Lean leaf, and no result emitted here is a Lean closure certificate.
"""

from __future__ import annotations

import argparse
import itertools
import json
import sys
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT))

from census.global_confinement import metric_realizability_probe as metric  # noqa: E402


N = 12


def boundary_orders() -> tuple[tuple[int, ...], ...]:
    """Enumerate cap-compatible orders using the proved second-cap order."""

    orders = {
        (0, *o2, 1, *surplus, 2, *second)
        for o2 in itertools.permutations((10, 11))
        for surplus in itertools.permutations((3, 4, 5))
        for second in ((6, 7, 8, 9), (9, 8, 7, 6))
    }
    assert len(orders) == 24
    return tuple(sorted(orders))


def retained_second_cap_block_orders() -> tuple[tuple[int, ...], ...]:
    """Enumerate the broader order universe justified by the retained block.

    Cutting the ambient boundary at the left endpoint of the second cap makes
    that exact six-point cap a prefix.  Its endpoints are labels 0 and 2, and
    the forced interior order is 6,7,8,9 or its reverse.  No order constraint
    is imposed here on the six labels outside that cap.
    """

    outside = (1, 3, 4, 5, 10, 11)
    prefixes = (
        (0, 6, 7, 8, 9, 2),
        (0, 9, 8, 7, 6, 2),
        (2, 6, 7, 8, 9, 0),
        (2, 9, 8, 7, 6, 0),
    )
    orders = {
        (*prefix, *suffix)
        for prefix in prefixes
        for suffix in itertools.permutations(outside)
    }
    assert len(orders) == 2880
    return tuple(sorted(orders))


def shared_pair_violations(
    rows: tuple[metric.MetricRow, ...], order: tuple[int, ...]
) -> list[dict[str, object]]:
    positions = {point: index for index, point in enumerate(order)}

    def between(left: int, right: int, point: int) -> bool:
        first, second = sorted((positions[left], positions[right]))
        return first < positions[point] < second

    failures: list[dict[str, object]] = []
    for first, second in itertools.combinations(rows, 2):
        common = sorted(set(first.support) & set(second.support))
        if len(common) != 2:
            continue
        separated = between(first.center, second.center, common[0]) != between(
            first.center, second.center, common[1]
        )
        if not separated:
            failures.append(
                {
                    "centers": [first.center, second.center],
                    "common_pair": common,
                }
            )
    return failures


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, default=HERE / "model.json")
    parser.add_argument("--output", type=Path, default=HERE / "metric-order-mining.json")
    parser.add_argument(
        "--order-universe",
        choices=("cap-blocks-24", "second-cap-block-2880"),
        default="cap-blocks-24",
    )
    parser.add_argument(
        "--formalized-only",
        action="store_true",
        help="skip the diagnostic SMT metric probe for each boundary order",
    )
    args = parser.parse_args()
    source = json.loads(args.input.read_text())
    rows = tuple(
        metric.MetricRow(
            center=center,
            support=tuple(sorted(source["cube"][str(center)])),
            exact=False,
        )
        for center in range(N)
    )
    orders = (
        boundary_orders()
        if args.order_universe == "cap-blocks-24"
        else retained_second_cap_block_orders()
    )
    order_results = []
    for index, order in enumerate(orders):
        core = metric._formalized_metric_core(
            rows,
            N,
            order,
            include_extended=True,
            include_ordered=True,
        )
        probe = (
            {"status": "SKIPPED", "decisive_stage": None, "diagnostic": None}
            if args.formalized_only
            else metric.probe_metric_rows(N, rows, order=order, timeout_s=5.0)
        )
        order_results.append(
            {
                "order_id": f"order-{index:02d}",
                "order": list(order),
                "formalized_core": core,
                "shared_pair_violations": shared_pair_violations(rows, order),
                "metric_status": probe["status"],
                "metric_decisive_stage": probe.get("decisive_stage"),
                "metric_diagnostic": probe.get("diagnostic"),
            }
        )

    unordered = metric._exact_metric_unsat_core(
        {
            "system_id": "pentagon-offclass-exact12-incidence-survivor",
            "n": N,
            "rows": [row.as_dict() for row in rows],
        },
        timeout_s=30.0,
    )
    report = {
        "scope": (
            "theorem-discovery probe over one incidence SAT survivor; "
            "not exhaustive, not a Euclidean witness, and not Lean closure"
        ),
        "source_assignment_sha256": source.get("assignment_sha256"),
        "source_iteration": source.get("iteration"),
        "row_count": len(rows),
        "order_universe": args.order_universe,
        "order_count": len(orders),
        "unordered_metric": unordered,
        "counts": {
            "formalized_core": dict(
                Counter(
                    result["formalized_core"]["stage"]
                    if result["formalized_core"] is not None
                    else "NONE"
                    for result in order_results
                )
            ),
            "shared_pair_violation_orders": sum(
                bool(result["shared_pair_violations"])
                for result in order_results
            ),
            "metric_status": dict(
                Counter(result["metric_status"] for result in order_results)
            ),
            "metric_decisive_stage": dict(
                Counter(
                    str(result["metric_decisive_stage"])
                    for result in order_results
                )
            ),
        },
        "orders": order_results,
    }
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps(report["counts"], sort_keys=True))
    print(f"unordered_metric={unordered['status']}")
    print(args.output)


if __name__ == "__main__":
    main()
