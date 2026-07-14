from __future__ import annotations

import json
import unittest

from census.atail_force import producer_surface as surface


def assignment(
    case: surface.ProducerCase,
    first: tuple[int, ...],
    second: tuple[int, ...],
) -> surface.ApexClassAssignment:
    first_exact = surface.ExactApexClass(
        "opp_apex1", case.opp_apex1, first
    )
    second_exact = surface.ExactApexClass(
        "opp_apex2", case.opp_apex2, second
    )
    return surface.ApexClassAssignment(
        opp_apex1_exact=first_exact,
        opp_apex2_exact=second_exact,
        opp_apex1_selected_four=next(
            surface.iter_selected_four_witnesses(first_exact)
        ),
        opp_apex2_selected_four=next(
            surface.iter_selected_four_witnesses(second_exact)
        ),
    )


class ProducerSurfaceTests(unittest.TestCase):
    def test_cases_are_explicit_role_aware_and_oriented(self) -> None:
        self.assertEqual(
            [(case.cardinality, case.profile) for case in surface.PRODUCER_CASES],
            [(11, (5, 5, 4)), (12, (6, 5, 4)), (12, (5, 5, 5))],
        )
        for case in surface.PRODUCER_CASES:
            with self.subTest(case=case.case_id):
                frame = surface.frame_for_case(case)
                self.assertEqual(frame.n, case.cardinality)
                self.assertEqual(case.cap_roles.surplus, "S")
                self.assertEqual(case.cap_roles.second_large, "O1")
                self.assertEqual(case.cap_roles.remaining, "O2")
                self.assertEqual(
                    frozenset((case.opp_apex1, case.opp_apex2)),
                    surface.mc.CAP_VERTS[case.cap_roles.surplus],
                )
        self.assertEqual(
            surface.case_by_id("card12_profile_654").profile,
            (6, 5, 4),
        )

    def test_exact_five_class_is_distinct_from_selected_four_witness(self) -> None:
        case = surface.case_by_id("card12_profile_555")
        exact = next(
            row
            for row in surface.iter_exact_apex_classes(case, "opp_apex1")
            if len(row.support) == 5
        )
        witnesses = tuple(surface.iter_selected_four_witnesses(exact))
        self.assertEqual(len(witnesses), 5)
        self.assertTrue(all(len(witness.support) == 4 for witness in witnesses))
        self.assertTrue(all(set(witness.support) < set(exact.support) for witness in witnesses))
        for witness in witnesses:
            surface.validate_selected_four_witness(case, exact, witness)

    def test_second_apex_cardinality_options_match_the_finite_classifier(self) -> None:
        expected = {
            "card11_profile_554": (4,),
            "card12_profile_654": (4,),
            "card12_profile_555": (4, 5),
        }
        for case in surface.PRODUCER_CASES:
            with self.subTest(case=case.case_id):
                self.assertEqual(case.opp_apex1_exact_sizes, (5,))
                self.assertEqual(case.opp_apex2_exact_sizes, expected[case.case_id])
                observed = {
                    len(row.support)
                    for row in surface.iter_exact_apex_classes(case, "opp_apex2")
                }
                self.assertEqual(observed, set(expected[case.case_id]))

    def test_no_shared_pair_negation_accepts_one_common_off_surplus_label(self) -> None:
        case = surface.case_by_id("card11_profile_554")
        off = surface.off_surplus_labels(case)
        surplus = sorted(surface.closed_cap(surface.frame_for_case(case), "S"))
        interior = next(
            label
            for label in surplus
            if label not in (case.opp_apex1, case.opp_apex2)
        )
        first = tuple(sorted((off[0], off[1], off[2], off[3], interior)))
        second = tuple(sorted((off[0], off[4], off[5], interior)))
        data = assignment(case, first, second)
        encoded = surface.encode_no_shared_off_surplus_pair_negation(case, data)
        self.assertEqual(surface.shared_off_surplus_labels(case, data), (off[0],))
        self.assertTrue(surface.no_shared_off_surplus_pair(case, data))
        self.assertTrue(encoded.holds)
        self.assertEqual(len(encoded.clauses), len(off) * (len(off) - 1) // 2)
        self.assertTrue(all(clause.satisfied for clause in encoded.clauses))

    def test_no_shared_pair_negation_rejects_two_common_off_surplus_labels(self) -> None:
        case = surface.case_by_id("card12_profile_654")
        off = surface.off_surplus_labels(case)
        surplus = sorted(surface.closed_cap(surface.frame_for_case(case), "S"))
        interior = next(
            label
            for label in surplus
            if label not in (case.opp_apex1, case.opp_apex2)
        )
        first = tuple(sorted((off[0], off[1], off[2], off[3], interior)))
        second = tuple(sorted((off[0], off[1], off[4], interior)))
        data = assignment(case, first, second)
        encoded = surface.encode_no_shared_off_surplus_pair_negation(case, data)
        self.assertEqual(surface.shared_off_surplus_pairs(case, data), ((off[0], off[1]),))
        self.assertFalse(surface.no_shared_off_surplus_pair(case, data))
        self.assertFalse(encoded.holds)
        rejected = [clause for clause in encoded.clauses if not clause.satisfied]
        self.assertEqual([clause.pair for clause in rejected], [(off[0], off[1])])

    def test_assignment_validation_rejects_noncanonical_or_noncontained_rows(self) -> None:
        case = surface.case_by_id("card12_profile_555")
        exact = surface.ExactApexClass(
            "opp_apex1", case.opp_apex1, (0, 2, 3, 4, 5)
        )
        bad_order = surface.SelectedFourWitness(
            "opp_apex1", case.opp_apex1, (3, 2, 4, 5)
        )
        with self.assertRaises(surface.ProducerSurfaceError):
            surface.validate_selected_four_witness(case, exact, bad_order)
        outside = surface.SelectedFourWitness(
            "opp_apex1", case.opp_apex1, (0, 2, 3, 6)
        )
        with self.assertRaises(surface.ProducerSurfaceError):
            surface.validate_selected_four_witness(case, exact, outside)

    def test_surface_document_has_explicit_encoded_and_omitted_ledgers(self) -> None:
        document = surface.build_surface_document()
        self.assertEqual(document["schema"], surface.SCHEMA)
        self.assertFalse(document["scope"]["solver_invoked"])
        self.assertTrue(document["scope"]["producer_negation_encoded"])
        self.assertTrue(document["ledger"]["ENCODED"])
        self.assertTrue(document["ledger"]["OMITTED"])
        self.assertTrue(
            any("CriticalShellSystem" in item for item in document["ledger"]["OMITTED"])
        )
        for record in document["cases"]:
            self.assertGreater(
                record["surface_counts"]["negated_producer_pair_clause_count"],
                0,
            )

    def test_canonical_json_is_deterministic_and_round_trips(self) -> None:
        document = surface.build_surface_document()
        first = surface.canonical_json(document)
        second = surface.canonical_json(document)
        self.assertEqual(first, second)
        self.assertTrue(first.endswith("\n"))
        self.assertEqual(json.loads(first), document)


if __name__ == "__main__":
    unittest.main()
