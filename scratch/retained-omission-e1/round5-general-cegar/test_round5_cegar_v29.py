#!/usr/bin/env python3
"""Focused contract tests for v29 physical nonapex K4 shells."""

from __future__ import annotations

import copy
import multiprocessing
import os
import unittest
from collections import defaultdict
from concurrent.futures import ProcessPoolExecutor
from dataclasses import asdict

import z3

import round5_cegar_v8 as v8
import round5_cegar_v29 as v29


class TinyEncoding:
    """Only the fields needed by the v29 K4 builder and shell registries."""

    def __init__(self) -> None:
        self.groups: defaultdict[str, list[z3.BoolRef]] = defaultdict(list)
        self.k4: dict[tuple[int, int], z3.BoolRef] = {}
        self.k4_radius: dict[int, z3.ArithRef] = {}
        self.circles: list[v8.Circle] = []
        self._used = {center: z3.Bool(f"tiny_used_{center}") for center in v8.POINTS}
        self.row = {
            (center, point): z3.Bool(f"tiny_row_{center}_{point}")
            for center in v8.POINTS
            for point in v8.POINTS
        }
        self.rich: dict[tuple[int, int], dict[str, object]] = {}
        self._distance = {
            (left, right): z3.Real(f"tiny_d_{left}_{right}")
            for left in v8.POINTS
            for right in v8.POINTS
            if left < right
        }

    def add(self, family: str, *constraints: z3.BoolRef) -> None:
        self.groups[family].extend(constraints)

    def d(self, left: int, right: int) -> z3.ArithRef:
        if left == right:
            return z3.RealVal(0)
        return self._distance[tuple(sorted((left, right)))]

    def used(self, center: int) -> z3.BoolRef:
        return self._used[center]

    @staticmethod
    def _bool(model: z3.ModelRef, value: z3.BoolRef) -> bool:
        return z3.is_true(model.eval(value, model_completion=True))


def build_tiny() -> TinyEncoding:
    encoding = TinyEncoding()
    v29.Encoding._build_global_k4(encoding)
    return encoding


class V29PhysicalK4Tests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.encoding = build_tiny()

    def test_exact_global_k4_and_retained_superadditivity_counts(self) -> None:
        self.assertEqual(len(self.encoding.groups["global_K4"]), 465)
        actual = v29.Encoding(
            v29.Case("paired", "SSS", 0, 1, None), timeout_ms=1, seed=97
        )
        self.assertEqual(len(actual.groups["global_K4"]), 465)
        self.assertEqual(
            len(actual.groups["nonapex_global_k4_squared_superadditivity"]),
            4368,
        )

    def test_nonapex_support_is_iff_physical_shell_membership(self) -> None:
        center, point = v8.NONAPICES[0], 1
        bit = self.encoding.k4[center, point]
        equality = self.encoding.d(center, point) == self.encoding.k4_radius[center]
        expected = bit == equality
        self.assertTrue(any(clause.eq(expected) for clause in self.encoding.groups["global_K4"]))

        solver = z3.Solver()
        solver.add(*self.encoding.groups["global_K4"], z3.Not(bit), equality)
        self.assertEqual(solver.check(), z3.unsat)

    def test_apex_support_remains_a_selected_four_subset(self) -> None:
        center, point = v8.APICES[0], 0
        bit = self.encoding.k4[center, point]
        equality = self.encoding.d(center, point) == self.encoding.k4_radius[center]
        implication = z3.Implies(bit, equality)
        family = self.encoding.groups["global_K4"]
        self.assertTrue(any(clause.eq(implication) for clause in family))
        self.assertFalse(any(clause.eq(bit == equality) for clause in family))

        solver = z3.Solver()
        solver.add(*family, z3.Not(bit), equality)
        self.assertEqual(solver.check(), z3.sat)
        model = solver.model()
        self.assertEqual(
            sum(self.encoding._bool(model, self.encoding.k4[center, x]) for x in v8.POINTS),
            4,
        )

    def test_power_whitelist_excludes_selected_sources_and_deduplicates_used_center(self) -> None:
        encoding = self.encoding
        solver = z3.Solver()
        solver.add(encoding.used(0))
        solver.add(*(z3.Not(encoding.used(center)) for center in v8.POINTS if center != 0))
        self.assertEqual(solver.check(), z3.sat)
        active = {shell.name: shell for shell in v29.active_full_shells(encoding, solver.model())}

        self.assertIn("critical_0", active)
        self.assertNotIn("physical_globalK4_0", active)
        self.assertEqual(
            {name for name in active if name.startswith("physical_globalK4_")},
            {f"physical_globalK4_{center}" for center in v8.NONAPICES if center != 0},
        )

        allowed = v29._allowed_full_shells(encoding)
        physical = {
            name: shell for name, shell in allowed.items()
            if shell.kind == "physical_nonapex_global_k4_full_class"
        }
        self.assertEqual(set(physical), {f"physical_globalK4_{c}" for c in v8.NONAPICES})
        for center in v8.NONAPICES:
            shell = physical[f"physical_globalK4_{center}"]
            self.assertTrue(shell.activation.eq(z3.Not(encoding.used(center))))
            self.assertTrue(all(
                bit.eq(encoding.d(center, point) == encoding.k4_radius[center])
                for point, bit in enumerate(shell.support)
            ))
        self.assertFalse(any(
            token in name.lower() for name in allowed for token in ("apex", "b1", "b2")
        ))

    def test_runtime_context_restores_v12_and_v9_even_on_exception(self) -> None:
        names = (
            "SCHEMA_VERSION", "SCRIPT_PATH", "SCHEMA_PATH", "Encoding",
            "source_contract", "provenance", "_allowed_full_shells",
        )
        previous = {name: getattr(v29.v12, name) for name in names}
        previous_active = v29.v12.v9.active_full_shells
        with self.assertRaisesRegex(RuntimeError, "sentinel"):
            with v29._bound_v12_runtime():
                self.assertIs(v29.v12.Encoding, v29.Encoding)
                self.assertIs(v29.v12._allowed_full_shells, v29._allowed_full_shells)
                self.assertIs(v29.v12.v9.active_full_shells, v29.active_full_shells)
                raise RuntimeError("sentinel")
        for name, value in previous.items():
            self.assertIs(getattr(v29.v12, name), value)
        self.assertIs(v29.v12.v9.active_full_shells, previous_active)

    def test_provenance_authenticates_registry_sources_and_inherited_chain(self) -> None:
        provenance = v29.provenance()
        self.assertEqual(provenance["schema_version"], 29)
        for key in ("script_sha256", "schema_sha256", "uv_lock_sha256"):
            self.assertEqual(len(provenance[key]), 64)
        inherited = provenance["inherited_sha256"]
        self.assertEqual(len(inherited), 12)
        self.assertTrue(all(len(digest) == 64 for digest in inherited.values()))
        registry = provenance["power_shell_registry"]
        self.assertEqual(registry["allowed_nonapex_centers"], list(v8.NONAPICES))
        self.assertEqual(
            registry["excluded_sources"], ["apex selected K4", "packet B1", "packet B2"]
        )
        interface = provenance["source_contract"]["files"]["witness_packet_interface"]
        self.assertEqual(
            interface["sha256"], v29.file_sha256(v29.WITNESS_PACKET_INTERFACE_PATH)
        )

    def test_actual_spawn_child_attests_v29_contract(self) -> None:
        case = v29.Case("paired", "SSS", 0, 1, None)
        context = multiprocessing.get_context("spawn")
        with ProcessPoolExecutor(max_workers=1, mp_context=context) as pool:
            result = pool.submit(v29._spawn_contract_probe, asdict(case)).result(timeout=60)
        self.assertNotEqual(result["pid"], os.getpid())
        self.assertEqual(result["start_method"], "spawn")
        self.assertEqual(result["schema_version"], 29)
        self.assertEqual(result["global_K4_count"], 465)
        self.assertEqual(result["nonapex_superadditivity_count"], 4368)
        self.assertEqual(result["script_sha256"], v29.provenance()["script_sha256"])

    def test_child_validation_fails_closed_on_every_contract_boundary(self) -> None:
        frozen = v29.provenance()
        case = v29.Case("paired", "SSS", 0, 1, None)
        valid = {
            **frozen,
            "case_id": case.case_id,
            "case": asdict(case),
            "worker_attestation": {
                **v29._worker_attestation(frozen),
                "start_method": "spawn",
            },
            "constraint_counts": {
                "global_K4": 465,
                "nonapex_global_k4_squared_superadditivity": 4368,
            },
            "power_cut_row_kind_counts": {},
        }
        self.assertEqual(v29._validate_child_result(valid, case, frozen), [])

        mutations: list[tuple[str, object]] = []
        wrong_frozen = copy.deepcopy(valid)
        wrong_frozen["schema_sha256"] = "0" * 64
        mutations.append(("frozen provenance mismatch", wrong_frozen))
        wrong_attestation = copy.deepcopy(valid)
        wrong_attestation["worker_attestation"]["start_method"] = "fork"
        mutations.append(("worker attestation mismatch", wrong_attestation))
        wrong_counts = copy.deepcopy(valid)
        wrong_counts["constraint_counts"]["global_K4"] = 464
        mutations.append(("contract count", wrong_counts))
        missing_accounting = copy.deepcopy(valid)
        del missing_accounting["power_cut_row_kind_counts"]
        mutations.append(("row-kind accounting", missing_accounting))
        for expected, bad in mutations:
            self.assertTrue(
                any(expected in error for error in v29._validate_child_result(bad, case, frozen)),
                expected,
            )
        self.assertEqual(
            v29._validate_child_result("not an object", case, frozen),
            ["worker returned a non-object result"],
        )


if __name__ == "__main__":
    unittest.main()
