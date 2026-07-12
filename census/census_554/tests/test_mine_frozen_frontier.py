from __future__ import annotations

import copy
import hashlib
import importlib.util
import json
from pathlib import Path
from types import SimpleNamespace
import sys
import tempfile
import unittest
from unittest import mock


REPO_ROOT = Path(__file__).resolve().parents[3]
DRIVER_PATH = REPO_ROOT / "scratch/census-554/mine_frozen_frontier.py"
LIVE_ROOT = REPO_ROOT / "scratch/census-554"


def _load_driver():
    name = "census554_mine_frozen_frontier_test"
    spec = importlib.util.spec_from_file_location(name, DRIVER_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


CUBE = {
    0: [2, 5, 8, 9],
    1: [0, 3, 7, 8],
    2: [3, 7, 9, 10],
    3: [1, 5, 6, 7],
    4: [2, 3, 6, 10],
    5: [1, 2, 4, 9],
    6: [3, 4, 5, 8],
    7: [0, 4, 6, 9],
    8: [0, 2, 7, 10],
    9: [0, 1, 4, 10],
    10: [1, 6, 8, 9],
}


def _result(driver, bank_raw=b""):
    orders = driver.separation_encoding.valid_orders(CUBE)
    assert orders
    order = orders[0]
    return {
        "schema": driver.EXPECTED_PROBE_SCHEMA,
        "status": driver.EXPECTED_PROBE_STATUS,
        "bank_sha256": hashlib.sha256(bank_raw).hexdigest(),
        "bank_rows": len(bank_raw.splitlines()),
        "cube": {str(center): members for center, members in CUBE.items()},
        # The booleans are deliberately false: validation must recompute them.
        "independent_cube_ok": False,
        "independent_selected_orders_valid": False,
        "selected_orders": [{
            "orientation": order.orientation,
            "python_internal_index": order.internal_index,
            "labels": list(order.labels),
            "row_scope": driver.separation_encoding.DIRECT_ROW_SCOPE,
        }],
    }


class MineFrozenFrontierTests(unittest.TestCase):
    def test_probe_cube_and_orders_are_independently_revalidated(self):
        driver = _load_driver()
        result = _result(driver)
        cube, orders = driver.validate_probe_result(
            result,
            bank_sha256=hashlib.sha256(b"").hexdigest(),
            bank_rows=0,
        )
        self.assertEqual(cube, CUBE)
        self.assertEqual(len(orders), 1)

        bad = copy.deepcopy(result)
        bad["selected_orders"][0]["labels"][1:3] = reversed(
            bad["selected_orders"][0]["labels"][1:3]
        )
        with self.assertRaisesRegex(driver.MiningRunError, "labels"):
            driver.validate_probe_result(
                bad,
                bank_sha256=hashlib.sha256(b"").hexdigest(),
                bank_rows=0,
            )

        bad_hash = copy.deepcopy(result)
        bad_hash["bank_sha256"] = "0" * 64
        with self.assertRaisesRegex(driver.MiningRunError, "different hashes"):
            driver.validate_probe_result(
                bad_hash,
                bank_sha256=hashlib.sha256(b"").hexdigest(),
                bank_rows=0,
            )

    def test_candidate_inventory_checks_containment_novelty_and_dedup(self):
        driver = _load_driver()
        bank_raw = b""
        probe_sha = "a" * 64
        bank_sha = hashlib.sha256(bank_raw).hexdigest()
        pattern = {"0": CUBE[0][:2]}
        worker = {
            "schema": driver.WORKER_MINE_SCHEMA,
            "probe_result_sha256": probe_sha,
            "bank_sha256": bank_sha,
            "cube": {str(center): members for center, members in CUBE.items()},
            "min_support_k": 4,
            "patterns": [pattern],
        }
        prepared = driver._prepare_candidates(
            worker,
            cube=CUBE,
            bank_rows=[],
            probe_result_sha256=probe_sha,
            bank_sha256=bank_sha,
        )
        self.assertEqual(prepared["candidate_count"], 1)
        self.assertEqual(prepared["novel_count"], 1)
        self.assertTrue(prepared["candidates"][0]["novel_against_snapshot"])

        duplicate = copy.deepcopy(worker)
        duplicate["patterns"].append(pattern)
        with self.assertRaisesRegex(driver.MiningRunError, "duplicate"):
            driver._prepare_candidates(
                duplicate,
                cube=CUBE,
                bank_rows=[],
                probe_result_sha256=probe_sha,
                bank_sha256=bank_sha,
            )

        outside = copy.deepcopy(worker)
        outside["patterns"] = [{"0": [1, 3]}]
        with self.assertRaisesRegex(driver.MiningRunError, "not contained"):
            driver._prepare_candidates(
                outside,
                cube=CUBE,
                bank_rows=[],
                probe_result_sha256=probe_sha,
                bank_sha256=bank_sha,
            )

    def test_existing_certificate_passes_exact_gate_and_tamper_fails(self):
        driver = _load_driver()
        bank_row = json.loads((LIVE_ROOT / "bank.jsonl").read_text().splitlines()[0])
        certificate = json.loads(
            (LIVE_ROOT / bank_row["cert"]).read_text(encoding="utf-8")
        )
        pattern = driver._native_pattern(bank_row["pattern"])
        candidate = {
            "candidate_id": "candidate_00000",
            "pattern": bank_row["pattern"],
            "orbit_size": len(driver.miner.orbit(pattern)),
        }
        verified, count = driver._verify_certificate(candidate, certificate)
        self.assertEqual(verified["pid"], candidate["candidate_id"])
        self.assertGreater(count, 0)

        tampered = copy.deepcopy(certificate)
        tampered["coefficients"][0] = "0"
        with self.assertRaisesRegex(driver.MiningRunError, "exact certificate"):
            driver._verify_certificate(candidate, tampered)

    def test_process_group_wall_cap_is_hard(self):
        driver = _load_driver()
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            result = driver._run_bounded(
                [sys.executable, "-c", "import time; time.sleep(30)"],
                stdout_path=root / "stdout",
                stderr_path=root / "stderr",
                timeout=0.1,
            )
            self.assertTrue(result.timed_out)
            self.assertLess(result.elapsed_s, 5)

    def test_zero_mined_candidates_is_inconclusive_not_duplicate_success(self):
        driver = _load_driver()
        self.assertEqual(
            driver._completion_status(
                candidate_count=0,
                novel_count=0,
                verified_count=0,
                failure_count=0,
            ),
            "no-mined-candidates-inconclusive",
        )
        self.assertEqual(
            driver._completion_status(
                candidate_count=3,
                novel_count=0,
                verified_count=0,
                failure_count=0,
            ),
            "no-novel-candidates",
        )

    def test_candidates_are_durable_before_certification_and_bank_untouched(self):
        driver = _load_driver()
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            bank = root / "bank.jsonl"
            bank.write_bytes(b"")
            probe = root / "result.json"
            probe.write_text(json.dumps(_result(driver)) + "\n", encoding="utf-8")
            before = (bank.read_bytes(), bank.stat().st_mtime_ns)
            output_root = root / "runs"
            args = SimpleNamespace(
                probe_result=probe,
                bank=bank,
                output_root=output_root,
                mining_wall=10.0,
                oracle_timeout=1,
                cert_workers=1,
                cert_wall=10.0,
                cert_hard_timeout=5.0,
                singular_timeout=1,
                remote_mine="off",
                remote_cert="off",
                remote_jobs_dir=str(root / "remote-jobs"),
                remote_results_dir=str(root / "remote-results"),
                remote_margin=1.0,
            )

            def fake_mine(command, **_kwargs):
                request = json.loads(Path(command[-2]).read_text())
                driver.atomic_write_json(Path(command[-1]), {
                    "schema": driver.WORKER_MINE_SCHEMA,
                    "probe_result_sha256": request["probe_result_sha256"],
                    "bank_sha256": request["bank_sha256"],
                    "cube": request["cube"],
                    "min_support_k": 4,
                    "patterns": [{"0": CUBE[0][:2]}],
                })
                return driver.ChildResult(0, False, 0.01)

            def fake_cert(candidates, workdir, _args):
                self.assertTrue((workdir / "mined_candidates.json").is_file())
                progress = json.loads((workdir / "progress.json").read_text())
                self.assertEqual(progress["status"], "candidates-persisted")
                return [], [{
                    "candidate_id": candidates[0]["candidate_id"],
                    "reason": "fixture",
                }], []

            with mock.patch.object(driver, "_run_bounded", side_effect=fake_mine), \
                 mock.patch.object(driver, "_certify_candidates", side_effect=fake_cert), \
                 mock.patch.object(driver, "_tool_version", return_value="fixture"):
                self.assertEqual(driver._run(args), 2)

            self.assertEqual((bank.read_bytes(), bank.stat().st_mtime_ns), before)
            self.assertFalse((root / "certs").exists())
            run_dirs = list(output_root.iterdir())
            self.assertEqual(len(run_dirs), 1)
            final = json.loads((run_dirs[0] / "result.json").read_text())
            self.assertFalse(final["bank_publication_performed"])

    def test_driver_has_no_bank_publisher_dependency(self):
        source = DRIVER_PATH.read_text(encoding="utf-8")
        self.assertNotIn("import frontier_add", source)
        self.assertNotIn("commit_bank_records", source)
        self.assertNotIn("append_rows(", source)


if __name__ == "__main__":
    unittest.main()
