#!/usr/bin/env python3
"""Independently replay every transported bank cut on a saved row carrier."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("carrier", type=Path)
    parser.add_argument("bank", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    carrier = json.loads(args.carrier.read_text(encoding="utf-8"))
    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    n = int(carrier["n"])
    rows = {int(center): {int(member) for member in members} for center, members in carrier["rows"].items()}
    hits: list[dict[str, object]] = []
    checked_embeddings = 0
    for schema_index, record in enumerate(bank["schemas"]):
        size = int(record["core_vertex_count"])
        if size > n:
            continue
        schema = tuple(tuple(int(item) for item in edge) for edge in record["order_schema"])
        reflected = tuple(
            sorted((size - 1 - center, size - 1 - member) for center, member in schema)
        )
        for vertices in itertools.combinations(range(n), size):
            for orientation, oriented in (("direct", schema), ("reflected", reflected)):
                checked_embeddings += 1
                transformed = tuple((vertices[center], vertices[member]) for center, member in oriented)
                if all(member in rows[center] for center, member in transformed):
                    hits.append(
                        {
                            "schema_index": schema_index,
                            "core_vertex_count": size,
                            "orientation": orientation,
                            "target_vertices": list(vertices),
                            "transformed_memberships": [list(item) for item in transformed],
                            "provenance": record.get("provenance", []),
                        }
                    )
    payload = {
        "schema": "p97-transported-bank-saved-carrier-replay-v1",
        "status": "REJECTED_BY_BANK" if hits else "PASSES_BANK",
        "epistemic_status": "INDEPENDENT_EXACT_LITERAL_MEMBERSHIP_REPLAY",
        "carrier": str(args.carrier),
        "carrier_n": n,
        "bank": str(args.bank),
        "bank_schema_count": bank["schema_count"],
        "checked_embedding_count": checked_embeddings,
        "hit_count": len(hits),
        "hits": hits,
        "scope_warning": (
            "This checks only transported literal cuts against one saved finite carrier. "
            "It is not a new SAT/UNSAT decision and not arbitrary-cardinality coverage."
        ),
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": payload["status"], "hit_count": len(hits)}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
