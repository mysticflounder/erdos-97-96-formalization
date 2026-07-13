from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from census.card_head.bank_store import (
    BankStoreError,
    bank_status,
    commit_prepared_iteration,
    recover_bank_store,
)
from census.card_head.cegar_adapter import prepare_iteration
from census.card_head.run_protocol import append_run_started, read_run_state
from census.card_head.tests.test_cegar_adapter import (
    valid_manifest,
    valid_proposal,
)


def _prepared(manifest):
    return prepare_iteration(
        manifest,
        valid_proposal(manifest),
        bank_rows=[],
    )


def _start(event_dir: Path, manifest) -> None:
    append_run_started(
        event_dir,
        manifest,
        initial_bank_rows=0,
        initial_shape_count=0,
    )


class BankStoreTests(unittest.TestCase):
    def test_commit_publishes_certificate_bank_and_matching_event(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp) / "bank"
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            _start(event_dir, manifest)
            result = commit_prepared_iteration(
                root,
                event_dir,
                manifest,
                _prepared(manifest),
            )
            self.assertEqual(len(result.rows), 1)
            self.assertEqual(result.run_state["bank_rows_total"], 1)
            self.assertEqual(result.run_state["shape_count_total"], 1)
            self.assertEqual(result.run_state["last_fresh_shape_count"], 1)
            certificate = root / "certificates/pat_00000.json"
            self.assertTrue(certificate.is_file())
            self.assertEqual(certificate.stat().st_mode & 0o222, 0)
            status = bank_status(
                root,
                event_dir,
                manifest,
                replay_identities=True,
            )
            self.assertEqual(status["status"], "PASS")
            self.assertEqual(status["identity_replay"], "ALL")

    def test_crash_before_bank_replace_discards_uncommitted_certificate(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp) / "bank"
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            _start(event_dir, manifest)

            def fail(phase: str) -> None:
                if phase == "after_certificates":
                    raise RuntimeError("simulated pre-bank crash")

            with self.assertRaisesRegex(RuntimeError, "pre-bank"):
                commit_prepared_iteration(
                    root,
                    event_dir,
                    manifest,
                    _prepared(manifest),
                    fault_hook=fail,
                )
            self.assertTrue((root / ".bank-transaction.json").is_file())
            recover_bank_store(root, event_dir, manifest)
            self.assertFalse((root / ".bank-transaction.json").exists())
            self.assertFalse((root / "certificates/pat_00000.json").exists())
            self.assertEqual(read_run_state(manifest, event_dir)["bank_rows_total"], 0)

    def test_crash_after_bank_replace_replays_the_missing_event(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp) / "bank"
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            _start(event_dir, manifest)

            def fail(phase: str) -> None:
                if phase == "after_bank":
                    raise RuntimeError("simulated post-bank crash")

            with self.assertRaisesRegex(RuntimeError, "post-bank"):
                commit_prepared_iteration(
                    root,
                    event_dir,
                    manifest,
                    _prepared(manifest),
                    fault_hook=fail,
                )
            self.assertEqual(read_run_state(manifest, event_dir)["bank_rows_total"], 0)
            recovered = recover_bank_store(root, event_dir, manifest)
            self.assertIsNotNone(recovered)
            self.assertEqual(recovered["bank_rows_total"], 1)
            self.assertFalse((root / ".bank-transaction.json").exists())
            self.assertEqual(bank_status(root, event_dir, manifest)["bank_rows"], 1)

    def test_crash_after_event_does_not_duplicate_the_measurement(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp) / "bank"
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            _start(event_dir, manifest)

            def fail(phase: str) -> None:
                if phase == "after_event":
                    raise RuntimeError("simulated post-event crash")

            with self.assertRaisesRegex(RuntimeError, "post-event"):
                commit_prepared_iteration(
                    root,
                    event_dir,
                    manifest,
                    _prepared(manifest),
                    fault_hook=fail,
                )
            before = read_run_state(manifest, event_dir)
            self.assertEqual(before["event_count"], 2)
            recovered = recover_bank_store(root, event_dir, manifest)
            self.assertEqual(recovered["event_count"], 2)

    def test_stale_prepared_snapshot_cannot_publish(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp) / "bank"
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            _start(event_dir, manifest)
            stale = _prepared(manifest)
            commit_prepared_iteration(root, event_dir, manifest, stale)
            with self.assertRaisesRegex(BankStoreError, "stale bank snapshot"):
                commit_prepared_iteration(root, event_dir, manifest, stale)

    def test_bank_commit_enforces_the_manifest_growth_stop(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp) / "bank"
            event_dir = Path(tmp) / "events"
            manifest = valid_manifest()
            manifest["stops"]["max_new_bank_rows"] = 1
            _start(event_dir, manifest)
            result = commit_prepared_iteration(
                root,
                event_dir,
                manifest,
                _prepared(manifest),
            )
            self.assertEqual(result.run_state["status"], "STOPPED_BY_POLICY")
            self.assertEqual(
                result.run_state["triggered_stops"],
                ["NEW_BANK_ROWS"],
            )


if __name__ == "__main__":
    unittest.main()
