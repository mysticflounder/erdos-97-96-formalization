"""Replay the incidence and artifact-level checks for this finite probe."""

from __future__ import annotations

import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import unified_metric as metric


def main() -> None:
    assignment = metric.load_assignment()
    errors = metric.validate_incidence_proposal(assignment)
    errors += metric.validate_retained_first_apex_rich(assignment)
    if errors:
        raise SystemExit("incidence failure: " + "; ".join(errors))
    results = json.loads((HERE / "metric_results.json").read_text())
    assert results["incidence_validation"] == "PASS"
    assert results["closure_claim"] == "NONE"
    assert results["first_joint_unsat_stage"] == "rich_radius_pattern"
    for item in results["source_valid_sat_controls"]:
        assert item["z3"]["status"] == "SAT"
        assert item["z3_cli"]["status"] == "SAT"
        assert item["cvc5"]["status"] == "SAT"
        assert item["z3"]["fraction_validation"] == "PASS"
    for item in results["controls"]:
        assert item["z3"]["status"] == "UNSAT"
        assert item["z3_cli"]["status"] == "UNSAT"
        assert item["cvc5"]["status"] == "UNSAT"
    print("PASS same-blocker exact-17 probe artifacts")


if __name__ == "__main__":
    main()
