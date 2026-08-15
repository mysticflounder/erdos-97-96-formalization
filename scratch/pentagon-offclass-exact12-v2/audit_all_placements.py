#!/usr/bin/env python3
"""Diagnostic sweep of every ordered (deleted, v) placement.

Unlike probe.py, this does not stop at the first SAT placement and does not
produce promotion artifacts.  It answers whether the frozen exact-12
abstraction itself forces the two roles onto the endpoints of the second cap.
"""

from __future__ import annotations

import json
import subprocess
from itertools import permutations
from pathlib import Path

import probe


HERE = Path(__file__).resolve().parent
OUTPUT = HERE / "all-placement-audit.json"


def solve(instance: probe.CoverInstance) -> tuple[str, int]:
    dimacs = [f"p cnf {instance.cnf.n_variables} {len(instance.cnf.clauses)}"]
    dimacs.extend(
        " ".join(map(str, clause)) + " 0" for clause in instance.cnf.clauses
    )
    completed = subprocess.run(
        ["cadical", "-q", "-t", "30"],
        input="\n".join(dimacs) + "\n",
        capture_output=True,
        text=True,
        timeout=45,
        check=False,
    )
    if completed.returncode == 10:
        return "SAT", completed.returncode
    if completed.returncode == 20:
        return "UNSAT", completed.returncode
    return "UNKNOWN", completed.returncode


def main() -> int:
    rows = []
    for deleted, v in permutations(probe.OUTSIDE_O2_INTERIOR, 2):
        model, instance, _blockers, _metadata = probe.build_case(deleted, v)
        status, returncode = solve(instance)
        second_cap = model.caps[1]
        second_interior = frozenset(model.interiors[1])
        endpoints = second_cap - second_interior
        rows.append(
            {
                "deleted": deleted,
                "v": v,
                "status": status,
                "returncode": returncode,
                "deleted_is_endpoint": deleted in endpoints,
                "v_is_endpoint": v in endpoints,
                "both_are_endpoints": {deleted, v} == endpoints,
            }
        )

    counts = {
        status: sum(row["status"] == status for row in rows)
        for status in ("SAT", "UNSAT", "UNKNOWN")
    }
    sat_rows = [row for row in rows if row["status"] == "SAT"]
    result = {
        "schema": "p97_pentagon_offclass_exact12_all_placement_audit.v1",
        "scope": "diagnostic only; no proof artifacts",
        "placements_total": len(rows),
        "status_counts": counts,
        "all_sat_placements_are_exact_endpoints": all(
            row["both_are_endpoints"] for row in sat_rows
        ),
        "sat_placements": sat_rows,
        "placements": rows,
    }
    OUTPUT.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "placements_total": result["placements_total"],
        "status_counts": result["status_counts"],
        "all_sat_placements_are_exact_endpoints": (
            result["all_sat_placements_are_exact_endpoints"]
        ),
        "sat_exact_endpoint_count": sum(
            row["both_are_endpoints"] for row in sat_rows
        ),
        "sat_nonendpoint_count": sum(
            not row["both_are_endpoints"] for row in sat_rows
        ),
    }, indent=2, sort_keys=True))
    return 0 if counts["UNKNOWN"] == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
