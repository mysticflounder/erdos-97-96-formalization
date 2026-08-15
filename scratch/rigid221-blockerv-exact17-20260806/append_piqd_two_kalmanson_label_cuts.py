#!/usr/bin/env python3
"""Append authenticated model-violated two-Kalmanson cuts to one PIQD session."""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path
from typing import Any

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
GENERATOR = HERE / "append_violated_two_kalmanson_label_cuts.py"
UPLOADER = HERE / "upload_dimacs_to_piqd_session.py"
ANALYSIS_SCHEMA = "p97-rigid221-exact17-source-faithful-model-analysis-v1"
RECEIPT_SCHEMA = "p97-piqd-two-kalmanson-label-cut-admission-v1"


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


generator = load_module("piqd_two_k_label_generator", GENERATOR)
uploader = load_module("piqd_two_k_label_uploader", UPLOADER)


def repo_path(path: str | Path) -> Path:
    value = Path(path)
    return value.resolve() if value.is_absolute() else (REPO / value).resolve()


def relative(path: Path) -> str:
    return str(path.resolve().relative_to(REPO))


def source_hashes() -> dict[str, str]:
    paths = {*generator.SOURCE_FILES, UPLOADER.resolve(), Path(__file__).resolve()}
    return {relative(path): uploader.sha256(path) for path in sorted(paths)}


def validate_session(
    value: dict[str, Any], session_id: str, clauses: int, max_var: int
) -> None:
    if value.get("id") != session_id:
        raise ValueError("PIQD returned the wrong session")
    if value.get("lane") != "sat" or value.get("state") != "live":
        raise ValueError("PIQD session is not a live SAT session")
    if value.get("clauses") != clauses or value.get("max_var") != max_var:
        raise ValueError("PIQD session dimensions disagree with the expected state")


def validate_analysis(
    value: dict[str, Any],
    *,
    order_index: int,
    positions: tuple[int, ...],
    variables: int,
    clauses: int,
    cnf: Path,
    model: Path,
) -> None:
    expected = {
        "schema": ANALYSIS_SCHEMA,
        "order_index": order_index,
        "anonymous_positions": list(positions),
        "variables": variables,
        "clauses": clauses,
    }
    for key, wanted in expected.items():
        if value.get(key) != wanted:
            raise ValueError(f"analysis field {key!r} does not match the request")
    if repo_path(value.get("cnf", "")) != cnf:
        raise ValueError("analysis is bound to a different CNF")
    if repo_path(value.get("cadical_log", "")) != model:
        raise ValueError("analysis is bound to a different model log")
    required_true = (
        "cnf_assignment_verified",
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
    parser.add_argument("--order", type=int, required=True)
    parser.add_argument("--positions", type=int, nargs=2, required=True)
    parser.add_argument("--expected-current-clauses", type=int, required=True)
    parser.add_argument("--expected-max-var", type=int, required=True)
    parser.add_argument("--base-cnf", type=Path, required=True)
    parser.add_argument("--base-cnf-sha256", required=True)
    parser.add_argument("--model-log", type=Path, required=True)
    parser.add_argument("--analysis", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    args = parser.parse_args()

    generator.static.require_lean_consumer()
    frozen_sources = source_hashes()
    cnf = args.base_cnf.resolve()
    model = args.model_log.resolve()
    analysis_path = args.analysis.resolve()
    if uploader.sha256(cnf) != args.base_cnf_sha256:
        raise ValueError("base CNF SHA-256 mismatch")
    variables, declared_clauses, clause_stream = uploader.dimacs_clauses(cnf)
    for _ in clause_stream:
        pass
    if (variables, declared_clauses) != (
        args.expected_max_var,
        args.expected_current_clauses,
    ):
        raise ValueError("base CNF dimensions disagree with the expected session")

    analysis = json.loads(analysis_path.read_text())
    positions = tuple(args.positions)
    validate_analysis(
        analysis,
        order_index=args.order,
        positions=positions,
        variables=variables,
        clauses=declared_clauses,
        cnf=cnf,
        model=model,
    )
    assignment = generator.parse_model(model, variables)
    order = generator.export.source.normalized_order(args.order, positions)
    if tuple(analysis.get("order", ())) != order:
        raise ValueError("analysis cyclic order disagrees with the generator")
    clauses, delta_groups, paired_inequalities = generator.violated_clauses(
        order, assignment, variables
    )
    if not clauses:
        print(json.dumps({"status": "NO_DIRECT_TWO_KALMANSON_LABEL_CUT"}))
        return 3
    if source_hashes() != frozen_sources:
        raise RuntimeError("cut-generation sources changed during replay")

    session_path = f"/sessions/{args.session_id}"
    before = uploader.request_json(
        args.base_url, "GET", session_path, timeout_s=args.timeout_seconds
    )
    validate_session(before, args.session_id, declared_clauses, variables)
    body = uploader.encode_batch([uploader.encode_clause(clause) for clause in clauses])
    response = uploader.request_json(
        args.base_url,
        "POST",
        f"{session_path}/clauses",
        body,
        timeout_s=args.timeout_seconds,
    )
    expected_total = declared_clauses + len(clauses)
    if set(response) != {"added", "clauses", "max_var"}:
        raise ValueError("PIQD add response has noncanonical keys")
    if response != {
        "added": len(clauses),
        "clauses": expected_total,
        "max_var": variables,
    }:
        raise ValueError("PIQD add response disagrees with the generated cuts")
    after = uploader.request_json(
        args.base_url, "GET", session_path, timeout_s=args.timeout_seconds
    )
    validate_session(after, args.session_id, expected_total, variables)
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
        "variables": variables,
        "base_clauses": declared_clauses,
        "base_cnf": relative(cnf),
        "base_cnf_sha256": uploader.sha256(cnf),
        "model_log": relative(model),
        "model_log_sha256": uploader.sha256(model),
        "analysis": relative(analysis_path),
        "analysis_sha256": uploader.sha256(analysis_path),
        "analysis_verifications": {
            key: analysis[key]
            for key in (
                "cnf_assignment_verified",
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
    }
    atomic_json(args.receipt.resolve(), receipt)
    print(
        json.dumps(
            {
                "status": "PASS",
                "session_id": args.session_id,
                "before_clauses": declared_clauses,
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
