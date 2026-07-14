#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Run exact second-center domain shards with a bounded worker pool."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from collections import Counter
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
SHARD_DRIVER = HERE / "formalized_core_shard.py"
SCHEMA = "p97-atail-pair-second-center-formalized-core-shards-v1"


def _canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def _compact_survivor(survivor: dict[str, Any]) -> dict[str, Any]:
    merged: dict[tuple[int, tuple[int, ...]], bool] = {}
    for record in survivor["rows"]:
        key = int(record["center"]), tuple(int(x) for x in record["support"])
        merged[key] = merged.get(key, False) or bool(record["exact"])
    rows = [
        {"center": center, "support": list(support), "exact": exact}
        for (center, support), exact in sorted(merged.items())
    ]
    return {
        "witness_sha256": survivor["witness_sha256"],
        "profile": survivor["profile"],
        "frame": {
            "n": survivor["frame"]["n"],
            "cyclic_order": survivor["frame"]["cyclic_order"],
        },
        "distinct_metric_rows": rows,
        "distinct_metric_rows_sha256": _canonical_sha256(rows),
    }


def _run_shard(
    *,
    profile_index: int,
    shard_index: int,
    shard_count: int,
    max_nodes: int,
    shard_row: str,
    extended_production_cores: bool = False,
) -> dict[str, Any]:
    command = (
        sys.executable,
        str(SHARD_DRIVER),
        "--profile-index",
        str(profile_index),
        "--shard-row",
        shard_row,
        "--shard-index",
        str(shard_index),
        "--shard-count",
        str(shard_count),
        "--max-nodes",
        str(max_nodes),
    )
    if extended_production_cores:
        command = (*command, "--extended-production-cores")
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


def run(
    *,
    profile_index: int,
    shard_count: int,
    workers: int,
    max_nodes: int,
    shard_row: str,
    full_survivors: bool,
    minimal_checkpoint: bool,
    extended_production_cores: bool = False,
) -> dict[str, Any]:
    cases: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=workers) as executor:
        futures = {
            executor.submit(
                _run_shard,
                profile_index=profile_index,
                shard_index=index,
                shard_count=shard_count,
                max_nodes=max_nodes,
                shard_row=shard_row,
                extended_production_cores=extended_production_cores,
            ): index
            for index in range(shard_count)
        }
        for future in as_completed(futures):
            result = future.result()
            cases.append(result)
            index = futures[future]
            if "error" in result:
                status = "ERROR"
                nodes = 0
            else:
                status = result["solver"]["raw_status"]
                nodes = result["solver"]["nodes"]
            print(
                f"shard {index + 1}/{shard_count}: {status} ({nodes} nodes)",
                file=sys.stderr,
                flush=True,
            )

    cases.sort(
        key=lambda case: int(
            case.get("partition", {}).get(
                "shard_index", case.get("shard_index", -1)
            )
        )
    )
    valid = [case for case in cases if "error" not in case]
    errors = [case for case in cases if "error" in case]
    statuses = Counter(case["solver"]["raw_status"] for case in valid)
    rejection_counts: Counter[str] = Counter()
    for case in valid:
        rejection_counts.update(case["formalized_core_prefix_rejections"])

    partition_ok = False
    original_choice_count: int | None = None
    original_domain_sha256: str | None = None
    if len(valid) == shard_count:
        counts = {
            int(case["partition"]["original_choice_count"])
            for case in valid
        }
        digests = {
            str(case["partition"]["original_domain_sha256"])
            for case in valid
        }
        if len(counts) == 1 and len(digests) == 1:
            original_choice_count = counts.pop()
            original_domain_sha256 = digests.pop()
            shard_indices = {
                int(case["partition"]["shard_index"])
                for case in valid
            }
            counts_ok = all(
                int(case["partition"]["shard_count"]) == shard_count
                and int(case["partition"]["selected_choice_count"])
                == len(
                    range(
                        int(case["partition"]["shard_index"]),
                        original_choice_count,
                        shard_count,
                    )
                )
                for case in valid
            )
            partition_ok = (
                shard_indices == set(range(shard_count)) and counts_ok
            )

    exhaustive_unsat = (
        partition_ok
        and not errors
        and statuses == Counter({"UNSAT": shard_count})
    )
    any_sat = bool(statuses["SAT"])
    if exhaustive_unsat:
        aggregate_status = "UNSAT_FIXED_PLACEMENT_FINITE_SHADOW"
    elif any_sat:
        aggregate_status = "SAT_FINITE_SHADOW_ONLY"
    else:
        aggregate_status = "INDETERMINATE"

    case_summaries = []
    for case in cases:
        if "error" in case:
            case_summaries.append(case)
            continue
        summary = {
            "partition": case["partition"],
            "solver": case["solver"],
            "formalized_core_prefix_rejections": case[
                "formalized_core_prefix_rejections"
            ],
        }
        if case["survivor"] is not None:
            summary["survivor"] = (
                case["survivor"]
                if full_survivors
                else _compact_survivor(case["survivor"])
            )
        if minimal_checkpoint:
            summary = {
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
                **(
                    {"survivor": summary["survivor"]}
                    if "survivor" in summary
                    else {}
                ),
            }
        case_summaries.append(summary)

    profile = valid[0]["profile"] if valid else None
    return {
        "schema": SCHEMA,
        "profile": profile,
        "aggregate_status": aggregate_status,
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
        "partition": {
            "row": shard_row,
            "shard_count": shard_count,
            "partition_verified": partition_ok,
            "original_choice_count": original_choice_count,
            "original_domain_sha256": original_domain_sha256,
        },
        "solver": {
            "workers": workers,
            "max_nodes_per_shard": max_nodes,
            "total_nodes": sum(case["solver"]["nodes"] for case in valid),
            "status_counts": dict(sorted(statuses.items())),
            "error_count": len(errors),
        },
        "formalized_core_prefix_rejections": dict(
            sorted(rejection_counts.items())
        ),
        "cases": case_summaries,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile-index", type=int, required=True, choices=(0, 1))
    parser.add_argument("--shards", type=int, default=23)
    parser.add_argument("--workers", type=int, default=23)
    parser.add_argument("--max-nodes", type=int, default=100_000)
    parser.add_argument("--shard-row", default="supplied:q")
    parser.add_argument("--full-survivors", action="store_true")
    parser.add_argument("--minimal-checkpoint", action="store_true")
    parser.add_argument("--compact-json", action="store_true")
    parser.add_argument("--extended-production-cores", action="store_true")
    args = parser.parse_args()
    if args.shards < 1:
        parser.error("--shards must be positive")
    if not 1 <= args.workers <= 24:
        parser.error("--workers must be between 1 and 24")
    if args.max_nodes < 1:
        parser.error("--max-nodes must be positive")

    result = run(
        profile_index=args.profile_index,
        shard_count=args.shards,
        workers=min(args.workers, args.shards),
        max_nodes=args.max_nodes,
        shard_row=args.shard_row,
        full_survivors=args.full_survivors,
        minimal_checkpoint=args.minimal_checkpoint,
        extended_production_cores=args.extended_production_cores,
    )
    print(
        json.dumps(
            result,
            indent=None if args.compact_json else 2,
            separators=(",", ":") if args.compact_json else None,
            sort_keys=True,
        )
    )
    return 0 if result["solver"]["error_count"] == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
