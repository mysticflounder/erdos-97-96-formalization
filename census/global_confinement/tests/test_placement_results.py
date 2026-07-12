# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import unittest
from collections import Counter
from pathlib import Path

from census.global_confinement.placement_scan import _markdown


RESULTS = Path(__file__).parents[1] / "placement_results_n11_12.json"


class PlacementResultTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.artifact = json.loads(RESULTS.read_text())

    def test_summary(self) -> None:
        self.assertEqual(
            self.artifact["schema"],
            "p97-global-confinement-placement-scan-v1",
        )
        self.assertEqual(
            self.artifact["stable_zero_extension_types"],
            ["(0, 0, 2, 2)", "(0, 2, 0, 2)"],
        )
        expected = {
            11: (12, {"SAT": 3779, "UNSAT": 2989, "INDETERMINATE": 0}),
            12: (20, {"SAT": 13700, "UNSAT": 5000, "INDETERMINATE": 0}),
        }
        for row in self.artifact["by_n"]:
            placement_count, counts = expected[row["n"]]
            self.assertEqual(row["placement_count"], placement_count)
            self.assertEqual(row["counts"], counts)

    def test_placement_aggregates_recount(self) -> None:
        for placement in self.artifact["placements"]:
            counts = Counter(row["status"] for row in placement["rows"])
            self.assertEqual(
                placement["counts"],
                {
                    status: counts[status]
                    for status in ("SAT", "UNSAT", "INDETERMINATE")
                },
            )
            by_type: dict[str, Counter] = {}
            for row in placement["rows"]:
                counts_for_type = by_type.setdefault(row["type"], Counter())
                counts_for_type["candidates"] += 1
                counts_for_type[row["status"]] += 1
            for row_type, type_counts in placement["type_counts"].items():
                self.assertEqual(
                    type_counts,
                    {
                        "candidates": by_type[row_type]["candidates"],
                        "SAT": by_type[row_type]["SAT"],
                        "UNSAT": by_type[row_type]["UNSAT"],
                        "INDETERMINATE": by_type[row_type]["INDETERMINATE"],
                    },
                )

    def test_canonical_placements_match_full_probe(self) -> None:
        canonical = {
            row["n"]: row
            for row in self.artifact["placements"]
            if (row["pin_source_index"], row["deleted_index"]) == (0, 1)
        }
        self.assertEqual(
            canonical[11]["counts"],
            {"SAT": 364, "UNSAT": 200, "INDETERMINATE": 0},
        )
        self.assertEqual(
            canonical[12]["counts"],
            {"SAT": 709, "UNSAT": 226, "INDETERMINATE": 0},
        )

    def test_markdown_matches_generator(self) -> None:
        self.assertEqual(
            _markdown(self.artifact), RESULTS.with_suffix(".md").read_text()
        )


if __name__ == "__main__":
    unittest.main()
