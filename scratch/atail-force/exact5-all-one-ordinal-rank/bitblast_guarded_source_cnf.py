#!/usr/bin/env python3
"""Export a source-assertion-guarded all-one CNF for core extraction.

Each source assertion is guarded by a named Boolean marker before Z3's
bit-blast.  The emitted DIMACS then receives one unit clause per marker.  A
DRAT-trim clause core can therefore be projected back to the exact source
assertion indices by retaining precisely the marker unit clauses that occur
in the core.
"""

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
    parser.add_argument("--output-cnf", type=Path, required=True)
    parser.add_argument("--output-map", type=Path, required=True)
    parser.add_argument(
        "--canonical-qw",
        action="store_true",
        help="Add q < w using the exact q/w automorphism of this projection.",
    )
    args = parser.parse_args()

    started = time.monotonic()
    outer, _rank, counts = ordinal.build(args.orbit, args.seed, 0)
    assertions = list(outer.solver.assertions())
    markers = [
        z3.Bool(f"source_assertion_{index:05d}")
        for index in range(len(assertions))
    ]
    goal = z3.Goal()
    goal.add(*(
        z3.Implies(marker, assertion)
        for marker, assertion in zip(markers, assertions, strict=True)
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
    _, _, raw_variable_count, raw_clause_count = raw_lines[header_index].split()
    variable_count = int(raw_variable_count)
    clause_count = int(raw_clause_count)
    marker_variables: dict[int, int] = {}
    marker_pattern = re.compile(r"c (\d+) source_assertion_(\d{5})$")
    for line in raw_lines:
        match = marker_pattern.fullmatch(line)
        if match:
            variable = int(match.group(1))
            source_index = int(match.group(2))
            marker_variables[source_index] = variable
    if set(marker_variables) != set(range(len(assertions))):
        missing = sorted(set(range(len(assertions))) - set(marker_variables))
        raise AssertionError(
            f"marker map incomplete: have {len(marker_variables)}, "
            f"missing prefix {missing[:20]}"
        )

    raw_lines[header_index] = (
        f"p cnf {variable_count} {clause_count + len(markers)}"
    )
    first_comment = next(
        (index for index, line in enumerate(raw_lines) if line.startswith("c ")),
        len(raw_lines),
    )
    units = [
        f"{marker_variables[index]} 0" for index in range(len(assertions))
    ]
    output_lines = raw_lines[:first_comment] + units + raw_lines[first_comment:]
    args.output_cnf.write_text("\n".join(output_lines) + "\n", encoding="utf-8")
    payload = {
        "schema": "p97-exact5-card13-all-one-guarded-source-cnf-v1",
        "epistemic_status": "SOURCE_INDEXED_EXTERNAL_Z3_TACTIC_EXPORT",
        "orbit": args.orbit,
        "seed": args.seed,
        "source_counts": counts,
        "source_assertion_count": len(assertions),
        "cnf_variable_count": variable_count,
        "cnf_clause_count_before_marker_units": clause_count,
        "cnf_clause_count": clause_count + len(markers),
        "marker_variables": {
            str(index): marker_variables[index] for index in range(len(assertions))
        },
        "source_assertions": [assertion.sexpr() for assertion in assertions],
        "canonical_qw": args.canonical_qw,
        "elapsed_seconds": time.monotonic() - started,
        "cnf_sha256": sha256(args.output_cnf),
        "not_a_formal_proof": True,
    }
    args.output_map.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        key: payload[key]
        for key in (
            "orbit", "source_assertion_count", "cnf_variable_count",
            "cnf_clause_count", "elapsed_seconds", "cnf_sha256",
        )
    }, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
