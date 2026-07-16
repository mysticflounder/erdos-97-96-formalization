#!/usr/bin/env python3
"""Regression gates for the fresh continuation exact-CAS miner."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import mine  # noqa: E402
from census.atail_force import producer_bank  # noqa: E402
from census.global_confinement.equality_ideal_probe import (  # noqa: E402
    row_equalities as reference_row_equalities,
)


class FreshContinuationMarcoTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.cases = mine.fresh_cases(mine.load_source())

    def test_final_pinned_source_has_eleven_survivors_and_thirteen_grids(self) -> None:
        self.assertEqual(len(self.cases), 11)
        self.assertEqual(
            sum(len(mine.case_grids(case, mine.case_rows(case))) for case in self.cases),
            13,
        )

    def test_live_broader_bank_split_is_six_clean_five_dirty(self) -> None:
        clean = []
        dirty = []
        for case in self.cases:
            rows = mine.case_rows(case)
            order = tuple(case["survivor"]["frame"]["cyclic_order"])
            shard = int(case["partition"]["shard_index"])
            matches = producer_bank.scan_all_formalized_cores(rows, 12, order)
            (dirty if matches else clean).append(shard)
        self.assertEqual(clean, [0, 1, 2, 3, 16, 20])
        self.assertEqual(dirty, [10, 12, 13, 15, 21])

    def test_expanded_row_serializer_matches_independent_reference(self) -> None:
        row = mine.case_rows(self.cases[0])[0]
        variables = mine.metric_oracle.variable_symbols(12)
        namespace = {str(variable): variable for variable in variables}
        generated = mine.metric_oracle.row_polynomials(12, row)
        reference = tuple(
            sp.Poly(
                sp.expand(sp.sympify(text.replace("^", "**"), locals=namespace)),
                *variables,
                domain=sp.QQ,
            )
            for text in reference_row_equalities(row)
        )
        self.assertEqual(generated, reference)

    def test_exact_engine_smokes(self) -> None:
        smokes = mine.smoke_gates(5.0)
        self.assertEqual(smokes["known_unit"]["expected"], "UNIT")
        self.assertEqual(smokes["known_nonunit"]["expected"], "NONUNIT")


if __name__ == "__main__":
    unittest.main()
