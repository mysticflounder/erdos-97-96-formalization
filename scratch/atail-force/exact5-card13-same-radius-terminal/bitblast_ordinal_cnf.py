#!/usr/bin/env python3
"""Export the asymmetric exact-five card-13 ordinal rank surface to DIMACS."""

from __future__ import annotations

import argparse
import hashlib
import inspect
import json
import time
from pathlib import Path

import z3

import asymmetric_ordinal_rank as ordinal


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def validate_dimacs(dimacs: str) -> tuple[int, int]:
    """Check header counts and the literal range before invoking a solver."""
    lines = dimacs.splitlines()
    header = next(line for line in lines if line.startswith("p cnf "))
    _, _, raw_variables, raw_clauses = header.split()
    variable_count = int(raw_variables)
    expected_clauses = int(raw_clauses)
    clauses = [line for line in lines if line and line[0] not in {"c", "p"}]
    if len(clauses) != expected_clauses:
        raise AssertionError(
            f"DIMACS clause mismatch: header={expected_clauses}, actual={len(clauses)}"
        )
    for line_number, line in enumerate(clauses, start=1):
        values = [int(value) for value in line.split()]
        if not values or values[-1] != 0:
            raise AssertionError(f"unterminated DIMACS clause {line_number}")
        if any(not 1 <= abs(value) <= variable_count for value in values[:-1]):
            raise AssertionError(f"literal out of range in DIMACS clause {line_number}")
    return variable_count, expected_clauses


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--orientation",
        choices=("direct", "mirror"),
        required=True,
        help="Direct is asymmetricSourceLeft; mirror is its reflected orbit.",
    )
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--output-cnf", type=Path, required=True)
    parser.add_argument("--output-metadata", type=Path, required=True)
    args = parser.parse_args()
    orbit = {
        "direct": "asymmetricSourceLeft",
        "mirror": "asymmetricSourceRight",
    }[args.orientation]

    started = time.monotonic()
    _outer, _rank, counts = ordinal.build(orbit, args.seed)
    goal = z3.Goal()
    goal.add(*_outer.solver.assertions())
    formula_built_elapsed = time.monotonic() - started
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
        "schema": "p97-exact5-card13-asymmetric-same-ordinal-bitblast-v1",
        "epistemic_status": "SEMANTICS_PRESERVING_EXTERNAL_Z3_TACTIC_EXPORT",
        "orientation": args.orientation,
        "normalized_orbit": orbit,
        "seed": args.seed,
        "n": 13,
        "counts": counts,
        "cnf_variable_count": variable_count,
        "cnf_clause_count": clause_count,
        "dimacs_structure_check": "PASS",
        "formula_built_elapsed_seconds": formula_built_elapsed,
        "total_elapsed_seconds": time.monotonic() - started,
        "cnf_path": str(args.output_cnf),
        "cnf_sha256": sha256(args.output_cnf),
        "encoder_path": str(Path(__file__).resolve()),
        "encoder_sha256": sha256(Path(__file__).resolve()),
        "surface_path": str(Path(ordinal.__file__).resolve()),
        "surface_sha256": sha256(Path(ordinal.__file__).resolve()),
        "base_outer_path": str(Path(inspect.getsourcefile(
            ordinal.runner.gate.BaseOuter
        )).resolve()),
        "base_outer_sha256": sha256(Path(inspect.getsourcefile(
            ordinal.runner.gate.BaseOuter
        )).resolve()),
        "tactic_pipeline": [
            "simplify",
            "propagate-values",
            "elim-term-ite",
            "solve-eqs",
            "lia2card",
            "card2bv",
            "bit-blast",
            "tseitin-cnf",
        ],
        "source_assumptions": [
            "cardinality profile is exactly (5,6,5)",
            "labels 0..12 are one common cyclic boundary order up to reflection",
            "the two reflected asymmetric source orbits are exhaustive",
            "fixed critical and global-cover row tables satisfy the base encoder",
            "same-radius first-apex class has six points and covers the four strict points",
            "selected-row and exact-five-shell equalities induce distance-rank equalities",
            "one-term cancellation in each strict Kalmanson inequality induces strict rank order",
        ],
        "not_encoded": [
            "retained parent q-deleted rows",
            "full real-valued triangle inequalities",
            "nonlinear Euclidean coordinates",
            "MEC equations or noM44",
        ],
    }
    args.output_metadata.write_text(
        json.dumps(metadata, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps(metadata, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
