#!/usr/bin/env python3
"""Deletion diagnostics for the existing fresh_SSS_k1_d3_f2 clause core.

This only minimizes the already-recorded external Z3 core; it does not claim
an encoding certificate or a Lean proof.
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


HERE = Path(__file__).resolve().parent
ROUND5 = HERE.parent / "round5-general-cegar" / "round5_cegar.py"
CORE = HERE / "fresh_SSS_k1_d3_f2_v3_clause_core.json"


def load_round5():
    spec = importlib.util.spec_from_file_location("round5_cegar", ROUND5)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {ROUND5}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--mode", choices=("families", "greedy"), required=True)
    parser.add_argument("--route", choices=("geometry", "cuts"), default="geometry")
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    round5 = load_round5()
    encoding = round5.Encoding(round5.Case("fresh", "SSS", 1, 3, 2), args.timeout_ms)
    raw = json.loads(CORE.read_text())
    entries = raw["core"]
    constraints = [encoding.groups[e["family"]][e["index"]] for e in entries]
    selectors = [z3.Bool(f"keep_core_{i}") for i in range(len(entries))]

    solver = z3.Solver()
    solver.set(timeout=args.timeout_ms, random_seed=97, threads=1)
    for selector, constraint in zip(selectors, constraints, strict=True):
        solver.add(z3.Implies(selector, constraint))

    checks = 0
    unknown = 0

    def check(active: set[int]) -> str:
        nonlocal checks, unknown
        checks += 1
        assumptions = [s if i in active else z3.Not(s) for i, s in enumerate(selectors)]
        answer = solver.check(*assumptions)
        if answer == z3.unknown:
            unknown += 1
        return str(answer)

    all_indices = set(range(len(entries)))
    started = time.monotonic()
    baseline = check(all_indices)
    result: dict[str, object] = {"baseline": baseline, "core_size": len(entries)}

    if args.mode == "families":
        rows = []
        for family in sorted({e["family"] for e in entries}):
            dropped = {i for i, e in enumerate(entries) if e["family"] == family}
            rows.append(
                {
                    "family": family,
                    "dropped": len(dropped),
                    "status_without": check(all_indices - dropped),
                }
            )
        result["family_deletions"] = rows
    else:
        active = set(all_indices)
        decisions = []
        # Delete precompiled/redundant and high-level combinatorial material first;
        # leave metric inequalities until last to expose the smallest surviving route.
        priority = {
            "cyclic_alternation_cut": 0 if args.route == "geometry" else 8,
            "distinct_circle_overlap": 1,
            "global_K4": 2,
            "no_all_apex_shell": 3,
            "exact_rich_profiles": 4,
            "squared_distance_equality_transport": 5,
            "same_shell_squared_superadditivity": 6,
            "positive_squared_distances": 7,
            "strict_kalmanson": 8 if args.route == "geometry" else 0,
        }
        order = sorted(all_indices, key=lambda i: (priority[entries[i]["family"]], i))
        for i in order:
            answer = check(active - {i})
            removed = answer == "unsat"
            if removed:
                active.remove(i)
            decisions.append({"core_position": i, "removed": removed, "status_without": answer})
        kept = [dict(core_position=i, **entries[i]) for i in sorted(active)]
        result.update(
            {
                "remaining_size": len(active),
                "remaining_family_counts": dict(sorted(Counter(e["family"] for e in kept).items())),
                "remaining": kept,
                "decisions": decisions,
            }
        )

    result.update({"checks": checks, "unknown": unknown, "elapsed_seconds": time.monotonic() - started})
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({k: result[k] for k in result if k not in {"remaining", "decisions"}}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
