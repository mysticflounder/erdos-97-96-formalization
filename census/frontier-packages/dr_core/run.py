"""Run the three official 60-second D-R incidence-shadow variants."""

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


def run_one(encoder: enc.DREncoder, name: str, timeout: int) -> dict[str, Any]:
    clauses = encoder.clauses_for(name)
    instance = enc.RunInstance(encoder, clauses)
    cnf_path = OUT_DIR / f"{name}.cnf"
    proof_path = OUT_DIR / f"{name}.drat"
    start = time.monotonic()
    result = enc.solve_cadical(
        instance, cnf_path, timeout_seconds=timeout, proof_path=proof_path
    )
    elapsed = time.monotonic() - start
    record: dict[str, Any] = {
        "run": name,
        "verdict": result.verdict,
        "scope": "named-local incidence shadow only",
        "n_variables": encoder.cnf.n_variables,
        "n_clauses": len(clauses),
        "wall_seconds": round(elapsed, 3),
        "proof_verified": result.proof_verified,
        "cnf_file": str(cnf_path.relative_to(OUT_DIR.parent)),
    }
    if result.verdict == "SAT" and result.cube is not None:
        model_path = OUT_DIR / f"{name}.model.json"
        model_path.write_text(
            json.dumps(result.cube, sort_keys=True, indent=2), encoding="utf-8"
        )
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parent))
        record["interpretation"] = "incidence-shadow evidence only; not a geometric model"
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    args = parser.parse_args()
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = enc.DREncoder()
    records = [
        run_one(encoder, name, args.timeout_seconds)
        for name in ("dr-common", "dr-d1", "dr-d2")
    ]
    manifest = {
        "timeout_seconds": args.timeout_seconds,
        "tag_clause_counts": encoder.tags,
        "runs": records,
    }
    (OUT_DIR / "manifest.json").write_text(
        json.dumps(manifest, sort_keys=True, indent=2), encoding="utf-8"
    )
    for record in records:
        print(
            f"{record['run']:10s} {record['verdict']:7s} "
            f"vars={record['n_variables']} clauses={record['n_clauses']} "
            f"wall={record['wall_seconds']:.3f}s"
        )
    return 0 if all(record["verdict"] in {"SAT", "UNSAT"} for record in records) else 1


if __name__ == "__main__":
    raise SystemExit(main())
