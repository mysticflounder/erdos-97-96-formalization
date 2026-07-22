#!/usr/bin/env python3
"""Check one all-one ordinal DRAT proof and record the exact artifacts."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import time


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
        ["drat-trim", str(args.cnf), str(args.proof)],
        text=True,
        capture_output=True,
        check=False,
        timeout=args.timeout_seconds,
    )
    checker_output = completed.stdout + completed.stderr
    args.log.write_text(checker_output, encoding="utf-8")
    verified = completed.returncode == 0 and "s VERIFIED" in checker_output
    result = {
        "schema": "p97-exact5-card13-all-one-ordinal-drat-check-v1",
        "status": "DRAT_VERIFIED" if verified else "DRAT_CHECK_FAILED",
        "returncode": completed.returncode,
        "elapsed_seconds": time.monotonic() - started,
        "cnf_path": str(args.cnf),
        "cnf_sha256": sha256(args.cnf),
        "proof_path": str(args.proof),
        "proof_sha256": sha256(args.proof),
        "log_path": str(args.log),
        "log_sha256": sha256(args.log),
        "checker": "drat-trim",
        "not_a_lean_proof": True,
    }
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps(result, indent=2, sort_keys=True), flush=True)
    return 0 if verified else 1


if __name__ == "__main__":
    raise SystemExit(main())
