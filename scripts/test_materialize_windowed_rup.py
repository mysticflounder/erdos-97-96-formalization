# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

import materialize_checkpointed_rup as checkpointed
import materialize_windowed_rup as subject

CNF = "p cnf 2 3\n1 2 0\n-1 0\n-2 0\n"
PURE_RUP = "4 2 0 1 2 0\n1 d 1 2 0\n5 0 3 4 0\n"


def checkpointed_fixture(root: Path) -> Path:
    source = root / "source"
    source.mkdir(parents=True)
    cnf_path = source / "input.cnf"
    lrat_path = source / "input.lrat"
    cnf_path.write_text(CNF, encoding="ascii")
    lrat_path.write_text(PURE_RUP, encoding="ascii")
    manifest = {
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
    manifest_path = source / "source-manifest.json"
    manifest_path.write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    source_manifest, record, cnf_path, lrat_path = (
        checkpointed.load_source_manifest(manifest_path)
    )
    package = root / "checkpointed"
    checkpointed.materialize(
        cnf_path=cnf_path,
        lrat_path=lrat_path,
        output_dir=package,
        second_shard_first_addition=5,
        source_manifest=source_manifest,
        source_manifest_record=record,
    )
    return package


class MaterializeWindowedRupTest(unittest.TestCase):
    def test_tiny_caps_preserve_two_shards_and_terminal_window(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = checkpointed_fixture(root)
            output = root / "windowed"
            manifest = subject.materialize_windows(
                package_dir=parent,
                output_dir=output,
                max_actions=1,
                max_lrat_bytes=64,
            )
            verified = subject.verify_windowed_package(output)
            self.assertEqual(manifest["package_sha256"], verified["package_sha256"])
            self.assertEqual(verified["counts"]["windows"], 3)
            self.assertEqual(verified["counts"]["checkpoints"], 4)
            self.assertEqual(len(verified["windows"]["shard_1"]), 2)
            self.assertEqual(len(verified["windows"]["shard_2"]), 1)
            self.assertEqual(verified["windows"]["shard_2"][-1]["role"], "terminal")

    def test_caps_are_positive_and_oversized_actions_fail_closed(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = checkpointed_fixture(root)
            for index, (actions, byte_cap) in enumerate(((0, 64), (1, 0), (1, 1))):
                with self.subTest(
                    actions=actions, byte_cap=byte_cap
                ), self.assertRaises(subject.MaterializationError):
                    subject.materialize_windows(
                        package_dir=parent,
                        output_dir=root / f"bad-{index}",
                        max_actions=actions,
                        max_lrat_bytes=byte_cap,
                    )

    def test_digest_is_deterministic_and_relocation_stable(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            digests = []
            for name in ("first", "second"):
                lane = root / name
                parent = checkpointed_fixture(lane)
                output = lane / "windowed"
                payload = subject.materialize_windows(
                    package_dir=parent,
                    output_dir=output,
                    max_actions=1,
                    max_lrat_bytes=64,
                )
                digests.append(payload["package_sha256"])
            self.assertEqual(digests[0], digests[1])

    def test_verifier_rejects_rehashed_dense_action_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = checkpointed_fixture(root)
            output = root / "windowed"
            subject.materialize_windows(
                package_dir=parent,
                output_dir=output,
                max_actions=1,
                max_lrat_bytes=64,
            )
            manifest_path = output / "manifest.json"
            payload = json.loads(manifest_path.read_text(encoding="utf-8"))
            record = payload["windows"]["shard_1"][0]["artifacts"]["actions_lrat"]
            action_path = output / record["path"]
            action_path.write_text(
                action_path.read_text(encoding="ascii").replace("4 ", "5 ", 1),
                encoding="ascii",
            )
            record["sha256"] = checkpointed.sha256(action_path)
            record["byte_count"] = action_path.stat().st_size
            payload["package_sha256"] = subject.compute_package_digest(payload)
            manifest_path.write_text(
                json.dumps(payload, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            with self.assertRaisesRegex(subject.MaterializationError, "dense"):
                subject.verify_windowed_package(output)

    def test_verifier_rejects_rehashed_source_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = checkpointed_fixture(root)
            output = root / "windowed"
            subject.materialize_windows(
                package_dir=parent,
                output_dir=output,
                max_actions=1,
                max_lrat_bytes=64,
            )
            manifest_path = output / "manifest.json"
            payload = json.loads(manifest_path.read_text(encoding="utf-8"))
            payload["source"]["pure_rup_source"]["cnf"]["sha256"] = "0" * 64
            payload["package_sha256"] = subject.compute_package_digest(payload)
            manifest_path.write_text(
                json.dumps(payload, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            with self.assertRaises(checkpointed.MaterializationError):
                subject.verify_windowed_package(output)


if __name__ == "__main__":
    unittest.main()
