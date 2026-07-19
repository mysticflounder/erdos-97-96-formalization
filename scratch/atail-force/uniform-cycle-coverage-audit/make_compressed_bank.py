#!/usr/bin/env python3
"""Compress FULL_LRA schemas to verified equality cycles or interlocking pair.

K1/K2 records are retained unchanged.  For every FULL_LRA record killed by
the equality-cycle audit, choose a shortest Kalmanson-only UNSAT cycle and use
only its row memberships.  The unique non-cycle record is retained as the
coupled interlocking-shared-pair terminal.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def reflected(k: int, schema: tuple[tuple[int, int], ...]):
    return tuple(sorted((k - 1 - center, k - 1 - point) for center, point in schema))


def compact_schema(schema: tuple[tuple[int, int], ...]):
    """Forget unused carrier gaps while preserving the induced linear order."""
    active = sorted({vertex for edge in schema for vertex in edge})
    rank = {vertex: index for index, vertex in enumerate(active)}
    return len(active), tuple(sorted((rank[center], rank[point]) for center, point in schema))


def add_record(
    records: dict[tuple[int, tuple[tuple[int, int], ...]], dict[str, Any]],
    *,
    k: int,
    schema: tuple[tuple[int, int], ...],
    provenance: dict[str, Any],
) -> None:
    source_k = k
    k, schema = compact_schema(schema)
    schema = min(tuple(sorted(schema)), reflected(k, schema))
    key = (k, schema)
    record = records.setdefault(
        key,
        {
            "core_vertex_count": k,
            "order_schema": [list(edge) for edge in schema],
            "provenance": [],
        },
    )
    record["provenance"].append({**provenance, "source_core_vertex_count": source_k})


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bank", type=Path)
    parser.add_argument("cycle_audit", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    audit = json.loads(args.cycle_audit.read_text(encoding="utf-8"))
    if int(bank["schema_count"]) != len(bank["schemas"]):
        raise ValueError("bank schema count mismatch")
    if int(audit["full_lra_schema_count"]) != sum(
        any(item["kind"] == "FULL_LRA" for item in schema["provenance"])
        for schema in bank["schemas"]
    ):
        raise ValueError("cycle audit does not match bank FULL_LRA count")

    unsat_by_index: dict[int, list[dict[str, Any]]] = {}
    for result in audit["results"]:
        if result["kalmanson_only_status"] == "UNSAT":
            unsat_by_index.setdefault(int(result["schema_index"]), []).append(result)

    records: dict[tuple[int, tuple[tuple[int, int], ...]], dict[str, Any]] = {}
    full_count = 0
    cycle_source_count = 0
    interlocking_source_count = 0
    for index, record in enumerate(bank["schemas"]):
        kinds = {item["kind"] for item in record["provenance"]}
        if "FULL_LRA" not in kinds:
            add_record(
                records,
                k=int(record["core_vertex_count"]),
                schema=tuple(tuple(edge) for edge in record["order_schema"]),
                provenance={
                    "kind": next(iter(kinds)),
                    "source_bank_index": index,
                    "source_bank": str(args.bank),
                },
            )
            continue

        full_count += 1
        candidates = unsat_by_index.get(index, [])
        if candidates:
            chosen = min(
                candidates,
                key=lambda item: (
                    int(item["cycle_size"]),
                    item["canonical_order_type"],
                    item["centers"],
                    item["pairs"],
                ),
            )
            memberships = tuple(
                sorted(
                    (int(center), int(point))
                    for center, pair in zip(
                        chosen["centers"], chosen["pairs"], strict=True
                    )
                    for point in pair
                )
            )
            add_record(
                records,
                k=int(record["core_vertex_count"]),
                schema=memberships,
                provenance={
                    "kind": "KALMANSON_UNSAT_EQUALITY_CYCLE",
                    "cycle_size": int(chosen["cycle_size"]),
                    "canonical_order_type": chosen["canonical_order_type"],
                    "source_bank_index": index,
                    "source_bank": str(args.bank),
                    "cycle_audit": str(args.cycle_audit),
                },
            )
            cycle_source_count += 1
            continue

        # The 262-schema audit has exactly one such core.  Keep its complete
        # eight memberships and label it explicitly; the checker below asserts
        # the expected transported normal form rather than silently accepting
        # an arbitrary uncovered FULL_LRA record.
        schema = tuple(tuple(edge) for edge in record["order_schema"])
        expected = (
            (0, 2),
            (0, 10),
            (1, 0),
            (1, 5),
            (5, 2),
            (5, 10),
            (9, 0),
            (9, 5),
        )
        if int(record["core_vertex_count"]) != 11 or schema != expected:
            raise ValueError(f"unexpected non-cycle FULL_LRA record {index}: {schema}")
        add_record(
            records,
            k=11,
            schema=schema,
            provenance={
                "kind": "COUPLED_INTERLOCKING_SHARED_PAIRS",
                "source_bank_index": index,
                "source_bank": str(args.bank),
            },
        )
        interlocking_source_count += 1

    ordered = [records[key] for key in sorted(records)]
    output = {
        "schema": "p97-whole-carrier-kalmanson-transported-schema-bank-v1",
        "epistemic_status": "BOUNDED_EXACT_CYCLE_COMPRESSED_COVERAGE_AUDIT",
        "schema_count": len(ordered),
        "source_count": 2,
        "sources": [
            {"path": str(args.bank), "sha256": sha256(args.bank)},
            {"path": str(args.cycle_audit), "sha256": sha256(args.cycle_audit)},
        ],
        "compression": {
            "input_schema_count": len(bank["schemas"]),
            "input_full_lra_count": full_count,
            "full_lra_sources_replaced_by_unsat_cycle": cycle_source_count,
            "full_lra_sources_replaced_by_interlocking_pair": interlocking_source_count,
            "output_schema_count": len(ordered),
        },
        "schemas": ordered,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(output["compression"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
