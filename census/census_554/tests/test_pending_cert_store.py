from __future__ import annotations

import importlib.util
import json
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock


REPO_ROOT = Path(__file__).resolve().parents[3]
STORE_PATH = REPO_ROOT / "scratch/census-554/pending_cert_store.py"
FRONTIER_ADD_PATH = REPO_ROOT / "scratch/census-554/frontier_add.py"


def _load_store():
    name = "census554_pending_cert_store_test"
    spec = importlib.util.spec_from_file_location(name, STORE_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


store = _load_store()


def _load_frontier_add():
    name = "census554_frontier_add_pending_store_test"
    spec = importlib.util.spec_from_file_location(name, FRONTIER_ADD_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


PATTERN = {"0": [2, 5], "2": [0, 5], "5": [0, 2]}
CUBE = {"0": [2, 5, 7], "2": [0, 5, 8], "5": [0, 2, 9]}


def _row(pattern=None, payload="checked"):
    return {
        "pattern": pattern or PATTERN,
        "cert": {"kill": "multi_pair", "proof": payload},
        "cube": CUBE,
    }


class PatternKeyTests(unittest.TestCase):
    def test_digest_is_relabeling_invariant_and_pattern_sensitive(self):
        relabeled = {"7": [3, 9], "3": [7, 9], "9": [3, 7]}
        self.assertEqual(
            store.pattern_digest(PATTERN),
            store.pattern_digest(relabeled),
        )
        changed = {"0": [2, 5], "2": [0], "5": [0, 2]}
        self.assertNotEqual(
            store.pattern_digest(PATTERN),
            store.pattern_digest(changed),
        )
        self.assertNotEqual(
            store.bank_pattern_digest(PATTERN),
            store.bank_pattern_digest(relabeled),
        )


class PerCertificateStoreTests(unittest.TestCase):
    def test_atomic_record_is_authoritative_and_duplicate_is_idempotent(self):
        with tempfile.TemporaryDirectory() as root_string:
            pending = store.PendingCertificateStore(Path(root_string))
            first = pending.store_row(_row())
            second = pending.store_row(_row(payload="different-but-duplicate"))

            self.assertTrue(first.stored)
            self.assertFalse(second.stored)
            self.assertEqual(first.record_path, second.record_path)
            self.assertEqual(pending.done_digests(), {first.key_sha256})
            self.assertEqual(
                pending.done_bank_digests(), {first.bank_key_sha256}
            )
            saved = json.loads(first.record_path.read_text(encoding="utf-8"))
            self.assertEqual(saved, _row())
            self.assertEqual(pending.audit(), {
                "schema": store.STORE_SCHEMA,
                "record_count": 1,
                "index_count": 1,
                "records_missing_from_index": [],
                "index_entries_missing_records": [],
                "malformed_index_lines": [],
            })

    def test_crash_after_record_publish_preserves_dedup_marker(self):
        with tempfile.TemporaryDirectory() as root_string:
            pending = store.PendingCertificateStore(Path(root_string))

            def fail(phase):
                if phase == "after_record_publish":
                    raise RuntimeError("simulated crash")

            with self.assertRaisesRegex(RuntimeError, "simulated crash"):
                pending.store_row(_row(), fault_hook=fail)

            digest = store.pattern_digest(PATTERN)
            self.assertEqual(pending.done_digests(), {digest})
            self.assertEqual(
                pending.done_bank_digests(),
                {store.bank_pattern_digest(PATTERN)},
            )
            self.assertFalse(pending.store_row(_row()).stored)
            audit = pending.audit()
            self.assertEqual(audit["record_count"], 1)
            self.assertEqual(audit["index_count"], 0)
            self.assertEqual(audit["records_missing_from_index"], [digest])

    def test_index_size_does_not_scale_with_certificate_payload(self):
        with tempfile.TemporaryDirectory() as root_string:
            pending = store.PendingCertificateStore(Path(root_string))
            result = pending.store_row(_row(payload="x" * 1_000_000))
            self.assertGreater(result.record_path.stat().st_size, 1_000_000)
            self.assertLess(pending.index_path.stat().st_size, 1_000)

    def test_broad_isomorphs_in_distinct_bank_orbits_both_survive(self):
        relabeled = {"7": [3, 9], "3": [7, 9], "9": [3, 7]}
        self.assertEqual(
            store.pattern_digest(PATTERN),
            store.pattern_digest(relabeled),
        )
        self.assertNotEqual(
            store.bank_pattern_digest(PATTERN),
            store.bank_pattern_digest(relabeled),
        )
        with tempfile.TemporaryDirectory() as root_string:
            pending = store.PendingCertificateStore(Path(root_string))
            first = pending.store_row(_row(PATTERN))
            second = pending.store_row(_row(relabeled))
            repeat = pending.store_row(_row(relabeled, payload="repeat"))

            self.assertTrue(first.stored)
            self.assertTrue(second.stored)
            self.assertFalse(repeat.stored)
            self.assertNotEqual(first.record_path, second.record_path)
            self.assertEqual(second.record_path, repeat.record_path)
            self.assertEqual(len(pending.done_digests()), 2)
            self.assertEqual(len(pending.done_bank_digests()), 2)


class LegacyIndexTests(unittest.TestCase):
    def test_legacy_array_and_jsonl_get_one_compact_dedup_index(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            array = root / "legacy.json"
            jsonl = root / "legacy.jsonl"
            other = {"1": [4, 6], "4": [1], "6": [1, 4]}
            array.write_text(json.dumps([_row()]), encoding="utf-8")
            jsonl.write_text(
                json.dumps(_row()) + "\n" + json.dumps(_row(other)) + "\n",
                encoding="utf-8",
            )
            index = root / "store/legacy-index.json"

            payload = store.build_legacy_index(index, [array, jsonl])
            self.assertEqual(len(payload["digests"]), 2)
            self.assertEqual(
                store.load_legacy_index(index, [array, jsonl]),
                {store.pattern_digest(PATTERN), store.pattern_digest(other)},
            )
            self.assertLess(index.stat().st_size, 2_000)

            with open(jsonl, "a", encoding="utf-8") as handle:
                handle.write(json.dumps(_row({"3": [7], "7": [3]})) + "\n")
            with self.assertRaisesRegex(store.PendingStoreError, "stale"):
                store.load_legacy_index(index, [array, jsonl])

    def test_source_drift_during_index_build_aborts_publication(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            source = root / "legacy.jsonl"
            source.write_text(json.dumps(_row()) + "\n", encoding="utf-8")
            pending_root = root / "pending.d"
            index = pending_root / "legacy-index.json"
            original = store._iter_legacy_rows

            def mutating_rows(path):
                yield from original(path)
                with open(path, "a", encoding="utf-8") as handle:
                    handle.write(json.dumps(_row({"3": [7], "7": [3]}))
                                 + "\n")

            with mock.patch.object(store, "_iter_legacy_rows", mutating_rows):
                with self.assertRaises(store.LegacySourceChanged):
                    store.build_legacy_index(
                        index, [source], store_root=pending_root
                    )
            self.assertFalse(index.exists())
            self.assertEqual(len(
                store.PendingCertificateStore(pending_root).done_digests()
            ), 1)

            payload = store.build_legacy_index(
                index, [source], store_root=pending_root
            )
            self.assertEqual(len(payload["digests"]), 2)
            self.assertEqual(payload["migrated_new"], 1)
            self.assertEqual(payload["migrated_existing"], 1)

    def test_ensure_builds_missing_index_in_disposable_helper(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            source = root / "legacy.jsonl"
            source.write_text(json.dumps(_row()) + "\n", encoding="utf-8")
            pending_root = root / "pending.d"
            index = pending_root / "legacy-index.json"

            digests = store.ensure_legacy_index(
                index, [source], store_root=pending_root
            )
            self.assertEqual(digests, {store.pattern_digest(PATTERN)})
            self.assertTrue(index.is_file())
            self.assertEqual(
                store.PendingCertificateStore(pending_root).done_digests(),
                digests,
            )
            self.assertEqual(
                store.load_legacy_index(
                    index, [source], store_root=pending_root
                ),
                digests,
            )


class QueueResultHelperTests(unittest.TestCase):
    def test_pattern_tail_recovery_does_not_decode_large_certificate(self):
        with tempfile.TemporaryDirectory() as root_string:
            result_path = Path(root_string) / "retrycert-orphan.json"
            result_path.write_text(json.dumps({
                "certificate": {
                    "kill": "multi_pair",
                    "proof": "x" * 1_000_000,
                },
                "elapsed": 12.5,
                "pattern": PATTERN,
                "worker": "test-worker",
            }, sort_keys=True), encoding="utf-8")
            self.assertEqual(store.read_json_pattern_tail(result_path), PATTERN)

    def test_success_is_converted_in_child_to_atomic_record(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            result_path = root / "result.json"
            result_path.write_text(json.dumps({
                "pattern": PATTERN,
                "certificate": {"kill": "multi_pair", "proof": "checked"},
                "elapsed": 12.5,
                "worker": "test-worker",
                "certification": {
                    "certifier_id": "v2",
                    "cpu_budget_seconds": 900,
                    "cpu_seconds": 12.0,
                    "outcome": "certified",
                },
            }), encoding="utf-8")
            pending_root = root / "pending.d"

            status = store.consume_queue_result_isolated(
                result_path, PATTERN, CUBE, pending_root
            )
            self.assertEqual(status["outcome"], "certified")
            self.assertEqual(status["worker"], "test-worker")
            self.assertTrue(status["stored"])
            self.assertEqual(status["certification"]["cpu_seconds"], 12.0)
            records = list((pending_root / "records").glob("*.json"))
            self.assertEqual(len(records), 1)
            saved = json.loads(records[0].read_text(encoding="utf-8"))
            self.assertEqual(saved["pattern"], PATTERN)
            self.assertEqual(saved["cube"], CUBE)
            # The caller owns queue-result retirement and only unlinks after
            # the helper has durably published the pending record.
            self.assertTrue(result_path.exists())

    def test_failed_or_mismatched_result_never_publishes_record(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            pending_root = root / "pending.d"
            failed = root / "failed.json"
            failed.write_text(json.dumps({
                "pattern": PATTERN,
                "certificate": None,
                "error": "timeout",
                "elapsed": 30,
                "worker": "test-worker",
            }), encoding="utf-8")
            status = store.consume_queue_result_isolated(
                failed, PATTERN, CUBE, pending_root
            )
            self.assertEqual(status["outcome"], "failed")
            self.assertEqual(status["error"], "timeout")
            self.assertEqual(
                store.PendingCertificateStore(pending_root).done_digests(),
                set(),
            )

            mismatch = root / "mismatch.json"
            mismatch.write_text(json.dumps({
                "pattern": {"7": [3, 9], "3": [7, 9], "9": [3, 7]},
                "certificate": {"kill": "multi_pair"},
            }), encoding="utf-8")
            with self.assertRaisesRegex(store.PendingStoreError,
                                        "does not match"):
                store.consume_queue_result_isolated(
                    mismatch, PATTERN, CUBE, pending_root
                )
            self.assertEqual(
                store.PendingCertificateStore(pending_root).done_digests(),
                set(),
            )


class FrontierAddStoreTests(unittest.TestCase):
    def test_pending_store_is_banked_one_record_at_a_time(self):
        frontier_add = _load_frontier_add()
        with tempfile.TemporaryDirectory() as root_string:
            pending = store.PendingCertificateStore(Path(root_string))
            other = {"1": [4, 6], "4": [1], "6": [1, 4]}
            pending.store_row(_row())
            pending.store_row(_row(other))
            batches = []

            def append_one(rows):
                batches.append(rows)
                return SimpleNamespace(records=[{"pid": "test"}],
                                       skipped_duplicates=0)

            with mock.patch.object(frontier_add, "append_rows", append_one):
                frontier_add.append_pending_store(Path(root_string))

            self.assertEqual(len(batches), 2)
            self.assertTrue(all(len(batch) == 1 for batch in batches))
            self.assertEqual(
                {store.pattern_digest(batch[0]["pattern"])
                 for batch in batches},
                {store.pattern_digest(PATTERN), store.pattern_digest(other)},
            )


if __name__ == "__main__":
    unittest.main()
