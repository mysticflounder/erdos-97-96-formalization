#!/usr/bin/env python3
"""Append model-violated two-Kalmanson cuts using a PIQD receipt chain."""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path
from typing import Any

import piqd_formula_chain as formula_chain

from census.p97_search.phase3_piqd_clause_admission import audit_clause_admission

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
GENERATOR = HERE / "append_violated_two_kalmanson_label_cuts.py"
UPLOADER = HERE / "upload_dimacs_to_piqd_session.py"
ANALYZER = HERE / "analyze_source_faithful_piqd_model.py"
BASE_ANALYZER = HERE / "analyze_source_faithful_boolean_model.py"
ANALYSIS_SCHEMA = "p97-rigid221-exact17-source-faithful-piqd-model-analysis-v1"
RECEIPT_SCHEMA = formula_chain.V2_SCHEMA


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


generator = load_module("piqd_two_k_label_generator_v2", GENERATOR)
uploader = load_module("piqd_two_k_label_uploader_v2", UPLOADER)


def source_hashes() -> dict[str, str]:
    paths = {
        *generator.SOURCE_FILES,
        UPLOADER.resolve(),
        Path(formula_chain.__file__).resolve(),
        ANALYZER.resolve(),
        BASE_ANALYZER.resolve(),
        Path(audit_clause_admission.__code__.co_filename).resolve(),
        Path(__file__).resolve(),
    }
    return {
        formula_chain.relative(path): uploader.sha256(path) for path in sorted(paths)
    }


def validate_session(
    value: dict[str, Any], session_id: str, clauses: int, max_var: int
) -> None:
    formula_chain.require_fields(
        value,
        {
            "id": session_id,
            "lane": "sat",
            "state": "live",
            "clauses": clauses,
            "max_var": max_var,
        },
        "live PIQD session",
    )


def validate_analysis(
    value: dict[str, Any],
    *,
    chain: formula_chain.FormulaChain,
    order_index: int,
    positions: tuple[int, ...],
    model: Path,
    solve_receipt: Path,
) -> None:
    formula_chain.require_fields(
        value,
        {
            "schema": ANALYSIS_SCHEMA,
            "order_index": order_index,
            "anonymous_positions": list(positions),
            "variables": chain.variables,
            "clauses": chain.clauses,
            "root_cnf": formula_chain.relative(chain.root_cnf),
            "root_cnf_sha256": chain.root_cnf_sha256,
            "root_clauses": chain.root_clauses,
            "cut_receipts": [
                formula_chain.relative(path) for path in chain.receipt_paths
            ],
            "cut_receipt_sha256s": list(chain.receipt_sha256s),
            "appended_receipt_clauses": chain.appended_clauses,
            "appended_receipt_clauses_checked": chain.appended_clauses,
            "piqd_session_id": chain.session_id,
            "solve_receipt": formula_chain.relative(solve_receipt),
            "solve_receipt_sha256": formula_chain.sha256(solve_receipt),
            "cadical_log": formula_chain.relative(model),
        },
        "source analysis",
    )
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
    if any(value.get(key) is not True for key in required_true):
        raise ValueError("analysis lacks a required positive verification result")
    if value.get("unreplayed_bank_hit_proposals") != []:
        raise ValueError("analysis contains unreplayed bank-hit proposals")


def atomic_json(path: Path, value: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
    temporary.replace(path)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--session-id", required=True)
    parser.add_argument("--order", type=int, choices=(0, 1), required=True)
    parser.add_argument("--positions", type=int, nargs=2, required=True)
    parser.add_argument("--root-cnf", type=Path, required=True)
    parser.add_argument("--root-cnf-sha256", required=True)
    parser.add_argument("--root-clauses", type=int, required=True)
    parser.add_argument("--variables", type=int, required=True)
    parser.add_argument("--cut-receipt", type=Path, action="append", default=[])
    parser.add_argument("--solve-receipt", type=Path, required=True)
    parser.add_argument("--model-log", type=Path, required=True)
    parser.add_argument("--analysis", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    args = parser.parse_args()

    generator.static.require_lean_consumer()
    frozen_sources = source_hashes()
    root_cnf = args.root_cnf.resolve()
    model = args.model_log.resolve()
    solve_receipt = args.solve_receipt.resolve()
    analysis_path = args.analysis.resolve()
    chain = formula_chain.validate_formula_chain(
        root_cnf=root_cnf,
        root_cnf_sha256=args.root_cnf_sha256,
        variables=args.variables,
        root_clauses=args.root_clauses,
        receipt_paths=args.cut_receipt,
        expected_session_id=args.session_id,
    )
    formula_chain.validate_solve_receipt(
        path=solve_receipt,
        chain=chain,
        model_log=model,
    )
    analysis_value = json.loads(analysis_path.read_text())
    positions = tuple(args.positions)
    validate_analysis(
        analysis_value,
        chain=chain,
        order_index=args.order,
        positions=positions,
        model=model,
        solve_receipt=solve_receipt,
    )
    assignment = generator.parse_model(model, chain.variables)
    order = generator.export.source.normalized_order(args.order, positions)
    if tuple(analysis_value.get("order", ())) != order:
        raise ValueError("analysis cyclic order disagrees with the generator")
    clauses, delta_groups, paired_inequalities = generator.violated_clauses(
        order, assignment, chain.variables
    )
    if not clauses:
        print(json.dumps({"status": "NO_DIRECT_TWO_KALMANSON_LABEL_CUT"}))
        return 3
    novelty = audit_clause_admission(
        root_cnf=root_cnf,
        root_clauses=chain.root_clauses,
        max_var=chain.variables,
        candidates=clauses,
        assignment=assignment,
        prior_batches=chain.appended_batches,
    )
    if source_hashes() != frozen_sources:
        raise RuntimeError("cut-generation sources changed during replay")

    session_path = f"/sessions/{args.session_id}"
    before = uploader.request_json(
        args.base_url, "GET", session_path, timeout_s=args.timeout_seconds
    )
    validate_session(before, args.session_id, chain.clauses, chain.variables)
    body = uploader.encode_batch([uploader.encode_clause(clause) for clause in clauses])
    response = uploader.request_json(
        args.base_url,
        "POST",
        f"{session_path}/clauses",
        body,
        timeout_s=args.timeout_seconds,
    )
    expected_total = chain.clauses + len(clauses)
    expected_response = {
        "added": len(clauses),
        "clauses": expected_total,
        "max_var": chain.variables,
    }
    if response != expected_response or set(response) != set(expected_response):
        raise ValueError("PIQD add response disagrees with generated cuts")
    after = uploader.request_json(
        args.base_url, "GET", session_path, timeout_s=args.timeout_seconds
    )
    validate_session(after, args.session_id, expected_total, chain.variables)
    if source_hashes() != frozen_sources:
        raise RuntimeError("cut-generation sources changed during PIQD admission")

    receipt = {
        "schema": RECEIPT_SCHEMA,
        "session_id": args.session_id,
        "session_before": before,
        "session_after": after,
        "add_response": response,
        "order_index": args.order,
        "anonymous_positions": list(positions),
        "order": list(order),
        "variables": chain.variables,
        "base_clauses": chain.clauses,
        "root_cnf": formula_chain.relative(root_cnf),
        "root_cnf_sha256": chain.root_cnf_sha256,
        "root_clauses": chain.root_clauses,
        "parent_cut_receipts": [
            formula_chain.relative(path) for path in chain.receipt_paths
        ],
        "parent_cut_receipt_sha256s": list(chain.receipt_sha256s),
        "solve_receipt": formula_chain.relative(solve_receipt),
        "solve_receipt_sha256": formula_chain.sha256(solve_receipt),
        "model_log": formula_chain.relative(model),
        "model_log_sha256": formula_chain.sha256(model),
        "analysis": formula_chain.relative(analysis_path),
        "analysis_sha256": formula_chain.sha256(analysis_path),
        "analysis_verifications": {
            key: analysis_value[key]
            for key in (
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
        },
        "appended_clauses": [list(clause) for clause in clauses],
        "appended_clause_count": len(clauses),
        "appended_clause_sha256": generator.clauses_digest(clauses),
        "delta_groups": delta_groups,
        "cancelling_inequality_pairs": paired_inequalities,
        "lean_consumer": generator.LEAN_CONSUMER,
        "generation_source_hashes": frozen_sources,
        "admission_audit": {
            "candidate_clauses": novelty.candidate_clauses,
            "root_clauses_checked": novelty.root_clauses_checked,
            "prior_clauses_checked": novelty.prior_clauses_checked,
            "model_violated_clauses": novelty.model_violated_clauses,
            "root_or_prior_subsumptions": novelty.root_or_prior_subsumptions,
        },
    }
    atomic_json(args.receipt.resolve(), receipt)
    print(
        json.dumps(
            {
                "status": "PASS",
                "session_id": args.session_id,
                "before_clauses": chain.clauses,
                "appended_clauses": len(clauses),
                "after_clauses": expected_total,
                "clause_sha256": receipt["appended_clause_sha256"],
                "receipt": str(args.receipt.resolve()),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
