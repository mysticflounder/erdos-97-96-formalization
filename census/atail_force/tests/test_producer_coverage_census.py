from __future__ import annotations

import copy
import json
import unittest
from itertools import product

from census.atail_force import producer_bank as bank
from census.atail_force import producer_coverage_census as census
from census.atail_force import producer_surface as surface


class ProducerCoverageCensusTests(unittest.TestCase):
    def test_stored_checkpoint_is_current_and_exhaustive(self) -> None:
        stored = json.loads(census.DEFAULT_CHECKPOINT.read_text(encoding="utf-8"))
        census.validate_checkpoint(stored)
        self.assertEqual(stored, census.build_checkpoint())
        self.assertEqual(
            stored["total_classification_counts"],
            {
                "adjacent_cap_one_hit": 215547,
                "endpoint_radius_containment": 108435,
                "formalized_bank": 44831,
                "survivor": 930,
            },
        )
        self.assertEqual(
            sum(case["target_negating_pairs"] for case in stored["cases"]),
            369743,
        )

    def test_specialized_bank_predicate_matches_full_scanner_samples(self) -> None:
        target_counts = {
            "card11_profile_554": 35010,
            "card12_profile_654": 115745,
            "card12_profile_555": 218988,
        }
        for case in surface.PRODUCER_CASES:
            total = target_counts[case.case_id]
            wanted = {0, total // 4, total // 2, 3 * total // 4, total - 1}
            seen = 0
            checked = 0
            off = set(surface.off_surplus_labels(case))
            second_classes = tuple(
                surface.iter_exact_apex_classes(case, "opp_apex2")
            )
            for first, second in product(
                surface.iter_exact_apex_classes(case, "opp_apex1"),
                second_classes,
            ):
                if len(off & set(first.support) & set(second.support)) > 1:
                    continue
                if seen in wanted:
                    rows = (
                        bank.MetricRow(first.center, first.support, exact=True),
                        bank.MetricRow(second.center, second.support, exact=True),
                    )
                    full = {
                        record["stage"]
                        for record in bank.scan_all_formalized_cores(
                            rows, case.cardinality, census.cyclic_order(case)
                        )
                    }
                    specialized = set(
                        census.two_exact_row_bank_stages(case, first, second)
                    )
                    self.assertEqual(
                        specialized,
                        full,
                        msg=f"{case.case_id} target-negating pair {seen}",
                    )
                    checked += 1
                seen += 1
            self.assertEqual(seen, total)
            self.assertEqual(checked, 5)

    def test_production_one_hit_stage_precedes_scratch_mec_stages(self) -> None:
        stored = json.loads(census.DEFAULT_CHECKPOINT.read_text(encoding="utf-8"))
        cases = {case.case_id: case for case in surface.PRODUCER_CASES}
        for case_record in stored["cases"]:
            case = cases[case_record["case_id"]]
            self.assertIn(census.LEFT_ADJACENT_ONE_HIT, case_record["pattern_counts"])
            self.assertIn(census.RIGHT_ADJACENT_ONE_HIT, case_record["pattern_counts"])
            self.assertEqual(
                case_record["classification_counts"].get(
                    "two_center_mec_inward", 0
                ),
                0,
            )
            self.assertEqual(
                case_record["classification_counts"].get(
                    "boundary_chord_straddling_mec", 0
                ),
                0,
            )
            frame = surface.frame_for_case(case)
            for representative in case_record["representatives"][
                "adjacent_cap_one_hit"
            ]:
                first = set(representative["opp_apex1_support"])
                second = set(representative["opp_apex2_support"])
                expected = set()
                if len(first & set(frame.O2)) >= 2:
                    expected.add(census.LEFT_ADJACENT_ONE_HIT)
                if len(first & set(frame.S)) >= 2:
                    expected.add(census.RIGHT_ADJACENT_ONE_HIT)
                if len(second & set(frame.S)) >= 2:
                    expected.add(census.LEFT_ADJACENT_ONE_HIT)
                if len(second & set(frame.O1)) >= 2:
                    expected.add(census.RIGHT_ADJACENT_ONE_HIT)
                self.assertEqual(set(representative["patterns"]), expected)

    def test_adjacent_cap_role_mapping_is_exact_on_every_current_survivor(self) -> None:
        for case in surface.PRODUCER_CASES:
            frame = surface.frame_for_case(case)
            for first, second in product(
                surface.iter_exact_apex_classes(case, "opp_apex1"),
                surface.iter_exact_apex_classes(case, "opp_apex2"),
            ):
                patterns = set(
                    census.adjacent_cap_one_hit_patterns(case, first, second)
                )
                expected = set()
                if len(set(first.support) & set(frame.O2)) >= 2:
                    expected.add(census.LEFT_ADJACENT_ONE_HIT)
                if len(set(first.support) & set(frame.S)) >= 2:
                    expected.add(census.RIGHT_ADJACENT_ONE_HIT)
                if len(set(second.support) & set(frame.S)) >= 2:
                    expected.add(census.LEFT_ADJACENT_ONE_HIT)
                if len(set(second.support) & set(frame.O1)) >= 2:
                    expected.add(census.RIGHT_ADJACENT_ONE_HIT)
                self.assertEqual(patterns, expected)

    def test_validation_fails_closed_on_count_drift(self) -> None:
        stored = json.loads(census.DEFAULT_CHECKPOINT.read_text(encoding="utf-8"))
        mutated = copy.deepcopy(stored)
        mutated["cases"][0]["target_negating_pairs"] -= 1
        with self.assertRaises(census.CoverageCensusError):
            census.validate_checkpoint(mutated)


if __name__ == "__main__":
    unittest.main()
