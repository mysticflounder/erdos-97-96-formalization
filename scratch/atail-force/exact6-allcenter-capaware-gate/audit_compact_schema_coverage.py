#!/usr/bin/env python3
"""Audit how the compact learned schemas cover exact baseline metric cores."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path


VERTICES = tuple(range(14))


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def reflected(k: int, schema: tuple[tuple[int, int], ...]):
    return tuple(sorted((k - 1 - center, k - 1 - point) for center, point in schema))


def applications(bank: dict[str, object], max_k: int):
    answer = {}
    for schema_index, record in enumerate(bank["schemas"]):
        k = int(record["core_vertex_count"])
        if k > max_k:
            continue
        schema = tuple(sorted(tuple(item) for item in record["order_schema"]))
        for embedding in itertools.combinations(VERTICES, k):
            for orientation, oriented in (("forward", schema), ("reverse", reflected(k, schema))):
                memberships = tuple(sorted(
                    (embedding[center], embedding[point])
                    for center, point in oriented
                ))
                answer.setdefault(memberships, {
                    "schema_index": schema_index,
                    "embedding": embedding,
                    "orientation": orientation,
                })
    return answer


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bank", type=Path)
    parser.add_argument("results", type=Path, nargs="+")
    parser.add_argument("--max-k", type=int, default=8)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    app = applications(bank, args.max_k)
    per_orbit = []
    total_covered = 0
    total_cores = 0
    for path in args.results:
        payload = json.loads(path.read_text(encoding="utf-8"))
        covered = []
        for core_index, core in enumerate(payload["metric_core_cuts"]):
            memberships = {tuple(item) for item in core["required_memberships"]}
            match = next((
                (required, provenance)
                for required, provenance in app.items()
                if all(item in memberships for item in required)
            ), None)
            if match is not None:
                required, provenance = match
                covered.append({
                    "core_index": core_index,
                    "attempt": core["attempt"],
                    "schema_index": provenance["schema_index"],
                    "embedding": list(provenance["embedding"]),
                    "orientation": provenance["orientation"],
                    "required_memberships": [list(item) for item in required],
                })
        total_covered += len(covered)
        total_cores += len(payload["metric_core_cuts"])
        per_orbit.append({
            "orbit": payload["orbit"],
            "result": str(path),
            "result_sha256": sha256(path),
            "metric_core_count": len(payload["metric_core_cuts"]),
            "directly_covered_core_count": len(covered),
            "covered": covered,
        })
    output = {
        "schema": "p97-exact6-compact-schema-baseline-core-coverage-v1",
        "epistemic_status": "EXACT_MEMBERSHIP_SCHEMA_COVERAGE_OF_STORED_LRA_CORES",
        "bank": str(args.bank),
        "bank_sha256": sha256(args.bank),
        "max_vertex_count": args.max_k,
        "selected_schema_count": sum(
            int(record["core_vertex_count"]) <= args.max_k for record in bank["schemas"]
        ),
        "concrete_application_count": len(app),
        "metric_core_count": total_cores,
        "directly_covered_core_count": total_covered,
        "per_orbit": per_orbit,
    }
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "selected_schema_count": output["selected_schema_count"],
        "concrete_application_count": output["concrete_application_count"],
        "metric_core_count": total_cores,
        "directly_covered_core_count": total_covered,
        "per_orbit": [
            {"orbit": item["orbit"], "covered": item["directly_covered_core_count"],
             "total": item["metric_core_count"]}
            for item in per_orbit
        ],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
