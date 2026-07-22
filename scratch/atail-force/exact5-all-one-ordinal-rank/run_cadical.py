#!/usr/bin/env python3
"""Run CaDiCaL on one all-one ordinal CNF with durable status logging."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import time


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--proof", type=Path)
    parser.add_argument("--log", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--seconds", type=int, default=600)
    parser.add_argument(
        "--default-options",
        action="store_true",
        help="Keep CaDiCaL preprocessing instead of passing --plain.",
    )
    parser.add_argument(
        "--cadical-option",
        action="append",
        default=[],
        help=(
            "Additional CaDiCaL option; repeat as needed and use "
            "--cadical-option=--name=value for values beginning with '--'."
        ),
    )
    parser.add_argument(
        "--search-only",
        action="store_true",
        help="Run without a proof output; useful for a seed portfolio.",
    )
    args = parser.parse_args()

    if not args.search_only and args.proof is None:
        parser.error("--proof is required unless --search-only is set")
    if args.search_only and args.proof is not None:
        parser.error("--proof and --search-only are mutually exclusive")

    started = time.monotonic()
    command = ["cadical"]
    if not args.default_options:
        command.append("--plain")
    command.extend(args.cadical_option)
    command.extend(["-t", str(args.seconds), str(args.cnf)])
    if args.proof is not None:
        command.append(str(args.proof))
    # Stream the solver transcript to disk.  Long exact-five runs can then be
    # inspected while active instead of leaving progress unknowable until the
    # subprocess returns.
    with args.log.open("w", encoding="utf-8") as log_handle:
        completed = subprocess.run(
            command,
            text=True,
            stdout=log_handle,
            stderr=subprocess.STDOUT,
            check=False,
            timeout=args.seconds + 90,
        )
    status = {10: "SAT", 20: "UNSAT"}.get(completed.returncode, "UNKNOWN")
    result = {
        "schema": "p97-exact5-card13-all-one-ordinal-cadical-v1",
        "status": status,
        "returncode": completed.returncode,
        "seconds": args.seconds,
        "cadical_options": {
            "base": "default" if args.default_options else "plain",
            "extra": args.cadical_option,
        },
        "elapsed_seconds": time.monotonic() - started,
        "cnf_sha256": sha256(args.cnf),
        "search_only": args.search_only,
        "proof_exists": args.proof is not None and args.proof.exists(),
        "proof_size_bytes": (
            args.proof.stat().st_size
            if args.proof is not None and args.proof.exists() else None
        ),
        "proof_sha256": (
            sha256(args.proof)
            if args.proof is not None and args.proof.exists() else None
        ),
        "log_sha256": sha256(args.log),
        "epistemic_status": (
            "EXTERNAL_CADICAL_AWAITING_PROOF_CHECK"
            if status == "UNSAT" and args.proof is not None
            else "EXTERNAL_SEARCH_ONLY_VERDICT"
            if args.search_only
            else "EXTERNAL_SOLVER_VERDICT"
        ),
    }
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps(result, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
