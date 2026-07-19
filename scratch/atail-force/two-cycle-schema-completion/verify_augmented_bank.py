#!/usr/bin/env python3
"""Independently verify the finite two-cycle bank augmentation and carrier hits."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


Key = tuple[int, tuple[tuple[int, int], ...]]


def key(record: dict[str, object]) -> Key:
    return (
        int(record["core_vertex_count"]),
        tuple(tuple(int(item) for item in edge) for edge in record["order_schema"]),
    )


def linear_key(witness: dict[str, object]) -> Key:
    size = int(witness["core_vertex_count"])
    schema = tuple(tuple(int(item) for item in edge) for edge in witness["linear_order_schema"])
    reflected = tuple(sorted((size - 1 - center, size - 1 - member) for center, member in schema))
    return size, min(tuple(sorted(schema)), reflected)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source_bank", type=Path)
    parser.add_argument("augmented_bank", type=Path)
    parser.add_argument("detections", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    source = json.loads(args.source_bank.read_text(encoding="utf-8"))
    augmented = json.loads(args.augmented_bank.read_text(encoding="utf-8"))
    source_records = {key(record): record for record in source["schemas"]}
    augmented_records = {key(record): record for record in augmented["schemas"]}
    if len(source_records) != source["schema_count"]:
        raise AssertionError("source bank has duplicate keys")
    if len(augmented_records) != augmented["schema_count"]:
        raise AssertionError("augmented bank has duplicate keys")
    if not set(source_records).issubset(augmented_records):
        raise AssertionError("augmentation dropped a source record")
    for source_key, source_record in source_records.items():
        if augmented_records[source_key] != source_record:
            raise AssertionError("augmentation modified a source record")

    expected_rotation_keys: set[Key] = set()
    detection_results: list[dict[str, object]] = []
    for detection_path in args.detections:
        detection = json.loads(detection_path.read_text(encoding="utf-8"))
        exact_hits = 0
        for witness in detection["witnesses"]:
            size = int(witness["core_vertex_count"])
            expected_rotation_keys.update(
                (
                    size,
                    tuple(tuple(int(item) for item in edge) for edge in record),
                )
                for record in witness["reflection_canonical_bank_rotation_records"]
            )
            if linear_key(witness) not in augmented_records:
                raise AssertionError("augmented bank misses an exact saved-carrier witness key")
            exact_hits += 1
        detection_results.append(
            {
                "detection": str(detection_path),
                "carrier_n": detection["carrier_n"],
                "verified_exact_saved_carrier_cut_hits": exact_hits,
            }
        )

    expected_added = expected_rotation_keys - set(source_records)
    actual_added = set(augmented_records) - set(source_records)
    if actual_added != expected_added:
        raise AssertionError("augmentation is not exactly the missing rotation-key set")
    for added_key in actual_added:
        provenance = augmented_records[added_key].get("provenance", [])
        if not provenance or any(
            record.get("kind") != "LEAN_THEOREM_ORDINAL_TWO_CYCLE" for record in provenance
        ):
            raise AssertionError("added schema lacks exact two-cycle provenance")

    payload = {
        "schema": "p97-theorem-faithful-two-cycle-augmented-bank-replay-v1",
        "status": "VERIFIED",
        "epistemic_status": "INDEPENDENT_EXACT_SCHEMA_AND_CARRIER_HIT_REPLAY",
        "source_schema_count": len(source_records),
        "expected_rotation_key_count": len(expected_rotation_keys),
        "added_schema_count": len(actual_added),
        "augmented_schema_count": len(augmented_records),
        "detections": detection_results,
        "scope_warning": (
            "The saved n=12 and n=13 carriers are rejected by explicit new theorem-backed cuts. "
            "No new SAT/UNSAT decision for the augmented outer problem was run, and no uniform "
            "arbitrary-cardinality occurrence theorem is claimed."
        ),
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(payload, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
