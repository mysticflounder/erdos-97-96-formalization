#!/usr/bin/env python3
"""Export a grouped source-guard CNF for hierarchical core extraction."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import time

import z3

import all_one_ordinal_rank as ordinal


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=ordinal.ORBITS, required=True)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--group-size", type=int, default=64)
    parser.add_argument("--output-cnf", type=Path, required=True)
    parser.add_argument("--output-map", type=Path, required=True)
    parser.add_argument(
        "--canonical-qw",
        action="store_true",
        help="Add q < w using the exact q/w automorphism of this projection.",
    )
    args = parser.parse_args()
    if args.group_size <= 0:
        raise ValueError("group size must be positive")

    started = time.monotonic()
    outer, _rank, counts = ordinal.build(args.orbit, args.seed, 0)
    assertions = list(outer.solver.assertions())
    groups = [
        list(range(start, min(start + args.group_size, len(assertions))))
        for start in range(0, len(assertions), args.group_size)
    ]
    markers = [z3.Bool(f"source_group_{index:04d}") for index in range(len(groups))]
    goal = z3.Goal()
    goal.add(*(
        z3.Implies(markers[index // args.group_size], assertion)
        for index, assertion in enumerate(assertions)
    ))
    if args.canonical_qw:
        goal.add(outer.q < outer.w)
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
    raw_lines = transformed[0].dimacs(include_names=True).splitlines()
    header_index = next(
        index for index, line in enumerate(raw_lines) if line.startswith("p cnf ")
    )
    _, _, raw_variables, raw_clauses = raw_lines[header_index].split()
    variable_count = int(raw_variables)
    clause_count = int(raw_clauses)
    marker_pattern = re.compile(r"c (\d+) source_group_(\d{4})$")
    marker_variables: dict[int, int] = {}
    for line in raw_lines:
        match = marker_pattern.fullmatch(line)
        if match:
            marker_variables[int(match.group(2))] = int(match.group(1))
    if set(marker_variables) != set(range(len(groups))):
        missing = sorted(set(range(len(groups))) - set(marker_variables))
        raise AssertionError(
            f"group marker map incomplete: have {len(marker_variables)}, "
            f"missing prefix {missing[:20]}"
        )

    raw_lines[header_index] = (
        f"p cnf {variable_count} {clause_count + len(groups)}"
    )
    first_comment = next(
        (index for index, line in enumerate(raw_lines) if line.startswith("c ")),
        len(raw_lines),
    )
    units = [f"{marker_variables[index]} 0" for index in range(len(groups))]
    output_lines = raw_lines[:first_comment] + units + raw_lines[first_comment:]
    args.output_cnf.write_text("\n".join(output_lines) + "\n", encoding="utf-8")
    payload = {
        "schema": "p97-exact5-card13-all-one-grouped-source-cnf-v1",
        "epistemic_status": "GROUPED_SOURCE_INDEXED_EXTERNAL_Z3_TACTIC_EXPORT",
        "orbit": args.orbit,
        "seed": args.seed,
        "source_counts": counts,
        "source_assertion_count": len(assertions),
        "group_size": args.group_size,
        "groups": {str(index): group for index, group in enumerate(groups)},
        "marker_variables": {
            str(index): marker_variables[index] for index in range(len(groups))
        },
        "source_assertions": [assertion.sexpr() for assertion in assertions],
        "canonical_qw": args.canonical_qw,
        "cnf_variable_count": variable_count,
        "cnf_clause_count_before_marker_units": clause_count,
        "cnf_clause_count": clause_count + len(groups),
        "elapsed_seconds": time.monotonic() - started,
        "cnf_sha256": sha256(args.output_cnf),
        "not_a_formal_proof": True,
    }
    args.output_map.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "orbit": args.orbit,
        "source_assertion_count": len(assertions),
        "group_count": len(groups),
        "cnf_variable_count": variable_count,
        "cnf_clause_count": clause_count + len(groups),
        "elapsed_seconds": payload["elapsed_seconds"],
        "cnf_sha256": payload["cnf_sha256"],
    }, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
