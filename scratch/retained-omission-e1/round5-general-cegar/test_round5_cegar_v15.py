#!/usr/bin/env python3
"""Focused tests for v15 nonapex global-K4 superadditivity."""

from __future__ import annotations

import math
import unittest
from collections import defaultdict
from pathlib import Path

import z3
from z3.z3util import get_vars

import round5_cegar_v8 as v8
import round5_cegar_v15 as v15


class TinyEncoding:
    def __init__(self) -> None:
        self.groups = defaultdict(list)
        self.k4 = {
            (center, point): z3.Bool(f"tiny_k4_{center}_{point}")
            for center in v8.POINTS
            for point in v8.POINTS
        }
        self.squared_distance = {
            (left, right): z3.Real(f"tiny_s_{left}_{right}")
            for left in v8.POINTS
            for right in v8.POINTS
            if left < right
        }

    def add(self, family: str, *constraints: z3.BoolRef) -> None:
        self.groups[family].extend(constraints)

    def s(self, left: int, right: int) -> z3.ArithRef:
        if left == right:
            return z3.RealVal(0)
        return self.squared_distance[tuple(sorted((left, right)))]

    def _angular_order_from(self, center: int) -> list[int]:
        return v8.Encoding._angular_order_from(self, center)


class V15NonapexGlobalK4SuperadditivityTests(unittest.TestCase):
    family = "nonapex_global_k4_squared_superadditivity"

    def build(self) -> TinyEncoding:
        encoding = TinyEncoding()
        v15.Encoding._build_nonapex_global_k4_squared_superadditivity(encoding)
        return encoding

    def test_exact_assertion_count_is_twelve_choose_fourteen_three(self) -> None:
        constraints = self.build().groups[self.family]
        self.assertEqual(len(constraints), 12 * math.comb(14, 3))
        self.assertEqual(len(constraints), 4368)

    def test_sample_has_exact_support_guard_and_squared_inequality(self) -> None:
        encoding = self.build()
        center = v8.NONAPICES[0]
        x, y, z = encoding._angular_order_from(center)[:3]
        expected = z3.Implies(
            z3.And(
                encoding.k4[center, x],
                encoding.k4[center, y],
                encoding.k4[center, z],
            ),
            encoding.s(x, z) >= encoding.s(x, y) + encoding.s(y, z) + 1,
        )
        self.assertTrue(encoding.groups[self.family][0].eq(expected))

    def test_no_apex_center_or_rich_shell_assertions_are_added(self) -> None:
        constraints = self.build().groups[self.family]
        names = {str(var) for constraint in constraints for var in get_vars(constraint)}
        for apex in v8.APICES:
            self.assertFalse(any(name.startswith(f"tiny_k4_{apex}_") for name in names))
        for center in v8.NONAPICES:
            self.assertTrue(any(name.startswith(f"tiny_k4_{center}_") for name in names))
        self.assertFalse(any("rich" in name for name in names))

    def test_pure_real_family_is_excluded_from_boolean_prepass(self) -> None:
        encoding = self.build()
        solver, audit = v15.v12.build_boolean_relaxation(encoding, 1000, 97)
        self.assertEqual(audit.included_total, 0)
        self.assertEqual(audit.excluded_total, 4368)
        self.assertEqual(audit.excluded_by_family, {self.family: 4368})
        self.assertEqual(audit.excluded_sort_counts, {"Real": 4368})
        self.assertEqual(solver.check(), z3.sat)

    def test_provenance_authenticates_schema_source_and_inherited_engines(self) -> None:
        provenance = v15.provenance()
        self.assertEqual(provenance["schema_version"], 15)
        self.assertEqual(provenance["target"], v8.TARGET)
        for key in (
            "script_sha256", "base_v14_script_sha256", "base_v13_script_sha256",
            "base_v12_script_sha256", "base_v8_script_sha256",
            "miner_v9_script_sha256", "schema_sha256", "uv_lock_sha256",
        ):
            self.assertEqual(len(provenance[key]), 64)

        contract = provenance["source_contract"]
        entry = contract["files"]["same_shell_superadditivity"]
        relative = Path("lean/Erdos9796Proof/P97/SameShellSuperadditivity.lean")
        self.assertEqual(Path(entry["path"]), relative)
        self.assertEqual(entry["sha256"], v15.file_sha256(v15.PROJECT_ROOT / relative))
        role = contract["role_map"][self.family]
        self.assertIn(
            "Problem97.CGN.sameShell_sqDist_superadditive_of_strictCapOrder", role
        )
        self.assertIn("Problem97.dist_sq_gt_add_of_same_shell_opposite_sides", role)
        self.assertEqual(v15.parser().parse_args(["smoke"]).artifacts,
                         v15.HERE / "artifacts-v15")

    def test_v15_runtime_binding_does_not_mutate_v12_import_state(self) -> None:
        names = (
            "SCHEMA_VERSION", "SCRIPT_PATH", "SCHEMA_PATH", "Encoding",
            "source_contract", "provenance",
        )
        original = {name: getattr(v15.v12, name) for name in names}
        with v15._bound_v12_runtime():
            self.assertEqual(v15.v12.SCHEMA_VERSION, 15)
            self.assertIs(v15.v12.Encoding, v15.Encoding)
            self.assertEqual(v15.v12.SCRIPT_PATH, v15.SCRIPT_PATH)
            self.assertEqual(v15.v12.SCHEMA_PATH, v15.SCHEMA_PATH)
            self.assertEqual(v15.v12.source_contract(), v15.source_contract())
            self.assertEqual(v15.v12.provenance(), v15.provenance())
        for name, value in original.items():
            self.assertIs(getattr(v15.v12, name), value)


if __name__ == "__main__":
    unittest.main()
