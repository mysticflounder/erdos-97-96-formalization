#!/usr/bin/env python3
"""Replay an ordinal SAT row table against the tracked full-linear checker."""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
import time
from pathlib import Path


HERE = Path(__file__).resolve().parent
CEGAR_PATH = HERE.parent / "generic-biapex-kalmanson-search" / "cegar.py"
sys.path.insert(0, str(CEGAR_PATH.parent))
SPEC = importlib.util.spec_from_file_location("whole_carrier_cegar", CEGAR_PATH)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("cannot load tracked full-linear checker")
CEGAR = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(CEGAR)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("model", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    payload = json.loads(args.model.read_text(encoding="utf-8"))
    n = int(payload["n"])
    rows = {
        int(center): tuple(map(int, support))
        for center, support in payload["rows"].items()
    }
    status, centers, names, details = CEGAR.metric_check(
        rows,
        n,
        args.timeout_ms,
        time.monotonic() + args.timeout_ms / 1000,
    )
    answer: dict[str, object] = {
        "schema": "p97-ordinal-shadow-full-linear-replay-v1",
        "epistemic_status": "BOUNDED_Z3_REPLAY_NOT_LEAN_CERTIFICATE",
        "n": n,
        "status": str(status).upper(),
    }
    if str(status) == "unsat":
        answer.update(
            {
                "dependency_centers": list(centers),
                "metric_core": list(names),
                "payload": details,
            }
        )
    else:
        answer["payload"] = details
    rendered = json.dumps(answer, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
