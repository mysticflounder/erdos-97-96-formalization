from __future__ import annotations

import unittest

from census.atail_force import producer_bank


class ProducerBankTests(unittest.TestCase):
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
