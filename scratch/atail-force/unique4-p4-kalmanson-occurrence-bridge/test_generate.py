"""Focused integrity checks for the authenticated P4 Kalmanson generator."""

from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("p4_kalmanson_generate", HERE / "generate.py")
assert SPEC is not None and SPEC.loader is not None
GEN = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(GEN)


class GeneratorIntegrityTest(unittest.TestCase):
    def test_authenticated_window_and_exceptional_entries(self) -> None:
        _manifest, entries, hashes = GEN.load()
        self.assertEqual(len(entries), 1907)
        self.assertEqual(
            [entry["output_clause_index"] for entry in entries],
            list(range(GEN.FIRST, GEN.LAST + 1)),
        )
        self.assertEqual(hashes, GEN.EXPECTED_WINDOWS)
        actual = [
            {
                "output": entry["output_clause_index"],
                "source": entry["source_core_clause_index"],
                "schema": entry["canonical_schema"],
                "orientation": entry["canonical_orientation"],
                "dense_literals": entry["dense_literals"],
                "source_literals": entry["source_core_literals"],
            }
            for entry in entries
            if entry["slot"] == "schema5Forward"
        ]
        self.assertEqual(actual, GEN.EXPECTED_SCHEMA5_FORWARD)


if __name__ == "__main__":
    unittest.main()
