#!/usr/bin/env python3
"""Run and replay the deterministic structural CNF for every exact-six orbit."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import tempfile
from pathlib import Path

from encode import ORBITS, PHYSICAL_CAP, build_payload


def parse_clauses(dimacs: bytes) -> list[tuple[int, ...]]:
    clauses: list[tuple[int, ...]] = []
    for line in dimacs.decode("ascii").splitlines():
        if not line or line.startswith(("c", "p")):
            continue
        values = tuple(map(int, line.split()))
        if not values or values[-1] != 0:
            raise ValueError("malformed generated DIMACS")
        clauses.append(values[:-1])
    return clauses


def parse_assignment(output: str, num_variables: int) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in output.splitlines():
        if not line.startswith("v "):
            continue
        for token in line.split()[1:]:
            literal = int(token)
            if literal:
                assignment[abs(literal)] = literal > 0
    if sorted(assignment) != list(range(1, num_variables + 1)):
        raise ValueError("CaDiCaL emitted an incomplete assignment")
    return assignment


def decode(variables: dict[str, int], assignment: dict[int, bool]) -> dict[str, object]:
    rows = {
        str(center): [
            point for point in range(14)
            if assignment[variables[f"member_{center}_{point}"]]
        ]
        for center in range(14)
    }
    shell = [point for point in range(14) if assignment[variables[f"shell_{point}"]]]
    roles = {
        role: next(
            point for point in range(14)
            if assignment[variables[f"role_{role}_{point}"]]
        )
        for role in ("first", "second", "source", "target", "unused")
    }
    blockers = [
        next(
            center for center in range(14)
            if assignment[variables[f"blocker_{source}_{center}"]]
        )
        for source in range(14)
    ]
    if roles["unused"] not in PHYSICAL_CAP or roles["unused"] in shell:
        raise ValueError("decoded assignment violates unused-source correction")
    return {"rows": rows, "shell": shell, "roles": roles, "blockers": blockers}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=300)
    args = parser.parse_args()
    results: list[dict[str, object]] = []
    for orbit in ORBITS:
        dimacs, manifest = build_payload("n14", orbit)
        clauses = parse_clauses(dimacs)
        with tempfile.TemporaryDirectory(prefix=f"p97-exact6-{orbit}-") as temp_string:
            cnf_path = Path(temp_string) / "outer.cnf"
            cnf_path.write_bytes(dimacs)
            solved = subprocess.run(
                ["cadical", "-t", str(args.timeout_seconds), str(cnf_path)],
                capture_output=True,
                text=True,
                timeout=args.timeout_seconds + 30,
                check=False,
            )
        solver_output = solved.stdout + solved.stderr
        if solved.returncode != 10:
            results.append({
                "orbit": orbit,
                "status": "UNSAT_UNCERTIFIED" if solved.returncode == 20 else "UNKNOWN",
                "returncode": solved.returncode,
                "cnf_sha256": manifest["cnf_sha256"],
                "num_variables": manifest["num_variables"],
                "num_clauses": manifest["num_clauses"],
                "solver_output_sha256": hashlib.sha256(solver_output.encode()).hexdigest(),
            })
            continue
        assignment = parse_assignment(solver_output, int(manifest["num_variables"]))
        for index, clause in enumerate(clauses, start=1):
            if not any(assignment[abs(literal)] == (literal > 0) for literal in clause):
                raise ValueError(f"{orbit}: model fails clause {index}")
        variables = manifest["variables"]
        results.append({
            "orbit": orbit,
            "status": "SAT_ASSIGNMENT_REPLAYED",
            "returncode": solved.returncode,
            "cnf_sha256": manifest["cnf_sha256"],
            "num_variables": manifest["num_variables"],
            "num_clauses": manifest["num_clauses"],
            "transported_application_count":
                manifest["transported_schema_bank"]["transported_application_count"],
            "true_variables": sorted(
                name for name, variable in variables.items() if assignment[variable]
            ),
            "decoded": decode(variables, assignment),
            "solver_output_sha256": hashlib.sha256(solver_output.encode()).hexdigest(),
        })
        print(json.dumps({"orbit": orbit, "status": "SAT_ASSIGNMENT_REPLAYED"}))
    payload = {
        "schema": "p97-exact6-allcenter-structural-orbit-census-v1",
        "epistemic_status": "EXHAUSTIVE_SEVEN_ORBIT_EXACT_SAT_WITHIN_FINITE_STRUCTURAL_ENCODING",
        "source_audit_correction": "unused source is in the closed physical cap",
        "all_orbits_sat": all(row["status"] == "SAT_ASSIGNMENT_REPLAYED" for row in results),
        "result_count": len(results),
        "results": results,
        "live_closure": False,
        "scope_warning": (
            "These assignments satisfy the finite structural outer only. They do not provide "
            "abstract-distance, exact-radius, Euclidean, MEC, noM44, or live Lean models."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": "CENSUS_COMPLETE",
        "all_orbits_sat": payload["all_orbits_sat"],
        "output": str(args.output),
    }, sort_keys=True))
    return 0 if payload["all_orbits_sat"] else 2


if __name__ == "__main__":
    raise SystemExit(main())
