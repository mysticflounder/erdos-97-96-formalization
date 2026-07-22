#!/usr/bin/env python3
"""Run bounded CaDiCaL and save a checked SAT/UNSAT/UNKNOWN artifact."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import time
from pathlib import Path


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def parse_dimacs(path: Path) -> tuple[int, list[list[int]]]:
    variable_count = 0
    clauses: list[list[int]] = []
    with path.open(encoding="utf-8") as stream:
        for line in stream:
            if not line or line[0] == "c":
                continue
            if line.startswith("p cnf "):
                variable_count = int(line.split()[2])
                continue
            values = [int(value) for value in line.split()]
            if values:
                if values[-1] != 0:
                    raise AssertionError("unterminated DIMACS clause")
                clauses.append(values[:-1])
    return variable_count, clauses


def parse_model(output: str) -> dict[int, bool]:
    model: dict[int, bool] = {}
    for line in output.splitlines():
        if not line.startswith("v "):
            continue
        for raw in line.split()[1:]:
            literal = int(raw)
            if literal:
                model[abs(literal)] = literal > 0
    return model


def verify_model(cnf: Path, output: str) -> tuple[bool, str]:
    variable_count, clauses = parse_dimacs(cnf)
    model = parse_model(output)
    if len(model) < variable_count:
        return False, f"model assigns {len(model)}/{variable_count} variables"
    for index, clause in enumerate(clauses, start=1):
        if not any(model[abs(literal)] == (literal > 0) for literal in clause):
            return False, f"clause {index} is false"
    return True, f"all {len(clauses)} clauses satisfied"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--proof", type=Path, required=True)
    parser.add_argument("--log", type=Path, required=True)
    parser.add_argument("--drat-log", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=60)
    args = parser.parse_args()

    started = time.monotonic()
    timed_out = False
    try:
        completed = subprocess.run(
            [
                "cadical", "--plain", "-t", str(args.timeout_seconds),
                str(args.cnf), str(args.proof),
            ],
            text=True,
            capture_output=True,
            check=False,
            timeout=args.timeout_seconds + 15,
        )
        output = completed.stdout + completed.stderr
        returncode = completed.returncode
    except subprocess.TimeoutExpired as error:
        timed_out = True
        stdout = error.stdout.decode() if isinstance(error.stdout, bytes) else error.stdout
        stderr = error.stderr.decode() if isinstance(error.stderr, bytes) else error.stderr
        output = (stdout or "") + (stderr or "")
        returncode = None
    args.log.write_text(output, encoding="utf-8")
    status = "UNKNOWN" if timed_out else {10: "SAT", 20: "UNSAT"}.get(
        returncode, "UNKNOWN"
    )

    model_check = None
    drat_check = None
    if status == "SAT":
        ok, detail = verify_model(args.cnf, output)
        model_check = {"status": "PASS" if ok else "FAIL", "detail": detail}
    elif status == "UNSAT":
        replay = subprocess.run(
            ["drat-trim", str(args.cnf), str(args.proof)],
            text=True,
            capture_output=True,
            check=False,
            timeout=max(60, args.timeout_seconds),
        )
        replay_output = replay.stdout + replay.stderr
        args.drat_log.write_text(replay_output, encoding="utf-8")
        verified = replay.returncode == 0 and "s VERIFIED" in replay.stdout
        drat_check = {
            "status": "PASS" if verified else "FAIL",
            "returncode": replay.returncode,
            "log_path": str(args.drat_log),
            "log_sha256": sha256(args.drat_log),
        }

    result = {
        "schema": "p97-exact5-card13-distinct-aggregate-cadical-v1",
        "status": status,
        "epistemic_status": (
            "EXTERNAL_CNF_VERDICT_ENCODING_MAP_NOT_KERNEL_CHECKED"
        ),
        "cadical_returncode": returncode,
        "timed_out": timed_out,
        "timeout_seconds": args.timeout_seconds,
        "elapsed_seconds": time.monotonic() - started,
        "cnf_path": str(args.cnf),
        "cnf_sha256": sha256(args.cnf),
        "proof_path": str(args.proof),
        "proof_sha256": sha256(args.proof) if args.proof.exists() else None,
        "proof_size_bytes": args.proof.stat().st_size if args.proof.exists() else None,
        "log_path": str(args.log),
        "log_sha256": sha256(args.log),
        "sat_model_check": model_check,
        "drat_check": drat_check,
    }
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(result, indent=2, sort_keys=True))
    if status == "SAT" and model_check and model_check["status"] != "PASS":
        return 1
    if status == "UNSAT" and drat_check and drat_check["status"] != "PASS":
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
