#!/usr/bin/env python3
"""Exactly replay one mined FreshThird weighted-Kalmanson cancellation.

This is fixed-survivor theorem-discovery evidence.  The production checker
reconstructs every row-equality path and verifies exact multiset cancellation;
it does not establish universal source coverage of the live Lean residual.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT))

from census.atail_force import producer_bank


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--dual", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    source = json.loads(args.input.read_text())
    dual = json.loads(args.dual.read_text())
    n = int(source["n"])
    used_centers = set(map(int, dual["used_row_centers"]))
    rows = [
        producer_bank.MetricRow(
            int(row["center"]), tuple(map(int, row["support"])), exact=False
        )
        for row in source["selected_rows"]
        if int(row["center"]) in used_centers
    ]
    terms = []
    for name, weight in dual["multipliers"].items():
        if not name.startswith("kal"):
            continue
        head, *quad = name.split("_")
        terms.append({
            "quad": list(map(int, quad)),
            "form": "adjacentSides" if head == "kal1" else "innerOuter",
            "weight": int(weight),
        })

    certificate = producer_bank.certify_weighted_kalmanson_cancellation(
        rows, n, tuple(range(n)), terms
    )
    payload = {
        "schema": "p97-freshthird-fixed-survivor-weighted-kalmanson-v1",
        "epistemic_status": "EXACT_FIXED_SURVIVOR_ONLY",
        "input": str(args.input),
        "dual": str(args.dual),
        "row_count": len(rows),
        "term_count": len(terms),
        "certificate": certificate,
        "universal_coverage": False,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "output": str(args.output),
        "rows": len(rows),
        "terms": len(terms),
        "pairings": len(certificate["core"]["pairings"]),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
