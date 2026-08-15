"""Regression and malformed-control tests for the v5 consumer map."""

from __future__ import annotations

import copy
import json
import unittest

import map_consumers as mapper
import verify


class ConsumerMapV5Tests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.data = mapper.load_assignment()
        cls.components, _ = mapper.build_closure(cls.data)
        cls.entitlements = mapper.build_order_entitlements(cls.data)
        cls.artifact = json.loads(mapper.OUTPUT_PATH.read_text())

    def test_frozen_rank_is_not_an_order_premise(self) -> None:
        changed = copy.deepcopy(self.data)
        changed["rank"] = [0] * changed["n"]
        self.assertEqual(mapper.build_order_entitlements(changed), self.entitlements)

    def test_blocker_separation_arms_are_both_required(self) -> None:
        roles = self.data["roles"]
        triple = (
            roles["c_first"],
            self.data["blockers"][roles["c_first"]],
            roles["c_second"],
        )
        self.assertIsNone(self.entitlements["direct"][triple])
        self.assertIsNone(self.entitlements["mirror"][triple])

    def test_reported_frontiers(self) -> None:
        five = self.artifact["five_row"]
        seven = self.artifact["seven_point"]
        self.assertEqual(five["full_mapping_count_theorem_faithful"], 0)
        self.assertEqual(five["best_equality_score_out_of_10_after_all_six_signs"], 6)
        self.assertEqual(seven["full_mapping_count_theorem_faithful"], 0)
        self.assertEqual(seven["minimum_omitted_premises_theorem_faithful"], 2)
        self.assertEqual(seven["minimum_omitted_premises_viable_theorem_faithful"], 4)
        self.assertEqual(
            len(seven["minimal_omission_sets_viable_theorem_faithful"]), 10
        )
        self.assertEqual(seven["minimum_omitted_premises_injective"], 4)
        self.assertEqual(len(seven["minimal_omission_sets_injective"]), 1)

    def test_formal_min_two_maps_are_consumer_infeasible(self) -> None:
        rows = self.artifact["seven_point"]["minimal_omission_sets_theorem_faithful"]
        self.assertEqual(len(rows), 4)
        for row in rows:
            self.assertEqual(
                row["consumer_viability"]["classification"],
                "FORMALLY_MINIMAL_BUT_CONSUMER_INFEASIBLE",
            )
            self.assertTrue(
                any(
                    equation["left"]["diagonal"] or equation["right"]["diagonal"]
                    for equation in row["omitted_metric_equations"]
                )
            )

    def test_viable_and_injective_frontiers_are_non_diagonal(self) -> None:
        seven = self.artifact["seven_point"]
        for key in (
            "minimal_omission_sets_viable_theorem_faithful",
            "minimal_omission_sets_injective",
        ):
            for row in seven[key]:
                self.assertTrue(
                    row["consumer_viability"][
                        "all_missing_fields_have_two_non_diagonal_sides"
                    ]
                )
                self.assertTrue(
                    all(
                        equation["both_sides_non_diagonal"]
                        for equation in row["omitted_metric_equations"]
                    )
                )

    def test_malformed_equality_matrix_is_rejected(self) -> None:
        example = copy.deepcopy(
            self.artifact["five_row"]["minimal_missing_sets_injective"][0]["example"]
        )
        example["equalities"]["OA_AC"] = True
        with self.assertRaises(AssertionError):
            verify.assert_near_example(
                example, mapper.FIVE_FIELDS, self.components, self.entitlements
            )

    def test_complete_verifier_without_manifest(self) -> None:
        self.assertGreaterEqual(len(verify.verify_mapping()), 5)


if __name__ == "__main__":
    unittest.main()
