#!/usr/bin/env python3
"""Mine a small Boolean consequence core for the SSS obstruction.

The alternation clauses are precompiled consequences of strict Kalmanson in
round5_cegar.py.  This remains external discovery evidence, not a certificate.
"""

from __future__ import annotations

import importlib.util
import json
import sys
import time
from collections import Counter
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
ROUND5 = HERE.parent / "round5-general-cegar" / "round5_cegar.py"
OUTPUT = HERE / "v3-combinatorial-core.json"
FAMILIES = ("cyclic_alternation_cut", "exact_rich_profiles", "global_K4")


def load_round5():
    spec = importlib.util.spec_from_file_location("round5_cegar", ROUND5)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {ROUND5}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    round5 = load_round5()
    encoding = round5.Encoding(round5.Case("fresh", "SSS", 1, 3, 2), 30_000)
    tracked: list[tuple[str, int, z3.BoolRef, z3.BoolRef]] = []
    solver = z3.Solver()
    solver.set(timeout=30_000, random_seed=97, threads=1)
    for family in FAMILIES:
        for index, constraint in enumerate(encoding.groups[family]):
            label = z3.Bool(f"source__{family}__{index}")
            tracked.append((family, index, constraint, label))
            solver.assert_and_track(constraint, label)
    started = time.monotonic()
    answer = solver.check()
    if answer != z3.unsat:
        raise RuntimeError(f"expected UNSAT, got {answer}: {solver.reason_unknown()}")
    initial_names = {str(x) for x in solver.unsat_core()}
    initial = [row for row in tracked if str(row[3]) in initial_names]

    shrink = z3.Solver()
    shrink.set(timeout=30_000, random_seed=97, threads=1)
    selectors: list[z3.BoolRef] = []
    for position, (_, _, constraint, _) in enumerate(initial):
        selector = z3.Bool(f"keep__{position}")
        selectors.append(selector)
        shrink.add(z3.Implies(selector, constraint))

    active = set(range(len(initial)))
    checks = 1
    unknown = 0
    # Prefer a concise set-system statement: discard distance/radius linkage first.
    def priority(position: int) -> tuple[int, int]:
        family, index, constraint, _ = initial[position]
        text = str(constraint)
        arithmetic = "d_" in text or "radius" in text
        return (0 if arithmetic else 1, index)

    for position in sorted(active, key=priority):
        assumptions = [s if i in active - {position} else z3.Not(s) for i, s in enumerate(selectors)]
        trial = shrink.check(*assumptions)
        checks += 1
        if trial == z3.unsat:
            active.remove(position)
        elif trial == z3.unknown:
            unknown += 1

    kept = []
    for position in sorted(active):
        family, index, constraint, _ = initial[position]
        kept.append({"family": family, "index": index, "expression": str(constraint)})
    payload = {
        "status": "unsat",
        "source_constraint_count": len(tracked),
        "initial_core_size": len(initial),
        "remaining_size": len(kept),
        "remaining_family_counts": dict(sorted(Counter(x["family"] for x in kept).items())),
        "checks": checks,
        "unknown": unknown,
        "elapsed_seconds": time.monotonic() - started,
        "core": kept,
    }
    OUTPUT.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({k: v for k, v in payload.items() if k != "core"}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
