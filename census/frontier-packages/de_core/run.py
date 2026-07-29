"""Run the four official named-local D-E diagnostic CNFs."""

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


def run_one(encoder: enc.DEEncoder, name: str, timeout_seconds: int) -> dict[str, Any]:
    clauses = encoder.clauses_for(name)
    instance = enc.RunInstance(encoder, clauses)
    cnf_path = OUT_DIR / f"{name}.cnf"
    proof_path = OUT_DIR / f"{name}.drat"
    start = time.monotonic()
    result = enc.solve_cadical(
        instance,
        cnf_path,
        timeout_seconds=timeout_seconds,
        proof_path=proof_path,
    )
    clause_map_path = OUT_DIR / f"{name}.clauses.json"
    clause_map_path.write_text(
        json.dumps(encoder.clause_map(clauses), sort_keys=True, indent=2),
        encoding="utf-8",
    )
    wall = time.monotonic() - start
    record: dict[str, Any] = {
        "run": name,
        "verdict": result.verdict,
        "scope": "named-local diagnostic projection; not theorem-complete",
        "carrier_domain": "open; only carrierCard_ge(10), no exact n",
        "n_variables": encoder.cnf.n_variables,
        "n_clauses": len(clauses),
        "tag_counts": encoder.tag_counts(clauses),
        "wall_seconds": round(wall, 3),
        "cnf_file": str(cnf_path.relative_to(OUT_DIR.parent)),
        "clause_map_file": str(clause_map_path.relative_to(OUT_DIR.parent)),
        "proof_verified": result.proof_verified,
    }
    if result.verdict == "SAT" and result.cube is not None:
        model_path = OUT_DIR / f"{name}.model.json"
        model_path.write_text(
            json.dumps(result.cube, sort_keys=True, indent=2), encoding="utf-8"
        )
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parent))
        record["model_checked"] = True
        record["model_true_atoms"] = sorted(k for k, v in result.cube.items() if v)
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    args = parser.parse_args()
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = enc.DEEncoder()
    manifest = [run_one(encoder, name, args.timeout_seconds) for name in encoder.RUNS]
    (OUT_DIR / "manifest.json").write_text(
        json.dumps(manifest, sort_keys=True, indent=2), encoding="utf-8"
    )
    for row in manifest:
        print(
            f"{row['run']:10s} {row['verdict']:7s} "
            f"vars={row['n_variables']:4d} clauses={row['n_clauses']:4d} "
            f"wall={row['wall_seconds']:.3f}s"
        )
    print(f"manifest -> {OUT_DIR / 'manifest.json'}")
    return 0 if all(row["verdict"] in {"SAT", "UNSAT"} for row in manifest) else 1


if __name__ == "__main__":
    raise SystemExit(main())
