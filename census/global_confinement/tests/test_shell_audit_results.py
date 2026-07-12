# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import unittest
from collections import Counter
from pathlib import Path

from census.global_confinement.critical_shell_probe import (
    no_qfree_compatibility,
)
from census.global_confinement.shadow import ClassRow, verify_assignment
from census.global_confinement.shell_audit_probe import _markdown
from census.multi_center import multi_center_census as mc


RESULTS = (
    Path(__file__).parents[1]
    / "shell_audit_results_all_frames_n11_12.json"
)
STATUSES = ("SAT", "UNSAT", "INDETERMINATE")


class ShellAuditResultTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.artifact = json.loads(RESULTS.read_text())

    def test_summary(self) -> None:
        self.assertEqual(
            self.artifact["schema"],
            "p97-shell-coupled-audit-incidence-probe-v1",
        )
        self.assertEqual(self.artifact["packet_count"], 517)
        self.assertEqual(
            self.artifact["critical_counts"],
            {"SAT": 4198, "UNSAT": 795, "INDETERMINATE": 0},
        )
        self.assertEqual(self.artifact["survival_frame_count"], 15_440)
        self.assertEqual(
            self.artifact["survival_counts"],
            {"SAT": 12_894, "UNSAT": 2_546, "INDETERMINATE": 0},
        )
        self.assertEqual(
            [
                row["remaining_indeterminate_scenarios"]
                for row in self.artifact["scope"]["resolution_passes"]
            ],
            [12, 2, 0],
        )

    def test_packet_counts_recount(self) -> None:
        by_n = Counter()
        critical_by_n: dict[int, Counter] = {}
        survival_by_n: dict[int, Counter] = {}
        for packet in self.artifact["packets"]:
            n = packet["n"]
            by_n[n] += 1
            critical = Counter(
                result["status"]
                for result in packet["critical_results"].values()
            )
            survival = Counter(
                frame["result"]["status"]
                for frame in packet["survival_results"]
            )
            self.assertEqual(
                packet["critical_counts"],
                {status: critical[status] for status in STATUSES},
            )
            self.assertEqual(
                packet["survival_counts"],
                {status: survival[status] for status in STATUSES},
            )
            critical_by_n.setdefault(n, Counter()).update(critical)
            survival_by_n.setdefault(n, Counter()).update(survival)

        self.assertEqual(by_n, Counter({11: 177, 12: 340}))
        self.assertEqual(critical_by_n[11], Counter(SAT=1232, UNSAT=361))
        self.assertEqual(critical_by_n[12], Counter(SAT=2966, UNSAT=434))
        self.assertEqual(survival_by_n[11], Counter(SAT=1072, UNSAT=2468))
        self.assertEqual(survival_by_n[12], Counter(SAT=11822, UNSAT=78))

    def test_saved_witnesses_revalidate(self) -> None:
        for packet in self.artifact["packets"]:
            frame = mc.build_frame(tuple(packet["profile"]))
            for key in ("first_critical_witness", "first_survival_witness"):
                witness = packet[key]
                if witness is None:
                    continue
                assignment = witness["result"]["assignment"]
                rows = tuple(
                    ClassRow(
                        name,
                        record["center"],
                        frozenset(record["support"]),
                        exact=record["exact"],
                    )
                    for name, record in assignment.items()
                )
                source_by_row = {
                    "dangerous": packet["deleted"],
                    **{
                        name: int(name.split(":", maxsplit=1)[1])
                        for name in assignment
                        if name.startswith("shell:")
                    },
                }
                self.assertEqual(
                    verify_assignment(
                        frame,
                        set(mc.PROVEN_ROWS),
                        rows,
                        extra_compatible=no_qfree_compatibility(source_by_row),
                    ),
                    (True, None),
                )

                audit_rows = {
                    name: record
                    for name, record in assignment.items()
                    if name.startswith("audit-")
                }
                if key == "first_critical_witness":
                    self.assertEqual(len(audit_rows), 1)
                    self.assertIn(
                        packet["deleted"],
                        next(iter(audit_rows.values()))["support"],
                    )
                else:
                    self.assertEqual(len(audit_rows), 6)
                    self.assertTrue(
                        all(
                            packet["deleted"] not in record["support"]
                            for record in audit_rows.values()
                        )
                    )

    def test_markdown_matches_generator(self) -> None:
        self.assertEqual(
            _markdown(self.artifact), RESULTS.with_suffix(".md").read_text()
        )


if __name__ == "__main__":
    unittest.main()
