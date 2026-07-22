#!/usr/bin/env python3
"""Rebuild and export one projected all-one source core without guards."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import time

import z3

import all_one_ordinal_rank as ordinal


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--core", type=Path, required=True)
    parser.add_argument("--seed", type=int, default=17)
    parser.add_argument("--output-cnf", type=Path, required=True)
    parser.add_argument("--output-metadata", type=Path, required=True)
    args = parser.parse_args()

    saved = json.loads(args.core.read_text(encoding="utf-8"))
    outer, _rank, counts = ordinal.build(saved["orbit"], args.seed, 0)
    assertions = list(outer.solver.assertions())
    selected: list[z3.BoolRef] = []
    indices: list[int] = []
    for item in saved["core"]:
        index = int(item["index"])
        assertion = assertions[index]
        if assertion.sexpr() != item["assertion"]:
            raise AssertionError(f"source assertion drift at {index}")
        indices.append(index)
        selected.append(assertion)

    started = time.monotonic()
    goal = z3.Goal()
    goal.add(*selected)
    pipeline = z3.Then(
        "simplify",
        "propagate-values",
        "elim-term-ite",
        "solve-eqs",
        "lia2card",
        "card2bv",
        "bit-blast",
        "tseitin-cnf",
    )
    transformed = pipeline(goal)
    if len(transformed) != 1:
        raise AssertionError(f"expected one CNF subgoal, got {len(transformed)}")
    dimacs = transformed[0].dimacs(include_names=True)
    lines = dimacs.splitlines()
    header = next(line for line in lines if line.startswith("p cnf "))
    _, _, raw_variables, raw_clauses = header.split()
    variable_count = int(raw_variables)
    clause_count = int(raw_clauses)
    actual_clauses = sum(
        bool(line) and line[0] not in {"c", "p"} for line in lines
    )
    if actual_clauses != clause_count:
        raise AssertionError(
            f"DIMACS clause mismatch: header={clause_count}, actual={actual_clauses}"
        )
    args.output_cnf.write_text(dimacs, encoding="utf-8")
    payload = {
        "schema": "p97-exact5-card13-all-one-source-subset-cnf-v1",
        "epistemic_status": "SOURCE_SUBSET_EXTERNAL_Z3_TACTIC_EXPORT",
        "orbit": saved["orbit"],
        "seed": args.seed,
        "source_counts": counts,
        "source_core_path": str(args.core),
        "source_core_sha256": sha256(args.core),
        "source_core_size": len(indices),
        "source_indices": indices,
        "cnf_variable_count": variable_count,
        "cnf_clause_count": clause_count,
        "elapsed_seconds": time.monotonic() - started,
        "cnf_sha256": sha256(args.output_cnf),
        "not_a_formal_proof": True,
    }
    args.output_metadata.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "orbit": payload["orbit"],
        "source_core_size": payload["source_core_size"],
        "cnf_variable_count": variable_count,
        "cnf_clause_count": clause_count,
        "cnf_sha256": payload["cnf_sha256"],
    }, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
