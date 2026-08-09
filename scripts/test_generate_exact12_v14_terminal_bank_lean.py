# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import json
import tempfile
import unittest
from pathlib import Path

import generate_exact12_v14_terminal_bank_lean as subject
import prepare_exact12_v14_terminal_rup_source as prepare
import test_prepare_exact12_v14_terminal_rup_source as fixtures


class GenerateExact12TerminalBankLeanTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        fixtures.PrepareExact12TerminalRupSourceIntegrationTest.setUpClass()
        cls.repo_root = (
            fixtures.PrepareExact12TerminalRupSourceIntegrationTest.repo_root
        )

    def _prepared_mixed_packet(self, root: Path) -> Path:
        helper = fixtures.PrepareExact12TerminalRupSourceIntegrationTest()
        workdir, _formula, _record = helper._write_real_workdir(root, structural=True)
        helper._extend_with_real_source_order_record(workdir)
        source_dir = root / "prepared"
        prepare.prepare_terminal_rup_source(
            workdir,
            source_dir,
            command_runner=fixtures.DynamicFakeDratTrim(),
        )
        return source_dir

    @staticmethod
    def _output_dir(root: Path) -> Path:
        return root / "leanroot" / "Exact12MixedV3"

    def test_real_mixed_packet_materializes_ordered_sharded_bank(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            source_dir = self._prepared_mixed_packet(root)
            output = self._output_dir(root)
            manifest = subject.materialize_terminal_bank(
                source_dir,
                output,
                repo_root=self.repo_root,
                module_prefix="Exact12MixedV3.TerminalBank",
                records_per_shard=1,
            )
            self.assertTrue(manifest["claims"]["typed_bank_materialized"])
            self.assertFalse(manifest["claims"]["terminal_rup_replayed_in_lean"])
            self.assertEqual(manifest["source"]["records"], 2)
            self.assertEqual(len(manifest["shards"]), 2)
            first = (output / "TerminalBankShards/Part_001.lean").read_text()
            second = (output / "TerminalBankShards/Part_002.lean").read_text()
            coordinator = (output / "TerminalBank.lean").read_text()
            self.assertIn("def record0 : DuplicateCenterNogood Label", first)
            self.assertIn("SourceOrderPositiveNogood.ofDuplicateCenter", first)
            self.assertIn("frozenV8PositiveNogood", second)
            self.assertIn("Part_001.bank ++", coordinator)
            self.assertIn("Part_002.bank", coordinator)
            self.assertLess(
                coordinator.find("TerminalBankShards.Part_001.bank"),
                coordinator.find("TerminalBankShards.Part_002.bank"),
            )

    def test_packet_artifact_tamper_is_rejected_before_output(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            source_dir = self._prepared_mixed_packet(root)
            journal = source_dir / "journal.jsonl"
            journal.write_bytes(journal.read_bytes() + b"\n")
            output = self._output_dir(root)
            with self.assertRaisesRegex(
                subject.TerminalBankGenerationError, "journal artifact drift"
            ):
                subject.materialize_terminal_bank(
                    source_dir,
                    output,
                    repo_root=self.repo_root,
                    module_prefix="Exact12MixedV3.TerminalBank",
                )
            self.assertFalse(output.exists())

    def test_named_source_binding_drift_is_rejected(self) -> None:
        from census.card_head.exact12_v14_ordered_coverage import (
            FROZEN_V8_LEAN_BINDING,
        )

        binding = copy.deepcopy(FROZEN_V8_LEAN_BINDING)
        binding["source_sha256"] = "0" * 64
        with self.assertRaisesRegex(
            subject.TerminalBankGenerationError,
            "named source-order Lean source drifted",
        ):
            subject._validate_source_file(self.repo_root, binding, "")

    def test_receipt_digest_tamper_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            source_dir = self._prepared_mixed_packet(root)
            receipt_path = source_dir / "receipt.json"
            receipt = json.loads(receipt_path.read_text())
            receipt["scope"] += " tampered"
            receipt_path.write_text(json.dumps(receipt), encoding="utf-8")
            with self.assertRaisesRegex(
                subject.TerminalBankGenerationError,
                "receipt authentication failed",
            ):
                subject.materialize_terminal_bank(
                    source_dir,
                    self._output_dir(root),
                    repo_root=self.repo_root,
                    module_prefix="Exact12MixedV3.TerminalBank",
                )

    def test_existing_output_is_not_replaced(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            source_dir = self._prepared_mixed_packet(root)
            output = self._output_dir(root)
            output.mkdir(parents=True)
            marker = output / "owned.txt"
            marker.write_text("preserve\n", encoding="utf-8")
            with self.assertRaisesRegex(
                subject.TerminalBankGenerationError, "refusing to replace"
            ):
                subject.materialize_terminal_bank(
                    source_dir,
                    output,
                    repo_root=self.repo_root,
                    module_prefix="Exact12MixedV3.TerminalBank",
                )
            self.assertEqual(marker.read_text(encoding="utf-8"), "preserve\n")

    def test_output_directory_must_match_module_prefix(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            source_dir = self._prepared_mixed_packet(root)
            output = root / "generated"
            with self.assertRaisesRegex(
                subject.TerminalBankGenerationError,
                "does not match module prefix",
            ):
                subject.materialize_terminal_bank(
                    source_dir,
                    output,
                    repo_root=self.repo_root,
                    module_prefix="Exact12MixedV3.TerminalBank",
                )
            self.assertFalse(output.exists())


if __name__ == "__main__":
    unittest.main()
