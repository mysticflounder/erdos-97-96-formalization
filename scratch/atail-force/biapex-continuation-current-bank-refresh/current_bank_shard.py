#!/usr/bin/env python3
"""Run one fixed-domain shard with the synchronized producer-bank leaf gate."""

from __future__ import annotations

import argparse
import json
import sys
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ATAIL = HERE.parent
SOURCE_LANE = ATAIL / "second_center_query"
for path in (ROOT, ATAIL, SOURCE_LANE, HERE):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import cap_bound_core  # noqa: E402
import formalized_core_shard as source_shard  # noqa: E402
import common_system_metric_probe as common_bank  # noqa: E402
from census.atail_force import producer_bank  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402


SCHEMA = "p97-atail-biapex-current-producer-bank-shard-v1"
PROFILE_INDEX = 1
PROFILE = (5, 5, 5)
ORDER = tuple(source_shard.shadow.hull_order(mc.build_frame(PROFILE)))
ORIGINAL_FORMALIZED_CORE = source_shard._formalized_metric_core
ORIGINAL_EQUILATERAL_HINGE = common_bank.equilateral_hinge_collision_core


def solve(
    *,
    shard_index: int,
    shard_count: int,
    max_nodes: int,
    shard_row: str,
) -> dict[str, object]:
    """Solve one slice; every complete leaf is checked by the live bank."""

    hard_leaf_calls = 0
    current_bank_matches: Counter[str] = Counter()
    current_bank_all_matches: Counter[str] = Counter()
    legacy_hinge_matches: Counter[str] = Counter()
    cap_leaf_matches: Counter[str] = Counter()

    def prefix_gate(rows, n: int, order: tuple[int, ...]):
        detection = ORIGINAL_FORMALIZED_CORE(rows, n, order)
        if detection is not None:
            return detection
        return cap_bound_core.selected_row_own_cap_detection(rows, PROFILE)

    def complete_leaf_gate(rows, n: int):
        nonlocal hard_leaf_calls
        hard_leaf_calls += 1
        matches = producer_bank.scan_all_formalized_cores(rows, n, ORDER)
        if matches:
            current_bank_matches[str(matches[0]["stage"])] += 1
            current_bank_all_matches.update(
                str(record["stage"]) for record in matches
            )
            return dict(matches[0])
        detection = ORIGINAL_EQUILATERAL_HINGE(rows, n)
        if detection is not None:
            legacy_hinge_matches[str(detection["stage"])] += 1
            return detection
        detection = cap_bound_core.selected_row_own_cap_detection(rows, PROFILE)
        if detection is not None:
            cap_leaf_matches[str(detection["stage"])] += 1
        return detection

    if source_shard._formalized_metric_core is not ORIGINAL_FORMALIZED_CORE:
        raise RuntimeError("source shard metric gate was already monkey-patched")
    if common_bank.equilateral_hinge_collision_core is not ORIGINAL_EQUILATERAL_HINGE:
        raise RuntimeError("common-system leaf gate was already monkey-patched")

    source_shard._formalized_metric_core = prefix_gate
    common_bank.equilateral_hinge_collision_core = complete_leaf_gate
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
        common_bank.equilateral_hinge_collision_core = ORIGINAL_EQUILATERAL_HINGE

    result["schema"] = SCHEMA
    result["scope"] = {
        **result["scope"],
        "current_producer_bank_complete_leaf_pruning": True,
        "producer_bank_entrypoint": (
            "census.atail_force.producer_bank.scan_all_formalized_cores"
        ),
        "selected_row_own_cap_bounds_prefix_pruning": True,
        "selected_row_own_cap_bounds_complete_leaf_recheck": True,
        "selected_row_own_cap_bounds_proved": True,
        "legacy_equilateral_hinge_complete_leaf_recheck": True,
    }
    result["selected_row_own_cap_bound_provenance"] = (
        cap_bound_core.THEOREM_PROVENANCE
    )
    result["hard_leaf_gate"] = {
        "calls": hard_leaf_calls,
        "current_bank_first_match_rejections": dict(
            sorted(current_bank_matches.items())
        ),
        "current_bank_all_matches_seen": dict(
            sorted(current_bank_all_matches.items())
        ),
        "legacy_equilateral_hinge_rejections": dict(
            sorted(legacy_hinge_matches.items())
        ),
        "cap_bound_rejections": dict(sorted(cap_leaf_matches.items())),
    }
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
