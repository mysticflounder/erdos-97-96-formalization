#!/usr/bin/env python3
"""Merge deterministic minimizer shards into one canonical schema bank."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


EXPECTED = "p97-exact6-allcenter-minimized-metric-schema-bank-v1"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("shards", type=Path, nargs="+")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    schemas: dict[tuple[int, tuple[tuple[int, int], ...]], dict[str, object]] = {}
    sources = {}
    input_core_count = 0
    minimal_core_count = 0
    shard_indices = set()
    expected_shard_count = None
    deletion_orders = None
    for path in args.shards:
        payload = json.loads(path.read_text(encoding="utf-8"))
        if payload.get("schema") != EXPECTED:
            raise AssertionError(f"unexpected shard schema: {path}")
        if expected_shard_count is None:
            expected_shard_count = int(payload["shard_count"])
            deletion_orders = int(payload["deletion_orders_per_input"])
        if int(payload["shard_count"]) != expected_shard_count:
            raise AssertionError("shard count drift")
        if int(payload["deletion_orders_per_input"]) != deletion_orders:
            raise AssertionError("deletion order count drift")
        shard_index = int(payload["shard_index"])
        if shard_index in shard_indices:
            raise AssertionError("duplicate shard index")
        shard_indices.add(shard_index)
        input_core_count += int(payload["input_core_count"])
        minimal_core_count += int(payload["minimal_core_count"])
        for source in payload["sources"]:
            sources[source["path"]] = source
        for record in payload["schemas"]:
            schema = tuple(sorted(tuple(item) for item in record["order_schema"]))
            key = (int(record["core_vertex_count"]), schema)
            merged = schemas.setdefault(key, {
                "core_vertex_count": key[0],
                "order_schema": [list(item) for item in key[1]],
                "complete_application_count": record["complete_application_count"],
                "provenance": [],
            })
            if merged["complete_application_count"] != record["complete_application_count"]:
                raise AssertionError("application count drift")
            merged["provenance"].extend(record["provenance"])

    if expected_shard_count != len(shard_indices):
        raise AssertionError(f"incomplete shard set: {sorted(shard_indices)}")
    ordered = [schemas[key] for key in sorted(schemas)]
    output = {
        "schema": EXPECTED,
        "epistemic_status": "EXACT_RATIONAL_LRA_CORE_BANK_NOT_LEAN_PROOF",
        "sources": [sources[key] for key in sorted(sources)],
        "worker_count": len(shard_indices),
        "shard_index": None,
        "shard_count": len(shard_indices),
        "deletion_orders_per_input": deletion_orders,
        "input_core_count": input_core_count,
        "minimal_core_count": minimal_core_count,
        "unique_schema_count": len(ordered),
        "compact_schema_count_k_le_8": sum(
            int(record["core_vertex_count"]) <= 8 for record in ordered
        ),
        "schemas": ordered,
    }
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "input_core_count": input_core_count,
        "minimal_core_count": minimal_core_count,
        "unique_schema_count": len(ordered),
        "compact_schema_count_k_le_8": output["compact_schema_count_k_le_8"],
        "output": str(args.output),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
