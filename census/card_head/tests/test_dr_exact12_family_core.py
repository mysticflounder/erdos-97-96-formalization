"""Tests for the pure parts of the D-R exact-12 family-core mode (no piqc calls)."""

from __future__ import annotations

import unittest

from census.card_head import dr_exact12_family_core as fc
from census.card_head import dr_exact12_structural as dr


class Relax(unittest.TestCase):
    def test_relax_guards_only_selected_families_and_strips_back(self) -> None:
        cnf, _layout = dr.build(geometry=False)
        self.assertEqual(len(cnf.families), len(cnf.clauses))
        families = fc.selectable_families(cnf)
        self.assertEqual(families, ("duplicate_three_point_center",))
        relaxed = fc.relax(cnf, families)
        self.assertEqual(relaxed.n_variables, cnf.n_variables + 1)
        selector = relaxed.selectors["duplicate_three_point_center"]
        self.assertEqual(selector, cnf.n_variables + 1)
        guarded = sum(1 for clause in relaxed.clauses if -selector in clause)
        self.assertEqual(guarded, cnf.counts["duplicate_three_point_center"])
        for clause, family in zip(relaxed.clauses, cnf.families, strict=True):
            self.assertEqual(-selector in clause, family == "duplicate_three_point_center")
        self.assertEqual(fc.strip(relaxed), tuple(cnf.clauses))
        self.assertNotIn("duplicate_three_point_center", relaxed.hard_families)
        self.assertIn("transitivity", relaxed.hard_families)

    def test_relax_by_group_uses_one_selector_per_label_set(self) -> None:
        cnf, _layout = dr.build(families=("two_circle_same_arc",))
        relaxed = fc.relax(cnf, ("two_circle_same_arc",), by_group=True)
        self.assertEqual(len(relaxed.selectors), 495)  # C(12, 4) label sets {q, v, u, y}
        self.assertTrue(all(key.startswith("two_circle_same_arc:") for key in relaxed.selectors))
        self.assertEqual(sum(1 for c, f in zip(relaxed.clauses, cnf.families, strict=True) if f == "two_circle_same_arc" and -max(relaxed.selectors.values()) <= min(c)), cnf.counts["two_circle_same_arc"])
        self.assertEqual(fc.strip(relaxed), tuple(cnf.clauses))

    def test_selectable_families_follow_the_eager_cores(self) -> None:
        cnf = dr.CNF()
        cnf.new_variable("v")
        for family in ("transitivity", "perp_bisector", "equal_k4", "ingress"):
            cnf.add(family, (1,))
        self.assertEqual(fc.selectable_families(cnf), ("perp_bisector", "equal_k4"))
        with self.assertRaises(dr.DRStructuralError):
            fc.relax(cnf, ("perp_bisector", "perp_bisector"))
        with self.assertRaises(dr.DRStructuralError):
            fc.relax(cnf, ("missing",))


if __name__ == "__main__":
    unittest.main()
