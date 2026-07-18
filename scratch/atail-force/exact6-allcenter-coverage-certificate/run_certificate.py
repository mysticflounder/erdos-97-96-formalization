#!/usr/bin/env python3
"""Generate one deterministic CNF and obtain a checked solver artifact."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
from pathlib import Path

from encode import ORBITS, build_payload


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--profile", choices=("smoke", "n14"), required=True)
    parser.add_argument("--orbit", choices=ORBITS)
    parser.add_argument("--prefix", type=Path, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=600)
    parser.add_argument("--learned-bank", type=Path)
    parser.add_argument("--learned-max-vertices", type=int, default=8)
    args = parser.parse_args()
    if args.profile == "smoke" and args.orbit is not None:
        parser.error("smoke profile has no orbit")
    if args.profile == "n14" and args.orbit is None:
        parser.error("n14 profile requires --orbit")

    if args.profile == "smoke" and args.learned_bank is not None:
        parser.error("smoke profile does not accept --learned-bank")
    dimacs, manifest = build_payload(
        args.profile, args.orbit, args.learned_bank, args.learned_max_vertices
    )
    args.prefix.parent.mkdir(parents=True, exist_ok=True)
    cnf_path = args.prefix.with_suffix(".cnf")
    manifest_path = args.prefix.with_suffix(".manifest.json")
    drat_path = args.prefix.with_suffix(".drat")
    core_path = args.prefix.with_suffix(".core.cnf")
    lrat_path = args.prefix.with_suffix(".lrat")
    solver_path = args.prefix.with_suffix(".solver.txt")
    result_path = args.prefix.with_suffix(".result.json")
    cnf_path.write_bytes(dimacs)
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")

    solved = subprocess.run(
        [
            "cadical",
            "-t",
            str(args.timeout_seconds),
            str(cnf_path),
            str(drat_path),
        ],
        capture_output=True,
        text=True,
        timeout=args.timeout_seconds + 30,
        check=False,
    )
    solver_text = "\n".join(
        line.rstrip() for line in (solved.stdout + solved.stderr).splitlines()
    ) + "\n"
    solver_path.write_text(solver_text, encoding="utf-8")
    if solved.returncode == 10:
        verdict = "SAT_CANDIDATE"
    elif solved.returncode == 20:
        verdict = "UNSAT_UNCHECKED"
    else:
        verdict = "UNKNOWN"

    proof_check: dict[str, object] | None = None
    if verdict == "UNSAT_UNCHECKED":
        checked = subprocess.run(
            [
                "drat-trim",
                str(cnf_path),
                str(drat_path),
                "-c",
                str(core_path),
                "-L",
                str(lrat_path),
            ],
            capture_output=True,
            text=True,
            timeout=args.timeout_seconds + 30,
            check=False,
        )
        checker_text = checked.stdout + checked.stderr
        verified = checked.returncode == 0 and any(
            line.strip() == "s VERIFIED" for line in checker_text.splitlines()
        )
        proof_check = {
            "checker": "drat-trim",
            "returncode": checked.returncode,
            "verified": verified,
            "output": checker_text,
        }
        verdict = "UNSAT_DRAT_VERIFIED" if verified else "UNSAT_DRAT_REJECTED"

    artifacts: dict[str, dict[str, object]] = {}
    for name, path in (
        ("cnf", cnf_path),
        ("manifest", manifest_path),
        ("solver_output", solver_path),
        ("drat", drat_path),
        ("core", core_path),
        ("lrat", lrat_path),
    ):
        # CaDiCaL may leave a non-proof trace at the requested proof path on
        # SAT.  Never publish or hash it as a DRAT artifact.
        if name in {"drat", "core", "lrat"} and verdict != "UNSAT_DRAT_VERIFIED":
            continue
        if path.is_file():
            artifacts[name] = {
                "path": path.name,
                "bytes": path.stat().st_size,
                "sha256": sha256(path),
            }
    result = {
        "schema": "p97-exact6-allcenter-coverage-result-v1",
        "epistemic_status": "FINITE_STRUCTURAL_VERDICT_NOT_LIVE_LEAN_CLOSURE",
        "profile": args.profile,
        "orbit": args.orbit,
        "verdict": verdict,
        "solver": {
            "name": "cadical",
            "returncode": solved.returncode,
            "timeout_seconds": args.timeout_seconds,
        },
        "proof_check": proof_check,
        "artifacts": artifacts,
        "live_closure": False,
    }
    result_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": verdict,
        "profile": args.profile,
        "orbit": args.orbit,
        "variables": manifest["num_variables"],
        "clauses": manifest["num_clauses"],
        "result": str(result_path),
    }, sort_keys=True))
    return 0 if verdict in {"SAT_CANDIDATE", "UNSAT_DRAT_VERIFIED"} else 2


if __name__ == "__main__":
    raise SystemExit(main())
