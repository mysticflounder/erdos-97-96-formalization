#!/usr/bin/env python3
"""Incrementally refresh a sharded checkpoint after adding monotone cores.

If a saved first survivor contains no newly recognized formalized core, it is
still the first survivor under the stronger monotone prefix predicate: the new
predicate can only remove branches that preceded it.  Consequently only the
slices whose saved survivor is now rejected need to be rerun.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any, Mapping


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
for path in (str(ROOT), str(HERE)):
    if path not in sys.path:
        sys.path.insert(0, path)

import query  # noqa: E402
import run_formalized_core_shards as shard_runner  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    _formalized_metric_core,
)


SCHEMA = "p97-atail-formalized-core-shards-incremental-refresh-v1"


def survivor_detection(case: Mapping[str, Any]) -> dict[str, Any] | None:
    survivor = case.get("survivor")
    if survivor is None:
        return None
    rows = tuple(
        MetricRow(
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            bool(row["exact"]),
        )
        for row in survivor["distinct_metric_rows"]
    )
    frame = survivor["frame"]
    return _formalized_metric_core(
        rows,
        int(frame["n"]),
        tuple(int(point) for point in frame["cyclic_order"]),
    )


def minimal_case(case: Mapping[str, Any]) -> dict[str, Any]:
    if "error" in case:
        return dict(case)
    result: dict[str, Any] = {
        "partition": {
            "shard_index": case["partition"]["shard_index"],
            "shard_count": case["partition"]["shard_count"],
            "selected_choice_count": case["partition"]["selected_choice_count"],
            "selected_domain_sha256": case["partition"]["selected_domain_sha256"],
        },
        "solver": case["solver"],
    }
    if case.get("survivor") is not None:
        result["survivor"] = shard_runner._compact_survivor(case["survivor"])
    return result


def refresh(
    checkpoint: Mapping[str, Any],
    *,
    profile_index: int,
    workers: int,
    max_nodes: int,
    source_path: Path,
    source_sha256: str,
    retry_indeterminate: bool = False,
) -> dict[str, Any]:
    expected_profile = list(query.CASE_SEEDS[profile_index]["profile"])
    if list(checkpoint["profile"]) != expected_profile:
        raise ValueError("profile index does not match the source checkpoint")
    partition = checkpoint["partition"]
    shard_count = int(partition["shard_count"])
    shard_row = str(partition["row"])
    cases = {
        int(case["partition"]["shard_index"]): dict(case)
        for case in checkpoint["cases"]
    }
    if set(cases) != set(range(shard_count)):
        raise ValueError("source checkpoint does not contain every shard")

    stale: dict[int, dict[str, Any] | None] = {}
    for shard_index, case in cases.items():
        detection = survivor_detection(case)
        if detection is not None:
            stale[shard_index] = detection
        elif (
            retry_indeterminate
            and str(case.get("solver", {}).get("raw_status"))
            == "INDETERMINATE"
        ):
            stale[shard_index] = None

    rerun_rejections: Counter[str] = Counter()
    errors: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=min(workers, max(1, len(stale)))) as executor:
        futures = {
            executor.submit(
                shard_runner._run_shard,
                profile_index=profile_index,
                shard_index=shard_index,
                shard_count=shard_count,
                max_nodes=max_nodes,
                shard_row=shard_row,
            ): shard_index
            for shard_index in stale
        }
        for future in as_completed(futures):
            shard_index = futures[future]
            result = future.result()
            if "error" in result:
                errors.append(result)
                cases[shard_index] = result
                status = "ERROR"
            else:
                cases[shard_index] = minimal_case(result)
                rerun_rejections.update(result["formalized_core_prefix_rejections"])
                status = str(result["solver"]["raw_status"])
                if survivor_detection(cases[shard_index]) is not None:
                    raise AssertionError(
                        f"rerun shard {shard_index} still contains a bank core"
                    )
            print(
                f"shard {shard_index + 1}/{shard_count}: {status}",
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
    return {
        "schema": SCHEMA,
        "source_checkpoint_schema": checkpoint["schema"],
        "source_checkpoint": str(source_path),
        "source_checkpoint_sha256": source_sha256,
        "profile": expected_profile,
        "aggregate_status": aggregate_status,
        "scope": {
            "placements_per_profile": 1,
            "card_11_included": False,
            "formalized_metric_core_prefix_pruning": True,
            "monotone_clean_survivor_reuse": True,
            "target_faithful": False,
            "producer_proved": False,
        },
        "partition": partition,
        "refresh": {
            "reused_shard_count": len(reused_indices),
            "reused_shard_indices": reused_indices,
            "rerun_shard_count": len(rerun_indices),
            "rerun_shard_indices": rerun_indices,
            "stale_detection_counts": dict(sorted(Counter(
                (
                    str(detection["stage"])
                    if detection is not None
                    else "indeterminate-retry"
                )
                for detection in stale.values()
            ).items())),
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
    parser.add_argument("checkpoint", type=Path)
    parser.add_argument("--profile-index", type=int, required=True, choices=(0, 1))
    parser.add_argument("--workers", type=int, default=24)
    parser.add_argument("--max-nodes", type=int, default=100_000)
    parser.add_argument(
        "--retry-indeterminate",
        action="store_true",
        help="rerun saved indeterminate shards even without a survivor core",
    )
    parser.add_argument("--compact-json", action="store_true")
    parser.add_argument(
        "--output",
        type=Path,
        help="atomically write the checkpoint here instead of stdout",
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        parser.error("--workers must be between 1 and 24")
    raw = args.checkpoint.read_bytes()
    checkpoint = json.loads(raw)
    result = refresh(
        checkpoint,
        profile_index=args.profile_index,
        workers=args.workers,
        max_nodes=args.max_nodes,
        source_path=args.checkpoint,
        source_sha256=hashlib.sha256(raw).hexdigest(),
        retry_indeterminate=args.retry_indeterminate,
    )
    rendered = json.dumps(
        result,
        indent=None if args.compact_json else 2,
        separators=(",", ":") if args.compact_json else None,
        sort_keys=True,
    )
    if args.output is None:
        print(rendered)
    else:
        temporary = args.output.with_suffix(args.output.suffix + ".tmp")
        temporary.write_text(rendered + "\n")
        temporary.replace(args.output)
        print(f"wrote {args.output}", file=sys.stderr)
    return 0 if result["solver"]["error_count"] == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
