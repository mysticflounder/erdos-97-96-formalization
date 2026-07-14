#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Replay and classify the five survivors of the 8-way extended-core run."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ATAIL = HERE.parent
CEGAR = ATAIL / "second_center_metric_cegar"
ORACLE = ATAIL / "second_center_metric_oracle"
ROOT = HERE.parents[2]
for path in (CEGAR, HERE, ORACLE, ROOT):
    text = str(path)
    if text in sys.path:
        sys.path.remove(text)
    sys.path.insert(0, text)

import cegar  # noqa: E402
sys.path.insert(0, str(ATAIL))
import common_system_metric_probe as extended  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    _formalized_metric_core,
)


ORDER = (0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7)
BANKED_CORE_CHECKPOINT = HERE / "multi_order_unit_core_clusters.json"
SURVIVORS = (
    (1, "3ad378c8a4bad069cd95ff67078e2fb6484646a6a68e0861a0d9e3355ed927b3",
     ((0,(1,3,4,5)),(1,(0,2,5,6)),(2,(0,3,8,9)),(3,(1,5,8,11)),
      (4,(1,2,9,10)),(5,(2,6,7,9)),(6,(3,7,10,11)),(7,(0,2,4,11)),
      (8,(5,7,9,11)),(9,(0,4,7,10)),(10,(2,3,7,8)),(11,(1,6,8,10)))),
    (2, "722db7faaf17c276a293944eb87de60c69df2b543ece13f598c8258c4a67903c",
     ((0,(1,3,4,5)),(1,(0,2,5,6)),(2,(0,3,8,9)),(3,(1,5,9,10)),
      (4,(3,5,7,11)),(5,(2,6,7,9)),(6,(5,8,10,11)),(7,(0,4,6,10)),
      (8,(0,4,7,9)),(9,(1,6,8,11)),(10,(2,4,9,11)),(11,(2,3,7,8)))),
    (3, "9cafb78b0895e4e610f5d1a3df89e9765b5df26b3266cb70cbcc6435377845e2",
     ((0,(1,3,4,5)),(1,(0,2,5,6)),(2,(0,3,8,9)),(3,(1,5,7,8)),
      (4,(1,2,9,10)),(5,(2,3,6,11)),(6,(0,2,4,10)),(7,(5,8,10,11)),
      (8,(0,4,9,11)),(9,(0,3,7,10)),(10,(1,6,8,11)),(11,(4,6,7,9)))),
    (4, "73729fe7912accc6c03e5482003ea6e6638909d04f07c117f161d761b6b6163d",
     ((0,(1,3,4,5)),(1,(0,2,5,6)),(2,(0,3,9,10)),(3,(1,5,7,9)),
      (4,(2,3,8,11)),(5,(4,6,7,10)),(6,(1,2,8,10)),(7,(0,4,6,11)),
      (8,(2,7,9,11)),(9,(5,8,10,11)),(10,(0,3,7,8)),(11,(1,6,8,9)))),
    (6, "d930a8b643affa6c081211d4fa4090701db00f9197537f2397ebe9e0d053bd82",
     ((0,(1,3,4,5)),(1,(0,2,5,6)),(2,(0,3,8,9)),(3,(1,5,7,11)),
      (4,(1,2,9,10)),(5,(4,6,7,9)),(6,(2,3,7,10)),(7,(0,4,6,11)),
      (8,(0,3,7,11)),(9,(5,8,10,11)),(10,(2,4,7,8)),(11,(1,6,8,10)))),
)


def canonical_rows(rows: tuple[tuple[int, tuple[int, ...]], ...]) -> list[dict[str, object]]:
    return [
        {"center": center, "support": list(support), "exact": True}
        for center, support in rows
    ]


def digest(rows: tuple[tuple[int, tuple[int, ...]], ...]) -> str:
    payload = json.dumps(
        canonical_rows(rows), sort_keys=True, separators=(",", ":")
    ).encode()
    return hashlib.sha256(payload).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    problem = cegar.build_problem(cegar.metric_oracle.source_query.CASE_SEEDS[0])
    cases = []
    for shard, expected_digest, encoded in SURVIVORS:
        if digest(encoded) != expected_digest:
            raise AssertionError(f"shard {shard}: row digest drift")
        rows = tuple(MetricRow(center, support, True) for center, support in encoded)
        current = _formalized_metric_core(rows, 12, ORDER)
        classification = extended.scan_formalized_core(problem, rows)
        cases.append({
            "shard_index": shard,
            "row_sha256": expected_digest,
            "current_23_family_core": current,
            "extended_core": classification,
        })
    checkpoint = json.loads(BANKED_CORE_CHECKPOINT.read_text(encoding="utf-8"))
    banked_five_row_cores = []
    for entry in checkpoint["cores"]:
        if entry["row_count"] != 5:
            continue
        rows = tuple(
            MetricRow(row["center"], tuple(row["support"]), True)
            for row in entry["rows"]
        )
        banked_five_row_cores.append({
            "shard_index": entry["shard_index"],
            "core_index": entry["core_index"],
            "classification": extended.equilateral_hinge_collision_core(rows, 12),
        })
    if args.check:
        if any(case["current_23_family_core"] is not None for case in cases):
            raise AssertionError("saved survivor is no longer current-bank clean")
        expected_stages = {
            1: "equality-convex-six-point-two-circle-order",
            2: "equality-six-point-hinge-tail",
            3: "equality-five-point-hinge-cycle",
            4: "equality-seven-point-hinge-closed-tail",
            6: "equality-seven-point-hinge-closed-tail",
        }
        actual_stages = {
            case["shard_index"]: (
                case["extended_core"]["stage"]
                if case["extended_core"] is not None else None
            )
            for case in cases
        }
        if actual_stages != expected_stages:
            raise AssertionError("extended-core classification drift")
        expected_banked = {
            (2, 0): (
                "equality-six-point-hinge-tail",
                {"A": 0, "B": 1, "C": 2, "D": 3, "H": 5, "T": 9},
            ),
            (3, 0): (
                "equality-five-point-hinge-cycle",
                {"A": 0, "B": 1, "C": 2, "D": 3, "H": 5},
            ),
            (3, 1): (
                "equality-six-point-hinge-double-spoke",
                {"A": 0, "B": 1, "C": 2, "L": 4, "H": 5, "R": 6},
            ),
            (6, 0): (
                "equality-seven-point-hinge-closed-tail",
                {
                    "A": 0,
                    "B": 1,
                    "L": 3,
                    "M": 4,
                    "H": 5,
                    "R": 6,
                    "T": 7,
                },
            ),
        }
        actual_banked = {
            (case["shard_index"], case["core_index"]): (
                case["classification"]["stage"],
                case["classification"]["core"],
            )
            for case in banked_five_row_cores
            if case["classification"] is not None
        }
        if actual_banked != expected_banked:
            raise AssertionError("banked five-row hinge-core replay drift")
    print(json.dumps({
        "schema": "p97-atail-extended-shard-survivor-classification-v2",
        "profile": [4, 5, 6],
        "source_run": {"shards": 8, "workers": 8, "max_nodes_per_shard": 100000,
                       "status_counts": {"SAT": 5, "INDETERMINATE": 3}},
        "banked_five_row_cores": banked_five_row_cores,
        "cases": cases,
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
