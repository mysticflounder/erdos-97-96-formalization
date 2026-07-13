from __future__ import annotations

import itertools
import unittest

from census.card_head.candidate_surface import build_model, cube_ok
from census.card_head.sat_encoding import CNF, CoverInstance, EncodingError


def clause_satisfied(clause, true_variables):
    return any(
        (literal > 0 and literal in true_variables)
        or (literal < 0 and -literal not in true_variables)
        for literal in clause
    )


class SatEncodingTests(unittest.TestCase):
    def test_sinz_at_most_one_has_exact_truth_table(self):
        cnf = CNF()
        inputs = [cnf.new_variable() for _ in range(3)]
        cnf.at_most_sinz(inputs, 1)
        auxiliaries = list(range(4, cnf.n_variables + 1))
        for bits in itertools.product((False, True), repeat=3):
            fixed = {variable for variable, bit in zip(inputs, bits) if bit}
            satisfiable = any(
                all(clause_satisfied(clause, fixed | selected) for clause in cnf.clauses)
                for aux_bits in itertools.product((False, True), repeat=len(auxiliaries))
                for selected in [
                    {
                        variable
                        for variable, bit in zip(auxiliaries, aux_bits)
                        if bit
                    }
                ]
            )
            self.assertEqual(satisfiable, sum(bits) <= 1)

    @classmethod
    def setUpClass(cls):
        cls.model = build_model(12, (6, 5, 4))
        cls.instance = CoverInstance(cls.model)

    def test_card12_654_base_encoding_matches_historical_size(self):
        self.assertEqual(self.instance.base_n_variables, 37310)
        self.assertEqual(self.instance.base_n_clauses, 297119)

    def test_representative_card13_and_card14_encoding_sizes_are_pinned(self):
        expected = {
            (13, (5, 5, 6)): (63966, 635654, 485202),
            (14, (5, 5, 7)): (101122, 1210260, 972279),
        }
        for (cardinality, profile), sizes in expected.items():
            with self.subTest(cardinality=cardinality, profile=profile):
                instance = CoverInstance(build_model(cardinality, profile))
                self.assertEqual(
                    (
                        instance.base_n_variables,
                        instance.base_n_clauses,
                        instance.n_c2_clauses,
                    ),
                    sizes,
                )

    def test_c2_violation_has_the_direct_nand_clause(self):
        first = self.instance.candidate_index(3, {0, 1, 7, 8})
        second = self.instance.candidate_index(4, {0, 1, 7, 9})
        expected = (
            -self.instance.choice_variables[(3, first)],
            -self.instance.choice_variables[(4, second)],
        )
        self.assertIn(expected, self.instance.cnf.clauses)

    def test_pattern_indicator_and_dimacs_header_are_exact(self):
        instance = CoverInstance(self.model)
        containing = instance.candidate_index(3, {4, 5, 7, 10})
        choice = instance.choice_variables[(3, containing)]
        instance.add_pattern_instance({3: {4, 5}})
        indicator = instance.pattern_variables[(3, frozenset({4, 5}))]
        self.assertIn((-choice, indicator), instance.cnf.clauses)
        self.assertEqual(instance.exclusion_clauses[-1], (-indicator,))
        clauses = instance.clauses_with()
        header, *body = instance.dimacs().splitlines()
        self.assertEqual(header, f"p cnf {instance.cnf.n_variables} {len(clauses)}")
        self.assertEqual(len(body), len(clauses))

    def test_decode_model_requires_one_choice_and_rechecks_cube(self):
        with self.assertRaisesRegex(EncodingError, "selects 0"):
            self.instance.decode_model(set())
        malformed = {center: [0, 1, 2, 3] for center in range(12)}
        self.assertFalse(cube_ok(self.model, malformed))


if __name__ == "__main__":
    unittest.main()
