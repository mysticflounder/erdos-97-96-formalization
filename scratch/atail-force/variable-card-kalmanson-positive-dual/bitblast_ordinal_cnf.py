#!/usr/bin/env python3
"""Bit-blast the integrated exact-six quotient-ordinal decision to DIMACS.

This is a solver-engine adapter for ``integrated_ordinal_cycle_decision.py``.
It applies only semantics-preserving Z3 tactics to the finite Boolean,
bounded-integer, and 7-bit-rank formula.  The resulting propositional CNF is
intended for CaDiCaL.  No learned or literal membership-schema cuts are added.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
ORDINAL_PATH = HERE / "integrated_ordinal_cycle_decision.py"


def load_ordinal_module():
    spec = importlib.util.spec_from_file_location("integrated_ordinal_for_cnf", ORDINAL_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load integrated ordinal decision")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    ordinal = load_ordinal_module()
    outer_module = ordinal.load_outer_module()
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orbit", choices=outer_module.ORBITS, required=True)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--output-cnf", type=Path, required=True)
    parser.add_argument("--output-metadata", type=Path, required=True)
    args = parser.parse_args()

    started = time.monotonic()
    outer = outer_module.Outer(args.orbit, 0, args.seed, "z3")
    connectivity_count = ordinal.add_strong_connectivity(outer, outer_module.N)
    _rank, ordinal_counts = ordinal.add_ordinal_rank_surface(outer_module, outer)
    goal = z3.Goal()
    goal.add(*outer.solver.assertions())
    assertion_count = len(goal)
    formula_built_elapsed = time.monotonic() - started

    # ``lia2card`` consumes the explicitly bounded role/blocker integers;
    # ``card2bv`` and ``bit-blast`` then leave a purely propositional goal.
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
    cnf_goal = transformed[0]
    dimacs = cnf_goal.dimacs(include_names=True)
    args.output_cnf.write_text(dimacs, encoding="utf-8")
    elapsed = time.monotonic() - started

    header = next(line for line in dimacs.splitlines() if line.startswith("p cnf "))
    _, _, variable_count, clause_count = header.split()
    metadata = {
        "schema": "p97-exact6-integrated-ordinal-bitblast-v1",
        "epistemic_status": "SEMANTICS_PRESERVING_EXTERNAL_Z3_TACTIC_EXPORT",
        "orbit": args.orbit,
        "seed": args.seed,
        "n": outer_module.N,
        "source_assertion_count": assertion_count,
        "connectivity_clause_count": connectivity_count,
        "ordinal_counts": ordinal_counts,
        "cnf_variable_count": int(variable_count),
        "cnf_clause_count": int(clause_count),
        "formula_built_elapsed_seconds": formula_built_elapsed,
        "total_elapsed_seconds": elapsed,
        "literal_metric_schema_cuts": 0,
        "outer_source": str(ordinal.OUTER_PATH),
        "outer_source_sha256": sha256(ordinal.OUTER_PATH),
        "ordinal_source": str(ORDINAL_PATH),
        "ordinal_source_sha256": sha256(ORDINAL_PATH),
        "cnf_path": str(args.output_cnf),
        "cnf_sha256": sha256(args.output_cnf),
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
    }
    args.output_metadata.write_text(
        json.dumps(metadata, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps(metadata, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
