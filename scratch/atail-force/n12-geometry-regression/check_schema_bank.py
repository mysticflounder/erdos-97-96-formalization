#!/usr/bin/env python3
"""Check whether the extracted reflection-canonical schema is already banked."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bank", required=True, type=Path)
    parser.add_argument("--certificate", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    cert = json.loads(args.certificate.read_text(encoding="utf-8"))
    target = (
        int(cert["core_vertex_count"]),
        tuple(tuple(int(v) for v in edge) for edge in cert["reflection_canonical_order_schema"]),
    )
    hits: list[int] = []
    for index, record in enumerate(bank["schemas"]):
        key = (
            int(record["core_vertex_count"]),
            tuple(tuple(int(v) for v in edge) for edge in record["order_schema"]),
        )
        if key == target:
            hits.append(index)
    payload = {
        "schema": "p97-n12-two-cycle-bank-membership-check-v1",
        "status": "VERIFIED_ABSENT" if not hits else "PRESENT",
        "bank": str(args.bank),
        "bank_sha256": hashlib.sha256(args.bank.read_bytes()).hexdigest(),
        "bank_schema_count": bank["schema_count"],
        "target_core_vertex_count": target[0],
        "target_order_schema": [list(edge) for edge in target[1]],
        "matching_indices": hits,
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": payload["status"], "matching_indices": hits}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
