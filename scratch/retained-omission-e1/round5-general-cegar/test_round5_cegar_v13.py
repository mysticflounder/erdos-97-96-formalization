#!/usr/bin/env python3
"""Small local tests for the v13 Boolean apex-profile projection."""

from __future__ import annotations

import unittest
from collections import defaultdict

import z3

import round5_cegar_v8 as v8
import round5_cegar_v13 as v13


class TinyEncoding:
    def __init__(self, profiles: str) -> None:
        self.case = v8.Case("paired", profiles, 0, 1, None)
        self.groups = defaultdict(list)
        self.k4 = {}
        self.rich = {}
        for apex_index, apex in enumerate(v8.APICES):
            for point in v8.POINTS:
                self.k4[apex, point] = z3.Bool(f"tiny_k4_{apex}_{point}")
            count = 1 if profiles[apex_index] == "S" else 2
            for cls in range(count):
                self.rich[apex_index, cls] = {
                    "support": [
                        z3.Bool(f"tiny_rich_{apex_index}_{cls}_{point}")
                        for point in v8.POINTS
                    ]
                }

    def add(self, family: str, *constraints: z3.BoolRef) -> None:
        self.groups[family].extend(constraints)


def assert_bits(solver: z3.Solver, bits, true_points: set[int]) -> None:
    for point, bit in enumerate(bits):
        solver.add(bit if point in true_points else z3.Not(bit))


class V13ProfileProjectionTests(unittest.TestCase):
    def build(self, profiles: str) -> TinyEncoding:
        encoding = TinyEncoding(profiles)
        v13.Encoding._build_apex_global_k4_profile_compatibility(encoding)
        return encoding

    def test_S_requires_global_k4_subset_of_six_shell(self) -> None:
        encoding = self.build("SSS")
        apex = v8.APICES[0]
        rich = encoding.rich[0, 0]["support"]
        constraints = encoding.groups["apex_global_k4_profile_compatibility"]

        good = z3.Solver()
        good.add(*constraints)
        assert_bits(good, rich, {0, 1, 2, 3, 4, 5})
        assert_bits(good, [encoding.k4[apex, p] for p in v8.POINTS], {0, 1, 2, 3})
        self.assertEqual(good.check(), z3.sat)

        bad = z3.Solver()
        bad.add(*constraints)
        assert_bits(bad, rich, {0, 1, 2, 3, 4, 5})
        assert_bits(bad, [encoding.k4[apex, p] for p in v8.POINTS], {0, 1, 2, 6})
        self.assertEqual(bad.check(), z3.unsat)

    def test_D_requires_equality_with_one_exact_four_shell(self) -> None:
        encoding = self.build("DDD")
        apex = v8.APICES[0]
        first = encoding.rich[0, 0]["support"]
        second = encoding.rich[0, 1]["support"]
        k4 = [encoding.k4[apex, p] for p in v8.POINTS]
        constraints = encoding.groups["apex_global_k4_profile_compatibility"]

        good = z3.Solver()
        good.add(*constraints)
        assert_bits(good, first, {0, 1, 4, 5})
        assert_bits(good, second, {2, 3, 6, 7})
        assert_bits(good, k4, {2, 3, 6, 7})
        self.assertEqual(good.check(), z3.sat)

        mixed = z3.Solver()
        mixed.add(*constraints)
        assert_bits(mixed, first, {0, 1, 4, 5})
        assert_bits(mixed, second, {2, 3, 6, 7})
        assert_bits(mixed, k4, {0, 1, 2, 3})
        self.assertEqual(mixed.check(), z3.unsat)

    def test_new_family_is_purely_boolean_and_enters_prepass(self) -> None:
        encoding = self.build("SDD")
        solver, audit = v13.v12.build_boolean_relaxation(encoding, 1000, 97)
        expected = sum(len(values) for values in encoding.groups.values())
        self.assertEqual(audit.included_total, expected)
        self.assertEqual(audit.excluded_total, 0)
        self.assertEqual(solver.check(), z3.sat)

    def test_provenance_freezes_v13_and_all_inherited_engines(self) -> None:
        provenance = v13.provenance()
        self.assertEqual(provenance["schema_version"], 13)
        self.assertEqual(provenance["target"], v8.TARGET)
        for key in (
            "script_sha256", "base_v8_script_sha256", "base_v12_script_sha256",
            "miner_v9_script_sha256", "schema_sha256", "uv_lock_sha256",
        ):
            self.assertEqual(len(provenance[key]), 64)
        self.assertIn(
            "apex_global_k4_profile_compatibility",
            provenance["source_contract"]["role_map"],
        )

    def test_v13_runtime_binding_does_not_mutate_v12_import_state(self) -> None:
        original = {
            name: getattr(v13.v12, name)
            for name in (
                "SCHEMA_VERSION", "SCRIPT_PATH", "SCHEMA_PATH", "Encoding",
                "source_contract", "provenance",
            )
        }
        with v13._bound_v12_runtime():
            self.assertEqual(v13.v12.SCHEMA_VERSION, 13)
            self.assertIs(v13.v12.Encoding, v13.Encoding)
            self.assertEqual(v13.v12.SCRIPT_PATH, v13.SCRIPT_PATH)
        for name, value in original.items():
            self.assertIs(getattr(v13.v12, name), value)


if __name__ == "__main__":
    unittest.main()
