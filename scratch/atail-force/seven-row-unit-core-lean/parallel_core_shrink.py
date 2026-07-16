#!/usr/bin/env python3
"""Greedily shrink the exact equality core with parallel msolve probes."""

from __future__ import annotations

import argparse
import json
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

import analyze_equalities as system


HERE = Path(__file__).resolve().parent


def probe(proposal: tuple[int, ...], named, variables):
    start = time.monotonic()
    polynomials = [named[index][1] for index in proposal]
    try:
        forward = system.msolve_unit(polynomials, variables)
        reverse = forward and system.msolve_unit(polynomials, tuple(reversed(variables)))
        return forward and reverse, time.monotonic() - start, False
    except subprocess.TimeoutExpired:
        return False, time.monotonic() - start, True


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--workers", type=int, default=8)
    parser.add_argument("--max-deletions", type=int)
    parser.add_argument("--output", type=Path, default=HERE / "equality_core.json")
    args = parser.parse_args()

    named = system.generators()
    variables = tuple(str(variable) for variable in system.VARIABLES)
    retained = tuple(range(len(named)))
    rounds = []
    while True:
        results = {}
        with ThreadPoolExecutor(max_workers=args.workers) as executor:
            futures = {
                executor.submit(
                    probe,
                    tuple(item for item in retained if item != candidate),
                    named,
                    variables,
                ): candidate
                for candidate in retained
            }
            for future in as_completed(futures):
                candidate = futures[future]
                unit, elapsed, timed_out = future.result()
                results[candidate] = {
                    "unit": unit,
                    "elapsed_seconds": elapsed,
                    "timed_out": timed_out,
                }
        deletable = [candidate for candidate in retained if results[candidate]["unit"]]
        rounds.append({
            "retained_before": [named[index][0] for index in retained],
            "probes": {
                named[index][0]: results[index]
                for index in retained
            },
            "chosen_deletion": named[deletable[0]][0] if deletable else None,
        })
        if not deletable:
            break
        chosen = deletable[0]
        retained = tuple(index for index in retained if index != chosen)
        print(f"deleted {named[chosen][0]}; retained={len(retained)}", flush=True)
        if args.max_deletions is not None and len(rounds) >= args.max_deletions:
            break

    document = {
        "schema": "p97-atail-seven-row-equality-core-v1",
        "source_full_equality_sha256": system.EXPECTED_POLYNOMIAL_SHA256,
        "retained_indices": list(retained),
        "retained_generator_names": [named[index][0] for index in retained],
        "retained_polynomial_sha256": system.canonical_sha256(
            [named[index][1] for index in retained]
        ),
        "rounds": rounds,
        "classification": "exact-msolve-unit-both-variable-orders-for-each-chosen-deletion",
    }
    args.output.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "output": str(args.output),
        "retained_count": len(retained),
        "retained_generator_names": document["retained_generator_names"],
    }, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
