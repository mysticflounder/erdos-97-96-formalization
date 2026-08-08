#!/usr/bin/env python3
"""Measure which ordered-v4 cuts are subsumed by the four proved schemas.

This is artifact accounting only.  The ordered journal is a sequence of
solver-selected survivors, so the result is not a source-level coverage
theorem and does not close the live Rigid221 residual.
"""

from __future__ import annotations

from collections import defaultdict
import json
from pathlib import Path


CUTS = Path(__file__).with_name("ordered-v4-cuts.jsonl")

SCHEMAS: dict[str, dict[int, set[int]]] = {
    "core_0_1_2_9_4": {1: {0, 2}, 4: {0, 2}, 9: {1, 2, 4}},
    "core_0_1_2_10_4": {1: {0, 2}, 4: {0, 2}, 10: {1, 2, 4}},
    "core_1_4_0_10_5": {4: {0, 1}, 5: {0, 1}, 10: {0, 4, 5}},
    "core_0_9_1_8_3": {9: {0, 1}, 3: {0, 1}, 8: {1, 3, 9}},
}


def satisfies(rows: dict[int, set[int]], required: dict[int, set[int]]) -> bool:
    return all(points <= rows.get(center, set()) for center, points in required.items())


def main() -> None:
    by_schema: dict[str, list[int]] = defaultdict(list)
    uncovered: list[int] = []
    records = 0

    found_iterations: set[int] = set()
    with CUTS.open(encoding="utf-8") as stream:
        for line in stream:
            record = json.loads(line)
            found_iterations.add(record["iteration"])
            records += 1
            rows = {
                entry["center"]: set(entry["support"])
                for entry in record["rows"]
            }
            hits = [
                name
                for name, required in SCHEMAS.items()
                if satisfies(rows, required)
            ]
            if not hits:
                uncovered.append(record["iteration"])
            for name in hits:
                by_schema[name].append(record["iteration"])

    report = {
        "scope": "ordered-v4 solver-selected cut records; not source coverage",
        "records": records,
        "covered_records": records - len(uncovered),
        "by_schema": {name: by_schema[name] for name in SCHEMAS},
        "uncovered_iterations": uncovered,
        "missing_iterations": [],
    }
    print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
