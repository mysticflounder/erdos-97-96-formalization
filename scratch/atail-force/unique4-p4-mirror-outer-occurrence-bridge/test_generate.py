#!/usr/bin/env python3
"""Regression tests for the P4 mirror outer-overlay occurrence generator."""

from __future__ import annotations

import importlib.util
import tempfile
import unittest
from pathlib import Path


MODULE_PATH = Path(__file__).with_name("generate.py")
SPEC = importlib.util.spec_from_file_location("p4_mirror_outer_generate", MODULE_PATH)
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
    def fake_load_entries() -> tuple[dict[str, str], list[dict]]:
        return ({"selected_ledger": "ledger", "selected_compact_cnf": "compact",
                 "selected_source_core": "source"}, [
            {"output": 10, "source": 20, "clause": [-1, -2, -3, -4, 5],
             "shape": {"kind": "membership_row", "row": {"center": 0, "support": [1, 2, 3, 4]},
                       "row_var": 5,
                       "members": [{"var": 1, "center": 0, "point": 1}, {"var": 2, "center": 0, "point": 2},
                                   {"var": 3, "center": 0, "point": 3}, {"var": 4, "center": 0, "point": 4}]}},
            {"output": 11, "source": 21, "clause": [-5, 6],
             "shape": {"kind": "row_arc", "row": {"center": 0, "support": [1, 2, 3, 4]},
                       "arc": {"center": 0, "side": "left", "mask": 7},
                       "row_var": 5, "arc_var": 6,
                       "reflected_datum": {"row": {"center": 10, "support": [9, 8, 7, 6]},
                                           "arc": {"center": 10, "side": "right", "mask": 0}}}},
            {"output": 12, "source": 22, "clause": [-7, -8, -9, -10],
             "shape": {"kind": "no_four", "arcs": [
                 {"var": 7, "center": 0, "side": "left", "mask": 1},
                 {"var": 8, "center": 1, "side": "right", "mask": 2},
                 {"var": 9, "center": 2, "side": "left", "mask": 4},
                 {"var": 10, "center": 3, "side": "right", "mask": 8}]}}
        ])

    @staticmethod
    def write_expected_tree(expected: dict[str, bytes]) -> None:
        GENERATOR.OUT.mkdir(parents=True, exist_ok=True)
        for name, contents in expected.items():
            (GENERATOR.OUT / name).write_bytes(contents)

    def test_verify_accepts_exact_deterministic_tree(self) -> None:
        expected = GENERATOR.render_generated_files()
        self.assertEqual(expected, GENERATOR.render_generated_files())
        self.write_expected_tree(expected)
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


class SemanticChecksTest(unittest.TestCase):
    def test_rejects_conflicting_named_variable_meanings(self) -> None:
        first = {"core_clause_index": 1, "core_clause_literal_order": [-12],
                 "named_literals": [{"literal": -12, "variable": 12,
                                     "variable_family": "outer_arc",
                                     "parameters": {"center": 0, "side": "left", "turn_mask": 1}}]}
        second = {"core_clause_index": 2, "core_clause_literal_order": [12],
                  "named_literals": [{"literal": 12, "variable": 12,
                                      "variable_family": "outer_arc",
                                      "parameters": {"center": 0, "side": "right", "turn_mask": 1}}]}
        with self.assertRaisesRegex(ValueError, "semantic conflict for source variable 12"):
            GENERATOR.check_semantic_conflicts([first, second])

    def test_reflection_changes_labels_and_swaps_sides(self) -> None:
        self.assertEqual(GENERATOR.reflect_row({"center": 0, "support": [1, 5, 6, 7]}),
                         {"center": 10, "support": [9, 5, 4, 3]})
        self.assertEqual(GENERATOR.reflect_arc({"center": 0, "side": "left", "mask": 15}),
                         {"center": 10, "side": "right", "mask": 1920})

    def test_real_source_extraction_has_exact_expected_counts(self) -> None:
        provenance, entries = GENERATOR.load_entries()
        self.assertEqual(len(entries), 10614)
        self.assertEqual(provenance["selected_ledger"], GENERATOR.EXPECTED["selected_ledger"])
        self.assertEqual(sum(entry["shape"]["kind"] == "no_four" for entry in entries), 6170)


if __name__ == "__main__":
    unittest.main()
