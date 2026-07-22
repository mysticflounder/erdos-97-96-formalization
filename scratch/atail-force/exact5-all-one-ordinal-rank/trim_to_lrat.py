#!/usr/bin/env python3
"""Trim a verified all-one DRAT proof to a core CNF and LRAT proof."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import time


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def dimacs_counts(path: Path) -> tuple[int, int]:
    for line in path.read_text(encoding="utf-8").splitlines():
        if line.startswith("p cnf "):
            _, _, variables, clauses = line.split()
            return int(variables), int(clauses)
    raise AssertionError(f"missing DIMACS header in {path}")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--proof", type=Path, required=True)
    parser.add_argument("--core", type=Path, required=True)
    parser.add_argument("--lrat", type=Path, required=True)
    parser.add_argument("--log", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=1200)
    args = parser.parse_args()

    started = time.monotonic()
    completed = subprocess.run(
        [
            "drat-trim",
            str(args.cnf),
            str(args.proof),
            "-c", str(args.core),
            "-L", str(args.lrat),
        ],
        text=True,
        capture_output=True,
        check=False,
        timeout=args.timeout_seconds,
    )
    checker_output = completed.stdout + completed.stderr
    args.log.write_text(checker_output, encoding="utf-8")
    verified = completed.returncode == 0 and "s VERIFIED" in checker_output
    required_outputs = (args.core, args.lrat)
    verified = verified and all(path.is_file() for path in required_outputs)

    original_variables, original_clauses = dimacs_counts(args.cnf)
    core_variables, core_clauses = dimacs_counts(args.core)
    artifacts = {}
    for name, path in (
        ("cnf", args.cnf),
        ("drat", args.proof),
        ("core_cnf", args.core),
        ("lrat", args.lrat),
        ("log", args.log),
    ):
        artifacts[name] = {
            "path": str(path),
            "bytes": path.stat().st_size,
            "sha256": sha256(path),
        }
    result = {
        "schema": "p97-exact5-card13-all-one-ordinal-trimmed-lrat-v1",
        "status": "DRAT_VERIFIED_LRAT_EMITTED" if verified else "TRIM_FAILED",
        "returncode": completed.returncode,
        "elapsed_seconds": time.monotonic() - started,
        "original_num_variables": original_variables,
        "original_num_clauses": original_clauses,
        "core_num_variables": core_variables,
        "core_num_clauses": core_clauses,
        "lrat_independently_checked": False,
        "lrat_checker_note": (
            "drat-trim emitted LRAT while verifying the source DRAT; "
            "kernel replay is still required"
        ),
        "artifacts": artifacts,
    }
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps(result, indent=2, sort_keys=True), flush=True)
    return 0 if verified else 1


if __name__ == "__main__":
    raise SystemExit(main())
