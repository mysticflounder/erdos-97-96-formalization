from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

import incidence_round
import unified_metric


class IncidenceRoundTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.assignment = json.loads(
            (ROOT / "generated/post_rich_cut_v3_assignment.json").read_text()
        )
        cls.prior = json.loads(
            (ROOT.parent / "generated/refined_global_k4_assignment.json").read_text()
        )
        cls.v2 = json.loads(
            (
                ROOT.parent
                / "post_core_cut_v2/generated/post_core_cut_v2_assignment.json"
            ).read_text()
        )
        cls.results = json.loads((ROOT / "incidence_results.json").read_text())
        cls.source = incidence_round.load_source_generator()

    def test_dual_solver_sat_and_independent_validation(self) -> None:
        self.assertEqual(self.results["external"]["z3"]["status"], "SAT")
        self.assertEqual(self.results["external"]["cvc5"]["status"], "SAT")
        self.assertEqual(self.results["internal_z3"]["status"], "SAT")
        self.assertEqual(self.results["assignment_validation"]["status"], "PASS")
        self.assertEqual(self.source.verify_global_assignment(self.assignment), [])
        self.assertEqual(incidence_round.validate_cut(self.assignment), [])

    def test_first_apex_k4_source_singleton(self) -> None:
        roles = self.assignment["roles"]
        apex = int(roles["apex0"])
        endpoints = {int(roles["apex1"]), int(roles["apex2"])}
        strict_cap = set(map(int, self.assignment["caps"][0])) - endpoints
        support = set(map(int, self.assignment["point_k4_rows"][apex]))
        for source_name in ("c_first", "c_second"):
            source = int(roles[source_name])
            if source in support:
                self.assertEqual(support & strict_cap, {source})

    def test_prior_assignment_is_rejected_by_new_cut(self) -> None:
        errors = incidence_round.validate_cut(self.prior)
        self.assertIn("c_first first-apex K4 singleton violated by [10]", errors)
        control = self.results["controls"]["prior_assignment_rejected"]
        self.assertEqual(control["status"], "PASS")

    def test_v2_assignment_is_rejected_by_rich_support_cut(self) -> None:
        errors = incidence_round.validate_cut(self.v2)
        self.assertTrue(
            any("exact-six D44 selected-support projection" in error for error in errors)
        )
        control = self.results["controls"]["v2_crossed_rich_assignment_rejected"]
        self.assertEqual(control["status"], "PASS")

    def test_exact_six_support_projection_and_branch_record(self) -> None:
        self.assertEqual(
            self.results["nonfirst_rich_branches"],
            [
                {"cap_index": 1, "branch": "D44"},
                {"cap_index": 2, "branch": "D44"},
            ],
        )
        self.assertEqual(incidence_round.validate_cut(self.assignment), [])

    def test_dual_solver_smoke_controls(self) -> None:
        for name in ("smoke_sat", "smoke_malformed_unsat"):
            control = self.results["controls"][name]
            self.assertEqual(control["status"], "PASS")
            for solver in ("z3", "cvc5"):
                self.assertEqual(
                    control["solvers"][solver]["status"], control["expected"]
                )

    def test_incidence_artifacts_have_one_check_sat(self) -> None:
        paths = [ROOT / self.results["query"]]
        paths.extend(
            ROOT / self.results["controls"][name]["artifact"]
            for name in ("smoke_sat", "smoke_malformed_unsat")
        )
        for path in paths:
            self.assertEqual(path.read_text().count("(check-sat)"), 1)


class MetricRoundTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.results = json.loads((ROOT / "metric_results.json").read_text())

    def test_metric_input_revalidates(self) -> None:
        assignment = json.loads(
            (ROOT / "generated/post_rich_cut_v3_assignment.json").read_text()
        )
        errors = (
            unified_metric.validate_incidence_proposal(assignment)
            + unified_metric.validate_retained_first_apex_rich(assignment)
            + incidence_round.validate_cut(assignment)
        )
        self.assertEqual(errors, [])
        self.assertEqual(self.results["incidence_validation"], "PASS")

    def test_every_metric_artifact_has_one_check_sat(self) -> None:
        for record in self.results["queries"] + self.results["controls"]:
            artifact = ROOT / record["artifact"]
            self.assertEqual(record["check_sat_count"], 1)
            self.assertEqual(artifact.read_text().count("(check-sat)"), 1)

    def test_sat_models_are_exactly_validated(self) -> None:
        for record in self.results["queries"] + self.results["controls"]:
            if record["z3"]["status"] == "SAT":
                self.assertEqual(
                    record["z3"]["exact_substitution_validation"], "PASS"
                )
                self.assertEqual(record["z3"]["fraction_validation"], "PASS")
                self.assertTrue(record["z3"]["all_model_values_rational"])

    def test_first_joint_unsat_is_blocker_exactness(self) -> None:
        self.assertEqual(
            self.results["first_joint_unsat_stage"], "blocker_exactness"
        )
        blocker = next(
            query
            for query in self.results["queries"]
            if query.get("stage") == "blocker_exactness"
        )
        self.assertEqual(blocker["clause_count"], 1070)
        self.assertEqual(blocker["z3_cli"]["status"], "UNSAT")
        self.assertEqual(blocker["cvc5"]["status"], "UNSAT")

    def test_malformed_controls_are_dual_solver_unsat(self) -> None:
        self.assertEqual(len(self.results["controls"]), 4)
        for control in self.results["controls"]:
            self.assertEqual(control["z3"]["status"], "UNSAT")
            self.assertEqual(control["z3_cli"]["status"], "UNSAT")
            self.assertEqual(control["cvc5"]["status"], "UNSAT")


if __name__ == "__main__":
    unittest.main()
