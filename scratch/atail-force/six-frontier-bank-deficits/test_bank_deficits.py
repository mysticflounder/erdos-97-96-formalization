#!/usr/bin/env python3
"""Focused regression tests for ``bank_deficits.py``."""

from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path


MODULE_PATH = Path(__file__).resolve().with_name("bank_deficits.py")
SPEC = importlib.util.spec_from_file_location("six_frontier_bank_deficits", MODULE_PATH)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"cannot load {MODULE_PATH}")
bd = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(bd)


COMMON = "Problem97.u5_qcritical_exact_selected_mid_aux_qcritical_collision_metric_incompatibility"
U1 = "Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction"


class BankDeficitTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.declarations, cls.skipped, cls.preflight = bd.load_declarations()
        cls.parsed = {
            str(item["declaration"]["fq_name"]): item["parsed"]
            for item in cls.declarations
        }
        cls.frontiers = {item.shard_index: item for item in bd.load_frontiers()}

    def test_registry_grammar_partition(self) -> None:
        self.assertEqual(self.preflight["deduplicated_false_metric_declarations"], 136)
        self.assertEqual(self.preflight["simple_parsed_declarations"], 131)
        self.assertEqual(self.preflight["skipped_non_simple_declarations"], 5)
        skipped_names = {str(item["fq_name"]) for item in self.skipped}
        self.assertNotIn(
            "Problem97.u5_equilateral_circumcenter_on_p_circle_metric_incompatibility",
            skipped_names,
        )

    def test_u1_exact_and_deficit_frontier_split(self) -> None:
        expected = {0: 1, 1: 0, 2: 0, 3: 0, 16: 2, 20: 0}
        for shard, count in expected.items():
            result = bd.match_theorem(self.frontiers[shard], self.parsed[U1])
            self.assertEqual(result["exact_assignment_count"], 0)
            self.assertEqual(result["deficit_one_completion_count"], count)
        shard_zero = bd.match_theorem(self.frontiers[0], self.parsed[U1])
        self.assertEqual(
            shard_zero["deficit_one_completions"][0]["canonical_missing_hypotheses"],
            ["h4"],
        )

    def test_shard_three_atomization_reconciliation(self) -> None:
        result = bd.match_theorem(self.frontiers[3], self.parsed[COMMON])
        completions = result["deficit_one_completions"]
        self.assertEqual(len(completions), 2)
        self.assertEqual(
            {int(item["source_order_star_atomic_deficit_count"]) for item in completions},
            {2, 5},
        )
        for item in completions:
            assignment = dict(item["first_assignment"])
            self.assertEqual(len(set(assignment.values())), len(assignment))
            bd.direct_replay_mapping(
                self.frontiers[3],
                self.parsed[COMMON],
                assignment,
                list(item["missing_equality"]),
            )

    def test_apex_row_normalization_uses_full_source_rows(self) -> None:
        for frontier in self.frontiers.values():
            for grid in bd.apex_rows(frontier):
                self.assertEqual(grid["first_apex_row_centers"], [1])
                self.assertEqual(grid["second_apex_row_centers"], [2])


if __name__ == "__main__":
    unittest.main()
