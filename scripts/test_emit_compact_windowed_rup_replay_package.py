# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

import emit_compact_windowed_rup_replay_package as subject
import materialize_checkpointed_rup as checkpointed
import materialize_windowed_rup as windowed

CNF = "p cnf 2 3\n1 2 0\n-1 0\n-2 0\n"
PURE_RUP = "4 2 0 1 2 0\n1 d 1 2 0\n5 0 3 4 0\n"
LEAN_NAMESPACE = "Problem97.Generated.SourceAtCommon"
MODULE_PREFIX = "Erdos9796Proof.P97.Generated.SourceAtCommon"


def windowed_fixture(root: Path) -> Path:
    source = root / "source"
    source.mkdir(parents=True)
    cnf_path = source / "input.cnf"
    lrat_path = source / "input.lrat"
    cnf_path.write_text(CNF, encoding="ascii")
    lrat_path.write_text(PURE_RUP, encoding="ascii")
    source_manifest = {
        "schema": checkpointed.PURE_RUP_SOURCE_SCHEMA,
        "artifacts": {
            "cnf": checkpointed.artifact_record(
                cnf_path,
                relative_path=cnf_path.name,
            ),
            "normalized_lrat": checkpointed.artifact_record(
                lrat_path,
                relative_path=lrat_path.name,
            ),
        },
    }
    source_manifest_path = source / "source-manifest.json"
    source_manifest_path.write_text(
        json.dumps(source_manifest, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    manifest, manifest_record, cnf_path, lrat_path = (
        checkpointed.load_source_manifest(source_manifest_path)
    )
    checkpointed_dir = root / "checkpointed"
    checkpointed.materialize(
        cnf_path=cnf_path,
        lrat_path=lrat_path,
        output_dir=checkpointed_dir,
        second_shard_first_addition=5,
        source_manifest=manifest,
        source_manifest_record=manifest_record,
    )
    output = root / "windowed"
    windowed.materialize_windows(
        package_dir=checkpointed_dir,
        output_dir=output,
        max_actions=1,
        max_lrat_bytes=64,
    )
    return output


def emit_fixture(
    root: Path,
    *,
    lean_namespace: str = LEAN_NAMESPACE,
    module_prefix: str = MODULE_PREFIX,
    output_name: str = "compact",
) -> tuple[Path, dict[str, object]]:
    package = windowed_fixture(root)
    output = root / output_name
    manifest = subject.emit(
        package,
        output,
        lean_namespace=lean_namespace,
        module_prefix=module_prefix,
    )
    return output, manifest


def rehash_manifest(output: Path, payload: dict[str, object]) -> None:
    payload["compact_replay_package_sha256"] = (
        subject.compute_compact_replay_package_digest(payload)
    )
    (output / subject.MANIFEST_NAME).write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )


class EmitCompactWindowedRupReplayPackageTest(unittest.TestCase):
    def test_tiny_no_solver_end_to_end_uses_distinct_lean_identities(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output, emitted = emit_fixture(root)
            verified = subject.verify_compact_replay_package(output)
            self.assertEqual(
                emitted["compact_replay_package_sha256"],
                verified["compact_replay_package_sha256"],
            )
            self.assertEqual(verified["counts"]["windows"], 3)
            self.assertEqual(verified["source_counts"]["checkpoints"], 4)
            self.assertEqual(verified["counts"]["consumed_checkpoints"], 3)
            self.assertEqual(verified["lean"]["namespace"], LEAN_NAMESPACE)
            self.assertEqual(verified["lean"]["module_prefix"], MODULE_PREFIX)

            source_root = MODULE_PREFIX.replace(".", "/")
            common = output / source_root / "Common.lean"
            common_text = common.read_text(encoding="utf-8")
            self.assertIn(f"namespace {LEAN_NAMESPACE}\n", common_text)
            self.assertNotIn(f"namespace {MODULE_PREFIX}\n", common_text)

            checkpoint = output / source_root / "Checkpoint" / "C0000.lean"
            checkpoint_text = checkpoint.read_text(encoding="utf-8")
            self.assertIn(f"import {MODULE_PREFIX}.Common\n", checkpoint_text)
            self.assertIn(
                f"namespace {LEAN_NAMESPACE}.Checkpoint.C0000\n",
                checkpoint_text,
            )
            include_line = next(
                line for line in checkpoint_text.splitlines() if "include_str" in line
            )
            include_path = include_line.split('"', 2)[1]
            self.assertTrue((checkpoint.parent / include_path).resolve().is_file())

    def test_dotted_name_validation_is_fail_closed(self) -> None:
        invalid_names = (
            "",
            ".Foo",
            "Foo.",
            "Foo..Bar",
            "Foo/Bar",
            "Foo-Bar",
            "Foo Bar",
            "1Foo",
            "Foo.namespace",
            "Foo.\nBar",
        )
        for value in invalid_names:
            with self.subTest(value=value), self.assertRaises(
                subject.CompactReplayPackageError
            ):
                subject._validate_dotted_lean_name(value, label="test name")

    def test_digest_binds_namespace_and_module_prefix(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = windowed_fixture(root)
            identities = (
                (LEAN_NAMESPACE, MODULE_PREFIX, "first"),
                ("Problem97.Generated.OtherAtCommon", MODULE_PREFIX, "second"),
                (
                    LEAN_NAMESPACE,
                    "Erdos9796Proof.P97.Generated.OtherAtCommon",
                    "third",
                ),
            )
            digests = set()
            for namespace, prefix, output_name in identities:
                manifest = subject.emit(
                    package,
                    root / output_name,
                    lean_namespace=namespace,
                    module_prefix=prefix,
                )
                digests.add(manifest["compact_replay_package_sha256"])
            self.assertEqual(len(digests), 3)

    def test_digest_is_relocation_stable(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            first_output, first = emit_fixture(root / "first")
            second_output, second = emit_fixture(root / "second")
            subject.verify_compact_replay_package(first_output)
            subject.verify_compact_replay_package(second_output)
            self.assertEqual(
                first["compact_replay_package_sha256"],
                second["compact_replay_package_sha256"],
            )

    def test_rejects_rehashed_namespace_and_module_prefix_drift(self) -> None:
        mutations = (
            {
                "namespace": "Problem97.Generated.OtherAtCommon",
            },
            {
                "module_prefix": "Erdos9796Proof.P97.Generated.OtherAtCommon",
                "source_root": "Erdos9796Proof/P97/Generated/OtherAtCommon",
            },
        )
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = windowed_fixture(root)
            for index, mutation in enumerate(mutations):
                output = root / f"compact-{index}"
                subject.emit(
                    package,
                    output,
                    lean_namespace=LEAN_NAMESPACE,
                    module_prefix=MODULE_PREFIX,
                )
                payload = json.loads(
                    (output / subject.MANIFEST_NAME).read_text(encoding="utf-8")
                )
                payload["lean"].update(mutation)
                rehash_manifest(output, payload)
                with self.assertRaisesRegex(
                    subject.CompactReplayPackageError,
                    "inconsistent|module prefix",
                ):
                    subject.verify_compact_replay_package(output)

    def test_rejects_rehashed_generated_source_content_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            output, _ = emit_fixture(Path(raw_root))
            manifest_path = output / subject.MANIFEST_NAME
            payload = json.loads(manifest_path.read_text(encoding="utf-8"))
            source_record = next(
                record
                for record in payload["lean_sources"]
                if record["path"].endswith("/Common.lean")
            )
            source_path = output / source_record["path"]
            source_path.write_text(
                source_path.read_text(encoding="utf-8").replace(
                    f"namespace {LEAN_NAMESPACE}",
                    "namespace Problem97.Generated.OtherAtCommon",
                    1,
                ),
                encoding="utf-8",
            )
            source_record["byte_count"] = source_path.stat().st_size
            source_record["sha256"] = subject._sha256(source_path)
            rehash_manifest(output, payload)
            with self.assertRaisesRegex(
                subject.CompactReplayPackageError,
                "content is inconsistent",
            ):
                subject.verify_compact_replay_package(output)

    def test_rejects_rehashed_posfin_bound_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            output, _ = emit_fixture(Path(raw_root))
            manifest_path = output / subject.MANIFEST_NAME
            payload = json.loads(manifest_path.read_text(encoding="utf-8"))
            payload["counts"]["n"] += 1
            rehash_manifest(output, payload)
            with self.assertRaisesRegex(
                subject.CompactReplayPackageError,
                "PosFin bound drift",
            ):
                subject.verify_compact_replay_package(output)


if __name__ == "__main__":
    unittest.main()
