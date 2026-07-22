#!/usr/bin/env python3
"""Deterministically export one distinct-radius aggregate orbit to DIMACS."""

from __future__ import annotations

import argparse
import hashlib
import json
import time
from pathlib import Path

import z3

import surface


PIPELINE = (
    "simplify",
    "propagate-values",
    "elim-term-ite",
    "solve-eqs",
    "lia2card",
    "card2bv",
    "bit-blast",
    "tseitin-cnf",
)


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
            f"DIMACS clauses: header={expected_clauses}, actual={len(clauses)}"
        )
    for line_number, line in enumerate(clauses, start=1):
        values = [int(value) for value in line.split()]
        if not values or values[-1] != 0:
            raise AssertionError(f"unterminated clause {line_number}")
        if any(not 1 <= abs(value) <= variable_count for value in values[:-1]):
            raise AssertionError(f"literal out of range in clause {line_number}")
    return variable_count, expected_clauses


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--orientation", choices=("direct", "mirror"), required=True
    )
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument(
        "--disable-block",
        action="append",
        choices=tuple(sorted(surface.FULL_BLOCKS)),
        default=[],
        help="Diagnostic ablation only; may be repeated.",
    )
    parser.add_argument("--output-cnf", type=Path, required=True)
    parser.add_argument("--output-metadata", type=Path, required=True)
    args = parser.parse_args()
    orbit = {
        "direct": "asymmetricSourceLeft",
        "mirror": "asymmetricSourceRight",
    }[args.orientation]

    started = time.monotonic()
    enabled_blocks = surface.FULL_BLOCKS - frozenset(args.disable_block)
    outer, _rank, counts = surface.build(
        orbit, args.seed, enabled_blocks=enabled_blocks
    )
    built_elapsed = time.monotonic() - started
    goal = z3.Goal()
    goal.add(*outer.solver.assertions())
    transformed = z3.Then(*PIPELINE)(goal)
    if len(transformed) != 1:
        raise AssertionError(f"expected one CNF subgoal, got {len(transformed)}")
    dimacs = transformed[0].dimacs(include_names=True)
    variable_count, clause_count = validate_dimacs(dimacs)
    args.output_cnf.parent.mkdir(parents=True, exist_ok=True)
    args.output_cnf.write_text(dimacs, encoding="utf-8")

    base_path = (Path(surface.focus.B0) / "encode.py").resolve()
    focus_path = surface.FOCUS_PATH.resolve()
    metadata = {
        "schema": "p97-exact5-card13-distinct-aggregate-bitblast-v1",
        "epistemic_status": "SEMANTICS_PRESERVING_EXTERNAL_Z3_TACTIC_EXPORT",
        "orientation": args.orientation,
        "normalized_orbit": orbit,
        "seed": args.seed,
        "diagnostic_disabled_blocks": sorted(args.disable_block),
        "n": 13,
        "counts": counts,
        "cnf_variable_count": variable_count,
        "cnf_clause_count": clause_count,
        "dimacs_structure_check": "PASS",
        "formula_built_elapsed_seconds": built_elapsed,
        "total_elapsed_seconds": time.monotonic() - started,
        "cnf_path": str(args.output_cnf),
        "cnf_sha256": sha256(args.output_cnf),
        "surface_path": str(Path(surface.__file__).resolve()),
        "surface_sha256": sha256(Path(surface.__file__).resolve()),
        "encoder_path": str(Path(__file__).resolve()),
        "encoder_sha256": sha256(Path(__file__).resolve()),
        "base_outer_path": str(base_path),
        "base_outer_sha256": sha256(base_path),
        "focused_parent_path": str(focus_path),
        "focused_parent_sha256": sha256(focus_path),
        "tactic_pipeline": list(PIPELINE),
        "source_assumptions": [
            "carrier cardinality 13 and cap profile (5,6,5)",
            "one common cyclic boundary order up to reflection",
            "fixed critical row family and blocker map",
            "two independent global deletion-cover row families",
            "one asymmetric SourceTwoHitNormalForm spoke orbit",
            "complete exact-five second-apex class and unique K4 radius",
            "two disjoint complete exact-four first-apex classes",
            "the two first-apex strict-cap pairs partition all four strict points",
            "retained q-deleted first row equals the double-deletion class",
            "all selected witness digraphs are strongly connected",
            "selected/full-class equalities induce distance-rank equalities",
            "complete-class and unique-K4 exclusions induce rank inequalities",
            "one-term strict Kalmanson cancellation induces strict rank order",
        ],
        "not_encoded": [
            "full real-valued triangle inequalities",
            "rank-two Euclidean coordinates",
            "MEC equations and containment",
            "noM44 over all alternative support triangles",
            "minimality beyond selected-witness strong connectivity",
        ],
    }
    args.output_metadata.write_text(
        json.dumps(metadata, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(metadata, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
