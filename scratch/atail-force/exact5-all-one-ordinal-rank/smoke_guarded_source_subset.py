#!/usr/bin/env python3
"""Deterministic structural smoke test for the guarded-subset exporter."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile

import z3

import all_one_ordinal_rank as ordinal
from bitblast_guarded_source_subset_cnf import (
    dimacs_clauses,
    export_guarded_subset,
)


ORBIT = "allOneHitHubMiddle"
SEED = 17
SOURCE_INDICES = (0, 1, 2, 3, 4, 5, 6, 7)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    outer, _rank, counts = ordinal.build(ORBIT, SEED, 0)
    assertions = list(outer.solver.assertions())
    selected = [assertions[index] for index in SOURCE_INDICES]
    source_solver = z3.Solver()
    source_solver.add(*selected)
    source_status = source_solver.check()
    if source_status != z3.sat:
        raise AssertionError(f"smoke source subset should be SAT, got {source_status}")

    with tempfile.TemporaryDirectory(prefix="p97-guarded-subset-smoke-") as raw_dir:
        directory = Path(raw_dir)
        core_path = directory / "smoke.source-core.json"
        cnf_path = directory / "smoke.guarded.cnf"
        map_path = directory / "smoke.guarded.map.json"
        projected_path = directory / "smoke.projected-source-core.json"
        core_path.write_text(
            json.dumps({
                "schema": "p97-exact5-card13-all-one-source-core-smoke-v1",
                "orbit": ORBIT,
                "source_counts": counts,
                "core_size": len(SOURCE_INDICES),
                "core": [
                    {"index": index, "assertion": assertions[index].sexpr()}
                    for index in SOURCE_INDICES
                ],
                "canonical_qw": False,
                "not_a_formal_proof": True,
            }, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )

        payload = export_guarded_subset(
            core_path=core_path,
            seed=SEED,
            output_cnf=cnf_path,
            output_map=map_path,
        )
        loaded = json.loads(map_path.read_text(encoding="utf-8"))
        if loaded != payload:
            raise AssertionError("returned payload differs from saved marker map")
        if loaded["selected_source_indices"] != list(SOURCE_INDICES):
            raise AssertionError("selected source indices drifted")
        if loaded["cnf_sha256"] != sha256(cnf_path):
            raise AssertionError("CNF hash mismatch")
        marker_sources = loaded["marker_sources"]
        if len(marker_sources) != len(SOURCE_INDICES):
            raise AssertionError("incomplete marker/source map")
        if [item["position"] for item in marker_sources] != list(range(len(SOURCE_INDICES))):
            raise AssertionError("marker positions are not contiguous")
        if [item["source_index"] for item in marker_sources] != list(SOURCE_INDICES):
            raise AssertionError("marker/source association drifted")
        variables = [item["marker_variable"] for item in marker_sources]
        if len(set(variables)) != len(variables):
            raise AssertionError("marker variables are not one-to-one")

        cnf_lines = cnf_path.read_text(encoding="utf-8").splitlines()
        clauses = dimacs_clauses(cnf_lines)
        for variable in variables:
            if sum(clause == (variable,) for clause in clauses) != 1:
                raise AssertionError(f"marker {variable} lacks its unique positive unit")
            if any(clause == (-variable,) for clause in clauses):
                raise AssertionError(f"marker {variable} has a negative unit")
            if not any(-variable in clause and len(clause) > 1 for clause in clauses):
                raise AssertionError(f"marker {variable} is not connected to a guard")

        projection = subprocess.run(
            [
                sys.executable,
                str(Path(__file__).with_name("extract_guarded_source_core.py")),
                "--map",
                str(map_path),
                "--core-cnf",
                str(cnf_path),
                "--output",
                str(projected_path),
            ],
            text=True,
            capture_output=True,
            check=False,
            timeout=30,
        )
        if projection.returncode != 0:
            raise AssertionError(
                "marker projection smoke failed:\n"
                f"{projection.stdout}{projection.stderr}"
            )
        projected = json.loads(projected_path.read_text(encoding="utf-8"))
        if [item["index"] for item in projected["core"]] != list(SOURCE_INDICES):
            raise AssertionError("projected marker/source indices drifted")

        completed = subprocess.run(
            ["cadical", "--quiet", str(cnf_path)],
            text=True,
            capture_output=True,
            check=False,
            timeout=30,
        )
        if completed.returncode != 10 or "s SATISFIABLE" not in completed.stdout:
            raise AssertionError(
                "CaDiCaL did not agree with the SAT source smoke subset: "
                f"returncode={completed.returncode}"
            )

        print(json.dumps({
            "status": "PASS",
            "orbit": ORBIT,
            "seed": SEED,
            "source_indices": SOURCE_INDICES,
            "source_status": str(source_status).upper(),
            "cadical_status": "SAT",
            "selected_assertion_count": loaded["selected_assertion_count"],
            "cnf_variable_count": loaded["cnf_variable_count"],
            "cnf_clause_count": loaded["cnf_clause_count"],
            "cnf_sha256": loaded["cnf_sha256"],
        }, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
