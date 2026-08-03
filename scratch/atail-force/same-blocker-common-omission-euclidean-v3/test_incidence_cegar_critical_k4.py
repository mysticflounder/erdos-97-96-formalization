#!/usr/bin/env python3
"""Bounded checks for the critical no-K4 encoding representations."""

from __future__ import annotations

import gc
import importlib.util
import inspect
import itertools
import json
import time
import unittest
from pathlib import Path


MODULE_PATH = Path(__file__).with_name("incidence_cegar.py")
SPEC = importlib.util.spec_from_file_location("incidence_cegar_under_test", MODULE_PATH)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"cannot import {MODULE_PATH}")
incidence_cegar = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(incidence_cegar)


class CriticalNoK4EncodingTest(unittest.TestCase):
    def test_negative_triples_are_exactly_at_most_two(self) -> None:
        checked_assignments = 0
        for tail_size in range(3, 15):
            triples = tuple(itertools.combinations(range(tail_size), 3))
            for values in itertools.product((False, True), repeat=tail_size):
                old_negative_triple_cnf = all(
                    not (values[left] and values[middle] and values[right])
                    for left, middle, right in triples
                )
                self.assertEqual(old_negative_triple_cnf, sum(values) <= 2)
                checked_assignments += 1
        self.assertEqual(checked_assignments, sum(2**size for size in range(3, 15)))
        print(
            json.dumps(
                {
                    "assignment_count": checked_assignments,
                    "tail_sizes": [3, 14],
                    "triple_cnf_iff_count_le_two": True,
                },
                sort_keys=True,
            )
        )

    def test_n17_assertion_counts_and_construction_api(self) -> None:
        self.assertEqual(
            incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION,
            incidence_cegar.CRITICAL_K4_COMPACT_PB,
        )
        self.assertEqual(
            incidence_cegar.LEGACY_CRITICAL_K4_REPRESENTATION,
            incidence_cegar.CRITICAL_K4_TRIPLE_CLAUSES,
        )
        self.assertEqual(
            inspect.signature(incidence_cegar.Audit).parameters[
                "critical_k4_representation"
            ].default,
            incidence_cegar.CRITICAL_K4_COMPACT_PB,
        )
        self.assertEqual(
            incidence_cegar.critical_k4_artifact_suffix(
                incidence_cegar.CRITICAL_K4_TRIPLE_CLAUSES
            ),
            "",
        )
        self.assertEqual(
            incidence_cegar.critical_k4_artifact_suffix(
                incidence_cegar.CRITICAL_K4_COMPACT_PB
            ),
            "-critical-k4-compact-pb",
        )
        expected_counts = {
            incidence_cegar.CRITICAL_K4_TRIPLE_CLAUSES: 371_280,
            incidence_cegar.CRITICAL_K4_COMPACT_PB: 3_264,
        }
        construction_seconds = {}
        for representation, expected_count in expected_counts.items():
            started = time.perf_counter()
            audit = incidence_cegar.Audit(
                17,
                (6, 8, 6),
                False,
                False,
                False,
                critical_k4_representation=representation,
            )
            construction_seconds[representation] = round(time.perf_counter() - started, 3)
            self.assertEqual(audit.critical_k4_representation, representation)
            self.assertEqual(
                audit.blocks["critical_no_K4_after_source_deletion"],
                expected_count,
            )
            del audit
            gc.collect()

        with self.assertRaisesRegex(ValueError, "critical_k4_representation"):
            incidence_cegar.Audit(
                17,
                (6, 8, 6),
                False,
                False,
                False,
                critical_k4_representation="not-a-representation",
            )

        print(
            json.dumps(
                {
                    "construction_seconds": construction_seconds,
                    "n17_assertion_counts": expected_counts,
                },
                sort_keys=True,
            )
        )


if __name__ == "__main__":
    unittest.main(verbosity=2)
