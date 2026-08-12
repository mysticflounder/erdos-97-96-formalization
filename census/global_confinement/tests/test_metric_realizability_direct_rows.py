# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import unittest
from unittest.mock import patch

from census.global_confinement import metric_realizability_probe as metric


class _ReachedMetricEncoder(RuntimeError):
    pass


class DirectMetricRowsProbeTests(unittest.TestCase):
    def test_missing_backend_is_rejected_before_solver_discovery(self) -> None:
        row = metric.MetricRow(0, (1, 2, 3), False)
        with (
            patch.object(metric, "_probe_system") as backend,
            self.assertRaisesRegex(ValueError, "legacy-local-z3"),
        ):
            metric.probe_metric_rows(
                5,
                (row,),
                order=tuple(range(5)),
            )
        backend.assert_not_called()

    def test_exact_five_row_reaches_existing_metric_encoder(self) -> None:
        row = metric.MetricRow(0, (5, 3, 1, 4, 2), True)

        with patch.object(
            metric,
            "_metric_row_constraints",
            side_effect=_ReachedMetricEncoder("exact-five reached encoder"),
        ):
            result = metric.probe_metric_rows(
                7,
                (row,),
                order=tuple(range(7)),
                timeout_s=1.0,
                backend="legacy-local-z3",
            )

        self.assertEqual(
            result["rows"],
            [{"center": 0, "support": [1, 2, 3, 4, 5], "exact": True}],
        )
        self.assertEqual(result["row_count"], 1)
        self.assertEqual(result["exact_row_count"], 1)
        self.assertEqual(result["backend_status"], "ERROR")
        self.assertEqual(result["status"], "ERROR")
        self.assertIn("exact-five reached encoder", result["diagnostic"])
        self.assertTrue(result["fail_closed"])

    def test_nonexact_five_row_allows_off_support_coradial_label(self) -> None:
        nonexact = metric.MetricRow(0, (1, 2, 3, 4, 5), False)
        exact = metric.MetricRow(0, (1, 2, 3, 4, 5), True)

        def all_coradial(_center: int, _point: int) -> int:
            return 1

        [(_, nonexact_equalities, nonexact_exclusions)] = (
            metric._metric_row_constraints(7, (nonexact,), all_coradial)
        )
        [(_, exact_equalities, exact_exclusions)] = (
            metric._metric_row_constraints(7, (exact,), all_coradial)
        )

        self.assertEqual(nonexact_equalities, [True, True, True, True])
        self.assertEqual(nonexact_exclusions, [])
        self.assertEqual(exact_equalities, nonexact_equalities)
        self.assertEqual(exact_exclusions, [False])

    def test_unknown_and_unsupported_backend_statuses_fail_closed(self) -> None:
        row = metric.MetricRow(0, (1, 2, 3, 4, 5), False)

        for backend_status, public_status in (
            ("UNKNOWN", "UNKNOWN"),
            ("NOT_A_SOLVER_STATUS", "ERROR"),
        ):
            with self.subTest(backend_status=backend_status):
                with patch.object(
                    metric,
                    "_probe_system",
                    return_value={
                        "system_id": "ignored-backend-id",
                        "status": backend_status,
                        "decisive_stage": None,
                        "stages": [],
                        "constraint_counts": {},
                    },
                ):
                    result = metric.probe_metric_rows(
                        7,
                        (row,),
                        order=tuple(range(7)),
                        timeout_s=1.0,
                        backend="legacy-local-z3",
                    )

                self.assertEqual(result["backend_status"], backend_status)
                self.assertEqual(result["status"], public_status)
                self.assertFalse(result["resolved"])
                self.assertFalse(result["confirmed_realization"])
                self.assertFalse(result["confirmed_exclusion"])
                self.assertTrue(result["fail_closed"])

    def test_verified_sat_and_unsat_are_classified_directionally(self) -> None:
        row = metric.MetricRow(0, (1, 2, 3, 4, 5), False)
        cases = (
            (
                {
                    "status": "SAT",
                    "verification": {"all_z3_assertions_true": True},
                },
                True,
                False,
            ),
            ({"status": "UNSAT"}, False, True),
        )
        for backend_fields, realized, excluded in cases:
            with self.subTest(status=backend_fields["status"]):
                backend_result = {
                    "system_id": "backend-id",
                    "decisive_stage": "test-stage",
                    "stages": [],
                    "constraint_counts": {},
                    **backend_fields,
                }
                with patch.object(
                    metric, "_probe_system", return_value=backend_result
                ):
                    result = metric.probe_metric_rows(
                        7,
                        (row,),
                        order=tuple(range(7)),
                        timeout_s=1.0,
                        backend="legacy-local-z3",
                    )

                self.assertTrue(result["resolved"])
                self.assertEqual(result["confirmed_realization"], realized)
                self.assertEqual(result["confirmed_exclusion"], excluded)
                self.assertFalse(result["fail_closed"])
                self.assertIn("NOT_KERNEL_CHECKED", result["trust_class"])

    def test_unverified_sat_and_invalid_inputs_fail_closed(self) -> None:
        row = metric.MetricRow(0, (1, 2, 3, 4, 5), False)
        with patch.object(
            metric,
            "_probe_system",
            return_value={
                "system_id": "unverified-sat",
                "status": "SAT",
                "decisive_stage": "full-convex",
                "stages": [],
                "constraint_counts": {},
            },
        ):
            result = metric.probe_metric_rows(
                7,
                (row,),
                order=tuple(range(7)),
                timeout_s=1.0,
                backend="legacy-local-z3",
            )
        self.assertEqual(result["backend_status"], "SAT")
        self.assertEqual(result["status"], "ERROR")
        self.assertTrue(result["fail_closed"])
        self.assertIn("lacks successful", result["diagnostic"])

        with patch.object(metric, "_probe_system") as backend:
            with self.assertRaisesRegex(ValueError, "not distinct"):
                metric.probe_metric_rows(
                    7,
                    (metric.MetricRow(0, (1, 2, 3, 4, 4), False),),
                    order=tuple(range(7)),
                    timeout_s=1.0,
                    backend="legacy-local-z3",
                )
            backend.assert_not_called()


if __name__ == "__main__":
    unittest.main()
