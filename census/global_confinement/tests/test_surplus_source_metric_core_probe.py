# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import json
import os
import unittest

from census.global_confinement.probe import packet_labels
from census.global_confinement.metric_realizability_probe import MetricRow
from census.global_confinement.surplus_source_metric_core_probe import (
    CAP_SELECTED_SCHEMA,
    DEFAULT_INPUT,
    HERE,
    LEGACY_SCHEMAS,
    SCHEMA,
    _cap_selected_rows_ok,
    _validated_resume_results,
)
from census.multi_center import multi_center_census as mc


class SurplusSourceMetricCoreProbeTests(unittest.TestCase):
    def test_cap_selected_row_bounds_distinguish_endpoints_and_interior(self) -> None:
        frame = mc.build_frame((6, 4, 4))
        interior = frame.ints["S"]
        outside = tuple(sorted(set(range(frame.n)) - frame.S))
        self.assertTrue(
            _cap_selected_rows_ok(
                (
                    MetricRow(1, (interior[0], *outside[:3]), False),
                    MetricRow(
                        interior[1],
                        (interior[0], interior[2], *outside[:2]),
                        False,
                    ),
                    MetricRow(0, tuple(sorted(frame.S))[:4], False),
                ),
                frame,
            )
        )
        self.assertFalse(
            _cap_selected_rows_ok(
                (MetricRow(1, (interior[0], interior[1], *outside[:2]), False),),
                frame,
            )
        )
        self.assertFalse(
            _cap_selected_rows_ok(
                (MetricRow(1, tuple(outside[:4]), False),),
                frame,
            )
        )
        self.assertFalse(
            _cap_selected_rows_ok(
                (
                    MetricRow(
                        interior[1],
                        (1, interior[0], interior[2], outside[0]),
                        False,
                    ),
                ),
                frame,
            )
        )

    def _result(self, packet: dict, index: int, status: str) -> dict:
        labels = packet_labels(
            packet["n"],
            pin_source_index=packet["pin_source_index"],
            deleted_index=packet["deleted_index"],
        )
        return {
            "packet_index": index,
            "n": packet["n"],
            "profile": packet["profile"],
            "pin_source": labels.pin_source,
            "deleted": labels.deleted,
            "blocker": packet["blocker"],
            "dangerous": packet["dangerous"],
            "type": packet["type"],
            "core_free": {"status": status},
        }

    def _artifact(
        self, statuses: tuple[str, ...], *, schema: str = SCHEMA
    ) -> dict:
        source = json.loads(DEFAULT_INPUT.read_text())
        packets = source["packets"][: len(statuses)]
        return {
            "schema": schema,
            "input": os.path.relpath(DEFAULT_INPUT, HERE.parents[1]),
            "input_sha256": hashlib.sha256(DEFAULT_INPUT.read_bytes()).hexdigest(),
            "scope": {"limit": len(statuses), "expected_packets": len(statuses)},
            "results": [
                self._result(packet, index, status)
                for index, (packet, status) in enumerate(zip(packets, statuses))
            ],
        }

    def test_resume_retries_indeterminate_results(self) -> None:
        artifact = self._artifact(("UNSAT", "INDETERMINATE", "SAT"))
        results, description = _validated_resume_results(
            artifact, DEFAULT_INPUT.resolve(), limit=3
        )
        self.assertEqual(description, "current-schema")
        self.assertEqual(
            [result["core_free"]["status"] for result in results],
            ["UNSAT", "SAT"],
        )

    def test_cap_selected_resume_uses_its_distinct_schema(self) -> None:
        artifact = self._artifact(("UNSAT",), schema=CAP_SELECTED_SCHEMA)
        artifact["scope"]["cap_selected_row_counting"] = True
        results, description = _validated_resume_results(
            artifact,
            DEFAULT_INPUT.resolve(),
            limit=1,
            cap_selected_row_counting=True,
        )
        self.assertEqual(description, "cap-selected-current-schema")
        self.assertEqual(len(results), 1)

    def test_cap_upper_bound_resume_reuses_only_unsat(self) -> None:
        artifact = self._artifact(
            ("UNSAT", "SAT", "INDETERMINATE"),
            schema="p97-global-confinement-cap-selected-row-metric-core-v1",
        )
        artifact["scope"]["cap_selected_row_counting"] = True
        results, description = _validated_resume_results(
            artifact,
            DEFAULT_INPUT.resolve(),
            limit=3,
            cap_selected_row_counting=True,
        )
        self.assertEqual(description, "cap-hit-upper-bounds")
        self.assertEqual(
            [result["core_free"]["status"] for result in results],
            ["UNSAT"],
        )

    def test_resume_rejects_changed_input_digest(self) -> None:
        artifact = self._artifact(("UNSAT",))
        artifact["input_sha256"] = "0" * 64
        with self.assertRaisesRegex(ValueError, "input content has changed"):
            _validated_resume_results(artifact, DEFAULT_INPUT.resolve(), limit=1)

    def test_v4_resume_reuses_only_monotone_unsat_results(self) -> None:
        schema = "p97-global-confinement-surplus-source-metric-core-v4"
        self.assertIn(schema, LEGACY_SCHEMAS)
        artifact = self._artifact(
            ("UNSAT", "SAT", "INDETERMINATE"), schema=schema
        )
        results, description = _validated_resume_results(
            artifact, DEFAULT_INPUT.resolve(), limit=3
        )
        self.assertEqual(description, "nine-core-correct-role")
        self.assertEqual(
            [result["core_free"]["status"] for result in results],
            ["UNSAT"],
        )
        self.assertEqual(
            results[0]["legacy_resume"],
            {"schema": schema, "basis": "monotone-unsat"},
        )

    def test_v5_resume_reuses_only_monotone_unsat_results(self) -> None:
        schema = "p97-global-confinement-surplus-source-metric-core-v5"
        self.assertIn(schema, LEGACY_SCHEMAS)
        artifact = self._artifact(
            ("UNSAT", "SAT", "INDETERMINATE"), schema=schema
        )
        results, description = _validated_resume_results(
            artifact, DEFAULT_INPUT.resolve(), limit=3
        )
        self.assertEqual(description, "eleven-core-correct-role")
        self.assertEqual(
            [result["core_free"]["status"] for result in results],
            ["UNSAT"],
        )


if __name__ == "__main__":
    unittest.main()
