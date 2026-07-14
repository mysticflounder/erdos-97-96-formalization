#!/usr/bin/env python3
"""Search generator orders for a smaller exact Singular UNIT certificate."""

from __future__ import annotations

import argparse
import hashlib
import json
import random
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path


def lift_for_order(
    polynomials: list[str],
    order: tuple[int, ...],
    variable_order: tuple[str, ...],
    red_sb: bool,
    timeout: float,
) -> dict[str, object]:
    reordered = [polynomials[index] for index in order]
    commands = [
        f"ring r=0,({','.join(variable_order)}),dp;",
        f"ideal I={','.join(reordered)};",
    ]
    if red_sb:
        commands.append("option(redSB);")
    commands.extend(
        [
            "matrix L=lift(I,ideal(1));",
            'print("P97_LIFT_BEGIN");',
            *(f"print(L[{index},1]);" for index in range(1, len(order) + 1)),
            'print("P97_LIFT_END");',
            "exit;",
        ]
    )
    started = time.monotonic()
    try:
        completed = subprocess.run(
            ("Singular", "-q"),
            input="\n".join(commands) + "\n",
            capture_output=True,
            text=True,
            timeout=timeout,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {"status": "TIMEOUT", "elapsed_seconds": time.monotonic() - started}
    try:
        body = completed.stdout.split("P97_LIFT_BEGIN\n", 1)[1].split(
            "\nP97_LIFT_END", 1
        )[0]
    except IndexError:
        return {
            "status": "ERROR",
            "elapsed_seconds": time.monotonic() - started,
            "detail": (completed.stderr or completed.stdout)[-1000:],
        }
    reordered_coefficients = body.splitlines()
    if len(reordered_coefficients) != len(order):
        return {
            "status": "ERROR",
            "elapsed_seconds": time.monotonic() - started,
            "detail": f"expected {len(order)} coefficients, got {len(reordered_coefficients)}",
        }
    coefficients = [""] * len(order)
    for reordered_index, original_index in enumerate(order):
        coefficients[original_index] = reordered_coefficients[reordered_index]
    serialized = "\n".join(coefficients)
    return {
        "status": "COMPLETED",
        "elapsed_seconds": time.monotonic() - started,
        "red_sb": red_sb,
        "order": list(order),
        "variable_order": list(variable_order),
        "lift_total_char_count": len(serialized),
        "lift_max_coefficient_char_count": max(map(len, coefficients)),
        "lift_sha256": hashlib.sha256(serialized.encode()).hexdigest(),
        "lift_coefficients": coefficients,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path)
    parser.add_argument("--samples", type=int, default=1024)
    parser.add_argument("--workers", type=int, default=24)
    parser.add_argument("--timeout-seconds", type=float, default=30.0)
    parser.add_argument("--shuffle-variables", action="store_true")
    parser.add_argument("--objective", choices=("total", "max"), default="total")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.samples < 2:
        parser.error("--samples must be at least two")
    if not 1 <= args.workers <= 24:
        parser.error("--workers must be between one and 24")

    source_raw = args.certificate.read_bytes()
    source = json.loads(source_raw)
    polynomials = list(source["polynomials"])
    variables = tuple(source["variables"])
    identity = tuple(range(len(polynomials)))
    orders = {identity, tuple(reversed(identity))}
    rng = random.Random(979655415)
    while len(orders) < args.samples:
        candidate = list(identity)
        rng.shuffle(candidate)
        orders.add(tuple(candidate))
    variable_orders = {}
    for order in sorted(orders):
        candidate = list(variables)
        if args.shuffle_variables and order != identity:
            rng.shuffle(candidate)
        variable_orders[order] = tuple(candidate)
    jobs = [
        (order, variable_orders[order], red_sb)
        for order in sorted(orders)
        for red_sb in (False, True)
    ]

    completed_results = []
    status_counts: dict[str, int] = {}
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(
                lift_for_order,
                polynomials,
                order,
                variable_order,
                red_sb,
                args.timeout_seconds,
            ): (order, variable_order, red_sb)
            for order, variable_order, red_sb in jobs
        }
        for completed_count, future in enumerate(as_completed(futures), start=1):
            result = future.result()
            status = str(result["status"])
            status_counts[status] = status_counts.get(status, 0) + 1
            if status == "COMPLETED":
                completed_results.append(result)
            if completed_count % 128 == 0:
                best = min(
                    (
                        int(result["lift_total_char_count"])
                        for result in completed_results
                    ),
                    default=-1,
                )
                print(
                    f"completed {completed_count}/{len(jobs)}; best={best}",
                    flush=True,
                )

    def objective_key(result: dict[str, object]) -> tuple[object, ...]:
        size_key = (
            (
                int(result["lift_max_coefficient_char_count"]),
                int(result["lift_total_char_count"]),
            )
            if args.objective == "max"
            else (
                int(result["lift_total_char_count"]),
                int(result["lift_max_coefficient_char_count"]),
            )
        )
        return (*size_key, bool(result["red_sb"]), result["order"])

    completed_results.sort(key=objective_key)
    if not completed_results:
        parser.error("no generator order completed")
    best = completed_results[0]
    document = {
        "schema": "p97-shard-unit-certificate-order-search-v1",
        "source_certificate": str(args.certificate),
        "source_certificate_sha256": hashlib.sha256(source_raw).hexdigest(),
        "sampled_order_count": len(orders),
        "job_count": len(jobs),
        "status_counts": status_counts,
        "objective": args.objective,
        "best": best,
        "top_results": [
            {key: value for key, value in result.items() if key != "lift_coefficients"}
            for result in completed_results[:20]
        ],
    }
    rendered = json.dumps(document, indent=2, sort_keys=True)
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered + "\n")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
