#!/usr/bin/env python3
"""Classify source-faithful exact-17 linear cores against the Lean theorem bank.

The CEGAR runner asks the exact QF_LRA replay before the theorem-bank matcher,
so a core reported as ``strict-linear-core`` may already instantiate a banked
consumer.  This audit deduplicates cores per cyclic order, runs the existing
formalized-core matcher, and records only theorem-discovery evidence.  A hit is
not a source-to-Lean ingress proof for the exact-17 branch.
"""

from __future__ import annotations

import argparse
import glob
import json
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent


def load_runner():
    import importlib.util
    import sys

    path = HERE / "exact17_source_faithful_cegar.py"
    spec = importlib.util.spec_from_file_location("source_faithful_classifier", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def core_key(order: tuple[int, ...], rows: list[dict]) -> tuple:
    normalized_rows = tuple(
        sorted(
            (
                int(row["center"]),
                tuple(sorted(int(point) for point in row["support"])),
                bool(row.get("exact", False)),
            )
            for row in rows
        )
    )
    return order, normalized_rows


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--artifact-glob", action="append", required=True)
    parser.add_argument("--offset", type=int, default=0)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--include-unknown-witnesses", action="store_true")
    parser.add_argument("--unknown-witnesses-only", action="store_true")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    runner = load_runner()
    paths = sorted(
        {
            Path(path)
            for pattern in args.artifact_glob
            for path in glob.glob(pattern)
            if ".replay" not in Path(path).name
        }
    )
    candidates: dict[tuple, dict] = {}
    raw_count = 0
    for path in paths:
        payload = json.loads(path.read_text())
        if payload.get("schema") != runner.SCHEMA:
            raise ValueError(f"unexpected schema in {path}: {payload.get('schema')}")
        order = tuple(int(point) for point in payload["order"])
        for learned in ([] if args.unknown_witnesses_only else payload.get("learned", [])):
            if learned.get("kind") != "strict-linear-core":
                continue
            raw_count += 1
            key = core_key(order, learned["rows"])
            candidates.setdefault(
                key,
                {
                    "order": order,
                    "rows": learned["rows"],
                    "first_artifact": str(path),
                    "kind": "strict-linear-core",
                },
            )
        witness = payload.get("witness")
        if (
            (args.include_unknown_witnesses or args.unknown_witnesses_only)
            and payload.get("terminal") == "METRIC_UNKNOWN"
            and isinstance(witness, dict)
            and witness.get("metric_status") == "unknown"
        ):
            raw_count += 1
            key = core_key(order, witness["rows"])
            candidates.setdefault(
                key,
                {
                    "order": order,
                    "rows": witness["rows"],
                    "first_artifact": str(path),
                    "kind": "metric-unknown-witness",
                },
            )

    selected = list(candidates.values())[args.offset :]
    if args.limit is not None:
        selected = selected[: args.limit]

    stage_counts: Counter[str] = Counter()
    consumer_counts: Counter[str] = Counter()
    hit_count = 0
    records = []
    for item in selected:
        rows = tuple(
            runner.legacy.MetricRow(
                int(row["center"]),
                tuple(int(point) for point in row["support"]),
                bool(row.get("exact", False)),
            )
            for row in item["rows"]
        )
        hits = runner.legacy.producer_bank.scan_all_formalized_cores(
            rows,
            17,
            tuple(item["order"]),
        )
        if hits:
            hit_count += 1
            for hit in hits:
                stage_counts[str(hit.get("stage"))] += 1
                consumer_counts[str(hit.get("lean_consumer"))] += 1
        records.append(
            {
                "first_artifact": item["first_artifact"],
                "kind": item["kind"],
                "order": list(item["order"]),
                "rows": item["rows"],
                "hits": hits,
            }
        )

    report = {
        "schema": "p97-rigid221-exact17-source-faithful-core-bank-audit-v1",
        "artifact_count": len(paths),
        "raw_core_count": raw_count,
        "distinct_ordered_core_count": len(candidates),
        "classified_count": len(selected),
        "bank_hit_core_count": hit_count,
        "unbanked_core_count": len(selected) - hit_count,
        "top_stages": stage_counts.most_common(30),
        "top_consumers": consumer_counts.most_common(30),
        "records": records,
        "scope": (
            "theorem-bank recognition audit only; not exact-17 coverage and not "
            "a source-to-Lean ingress theorem"
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "raw": raw_count,
                "distinct": len(candidates),
                "classified": len(selected),
                "bank_hits": hit_count,
                "unbanked": len(selected) - hit_count,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
