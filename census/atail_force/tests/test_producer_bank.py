from __future__ import annotations

import unittest
from pathlib import Path
from unittest import mock

from census.atail_force import producer_bank


class ProducerBankTests(unittest.TestCase):
    @staticmethod
    def _kalmanson_rows() -> tuple[producer_bank.MetricRow, ...]:
        row = producer_bank.MetricRow
        return (
            row(2, (0, 3, 5, 6), exact=False),
            row(0, (3, 4, 5, 6), exact=True),
            row(1, (4, 0, 5, 6), exact=False),
        )

    def test_direct_five_point_three_selected_row_kalmanson_match(self) -> None:
        records = producer_bank.scan_all_formalized_cores(
            self._kalmanson_rows(),
            7,
            (0, 1, 2, 3, 4, 5, 6),
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-five-point-three-selected-row-kalmanson"
        )
        self.assertEqual(match["core"], {"A": 1, "C": 4, "E": 3, "O": 0, "Y": 2})
        self.assertEqual(match["orientation"], "forward")
        self.assertEqual(match["source"], "metric-bank-direct-rows")
        self.assertEqual(
            match["lean_consumer"],
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_selected_rows_in_five_ccw_order",
        )
        self.assertEqual(
            match["metadata"],
            {
                "boundary_rotation_start": 0,
                "lean_module": "Erdos9796Proof.P97.ATail.CapCrossingKalmanson",
                "requires_rotated_ccw_enumeration": False,
            },
        )

    def test_kalmanson_match_needs_each_direct_row(self) -> None:
        rows = self._kalmanson_rows()
        for omitted in range(3):
            with self.subTest(omitted=omitted):
                records = producer_bank.scan_all_formalized_cores(
                    tuple(row for index, row in enumerate(rows) if index != omitted),
                    7,
                    (0, 1, 2, 3, 4, 5, 6),
                    include_extended=False,
                    include_common_system=False,
                )
                self.assertNotIn(
                    "equality-convex-five-point-three-selected-row-kalmanson",
                    {record["stage"] for record in records},
                )

    def test_kalmanson_match_records_required_boundary_rotation(self) -> None:
        records = producer_bank.scan_all_formalized_cores(
            self._kalmanson_rows(),
            7,
            (5, 6, 0, 1, 2, 3, 4),
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-five-point-three-selected-row-kalmanson"
        )
        self.assertEqual(match["metadata"]["boundary_rotation_start"], 2)
        self.assertTrue(
            match["metadata"]["requires_rotated_ccw_enumeration"]
        )

    def test_kalmanson_match_fails_closed_without_production_consumer(self) -> None:
        missing = Path("/definitely/missing/CapCrossingKalmanson.lean")
        with mock.patch.object(
            producer_bank,
            "_FIVE_POINT_THREE_SELECTED_ROW_KALMANSON_SOURCE",
            missing,
        ):
            with self.assertRaises(producer_bank.MissingLeanConsumerError):
                producer_bank.scan_all_formalized_cores(
                    self._kalmanson_rows(),
                    7,
                    (0, 1, 2, 3, 4, 5, 6),
                    include_extended=False,
                    include_common_system=False,
                )

    def test_kalmanson_match_does_not_use_transitive_equality_closure(self) -> None:
        row = producer_bank.MetricRow
        rows = (
            row(2, (0, 3), exact=False),
            row(0, (3, 7), exact=True),
            row(0, (4, 7), exact=False),
            row(1, (4, 0), exact=False),
        )
        records = producer_bank.scan_all_formalized_cores(
            rows,
            8,
            (0, 1, 2, 3, 4, 5, 6, 7),
            include_extended=False,
            include_common_system=False,
        )
        self.assertNotIn(
            "equality-convex-five-point-three-selected-row-kalmanson",
            {record["stage"] for record in records},
        )

    def test_kalmanson_match_is_forward_only(self) -> None:
        order = (0, 1, 2, 3, 4, 5, 6)
        reflection = dict(zip(order, reversed(order), strict=True))
        rows = tuple(
            producer_bank.MetricRow(
                reflection[item.center],
                tuple(reflection[label] for label in item.support),
                exact=item.exact,
            )
            for item in self._kalmanson_rows()
        )
        records = producer_bank.scan_all_formalized_cores(
            rows,
            7,
            order,
            include_extended=False,
            include_common_system=False,
        )
        self.assertNotIn(
            "equality-convex-five-point-three-selected-row-kalmanson",
            {record["stage"] for record in records},
        )

    def test_enumerates_multiple_common_system_families(self) -> None:
        row = producer_bank.MetricRow
        rows = (
            row(0, (1, 2, 3, 4), exact=True),
            row(1, (0, 2), exact=True),
            row(3, (1, 2, 4, 5), exact=True),
        )
        records = producer_bank.scan_all_formalized_cores(
            rows,
            6,
            (0, 1, 3, 4, 5, 2),
            include_extended=False,
        )
        stages = {record["stage"] for record in records}
        self.assertIn(
            "equality-convex-six-point-two-circle-arc-overtake-order",
            stages,
        )
        self.assertIn(
            "equality-convex-four-point-two-circle-bisector-order",
            stages,
        )
        self.assertGreaterEqual(len(records), 2)

    def test_metric_and_common_match_for_same_core_are_deduplicated(self) -> None:
        row = producer_bank.MetricRow
        rows = (
            row(0, (1, 2, 3, 4), exact=True),
            row(1, (0, 2, 6), exact=True),
            row(2, (3, 9), exact=True),
            row(3, (1, 5, 6), exact=True),
            row(4, (0, 5, 9), exact=True),
        )
        records = producer_bank.scan_all_formalized_cores(
            rows, 10, (0, 1, 3, 4, 2, 5, 6, 7, 8, 9)
        )
        five_row = [
            record
            for record in records
            if record["stage"]
            == "equality-convex-eight-point-five-row-circle-intersection-order"
            and record["orientation"] == "forward"
        ]
        self.assertEqual(len(five_row), 1)
        self.assertEqual(
            five_row[0]["lean_consumer"],
            "Problem97.Census554."
            "FiveRowCircleIntersectionOrderCore.false_of_core",
        )

    def test_reverse_match_has_negative_consumer(self) -> None:
        row = producer_bank.MetricRow
        order = (0, 1, 3, 4, 2, 5, 6, 7, 8, 9)
        reflection = dict(zip(order, reversed(order), strict=True))
        original = (
            row(0, (1, 2, 3, 4), exact=True),
            row(1, (0, 2, 6), exact=True),
            row(2, (3, 9), exact=True),
            row(3, (1, 5, 6), exact=True),
            row(4, (0, 5, 9), exact=True),
        )
        rows = tuple(
            row(
                reflection[item.center],
                tuple(reflection[label] for label in item.support),
                exact=True,
            )
            for item in original
        )
        records = producer_bank.scan_all_formalized_cores(rows, 10, order)
        reverse = next(
            record
            for record in records
            if record["stage"]
            == (
                "equality-convex-eight-point-"
                "five-row-circle-intersection-order-reverse"
            )
        )
        self.assertEqual(reverse["orientation"], "reverse")
        self.assertEqual(reverse["cyclic_orientation"], "reverse")
        self.assertEqual(
            reverse["lean_consumer"],
            "Problem97.Census554.FiveRowCircleIntersectionOrderCore."
            "false_of_core_of_neg",
        )

    def test_recognized_core_without_consumer_fails_closed(self) -> None:
        with self.assertRaises(producer_bank.MissingLeanConsumerError):
            producer_bank.canonical_core_record(
                {"stage": "recognized-test-core", "core": {"a": 0}},
                source="test",
            )

    def test_records_are_canonical_and_json_compatible(self) -> None:
        record = producer_bank.canonical_core_record(
            {
                "stage": "recognized-test-core",
                "core": {"z": (2, 1), "a": 0},
                "lean_consumer": "Problem97.Test.false_of_core",
            },
            source="test",
        )
        self.assertEqual(record["core"], {"a": 0, "z": [2, 1]})
        self.assertEqual(record["orientation"], "invariant")


if __name__ == "__main__":
    unittest.main()
