from __future__ import annotations

import hashlib
import io
import json
import os
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
from unittest import mock

from census.card_head import exact12_v14_journal_migrate as migration

JOB_SHA256 = "a" * 64
OLD_DETECTOR_SHA256 = "b" * 64
CELL_INDEX = 7


class Exact12V14JournalMigrationTest(unittest.TestCase):
    def _record(
        self,
        *,
        index: int,
        parent_sha256: str,
        detector_sha256: str = OLD_DETECTOR_SHA256,
    ) -> dict[str, object]:
        certificate = {"token": index}
        cube = {"0": []}
        body: dict[str, object] = {
            "schema": migration.RECORD_SCHEMA,
            "index": index,
            "parent_sha256": parent_sha256,
            "job_sha256": JOB_SHA256,
            "detector_contract_sha256": detector_sha256,
            "cell_index": CELL_INDEX,
            "detector_contract": migration.DETECTOR_CONTRACT,
            "certificate_kind": "test-certificate",
            "certificate_schema": "test-schema",
            "detector_stage": "test-stage",
            "certificate": certificate,
            "certificate_sha256": migration._sha256_json(certificate),
            "source_order_bank_index": None,
            "learned_clause": [-1 - index],
            "cube": cube,
            "cube_sha256": migration._sha256_json(cube),
            "positive_variables": [],
            "assignment_sha256": migration._sha256_json([]),
        }
        return {**body, "record_sha256": migration._sha256_json(body)}

    @staticmethod
    def _write(path: Path, records: list[dict[str, object]]) -> bytes:
        payload = b"".join(
            migration._canonical_json_bytes(record) + b"\n" for record in records
        )
        path.write_bytes(payload)
        return payload

    def _source(self, directory: Path) -> tuple[Path, bytes, list[dict[str, object]]]:
        source = directory / "source.jsonl"
        first = self._record(index=0, parent_sha256=JOB_SHA256)
        second = self._record(index=1, parent_sha256=first["record_sha256"])
        records = [first, second]
        return source, self._write(source, records), records

    def _patch_runtime(self, replay: object):
        detector_payload = b"x"
        detector_manifest = [
            {
                "path": "detector.py",
                "bytes": len(detector_payload),
                "sha256": hashlib.sha256(detector_payload).hexdigest(),
            }
        ]
        proof_bank = {
            "detector_manifest": detector_manifest,
            "lean_source_manifest": [],
            "bank": "stable",
        }
        patches = mock.patch.multiple(
            migration,
            build_manifest=mock.DEFAULT,
            build_bound_job=mock.DEFAULT,
            build_source_order_bank=mock.DEFAULT,
            json_sha256=mock.DEFAULT,
            instantiate_validated_bound_job=mock.DEFAULT,
            _detector_manifest=mock.DEFAULT,
            _authenticated_source_bytes=mock.DEFAULT,
            build_source_order_bank_from_authenticated_sources=mock.DEFAULT,
            replay_journal=mock.DEFAULT,
        )
        values = patches.start()
        values["build_manifest"].return_value = object()
        values["build_bound_job"].return_value = {"job": "current"}
        values["json_sha256"].return_value = JOB_SHA256
        values["instantiate_validated_bound_job"].return_value = SimpleNamespace(
            instance=object()
        )
        values["build_source_order_bank"].return_value = proof_bank
        values["_detector_manifest"].return_value = detector_manifest
        values["_authenticated_source_bytes"].return_value = {
            "detector.py": detector_payload
        }
        values[
            "build_source_order_bank_from_authenticated_sources"
        ].return_value = proof_bank
        values["replay_journal"].side_effect = replay
        self.addCleanup(patches.stop)
        return values, migration._sha256_json(detector_manifest)

    def test_success_replays_complete_candidate_and_rewrites_metadata_only(
        self,
    ) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source, original, old_records = self._source(directory)
            output = directory / "migrated.jsonl"
            replay_records: list[dict[str, object]] = []

            def replay(_root, _instance, journal, **kwargs):
                self.assertIsNone(_root)
                self.assertEqual(kwargs["source_order_bank"]["bank"], "stable")
                replay_records.extend(
                    json.loads(line) for line in journal.read().splitlines()
                )
                return (
                    len(replay_records),
                    replay_records[-1]["record_sha256"],
                    frozenset(),
                )

            values, new_detector_sha256 = self._patch_runtime(replay)
            result = migration.migrate(directory, source, output, CELL_INDEX)

            self.assertEqual(source.read_bytes(), original)
            self.assertFalse(output.with_suffix(".jsonl.candidate").exists())
            self.assertEqual(result["records"], 2)
            self.assertTrue(result["current_source_replayed"])
            self.assertTrue(result["source_snapshot_replayed"])
            self.assertTrue(result["candidate_retired"])
            self.assertTrue(result["replay_inputs_in_memory"])
            self.assertEqual(result["output_bytes"], len(output.read_bytes()))
            self.assertEqual(
                result["output_sha256"], hashlib.sha256(output.read_bytes()).hexdigest()
            )
            self.assertTrue(result["output_parent_verified_at_publication"])
            self.assertEqual(output.stat().st_mode & 0o222, 0)
            values["replay_journal"].assert_called_once()
            replay_root = values["replay_journal"].call_args.args[0]
            self.assertIsNone(replay_root)
            self.assertIsInstance(
                values["replay_journal"].call_args.args[2], io.BytesIO
            )
            self.assertEqual(
                values["replay_journal"].call_args.kwargs["source_order_bank"]["bank"],
                "stable",
            )
            self.assertEqual(
                values["replay_journal"].call_args.kwargs["cell_index"], CELL_INDEX
            )
            self.assertEqual(
                values["replay_journal"].call_args.kwargs["detector_contract_sha256"],
                new_detector_sha256,
            )

            migrated = [json.loads(line) for line in output.read_text().splitlines()]
            self.assertEqual(len(migrated), len(old_records))
            for old, new in zip(old_records, migrated):
                changed = {key for key in old if old[key] != new[key]}
                self.assertTrue(changed <= migration._REWRITTEN_FIELDS)
                for key in set(old) - migration._REWRITTEN_FIELDS:
                    self.assertEqual(new[key], old[key])
            self.assertEqual(migrated[0]["parent_sha256"], JOB_SHA256)
            self.assertEqual(
                migrated[0]["detector_contract_sha256"], new_detector_sha256
            )
            self.assertEqual(migrated[1]["parent_sha256"], migrated[0]["record_sha256"])

    def test_tampered_old_chain_is_rejected_before_candidate_or_replay(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source, original, records = self._source(directory)
            records[1]["parent_sha256"] = "e" * 64
            tampered = self._write(source, records)
            replay = mock.Mock()
            values, _ = self._patch_runtime(replay)

            with self.assertRaisesRegex(migration.JournalMigrationError, "old-chain"):
                migration.migrate(
                    directory, source, directory / "output.jsonl", CELL_INDEX
                )

            self.assertEqual(source.read_bytes(), tampered)
            self.assertNotEqual(source.read_bytes(), original)
            self.assertFalse((directory / "output.jsonl").exists())
            values["replay_journal"].assert_not_called()

    def test_same_byte_source_path_replacement_is_rejected(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source, original, _ = self._source(directory)
            authenticate = migration._authenticate_source

            def authenticate_then_replace(*args, **kwargs):
                result = authenticate(*args, **kwargs)
                replacement = directory / "replacement.jsonl"
                replacement.write_bytes(original)
                replacement.replace(source)
                return result

            values, _ = self._patch_runtime(mock.Mock())
            output = directory / "output.jsonl"
            with (
                mock.patch.object(
                    migration,
                    "_authenticate_source",
                    side_effect=authenticate_then_replace,
                ),
                self.assertRaisesRegex(
                    migration.JournalMigrationError, "source journal path changed"
                ),
            ):
                migration.migrate(directory, source, output, CELL_INDEX)

            self.assertEqual(source.read_bytes(), original)
            self.assertFalse(output.exists())
            values["replay_journal"].assert_not_called()

    def test_symlink_source_is_rejected(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source, _, _ = self._source(directory)
            symlink = directory / "source-link.jsonl"
            symlink.symlink_to(source)
            values, _ = self._patch_runtime(mock.Mock())

            with self.assertRaisesRegex(
                migration.JournalMigrationError, "source is not a regular file"
            ):
                migration.migrate(
                    directory, symlink, directory / "output.jsonl", CELL_INDEX
                )

            values["replay_journal"].assert_not_called()

    def test_authenticated_source_bundle_rejects_nested_symlink(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            repo = directory / "repo"
            outside = directory / "outside"
            repo.mkdir()
            outside.mkdir()
            payload = b"outside detector\n"
            (outside / "detector.py").write_bytes(payload)
            (repo / "link").symlink_to(outside, target_is_directory=True)
            manifest = [
                {
                    "path": "link/detector.py",
                    "bytes": len(payload),
                    "sha256": hashlib.sha256(payload).hexdigest(),
                }
            ]

            with self.assertRaisesRegex(
                migration.JournalMigrationError, "symlink-free directory"
            ):
                migration._authenticated_source_bytes(repo, manifest)

    def test_authenticated_source_bundle_retains_exact_immutable_bytes(self) -> None:
        with TemporaryDirectory() as temporary:
            repo = Path(temporary).resolve()
            source = repo / "detector.py"
            original = b"detector v1\n"
            source.write_bytes(original)
            manifest = [
                {
                    "path": source.name,
                    "bytes": len(original),
                    "sha256": hashlib.sha256(original).hexdigest(),
                }
            ]

            authenticated = migration._authenticated_source_bytes(repo, manifest)
            source.write_bytes(b"detector v2\n")

            self.assertEqual(authenticated, {source.name: original})
            self.assertIsInstance(authenticated[source.name], bytes)

    def test_platform_without_nofollow_fails_closed(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source, _, _ = self._source(directory)

            with (
                mock.patch.object(migration.os, "O_NOFOLLOW", 0),
                self.assertRaisesRegex(
                    migration.JournalMigrationError, "lacks required"
                ),
            ):
                migration.migrate(
                    directory, source, directory / "output.jsonl", CELL_INDEX
                )

    def test_source_fifo_is_rejected_without_blocking(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source = directory / "source.jsonl"
            os.mkfifo(source)

            with self.assertRaisesRegex(
                migration.JournalMigrationError, "source is not a regular file"
            ):
                migration._open_regular_source(source)

    def test_symlink_output_parent_is_rejected_before_runtime_work(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source, _, _ = self._source(directory)
            real_output_parent = directory / "real-output"
            real_output_parent.mkdir()
            output_parent = directory / "output-link"
            output_parent.symlink_to(real_output_parent, target_is_directory=True)
            values, _ = self._patch_runtime(mock.Mock())

            with self.assertRaisesRegex(
                migration.JournalMigrationError, "symlink-free directory"
            ):
                migration.migrate(
                    directory,
                    source,
                    output_parent / "output.jsonl",
                    CELL_INDEX,
                )

            self.assertFalse((real_output_parent / "output.jsonl").exists())
            values["build_manifest"].assert_not_called()

    def test_inconsistent_detector_hash_is_rejected_even_when_record_is_resealed(
        self,
    ) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source, original, records = self._source(directory)
            records[1]["detector_contract_sha256"] = "f" * 64
            body = dict(records[1])
            body.pop("record_sha256")
            records[1]["record_sha256"] = migration._sha256_json(body)
            self._write(source, records)
            values, _ = self._patch_runtime(mock.Mock())

            with self.assertRaisesRegex(migration.JournalMigrationError, "old-chain"):
                migration.migrate(
                    directory, source, directory / "output.jsonl", CELL_INDEX
                )

            self.assertNotEqual(source.read_bytes(), original)
            self.assertFalse((directory / "output.jsonl").exists())
            values["replay_journal"].assert_not_called()

    def test_current_source_replay_failure_removes_candidate_and_preserves_input(
        self,
    ) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source, original, _ = self._source(directory)

            def reject_replay(*_args, **_kwargs):
                raise ValueError("certificate/witness/clause replay rejected")

            values, _ = self._patch_runtime(reject_replay)
            output = directory / "output.jsonl"
            with self.assertRaisesRegex(
                migration.JournalMigrationError, "migration failed"
            ):
                migration.migrate(directory, source, output, CELL_INDEX)

            self.assertEqual(source.read_bytes(), original)
            self.assertFalse(output.exists())
            self.assertFalse(output.with_suffix(".jsonl.candidate").exists())
            values["replay_journal"].assert_called_once()

    def test_authenticated_snapshot_isolated_from_later_source_mutation(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source, original, _ = self._source(directory)
            authenticate = migration._authenticate_source

            def authenticate_then_change(*args, **kwargs):
                result = authenticate(*args, **kwargs)
                source.write_bytes(original.replace(b'{"', b'{ "', 1))
                return result

            replayed: list[dict[str, object]] = []

            def replay(_root, _instance, journal, **_kwargs):
                self.assertIsNone(_root)
                self.assertIsInstance(journal, io.BytesIO)
                replayed.extend(
                    json.loads(line) for line in journal.read().splitlines()
                )
                return len(replayed), replayed[-1]["record_sha256"], frozenset()

            values, _ = self._patch_runtime(replay)
            output = directory / "output.jsonl"
            with mock.patch.object(
                migration, "_authenticate_source", side_effect=authenticate_then_change
            ):
                result = migration.migrate(directory, source, output, CELL_INDEX)

            self.assertEqual(result["records"], 2)
            self.assertNotEqual(source.read_bytes(), original)
            self.assertTrue(output.is_file())
            values["replay_journal"].assert_called_once()

    def test_existing_output_is_never_overwritten(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            source, original, _ = self._source(directory)
            output = directory / "output.jsonl"
            output.write_bytes(b"keep-output\n")
            values, _ = self._patch_runtime(mock.Mock())

            with self.assertRaisesRegex(
                migration.JournalMigrationError, "output journal"
            ):
                migration.migrate(directory, source, output, CELL_INDEX)
            self.assertEqual(output.read_bytes(), b"keep-output\n")
            self.assertEqual(source.read_bytes(), original)
            values["build_manifest"].assert_not_called()

    def test_publication_durably_copies_candidate_without_overwrite(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            output = directory / "output.jsonl"
            parent_descriptor = migration._open_directory(directory)
            parent_info = migration.os.fstat(parent_descriptor)
            candidate_bytes = b"authenticated\n"
            try:
                migration._publish_without_overwrite(
                    io.BytesIO(candidate_bytes),
                    output,
                    parent_descriptor,
                    parent_identity=(parent_info.st_dev, parent_info.st_ino),
                    expected_bytes=len(candidate_bytes),
                    expected_sha256=hashlib.sha256(candidate_bytes).hexdigest(),
                )
            finally:
                migration.os.close(parent_descriptor)

            self.assertEqual(output.read_bytes(), b"authenticated\n")
            self.assertEqual(output.stat().st_mode & 0o222, 0)

    def test_output_mutation_during_fsync_is_rejected(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            output = directory / "output.jsonl"
            candidate_bytes = b"authenticated\n"
            parent_descriptor = migration._open_directory(directory)
            parent_info = migration.os.fstat(parent_descriptor)
            real_fsync = migration.os.fsync
            mutated = False

            def mutate_during_output_sync(descriptor: int) -> None:
                nonlocal mutated
                real_fsync(descriptor)
                if descriptor != parent_descriptor and not mutated:
                    mutated = True
                    output.write_bytes(b"changed\n")

            try:
                with (
                    mock.patch.object(
                        migration.os, "fsync", side_effect=mutate_during_output_sync
                    ),
                    self.assertRaisesRegex(
                        migration.JournalMigrationError, "unverified output residue"
                    ),
                ):
                    migration._publish_without_overwrite(
                        io.BytesIO(candidate_bytes),
                        output,
                        parent_descriptor,
                        parent_identity=(parent_info.st_dev, parent_info.st_ino),
                        expected_bytes=len(candidate_bytes),
                        expected_sha256=hashlib.sha256(candidate_bytes).hexdigest(),
                    )
            finally:
                migration.os.close(parent_descriptor)

            self.assertTrue(mutated)
            self.assertEqual(output.read_bytes(), b"changed\n")

    def test_publication_failure_never_unlinks_a_raced_name(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            output = directory / "output.jsonl"
            parent_descriptor = migration._open_directory(directory)
            parent_info = migration.os.fstat(parent_descriptor)
            candidate_bytes = b"authenticated\n"
            real_fsync = migration.os.fsync
            failed_parent_sync = False

            def fail_first_parent_sync(descriptor: int) -> None:
                nonlocal failed_parent_sync
                if descriptor == parent_descriptor and not failed_parent_sync:
                    failed_parent_sync = True
                    raise OSError("simulated directory sync failure")
                real_fsync(descriptor)

            try:
                with (
                    mock.patch.object(
                        migration.os, "fsync", side_effect=fail_first_parent_sync
                    ),
                    self.assertRaisesRegex(
                        migration.JournalMigrationError, "unverified output residue"
                    ),
                ):
                    migration._publish_without_overwrite(
                        io.BytesIO(candidate_bytes),
                        output,
                        parent_descriptor,
                        parent_identity=(parent_info.st_dev, parent_info.st_ino),
                        expected_bytes=len(candidate_bytes),
                        expected_sha256=hashlib.sha256(candidate_bytes).hexdigest(),
                    )
            finally:
                migration.os.close(parent_descriptor)

            self.assertEqual(output.read_bytes(), candidate_bytes)

    def test_output_parent_rename_is_rejected_after_publication(self) -> None:
        with TemporaryDirectory() as temporary:
            directory = Path(temporary).resolve()
            output_parent = directory / "output-parent"
            moved_parent = directory / "moved-parent"
            output_parent.mkdir()
            output = output_parent / "output.jsonl"
            candidate_bytes = b"authenticated\n"
            parent_descriptor = migration._open_directory(output_parent)
            parent_info = migration.os.fstat(parent_descriptor)
            real_fsync = migration.os.fsync
            renamed = False

            def rename_on_parent_sync(descriptor: int) -> None:
                nonlocal renamed
                real_fsync(descriptor)
                if descriptor == parent_descriptor and not renamed:
                    renamed = True
                    output_parent.rename(moved_parent)
                    output_parent.mkdir()

            try:
                with (
                    mock.patch.object(
                        migration.os, "fsync", side_effect=rename_on_parent_sync
                    ),
                    self.assertRaisesRegex(
                        migration.JournalMigrationError, "unverified output residue"
                    ),
                ):
                    migration._publish_without_overwrite(
                        io.BytesIO(candidate_bytes),
                        output,
                        parent_descriptor,
                        parent_identity=(parent_info.st_dev, parent_info.st_ino),
                        expected_bytes=len(candidate_bytes),
                        expected_sha256=hashlib.sha256(candidate_bytes).hexdigest(),
                    )
            finally:
                migration.os.close(parent_descriptor)

            self.assertTrue(renamed)
            self.assertFalse(output.exists())
            self.assertEqual((moved_parent / output.name).read_bytes(), candidate_bytes)


if __name__ == "__main__":
    unittest.main()
