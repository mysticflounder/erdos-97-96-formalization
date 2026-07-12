# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import unittest
from collections import Counter
from pathlib import Path

from census.global_confinement.shadow import ClassRow, verify_assignment
from census.global_confinement.probe import _markdown
from census.multi_center import multi_center_census as mc


RESULTS = Path(__file__).parents[1] / "results_n11_12.json"


def assignment_rows(assignment: dict[str, dict]) -> tuple[ClassRow, ...]:
    return tuple(
        ClassRow(
            name,
            row["center"],
            frozenset(row["support"]),
            exact=row["exact"],
        )
        for name, row in assignment.items()
    )


class GlobalConfinementResultTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.artifact = json.loads(RESULTS.read_text())

    def test_checkpoint_summary(self) -> None:
        self.assertEqual(
            self.artifact["schema"], "p97-global-confinement-shadow-v1"
        )
        expected = {
            11: {
                "base_counts": {"SAT": 364, "UNSAT": 200, "INDETERMINATE": 0},
                "packet_frames": 7280,
                "critical_center_counts": {
                    "SAT": 2654,
                    "UNSAT": 622,
                    "INDETERMINATE": 0,
                },
                "survival_counts": {
                    "SAT": 3933,
                    "UNSAT": 3347,
                    "INDETERMINATE": 0,
                },
                "confinement_counts": {
                    "SAT": 0,
                    "UNSAT": 7280,
                    "INDETERMINATE": 0,
                },
            },
            12: {
                "base_counts": {"SAT": 709, "UNSAT": 226, "INDETERMINATE": 0},
                "packet_frames": 24815,
                "critical_center_counts": {
                    "SAT": 6082,
                    "UNSAT": 1008,
                    "INDETERMINATE": 0,
                },
                "survival_counts": {
                    "SAT": 24815,
                    "UNSAT": 0,
                    "INDETERMINATE": 0,
                },
                "confinement_counts": {
                    "SAT": 0,
                    "UNSAT": 24815,
                    "INDETERMINATE": 0,
                },
            },
        }
        for result in self.artifact["results"]:
            for key, value in expected[result["n"]].items():
                self.assertEqual(result[key], value)

    def test_aggregate_counts_match_dangerous_rows(self) -> None:
        for result in self.artifact["results"]:
            base = Counter(row["base"]["status"] for row in result["dangerous_rows"])
            self.assertEqual(dict(result["base_counts"]), {
                status: base[status] for status in ("SAT", "UNSAT", "INDETERMINATE")
            })
            admitted = [
                row for row in result["dangerous_rows"]
                if row["base"]["status"] == "SAT"
            ]
            self.assertEqual(
                result["packet_frames"], sum(row["frame_count"] for row in admitted)
            )
            for key in (
                "critical_center_counts",
                "survival_counts",
                "confinement_counts",
            ):
                total = Counter()
                for row in admitted:
                    total.update(row[key])
                self.assertEqual(
                    result[key],
                    {
                        status: total[status]
                        for status in ("SAT", "UNSAT", "INDETERMINATE")
                    },
                )

    def test_saved_sat_witnesses_revalidate(self) -> None:
        for result in self.artifact["results"]:
            frame = mc.build_frame(tuple(result["profile"]))
            critical = result["first_critical_witness"]["witness"]["result"]
            survival = result["first_survival_witness"]["witness"]["survival"]
            for witness in (critical, survival):
                self.assertEqual(witness["status"], "SAT")
                self.assertEqual(
                    verify_assignment(
                        frame,
                        set(mc.PROVEN_ROWS),
                        assignment_rows(witness["assignment"]),
                    ),
                    (True, None),
                )
            self.assertIsNone(result["first_confinement_witness"])

    def test_markdown_checkpoint_matches_generator(self) -> None:
        report = RESULTS.with_suffix(".md").read_text()
        self.assertEqual(_markdown(self.artifact), report)
        self.assertIn("`intS = (3, 4, 5, 6)`", report)
        self.assertIn("`intS = (3, 4, 5, 6, 7)`", report)


if __name__ == "__main__":
    unittest.main()
