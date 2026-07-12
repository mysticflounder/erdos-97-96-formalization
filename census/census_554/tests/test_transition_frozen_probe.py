from __future__ import annotations

import importlib.util
import copy
import json
from pathlib import Path
import sqlite3
import subprocess
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest import mock

from census.census_554.closure_checkpoint import ClosureCheckpoint


REPO_ROOT = Path(__file__).resolve().parents[3]
TRANSITION_PATH = REPO_ROOT / "scratch/census-554/transition_frozen_probe.py"

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
    0: [3, 4, 6, 9],
    1: [0, 2, 6, 7],
    2: [0, 1, 9, 10],
    3: [1, 4, 5, 7],
    4: [3, 5, 6, 10],
    5: [2, 4, 8, 10],
    6: [0, 2, 3, 5],
    7: [5, 6, 8, 9],
    8: [1, 2, 4, 6],
    9: [0, 5, 8, 10],
    10: [1, 3, 7, 9],
}


def _load_transition():
    name = "census554_transition_frozen_probe_test"
    spec = importlib.util.spec_from_file_location(name, TRANSITION_PATH)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def _bank_bytes(rows):
    return b"".join(
        json.dumps(row, sort_keys=True, separators=(",", ":")).encode() + b"\n"
        for row in rows
    )


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
    path = root / "structural_seed.json"
    path.write_bytes(raw)
    artifact, reread = probe._read_structural_seed_artifact(path)
    if reread != raw:
        raise AssertionError("fixture seed bytes drifted")
    return path, artifact, raw


class TransitionFrozenProbeTest(unittest.TestCase):
    def setUp(self):
        self.transition = _load_transition()
        self.probe = self.transition.probe
        self.row = {
            "pid": "pat_00000",
            "pattern": {"3": [5, 9], "5": [3, 8, 9]},
            "cert": "certs/pat_00000.json",
        }
        self.injections = (
            (6, 7, 3, 4),
            (6, 7, 8, 9),
            (0, 1, 2, 3),
        )

    def _records(self, rows, injections, structural_patterns=()):
        probe = self.probe
        sources, _ = probe._source_rows(rows)
        source = sources[0]
        support = probe.combinatorics.support(source["pattern"])

        instance = probe.sat_cover.CoverInstance()
        probe.separation_encoding.add_separation_encoding(
            instance, scope=probe.separation_encoding.DIRECT_ROW_SCOPE
        )
        seen = set()
        for row in rows:
            pattern = probe._native_pattern(row["pattern"])
            for image, _mapping in probe.combinatorics.orbit_with_maps(pattern):
                serialized = probe.combinatorics.serialize_pattern(image)
                if serialized in seen:
                    continue
                instance.add_pattern_instance(image)
                seen.add(serialized)
        for pattern in structural_patterns:
            serialized = probe.combinatorics.serialize_pattern(pattern)
            if serialized in seen:
                continue
            instance.add_pattern_instance(pattern)
            seen.add(serialized)

        records = []
        for targets in injections:
            injection = dict(zip(support, targets))
            pattern = probe.combinatorics.apply_mapping(
                source["pattern"], injection
            )
            serialized = probe.combinatorics.serialize_pattern(pattern)
            self.assertNotIn(serialized, seen)
            record = {
                "pattern": probe._json_pattern(pattern),
                "clause": instance.add_pattern_instance(pattern),
                "provenance": {
                    "source_pid": source["row"].get("pid"),
                    "source_row_sha256": source["row_sha256"],
                    "canonical_motif": probe._motif_json(source["key"]),
                    "support_injection": [
                        [point, injection[point]] for point in sorted(injection)
                    ],
                    "embedding_kind": "motif_embedding_autos",
                },
            }
            records.append(record)
            seen.add(serialized)
        return records

    def _source(
        self,
        root: Path,
        name: str,
        rows,
        injections,
        *,
        terminal: bool = False,
        structural_artifact=None,
        structural_raw: bytes | None = None,
        runtime_fingerprint=None,
        structural_cube=None,
    ):
        run = root / name
        run.mkdir()
        raw = _bank_bytes(rows)
        (run / "bank_snapshot.jsonl").write_bytes(raw)
        metadata = {
            "schema": self.probe.SCHEMA,
            "bank_sha256": self.transition._sha256_bytes(raw),
            "bank_rows": len(rows),
            "seed": 17,
            "created_utc": "2026-07-11T00:00:00+00:00",
            "runtime_fingerprint": (
                self.probe._runtime_fingerprint()
                if runtime_fingerprint is None
                else runtime_fingerprint
            ),
            "convex_structural_seeds": (
                None
                if structural_artifact is None
                else self.probe._structural_seed_metadata(
                    structural_artifact, structural_raw
                )
            ),
        }
        structural_oracle_catalog = None
        if structural_cube is not None:
            (
                structural_oracle_catalog,
                oracle_raw,
                oracle_sources,
                oracle_metadata,
            ) = self.probe._prepare_structural_oracle_snapshot()
            metadata["formalized_structural_oracle"] = oracle_metadata
            self.probe._write_structural_oracle_snapshot(
                run, oracle_raw, oracle_sources
            )
        if structural_artifact is not None:
            self.probe._atomic_write_bytes(
                run / self.probe.STRUCTURAL_SEED_SNAPSHOT,
                structural_raw,
            )
            self.probe._atomic_write_bytes(
                run / self.probe.STRUCTURAL_SOURCE_SNAPSHOT,
                structural_artifact.source_result_bytes,
            )
            self.probe._atomic_write_bytes(
                run / self.probe.STRUCTURAL_THEOREM_SNAPSHOT,
                structural_artifact.theorem_source_bytes,
            )
        self.probe._atomic_write_json(run / "run_metadata.json", metadata)
        if structural_cube is None:
            records = self._records(
                rows,
                injections,
                () if structural_artifact is None
                else structural_artifact.patterns,
            )
        else:
            if tuple(injections):
                raise AssertionError("structural source fixture expects no bank records")
            structural_cube = self.probe._native_pattern(structural_cube)
            with ClosureCheckpoint.create(
                run / "checkpoint.sqlite3", metadata
            ) as empty_checkpoint:
                instance, separation, _reps, seen, _seed_count = (
                    self.probe._prepare_formula(
                        rows,
                        empty_checkpoint,
                        () if structural_artifact is None
                        else structural_artifact.patterns,
                        structural_oracle_catalog,
                    )
                )
                selected = self.probe.separation_encoding.valid_orders(
                    structural_cube
                )[:1]
                records, _summary = (
                    self.probe._add_formalized_structural_refinements(
                        instance,
                        separation,
                        seen,
                        structural_cube,
                        selected,
                        structural_oracle_catalog,
                    )
                )
        status = "combined-frontier" if terminal else "budget"
        checkpoint_factory = (
            ClosureCheckpoint.open if structural_cube is not None
            else ClosureCheckpoint.create
        )
        with checkpoint_factory(run / "checkpoint.sqlite3", metadata) as checkpoint:
            checkpoint.append_batch(
                records,
                iteration=max(1, len(records)),
                elapsed_seconds=1.5,
                status=status,
            )
        (run / self.probe.WORKDIR_LOCK).touch(mode=0o600)
        if terminal:
            result = {
                "schema": self.probe.SCHEMA,
                "status": status,
                "iteration": max(1, len(records)),
                "bank_sha256": metadata["bank_sha256"],
                "seed": metadata["seed"],
            }
            self.probe._atomic_write_json(run / "result.json", result)
            self.probe._atomic_write_json(
                run / "combined_frontier.json", result
            )
        return run, metadata, records

    def _args(
        self, root, bank, sources, output_name="merged",
        structural_seed_path=None,
    ):
        return SimpleNamespace(
            bank=bank,
            source=sources,
            work_root=root / "unused-runs",
            output=root / output_name,
            seed=29,
            convex_structural_seeds=structural_seed_path,
        )

    def _child_can_lock(self, run: Path) -> bool:
        script = "\n".join((
            "import errno, fcntl, os, sys",
            "fd = os.open(sys.argv[1], os.O_RDONLY)",
            "try:",
            "    try:",
            "        fcntl.flock(fd, fcntl.LOCK_EX | fcntl.LOCK_NB)",
            "    except OSError as exc:",
            "        if exc.errno in (errno.EACCES, errno.EAGAIN):",
            "            raise SystemExit(3)",
            "        raise",
            "finally:",
            "    os.close(fd)",
        ))
        completed = subprocess.run(
            [
                sys.executable,
                "-c",
                script,
                str(run / self.probe.WORKDIR_LOCK),
            ],
            capture_output=True,
            text=True,
            timeout=5,
        )
        if completed.returncode not in (0, 3):
            self.fail(
                f"child lock probe failed: {completed.returncode}: "
                f"{completed.stderr}"
            )
        return completed.returncode == 0

    def test_union_rejects_conflicting_structural_provenance_for_same_pattern(self):
        with tempfile.TemporaryDirectory() as directory:
            union = self.transition._OrderedUnion(
                Path(directory) / "union.sqlite3"
            )
            first = {
                "pattern": {"0": [1, 2]},
                "clause": [-10],
                "provenance": {
                    "source_kind": "formalized_structural_core",
                    "contract": "first",
                },
            }
            same_semantics = copy.deepcopy(first)
            same_semantics["clause"] = [-20]
            conflicting = copy.deepcopy(first)
            conflicting["provenance"]["contract"] = "second"
            try:
                self.assertTrue(union.add(first, source_ordinal=0, source_seq=1))
                self.assertFalse(union.add(
                    same_semantics, source_ordinal=1, source_seq=1
                ))
                with self.assertRaisesRegex(
                    self.transition.TransitionError,
                    "conflicting theorem/order provenance",
                ):
                    union.add(conflicting, source_ordinal=2, source_seq=1)
                algebra = {
                    "pattern": {"0": [1, 2]},
                    "clause": [-30],
                    "provenance": {"embedding_kind": "motif_embedding_autos"},
                }
                with self.assertRaisesRegex(
                    self.transition.TransitionError,
                    "mixed algebra/structural provenance",
                ):
                    union.add(algebra, source_ordinal=3, source_seq=1)
            finally:
                union.close()

    def test_ordered_union_deduplicates_and_rebuilds_clauses(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            first, _metadata1, first_records = self._source(
                root, "first", [self.row], self.injections[:2]
            )
            second, _metadata2, second_records = self._source(
                root, "second", [self.row], self.injections[1:]
            )

            output, manifest = self.transition.transition(
                self._args(root, target, [first, second])
            )
            metadata = json.loads((output / "run_metadata.json").read_text())
            migration = metadata["migration_provenance"]
            self.assertEqual(migration["source_checkpoint_records"], 4)
            self.assertEqual(migration["union_dynamic_records"], 3)
            self.assertEqual(manifest["imported_dynamic_records"], 3)
            self.assertEqual(manifest["target_seed_collisions"], 0)
            self.assertFalse((output / "migration_union.sqlite3").exists())

            with ClosureCheckpoint.open(
                output / "checkpoint.sqlite3", metadata
            ) as checkpoint:
                stored = list(checkpoint.records())
                self.assertEqual(checkpoint.progress().iteration, 0)
                self.assertEqual(checkpoint.progress().status, "initialized")
            expected_patterns = [
                first_records[0]["pattern"],
                first_records[1]["pattern"],
                second_records[1]["pattern"],
            ]
            self.assertEqual(
                [record["pattern"] for record in stored], expected_patterns
            )
            # The transition does not blindly copy the later source clause:
            # each clause is derived in the merged insertion order.
            self.assertEqual(len({tuple(record["clause"]) for record in stored}), 3)

    def test_legacy_union_rebuilds_after_separate_structural_seed_orbits(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            seed_path, artifact, seed_raw = _structural_seed_fixture(
                self.probe, root
            )
            source, _metadata, source_records = self._source(
                root,
                "legacy-source",
                [self.row],
                self.injections[:2],
                runtime_fingerprint=self.transition.LEGACY_RUNTIME_FINGERPRINTS[0],
            )

            output, manifest = self.transition.transition(
                self._args(
                    root,
                    target,
                    [source],
                    "structural-target",
                    seed_path,
                )
            )
            metadata = json.loads((output / "run_metadata.json").read_text())
            self.assertEqual(
                (output / self.probe.STRUCTURAL_SEED_SNAPSHOT).read_bytes(),
                seed_raw,
            )
            self.assertEqual(
                (output / self.probe.STRUCTURAL_SOURCE_SNAPSHOT).read_bytes(),
                artifact.source_result_bytes,
            )
            self.assertEqual(
                (output / self.probe.STRUCTURAL_THEOREM_SNAPSHOT).read_bytes(),
                artifact.theorem_source_bytes,
            )
            self.assertEqual(
                metadata["convex_structural_seeds"][
                    "validated_profile_orbit_patterns"
                ],
                36,
            )
            self.assertEqual(
                manifest["seed_inventory"]["convex_structural"][
                    "profile_orbit_instances"
                ],
                36,
            )
            with ClosureCheckpoint.open(
                output / "checkpoint.sqlite3", metadata
            ) as checkpoint:
                stored = list(checkpoint.records())
                replayed_artifact = self.probe._load_structural_seed_snapshot(
                    output, metadata
                )
                # Full replay checks that the old dynamic record order was
                # retained while every clause was rebuilt after static seeds.
                self.probe._prepare_formula(
                    [self.row], checkpoint, replayed_artifact.patterns
                )
            self.assertEqual(
                [record["pattern"] for record in stored],
                [record["pattern"] for record in source_records],
            )

    def test_transition_refuses_to_drop_source_structural_seed_surface(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            seed_path, artifact, seed_raw = _structural_seed_fixture(
                self.probe, root
            )
            source, _metadata, _records = self._source(
                root,
                "structural-source",
                [self.row],
                self.injections[:1],
                structural_artifact=artifact,
                structural_raw=seed_raw,
            )
            with self.assertRaisesRegex(
                self.transition.TransitionError, "semantic superset"
            ):
                self.transition.transition(
                    self._args(root, target, [source], "dropped-seeds")
                )

            output, _manifest = self.transition.transition(
                self._args(
                    root,
                    target,
                    [source],
                    "preserved-seeds",
                    seed_path,
                )
            )
            self.assertTrue(output.is_dir())

    def test_transition_rejects_pending_or_drifted_theorem_evidence(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            seed_path, artifact, seed_raw = _structural_seed_fixture(
                self.probe, root
            )
            metadata = self.probe._structural_seed_metadata(
                artifact, seed_raw
            )
            orbits = self.transition._structural_orbit_keys(artifact)
            drifted = copy.deepcopy(metadata)
            drifted["theorem_contract_sha256"] = "0" * 64
            with self.assertRaisesRegex(
                self.transition.TransitionError, "drifts or downgrades"
            ):
                self.transition._require_structural_seed_preservation(
                    source=root / "source",
                    source_seed_metadata=metadata,
                    source_orbits=orbits,
                    target_seed_metadata=drifted,
                    target_orbits=orbits,
                    target_theorem_ids=frozenset(artifact.theorem_ids),
                )

            pending = self.probe.convex_structural_seeds.build_seed_artifact(
                root / "source_frontier.json"
            )
            pending_path = root / "pending.json"
            pending_path.write_bytes(
                json.dumps(pending, sort_keys=True, indent=2).encode() + b"\n"
            )
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            source, _metadata, _records = self._source(
                root, "legacy-for-pending", [self.row], self.injections[:1]
            )
            with self.assertRaisesRegex(
                self.probe.ProbeError, "require passed theorem-build evidence"
            ):
                self.transition.transition(
                    self._args(
                        root,
                        target,
                        [source],
                        "pending-target",
                        pending_path,
                    )
                )

    def test_rejects_metadata_snapshot_checkpoint_and_terminal_tampering(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))

            metadata_run, _metadata, _records = self._source(
                root, "bad-metadata", [self.row], self.injections[:1]
            )
            value = json.loads((metadata_run / "run_metadata.json").read_text())
            value["runtime_fingerprint"]["probe"] = "0" * 64
            self.probe._atomic_write_json(
                metadata_run / "run_metadata.json", value
            )
            with self.assertRaisesRegex(
                self.transition.TransitionError, "runtime fingerprint"
            ):
                self.transition.transition(
                    self._args(root, target, [metadata_run], "out-metadata")
                )

            snapshot_run, _metadata, _records = self._source(
                root, "bad-snapshot", [self.row], self.injections[:1]
            )
            with open(snapshot_run / "bank_snapshot.jsonl", "ab") as handle:
                handle.write(b"{}\n")
            with self.assertRaisesRegex(
                self.transition.TransitionError, "snapshot"
            ):
                self.transition.transition(
                    self._args(root, target, [snapshot_run], "out-snapshot")
                )

            checkpoint_run, _metadata, _records = self._source(
                root, "bad-checkpoint", [self.row], self.injections[:1]
            )
            connection = sqlite3.connect(checkpoint_run / "checkpoint.sqlite3")
            with connection:
                record_json = connection.execute(
                    "SELECT record_json FROM instances WHERE seq = 1"
                ).fetchone()[0]
                record = json.loads(record_json)
                record["clause"] = [-999999]
                connection.execute(
                    "UPDATE instances SET record_json = ? WHERE seq = 1",
                    (json.dumps(record, sort_keys=True, separators=(",", ":")),),
                )
            connection.close()
            with self.assertRaisesRegex(
                self.transition.TransitionError, "provenance/replay"
            ):
                self.transition.transition(
                    self._args(root, target, [checkpoint_run], "out-checkpoint")
                )

            terminal_run, _metadata, _records = self._source(
                root,
                "bad-terminal",
                [self.row],
                self.injections[:1],
                terminal=True,
            )
            result = json.loads((terminal_run / "result.json").read_text())
            result["iteration"] += 1
            self.probe._atomic_write_json(terminal_run / "result.json", result)
            with self.assertRaisesRegex(
                self.transition.TransitionError, "result disagrees"
            ):
                self.transition.transition(
                    self._args(root, target, [terminal_run], "out-terminal")
                )

    def test_requires_each_source_bank_as_exact_target_subset(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source, _metadata, _records = self._source(
                root, "source", [self.row], self.injections[:1]
            )
            target = root / "target-bank.jsonl"
            target.write_bytes(b"")
            with self.assertRaisesRegex(
                self.transition.TransitionError, "digest-preserving subset"
            ):
                self.transition.transition(
                    self._args(root, target, [source])
                )

    def test_published_run_passes_ordinary_resume_validation(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            source, _source_metadata, _records = self._source(
                root,
                "terminal-source",
                [self.row],
                self.injections[:1],
                terminal=True,
            )
            output, _manifest = self.transition.transition(
                self._args(root, target, [source])
            )
            metadata = json.loads((output / "run_metadata.json").read_text())
            source_manifest = metadata["migration_provenance"]["source_runs"][0]
            self.assertEqual(
                len(source_manifest["terminal_result_sha256"]), 64
            )
            self.assertIn(
                "combined_frontier.json",
                source_manifest["terminal_alias_sha256"],
            )

            observed = {}

            def accept_resume(
                workdir, checkpoint, execution_metadata, _args, bank_rows,
                structural_artifact,
                _started,
            ):
                observed["workdir"] = workdir
                observed["records"] = len(list(checkpoint.records()))
                observed["bank_rows"] = len(bank_rows)
                observed["metadata"] = execution_metadata
                observed["structural_artifact"] = structural_artifact
                return 37

            with mock.patch.object(
                self.probe, "_execute", side_effect=accept_resume
            ):
                code = self.probe._run(
                    SimpleNamespace(resume=output, seed=None)
                )
            self.assertEqual(code, 37)
            self.assertEqual(observed["workdir"], output)
            self.assertEqual(observed["records"], 1)
            self.assertEqual(observed["bank_rows"], 1)
            self.assertEqual(observed["metadata"]["seed"], 29)
            self.assertIsNone(observed["structural_artifact"])

    def test_all_source_locks_are_held_through_later_scan_and_publish(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            first, _metadata1, _records1 = self._source(
                root, "first-lock", [self.row], self.injections[:1]
            )
            second, _metadata2, _records2 = self._source(
                root, "second-lock", [self.row], self.injections[1:2]
            )
            original_scan = self.transition._scan_source
            original_publish = self.transition._publish_target
            observations = []

            def audited_scan(source, **kwargs):
                if kwargs["ordinal"] == 1:
                    observations.append(
                        ("later-scan", self._child_can_lock(first))
                    )
                return original_scan(source, **kwargs)

            def audited_publish(**kwargs):
                observations.append(
                    ("publish-first", self._child_can_lock(first))
                )
                observations.append(
                    ("publish-second", self._child_can_lock(second))
                )
                return original_publish(**kwargs)

            with (
                mock.patch.object(
                    self.transition, "_scan_source", side_effect=audited_scan
                ),
                mock.patch.object(
                    self.transition,
                    "_publish_target",
                    side_effect=audited_publish,
                ),
            ):
                output, _manifest = self.transition.transition(
                    self._args(root, target, [first, second], "locked-merged")
                )
            self.assertTrue(output.is_dir())
            self.assertEqual(
                observations,
                [
                    ("later-scan", False),
                    ("publish-first", False),
                    ("publish-second", False),
                ],
            )
            self.assertTrue(self._child_can_lock(first))
            self.assertTrue(self._child_can_lock(second))

    def test_crash_wal_source_is_copied_privately_and_left_byte_exact(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            source, _metadata, _records = self._source(
                root, "crash-wal", [self.row], self.injections[:1]
            )
            crash_script = "\n".join((
                "import os, sqlite3, sys",
                "connection = sqlite3.connect(sys.argv[1])",
                "connection.execute('PRAGMA journal_mode=WAL')",
                "connection.execute('PRAGMA wal_autocheckpoint=0')",
                "connection.execute('UPDATE progress SET elapsed_seconds = '",
                "                   'elapsed_seconds + 0.25')",
                "connection.commit()",
                "os._exit(0)",
            ))
            subprocess.run(
                [
                    sys.executable,
                    "-c",
                    crash_script,
                    str(source / "checkpoint.sqlite3"),
                ],
                check=True,
                timeout=10,
            )
            artifact_paths = [
                source / "checkpoint.sqlite3",
                source / "checkpoint.sqlite3-wal",
                source / "checkpoint.sqlite3-shm",
            ]
            for path in artifact_paths:
                self.assertTrue(path.is_file(), path)
            before = {path.name: path.read_bytes() for path in artifact_paths}

            output, _manifest = self.transition.transition(
                self._args(root, target, [source], "wal-merged")
            )
            after = {path.name: path.read_bytes() for path in artifact_paths}
            self.assertEqual(after, before)
            metadata = json.loads((output / "run_metadata.json").read_text())
            recorded = metadata["migration_provenance"]["source_runs"][0][
                "checkpoint_artifact_sha256"
            ]
            self.assertEqual(
                recorded,
                {
                    name: self.transition._sha256_bytes(raw)
                    for name, raw in before.items()
                },
            )
            self.assertFalse(any(
                path.name.startswith(".source-")
                for path in output.iterdir()
            ))

    def test_transition_preserves_and_rebuilds_dynamic_structural_records(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            source, source_metadata, source_records = self._source(
                root,
                "structural-dynamic-source",
                [self.row],
                (),
                structural_cube=STRUCTURAL_CUBE,
            )
            self.assertEqual(len(source_records), 36)
            self.assertTrue(all(
                self.probe._is_structural_checkpoint_record(record)
                for record in source_records
            ))

            output, manifest = self.transition.transition(
                self._args(root, target, [source], "structural-dynamic-target")
            )
            metadata = json.loads((output / "run_metadata.json").read_text())
            self.assertEqual(
                metadata["formalized_structural_oracle"]["contract_sha256"],
                source_metadata["formalized_structural_oracle"]["contract_sha256"],
            )
            self.assertEqual(manifest["imported_dynamic_records"], 36)
            catalog = self.probe._load_structural_oracle_snapshot(
                output, metadata
            )
            with ClosureCheckpoint.open(
                output / "checkpoint.sqlite3", metadata
            ) as checkpoint:
                stored = list(checkpoint.records())
                self.assertEqual(len(stored), 36)
                self.assertTrue(all(
                    self.probe._is_structural_checkpoint_record(record)
                    for record in stored
                ))
                self.probe._prepare_formula(
                    [self.row], checkpoint, (), catalog
                )


if __name__ == "__main__":
    unittest.main()
