from __future__ import annotations

import json
import unittest
from types import SimpleNamespace

import sympy as sp
import z3

from census.atail_force import inequality_pilot as pilot


class InequalityPilotTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        if pilot.DEFAULT_MANIFEST.exists():
            cls.manifest = pilot._read_manifest(pilot.DEFAULT_MANIFEST)
        else:
            cls.manifest = pilot.build_manifest()

    def test_manifest_selects_same_seven_bounded_strata(self) -> None:
        cases = self.manifest["cases"]
        self.assertEqual(len(cases), 7)
        self.assertEqual(
            [case["interior_points"] for case in cases],
            list(range(6, 13)),
        )
        self.assertEqual(self.manifest["policy"]["engine_processes"], 1)
        self.assertEqual(self.manifest["policy"]["parallel_cases"], 1)
        self.assertEqual(
            self.manifest["policy"]["timeout_seconds_per_case"],
            30,
        )

    def test_every_case_contains_the_full_inequality_surface(self) -> None:
        for case in self.manifest["cases"]:
            with self.subTest(case_id=case["case_id"]):
                system = pilot._validated_case_system(case)
                self.assertEqual(len(system.eqs), 14)
                self.assertGreater(len(system.ge), 0)
                self.assertGreater(len(system.gt), 0)
                self.assertEqual(
                    pilot._json_digest(pilot._system_payload(system)),
                    case["system_input_sha256"],
                )

    def test_sympy_to_z3_translation_uses_exact_rationals(self) -> None:
        x, y = sp.symbols("x y", real=True)
        zx, zy = z3.Reals("x y")
        translated = pilot._poly_to_z3(
            sp.Rational(2, 3) * x**2 - sp.Rational(5, 7) * y + 1,
            [x, y],
            [zx, zy],
        )
        solver = z3.Solver()
        solver.add(zx == 3, zy == 7)
        solver.add(translated != sp.Rational(2, 3) * 9 - 5 + 1)
        self.assertEqual(solver.check(), z3.unsat)

    def test_independent_rational_replay_is_fail_closed(self) -> None:
        x = sp.Symbol("x", real=True)
        system = SimpleNamespace(
            vars=[x],
            eqs=[x - 1],
            ge=[x],
            gt=[2 - x],
        )
        verified, replay = pilot._verify_rational_model(system, {"x": "1"})
        self.assertTrue(verified, replay)
        mutated, failure = pilot._verify_rational_model(system, {"x": "3"})
        self.assertFalse(mutated)
        self.assertEqual(failure["kind"], "equality")

    def test_committed_results_are_manifest_and_input_bound(self) -> None:
        if not pilot.DEFAULT_RESULTS.exists():
            self.skipTest("bounded pilot has not run yet")
        results = json.loads(pilot.DEFAULT_RESULTS.read_text(encoding="utf-8"))
        self.assertEqual(
            results["manifest_sha256"],
            self.manifest["manifest_sha256"],
        )
        by_case = {row["case_id"]: row for row in results["results"]}
        self.assertEqual(set(by_case), {case["case_id"] for case in self.manifest["cases"]})
        for case in self.manifest["cases"]:
            self.assertEqual(
                by_case[case["case_id"]]["system_input_sha256"],
                case["system_input_sha256"],
            )

    def test_worker_parser_rejects_unexpected_output(self) -> None:
        parsed = pilot._parse_worker_output("not-json", "case")
        self.assertEqual(parsed["verdict"], "ERROR")
        wrong = json.dumps({"schema": "wrong", "case_id": "case"})
        self.assertEqual(pilot._parse_worker_output(wrong, "case")["verdict"], "ERROR")


if __name__ == "__main__":
    unittest.main()
