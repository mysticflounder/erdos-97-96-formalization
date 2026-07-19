#!/usr/bin/env python3
"""Append one independently scanned terminal as a fixed-n schema cut."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any


EXPECTED_BANK_SCHEMA = "p97-whole-carrier-kalmanson-transported-schema-bank-v1"
EXPECTED_SCAN_SCHEMA = "p97-uniform-cycle-coverage-candidate-scan-v1"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def reflected(k: int, schema: tuple[tuple[int, int], ...]):
    return tuple(sorted((k - 1 - center, k - 1 - point) for center, point in schema))


def canonical(k: int, schema: tuple[tuple[int, int], ...]):
    schema = tuple(sorted(schema))
    return min(schema, reflected(k, schema))


def key_of(record: dict[str, Any]):
    return (
        int(record["core_vertex_count"]),
        tuple(tuple(int(value) for value in edge) for edge in record["order_schema"]),
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bank", type=Path)
    parser.add_argument("scan", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    scan = json.loads(args.scan.read_text(encoding="utf-8"))
    if bank.get("schema") != EXPECTED_BANK_SCHEMA:
        raise ValueError("unexpected bank schema")
    if int(bank.get("schema_count", -1)) != len(bank.get("schemas", [])):
        raise ValueError("bank schema count mismatch")
    if scan.get("schema") != EXPECTED_SCAN_SCHEMA:
        raise ValueError("unexpected scan schema")
    if scan.get("status") != "TERMINAL_FOUND" or not isinstance(scan.get("terminal"), dict):
        raise ValueError("scan contains no terminal")
    terminal = scan["terminal"]
    n = int(scan["n"])
    k = int(terminal["core_vertex_count"])
    if not 1 <= k <= n:
        raise ValueError("terminal core size is incompatible with the scanned carrier")
    schema = canonical(
        k,
        tuple(tuple(int(value) for value in edge) for edge in terminal["order_schema"]),
    )
    if any(center == point or not (0 <= center < k and 0 <= point < k) for center, point in schema):
        raise ValueError("terminal has an invalid membership")
    if len(set(schema)) != len(schema):
        raise ValueError("terminal contains duplicate memberships")

    records = {key_of(record): record for record in bank["schemas"]}
    new_key = (k, schema)
    if new_key in records:
        raise ValueError("terminal is already present in the bank")
    records[new_key] = {
        "core_vertex_count": k,
        "order_schema": [list(edge) for edge in schema],
        "provenance": [
            {
                "kind": terminal["kind"],
                "discovered_at_n": n,
                "source_scan": str(args.scan),
                "source_scan_sha256": sha256(args.scan),
                "cycle_size": terminal.get("cycle_size"),
                "canonical_order_type": terminal.get("canonical_order_type"),
                "has_ordinal_cycle": terminal.get("has_ordinal_cycle"),
            }
        ],
    }
    ordered = [records[key] for key in sorted(records)]
    output = {
        **{key: value for key, value in bank.items() if key not in {"schemas", "schema_count"}},
        "schema_count": len(ordered),
        "schemas": ordered,
        "last_fixed_n_refinement": {
            "n": n,
            "core_vertex_count": k,
            "kind": terminal["kind"],
            "source_scan": str(args.scan),
            "source_scan_sha256": sha256(args.scan),
            "input_schema_count": len(bank["schemas"]),
            "output_schema_count": len(ordered),
        },
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(output["last_fixed_n_refinement"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
