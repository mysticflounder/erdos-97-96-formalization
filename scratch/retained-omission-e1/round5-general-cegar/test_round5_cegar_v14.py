#!/usr/bin/env python3
"""Focused tests for the v14 packet-B1/apex-profile projection."""

from __future__ import annotations

import unittest
from collections import defaultdict
from pathlib import Path

import z3

import round5_cegar_v8 as v8
import round5_cegar_v14 as v14


class TinyEncoding:
    def __init__(self, profiles: str) -> None:
        self.case = v8.Case("paired", profiles, 0, 1, None)
        self.groups = defaultdict(list)
        self.rich = {}
        for apex_index, profile in enumerate(profiles):
            count = 1 if profile == "S" else 2
            for cls in range(count):
                self.rich[apex_index, cls] = {
                    "support": [
                        z3.Bool(f"tiny_rich_{apex_index}_{cls}_{point}")
                        for point in v8.POINTS
                    ]
                }
        self.packets = [
            {
                "B1": [z3.Bool(f"tiny_packet_{packet}_B1_{point}")
                       for point in v8.POINTS]
            }
            for packet in range(2)
        ]

    def add(self, family: str, *constraints: z3.BoolRef) -> None:
        self.groups[family].extend(constraints)


def assert_bits(solver: z3.Solver, bits, true_points: set[int]) -> None:
    for point, bit in enumerate(bits):
        solver.add(bit if point in true_points else z3.Not(bit))


class V14PacketB1ProjectionTests(unittest.TestCase):
    family = "apex_packet_b1_profile_compatibility"

    def build(self, profiles: str) -> TinyEncoding:
        encoding = TinyEncoding(profiles)
        v14.Encoding._build_apex_packet_b1_profile_compatibility(encoding)
        return encoding

    def test_S_requires_subset_but_does_not_force_equality(self) -> None:
        encoding = self.build("SDD")
        rich = encoding.rich[0, 0]["support"]
        b1 = encoding.packets[0]["B1"]
        constraints = encoding.groups[self.family]

        strict_subset = z3.Solver()
        strict_subset.add(*constraints)
        assert_bits(strict_subset, rich, {0, 1, 2, 3, 4, 5})
        assert_bits(strict_subset, b1, {0, 1, 2, 3})
        self.assertEqual(strict_subset.check(), z3.sat)

        outside = z3.Solver()
        outside.add(*constraints)
        assert_bits(outside, rich, {0, 1, 2, 3, 4, 5})
        assert_bits(outside, b1, {0, 1, 2, 6})
        self.assertEqual(outside.check(), z3.unsat)

    def test_D_requires_equality_with_one_exact_four_shell_per_packet(self) -> None:
        encoding = self.build("DDD")
        first = encoding.rich[0, 0]["support"]
        second = encoding.rich[0, 1]["support"]
        constraints = encoding.groups[self.family]

        good = z3.Solver()
        good.add(*constraints)
        assert_bits(good, first, {0, 1, 4, 5})
        assert_bits(good, second, {2, 3, 6, 7})
        assert_bits(good, encoding.packets[0]["B1"], {0, 1, 4, 5})
        assert_bits(good, encoding.packets[1]["B1"], {2, 3, 6, 7})
        self.assertEqual(good.check(), z3.sat)

        mixed = z3.Solver()
        mixed.add(*constraints)
        assert_bits(mixed, first, {0, 1, 4, 5})
        assert_bits(mixed, second, {2, 3, 6, 7})
        assert_bits(mixed, encoding.packets[0]["B1"], {0, 1, 2, 3})
        self.assertEqual(mixed.check(), z3.unsat)

    def test_tracked_clause_counts_match_two_packet_schema(self) -> None:
        self.assertEqual(len(self.build("SDD").groups[self.family]), 30)
        self.assertEqual(len(self.build("DDD").groups[self.family]), 2)

    def test_family_is_pure_boolean_and_enters_prepass(self) -> None:
        encoding = self.build("SDD")
        solver, audit = v14.v12.build_boolean_relaxation(encoding, 1000, 97)
        expected = sum(len(values) for values in encoding.groups.values())
        self.assertEqual(audit.included_total, expected)
        self.assertEqual(audit.excluded_total, 0)
        self.assertEqual(solver.check(), z3.sat)

    def test_provenance_freezes_v14_schema_and_inherited_engines(self) -> None:
        provenance = v14.provenance()
        self.assertEqual(provenance["schema_version"], 14)
        self.assertEqual(provenance["target"], v8.TARGET)
        for key in (
            "script_sha256", "base_v13_script_sha256", "base_v12_script_sha256",
            "base_v8_script_sha256", "miner_v9_script_sha256", "schema_sha256",
            "uv_lock_sha256",
        ):
            self.assertEqual(len(provenance[key]), 64)
        role_map = provenance["source_contract"]["role_map"]
        self.assertIn(self.family, role_map)
        self.assertIn("SelectedFourClass", role_map[self.family])

    def test_source_contract_authenticates_exact_fifteen_theorem_source(self) -> None:
        contract = v14.source_contract()
        entry = contract["files"]["exact_fifteen_apex_profile"]
        expected_relative = Path(
            "lean/Erdos9796Proof/P97/ATail/ExactFifteenApexProfile.lean"
        )
        self.assertEqual(Path(entry["path"]), expected_relative)
        expected_path = v14.PROJECT_ROOT / expected_relative
        self.assertEqual(expected_path, v14.EXACT_FIFTEEN_APEX_PROFILE_PATH)
        self.assertEqual(entry["sha256"], v14.file_sha256(expected_path))
        self.assertEqual(v14.provenance()["source_contract"], contract)

    def test_v14_runtime_binding_does_not_mutate_v12_import_state(self) -> None:
        names = (
            "SCHEMA_VERSION", "SCRIPT_PATH", "SCHEMA_PATH", "Encoding",
            "source_contract", "provenance",
        )
        original = {name: getattr(v14.v12, name) for name in names}
        with v14._bound_v12_runtime():
            self.assertEqual(v14.v12.SCHEMA_VERSION, 14)
            self.assertIs(v14.v12.Encoding, v14.Encoding)
            self.assertEqual(v14.v12.SCRIPT_PATH, v14.SCRIPT_PATH)
        for name, value in original.items():
            self.assertIs(getattr(v14.v12, name), value)


if __name__ == "__main__":
    unittest.main()
