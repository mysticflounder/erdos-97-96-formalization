from __future__ import annotations

import json
import multiprocessing
import tempfile
import unittest
from pathlib import Path

from census.census_554.io_protocol import (
    BankEntry,
    LockBusy,
    commit_bank_records,
    driver_lease,
)


def _hold_driver_lease(root: str, ready, release) -> None:
    with driver_lease(root):
        ready.set()
        release.wait(10)


def _key(pattern):
    return tuple(sorted((center, tuple(sorted(members)))
                        for center, members in pattern.items()))


def _validate(row, cert):
    assert row["pattern"] == cert["pattern"]
    assert row["kill"] == cert["kill"]
    assert cert["proof"] == "checked"


def _entry(pattern):
    return BankEntry(
        pattern=pattern,
        certificate={"kill": "base", "proof": "checked"},
        fields={"n_orbit": 1, "k": 3, "iter": -1},
    )


class DriverLeaseTests(unittest.TestCase):
    def test_only_one_process_can_hold_driver_lease(self):
        with tempfile.TemporaryDirectory() as root:
            context = multiprocessing.get_context("spawn")
            ready = context.Event()
            release = context.Event()
            process = context.Process(
                target=_hold_driver_lease, args=(root, ready, release)
            )
            process.start()
            self.assertTrue(ready.wait(10))
            try:
                with self.assertRaises(LockBusy):
                    with driver_lease(root):
                        pass
            finally:
                release.set()
                process.join(10)
            self.assertEqual(process.exitcode, 0)


class BankTransactionTests(unittest.TestCase):
    def test_allocates_after_max_pid_and_deduplicates_under_lock(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            historical = [
                {
                    "pid": "pat_00003",
                    "pattern": {"0": [1, 2]},
                    "kill": "base",
                    "cert": "certs/pat_00003.json",
                },
                {
                    "pid": "pat_00003",
                    "pattern": {"1": [2, 3]},
                    "kill": "base",
                    "cert": "certs/pat_00003.json",
                },
            ]
            root.joinpath("bank.jsonl").write_text(
                "".join(json.dumps(row) + "\n" for row in historical),
                encoding="utf-8",
            )
            result = commit_bank_records(
                root,
                [_entry({2: [3, 4]}), _entry({2: [3, 4]})],
                canonical_key=_key,
                validate=_validate,
            )
            self.assertEqual([row["pid"] for row in result.records], ["pat_00004"])
            self.assertEqual(result.skipped_duplicates, 1)
            rows = [json.loads(line) for line in root.joinpath("bank.jsonl").read_text().splitlines()]
            self.assertEqual(len(rows), 3)
            self.assertTrue(root.joinpath("certs/pat_00004.json").is_file())

    def test_fault_after_certificates_leaves_no_row_or_orphan(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            root.joinpath("bank.jsonl").write_bytes(b"")

            def fail(phase):
                if phase == "after_certificates":
                    raise RuntimeError("injected failure")

            with self.assertRaisesRegex(RuntimeError, "injected"):
                commit_bank_records(
                    root,
                    [_entry({0: [1, 2]})],
                    canonical_key=_key,
                    validate=_validate,
                    fault_hook=fail,
                )
            self.assertEqual(root.joinpath("bank.jsonl").read_bytes(), b"")
            self.assertFalse(root.joinpath("certs/pat_00000.json").exists())
            self.assertFalse(root.joinpath(".bank-transaction.json").exists())

    def test_post_commit_crash_journal_recovers_on_next_transaction(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            root.joinpath("bank.jsonl").write_bytes(b"")

            def fail(phase):
                if phase == "after_bank":
                    raise RuntimeError("simulated post-commit crash")

            with self.assertRaisesRegex(RuntimeError, "post-commit"):
                commit_bank_records(
                    root,
                    [_entry({0: [1, 2]})],
                    canonical_key=_key,
                    validate=_validate,
                    fault_hook=fail,
                )
            self.assertTrue(root.joinpath(".bank-transaction.json").is_file())
            first_rows = [
                json.loads(line)
                for line in root.joinpath("bank.jsonl").read_text().splitlines()
            ]
            self.assertEqual([row["pid"] for row in first_rows], ["pat_00000"])

            result = commit_bank_records(
                root,
                [_entry({1: [2, 3]})],
                canonical_key=_key,
                validate=_validate,
            )
            self.assertEqual([row["pid"] for row in result.records], ["pat_00001"])
            self.assertFalse(root.joinpath(".bank-transaction.json").exists())
            final_rows = [
                json.loads(line)
                for line in root.joinpath("bank.jsonl").read_text().splitlines()
            ]
            self.assertEqual(len(final_rows), 2)

    def test_exception_between_bank_replace_and_flag_recovers_as_committed(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            root.joinpath("bank.jsonl").write_bytes(b"")

            def fail(phase):
                if phase == "after_bank_replace_before_commit_flag":
                    raise RuntimeError("simulated signal window")

            with self.assertRaisesRegex(RuntimeError, "signal window"):
                commit_bank_records(
                    root,
                    [_entry({0: [1, 2]})],
                    canonical_key=_key,
                    validate=_validate,
                    fault_hook=fail,
                )
            self.assertTrue(root.joinpath("certs/pat_00000.json").is_file())
            self.assertTrue(root.joinpath(".bank-transaction.json").is_file())
            rows = [
                json.loads(line)
                for line in root.joinpath("bank.jsonl").read_text().splitlines()
            ]
            self.assertEqual([row["pid"] for row in rows], ["pat_00000"])


if __name__ == "__main__":
    unittest.main()
