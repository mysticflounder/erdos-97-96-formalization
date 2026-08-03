#!/usr/bin/env python3
"""Focused bounded checks for the unguarded seven-point/eleven-E family."""

from __future__ import annotations

import importlib.util
import itertools
import random
import re
import sys
import unittest
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
PROJECT_ROOT = HERE.parents[4]
MODULE_PATH = HERE / "crossed_arm_cegar.py"
LEAN_ADAPTER_PATH = (
    PROJECT_ROOT
    / "lean/Erdos9796Proof/P97/ATail/"
    "CrossedArmSevenPointEuclideanObstruction.lean"
)
SPEC = importlib.util.spec_from_file_location(
    "crossed_arm_seven_point_collision_under_test", MODULE_PATH
)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"cannot import {MODULE_PATH}")
crossed_arm_cegar = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = crossed_arm_cegar
SPEC.loader.exec_module(crossed_arm_cegar)


FAMILY = crossed_arm_cegar.CROSSED_ARM_SEVEN_POINT_COLLISION_FAMILY
SCHEMA = crossed_arm_cegar.CROSSED_ARM_SEVEN_POINT_COLLISION_SCHEMA
DESIGNATED_POINTS = tuple(range(7))
EXPECTED_LEAN_ADAPTER = (
    "Problem97.CrossedArmSevenPointEuclideanObstruction."
    "false_of_crossed_arm_seven_point_collision_of_injective"
)

# Independent specification of the eleven direct-E antecedents at role order
# (A, P, R, S, U, V, W).  Keep this literal: deriving it from SCHEMA would let
# a production-schema mutation silently change both the implementation and its
# purported oracle.
LITERAL_REQUIRED_ROLE_ATOMS = (
    (0, 1, 3),
    (0, 1, 6),
    (3, 0, 4),
    (3, 0, 5),
    (6, 2, 3),
    (6, 2, 4),
    (1, 5, 6),
    (5, 1, 2),
    (0, 2, 5),
    (2, 1, 4),
    (4, 1, 5),
)


def canonical_atom(center: int, left: int, right: int) -> tuple[int, int, int]:
    return center, min(left, right), max(left, right)


def literal_oracle_atoms(points=DESIGNATED_POINTS) -> set[tuple[int, int, int]]:
    return {
        canonical_atom(points[center], points[left], points[right])
        for center, left, right in LITERAL_REQUIRED_ROLE_ATOMS
    }


def literal_oracle_points_match(context, points) -> bool:
    points = tuple(points)
    if len(points) != 7 or len(set(points)) != 7:
        return False
    return all(
        context.equality_holds(
            points[center], points[left], points[right]
        )
        for center, left, right in LITERAL_REQUIRED_ROLE_ATOMS
    )


class DirectEqualityContext:
    """CandidateMatchContext's direct-E surface, with no closure assumptions."""

    def __init__(self, vertices, true_atoms=()):
        self.ordered = tuple(vertices)
        self.true_atoms = set(true_atoms)

    def equality_holds(self, center, left, right):
        if left == right:
            return True
        if center in {left, right}:
            return False
        return canonical_atom(center, left, right) in self.true_atoms


def optimized_point_keys(context) -> set[tuple[int, ...]]:
    return {
        tuple(match[1])
        for match in crossed_arm_cegar.crossed_arm_seven_point_collision_matches(
            None, None, context
        )
    }


def brute_force_point_keys(context) -> set[tuple[int, ...]]:
    return {
        points
        for points in itertools.permutations(context.ordered, 7)
        if literal_oracle_points_match(context, points)
    }


class EqualityProbeAudit:
    z3 = z3

    def __init__(self):
        self.atoms = {}

    @property
    def position(self):
        raise AssertionError("unguarded family accessed cyclic positions")

    def E(self, center, left, right):
        key = canonical_atom(center, left, right)
        return self.atoms.setdefault(
            key, z3.Bool(f"seven_point_probe_{center}_{key[1]}_{key[2]}")
        )


class CrossedArmSevenPointCollisionTest(unittest.TestCase):
    def test_literal_oracle_and_every_single_atom_mutation(self) -> None:
        self.assertEqual(
            tuple(SCHEMA["equalities"]), LITERAL_REQUIRED_ROLE_ATOMS
        )
        required = literal_oracle_atoms()
        self.assertEqual(len(required), 11)
        context = DirectEqualityContext(range(7), required)
        self.assertTrue(literal_oracle_points_match(context, DESIGNATED_POINTS))
        self.assertTrue(
            crossed_arm_cegar.crossed_arm_seven_point_collision_points_match(
                context, DESIGNATED_POINTS
            )
        )
        self.assertIn(DESIGNATED_POINTS, optimized_point_keys(context))

        for omitted in sorted(required):
            with self.subTest(omitted=omitted):
                deficient = DirectEqualityContext(range(7), required - {omitted})
                self.assertFalse(
                    literal_oracle_points_match(deficient, DESIGNATED_POINTS)
                )
                self.assertFalse(
                    crossed_arm_cegar.crossed_arm_seven_point_collision_points_match(
                        deficient, DESIGNATED_POINTS
                    )
                )
                self.assertNotIn(DESIGNATED_POINTS, optimized_point_keys(deficient))

    def test_extra_equalities_are_allowed_and_roles_are_injective(self) -> None:
        required = literal_oracle_atoms()
        extra = canonical_atom(0, 2, 4)
        self.assertNotIn(extra, required)
        context = DirectEqualityContext(range(7), required | {extra})
        self.assertTrue(
            crossed_arm_cegar.crossed_arm_seven_point_collision_points_match(
                context, DESIGNATED_POINTS
            )
        )
        self.assertIn(DESIGNATED_POINTS, optimized_point_keys(context))

        repeated = (0, 1, 2, 3, 4, 5, 0)
        self.assertFalse(
            crossed_arm_cegar.crossed_arm_seven_point_collision_points_match(
                context, repeated
            )
        )
        self.assertTrue(
            all(len(set(points)) == 7 for points in optimized_point_keys(context))
        )

    def test_cut_has_exactly_eleven_direct_atoms_and_no_order_guard(self) -> None:
        audit = EqualityProbeAudit()
        key = ("theorem", FAMILY, *DESIGNATED_POINTS)
        atoms = crossed_arm_cegar.theorem_cut_atoms(audit, key)
        expected_keys = tuple(
            canonical_atom(
                DESIGNATED_POINTS[center],
                DESIGNATED_POINTS[left],
                DESIGNATED_POINTS[right],
            )
            for center, left, right in LITERAL_REQUIRED_ROLE_ATOMS
        )
        self.assertEqual(len(atoms), 11)
        self.assertEqual(tuple(audit.atoms), expected_keys)
        self.assertEqual(len(audit.atoms), 11)
        self.assertEqual(
            crossed_arm_cegar.theorem_cut_guard_kind(FAMILY), "unguarded"
        )
        self.assertEqual(crossed_arm_cegar.theorem_family_arity(FAMILY), 7)
        self.assertEqual(
            crossed_arm_cegar.validate_theorem_key(list(key)), key
        )
        with self.assertRaises(ValueError):
            crossed_arm_cegar.validate_theorem_key(
                ["theorem", FAMILY, 0, 1, 2, 3, 4, 5, 0]
            )

    def test_expected_lean_adapter_is_declared_in_designated_source(self) -> None:
        self.assertEqual(SCHEMA["theorem"], EXPECTED_LEAN_ADAPTER)
        source = LEAN_ADAPTER_PATH.read_text(encoding="utf-8")
        self.assertRegex(source, r"(?m)^namespace Problem97\s*$")
        self.assertRegex(
            source,
            r"(?m)^namespace CrossedArmSevenPointEuclideanObstruction\s*$",
        )
        declaration_name = EXPECTED_LEAN_ADAPTER.rsplit(".", 1)[1]
        self.assertIsNotNone(
            re.search(
                rf"(?m)^theorem {re.escape(declaration_name)}(?:\s|$)",
                source,
            ),
            f"missing Lean adapter {EXPECTED_LEAN_ADAPTER} in {LEAN_ADAPTER_PATH}",
        )

    def test_manifest_and_checkpoint_schema_migration_register_family(self) -> None:
        self.assertEqual(crossed_arm_cegar.FULL_BANK_FAMILIES[-1], FAMILY)
        self.assertNotIn(
            FAMILY, crossed_arm_cegar.PRE_SEVEN_POINT_THEOREM_FAMILIES
        )
        self.assertEqual(
            crossed_arm_cegar.theorem_families_for_schema_pair((
                crossed_arm_cegar.RESULT_SCHEMA,
                crossed_arm_cegar.CUT_SCHEMA,
            )),
            crossed_arm_cegar.FULL_BANK_FAMILIES,
        )
        self.assertEqual(
            crossed_arm_cegar.theorem_families_for_schema_pair((
                crossed_arm_cegar.PREVIOUS_RESULT_SCHEMA,
                crossed_arm_cegar.PREVIOUS_CUT_SCHEMA,
            )),
            crossed_arm_cegar.PRE_SEVEN_POINT_THEOREM_FAMILIES,
        )
        self.assertEqual(
            crossed_arm_cegar.theorem_families_for_schema_pair((
                crossed_arm_cegar.LEGACY_RESULT_SCHEMA,
                crossed_arm_cegar.LEGACY_CUT_SCHEMA,
            )),
            crossed_arm_cegar.PRE_GLOBAL_THEOREM_FAMILIES,
        )
        self.assertEqual(
            crossed_arm_cegar.structural_families_for_schema_pair((
                crossed_arm_cegar.PRIMORDIAL_RESULT_SCHEMA,
                crossed_arm_cegar.PRIMORDIAL_CUT_SCHEMA,
            )),
            crossed_arm_cegar.BASE_STRUCTURAL_FAMILIES,
        )
        report = crossed_arm_cegar.crossed_arm_seven_point_collision_self_check()
        self.assertEqual(
            report["status"], "CROSSED_ARM_SEVEN_POINT_COLLISION_OK"
        )
        self.assertEqual(report["raw_equality_count"], 11)
        self.assertIsNone(report["order_guard"])

    def test_neighbor_join_matches_brute_force_on_small_fixtures(self) -> None:
        fixtures = [
            DirectEqualityContext(range(7)),
            DirectEqualityContext(range(7), literal_oracle_atoms()),
            DirectEqualityContext(
                range(7),
                literal_oracle_atoms() | {canonical_atom(0, 2, 4)},
            ),
        ]
        for seed in range(6):
            rng = random.Random(seed)
            vertex_count = 7 + (seed % 2)
            vertices = tuple(range(vertex_count))
            true_atoms = {
                (center, left, right)
                for center in vertices
                for left, right in itertools.combinations(
                    (point for point in vertices if point != center), 2
                )
                if rng.random() < 0.18
            }
            if seed % 2 == 0:
                true_atoms.update(literal_oracle_atoms())
            fixtures.append(DirectEqualityContext(vertices, true_atoms))

        for index, context in enumerate(fixtures):
            with self.subTest(fixture=index, vertices=len(context.ordered)):
                optimized = optimized_point_keys(context)
                brute_force = brute_force_point_keys(context)
                self.assertEqual(optimized, brute_force)
                self.assertEqual(len(optimized), len(set(optimized)))


if __name__ == "__main__":
    unittest.main()
