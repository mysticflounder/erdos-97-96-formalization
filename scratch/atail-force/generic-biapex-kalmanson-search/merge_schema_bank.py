#!/usr/bin/env python3
"""Merge transported Kalmanson/Farkas schemas from bounded CEGAR outputs."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("inputs", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    schemas: dict[tuple[int, tuple[tuple[int, int], ...]], dict[str, object]] = {}

    def add_schema(
        *,
        vertex_count: int,
        schema_items: list[list[int]],
        provenance: list[dict[str, object]],
        source: Path,
    ) -> None:
        schema = tuple(tuple(item) for item in schema_items)
        key = (vertex_count, schema)
        for center, point in schema:
            if not (0 <= center < vertex_count and 0 <= point < vertex_count):
                raise ValueError(f"invalid schema role in {source}: {key}")
        record = schemas.setdefault(
            key,
            {
                "core_vertex_count": vertex_count,
                "order_schema": [list(item) for item in schema],
                "provenance": [],
            },
        )
        record["provenance"].extend(provenance)

    sources = []
    for path in args.inputs:
        payload = json.loads(path.read_text(encoding="utf-8"))
        sources.append(
            {
                "path": str(path),
                "sha256": sha256(path),
                "status": payload.get("status"),
                "n": payload.get("n"),
                "random_seed": payload.get("random_seed"),
            }
        )
        for index, refinement in enumerate(payload.get("refinements", [])):
            vertices = tuple(refinement["complete_core_vertices"])
            add_schema(
                vertex_count=len(vertices),
                schema_items=refinement["order_schema"],
                provenance=[
                    {
                        "source": str(path),
                        "refinement_index": index,
                        "kind": refinement.get("kind"),
                        "metric_core": refinement.get("metric_core"),
                    }
                ],
                source=path,
            )
        for bank_schema in payload.get("schemas", []):
            add_schema(
                vertex_count=bank_schema["core_vertex_count"],
                schema_items=bank_schema["order_schema"],
                provenance=bank_schema.get(
                    "provenance",
                    [{"source": str(path), "kind": "BANK_IMPORT"}],
                ),
                source=path,
            )

    ordered = [schemas[key] for key in sorted(schemas)]
    output = {
        "schema": "p97-whole-carrier-kalmanson-transported-schema-bank-v1",
        "epistemic_status": "BOUNDED_DISCOVERY_BANK_REQUIRES_CORE_PROVENANCE",
        "source_count": len(sources),
        "sources": sources,
        "schema_count": len(ordered),
        "schemas": ordered,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({"schema_count": len(ordered), "output": str(args.output)}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
