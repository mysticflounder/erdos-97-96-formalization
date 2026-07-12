from __future__ import annotations

import sqlite3
import tempfile
import unittest
from pathlib import Path

from census.census_554.closure_checkpoint import (
    CheckpointError,
    ClosureCheckpoint,
)


def _record(center: int, member: int, clause: list[int]) -> dict:
    return {
        "pattern": [[center, [member, (member + 1) % 11]]],
        "clause": clause,
        "source": f"pat_{center:05d}",
    }


class ClosureCheckpointTests(unittest.TestCase):
    def test_ordered_replay_and_idempotent_batch(self) -> None:
        with tempfile.TemporaryDirectory() as root_string:
            path = Path(root_string) / "closure.sqlite3"
            metadata = {"bank_sha256": "abc", "seed": 17}
            first = _record(0, 1, [-10])
            second = _record(1, 3, [-11, -12])
            with ClosureCheckpoint.create(path, metadata) as checkpoint:
                self.assertEqual(checkpoint.append_batch(
                    [first, second], iteration=4, elapsed_seconds=2.5
                ), 2)
                self.assertEqual(checkpoint.append_batch(
                    [first], iteration=5, elapsed_seconds=3.0
                ), 0)
            with ClosureCheckpoint.open(path, metadata) as checkpoint:
                self.assertEqual(list(checkpoint.records()), [first, second])
                self.assertEqual(checkpoint.progress().iteration, 5)
                self.assertEqual(checkpoint.progress().instance_count, 2)

    def test_metadata_drift_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as root_string:
            path = Path(root_string) / "closure.sqlite3"
            with ClosureCheckpoint.create(path, {"bank_sha256": "old"}):
                pass
            with self.assertRaisesRegex(CheckpointError, "fingerprint mismatch"):
                ClosureCheckpoint.open(path, {"bank_sha256": "new"})

    def test_conflicting_duplicate_rolls_back_whole_batch(self) -> None:
        with tempfile.TemporaryDirectory() as root_string:
            path = Path(root_string) / "closure.sqlite3"
            metadata = {"bank_sha256": "abc"}
            first = _record(0, 1, [-10])
            conflicting = dict(first, clause=[-99])
            later = _record(2, 5, [-20])
            with ClosureCheckpoint.create(path, metadata) as checkpoint:
                checkpoint.append_batch(
                    [first], iteration=1, elapsed_seconds=1.0
                )
                with self.assertRaisesRegex(CheckpointError, "conflicting"):
                    checkpoint.append_batch(
                        [later, conflicting], iteration=2, elapsed_seconds=2.0
                    )
                self.assertEqual(list(checkpoint.records()), [first])
                self.assertEqual(checkpoint.progress().iteration, 1)

    def test_progress_count_corruption_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as root_string:
            path = Path(root_string) / "closure.sqlite3"
            metadata = {"bank_sha256": "abc"}
            with ClosureCheckpoint.create(path, metadata) as checkpoint:
                checkpoint.append_batch(
                    [_record(0, 1, [-1])], iteration=1, elapsed_seconds=1.0
                )
            connection = sqlite3.connect(path)
            with connection:
                connection.execute(
                    "UPDATE progress SET instance_count = 99 WHERE singleton = 1"
                )
            connection.close()
            with self.assertRaisesRegex(CheckpointError, "does not match"):
                ClosureCheckpoint.open(path, metadata)

    def test_progress_cursor_cannot_move_backwards(self) -> None:
        with tempfile.TemporaryDirectory() as root_string:
            path = Path(root_string) / "closure.sqlite3"
            with ClosureCheckpoint.create(path, {"bank_sha256": "abc"}) as checkpoint:
                checkpoint.append_batch(
                    [_record(0, 1, [-1])], iteration=4, elapsed_seconds=8.0
                )
                with self.assertRaisesRegex(CheckpointError, "iteration"):
                    checkpoint.append_batch(
                        [], iteration=3, elapsed_seconds=9.0
                    )
                with self.assertRaisesRegex(CheckpointError, "elapsed"):
                    checkpoint.append_batch(
                        [], iteration=4, elapsed_seconds=7.0
                    )
                self.assertEqual(checkpoint.progress().iteration, 4)
                self.assertEqual(checkpoint.progress().elapsed_seconds, 8.0)


if __name__ == "__main__":
    unittest.main()
