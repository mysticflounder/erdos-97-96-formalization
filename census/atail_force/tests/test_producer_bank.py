from __future__ import annotations

import copy
import unittest
from pathlib import Path
from unittest import mock

from census.atail_force import producer_bank


class ProducerBankTests(unittest.TestCase):
    def test_complete_perpendicular_bisector_certificate_is_source_facing(self) -> None:
        rows = tuple(
            producer_bank.MetricRow(center, (0, 1, 5, 6), exact=False)
            for center in (2, 3, 4)
        )
        certificate = producer_bank.complete_perpendicular_bisector_certificate(
            rows, 7, tuple(range(7))
        )
        target = next(
            item for item in certificate["candidates"] if item["foci"] == [0, 1]
        )
        self.assertEqual(
            {item["center"] for item in target["witnesses"]}, {2, 3, 4}
        )
        self.assertEqual(certificate["status"], "COMPLETE")
        self.assertEqual(
            certificate["lean_consumer"],
            "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
            "nonempty_perpBisectorCore_of_positiveCheck",
        )

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

    @staticmethod
    def _schema_k_rows() -> tuple[producer_bank.MetricRow, ...]:
        row = producer_bank.MetricRow
        return (
            row(4, (3, 1, 5, 6), exact=True),
            row(3, (0, 2, 6, 7), exact=False),
            row(0, (4, 1, 2, 7), exact=False),
            row(1, (0, 5, 6, 7), exact=True),
        )

    @staticmethod
    def _schema_l_rows() -> tuple[producer_bank.MetricRow, ...]:
        row = producer_bank.MetricRow
        return (
            row(6, (3, 0, 7, 8), exact=True),
            row(2, (4, 1, 7, 8), exact=False),
            row(4, (6, 1, 3, 8), exact=False),
            row(5, (4, 0, 7, 8), exact=True),
        )

    @staticmethod
    def _schema_m_rows() -> tuple[producer_bank.MetricRow, ...]:
        row = producer_bank.MetricRow
        return (
            row(0, (3, 1, 7, 8), exact=True),
            row(6, (0, 1, 8, 9), exact=False),
            row(3, (2, 7, 8, 9), exact=False),
            row(4, (2, 5, 8, 9), exact=False),
            row(1, (0, 5, 8, 9), exact=True),
        )

    def test_direct_six_point_schema_d_e_g_and_k_matches(self) -> None:
        for schema, rows in (
            ("d", self._schema_d_rows()),
            ("e", self._schema_e_rows()),
            ("g", self._schema_g_rows()),
            ("k", self._schema_k_rows()),
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

    @staticmethod
    def _exact17_two_kalmanson_rows() -> tuple[producer_bank.MetricRow, ...]:
        row = producer_bank.MetricRow
        return (
            row(0, (1, 15), exact=False),
            row(1, (0, 5), exact=False),
            row(2, (0, 3), exact=False),
            row(3, (1, 5, 15), exact=False),
            row(4, (1, 3), exact=False),
        )

    def test_generic_two_kalmanson_matches_authenticated_exact17_core(self) -> None:
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        records = producer_bank.scan_all_formalized_cores(
            self._exact17_two_kalmanson_rows(),
            17,
            order,
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"] == "equality-convex-two-kalmanson-cancellation"
        )
        core = match["core"]
        self.assertEqual(core["first_quad"], [0, 8, 9, 11])
        self.assertEqual(core["first_form"], "adjacentSides")
        self.assertEqual(core["second_quad"], [11, 12, 13, 14])
        self.assertEqual(core["second_form"], "adjacentSides")
        self.assertEqual(sorted(core["permutation"]), [0, 1, 2, 3])
        self.assertEqual(len(core["paths"]), 4)
        self.assertTrue(all(path is not None for path in core["paths"]))
        self.assertEqual(
            match["lean_consumer"],
            "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
            "false_of_twoKalmansonCancellationData_of_check",
        )
        self.assertEqual(
            producer_bank.certify_two_kalmanson_cancellation(
                self._exact17_two_kalmanson_rows(), 17, order, core
            ),
            match,
        )

    def test_generic_two_kalmanson_enumerates_all_checked_cores_deterministically(
        self,
    ) -> None:
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        rows = self._exact17_two_kalmanson_rows()
        records = producer_bank.enumerate_two_kalmanson_cancellations(
            rows, 17, order
        )
        legacy = next(
            record
            for record in producer_bank.scan_all_formalized_cores(
                rows,
                17,
                order,
                include_extended=False,
                include_common_system=False,
            )
            if record["stage"] == "equality-convex-two-kalmanson-cancellation"
        )
        self.assertTrue(records)
        self.assertIn(legacy, records)
        self.assertEqual(
            records,
            producer_bank.enumerate_two_kalmanson_cancellations(
                tuple(reversed(rows)), 17, order
            ),
        )
        for record in records:
            self.assertEqual(
                producer_bank.certify_two_kalmanson_cancellation(
                    rows, 17, order, record["core"]
                ),
                record,
            )

    def test_generic_two_kalmanson_exact_replay_rejects_core_mutations(self) -> None:
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        rows = self._exact17_two_kalmanson_rows()
        match = next(
            record
            for record in producer_bank.scan_all_formalized_cores(
                rows,
                17,
                order,
                include_extended=False,
                include_common_system=False,
            )
            if record["stage"] == "equality-convex-two-kalmanson-cancellation"
        )
        mutations = {
            "boundary": lambda core: core["boundary_labels"].reverse(),
            "quad": lambda core: core["first_quad"].__setitem__(1, 0),
            "form": lambda core: core.__setitem__("first_form", "unknown"),
            "permutation": lambda core: core["permutation"].__setitem__(
                1, core["permutation"][0]
            ),
            "path": lambda core: core["paths"][0].__setitem__("last", [0, 1]),
            "row_choice": lambda core: core["row_choices"][0]["support"].append(16),
        }
        for name, mutate in mutations.items():
            with self.subTest(name=name):
                core = copy.deepcopy(match["core"])
                mutate(core)
                with self.assertRaises(ValueError):
                    producer_bank.certify_two_kalmanson_cancellation(
                        rows, 17, order, core
                    )

    def test_generic_two_kalmanson_replay_accepts_positive_row_superset(self) -> None:
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        rows = self._exact17_two_kalmanson_rows()
        match = next(
            record
            for record in producer_bank.scan_all_formalized_cores(
                rows,
                17,
                order,
                include_extended=False,
                include_common_system=False,
            )
            if record["stage"] == "equality-convex-two-kalmanson-cancellation"
        )
        widened = (
            producer_bank.MetricRow(0, (1, 6, 15), exact=False),
            *rows[1:],
        )
        self.assertEqual(
            producer_bank.certify_two_kalmanson_cancellation(
                widened, 17, order, match["core"]
            ),
            match,
        )

    def test_generic_two_kalmanson_needs_every_fixture_row(self) -> None:
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        rows = self._exact17_two_kalmanson_rows()
        for omitted in range(len(rows)):
            with self.subTest(omitted=omitted):
                records = producer_bank.scan_all_formalized_cores(
                    rows[:omitted] + rows[omitted + 1 :],
                    17,
                    order,
                    include_extended=False,
                    include_common_system=False,
                )
                self.assertNotIn(
                    "equality-convex-two-kalmanson-cancellation",
                    {record["stage"] for record in records},
                )

    def test_generic_two_kalmanson_fails_closed_without_consumer(self) -> None:
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        missing = Path("/definitely/missing/GenericRowNogoodCertificate.lean")
        with mock.patch.object(
            producer_bank,
            "_TWO_KALMANSON_CANCELLATION_SOURCE",
            missing,
        ), self.assertRaises(producer_bank.MissingLeanConsumerError):
            producer_bank.scan_all_formalized_cores(
                self._exact17_two_kalmanson_rows(),
                17,
                order,
                include_extended=False,
                include_common_system=False,
            )

    @staticmethod
    def _exact17_weighted_kalmanson_fixture() -> tuple[
        tuple[producer_bank.MetricRow, ...], tuple[dict[str, object], ...]
    ]:
        row = producer_bank.MetricRow
        rows = (
            row(2, (0, 3, 9), exact=False),
            row(3, (5, 7), exact=False),
            row(7, (9, 10), exact=False),
            row(9, (4, 5, 7), exact=False),
            row(13, (3, 10), exact=False),
        )
        terms: tuple[dict[str, object], ...] = (
            {"quad": (0, 7, 2, 3), "form": "adjacentSides", "weight": 1},
            {"quad": (0, 10, 7, 2), "form": "innerOuter", "weight": 1},
            {"quad": (10, 9, 7, 2), "form": "innerOuter", "weight": 2},
            {"quad": (10, 9, 2, 3), "form": "innerOuter", "weight": 1},
            {"quad": (10, 9, 3, 4), "form": "innerOuter", "weight": 1},
            {"quad": (10, 9, 4, 5), "form": "innerOuter", "weight": 1},
            {"quad": (10, 3, 5, 13), "form": "innerOuter", "weight": 1},
        )
        return rows, terms

    def test_weighted_kalmanson_certifies_authenticated_exact17_core(self) -> None:
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        rows, terms = self._exact17_weighted_kalmanson_fixture()
        record = producer_bank.certify_weighted_kalmanson_cancellation(
            rows, 17, order, terms
        )
        self.assertEqual(
            record["stage"], "equality-convex-weighted-kalmanson-cancellation"
        )
        self.assertEqual(len(record["core"]["terms"]), 7)
        self.assertEqual(len(record["core"]["pairings"]), 16)
        self.assertEqual(
            record["lean_consumer"],
            "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
            "false_of_weightedKalmansonCancellationData_of_check",
        )

    def test_weighted_kalmanson_rejects_incorrect_weight(self) -> None:
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        rows, terms = self._exact17_weighted_kalmanson_fixture()
        changed = [dict(term) for term in terms]
        changed[2]["weight"] = 1
        with self.assertRaisesRegex(ValueError, "do not cancel"):
            producer_bank.certify_weighted_kalmanson_cancellation(
                rows, 17, order, changed
            )

    def test_weighted_kalmanson_fails_closed_without_consumer(self) -> None:
        order = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
        rows, terms = self._exact17_weighted_kalmanson_fixture()
        missing = Path("/definitely/missing/GenericRowNogoodCertificate.lean")
        with mock.patch.object(
            producer_bank,
            "_WEIGHTED_KALMANSON_CANCELLATION_SOURCE",
            missing,
        ), self.assertRaises(producer_bank.MissingLeanConsumerError):
            producer_bank.certify_weighted_kalmanson_cancellation(
                rows, 17, order, terms
            )

    def test_schema_d_e_g_and_k_match_need_each_direct_row(self) -> None:
        for schema, rows in (
            ("d", self._schema_d_rows()),
            ("e", self._schema_e_rows()),
            ("g", self._schema_g_rows()),
            ("k", self._schema_k_rows()),
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

    def test_schema_d_e_g_and_k_use_reverse_consumers_after_reflection(self) -> None:
        order = tuple(range(8))
        reflection = dict(zip(order, reversed(order), strict=True))
        for schema, original_rows in (
            ("d", self._schema_d_rows()),
            ("e", self._schema_e_rows()),
            ("g", self._schema_g_rows()),
            ("k", self._schema_k_rows()),
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

    def test_schema_d_e_g_and_k_fail_closed_without_lean_consumers(self) -> None:
        missing = Path("/definitely/missing/KalmansonFourEqualitySchemas.lean")
        with mock.patch.object(
            producer_bank,
            "_SIX_POINT_FOUR_SELECTED_ROW_KALMANSON_SOURCE",
            missing,
        ), self.assertRaises(producer_bank.MissingLeanConsumerError):
            producer_bank.scan_all_formalized_cores(
                self._schema_k_rows(),
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

    def test_direct_seven_point_schema_l_match(self) -> None:
        records = producer_bank.scan_all_formalized_cores(
            self._schema_l_rows(),
            9,
            tuple(range(9)),
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-seven-point-four-selected-row-kalmanson-l"
        )
        self.assertEqual(
            match["core"],
            {"a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6},
        )
        self.assertEqual(match["orientation"], "forward")
        self.assertTrue(match["lean_consumer"].endswith("seven_ccw_order_L"))

    def test_schema_l_match_needs_each_direct_row(self) -> None:
        rows = self._schema_l_rows()
        stages = {
            "equality-convex-seven-point-four-selected-row-kalmanson-l",
            "equality-convex-seven-point-four-selected-row-kalmanson-l-reverse",
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

    def test_schema_l_uses_reverse_consumer_after_reflection(self) -> None:
        order = tuple(range(9))
        reflection = dict(zip(order, reversed(order), strict=True))
        rows = tuple(
            producer_bank.MetricRow(
                reflection[item.center],
                tuple(reflection[label] for label in item.support),
                exact=item.exact,
            )
            for item in self._schema_l_rows()
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
            == (
                "equality-convex-seven-point-four-selected-row-"
                "kalmanson-l-reverse"
            )
        )
        self.assertEqual(match["orientation"], "reverse")
        self.assertTrue(
            match["lean_consumer"].endswith("seven_ccw_order_L_of_decreasing")
        )

    def test_schema_l_fails_closed_without_lean_consumers(self) -> None:
        missing = Path("/definitely/missing/KalmansonFourEqualitySchemas.lean")
        with mock.patch.object(
            producer_bank,
            "_SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_SOURCE",
            missing,
        ), self.assertRaises(producer_bank.MissingLeanConsumerError):
            producer_bank.scan_all_formalized_cores(
                self._schema_l_rows(),
                9,
                tuple(range(9)),
                include_extended=False,
                include_common_system=False,
            )

    def test_direct_eight_point_schema_m_match(self) -> None:
        records = producer_bank.scan_all_formalized_cores(
            self._schema_m_rows(),
            10,
            tuple(range(10)),
            include_extended=False,
            include_common_system=False,
        )
        match = next(
            record
            for record in records
            if record["stage"]
            == "equality-convex-eight-point-five-selected-row-kalmanson-m"
        )
        self.assertEqual(
            match["core"],
            {
                "a": 0,
                "b": 1,
                "c": 2,
                "d": 3,
                "e": 4,
                "f": 5,
                "g": 6,
                "h": 7,
            },
        )
        self.assertEqual(match["orientation"], "forward")
        self.assertTrue(match["lean_consumer"].endswith("eight_ccw_order_M"))

    def test_schema_m_match_needs_each_direct_row(self) -> None:
        rows = self._schema_m_rows()
        stages = {
            "equality-convex-eight-point-five-selected-row-kalmanson-m",
            "equality-convex-eight-point-five-selected-row-kalmanson-m-reverse",
        }
        for omitted in range(5):
            with self.subTest(omitted=omitted):
                records = producer_bank.scan_all_formalized_cores(
                    tuple(row for i, row in enumerate(rows) if i != omitted),
                    10,
                    tuple(range(10)),
                    include_extended=False,
                    include_common_system=False,
                )
                self.assertTrue(
                    stages.isdisjoint(record["stage"] for record in records)
                )

    def test_schema_m_uses_reverse_consumer_after_reflection(self) -> None:
        order = tuple(range(10))
        reflection = dict(zip(order, reversed(order), strict=True))
        rows = tuple(
            producer_bank.MetricRow(
                reflection[item.center],
                tuple(reflection[label] for label in item.support),
                exact=item.exact,
            )
            for item in self._schema_m_rows()
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
            == (
                "equality-convex-eight-point-five-selected-row-"
                "kalmanson-m-reverse"
            )
        )
        self.assertEqual(match["orientation"], "reverse")
        self.assertTrue(
            match["lean_consumer"].endswith("eight_ccw_order_M_of_decreasing")
        )

    def test_schema_m_fails_closed_without_lean_consumers(self) -> None:
        missing = Path("/definitely/missing/KalmansonFourEqualitySchemas.lean")
        with mock.patch.object(
            producer_bank,
            "_SEVEN_POINT_FOUR_SELECTED_ROW_KALMANSON_C_SOURCE",
            missing,
        ), self.assertRaises(producer_bank.MissingLeanConsumerError):
            producer_bank.scan_all_formalized_cores(
                self._schema_m_rows(),
                10,
                tuple(range(10)),
                include_extended=False,
                include_common_system=False,
            )

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
