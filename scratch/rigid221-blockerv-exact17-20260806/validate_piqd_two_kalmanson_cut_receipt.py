#!/usr/bin/env python3
"""Independently replay one PIQD two-Kalmanson cut-admission receipt."""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
INDEPENDENT = HERE / "validate_lazy_two_kalmanson_label_cnf.py"
UPLOADER = HERE / "upload_dimacs_to_piqd_session.py"
ADMITTER = HERE / "append_piqd_two_kalmanson_label_cuts.py"
SCHEMA = "p97-piqd-two-kalmanson-label-cut-admission-v1"


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


independent = load_module("piqd_two_k_label_independent_replay", INDEPENDENT)
uploader = load_module("piqd_two_k_label_receipt_http", UPLOADER)


def repo_path(value: str) -> Path:
    path = Path(value)
    return path.resolve() if path.is_absolute() else (REPO / path).resolve()


def expected_source_hashes() -> dict[str, str]:
    result = independent.expected_source_hashes()
    for path in (UPLOADER.resolve(), ADMITTER.resolve()):
        result[str(path.relative_to(REPO))] = uploader.sha256(path)
    return dict(sorted(result.items()))


def require_fields(value: dict, expected: dict, context: str) -> None:
    for key, wanted in expected.items():
        if value.get(key) != wanted:
            raise ValueError(f"{context} field {key!r} disagrees with replay")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument("--session-export", type=Path)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    args = parser.parse_args()

    receipt_path = args.receipt.resolve()
    receipt = json.loads(receipt_path.read_text())
    if receipt.get("schema") != SCHEMA:
        raise ValueError("unexpected PIQD cut-admission receipt schema")
    if receipt.get("generation_source_hashes") != expected_source_hashes():
        raise ValueError("generation source hashes disagree with independent audit")
    if receipt.get("lean_consumer") != independent.LEAN_CONSUMER:
        raise ValueError("receipt names the wrong Lean consumer")

    cnf = repo_path(receipt["base_cnf"])
    model = repo_path(receipt["model_log"])
    analysis_path = repo_path(receipt["analysis"])
    require_fields(
        receipt,
        {
            "base_cnf_sha256": uploader.sha256(cnf),
            "model_log_sha256": uploader.sha256(model),
            "analysis_sha256": uploader.sha256(analysis_path),
        },
        "receipt hash",
    )
    variables = receipt["variables"]
    base_clauses = receipt["base_clauses"]
    if type(variables) is not int or type(base_clauses) is not int:
        raise TypeError("receipt dimensions are not integers")
    assignment = independent.parse_model(model, variables)
    checked = independent.verify_model_satisfies_cnf(cnf, assignment)
    if checked != base_clauses:
        raise ValueError("base CNF clause count disagrees with the receipt")

    analysis = json.loads(analysis_path.read_text())
    required_true = (
        "cnf_assignment_verified",
        "source_z3_assignment_verified",
        "source_independent_model_checker_verified",
        "static_bank_assignment_verified_via_direct_cnf",
        "first_bank_hit_replayed",
    )
    require_fields(
        analysis,
        {
            "schema": "p97-rigid221-exact17-source-faithful-model-analysis-v1",
            "order_index": receipt["order_index"],
            "anonymous_positions": receipt["anonymous_positions"],
            "variables": variables,
            "clauses": base_clauses,
            "cnf_assignment_verified": True,
            "source_z3_assignment_verified": True,
            "source_independent_model_checker_verified": True,
            "static_bank_assignment_verified_via_direct_cnf": True,
            "first_bank_hit_replayed": True,
            "unreplayed_bank_hit_proposals": [],
        },
        "source analysis",
    )
    if receipt.get("analysis_verifications") != {
        key: analysis[key] for key in required_true
    }:
        raise ValueError("receipt analysis-verification summary is inaccurate")
    if repo_path(analysis["cnf"]) != cnf or repo_path(analysis["cadical_log"]) != model:
        raise ValueError("source analysis is bound to different input artifacts")

    positions = tuple(receipt["anonymous_positions"])
    order = independent.export.source.normalized_order(receipt["order_index"], positions)
    if tuple(receipt.get("order", ())) != order or tuple(analysis.get("order", ())) != order:
        raise ValueError("cyclic order disagrees across the receipt and analysis")
    clauses, delta_groups, paired_inequalities = independent.replay(
        order, assignment, variables
    )
    recorded = tuple(tuple(clause) for clause in receipt["appended_clauses"])
    if recorded != clauses:
        raise ValueError("recorded PIQD cuts disagree with independent replay")
    require_fields(
        receipt,
        {
            "appended_clause_count": len(clauses),
            "appended_clause_sha256": independent.clauses_digest(clauses),
            "delta_groups": delta_groups,
            "cancelling_inequality_pairs": paired_inequalities,
        },
        "replayed cut",
    )

    expected_total = base_clauses + len(clauses)
    expected_add = {
        "added": len(clauses),
        "clauses": expected_total,
        "max_var": variables,
    }
    if receipt.get("add_response") != expected_add:
        raise ValueError("recorded PIQD add response has incorrect dimensions")
    before = receipt.get("session_before", {})
    after = receipt.get("session_after", {})
    require_fields(
        before,
        {
            "id": receipt["session_id"],
            "lane": "sat",
            "state": "live",
            "clauses": base_clauses,
            "max_var": variables,
        },
        "session-before",
    )
    require_fields(
        after,
        {
            "id": receipt["session_id"],
            "lane": "sat",
            "state": "live",
            "clauses": expected_total,
            "max_var": variables,
        },
        "session-after",
    )
    live = uploader.request_json(
        args.base_url,
        "GET",
        f"/sessions/{receipt['session_id']}",
        timeout_s=args.timeout_seconds,
    )
    require_fields(
        live,
        {
            "id": receipt["session_id"],
            "lane": "sat",
            "state": "live",
            "clauses": expected_total,
            "max_var": variables,
        },
        "live session",
    )
    export_sha256 = None
    if args.session_export is not None:
        session_export = args.session_export.resolve()
        export_variables, export_count, export_clauses = uploader.dimacs_clauses(
            session_export
        )
        if (export_variables, export_count) != (variables, expected_total):
            raise ValueError("PIQD session export has incorrect dimensions")
        base_variables, parsed_base_count, parsed_base = uploader.dimacs_clauses(cnf)
        if (base_variables, parsed_base_count) != (variables, base_clauses):
            raise ValueError("base CNF changed during session-export validation")
        for index, base_clause in enumerate(parsed_base, start=1):
            if next(export_clauses, None) != base_clause:
                raise ValueError(
                    f"PIQD export differs from the base prefix at clause {index}"
                )
        for offset, clause in enumerate(clauses, start=1):
            if next(export_clauses, None) != clause:
                raise ValueError(
                    f"PIQD export differs from the admitted suffix at cut {offset}"
                )
        if next(export_clauses, None) is not None:
            raise ValueError("PIQD session export has an unexpected trailing clause")
        export_sha256 = uploader.sha256(session_export)
    print(
        json.dumps(
            {
                "status": "PASS",
                "session_id": receipt["session_id"],
                "base_clauses_checked": checked,
                "appended_clauses_replayed": len(clauses),
                "clause_sha256": independent.clauses_digest(clauses),
                "live_clauses": expected_total,
                "session_export_sha256": export_sha256,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
