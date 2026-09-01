"""Tests for the D-R exact-12 structural CNF (no solver runs)."""

from __future__ import annotations

import unittest
from itertools import combinations

from census.card_head import dr_exact12_structural as dr


class Build(unittest.TestCase):
    def test_counts_and_determinism(self) -> None:
        cnf, layout = dr.build()
        again, _ = dr.build()
        self.assertEqual(cnf.dimacs(), again.dimacs())
        self.assertEqual(len(layout.edges), 66)
        self.assertEqual(len(layout.relation_variables), 2145)
        self.assertEqual(cnf.counts["transitivity"], 137_280)
        self.assertEqual(cnf.counts["duplicate_three_point_center"], 7_920)
        self.assertEqual(cnf.counts["k4_everywhere"], 12 * (330 * 6 + 1))
        self.assertEqual(len(layout.chi), 11 + 11 * 10)
        self.assertEqual(sorted(layout.deleted), [0, 2, 6, 7, 8, 9, 10, 11])
        header = cnf.dimacs().split(b"\n", 1)[0]
        self.assertEqual(header, f"p cnf {cnf.n_variables} {len(cnf.clauses)}".encode())

    def test_control_adds_ten_units(self) -> None:
        base, _ = dr.build()
        five, _ = dr.build("five-at-second-apex")
        self.assertEqual(len(five.clauses) - len(base.clauses), 10)
        self.assertEqual(five.clauses[:len(base.clauses)], base.clauses)
        self.assertTrue(all(len(c) == 1 for c in five.clauses[len(base.clauses):]))

    def test_every_family_is_in_the_ledger(self) -> None:
        cnf, _ = dr.build("five-at-second-apex")
        families = set(cnf.counts) - {"control"}
        self.assertEqual(families, {entry["family"] for entry in dr.SOURCE_CLAUSE_LEDGER})

    def test_manifest_hashes_dimacs(self) -> None:
        cnf, _ = dr.build()
        payload = dr.manifest(cnf, "none")
        self.assertEqual(payload["n_clauses"], len(cnf.clauses))
        self.assertFalse(payload["promotion_eligible"])


class Checker(unittest.TestCase):
    def _pattern(self, **overrides: object) -> dr.Pattern:
        # A deliberately inconsistent but well-formed pattern: X, Y, U as full
        # classes, singletons elsewhere.  The checker must report the missing
        # four-classes and blockers, not crash.
        classes = {c: tuple((z,) for z in dr.others(c)) for c in dr.LABELS}
        classes[dr.A2] = ((1, 6, 8, 9), (3, 7, 10, 11), (2,), (4,), (5,))
        classes[dr.A1] = ((6, 7, 8, 3), (0,), (2,), (4,), (5,), (9,), (10,), (11,))
        fields = {
            "classes": classes, "x": (1, 6, 8, 9), "y": (3, 7, 10, 11), "u": (3, 6, 7, 8),
            "chi": {z: (dr.A1 if z in (3, 6, 7, 8) else 3) for z in dr.LABELS},
            "source": 9, "deleted": 6, "b2": "Y",
        }
        fields.update(overrides)
        return dr.Pattern(**fields)  # type: ignore[arg-type]

    def test_reports_missing_four_classes(self) -> None:
        problems = dr.check_pattern(self._pattern())
        self.assertTrue(any("no four-class" in p for p in problems))
        self.assertTrue(any("blocker" in p for p in problems))

    def test_reports_five_class(self) -> None:
        classes = {c: tuple((z,) for z in dr.others(c)) for c in dr.LABELS}
        classes[dr.A2] = ((1, 3, 6, 8, 9), (7, 10, 11), (2,), (4,), (5,))
        problems = dr.check_pattern(self._pattern(classes=classes))
        self.assertIn("five-class at a2", problems)

    def test_decode_roundtrip_of_selectors(self) -> None:
        cnf, layout = dr.build()
        assignment = [-v for v in range(1, cnf.n_variables + 1)]
        # make x, y, u, chi, src, deleted, b2 selectors true consistently
        for z in (1, 6, 8, 9):
            assignment[layout.x[z] - 1] = layout.x[z]
        for z in (3, 7, 10, 11):
            assignment[layout.y[z] - 1] = layout.y[z]
        for z in (3, 6, 7, 8):
            assignment[layout.u[z] - 1] = layout.u[z]
        for z in dr.LABELS:
            c = dr.A1 if z in (3, 6, 7, 8) else 3
            assignment[layout.chi[(z, c)] - 1] = layout.chi[(z, c)]
        assignment[layout.src[9] - 1] = layout.src[9]
        assignment[layout.deleted[6] - 1] = layout.deleted[6]
        assignment[layout.b2y - 1] = layout.b2y
        pattern = dr.decode(layout, assignment)
        self.assertEqual((pattern.x, pattern.y, pattern.u), ((1, 6, 8, 9), (3, 7, 10, 11), (3, 6, 7, 8)))
        self.assertEqual((pattern.source, pattern.deleted, pattern.b2), (9, 6, "Y"))
        self.assertTrue(all(len(k) == 1 for c in dr.LABELS for k in pattern.classes[c]))


if __name__ == "__main__":
    unittest.main()
