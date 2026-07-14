#!/usr/bin/env python3
"""Smoke and replay tests for the card-12 Q-C finite-shadow preflight."""

from __future__ import annotations

import copy
import json
import sys
import unittest
from pathlib import Path


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import query  # noqa: E402
import validator  # noqa: E402
from census.global_confinement import shadow  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402


class SecondCenterQueryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.artifact = query.build_artifact()

    def test_checkpoint_replays_exactly(self) -> None:
        with (HERE / "checkpoint.json").open() as handle:
            expected = json.load(handle)
        self.assertEqual(query.checkpoint_summary(self.artifact), expected)

    def test_both_profiles_validate_as_finite_shadow_only(self) -> None:
        report = validator.validate_artifact(self.artifact)
        self.assertTrue(report["all_validated"])
        self.assertEqual(report["case_count"], 2)
        self.assertEqual(
            {tuple(row["profile"]) for row in report["reports"]},
            {(4, 5, 6), (5, 5, 5)},
        )

    def test_qc_smoke_detects_a_known_second_center(self) -> None:
        case = self.artifact["cases"][0]
        frame = mc.build_frame(tuple(case["profile"]))
        p = case["labels"]["p"]
        dangerous = frozenset(case["dangerous_support"])
        # For this seed, O1 contains p=0 and center=2, while 1 and 3 are
        # dangerous-row points outside O1.  The synthetic row is a known Q-C
        # violation; this smoke gate checks the negation is not vacuous.
        violating = shadow.ClassRow(
            "smoke:violating", 2, frozenset((1, 3, 8, 9)), exact=True
        )
        with self.assertRaisesRegex(AssertionError, "Q-C violation"):
            validator.validate_qc_negation(
                frame, p=p, dangerous=dangerous, rows=(violating,)
            )

    def test_system_source_membership_is_fail_closed(self) -> None:
        case = copy.deepcopy(self.artifact["cases"][0])
        system = next(row for row in case["rows"] if row["name"] == "system:0")
        system["source"] = 1
        broken = copy.deepcopy(self.artifact)
        broken["cases"][0] = case
        with self.assertRaises(AssertionError):
            validator.validate_artifact(broken)

    def test_manifest_prevents_target_faithful_promotion(self) -> None:
        manifest = validator.load_manifest()
        self.assertFalse(manifest["scope"]["target_faithful"])
        self.assertTrue(manifest["unimplemented_fail_closed"])
        self.assertTrue(
            all(
                case["solver"]["reported_status"] == "SAT_FINITE_SHADOW_ONLY"
                for case in self.artifact["cases"]
            )
        )


if __name__ == "__main__":
    unittest.main()
