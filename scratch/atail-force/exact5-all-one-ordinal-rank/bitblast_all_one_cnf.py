#!/usr/bin/env python3
"""Export one exact-five all-one ordinal-rank orbit to DIMACS."""

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


def validate_dimacs(dimacs: str) -> tuple[int, int]:
    lines = dimacs.splitlines()
    header = next(line for line in lines if line.startswith("p cnf "))
    _, _, raw_variables, raw_clauses = header.split()
    variable_count = int(raw_variables)
    expected_clauses = int(raw_clauses)
    clauses = [line for line in lines if line and line[0] not in {"c", "p"}]
    if len(clauses) != expected_clauses:
        raise AssertionError(
            f"DIMACS clause mismatch: header={expected_clauses}, "
            f"actual={len(clauses)}"
        )
    for line_number, line in enumerate(clauses, start=1):
        values = [int(value) for value in line.split()]
        if not values or values[-1] != 0:
            raise AssertionError(f"unterminated DIMACS clause {line_number}")
        if any(not 1 <= abs(value) <= variable_count for value in values[:-1]):
            raise AssertionError(f"literal out of range in DIMACS clause {line_number}")
    return variable_count, expected_clauses


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=ordinal.ORBITS, required=True)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--output-cnf", type=Path, required=True)
    parser.add_argument("--output-metadata", type=Path, required=True)
    args = parser.parse_args()

    started = time.monotonic()
    outer, _rank, counts = ordinal.build(args.orbit, args.seed, 0)
    built = time.monotonic()
    goal = z3.Goal()
    goal.add(*outer.solver.assertions())
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
    variable_count, clause_count = validate_dimacs(dimacs)
    args.output_cnf.write_text(dimacs, encoding="utf-8")
    metadata = {
        "schema": "p97-exact5-card13-all-one-ordinal-bitblast-v1",
        "epistemic_status": "SEMANTICS_PRESERVING_EXTERNAL_Z3_TACTIC_EXPORT",
        "orbit": args.orbit,
        "seed": args.seed,
        "counts": counts,
        "cnf_variable_count": variable_count,
        "cnf_clause_count": clause_count,
        "formula_build_seconds": built - started,
        "total_seconds": time.monotonic() - started,
        "cnf_sha256": sha256(args.output_cnf),
        "tactic_pipeline": [
            "simplify", "propagate-values", "elim-term-ite", "solve-eqs",
            "lia2card", "card2bv", "bit-blast", "tseitin-cnf",
        ],
        "not_a_formal_proof": True,
    }
    args.output_metadata.write_text(
        json.dumps(metadata, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps(metadata, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
