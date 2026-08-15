#!/usr/bin/env python3
"""Deterministically verify the recorded post-core-cut v2 artifacts."""

from __future__ import annotations

import json
import sys
from pathlib import Path
from typing import Any

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import incidence_round
import unified_metric


def load(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text())


def require(test: bool, message: str) -> None:
    if not test:
        raise RuntimeError(message)


def verify_incidence() -> None:
    assignment = load(HERE / "generated/post_core_cut_v2_assignment.json")
    results = load(HERE / "incidence_results.json")
    source = incidence_round.load_source_generator()
    require(source.verify_global_assignment(assignment) == [], "base validation")
    require(incidence_round.validate_cut(assignment) == [], "v2 cut validation")
    require(results["assignment_validation"]["status"] == "PASS", "recorded validation")
    require(results["internal_z3"]["status"] == "SAT", "internal Z3 incidence")
    for solver in ("z3", "cvc5"):
        require(results["external"][solver]["status"] == "SAT", f"{solver} incidence")
    for name in ("smoke_sat", "smoke_malformed_unsat"):
        require(results["controls"][name]["status"] == "PASS", name)
    prior = results["controls"]["prior_assignment_rejected"]
    require(prior["status"] == "PASS", "prior assignment rejection")
    require(
        "c_first first-apex K4 singleton violated by [10]" in prior["errors"],
        "prior failure reason",
    )


def verify_metric() -> None:
    results = load(HERE / "metric_results.json")
    require(results["incidence_validation"] == "PASS", "metric ingress")
    require(
        results.get("first_joint_unsat_stage") == "rich_radius_pattern",
        "first dual UNSAT stage",
    )
    rich = next(
        query
        for query in results["queries"]
        if query.get("stage") == "rich_radius_pattern"
    )
    require(rich["clause_count"] == 921, "rich-radius clause count")
    for solver in ("z3", "cvc5"):
        require(rich[solver]["status"] == "UNSAT", f"rich-radius {solver}")
    for record in results["queries"] + results["controls"]:
        artifact = HERE / record["artifact"]
        require(artifact.read_text().count("(check-sat)") == 1, str(artifact))
        require(record["check_sat_count"] == 1, f"recorded count {artifact}")
        if record["z3"]["status"] == "SAT":
            require(
                record["z3"]["exact_substitution_validation"] == "PASS",
                f"exact replay {artifact}",
            )
            require(
                record["z3"]["fraction_validation"] == "PASS",
                f"Fraction replay {artifact}",
            )
            require(
                record["z3"]["all_model_values_rational"],
                f"rational model {artifact}",
            )
    require(len(results["controls"]) == 4, "metric control count")
    for control in results["controls"]:
        for solver in ("z3", "cvc5"):
            require(control[solver]["status"] == "UNSAT", control["query"])


def verify_summary() -> None:
    summary = load(HERE / "results.json")
    require(
        summary["claims"]
        == {
            "lean_closure": "NONE",
            "p97_counterexample": "NONE",
            "universal_closure": "NONE",
        },
        "claim discipline",
    )
    require(summary["incidence"]["z3"] == "SAT", "summary incidence")
    require(
        summary["metric"]["first_joint_unsat_stage"] == "rich_radius_pattern",
        "summary metric",
    )


def verify_all_smt_files() -> None:
    artifacts = sorted((HERE / "generated").glob("*.smt2"))
    require(bool(artifacts), "SMT artifacts present")
    for artifact in artifacts:
        require(artifact.read_text().count("(check-sat)") == 1, str(artifact))


def main() -> None:
    verify_incidence()
    verify_metric()
    verify_summary()
    verify_all_smt_files()
    assignment = load(HERE / "generated/post_core_cut_v2_assignment.json")
    require(
        unified_metric.validate_incidence_proposal(assignment) == [],
        "metric incidence validator",
    )
    print("PASS post-core-cut-v2 artifacts")


if __name__ == "__main__":
    main()
