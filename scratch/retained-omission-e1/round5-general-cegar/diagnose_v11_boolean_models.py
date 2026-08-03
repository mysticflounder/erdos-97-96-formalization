#!/usr/bin/env python3
"""Classify saved v11 Boolean models against the v9 power-cut miner."""

from __future__ import annotations

import concurrent.futures
import gzip
import json
import re
import time
from pathlib import Path

import z3

import round5_cegar_v9 as v9


ROOT = Path(
    "artifacts-v11/20260802T093313.097282Z-retry-pid99343"
)
CASE_ID = re.compile(
    r"^(fresh|paired|secondcap_collision|secondcap_distinct)_"
    r"([SD]{3})_k(\d+)_d(\d+)(?:_f(\d+))?$"
)


def classify(path_text: str) -> dict[str, object]:
    path = Path(path_text)
    match = CASE_ID.match(path.parent.name)
    if match is None:
        return {"case": path.parent.name, "error": "bad_case_id"}
    arm, profiles, kept, deleted, fresh = match.groups()
    case = v9.Case(
        arm,
        profiles,
        int(kept),
        int(deleted),
        None if fresh is None else int(fresh),
    )
    with gzip.open(path, "rt", encoding="utf-8") as handle:
        smt = handle.read().replace("\n(check-sat)\n", "\n")
    solver = z3.Solver()
    solver.set(timeout=30_000, random_seed=97)
    solver.add(z3.parse_smt2_string(smt))
    started = time.monotonic()
    outcome = solver.check()
    check_seconds = time.monotonic() - started
    if outcome != z3.sat:
        return {
            "case": case.case_id,
            "check": str(outcome),
            "check_s": round(check_seconds, 3),
        }
    encoding = v9.Encoding(case, timeout_ms=30_000, seed=97)
    budget = v9.PowerSearchBudget(time.monotonic() + 120.0, 2_000_000)
    scan_started = time.monotonic()
    try:
        found = v9.mine_power_cut(encoding, solver.model(), budget)
        return {
            "case": case.case_id,
            "check": "sat",
            "check_s": round(check_seconds, 3),
            "scan": "cut" if found is not None else "no_cut",
            "scan_s": round(time.monotonic() - scan_started, 3),
            "candidates": budget.candidates_checked,
        }
    except v9.PowerBudgetExhausted as exception:
        return {
            "case": case.case_id,
            "check": "sat",
            "check_s": round(check_seconds, 3),
            "scan": "budget",
            "reason": str(exception),
            "scan_s": round(time.monotonic() - scan_started, 3),
            "candidates": budget.candidates_checked,
        }


def main() -> None:
    paths = sorted(str(path) for path in ROOT.glob("*/boolean_encoding.smt2.gz"))
    started = time.monotonic()
    with concurrent.futures.ProcessPoolExecutor(max_workers=8) as pool:
        rows = list(pool.map(classify, paths))
    summary: dict[str, int] = {}
    for row in rows:
        key = str((row.get("check"), row.get("scan")))
        summary[key] = summary.get(key, 0) + 1
    print(
        json.dumps(
            {
                "count": len(rows),
                "elapsed_s": round(time.monotonic() - started, 3),
                "summary": summary,
            },
            sort_keys=True,
        )
    )
    for row in rows:
        print(json.dumps(row, sort_keys=True))


if __name__ == "__main__":
    main()
