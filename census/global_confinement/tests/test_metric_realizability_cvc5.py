# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import shutil
import unittest

from census.global_confinement.metric_realizability_cvc5 import (
    STAGES,
    _frontier,
    _id_digest,
    _is_timeout_diagnostic,
    _parse_status,
    build_smt2,
    run_smoke,
)
from census.global_confinement.metric_realizability_probe import (
    DEFAULT_INPUTS,
    _smoke_systems,
    extract_systems,
)


class MetricRealizabilityCvc5Tests(unittest.TestCase):
    def test_status_parser_ignores_diagnostics(self) -> None:
        self.assertEqual(_parse_status("warning\nunknown\n"), "UNKNOWN")
        self.assertEqual(_parse_status("sat\n(model omitted)\n"), "SAT")
        self.assertIsNone(_parse_status("parse error\n"))

    def test_timeout_diagnostic_is_not_a_solver_error(self) -> None:
        self.assertTrue(_is_timeout_diagnostic("cvc5 interrupted by timeout."))
        self.assertFalse(_is_timeout_diagnostic("parse error"))

    def test_formula_stages_match_constraint_ledger(self) -> None:
        sat_system, _unsat_system = _smoke_systems()
        expected = {
            "exact-metric-relaxation": (3, 10, 0, 0),
            "full-convex": (3, 10, 15, 0),
            "convex-only-relaxation": (3, 10, 15, 0),
        }
        for stage in STAGES:
            smt2, counts = build_smt2(sat_system, stage)
            self.assertEqual(
                (
                    counts.get("row_equalities", 0),
                    counts.get("distinctness", 0),
                    counts.get("convex_order", 0),
                    counts.get("exact_exclusions", 0),
                ),
                expected[stage],
            )
            self.assertIn("(set-logic QF_NRA)", smt2)
            self.assertTrue(smt2.endswith("(check-sat)\n(exit)\n"))

    def test_row_subset_removes_unselected_row_assertions(self) -> None:
        _sat_system, unsat_system = _smoke_systems()
        _smt2, all_counts = build_smt2(
            unsat_system, "exact-metric-relaxation"
        )
        smt2, subset_counts = build_smt2(
            unsat_system, "exact-metric-relaxation", (0,)
        )
        self.assertEqual(subset_counts["selected_rows"], 1)
        self.assertLess(subset_counts["total"], all_counts["total"])
        self.assertIn("; selected row 0", smt2)
        self.assertNotIn("; selected row 1", smt2)

    def test_equality_atom_subset_is_explicit(self) -> None:
        sat_system, _unsat_system = _smoke_systems()
        smt2, counts = build_smt2(
            sat_system,
            "convex-only-relaxation",
            (0,),
            ((0, 2),),
        )
        self.assertEqual(counts["row_equalities"], 1)
        self.assertIn("; selected equality atom 0:2", smt2)
        self.assertNotIn("; selected equality atom 0:3", smt2)

    def test_saved_frontier_has_stable_ids(self) -> None:
        systems, _extraction = extract_systems(DEFAULT_INPUTS)
        frontier = _frontier(systems)
        self.assertEqual(len(frontier), 30)
        self.assertEqual(
            _id_digest(system["system_id"] for system in frontier),
            "085f332d753a3ca693230196643fc68c504afbd5ca99863a4433ab8ee97092d2",
        )

    @unittest.skipUnless(
        shutil.which("cvc5") or __import__("pathlib").Path("/Users/adam/bin/cvc5").is_file(),
        "cvc5 is not installed",
    )
    def test_cvc5_smoke_gate(self) -> None:
        cvc5 = shutil.which("cvc5") or "/Users/adam/bin/cvc5"
        result = run_smoke(cvc5, 10.0)
        self.assertTrue(result["passed"], result)


if __name__ == "__main__":
    unittest.main()
