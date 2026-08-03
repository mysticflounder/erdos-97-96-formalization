#!/usr/bin/env python3
"""Extract a clause-level Z3 core from one round5 E1 case.

This is an external diagnostic.  It does not produce a Lean certificate.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
import time
from collections import Counter
from pathlib import Path

import z3


ROOT = Path(__file__).resolve().parents[3]
ROUND5 = ROOT / "scratch/retained-omission-e1/round5-general-cegar/round5_cegar.py"


def load_round5():
    spec = importlib.util.spec_from_file_location("round5_cegar", ROUND5)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {ROUND5}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--arm", choices=("paired", "fresh"), required=True)
    parser.add_argument("--profiles", required=True)
    parser.add_argument("--kept", type=int, required=True)
    parser.add_argument("--deleted", type=int, required=True)
    parser.add_argument("--fresh", type=int)
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--output", type=Path, required=True)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    round5 = load_round5()
    case = round5.Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
    encoding = round5.Encoding(case, args.timeout_ms)

    solver = z3.Solver()
    solver.set(timeout=args.timeout_ms)
    solver.set(random_seed=97)
    labels: dict[str, tuple[str, int, z3.BoolRef]] = {}
    for family in sorted(encoding.groups):
        for index, constraint in enumerate(encoding.groups[family]):
            name = f"track__{family}__{index}"
            label = z3.Bool(name)
            labels[name] = (family, index, constraint)
            solver.assert_and_track(constraint, label)

    started = time.monotonic()
    check = solver.check()
    elapsed = time.monotonic() - started
    payload: dict[str, object] = {
        "case_id": case.case_id,
        "status": str(check),
        "elapsed_seconds": elapsed,
        "constraint_total": len(labels),
    }
    if check == z3.unsat:
        core = [str(item) for item in solver.unsat_core()]
        entries = []
        family_counts: Counter[str] = Counter()
        for name in core:
            family, index, constraint = labels[name]
            family_counts[family] += 1
            entries.append(
                {
                    "family": family,
                    "index": index,
                    "expression": str(constraint),
                }
            )
        payload["core_size"] = len(entries)
        payload["core_family_counts"] = dict(sorted(family_counts.items()))
        payload["core"] = entries
    elif check == z3.unknown:
        payload["reason_unknown"] = solver.reason_unknown()

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "case_id": case.case_id,
                "status": str(check),
                "elapsed_seconds": elapsed,
                "core_size": payload.get("core_size"),
                "core_family_counts": payload.get("core_family_counts"),
                "output": str(args.output),
            },
            sort_keys=True,
        )
    )
    return 0 if check in (z3.sat, z3.unsat) else 2


if __name__ == "__main__":
    raise SystemExit(main())
