from __future__ import annotations

import importlib.util
import sys
import unittest
from pathlib import Path

import z3

ROOT = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("freshthird_named_metric_v4_tested", ROOT / "run_wave.py")
assert SPEC is not None and SPEC.loader is not None
WAVE = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = WAVE
SPEC.loader.exec_module(WAVE)


class WaveContractTests(unittest.TestCase):
    def test_eight_tags(self) -> None:
        self.assertEqual(len(WAVE.V2.TAGS), 8)
        self.assertEqual(len({tag.name for tag in WAVE.V2.TAGS}), 8)

    def test_structural_cuts_are_present_for_every_tag(self) -> None:
        for tag in WAVE.V2.TAGS:
            assertions = WAVE.structural_assertions(tag)
            for cut in WAVE.STRUCTURAL_CUTS:
                self.assertIn(cut, assertions)

    def test_malformed_endpoint_alias_is_unsat(self) -> None:
        smt, _ = WAVE.emit_structural(WAVE.V2.TAGS[0], "cap_alias")
        solver = z3.Solver()
        solver.from_string(smt[:smt.index("(check-sat)")])
        self.assertEqual(solver.check(), z3.unsat)

    def test_malformed_row_center_is_unsat(self) -> None:
        smt, _ = WAVE.emit_structural(WAVE.V2.TAGS[0], "row_center")
        solver = z3.Solver()
        solver.from_string(smt[:smt.index("(check-sat)")])
        self.assertEqual(solver.check(), z3.unsat)

    def test_order_core_is_not_a_metric_group(self) -> None:
        self.assertFalse(any("OrderCore" in group for group in WAVE.BASELINE_GROUPS + WAVE.NAMED_ROW_GROUPS))


if __name__ == "__main__":
    unittest.main()
