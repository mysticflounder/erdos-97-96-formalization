# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import json
import unittest

from census.census_554.formalized_structural_oracle import (
    FAMILIES,
    FAMILY_BY_STAGE,
)
from census.global_confinement.direct_cap_selected_metric_core_probe import (
    DEFAULT_RESIDUAL_OUT,
    DEPENDENCIES,
    HERE,
    METRIC_CORE_DETECTOR_STAGE_COUNT,
    METRIC_CORE_FAMILY_COUNT,
    RESIDUAL_SCHEMA,
    _cap_filtered_rows,
    _residual_bank,
    _safe_blocker_assignment,
)
from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _formalized_metric_core,
)
from census.global_confinement.probe import PIN_CENTER, packet_labels
from census.global_confinement.shadow import (
    ClassRow,
    hull_order,
    verify_assignment,
)
from census.global_confinement.surplus_source_metric_core_probe import (
    _cap_selected_rows_ok,
)
from census.multi_center import multi_center_census as mc


class DirectCapSelectedMetricCoreProbeTests(unittest.TestCase):
    def test_cap_filter_selects_every_nonpinned_center(self) -> None:
        labels = packet_labels(11, pin_source_index=0, deleted_index=1)
        frame, candidates = mc.cached_candidate_lists(labels.profile, set())
        assert candidates is not None

        rows = _cap_filtered_rows(frame, candidates, labels.deleted)

        self.assertEqual(
            {row.center for row in rows}, set(range(frame.n)) - {PIN_CENTER}
        )
        for row in rows:
            self.assertTrue(row.candidates)
            for support in row.candidates:
                if row.center == 0:
                    self.assertIn(labels.deleted, support)
                self.assertTrue(
                    _cap_selected_rows_ok(
                        (
                            MetricRow(
                                row.center, tuple(sorted(support)), False
                            ),
                        ),
                        frame,
                    )
                )

    def test_safe_blockers_are_derived_from_selected_rows(self) -> None:
        rows = tuple(
            MetricRow(
                center,
                tuple(point for point in range(5) if point != center),
                center == PIN_CENTER,
            )
            for center in range(5)
        )

        blocker = _safe_blocker_assignment(rows, 5, frozenset({0}), 2)

        self.assertIsNotNone(blocker)
        assert blocker is not None
        self.assertEqual(blocker[0], PIN_CENTER)
        for source, center in enumerate(blocker):
            self.assertNotEqual(source, center)
            self.assertIn(source, rows[center].support)
        self.assertNotEqual(blocker[2], PIN_CENTER)

    def test_residual_bank_deduplicates_patterns_not_occurrences(self) -> None:
        rows = [
            {"center": 0, "support": [1, 2, 3, 4], "exact": False},
            {"center": 1, "support": [0, 2, 3, 4], "exact": True},
        ]
        results = [
            {
                "pin_source_index": 0,
                "deleted_index": deleted_index,
                "pin_source": 3,
                "deleted": 4 + deleted_index,
                "residuals": [{"rows": rows, "blocker": [1, 0]}],
            }
            for deleted_index in (1, 2)
        ]

        bank = _residual_bank(results)

        self.assertEqual(len(bank), 1)
        self.assertEqual(len(bank[0]["occurrences"]), 2)
        self.assertEqual(len(bank[0]["pattern_sha256"]), 64)

    def test_saved_residual_bank_rechecks_every_encoded_constraint(self) -> None:
        artifact = json.loads(DEFAULT_RESIDUAL_OUT.read_text())
        source = HERE.parents[1] / artifact["source"]
        self.assertEqual(artifact["schema"], RESIDUAL_SCHEMA)
        self.assertTrue(artifact["complete"])
        self.assertEqual(artifact["summary"], {"EXHAUSTIVE": 12})
        self.assertEqual(
            artifact["source_sha256"],
            hashlib.sha256(source.read_bytes()).hexdigest(),
        )
        self.assertEqual(
            artifact["dependency_sha256"],
            {
                str(path.relative_to(HERE.parents[1])): hashlib.sha256(
                    path.read_bytes()
                ).hexdigest()
                for path in DEPENDENCIES
            },
        )
        self.assertEqual(artifact["residual_pattern_count"], 0)
        self.assertEqual(artifact["residual_bank"], [])
        self.assertEqual(METRIC_CORE_FAMILY_COUNT, len(FAMILIES))
        self.assertEqual(METRIC_CORE_DETECTOR_STAGE_COUNT, len(FAMILY_BY_STAGE))
        self.assertEqual(
            artifact["scope"]["metric_core_count"], METRIC_CORE_FAMILY_COUNT
        )
        self.assertEqual(
            artifact["scope"]["metric_core_detector_stage_count"],
            METRIC_CORE_DETECTOR_STAGE_COUNT,
        )

        for entry in artifact["residual_bank"]:
            canonical = json.dumps(
                entry["rows"], sort_keys=True, separators=(",", ":")
            ).encode()
            self.assertEqual(
                entry["pattern_sha256"], hashlib.sha256(canonical).hexdigest()
            )
            rows = tuple(
                MetricRow(
                    int(row["center"]),
                    tuple(int(point) for point in row["support"]),
                    bool(row["exact"]),
                )
                for row in entry["rows"]
            )
            self.assertEqual({row.center for row in rows}, set(range(11)))
            class_rows = tuple(
                ClassRow(
                    f"row:{row.center}",
                    row.center,
                    frozenset(row.support),
                    row.exact,
                )
                for row in rows
            )
            frame = mc.build_frame((6, 4, 4))
            self.assertEqual(
                verify_assignment(frame, set(), class_rows), (True, None)
            )
            self.assertTrue(_cap_selected_rows_ok(rows, frame))
            self.assertIsNone(
                _formalized_metric_core(rows, 11, hull_order(frame))
            )
            by_center = {row.center: row for row in rows}
            for occurrence in entry["occurrences"]:
                labels = packet_labels(
                    11,
                    pin_source_index=occurrence["pin_source_index"],
                    deleted_index=occurrence["deleted_index"],
                )
                self.assertEqual(
                    frozenset(by_center[PIN_CENTER].support), labels.pin_class
                )
                self.assertIn(labels.deleted, by_center[0].support)
                blocker = _safe_blocker_assignment(
                    rows, 11, labels.pin_class, labels.deleted
                )
                self.assertEqual(list(blocker or ()), occurrence["blocker"])


if __name__ == "__main__":
    unittest.main()
