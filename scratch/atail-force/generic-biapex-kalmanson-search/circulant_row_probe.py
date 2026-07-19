#!/usr/bin/env python3
"""Enumerate circulant four-member row systems against the exact LRA checker."""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import math
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("generic_biapex_cegar", HERE / "cegar.py")
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("cannot load sibling cegar.py")
CEGAR = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(CEGAR)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--metric-timeout-ms", type=int, default=10_000)
    args = parser.parse_args()

    checked = 0
    unknown = 0
    core_sizes: dict[str, int] = {}
    for offsets in itertools.combinations(range(1, args.n), 4):
        if math.gcd(args.n, *offsets) != 1:
            continue
        rows = {
            center: tuple(sorted((center + offset) % args.n for offset in offsets))
            for center in range(args.n)
        }
        status, _centers, core, payload = CEGAR.metric_check(
            rows, args.n, args.metric_timeout_ms,
            time.monotonic() + args.metric_timeout_ms / 1000
        )
        checked += 1
        if status == z3.sat:
            print(
                json.dumps(
                    {
                        "schema": "p97-circulant-row-kalmanson-probe-v1",
                        "epistemic_status": "EXACT_RATIONAL_ABSTRACT_COUNTERMODEL",
                        "status": "SAT_VERIFIED_KALMANSON_SHADOW",
                        "n": args.n,
                        "offsets": offsets,
                        "rows": {str(center): list(row) for center, row in rows.items()},
                        "distances": payload,
                        "checked_before_hit": checked,
                    },
                    indent=2,
                    sort_keys=True,
                )
            )
            return 0
        if status == z3.unknown:
            unknown += 1
        else:
            key = str(len(core))
            core_sizes[key] = core_sizes.get(key, 0) + 1
    print(
        json.dumps(
            {
                "schema": "p97-circulant-row-kalmanson-probe-v1",
                "epistemic_status": "BOUNDED_THEOREM_DISCOVERY_NOT_LEAN_PROOF",
                "status": "NO_SAT_CIRCULANT_PATTERN",
                "n": args.n,
                "checked": checked,
                "unknown": unknown,
                "core_size_histogram": core_sizes,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
