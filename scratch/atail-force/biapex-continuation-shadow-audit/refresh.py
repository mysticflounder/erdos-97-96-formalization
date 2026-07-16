#!/usr/bin/env python3
"""Incrementally refresh the 23 fixed card-12 shards with proved cap bounds.

A saved SAT survivor that passes the new monotone predicate remains the first
survivor of its shard.  Only shards whose saved survivor violates a new bound
are rerun.  The result remains evidence about one fixed finite-incidence
placement; it is not a Euclidean realization or a live producer proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from collections import Counter
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from types import SimpleNamespace
from typing import Any, Mapping


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ATAIL = HERE.parent
SOURCE_LANE = ATAIL / "second_center_query"
for path in (ROOT, ATAIL, SOURCE_LANE, HERE):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import cap_bound_core  # noqa: E402
import query as source_query  # noqa: E402,F401
import run_formalized_core_shards as source_runner  # noqa: E402
import common_system_metric_probe as extended_bank  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    _formalized_metric_core,
)


SCHEMA = "p97-atail-selected-row-own-cap-bound-refresh-v1"
PROFILE = (5, 5, 5)
SOURCE_CHECKPOINT = (
    SOURCE_LANE / "formalized_core_shards_after_current_bank_checkpoint.json"
)
EXPECTED_SOURCE_SHA256 = (
    "5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a"
)
DEFAULT_OUTPUT = HERE / "selected_row_own_cap_bound_refresh_checkpoint.json"
SHARD_DRIVER = HERE / "cap_bound_shard.py"

PINNED_INPUTS = (
    SOURCE_LANE / "query.py",
    SOURCE_LANE / "formalized_core_shard.py",
    ROOT / "census/multi_center/multi_center_census.py",
    ROOT / "census/global_confinement/shadow.py",
    ROOT / "census/global_confinement/metric_realizability_probe.py",
    ATAIL / "common_system_metric_probe.py",
    ROOT / "lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean",
    ROOT / "lean/Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean",
    HERE / "cap_bound_core.py",
    SHARD_DRIVER,
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def relative(path: Path) -> str:
    return str(path.relative_to(ROOT))


def input_digests() -> dict[str, str]:
    return {relative(path): sha256(path) for path in PINNED_INPUTS}


def survivor_rows(case: Mapping[str, Any]) -> tuple[SimpleNamespace, ...]:
    survivor = case.get("survivor")
    if survivor is None:
        return ()
    return tuple(
        SimpleNamespace(
            center=int(row["center"]),
            support=tuple(int(point) for point in row["support"]),
        )
        for row in survivor["distinct_metric_rows"]
    )


def survivor_metric_rows(case: Mapping[str, Any]) -> tuple[MetricRow, ...]:
    survivor = case.get("survivor")
    if survivor is None:
        return ()
    return tuple(
        MetricRow(
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            bool(row["exact"]),
        )
        for row in survivor["distinct_metric_rows"]
    )


def current_extended_bank_detection(
    rows: tuple[MetricRow, ...],
    n: int,
    order: tuple[int, ...],
) -> dict[str, Any] | None:
    """Replay the complete-leaf bank in the current shard driver."""

    detection = extended_bank.equilateral_hinge_collision_core(rows, n)
    if detection is None:
        detection = extended_bank.nested_equal_chord_core(rows, n, order)
    if detection is None:
        detection = extended_bank.six_point_two_circle_order_core(rows, n, order)
    if detection is None:
        detection = extended_bank.six_point_two_circle_order_core(
            rows, n, tuple(reversed(order))
        )
        if detection is not None:
            detection = {**detection, "stage": detection["stage"] + "-reverse"}
    if detection is None:
        detection = extended_bank.four_point_two_circle_bisector_order_core(
            rows, n, order
        )
    if detection is None:
        detection = extended_bank.four_point_two_circle_bisector_order_core(
            rows, n, tuple(reversed(order))
        )
        if detection is not None:
            detection = {**detection, "stage": detection["stage"] + "-reverse"}
    if detection is None:
        detection = extended_bank.six_point_two_circle_arc_overtake_order_core(
            rows, n, order
        )
    if detection is None:
        detection = extended_bank.six_point_two_circle_arc_overtake_order_core(
            rows, n, tuple(reversed(order))
        )
        if detection is not None:
            detection = {**detection, "stage": detection["stage"] + "-reverse"}
    return detection


def survivor_detections(case: Mapping[str, Any]) -> list[dict[str, object]]:
    survivor = case.get("survivor")
    if survivor is None:
        return []
    metric_rows = survivor_metric_rows(case)
    n = int(survivor["frame"]["n"])
    order = tuple(int(point) for point in survivor["frame"]["cyclic_order"])
    detections: list[dict[str, object]] = []
    formalized = _formalized_metric_core(metric_rows, n, order)
    if formalized is not None:
        detections.append(
            {**formalized, "freshness_layer": "current-formalized-metric-core"}
        )
    extended = current_extended_bank_detection(metric_rows, n, order)
    if extended is not None:
        detections.append(
            {**extended, "freshness_layer": "current-complete-leaf-bank"}
        )
    rows = survivor_rows(case)
    if not rows:
        return []
    detections.extend(
        {
            **detection,
            "freshness_layer": "selected-row-own-cap-bounds",
        }
        for detection in cap_bound_core.all_selected_row_own_cap_detections(
            rows, PROFILE
        )
    )
    return detections


def survivor_detection(case: Mapping[str, Any]) -> dict[str, object] | None:
    detections = survivor_detections(case)
    return detections[0] if detections else None


def minimal_case(case: Mapping[str, Any]) -> dict[str, Any]:
    result: dict[str, Any] = {
        "partition": {
            "shard_index": case["partition"]["shard_index"],
            "shard_count": case["partition"]["shard_count"],
            "selected_choice_count": case["partition"][
                "selected_choice_count"
            ],
            "selected_domain_sha256": case["partition"][
                "selected_domain_sha256"
            ],
        },
        "solver": case["solver"],
    }
    if case.get("survivor") is not None:
        result["survivor"] = source_runner._compact_survivor(case["survivor"])
    return result


def run_shard(
    *,
    shard_index: int,
    shard_count: int,
    max_nodes: int,
    shard_row: str,
) -> dict[str, Any]:
    command = (
        sys.executable,
        str(SHARD_DRIVER),
        "--shard-row",
        shard_row,
        "--shard-index",
        str(shard_index),
        "--shard-count",
        str(shard_count),
        "--max-nodes",
        str(max_nodes),
    )
    completed = subprocess.run(
        command,
        check=False,
        capture_output=True,
        text=True,
    )
    if completed.returncode != 0:
        return {
            "shard_index": shard_index,
            "error": {
                "returncode": completed.returncode,
                "stderr": completed.stderr[-4000:],
                "stdout": completed.stdout[-4000:],
            },
        }
    try:
        return json.loads(completed.stdout)
    except json.JSONDecodeError as error:
        return {
            "shard_index": shard_index,
            "error": {
                "json_error": str(error),
                "stderr": completed.stderr[-4000:],
                "stdout": completed.stdout[-4000:],
            },
        }


def validate_source(checkpoint: Mapping[str, Any], digest: str) -> None:
    if digest != EXPECTED_SOURCE_SHA256:
        raise ValueError(
            "source checkpoint digest drift: "
            f"expected {EXPECTED_SOURCE_SHA256}, got {digest}"
        )
    if tuple(checkpoint["profile"]) != PROFILE:
        raise ValueError("source checkpoint is not the (5,5,5) profile")
    partition = checkpoint["partition"]
    if (
        int(partition["shard_count"]) != 23
        or not bool(partition["partition_verified"])
        or str(partition["row"]) != "supplied:q"
    ):
        raise ValueError("source checkpoint partition is not the pinned 23-shard split")
    indices = {
        int(case["partition"]["shard_index"])
        for case in checkpoint["cases"]
    }
    if indices != set(range(23)):
        raise ValueError("source checkpoint does not contain every shard")


def stale_summary(checkpoint: Mapping[str, Any]) -> dict[str, object]:
    stale: dict[int, list[dict[str, object]]] = {}
    for case in checkpoint["cases"]:
        detections = survivor_detections(case)
        if detections:
            stale[int(case["partition"]["shard_index"])] = detections
    counts = Counter(
        str(detection["stage"])
        for detections in stale.values()
        for detection in detections
    )
    layer_counts = Counter(
        str(detection["freshness_layer"])
        for detections in stale.values()
        for detection in detections
    )
    return {
        "stale_shard_count": len(stale),
        "stale_shard_indices": sorted(stale),
        "violation_counts": dict(sorted(counts.items())),
        "freshness_layer_detection_counts": dict(sorted(layer_counts.items())),
        "violation_count": sum(counts.values()),
    }


def refresh(
    checkpoint: Mapping[str, Any],
    *,
    source_digest: str,
    workers: int,
    max_nodes: int,
) -> dict[str, Any]:
    partition = checkpoint["partition"]
    shard_count = int(partition["shard_count"])
    shard_row = str(partition["row"])
    cases = {
        int(case["partition"]["shard_index"]): dict(case)
        for case in checkpoint["cases"]
    }
    stale = {
        index: survivor_detections(case)
        for index, case in cases.items()
        if survivor_detection(case) is not None
    }

    errors: list[dict[str, Any]] = []
    rerun_rejections: Counter[str] = Counter()
    with ThreadPoolExecutor(max_workers=min(workers, max(1, len(stale)))) as executor:
        futures = {
            executor.submit(
                run_shard,
                shard_index=index,
                shard_count=shard_count,
                max_nodes=max_nodes,
                shard_row=shard_row,
            ): index
            for index in stale
        }
        for future in as_completed(futures):
            index = futures[future]
            result = future.result()
            if "error" in result:
                errors.append(result)
                cases[index] = result
                status = "ERROR"
            else:
                cases[index] = minimal_case(result)
                rerun_rejections.update(
                    result["formalized_core_prefix_rejections"]
                )
                status = str(result["solver"]["raw_status"])
                if survivor_detection(cases[index]) is not None:
                    raise AssertionError(
                        f"rerun shard {index} still violates an own-cap bound"
                    )
            print(
                f"shard {index + 1}/{shard_count}: {status}",
                file=sys.stderr,
                flush=True,
            )

    ordered_cases = [cases[index] for index in range(shard_count)]
    valid = [case for case in ordered_cases if "error" not in case]
    statuses = Counter(str(case["solver"]["raw_status"]) for case in valid)
    if not errors and statuses == Counter({"UNSAT": shard_count}):
        aggregate_status = "UNSAT_FIXED_PLACEMENT_FINITE_SHADOW"
    elif statuses["SAT"]:
        aggregate_status = "SAT_FINITE_SHADOW_ONLY"
    else:
        aggregate_status = "INDETERMINATE"

    rerun_indices = sorted(stale)
    reused_indices = sorted(set(cases) - set(stale))
    stale_counts = Counter(
        str(detection["stage"])
        for detections in stale.values()
        for detection in detections
    )
    stale_layer_counts = Counter(
        str(detection["freshness_layer"])
        for detections in stale.values()
        for detection in detections
    )
    return {
        "schema": SCHEMA,
        "source_checkpoint_schema": checkpoint["schema"],
        "source_checkpoint": relative(SOURCE_CHECKPOINT),
        "source_checkpoint_sha256": source_digest,
        "input_file_sha256": input_digests(),
        "profile": list(PROFILE),
        "aggregate_status": aggregate_status,
        "scope": {
            "placements_per_profile": 1,
            "card_11_included": False,
            "fixed_finite_incidence_shadow_only": True,
            "formalized_metric_core_prefix_pruning": True,
            "current_complete_leaf_bank_pruning": True,
            "selected_row_own_cap_bounds_prefix_pruning": True,
            "selected_row_own_cap_bounds_proved": True,
            "monotone_clean_survivor_reuse": True,
            "euclidean_realizability_checked": False,
            "target_faithful": False,
            "producer_proved": False,
        },
        "selected_row_own_cap_bound_provenance": (
            cap_bound_core.THEOREM_PROVENANCE
        ),
        "partition": partition,
        "refresh": {
            "reused_shard_count": len(reused_indices),
            "reused_shard_indices": reused_indices,
            "rerun_shard_count": len(rerun_indices),
            "rerun_shard_indices": rerun_indices,
            "source_violation_count": sum(stale_counts.values()),
            "source_violation_counts": dict(sorted(stale_counts.items())),
            "source_freshness_layer_detection_counts": dict(
                sorted(stale_layer_counts.items())
            ),
            "all_source_survivors_scanned_against_current_banks": True,
        },
        "solver": {
            "workers": min(workers, max(1, len(stale))),
            "max_nodes_per_rerun_shard": max_nodes,
            "status_counts": dict(sorted(statuses.items())),
            "error_count": len(errors),
            "stored_total_nodes": sum(
                int(case["solver"]["nodes"]) for case in valid
            ),
            "node_count_mixes_reused_and_rerun_slices": bool(reused_indices),
            "rerun_total_nodes": sum(
                int(cases[index]["solver"]["nodes"])
                for index in rerun_indices
                if "error" not in cases[index]
            ),
        },
        "formalized_core_prefix_rejections_in_rerun_slices": dict(
            sorted(rerun_rejections.items())
        ),
        "cases": ordered_cases,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=SOURCE_CHECKPOINT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument("--max-nodes", type=int, default=100_000)
    parser.add_argument(
        "--describe-stale",
        action="store_true",
        help="validate the source and print the stale-shard split without solving",
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        parser.error("--workers must be between 1 and 24")
    if args.max_nodes < 1:
        parser.error("--max-nodes must be positive")

    raw = args.source.read_bytes()
    digest = hashlib.sha256(raw).hexdigest()
    checkpoint = json.loads(raw)
    validate_source(checkpoint, digest)
    if args.describe_stale:
        print(
            json.dumps(
                {
                    "source_checkpoint": relative(args.source),
                    "source_checkpoint_sha256": digest,
                    **stale_summary(checkpoint),
                },
                indent=2,
                sort_keys=True,
            )
        )
        return 0

    result = refresh(
        checkpoint,
        source_digest=digest,
        workers=args.workers,
        max_nodes=args.max_nodes,
    )
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered)
    temporary.replace(args.output)
    print(f"wrote {args.output}", file=sys.stderr)
    return 0 if result["solver"]["error_count"] == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
