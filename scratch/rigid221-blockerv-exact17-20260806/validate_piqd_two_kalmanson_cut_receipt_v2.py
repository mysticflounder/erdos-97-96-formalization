#!/usr/bin/env python3
"""Independently replay one receipt-chain PIQD two-Kalmanson admission."""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path

import piqd_formula_chain as formula_chain

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
INDEPENDENT = HERE / "validate_lazy_two_kalmanson_label_cnf.py"
UPLOADER = HERE / "upload_dimacs_to_piqd_session.py"
ADMITTER = HERE / "append_piqd_two_kalmanson_label_cuts_v2.py"
ANALYZER = HERE / "analyze_source_faithful_piqd_model.py"
BASE_ANALYZER = HERE / "analyze_source_faithful_boolean_model.py"


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


independent = load_module("piqd_two_k_label_independent_replay_v2", INDEPENDENT)
uploader = load_module("piqd_two_k_label_receipt_http_v2", UPLOADER)


def expected_source_hashes() -> dict[str, str]:
    result = independent.expected_source_hashes()
    for path in (
        UPLOADER.resolve(),
        ADMITTER.resolve(),
        ANALYZER.resolve(),
        BASE_ANALYZER.resolve(),
        Path(formula_chain.__file__).resolve(),
    ):
        result[formula_chain.relative(path)] = uploader.sha256(path)
    return dict(sorted(result.items()))


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    args = parser.parse_args()

    receipt_path = args.receipt.resolve()
    receipt = json.loads(receipt_path.read_text())
    if receipt.get("schema") != formula_chain.V2_SCHEMA:
        raise ValueError("unexpected receipt-chain cut-admission schema")
    if receipt.get("generation_source_hashes") != expected_source_hashes():
        raise ValueError("generation source hashes disagree with independent audit")
    if receipt.get("lean_consumer") != independent.LEAN_CONSUMER:
        raise ValueError("receipt names the wrong Lean consumer")

    root_cnf = formula_chain.repo_path(receipt["root_cnf"])
    parent_paths = tuple(
        formula_chain.repo_path(path) for path in receipt["parent_cut_receipts"]
    )
    chain = formula_chain.validate_formula_chain(
        root_cnf=root_cnf,
        root_cnf_sha256=receipt["root_cnf_sha256"],
        variables=receipt["variables"],
        root_clauses=receipt["root_clauses"],
        receipt_paths=parent_paths,
        expected_session_id=receipt["session_id"],
    )
    formula_chain.require_fields(
        receipt,
        {
            "base_clauses": chain.clauses,
            "parent_cut_receipt_sha256s": list(chain.receipt_sha256s),
        },
        "receipt ancestry",
    )

    model = formula_chain.repo_path(receipt["model_log"])
    analysis_path = formula_chain.repo_path(receipt["analysis"])
    solve_receipt = formula_chain.repo_path(receipt["solve_receipt"])
    formula_chain.require_fields(
        receipt,
        {
            "model_log_sha256": uploader.sha256(model),
            "analysis_sha256": uploader.sha256(analysis_path),
            "solve_receipt_sha256": uploader.sha256(solve_receipt),
        },
        "receipt custody",
    )
    formula_chain.validate_solve_receipt(
        path=solve_receipt,
        chain=chain,
        model_log=model,
    )
    assignment = independent.parse_model(model, chain.variables)
    root_checked = independent.verify_model_satisfies_cnf(root_cnf, assignment)
    if root_checked != chain.root_clauses:
        raise ValueError("root CNF clause count disagrees with the receipt")
    receipt_checked = formula_chain.verify_appended_assignment(chain, assignment)
    if receipt_checked != chain.appended_clauses:
        raise AssertionError("parent receipt clause-count mismatch")

    analysis = json.loads(analysis_path.read_text())
    required_true = (
        "cnf_assignment_verified",
        "root_cnf_assignment_verified",
        "cut_receipt_chain_verified",
        "appended_receipt_assignment_verified",
        "piqd_solve_receipt_verified",
        "source_z3_assignment_verified",
        "source_independent_model_checker_verified",
        "static_bank_assignment_verified_via_direct_cnf",
        "first_bank_hit_replayed",
    )
    formula_chain.require_fields(
        analysis,
        {
            "schema": "p97-rigid221-exact17-source-faithful-piqd-model-analysis-v1",
            "order_index": receipt["order_index"],
            "anonymous_positions": receipt["anonymous_positions"],
            "variables": chain.variables,
            "clauses": chain.clauses,
            "root_cnf_sha256": chain.root_cnf_sha256,
            "cut_receipt_sha256s": list(chain.receipt_sha256s),
            "piqd_session_id": chain.session_id,
            "solve_receipt_sha256": uploader.sha256(solve_receipt),
        },
        "analysis",
    )
    if any(analysis.get(key) is not True for key in required_true):
        raise ValueError("analysis lacks a required verification")
    if analysis.get("unreplayed_bank_hit_proposals") != []:
        raise ValueError("analysis contains unreplayed bank-hit proposals")

    order = independent.export.source.normalized_order(
        receipt["order_index"], tuple(receipt["anonymous_positions"])
    )
    if tuple(receipt.get("order", ())) != order:
        raise ValueError("receipt cyclic order disagrees with independent replay")
    clauses, delta_groups, paired_inequalities = independent.replay(
        order, assignment, chain.variables
    )
    recorded = tuple(tuple(clause) for clause in receipt["appended_clauses"])
    if recorded != clauses:
        raise ValueError("recorded cuts disagree with independent replay")
    formula_chain.require_fields(
        receipt,
        {
            "appended_clause_count": len(clauses),
            "appended_clause_sha256": formula_chain.clauses_digest(clauses),
            "delta_groups": delta_groups,
            "cancelling_inequality_pairs": paired_inequalities,
        },
        "independently replayed cut",
    )
    expected_total = chain.clauses + len(clauses)
    formula_chain.require_fields(
        receipt["session_before"],
        {
            "id": chain.session_id,
            "clauses": chain.clauses,
            "max_var": chain.variables,
        },
        "session before",
    )
    formula_chain.require_fields(
        receipt["session_after"],
        {
            "id": chain.session_id,
            "clauses": expected_total,
            "max_var": chain.variables,
        },
        "session after",
    )
    live = uploader.request_json(
        args.base_url,
        "GET",
        f"/sessions/{chain.session_id}",
        timeout_s=args.timeout_seconds,
    )
    formula_chain.require_fields(
        live,
        {
            "id": chain.session_id,
            "lane": "sat",
            "state": "live",
            "clauses": expected_total,
            "max_var": chain.variables,
        },
        "live PIQD session",
    )
    print(
        json.dumps(
            {
                "status": "PASS",
                "session_id": chain.session_id,
                "root_clauses_checked": root_checked,
                "parent_receipt_clauses_checked": receipt_checked,
                "appended_clauses_replayed": len(clauses),
                "clause_sha256": formula_chain.clauses_digest(clauses),
                "live_clauses": expected_total,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
