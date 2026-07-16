#!/usr/bin/env python3
"""Rerun all 23 fixed card-12 shards against the live producer bank.

No saved survivor is reused.  The older cap-bound checkpoint is an immutable
comparison source only; every domain slice is solved again with the broader
``producer_bank.scan_all_formalized_cores`` complete-leaf gate.
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
OLD_CAP_LANE = ATAIL / "biapex-continuation-shadow-audit"
for path in (ROOT, ATAIL, SOURCE_LANE, HERE):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import cap_bound_core  # noqa: E402
import query as source_query  # noqa: E402,F401
import common_system_metric_probe as common_bank  # noqa: E402
import run_formalized_core_shards as source_runner  # noqa: E402
from census.atail_force import producer_bank  # noqa: E402


SCHEMA = "p97-atail-biapex-current-producer-bank-refresh-v1"
PROFILE = (5, 5, 5)
SOURCE_CHECKPOINT = (
    OLD_CAP_LANE / "selected_row_own_cap_bound_refresh_1m_retry_checkpoint.json"
)
EXPECTED_SOURCE_SHA256 = (
    "ad2400da59782d38d0952a9c31ae448bd30f86a110239bcca4687b538bc09fe9"
)
EXPECTED_SOURCE_SAT_INDICES = (0, 1, 2, 3, 10, 12, 13, 15, 16, 20, 21)
EXPECTED_SOURCE_DIRTY_INDICES = (10, 12, 13, 15, 21)
EXPECTED_SOURCE_CLEAN_INDICES = (0, 1, 2, 3, 16, 20)
DEFAULT_OUTPUT = HERE / "current_producer_bank_refresh_100k_checkpoint.json"
SHARD_DRIVER = HERE / "current_bank_shard.py"

PINNED_INPUTS = (
    SOURCE_LANE / "query.py",
    SOURCE_LANE / "validator.py",
    SOURCE_LANE / "formalized_core_shard.py",
    SOURCE_LANE / "run_formalized_core_shards.py",
    ROOT / "census/atail_force/producer_bank.py",
    ROOT / "census/multi_center/multi_center_census.py",
    ROOT / "census/global_confinement/shadow.py",
    ROOT / "census/global_confinement/metric_realizability_probe.py",
    ATAIL / "common_system_metric_probe.py",
    ATAIL / "second_center_metric_cegar/cegar.py",
    ATAIL / "second_center_metric_oracle/oracle.py",
    ROOT / "lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean",
    ROOT / "lean/Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean",
    HERE / "cap_bound_core.py",
    SHARD_DRIVER,
    Path(__file__).resolve(),
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def relative(path: Path) -> str:
    return str(path.resolve().relative_to(ROOT))


def input_digests() -> dict[str, str]:
    return {relative(path): sha256(path) for path in PINNED_INPUTS}


def survivor_metric_rows(case: Mapping[str, Any]) -> tuple[producer_bank.MetricRow, ...]:
    survivor = case.get("survivor")
    if survivor is None:
        return ()
    return tuple(
        producer_bank.MetricRow(
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            bool(row["exact"]),
        )
        for row in survivor["distinct_metric_rows"]
    )


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


def survivor_detections(case: Mapping[str, Any]) -> list[dict[str, object]]:
    """Replay every current hard-leaf gate on one stored SAT survivor."""

    survivor = case.get("survivor")
    if survivor is None:
        return []
    rows = survivor_metric_rows(case)
    n = int(survivor["frame"]["n"])
    order = tuple(int(point) for point in survivor["frame"]["cyclic_order"])
    detections = [
        {**dict(record), "freshness_layer": "current-producer-bank"}
        for record in producer_bank.scan_all_formalized_cores(rows, n, order)
    ]
    hinge = common_bank.equilateral_hinge_collision_core(rows, n)
    if hinge is not None:
        detections.append(
            {**hinge, "freshness_layer": "legacy-equilateral-hinge-gate"}
        )
    detections.extend(
        {
            **detection,
            "freshness_layer": "selected-row-own-cap-bounds",
        }
        for detection in cap_bound_core.all_selected_row_own_cap_detections(
            survivor_rows(case), PROFILE
        )
    )
    return detections


def validate_source(checkpoint: Mapping[str, Any], digest: str) -> None:
    if digest != EXPECTED_SOURCE_SHA256:
        raise ValueError(
            f"source checkpoint drift: expected {EXPECTED_SOURCE_SHA256}, got {digest}"
        )
    if checkpoint["schema"] != "p97-atail-selected-row-own-cap-bound-refresh-v1":
        raise ValueError("unexpected source schema")
    if tuple(checkpoint["profile"]) != PROFILE:
        raise ValueError("source checkpoint is not the fixed (5,5,5) profile")
    partition = checkpoint["partition"]
    if (
        int(partition["shard_count"]) != 23
        or not bool(partition["partition_verified"])
        or str(partition["row"]) != "supplied:q"
    ):
        raise ValueError("source checkpoint is not the pinned 23-shard partition")
    cases = checkpoint["cases"]
    indices = tuple(int(case["partition"]["shard_index"]) for case in cases)
    if indices != tuple(range(23)):
        raise ValueError("source cases are not the complete ordered shard partition")
    sat_indices = tuple(
        int(case["partition"]["shard_index"])
        for case in cases
        if case.get("survivor") is not None
    )
    if sat_indices != EXPECTED_SOURCE_SAT_INDICES:
        raise ValueError(f"source SAT split drift: {sat_indices}")


def source_gate_smoke(checkpoint: Mapping[str, Any]) -> dict[str, object]:
    records: list[dict[str, object]] = []
    for case in checkpoint["cases"]:
        if case.get("survivor") is None:
            continue
        index = int(case["partition"]["shard_index"])
        detections = survivor_detections(case)
        records.append(
            {
                "shard_index": index,
                "accepted_by_all_current_gates": not detections,
                "detections": detections,
            }
        )
    dirty = tuple(
        int(record["shard_index"])
        for record in records
        if not bool(record["accepted_by_all_current_gates"])
    )
    clean = tuple(
        int(record["shard_index"])
        for record in records
        if bool(record["accepted_by_all_current_gates"])
    )
    if dirty != EXPECTED_SOURCE_DIRTY_INDICES:
        raise AssertionError(f"current-bank dirty-shard smoke drift: {dirty}")
    if clean != EXPECTED_SOURCE_CLEAN_INDICES:
        raise AssertionError(f"current-bank clean-shard smoke drift: {clean}")
    return {
        "status": "PASS",
        "source_sat_indices": list(EXPECTED_SOURCE_SAT_INDICES),
        "current_gate_rejected_indices": list(dirty),
        "current_gate_accepted_indices": list(clean),
        "records": records,
    }


def run_shard(
    *, shard_index: int, shard_count: int, max_nodes: int, shard_row: str
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
    completed = subprocess.run(command, check=False, capture_output=True, text=True)
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


def minimal_case(case: Mapping[str, Any]) -> dict[str, Any]:
    result: dict[str, Any] = {
        "partition": case["partition"],
        "solver": case["solver"],
        "hard_leaf_gate": case["hard_leaf_gate"],
        "formalized_core_prefix_rejections": case[
            "formalized_core_prefix_rejections"
        ],
    }
    if case.get("survivor") is not None:
        result["survivor"] = source_runner._compact_survivor(case["survivor"])
    return result


def refresh(
    checkpoint: Mapping[str, Any],
    *, source_digest: str,
    workers: int,
    max_nodes: int,
) -> dict[str, Any]:
    partition = checkpoint["partition"]
    shard_count = int(partition["shard_count"])
    shard_row = str(partition["row"])
    smoke = source_gate_smoke(checkpoint)
    cases: dict[int, dict[str, Any]] = {}
    errors: list[dict[str, Any]] = []
    prefix_rejections: Counter[str] = Counter()
    leaf_first_rejections: Counter[str] = Counter()
    leaf_all_matches: Counter[str] = Counter()
    leaf_hinge_rejections: Counter[str] = Counter()
    leaf_cap_rejections: Counter[str] = Counter()

    with ThreadPoolExecutor(max_workers=workers) as executor:
        futures = {
            executor.submit(
                run_shard,
                shard_index=index,
                shard_count=shard_count,
                max_nodes=max_nodes,
                shard_row=shard_row,
            ): index
            for index in range(shard_count)
        }
        for future in as_completed(futures):
            index = futures[future]
            result = future.result()
            if "error" in result:
                errors.append(result)
                cases[index] = result
                status = "ERROR"
                nodes = 0
            else:
                case = minimal_case(result)
                detections = survivor_detections(case)
                if detections:
                    raise AssertionError(
                        f"fresh shard {index} returned a gate-dirty survivor: {detections}"
                    )
                cases[index] = case
                status = str(case["solver"]["raw_status"])
                nodes = int(case["solver"]["nodes"])
                prefix_rejections.update(case["formalized_core_prefix_rejections"])
                gate = case["hard_leaf_gate"]
                leaf_first_rejections.update(gate["current_bank_first_match_rejections"])
                leaf_all_matches.update(gate["current_bank_all_matches_seen"])
                leaf_hinge_rejections.update(gate["legacy_equilateral_hinge_rejections"])
                leaf_cap_rejections.update(gate["cap_bound_rejections"])
            print(
                f"shard {index + 1}/{shard_count}: {status} ({nodes} nodes)",
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

    return {
        "schema": SCHEMA,
        "source_checkpoint": relative(SOURCE_CHECKPOINT),
        "source_checkpoint_sha256": source_digest,
        "input_file_sha256": input_digests(),
        "profile": list(PROFILE),
        "aggregate_status": aggregate_status,
        "scope": {
            "placements_per_profile": 1,
            "card_11_included": False,
            "fixed_finite_incidence_shadow_only": True,
            "all_23_domain_shards_rerun": True,
            "saved_survivors_reused": False,
            "current_producer_bank_complete_leaf_pruning": True,
            "selected_row_own_cap_bounds_prefix_pruning": True,
            "selected_row_own_cap_bounds_proved": True,
            "euclidean_realizability_checked": False,
            "target_faithful": False,
            "producer_proved": False,
        },
        "selected_row_own_cap_bound_provenance": cap_bound_core.THEOREM_PROVENANCE,
        "partition": partition,
        "source_gate_smoke": smoke,
        "refresh": {
            "reused_shard_count": 0,
            "reused_shard_indices": [],
            "rerun_shard_count": shard_count,
            "rerun_shard_indices": list(range(shard_count)),
            "every_fresh_sat_survivor_replayed_against_all_current_gates": True,
        },
        "solver": {
            "workers": workers,
            "max_nodes_per_shard": max_nodes,
            "status_counts": dict(sorted(statuses.items())),
            "error_count": len(errors),
            "total_nodes": sum(int(case["solver"]["nodes"]) for case in valid),
        },
        "gate_rejections": {
            "prefix_or_complete_stage_counts": dict(sorted(prefix_rejections.items())),
            "current_bank_first_match_leaf_counts": dict(
                sorted(leaf_first_rejections.items())
            ),
            "current_bank_all_match_leaf_counts": dict(sorted(leaf_all_matches.items())),
            "legacy_equilateral_hinge_leaf_counts": dict(
                sorted(leaf_hinge_rejections.items())
            ),
            "cap_bound_leaf_counts": dict(sorted(leaf_cap_rejections.items())),
            "hard_leaf_call_count": sum(
                int(case["hard_leaf_gate"]["calls"]) for case in valid
            ),
        },
        "cases": ordered_cases,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=SOURCE_CHECKPOINT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument("--max-nodes", type=int, default=100_000)
    parser.add_argument(
        "--smoke-source",
        action="store_true",
        help="check the known current-bank dirty/clean split without solving",
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
    if args.smoke_source:
        print(json.dumps(source_gate_smoke(checkpoint), indent=2, sort_keys=True))
        return 0
    result = refresh(
        checkpoint,
        source_digest=digest,
        workers=min(args.workers, 23),
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
