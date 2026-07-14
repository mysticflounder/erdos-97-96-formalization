#!/usr/bin/env python3
"""Replay and fail-closed mutation tests for the global-count shadows."""

from __future__ import annotations

import copy
import json
import sys
import unittest
from pathlib import Path


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import validator  # noqa: E402


class GlobalCountBoundaryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        with (HERE / "shadows.json").open() as handle:
            cls.shadows = json.load(handle)

    def case_named(self, name: str) -> dict:
        return copy.deepcopy(
            next(case for case in self.shadows["cases"] if case["name"] == name)
        )

    def test_checkpoint_replays_exactly(self) -> None:
        report = validator.validate_artifact()
        with (HERE / "checkpoint.json").open() as handle:
            checkpoint = json.load(handle)
        self.assertEqual(report, checkpoint)

    def test_both_card12_profiles_validate_only_as_finite_shadows(self) -> None:
        report = validator.validate_artifact()
        self.assertFalse(report["target_faithful"])
        self.assertEqual(report["status"], validator.VALIDATED_STATUS)
        self.assertEqual(
            {tuple(case["profile"]) for case in report["cases"]},
            {(4, 5, 6), (5, 5, 5)},
        )
        self.assertTrue(
            all(case["maximum_joint_off_surplus_fiber"] == 1 for case in report["cases"])
        )

    def test_one_sided_cap_mutation_is_rejected(self) -> None:
        case = self.case_named("card12-profile-5-5-5")
        # At center 5 in cap [4,5,6,7,8], both 6 and 8 lie to the right.
        case["rows"]["5"] = [0, 1, 6, 8]
        with self.assertRaisesRegex(validator.ValidationError, "one-sided"):
            validator.validate_case(case)

    def test_reciprocal_radius_mutation_is_rejected(self) -> None:
        case = self.case_named("card12-profile-5-5-5")
        # Row 1 already contains 0; inserting 1 into row 0 merges their radii.
        case["rows"]["0"] = [1, 6, 7, 9]
        with self.assertRaisesRegex(validator.ValidationError, "reciprocal"):
            validator.validate_case(case)

    def test_common_t2_to_p_provenance_is_fail_closed(self) -> None:
        case = self.case_named("card12-profile-5-5-5")
        case["critical_shell_blocker_map"]["6"] = 1
        with self.assertRaisesRegex(validator.ValidationError, "provenance"):
            validator.validate_case(case)

    def test_joint_apex_pair_mutation_is_rejected(self) -> None:
        case = self.case_named("card12-profile-5-5-5")
        rows = validator.parse_rows(case["rows"], 12)
        rows[4] = frozenset({1, 6, 7, 10})
        with self.assertRaisesRegex(validator.ValidationError, "joint apex-radius"):
            validator.validate_joint_fibers(rows, tuple(case["caps"][0]), 12)

    def test_outside_pair_reuse_mutation_is_rejected(self) -> None:
        case = self.case_named("card12-profile-5-5-5")
        rows = validator.parse_rows(case["rows"], 12)
        # Centers 0 and 1 of the first cap would both use outside pair {6,7}.
        rows[1] = frozenset({0, 6, 7, 10})
        caps = tuple(tuple(cap) for cap in case["caps"])
        with self.assertRaisesRegex(validator.ValidationError, "outside pair"):
            validator.validate_outside_pair_counts(rows, caps, 12)

    def test_cyclic_separation_smoke_gate(self) -> None:
        order = tuple(range(12))
        self.assertTrue(validator.cyclically_separated(order, 3, 9, 0, 6))
        self.assertFalse(validator.cyclically_separated(order, 0, 3, 6, 9))

    def test_legacy_boundary_is_replayed_not_promoted(self) -> None:
        report = validator.validate_artifact()
        by_profile = {tuple(case["profile"]): case for case in report["cases"]}
        self.assertEqual(by_profile[(5, 5, 5)]["legacy_wrong_side_count"], 0)
        self.assertEqual(
            by_profile[(5, 5, 5)]["legacy_opposite_endpoint_chain_count"], 1
        )

    def test_manifest_prevents_euclidean_promotion(self) -> None:
        manifest = validator.load_json(HERE / "manifest.json")
        self.assertFalse(manifest["scope"]["target_faithful"])
        self.assertTrue(manifest["unimplemented_fail_closed"])
        self.assertIn(
            "coordinates in the Euclidean plane",
            manifest["unimplemented_fail_closed"],
        )
        promoted = copy.deepcopy(manifest)
        promoted["scope"]["target_faithful"] = True
        with self.assertRaisesRegex(validator.ValidationError, "target-faithful"):
            validator.validate_manifest(promoted)


if __name__ == "__main__":
    unittest.main()
