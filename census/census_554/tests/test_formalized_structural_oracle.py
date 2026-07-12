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

    def test_catalog_has_eleven_eligible_and_one_explicitly_ineligible_family(self):
        manifest = oracle.catalog_manifest()
        self.assertEqual(len(manifest["families"]), 12)
        self.assertEqual(len(manifest["eligible_family_ids"]), 11)
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
                "equality-convex-five-point-reverse",
                "equality-convex-rhombus-equilateral-reverse",
            },
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
