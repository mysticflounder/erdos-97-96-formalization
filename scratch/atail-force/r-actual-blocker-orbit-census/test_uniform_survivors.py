#!/usr/bin/env python3
"""Regression tests for uniform equality-shadow survivors.

These tests certify only the encoded equality/incidence shadow.  They do not
test or claim Euclidean realizability.
"""

from __future__ import annotations

from copy import deepcopy
import unittest

from domain import validate_orbit_model
from uniform_survivors import (
    EqualityShadowError,
    FINITE_WITNESS_NOTE,
    MIN_UNIFORM_PERIOD,
    SHELL_DIFFERENCES,
    all_omission_survivor,
    apex_row,
    construct_uniform_survivor,
    extend_with_isolated_points,
    pair_key,
    shell,
    some_hit_survivor,
    validate_equality_shadow,
)


class UniformSurvivorTests(unittest.TestCase):
    def test_every_period_eleven_through_one_hundred(self) -> None:
        for period in range(11, 101):
            for query in ("some_hit", "all_omission"):
                with self.subTest(period=period, query=query):
                    model = construct_uniform_survivor(period, query)
                    self.assertEqual(model["point_count"], period + 1)
                    validate_equality_shadow(model)

    def test_one_isolated_point_preserves_all_rows_for_every_period(self) -> None:
        for period in range(11, 101):
            for constructor in (some_hit_survivor, all_omission_survivor):
                with self.subTest(period=period, constructor=constructor.__name__):
                    model = constructor(period)
                    old_shells = [shell(model, index) for index in range(period)]
                    old_apex_rows = [
                        apex_row(model, index) for index in range(period)
                    ]
                    extended = extend_with_isolated_points(model, 1)
                    validate_equality_shadow(extended)
                    self.assertEqual(
                        old_shells,
                        [shell(extended, index) for index in range(period)],
                    )
                    self.assertEqual(
                        old_apex_rows,
                        [apex_row(extended, index) for index in range(period)],
                    )

    def test_many_isolated_points_have_globally_fresh_colors(self) -> None:
        for period in (11, 20, 50, 100):
            for constructor in (some_hit_survivor, all_omission_survivor):
                with self.subTest(period=period, constructor=constructor.__name__):
                    model = constructor(period)
                    extended = extend_with_isolated_points(model, 7)
                    validate_equality_shadow(extended)
                    old_count = model["point_count"]
                    new_colors = [
                        extended["edge_colors"][pair_key(left, right)]
                        for left in range(extended["point_count"])
                        for right in range(left + 1, extended["point_count"])
                        if right >= old_count
                    ]
                    self.assertEqual(len(new_colors), len(set(new_colors)))
                    self.assertTrue(
                        set(new_colors).isdisjoint(model["edge_colors"].values())
                    )

    def test_shell_formula_and_query_witnesses(self) -> None:
        for period in (11, 12, 37):
            for query in ("some_hit", "all_omission"):
                model = construct_uniform_survivor(period, query)
                for center_index in range(period):
                    expected = {
                        1 + ((center_index - difference) % period)
                        for difference in SHELL_DIFFERENCES
                    }
                    source_index = (center_index - 1) % period
                    self.assertEqual(shell(model, source_index), expected)
                if query == "some_hit":
                    self.assertTrue(any(model["hits"]))
                else:
                    self.assertFalse(any(model["hits"]))

    def test_period_eleven_odd_hit_partition_is_valid(self) -> None:
        model = some_hit_survivor(11)
        rows = {frozenset(apex_row(model, index)) for index in range(11)}
        self.assertEqual(
            rows,
            {
                frozenset((1, 11)),
                frozenset((2, 5, 8)),
                frozenset((3, 4)),
                frozenset((6, 7)),
                frozenset((9, 10)),
            },
        )
        validate_equality_shadow(model)

    def test_schema_remains_compatible_with_original_validator(self) -> None:
        for query in ("some_hit", "all_omission"):
            validate_orbit_model(construct_uniform_survivor(11, query))

    def test_exact_shell_mutation_is_rejected(self) -> None:
        model = some_hit_survivor(11)
        blocker = model["sources"][1]
        support_point = next(point for point in shell(model, 0) if point != 1)
        model["edge_colors"][pair_key(blocker, support_point)] = (
            max(model["edge_colors"].values()) + 1
        )
        with self.assertRaisesRegex(EqualityShadowError, "cardinality four"):
            validate_equality_shadow(model)

    def test_three_common_point_mutation_is_rejected(self) -> None:
        model = extend_with_isolated_points(some_hit_survivor(11), 2)
        center_a, center_b = 12, 13
        fresh = max(model["edge_colors"].values()) + 1
        for point in (1, 2, 3):
            model["edge_colors"][pair_key(center_a, point)] = fresh
            model["edge_colors"][pair_key(center_b, point)] = fresh + 1
        with self.assertRaisesRegex(EqualityShadowError, "three common points"):
            validate_equality_shadow(model)

    def test_extension_is_nonmutating_and_rejects_bad_counts(self) -> None:
        model = all_omission_survivor(11)
        original = deepcopy(model)
        self.assertEqual(extend_with_isolated_points(model, 0), model)
        self.assertEqual(model, original)
        for bad_count in (-1, 1.5, True):
            with self.subTest(bad_count=bad_count):
                with self.assertRaises(ValueError):
                    extend_with_isolated_points(model, bad_count)

    def test_periods_six_through_ten_are_explicitly_out_of_formula_scope(self) -> None:
        self.assertEqual(MIN_UNIFORM_PERIOD, 11)
        self.assertIn("Periods 6..10", FINITE_WITNESS_NOTE)
        for period in range(6, 11):
            with self.subTest(period=period):
                with self.assertRaisesRegex(ValueError, "separate finite"):
                    some_hit_survivor(period)


if __name__ == "__main__":
    unittest.main()
