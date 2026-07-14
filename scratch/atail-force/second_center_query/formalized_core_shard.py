#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Run one exact domain shard of the formalized-core second-center query.

The underlying DFS uses minimum-domain branching, so its first explored row is
not stable.  This driver instead partitions one named choice row before the
solver normalizes and filters its domains.  The stride slices are disjoint and
their union is the original candidate domain.  Consequently, all shards being
``UNSAT`` is equivalent to the unsharded fixed-placement query being ``UNSAT``
within the same finite shadow.  A node-capped shard remains indeterminate.

Formalized metric-core pruning is monotone under adding rows and is composed
with the query's original Q-C prefix predicate.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
sys.path.insert(0, str(ROOT))
sys.path.insert(0, str(HERE))

import query  # noqa: E402
from census.global_confinement import shadow  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    _formalized_metric_core,
)


SCHEMA = "p97-atail-pair-second-center-formalized-core-shard-v1"
ORIGINAL_SOLVER = shadow.solve_choice_rows


def _metric_rows(rows: Sequence[shadow.ClassRow]) -> tuple[MetricRow, ...]:
    return tuple(
        MetricRow(row.center, tuple(sorted(row.support)), row.exact)
        for row in rows
    )


def _choice_key(choice: shadow.RowChoice) -> tuple[int, tuple[int, ...]]:
    return choice.center, tuple(sorted(choice.support))


def _choice_record(choice: shadow.RowChoice) -> dict[str, object]:
    return {
        "center": choice.center,
        "support": sorted(choice.support),
    }


def _sha256_json(value: object) -> str:
    payload = json.dumps(
        value, separators=(",", ":"), sort_keys=True
    ).encode("utf-8")
    return hashlib.sha256(payload).hexdigest()


def solve_shard(
    seed: Mapping[str, object],
    *,
    shard_row: str,
    shard_index: int,
    shard_count: int,
    max_nodes: int,
    describe_only: bool = False,
    extended_production_cores: bool = False,
) -> dict[str, object]:
    """Run one stride slice of ``shard_row`` for one immutable seed."""

    detections: Counter[str] = Counter()
    partition: dict[str, object] = {}
    extended = None
    extended_problem = None
    if extended_production_cores:
        atail_dir = HERE.parent
        if str(atail_dir) not in sys.path:
            sys.path.insert(0, str(atail_dir))
        import common_system_metric_probe as extended  # type: ignore[no-redef]

        extended_problem = extended.build_problem(seed)

    def wrapped_solver(*args: Any, **kwargs: Any) -> dict[str, Any]:
        frame = args[0]
        original_prefix = kwargs.get("prefix_compatible")
        original_complete = kwargs.get("complete_compatible")
        order = shadow.hull_order(frame)
        choice_rows = tuple(kwargs["choice_rows"])

        matching = [index for index, row in enumerate(choice_rows) if row.name == shard_row]
        if len(matching) != 1:
            raise ValueError(
                f"expected exactly one choice row named {shard_row!r}; "
                f"found {len(matching)}"
            )
        row_index = matching[0]
        spec = choice_rows[row_index]
        normalized_choices = tuple(sorted(set(spec.choices), key=_choice_key))
        selected_indices = tuple(range(shard_index, len(normalized_choices), shard_count))
        selected_choices = tuple(normalized_choices[index] for index in selected_indices)
        all_records = [_choice_record(choice) for choice in normalized_choices]
        selected_records = [_choice_record(choice) for choice in selected_choices]
        partition.update(
            {
                "row": shard_row,
                "shard_index": shard_index,
                "shard_count": shard_count,
                "original_choice_count": len(normalized_choices),
                "selected_choice_count": len(selected_choices),
                "selected_index_rule": "range(shard_index, original_choice_count, shard_count)",
                "original_domain_sha256": _sha256_json(all_records),
                "selected_domain_sha256": _sha256_json(selected_records),
            }
        )

        if describe_only:
            return {"status": "UNSAT", "nodes": 0}

        sharded_rows = list(choice_rows)
        sharded_rows[row_index] = shadow.ChoiceRow(
            spec.name, selected_choices, exact=spec.exact
        )

        def prefix_compatible(rows: Sequence[shadow.ClassRow]) -> bool:
            if original_prefix is not None and not original_prefix(rows):
                return False
            detection = _formalized_metric_core(_metric_rows(rows), frame.n, order)
            if detection is not None:
                detections[str(detection["stage"])] += 1
                return False
            return True

        def complete_compatible(rows: Sequence[shadow.ClassRow]) -> bool:
            if original_complete is not None and not original_complete(rows):
                return False
            if extended is None:
                return True
            metric_rows = _metric_rows(rows)
            detection = extended.equilateral_hinge_collision_core(
                metric_rows, frame.n
            )
            if detection is None:
                detection = extended.nested_equal_chord_core(
                    metric_rows, frame.n, order
                )
            if detection is None:
                detection = extended.six_point_two_circle_order_core(
                    metric_rows, frame.n, order
                )
            if detection is None:
                detection = extended.six_point_two_circle_order_core(
                    metric_rows, frame.n, tuple(reversed(order))
                )
                if detection is not None:
                    detection = {
                        **detection,
                        "stage": detection["stage"] + "-reverse",
                    }
            if detection is None:
                detection = extended.four_point_two_circle_bisector_order_core(
                    metric_rows, frame.n, order
                )
            if detection is None:
                detection = extended.four_point_two_circle_bisector_order_core(
                    metric_rows, frame.n, tuple(reversed(order))
                )
                if detection is not None:
                    detection = {
                        **detection,
                        "stage": detection["stage"] + "-reverse",
                    }
            if detection is None:
                detection = extended.six_point_two_circle_arc_overtake_order_core(
                    metric_rows, frame.n, order
                )
            if detection is None:
                detection = extended.six_point_two_circle_arc_overtake_order_core(
                    metric_rows, frame.n, tuple(reversed(order))
                )
                if detection is not None:
                    detection = {
                        **detection,
                        "stage": detection["stage"] + "-reverse",
                    }
            if detection is not None:
                detections[str(detection["stage"])] += 1
                return False
            return True

        kwargs["choice_rows"] = tuple(sharded_rows)
        kwargs["max_nodes"] = max_nodes
        kwargs["prefix_compatible"] = prefix_compatible
        kwargs["complete_compatible"] = complete_compatible
        return ORIGINAL_SOLVER(*args, **kwargs)

    if query.shadow.solve_choice_rows is not ORIGINAL_SOLVER:
        raise RuntimeError("query solver was already monkey-patched")
    query.shadow.solve_choice_rows = wrapped_solver
    try:
        result = query.solve_seed(seed)
    finally:
        query.shadow.solve_choice_rows = ORIGINAL_SOLVER

    solver = dict(result["solver"])
    solver["max_nodes"] = max_nodes
    raw_status = solver["raw_status"]
    return {
        "schema": SCHEMA,
        "profile": list(seed["profile"]),
        "partition": partition,
        "scope": {
            "placements_per_profile": 1,
            "card_11_included": False,
            "formalized_metric_core_prefix_pruning": True,
            "extended_production_core_prefix_pruning": False,
            "extended_production_core_complete_leaf_pruning": (
                extended_production_cores
            ),
            "target_faithful": False,
            "producer_proved": False,
        },
        "solver": solver,
        "formalized_core_prefix_rejections": dict(sorted(detections.items())),
        "survivor": result if raw_status == "SAT" else None,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile-index", type=int, required=True, choices=(0, 1))
    parser.add_argument("--shard-row", default="supplied:q")
    parser.add_argument("--shard-index", type=int, default=0)
    parser.add_argument("--shard-count", type=int, default=1)
    parser.add_argument("--max-nodes", type=int, default=query.MAX_NODES)
    parser.add_argument("--describe-only", action="store_true")
    parser.add_argument(
        "--extended-production-cores",
        action="store_true",
        help="also prune the scratch-wired production core extensions",
    )
    args = parser.parse_args()
    if args.shard_count < 1:
        parser.error("--shard-count must be positive")
    if not 0 <= args.shard_index < args.shard_count:
        parser.error("--shard-index must satisfy 0 <= index < count")
    if args.max_nodes < 1:
        parser.error("--max-nodes must be positive")

    document = solve_shard(
        query.CASE_SEEDS[args.profile_index],
        shard_row=args.shard_row,
        shard_index=args.shard_index,
        shard_count=args.shard_count,
        max_nodes=args.max_nodes,
        describe_only=args.describe_only,
        extended_production_cores=args.extended_production_cores,
    )
    print(json.dumps(document, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
