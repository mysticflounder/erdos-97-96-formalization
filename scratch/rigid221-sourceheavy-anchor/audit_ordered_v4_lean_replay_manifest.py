#!/usr/bin/env python3
"""Check the ordered-v4 record partition used by the Lean replay modules.

This is an accounting check, not a Lean or source-coverage proof.  The Lean
modules themselves prove the listed consumers; this script checks only that
their documented iteration groups are disjoint and exhaust the extracted
ordered records.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
CUTS = ROOT / "scratch/rigid221-sourceheavy-anchor/ordered-v4-cuts.jsonl"

REPLAY_GROUPS = {
    "exact_replays": [
        706,
        707,
        1479,
        1601,
        2118,
        2653,
        2751,
        3881,
        3882,
        4669,
        4723,
        4898,
        4927,
        5404,
        5406,
        5959,
        6012,
        6116,
    ],
    "three_row_schemas": [8391, 8922, 9976, 10137, 10138, 10349],
    "universal_three_row_schemas": [
        6302,
        6303,
        6956,
        7536,
        7952,
        8515,
        8674,
        8713,
        9306,
        10182,
    ],
    "residual_multi_core_coverage": [7808, 8077, 8556],
}


def main() -> None:
    data = CUTS.read_bytes()
    records = [json.loads(line) for line in data.splitlines() if line.strip()]
    observed = [record["iteration"] for record in records]
    expected = [iteration for group in REPLAY_GROUPS.values() for iteration in group]

    if len(observed) != len(set(observed)):
        raise SystemExit("ordered-v4 extraction contains duplicate iterations")
    if len(expected) != len(set(expected)):
        raise SystemExit("Lean replay groups overlap")
    if set(observed) != set(expected):
        raise SystemExit(
            json.dumps(
                {
                    "missing_from_manifest": sorted(set(observed) - set(expected)),
                    "not_in_extraction": sorted(set(expected) - set(observed)),
                },
                indent=2,
            )
        )

    print(
        json.dumps(
            {
                "scope": "ordered-v4 solver-selected records; not source coverage",
                "input": str(CUTS.relative_to(ROOT)),
                "input_sha256": hashlib.sha256(data).hexdigest(),
                "record_count": len(observed),
                "groups": {name: len(values) for name, values in REPLAY_GROUPS.items()},
                "iterations": sorted(observed),
                "status": "PASS",
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
