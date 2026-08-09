#!/usr/bin/env python3
"""Audit a PIQD model after compact two-Kalmanson pair-closure admission."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import analyze_source_faithful_boolean_model as analysis
import append_violated_two_kalmanson_label_cuts as generator
import piqd_formula_chain as formula_chain

SCHEMA = "p97-rigid221-exact17-source-faithful-piqd-pair-closure-analysis-v3"
PAIR_SCHEMA = "p97-piqd-two-kalmanson-pair-closure-admission-v3"


def atomic_json(path: Path, value: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
    temporary.replace(path)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--order", type=int, choices=(0, 1), required=True)
    parser.add_argument("--positions", type=analysis.export.parse_positions, required=True)
    parser.add_argument("--root-cnf", type=Path, required=True)
    parser.add_argument("--root-cnf-sha256", required=True)
    parser.add_argument("--root-clauses", type=int, required=True)
    parser.add_argument("--variables", type=int, required=True)
    parser.add_argument("--cut-receipt", type=Path, action="append", required=True)
    parser.add_argument("--pair-closure-receipt", type=Path, required=True)
    parser.add_argument("--session-id", required=True)
    parser.add_argument("--solve-receipt", type=Path, required=True)
    parser.add_argument("--model-log", type=Path, required=True)
    parser.add_argument("--linear-timeout-ms", type=int, default=120_000)
    parser.add_argument("--always-linear-replay", action="store_true")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    root = args.root_cnf.resolve()
    model = args.model_log.resolve()
    solve_receipt_path = args.solve_receipt.resolve()
    pair_path = args.pair_closure_receipt.resolve()
    chain = formula_chain.validate_formula_chain(
        root_cnf=root,
        root_cnf_sha256=args.root_cnf_sha256,
        variables=args.variables,
        root_clauses=args.root_clauses,
        receipt_paths=args.cut_receipt,
        expected_session_id=args.session_id,
    )
    pair = json.loads(pair_path.read_text())
    if pair.get("schema") != PAIR_SCHEMA or pair.get("status") != "complete":
        raise ValueError("pair-closure receipt is not complete")
    formula_chain.require_fields(
        pair,
        {
            "session_id": chain.session_id,
            "variables": chain.variables,
            "base_clauses": chain.clauses,
            "root_cnf_sha256": chain.root_cnf_sha256,
            "root_clauses": chain.root_clauses,
            "parent_cut_receipt_sha256s": list(chain.receipt_sha256s),
        },
        "pair-closure receipt",
    )

    assignment = analysis.parse_cadical_model(model.read_text(), chain.variables)
    analysis.verify_dimacs(root, assignment, chain.root_clauses)
    prior_checked = formula_chain.verify_appended_assignment(chain, assignment)
    order = tuple(pair["order"])
    inequalities = generator.static.inequalities(order)
    comparisons = generator.static.comparison_variables(chain.variables)
    prior = {clause for batch in chain.appended_batches for clause in batch}
    pair_clauses = tuple(
        sorted(
            {
                clause
                for first, second in map(tuple, pair["selected_pairs"])
                for clause in generator.static.clauses_for_pair(
                    inequalities[first], inequalities[second], comparisons
                )
            }
            - prior
        )
    )
    if len(pair_clauses) != pair["appended_clause_count"]:
        raise ValueError("pair-closure clause count does not regenerate")
    violations = [
        index
        for index, clause in enumerate(pair_clauses, start=1)
        if not formula_chain.clause_satisfied(clause, assignment)
    ]
    if violations:
        raise ValueError(f"model violates pair-closure clauses {violations[:20]}")
    final_clauses = chain.clauses + len(pair_clauses)

    solve_receipt = json.loads(solve_receipt_path.read_text())
    if solve_receipt.get("schema") != "p97-piqd-sat-session-model-capture-v1":
        raise ValueError("unexpected solve-receipt schema")
    formula_chain.require_fields(
        solve_receipt.get("session_before", {}),
        {
            "id": chain.session_id,
            "lane": "sat",
            "state": "live",
            "clauses": final_clauses,
            "max_var": chain.variables,
        },
        "solve receipt",
    )
    if (
        Path(solve_receipt.get("model_log", "")).resolve() != model
        or solve_receipt.get("model_log_sha256") != formula_chain.sha256(model)
        or solve_receipt.get("model_literals") != chain.variables
        or solve_receipt.get("solve_response", {}).get("status") != "SAT"
    ):
        raise ValueError("solve receipt does not authenticate the model")

    ingress = {
        "formula_ingress": "authenticated-root-plus-piqd-chain-plus-pair-closure-v3",
        "root_cnf": formula_chain.relative(root),
        "root_cnf_sha256": chain.root_cnf_sha256,
        "root_clauses": chain.root_clauses,
        "root_cnf_assignment_verified": True,
        "cut_receipts": [formula_chain.relative(path) for path in chain.receipt_paths],
        "cut_receipt_sha256s": list(chain.receipt_sha256s),
        "cut_receipt_chain_verified": True,
        "appended_receipt_clauses": chain.appended_clauses,
        "appended_receipt_clauses_checked": prior_checked,
        "appended_receipt_assignment_verified": True,
        "pair_closure_receipt": formula_chain.relative(pair_path),
        "pair_closure_receipt_sha256": formula_chain.sha256(pair_path),
        "pair_closure_selected_pairs": pair["selected_pair_count"],
        "pair_closure_clauses_checked": len(pair_clauses),
        "pair_closure_assignment_verified": True,
        "piqd_session_id": chain.session_id,
        "solve_receipt": formula_chain.relative(solve_receipt_path),
        "solve_receipt_sha256": formula_chain.sha256(solve_receipt_path),
        "piqd_solve_receipt_verified": True,
    }
    report = analysis.analyze_verified_assignment(
        order_index=args.order,
        positions=tuple(args.positions),
        variable_count=chain.variables,
        clause_count=final_clauses,
        assignment=assignment,
        cnf_description="root + 7 PIQD cut receipts + pair-closure-v3",
        model_description=formula_chain.relative(model),
        linear_timeout_ms=args.linear_timeout_ms,
        always_linear_replay=args.always_linear_replay,
        minimize_first_bank_witness=False,
        minimize_all_bank_witnesses=False,
        schema=SCHEMA,
        ingress_fields=ingress,
    )
    atomic_json(args.output.resolve(), report)
    print(
        json.dumps(
            {
                "status": "PASS",
                "clauses": final_clauses,
                "pair_clauses_checked": len(pair_clauses),
                "bank_hit_count": len(report["bank_hits"]),
                "linear_status": report["linear_status"],
                "output": str(args.output.resolve()),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
