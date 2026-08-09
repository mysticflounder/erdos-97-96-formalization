from __future__ import annotations

import importlib.util
import sys
import unittest
from pathlib import Path

HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("five_row_v2", HERE / "run_query.py")
assert SPEC and SPEC.loader
MODEL = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = MODEL
SPEC.loader.exec_module(MODEL)


class EncodingShapeTests(unittest.TestCase):
    def test_exact_eight_tagged_cases(self) -> None:
        self.assertEqual(len(MODEL.TAGS), 8)
        self.assertEqual(len({tag.name for tag in MODEL.TAGS}), 8)

    def test_b0_b1_are_linked_but_b3_b4_are_independent(self) -> None:
        tag = MODEL.Tag("first", "qsource", "radius")
        assertions = MODEL.base_assertions(tag)
        joined = "\n".join(assertions)
        for i in MODEL.POINTS:
            self.assertIn(f"(= B0_{i} S0Row_{i})", assertions)
            self.assertIn(f"(= B1_{i} PRhoRow_{i})", assertions)
            self.assertNotIn(f"(= B3_{i} B4_{i})", assertions)
        self.assertIn(f"(not {MODEL.at('S0Row', 'CS0')})", assertions)
        self.assertIn(f"(not {MODEL.at('PRhoRow', 'C1')})", assertions)
        self.assertNotIn("crossed", joined.lower())

    def test_deleted_point_is_absent_from_each_boundary_row(self) -> None:
        for deleted in ("qsource", "qother"):
            tag = MODEL.Tag("second", deleted, "rho")
            assertions = MODEL.base_assertions(tag)
            for row in ("B0", "B1", "B2", "B3", "B4"):
                self.assertIn(f"(not {MODEL.at(row, tag.deleted_role)})", assertions)

    def test_only_named_consumer_detectors_are_exposed(self) -> None:
        tag = MODEL.Tag("first", "qother", "rho")
        self.assertEqual(
            set(MODEL.consumer_expressions(tag)),
            {
                "explicit_overlap_ge_three",
                "both_outside_hits_and_pair_hit",
                "cap_center_two_outside_hits",
            },
        )

    def test_each_tag_has_three_forced_consumer_preflights(self) -> None:
        for tag in MODEL.TAGS:
            consumers = MODEL.consumer_expressions(tag)
            self.assertEqual(len(consumers), 3)
            for expression in consumers.values():
                smt, assertions = MODEL.emit(tag, "base", expression)
                self.assertIn(expression, assertions)
                self.assertEqual(smt.count("(check-sat)"), 1)

    def test_model_parser(self) -> None:
        parsed = MODEL.parse_assignment("sat\n((C0 7) (B0_0 true) (B0_1 false))\n")
        self.assertEqual(parsed, {"C0": 7, "B0_0": True, "B0_1": False})


if __name__ == "__main__":
    unittest.main()
