# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import unittest
from collections import Counter
from pathlib import Path

from census.global_confinement.critical_shell_probe import (
    _markdown,
    no_qfree_compatibility,
)
from census.global_confinement.shadow import ClassRow, verify_assignment
from census.multi_center import multi_center_census as mc


RESULTS = (
    Path(__file__).parents[1]
    / "critical_shell_results_all_placements_n11_12.json"
)


class CriticalShellResultTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.artifact = json.loads(RESULTS.read_text())

    def test_summary(self) -> None:
        self.assertEqual(
            self.artifact["schema"], "p97-critical-shell-incidence-probe-v2"
        )
        self.assertEqual(self.artifact["packet_count"], 517)
        all_sat = {"SAT": 517, "UNSAT": 0, "INDETERMINATE": 0}
        self.assertEqual(self.artifact["joint_counts"], all_sat)
        self.assertEqual(self.artifact["joint_global_counts"], all_sat)
        self.assertEqual(
            Counter(row["n"] for row in self.artifact["packets"]),
            Counter({11: 177, 12: 340}),
        )

    def test_every_source_is_individually_available(self) -> None:
        for row in self.artifact["packets"]:
            expected = row["n"] - 1
            self.assertEqual(
                row["individual_counts"],
                {"SAT": expected, "UNSAT": 0, "INDETERMINATE": 0},
            )
            self.assertEqual(row["shell_sources"], row["n"])

    def test_full_assignments_revalidate(self) -> None:
        for row in self.artifact["packets"]:
            frame = mc.build_frame(tuple(row["profile"]))
            assignment = row["joint_global"]["assignment"]
            rows = tuple(
                ClassRow(
                    name,
                    record["center"],
                    frozenset(record["support"]),
                    exact=record["exact"],
                )
                for name, record in assignment.items()
            )
            self.assertEqual(
                verify_assignment(
                    frame,
                    set(mc.PROVEN_ROWS),
                    rows,
                    extra_compatible=no_qfree_compatibility(
                        {
                            "dangerous": row["deleted"],
                            **{
                                name: int(name.split(":", maxsplit=1)[1])
                                for name in assignment
                                if name.startswith("shell:")
                            },
                        }
                    ),
                ),
                (True, None),
            )

    def test_markdown_matches_generator(self) -> None:
        self.assertEqual(
            _markdown(self.artifact), RESULTS.with_suffix(".md").read_text()
        )


if __name__ == "__main__":
    unittest.main()
