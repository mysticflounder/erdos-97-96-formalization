from __future__ import annotations

import fcntl
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import sqlite3
import sys
import tempfile
import textwrap
from types import SimpleNamespace
import unittest


REPO_ROOT = Path(__file__).resolve().parents[3]
SCRIPT = REPO_ROOT / "scratch" / "census-554" / "run_separation_experiment.py"
SPEC = importlib.util.spec_from_file_location("run_separation_experiment", SCRIPT)
assert SPEC is not None and SPEC.loader is not None
experiment = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = experiment
SPEC.loader.exec_module(experiment)


FAKE_PROBE = r'''
from __future__ import annotations
import argparse
import hashlib
import json
from pathlib import Path
import sqlite3

SCHEMA = "census554_frozen_separation_probe.v1"

def _runtime_fingerprint():
    return {"probe": hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}

def _solver_seed(run_seed, iteration, purpose):
    return run_seed + iteration

def _run_command(command, *, stdout_path, stderr_path, timeout):
    Path(stdout_path).write_text("fake solver\n")
    Path(stderr_path).write_text("")
    return None

def _add_lazy_embeddings(*args, **kwargs):
    return [{"kind": "algebra"}]

def _add_formalized_structural_refinements(*args, **kwargs):
    return ([{"kind": "structural-a"}, {"kind": "structural-b"}], {"status": "ok"})

def _prepare_formula(*args, **kwargs):
    return {"status": "fake-built"}

def main(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument("--resume", type=Path, required=True)
    parser.add_argument("--seed", type=int, required=True)
    parser.add_argument("--max-iterations", type=int, required=True)
    parser.add_argument("--wall-seconds")
    parser.add_argument("--solver-timeout", type=float, required=True)
    parser.add_argument("--proof-timeout")
    parser.add_argument("--cadical")
    parser.add_argument("--drat-trim")
    parser.add_argument("--refinement-order")
    parser.add_argument("--perp-bisector-template-preseed", action="store_true")
    args = parser.parse_args(argv)
    _prepare_formula(args.resume)
    connection = sqlite3.connect(args.resume / "checkpoint.sqlite3")
    try:
        row = connection.execute(
            "SELECT iteration, elapsed_seconds, instance_count FROM progress WHERE singleton = 1"
        ).fetchone()
        for iteration in range(int(row[0]) + 1, args.max_iterations + 1):
            _solver_seed(args.seed, iteration, "search")
            _run_command(
                ["fake"],
                stdout_path=args.resume / "search_solver.stdout",
                stderr_path=args.resume / "search_solver.stderr",
                timeout=args.solver_timeout,
            )
            algebra = _add_lazy_embeddings(None)
            structural, _summary = _add_formalized_structural_refinements(None)
            records = algebra + structural
            with connection:
                for ordinal, record in enumerate(records):
                    pattern = {"iteration": iteration, "ordinal": ordinal}
                    encoded = json.dumps(
                        {"pattern": pattern, "clause": [-iteration], **record},
                        sort_keys=True, separators=(",", ":"),
                    )
                    connection.execute(
                        "INSERT INTO instances(pattern_key, record_json) VALUES (?, ?)",
                        (json.dumps(pattern, sort_keys=True, separators=(",", ":")), encoded),
                    )
                count = connection.execute("SELECT COUNT(*) FROM instances").fetchone()[0]
                connection.execute(
                    "UPDATE progress SET iteration = ?, elapsed_seconds = ?, status = ?, instance_count = ? WHERE singleton = 1",
                    (iteration, float(iteration), "SAT-progress", count),
                )
            print(f"[iter {iteration}] fake")
        dynamic_instances = connection.execute(
            "SELECT COUNT(*) FROM instances"
        ).fetchone()[0]
        preseed_instances = 5 if args.perp_bisector_template_preseed else 0
        seed_instances = 10 + preseed_instances
        (args.resume / "result.json").write_text(json.dumps({
            "status": "budget",
            "seed_instances": seed_instances,
            "instances": seed_instances + dynamic_instances,
            "formula_sources": {
                "perp_bisector_template": {
                    "new_instances": preseed_instances,
                    "already_present_instances": 0,
                }
            },
        }, sort_keys=True))
    finally:
        connection.close()
    return 2
'''


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


class SeparationExperimentTest(unittest.TestCase):
    def setUp(self) -> None:
        self.temporary = tempfile.TemporaryDirectory()
        self.root = Path(self.temporary.name)
        self.source = self.root / "source"
        self.source.mkdir()
        self.probe = self.root / "fake_probe.py"
        self.probe.write_text(textwrap.dedent(FAKE_PROBE), encoding="utf-8")
        bank = b'{"id":"row-1"}\n'
        (self.source / "bank_snapshot.jsonl").write_bytes(bank)
        self.metadata = {
            "schema": experiment.PROBE_SCHEMA,
            "bank_sha256": hashlib.sha256(bank).hexdigest(),
            "bank_rows": 1,
            "seed": 17,
            "created_utc": "2026-07-11T00:00:00+00:00",
            "runtime_fingerprint": {"probe": "source"},
            "convex_structural_seeds": None,
            "formalized_structural_oracle": None,
        }
        (self.source / "run_metadata.json").write_text(
            json.dumps(self.metadata, sort_keys=True, indent=2) + "\n",
            encoding="utf-8",
        )
        connection = sqlite3.connect(self.source / "checkpoint.sqlite3")
        try:
            connection.executescript(
                """
                CREATE TABLE metadata (key TEXT PRIMARY KEY, value TEXT NOT NULL);
                CREATE TABLE instances (
                  seq INTEGER PRIMARY KEY AUTOINCREMENT,
                  pattern_key TEXT NOT NULL UNIQUE,
                  record_json TEXT NOT NULL
                );
                CREATE TABLE progress (
                  singleton INTEGER PRIMARY KEY CHECK (singleton = 1),
                  iteration INTEGER NOT NULL,
                  elapsed_seconds REAL NOT NULL,
                  status TEXT NOT NULL,
                  instance_count INTEGER NOT NULL
                );
                """
            )
            connection.executemany(
                "INSERT INTO metadata(key, value) VALUES (?, ?)",
                (
                    ("schema", json.dumps("census554_closure_checkpoint.v1")),
                    (
                        "run_metadata",
                        json.dumps(self.metadata, sort_keys=True, separators=(",", ":")),
                    ),
                ),
            )
            connection.execute(
                "INSERT INTO progress VALUES (1, 5, 5.0, 'SAT-progress', 0)"
            )
            connection.commit()
        finally:
            connection.close()

    def tearDown(self) -> None:
        self.temporary.cleanup()

    def test_ab_run_is_bounded_instrumented_and_source_preserving(self) -> None:
        source_hashes = {
            path.name: _sha256(path) for path in self.source.iterdir() if path.is_file()
        }
        args = experiment._parse_args(
            [
                "--source", str(self.source),
                "--baseline-probe", str(self.probe),
                "--variant", f"structural-first={self.probe}",
                "--variant-refinement-order", "structural-first=structural-first",
                "--variant-perp-template-preseed", "structural-first",
                "--output", str(self.root / "output"),
                "--iterations", "2",
                "--wall-seconds", "5",
                "--hard-wall-seconds", "20",
                "--solver-timeout", "2",
                "--proof-timeout", "2",
            ]
        )
        output, manifest = experiment.run_experiment(args)
        self.assertEqual(manifest["status"], "complete")
        self.assertEqual(manifest["start_checkpoint"]["iteration"], 5)
        self.assertEqual(manifest["max_iteration"], 7)
        self.assertEqual([arm["arm"] for arm in manifest["arms"]], [
            "baseline", "structural-first"
        ])
        for arm in manifest["arms"]:
            summary = arm["summary"]
            self.assertEqual(summary["completed_iterations"], 2)
            self.assertEqual(summary["event_count"], 2)
            self.assertEqual(summary["algebra_records"], 2)
            self.assertEqual(summary["structural_records"], 4)
            self.assertEqual(summary["new_instances"], 6)
            self.assertEqual(summary["new_checkpoint_instances"], 6)
            self.assertEqual(summary["formula_build_calls"], 1)
            self.assertGreaterEqual(summary["formula_build_seconds"], 0.0)
            self.assertGreaterEqual(summary["formula_build_cpu_seconds"], 0.0)
            self.assertGreater(summary["worker_self_cpu_seconds"], 0.0)
            self.assertGreaterEqual(summary["worker_child_cpu_seconds"], 0.0)
            self.assertAlmostEqual(
                summary["worker_total_cpu_seconds"],
                summary["worker_self_cpu_seconds"]
                + summary["worker_child_cpu_seconds"],
            )
            self.assertGreaterEqual(summary["solver_cpu_seconds"], 0.0)
            self.assertGreaterEqual(summary["algebra_cpu_seconds"], 0.0)
            self.assertGreaterEqual(summary["structural_cpu_seconds"], 0.0)
            self.assertGreaterEqual(summary["unclassified_cpu_seconds"], 0.0)
            self.assertIsNotNone(summary["unclassified_wall_seconds"])
            expected_preseed = 5 if arm["arm"] == "structural-first" else 0
            self.assertEqual(summary["preseed_new_instances"], expected_preseed)
            self.assertEqual(summary["final_seed_instances"], 10 + expected_preseed)
            self.assertEqual(
                summary["final_formula_instances"], 16 + expected_preseed
            )
            self.assertFalse(summary["hard_timeout"])
            metrics = json.loads(
                (output / "arms" / arm["arm"] / "experiment_metrics.json").read_text()
            )
            self.assertEqual([event["iteration"] for event in metrics["events"]], [6, 7])
            self.assertTrue(all(event["algebra_calls"] == 1 for event in metrics["events"]))
            self.assertTrue(all(event["structural_calls"] == 1 for event in metrics["events"]))
            self.assertEqual(
                metrics["cpu_accounting"]["wall_time_role"],
                "safety budget and secondary diagnostic only",
            )

        variant_metadata = json.loads(
            (output / "arms" / "structural-first" / "run_metadata.json").read_text()
        )
        self.assertEqual(variant_metadata["refinement_order"], "structural-first")
        self.assertTrue(variant_metadata["perp_bisector_template_preseed"])
        baseline_metadata = json.loads(
            (output / "arms" / "baseline" / "run_metadata.json").read_text()
        )
        self.assertNotIn("refinement_order", baseline_metadata)

        self.assertEqual(
            source_hashes,
            {path.name: _sha256(path) for path in self.source.iterdir() if path.is_file()},
        )
        self.assertFalse((self.source / experiment.PROBE_LOCK).exists())

    def test_held_probe_lock_rejects_source_without_copying(self) -> None:
        lock = self.source / experiment.PROBE_LOCK
        descriptor = os.open(lock, os.O_RDWR | os.O_CREAT, 0o600)
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
            output = self.root / "locked-output"
            output.mkdir()
            with self.assertRaisesRegex(experiment.ExperimentError, "source is live"):
                experiment._snapshot_source(self.source, output)
            self.assertFalse((output / "source_snapshot").exists())
        finally:
            fcntl.flock(descriptor, fcntl.LOCK_UN)
            os.close(descriptor)

    def test_preparer_parser_requires_no_shell_json_argv(self) -> None:
        name, argv = experiment._parse_named_json_argv(
            'preseed=["uv","run","prepare.py","{workdir}"]'
        )
        self.assertEqual(name, "preseed")
        self.assertEqual(argv[-1], "{workdir}")
        with self.assertRaises(experiment.ExperimentError):
            experiment._parse_named_json_argv("preseed=uv run prepare.py")

    def test_baseline_only_run_is_a_valid_bounded_experiment(self) -> None:
        args = experiment._parse_args([
            "--source", str(self.source),
            "--baseline-probe", str(self.probe),
            "--baseline-refinement-order", "structural-first",
            "--baseline-perp-template-preseed",
            "--output", str(self.root / "baseline-only"),
            "--iterations", "1",
            "--wall-seconds", "5",
            "--hard-wall-seconds", "20",
            "--solver-timeout", "2",
            "--proof-timeout", "2",
        ])
        output, manifest = experiment.run_experiment(args)
        self.assertEqual(manifest["status"], "complete")
        self.assertEqual([arm["arm"] for arm in manifest["arms"]], ["baseline"])
        self.assertEqual(
            manifest["arms"][0]["summary"]["completed_iterations"], 1
        )
        self.assertTrue((output / "arms" / "baseline").is_dir())
        metadata = json.loads(
            (output / "arms" / "baseline" / "run_metadata.json").read_text()
        )
        self.assertEqual(metadata["refinement_order"], "structural-first")
        self.assertTrue(metadata["perp_bisector_template_preseed"])

    def test_order_conditional_source_fails_closed(self) -> None:
        connection = sqlite3.connect(self.source / "checkpoint.sqlite3")
        try:
            record = {
                "pattern": {"0": [1]},
                "clause": [-1],
                "provenance": {
                    "source_kind": "formalized_structural_core",
                    "cut_scope": "order-conditional",
                },
            }
            with connection:
                connection.execute(
                    "INSERT INTO instances(pattern_key, record_json) VALUES (?, ?)",
                    (
                        json.dumps(record["pattern"], sort_keys=True, separators=(",", ":")),
                        json.dumps(record, sort_keys=True, separators=(",", ":")),
                    ),
                )
                connection.execute(
                    "UPDATE progress SET instance_count = 1 WHERE singleton = 1"
                )
        finally:
            connection.close()
        output = self.root / "unsafe-output"
        output.mkdir()
        with self.assertRaisesRegex(experiment.ExperimentError, "scope-safe"):
            experiment._snapshot_source(self.source, output)

    def test_deferred_partial_core_without_algebra_fails_closed(self) -> None:
        def dummy_probe():
            return SimpleNamespace(
                _solver_seed=lambda seed, iteration, purpose: seed,
                _run_command=lambda *args, **kwargs: None,
                _add_lazy_embeddings=lambda *args, **kwargs: [],
                _add_formalized_structural_refinements=lambda *args, **kwargs: (
                    [], {"status": "deferred-order-conditional"}
                ),
            )

        structural_first = dummy_probe()
        recorder = experiment._MetricsRecorder()
        experiment._instrument_probe(structural_first, recorder)
        structural_first._solver_seed(1, 6, "search")
        structural_first._add_formalized_structural_refinements(None)
        with self.assertRaisesRegex(experiment.ExperimentError, "false frontier"):
            structural_first._add_lazy_embeddings(None)

        bank_first = dummy_probe()
        recorder = experiment._MetricsRecorder()
        experiment._instrument_probe(bank_first, recorder)
        bank_first._solver_seed(1, 6, "search")
        bank_first._add_lazy_embeddings(None)
        with self.assertRaisesRegex(experiment.ExperimentError, "false frontier"):
            bank_first._add_formalized_structural_refinements(None)


if __name__ == "__main__":
    unittest.main()
