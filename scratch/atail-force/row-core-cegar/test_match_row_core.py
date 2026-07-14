#!/usr/bin/env python3
"""Unit tests for the scratch row-core CEGAR matcher."""

from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("match_row_core", HERE / "match_row_core.py")
assert SPEC is not None and SPEC.loader is not None
MATCHER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MATCHER)


class RowCoreMatcherTests(unittest.TestCase):
    def test_self_check(self) -> None:
        MATCHER.self_check()

    def test_pinned_saved_shadows(self) -> None:
        report = MATCHER.analyze(MATCHER.DEFAULT_SHADOWS, pin_digest=True)
        self.assertEqual(
            report["scope"],
            "EXACT_EXHAUSTIVE_FOR_THE_TWO_PINNED_SAVED_FINITE_SHADOWS_ONLY",
        )
        self.assertEqual(len(report["cases"]), 2)
        MATCHER.validate_pinned_result(report)

    def test_clause_has_all_seventeen_required_atoms(self) -> None:
        identity = {role: index for index, role in enumerate(MATCHER.ROLES)}
        clause = MATCHER.cegar_clause(identity)
        self.assertEqual(len(clause), 17)
        self.assertEqual(len(set(clause)), 17)


if __name__ == "__main__":
    unittest.main()
