from __future__ import annotations

import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import signal
import subprocess
import sys
import tempfile
import time
from types import SimpleNamespace
import unittest
from unittest import mock

from census.census_554.closure_checkpoint import ClosureCheckpoint


REPO_ROOT = Path(__file__).resolve().parents[3]
PROBE_PATH = REPO_ROOT / "scratch/census-554/frozen_separation_probe.py"

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

STRUCTURAL_CUBE = {
    0: [3, 4, 6, 9], 1: [0, 2, 6, 7], 2: [0, 1, 9, 10],
    3: [1, 4, 5, 7], 4: [3, 5, 6, 10], 5: [2, 4, 8, 10],
    6: [0, 2, 3, 5], 7: [5, 6, 8, 9], 8: [1, 2, 4, 6],
    9: [0, 5, 8, 10], 10: [1, 3, 7, 9],
}

STRUCTURAL_SELECTED_ORDER = {
    "orientation": "direct",
    "python_internal_index": 3,
    "labels": [0, 9, 10, 1, 3, 4, 5, 2, 7, 8, 6],
    "row_scope": "canonical-card11-direct-row",
}


def _load_probe():
    spec = importlib.util.spec_from_file_location(
        "census554_frozen_separation_probe_test", PROBE_PATH
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def _structural_seed_fixture(probe, root: Path):
    result_path = root / "source_frontier.json"
    probe._atomic_write_json(result_path, {
        "schema": probe.SCHEMA,
        "status": "combined-frontier",
        "cube": {str(center): members for center, members in CUBE.items()},
        "independent_cube_ok": True,
        "independent_selected_orders_valid": True,
        "bank_sha256": "a" * 64,
        "bank_rows": 5836,
        "iteration": 547,
    })
    payload = probe.convex_structural_seeds.build_seed_artifact(
        result_path,
        theorem_build=(
            probe.convex_structural_seeds.current_passed_theorem_build()
        ),
    )
    raw = json.dumps(payload, sort_keys=True, indent=2).encode() + b"\n"
    artifact_path = root / "structural_seed.json"
    artifact_path.write_bytes(raw)
    artifact, reread = probe._read_structural_seed_artifact(artifact_path)
    if reread != raw:
        raise AssertionError("fixture seed bytes drifted")
    return artifact_path, artifact, raw


class FrozenSeparationProbeTest(unittest.TestCase):
    def test_structural_seed_snapshot_hash_validation_and_runtime_fingerprint(self):
        probe = _load_probe()
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            _path, artifact, raw = _structural_seed_fixture(probe, root)
            workdir = root / "run"
            workdir.mkdir()
            probe._atomic_write_bytes(
                workdir / probe.STRUCTURAL_SEED_SNAPSHOT, raw
            )
            probe._atomic_write_bytes(
                workdir / probe.STRUCTURAL_SOURCE_SNAPSHOT,
                artifact.source_result_bytes,
            )
            probe._atomic_write_bytes(
                workdir / probe.STRUCTURAL_THEOREM_SNAPSHOT,
                artifact.theorem_source_bytes,
            )
            metadata = {
                "convex_structural_seeds": probe._structural_seed_metadata(
                    artifact, raw
                )
            }
            pending_payload = (
                probe.convex_structural_seeds.build_seed_artifact(
                    root / "source_frontier.json"
                )
            )
            pending_path = root / "pending_structural_seed.json"
            pending_path.write_bytes(
                json.dumps(
                    pending_payload, sort_keys=True, indent=2
                ).encode() + b"\n"
            )
            with self.assertRaisesRegex(
                probe.ProbeError, "require passed theorem-build evidence"
            ):
                probe._read_structural_seed_artifact(pending_path)
            (root / "source_frontier.json").unlink()
            replayed = probe._load_structural_seed_snapshot(workdir, metadata)
            self.assertEqual(replayed.profile_orbit_keys, artifact.profile_orbit_keys)
            self.assertEqual(artifact.record_count, 36)
            fingerprint = probe._runtime_fingerprint()
            self.assertEqual(
                fingerprint["convex_structural_seeds"],
                probe._sha256_file(
                    Path(probe.convex_structural_seeds.__file__)
                ),
            )

            tampered = bytearray(raw)
            tampered[-2] = ord(" ")
            (workdir / probe.STRUCTURAL_SEED_SNAPSHOT).write_bytes(tampered)
            with self.assertRaisesRegex(probe.ProbeError, "hash mismatch"):
                probe._load_structural_seed_snapshot(workdir, metadata)

            (workdir / probe.STRUCTURAL_SEED_SNAPSHOT).write_bytes(raw)
            theorem_path = workdir / probe.STRUCTURAL_THEOREM_SNAPSHOT
            theorem_raw = theorem_path.read_bytes()
            theorem_path.write_bytes(theorem_raw + b"\n")
            with self.assertRaisesRegex(
                probe.ProbeError, "theorem-source snapshot hash mismatch"
            ):
                probe._load_structural_seed_snapshot(workdir, metadata)
            theorem_path.unlink()
            with self.assertRaisesRegex(
                probe.ProbeError, "theorem-source snapshot is absent"
            ):
                probe._load_structural_seed_snapshot(workdir, metadata)

    def test_structural_orbits_seed_before_dynamic_checkpoint_replay(self):
        probe = _load_probe()
        row = {
            "pid": "pat_00000",
            "pattern": {"3": [5, 9], "5": [3, 8, 9]},
            "cert": "certs/pat_00000.json",
        }
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            _path, artifact, _raw = _structural_seed_fixture(probe, root)
            checkpoint = ClosureCheckpoint.create(
                root / "checkpoint.sqlite3", {"test": True}
            )
            try:
                instance, _sep, _reps, seen, seed_instances = (
                    probe._prepare_formula(
                        [row], checkpoint, artifact.patterns
                    )
                )
                inventory = instance.seed_inventory
                self.assertEqual(
                    inventory["convex_structural"][
                        "validated_profile_orbit_patterns"
                    ],
                    artifact.record_count,
                )
                self.assertEqual(
                    inventory["convex_structural"][
                        "profile_orbit_instances"
                    ],
                    artifact.record_count,
                )
                self.assertEqual(seed_instances, len(seen))

                sources, _ = probe._source_rows([row])
                source = sources[0]
                support = probe.combinatorics.support(source["pattern"])
                injection = dict(zip(support, (6, 7, 3, 4)))
                pattern = probe.combinatorics.apply_mapping(
                    source["pattern"], injection
                )
                self.assertNotIn(
                    probe.combinatorics.serialize_pattern(pattern), seen
                )
                clause = instance.add_pattern_instance(pattern)
                record = {
                    "pattern": probe._json_pattern(pattern),
                    "clause": clause,
                    "provenance": {
                        "source_pid": row["pid"],
                        "source_row_sha256": source["row_sha256"],
                        "canonical_motif": probe._motif_json(source["key"]),
                        "support_injection": [
                            [point, injection[point]] for point in sorted(injection)
                        ],
                        "embedding_kind": "motif_embedding_autos",
                    },
                }
                checkpoint.append_batch(
                    [record], iteration=1, elapsed_seconds=0.1
                )

                replayed, _sep, _reps, replay_seen, replay_seed_count = (
                    probe._prepare_formula(
                        [row], checkpoint, artifact.patterns
                    )
                )
                self.assertEqual(replayed.excl[-1], clause)
                self.assertEqual(replay_seed_count, seed_instances)
                self.assertEqual(len(replay_seen), seed_instances + 1)
                self.assertEqual(list(checkpoint.records()), [record])
            finally:
                checkpoint.close()

    def test_read_only_bank_snapshot_and_ordered_checkpoint(self):
        probe = _load_probe()
        with tempfile.TemporaryDirectory() as directory:
            tmp_path = Path(directory)
            bank = tmp_path / "bank.jsonl"
            bank_rows = [
                {
                    "pid": "pat_00000",
                    "pattern": {"3": [5, 9], "5": [3, 8, 9]},
                    "cert": "certs/pat_00000.json",
                },
                {
                    "pid": "pat_00001",
                    "pattern": {"4": [6, 8], "6": [4, 9]},
                    "cert": "certs/pat_00001.json",
                },
            ]
            raw = b"".join(
                json.dumps(
                    row, sort_keys=True, separators=(",", ":")
                ).encode() + b"\n"
                for row in bank_rows
            )
            bank.write_bytes(raw)
            before = (bank.read_bytes(), bank.stat().st_mtime_ns)

            rows, frozen = probe.read_frozen_bank(bank)
            self.assertEqual(rows, bank_rows)
            workdir = probe._new_workdir(tmp_path / "runs")
            probe._atomic_write_bytes(workdir / "bank_snapshot.jsonl", frozen)
            self.assertEqual(
                hashlib.sha256(frozen).hexdigest(),
                probe._sha256_file(workdir / "bank_snapshot.jsonl"),
            )

            metadata = {"bank_sha256": hashlib.sha256(frozen).hexdigest()}
            first = {
                "pattern": {"0": [1, 2]},
                "clause": [-11],
                "provenance": {"source_pid": "pat_00000"},
            }
            second = {
                "pattern": {"3": [4, 5]},
                "clause": [-12],
                "provenance": {"source_pid": "pat_00001"},
            }
            with ClosureCheckpoint.create(
                workdir / "checkpoint.sqlite3", metadata
            ) as checkpoint:
                checkpoint.append_batch(
                    [first, second], iteration=1, elapsed_seconds=0.5
                )
                self.assertEqual(list(checkpoint.records()), [first, second])

            self.assertEqual(
                (bank.read_bytes(), bank.stat().st_mtime_ns), before
            )
            self.assertFalse((bank.parent / "bank.jsonl.lock").exists())

    def test_resume_refuses_terminal_checkpoint_without_clearing_result(self):
        probe = _load_probe()
        with tempfile.TemporaryDirectory() as directory:
            workdir = Path(directory)
            snapshot = workdir / "bank_snapshot.jsonl"
            snapshot.write_bytes(b"")
            metadata = {
                "schema": probe.SCHEMA,
                "bank_sha256": hashlib.sha256(b"").hexdigest(),
                "bank_rows": 0,
                "seed": 17,
                "created_utc": "2026-07-11T00:00:00+00:00",
                "runtime_fingerprint": probe._runtime_fingerprint(),
            }
            probe._atomic_write_json(workdir / "run_metadata.json", metadata)
            with ClosureCheckpoint.create(
                workdir / "checkpoint.sqlite3", metadata
            ) as checkpoint:
                checkpoint.append_batch(
                    [],
                    iteration=3,
                    elapsed_seconds=1.25,
                    status="combined-frontier",
                )
            result = workdir / "result.json"
            result.write_text('{"status":"combined-frontier"}\n')

            with self.assertRaisesRegex(
                probe.ProbeError, "already has terminal status"
            ):
                probe._run(SimpleNamespace(resume=workdir, seed=None))

            self.assertEqual(
                result.read_text(), '{"status":"combined-frontier"}\n'
            )

    def test_concurrent_resume_fails_before_artifact_access(self):
        probe = _load_probe()
        with tempfile.TemporaryDirectory() as directory:
            workdir = Path(directory)
            script = "\n".join((
                "import fcntl, os, sys",
                "fd = os.open(sys.argv[1], os.O_RDWR | os.O_CREAT, 0o600)",
                "fcntl.flock(fd, fcntl.LOCK_EX)",
                "print('locked', flush=True)",
                "sys.stdin.readline()",
            ))
            child = subprocess.Popen(
                [sys.executable, "-c", script, str(workdir / probe.WORKDIR_LOCK)],
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            try:
                self.assertEqual(child.stdout.readline().strip(), "locked")
                with self.assertRaisesRegex(
                    probe.ProbeError, "already holds"
                ):
                    probe._run(SimpleNamespace(resume=workdir, seed=None))
            finally:
                if child.poll() is None:
                    child.communicate("\n", timeout=5)
                else:
                    child.communicate(timeout=5)

    def test_checkpoint_provenance_is_rederived_from_frozen_bank(self):
        probe = _load_probe()
        row = {
            "pid": "pat_00000",
            "pattern": {"3": [5, 9], "5": [3, 8, 9]},
            "cert": "certs/pat_00000.json",
        }
        sources, _ = probe._source_rows([row])
        source = sources[0]
        injection = [[point, point] for point in probe.combinatorics.support(
            source["pattern"]
        )]
        valid = {
            "pattern": probe._json_pattern(source["pattern"]),
            "clause": [-1],
            "provenance": {
                "source_pid": row["pid"],
                "source_row_sha256": source["row_sha256"],
                "canonical_motif": probe._motif_json(source["key"]),
                "support_injection": injection,
                "embedding_kind": "motif_embedding_autos",
            },
        }
        lookup = probe._source_lookup(sources)
        self.assertEqual(
            probe._validate_checkpoint_provenance(valid, lookup),
            source["pattern"],
        )

        tampered = []
        bad_hash = copy.deepcopy(valid)
        bad_hash["provenance"]["source_row_sha256"] = "0" * 64
        tampered.append(bad_hash)
        bad_motif = copy.deepcopy(valid)
        bad_motif["provenance"]["canonical_motif"] = []
        tampered.append(bad_motif)
        bad_map = copy.deepcopy(valid)
        bad_map["provenance"]["support_injection"][-1][1] = injection[0][1]
        tampered.append(bad_map)
        bad_pattern = copy.deepcopy(valid)
        bad_pattern["pattern"]["3"] = [5]
        tampered.append(bad_pattern)
        bad_kind = copy.deepcopy(valid)
        bad_kind["provenance"]["embedding_kind"] = "untrusted"
        tampered.append(bad_kind)
        for record in tampered:
            with self.subTest(record=record["provenance"]):
                with self.assertRaises(probe.ProbeError):
                    probe._validate_checkpoint_provenance(record, lookup)

        with tempfile.TemporaryDirectory() as directory:
            with ClosureCheckpoint.create(
                Path(directory) / "checkpoint.sqlite3", {"test": True}
            ) as checkpoint:
                checkpoint.append_batch(
                    [bad_hash], iteration=1, elapsed_seconds=0.1
                )
                with self.assertRaisesRegex(
                    probe.ProbeError, "unique frozen-bank row"
                ):
                    probe._prepare_formula([row], checkpoint)

    def test_seen_pattern_backstop_rejects_contained_exclusion(self):
        probe = _load_probe()
        cube = {center: [] for center in range(probe.profile.N)}
        cube[3] = [1, 4, 7]
        seen = {((3, (1, 4)),)}
        with self.assertRaisesRegex(
            probe.ProbeError, "already-seen exclusion pattern"
        ):
            probe._assert_no_seen_exclusion(cube, seen)
        probe._assert_no_seen_exclusion(cube, {((3, (1, 5)),)})

    def test_post_exit_signal_race_is_not_reported_as_solver_result(self):
        probe = _load_probe()

        class CompletedProcess:
            returncode = 10

            def poll(self):
                probe._STOP_SIGNAL = signal.SIGINT
                return self.returncode

        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            try:
                with mock.patch.object(
                    probe.subprocess, "Popen", return_value=CompletedProcess()
                ):
                    with self.assertRaises(probe.ProbeInterrupted):
                        probe._run_command(
                            ["fake-cadical"],
                            stdout_path=root / "stdout",
                            stderr_path=root / "stderr",
                            timeout=1.0,
                        )
            finally:
                probe._STOP_SIGNAL = None

    def test_terminal_result_is_durable_before_checkpoint_commit(self):
        probe = _load_probe()
        with tempfile.TemporaryDirectory() as directory:
            workdir = Path(directory)
            checkpoint = ClosureCheckpoint.create(
                workdir / "checkpoint.sqlite3", {"test": True}
            )
            checkpoint.append_batch(
                [], iteration=2, elapsed_seconds=0.5, status="SAT-progress"
            )
            payload = {
                "status": "combined-frontier",
                "iteration": 3,
                "timings": {"cumulative_elapsed_s": 0.75},
            }
            original_append = checkpoint.append_batch

            def crash_before_commit(*args, **kwargs):
                self.assertTrue((workdir / "result.json").is_file())
                self.assertTrue((workdir / "combined_frontier.json").is_file())
                raise RuntimeError("simulated crash")

            try:
                with mock.patch.object(
                    checkpoint, "append_batch", side_effect=crash_before_commit
                ):
                    with self.assertRaisesRegex(RuntimeError, "simulated crash"):
                        probe._persist_terminal(
                            checkpoint,
                            workdir,
                            payload,
                            aliases=("combined_frontier.json",),
                        )
                self.assertEqual(checkpoint.progress().status, "SAT-progress")
                probe._clear_previous_result(workdir)
                self.assertFalse((workdir / "result.json").exists())
                self.assertFalse((workdir / "combined_frontier.json").exists())

                original_append(
                    [], iteration=2, elapsed_seconds=0.6, status="SAT-progress"
                )
                probe._persist_terminal(
                    checkpoint,
                    workdir,
                    payload,
                    aliases=("combined_frontier.json",),
                )
                self.assertEqual(
                    checkpoint.progress().status, "combined-frontier"
                )
            finally:
                checkpoint.close()

    def test_unverified_unsat_does_not_consume_solver_iteration(self):
        probe = _load_probe()

        class FakeInstance:
            def dimacs(self):
                return "p cnf 0 0\n"

        args = SimpleNamespace(
            wall_seconds=10.0,
            max_iterations=1,
            solver_timeout=5.0,
            proof_timeout=5.0,
            cadical="cadical",
            drat_trim="drat-trim",
        )
        metadata = {
            "bank_sha256": hashlib.sha256(b"").hexdigest(),
            "bank_rows": 0,
            "seed": 19,
            "elapsed_s": 0.0,
        }
        with tempfile.TemporaryDirectory() as directory:
            workdir = Path(directory)
            checkpoint = ClosureCheckpoint.create(
                workdir / "checkpoint.sqlite3", {"test": True}
            )

            def proof_timeout(*_args):
                progress = checkpoint.progress()
                self.assertEqual(progress.iteration, 0)
                self.assertEqual(progress.status, "UNSAT-candidate")
                candidate = json.loads(
                    (workdir / "progress.json").read_text()
                )
                self.assertEqual(candidate["iteration"], 0)
                self.assertEqual(candidate["solver_iteration"], 1)
                return False, {"proof_status": "simulated timeout"}

            solved = probe.CommandResult(
                20, "s UNSATISFIABLE\n", "", False
            )
            try:
                with (
                    mock.patch.object(
                        probe,
                        "_prepare_formula",
                        return_value=(FakeInstance(), object(), {}, set(), 0),
                    ),
                    mock.patch.object(
                        probe, "_run_command", return_value=solved
                    ) as run_solver,
                    mock.patch.object(
                        probe, "_proof_check", side_effect=proof_timeout
                    ),
                    mock.patch("builtins.print"),
                ):
                    first = probe._execute(
                        workdir,
                        checkpoint,
                        metadata,
                        args,
                        [],
                        None,
                        time.monotonic(),
                    )
                    self.assertEqual(first, 2)
                    self.assertEqual(checkpoint.progress().iteration, 0)
                    budget = json.loads((workdir / "result.json").read_text())
                    self.assertEqual(budget["iteration"], 0)
                    self.assertEqual(budget["solver_iteration"], 1)

                    resumed_metadata = {
                        **metadata,
                        "elapsed_s": checkpoint.progress().elapsed_seconds,
                    }
                    second = probe._execute(
                        workdir,
                        checkpoint,
                        resumed_metadata,
                        args,
                        [],
                        None,
                        time.monotonic(),
                    )
                    self.assertEqual(second, 2)
                    self.assertEqual(run_solver.call_count, 2)
                    self.assertEqual(checkpoint.progress().iteration, 0)
            finally:
                checkpoint.close()

    def test_verified_unsat_keeps_algebra_and_convex_trust_separate(self):
        probe = _load_probe()

        class FakeInstance:
            def dimacs(self):
                return "p cnf 0 0\n"

        args = SimpleNamespace(
            wall_seconds=10.0,
            max_iterations=1,
            solver_timeout=5.0,
            proof_timeout=5.0,
            cadical="cadical",
            drat_trim="drat-trim",
        )
        structural_metadata = {
            "schema": "fixture",
            "sha256": "b" * 64,
            "theorem_build_status": "passed",
            "theorem_source_sha256": "c" * 64,
            "theorem_contract_sha256": "d" * 64,
        }
        metadata = {
            "bank_sha256": "a" * 64,
            "bank_rows": 3,
            "seed": 31,
            "elapsed_s": 0.0,
            "convex_structural_seeds": structural_metadata,
        }
        solved = probe.CommandResult(20, "s UNSATISFIABLE\n", "", False)
        with tempfile.TemporaryDirectory() as directory:
            workdir = Path(directory)
            checkpoint = ClosureCheckpoint.create(
                workdir / "checkpoint.sqlite3", {"test": True}
            )
            try:
                with (
                    mock.patch.object(
                        probe,
                        "_prepare_formula",
                        return_value=(FakeInstance(), object(), {}, set(), 0),
                    ),
                    mock.patch.object(probe, "_run_command", return_value=solved),
                    mock.patch.object(
                        probe,
                        "_proof_check",
                        return_value=(True, {"proof_status": "DRAT verified"}),
                    ),
                    mock.patch("builtins.print"),
                ):
                    code = probe._execute(
                        workdir,
                        checkpoint,
                        metadata,
                        args,
                        [],
                        SimpleNamespace(patterns=()),
                        time.monotonic(),
                    )
                self.assertEqual(code, 0)
                result = json.loads((workdir / "result.json").read_text())
                self.assertEqual(result["status"], "UNSAT-verified")
                self.assertEqual(
                    result["formula_sources"]["algebra_bank"]["sha256"],
                    "a" * 64,
                )
                self.assertEqual(
                    result["formula_sources"]["convex_structural"]["sha256"],
                    "b" * 64,
                )
                self.assertIn("frozen algebra bank", result["trust"])
                self.assertIn("convex structural seeds", result["trust"])
            finally:
                checkpoint.close()

    def test_interruption_adds_current_invocation_elapsed_time(self):
        probe = _load_probe()
        with tempfile.TemporaryDirectory() as directory:
            workdir = Path(directory)
            raw = b""
            (workdir / "bank_snapshot.jsonl").write_bytes(raw)
            metadata = {
                "schema": probe.SCHEMA,
                "bank_sha256": hashlib.sha256(raw).hexdigest(),
                "bank_rows": 0,
                "seed": 23,
                "created_utc": "2026-07-11T00:00:00+00:00",
                "runtime_fingerprint": probe._runtime_fingerprint(),
            }
            probe._atomic_write_json(workdir / "run_metadata.json", metadata)
            with ClosureCheckpoint.create(
                workdir / "checkpoint.sqlite3", metadata
            ) as checkpoint:
                checkpoint.append_batch(
                    [], iteration=4, elapsed_seconds=2.0, status="budget"
                )

            def interrupt(*_args):
                time.sleep(0.02)
                raise probe.ProbeInterrupted("test interrupt")

            probe._STOP_SIGNAL = signal.SIGINT
            try:
                with mock.patch.object(probe, "_execute", side_effect=interrupt):
                    code = probe._run(
                        SimpleNamespace(resume=workdir, seed=None)
                    )
            finally:
                probe._STOP_SIGNAL = None
            self.assertEqual(code, 128 + signal.SIGINT)
            with ClosureCheckpoint.open(
                workdir / "checkpoint.sqlite3", metadata
            ) as checkpoint:
                progress = checkpoint.progress()
                self.assertEqual(progress.status, "interrupted")
                self.assertGreaterEqual(progress.elapsed_seconds, 2.015)

    def test_formalized_structural_snapshot_and_dynamic_replay(self):
        probe = _load_probe()
        cube = STRUCTURAL_CUBE
        selected = (
            probe.formalized_structural_oracle.order_from_record(
                STRUCTURAL_SELECTED_ORDER
            ),
        )
        catalog, raw, sources, oracle_metadata = (
            probe._prepare_structural_oracle_snapshot()
        )
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            probe._write_structural_oracle_snapshot(root, raw, sources)
            replayed_catalog = probe._load_structural_oracle_snapshot(
                root, {"formalized_structural_oracle": oracle_metadata}
            )
            self.assertEqual(replayed_catalog, catalog)

            checkpoint_metadata = {"test": "structural-replay"}
            checkpoint = ClosureCheckpoint.create(
                root / "checkpoint.sqlite3", checkpoint_metadata
            )
            try:
                instance, separation, _reps, seen, _seed_count = (
                    probe._prepare_formula([], checkpoint, (), replayed_catalog)
                )
                records, summary = probe._add_formalized_structural_refinements(
                    instance,
                    separation,
                    seen,
                    cube,
                    selected,
                    replayed_catalog,
                )
                self.assertEqual(summary["stage"], "equality-three-triad-collision")
                self.assertEqual(summary["minimal_rows"], 7)
                self.assertEqual(summary["minimal_incidences"], 17)
                self.assertEqual(len(records), 36)
                self.assertTrue(all(
                    record["provenance"]["cut_scope"] == "unconditional"
                    for record in records
                ))
                checkpoint.append_batch(
                    records, iteration=1, elapsed_seconds=0.1
                )
                original_dimacs = instance.dimacs()
            finally:
                checkpoint.close()

            with ClosureCheckpoint.open(
                root / "checkpoint.sqlite3", checkpoint_metadata
            ) as reopened:
                replayed, _sep, _reps, replay_seen, _seed_count = (
                    probe._prepare_formula([], reopened, (), replayed_catalog)
                )
                self.assertEqual(replayed.dimacs(), original_dimacs)
                self.assertEqual(len(replay_seen), 36)
                self.assertEqual(len(replayed.unconditional_seen), 36)

    def test_order_conditional_structural_clause_replay_and_backstop(self):
        probe = _load_probe()
        cube = probe.formalized_structural_oracle.normalize_pattern(
            STRUCTURAL_CUBE, require_full_cube=True
        )
        found = None
        for order in probe.separation_encoding.valid_orders(cube):
            for family in probe.formalized_structural_oracle.ORDERED_FAMILIES:
                if probe.formalized_structural_oracle.detect_stage(
                    cube, family.stage, order
                ) is not None:
                    found = probe.formalized_structural_oracle.build_detection(
                        cube, family.stage, order
                    )
                    break
            if found is not None:
                break
        self.assertIsNotNone(found)
        catalog = probe.formalized_structural_oracle.catalog_manifest()
        orbit = probe.formalized_structural_oracle.profile_orbit_ordered(
            cube, [found]
        )
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            metadata = {"test": "ordered-structural"}
            checkpoint = ClosureCheckpoint.create(
                root / "checkpoint.sqlite3", metadata
            )
            try:
                instance, separation, _reps, seen, _seed_count = (
                    probe._prepare_formula([], checkpoint, (), catalog)
                )
                records = probe._commit_structural_orbit(
                    instance,
                    separation,
                    seen,
                    catalog,
                    source_pattern=cube,
                    cut_scope="order-conditional",
                    orbit=orbit,
                )
                self.assertEqual(len(records), 72)
                self.assertTrue(all(
                    "additional_clauses" not in record for record in records
                ))
                checkpoint.append_batch(
                    records, iteration=1, elapsed_seconds=0.1
                )
                original_dimacs = instance.dimacs()
            finally:
                checkpoint.close()
            with ClosureCheckpoint.open(
                root / "checkpoint.sqlite3", metadata
            ) as reopened:
                replayed, _sep, _reps, _seen, _seed_count = probe._prepare_formula(
                    [], reopened, (), catalog
                )
                self.assertEqual(replayed.dimacs(), original_dimacs)
                original_key = probe.combinatorics.serialize_pattern(cube)
                killed = next(iter(replayed.ordered_seen[original_key]))
                killed_order = next(
                    order for order in probe.separation_encoding.all_orders()
                    if probe._order_key(order) == killed
                )
                with self.assertRaisesRegex(
                    probe.ProbeError, "already-excluded structural order"
                ):
                    probe._assert_no_seen_exclusion(
                        cube, set(), [killed_order], replayed.ordered_seen
                    )


if __name__ == "__main__":
    unittest.main()
