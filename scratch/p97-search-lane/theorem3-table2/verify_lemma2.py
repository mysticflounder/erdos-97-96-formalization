#!/usr/bin/env python3
"""Direct finite Lemma-2 verifier below alpha+beta=20.

This does not consume Table 2.  It asks directly whether a matrix can avoid
the candidate source P1--P4 transcription while every row and column has at
least three 1s.  Source P3 includes R2 and its transpose; P4 includes only the
two printed simultaneous-reversal variants, never auxiliary B_col.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from itertools import combinations
from pathlib import Path
from typing import Sequence

from verify_table2 import (
    CNF,
    cell_var,
    check_drat,
    direct_pattern_hits,
    matrix_from_assignment,
    parse_assignment,
    pattern_occurrences,
    run_solver,
)


def add_at_least_three(
    cnf: CNF, variables: Sequence[int], tag: str
) -> None:
    """Prime positive-clause encoding of sum(variables) >= 3.

    Every subset of n-2 variables must contain a true variable.  This uses no
    auxiliary variables and is equivalent to forbidding n-2 or more false
    inputs.
    """

    if len(variables) < 3:
        cnf.add((), tag)
        return
    for subset in combinations(variables, len(variables) - 2):
        cnf.add(subset, tag)


def make_degree_three_cnf(alpha: int, beta: int) -> CNF:
    cnf = CNF.with_semantic_vars(alpha * beta)
    for tag, cells in pattern_occurrences(alpha, beta):
        cnf.add((-cell_var(beta, r, c) for r, c in sorted(cells)), tag)
    for r in range(alpha):
        add_at_least_three(
            cnf,
            tuple(cell_var(beta, r, c) for c in range(beta)),
            "ROW-DEG>=3",
        )
    for c in range(beta):
        add_at_least_three(
            cnf,
            tuple(cell_var(beta, r, c) for r in range(alpha)),
            "COL-DEG>=3",
        )
    return cnf


def write_cnf(cnf: CNF, path: Path) -> str:
    return cnf.write(path)


def degree_check(matrix: Sequence[Sequence[int]]) -> dict:
    row_degrees = [sum(row) for row in matrix]
    column_degrees = [
        sum(matrix[r][c] for r in range(len(matrix)))
        for c in range(len(matrix[0]))
    ]
    return {
        "row_degrees": row_degrees,
        "column_degrees": column_degrees,
        "all_at_least_three": min(row_degrees + column_degrees) >= 3,
    }


def verify_case(
    root: Path, alpha: int, beta: int, timeout_s: int
) -> dict:
    case_dir = root / f"a{alpha}-b{beta}"
    case_dir.mkdir(parents=True, exist_ok=True)
    cnf = make_degree_three_cnf(alpha, beta)
    cnf_path = case_dir / "lemma2.cnf"
    proof_path = case_dir / "lemma2.drat"
    result = {
        "alpha": alpha,
        "beta": beta,
        "predicate": "candidate-source-P1-P2-full-P3-source-P4-no-B_col",
        "degree_condition": "every-row-and-column-degree>=3",
        "vars": cnf.nvars,
        "clauses": len(cnf.clauses),
        "clause_tags": cnf.tags,
        "cnf_sha256": write_cnf(cnf, cnf_path),
    }
    run = run_solver(cnf_path, proof_path, timeout_s)
    (case_dir / "solver.log").write_text(run.pop("stdout") + run.pop("stderr"))
    result["solver"] = run
    if run["verdict"] == "UNSAT":
        drat = check_drat(cnf_path, proof_path, timeout_s)
        (case_dir / "drat.check").write_text(drat.pop("output"))
        result["drat"] = drat
        result["status"] = (
            "CERTIFIED-UNSAT-CANDIDATE-TRANSCRIPTION"
            if drat["verified"]
            else "UNSAT-UNCHECKED"
        )
    elif run["verdict"] == "SAT":
        assignment = parse_assignment((case_dir / "solver.log").read_text())
        matrix = matrix_from_assignment(alpha, beta, assignment)
        hits = direct_pattern_hits(matrix)
        degrees = degree_check(matrix)
        (case_dir / "model.txt").write_text(
            "\n".join("".join(map(str, row)) for row in matrix) + "\n"
        )
        result["model"] = {
            "ones": sum(map(sum, matrix)),
            "direct_pattern_hits": len(hits),
            **degrees,
            "direct_model_check": not hits and degrees["all_at_least_three"],
        }
        result["status"] = "SAT-COUNTERMODEL"
    else:
        result["status"] = "UNKNOWN"
    (case_dir / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    return result


def all_cases() -> list[tuple[int, int]]:
    return [
        (alpha, beta)
        for alpha in range(3, 10)
        for beta in range(alpha, 20 - alpha)
    ]


def parse_case(text: str) -> tuple[int, int]:
    try:
        alpha_text, beta_text = text.lower().split("x", 1)
        alpha, beta = int(alpha_text), int(beta_text)
    except ValueError as exc:
        raise argparse.ArgumentTypeError("case must be ALPHAxBETA") from exc
    if not (3 <= alpha <= beta and alpha + beta <= 19):
        raise argparse.ArgumentTypeError(
            "require 3 <= ALPHA <= BETA and ALPHA+BETA <= 19"
        )
    return alpha, beta


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("cases", nargs="*", type=parse_case)
    parser.add_argument("--all-under-20", action="store_true")
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument(
        "--out", type=Path, default=Path(__file__).parent / "lemma2-runs"
    )
    args = parser.parse_args()
    cases = all_cases() if args.all_under_20 else args.cases
    if not cases:
        parser.error("provide cases or --all-under-20")
    summaries = []
    for alpha, beta in cases:
        result = verify_case(args.out, alpha, beta, args.timeout)
        summary = {
            "case": f"{alpha}x{beta}",
            "status": result["status"],
            "vars": result["vars"],
            "clauses": result["clauses"],
            "solver_s": round(result["solver"]["elapsed_s"], 3),
            "drat_s": round(result.get("drat", {}).get("elapsed_s", 0), 3),
        }
        summaries.append(summary)
        print(json.dumps(summary, sort_keys=True), flush=True)
    args.out.mkdir(parents=True, exist_ok=True)
    payload = json.dumps(summaries, indent=2) + "\n"
    (args.out / "summary.json").write_text(payload)
    summary_hash = hashlib.sha256(payload.encode()).hexdigest()
    print(
        json.dumps(
            {
                "summary_path": str(args.out / "summary.json"),
                "summary_sha256": summary_hash,
                "cases": len(summaries),
            },
            sort_keys=True,
        ),
        flush=True,
    )
    return (
        0
        if all(
            row["status"] == "CERTIFIED-UNSAT-CANDIDATE-TRANSCRIPTION"
            for row in summaries
        )
        else 1
    )


if __name__ == "__main__":
    raise SystemExit(main())
