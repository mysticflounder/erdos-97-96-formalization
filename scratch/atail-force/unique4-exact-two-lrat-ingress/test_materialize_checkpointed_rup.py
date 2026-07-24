# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
from pathlib import Path
import tempfile
import unittest

import materialize_checkpointed_rup as subject


CNF = """\
p cnf 2 3
1 2 0
-1 0
-2 0
"""

PURE_RUP = """\
4 2 0 1 2 0
1 d 1 2 0
5 0 3 4 0
"""


class MaterializeCheckpointedRupTest(unittest.TestCase):
    def write_inputs(
        self,
        root: Path,
        *,
        cnf: str = CNF,
        lrat: str = PURE_RUP,
    ) -> tuple[Path, Path]:
        cnf_path = root / "input.cnf"
        lrat_path = root / "input.lrat"
        cnf_path.write_text(cnf, encoding="ascii")
        lrat_path.write_text(lrat, encoding="ascii")
        return cnf_path, lrat_path

    def materialize(
        self,
        root: Path,
        name: str,
        *,
        cnf: str = CNF,
        lrat: str = PURE_RUP,
    ) -> Path:
        cnf_path, lrat_path = self.write_inputs(root, cnf=cnf, lrat=lrat)
        output = root / name
        subject.materialize(
            cnf_path=cnf_path,
            lrat_path=lrat_path,
            output_dir=output,
            second_shard_first_addition=5,
        )
        return output

    def write_source_certificate(self, root: Path) -> Path:
        root.mkdir(parents=True, exist_ok=True)
        cnf_path, lrat_path = self.write_inputs(root)
        certificate_path = root / "certificate.json"
        certificate = {
            "schema": subject.EXPECTED_SOURCE_SCHEMA,
            "artifacts": {
                "trimmed_core_cnf": {
                    "path": cnf_path.name,
                    "sha256": subject.sha256(cnf_path),
                    "byte_count": cnf_path.stat().st_size,
                },
                "trimmed_lrat": {
                    "path": lrat_path.name,
                    "sha256": subject.sha256(lrat_path),
                    "byte_count": lrat_path.stat().st_size,
                },
            },
        }
        certificate_path.write_text(
            json.dumps(certificate, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        return certificate_path

    def materialize_from_certificate(self, root: Path) -> Path:
        certificate_path = self.write_source_certificate(root)
        (
            certificate,
            certificate_record,
            cnf_path,
            lrat_path,
        ) = subject.load_source_certificate(certificate_path)
        output = root / "package"
        subject.materialize(
            cnf_path=cnf_path,
            lrat_path=lrat_path,
            output_dir=output,
            second_shard_first_addition=5,
            source_certificate=certificate,
            source_certificate_record=certificate_record,
        )
        return output

    def test_compacts_active_state_and_rebases_second_shard(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = self.materialize(root, "package")
            self.assertEqual(
                (output / "checkpoint.cnf").read_text(encoding="ascii"),
                "p cnf 2 2\n-2 0\n2 0\n",
            )
            self.assertEqual(
                (output / "checkpoint-map.tsv").read_text(encoding="ascii"),
                "local_id\tglobal_id\n1\t3\n2\t4\n",
            )
            self.assertEqual(
                (output / "shard-2.lrat").read_text(encoding="ascii"),
                "3 0 1 2 0\n",
            )
            manifest = json.loads(
                (output / "manifest.json").read_text(encoding="utf-8")
            )
            self.assertEqual(
                manifest["counts"]["checkpoint_active_clause_count"],
                2,
            )
            self.assertEqual(manifest["counts"]["shard_1"]["additions"], 1)
            self.assertEqual(manifest["counts"]["shard_2"]["additions"], 1)
            self.assertIsNone(manifest["lean_replay"])

    def test_outputs_are_deterministic(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            first = self.materialize(root, "first")
            second = self.materialize(root, "second")
            for name in (
                "start.cnf",
                "shard-1.lrat",
                "checkpoint.cnf",
                "checkpoint-map.tsv",
                "shard-2.lrat",
                "manifest.json",
            ):
                self.assertEqual(
                    (first / name).read_bytes(),
                    (second / name).read_bytes(),
                    name,
                )

    def test_package_digest_is_stable_after_source_relocation(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            first = self.materialize_from_certificate(root / "first")
            second = self.materialize_from_certificate(root / "second")
            first_manifest = subject.verify_package(first)
            second_manifest = subject.verify_package(second)
            self.assertEqual(
                first_manifest["package_sha256"],
                second_manifest["package_sha256"],
            )

    def test_rejects_duplicate_and_tautological_dimacs_clauses(self) -> None:
        cases = {
            "duplicate": "p cnf 2 1\n1 1 0\n",
            "tautological": "p cnf 2 1\n1 -1 0\n",
        }
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            for name, cnf in cases.items():
                with self.subTest(name=name):
                    with self.assertRaisesRegex(
                        subject.MaterializationError,
                        name,
                    ):
                        self.materialize(root, name, cnf=cnf)

    def test_rejects_duplicate_and_tautological_lrat_additions(self) -> None:
        cases = {
            "duplicate": """\
4 2 2 0 1 2 0
1 d 1 2 0
5 0 3 4 0
""",
            "tautological": """\
4 2 -2 0 1 2 0
1 d 1 2 0
5 0 3 4 0
""",
        }
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            for name, lrat in cases.items():
                with self.subTest(name=name):
                    with self.assertRaisesRegex(
                        subject.MaterializationError,
                        name,
                    ):
                        self.materialize(root, name, lrat=lrat)

    def test_rebases_second_shard_deletions(self) -> None:
        lrat = """\
4 2 0 1 2 0
1 d 1 2 0
5 1 0 3 4 0
1 d 3 5 0
6 0 4 0
"""
        with tempfile.TemporaryDirectory() as raw_root:
            output = self.materialize(Path(raw_root), "package", lrat=lrat)
            self.assertEqual(
                (output / "shard-2.lrat").read_text(encoding="ascii"),
                "3 1 0 1 2 0\n1 d 1 3 0\n4 0 2 0\n",
            )

    def test_rejects_rat_hint(self) -> None:
        bad_lrat = """\
4 2 0 -1 2 0
1 d 1 2 0
5 0 3 4 0
"""
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "non-positive RUP hint",
            ):
                self.materialize(root, "package", lrat=bad_lrat)

    def test_rejects_inactive_hint(self) -> None:
        bad_lrat = """\
4 2 0 1 2 0
1 d 1 2 0
5 0 1 4 0
"""
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "RUP hint 1 is inactive",
            ):
                self.materialize(root, "package", lrat=bad_lrat)

    def test_rejects_repeated_deletion(self) -> None:
        bad_lrat = """\
4 2 0 1 2 0
1 d 1 2 0
1 d 2 0
5 0 3 4 0
"""
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "inactive clause 2",
            ):
                self.materialize(root, "package", lrat=bad_lrat)

    def test_rejects_empty_clause_in_first_shard(self) -> None:
        bad_lrat = """\
4 0 1 2 3 0
5 2 0 1 2 0
"""
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "empty clause occurs in shard 1",
            ):
                self.materialize(root, "package", lrat=bad_lrat)

    def test_rejects_action_after_empty_clause(self) -> None:
        bad_lrat = """\
4 2 0 1 2 0
1 d 1 2 0
5 0 3 4 0
6 1 0 2 0
"""
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "action follows the empty clause",
            ):
                self.materialize(root, "package", lrat=bad_lrat)

    def test_rejects_noncanonical_whitespace(self) -> None:
        bad_lrat = """\
4  2 0 1 2 0
1 d 1 2 0
5 0 3 4 0
"""
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "noncanonical addition spelling",
            ):
                self.materialize(root, "package", lrat=bad_lrat)

    def test_refuses_to_overwrite_output(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = self.materialize(root, "package")
            cnf_path, lrat_path = self.write_inputs(root)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "refusing to overwrite",
            ):
                subject.materialize(
                    cnf_path=cnf_path,
                    lrat_path=lrat_path,
                    output_dir=output,
                    second_shard_first_addition=5,
                )

    def test_verifier_rejects_artifact_and_manifest_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            artifact_package = self.materialize(root, "artifact-package")
            subject.verify_package(artifact_package)
            with (artifact_package / "shard-2.lrat").open(
                "a",
                encoding="ascii",
            ) as stream:
                stream.write("1 d 1 0\n")
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "byte-count drift",
            ):
                subject.verify_package(artifact_package)

            digest_package = self.materialize(root, "digest-package")
            manifest_path = digest_package / "manifest.json"
            manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
            manifest["counts"]["hints"] += 1
            manifest_path.write_text(
                json.dumps(manifest, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "package SHA-256 drift",
            ):
                subject.verify_package(digest_package)


if __name__ == "__main__":
    unittest.main()
