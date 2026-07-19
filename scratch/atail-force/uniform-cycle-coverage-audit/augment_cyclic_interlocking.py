#!/usr/bin/env python3
"""Add every fixed-n cyclic rotation of the interlocking shared-pair terminal."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
from typing import Any


def reflected(k: int, schema: tuple[tuple[int, int], ...]):
    return tuple(sorted((k - 1 - center, k - 1 - point) for center, point in schema))


def canonical(k: int, schema: tuple[tuple[int, int], ...]):
    schema = tuple(sorted(schema))
    return min(schema, reflected(k, schema))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bank", type=Path)
    parser.add_argument("--n", required=True, type=int)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    records: dict[tuple[int, tuple[tuple[int, int], ...]], dict[str, Any]] = {}
    for record in bank["schemas"]:
        key = (
            int(record["core_vertex_count"]),
            tuple(tuple(edge) for edge in record["order_schema"]),
        )
        records[key] = record

    added = 0
    n = args.n
    for shift in range(n):
        for offsets in itertools.combinations(range(n), 6):
            A, B, X, C, D, Y = tuple((shift + offset) % n for offset in offsets)
            if len({A, B, X, C, D, Y}) != 6:
                continue
            schema = canonical(
                n,
                (
                    (A, X),
                    (A, Y),
                    (C, X),
                    (C, Y),
                    (B, A),
                    (B, C),
                    (D, A),
                    (D, C),
                ),
            )
            key = (n, schema)
            if key in records:
                continue
            records[key] = {
                "core_vertex_count": n,
                "order_schema": [list(edge) for edge in schema],
                "provenance": [
                    {
                        "kind": "COUPLED_INTERLOCKING_SHARED_PAIRS_CYCLIC",
                        "n": n,
                    }
                ],
            }
            added += 1

    ordered = [records[key] for key in sorted(records)]
    output = {
        **{key: value for key, value in bank.items() if key not in {"schemas", "schema_count"}},
        "schema_count": len(ordered),
        "schemas": ordered,
        "cyclic_interlocking_augmentation": {
            "n": n,
            "input_schema_count": len(bank["schemas"]),
            "added_schema_count": added,
            "output_schema_count": len(ordered),
        },
    }
    args.output.write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(output["cyclic_interlocking_augmentation"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
