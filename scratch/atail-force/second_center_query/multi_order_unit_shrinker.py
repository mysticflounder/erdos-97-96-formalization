#!/usr/bin/env python3
"""Find several cross-checked UNIT row cores using deterministic row orders."""

from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor
import json
import random
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import classify_extended_shard_survivors as source  # noqa: E402


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--shard", type=int, required=True, choices=(2, 3, 6))
    parser.add_argument("--orders", type=int, default=6)
    parser.add_argument("--workers", type=int, default=2)
    parser.add_argument("--seed", type=int, default=20260714)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.orders < 1 or not 1 <= args.workers <= args.orders:
        parser.error("require orders >= workers >= 1")

    record = next(row for row in source.SURVIVORS if row[0] == args.shard)
    base = tuple(
        source.MetricRow(center, support, False)
        for center, support in record[2]
    )
    rng = random.Random(args.seed + args.shard)
    orders = [base, tuple(reversed(base))]
    while len(orders) < args.orders:
        shuffled = list(base)
        rng.shuffle(shuffled)
        orders.append(tuple(shuffled))

    def shrink(index_and_rows):
        index, rows = index_and_rows
        result = source.cegar.bounded_minimize_unit(12, rows)
        retained = tuple(
            source.MetricRow(
                int(row["center"]), tuple(row["support"]), False
            )
            for row in result["retained_rows"]
        )
        checked = source.cegar.exact_crosscheck(12, retained, timeout_s=15)
        return {
            "order_index": index,
            "input_centers": [row.center for row in rows],
            "retained_rows": result["retained_rows"],
            "retained_row_count": len(retained),
            "retained_crosscheck": source.cegar.crosscheck_summary(checked),
            "attempts": result["attempts"],
        }

    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        results = list(pool.map(shrink, enumerate(orders[:args.orders])))
    cores = {}
    for result in results:
        if result["retained_crosscheck"]["status"] != "CROSSCHECKED_UNIT":
            continue
        key = tuple(sorted(
            (int(row["center"]), tuple(row["support"]))
            for row in result["retained_rows"]
        ))
        cores.setdefault(key, []).append(result["order_index"])
    document = {
        "schema": "p97-atail-multi-order-unit-shrinker-v1",
        "profile": [4, 5, 6],
        "shard_index": args.shard,
        "source_row_sha256": record[1],
        "orders": args.orders,
        "workers": args.workers,
        "results": results,
        "distinct_crosschecked_unit_cores": [
            {
                "rows": [
                    {"center": center, "support": list(support)}
                    for center, support in key
                ],
                "row_count": len(key),
                "order_indices": indices,
            }
            for key, indices in sorted(cores.items(), key=lambda item: (len(item[0]), item[0]))
        ],
        "scope": {
            "deletion_minimality_proved": False,
            "only_crosschecked_unit_subsets_are_banked": True,
            "fixed_placement_finite_shadow_only": True,
            "lean_consumer_proved": False,
        },
    }
    args.output.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "shard": args.shard,
        "distinct_crosschecked_unit_cores": len(cores),
        "row_counts": sorted(len(key) for key in cores),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
