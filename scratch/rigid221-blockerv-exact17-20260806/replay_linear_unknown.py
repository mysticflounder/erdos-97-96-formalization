#!/usr/bin/env python3
"""Replay one stored exact-17 linear timeout with a larger timeout."""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location(
    "exact17_fullcover_cegar", HERE / "exact17_fullcover_cegar.py"
)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("could not load exact17_fullcover_cegar.py")
cegar = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(cegar)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("artifact", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    args = parser.parse_args()

    payload = json.loads(args.artifact.read_text())
    stored_order = payload.get("order")
    if not isinstance(stored_order, list):
        raise ValueError(f"artifact has no explicit cyclic order: {args.artifact}")
    order = tuple(stored_order)
    if len(order) != 17 or set(order) != set(range(17)):
        raise ValueError(f"artifact cyclic order is not a permutation of Fin 17: {order}")
    # `linear_replay_core` consults the full-cover module's normalized order.
    # Replaying under its historical default silently checks the wrong metric
    # system for every other placement, so bind it from the authenticated
    # artifact before constructing any Kalmanson inequalities.
    cegar.ORDER = order
    if payload.get("witness", {}).get("metric_status") == "unknown":
        stored = payload["witness"]["rows"]
    else:
        stored = payload["examples"]["linear_unknown"][0]
    rows = tuple(
        cegar.MetricRow(
            row["center"], tuple(row["support"]), bool(row.get("exact", False))
        )
        for row in stored
    )
    verdict, core = cegar.linear_replay_core(rows, args.timeout_ms)
    print(json.dumps({
        "artifact": str(args.artifact),
        "verdict": verdict,
        "core": cegar.row_payload(core) if core else None,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
