#!/usr/bin/env python3
"""Replay one serialized row table against the complete exact LRA checker."""

from __future__ import annotations

import argparse
import importlib.util
import json
import time
from pathlib import Path


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("generic_biapex_cegar", HERE / "cegar.py")
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("cannot load sibling cegar.py")
CEGAR = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(CEGAR)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("row_table", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    args = parser.parse_args()

    source = json.loads(args.row_table.read_text(encoding="utf-8"))
    rows = {
        int(center): tuple(int(point) for point in support)
        for center, support in source["rows"].items()
    }
    n = int(source.get("n", len(rows)))
    status, centers, core, payload = CEGAR.metric_check(
        rows, n, args.timeout_ms, time.monotonic() + args.timeout_ms / 1000
    )
    print(
        json.dumps(
            {
                "schema": "p97-fixed-row-complete-kalmanson-replay-v1",
                "epistemic_status": "EXACT_LRA_FOR_FIXED_ROW_TABLE",
                "source": str(args.row_table),
                "n": n,
                "status": str(status).upper(),
                "dependency_centers": centers,
                "metric_core": core,
                "payload": payload,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
