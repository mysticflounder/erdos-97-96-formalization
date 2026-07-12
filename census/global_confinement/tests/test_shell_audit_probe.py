# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import unittest
from pathlib import Path

from census.global_confinement.critical_shell_probe import (
    no_qfree_compatibility,
)
from census.global_confinement.shadow import ClassRow, verify_assignment
from census.global_confinement.shell_audit_probe import _packet_job
from census.multi_center import multi_center_census as mc


SHELL_RESULTS = (
    Path(__file__).parents[1]
    / "critical_shell_results_all_placements_n11_12.json"
)


class ShellAuditProbeTests(unittest.TestCase):
    def test_first_packet_regression(self) -> None:
        packet = json.loads(SHELL_RESULTS.read_text())["packets"][0]
        result = _packet_job((packet, 100_000, 1, False))
        self.assertEqual(
            result["critical_counts"],
            {"SAT": 5, "UNSAT": 4, "INDETERMINATE": 0},
        )
        self.assertEqual(
            result["survival_counts"],
            {"SAT": 0, "UNSAT": 1, "INDETERMINATE": 0},
        )

        assignment = result["first_critical_witness"]["result"]["assignment"]
        rows = tuple(
            ClassRow(
                name,
                record["center"],
                frozenset(record["support"]),
                exact=record["exact"],
            )
            for name, record in assignment.items()
        )
        frame = mc.build_frame(tuple(result["profile"]))
        source_by_row = {
            "dangerous": result["deleted"],
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


if __name__ == "__main__":
    unittest.main()
