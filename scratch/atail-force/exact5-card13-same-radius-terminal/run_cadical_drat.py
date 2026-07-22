#!/usr/bin/env python3
"""Run CaDiCaL with a DRAT proof and write a replay manifest."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import time
from pathlib import Path


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--proof", type=Path, required=True)
    parser.add_argument("--log", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=600)
    args = parser.parse_args()

    started = time.monotonic()
    completed = subprocess.run(
        [
            "cadical",
            "--plain",
            "-t",
            str(args.timeout_seconds),
            str(args.cnf),
            str(args.proof),
        ],
        text=True,
        capture_output=True,
        check=False,
        timeout=args.timeout_seconds + 60,
    )
    args.log.write_text(completed.stdout + completed.stderr, encoding="utf-8")
    status = {10: "SAT", 20: "UNSAT"}.get(completed.returncode, "UNKNOWN")
    result = {
        "schema": "p97-exact5-card13-asymmetric-same-cadical-drat-v1",
        "epistemic_status": "EXTERNAL_CADICAL_AWAITING_DRAT_CHECK"
            if status == "UNSAT" else "EXTERNAL_SOLVER_VERDICT",
        "status": status,
        "cadical_returncode": completed.returncode,
        "timeout_seconds": args.timeout_seconds,
        "elapsed_seconds": time.monotonic() - started,
        "cnf_path": str(args.cnf),
        "cnf_sha256": sha256(args.cnf),
        "proof_path": str(args.proof),
        "proof_sha256": sha256(args.proof) if args.proof.exists() else None,
        "proof_size_bytes": args.proof.stat().st_size if args.proof.exists() else None,
        "log_path": str(args.log),
        "log_sha256": sha256(args.log),
        "solver": "CaDiCaL --plain",
    }
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
