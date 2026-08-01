# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import unittest

from census.global_confinement import metric_realizability_probe as metric
from census.global_confinement.cap_selected_nogood_certificate_probe import (
    _certificate_for_detection,
    _closure_path,
    _key_from_rows_json,
    _subsumption_minimize,
    _validate_certificate,
    _validate_closure_path,
)
from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _formalized_metric_core,
)


class CapSelectedNogoodCertificateProbeTests(unittest.TestCase):
    def test_all_extended_order_independent_families_export_and_replay(self) -> None:
        fixtures = {
            "equality-six-point-two-pair-collision": {
                0: [2, 3, 5],
                2: [4, 10],
                3: [2, 4],
                5: [2, 3, 4],
                10: [0, 3, 4, 5],
            },
            "equality-six-point-five-circle-collision-a": {
                0: [1, 2],
                1: [0, 2, 3, 4],
                3: [2, 4, 5],
                4: [0, 3, 5],
                5: [0, 1],
            },
            "equality-six-point-five-circle-collision-b": {
                1: [0, 2, 4],
                2: [0, 1, 3, 5],
                3: [0, 5],
                4: [0, 2],
                5: [1, 3, 4],
            },
            "equality-six-point-five-circle-collision-c": {
                1: [0, 2, 3, 4],
                2: [0, 1, 5],
                3: [0, 4],
                4: [2, 3, 5],
                5: [1, 4],
            },
            "equality-seven-point-five-circle-collision": {
                0: [1, 2, 3],
                1: [0, 2, 4, 5],
                4: [0, 3, 5, 6],
                5: [2, 4, 6],
                6: [0, 3],
            },
            "equality-eight-point-five-circle-collision": {
                1: [0, 2, 4, 5],
                2: [0, 1, 6, 7],
                5: [2, 4, 6],
                6: [3, 4, 7],
                7: [1, 5, 6],
            },
            "equality-six-point-circle-chain-collision": {
                1: [0, 2, 6],
                2: [0, 1, 9, 10],
                6: [2, 9],
                9: [0, 10],
                10: [1, 6, 9],
            },
            "equality-seven-point-six-circle-collision": {
                0: [1, 2],
                2: [0, 1, 4, 5],
                3: [0, 2, 6],
                4: [2, 3, 5],
                5: [0, 1],
                6: [1, 3, 5],
            },
            "equality-seven-point-six-circle-collision-b": {
                0: [1, 4],
                1: [0, 7],
                7: [0, 4, 10],
                8: [1, 7, 9, 10],
                9: [0, 1, 8],
                10: [0, 4, 9],
            },
            "equality-seven-point-twin-four-circle-collision": {
                0: [1, 2],
                1: [0, 3],
                2: [1, 3, 5],
                4: [0, 2, 5, 6],
                5: [1, 3, 4, 6],
                6: [0, 1],
            },
        }
        finders = {
            "equality-six-point-two-pair-collision":
                metric._six_point_two_pair_collision_core_from_closure,
            "equality-six-point-five-circle-collision-a":
                metric._six_point_five_circle_collision_core_a_from_closure,
            "equality-six-point-five-circle-collision-b":
                metric._six_point_five_circle_collision_core_b_from_closure,
            "equality-six-point-five-circle-collision-c":
                metric._six_point_five_circle_collision_core_c_from_closure,
            "equality-seven-point-five-circle-collision":
                metric._seven_point_five_circle_collision_core_from_closure,
            "equality-eight-point-five-circle-collision":
                metric._eight_point_five_circle_collision_core_from_closure,
            "equality-six-point-circle-chain-collision":
                metric._six_point_circle_chain_collision_core_from_closure,
            "equality-seven-point-six-circle-collision":
                metric._seven_point_six_circle_collision_core_from_closure,
            "equality-seven-point-six-circle-collision-b":
                metric._seven_point_six_circle_collision_core_b_from_closure,
            "equality-seven-point-twin-four-circle-collision":
                metric._seven_point_twin_four_circle_collision_core_from_closure,
        }
        self.assertEqual(set(fixtures), set(finders))
        for stage, pattern in fixtures.items():
            with self.subTest(stage=stage):
                n = max(
                    point
                    for center, support in pattern.items()
                    for point in (center, *support)
                ) + 1
                rows = tuple(
                    MetricRow(center, tuple(support), False)
                    for center, support in pattern.items()
                )
                closure = metric._row_equality_closure(n, rows)
                core = finders[stage](closure, n)
                self.assertIsNotNone(core)
                assert core is not None

                certificate = _certificate_for_detection(
                    rows, n, {"stage": stage, "core": core}
                )

                self.assertEqual(certificate["stage"], stage)
                self.assertGreater(len(certificate["closure_paths"]), 0)
                self.assertLessEqual(
                    certificate["minimum"]["minimum_row_count"], len(rows)
                )
                self.assertTrue(_validate_certificate(certificate, n=n))

    def test_phase3_exact_four_stage_b_regression_exports_and_replays(self) -> None:
        rows = (
            MetricRow(0, (1, 2, 5, 6), False),
            MetricRow(1, (0, 3, 4, 6), False),
            MetricRow(2, (1, 6, 7, 9), False),
            MetricRow(3, (0, 2, 4, 5), False),
            MetricRow(4, (3, 5, 6, 9), False),
            MetricRow(5, (1, 4, 8, 9), False),
            MetricRow(6, (2, 3, 7, 9), False),
            MetricRow(7, (0, 2, 6, 8), False),
            MetricRow(8, (0, 1, 5, 9), False),
            MetricRow(9, (4, 5, 7, 8), False),
        )
        detection = _formalized_metric_core(
            rows,
            10,
            (),
            include_extended=True,
            include_ordered=False,
        )
        self.assertEqual(
            detection,
            {
                "stage": "equality-six-point-five-circle-collision-b",
                "core": {"o": 6, "a": 0, "b": 1, "c": 4, "e": 2, "f": 3},
            },
        )
        assert detection is not None

        certificate = _certificate_for_detection(rows, 10, detection)

        self.assertTrue(_validate_certificate(certificate, n=10))
        self.assertEqual(certificate["stage"], detection["stage"])
        self.assertTrue(
            all(len(row["support"]) == 4 for row in certificate["rows"])
        )

    def test_duplicate_center_certificate_uses_minimum_two_rows(self) -> None:
        rows = (
            MetricRow(0, (2, 3, 4, 5), False),
            MetricRow(1, (2, 3, 4, 5), False),
            MetricRow(6, (0, 1, 8, 9), False),
        )
        detection = _formalized_metric_core(
            rows,
            10,
            tuple(range(10)),
            include_extended=False,
            include_ordered=False,
        )
        self.assertIsNotNone(detection)
        assert detection is not None
        self.assertEqual(detection["stage"], "equality-duplicate-center")

        certificate = _certificate_for_detection(rows, 10, detection)

        self.assertEqual(certificate["minimum"]["source_row_count"], 3)
        self.assertEqual(certificate["minimum"]["minimum_row_count"], 2)
        self.assertEqual(len(certificate["rows"]), 2)
        self.assertEqual(certificate["max_closure_path_length"], 1)
        self.assertTrue(_validate_certificate(certificate, n=10))

    def test_transitive_path_records_only_concrete_row_steps_and_flips(self) -> None:
        rows = (
            MetricRow(0, (1, 2, 3, 4), False),
            MetricRow(2, (0, 5, 6, 7), False),
        )

        path = _closure_path(rows, 8, (0, 1), (2, 5))

        self.assertEqual(path["length"], 3)
        self.assertEqual(path["row_equality_steps"], 2)
        self.assertEqual(
            [step["kind"] for step in path["steps"]],
            ["row", "flip", "row"],
        )
        self.assertTrue(_validate_closure_path(rows, path))

    def test_subsumption_keeps_only_inclusion_minimal_row_choices(self) -> None:
        first = (0, (1, 2, 3, 4), False)
        second = (1, (0, 2, 3, 4), False)
        separate = (2, (0, 1, 3, 4), False)
        small = (first,)
        large = tuple(sorted((first, second)))
        other = (separate,)
        certificates = {
            small: {"rows": []},
            large: {"rows": []},
            other: {"rows": []},
        }

        kept, cover = _subsumption_minimize(certificates)

        self.assertEqual(set(kept), {small, other})
        self.assertEqual(cover[small], small)
        self.assertEqual(cover[large], small)
        self.assertEqual(cover[other], other)

    def test_exact_off_circle_certificate_retains_exact_source_row(self) -> None:
        rows = (
            MetricRow(0, (1, 2, 3, 4), True),
            MetricRow(2, (0, 5, 6, 7), False),
            MetricRow(5, (0, 2, 8, 9), False),
        )
        detection = _formalized_metric_core(
            rows,
            10,
            tuple(range(10)),
            include_extended=False,
            include_ordered=False,
        )
        self.assertIsNotNone(detection)
        assert detection is not None
        self.assertEqual(detection["stage"], "equality-exact-off-circle")

        certificate = _certificate_for_detection(rows, 10, detection)
        key = _key_from_rows_json(certificate["rows"])

        self.assertIn((0, (1, 2, 3, 4), True), key)
        self.assertEqual(certificate["minimum"]["minimum_row_count"], 3)
        self.assertEqual(certificate["max_closure_path_length"], 6)
        self.assertTrue(_validate_certificate(certificate, n=10))


if __name__ == "__main__":
    unittest.main()
