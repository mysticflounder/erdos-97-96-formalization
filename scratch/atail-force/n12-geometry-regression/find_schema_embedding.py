#!/usr/bin/env python3
"""Find increasing or reflected embeddings of a canonical row schema."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--carrier", required=True, type=Path)
    parser.add_argument("--certificate", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    carrier = json.loads(args.carrier.read_text(encoding="utf-8"))
    cert = json.loads(args.certificate.read_text(encoding="utf-8"))
    rows = {int(k): set(int(v) for v in values) for k, values in carrier["rows"].items()}
    n = int(carrier["n"])
    k = int(cert["core_vertex_count"])
    schema = tuple(tuple(int(v) for v in edge) for edge in cert["reflection_canonical_order_schema"])
    reflected = tuple(sorted((k - 1 - center, k - 1 - point) for center, point in schema))
    hits: list[dict[str, object]] = []
    for targets in itertools.combinations(range(n), k):
        for orientation_name, orientation in (("stored", schema), ("reflected", reflected)):
            transformed = tuple((targets[c], targets[p]) for c, p in orientation)
            if all(point in rows[center] for center, point in transformed):
                hits.append(
                    {
                        "targets": list(targets),
                        "orientation": orientation_name,
                        "transformed_memberships": [list(edge) for edge in transformed],
                    }
                )
    payload = {
        "schema": "p97-transformed-row-schema-embedding-check-v1",
        "status": "EMBEDS" if hits else "ABSENT",
        "carrier": str(args.carrier),
        "carrier_n": n,
        "source_certificate": str(args.certificate),
        "core_vertex_count": k,
        "hit_count": len(hits),
        "hits": hits,
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": payload["status"], "hit_count": len(hits)}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
