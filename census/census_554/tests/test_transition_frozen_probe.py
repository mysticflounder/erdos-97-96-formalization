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

PERP_SUBSUMED_PATTERN = {
    "0": [4, 8],
    "1": [0, 6, 8],
    "2": [4, 8, 9],
    "6": [0, 2, 4],
    "8": [0, 2, 9],
    "9": [0, 1, 4],
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

    def _order_conditional_source(self, root: Path, name: str):
        run = root / name
        run.mkdir()
        rows = [self.row]
        raw = _bank_bytes(rows)
        (run / "bank_snapshot.jsonl").write_bytes(raw)
        (
            catalog,
            oracle_raw,
            oracle_sources,
            oracle_metadata,
        ) = self.probe._prepare_structural_oracle_snapshot()
        self.probe._write_structural_oracle_snapshot(
            run, oracle_raw, oracle_sources
        )
        metadata = {
            "schema": self.probe.SCHEMA,
            "bank_sha256": self.transition._sha256_bytes(raw),
            "bank_rows": len(rows),
            "seed": 17,
            "created_utc": "2026-07-11T00:00:00+00:00",
            "runtime_fingerprint": self.probe._runtime_fingerprint(),
            "convex_structural_seeds": None,
            "formalized_structural_oracle": oracle_metadata,
        }
        self.probe._atomic_write_json(run / "run_metadata.json", metadata)

        cube = self.probe.formalized_structural_oracle.normalize_pattern(
            STRUCTURAL_CUBE, require_full_cube=True
        )
        detection = None
        for order in self.probe.separation_encoding.valid_orders(cube):
            for family in self.probe.formalized_structural_oracle.ORDERED_FAMILIES:
                if self.probe.formalized_structural_oracle.detect_stage(
                    cube, family.stage, order
                ) is not None:
                    detection = (
                        self.probe.formalized_structural_oracle.build_detection(
                            cube, family.stage, order
                        )
                    )
                    break
            if detection is not None:
                break
        self.assertIsNotNone(detection)
        orbit = self.probe.formalized_structural_oracle.profile_orbit_ordered(
            cube, [detection]
        )
        with ClosureCheckpoint.create(
            run / "checkpoint.sqlite3", metadata
        ) as checkpoint:
            instance, separation, _reps, seen, _seed_count = (
                self.probe._prepare_formula(rows, checkpoint, (), catalog)
            )
            records = self.probe._commit_structural_orbit(
                instance,
                separation,
                seen,
                catalog,
                source_pattern=cube,
                cut_scope="order-conditional",
                orbit=orbit,
            )
            checkpoint.append_batch(
                records,
                iteration=1,
                elapsed_seconds=1.5,
                status="budget",
            )
        (run / self.probe.WORKDIR_LOCK).touch(mode=0o600)
        self.assertTrue(records)
        self.assertTrue(all(
            record["provenance"]["cut_scope"] == "order-conditional"
            for record in records
        ))
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
            perp_subsumption_cache=None,
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
                    "oracle_contract_sha256": "a" * 64,
                    "contract": "first",
                },
            }
            same_semantics = copy.deepcopy(first)
            same_semantics["clause"] = [-20]
            same_semantics["provenance"]["oracle_contract_sha256"] = "b" * 64
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

    def test_structural_oracle_extension_preserves_and_retargets_old_records(self):
        (
            target_catalog,
            _target_raw,
            _target_sources,
            target_metadata,
        ) = self.probe._prepare_structural_oracle_snapshot()
        source_metadata = copy.deepcopy(target_metadata)
        added_family = "equality-six-point-two-pair-collision.v1"
        source_metadata["eligible_family_ids"].remove(added_family)
        source_metadata["contract_sha256"] = "1" * 64
        source_metadata["theorem_sources"] = [
            entry for entry in source_metadata["theorem_sources"]
            if not entry["path"].endswith("SixPointTwoPairCollision.lean")
        ]
        for entry in source_metadata["theorem_sources"]:
            if entry["path"] == self.transition.STRUCTURAL_ORACLE_AGGREGATE_SOURCE:
                entry["sha256"] = "2" * 64
        for entry in source_metadata["build_artifacts"]:
            entry["sha256"] = "3" * 64

        self.transition._require_structural_oracle_preservation(
            source=Path("old-oracle"),
            source_metadata=source_metadata,
            target_metadata=target_metadata,
        )

        drifted = copy.deepcopy(target_metadata)
        for entry in drifted["theorem_sources"]:
            if entry["path"].endswith("EqualityCore.lean"):
                entry["sha256"] = "4" * 64
        with self.assertRaisesRegex(
            self.transition.TransitionError, "theorem evidence drifts"
        ):
            self.transition._require_structural_oracle_preservation(
                source=Path("old-oracle"),
                source_metadata=source_metadata,
                target_metadata=drifted,
            )

        pattern = {
            2: [0, 1, 5, 6],
            3: [0, 1, 5, 6],
            4: [0, 1, 5, 6],
        }
        stage = "equality-perpendicular-bisector-convex"
        detection = self.probe.formalized_structural_oracle.build_detection(
            pattern, stage
        )
        old_catalog = dict(target_catalog)
        old_catalog["contract_sha256"] = source_metadata["contract_sha256"]
        record = {
            "pattern": self.probe._json_pattern(pattern),
            "clause": [-1],
            "provenance": self.probe._structural_record_provenance(
                catalog=old_catalog,
                cut_scope="unconditional",
                source_pattern=pattern,
                support_map=[[point, point] for point in sorted(
                    self.probe.combinatorics.support(pattern)
                )],
                detections=[detection],
            ),
        }
        retargeted, rewritten = (
            self.transition._retarget_structural_record_contract(
                record, target_catalog
            )
        )
        self.assertTrue(rewritten)
        self.assertEqual(
            retargeted["provenance"]["oracle_contract_sha256"],
            target_catalog["contract_sha256"],
        )
        checked, scope, detections = self.probe._structural_checkpoint_info(
            retargeted, target_catalog
        )
        self.assertEqual(
            self.probe.combinatorics.serialize_pattern(checked),
            self.probe.combinatorics.serialize_pattern(pattern),
        )
        self.assertEqual(scope, "unconditional")
        self.assertEqual(len(detections), 1)

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

            args = self._args(root, target, [first, second])
            args.refinement_order = "structural-first"
            output, manifest = self.transition.transition(args)
            metadata = json.loads((output / "run_metadata.json").read_text())
            self.assertEqual(metadata["refinement_order"], "structural-first")
            self.assertFalse(metadata["perp_bisector_template_preseed"])
            self.assertEqual(manifest["refinement_order"], "structural-first")
            self.assertFalse(manifest["perp_bisector_template_preseed"])
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

    def test_exact_live_legacy_fingerprint_is_accepted_but_drift_is_rejected(self):
        expected_live = {
            "probe": "770a3281d5566eba403352104a26c1a4433f0fc92e4211a8903fc6ff356f6e59",
            "profile": "11a2e0c4a8520c77d2eddf2da5907102f4c73050c5e5c8459caf8ad1d7a6e89b",
            "sat_cover": "68ff60a7ea5e9f1ce5455ee3575f8f45230bec1d193404d679b76aa8d7358b9c",
            "combinatorics": "7dbff611c58be4614f0496aba0c67e33be669155e1ea28f8a29ab23bf59b01e0",
            "closure_checkpoint": "cc53c2f4dc50d950187537a77347f5c40ce81ff1151fadf5987dd7d1a18752ce",
            "convex_structural_seeds": "b32d915189b196964563f1719157f3519691f3ff2e1f2d3ee17885b82bd1f766",
            "formalized_structural_oracle": "693259f73697a93dca9b22fae4e860ec217c4749bd66649158dc5136337c487e",
            "metric_structural_detectors": "d7a727f2130cc28f5d7c5d92af9e58a6e9f40179aa2490e5c0eab5b890e2382e",
            "separation_encoding": "7fcd0ec01d7c429e72749a18913ace06345d46f4c2506e0f192e8141de0cb98d",
        }
        self.assertIn(
            expected_live, self.transition.LEGACY_RUNTIME_FINGERPRINTS
        )
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            accepted, _metadata, _records = self._source(
                root,
                "accepted-live-legacy",
                [self.row],
                self.injections[:1],
                runtime_fingerprint=expected_live,
            )
            output, _manifest = self.transition.transition(
                self._args(
                    root, target, [accepted], "accepted-live-legacy-target"
                )
            )
            self.assertTrue(output.is_dir())

            altered = dict(expected_live)
            altered["probe"] = "0" * 64
            rejected, _metadata, _records = self._source(
                root,
                "rejected-live-legacy",
                [self.row],
                self.injections[:1],
                runtime_fingerprint=altered,
            )
            with self.assertRaisesRegex(
                self.transition.TransitionError, "runtime fingerprint"
            ):
                self.transition.transition(
                    self._args(
                        root,
                        target,
                        [rejected],
                        "rejected-live-legacy-target",
                    )
                )

    def test_structural_first_rejects_conditional_source_but_bank_first_allows_it(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            source, _metadata, records = self._order_conditional_source(
                root, "conditional-source"
            )

            structural_args = self._args(
                root, target, [source], "structural-first-rejected"
            )
            structural_args.refinement_order = "structural-first"
            with self.assertRaisesRegex(
                self.transition.TransitionError,
                "structural-first target cannot inherit",
            ):
                self.transition.transition(structural_args)

            bank_args = self._args(
                root, target, [source], "bank-first-accepted"
            )
            bank_args.refinement_order = "bank-first"
            output, manifest = self.transition.transition(bank_args)
            self.assertEqual(manifest["imported_dynamic_records"], len(records))
            metadata = json.loads((output / "run_metadata.json").read_text())
            with ClosureCheckpoint.open(
                output / "checkpoint.sqlite3", metadata
            ) as checkpoint:
                stored = list(checkpoint.records())
            self.assertEqual(len(stored), len(records))
            self.assertTrue(all(
                record["provenance"]["cut_scope"] == "order-conditional"
                for record in stored
            ))

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

    def test_cached_target_snapshots_cache_and_reopens_exactly(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            cached_row = {
                "pid": "pat_cached",
                "pattern": PERP_SUBSUMED_PATTERN,
                "cert": "certs/pat_cached.json",
            }
            target_rows = [self.row, cached_row]
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes(target_rows))
            source, _source_metadata, _records = self._source(
                root,
                "cache-source",
                [self.row],
                self.injections[:1],
            )
            cache_path = root / "perp-cache.json"
            digest = self.transition.perp_cache.write_cache_artifact(
                self.probe, target, cache_path
            )
            args = self._args(root, target, [source], "cached-target")
            args.refinement_order = "structural-first"
            args.perp_subsumption_cache = cache_path

            with mock.patch.object(
                self.transition.cached_probe,
                "_EXPECTED_CACHE_SHA256",
                digest,
            ):
                output, manifest = self.transition.transition(args)
                metadata = json.loads(
                    (output / "run_metadata.json").read_text()
                )
                cache_metadata = metadata["perp_subsumption_cache"]
                self.assertEqual(cache_metadata["sha256"], digest)
                self.assertEqual(
                    cache_metadata["snapshot"],
                    self.transition.perp_cache.SNAPSHOT,
                )
                self.assertEqual(
                    (output / self.transition.perp_cache.SNAPSHOT).read_bytes(),
                    cache_path.read_bytes(),
                )
                self.assertEqual(
                    manifest["perp_subsumption_cache"], cache_metadata
                )
                self.assertEqual(
                    metadata["runtime_fingerprint"],
                    self.transition.cached_probe._runtime_fingerprint(),
                )

                catalog = self.probe._load_structural_oracle_snapshot(
                    output, metadata
                )
                with ClosureCheckpoint.open(
                    output / "checkpoint.sqlite3", metadata
                ) as checkpoint:
                    prepared = self.transition.cached_probe._prepare_formula(
                        target_rows, checkpoint, (), catalog
                    )
                    instance = prepared[0]
                    self.assertEqual(
                        instance.seed_inventory["algebra_bank"][
                            "replacement_cache_sha256"
                        ],
                        digest,
                    )

                snapshot = output / self.transition.perp_cache.SNAPSHOT
                snapshot.write_bytes(snapshot.read_bytes() + b" ")
                with ClosureCheckpoint.open(
                    output / "checkpoint.sqlite3", metadata
                ) as checkpoint:
                    with self.assertRaisesRegex(
                        self.probe.ProbeError, "cache rejected"
                    ):
                        self.transition.cached_probe._prepare_formula(
                            target_rows, checkpoint, (), catalog
                        )

    def test_structural_first_target_resume_requires_matching_policy(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = root / "target-bank.jsonl"
            target.write_bytes(_bank_bytes([self.row]))
            source, _source_metadata, _records = self._source(
                root,
                "structural-first-source",
                [self.row],
                self.injections[:1],
            )
            transition_args = self._args(
                root, target, [source], "structural-first-target"
            )
            transition_args.refinement_order = "structural-first"
            output, _manifest = self.transition.transition(transition_args)

            mismatch = SimpleNamespace(
                resume=output,
                seed=None,
                refinement_order="bank-first",
                perp_bisector_template_preseed=False,
                convex_structural_seeds=None,
            )
            with self.assertRaisesRegex(
                self.probe.ProbeError,
                "refinement-order does not match",
            ):
                self.probe._run(mismatch)

            observed = {}

            def accept_resume(
                workdir, checkpoint, execution_metadata, _args, bank_rows,
                structural_artifact, _started,
            ):
                observed["workdir"] = workdir
                observed["records"] = len(list(checkpoint.records()))
                observed["metadata"] = execution_metadata
                observed["bank_rows"] = len(bank_rows)
                observed["structural_artifact"] = structural_artifact
                return 37

            matching = SimpleNamespace(
                resume=output,
                seed=None,
                refinement_order="structural-first",
                perp_bisector_template_preseed=False,
                convex_structural_seeds=None,
            )
            with mock.patch.object(
                self.probe, "_execute", side_effect=accept_resume
            ):
                code = self.probe._run(matching)
            self.assertEqual(code, 37)
            self.assertEqual(observed["workdir"], output)
            self.assertEqual(observed["records"], 1)
            self.assertEqual(observed["bank_rows"], 1)
            self.assertEqual(
                observed["metadata"]["refinement_order"],
                "structural-first",
            )
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
