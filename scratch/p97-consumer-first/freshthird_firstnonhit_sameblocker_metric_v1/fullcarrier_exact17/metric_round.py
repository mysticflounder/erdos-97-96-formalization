#!/usr/bin/env python3
"""Shared-coordinate replay after the exact-six rich-support preflight."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

import unified_metric as metric

HERE = Path(__file__).resolve().parent
ASSIGNMENT = HERE / "generated" / "sameblocker_assignment.json"
RESULTS = HERE / "metric_results.json"


def run(timeout_ms: int, cvc5_timeout_ms: int) -> dict[str, Any]:
    assignment = json.loads(ASSIGNMENT.read_text())
    incidence_errors = metric.validate_incidence_proposal(
        assignment
    ) + metric.validate_retained_first_apex_rich(assignment)
    if incidence_errors:
        raise RuntimeError("invalid refined proposal: " + "; ".join(incidence_errors))
    encoding = metric.UnifiedEncoding(assignment)
    results: dict[str, Any] = {
        "scope": "exact-17 retained FreshThird same-blocker x same-blocker packet",
        "source_assignment": str(ASSIGNMENT.relative_to(HERE)),
        "incidence_validation": "PASS",
        "fidelity": (
            "source-entitled shared-coordinate assignment test after global K4, "
            "minimality/image exactness, cap geometry, retained D44 projections, "
            "and Q/C same-blocker exact support; incomplete as an "
            "original-P97 model"
        ),
        "counterexample_interpretation": (
            "a SAT result here is still not a P97 counterexample because complete "
            "source ingress is not encoded"
        ),
        "closure_claim": "NONE",
        "queries": [],
        "controls": [],
        "blocker_image_centers": metric.blocker_centers(assignment),
        "unused_k4_centers_without_exactness": metric.unused_k4_centers(assignment),
        "nonfirst_rich_branches": [
            {
                "cap_index": cap_index,
                "branch": ("D44" if assignment["rich_two_arm"][cap_index] else "S6"),
            }
            for cap_index in (1, 2)
        ],
        "rejected_unsourced_controls": [
            {
                "name": "exactness_at_unused_k4_center",
                "status": "REJECTED_UNSOURCED",
                "centers": metric.unused_k4_centers(assignment),
            }
        ],
        "omitted_scope": [
            "complete original P97 and CriticalShellSystem ingress",
            "the two deletion residual constructors",
            "the other FreshThird constructors and arm combinations",
            "coverage of all exact-17 assignments",
            "all cardinalities other than 17",
            "a universal finite-core lift",
        ],
    }
    results["queries"].append(
        metric.run_query(
            "sameblocker_row_equalities_only_preflight",
            encoding,
            encoding.row_preflight_clauses(),
            timeout_ms,
            cvc5_timeout_ms,
        )
    )
    # A small source-valid SAT control keeps the exact-rational replay path
    # exercised independently of the expensive full-carrier stages.
    source_sat = [
        clause
        for clause in encoding.groups["geometry_core"]
        if clause.name.startswith("gauge_") or clause.name.startswith("mec_apex_")
    ]
    results["source_valid_sat_controls"] = [
        metric.run_query(
            "sameblocker_source_valid_sat_geometry_gauge",
            encoding,
            source_sat,
            min(timeout_ms, 10_000),
            min(cvc5_timeout_ms, 10_000),
        )
    ]
    for stage in metric.STAGES:
        outcome = metric.run_query(
            f"sameblocker_{stage}",
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
                "sameblocker_" + name,
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
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--cvc5-timeout-ms", type=int, default=10_000)
    args = parser.parse_args()
    results = run(args.timeout_ms, args.cvc5_timeout_ms)
    print(f"incidence={results['incidence_validation']}")
    for query in results["queries"]:
        print(
            f"{query['query']}: z3py={query['z3']['status']} "
            f"z3-cli={query['z3_cli']['status']} "
            f"cvc5={query['cvc5']['status']}"
        )


if __name__ == "__main__":
    main()
