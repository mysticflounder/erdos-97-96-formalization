from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import run_wave


class RichApexDepletionWaveTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.result = run_wave.search_witness()

    def test_bounded_search_finds_expected_first_witness(self) -> None:
        self.assertEqual(
            self.result.parameters,
            {
                "r1a": run_wave.F(1, 7),
                "r1b": run_wave.F(-1, 8),
                "r2a": run_wave.F(-1),
                "r2b": run_wave.F(-7, 6),
            },
        )
        self.assertEqual(len(self.result.boundary_ccw), 10)

    def test_fraction_validator_accepts_witness(self) -> None:
        validation = run_wave.exact_validate(run_wave.witness_payload(self.result))
        self.assertTrue(validation["all_checks"]["ok"])
        self.assertTrue(validation["q_circle_exactly_K"]["ok"])
        self.assertTrue(validation["V_radius_partition_2_plus_1"]["ok"])

    def test_every_artifact_has_one_check(self) -> None:
        scripts = {
            "main": run_wave.main_witness_smt(self.result),
            "known": run_wave.known_sat_smt(),
        }
        scripts.update(run_wave.malformed_controls(self.result))
        self.assertEqual(len(scripts), 5)
        for body in scripts.values():
            self.assertEqual(body.count("(check-sat)"), 1)

    def test_main_smt_names_source_contract(self) -> None:
        body = run_wave.main_witness_smt(self.result)
        self.assertIn("(get-value (", body)
        for label in (
            "q_shell_exact_k0",
            "ambient_class1_card_five",
            "ambient_class2_card_four",
            "V_radius_block1_card_two",
            "V_radius_block2_card_one",
            "deleted_class1_card_three",
            "restore_k2_selected_class_card_four",
            "alias_q_survives_class1",
            "alias_k3_survives_class2",
        ):
            self.assertIn(f":named {label}", body)

    def test_exact_solver_model_parser(self) -> None:
        pairs = []
        for name, (x_value, y_value) in self.result.points.items():
            pairs.extend(
                [
                    f"({run_wave.px(name)} {run_wave.smt_num(x_value)})",
                    f"({run_wave.py(name)} {run_wave.smt_num(y_value)})",
                    f"(inV_{name} {'true' if name in run_wave.V else 'false'})",
                ]
            )
        pairs.extend(
            [
                f"(radius1 {run_wave.smt_num(run_wave.R1)})",
                f"(radius2 {run_wave.smt_num(run_wave.R2)})",
            ]
        )
        stdout = "sat\n(" + "\n ".join(pairs) + ")\n"
        values = run_wave.parse_model_readback(stdout, self.result)
        ok, _, validation = run_wave.validate_solver_readback(values, self.result)
        self.assertTrue(ok)
        self.assertTrue(validation["all_checks"]["ok"])


if __name__ == "__main__":
    unittest.main()
