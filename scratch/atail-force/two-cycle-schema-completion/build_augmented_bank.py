#!/usr/bin/env python3
"""Close cyclic-cut orbits for finite-carrier ``false_of_two_cycle`` witnesses."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


Membership = tuple[int, int]
Key = tuple[int, tuple[Membership, ...]]


def record_key(record: dict[str, object]) -> Key:
    return (
        int(record["core_vertex_count"]),
        tuple(tuple(int(item) for item in edge) for edge in record["order_schema"]),
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source_bank", type=Path)
    parser.add_argument("detections", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    source = json.loads(args.source_bank.read_text(encoding="utf-8"))
    if source.get("schema") != "p97-whole-carrier-kalmanson-transported-schema-bank-v1":
        raise ValueError("unexpected transported-bank schema")
    source_records = source["schemas"]
    if source.get("schema_count") != len(source_records):
        raise ValueError("source bank count mismatch")
    records = list(source_records)
    seen = {record_key(record) for record in records}
    if len(seen) != len(records):
        raise ValueError("source bank contains duplicate keys")

    proposed: dict[Key, list[dict[str, object]]] = {}
    detection_artifacts: list[dict[str, object]] = []
    for detection_path in args.detections:
        detection = json.loads(detection_path.read_text(encoding="utf-8"))
        if detection.get("schema") != "p97-theorem-faithful-two-cycle-occurrence-search-v1":
            raise ValueError(f"unexpected detection schema in {detection_path}")
        detection_artifacts.append(
            {
                "path": str(detection_path),
                "sha256": hashlib.sha256(detection_path.read_bytes()).hexdigest(),
                "carrier_n": detection["carrier_n"],
                "canonical_schema_count": detection["canonical_schema_count"],
            }
        )
        for witness_index, witness in enumerate(detection["witnesses"]):
            size = int(witness["core_vertex_count"])
            for rotation_index, raw_schema in enumerate(
                witness["reflection_canonical_bank_rotation_records"]
            ):
                schema = tuple(tuple(int(item) for item in edge) for edge in raw_schema)
                key = (size, schema)
                proposed.setdefault(key, []).append(
                    {
                        "kind": "LEAN_THEOREM_ORDINAL_TWO_CYCLE",
                        "consumer": "Problem97.ATailOrdinalKalmansonCycle.false_of_two_cycle",
                        "ccw_rotation_adapter": "Problem97.isCcwConvexPolygon_cyclicShift",
                        "source_detection": str(detection_path),
                        "source_carrier_n": detection["carrier_n"],
                        "source_witness_index": witness_index,
                        "rotation_record_index": rotation_index,
                        "common_boundary_chart_required": True,
                    }
                )

    added_keys = sorted(key for key in proposed if key not in seen)
    for size, schema in added_keys:
        records.append(
            {
                "core_vertex_count": size,
                "order_schema": [list(item) for item in schema],
                "provenance": proposed[(size, schema)],
            }
        )
    records.sort(key=record_key)
    payload = {
        "schema": "p97-whole-carrier-kalmanson-transported-schema-bank-v1",
        "epistemic_status": (
            "SOURCE_218_BANK_PLUS_FINITE_CARRIER_THEOREM_FAITHFUL_TWO_CYCLE_ROTATION_CLOSURE"
        ),
        "schema_count": len(records),
        "source_count": 1 + len(detection_artifacts),
        "sources": [
            {
                "path": str(args.source_bank),
                "sha256": hashlib.sha256(args.source_bank.read_bytes()).hexdigest(),
                "schema_count": len(source_records),
            },
            *detection_artifacts,
        ],
        "augmentation": {
            "source_schema_count": len(source_records),
            "proposed_rotation_key_count": len(proposed),
            "already_present_rotation_key_count": len(set(proposed) & seen),
            "added_schema_count": len(added_keys),
            "output_schema_count": len(records),
            "added_keys": [
                {"core_vertex_count": size, "order_schema": [list(item) for item in schema]}
                for size, schema in added_keys
            ],
            "scope_warning": (
                "Every added cut is a transported instance of the production two-cycle consumer. "
                "The source detections prove occurrence only for their finite carriers; this bank "
                "does not prove that an arbitrary live carrier contains any added schema."
            ),
        },
        "schemas": records,
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(payload["augmentation"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
