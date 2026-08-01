#!/usr/bin/env python3
"""Rebuild, independently verify, and checkpoint the encode-only milestone."""

from __future__ import annotations

import datetime
import hashlib
import json
import subprocess
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
ARTIFACTS = HERE / "artifacts"
ARMS = (
    ("delete_interior_w_survives_at_q_blocker", "delete-w"),
    ("delete_interior_q_survives_at_w_blocker", "delete-q"),
)
SOURCE_PATHS = (
    ROOT / "lean/Erdos9796Proof/P97/ATail/FirstApexUniqueRadiusResidual.lean",
    ROOT / "scratch/atail-force/unique5-distinct-hybrid-terminal/"
           "UniqueFiveDistinctPhysicalSecondApexSplit.lean",
    ROOT / "scratch/atail-force/unique-arm-whole-carrier-source-audit/"
           "exact_four_outer.py",
    ROOT / "scratch/atail-force/unique-arm-whole-carrier-source-audit/"
           "verify_exact_four_outer.py",
    HERE / "encode_exact5_distinct.py",
    HERE / "verify_exact5_distinct.py",
)


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(command: list[str]) -> str:
    completed = subprocess.run(
        command, cwd=ROOT, text=True, capture_output=True, check=False
    )
    if completed.returncode:
        raise RuntimeError(
            f"command failed ({completed.returncode}): {' '.join(command)}\n"
            f"{completed.stdout}\n{completed.stderr}"
        )
    return completed.stdout.strip()


def main() -> int:
    ARTIFACTS.mkdir(parents=True, exist_ok=True)
    records: list[dict[str, object]] = []
    commands: list[list[str]] = []
    for arm, stem in ARMS:
        cnf = ARTIFACTS / f"{stem}.cnf"
        result_path = ARTIFACTS / f"{stem}.result.json"
        encode_command = [
            sys.executable, str(HERE / "encode_exact5_distinct.py"),
            "--arm", arm, "--cnf", str(cnf.relative_to(ROOT)),
            "--result", str(result_path.relative_to(ROOT)),
        ]
        verify_command = [
            sys.executable, str(HERE / "verify_exact5_distinct.py"),
            "--cnf", str(cnf.relative_to(ROOT)),
            "--result", str(result_path.relative_to(ROOT)),
        ]
        commands.extend((encode_command, verify_command))
        run(encode_command)
        verification = json.loads(run(verify_command))
        result = json.loads(result_path.read_text(encoding="utf-8"))
        records.append({
            "arm": arm,
            "cnf": str(cnf.relative_to(ROOT)),
            "result": str(result_path.relative_to(ROOT)),
            "variables": result["variable_count"],
            "clauses": result["clause_count"],
            "cnf_sha256": result["cnf_sha256"],
            "verification": verification,
        })

    timestamp = datetime.datetime.now(datetime.UTC).isoformat()
    provenance = {
        "schema": "p97-card11-exact5-distinct-provenance-v1",
        "created_utc": timestamp,
        "python": sys.version,
        "working_directory": str(ROOT),
        "commands": commands,
        "source_sha256": {
            str(path.relative_to(ROOT)): sha(path) for path in SOURCE_PATHS
        },
        "scope": {
            "source_leaf":
                "Problem97.FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual",
            "original_d3_opp1_card": 5,
            "downstream_swapped_exact_four_opp1_card": 4,
            "downstream_swapped_stage_encoded": False,
            "cap_pair_orbit": "FULL_ORDERED_ROLE_ORBIT_NO_SYMMETRY_QUOTIENT",
        },
    }
    provenance_path = ARTIFACTS / "provenance.json"
    provenance_path.write_text(
        json.dumps(provenance, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    checkpoint = {
        "schema": "p97-card11-exact5-distinct-encode-checkpoint-v1",
        "created_utc": timestamp,
        "milestone": "ENCODE_ONLY_INITIAL_CNFS_INDEPENDENTLY_VERIFIED",
        "solver_status": "NOT_RUN_ENCODE_ONLY",
        "solver_run_count": 0,
        "epistemic_status":
            "validated finite projection; no source-to-model theorem and no Lean closure",
        "provenance": str(provenance_path.relative_to(ROOT)),
        "provenance_sha256": sha(provenance_path),
        "arms": records,
    }
    checkpoint_path = ARTIFACTS / "checkpoint.json"
    checkpoint_path.write_text(
        json.dumps(checkpoint, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "milestone": checkpoint["milestone"],
        "arms": [{
            "arm": record["arm"],
            "variables": record["variables"],
            "clauses": record["clauses"],
            "sha256": record["cnf_sha256"],
        } for record in records],
        "checkpoint": str(checkpoint_path.relative_to(ROOT)),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
