# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from census.global_confinement.equality_ideal_probe import (
    INPUT_SCHEMAS,
    VERDICT_BEGIN,
    VERDICT_END,
    coordinate,
    greedy_minimize_rows,
    load_packet_systems,
    parse_singular_verdict,
    row_equalities,
    singular_script,
    system_polynomials,
    variable_names,
)
from census.global_confinement.metric_realizability_probe import MetricRow


class EqualityIdealProbeTests(unittest.TestCase):
    def test_gauge_coordinates_and_free_variable_order(self) -> None:
        self.assertEqual(coordinate(0), ("0", "0"))
        self.assertEqual(coordinate(1), ("1", "0"))
        self.assertEqual(coordinate(2), ("x2x", "x2y"))
        self.assertEqual(
            variable_names(4),
            ("x2x", "x2y", "x3x", "x3y"),
        )

    def test_metric_row_emits_three_pivoted_distance_equalities(self) -> None:
        row = MetricRow(0, (1, 2, 3, 4), True)
        self.assertEqual(
            row_equalities(row),
            (
                "((0-1)^2+(0-0)^2)-((0-x2x)^2+(0-x2y)^2)",
                "((0-1)^2+(0-0)^2)-((0-x3x)^2+(0-x3y)^2)",
                "((0-1)^2+(0-0)^2)-((0-x4x)^2+(0-x4y)^2)",
            ),
        )
        script = singular_script(variable_names(5), row_equalities(row))
        self.assertIn("ring r = 0, (x2x,x2y,x3x,x3y,x4x,x4y), dp;", script)
        self.assertIn(",\n  ((0-1)^2", script)
        self.assertNotIn("\n+  ", script)
        self.assertIn("ideal G = slimgb(I);", script)

    def test_marked_singular_verdict_parsing(self) -> None:
        self.assertEqual(
            parse_singular_verdict(
                f"noise\n{VERDICT_BEGIN}\n0\n{VERDICT_END}\n"
            ),
            "UNIT",
        )
        self.assertEqual(
            parse_singular_verdict(
                f"{VERDICT_BEGIN}\n1\n{VERDICT_END}\n"
            ),
            "NONUNIT",
        )
        self.assertEqual(
            parse_singular_verdict(
                f"{VERDICT_BEGIN}\n?\n{VERDICT_END}\n"
            ),
            "ERROR",
        )
        self.assertEqual(parse_singular_verdict("0"), "ERROR")

    def test_greedy_minimization_uses_only_confirmed_unit_deletions(self) -> None:
        rows = (
            MetricRow(0, (1, 2, 3, 4), False),
            MetricRow(1, (0, 2, 3, 4), False),
            MetricRow(2, (0, 1, 3, 4), False),
        )
        required = frozenset(rows[1:])
        calls: list[tuple[MetricRow, ...]] = []

        def fake_oracle(candidate: tuple[MetricRow, ...]) -> str:
            calls.append(candidate)
            return "UNIT" if required.issubset(candidate) else "NONUNIT"

        result = greedy_minimize_rows(rows, fake_oracle)
        self.assertEqual(result.rows, rows[1:])
        self.assertEqual(len(calls), 3)
        self.assertEqual(
            [attempt.result.verdict for attempt in result.attempts],
            ["UNIT", "NONUNIT", "NONUNIT"],
        )
        self.assertEqual(
            [attempt.removed for attempt in result.attempts],
            [True, False, False],
        )
        self.assertTrue(result.complete)
        self.assertTrue(result.confirmed_row_irredundant)

    def test_packet_filter_normalizes_saved_sat_assignment(self) -> None:
        assignment = {
            "first": {
                "center": 0,
                "support": [1, 2, 3, 4],
                "exact": False,
            },
            "first-exact-alias": {
                "center": 0,
                "support": [4, 3, 2, 1],
                "exact": True,
            },
            "second": {
                "center": 1,
                "support": [0, 2, 3, 4],
                "exact": False,
            },
        }
        artifact = {
            "schema": max(INPUT_SCHEMAS),
            "complete": True,
            "results": [
                {
                    "packet_index": 181,
                    "n": 5,
                    "core_free": {
                        "status": "SAT",
                        "assignment": assignment,
                    },
                }
            ],
        }
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "input.json"
            path.write_text(json.dumps(artifact))
            systems, metadata = load_packet_systems(path, (181, 181))
        self.assertEqual(metadata["requested_packet_indices"], [181])
        self.assertEqual(len(systems), 1)
        self.assertEqual(systems[0]["packet_index"], 181)
        self.assertEqual(len(systems[0]["rows"]), 2)
        self.assertTrue(systems[0]["rows"][0].exact)
        self.assertEqual(len(system_polynomials(systems[0]["rows"])), 6)


if __name__ == "__main__":
    unittest.main()
