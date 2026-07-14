#!/usr/bin/env python3
"""Canonicalize and cluster cross-checked UNIT cores from three survivors."""

from __future__ import annotations

from collections import defaultdict
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import classify_extended_shard_survivors as source  # noqa: E402
import analyze_cores  # noqa: E402


def main() -> int:
    records = []
    for shard in (2, 3, 6):
        document = json.loads(
            (HERE / f"multi_order_unit_shrinker_shard{shard}.json").read_text()
        )
        for index, core in enumerate(document["distinct_crosschecked_unit_cores"]):
            rows = tuple(
                source.MetricRow(
                    int(row["center"]), tuple(row["support"]), False
                )
                for row in core["rows"]
            )
            free = analyze_cores.canonical_incidence_signature(
                rows, preserve_01=False
            )
            pinned = analyze_cores.canonical_incidence_signature(
                rows, preserve_01=True
            )
            records.append({
                "shard_index": shard,
                "core_index": index,
                "row_count": len(rows),
                "rows": core["rows"],
                "free_canonical": free,
                "pinned_01_canonical": pinned,
            })
    clusters = defaultdict(list)
    for record in records:
        canonical = record["free_canonical"]
        key = canonical.get("canonical_sha256", canonical["wl_sha256"])
        clusters[key].append({
            "shard_index": record["shard_index"],
            "core_index": record["core_index"],
            "row_count": record["row_count"],
        })
    output = {
        "schema": "p97-atail-multi-order-unit-core-clusters-v1",
        "core_count": len(records),
        "free_isomorphism_class_count": len(clusters),
        "clusters": [
            {"canonical_sha256": key, "members": members}
            for key, members in sorted(clusters.items())
        ],
        "cores": records,
        "scope": {
            "exact_canonical_when_status_says_exact": True,
            "unit_certificate_replay_is_in_source_artifacts": True,
            "lean_consumer_proved": False,
        },
    }
    path = HERE / "multi_order_unit_core_clusters.json"
    path.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "core_count": len(records),
        "free_isomorphism_class_count": len(clusters),
        "repeated_classes": [
            members for members in clusters.values() if len(members) > 1
        ],
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
