from __future__ import annotations

import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import time
import unittest
from unittest import mock


REPO_ROOT = Path(__file__).resolve().parents[3]
SCRATCH = REPO_ROOT / "scratch" / "census-554"
WORKER = SCRATCH / "worker"
sys.path.insert(0, str(SCRATCH))
sys.path.insert(0, str(WORKER))


def _load(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


queue_client = _load("role_test_queue_client", SCRATCH / "queue_client.py")
worker = _load("role_test_worker", WORKER / "census554_worker.py")


class QueueWorkerRoleTest(unittest.TestCase):
    def test_worker_modes_accept_only_their_job_class(self) -> None:
        mine = worker.worker_capabilities(mine_only=True, cert_only=False)
        cert = worker.worker_capabilities(mine_only=False, cert_only=True)
        both = worker.worker_capabilities(mine_only=False, cert_only=False)
        self.assertTrue(worker.accepts_job("mine-1.json", mine))
        self.assertFalse(worker.accepts_job("retrycert-1.json", mine))
        self.assertFalse(worker.accepts_job("mine-1.json", cert))
        self.assertTrue(worker.accepts_job("retrycert-1.json", cert))
        self.assertTrue(worker.accepts_job("cert-i1.json", cert))
        self.assertTrue(worker.accepts_job("mine-1.json", both))
        self.assertTrue(worker.accepts_job("cert-i1.json", both))
        with self.assertRaises(ValueError):
            worker.worker_capabilities(mine_only=True, cert_only=True)

    def test_retry_cap_reserves_regular_certificate_slots(self) -> None:
        inflight = [
            "retrycert-a.json.claimed",
            "cert-i1-a.json.claimed",
        ]
        self.assertTrue(worker.retry_slot_available(inflight, 2))
        inflight.append("retrycert-b.json.claimed")
        self.assertFalse(worker.retry_slot_available(inflight, 2))
        self.assertTrue(worker.retry_slot_available(inflight, 3))

        args = worker.parse_args([
            "--workers", "4",
            "--cert-only",
            "--max-retry-inflight", "2",
        ])
        self.assertEqual(args.max_retry_inflight, 2)

    def test_capacity_is_role_filtered_and_legacy_is_mine_only(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            heartbeats = Path(directory)
            now = time.time()
            payloads = {
                "mine.json": {
                    "ts": now, "workers": 14, "capabilities": ["mine"]
                },
                "cert.json": {
                    "ts": now, "workers": 4, "capabilities": ["certify"]
                },
                "legacy.json": {"ts": now, "workers": 8},
                "stale.json": {
                    "ts": now - 1000,
                    "workers": 99,
                    "capabilities": ["mine", "certify"],
                },
            }
            for name, payload in payloads.items():
                (heartbeats / name).write_text(json.dumps(payload))
            with mock.patch.object(
                queue_client, "HEARTBEATS_DIR", heartbeats
            ):
                self.assertEqual(queue_client.live_capacity(), 26)
                self.assertEqual(queue_client.live_capacity("mine"), 22)
                self.assertEqual(queue_client.live_capacity("certify"), 4)
                with self.assertRaises(ValueError):
                    queue_client.live_capacity("unknown")


if __name__ == "__main__":
    unittest.main()
