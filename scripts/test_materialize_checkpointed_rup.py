# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import os
import tempfile
import unittest
from pathlib import Path

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


def write_source_manifest(
    root: Path,
    *,
    cnf: str = CNF,
    lrat: str = PURE_RUP,
) -> Path:
    root.mkdir(parents=True, exist_ok=True)
    cnf_path = root / "input.cnf"
    lrat_path = root / "input.lrat"
    cnf_path.write_text(cnf, encoding="ascii")
    lrat_path.write_text(lrat, encoding="ascii")
    manifest = {
        "schema": subject.PURE_RUP_SOURCE_SCHEMA,
        "artifacts": {
            "cnf": subject.artifact_record(
                cnf_path,
                relative_path=cnf_path.name,
            ),
            "normalized_lrat": subject.artifact_record(
                lrat_path,
                relative_path=lrat_path.name,
            ),
        },
    }
    manifest_path = root / "source-manifest.json"
    manifest_path.write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    return manifest_path


def materialize_fixture(
    root: Path,
    *,
    name: str = "package",
    cnf: str = CNF,
    lrat: str = PURE_RUP,
    split: int = 5,
) -> Path:
    manifest_path = write_source_manifest(root / f"{name}-source", cnf=cnf, lrat=lrat)
    manifest, manifest_record, cnf_path, lrat_path = subject.load_source_manifest(
        manifest_path
    )
    output = root / name
    subject.materialize(
        cnf_path=cnf_path,
        lrat_path=lrat_path,
        output_dir=output,
        second_shard_first_addition=split,
        source_manifest=manifest,
        source_manifest_record=manifest_record,
    )
    return output


class MaterializeCheckpointedRupTest(unittest.TestCase):
    def test_strict_generic_source_manifest(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            valid_path = write_source_manifest(root / "valid")
            manifest, _, cnf_path, lrat_path = subject.load_source_manifest(
                valid_path
            )
            self.assertEqual(manifest["schema"], subject.PURE_RUP_SOURCE_SCHEMA)
            self.assertEqual(cnf_path.name, "input.cnf")
            self.assertEqual(lrat_path.name, "input.lrat")

            mutations = {
                "legacy schema": lambda value: value.__setitem__(
                    "schema",
                    "p97-unique4-exact-two-trimmed-reduced-core-certificate-v1",
                ),
                "extra top-level field": lambda value: value.__setitem__(
                    "producer",
                    {},
                ),
                "missing artifact": lambda value: value["artifacts"].pop("cnf"),
                "extra artifact field": lambda value: value["artifacts"][
                    "cnf"
                ].__setitem__("role", "cnf"),
                "malformed hash": lambda value: value["artifacts"]["cnf"].__setitem__(
                    "sha256",
                    "0" * 63,
                ),
                "boolean size": lambda value: value["artifacts"]["cnf"].__setitem__(
                    "byte_count",
                    True,
                ),
                "absolute path": lambda value: value["artifacts"]["cnf"].__setitem__(
                    "path",
                    str(cnf_path),
                ),
                "parent path": lambda value: value["artifacts"]["cnf"].__setitem__(
                    "path",
                    "../input.cnf",
                ),
            }
            original = json.loads(valid_path.read_text(encoding="utf-8"))
            for index, (label, mutate) in enumerate(mutations.items()):
                with self.subTest(label=label):
                    candidate = json.loads(json.dumps(original))
                    mutate(candidate)
                    path = root / f"invalid-{index}.json"
                    path.write_text(json.dumps(candidate), encoding="utf-8")
                    with self.assertRaises(subject.MaterializationError):
                        subject.load_source_manifest(path)

    def test_source_manifest_rejects_duplicates_hash_drift_and_aliases(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            duplicate = root / "duplicate.json"
            duplicate.write_text(
                '{"schema":"p97-pure-rup-source-v1","schema":"x",'
                '"artifacts":{}}',
                encoding="utf-8",
            )
            with self.assertRaisesRegex(subject.MaterializationError, "duplicate"):
                subject.load_source_manifest(duplicate)

            drift_root = root / "drift"
            manifest_path = write_source_manifest(drift_root)
            (drift_root / "input.lrat").write_text(
                PURE_RUP.replace("3 4", "3 3"),
                encoding="ascii",
            )
            with self.assertRaisesRegex(subject.MaterializationError, "SHA-256"):
                subject.load_source_manifest(manifest_path)

            alias_root = root / "alias"
            alias_manifest = write_source_manifest(alias_root)
            manifest = json.loads(alias_manifest.read_text(encoding="utf-8"))
            os.link(alias_root / "input.cnf", alias_root / "alias.cnf")
            manifest["artifacts"]["normalized_lrat"] = subject.artifact_record(
                alias_root / "alias.cnf",
                relative_path="alias.cnf",
            )
            alias_manifest.write_text(json.dumps(manifest), encoding="utf-8")
            with self.assertRaisesRegex(subject.MaterializationError, "alias"):
                subject.load_source_manifest(alias_manifest)

    def test_two_shards_are_dense_terminal_and_deterministic(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            first = materialize_fixture(root, name="first")
            second = materialize_fixture(root, name="second")
            first_payload = subject.verify_package(first)
            second_payload = subject.verify_package(second)
            self.assertEqual(
                first_payload["package_sha256"],
                second_payload["package_sha256"],
            )
            self.assertEqual(first_payload["counts"]["terminal_empty_global_ids"], [5])
            self.assertEqual(first_payload["counts"]["shard_1"]["additions"], 1)
            self.assertEqual(first_payload["counts"]["shard_2"]["additions"], 1)
            self.assertEqual(
                (first / "shard-2.lrat").read_text(encoding="ascii"),
                "3 0 1 2 0\n",
            )

    def test_package_digest_binds_exact_source_manifest_bytes(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            first_source = write_source_manifest(root / "first-source")
            second_source = write_source_manifest(root / "second-source")
            second_payload = json.loads(second_source.read_text(encoding="utf-8"))
            second_source.write_text(
                json.dumps(second_payload, separators=(",", ":")),
                encoding="utf-8",
            )

            digests = []
            for index, source_path in enumerate((first_source, second_source)):
                manifest, record, cnf_path, lrat_path = (
                    subject.load_source_manifest(source_path)
                )
                output = root / f"package-{index}"
                payload = subject.materialize(
                    cnf_path=cnf_path,
                    lrat_path=lrat_path,
                    output_dir=output,
                    second_shard_first_addition=5,
                    source_manifest=manifest,
                    source_manifest_record=record,
                )
                subject.verify_package(output)
                digests.append(payload["package_sha256"])
            self.assertNotEqual(digests[0], digests[1])

    def test_rejects_rat_sparse_split_and_terminal_drift(self) -> None:
        cases = {
            "RAT-shaped hint": (PURE_RUP.replace("1 2 0", "-1 2 0", 1), 5),
            "sparse addition": (PURE_RUP.replace("4 2 0", "6 2 0", 1), 5),
            "empty first shard": (PURE_RUP, 4),
            "missing terminal": (PURE_RUP.replace("5 0 3 4 0", "5 1 0 3 4 0"), 5),
            "action after terminal": (PURE_RUP + "1 d 3 0\n", 5),
        }
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            for index, (label, (lrat, split)) in enumerate(cases.items()):
                with self.subTest(label=label), self.assertRaises(
                    subject.MaterializationError
                ):
                    materialize_fixture(
                        root,
                        name=f"bad-{index}",
                        lrat=lrat,
                        split=split,
                    )

    def test_verifier_rejects_rehashed_inconsistent_source(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            output = materialize_fixture(Path(raw_root))
            manifest_path = output / "manifest.json"
            payload = json.loads(manifest_path.read_text(encoding="utf-8"))
            payload["source"]["cnf"]["sha256"] = "0" * 64
            payload["package_sha256"] = subject.compute_package_digest(payload)
            manifest_path.write_text(
                json.dumps(payload, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            with self.assertRaisesRegex(subject.MaterializationError, "inconsistent"):
                subject.verify_package(output)


if __name__ == "__main__":
    unittest.main()
