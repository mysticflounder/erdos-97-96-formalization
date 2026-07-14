#!/usr/bin/env python3
"""Materialize an optimized search result in the explicit-certificate schema."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("search", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    source_raw = args.source.read_bytes()
    search_raw = args.search.read_bytes()
    source = json.loads(source_raw)
    search = json.loads(search_raw)
    best = search["best"]
    coefficients = [
        f"L[{index},1]={coefficient}"
        for index, coefficient in enumerate(best["lift_coefficients"], start=1)
    ]
    document = {
        key: value
        for key, value in source.items()
        if key != "singular"
    }
    document["schema"] = "p97-atail-shard-equality-optimized-certificate-v1"
    document["optimization"] = {
        "source_certificate": str(args.source),
        "source_certificate_sha256": hashlib.sha256(source_raw).hexdigest(),
        "search": str(args.search),
        "search_sha256": hashlib.sha256(search_raw).hexdigest(),
        "generator_order": best["order"],
        "variable_order": best["variable_order"],
        "red_sb": best["red_sb"],
    }
    document["singular"] = {
        "status": best["status"],
        "basis_is_unit": True,
        "elapsed_seconds": best["elapsed_seconds"],
        "lift_total_char_count": best["lift_total_char_count"],
        "lift_max_coefficient_char_count": best["lift_max_coefficient_char_count"],
        "lift_sha256": best["lift_sha256"],
        "lift_coefficients": coefficients,
    }
    rendered = json.dumps(document, indent=2, sort_keys=True)
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered + "\n")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
