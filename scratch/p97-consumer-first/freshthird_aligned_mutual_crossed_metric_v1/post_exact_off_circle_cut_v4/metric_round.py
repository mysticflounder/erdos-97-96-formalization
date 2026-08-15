#!/usr/bin/env python3
"""Staged shared-coordinate replay for the closure-clean v4 assignment."""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
from pathlib import Path
from types import ModuleType
from typing import Any

HERE = Path(__file__).resolve().parent
V3 = HERE.parent / "post_rich_cut_v3"
ASSIGNMENT = HERE / "generated" / "post_exact_off_circle_cut_v4_assignment.json"
RESULTS = HERE / "metric_results.json"


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def run(timeout_ms: int, cvc5_timeout_ms: int) -> dict[str, Any]:
    incidence = load_module("freshthird_v4_incidence", HERE / "incidence_round.py")
    v3_incidence = load_module(
        "freshthird_v3_incidence_metric", V3 / "incidence_round.py"
    )
    source = v3_incidence.load_source_generator()
    metric = load_module("freshthird_v3_unified_metric", V3 / "unified_metric.py")
    metric.HERE = HERE
    metric.GENERATED = HERE / "generated" / "metric"
    metric.LOGS = HERE / "logs" / "metric"

    assignment = json.loads(ASSIGNMENT.read_text())
    incidence_errors = (
        source.verify_global_assignment(assignment)
        + v3_incidence.validate_cut(assignment)
        + metric.validate_incidence_proposal(assignment)
        + metric.validate_retained_first_apex_rich(assignment)
    )
    closure_witnesses = incidence.find_exact_off_circle_witnesses(assignment)
    if closure_witnesses:
        incidence_errors.append(
            f"assignment retains {len(closure_witnesses)} ExactOffCircleCore witnesses"
        )
    if incidence_errors:
        raise RuntimeError(
            "invalid v4 incidence proposal: " + "; ".join(incidence_errors)
        )

    encoding = metric.UnifiedEncoding(assignment)
    results: dict[str, Any] = {
        "scope": "exact-17 direct-crossed staged shared-coordinate replay only",
        "source_assignment": str(ASSIGNMENT.relative_to(HERE)),
        "incidence_validation": "PASS",
        "exact_off_circle_validation": "PASS",
        "closure_claim": "NONE",
        "universal_lift": False,
        "lean_sorry_closed": False,
        "queries": [],
        "controls": [],
        "first_joint_unsat_stage": None,
        "status_separation": (
            "Z3py, external Z3, cvc5, exact substitution replay, and Fraction "
            "replay are reported independently; timeout/unknown is never UNSAT"
        ),
        "omitted_scope": [
            "reversed crossed constructor",
            "both deletion residual constructors",
            "all cardinalities other than 17",
            "universal finite-core lift",
            "complete original-P97 ingress",
        ],
    }
    results["queries"].append(
        metric.run_query(
            "post_exact_off_circle_cut_v4_row_equalities_only_preflight",
            encoding,
            encoding.row_preflight_clauses(),
            timeout_ms,
            cvc5_timeout_ms,
        )
    )
    for stage in metric.STAGES:
        outcome = metric.run_query(
            f"post_exact_off_circle_cut_v4_{stage}",
            encoding,
            encoding.clauses_through(stage),
            timeout_ms,
            cvc5_timeout_ms,
        )
        outcome["stage"] = stage
        results["queries"].append(outcome)
        if (
            outcome["z3_cli"]["status"] == "UNSAT"
            and outcome["cvc5"]["status"] == "UNSAT"
        ):
            results["first_joint_unsat_stage"] = stage
            break
    for name, clauses in metric.malformed_controls(encoding).items():
        results["controls"].append(
            metric.run_query(
                "post_exact_off_circle_cut_v4_" + name,
                encoding,
                clauses,
                min(timeout_ms, 10_000),
                min(cvc5_timeout_ms, 10_000),
            )
        )
    RESULTS.write_text(json.dumps(results, indent=2, sort_keys=True) + "\n")
    return results


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--cvc5-timeout-ms", type=int, default=60_000)
    args = parser.parse_args()
    results = run(args.timeout_ms, args.cvc5_timeout_ms)
    print(f"incidence={results['incidence_validation']}")
    for query in results["queries"]:
        print(
            f"{query['query']}: z3py={query['z3']['status']} "
            f"z3-cli={query['z3_cli']['status']} cvc5={query['cvc5']['status']}"
        )
    print(f"first_joint_unsat_stage={results['first_joint_unsat_stage']}")


if __name__ == "__main__":
    main()
