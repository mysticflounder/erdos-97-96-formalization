#!/usr/bin/env python3
"""Deterministically verify the recorded post-rich-cut v3 artifacts."""

from __future__ import annotations

import hashlib
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
    assignment = load(HERE / "generated/post_rich_cut_v3_assignment.json")
    results = load(HERE / "incidence_results.json")
    source = incidence_round.load_source_generator()
    require(source.verify_global_assignment(assignment) == [], "base validation")
    require(incidence_round.validate_cut(assignment) == [], "v3 cut validation")
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
    v2 = results["controls"]["v2_crossed_rich_assignment_rejected"]
    require(v2["status"] == "PASS", "v2 rich-crossing assignment rejection")
    require(
        any(
            "exact-six D44 selected-support projection" in error
            for error in v2["errors"]
        ),
        "v2 rich-crossing failure reason",
    )
    require(
        results["nonfirst_rich_branches"]
        == [
            {"cap_index": 1, "branch": "D44"},
            {"cap_index": 2, "branch": "D44"},
        ],
        "nonfirst exact-six branch record",
    )


def verify_metric() -> None:
    results = load(HERE / "metric_results.json")
    require(results["incidence_validation"] == "PASS", "metric ingress")
    require(
        results.get("first_joint_unsat_stage") == "blocker_exactness",
        "first dual UNSAT stage",
    )
    blocker = next(
        query
        for query in results["queries"]
        if query.get("stage") == "blocker_exactness"
    )
    require(blocker["clause_count"] == 1070, "blocker-exactness clause count")
    for solver in ("z3_cli", "cvc5"):
        require(
            blocker[solver]["status"] == "UNSAT", f"blocker-exactness {solver}"
        )
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
        for solver in ("z3", "z3_cli", "cvc5"):
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
        summary["incidence"]["nonfirst_branch_counts"] == {"D44": 2, "S6": 0},
        "summary branch counts",
    )
    require(
        summary["incidence"]["survivors_passing_independent_validation"] == 1,
        "summary validated survivor",
    )
    require(
        summary["metric"]["first_joint_unsat_stage"] == "blocker_exactness",
        "summary metric",
    )
    require(summary["metric"]["clause_count"] == 1070, "summary clause count")
    require(summary["metric"]["z3_cli"] == "UNSAT", "summary Z3 CLI")
    require(summary["metric"]["cvc5"] == "UNSAT", "summary cvc5")


def verify_sha_manifest() -> None:
    manifest = HERE / "SHA256SUMS"
    require(manifest.is_file(), "SHA256SUMS present")
    for line in manifest.read_text().splitlines():
        digest, relative = line.split("  ", 1)
        payload = (HERE / relative).read_bytes()
        require(hashlib.sha256(payload).hexdigest() == digest, f"SHA256 {relative}")


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
    verify_sha_manifest()
    assignment = load(HERE / "generated/post_rich_cut_v3_assignment.json")
    require(
        unified_metric.validate_incidence_proposal(assignment) == [],
        "metric incidence validator",
    )
    print("PASS post-rich-cut-v3 artifacts")


if __name__ == "__main__":
    main()
