from __future__ import annotations

import copy
import unittest

from census.atail_force import producer_pattern_census as census
from census.atail_force import producer_surface as surface


class ProducerPatternCensusTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.selected = {
            case.case_id: census.select_assignments(case)
            for case in surface.PRODUCER_CASES
        }

    def test_selects_eight_target_negating_bank_clean_assignments_per_case(self) -> None:
        for case in surface.PRODUCER_CASES:
            with self.subTest(case=case.case_id):
                items = self.selected[case.case_id]
                self.assertEqual(len(items), 8)
                self.assertEqual(
                    [item.assignment_id for item in items],
                    [f"{case.case_id}_a{index:02d}" for index in range(8)],
                )
                for item in items:
                    self.assertTrue(
                        surface.no_shared_off_surplus_pair(case, item.assignment)
                    )
                    self.assertEqual(len(item.input_sha256), 64)

    def test_named_core_parser_accepts_quoted_and_plain_names(self) -> None:
        known = (
            "GAUGE_1_X",
            "MEC_RADIUS_POS",
            "EXACT_FILTER_opp_apex1_exact_2",
        )
        self.assertEqual(
            census.parse_named_unsat_core(
                "unsat\n(|GAUGE_1_X| MEC_RADIUS_POS\n"
                " |EXACT_FILTER_opp_apex1_exact_2|)\n",
                known,
            ),
            known,
        )
        with self.assertRaises(census.PatternCensusError):
            census.parse_named_unsat_core("unsat\n(FOREIGN)\n", known)
        with self.assertRaises(census.PatternCensusError):
            census.parse_named_unsat_core("unknown\n", known)

    def test_atom_normalization_forgets_interior_indices(self) -> None:
        item = self.selected["card11_profile_554"][0]
        atom = next(
            atom
            for atom in item.system.atoms
            if atom.family == "strict-convex-order" and "_10_" in atom.name
        )
        shaped = census.normalize_atom_shape(atom, item)
        self.assertIn("O2_INTERIOR", shaped)
        self.assertNotRegex(shaped, r"(?<![A-Za-z])10(?![A-Za-z])")

    def test_fake_bounded_run_reports_recurring_cores_and_survivors(self) -> None:
        calls = 0

        def runner(system, _enabled):
            nonlocal calls
            calls += 1
            if calls % 3 == 0:
                return {"status": "UNKNOWN", "stdout": "unknown\n", "stderr": "bounded"}
            names = system.atom_names()[:2]
            return {
                "status": "UNSAT",
                "stdout": f"unsat\n(|{names[0]}| |{names[1]}|)\n",
                "stderr": "",
                "returncode": 0,
            }

        document = census.run_census(runner=runner)
        self.assertEqual(calls, 24)
        self.assertEqual(document["policy"]["retries"], 0)
        self.assertEqual(document["summary"]["status_counts"], {"UNKNOWN": 8, "UNSAT": 16})
        self.assertEqual(len(document["summary"]["survivors"]), 8)
        self.assertTrue(document["summary"]["recurring_cores"])
        census.validate_checkpoint(document)

        mutated = copy.deepcopy(document)
        mutated["results"][0]["geometry"]["input_sha256"] = "0" * 64
        body = {key: value for key, value in mutated.items() if key != "checkpoint_sha256"}
        mutated["checkpoint_sha256"] = census._json_digest(body)
        with self.assertRaises(census.PatternCensusError):
            census.validate_checkpoint(mutated)

    def test_budget_cannot_auto_extend(self) -> None:
        case = surface.PRODUCER_CASES[0]
        with self.assertRaises(census.PatternCensusError):
            census.select_assignments(case, count=census.ASSIGNMENTS_PER_CASE + 1)


if __name__ == "__main__":
    unittest.main()
