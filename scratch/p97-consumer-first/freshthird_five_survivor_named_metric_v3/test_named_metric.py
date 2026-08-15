from __future__ import annotations

import importlib.util
import sys
import unittest
from fractions import Fraction
from pathlib import Path

HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("named_metric_v3", HERE / "run_named_metric.py")
assert SPEC is not None and SPEC.loader is not None
M = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = M
SPEC.loader.exec_module(M)


class NamedMetricTests(unittest.TestCase):
    def test_all_eight_inherited_tags_exist(self) -> None:
        self.assertEqual(len(M.V2.TAGS), 8)

    def test_center_omission_covers_every_selected_row(self) -> None:
        self.assertEqual(
            len(M.row_center_omissions()), len(M.V2.selected_row_pairs())
        )

    def test_fraction_arithmetic_is_exact(self) -> None:
        a = Fraction(1, 3)
        b = Fraction(2, 5)
        self.assertEqual((a - b) ** 2, Fraction(1, 225))

    def test_metric_groups_have_no_order_core_fields(self) -> None:
        log = M.ROOT.parent / "freshthird_five_survivor_alias_aware_v2" / "main_first_qsource_radius_ingress.z3.log"
        model = M.V2.parse_assignment(log.read_text())
        groups, _, _ = M.metric_groups(model)
        forbidden = {"OA_OC", "OA_OD", "OA_OE", "OA_AC", "DA_DX5", "OA_EX5", "OA_AX6", "DA_DX6", "CD_CX9", "OA_EX9"}
        self.assertTrue(forbidden.isdisjoint(groups))


if __name__ == "__main__":
    unittest.main()

