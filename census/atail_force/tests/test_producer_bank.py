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

    @staticmethod
    def _schema_c_rows() -> tuple[producer_bank.MetricRow, ...]:
        row = producer_bank.MetricRow
        return (
            row(0, (5, 1, 7, 8), exact=True),
            row(5, (0, 3, 6, 9), exact=True),
            row(2, (3, 6, 7, 9), exact=True),
            row(4, (5, 1, 8, 9), exact=True),
        )

    @staticmethod
    def _schema_d_rows() -> tuple[producer_bank.MetricRow, ...]:
        row = producer_bank.MetricRow
        return (
            row(0, (4, 1, 6, 7), exact=True),
            row(4, (0, 2, 5, 7), exact=False),
            row(1, (4, 5, 6, 7), exact=False),
            row(3, (4, 1, 2, 6), exact=True),
        )

    @staticmethod
    def _schema_e_rows() -> tuple[producer_bank.MetricRow, ...]:
        row = producer_bank.MetricRow
        return (
            row(0, (5, 3, 6, 7), exact=True),
            row(4, (1, 2, 6, 7), exact=False),
            row(1, (0, 2, 3, 7), exact=False),
            row(2, (5, 1, 6, 7), exact=True),
        )

    @staticmethod
    def _schema_f_rows() -> tuple[producer_bank.MetricRow, ...]:
        row = producer_bank.MetricRow
        return (
            row(0, (5, 2, 7, 8), exact=True),
            row(5, (0, 6, 2, 8), exact=False),
            row(1, (5, 4, 7, 8), exact=False),
            row(3, (1, 4, 6, 8), exact=True),
        )

    @staticmethod
    def _schema_g_rows() -> tuple[producer_bank.MetricRow, ...]:
        row = producer_bank.MetricRow
        return (
            row(0, (1, 3, 6, 7), exact=True),
            row(1, (2, 5, 6, 7), exact=False),
            row(2, (1, 3, 6, 7), exact=False),
            row(4, (2, 5, 6, 7), exact=True),
        )

    def test_direct_six_point_schema_d_e_and_g_matches(self) -> None:
        for schema, rows in (
            ("d", self._schema_d_rows()),
            ("e", self._schema_e_rows()),
            ("g", self._schema_g_rows()),
        ):
            with self.subTest(schema=schema):
                records = producer_bank.scan_all_formalized_cores(
                    rows,
                    8,
                    tuple(range(8)),
                    include_extended=False,
                    include_common_system=False,
                )
                stage = (
                    "equality-convex-six-point-four-selected-row-"
                    f"kalmanson-{schema}"
                )
                match = next(record for record in records if record["stage"] == stage)
                self.assertEqual(
                    match["core"],
                    {"a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5},
                )
                self.assertEqual(match["orientation"], "forward")
                self.assertEqual(
                    match["lean_consumer"],
                    "Problem97.CapCrossingKalmansonBridge."
                    f"false_of_four_selected_rows_in_six_ccw_order_{schema.upper()}",
                )

    def test_schema_d_and_e_match_authenticated_exact17_terminals(self) -> None:
        row = producer_bank.MetricRow
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        cases = (
            (
                "d",
                (
                    row(0, (1, 2, 11, 15), exact=True),
                    row(1, (0, 3, 14, 16), exact=False),
                    row(2, (1, 9, 10, 14), exact=False),
                    row(4, (1, 2, 3, 5), exact=False),
                ),
                {"a": 0, "b": 2, "c": 3, "d": 4, "e": 1, "f": 14},
            ),
            (
                "e",
                (
                    row(0, (1, 2, 11, 15), exact=True),
                    row(5, (6, 7, 8, 9), exact=False),
                    row(6, (0, 8, 11, 12), exact=False),
                    row(8, (1, 3, 6, 9), exact=True),
                ),
                {"a": 0, "b": 6, "c": 8, "d": 11, "e": 5, "f": 1},
            ),
        )
        for schema, rows, expected in cases:
            with self.subTest(schema=schema):
                records = producer_bank.scan_all_formalized_cores(
                    rows,
                    17,
                    order,
                    include_extended=False,
                    include_common_system=False,
                )
                stage = (
                    "equality-convex-six-point-four-selected-row-"
                    f"kalmanson-{schema}"
                )
                match = next(record for record in records if record["stage"] == stage)
                self.assertEqual(match["core"], expected)

    def test_schema_g_matches_authenticated_exact17_linear_core(self) -> None:
        row = producer_bank.MetricRow
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        rows = (
            row(0, (1, 11), exact=False),
            row(1, (0, 16), exact=False),
            row(6, (0, 16), exact=False),
            row(15, (1, 11), exact=False),
        )
        records = producer_bank.scan_all_formalized_cores(
            rows,
            17,
            order,
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-six-point-four-selected-row-kalmanson-g-reverse"
        )
        self.assertEqual(
            match["core"],
            {"a": 6, "b": 0, "c": 1, "d": 16, "e": 15, "f": 11},
        )
        self.assertTrue(
            match["lean_consumer"].endswith(
                "six_ccw_order_G_of_decreasing"
            )
        )

    def test_schema_d_e_and_g_match_need_each_direct_row(self) -> None:
        for schema, rows in (
            ("d", self._schema_d_rows()),
            ("e", self._schema_e_rows()),
            ("g", self._schema_g_rows()),
        ):
            stages = {
                (
                    "equality-convex-six-point-four-selected-row-"
                    f"kalmanson-{schema}"
                ),
                (
                    "equality-convex-six-point-four-selected-row-"
                    f"kalmanson-{schema}-reverse"
                ),
            }
            for omitted in range(4):
                with self.subTest(schema=schema, omitted=omitted):
                    records = producer_bank.scan_all_formalized_cores(
                        tuple(row for i, row in enumerate(rows) if i != omitted),
                        8,
                        tuple(range(8)),
                        include_extended=False,
                        include_common_system=False,
                    )
                    self.assertTrue(
                        stages.isdisjoint(record["stage"] for record in records)
                    )

    def test_schema_d_e_and_g_use_reverse_consumers_after_reflection(self) -> None:
        order = tuple(range(8))
        reflection = dict(zip(order, reversed(order), strict=True))
        for schema, original_rows in (
            ("d", self._schema_d_rows()),
            ("e", self._schema_e_rows()),
            ("g", self._schema_g_rows()),
        ):
            rows = tuple(
                producer_bank.MetricRow(
                    reflection[item.center],
                    tuple(reflection[label] for label in item.support),
                    exact=item.exact,
                )
                for item in original_rows
            )
            with self.subTest(schema=schema):
                records = producer_bank.scan_all_formalized_cores(
                    rows,
                    8,
                    order,
                    include_extended=False,
                    include_common_system=False,
                )
                stage = (
                    "equality-convex-six-point-four-selected-row-"
                    f"kalmanson-{schema}-reverse"
                )
                match = next(record for record in records if record["stage"] == stage)
                self.assertEqual(match["orientation"], "reverse")
                self.assertTrue(
                    match["lean_consumer"].endswith(
                        f"six_ccw_order_{schema.upper()}_of_decreasing"
                    )
                )

    def test_schema_d_e_and_g_fail_closed_without_lean_consumers(self) -> None:
        missing = Path("/definitely/missing/KalmansonFourEqualitySchemas.lean")
        with mock.patch.object(
            producer_bank,
            "_SIX_POINT_FOUR_SELECTED_ROW_KALMANSON_SOURCE",
            missing,
        ), self.assertRaises(producer_bank.MissingLeanConsumerError):
            producer_bank.scan_all_formalized_cores(
                self._schema_g_rows(),
                8,
                tuple(range(8)),
                include_extended=False,
                include_common_system=False,
            )

    def test_direct_seven_point_schema_f_match(self) -> None:
        records = producer_bank.scan_all_formalized_cores(
            self._schema_f_rows(),
            9,
            tuple(range(9)),
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-seven-point-four-selected-row-kalmanson-f"
        )
        self.assertEqual(
            match["core"],
            {"a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6},
        )
        self.assertEqual(match["orientation"], "forward")
        self.assertTrue(match["lean_consumer"].endswith("seven_ccw_order_F"))

    def test_schema_f_matches_authenticated_exact17_terminal_roles(self) -> None:
        rows = (
            producer_bank.MetricRow(0, (1, 15), exact=False),
            producer_bank.MetricRow(1, (0, 13, 15), exact=False),
            producer_bank.MetricRow(2, (1, 4), exact=False),
            producer_bank.MetricRow(3, (2, 4, 13), exact=False),
        )
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        records = producer_bank.scan_all_formalized_cores(
            rows,
            17,
            order,
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-seven-point-four-selected-row-kalmanson-f"
        )
        self.assertEqual(
            match["core"],
            {"a": 0, "b": 2, "c": 15, "d": 3, "e": 4, "f": 1, "g": 13},
        )

    def test_schema_f_match_needs_each_direct_row(self) -> None:
        rows = self._schema_f_rows()
        stages = {
            "equality-convex-seven-point-four-selected-row-kalmanson-f",
            "equality-convex-seven-point-four-selected-row-kalmanson-f-reverse",
        }
        for omitted in range(4):
            with self.subTest(omitted=omitted):
                records = producer_bank.scan_all_formalized_cores(
                    tuple(row for i, row in enumerate(rows) if i != omitted),
                    9,
                    tuple(range(9)),
                    include_extended=False,
                    include_common_system=False,
                )
                self.assertTrue(
                    stages.isdisjoint(record["stage"] for record in records)
                )

    def test_schema_f_uses_reverse_consumer_after_reflection(self) -> None:
        order = tuple(range(9))
        reflection = dict(zip(order, reversed(order), strict=True))
        rows = tuple(
            producer_bank.MetricRow(
                reflection[item.center],
                tuple(reflection[label] for label in item.support),
                exact=item.exact,
            )
            for item in self._schema_f_rows()
        )
        records = producer_bank.scan_all_formalized_cores(
            rows,
            9,
            order,
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-seven-point-four-selected-row-kalmanson-f-reverse"
        )
        self.assertEqual(match["orientation"], "reverse")
        self.assertTrue(
            match["lean_consumer"].endswith("seven_ccw_order_F_of_decreasing")
        )

    def test_schema_f_fails_closed_without_lean_consumers(self) -> None:
        missing = Path("/definitely/missing/KalmansonFourEqualitySchemas.lean")
        with mock.patch.object(
            producer_bank,
            "_SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_SOURCE",
            missing,
        ), self.assertRaises(producer_bank.MissingLeanConsumerError):
            producer_bank.scan_all_formalized_cores(
                self._schema_f_rows(),
                9,
                tuple(range(9)),
                include_extended=False,
                include_common_system=False,
            )

    def test_direct_seven_point_schema_c_match(self) -> None:
        records = producer_bank.scan_all_formalized_cores(
            self._schema_c_rows(),
            10,
            tuple(range(10)),
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-seven-point-four-selected-row-kalmanson-c"
        )
        self.assertEqual(
            match["core"],
            {"a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6},
        )
        self.assertEqual(match["orientation"], "forward")
        self.assertEqual(
            match["lean_consumer"],
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_four_selected_rows_in_seven_ccw_order_C",
        )
        self.assertEqual(
            match["metadata"]["lean_module"],
            "Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas",
        )

    def test_schema_c_matches_authenticated_exact17_terminal_roles(self) -> None:
        row = producer_bank.MetricRow
        rows = (
            row(0, (1, 2, 11, 15), exact=True),
            row(1, (0, 4, 13, 16), exact=False),
            row(3, (4, 12, 13, 15), exact=False),
            row(5, (1, 3, 10, 11), exact=False),
        )
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        records = producer_bank.scan_all_formalized_cores(
            rows,
            17,
            order,
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-seven-point-four-selected-row-kalmanson-c"
        )
        self.assertEqual(
            match["core"],
            {"a": 0, "b": 11, "c": 3, "d": 4, "e": 5, "f": 1, "g": 13},
        )

    def test_schema_c_match_needs_each_direct_row(self) -> None:
        rows = self._schema_c_rows()
        stages = {
            "equality-convex-seven-point-four-selected-row-kalmanson-c",
            "equality-convex-seven-point-four-selected-row-kalmanson-c-reverse",
        }
        for omitted in range(4):
            with self.subTest(omitted=omitted):
                records = producer_bank.scan_all_formalized_cores(
                    tuple(row for index, row in enumerate(rows) if index != omitted),
                    10,
                    tuple(range(10)),
                    include_extended=False,
                    include_common_system=False,
                )
                self.assertTrue(stages.isdisjoint(record["stage"] for record in records))

    def test_schema_c_match_uses_reverse_consumer_after_reflection(self) -> None:
        order = tuple(range(10))
        reflection = dict(zip(order, reversed(order), strict=True))
        rows = tuple(
            producer_bank.MetricRow(
                reflection[item.center],
                tuple(reflection[label] for label in item.support),
                exact=item.exact,
            )
            for item in self._schema_c_rows()
        )
        records = producer_bank.scan_all_formalized_cores(
            rows,
            10,
            order,
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-seven-point-four-selected-row-kalmanson-c-reverse"
        )
        self.assertEqual(match["orientation"], "reverse")
        self.assertEqual(
            match["lean_consumer"],
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_four_selected_rows_in_seven_ccw_order_C_of_decreasing",
        )

    def test_schema_c_match_fails_closed_without_lean_consumers(self) -> None:
        missing = Path("/definitely/missing/KalmansonFourEqualitySchemas.lean")
        with mock.patch.object(
            producer_bank,
            "_SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_SOURCE",
            missing,
        ), self.assertRaises(producer_bank.MissingLeanConsumerError):
            producer_bank.scan_all_formalized_cores(
                self._schema_c_rows(),
                10,
                tuple(range(10)),
                include_extended=False,
                include_common_system=False,
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
        ), self.assertRaises(producer_bank.MissingLeanConsumerError):
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
