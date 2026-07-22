#!/usr/bin/env python3
"""Check one emitted DRAT proof and preserve a verification manifest."""

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
        ["drat-trim", str(args.cnf), str(args.proof)],
        text=True,
        capture_output=True,
        check=False,
        timeout=args.timeout_seconds,
    )
    args.log.write_text(completed.stdout + completed.stderr, encoding="utf-8")
    verified = completed.returncode == 0 and "s VERIFIED" in completed.stdout
    result = {
        "schema": "p97-exact5-card13-asymmetric-same-drat-check-v1",
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
    }
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0 if verified else 1


if __name__ == "__main__":
    raise SystemExit(main())
