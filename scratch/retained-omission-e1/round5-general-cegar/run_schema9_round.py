#!/usr/bin/env python3
"""Run the 16 source-order/query Schema-9 cases after self-checking."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_schema9_coherent_shared_pair_probe as probe  # noqa: E402


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=30000)
    parser.add_argument("--out-dir", type=Path, default=HERE / "artifacts-schema-v9")
    args = parser.parse_args()
    check = probe.self_check()
    if check["status"] != "PASS":
        parser.error("Schema 9 self-check failed; refusing the 16-case run")
    args.out_dir.mkdir(parents=True, exist_ok=True)
    records = []
    for mapping in ("q1-outside", "q2-outside"):
        for arm in (1, 2, 3, 4):
            for query in ("canonical-survives", "other-survives"):
                cli = probe._args(
                    endpoint_mapping=mapping,
                    order_arm=arm,
                    query=query,
                    timeout_ms=args.timeout_ms,
                )
                record = probe.run(cli)
                record["artifact"] = f"schema-v9-{mapping}-arm{arm}-{query}.json"
                (args.out_dir / record["artifact"]).write_text(
                    json.dumps(record, indent=2, sort_keys=True) + "\n"
                )
                records.append(record)
                print(json.dumps({"artifact": record["artifact"], "status": record["status"]}, sort_keys=True), flush=True)
    summary = {
        "schema_version": probe.SCHEMA_VERSION,
        "case_count": len(records),
        "status_counts": {
            status: sum(record["status"] == status for record in records)
            for status in ("SAT", "UNSAT", "UNKNOWN")
        },
        "candidate_count": 4913,
        "self_check": check,
    }
    (args.out_dir / "schema-v9-round-summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
