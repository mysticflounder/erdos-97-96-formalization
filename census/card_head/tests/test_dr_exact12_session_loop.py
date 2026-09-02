"""Tests for the pure parts of the D-R exact-12 session loop (no piqc calls)."""

from __future__ import annotations

import unittest

from census.card_head import dr_exact12_session_loop as loop
from census.card_head import dr_exact12_structural as dr


class Pure(unittest.TestCase):
    def _model(self):
        cnf, layout = dr.build(geometry=False)
        assignment = [-v for v in range(1, cnf.n_variables + 1)]

        def on(v: int) -> None:
            assignment[v - 1] = v

        for z in (1, 6, 8, 9):
            on(layout.x[z])
        for z in (3, 7, 10, 11):
            on(layout.y[z])
        for z in (3, 6, 7, 8):
            on(layout.u[z])
        chi = {z: (dr.A1 if z in (3, 6, 7, 8) else 3) for z in dr.LABELS}
        for z, c in chi.items():
            on(layout.chi[(z, c)])
        on(layout.src[9])
        on(layout.deleted[6])
        on(layout.b2y)
        # classes: at a1 the class {3,6,7,8}; at 3 one class {0,1,2,4} and one {5,9,10,11}
        def same(center: int, a: int, b: int) -> int:
            first, second = sorted((dr._EDGE_INDEX[(min(center, a), max(center, a))], dr._EDGE_INDEX[(min(center, b), max(center, b))]))
            return layout.relation_variables[(first, second)]

        for center, klass in ((1, (3, 6, 7, 8)), (3, (0, 1, 2, 4)), (3, (5, 9, 10, 11))):
            for a in klass:
                for b in klass:
                    if a < b:
                        on(same(center, a, b))
        return cnf, layout, assignment

    def test_signature_and_blocking_clause(self) -> None:
        cnf, layout, assignment = self._model()
        pattern = dr.decode(layout, assignment)
        signature = loop.signature_of(pattern)
        self.assertEqual((signature.x, signature.source, signature.deleted, signature.b2), ((1, 6, 8, 9), 9, 6, "Y"))
        shells = {z: (c, k) for z, c, k in signature.shells}
        self.assertEqual(shells[6], (1, (3, 6, 7, 8)))
        self.assertEqual(shells[0], (3, (0, 1, 2, 4)))
        self.assertEqual(shells[9], (3, (5, 9, 10, 11)))
        clause = loop.blocking_clause(layout, signature)
        truth = {abs(l): l > 0 for l in assignment}
        # the blocking clause is falsified by exactly this model ...
        self.assertFalse(any(truth[abs(l)] == (l > 0) for l in clause))
        self.assertTrue(all(l < 0 for l in clause))
        # ... and the pinned literals are the selectors plus 3 relation literals per point
        # 15 selector literals, 12 blocker selectors, 6 relation literals per pinned four-class (three classes)
        self.assertEqual(len(clause), 15 + 12 + 3 * 6)

    def test_lazy_clauses_on_a_planted_core(self) -> None:
        cnf, layout, assignment = self._model()

        def equal(first: int, second: int) -> int:
            return layout.relation_variables[(min(first, second), max(first, second))]

        planted = dr.core_clause("seven_point_six_row_anchor", (0, 1, 2, 3, 4, 6, 7), equal)
        for literal in planted:
            assignment[abs(literal) - 1] = abs(literal)
        counts, clauses = loop.lazy_clauses(layout, assignment)
        self.assertGreaterEqual(counts["seven_point_six_row_anchor"], 1)
        self.assertIn(tuple(sorted(planted, key=abs)), {tuple(sorted(c, key=abs)) for c in clauses})
        truth = {abs(l): l > 0 for l in assignment}
        for clause in clauses:
            self.assertFalse(any(truth[abs(l)] == (l > 0) for l in clause))

    def test_dimacs_of_clauses(self) -> None:
        self.assertEqual(loop._clauses_dimacs([(1, -2), (3,)], 3), b"p cnf 3 2\n1 -2 0\n3 0\n")


if __name__ == "__main__":
    unittest.main()
