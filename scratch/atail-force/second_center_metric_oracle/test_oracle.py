#!/usr/bin/env python3
"""Tests for the card-12 second-center equality-ideal oracle."""

from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path

import sympy as sp


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import oracle  # noqa: E402
from census.global_confinement.equality_ideal_probe import (  # noqa: E402
    row_equalities as reference_row_equalities,
)


class MetricOracleTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.source = oracle.source_artifact()

    def test_source_witnesses_collapse_29_rows_to_12_circles(self) -> None:
        for case in self.source["cases"]:
            base, rows = oracle._base_case(case)
            self.assertEqual(base["serialized_row_count"], 29)
            self.assertEqual(base["distinct_metric_row_count"], 12)
            self.assertEqual(base["duplicate_provenance_row_count"], 17)
            self.assertEqual(base["equality_count"], 36)
            self.assertEqual(len(rows), 12)

    def test_expanded_serializer_preserves_distance_equations(self) -> None:
        case = self.source["cases"][0]
        _base, rows = oracle._base_case(case)
        variables = oracle.variable_symbols(12)
        namespace = {str(variable): variable for variable in variables}
        for expected, serialized in zip(
            oracle.system_polynomials(12, rows),
            oracle.serialized_system(12, rows),
        ):
            reparsed = sp.Poly(
                sp.sympify(serialized.replace("^", "**"), locals=namespace),
                *variables,
                domain=sp.QQ,
            )
            self.assertEqual(expected, reparsed)
            self.assertNotIn("(", serialized)
            self.assertNotIn(")", serialized)
        for row in rows:
            generated = oracle.row_polynomials(12, row)
            reference = tuple(
                sp.Poly(
                    sp.expand(
                        sp.sympify(
                            expression.replace("^", "**"), locals=namespace
                        )
                    ),
                    *variables,
                    domain=sp.QQ,
                )
                for expression in reference_row_equalities(row)
            )
            self.assertEqual(generated, reference)

    def test_both_exact_engines_pass_known_unit_and_nonunit_smokes(self) -> None:
        report = oracle.smoke_gates()
        for case in report.values():
            self.assertEqual(case["expected"], case["singular"]["verdict"])
            self.assertEqual(case["expected"], case["msolve"]["verdict"])

    def test_checkpoint_source_hashes_and_core_subsets(self) -> None:
        saved = json.loads(oracle.CHECKPOINT.read_text(encoding="utf-8"))
        self.assertEqual(saved["schema"], oracle.SCHEMA)
        source_by_profile = {
            tuple(case["profile"]): case for case in self.source["cases"]
        }
        for saved_case in saved["cases"]:
            source_case = source_by_profile[tuple(saved_case["profile"])]
            base, rows = oracle._base_case(source_case)
            self.assertEqual(
                saved_case["expanded_polynomial_sha256"],
                base["expanded_polynomial_sha256"],
            )
            self.assertEqual(
                saved_case["distinct_metric_rows_sha256"],
                base["distinct_metric_rows_sha256"],
            )
            self.assertEqual(
                saved_case["row_provenance_sha256"],
                base["row_provenance_sha256"],
            )
            retained = {
                oracle.row_from_dict(row)
                for row in saved_case["bounded_deletion"]["retained_rows"]
            }
            self.assertLessEqual(retained, set(rows))


if __name__ == "__main__":
    unittest.main()
