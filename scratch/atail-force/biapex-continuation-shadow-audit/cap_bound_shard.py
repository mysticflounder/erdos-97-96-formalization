#!/usr/bin/env python3
"""Run one formalized-core shard with selected-row own-cap bounds added."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_LANE = HERE.parent / "second_center_query"
for path in (ROOT, SOURCE_LANE, HERE):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import cap_bound_core  # noqa: E402
import formalized_core_shard as source_shard  # noqa: E402


SCHEMA = "p97-atail-selected-row-own-cap-bound-shard-v1"
PROFILE_INDEX = 1
PROFILE = (5, 5, 5)
ORIGINAL_FORMALIZED_CORE = source_shard._formalized_metric_core


def combined_core(rows, n: int, order: tuple[int, ...]):
    detection = ORIGINAL_FORMALIZED_CORE(rows, n, order)
    if detection is not None:
        return detection
    return cap_bound_core.selected_row_own_cap_detection(rows, PROFILE)


def solve(
    *,
    shard_index: int,
    shard_count: int,
    max_nodes: int,
    shard_row: str,
) -> dict[str, object]:
    if source_shard._formalized_metric_core is not ORIGINAL_FORMALIZED_CORE:
        raise RuntimeError("source shard formalized core was already monkey-patched")
    source_shard._formalized_metric_core = combined_core
    try:
        result = source_shard.solve_shard(
            source_shard.query.CASE_SEEDS[PROFILE_INDEX],
            shard_row=shard_row,
            shard_index=shard_index,
            shard_count=shard_count,
            max_nodes=max_nodes,
            extended_production_cores=True,
        )
    finally:
        source_shard._formalized_metric_core = ORIGINAL_FORMALIZED_CORE

    result["schema"] = SCHEMA
    result["scope"] = {
        **result["scope"],
        "selected_row_own_cap_bounds_prefix_pruning": True,
        "selected_row_own_cap_bounds_proved": True,
    }
    result["selected_row_own_cap_bound_provenance"] = (
        cap_bound_core.THEOREM_PROVENANCE
    )
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--shard-row", default="supplied:q")
    parser.add_argument("--shard-index", type=int, default=0)
    parser.add_argument("--shard-count", type=int, default=23)
    parser.add_argument("--max-nodes", type=int, default=100_000)
    args = parser.parse_args()
    if args.shard_count < 1:
        parser.error("--shard-count must be positive")
    if not 0 <= args.shard_index < args.shard_count:
        parser.error("--shard-index must satisfy 0 <= index < count")
    if args.max_nodes < 1:
        parser.error("--max-nodes must be positive")
    print(
        json.dumps(
            solve(
                shard_index=args.shard_index,
                shard_count=args.shard_count,
                max_nodes=args.max_nodes,
                shard_row=args.shard_row,
            ),
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
