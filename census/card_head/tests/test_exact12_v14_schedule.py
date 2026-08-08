from __future__ import annotations

import copy
import unittest
from pathlib import Path

from census.card_head.exact12_v14_schedule import (
    DISTINGUISHED_D_CENTERS,
    FROZEN_SCHEDULE_SHA256,
    LEAN_CONTRACT_SYMBOL,
    NAMED_DELETION_ARMS,
    PLACEMENT_REPRESENTATIVES,
    Exact12V14ScheduleError,
    build_manifest,
    cells,
    json_sha256,
    schedule_payload,
    validate_manifest,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


class Exact12V14ScheduleTest(unittest.TestCase):
    def test_coordinate_universe_is_the_checked_648_cell_schedule(self) -> None:
        schedule_cells = cells()
        self.assertEqual(len(PLACEMENT_REPRESENTATIVES), 12)
        self.assertEqual(len(NAMED_DELETION_ARMS), 6)
        self.assertEqual(len(DISTINGUISHED_D_CENTERS), 9)
        self.assertEqual(len(schedule_cells), 648)
        self.assertEqual(len(set(schedule_cells)), 648)
        self.assertEqual(
            schedule_cells[0],
            schedule_cells[0].__class__(0, 0, 2, "u_q", 0),
        )
        self.assertEqual(
            schedule_cells[-1],
            schedule_cells[-1].__class__(11, 11, 3, "xu_w", 11),
        )

    def test_payload_is_deterministic_and_explicitly_nonclosing(self) -> None:
        first = schedule_payload()
        second = schedule_payload()
        self.assertEqual(first, second)
        self.assertEqual(json_sha256(first), json_sha256(second))
        self.assertEqual(json_sha256(first), FROZEN_SCHEDULE_SHA256)
        self.assertEqual(first["semantic_status"], "ENUMERATION_ONLY")
        self.assertIn("cells may overlap or be empty", first["scope"])
        self.assertEqual(first["counts"]["cells"], 648)

    def test_manifest_binds_current_lean_contract_and_validates(self) -> None:
        manifest = build_manifest(REPO_ROOT)
        self.assertEqual(manifest["source_contract"]["symbol"], LEAN_CONTRACT_SYMBOL)
        self.assertTrue(manifest["source_contract"]["files"])
        validate_manifest(manifest, REPO_ROOT)

    def test_manifest_rejects_incomplete_or_reordered_cells(self) -> None:
        manifest = build_manifest(REPO_ROOT)
        missing = copy.deepcopy(manifest)
        missing["schedule"]["cells"].pop()
        missing["schedule"]["counts"]["cells"] -= 1
        missing["schedule_sha256"] = json_sha256(missing["schedule"])
        with self.assertRaisesRegex(Exact12V14ScheduleError, "complete schedule"):
            validate_manifest(missing, REPO_ROOT)

        reordered = copy.deepcopy(manifest)
        reordered["schedule"]["cells"].reverse()
        reordered["schedule_sha256"] = json_sha256(reordered["schedule"])
        with self.assertRaisesRegex(Exact12V14ScheduleError, "complete schedule"):
            validate_manifest(reordered, REPO_ROOT)

    def test_manifest_rejects_duplicate_and_boolean_index_cells(self) -> None:
        manifest = build_manifest(REPO_ROOT)
        duplicate = copy.deepcopy(manifest)
        duplicate["schedule"]["cells"][1] = copy.deepcopy(
            duplicate["schedule"]["cells"][0]
        )
        duplicate["schedule_sha256"] = json_sha256(duplicate["schedule"])
        with self.assertRaisesRegex(Exact12V14ScheduleError, "complete schedule"):
            validate_manifest(duplicate, REPO_ROOT)

        boolean_index = copy.deepcopy(manifest)
        boolean_index["schedule"]["cells"][1]["placement_index"] = True
        boolean_index["schedule_sha256"] = json_sha256(boolean_index["schedule"])
        with self.assertRaisesRegex(Exact12V14ScheduleError, "complete schedule"):
            validate_manifest(boolean_index, REPO_ROOT)

    def test_manifest_rejects_changed_or_boolean_source_metadata(self) -> None:
        manifest = build_manifest(REPO_ROOT)

        changed = copy.deepcopy(manifest)
        changed["source_contract"]["files"][0]["sha256"] = "0" * 64
        with self.assertRaisesRegex(Exact12V14ScheduleError, "source contract"):
            validate_manifest(changed, REPO_ROOT)

        boolean_size = copy.deepcopy(manifest)
        boolean_size["source_contract"]["files"][0]["bytes"] = True
        with self.assertRaisesRegex(Exact12V14ScheduleError, "source contract"):
            validate_manifest(boolean_size, REPO_ROOT)


if __name__ == "__main__":
    unittest.main()
