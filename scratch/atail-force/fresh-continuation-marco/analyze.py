#!/usr/bin/env python3
"""Cluster fresh continuation MARCO row cores up to exact point relabeling."""

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
CHECKPOINT = HERE / "checkpoint.json"
FRONTIER_BANK = HERE / "frontier_checkpoint.json"
OUTPUT = HERE / "analysis_checkpoint.json"
CLUSTER_DIR = HERE.parent / "second_center_query"
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
for path in (ROOT, CLUSTER_DIR, ORACLE_DIR):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import cluster_formalized_core_shards as cluster  # noqa: E402
import oracle as _metric_oracle_import_preflight  # noqa: F401,E402
from census.atail_force import producer_bank  # noqa: E402
from census.global_confinement.metric_realizability_probe import MetricRow  # noqa: E402


Row = tuple[int, frozenset[int]]


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def decode_rows(records: Sequence[Mapping[str, object]]) -> tuple[Row, ...]:
    return tuple(
        sorted(
            (
                int(record["center"]),
                frozenset(int(point) for point in record["support"]),
            )
            for record in records
        )
    )


def metric_row(record: Mapping[str, object]) -> MetricRow:
    return MetricRow(
        int(record["center"]),
        tuple(int(point) for point in record["support"]),
        bool(record["exact"]),
    )


def metric_key(row: MetricRow) -> str:
    return f"c{row.center}:[" + ",".join(str(point) for point in row.support) + "]"


def cluster_instances(instances: Sequence[Mapping[str, object]]) -> list[dict[str, Any]]:
    classes: list[dict[str, Any]] = []
    for instance in instances:
        for record in classes:
            if cluster.isomorphic(instance["rows"], record["representative_rows"]):
                record["instances"].append(instance)
                break
        else:
            classes.append(
                {
                    "representative_rows": instance["rows"],
                    "instances": [instance],
                }
            )
    classes.sort(
        key=lambda record: (
            -len({item["shard_index"] for item in record["instances"]}),
            -len(record["instances"]),
            len(record["representative_rows"]),
            tuple(record["representative_rows"]),
        )
    )
    encoded = []
    for index, record in enumerate(classes):
        shards = sorted({item["shard_index"] for item in record["instances"]})
        encoded.append(
            {
                "class_index": index,
                "instance_count": len(record["instances"]),
                "distinct_shard_count": len(shards),
                "shard_indices": shards,
                "row_count": len(record["representative_rows"]),
                "used_point_count": len(cluster.points(record["representative_rows"])),
                "representative_rows": cluster.encode_rows(
                    record["representative_rows"]
                ),
                "instances": [
                    {
                        key: item[key]
                        for key in ("shard_index", "discovery_index")
                        if key in item
                    }
                    for item in record["instances"]
                ],
            }
        )
    return encoded


def build_document() -> dict[str, Any]:
    checkpoint = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    if checkpoint["schema"] != "p97-atail-fresh-continuation-marco-v1":
        raise RuntimeError("unexpected MARCO checkpoint schema")
    instances = []
    for case in checkpoint["cases"]:
        shard = int(case["shard_index"])
        for core in case["minimal_cores"]:
            if not core["msolve_pair_proposal_deletion_minimal"]:
                raise RuntimeError("checkpoint contains a non-minimal proposal core")
            rows = decode_rows(core["rows"])
            instances.append(
                {
                    "shard_index": shard,
                    "discovery_index": int(core["discovery_index"]),
                    "rows": rows,
                    "current_bank_match_count": int(
                        core["current_formalized_bank_match_count"]
                    ),
                    "immediate_k_a_consumer": bool(core["immediate_k_a_consumer"]),
                    "crosschecked_deletion_minimal": bool(
                        core["crosschecked_deletion_minimal"]
                    ),
                }
            )

    encoded_classes = cluster_instances(instances)

    frontier_bank = json.loads(FRONTIER_BANK.read_text(encoding="utf-8"))
    if frontier_bank["schema"] != "p97-atail-fresh-continuation-unit-frontier-bank-v1":
        raise RuntimeError("unexpected UNIT frontier bank schema")
    frontiers = []
    for record in frontier_bank["frontiers"]:
        frontiers.append(
            {
                "shard_index": int(record["shard_index"]),
                "rows": decode_rows(record["rows"]),
                "row_keys": list(record["row_keys"]),
                "row_count": int(record["row_count"]),
                "crosscheck_status": record["crosscheck"]["status"],
                "minimality_status": record["minimality_status"],
                "current_formalized_bank_matches": list(
                    record["current_formalized_bank_matches"]
                ),
                "current_formalized_bank_match_count": int(
                    record["current_formalized_bank_match_count"]
                ),
                "grid_center_coverage": [
                    {
                        **item,
                        "core_centers_inside_named_six": item[
                            "frontier_centers_inside_named_six"
                        ],
                    }
                    for item in record["grid_center_coverage"]
                ],
                "discovered_by": list(record["discovered_by"]),
            }
        )
    frontier_classes = cluster_instances(frontiers)
    smallest_by_shard = {}
    for frontier in frontiers:
        shard = frontier["shard_index"]
        current = smallest_by_shard.get(shard)
        if current is None or (frontier["row_count"], frontier["row_keys"]) < (
            current["row_count"], current["row_keys"]
        ):
            smallest_by_shard[shard] = frontier
    smallest_frontiers = [smallest_by_shard[key] for key in sorted(smallest_by_shard)]
    smallest_frontier_classes = cluster_instances(smallest_frontiers)
    encoded_frontiers = [
        {
            **{key: value for key, value in frontier.items() if key != "rows"},
            "rows": cluster.encode_rows(frontier["rows"]),
        }
        for frontier in frontiers
    ]

    row_counts = Counter(len(instance["rows"]) for instance in instances)
    repeated = [
        record
        for record in encoded_classes
        if record["distinct_shard_count"] >= 2
    ]
    return {
        "schema": "p97-atail-fresh-continuation-marco-analysis-v1",
        "source": {
            "checkpoint": str(CHECKPOINT.relative_to(ROOT)),
            "checkpoint_sha256": file_sha256(CHECKPOINT),
            "source_refresh_sha256": checkpoint["source"]["sha256"],
            "driver_sha256": checkpoint["driver_sha256"],
            "frontier_bank": str(FRONTIER_BANK.relative_to(ROOT)),
            "frontier_bank_sha256": file_sha256(FRONTIER_BANK),
        },
        "support_file_sha256": {
            str((CLUSTER_DIR / "cluster_formalized_core_shards.py").relative_to(ROOT)):
                file_sha256(CLUSTER_DIR / "cluster_formalized_core_shards.py"),
        },
        "summary": {
            "core_instance_count": len(instances),
            "normalized_shape_count": len(encoded_classes),
            "shapes_repeated_across_survivors": len(repeated),
            "repeated_shape_indices": [record["class_index"] for record in repeated],
            "row_count_histogram": {
                str(key): value for key, value in sorted(row_counts.items())
            },
            "current_formalized_bank_match_count": sum(
                instance["current_bank_match_count"] for instance in instances
            ),
            "immediate_k_a_consumer_count": sum(
                instance["immediate_k_a_consumer"] for instance in instances
            ),
            "all_returned_cores_crosschecked_deletion_minimal": (
                all(instance["crosschecked_deletion_minimal"] for instance in instances)
                if instances
                else None
            ),
            "crosschecked_deletion_minimal_core_count": sum(
                instance["crosschecked_deletion_minimal"] for instance in instances
            ),
            "all_returned_cores_msolve_pair_proposal_deletion_minimal": (
                True if instances else None
            ),
            "confirmed_UNIT_frontier_count": len(frontiers),
            "confirmed_UNIT_frontier_row_count_by_shard": {
                str(frontier["shard_index"]): frontier["row_count"]
                for frontier in smallest_frontiers
            },
            "confirmed_UNIT_frontier_normalized_shape_count": len(frontier_classes),
            "confirmed_UNIT_frontier_shapes_repeated_across_survivors": sum(
                record["distinct_shard_count"] >= 2 for record in frontier_classes
            ),
            "confirmed_UNIT_frontier_current_bank_match_count": sum(
                frontier["current_formalized_bank_match_count"]
                for frontier in frontiers
            ),
            "confirmed_UNIT_frontiers_inside_some_named_six_count": sum(
                any(
                    item["core_centers_inside_named_six"]
                    for item in frontier["grid_center_coverage"]
                )
                for frontier in frontiers
            ),
            "smallest_confirmed_UNIT_frontier_count": len(smallest_frontiers),
            "smallest_confirmed_UNIT_frontier_normalized_shape_count": len(
                smallest_frontier_classes
            ),
            "smallest_confirmed_UNIT_frontier_shapes_repeated_across_survivors": sum(
                record["distinct_shard_count"] >= 2
                for record in smallest_frontier_classes
            ),
        },
        "classes": encoded_classes,
        "confirmed_UNIT_frontiers": encoded_frontiers,
        "confirmed_UNIT_frontier_classes": frontier_classes,
        "smallest_confirmed_UNIT_frontier_classes": smallest_frontier_classes,
        "scope": {
            "isomorphism_is_exact_point_relabeling_of_center_support_rows": True,
            "core_atoms_are_complete_selected_rows": True,
            "fixed_shadow_only": True,
            "recurrence_is_not_a_uniform_producer_theorem": True,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    document = build_document()
    if args.check:
        saved = json.loads(OUTPUT.read_text(encoding="utf-8"))
        if document != saved:
            raise AssertionError("fresh continuation MARCO analysis drift")
    else:
        OUTPUT.write_text(
            json.dumps(document, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    print(json.dumps(document["summary"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
