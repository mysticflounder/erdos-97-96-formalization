from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from census.f_gamma.encoding import (
    E,
    O,
    OVERLAP_TERMINAL,
    TWO_CAP_CENTERS_TERMINAL,
    FGammaInstance,
    RowSpec,
    run_smoke,
)


class FGammaSmokeTests(unittest.TestCase):
    def test_row_id_is_not_a_center(self):
        with self.assertRaisesRegex(ValueError, "RowId"):
            RowSpec("same", "same", False)

    def test_handcrafted_base_assignment_is_total_and_satisfying(self):
        instance = FGammaInstance()
        assignment = instance.handcrafted_total_assignment()
        self.assertTrue(instance.validates_total_assignment(assignment))
        self.assertNotIn(instance.variable(instance.cap_source_row, E), assignment)
        self.assertNotIn(instance.variable(instance.cap_source_row, O), assignment)

    def test_terminal_clauses_have_lean_provenance(self):
        instance = FGammaInstance()
        tags = set(instance.clause_provenance.values())
        self.assertTrue(any(OVERLAP_TERMINAL in tag for tag in tags))
        self.assertTrue(any(TWO_CAP_CENTERS_TERMINAL in tag for tag in tags))

    def test_smoke_gates_have_verified_drat(self):
        scratch = Path.cwd() / "scratch"
        scratch.mkdir(exist_ok=True)
        with tempfile.TemporaryDirectory(prefix="f_gamma_test_", dir=scratch) as directory:
            results = run_smoke(Path(directory), timeout_seconds=30)
        self.assertTrue(results["handcrafted_base_assignment"])
        self.assertEqual(results["base"].verdict, "SAT")
        for name in (
            "selected-four-overlap-at-least-three",
            "two-distinct-cap-centres-share-e-o",
        ):
            self.assertEqual(results[name].verdict, "UNSAT")
            self.assertTrue(results[name].proof_verified)


if __name__ == "__main__":
    unittest.main()
