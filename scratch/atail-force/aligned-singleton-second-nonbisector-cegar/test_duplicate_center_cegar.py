#!/usr/bin/env python3
"""Focused tests for path-checked duplicate-center CEGAR cuts."""

from __future__ import annotations

import copy
import unittest

import z3

import duplicate_center_cegar as duplicate
import qf_bool_cegar


class FakeEncoding:
    def __init__(self) -> None:
        self.added: list[tuple[str, tuple[z3.BoolRef, ...]]] = []

    def member(self, center: int, point: int) -> z3.BoolRef:
        return z3.Bool(f"member_{center}_{point}")

    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        self.added.append((block, constraints))


class DuplicateCenterCegarTest(unittest.TestCase):
    def test_phase3_fourteen_literal_motif_is_found_exactly(self) -> None:
        rows = {center: () for center in range(10)}
        rows.update(
            {
                0: (1, 4),
                1: (0, 5),
                2: (0, 1, 6),
                4: (0, 5, 6),
                5: (0, 4),
                6: (4, 5),
            }
        )
        cores = duplicate.find_duplicate_center_cores(rows, 10, limit=100)

        self.assertEqual(len(cores), 1)
        core = cores[0]
        self.assertEqual(core["centers"], [2, 5])
        self.assertEqual(core["points"], [0, 1, 6])
        antecedents = duplicate.validate_refinement(core, 10)
        self.assertEqual(len(antecedents), 14)
        self.assertEqual(
            set(antecedents),
            {
                (0, 1),
                (0, 4),
                (1, 0),
                (1, 5),
                (2, 0),
                (2, 1),
                (2, 6),
                (4, 0),
                (4, 5),
                (4, 6),
                (5, 0),
                (5, 4),
                (6, 4),
                (6, 5),
            },
        )

    def test_no_equality_path_gives_no_core(self) -> None:
        rows = {center: () for center in range(7)}
        rows[0] = (1, 2)
        rows[3] = (4, 5)
        self.assertEqual(
            duplicate.find_duplicate_center_cores(rows, 7, limit=100),
            [],
        )

    def test_validator_rejects_tampered_path(self) -> None:
        rows = {center: () for center in range(10)}
        rows.update(
            {
                0: (1, 4),
                1: (0, 5),
                2: (0, 1, 6),
                4: (0, 5, 6),
                5: (0, 4),
                6: (4, 5),
            }
        )
        core = duplicate.find_duplicate_center_cores(rows, 10, limit=1)[0]
        tampered = copy.deepcopy(core)
        tampered["paths"]["ap_aq"][0]["center"] = 9
        with self.assertRaisesRegex(ValueError, "not composable"):
            duplicate.validate_refinement(tampered, 10)

    def test_validator_rejects_equal_centers(self) -> None:
        rows = {center: () for center in range(10)}
        rows.update(
            {
                0: (1, 4),
                1: (0, 5),
                2: (0, 1, 6),
                4: (0, 5, 6),
                5: (0, 4),
                6: (4, 5),
            }
        )
        core = duplicate.find_duplicate_center_cores(rows, 10, limit=1)[0]
        tampered = copy.deepcopy(core)
        tampered["centers"] = [2, 2]
        with self.assertRaisesRegex(ValueError, "centers are equal"):
            duplicate.validate_refinement(tampered, 10)

    def test_qf_driver_adds_the_exact_negated_antecedent_clause(self) -> None:
        rows = {center: () for center in range(17)}
        rows.update(
            {
                0: (1, 4),
                1: (0, 5),
                2: (0, 1, 6),
                4: (0, 5, 6),
                5: (0, 4),
                6: (4, 5),
            }
        )
        core = duplicate.find_duplicate_center_cores(rows, 17, limit=1)[0]
        encoding = FakeEncoding()

        is_connectivity = qf_bool_cegar.apply_refinement(encoding, core)

        self.assertFalse(is_connectivity)
        self.assertEqual(len(encoding.added), 1)
        block, constraints = encoding.added[0]
        self.assertEqual(block, "duplicate_center_equality_core_cegar_cut")
        self.assertEqual(len(constraints), 1)
        clause = constraints[0]
        self.assertTrue(z3.is_or(clause))
        self.assertEqual(clause.num_args(), 14)
        self.assertTrue(all(z3.is_not(literal) for literal in clause.children()))


if __name__ == "__main__":
    unittest.main()
