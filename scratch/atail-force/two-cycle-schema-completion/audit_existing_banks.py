#!/usr/bin/env python3
"""Compare theorem-faithful two-cycle families with transported schema banks."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


Membership = tuple[int, int]


def key(size: int, schema: tuple[Membership, ...]) -> tuple[int, tuple[Membership, ...]]:
    reflected = tuple(sorted((size - 1 - center, size - 1 - member) for center, member in schema))
    return (size, min(tuple(sorted(schema)), reflected))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("detection", type=Path)
    parser.add_argument("banks", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    detection = json.loads(args.detection.read_text(encoding="utf-8"))
    bank_results: list[dict[str, object]] = []
    for bank_path in args.banks:
        bank = json.loads(bank_path.read_text(encoding="utf-8"))
        bank_keys = {
            (
                int(record["core_vertex_count"]),
                tuple(tuple(int(item) for item in edge) for edge in record["order_schema"]),
            ): index
            for index, record in enumerate(bank["schemas"])
        }
        witnesses: list[dict[str, object]] = []
        for witness_index, witness in enumerate(detection["witnesses"]):
            size = int(witness["core_vertex_count"])
            linear = tuple(tuple(edge) for edge in witness["linear_order_schema"])
            exact_key = key(size, linear)
            rotation_keys = {
                (size, tuple(tuple(edge) for edge in record))
                for record in witness["reflection_canonical_bank_rotation_records"]
            }
            hits = sorted(
                {bank_keys[rotation_key] for rotation_key in rotation_keys if rotation_key in bank_keys}
            )
            witnesses.append(
                {
                    "witness_index": witness_index,
                    "core_vertex_count": size,
                    "exact_saved_carrier_linear_key_present": exact_key in bank_keys,
                    "exact_saved_carrier_linear_key_index": bank_keys.get(exact_key),
                    "cyclic_family_bank_hit_indices": hits,
                    "cyclic_family_bank_hit_count": len(hits),
                    "cyclic_family_rotation_record_count": len(rotation_keys),
                }
            )
        bank_results.append(
            {
                "bank": str(bank_path),
                "bank_sha256": hashlib.sha256(bank_path.read_bytes()).hexdigest(),
                "bank_schema_count": len(bank_keys),
                "all_exact_saved_carrier_linear_keys_absent": all(
                    not record["exact_saved_carrier_linear_key_present"] for record in witnesses
                ),
                "witnesses": witnesses,
            }
        )
    payload = {
        "schema": "p97-theorem-faithful-two-cycle-bank-audit-v1",
        "status": "VERIFIED",
        "epistemic_status": "EXACT_SCHEMA_KEY_COMPARISON",
        "detection": str(args.detection),
        "banks": bank_results,
        "interpretation": (
            "An absent exact linear key explains why that saved carrier survived the bank. "
            "A cyclic-family hit only means another choice of linear cut was previously banked; "
            "the current encoder does not quotient schema records by cyclic rotation."
        ),
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(
        json.dumps(
            {
                "status": "VERIFIED",
                "all_exact_keys_absent": [
                    record["all_exact_saved_carrier_linear_keys_absent"] for record in bank_results
                ],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
