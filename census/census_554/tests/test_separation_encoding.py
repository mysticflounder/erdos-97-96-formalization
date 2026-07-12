from __future__ import annotations

import unittest
from collections import Counter
from itertools import combinations

from census.census_554.separation_encoding import (
    DIRECT_ROW_SCOPE,
    N_LABELS,
    add_separation_encoding,
    all_orders,
    valid_orders,
    validate_cube_order,
    validate_cube_orders,
)


BASE_VARIABLES = 27_286
BASE_CLAUSES = 207_969
SEPARATED_VARIABLES = 27_904
SEPARATED_CLAUSES = 387_856

POSITIVE_CUBE = {
    0: frozenset({1, 2, 3, 4}),
    1: frozenset({0, 2, 6, 7}),
    2: frozenset({0, 1, 9, 10}),
    3: frozenset({1, 4, 6, 8}),
    4: frozenset({0, 3, 5, 8}),
    5: frozenset({2, 4, 8, 9}),
    6: frozenset({3, 5, 7, 9}),
    7: frozenset({2, 5, 8, 10}),
    8: frozenset({0, 4, 5, 7}),
    9: frozenset({3, 7, 8, 10}),
    10: frozenset({1, 5, 6, 9}),
}


def _one_hit_ok(center: int, members: frozenset[int]) -> bool:
    """Independent copy of the audited candidate-profile predicate."""

    surplus = frozenset({1, 2, 3, 4, 5})
    first_other = frozenset({0, 2, 6, 7, 8})
    second_other = frozenset({0, 1, 9, 10})
    if center == 1:
        return (
            len(members & (surplus - {1})) <= 1
            and len(members & (second_other - {1})) <= 1
        )
    if center == 2:
        return (
            len(members & (surplus - {2})) <= 1
            and len(members & (first_other - {2})) <= 1
        )
    return True


def _candidate_profile() -> dict[int, list[frozenset[int]]]:
    return {
        center: [
            members
            for raw in combinations(
                [point for point in range(N_LABELS) if point != center], 4
            )
            for members in (frozenset(raw),)
            if _one_hit_ok(center, members)
        ]
        for center in range(N_LABELS)
    }


class _CountingCNF:
    """Small CoverInstance-compatible counter retaining only added clauses."""

    def __init__(self) -> None:
        self.n = BASE_VARIABLES
        # The frozen base count is part of the public regression contract.  No
        # base-clause contents are needed by this extension test.
        self.clauses: list[tuple[int, ...] | None] = [None] * BASE_CLAUSES

    def new_var(self) -> int:
        self.n += 1
        return self.n

    def add(self, clause) -> None:
        self.clauses.append(tuple(clause))


class _CoverFixture:
    def __init__(self) -> None:
        self.cand = _candidate_profile()
        self.x = {}
        variable = 1
        for center in range(N_LABELS):
            for candidate_index in range(len(self.cand[center])):
                self.x[(center, candidate_index)] = variable
                variable += 1
        self.cnf = _CountingCNF()


def _chosen_cube(instance: _CoverFixture) -> tuple[dict[int, frozenset[int]], set[int]]:
    cube = {}
    positive_choices = set()
    for center in range(N_LABELS):
        candidate_index = (17 * center + 3) % len(instance.cand[center])
        cube[center] = instance.cand[center][candidate_index]
        positive_choices.add(instance.x[(center, candidate_index)])
    return cube, positive_choices


class SeparationOrderTests(unittest.TestCase):
    def test_exact_direct_and_reflected_order_surfaces(self) -> None:
        orders = all_orders()
        self.assertEqual(len(orders), 144)
        self.assertEqual(len({order.labels for order in orders}), 144)
        self.assertTrue(all(order.orientation == "direct" for order in orders[:72]))
        self.assertTrue(all(order.orientation == "mirror" for order in orders[72:]))

        for direct, mirror in zip(orders[:72], orders[72:]):
            self.assertEqual(direct.internal_index, mirror.internal_index)
            self.assertEqual(direct.labels[0], 0)
            self.assertEqual(set(direct.labels[1:3]), {9, 10})
            self.assertEqual(direct.labels[3], 1)
            self.assertEqual(set(direct.labels[4:7]), {3, 4, 5})
            self.assertEqual(direct.labels[7], 2)
            self.assertEqual(set(direct.labels[8:11]), {6, 7, 8})

            self.assertEqual(mirror.labels[0], 0)
            self.assertEqual(set(mirror.labels[1:4]), {6, 7, 8})
            self.assertEqual(mirror.labels[4], 2)
            self.assertEqual(set(mirror.labels[5:8]), {3, 4, 5})
            self.assertEqual(mirror.labels[8], 1)
            self.assertEqual(set(mirror.labels[9:11]), {9, 10})
            for label in range(N_LABELS):
                reflected = (
                    0 if direct.positions[label] == 0
                    else N_LABELS - direct.positions[label]
                )
                self.assertEqual(mirror.positions[label], reflected)


class SeparationEncodingTests(unittest.TestCase):
    def setUp(self) -> None:
        self.instance = _CoverFixture()
        self.base_clause_count = len(self.instance.cnf.clauses)
        self.encoding = add_separation_encoding(self.instance)

    def test_frozen_card11_counts(self) -> None:
        self.assertEqual(self.encoding.scope, DIRECT_ROW_SCOPE)
        self.assertEqual(len(self.encoding.pair_indicators), 474)
        self.assertEqual(len(self.encoding.order_to_selector), 144)
        self.assertEqual(len(self.encoding.selector_to_order), 144)
        self.assertEqual(self.encoding.bad_types_per_order, 1_168)
        self.assertEqual(set(self.encoding.bad_type_counts), {1_168})

        self.assertEqual(self.encoding.indicator_clause_count, 11_694)
        self.assertEqual(self.encoding.order_clause_count, 168_193)
        self.assertEqual(self.encoding.variable_count, 618)
        self.assertEqual(self.encoding.clause_count, 179_887)
        self.assertEqual(self.instance.cnf.n, SEPARATED_VARIABLES)
        self.assertEqual(len(self.instance.cnf.clauses), SEPARATED_CLAUSES)

    def test_exact_implication_polarity_and_selector_disjunction(self) -> None:
        added = self.instance.cnf.clauses[self.base_clause_count:]
        implication_clauses = added[:self.encoding.indicator_clause_count]
        expected = []
        for center in range(N_LABELS):
            for candidate_index, members in enumerate(self.instance.cand[center]):
                choice = self.instance.x[(center, candidate_index)]
                for pair in combinations(sorted(members), 2):
                    indicator = self.encoding.pair_indicators[(center, pair)]
                    expected.append((-choice, indicator))
        self.assertCountEqual(implication_clauses, expected)
        self.assertTrue(all(first < 0 < second
                            for first, second in implication_clauses))

        selector_clause = added[self.encoding.indicator_clause_count]
        expected_selectors = tuple(
            self.encoding.order_to_selector[order] for order in all_orders()
        )
        self.assertEqual(selector_clause, expected_selectors)
        self.assertEqual(len(selector_clause), 144)
        self.assertTrue(all(literal > 0 for literal in selector_clause))

    def test_independent_cube_validator_matches_conditional_clauses(self) -> None:
        cube, positive = _chosen_cube(self.instance)
        for center, members in cube.items():
            for pair in combinations(sorted(members), 2):
                positive.add(self.encoding.pair_indicators[(center, pair)])

        clauses_by_selector = {
            selector: [] for selector in self.encoding.selector_to_order
        }
        for clause in self.instance.cnf.clauses[self.base_clause_count:]:
            if clause is None or len(clause) != 3:
                continue
            selector = -clause[0]
            if selector in clauses_by_selector:
                clauses_by_selector[selector].append(clause)

        independently_valid = []
        for order in all_orders():
            selector = self.encoding.order_to_selector[order]
            model_positive = positive | {selector}
            encoded_valid = all(
                any(literal > 0 or -literal not in model_positive
                    for literal in clause)
                for clause in clauses_by_selector[selector]
            )
            pure_valid = validate_cube_order(cube, order)
            self.assertEqual(encoded_valid, pure_valid)
            if pure_valid:
                independently_valid.append(order)

        self.assertEqual(valid_orders(cube), tuple(independently_valid))
        self.assertEqual(validate_cube_orders(cube), bool(independently_valid))

    def test_order_selectors_decode_from_positive_variables(self) -> None:
        first = all_orders()[7]
        second = all_orders()[103]
        positive = {
            self.encoding.order_to_selector[first],
            self.encoding.order_to_selector[second],
        }
        self.assertEqual(self.encoding.selected_orders(positive), (first, second))
        self.assertEqual(self.encoding.selected_order(positive), first)
        with self.assertRaisesRegex(ValueError, "no selected separation order"):
            self.encoding.selected_order(set())

    def test_deterministic_positive_cube_and_order_model(self) -> None:
        order = all_orders()[0]
        for center, members in POSITIVE_CUBE.items():
            self.assertIn(members, self.instance.cand[center])
        self.assertTrue(all(
            len(POSITIVE_CUBE[first] & POSITIVE_CUBE[second]) <= 2
            for first, second in combinations(range(N_LABELS), 2)
        ))
        pair_counts = Counter(
            pair
            for members in POSITIVE_CUBE.values()
            for pair in combinations(sorted(members), 2)
        )
        self.assertLessEqual(max(pair_counts.values()), 2)
        self.assertTrue(validate_cube_order(POSITIVE_CUBE, order))
        self.assertIn(order, valid_orders(POSITIVE_CUBE))

        positive = {self.encoding.order_to_selector[order]}
        for center, members in POSITIVE_CUBE.items():
            candidate_index = self.instance.cand[center].index(members)
            positive.add(self.instance.x[(center, candidate_index)])
            for pair in combinations(sorted(members), 2):
                positive.add(self.encoding.pair_indicators[(center, pair)])

        added = self.instance.cnf.clauses[self.base_clause_count:]
        self.assertTrue(all(
            any(
                literal in positive if literal > 0 else -literal not in positive
                for literal in clause
            )
            for clause in added
            if clause is not None
        ))

    def test_validator_rejects_malformed_cube_and_order(self) -> None:
        cube, _ = _chosen_cube(self.instance)
        malformed = dict(cube)
        malformed[0] = frozenset({1, 2, 3})
        with self.assertRaisesRegex(ValueError, "four distinct members"):
            validate_cube_order(malformed, all_orders()[0])
        with self.assertRaisesRegex(ValueError, "each label"):
            validate_cube_order(cube, tuple(range(10)))
        with self.assertRaisesRegex(ValueError, "canonical direct"):
            validate_cube_order(cube, all_orders()[0], scope="arbitrary-relabeling")

    def test_encoding_rejects_malformed_candidates_before_mutation(self) -> None:
        cases = (
            (lambda instance: instance.cand[0].__setitem__(0, (1, 2, 3)),
             "four distinct members"),
            (lambda instance: instance.cand[0].__setitem__(0, (1, 1, 2, 3)),
             "four distinct members"),
            (lambda instance: instance.cand[0].__setitem__(0, (1, 2, 3, 11)),
             "outside 0 through 10"),
            (lambda instance: instance.cand[0].__setitem__(0, (0, 1, 2, 3)),
             "contains its own center"),
            (lambda instance: instance.cand[0].__setitem__(0, (1, 2, 3, "4")),
             "non-integer member"),
        )
        for mutate, message in cases:
            with self.subTest(message=message):
                instance = _CoverFixture()
                mutate(instance)
                with self.assertRaisesRegex(ValueError, message):
                    add_separation_encoding(instance)
                self.assertEqual(instance.cnf.n, BASE_VARIABLES)
                self.assertEqual(len(instance.cnf.clauses), BASE_CLAUSES)

    def test_encoding_requires_complete_distinct_candidate_variables(self) -> None:
        missing = _CoverFixture()
        missing.x.pop((0, 0))
        with self.assertRaisesRegex(ValueError, "exactly one variable"):
            add_separation_encoding(missing)
        self.assertEqual(missing.cnf.n, BASE_VARIABLES)

        extra = _CoverFixture()
        extra.x[(0, len(extra.cand[0]))] = BASE_VARIABLES
        with self.assertRaisesRegex(ValueError, "exactly one variable"):
            add_separation_encoding(extra)
        self.assertEqual(extra.cnf.n, BASE_VARIABLES)

        duplicate = _CoverFixture()
        duplicate.x[(0, 1)] = duplicate.x[(0, 0)]
        with self.assertRaisesRegex(ValueError, "must be distinct"):
            add_separation_encoding(duplicate)
        self.assertEqual(duplicate.cnf.n, BASE_VARIABLES)

        wrong_scope = _CoverFixture()
        with self.assertRaisesRegex(ValueError, "canonical direct"):
            add_separation_encoding(wrong_scope, scope="mirrored-row")
        self.assertEqual(wrong_scope.cnf.n, BASE_VARIABLES)


if __name__ == "__main__":
    unittest.main()
