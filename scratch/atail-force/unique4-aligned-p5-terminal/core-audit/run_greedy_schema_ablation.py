#!/usr/bin/env python3
"""Greedily shrink the Kalmanson schema bank on the stripped aligned-p5 CNF.

The order is fixed and the search is bounded to one deletion attempt per
schema.  This finds one inclusion-minimal bank relative to that order; it does
not enumerate all minimal banks and it is not a Lean proof.
"""

from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
RUNNER = HERE / "run_family_ablation.py"
OUTPUT_DIR = HERE / "runs"
BASE_OMISSIONS = (
    "aligned_pair+pair_minimality+single_minimality+curvature+"
    "seeded_kalmanson+bank_planar+bank_u5+critical_system"
)


def result_path(mode: str) -> Path:
    return OUTPUT_DIR / f"omit-{BASE_OMISSIONS}-{mode}.json"


def main() -> int:
    dropped: list[int] = []
    attempts: list[dict[str, object]] = []
    for candidate in (0, 2, 3, 4, 5, 6, 7, 8, 9):
        proposed = sorted([*dropped, candidate])
        mode = "drop-" + ",".join(map(str, proposed))
        command = [
            sys.executable,
            str(RUNNER),
            "--family",
            BASE_OMISSIONS,
            "--kalmanson-mode",
            mode,
            "--timeout-seconds",
            "180",
        ]
        subprocess.run(command, check=True, stdout=subprocess.DEVNULL)
        result = json.loads(result_path(mode).read_text())
        status = result["solver_status"]
        attempts.append(
            {
                "candidate": candidate,
                "proposed_dropped": proposed,
                "solver_status": status,
                "solver_elapsed_seconds": result["solver_elapsed_seconds"],
                "kept_clause_count": result["kept_clause_count"],
                "cnf_sha256": result["cnf_sha256"],
            }
        )
        if status == "UNSAT":
            dropped = proposed
        elif status != "SAT":
            break

    kept = [index for index in range(10) if index not in dropped]
    payload = {
        "schema": "p97-aligned-p5-greedy-kalmanson-bank-ablation-v1",
        "epistemic_status": "EXACT WITHIN THE STRIPPED FINITE CNF PROJECTION",
        "deletion_order": [0, 2, 3, 4, 5, 6, 7, 8, 9],
        "permanently_kept_schema": 1,
        "base_omissions": BASE_OMISSIONS.split("+"),
        "attempts": attempts,
        "final_dropped_schema_indices": dropped,
        "final_kept_schema_indices": kept,
        "minimality_scope": (
            "Greedy inclusion-minimal relative to the recorded deletion order; "
            "not a complete enumeration of minimal schema banks."
        ),
        "claim_limit": (
            "The result concerns only the generated fixed-n=11 CNF and is not "
            "a source-to-CNF proof or Lean theorem."
        ),
    }
    (HERE / "greedy_schema_ablation.json").write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps(payload, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
