#!/usr/bin/env python3
"""Regression checks for the P4 21-row cap-residual ledger materializer."""

from __future__ import annotations

import importlib.util
import re
import unittest
from pathlib import Path


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location(
    "right_cap_materializer", HERE / "materialize_right_cap_residual_ledger.py"
)
assert SPEC and SPEC.loader
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)

LEAN_SOURCE = HERE / "RightCapOccurrences.lean"
LEAN_FAMILY = {
    "selectedRowEndpointOwnCapAtMostOne1":
        "selected_row_endpoint_own_cap_at_most_one_1",
    "selectedRowOwnCapAtMostTwo2": "selected_row_own_cap_at_most_two_2",
    "selectedRowEndpointOwnCapAtMostOne2":
        "selected_row_endpoint_own_cap_at_most_one_2",
}
LEAN_ENTRY = re.compile(
    r"\{\s*outputClause := (\d+), sourceCoreClause := (\d+), "
    r"sourceTerminalClause := (\d+),\s*"
    r"sourceFamily := \.(\w+),\s*"
    r"sourceCoreLiterals := \[([^\]]*)\], "
    r"sourceTerminalLiterals := \[([^\]]*)\],\s*"
    r"shape := .*?, clause := \[([^\]]*)\] \}",
    re.DOTALL,
)


def parse_ints(text: str) -> list[int]:
    return [int(value.strip()) for value in text.split(",") if value.strip()]


class RightCapResidualLedgerTest(unittest.TestCase):
    def test_exact_output_set_and_provenance(self) -> None:
        records = MODULE.select_records()
        self.assertEqual(
            [record["output_clause_index"] for record in records],
            list(MODULE.EXPECTED_OUTPUTS),
        )
        self.assertEqual(len(records), 21)
        for record in records:
            self.assertIsInstance(record["source_core_clause_index"], int)
            self.assertIsInstance(record["source_terminal_clause_index"], int)
            self.assertEqual(record["dense_literals"], [int(x) for x in record["dense_literals"]])
            self.assertTrue(record["source_core_literals"])
            self.assertTrue(record["source_terminal_literals"])

    def test_lean_table_matches_materialized_provenance(self) -> None:
        materialized = MODULE.select_records()
        lean_entries = LEAN_ENTRY.findall(LEAN_SOURCE.read_text(encoding="utf-8"))
        self.assertEqual(len(lean_entries), 21)
        for record, lean_entry in zip(materialized, lean_entries, strict=True):
            output, core, terminal, family, core_lits, terminal_lits, dense_lits = lean_entry
            self.assertEqual(int(output), record["output_clause_index"])
            self.assertEqual(int(core), record["source_core_clause_index"])
            self.assertEqual(int(terminal), record["source_terminal_clause_index"])
            self.assertEqual(LEAN_FAMILY[family], record["family"])
            self.assertEqual(parse_ints(core_lits), record["source_core_literals"])
            self.assertEqual(parse_ints(terminal_lits), record["source_terminal_literals"])
            self.assertEqual(parse_ints(dense_lits), record["dense_literals"])


if __name__ == "__main__":
    unittest.main()
