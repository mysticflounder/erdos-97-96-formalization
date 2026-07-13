from __future__ import annotations

import unittest

from census.atail_force import reduction
from census.atail_force import three_center_surface as surface


class ThreeCenterSurfaceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.report, cls.classes = surface.load_inventory()

    def test_pinned_inventory_and_all_local_cuts_replay(self) -> None:
        self.assertEqual(len(self.classes), surface.EXPECTED_CLASS_COUNT)
        self.assertEqual(
            self.report["full_inventory_sha256"],
            surface.EXPECTED_INVENTORY_SHA256,
        )
        self.assertEqual(
            {joint.membership_incidence_count for joint in self.classes},
            {12},
        )

    def test_constructed_systems_match_closed_form_dimensions(self) -> None:
        choices = [
            self.classes[0],
            max(self.classes, key=lambda joint: joint.interior_point_count),
            self.classes[-1],
        ]
        for joint in choices:
            with self.subTest(class_id=joint.class_id):
                system = surface.build_system(
                    joint,
                    surface.canonical_decoration(joint),
                )
                expected = surface.expected_system_size(joint)
                self.assertEqual(len(system.vars), expected["variables"])
                self.assertEqual(len(system.eqs), expected["equalities"])
                self.assertEqual(len(system.ge), expected["weak_inequalities"])
                self.assertEqual(len(system.gt), expected["strict_inequalities"])
                self.assertEqual(
                    len(surface.equality_separators(system)),
                    expected["equality_separators"],
                )

    def test_lazy_order_enumerator_is_exact_on_a_nontrivial_small_row(self) -> None:
        joint = next(
            row
            for row in self.classes
            if 1 < surface.order_decoration_count(row) <= 100
        )
        decorations = list(surface.iter_order_decorations(joint))
        self.assertEqual(len(decorations), surface.order_decoration_count(joint))
        self.assertEqual(len(set(decorations)), len(decorations))
        for decoration in decorations:
            for cap in surface.CAPS:
                self.assertCountEqual(decoration.block(cap), joint.cap_masks(cap))

    def test_order_multiset_mismatch_is_rejected(self) -> None:
        joint = self.classes[0]
        order = surface.canonical_decoration(joint)
        bad = surface.OrderDecoration(order.s + (1,), order.o1, order.o2)
        with self.assertRaises(surface.SurfaceError):
            surface.build_system(joint, bad)

    def test_collapsed_equilateral_witness_replays_and_detects_mutation(self) -> None:
        joint = self.classes[0]
        order = surface.canonical_decoration(joint)
        system = surface.build_equality_system(joint, order)
        substitutions = surface.collapsed_equilateral_substitution(joint, order)
        verified, failures = surface.verify_equalities(system, substitutions)
        self.assertTrue(verified, failures)
        substitutions["ru2"] += 1
        mutated, _failures = surface.verify_equalities(system, substitutions)
        self.assertFalse(mutated)

    def test_decorated_s3_action_round_trips_a_noncanonical_order(self) -> None:
        joint = next(
            row
            for row in self.classes
            if 2 <= surface.order_decoration_count(row) <= 100
        )
        order = list(surface.iter_order_decorations(joint))[-1]
        lookup = {reduction.class_signature(row): row for row in self.classes}
        for permutation in reduction.PERMUTATIONS:
            with self.subTest(permutation=permutation):
                target = lookup[
                    reduction.transform_class_signature(
                        reduction.class_signature(joint), permutation
                    )
                ]
                transformed = reduction.transform_decoration(
                    joint, order, permutation, target
                )
                restored = reduction.transform_decoration(
                    target,
                    transformed,
                    reduction.inverse_permutation(permutation),
                    joint,
                )
                self.assertEqual(restored, order)


if __name__ == "__main__":
    unittest.main()
