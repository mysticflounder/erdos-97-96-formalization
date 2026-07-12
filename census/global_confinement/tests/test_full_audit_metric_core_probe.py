# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import json
import os
import unittest

from census.global_confinement.full_audit_metric_core_probe import (
    DEFAULT_INPUT,
    HERE,
    SCHEMA,
    _choice_rows,
    _selection_scope,
    _validated_resume_results,
    select_scenarios,
)


class FullAuditMetricCoreProbeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.source = json.loads(DEFAULT_INPUT.read_text())

    def _scenarios(self, *, count: int = 3):
        scenarios, _, _ = select_scenarios(
            self.source,
            packet_indices=None,
            packet_limit=None,
            frames_per_packet=None,
            scenario_limit=count,
        )
        return scenarios

    def _result(self, scenario, status: str) -> dict:
        packet = scenario.packet
        return {
            "packet_index": scenario.packet_index,
            "frame_index": scenario.frame_index,
            "n": packet["n"],
            "profile": packet["profile"],
            "pin_source": packet["pin_source"],
            "deleted": packet["deleted"],
            "blocker": packet["blocker"],
            "dangerous": packet["dangerous"],
            "type": packet["type"],
            "aux": list(scenario.aux),
            "audit_centers": list(scenario.audit_centers),
            "core_free": {"status": status},
        }

    def _artifact(self, scenarios, statuses):
        scope = _selection_scope(
            packet_indices=None,
            packet_limit=None,
            frames_per_packet=None,
            scenario_limit=len(scenarios),
        )
        return {
            "schema": SCHEMA,
            "input": os.path.relpath(DEFAULT_INPUT, HERE.parents[1]),
            "input_sha256": hashlib.sha256(DEFAULT_INPUT.read_bytes()).hexdigest(),
            "scope": {
                **scope,
                "expected_scenarios": len(scenarios),
            },
            "results": [
                self._result(scenario, status)
                for scenario, status in zip(scenarios, statuses)
            ],
        }, scope

    def test_selection_skips_weaker_unsat_frames(self) -> None:
        scenarios, weaker_unsat, weaker_indeterminate = select_scenarios(
            self.source,
            packet_indices=None,
            packet_limit=2,
            frames_per_packet=1,
            scenario_limit=None,
        )
        self.assertLessEqual(len(scenarios), 2)
        self.assertTrue(all(
            scenario.packet["survival_results"][scenario.frame_index]["result"]["status"]
            == "SAT"
            for scenario in scenarios
        ))
        self.assertGreaterEqual(weaker_unsat, 0)
        self.assertEqual(weaker_indeterminate, 0)

    def test_choice_rows_combine_surplus_shell_and_six_audit_rows(self) -> None:
        scenario = self._scenarios(count=1)[0]
        context, rows = _choice_rows(scenario)
        by_name = {row.name: row for row in rows}
        deleted = context.labels.deleted
        self.assertTrue(by_name["surplus-source"].choices)
        self.assertTrue(all(
            deleted in choice.support
            for choice in by_name["surplus-source"].choices
        ))
        audit = [row for row in rows if row.name.startswith("audit-qfree:")]
        self.assertEqual(len(audit), 6)
        self.assertTrue(all(
            deleted not in choice.support
            for row in audit
            for choice in row.choices
        ))
        self.assertEqual(
            len([row for row in rows if row.name.startswith("shell:")]),
            context.frame.n - 1,
        )

    def test_resume_retries_indeterminate(self) -> None:
        scenarios = self._scenarios(count=3)
        artifact, scope = self._artifact(
            scenarios, ("UNSAT", "INDETERMINATE", "SAT")
        )
        reusable = _validated_resume_results(
            artifact,
            DEFAULT_INPUT.resolve(),
            scenarios=scenarios,
            selection_scope=scope,
        )
        self.assertEqual(
            [result["core_free"]["status"] for result in reusable],
            ["UNSAT", "SAT"],
        )

    def test_resume_rejects_changed_input(self) -> None:
        scenarios = self._scenarios(count=1)
        artifact, scope = self._artifact(scenarios, ("UNSAT",))
        artifact["input_sha256"] = "0" * 64
        with self.assertRaisesRegex(ValueError, "input content has changed"):
            _validated_resume_results(
                artifact,
                DEFAULT_INPUT.resolve(),
                scenarios=scenarios,
                selection_scope=scope,
            )


if __name__ == "__main__":
    unittest.main()
