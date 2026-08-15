#!/usr/bin/env python3
"""Merge deduplicated learned row patterns from exact-17 CEGAR checkpoints."""

from __future__ import annotations

import argparse
import glob
import json
from pathlib import Path

import exact17_fullcover_cegar as cegar

EXPECTED_SCHEMA = "rigid221-exact17-cadical-cegar/v1"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--checkpoint-glob", action="append", required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--reminimize-linear", action="store_true")
    parser.add_argument("--metric-timeout-ms", type=int, default=30_000)
    args = parser.parse_args()

    paths = sorted({
        path
        for pattern in args.checkpoint_glob
        for path in glob.glob(pattern)
    })
    seen: set[str] = set()
    patterns: list[list[dict]] = []
    sources: list[dict] = []
    for path_text in paths:
        path = Path(path_text)
        with path.open() as handle:
            payload = json.load(handle)
        if payload.get("schema") != EXPECTED_SCHEMA:
            raise ValueError(
                f"unsupported checkpoint schema in {path}: {payload.get('schema')}; "
                "this merger is valid only for the fixed cyclic order of the "
                f"{EXPECTED_SCHEMA} checkpoints"
            )
        source_count = 0
        checkpoint_records = payload.get("records", [])
        if args.reminimize_linear and checkpoint_records:
            records = []
            for checkpoint_record in checkpoint_records:
                record = checkpoint_record.get("learned_rows")
                if record is None:
                    continue
                if checkpoint_record.get("classification") == "linear_unsat":
                    verdict, core = cegar.linear_replay_core(
                        cegar.rows_from_payload(checkpoint_record["rows"]),
                        args.metric_timeout_ms,
                    )
                    if verdict != "unsat" or core is None:
                        raise RuntimeError(
                            f"linear core did not replay for {path}: "
                            f"iteration {checkpoint_record.get('iteration')}"
                        )
                    record = cegar.row_payload(core)
                records.append(record)
        else:
            records = payload.get("learned_patterns")
            if records is None:
                records = [
                    record["learned_rows"]
                    for record in checkpoint_records
                    if record.get("learned_rows") is not None
                ]
        for record in records:
            key = json.dumps(record, sort_keys=True, separators=(",", ":"))
            if key in seen:
                continue
            seen.add(key)
            patterns.append(record)
            source_count += 1
        sources.append({"path": str(path), "new_pattern_count": source_count})

    result = {
        "schema": "rigid221-exact17-merged-learned-patterns/v1",
        "learned_patterns": patterns,
        "pattern_count": len(patterns),
        "sources": sources,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w") as handle:
        json.dump(result, handle, indent=2, sort_keys=True)
        handle.write("\n")
    print(json.dumps({
        "output": str(args.output),
        "pattern_count": len(patterns),
        "source_count": len(sources),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
