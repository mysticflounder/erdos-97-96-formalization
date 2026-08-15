#!/usr/bin/env python3
"""Audit one exact-17 PIQD model against root CNF plus cut receipts."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import analyze_source_faithful_boolean_model as analysis
import piqd_formula_chain as formula_chain

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
SCHEMA = "p97-rigid221-exact17-source-faithful-piqd-model-analysis-v1"


def atomic_json(path: Path, value: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
    temporary.replace(path)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--order", type=int, choices=(0, 1), required=True)
    parser.add_argument(
        "--positions", type=analysis.export.parse_positions, required=True
    )
    parser.add_argument("--root-cnf", type=Path, required=True)
    parser.add_argument("--root-cnf-sha256", required=True)
    parser.add_argument("--root-clauses", type=int, required=True)
    parser.add_argument("--variables", type=int, required=True)
    parser.add_argument("--cut-receipt", type=Path, action="append", default=[])
    parser.add_argument("--session-id", required=True)
    parser.add_argument("--solve-receipt", type=Path, required=True)
    parser.add_argument("--model-log", type=Path, required=True)
    parser.add_argument("--linear-timeout-ms", type=int, default=120_000)
    parser.add_argument("--always-linear-replay", action="store_true")
    minimization = parser.add_mutually_exclusive_group()
    minimization.add_argument(
        "--minimize-first-bank-witness", action="store_true"
    )
    minimization.add_argument(
        "--minimize-all-bank-witnesses", action="store_true"
    )
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    root_cnf = args.root_cnf.resolve()
    model_log = args.model_log.resolve()
    solve_receipt = args.solve_receipt.resolve()
    if analysis.dimacs_header(root_cnf) != (args.variables, args.root_clauses):
        raise ValueError("root DIMACS header disagrees with requested dimensions")
    chain = formula_chain.validate_formula_chain(
        root_cnf=root_cnf,
        root_cnf_sha256=args.root_cnf_sha256,
        variables=args.variables,
        root_clauses=args.root_clauses,
        receipt_paths=args.cut_receipt,
        expected_session_id=args.session_id,
    )
    assignment = analysis.parse_cadical_model(
        model_log.read_text(), args.variables
    )
    analysis.verify_dimacs(root_cnf, assignment, args.root_clauses)
    appended_checked = formula_chain.verify_appended_assignment(chain, assignment)
    formula_chain.validate_solve_receipt(
        path=solve_receipt,
        chain=chain,
        model_log=model_log,
    )

    ingress = {
        "formula_ingress": "authenticated-root-dimacs-plus-ordered-piqd-cut-receipts",
        "root_cnf": formula_chain.relative(root_cnf),
        "root_cnf_sha256": chain.root_cnf_sha256,
        "root_clauses": chain.root_clauses,
        "root_cnf_assignment_verified": True,
        "cut_receipts": [
            formula_chain.relative(path) for path in chain.receipt_paths
        ],
        "cut_receipt_sha256s": list(chain.receipt_sha256s),
        "cut_receipt_chain_verified": True,
        "appended_receipt_clauses": chain.appended_clauses,
        "appended_receipt_clauses_checked": appended_checked,
        "appended_receipt_assignment_verified": True,
        "piqd_session_id": chain.session_id,
        "solve_receipt": formula_chain.relative(solve_receipt),
        "solve_receipt_sha256": formula_chain.sha256(solve_receipt),
        "piqd_solve_receipt_verified": True,
    }
    report = analysis.analyze_verified_assignment(
        order_index=args.order,
        positions=tuple(args.positions),
        variable_count=args.variables,
        clause_count=chain.clauses,
        assignment=assignment,
        cnf_description=(
            f"{formula_chain.relative(root_cnf)} + "
            f"{len(chain.receipt_paths)} ordered PIQD cut receipts"
        ),
        model_description=formula_chain.relative(model_log),
        linear_timeout_ms=args.linear_timeout_ms,
        always_linear_replay=args.always_linear_replay,
        minimize_first_bank_witness=args.minimize_first_bank_witness,
        minimize_all_bank_witnesses=args.minimize_all_bank_witnesses,
        schema=SCHEMA,
        ingress_fields=ingress,
    )
    atomic_json(args.output.resolve(), report)
    print(
        json.dumps(
            {
                "status": "PASS",
                "source_verified": True,
                "session_id": chain.session_id,
                "clauses": chain.clauses,
                "root_clauses_checked": chain.root_clauses,
                "receipt_clauses_checked": appended_checked,
                "bank_hit_count": len(report["bank_hits"]),
                "first_bank_family": (
                    report["bank_hits"][0].get("family")
                    if report["bank_hits"]
                    else None
                ),
                "fifth_center": report["fifth_center"],
                "linear_status": report["linear_status"],
                "output": str(args.output.resolve()),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
