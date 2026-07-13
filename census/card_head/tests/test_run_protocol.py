from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from census.card_head.run_manifest import build_manifest
from census.card_head.run_protocol import (
    ENGINE_EXHAUSTED_UNVERIFIED,
    PLANNED,
    RUNNING,
    STOPPED_BY_POLICY,
    STOP_BANK_GROWTH,
    STOP_SHAPE_STALENESS,
    STOP_WALL,
    RunProtocolError,
    append_chunk_completed,
    append_run_finished,
    append_run_started,
    event_sha256,
    read_event_stream,
    read_run_state,
)


SOURCE_HASHES = {"census/card_head/runner.py": "0" * 64}


def valid_manifest(**overrides):
    values = {
        "run_id": "ahead-n12-555-protocol-test",
        "cardinality": 12,
        "profile": (5, 5, 5),
        "wall_seconds": 100,
        "max_new_bank_rows": 10,
        "max_consecutive_shape_stale": 3,
        "source_hashes": SOURCE_HASHES,
        "created_utc": "2026-07-13T10:00:00Z",
    }
    values.update(overrides)
    return build_manifest(**values)


class RunProtocolTests(unittest.TestCase):
    def test_empty_start_and_progress_are_derived_from_hash_chained_events(self):
        with tempfile.TemporaryDirectory() as tmp:
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            self.assertEqual(read_run_state(manifest, event_dir)["status"], PLANNED)

            started = append_run_started(
                event_dir,
                manifest,
                initial_bank_rows=10,
                initial_shape_count=4,
                recorded_utc="2026-07-13T10:00:01Z",
            )
            self.assertEqual(started["status"], RUNNING)
            self.assertEqual(started["new_bank_rows"], 0)
            progressed = append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=2.5,
                bank_rows_total=11,
                shape_count_total=5,
                fresh_shape_count=1,
                recorded_utc="2026-07-13T10:00:02Z",
            )
            self.assertEqual(progressed["status"], RUNNING)
            self.assertEqual(progressed["new_bank_rows"], 1)
            self.assertEqual(progressed["consecutive_shape_stale"], 0)

            events = read_event_stream(event_dir)
            self.assertEqual(len(events), 2)
            self.assertEqual(events[1]["previous_event_sha256"], event_sha256(events[0]))
            self.assertEqual(
                (event_dir / "event-00000001.json").stat().st_mode & 0o222,
                0,
            )
            self.assertEqual(read_run_state(manifest, event_dir), progressed)

    def test_wall_stop_is_terminal_at_the_declared_boundary(self):
        with tempfile.TemporaryDirectory() as tmp:
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest(wall_seconds=10)
            append_run_started(
                event_dir,
                manifest,
                initial_bank_rows=10,
                initial_shape_count=4,
            )
            stopped = append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=10,
                bank_rows_total=10,
                shape_count_total=5,
                fresh_shape_count=1,
            )
            self.assertEqual(stopped["status"], STOPPED_BY_POLICY)
            self.assertTrue(stopped["terminal"])
            self.assertEqual(stopped["triggered_stops"], [STOP_WALL])
            with self.assertRaisesRegex(RunProtocolError, "STOPPED_BY_POLICY"):
                append_chunk_completed(
                    event_dir,
                    manifest,
                    elapsed_seconds=11,
                    bank_rows_total=10,
                    shape_count_total=5,
                    fresh_shape_count=0,
                )

    def test_bank_growth_stop_is_relative_to_the_start_baseline(self):
        with tempfile.TemporaryDirectory() as tmp:
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest(max_new_bank_rows=2)
            append_run_started(
                event_dir,
                manifest,
                initial_bank_rows=100,
                initial_shape_count=40,
            )
            stopped = append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=1,
                bank_rows_total=102,
                shape_count_total=41,
                fresh_shape_count=1,
            )
            self.assertEqual(stopped["new_bank_rows"], 2)
            self.assertEqual(stopped["triggered_stops"], [STOP_BANK_GROWTH])

    def test_fresh_witness_shapes_reset_staleness_without_bank_growth(self):
        with tempfile.TemporaryDirectory() as tmp:
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest(max_consecutive_shape_stale=2)
            append_run_started(
                event_dir,
                manifest,
                initial_bank_rows=10,
                initial_shape_count=4,
            )
            first = append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=1,
                bank_rows_total=10,
                shape_count_total=4,
                fresh_shape_count=0,
            )
            self.assertEqual(first["consecutive_shape_stale"], 1)
            reset = append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=2,
                bank_rows_total=10,
                shape_count_total=4,
                fresh_shape_count=2,
            )
            self.assertEqual(reset["consecutive_shape_stale"], 0)
            append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=3,
                bank_rows_total=10,
                shape_count_total=4,
                fresh_shape_count=0,
            )
            stopped = append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=4,
                bank_rows_total=10,
                shape_count_total=4,
                fresh_shape_count=0,
            )
            self.assertEqual(stopped["triggered_stops"], [STOP_SHAPE_STALENESS])

    def test_simultaneous_stops_have_deterministic_precedence_order(self):
        with tempfile.TemporaryDirectory() as tmp:
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest(
                wall_seconds=10,
                max_new_bank_rows=2,
                max_consecutive_shape_stale=1,
            )
            append_run_started(
                event_dir,
                manifest,
                initial_bank_rows=10,
                initial_shape_count=4,
            )
            stopped = append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=10,
                bank_rows_total=12,
                shape_count_total=4,
                fresh_shape_count=0,
            )
            self.assertEqual(
                stopped["triggered_stops"],
                [STOP_WALL, STOP_BANK_GROWTH, STOP_SHAPE_STALENESS],
            )

    def test_semantically_invalid_event_is_rejected_before_publication(self):
        with tempfile.TemporaryDirectory() as tmp:
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            append_run_started(
                event_dir,
                manifest,
                initial_bank_rows=10,
                initial_shape_count=4,
            )
            append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=5,
                bank_rows_total=11,
                shape_count_total=5,
                fresh_shape_count=1,
            )
            with self.assertRaisesRegex(RunProtocolError, "elapsed_seconds"):
                append_chunk_completed(
                    event_dir,
                    manifest,
                    elapsed_seconds=4,
                    bank_rows_total=11,
                    shape_count_total=5,
                    fresh_shape_count=0,
                )
            with self.assertRaisesRegex(RunProtocolError, "cannot exceed"):
                append_chunk_completed(
                    event_dir,
                    manifest,
                    elapsed_seconds=6,
                    bank_rows_total=13,
                    shape_count_total=7,
                    fresh_shape_count=1,
                )
            self.assertEqual(len(read_event_stream(event_dir)), 2)

    def test_engine_exhaustion_is_explicitly_unverified_and_terminal(self):
        with tempfile.TemporaryDirectory() as tmp:
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            append_run_started(
                event_dir,
                manifest,
                initial_bank_rows=10,
                initial_shape_count=4,
            )
            append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=4,
                bank_rows_total=11,
                shape_count_total=5,
                fresh_shape_count=1,
            )
            finished = append_run_finished(
                event_dir,
                manifest,
                elapsed_seconds=5,
                bank_rows_total=11,
                shape_count_total=5,
                outcome="ENGINE_EXHAUSTED_UNVERIFIED",
                detail="engine emitted no remaining finite candidate",
            )
            self.assertEqual(finished["status"], ENGINE_EXHAUSTED_UNVERIFIED)
            self.assertTrue(finished["terminal"])
            self.assertIn("not a checked finite cover", finished["scope"])
            with self.assertRaisesRegex(RunProtocolError, "UNVERIFIED"):
                append_run_finished(
                    event_dir,
                    manifest,
                    elapsed_seconds=6,
                    bank_rows_total=11,
                    shape_count_total=5,
                    outcome="ERROR",
                    detail="late event",
                )

    def test_hash_chain_and_filename_gaps_fail_closed(self):
        with tempfile.TemporaryDirectory() as tmp:
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            append_run_started(
                event_dir,
                manifest,
                initial_bank_rows=10,
                initial_shape_count=4,
            )
            append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=1,
                bank_rows_total=11,
                shape_count_total=5,
                fresh_shape_count=1,
            )
            first_path = event_dir / "event-00000000.json"
            first = json.loads(first_path.read_text(encoding="utf-8"))
            first["initial_bank_rows"] = 9
            first_path.chmod(0o644)
            first_path.write_text(json.dumps(first) + "\n", encoding="utf-8")
            first_path.chmod(0o444)
            with self.assertRaisesRegex(RunProtocolError, "hash chain"):
                read_run_state(manifest, event_dir)

        with tempfile.TemporaryDirectory() as tmp:
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            append_run_started(
                event_dir,
                manifest,
                initial_bank_rows=10,
                initial_shape_count=4,
            )
            append_chunk_completed(
                event_dir,
                manifest,
                elapsed_seconds=1,
                bank_rows_total=11,
                shape_count_total=5,
                fresh_shape_count=1,
            )
            (event_dir / "event-00000001.json").rename(
                event_dir / "event-00000002.json"
            )
            with self.assertRaisesRegex(RunProtocolError, "sequence gap"):
                read_run_state(manifest, event_dir)


if __name__ == "__main__":
    unittest.main()
