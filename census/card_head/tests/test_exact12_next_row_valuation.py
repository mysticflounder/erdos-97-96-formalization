from __future__ import annotations

import copy
import unittest
from dataclasses import replace

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_next_row_valuation import (
    XU,
    XV,
    C,
    Exact12NextRowValuationError,
    U,
    added_constraints_hold,
    cells,
    compile_cell,
    decode_distinguished_d,
    frozen_next_row_only_hit_dichotomy_holds,
)
from census.card_head.exact12_v14_valuation import SOURCE_FAITHFUL_PYTHON_PROFILE
from census.card_head.source_faithful_candidate_surface import (
    SourceFaithfulCoverInstance,
)

CELL = cells()[0]


def fresh_instance() -> SourceFaithfulCoverInstance:
    return SourceFaithfulCoverInstance(build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE))


def replay_fixture() -> tuple[dict[int, set[int]], dict[int, int]]:
    """Return a positive five-distinct witness for placement zero."""

    blockers = {U: XV, XV: C, XU: 3, 0: 4, 2: 5}
    cube = {
        0: {C, XU, 3, 4},
        1: {U, 0, 2, XV},
        2: {3, 4, 5},
        3: {XU, 0, 4, 5},
        4: {0, 2, 3, 5},
        5: {2, XV, 3, 4},
        6: {3, 4, 5},
        7: {U, XV, 3, 4},
        8: {U, XU, 3, 4},
        9: {3, 4, 5},
        10: {3, 4, 5},
        11: {3, 4, 5},
    }
    return cube, blockers


class Exact12NextRowValuationTest(unittest.TestCase):
    def test_all_twelve_placements_compile_deterministically(self) -> None:
        first = compile_cell(fresh_instance(), CELL)
        second = compile_cell(fresh_instance(), CELL)
        self.assertEqual(first, second)
        self.assertEqual(first.manifest(), second.manifest())
        self.assertEqual(len(cells()), 12)
        for cell in cells():
            self.assertEqual(compile_cell(fresh_instance(), cell).cell, cell)

    def test_manifest_uses_fresh_nonclosing_schema(self) -> None:
        manifest = compile_cell(fresh_instance(), CELL).manifest()
        self.assertEqual(
            manifest["schema"],
            "p97_rigid221_exact12_next_row_only_hit_compiler.v2",
        )
        self.assertEqual(
            manifest["semantic_status"], "FINITE_SOURCE_PREDICATE_COMPILER"
        )
        self.assertIn("no terminal", manifest["scope"])
        self.assertEqual(
            manifest["lean_ingress_theorem"],
            "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
            "exists_source_normalized_nextRowOnlyHitJob",
        )
        self.assertNotIn("proof_verified", manifest)

    def test_five_distinct_arm_replays(self) -> None:
        cube, blockers = replay_fixture()
        self.assertTrue(
            frozen_next_row_only_hit_dichotomy_holds(CELL, cube, blockers, 0)
        )
        self.assertTrue(added_constraints_hold(CELL, cube, blockers, 0))

    def test_reciprocal_collision_arm_replays(self) -> None:
        cube, blockers = replay_fixture()
        cube[3] = {C, XU, 0, 4}
        self.assertEqual(blockers[XU], 3)
        self.assertTrue(
            frozen_next_row_only_hit_dichotomy_holds(CELL, cube, blockers, 3)
        )
        self.assertTrue(added_constraints_hold(CELL, cube, blockers, 3))

    def test_neither_dichotomy_arm_is_rejected(self) -> None:
        cube, blockers = replay_fixture()
        blockers[0] = 0
        self.assertFalse(
            frozen_next_row_only_hit_dichotomy_holds(CELL, cube, blockers, 0)
        )
        self.assertFalse(added_constraints_hold(CELL, cube, blockers, 0))

    def test_exact_d_row_signs_are_required(self) -> None:
        cube, blockers = replay_fixture()
        for removed in (C, XU):
            with self.subTest(removed=removed):
                changed = copy.deepcopy(cube)
                changed[0].remove(removed)
                self.assertFalse(added_constraints_hold(CELL, changed, blockers, 0))
        for inserted in (U, XV):
            with self.subTest(inserted=inserted):
                changed = copy.deepcopy(cube)
                changed[0].add(inserted)
                self.assertFalse(added_constraints_hold(CELL, changed, blockers, 0))

    def test_v14_distinguished_row_sign_is_incompatible(self) -> None:
        cube, blockers = replay_fixture()
        cube[0].remove(XU)
        self.assertFalse(added_constraints_hold(CELL, cube, blockers, 0))

    def test_distinguished_d_may_be_xu(self) -> None:
        cube, blockers = replay_fixture()
        cube[XU] = {C, XU, 3, 4}
        self.assertTrue(added_constraints_hold(CELL, cube, blockers, XU))

    def test_exact_frozen_class_rows_are_not_silently_weakened(self) -> None:
        cube, blockers = replay_fixture()
        changed_one = copy.deepcopy(cube)
        changed_one[1].add(XU)
        self.assertFalse(added_constraints_hold(CELL, changed_one, blockers, 0))

        changed_seven = copy.deepcopy(cube)
        changed_seven[C].add(XU)
        self.assertFalse(added_constraints_hold(CELL, changed_seven, blockers, 0))

    def test_decode_d_requires_exactly_one_selector(self) -> None:
        compiled = compile_cell(fresh_instance(), CELL)
        variables = compiled.distinguished_d_variables
        first, second = list(variables)[:2]
        self.assertEqual(decode_distinguished_d({variables[first]}, variables), first)
        with self.assertRaisesRegex(Exact12NextRowValuationError, "selects 0"):
            decode_distinguished_d(set(), variables)
        with self.assertRaisesRegex(Exact12NextRowValuationError, "selects 2"):
            decode_distinguished_d(
                {variables[first], variables[second]}, variables
            )

    def test_tampered_placement_and_reused_instance_fail_closed(self) -> None:
        with self.assertRaisesRegex(Exact12NextRowValuationError, "coordinates"):
            compile_cell(fresh_instance(), replace(CELL, v=3))
        instance = fresh_instance()
        compile_cell(instance, CELL)
        with self.assertRaisesRegex(Exact12NextRowValuationError, "pristine"):
            compile_cell(instance, CELL)


if __name__ == "__main__":
    unittest.main()
