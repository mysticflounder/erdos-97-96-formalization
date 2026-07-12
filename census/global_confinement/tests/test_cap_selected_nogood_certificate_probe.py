# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import unittest

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
