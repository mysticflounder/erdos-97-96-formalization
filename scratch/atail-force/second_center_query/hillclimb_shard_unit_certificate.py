#!/usr/bin/env python3
"""Hill-climb generator and variable orders for a compact UNIT certificate."""

from __future__ import annotations

import argparse
import hashlib
import json
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

from optimize_shard_unit_certificate import lift_for_order


def transpositions(items: tuple[object, ...]) -> list[tuple[object, ...]]:
    results = []
    for left in range(len(items)):
        for right in range(left + 1, len(items)):
            candidate = list(items)
            candidate[left], candidate[right] = candidate[right], candidate[left]
            results.append(tuple(candidate))
    return results


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path)
    parser.add_argument("seed_search", type=Path)
    parser.add_argument("--workers", type=int, default=24)
    parser.add_argument("--timeout-seconds", type=float, default=30.0)
    parser.add_argument("--max-rounds", type=int, default=20)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    source_raw = args.certificate.read_bytes()
    source = json.loads(source_raw)
    seed = json.loads(args.seed_search.read_text(encoding="utf-8"))["best"]
    polynomials = list(source["polynomials"])
    current_order = tuple(int(index) for index in seed["order"])
    current_variables = tuple(str(variable) for variable in seed["variable_order"])
    current = lift_for_order(
        polynomials,
        current_order,
        current_variables,
        False,
        args.timeout_seconds,
    )
    history = [
        {
            "round": 0,
            "lift_total_char_count": current["lift_total_char_count"],
            "order": list(current_order),
            "variable_order": list(current_variables),
        }
    ]

    for round_index in range(1, args.max_rounds + 1):
        jobs = {
            (order, current_variables)
            for order in transpositions(current_order)
        }
        jobs.update(
            (current_order, variables)
            for variables in transpositions(current_variables)
        )
        completed = []
        with ThreadPoolExecutor(max_workers=args.workers) as executor:
            futures = {
                executor.submit(
                    lift_for_order,
                    polynomials,
                    order,
                    variables,
                    False,
                    args.timeout_seconds,
                ): (order, variables)
                for order, variables in jobs
            }
            for future in as_completed(futures):
                result = future.result()
                if result["status"] == "COMPLETED":
                    completed.append(result)
        candidate = min(
            completed,
            key=lambda result: (
                int(result["lift_total_char_count"]),
                int(result["lift_max_coefficient_char_count"]),
                result["variable_order"],
                result["order"],
            ),
        )
        if int(candidate["lift_total_char_count"]) >= int(
            current["lift_total_char_count"]
        ):
            print(
                f"round {round_index}: local optimum at "
                f"{current['lift_total_char_count']}",
                flush=True,
            )
            break
        current = candidate
        current_order = tuple(int(index) for index in current["order"])
        current_variables = tuple(str(variable) for variable in current["variable_order"])
        history.append(
            {
                "round": round_index,
                "lift_total_char_count": current["lift_total_char_count"],
                "order": list(current_order),
                "variable_order": list(current_variables),
            }
        )
        print(
            f"round {round_index}: improved to {current['lift_total_char_count']}",
            flush=True,
        )

    document = {
        "schema": "p97-shard-unit-certificate-hillclimb-v1",
        "source_certificate": str(args.certificate),
        "source_certificate_sha256": hashlib.sha256(source_raw).hexdigest(),
        "seed_search": str(args.seed_search),
        "history": history,
        "best": current,
    }
    rendered = json.dumps(document, indent=2, sort_keys=True)
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered + "\n")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
