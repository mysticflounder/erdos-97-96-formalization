from __future__ import annotations

import shutil
import unittest
from pathlib import Path

import sympy as sp

from census.atail_force import cvc5_pilot


class Cvc5PilotTests(unittest.TestCase):
    def test_status_parser(self) -> None:
        self.assertEqual(cvc5_pilot._parse_status("warning\nunknown\n"), "UNKNOWN")
        self.assertEqual(cvc5_pilot._parse_status("sat\n"), "SAT")
        self.assertEqual(cvc5_pilot._parse_status("unsat\n"), "UNSAT")
        self.assertIsNone(cvc5_pilot._parse_status("parse error\n"))

    def test_exact_polynomial_encoder(self) -> None:
        x, y = sp.symbols("x y", real=True)
        encoded = cvc5_pilot._poly_smt2(
            sp.Rational(3, 2) * x**2 - x * y - sp.Rational(5, 3),
            (x, y),
        )
        self.assertIn("(/ 3 2)", encoded)
        self.assertIn("x x", encoded)
        self.assertIn("(- (* x y))", encoded)
        self.assertIn("(/ (- 5) 3)", encoded)

    def test_frozen_cases_translate_with_exact_counts(self) -> None:
        manifest = cvc5_pilot.build_manifest()
        self.assertEqual(len(manifest["cases"]), 7)
        for case in manifest["cases"]:
            smt2, counts = cvc5_pilot.build_smt2(case)
            self.assertTrue(smt2.startswith("(set-logic QF_NRA)\n"))
            self.assertTrue(smt2.endswith("(check-sat)\n(exit)\n"))
            self.assertEqual(counts["variables"], case["variables"])
            self.assertEqual(counts["equalities"], case["equalities"])
            self.assertEqual(
                counts["weak_inequalities"], case["weak_inequalities"]
            )
            self.assertEqual(
                counts["strict_inequalities"], case["strict_inequalities"]
            )
            self.assertEqual(
                counts["assertions"],
                case["equalities"]
                + case["weak_inequalities"]
                + case["strict_inequalities"],
            )

    @unittest.skipUnless(
        shutil.which("cvc5") or Path("/Users/adam/bin/cvc5").is_file(),
        "cvc5 is not installed",
    )
    def test_cvc5_smoke_gate(self) -> None:
        result = cvc5_pilot._smoke(
            cvc5_pilot._find_cvc5(), use_nice=False
        )
        self.assertTrue(result["passed"], result)


if __name__ == "__main__":
    unittest.main()
