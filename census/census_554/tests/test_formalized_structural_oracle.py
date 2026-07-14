from __future__ import annotations

import copy
import json
import unittest

from census.census_554 import formalized_structural_oracle as oracle
from census.census_554 import separation_encoding


LATEST_CUBE = {
    0: [3, 4, 6, 9],
    1: [0, 2, 6, 7],
    2: [0, 1, 9, 10],
    3: [1, 4, 5, 7],
    4: [3, 5, 6, 10],
    5: [2, 4, 8, 10],
    6: [0, 2, 3, 5],
    7: [5, 6, 8, 9],
    8: [1, 2, 4, 6],
    9: [0, 5, 8, 10],
    10: [1, 3, 7, 9],
}


class FormalizedStructuralOracleTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.cube = LATEST_CUBE

    def test_catalog_has_twenty_two_eligible_and_one_explicitly_ineligible_family(self):
        manifest = oracle.catalog_manifest()
        self.assertEqual(len(manifest["families"]), 23)
        self.assertEqual(len(manifest["eligible_family_ids"]), 22)
        self.assertEqual(
            manifest["ineligible_family_ids"],
            ["equality-exact-off-circle.v1"],
        )
        exact = oracle.FAMILY_BY_STAGE["equality-exact-off-circle"]
        self.assertIn("not exact metric circles", exact.ineligible_reason)
        with self.assertRaisesRegex(oracle.StructuralOracleError, "not eligible"):
            oracle.detect_stage(self.cube, exact.stage)

    def test_latest_frontier_emits_minimal_three_triad_paths_and_full_orbit(self):
        scan = oracle.scan_structural_cores(self.cube)
        self.assertTrue(scan.exhaustive)
        self.assertEqual(
            scan.unordered_detection["stage"],
            "equality-three-triad-collision",
        )
        self.assertEqual(
            scan.unordered_detection["core"],
            {"a": 10, "b": 6, "c": 5, "d": 3, "e": 4},
        )
        self.assertEqual(set(scan.pattern), {0, 3, 4, 5, 6, 9, 10})
        self.assertEqual(sum(len(row) for row in scan.pattern.values()), 17)
        oracle.validate_detection(scan.pattern, scan.unordered_detection)
        orbit = oracle.profile_orbit_unordered(
            scan.pattern, scan.unordered_detection["stage"]
        )
        self.assertEqual(len(orbit), 36)
        self.assertEqual(
            len({json.dumps(item["pattern"], sort_keys=True) for item in orbit}),
            36,
        )
        for item in orbit:
            oracle.validate_detection(item["pattern"], item["detection"])

    def test_detection_replay_rejects_path_and_theorem_tampering(self):
        scan = oracle.scan_structural_cores(self.cube)
        detection = scan.unordered_detection
        bad_path = copy.deepcopy(detection)
        bad_path["closure_paths"][0]["steps"] = []
        with self.assertRaisesRegex(oracle.StructuralOracleError, "exactly replay"):
            oracle.validate_detection(scan.pattern, bad_path)

        bad_theorem = copy.deepcopy(detection)
        bad_theorem["theorem_id"] = "Problem97.FalseClaim"
        with self.assertRaisesRegex(oracle.StructuralOracleError, "exactly replay"):
            oracle.validate_detection(scan.pattern, bad_theorem)

    def test_ordered_families_are_bound_to_an_admissible_order(self):
        cube = oracle.normalize_pattern(self.cube, require_full_cube=True)
        found = None
        for order in separation_encoding.valid_orders(cube):
            for family in oracle.ORDERED_FAMILIES:
                if oracle.detect_stage(cube, family.stage, order) is not None:
                    found = oracle.build_detection(cube, family.stage, order)
                    break
            if found is not None:
                break
        self.assertIsNotNone(found)
        self.assertIsNotNone(found["order"])
        oracle.validate_detection(cube, found)
        mapped = oracle.profile_orbit_ordered(cube, [found])
        self.assertEqual(len(mapped), 72)
        for item in mapped:
            self.assertEqual(len(item["detections"]), 1)
            oracle.validate_detection(item["pattern"], item["detections"][0])

    def test_catalog_requires_passed_build_for_probe_use(self):
        manifest = oracle.catalog_manifest()
        self.assertEqual(manifest["build"]["status"], oracle.BUILD_STATUS)
        if oracle.BUILD_STATUS == "passed":
            oracle.validate_catalog_manifest(manifest, require_passed=True)
        else:
            with self.assertRaisesRegex(
                oracle.StructuralOracleError, "build is not passed"
            ):
                oracle.validate_catalog_manifest(manifest, require_passed=True)

    def test_recovered_six_point_two_pair_core_and_orbit_are_exact(self):
        pattern = {
            0: [2, 3, 5], 2: [4, 10], 3: [2, 4],
            5: [2, 3, 4], 10: [0, 3, 4, 5],
        }
        stage = "equality-six-point-two-pair-collision"
        detection = oracle.build_detection(pattern, stage)
        self.assertEqual(
            detection["core"],
            {"a": 0, "b": 2, "c": 3, "d": 4, "e": 5, "f": 10},
        )
        self.assertEqual(len(detection["closure_paths"]), 9)
        self.assertEqual(len(oracle.profile_orbit_unordered(pattern, stage)), 12)

    def test_all_unordered_family_path_schemas_replay(self):
        fixtures = {
            "equality-duplicate-center": {
                0: [2, 3, 4, 5], 1: [2, 3, 4, 6], 2: [0, 1, 5, 6],
            },
            "equality-equal-k4": {
                0: [1, 2, 3, 4], 1: [0, 2, 3, 4], 2: [0, 1, 3, 4],
            },
            "equality-equilateral-bisector-collision": {
                0: [1, 2], 1: [0, 3, 4], 3: [0, 1, 2], 4: [2, 3],
            },
            "equality-three-triad-collision": {
                0: [1, 2], 1: [0, 3], 2: [1, 3, 4], 4: [0, 1, 3],
            },
            "equality-surplus-source-collision": {
                0: [1, 2, 3], 4: [1, 2], 2: [4, 1, 3],
                3: [1, 0, 5], 5: [2, 0], 6: [4, 0, 3, 5],
            },
            "equality-six-row-anchor-collision": {
                0: [7, 9], 1: [0, 7, 8], 7: [1, 9],
                8: [0, 10], 9: [1, 8, 10], 10: [1, 7, 9],
            },
            "equality-six-point-two-pair-collision": {
                0: [2, 3, 5], 2: [4, 10], 3: [2, 4],
                5: [2, 3, 4], 10: [0, 3, 4, 5],
            },
            "equality-six-point-five-circle-collision-a": {
                0: [1, 2], 1: [0, 2, 3, 4], 3: [2, 4, 5],
                4: [0, 3, 5], 5: [0, 1],
            },
            "equality-six-point-five-circle-collision-b": {
                1: [0, 2, 4], 2: [0, 1, 3, 5], 3: [0, 5],
                4: [0, 2], 5: [1, 3, 4],
            },
            "equality-six-point-five-circle-collision-c": {
                1: [0, 2, 3, 4], 2: [0, 1, 5], 3: [0, 4],
                4: [2, 3, 5], 5: [1, 4],
            },
            "equality-seven-point-five-circle-collision": {
                0: [1, 2, 3], 1: [0, 2, 4, 5], 4: [0, 3, 5, 6],
                5: [2, 4, 6], 6: [0, 3],
            },
            "equality-eight-point-five-circle-collision": {
                1: [0, 2, 4, 5], 2: [0, 1, 6, 7], 5: [2, 4, 6],
                6: [3, 4, 7], 7: [1, 5, 6],
            },
            "equality-six-point-circle-chain-collision": {
                1: [0, 2, 6], 2: [0, 1, 9, 10], 6: [2, 9],
                9: [0, 10], 10: [1, 6, 9],
            },
            "equality-seven-point-six-circle-collision": {
                0: [1, 2], 2: [0, 1, 4, 5], 3: [0, 2, 6],
                4: [2, 3, 5], 5: [0, 1], 6: [1, 3, 5],
            },
            "equality-seven-point-six-circle-collision-b": {
                0: [1, 4], 1: [0, 7], 7: [0, 4, 10],
                8: [1, 7, 9, 10], 9: [0, 1, 8], 10: [0, 4, 9],
            },
            "equality-seven-point-twin-four-circle-collision": {
                0: [1, 2], 1: [0, 3], 2: [1, 3, 5],
                4: [0, 2, 5, 6], 5: [1, 3, 4, 6], 6: [0, 1],
            },
            "equality-seven-point-orbit-collision": {
                0: [1, 3, 4], 1: [0, 3, 8, 9], 3: [4, 5, 8],
                4: [1, 8], 5: [4, 9], 8: [1, 5, 9], 9: [0, 3, 5],
            },
            "equality-seven-point-circle-network-collision": {
                0: [1, 2, 7], 1: [0, 9], 2: [0, 6, 10],
                6: [1, 7, 10], 7: [2, 9, 10], 9: [2, 10], 10: [0, 7],
            },
            "equality-perpendicular-bisector-convex": {
                2: [0, 1, 5, 6], 3: [0, 1, 5, 6], 4: [0, 1, 5, 6],
            },
        }
        self.assertEqual(
            {family.stage for family in oracle.UNORDERED_FAMILIES},
            set(fixtures),
        )
        for stage, pattern in fixtures.items():
            with self.subTest(stage=stage):
                detection = oracle.build_detection(pattern, stage)
                oracle.validate_detection(pattern, detection)
                self.assertGreater(len(detection["closure_paths"]), 0)

    def test_forward_reverse_and_rhombus_order_variants_replay(self):
        self.assertEqual(
            set(oracle.ORDERED_STAGE_VARIANTS),
            {
                "equality-convex-five-point",
                "equality-convex-rhombus-equilateral",
                (
                    "equality-convex-eight-point-"
                    "five-row-circle-intersection-order"
                ),
                "equality-convex-five-point-reverse",
                "equality-convex-rhombus-equilateral-reverse",
                (
                    "equality-convex-eight-point-"
                    "five-row-circle-intersection-order-reverse"
                ),
            },
        )
        five_row_order = next(
            order for order in separation_encoding.all_orders()
            if order.orientation == "direct"
            and order.positions[0] < order.positions[1] < order.positions[3]
            < order.positions[4] < order.positions[2]
        )
        five_row_pattern = {
            0: [1, 2, 3, 4],
            1: [0, 2, 6],
            2: [3, 9],
            3: [1, 5, 6],
            4: [0, 5, 9],
        }
        five_row_stage = (
            "equality-convex-eight-point-"
            "five-row-circle-intersection-order"
        )
        five_row_detection = oracle.build_detection(
            five_row_pattern, five_row_stage, five_row_order
        )
        self.assertEqual(
            five_row_detection["core"],
            {
                "O": 0, "A": 1, "C": 2, "D": 3,
                "E": 4, "X5": 5, "X6": 6, "X9": 9,
            },
        )
        self.assertEqual(len(five_row_detection["closure_paths"]), 10)
        self.assertEqual(
            five_row_detection["theorem_id"],
            (
                "Problem97.Census554.FiveRowCircleIntersectionOrderCore."
                "false_of_core_of_neg"
            ),
        )
        oracle.validate_detection(five_row_pattern, five_row_detection)

        mirror_order = next(
            order for order in separation_encoding.all_orders()
            if order.orientation == "mirror"
            and order.internal_index == five_row_order.internal_index
        )
        reverse_five_row_detection = oracle.build_detection(
            five_row_pattern, five_row_stage + "-reverse", mirror_order
        )
        self.assertEqual(
            reverse_five_row_detection["theorem_id"],
            (
                "Problem97.Census554.FiveRowCircleIntersectionOrderCore."
                "false_of_core"
            ),
        )
        oracle.validate_detection(
            five_row_pattern, reverse_five_row_detection
        )
        reverse_order = separation_encoding.all_orders()[0]
        a, x, b, c, y = tuple(reversed(reverse_order.labels))[:5]
        reverse_pattern = {
            x: [a, b],
            y: [a, b],
            c: [b, x, y],
        }
        reverse_detection = oracle.build_detection(
            reverse_pattern, "equality-convex-five-point-reverse", reverse_order
        )
        self.assertEqual(
            reverse_detection["theorem_id"],
            "Problem97.Census554.ConvexFivePointCore.false_of_core",
        )
        oracle.validate_detection(reverse_pattern, reverse_detection)

        order = separation_encoding.all_orders()[0]
        a, b, c, x, y, d = order.labels[:6]
        rhombus_pattern = {
            a: [b, d, x],
            b: [a, c, y],
            c: [b, d, y],
            x: [a, d],
        }
        rhombus_detection = oracle.build_detection(
            rhombus_pattern, "equality-convex-rhombus-equilateral", order
        )
        oracle.validate_detection(rhombus_pattern, rhombus_detection)

        reverse_labels = tuple(reversed(order.labels))
        a, b, c, x, y, d = reverse_labels[:6]
        reverse_rhombus_pattern = {
            a: [b, d, x],
            b: [a, c, y],
            c: [b, d, y],
            x: [a, d],
        }
        reverse_rhombus_detection = oracle.build_detection(
            reverse_rhombus_pattern,
            "equality-convex-rhombus-equilateral-reverse",
            order,
        )
        self.assertEqual(
            reverse_rhombus_detection["theorem_id"],
            "Problem97.Census554.ConvexRhombusCore.false_of_core",
        )
        oracle.validate_detection(
            reverse_rhombus_pattern, reverse_rhombus_detection
        )


if __name__ == "__main__":
    unittest.main()
