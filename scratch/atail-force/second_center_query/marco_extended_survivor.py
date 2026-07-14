#!/usr/bin/env python3
"""Enumerate multiple exact row-minimal cores from one extended survivor."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import classify_extended_shard_survivors as source  # noqa: E402
from census.atail_force.producer_mus import MarcoEnumerator  # noqa: E402


REMOVABLE_FIRST = {
    2: (2, 4, 7, 10),
    3: (2, 3, 4, 7, 8, 9),
    6: (2, 3, 8, 10),
}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--shard", type=int, required=True, choices=(2, 3, 6))
    parser.add_argument("--max-oracle-calls", type=int, default=48)
    parser.add_argument("--max-minimal-cores", type=int, default=6)
    parser.add_argument("--max-map-iterations", type=int, default=192)
    parser.add_argument("--timeout-seconds", type=float, default=10.0)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    record = next(row for row in source.SURVIVORS if row[0] == args.shard)
    rows = tuple(
        source.MetricRow(center, support, False)
        for center, support in record[2]
    )
    rank = {
        center: index
        for index, center in enumerate(REMOVABLE_FIRST[args.shard])
    }
    rows = tuple(sorted(
        rows,
        key=lambda row: (rank.get(row.center, len(rank)), row.center),
    ))
    encoded = tuple(source.cegar.encode_metric_row(row) for row in rows)
    by_key = {
        source.cegar.encode_metric_row(row): row for row in rows
    }
    oracle_records = []

    def oracle(subset: frozenset[str]) -> str:
        selected = tuple(by_key[key] for key in encoded if key in subset)
        checked = source.cegar.exact_crosscheck(
            12, selected, timeout_s=args.timeout_seconds
        )
        status = str(checked["status"])
        if status == "CROSSCHECKED_UNIT":
            verdict = "UNSAT"
        elif status == "CROSSCHECKED_NONUNIT":
            verdict = "SAT"
        else:
            verdict = "UNKNOWN"
        oracle_records.append({
            "rows": [source.cegar.encode_metric_row(row) for row in selected],
            "verdict": verdict,
            "crosscheck": source.cegar.crosscheck_summary(checked),
        })
        return verdict

    result = MarcoEnumerator(
        encoded,
        oracle,
        max_oracle_calls=args.max_oracle_calls,
        max_minimal_cores=args.max_minimal_cores,
        max_map_iterations=args.max_map_iterations,
    ).run()
    document = {
        "schema": "p97-atail-extended-survivor-marco-v1",
        "profile": [4, 5, 6],
        "shard_index": args.shard,
        "source_row_sha256": record[1],
        "universe_order_policy": "confirmed-removable-rows-first-v1",
        "budgets": {
            "max_oracle_calls": args.max_oracle_calls,
            "max_minimal_cores": args.max_minimal_cores,
            "max_map_iterations": args.max_map_iterations,
            "per_solver_timeout_seconds": args.timeout_seconds,
        },
        "result": {
            "status": result.status,
            "oracle_calls": result.oracle_calls,
            "cache_hits": result.cache_hits,
            "map_iterations": result.map_iterations,
            "unknown_subset": (
                list(result.unknown_subset)
                if result.unknown_subset is not None else None
            ),
            "minimal_cores": [
                {
                    "discovery_index": core.discovery_index,
                    "rows": list(core.atoms),
                    "row_count": len(core.atoms),
                }
                for core in result.minimal_cores
            ],
        },
        "oracle_records": oracle_records,
        "scope": {
            "fixed_placement_finite_shadow_only": True,
            "target_faithful": False,
            "unknown_is_fail_closed": True,
            "lean_consumer_proved": False,
        },
    }
    rendered = json.dumps(document, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")
        print(json.dumps(document["result"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
