#!/usr/bin/env python3
"""Produce an inclusion-minimal *family* UNSAT core for a round-5 case.

This is a diagnostic only: it reuses the source-faithful schema but does not
alter the production matrix or promote an external result to a Lean theorem.
Each retained family is reported so the next proof target can be stated in
the language of the live retained-matching endpoint branch.
"""

from __future__ import annotations

import argparse
import json
import time
from dataclasses import asdict
from pathlib import Path

import z3

from round5_cegar import Case, Encoding, SCRIPT_SHA256, write_json


def check_groups(encoding: Encoding, groups: list[str], timeout_ms: int) -> tuple[str, float]:
    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    solver.set(random_seed=97)
    solver.set(threads=1)
    for family in groups:
        solver.add(*encoding.groups[family])
    started = time.monotonic()
    outcome = solver.check()
    elapsed = time.monotonic() - started
    if outcome == z3.unsat:
        return "unsat", elapsed
    if outcome == z3.sat:
        return "sat", elapsed
    return "unknown", elapsed


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--arm", required=True, choices=("secondcap_collision", "secondcap_distinct"))
    parser.add_argument("--profiles", required=True)
    parser.add_argument("--kept", required=True, type=int)
    parser.add_argument("--deleted", required=True, type=int)
    parser.add_argument("--fresh", required=True, type=int)
    parser.add_argument("--timeout-ms", type=int, default=60000)
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()

    case = Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
    encoding = Encoding(case, timeout_ms=args.timeout_ms, seed=97)
    families = sorted(encoding.groups)
    initial_status, initial_elapsed = check_groups(encoding, families, args.timeout_ms)
    report: dict[str, object] = {
        "case": asdict(case),
        "script_sha256": SCRIPT_SHA256,
        "timeout_ms": args.timeout_ms,
        "initial": {"status": initial_status, "elapsed_seconds": initial_elapsed},
        "all_families": families,
        "family_constraint_counts": encoding.constraint_counts(),
        "removal_attempts": [],
    }
    if initial_status != "unsat":
        report["final"] = {"status": initial_status, "families": families}
        write_json(args.out, report)
        return 2

    retained = families[:]
    for family in families:
        trial = [item for item in retained if item != family]
        status, elapsed = check_groups(encoding, trial, args.timeout_ms)
        report["removal_attempts"].append(
            {"removed": family, "status": status, "elapsed_seconds": elapsed}
        )
        if status == "unsat":
            retained = trial
    final_status, final_elapsed = check_groups(encoding, retained, args.timeout_ms)
    report["final"] = {
        "status": final_status,
        "elapsed_seconds": final_elapsed,
        "families": retained,
        "inclusion_minimal_under_greedy_order": final_status == "unsat",
    }
    write_json(args.out, report)
    return 0 if final_status == "unsat" else 3


if __name__ == "__main__":
    raise SystemExit(main())
