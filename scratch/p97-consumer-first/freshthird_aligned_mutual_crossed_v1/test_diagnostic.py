"""Regression tests for the crossed exact-17 diagnostic harness."""

from __future__ import annotations

import json
import re
import unittest

import diagnostic


class DiagnosticTests(unittest.TestCase):
    def test_emitted_queries_have_one_check_sat(self) -> None:
        for path in diagnostic.GENERATED.glob("*.smt2"):
            text = path.read_text(encoding="utf-8")
            self.assertEqual(len(re.findall(r"\(\s*check-sat\b", text)), 1, path)

    def test_assignment_has_independent_validation(self) -> None:
        assignment = json.loads(diagnostic.ASSIGNMENT_JSON.read_text(encoding="utf-8"))
        self.assertEqual(diagnostic.verify_assignment(assignment), [])

    def test_global_assignment_has_independent_validation(self) -> None:
        assignment = json.loads(
            diagnostic.GLOBAL_ASSIGNMENT_JSON.read_text(encoding="utf-8")
        )
        self.assertEqual(diagnostic.verify_global_assignment(assignment), [])

    def test_metric_fixture_equalities_and_exactness(self) -> None:
        self.assertEqual(diagnostic.verify_metric_fixture(exact=False), [])
        self.assertEqual(diagnostic.verify_metric_fixture(exact=True), [])

    def test_protocol_classifier_fail_closed(self) -> None:
        self.assertEqual(
            diagnostic.classify_solver_response(1, "sat\n", "boom")["status"],
            "ERROR",
        )
        self.assertEqual(
            diagnostic.classify_solver_response(0, "sat\nunsat\n", "")["status"],
            "ERROR",
        )
        self.assertEqual(
            diagnostic.classify_solver_response(0, "", "")["status"], "ERROR"
        )
        self.assertEqual(
            diagnostic.classify_solver_response(0, "unknown\n", "")["status"],
            "UNKNOWN",
        )


if __name__ == "__main__":
    unittest.main()
