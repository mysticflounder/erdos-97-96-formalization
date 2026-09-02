"""Tests for the D-R exact-12 structural CNF (no solver runs)."""

from __future__ import annotations

import unittest
from itertools import combinations
from types import SimpleNamespace

from census.card_head import dr_exact12_structural as dr

PURE_GEOMETRY_FAMILIES = (
    "transitivity",
    "duplicate_three_point_center",
    "perp_bisector",
    "two_circle_same_arc",
) + dr.EAGER_CORES
EAGER_COUNTS = {
    "equal_k4": 2_970,
    "equilateral_bisector": 95_040,
    "hinge_five_cycle": 95_040,
    "equilateral_chain_bisector": 665_280,
    "hinge_six_tail": 665_280,
    "hinge_six_double_spoke": 665_280,
    "six_point_five_row_interlock": 665_280,
    "six_point_six_row_interlock": 665_280,
    "convex_five_point": 31_680,
    "nested_equal_chord": 7_920,
    "six_point_two_circle_order": 11_088,
    "six_point_nested_center_order": 33_264,
    "six_point_circle_chain_order": 133_056,
    "six_point_two_circle_arc_overtake_order": 44_352,
    "convex_rhombus": 16_632,
    "five_point_circle_isosceles_order": 7_920,
}


class Build(unittest.TestCase):
    def test_counts_and_determinism(self) -> None:
        cnf, layout = dr.build()
        again, _ = dr.build()
        self.assertEqual(cnf.dimacs(), again.dimacs())
        self.assertEqual(len(layout.edges), 66)
        self.assertEqual(len(layout.relation_variables), 2145)
        self.assertEqual(cnf.counts["transitivity"], 137_280)
        self.assertEqual(cnf.counts["duplicate_three_point_center"], 7_920)
        self.assertEqual(cnf.counts["perp_bisector"], 7_920)
        self.assertEqual(cnf.counts["two_circle_same_arc"], 1_980)
        for name, count in EAGER_COUNTS.items():
            self.assertEqual(cnf.counts[name], count, name)
        self.assertEqual(cnf.counts["k4_everywhere"], 12 * (330 * 6 + 1))
        self.assertEqual(len(cnf.clauses), 252_432 + 7_920 + 1_980 + sum(EAGER_COUNTS.values()))
        self.assertEqual(len(cnf.clauses), 4_067_694)
        self.assertEqual(set(EAGER_COUNTS), set(dr.EAGER_CORES))
        self.assertEqual(len(layout.chi), 11 + 11 * 10)
        self.assertEqual(sorted(layout.deleted), [0, 2, 6, 7, 8, 9, 10, 11])
        header = cnf.dimacs().split(b"\n", 1)[0]
        self.assertEqual(header, f"p cnf {cnf.n_variables} {len(cnf.clauses)}".encode())

    def test_no_geometry_reproduces_wave_one(self) -> None:
        cnf, _ = dr.build(geometry=False)
        self.assertEqual(len(cnf.clauses), 252_432)
        self.assertNotIn("perp_bisector", cnf.counts)
        self.assertNotIn("hinge_six_tail", cnf.counts)
        self.assertFalse(dr.manifest(cnf, "none", geometry=False)["geometry"])

    def test_control_adds_ten_units(self) -> None:
        base, _ = dr.build()
        five, _ = dr.build("five-at-second-apex")
        self.assertEqual(len(five.clauses) - len(base.clauses), 10)
        self.assertEqual(five.clauses[:len(base.clauses)], base.clauses)
        self.assertTrue(all(len(c) == 1 for c in five.clauses[len(base.clauses):]))

    def test_every_family_is_in_the_ledger(self) -> None:
        cnf, _ = dr.build("five-at-second-apex")
        families = set(cnf.counts) - {"control"}
        ledger = {entry["family"] for entry in dr.SOURCE_CLAUSE_LEDGER}
        # generic cores are ledgered by the table entry, one clause family per core
        self.assertEqual(families, (ledger - {"generic_cores"}) | set(dr.EAGER_CORES))
        self.assertIn("generic_cores", ledger)

    def test_manifest_hashes_dimacs(self) -> None:
        cnf, _ = dr.build()
        payload = dr.manifest(cnf, "none")
        self.assertEqual(payload["n_clauses"], len(cnf.clauses))
        self.assertFalse(payload["promotion_eligible"])


class Geometry(unittest.TestCase):
    """The three label-generic rules agree with the audited B1 generators and
    admit a known realizable pattern."""

    @staticmethod
    def _family_clauses(cnf: dr.CNF, family: str) -> set[tuple[int, ...]]:
        # clauses are appended per family in build order; recover by name
        start = 0
        for name, count in cnf.counts.items():
            if name == family:
                return {tuple(sorted(c)) for c in cnf.clauses[start:start + count]}
            start += count
        raise AssertionError(family)

    def test_geometry_matches_b1_generators(self) -> None:
        from census.card_head.b1_exact12_static_convex import _convex_clause_delta
        from census.card_head.b1_exact12_static_geometry import (
            EXPECTED_EQUILATERAL_BISECTOR_CLAUSES,
            EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES,
            _cached_geometry_clause_delta,
        )

        cnf, layout = dr.build()
        b1_geometry = _cached_geometry_clause_delta(
            layout.edges, tuple(sorted(layout.relation_variables.items()))
        )
        cut = EXPECTED_EQUILATERAL_BISECTOR_CLAUSES
        cut2 = cut + EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES
        b1_equilateral = {tuple(sorted(c)) for c in b1_geometry[:cut]}
        b1_chain = {tuple(sorted(c)) for c in b1_geometry[cut:cut2]}
        b1_perp = {
            tuple(sorted(c))
            for c in _convex_clause_delta(
                SimpleNamespace(edges=layout.edges, relation_variables=dict(layout.relation_variables))
            )
        }
        self.assertEqual(self._family_clauses(cnf, "equilateral_bisector"), b1_equilateral)
        self.assertEqual(self._family_clauses(cnf, "equilateral_chain_bisector"), b1_chain)
        self.assertEqual(self._family_clauses(cnf, "perp_bisector"), b1_perp)
        self.assertTrue(all(len(c) == 6 for c in b1_equilateral))
        self.assertTrue(all(len(c) == 8 for c in b1_chain))

    def test_regular_twelve_gon_satisfies_pure_geometry_families(self) -> None:
        # positive control: the distance-equality pattern of a regular 12-gon
        # (chord class = cyclic gap) is realizable, so every pure-geometry
        # clause must hold on it.
        cnf, layout = dr.build()

        def gap(edge: tuple[int, int]) -> int:
            # label ``l`` sits at position POSITION[l] of the cyclic order
            d = abs(int(dr.POSITION[edge[0]]) - int(dr.POSITION[edge[1]]))
            return min(d, 12 - d)

        truth = {}
        for (i, j), var in layout.relation_variables.items():
            truth[var] = gap(layout.edges[i]) == gap(layout.edges[j])
        start = 0
        checked = 0
        for name, count in cnf.counts.items():
            if name in PURE_GEOMETRY_FAMILIES:
                for clause in cnf.clauses[start:start + count]:
                    self.assertTrue(
                        any(truth[abs(lit)] == (lit > 0) for lit in clause), (name, clause)
                    )
                    checked += 1
            start += count
        self.assertEqual(checked, 137_280 + 7_920 + 7_920 + 1_980 + sum(EAGER_COUNTS.values()))
        matrix = dr.relation_matrix(layout, [v if truth[v] else -v for v in truth])
        for name in dr.LAZY_CORES:
            self.assertEqual(len(dr.core_violations(name, matrix)), 0, name)

    def test_row_cores_match_b1_instances(self) -> None:
        # the six B1-mined finite instances are instances of our generic tables
        from census.card_head import b1_exact12_static_geometry as b1

        cnf, layout = dr.build()

        def equal(first: int, second: int) -> int:
            return layout.relation_variables[(min(first, second), max(first, second))]

        b1_geometry = b1._cached_geometry_clause_delta(
            layout.edges, tuple(sorted(layout.relation_variables.items()))
        )
        finite = [tuple(sorted(c)) for c in b1_geometry[-6:]]
        ours = [
            tuple(sorted(dr.core_clause("seven_point_six_row_anchor", b1.SEVEN_POINT_SIX_ROW_ANCHOR_INSTANCES[0], equal))),
            tuple(sorted(dr.core_clause("seven_point_six_row_interlock", b1.SEVEN_POINT_SIX_ROW_INTERLOCK_INSTANCES[0], equal))),
            tuple(sorted(dr.core_clause("six_point_five_row_interlock", b1.SIX_POINT_FIVE_ROW_INTERLOCK_INSTANCES[0], equal))),
            tuple(sorted(dr.core_clause("seven_point_seven_row_interlock", b1.SEVEN_POINT_SEVEN_ROW_INTERLOCK_INSTANCES[0], equal))),
            tuple(sorted(dr.core_clause("six_point_six_row_interlock", b1.SIX_POINT_SIX_ROW_INTERLOCK_INSTANCES[0], equal))),
            tuple(sorted(dr.core_clause("seven_point_equilateral_median_interlock", b1.SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_INSTANCES[0], equal))),
        ]
        self.assertEqual(ours, finite)
        six_five = self._family_clauses(cnf, "six_point_five_row_interlock")
        self.assertIn(finite[2], six_five)

    def test_order_instances_respect_the_cyclic_order(self) -> None:
        # convex_five_point keeps exactly the instances whose two triples have
        # one orientation; the count is half of all injective 5-tuples
        rows = dr.core_instances("convex_five_point")
        self.assertEqual(len(rows), 95_040 // 2)
        for row in rows[:200]:
            a, x, b, c, y = (int(v) for v in row)
            pos = {z: int(dr.POSITION[z]) for z in (a, x, b, c, y)}

            def forward(i: int, j: int, k: int) -> bool:
                return (pos[j] - pos[i]) % 12 < (pos[k] - pos[i]) % 12

            self.assertEqual(forward(a, x, b), forward(b, c, y))
        # the isosceles core: W, X on different arcs of FZ and chords FX, PZ crossing
        for row in dr.core_instances("five_point_circle_isosceles_order")[:200]:
            w, f, p_, x, z = (int(v) for v in row)
            self.assertFalse(dr._same_arc(f, z, w, x))
            self.assertFalse(dr._same_arc(f, x, p_, z))

    def test_core_violations_detects_a_planted_core(self) -> None:
        cnf, layout = dr.build(geometry=False)

        def equal(first: int, second: int) -> int:
            return layout.relation_variables[(min(first, second), max(first, second))]

        labels = (0, 1, 2, 3, 4, 5, 6)
        clause = dr.core_clause("hinge_seven_closed_tail", labels, equal)
        assignment = [-v for v in range(1, cnf.n_variables + 1)]
        for literal in clause:
            assignment[abs(literal) - 1] = abs(literal)
        matrix = dr.relation_matrix(layout, assignment)
        hits = dr.core_violations("hinge_seven_closed_tail", matrix)
        self.assertIn(labels, {tuple(int(x) for x in row) for row in hits})


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
