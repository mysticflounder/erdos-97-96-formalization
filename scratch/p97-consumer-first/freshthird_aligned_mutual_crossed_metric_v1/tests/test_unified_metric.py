from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path

import z3

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

import incidence_refine
import unified_metric as diagnostic


class UnifiedMetricTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.assignment = diagnostic.load_assignment()
        cls.encoding = diagnostic.UnifiedEncoding(cls.assignment)

    def test_incidence_proposal(self) -> None:
        self.assertEqual(diagnostic.validate_incidence_proposal(self.assignment), [])

    def test_exactness_only_at_actual_blocker_image(self) -> None:
        self.assertEqual(
            diagnostic.blocker_centers(self.assignment),
            (1, 2, 5, 6, 7, 8, 10, 11, 12, 13, 15),
        )
        self.assertEqual(
            diagnostic.unused_k4_centers(self.assignment), (0, 3, 4, 9, 14, 16)
        )
        exact_names = {
            clause.name for clause in self.encoding.groups["blocker_exactness"]
        }
        for center in diagnostic.unused_k4_centers(self.assignment):
            self.assertFalse(
                any(name.startswith(f"blocker_exact_{center}_") for name in exact_names)
            )

    def test_minimized_cores_and_all_one_clause_drops(self) -> None:
        for clauses in diagnostic.minimized_singleton_rich_cores(
            self.encoding
        ).values():
            self.assertEqual(len(clauses), 3)
            solver = z3.SolverFor("QF_NRA")
            solver.add(*(clause.formula for clause in clauses))
            self.assertEqual(solver.check(), z3.unsat)
            for dropped in range(3):
                retained = [
                    clause for index, clause in enumerate(clauses) if index != dropped
                ]
                drop_solver = z3.SolverFor("QF_NRA")
                drop_solver.add(*(clause.formula for clause in retained))
                self.assertEqual(drop_solver.check(), z3.sat)
                status, errors = diagnostic.fraction_validate(
                    self.encoding, retained, drop_solver.model()
                )
                self.assertEqual((status, errors), ("PASS", []))

    def test_smt_artifact_has_one_check_sat(self) -> None:
        clauses = next(
            iter(diagnostic.minimized_singleton_rich_cores(self.encoding).values())
        )
        text = diagnostic.one_check_smt2(clauses)
        self.assertEqual(text.count("(check-sat)"), 1)


class CorrectedRoundArtifactTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.corrected = json.loads(
            (ROOT / "generated/refined_global_k4_assignment.json").read_text()
        )
        cls.incidence_results = json.loads(
            (ROOT / "incidence_refinement_results.json").read_text()
        )
        cls.metric_results = json.loads(
            (ROOT / "refined_metric_results.json").read_text()
        )
        cls.summary = json.loads((ROOT / "results.json").read_text())

    def test_corrected_incidence_cut_and_exact_first_cap_composition(self) -> None:
        self.assertEqual(incidence_refine.validate_cut(self.corrected), [])
        roles = self.corrected["roles"]
        endpoints = {roles["apex1"], roles["apex2"]}
        strict_first_cap = set(self.corrected["caps"][0]) - endpoints
        expected = {
            roles["p1"],
            roles["p2"],
            roles["r1"],
            roles["r2"],
            roles["c_first"],
            roles["c_second"],
        }
        self.assertEqual(strict_first_cap, expected)
        self.assertEqual(len(expected), 6)

    def test_corrected_incidence_is_dual_solver_sat_and_validated(self) -> None:
        self.assertEqual(self.incidence_results["external"]["z3"]["status"], "SAT")
        self.assertEqual(self.incidence_results["external"]["cvc5"]["status"], "SAT")
        self.assertEqual(self.incidence_results["internal_z3"]["status"], "SAT")
        self.assertEqual(
            self.incidence_results["assignment_validation"]["status"], "PASS"
        )

    def test_corrected_blocker_exactness_scope(self) -> None:
        self.assertEqual(
            diagnostic.blocker_centers(self.corrected),
            (0, 1, 2, 3, 4, 6, 7, 8, 9, 11, 12),
        )
        self.assertEqual(
            diagnostic.unused_k4_centers(self.corrected), (5, 10, 13, 14, 15, 16)
        )

    def test_final_shared_coordinate_stage_is_dual_solver_unsat(self) -> None:
        self.assertEqual(
            self.metric_results["first_joint_unsat_stage"],
            "named_rows_and_singletons",
        )
        final = next(
            query
            for query in self.metric_results["queries"]
            if query.get("stage") == "named_rows_and_singletons"
        )
        self.assertEqual(final["clause_count"], 1083)
        self.assertEqual(final["z3"]["status"], "UNSAT")
        self.assertEqual(final["cvc5"]["status"], "UNSAT")

    def test_malformed_controls_are_dual_solver_unsat(self) -> None:
        expected = {
            "refined_malformed_reversed_boundary",
            "refined_malformed_break_k4_equality",
            "refined_malformed_equal_rich_radii",
            "refined_malformed_break_singleton",
        }
        controls = {
            control["query"]: control for control in self.metric_results["controls"]
        }
        self.assertEqual(set(controls), expected)
        for control in controls.values():
            self.assertEqual(control["z3"]["status"], "UNSAT")
            self.assertEqual(control["cvc5"]["status"], "UNSAT")

    def test_every_refined_solver_artifact_has_one_check_sat(self) -> None:
        for record in self.metric_results["queries"] + self.metric_results["controls"]:
            artifact = ROOT / record["artifact"]
            self.assertEqual(record["check_sat_count"], 1)
            self.assertEqual(artifact.read_text().count("(check-sat)"), 1)

    def test_canonical_summary_makes_no_closure_or_counterexample_claim(self) -> None:
        self.assertEqual(
            self.summary["phases"]["original_frozen_assignment"]["status"],
            "SOURCE_THEORETICALLY_INVALID",
        )
        self.assertEqual(
            self.summary["phases"]["corrected_incidence_assignment"]["status"],
            "SAT",
        )
        self.assertEqual(
            self.summary["phases"]["corrected_shared_coordinate_assignment"]["status"],
            "UNSAT",
        )
        self.assertEqual(
            self.summary["phases"]["corrected_shared_coordinate_assignment"][
                "minimized_joint_core"
            ],
            "NOT_COMPUTED",
        )
        self.assertEqual(
            self.summary["claims"],
            {
                "p97_counterexample": "NONE",
                "universal_closure": "NONE",
                "lean_closure": "NONE",
            },
        )


if __name__ == "__main__":
    unittest.main()
