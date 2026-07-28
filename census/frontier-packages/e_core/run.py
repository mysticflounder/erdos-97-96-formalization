"""CLI driving the E-core Layer-1 runs (spec section 4).

Runs, in order:
  1. base       -- sections 1-3 in full (THE package verdict run; E has one
                    leaf, no leaf deltas/context block unlike A-core).
  2. base+dom1  -- base + unit dom1 (arm-isolation run)
  3. base+dom2  -- base + unit dom2 (arm-isolation run)

Writes out/<run>.cnf (DIMACS), out/<run>.model.json (decoded atoms, SAT runs
only), out/manifest.json (summary of every run).

Run from the repo root:
  uv run python census/frontier-packages/e_core/run.py
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parent))
import encoding as enc  # noqa: E402

OUT_DIR = Path(__file__).resolve().parent / "out"


def run_one(
    encoder: "enc.EEncoder",
    name: str,
    base_clauses: list[tuple[int, ...]],
    extra_clauses: list[tuple[int, ...]],
    timeout_seconds: int,
) -> dict[str, Any]:
    instance = enc.RunInstance(encoder, base_clauses)
    cnf_path = OUT_DIR / f"{name}.cnf"
    proof_path = OUT_DIR / f"{name}.drat"
    all_clauses = tuple(base_clauses) + tuple(extra_clauses)
    n_vars = encoder.cnf.n_variables
    for clause in all_clauses:
        for lit in clause:
            n_vars = max(n_vars, abs(lit))
    start = time.monotonic()
    result = enc.solve_cadical(
        instance,
        cnf_path,
        extra_clauses=extra_clauses,
        timeout_seconds=timeout_seconds,
        proof_path=proof_path,
    )
    wall_seconds = time.monotonic() - start

    record: dict[str, Any] = {
        "run": name,
        "verdict": result.verdict,
        "n_variables": n_vars,
        "n_clauses": len(all_clauses),
        "wall_seconds": round(wall_seconds, 3),
        "cnf_file": str(cnf_path.relative_to(OUT_DIR.parent)),
        "proof_verified": result.proof_verified,
    }
    if result.verdict == "SAT" and result.cube is not None:
        model_path = OUT_DIR / f"{name}.model.json"
        model_path.write_text(
            json.dumps(result.cube, sort_keys=True, indent=2), encoding="utf-8"
        )
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parent))
        record["model_true_atoms"] = sorted(
            atom_name for atom_name, value in result.cube.items() if value
        )
    if wall_seconds > 60:
        record["TIMEOUT_CONCERN"] = True
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    args = parser.parse_args()

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = enc.EEncoder()

    manifest: list[dict[str, Any]] = []

    # 1. base
    base_record = run_one(encoder, "base", list(encoder.base_clauses), [], args.timeout_seconds)
    manifest.append(base_record)

    # 2/3. base+dom1, base+dom2 (arm-isolation runs)
    for arm in ("dom1", "dom2"):
        extra = encoder.dom_unit_clause(arm)
        record = run_one(
            encoder, f"base+{arm}", list(encoder.base_clauses), extra, args.timeout_seconds
        )
        manifest.append(record)

    manifest_path = OUT_DIR / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, sort_keys=True, indent=2), encoding="utf-8")

    for record in manifest:
        print(
            f"{record['run']:14s} {record['verdict']:8s} "
            f"vars={record['n_variables']:5d} clauses={record['n_clauses']:6d} "
            f"wall={record['wall_seconds']:.3f}s"
        )
    print(f"manifest -> {manifest_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
