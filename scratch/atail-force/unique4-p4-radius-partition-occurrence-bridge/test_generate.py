#!/usr/bin/env python3
"""Regression tests for the radius-partition generated-tree verifier."""

from __future__ import annotations

import importlib.util
import tempfile
import unittest
from pathlib import Path


MODULE_PATH = Path(__file__).with_name("generate.py")
SPEC = importlib.util.spec_from_file_location("p4_radius_partition_generate", MODULE_PATH)
assert SPEC is not None and SPEC.loader is not None
GENERATOR = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(GENERATOR)


class GeneratedTreeVerificationTest(unittest.TestCase):
    def setUp(self) -> None:
        self.temporary_directory = tempfile.TemporaryDirectory()
        self.original_out = GENERATOR.OUT
        self.original_load_entries = GENERATOR.load_entries
        GENERATOR.OUT = Path(self.temporary_directory.name) / "generated"
        GENERATOR.load_entries = self.fake_load_entries

    def tearDown(self) -> None:
        GENERATOR.OUT = self.original_out
        GENERATOR.load_entries = self.original_load_entries
        self.temporary_directory.cleanup()

    @staticmethod
    def fake_load_entries() -> list[dict]:
        entry = {
            "dense_literals": [-111, -112, 113],
            "shape": (0, 1, 2, 3),
            "output_clause_index": 1,
            "source_core_clause_index": 1,
        }
        return [entry.copy() for _ in range(sum(GENERATOR.CHUNK_SIZES))]

    @staticmethod
    def write_expected_tree(expected: dict[str, bytes]) -> None:
        GENERATOR.OUT.mkdir(parents=True, exist_ok=True)
        for name, contents in expected.items():
            (GENERATOR.OUT / name).write_bytes(contents)

    def test_verify_accepts_exact_deterministic_tree(self) -> None:
        first = GENERATOR.render_generated_files()
        self.assertEqual(first, GENERATOR.render_generated_files())
        self.write_expected_tree(first)
        GENERATOR.verify_generated()

    def test_verify_rejects_tampered_content(self) -> None:
        expected = GENERATOR.render_generated_files()
        self.write_expected_tree(expected)
        (GENERATOR.OUT / "Main.lean").write_bytes(expected["Main.lean"] + b"tampered")
        with self.assertRaisesRegex(ValueError, "generated content drift: Main\\.lean"):
            GENERATOR.verify_generated()

    def test_verify_rejects_missing_and_extra_generated_lean_files(self) -> None:
        expected = GENERATOR.render_generated_files()
        self.write_expected_tree(expected)
        (GENERATOR.OUT / "BridgeChunk01.lean").unlink()
        with self.assertRaisesRegex(ValueError, "missing BridgeChunk01\\.lean"):
            GENERATOR.verify_generated()
        (GENERATOR.OUT / "BridgeChunk01.lean").write_bytes(expected["BridgeChunk01.lean"])
        (GENERATOR.OUT / "Unexpected.lean").write_bytes(b"-- stale generated payload\\n")
        with self.assertRaisesRegex(ValueError, "extra Unexpected\\.lean"):
            GENERATOR.verify_generated()


if __name__ == "__main__":
    unittest.main()
