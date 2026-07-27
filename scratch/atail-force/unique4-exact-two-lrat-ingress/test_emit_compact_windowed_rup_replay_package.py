# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
from pathlib import Path
import tempfile
import unittest

import emit_compact_windowed_rup_replay_package as subject
import materialize_checkpointed_rup as base
import materialize_windowed_rup as windows


CNF = "p cnf 2 3\n1 2 0\n-1 0\n-2 0\n"
PURE_RUP = "4 2 0 1 2 0\n1 d 1 2 0\n5 0 3 4 0\n"


class EmitCompactWindowedRupReplayPackageTest(unittest.TestCase):
    def package(self, root: Path, *, max_actions: int = 1) -> Path:
        cnf = root / "input.cnf"
        lrat = root / "input.lrat"
        cnf.write_text(CNF, encoding="ascii")
        lrat.write_text(PURE_RUP, encoding="ascii")
        parent = root / "parent"
        base.materialize(
            cnf_path=cnf,
            lrat_path=lrat,
            output_dir=parent,
            second_shard_first_addition=5,
        )
        package = root / "windows"
        windows.materialize_windows(
            package_dir=parent,
            output_dir=package,
            max_actions=max_actions,
            max_lrat_bytes=1 << 20,
        )
        return package

    def test_matches_compact_checker_ground_examples(self) -> None:
        formula = (2, ((1, 2), (-1,), (-2,)))
        formula_text = subject._encode_ascii85(
            subject._encode_formula(formula)
        )
        self.assertEqual(formula_text, '6Vp6,!WrK*"9AN(!r')
        self.assertEqual(
            subject._decode_formula_independent(formula_text), formula
        )

        actions: tuple[subject.ActionSemantic, ...] = (
            ("add", (2,), (1, 2)),
            ("del", (1, 2), ()),
        )
        actions_text = subject._encode_ascii85(
            subject._encode_actions(actions)
        )
        self.assertEqual(actions_text, "6Vp''!WW6(!W`?'!W`?")
        self.assertEqual(
            subject._decode_actions_independent(
                actions_text, variable_count=2
            ),
            actions,
        )

    def test_strict_ascii85_u64_and_clause_validation(self) -> None:
        for payload in (
            b"",
            b"\0",
            b"\0\1",
            b"\0\1\2",
            b"\0\1\2\3",
            bytes(range(31)),
        ):
            text = subject._encode_ascii85(payload)
            self.assertTrue(
                all(33 <= ord(character) <= 117 for character in text)
            )
            self.assertEqual(
                subject._decode_ascii85_independent(text), payload
            )
        self.assertEqual(
            subject._encode_uvarint(subject.U64_MAX),
            b"\xff\xff\xff\xff\xff\xff\xff\xff\xff\x01",
        )
        with self.assertRaises(subject.CompactReplayPackageError):
            subject._encode_uvarint(subject.U64_MAX + 1)
        with self.assertRaises(subject.CompactReplayPackageError):
            subject._decode_ascii85_independent("z")
        with self.assertRaises(subject.CompactReplayPackageError):
            subject._decode_ascii85_independent("!")
        with self.assertRaisesRegex(
            subject.CompactReplayPackageError, "repeats variable"
        ):
            subject._encode_formula((2, ((1, -1),)))
        with self.assertRaisesRegex(
            subject.CompactReplayPackageError, "zero or an out-of-range"
        ):
            subject._encode_formula((2, ((0,),)))

    def test_rejects_sparse_additions_and_rat_shape(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            sparse = root / "sparse.lrat"
            sparse.write_text("5 2 0 1 2 0\n", encoding="ascii")
            with self.assertRaisesRegex(
                subject.CompactReplayPackageError,
                "unsupported sparse addition",
            ):
                subject._load_actions(
                    sparse,
                    variable_count=2,
                    start_clause_count=3,
                )

            rat = root / "rat.lrat"
            rat.write_text(
                "4 2 0 1 -3 0 2 0\n", encoding="ascii"
            )
            with self.assertRaisesRegex(
                subject.CompactReplayPackageError,
                "unsupported RAT or malformed action",
            ):
                subject._load_actions(
                    rat,
                    variable_count=2,
                    start_clause_count=3,
                )

    def test_emits_content_addressed_shared_endpoints_and_compact_proofs(
        self,
    ) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = root / "compact"
            manifest = subject.emit(self.package(root), output)

            self.assertEqual(manifest["schema"], subject.SCHEMA)
            self.assertEqual(manifest["counts"]["n"], 3)
            self.assertEqual(manifest["counts"]["windows"], 3)
            self.assertEqual(
                manifest["trust_profile"],
                {
                    "audit_status": subject.TRUST_AUDIT_STATUS,
                    "allowed_axioms": subject.EXPECTED_TRUST_AXIOMS,
                    "claim": subject.TRUST_CLAIM,
                },
            )
            self.assertIn(
                "Lean.trustCompiler", manifest["trust_profile"]["claim"]
            )
            self.assertIn(
                "no compiler-independent trust",
                manifest["trust_profile"]["claim"],
            )

            for record in manifest["payloads"]:
                path = Path(record["path"])
                self.assertEqual(path.stem, record["sha256"])
                encoded = (output / path).read_text(encoding="ascii")
                self.assertTrue(encoded)
                self.assertTrue(
                    all(
                        33 <= ord(character) <= 117
                        for character in encoded
                    )
                )
                self.assertNotIn("z", encoded)
                self.assertNotIn("\n", encoded)

            checkpoint = (
                output
                / "CompactWindowedRupReplay/Checkpoint/C0001.lean"
            ).read_text(encoding="utf-8")
            payload_line = next(
                line
                for line in checkpoint.splitlines()
                if "include_str" in line
            )
            payload_name = payload_line.split('"')[1]
            self.assertRegex(payload_name, r"[0-9a-f]{64}\.cpf85$")

            first = (
                output
                / "CompactWindowedRupReplay/Shard1/W0001.lean"
            ).read_text(encoding="utf-8")
            second = (
                output
                / "CompactWindowedRupReplay/Shard1/W0002.lean"
            ).read_text(encoding="utf-8")
            self.assertIn("Checkpoint.C0001.text", first)
            self.assertIn("Checkpoint.C0001.text", second)
            self.assertIn("checkRebaseCompact", first)
            self.assertIn(
                "checkRebaseCompact_sound_of_compact accepted", first
            )
            self.assertIn("native_decide", first)
            self.assertNotIn("formulaOfCompact (n := n) ", first.split(
                "theorem accepted", 1
            )[1].split("theorem sound", 1)[0])

            terminal = (
                output
                / "CompactWindowedRupReplay/Shard2/W0001.lean"
            ).read_text(encoding="utf-8")
            self.assertIn("checkTerminalCompact", terminal)
            self.assertIn(
                "checkTerminalCompact_sound_of_compact accepted",
                terminal,
            )

    def test_manifest_binds_source_emission_and_round_trip(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = root / "compact"
            manifest = subject.emit(self.package(root), output)
            for record in manifest["objects"]:
                self.assertGreater(record["source"]["byte_count"], 0)
                self.assertRegex(
                    record["source"]["sha256"], r"^[0-9a-f]{64}$"
                )
                self.assertGreater(record["emitted"]["byte_count"], 0)
                self.assertRegex(
                    record["emitted"]["sha256"], r"^[0-9a-f]{64}$"
                )
                self.assertEqual(
                    record["semantic_sha256"],
                    record["emitted"]["semantic_sha256"],
                )
            verified = subject.verify_compact_replay_package(output)
            self.assertEqual(
                verified["compact_replay_package_sha256"],
                manifest["compact_replay_package_sha256"],
            )

    def test_deterministic_refuses_overwrite_and_rejects_tampering(
        self,
    ) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.package(root)
            first = root / "first"
            second = root / "second"
            first_manifest = subject.emit(package, first)
            second_manifest = subject.emit(package, second)
            self.assertEqual(first_manifest, second_manifest)
            first_paths = sorted(
                path.relative_to(first)
                for path in first.rglob("*")
                if path.is_file()
            )
            second_paths = sorted(
                path.relative_to(second)
                for path in second.rglob("*")
                if path.is_file()
            )
            self.assertEqual(first_paths, second_paths)
            for relative in first_paths:
                self.assertEqual(
                    (first / relative).read_bytes(),
                    (second / relative).read_bytes(),
                )
            with self.assertRaises(subject.CompactReplayPackageError):
                subject.emit(package, first)

            payload_path = first / first_manifest["payloads"][0]["path"]
            payload_path.write_bytes(payload_path.read_bytes() + b"!")
            with self.assertRaises(subject.CompactReplayPackageError):
                subject.verify_compact_replay_package(first)

    def test_rejects_rehashed_forbidden_lean_source(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = root / "compact"
            subject.emit(self.package(root), output)
            common_path = (
                output / "CompactWindowedRupReplay/Common.lean"
            )
            common_path.write_text(
                common_path.read_text(encoding="utf-8")
                + "\naxiom injected : False\n",
                encoding="utf-8",
            )
            manifest_path = output / subject.MANIFEST_NAME
            manifest = json.loads(
                manifest_path.read_text(encoding="utf-8")
            )
            common_record = next(
                record
                for record in manifest["lean_sources"]
                if record["path"]
                == "CompactWindowedRupReplay/Common.lean"
            )
            common_record["byte_count"] = common_path.stat().st_size
            common_record["sha256"] = subject._sha256(common_path)
            manifest["compact_replay_package_sha256"] = (
                subject.compute_compact_replay_package_digest(manifest)
            )
            manifest_path.write_text(
                json.dumps(manifest, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            with self.assertRaisesRegex(
                subject.CompactReplayPackageError,
                "forbidden token axiom",
            ):
                subject.verify_compact_replay_package(output)


if __name__ == "__main__":
    unittest.main()
