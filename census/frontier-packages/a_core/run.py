"""CLI driving the A-core Layer-1 incidence runs (spec section 5, updated for
the v1.2 / CEGAR-iteration-2 families in section 9).

Runs, in order:
  1. base            -- section 1-2 + section 9 base families, minus (DEL2)/(DEL3)
  2. base+P           -- base + (DEL2) + (DEL3)              [THE package verdict]
  3. base+P+A2 .. A8   -- base+P + each leaf delta
  4. base+A1          -- base (no DEL2/DEL3) + the A1 extension (gamma, w_s
                          atoms, gamma cap atoms, (E8d), (E5a/E5b))

Writes out/<run>.cnf (DIMACS), out/<run>.model.json (decoded atoms, SAT runs
only), out/manifest.json (summary of every run).

Run from the repo root:
  uv run python census/frontier-packages/a_core/run.py
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

LEAVES = ("A2", "A3", "A6", "A7", "A8")


def run_one(
    encoder: "enc.ACoreEncoder",
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
    encoder = enc.ACoreEncoder()

    manifest: list[dict[str, Any]] = []

    # 1. base
    base_record = run_one(encoder, "base", list(encoder.base_clauses), [], args.timeout_seconds)
    manifest.append(base_record)

    # (DEL3, v1.2) built here: strictly after 'base' has already been run
    # (so base's reported n_variables excludes DEL3's Sinz aux vars) and
    # before base+P/leaf runs are built (they need it in extra_clauses).
    # 𝔓-only, same placement mechanics as (DEL2); NOT in base, NOT in
    # base+A1 -- see encoding.py::build_del3_clauses docstring.
    del3_extra = encoder.build_del3_clauses()

    # 2. base+P  (= base + DEL2 + DEL3 -- see encoding.py / RESULTS.md for
    # why P2,P3 contribute no further NEW clauses beyond DEL2/DEL3)
    base_p_extra = list(encoder.del2_clauses) + list(del3_extra)
    base_p_record = run_one(
        encoder, "base+P", list(encoder.base_clauses), base_p_extra, args.timeout_seconds
    )
    manifest.append(base_p_record)

    # 3. base+P+A<k>
    for leaf in LEAVES:
        extra = (
            list(encoder.del2_clauses) + list(del3_extra) + encoder.leaf_delta_clauses(leaf)
        )
        record = run_one(
            encoder, f"base+P+{leaf}", list(encoder.base_clauses), extra, args.timeout_seconds
        )
        manifest.append(record)

    # 4. base+A1  (built last: mutates encoder.cnf past base_clauses)
    a1_extra = encoder.build_a1_extension()
    a1_record = run_one(
        encoder, "base+A1", list(encoder.base_clauses), a1_extra, args.timeout_seconds
    )
    manifest.append(a1_record)

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
