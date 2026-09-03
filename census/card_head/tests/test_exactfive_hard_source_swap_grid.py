"""Pure tests for the exact-five hard source-swap order/equality scaffold."""

from __future__ import annotations

import itertools
import math
import unittest
from dataclasses import replace
from fractions import Fraction
from unittest import mock

from census.card_head import exactfive_hard_source_swap_grid as grid


class Profiles(unittest.TestCase):
    def test_branch_four_collapsed_subcase_is_first(self) -> None:
        self.assertEqual(grid.BRANCH_ORDER[0], grid.BRANCH_FOUR)
        profile = grid.BRANCH_FOUR_COLLAPSED_PROFILE
        self.assertEqual(len(profile.roles), 14)
        self.assertEqual(dict(profile.fixed_blocks)["oppInterior2"], ("u", "v", "x", "y"))
        self.assertEqual(profile.rows[2].support, ("O", "a", "u", "v"))

    def test_branch_three_does_not_smuggle_in_O(self) -> None:
        profile = grid.BRANCH_THREE_COLLAPSED_PROFILE
        self.assertEqual(len(profile.roles), 15)
        self.assertNotIn("O", profile.rows[2].support)
        self.assertIn("w", profile.rows[2].support)
        self.assertEqual(dict(profile.fixed_blocks)["oppInterior2"], ())

    def test_row_equalities_are_exact_and_deterministic(self) -> None:
        constraints = grid.row_equalities(grid.BRANCH_FOUR_COLLAPSED_PROFILE)
        self.assertEqual(len(constraints), 13)
        self.assertEqual(
            constraints, grid.row_equalities(grid.BRANCH_FOUR_COLLAPSED_PROFILE)
        )
        self.assertTrue(all(atom.kind == "equality" for atom in constraints))

    def test_provenance_names_real_fields_and_truthful_T0_chain(self) -> None:
        t0, k1 = grid.COMMON_ROWS
        self.assertIn("class_card_eq_five", t0.source)
        self.assertIn("firstApexClass_support_eq", t0.source)
        self.assertIn("unproved named-support identification", t0.source)
        self.assertIn(".blockerClass", k1.source)
        self.assertNotIn("firstBlockerClass", k1.source)


class SourceAliasProfiles(unittest.TestCase):
    def test_exact_regime_counts_and_unique_stable_ids(self) -> None:
        profiles = tuple(grid.iter_source_alias_profiles())
        counts = {
            regime: sum(profile.regime == regime for profile in profiles)
            for regime in grid.ALIAS_REGIMES
        }
        self.assertEqual(counts[grid.ALIAS_COLLAPSED], 961)
        self.assertEqual(counts[grid.ALIAS_SEPARATE], 6_642)
        self.assertEqual(len(profiles), 7_603)
        self.assertEqual(len({profile.classes for profile in profiles}), 7_603)
        self.assertEqual(len({profile.profile_id for profile in profiles}), 7_603)
        self.assertEqual(
            profiles[0].profile_id,
            "e434c8aad283c55b3e51bbbc4aed96f7b3e67bdbc3efc8cff58086c26adf1505",
        )
        self.assertEqual(
            grid.source_alias_profile_counts(),
            {
                grid.ALIAS_COLLAPSED: 961,
                grid.ALIAS_SEPARATE: 6_642,
                "total": 7_603,
            },
        )

    def test_alias_enumerator_enforces_the_source_rules(self) -> None:
        for profile in grid.iter_source_alias_profiles():
            grid.validate_source_alias_profile(profile)
            by_role = {
                role: klass for klass in profile.classes for role in klass
            }
            self.assertLessEqual(len(profile.p_s_matching), 1)
            self.assertLessEqual(len(profile.p_u_matching), 1)
            self.assertTrue(
                {left for left, _right in profile.p_s_matching}.isdisjoint(
                    left for left, _right in profile.p_u_matching
                )
            )
            self.assertTrue(
                all(by_role["c1"] != by_role[role] for role in ("d", "e", "x", "y"))
            )
            self.assertTrue(
                all(by_role["c1"] != by_role[role] for role in ("O", "a", "u", "v"))
            )
            if profile.c2_host is not None:
                self.assertTrue(set(profile.c2_host) & {"p", "q", "s", "t"})
                self.assertTrue(set(profile.c2_host).isdisjoint({"u", "v"}))
            for replacement, host in profile.replacement_hosts:
                actual = tuple(
                    role for role in by_role[replacement] if role != replacement
                )
                self.assertEqual(actual, () if host is None else host)
                self.assertTrue(set(actual) <= {"p", "q", "s", "t", "U"})
            if profile.regime == grid.ALIAS_COLLAPSED:
                self.assertEqual(by_role["c1"], ("U", "c1"))
            else:
                self.assertNotEqual(by_role["c1"], by_role["U"])

    def test_alias_enumerator_is_lazy_and_does_not_construct_orders(self) -> None:
        with mock.patch.object(
            grid, "iter_order_cells", side_effect=AssertionError("order generator called")
        ):
            prefix = tuple(itertools.islice(grid.iter_source_alias_profiles(), 4))
        self.assertEqual(len(prefix), 4)
        self.assertTrue(
            all(
                profile.payload()["claim_boundary"]
                == "source_alias_only_no_order_or_live_coverage"
                for profile in prefix
            )
        )

    def test_inconsistent_host_metadata_is_rejected(self) -> None:
        profile = next(grid.iter_source_alias_profiles(grid.ALIAS_COLLAPSED))
        with self.assertRaisesRegex(grid.HardSourceSwapGridError, "host record"):
            grid.validate_source_alias_profile(
                replace(profile, surplus_apex_host=None)
            )


class OrderCells(unittest.TestCase):
    def test_direct_mirror_pair_covers_the_collapsed_profile(self) -> None:
        direct, mirror = tuple(
            grid.iter_order_cells(grid.BRANCH_FOUR_COLLAPSED_PROFILE, limit=2)
        )
        self.assertEqual((direct.orientation, mirror.orientation), ("direct", "mirror"))
        self.assertEqual(
            set(direct.order), set(grid.BRANCH_FOUR_COLLAPSED_PROFILE.roles)
        )
        self.assertEqual(
            set(mirror.order), set(grid.BRANCH_FOUR_COLLAPSED_PROFILE.roles)
        )
        self.assertEqual(direct.order[0], "O")
        self.assertEqual(mirror.order[0], "O")
        grid.validate_cell(direct)
        grid.validate_cell(mirror)

    def test_generation_is_deterministic(self) -> None:
        first = tuple(
            grid.iter_order_cells(grid.BRANCH_FOUR_COLLAPSED_PROFILE, limit=8)
        )
        second = tuple(
            grid.iter_order_cells(grid.BRANCH_FOUR_COLLAPSED_PROFILE, limit=8)
        )
        self.assertEqual(first, second)
        self.assertEqual([cell.cell_id for cell in first], [cell.cell_id for cell in second])

    def test_branch_three_generation_stays_lazy(self) -> None:
        first = next(
            grid.iter_order_cells(grid.BRANCH_THREE_COLLAPSED_PROFILE, limit=1)
        )
        self.assertEqual(first.branch, grid.BRANCH_THREE)
        self.assertEqual(
            set(first.order), set(grid.BRANCH_THREE_COLLAPSED_PROFILE.roles)
        )

    def test_count_matches_bruteforce_assignment_formula(self) -> None:
        profile = grid.BRANCH_FOUR_COLLAPSED_PROFILE
        fixed = {name: len(roles) for name, roles in profile.fixed_blocks}
        expected = 0
        for assignment in itertools.product(grid.BLOCKS, repeat=4):
            sizes = dict(fixed)
            for block in assignment:
                sizes[block] += 1
            expected += 2 * math.prod(math.factorial(sizes[name]) for name in grid.BLOCKS)
        self.assertEqual(grid.order_cell_count(profile), expected)

    def test_kalmanson_family_has_two_forms_per_quadruple(self) -> None:
        cell = next(
            grid.iter_order_cells(grid.BRANCH_FOUR_COLLAPSED_PROFILE, limit=1)
        )
        constraints = grid.kalmanson_constraints(cell)
        self.assertEqual(len(constraints), 2 * math.comb(14, 4))
        self.assertTrue(all(atom.kind == "strict" for atom in constraints))

    def test_branch_four_symmetry_key_is_swap_invariant(self) -> None:
        cell = next(
            grid.iter_order_cells(grid.BRANCH_FOUR_COLLAPSED_PROFILE, limit=1)
        )
        swapped = grid.rename_cell_roles(cell, {"p": "q", "q": "p"})
        self.assertNotEqual(cell, swapped)
        self.assertEqual(
            grid.canonicalize_branch_four_collapsed_cell(cell),
            grid.canonicalize_branch_four_collapsed_cell(swapped),
        )
        self.assertEqual(
            grid.branch_four_collapsed_quotient_key(cell),
            grid.branch_four_collapsed_quotient_key(swapped),
        )

    def test_branch_four_quotient_count_and_lazy_prefix(self) -> None:
        self.assertEqual(grid.branch_four_collapsed_quotient_cell_count(), 102_960)
        prefix = tuple(grid.iter_branch_four_collapsed_quotient_cells(limit=6))
        self.assertEqual(len(prefix), 6)
        self.assertTrue(
            all(
                cell == grid.canonicalize_branch_four_collapsed_cell(cell)
                for cell in prefix
            )
        )
        self.assertEqual(
            grid.branch_four_collapsed_quotient_key(prefix[0]),
            "d0c67797087c327c1d7017e43f8e6ccf0d1d016061b05bad57a156841f5e004d",
        )
        self.assertEqual(
            tuple(grid.iter_branch_four_collapsed_quotient_cells(limit=0)), ()
        )

    def test_collapsed_direct_mirror_zero_form_regression(self) -> None:
        direct, mirror = tuple(
            grid.iter_order_cells(grid.BRANCH_FOUR_COLLAPSED_PROFILE, limit=2)
        )
        direct_zero = grid.collapsed_surplus_apex_zero_kalmanson(direct)
        mirror_zero = grid.collapsed_surplus_apex_zero_kalmanson(mirror)
        self.assertEqual(
            direct_zero.constraint_id, "kal:complementary:O:c2:c1:a"
        )
        self.assertEqual(mirror_zero.constraint_id, "kal:main:O:a:c1:c2")
        self.assertEqual(direct_zero.form, mirror_zero.form)
        self.assertEqual(
            grid.reduce_by_row_equalities(
                grid.BRANCH_FOUR_COLLAPSED_PROFILE, direct_zero.form
            ).terms,
            (),
        )
        orientations = set()
        for cell in grid.iter_order_cells(
            grid.BRANCH_FOUR_COLLAPSED_PROFILE, limit=32
        ):
            orientations.add(cell.orientation)
            zero = grid.collapsed_surplus_apex_zero_kalmanson(cell)
            self.assertEqual(
                grid.reduce_by_row_equalities(
                    grid.BRANCH_FOUR_COLLAPSED_PROFILE, zero.form
                ).terms,
                (),
            )
        self.assertEqual(orientations, {"direct", "mirror"})


class ExactReplay(unittest.TestCase):
    def test_positive_sat_and_sign_direction_control(self) -> None:
        constraints, values = grid.positive_sat_fixture()
        edges = tuple(values)
        replay = grid.replay_constraint_model(constraints, values, require_positive=edges)
        self.assertTrue(replay.ok, replay.failures)

        reversed_main = grid.LinearConstraint(
            "fixture:reversed-main",
            "strict",
            constraints[0].form.scale(-1),
            "negative sign-direction control",
        )
        bad = grid.replay_constraint_model((reversed_main,), values, require_positive=edges)
        self.assertFalse(bad.ok)
        self.assertIn("failed:fixture:reversed-main", bad.failures[0])

    def test_known_unsat_core_replays_exactly(self) -> None:
        constraints, terms = grid.known_unsat_fixture()
        replay = grid.replay_weighted_core(constraints, terms)
        self.assertTrue(replay.ok, replay.failure)
        self.assertEqual(replay.strict_weight, Fraction(1))
        self.assertEqual(replay.residual.terms, ())

    def test_negative_strict_weight_is_rejected(self) -> None:
        constraints, _ = grid.known_unsat_fixture()
        replay = grid.replay_weighted_core(
            constraints, (grid.WeightedTerm("fixture:strict", Fraction(-1)),)
        )
        self.assertFalse(replay.ok)
        self.assertEqual(replay.failure, "negative strict coefficient")

    def test_row_equality_reduction_is_canonical(self) -> None:
        profile = grid.BRANCH_FOUR_COLLAPSED_PROFILE
        form = grid.SignedForm.distance_difference(("O", "a"), ("O", "q"))
        self.assertEqual(grid.reduce_by_row_equalities(profile, form).terms, ())

    def test_distinct_radius_replay_is_exact(self) -> None:
        profile = grid.BRANCH_FOUR_COLLAPSED_PROFILE
        same = grid.replay_distance_disequalities(
            profile, {("c2", "O"): 1, ("c2", "d"): "1"}
        )
        self.assertFalse(same.ok)
        distinct = grid.replay_distance_disequalities(
            profile, {("c2", "O"): 1, ("c2", "d"): "3/2"}
        )
        self.assertTrue(distinct.ok, distinct.failures)


class ClaimBoundary(unittest.TestCase):
    def test_descriptor_is_explicitly_unpromoted(self) -> None:
        payload = grid.descriptor()
        self.assertFalse(payload["promotion_eligible"])
        self.assertIn("conditional_diagnostic", payload["semantic_status"])
        self.assertFalse(payload["false_claims"]["complete_live_branch_census"])
        self.assertTrue(payload["excluded_layers"])

    def test_descriptor_marks_unenforced_source_assumptions(self) -> None:
        payload = grid.descriptor()
        assumptions = {
            item["assumption_id"]: item
            for item in payload["unproved_abstraction_assumptions"]
        }
        required = {
            "named-row-supports",
            "replacement-cap-blocks",
            "named-role-distinctness",
            "first-blocker-equals-surplus-apex",
            "cross-row-alias-partition-is-discrete",
            "full-selected-classes",
        }
        self.assertLessEqual(required, set(assumptions))
        self.assertTrue(all(not assumptions[name]["enforced"] for name in required))
        boundary = payload["enforcement_boundary"]
        self.assertTrue(
            any("c1 ∉ L" in item for item in boundary["metadata_only"])
        )
        self.assertIn("full-class claims", boundary["metadata_only"])
        self.assertIn("conditional", boundary["unsat_status"])
        quotient = payload["branch_four_collapsed_row_symmetry_quotient"]
        self.assertEqual(quotient["quotient_cells"], 102_960)
        self.assertFalse(quotient["reduced_constraint_signature_dedup"])

    def test_descriptor_exposes_alias_only_boundary_and_exact_counts(self) -> None:
        alias = grid.descriptor()["branch_four_source_alias_profiles"]
        self.assertEqual(
            alias["claim_boundary"], "source_alias_only_no_order_or_live_coverage"
        )
        self.assertTrue(alias["solver_free"])
        self.assertFalse(alias["constructs_order_cells"])
        self.assertEqual(
            alias["regime_counts"],
            {grid.ALIAS_COLLAPSED: 961, grid.ALIAS_SEPARATE: 6_642},
        )
        self.assertEqual(alias["total_profiles"], 7_603)
        self.assertIn("c1 ∉ L", alias["encoded_constraints"])
        self.assertTrue(any("cyclic" in item for item in alias["omitted_layers"]))

    def test_descriptor_exposes_missing_live_cases(self) -> None:
        coverage = grid.descriptor()["coverage_boundary"]
        self.assertFalse(coverage["complete_live_branch_census"])
        self.assertEqual(coverage["live_boundary_separators"], ["U", "O", "c2"])
        self.assertEqual(coverage["conditional_identification"], "c1 = U (surplus apex)")
        self.assertIn("U", coverage["missing_live_source_roles"])
        self.assertTrue(
            any("cyclic placement" in case for case in coverage["omitted_live_case_families"])
        )
        self.assertTrue(
            any("alias partitions" in case for case in coverage["omitted_live_case_families"])
        )
        self.assertFalse(
            grid.descriptor()["conditional_zero_form_regression"][
                "live_branch_consequence"
            ]
        )


if __name__ == "__main__":
    unittest.main()
