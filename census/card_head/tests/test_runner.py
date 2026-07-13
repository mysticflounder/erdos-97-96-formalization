from __future__ import annotations

import json
import unittest
from pathlib import Path

from census.card_head.run_manifest import build_manifest, source_digests
from census.card_head.run_protocol import PLANNED
from census.card_head.runner import (
    PREFLIGHT_STATUS,
    REQUIRED_SOURCE_PATHS,
    RUNNER_STATUS_SCHEMA,
    RunnerError,
    preflight_manifest,
    status_manifest,
)


REPO_ROOT = Path(__file__).parents[3]
FIXTURE_PATH = REPO_ROOT / "census/card_head/candidate_count_fixtures.json"


def valid_preflight_manifest(*, sources=REQUIRED_SOURCE_PATHS):
    hashes = source_digests(REPO_ROOT, [Path(path) for path in sorted(sources)])
    return build_manifest(
        run_id="ahead-n14-674-preflight",
        cardinality=14,
        profile=(6, 7, 4),
        wall_seconds=3600,
        max_new_bank_rows=200,
        max_consecutive_shape_stale=25,
        source_hashes=hashes,
        max_workers=4,
        nice=10,
        created_utc="2026-07-13T10:00:00Z",
    )


class RunnerPreflightTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.fixtures = json.loads(FIXTURE_PATH.read_text(encoding="utf-8"))

    def test_preflight_pins_the_selected_candidate_surface(self):
        manifest = valid_preflight_manifest()
        result = preflight_manifest(
            manifest,
            repo_root=REPO_ROOT,
            fixture_document=self.fixtures,
        )
        self.assertEqual(result["status"], PREFLIGHT_STATUS)
        self.assertFalse(result["launch_authorized"])
        self.assertEqual(result["candidate_fixture"]["candidate_total"], 7148)
        self.assertEqual(
            result["candidate_fixture"]["role_candidate_counts"]["W"], 30
        )
        self.assertEqual(manifest["command"][:4], ["nice", "-n", "10", "uv"])
        self.assertTrue(
            result["cegar_boundary"]["exact_fraction_replay_required"]
        )
        self.assertTrue(result["cegar_boundary"]["bank_publication_enabled"])
        self.assertFalse(
            result["cegar_boundary"]["mining_generation_worker_enabled"]
        )

    def test_preflight_rejects_an_unpinned_runner_source(self):
        incomplete = REQUIRED_SOURCE_PATHS - {"census/card_head/runner.py"}
        manifest = valid_preflight_manifest(sources=incomplete)
        with self.assertRaisesRegex(RunnerError, "omits required"):
            preflight_manifest(
                manifest,
                repo_root=REPO_ROOT,
                fixture_document=self.fixtures,
            )

    def test_status_is_read_only_and_planned_without_events(self):
        manifest = valid_preflight_manifest()
        event_dir = REPO_ROOT / manifest["artifact_dir"] / "events"
        self.assertFalse(event_dir.exists())
        result = status_manifest(
            manifest,
            repo_root=REPO_ROOT,
            fixture_document=self.fixtures,
        )
        self.assertEqual(result["schema"], RUNNER_STATUS_SCHEMA)
        self.assertEqual(result["run_state"]["status"], PLANNED)
        self.assertFalse(event_dir.exists())


if __name__ == "__main__":
    unittest.main()
