#!/usr/bin/env python3
"""Bounded checks for the reversed-second/first exact-orbit identity."""

from __future__ import annotations

import importlib.util
import json
import sys
import unittest
from pathlib import Path
from unittest import mock

import z3


HERE = Path(__file__).resolve().parent
MODULE_PATH = HERE / "crossed_arm_cegar.py"
SPEC = importlib.util.spec_from_file_location(
    "crossed_arm_exact_orbit_under_test", MODULE_PATH
)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"cannot import {MODULE_PATH}")
crossed_arm_cegar = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = crossed_arm_cegar
SPEC.loader.exec_module(crossed_arm_cegar)


SOURCE_CHECKPOINT = (
    HERE
    / "source-at-common-full-metric-bank-v9-global-kalmanson-resume-v9-1800s"
    / "result.json"
)
OTHER_CHECKPOINT = (
    HERE
    / "other-at-common-full-metric-bank-v9-global-kalmanson-import-source-v9-1800s"
    / "result.json"
)


class FormulaAudit:
    """Small audit surface sufficient for exact theorem-formula construction."""

    z3 = z3

    def __init__(self) -> None:
        self.position = {
            point: z3.Int(f"position_{point}")
            for point in range(crossed_arm_cegar.N)
        }
        self.row_objects = tuple(range(crossed_arm_cegar.N))
        self.packet_cuts = {}
        self.assertions = []
        self.cuts = set()
        self.critical_k4_representation = (
            crossed_arm_cegar.incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
        )

    def center_is(self, row: int, center: int):
        return z3.BoolVal(row == center)

    def member(self, row: int, point: int):
        return z3.Bool(f"member_{row}_{point}")

    def add(self, label: str, formula) -> None:
        self.assertions.append((label, formula))

    def add_cut(self, cut: frozenset[int]) -> None:
        self.cuts.add(cut)

    add_guarded_cut = crossed_arm_cegar.CrossedAudit.add_guarded_cut


def checkpoint_theorem_keys(path: Path) -> tuple[tuple, ...]:
    with path.open() as handle:
        payload = json.load(handle)
    return tuple(tuple(key) for key in payload["learned_cuts"]["theorem"])


class ExactOrbitCanonicalizationTest(unittest.TestCase):
    def setUp(self) -> None:
        self.reversed_key = (
            "theorem", "reversed_second", 1, 3, 5, 7, 9
        )
        self.first_key = ("theorem", "first", 9, 1, 3, 5, 7)

    def test_structural_witness_and_exact_asserted_formula_sexpr(self) -> None:
        self.assertEqual(
            crossed_arm_cegar.canonical_exact_orbit_theorem_cut_key(
                self.reversed_key
            ),
            self.first_key,
        )
        self.assertIn(
            self.first_key[2:],
            tuple(crossed_arm_cegar.rotations(self.reversed_key[2:])),
        )
        self.assertEqual(
            crossed_arm_cegar.dual_row_pattern_signature(
                "reversed_second", self.reversed_key[2:]
            ),
            crossed_arm_cegar.dual_row_pattern_signature(
                "first", self.first_key[2:]
            ),
        )

        audit = FormulaAudit()
        reversed_formula = crossed_arm_cegar.theorem_cut_formula(
            audit, self.reversed_key
        )
        first_formula = crossed_arm_cegar.theorem_cut_formula(
            audit, self.first_key
        )
        self.assertEqual(reversed_formula.sexpr(), first_formula.sexpr())

        raw_reversed_atoms = crossed_arm_cegar.theorem_cut_atoms(
            audit, self.reversed_key
        )
        self.assertTrue(
            audit.add_guarded_cut(self.reversed_key, raw_reversed_atoms)
        )
        self.assertEqual(tuple(audit.packet_cuts), (self.first_key,))
        self.assertEqual(
            audit.packet_cuts[self.first_key].sexpr(), first_formula.sexpr()
        )
        self.assertEqual(len(audit.assertions), 1)

    def test_fail_closed_validation_retains_unproved_keys(self) -> None:
        malformed = (
            ("theorem", "reversed_second", 0, 1, 2, 3),
            ("theorem", "reversed_second", 0, 1, 2, 3, 3),
            ("theorem", "reversed_second", 0, 1, 2, 3, 17),
            ("theorem", "reversed_second", 0, 1, 2, 3, True),
        )
        for key in malformed:
            with self.subTest(key=key):
                self.assertIsNone(
                    crossed_arm_cegar.canonical_exact_orbit_theorem_cut_key(key)
                )
                self.assertEqual(
                    crossed_arm_cegar.canonical_theorem_cut_keys((key,)),
                    ((key,), ()),
                )

        original_guard_kind = crossed_arm_cegar.theorem_cut_guard_kind
        with mock.patch.object(
            crossed_arm_cegar,
            "theorem_cut_guard_kind",
            side_effect=lambda family: (
                "linear" if family == "first" else original_guard_kind(family)
            ),
        ):
            self.assertIsNone(
                crossed_arm_cegar.canonical_exact_orbit_theorem_cut_key(
                    self.reversed_key
                )
            )

        original_arity = crossed_arm_cegar.theorem_family_arity
        with mock.patch.object(
            crossed_arm_cegar,
            "theorem_family_arity",
            side_effect=lambda family: (
                6 if family == "first" else original_arity(family)
            ),
        ):
            self.assertIsNone(
                crossed_arm_cegar.canonical_exact_orbit_theorem_cut_key(
                    self.reversed_key
                )
            )

    def test_insertion_order_asserts_one_canonical_formula(self) -> None:
        expected_sexpr = crossed_arm_cegar.theorem_cut_formula(
            FormulaAudit(), self.first_key
        ).sexpr()
        for keys in (
            (self.reversed_key, self.first_key),
            (self.first_key, self.reversed_key),
        ):
            with self.subTest(keys=keys):
                audit = FormulaAudit()
                installation = crossed_arm_cegar.install_theorem_cut_keys(
                    audit, keys
                )
                self.assertEqual(installation["added"], (self.first_key,))
                self.assertEqual(
                    installation["suppressed_exact_orbit"],
                    (self.reversed_key,),
                )
                self.assertEqual(tuple(audit.packet_cuts), (self.first_key,))
                self.assertEqual(len(audit.assertions), 1)
                self.assertEqual(
                    audit.packet_cuts[self.first_key].sexpr(), expected_sexpr
                )

        for first_batch, second_batch in (
            ((self.reversed_key,), (self.first_key,)),
            ((self.first_key,), (self.reversed_key,)),
        ):
            with self.subTest(first_batch=first_batch):
                audit = FormulaAudit()
                crossed_arm_cegar.install_theorem_cut_keys(audit, first_batch)
                crossed_arm_cegar.install_theorem_cut_keys(audit, second_batch)
                self.assertEqual(tuple(audit.packet_cuts), (self.first_key,))
                self.assertEqual(len(audit.assertions), 1)
                self.assertEqual(
                    audit.packet_cuts[self.first_key].sexpr(), expected_sexpr
                )

    def test_restore_normalizes_legacy_keys_and_reports_counts(self) -> None:
        audit = FormulaAudit()
        payload = {
            "schema": crossed_arm_cegar.RESULT_SCHEMA,
            "arm": crossed_arm_cegar.ARMS[0],
            "n": crossed_arm_cegar.N,
            "closed_cap_profile": list(crossed_arm_cegar.PROFILE),
            "critical_no_K4_representation": audit.critical_k4_representation,
            "learned_cuts": {
                "schema": crossed_arm_cegar.CUT_SCHEMA,
                "critical_no_K4_representation": audit.critical_k4_representation,
                "structural_families": list(crossed_arm_cegar.STRUCTURAL_FAMILIES),
                "theorem_families": list(crossed_arm_cegar.FULL_BANK_FAMILIES),
                "connectivity": [],
                "structural": [],
                "theorem": [list(self.reversed_key), list(self.first_key)],
            },
        }
        restored = crossed_arm_cegar.restore_learned_cuts_payload(
            audit, crossed_arm_cegar.ARMS[0], payload, "<legacy-memory-fixture>"
        )
        self.assertEqual(restored["source_theorem_cut_count"], 2)
        self.assertEqual(restored["theorem_cut_count"], 1)
        self.assertEqual(restored["suppressed_theorem_cut_count"], 1)
        self.assertEqual(restored["suppressed_exact_orbit_theorem_cut_count"], 1)
        self.assertEqual(
            restored["suppressed_exact_orbit_theorem_cut_counts"],
            {"reversed_second": 1},
        )
        self.assertEqual(restored["suppressed_subsumed_theorem_cut_count"], 0)
        self.assertEqual(tuple(audit.packet_cuts), (self.first_key,))
        self.assertEqual(len(audit.assertions), 1)

    def test_live_v9_checkpoint_normalization_census(self) -> None:
        source = checkpoint_theorem_keys(SOURCE_CHECKPOINT)
        other = checkpoint_theorem_keys(OTHER_CHECKPOINT)

        def orbit_sets(keys):
            first = {key for key in keys if key[1] == "first"}
            reversed_keys = {
                key for key in keys if key[1] == "reversed_second"
            }
            mapped = {
                crossed_arm_cegar.canonical_exact_orbit_theorem_cut_key(key)
                for key in reversed_keys
            }
            self.assertNotIn(None, mapped)
            return first, reversed_keys, mapped

        source_first, source_reversed, source_mapped = orbit_sets(source)
        other_first, other_reversed, other_mapped = orbit_sets(other)
        self.assertEqual(len(source_reversed), 38_707)
        self.assertEqual(source_mapped, source_first)
        self.assertEqual(len(other_reversed), 41_640)
        self.assertEqual(other_mapped, other_first)
        self.assertEqual(len(other_first - source_first), 2_933)

        source_kept, source_suppressed = (
            crossed_arm_cegar.canonical_theorem_cut_keys(source)
        )
        other_kept, other_suppressed = (
            crossed_arm_cegar.canonical_theorem_cut_keys(other)
        )
        self.assertEqual(
            sum(key[1] == "reversed_second" for key in source_suppressed),
            38_707,
        )
        self.assertEqual(
            sum(key[1] == "reversed_second" for key in other_suppressed),
            41_640,
        )
        self.assertFalse(any(key[1] == "reversed_second" for key in source_kept))
        self.assertFalse(any(key[1] == "reversed_second" for key in other_kept))


if __name__ == "__main__":
    unittest.main()
