# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import unittest
from collections import Counter
from pathlib import Path

from census.global_confinement.placement_scan import _markdown as placement_markdown
from census.global_confinement.zero_type_core_probe import (
    _markdown as core_markdown,
)


ROOT = Path(__file__).parents[1]
N13_RESULTS = ROOT / "placement_zero_types_n13.json"
CORE_RESULTS = ROOT / "zero_type_cores_n11_13.json"
ZERO_TYPES = ["(0, 0, 2, 2)", "(0, 2, 0, 2)"]


class ZeroTypeResultTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.n13 = json.loads(N13_RESULTS.read_text())
        cls.cores = json.loads(CORE_RESULTS.read_text())

    def test_n13_targeted_scan(self) -> None:
        self.assertEqual(self.n13["scope"]["row_type_filter"], ZERO_TYPES)
        self.assertEqual(self.n13["stable_zero_extension_types"], ZERO_TYPES)
        row = self.n13["by_n"][0]
        self.assertEqual(row["n"], 13)
        self.assertEqual(row["placement_count"], 30)
        self.assertEqual(
            row["counts"],
            {"SAT": 0, "UNSAT": 1800, "INDETERMINATE": 0},
        )
        self.assertEqual(
            row["type_totals"]["(0, 0, 2, 2)"]["UNSAT"], 600
        )
        self.assertEqual(
            row["type_totals"]["(0, 2, 0, 2)"]["UNSAT"], 1200
        )
        self.assertTrue(
            all(
                candidate["nodes"] == 0
                for placement in self.n13["placements"]
                for candidate in placement["rows"]
            )
        )

    def test_core_partition(self) -> None:
        self.assertEqual(self.cores["core_count"], 2888)
        kinds = Counter(core["core_kind"] for core in self.cores["cores"])
        self.assertEqual(
            kinds,
            Counter({"fixed-pair": 1444, "one-center-domain": 1444}),
        )
        for core in self.cores["cores"]:
            if core["core_kind"] == "fixed-pair":
                self.assertIn(
                    core["fixed_pair_reason"],
                    {
                        "cross-separation:dangerous",
                        "overlap>2:dangerous",
                    },
                )
                self.assertEqual(core["empty_centers"], [])
            else:
                self.assertIsNone(core["fixed_pair_reason"])
                self.assertEqual(
                    [center["role"] for center in core["empty_centers"]],
                    ["Moser-2"],
                )

    def test_core_region_signatures(self) -> None:
        observed = {
            (
                row["n"],
                row["type"],
                row["blocker_region"],
                row["core_kind"],
            )
            for row in self.cores["signature_counts"]
        }
        for n in (11, 12, 13):
            self.assertIn(
                (n, "(0, 0, 2, 2)", "O2", "fixed-pair"), observed
            )
            self.assertIn(
                (n, "(0, 0, 2, 2)", "O1", "one-center-domain"),
                observed,
            )
            self.assertIn(
                (n, "(0, 2, 0, 2)", "S", "fixed-pair"), observed
            )
            self.assertIn(
                (n, "(0, 2, 0, 2)", "S", "one-center-domain"),
                observed,
            )

    def test_reports_match_generators(self) -> None:
        self.assertEqual(
            placement_markdown(self.n13), N13_RESULTS.with_suffix(".md").read_text()
        )
        self.assertEqual(
            core_markdown(self.cores), CORE_RESULTS.with_suffix(".md").read_text()
        )


if __name__ == "__main__":
    unittest.main()
