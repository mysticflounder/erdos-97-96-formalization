from __future__ import annotations

import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock


REPO_ROOT = Path(__file__).resolve().parents[3]
SCRATCH = REPO_ROOT / "scratch" / "census-554"
sys.path.insert(0, str(SCRATCH))


def _load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


runtime = _load("census554_certifier_runtime_test", SCRATCH / "certifier_runtime.py")
cache_module = _load("census554_exact_outcome_cache_test", SCRATCH / "exact_outcome_cache.py")
backlog_module = _load("census554_certification_backlog_test", SCRATCH / "certification_backlog.py")
queue_client = _load("census554_queue_client_early_stop_test", SCRATCH / "queue_client.py")
retry_drain = _load(
    "census554_retry_drain_recovery_test",
    SCRATCH / "retry_certify_drain.py",
)


PATTERN = {"0": [2, 5], "2": [0, 5], "5": [0, 2]}
CUBE = {"0": [2, 5, 7], "2": [0, 5, 8], "5": [0, 2, 9]}


class CpuBudgetTests(unittest.TestCase):
    def test_cpu_exhaustion_is_measured_from_child_cpu_not_wall(self):
        budget = runtime.CpuBudget(1, wall_floor_seconds=10)
        result = budget.run(
            [sys.executable, "-c", "while True: pass"],
            capture_output=True,
            text=True,
            wall_timeout_seconds=10,
        )
        self.assertEqual(result.reason, "budget-exhausted")
        self.assertTrue(budget.exhausted)
        self.assertGreaterEqual(budget.child_cpu_seconds, 0.8)
        self.assertLess(result.wall_seconds, 5)

    def test_short_child_charges_cpu_without_charging_sleep_wall(self):
        budget = runtime.CpuBudget(2, wall_floor_seconds=10)
        result = budget.run(
            [sys.executable, "-c", "import time; time.sleep(.15)"],
            capture_output=True,
            text=True,
            wall_timeout_seconds=2,
        )
        self.assertEqual(result.reason, "completed")
        self.assertGreater(result.wall_seconds, 0.1)
        self.assertLess(budget.consumed_seconds, 0.5)


class ExactOutcomeCacheTests(unittest.TestCase):
    def test_budget_exhaustion_reuses_only_equal_or_smaller_budget(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = cache_module.ExactOutcomeCache(Path(directory) / "outcomes.db")
            cache.record(
                PATTERN,
                certifier_id="v2",
                cpu_budget_seconds=900,
                outcome="budget_exhausted",
                cpu_seconds=901,
                wall_seconds=1800,
            )
            self.assertIsNotNone(cache.reusable(
                PATTERN, certifier_id="v2", requested_cpu_budget=900
            ))
            self.assertIsNone(cache.reusable(
                PATTERN, certifier_id="v2", requested_cpu_budget=901
            ))
            self.assertIsNone(cache.reusable(
                PATTERN, certifier_id="different", requested_cpu_budget=1
            ))

    def test_completed_strategy_is_reusable_at_larger_budget(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = cache_module.ExactOutcomeCache(Path(directory) / "outcomes.db")
            cache.record(
                PATTERN,
                certifier_id="v2",
                cpu_budget_seconds=100,
                outcome="no_certificate",
                cpu_seconds=12,
                wall_seconds=13,
            )
            reused = cache.reusable(
                PATTERN, certifier_id="v2", requested_cpu_budget=7200
            )
            self.assertIsNotNone(reused)
            self.assertEqual(reused.outcome, "no_certificate")

    def test_new_worker_metadata_is_persisted(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = cache_module.ExactOutcomeCache(Path(directory) / "outcomes.db")
            self.assertTrue(cache.record_result(PATTERN, {
                "certificate": None,
                "elapsed": 15,
                "worker": "host-a",
                "certification": {
                    "certifier_id": "v2",
                    "cpu_budget_seconds": 10,
                    "cpu_seconds": 10.2,
                    "outcome": "budget_exhausted",
                },
            }, requested_cpu_budget=10))
            self.assertEqual(cache.count(), 1)


class CertificationBacklogTests(unittest.TestCase):
    def test_enqueue_is_exact_keyed_idempotent_and_auditable(self):
        with tempfile.TemporaryDirectory() as directory:
            backlog = backlog_module.CertificationBacklog(Path(directory))
            first = backlog.enqueue(
                PATTERN, cube=CUBE, source="iter-1", requested_cpu_seconds=900
            )
            second = backlog.enqueue(
                PATTERN, cube=None, source="iter-2", requested_cpu_seconds=7200
            )
            self.assertEqual(first.path, second.path)
            [task] = backlog.pending()
            self.assertEqual(task.record["sources"], ["iter-1", "iter-2"])
            self.assertEqual(task.record["requested_cpu_seconds"], 7200)
            backlog.mark_attempt(PATTERN, {"outcome": "budget_exhausted"})
            self.assertEqual(len(backlog.pending()[0].record["attempts"]), 1)
            self.assertTrue(backlog.complete(
                PATTERN, disposition="certified-pending"
            ))
            self.assertEqual(backlog.pending(), [])
            completed = json.loads(
                (backlog.completed_dir / first.path.name).read_text(encoding="utf-8")
            )
            self.assertEqual(completed["disposition"], "certified-pending")


class WorkerMetadataTests(unittest.TestCase):
    def test_worker_returns_cumulative_cpu_metadata(self):
        worker_path = SCRATCH / "worker" / "census554_worker.py"
        worker = _load("census554_worker_metadata_test", worker_path)
        with tempfile.TemporaryDirectory() as directory:
            claimed = Path(directory) / "job.json.claimed"
            claimed.write_text(json.dumps(PATTERN), encoding="utf-8")
            stats = {
                "certifier_id": "v2",
                "cpu_budget_seconds": 900,
                "cpu_seconds": 3.5,
                "outcome": "certified",
            }
            with mock.patch.object(
                worker.miner,
                "certify_pattern_with_stats",
                return_value=({"kill": "base"}, stats),
            ):
                result = worker.certify_job(str(claimed), 900)
            self.assertEqual(result[2], {"kill": "base"})
            self.assertEqual(result[3], stats)


class QueueEarlyStopTests(unittest.TestCase):
    def test_first_success_can_advance_without_consuming_other_results(self):
        with tempfile.TemporaryDirectory() as directory:
            results = Path(directory)
            (results / "cert-a.json").write_text(
                json.dumps({"certificate": {"kill": "base"}}),
                encoding="utf-8",
            )
            (results / "cert-b.json").write_text(
                json.dumps({"certificate": None}), encoding="utf-8"
            )
            seen = []

            def stop_on_success(stem, data):
                seen.append(stem)
                return data.get("certificate") is None

            with mock.patch.object(queue_client, "RESULTS_DIR", results), \
                 mock.patch.object(queue_client, "POLL_INTERVAL", 0):
                completed, missing = queue_client.poll(
                    {"cert-a": PATTERN, "cert-b": PATTERN},
                    deadline=10**12,
                    on_result=stop_on_success,
                )
            self.assertEqual(seen, ["cert-a"])
            self.assertEqual(set(completed), {"cert-a"})
            self.assertEqual(missing, ["cert-b"])
            self.assertTrue((results / "cert-a.json").exists())
            self.assertTrue((results / "cert-b.json").exists())


class RetryOrphanRecoveryTests(unittest.TestCase):
    def test_completed_retry_survives_drainer_restart(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            results = root / "results"
            results.mkdir()
            pending = root / "pending.d"
            backlog = backlog_module.CertificationBacklog(root / "backlog.d")
            cache = cache_module.ExactOutcomeCache(root / "outcomes.db")
            backlog.enqueue(
                PATTERN,
                cube=CUBE,
                source="test",
                requested_cpu_seconds=7200,
            )
            result_path = results / "retrycert-orphan.json"
            result_path.write_text(json.dumps({
                "certificate": {"kill": "multi_pair", "proof": "checked"},
                "certification": {
                    "certifier_id": "v2",
                    "cpu_budget_seconds": 7200,
                    "cpu_seconds": 12.0,
                    "outcome": "certified",
                },
                "elapsed": 13.0,
                "pattern": PATTERN,
                "worker": "host-a",
            }, sort_keys=True), encoding="utf-8")
            with mock.patch.object(retry_drain.qc, "RESULTS_DIR", results), \
                 mock.patch.object(retry_drain, "PENDING_STORE", pending), \
                 mock.patch.object(retry_drain, "BACKLOG", backlog), \
                 mock.patch.object(retry_drain, "OUTCOME_CACHE", cache), \
                 mock.patch.object(retry_drain.cp, "load_bank", return_value=[]):
                self.assertEqual(retry_drain.recover_orphan_results(7200), (1, 0))
            self.assertFalse(result_path.exists())
            self.assertEqual(backlog.pending(), [])
            self.assertEqual(cache.count(), 1)
            self.assertEqual(len(list((pending / "records").glob("*.json"))), 1)


if __name__ == "__main__":
    unittest.main()
