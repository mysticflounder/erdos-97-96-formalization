#!/usr/bin/env python3
"""Unit and artifact controls for the v4 ExactOffCircleCore separator."""

from __future__ import annotations

import importlib.util
import json
import re
import sys
import unittest
from pathlib import Path

HERE = Path(__file__).resolve().parent


def load_incidence():
    spec = importlib.util.spec_from_file_location(
        "v4_incidence_tests", HERE / "incidence_round.py"
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


class ExactOffCircleTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.incidence = load_incidence()

    def test_canonical_edge(self) -> None:
        self.assertEqual(self.incidence.canonical_edge(8, 3), (3, 8))
        self.assertEqual(self.incidence.canonical_edge(3, 8), (3, 8))
        with self.assertRaises(ValueError):
            self.incidence.canonical_edge(3, 3)

    def test_known_v3_assignment_is_rejected(self) -> None:
        assignment = json.loads(self.incidence.KNOWN_V3_ASSIGNMENT.read_text())
        witnesses = self.incidence.find_exact_off_circle_witnesses(assignment)
        self.assertTrue(witnesses)
        self.assertTrue(
            any(
                witness["center"] == 8 and witness["off_support_point"] == 13
                for witness in witnesses
            )
        )
        for cut_id, witness in enumerate(witnesses):
            cut = self.incidence.enrich_cut(witness, cut_id, -1)
            self.assertEqual(self.incidence.validate_cut(cut, assignment), [])

    def test_final_assignment_is_closure_clean(self) -> None:
        assignment = json.loads(self.incidence.FINAL_ASSIGNMENT.read_text())
        self.assertEqual(self.incidence.find_exact_off_circle_witnesses(assignment), [])

    def test_final_queries_have_one_check_sat(self) -> None:
        paths = [self.incidence.FINAL_QUERY]
        paths.extend((HERE / "generated" / "metric").glob("*.smt2"))
        self.assertTrue(paths)
        for path in paths:
            text = path.read_text()
            self.assertEqual(len(re.findall(r"\(\s*check-sat\b", text)), 1, path)
            self.assertNotIn("(model-add", text, path)


if __name__ == "__main__":
    unittest.main()
