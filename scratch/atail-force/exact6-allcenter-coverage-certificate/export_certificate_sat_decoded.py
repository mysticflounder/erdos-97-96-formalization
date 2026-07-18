#!/usr/bin/env python3
"""Export one replayed SAT certificate result to the active oracle interface."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from orbit_census import decode, parse_assignment, parse_clauses


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--result", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    result = json.loads(args.result.read_text(encoding="utf-8"))
    if result.get("verdict") != "SAT_CANDIDATE" or result.get("profile") != "n14":
        raise ValueError("result is not an n14 SAT candidate")
    base = args.result.parent
    artifacts = result["artifacts"]
    paths = {name: base / record["path"] for name, record in artifacts.items()}
    for name, path in paths.items():
        if sha256(path) != artifacts[name]["sha256"]:
            raise ValueError(f"{name} digest mismatch")
    manifest = json.loads(paths["manifest"].read_text(encoding="utf-8"))
    variables = manifest["variables"]
    solver_output = paths["solver_output"].read_text(encoding="utf-8")
    assignment = parse_assignment(solver_output, int(manifest["num_variables"]))
    for index, clause in enumerate(parse_clauses(paths["cnf"].read_bytes()), start=1):
        if not any(assignment[abs(literal)] == (literal > 0) for literal in clause):
            raise ValueError(f"SAT assignment fails clause {index}")
    decoded = decode(variables, assignment)
    payload = {
        "schema": "p97-exact6-allcenter-active-decoded-export-v1",
        "epistemic_status": "FINITE_STRUCTURAL_SAT_MODEL_FOR_ACTIVE_ORACLE_INPUT",
        "orbit": result["orbit"],
        "source_cnf_sha256": manifest["cnf_sha256"],
        "decoded": decoded,
        "python_adapter": {
            "rows": "{int(k): tuple(v) for k, v in decoded['rows'].items()}",
            "blockers": "tuple(decoded['blockers'])",
            "shell": "tuple(decoded['shell'])",
            "roles": "dict(decoded['roles'])",
        },
        "live_closure": False,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": "CERTIFICATE_SAT_DECODED_EXPORT_WRITTEN",
        "orbit": result["orbit"],
        "output": str(args.output),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
