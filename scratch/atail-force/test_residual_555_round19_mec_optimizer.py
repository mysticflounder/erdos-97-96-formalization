#!/usr/bin/env python3
"""Regression checks for the discovery-only round-19 MEC probe."""

from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import residual_555_round19_mec_optimizer as probe  # noqa: E402


class Round19MECProbeTests(unittest.TestCase):
    def test_residual_binding_is_current(self) -> None:
        residual = probe.load_residual()
        self.assertEqual(residual["round"], 19)
        self.assertEqual(residual["assignment_sha256"], probe.ASSIGNMENT_SHA256)
        self.assertEqual(tuple(residual["metric_rows"]), probe.ENCODED_ROWS)

    def test_exact_variety_parameterization_rechecks_all_rows(self) -> None:
        report = probe.diagnostics(
            (0.64, 0.077, 2.62, -1.57, -1.52), (-1, -1, -1, -1)
        )
        self.assertTrue(report["parameterization_valid"])
        self.assertLess(report["max_abs_row_equality_residual"], 1e-12)

    def test_saved_report_is_discovery_only_and_nonterminal(self) -> None:
        report = json.loads(
            (HERE / "residual_555_round19_mec_optimizer.json").read_text(
                encoding="utf-8"
            )
        )
        self.assertEqual(
            report["epistemic_status"], "NUMERICAL_DISCOVERY_ONLY_NOT_A_PROOF"
        )
        result = report["result"]
        self.assertEqual(
            result["status"],
            "NO_NUMERICAL_WITNESS_NECESSARY_MEC_ORDER_GATE_FAILED",
        )
        self.assertEqual(result["attempts_run"], 32)
        self.assertFalse(result["full_exact_variety_search_run"])
        gate = result["necessary_gate"]
        self.assertLess(gate["best_attempt"]["recomputed_minimum_margin"], -0.17)
        names = {
            record["name"]
            for record in gate["best_attempt"]["active_or_near_active_constraints"]
        }
        self.assertEqual(
            names,
            {
                "point5_intersection_lower_triangle_inequality",
                "point6_intersection_lower_triangle_inequality",
                "point9_intersection_lower_triangle_inequality",
            },
        )


if __name__ == "__main__":
    unittest.main()
