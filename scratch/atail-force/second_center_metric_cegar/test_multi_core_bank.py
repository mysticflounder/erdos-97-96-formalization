#!/usr/bin/env python3
"""Focused tests for the bounded multi-core analysis runner."""

from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path
from unittest import mock


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
for path in (str(ROOT), str(HERE)):
    if path not in sys.path:
        sys.path.insert(0, path)

import cegar  # noqa: E402
import multi_core_bank  # noqa: E402


class MultiCoreBankTests(unittest.TestCase):
    def test_recover_round_zero_matches_saved_hash(self) -> None:
        checkpoint = json.loads(
            multi_core_bank.DEFAULT_INPUT.read_text(encoding="utf-8")
        )
        case = multi_core_bank._case_for_profile(checkpoint, (4, 5, 6))
        _problem, rows = multi_core_bank.recover_round_rows(case, 0)
        self.assertEqual(
            cegar.canonical_sha256(cegar.encode_metric_rows(rows)),
            case["rounds"][0]["metric_rows_sha256"],
        )

    def test_mock_exact_oracle_enumerates_multiple_cores(self) -> None:
        checkpoint = json.loads(
            multi_core_bank.DEFAULT_INPUT.read_text(encoding="utf-8")
        )
        case = multi_core_bank._case_for_profile(checkpoint, (4, 5, 6))
        _problem, rows = multi_core_bank.recover_round_rows(case, 0)
        names = tuple(cegar.encode_metric_row(row) for row in rows)
        forced = ({names[0], names[1]}, {names[1], names[2]})

        def fake_crosscheck(_n, subset, *, timeout_s=None):
            selected = {cegar.encode_metric_row(row) for row in subset}
            verdict = "UNIT" if any(core <= selected for core in forced) else "NONUNIT"
            return {
                "status": f"CROSSCHECKED_{verdict}",
                "singular_qq": {"verdict": verdict},
                "msolve_qq_forward_variables": {"verdict": verdict},
                "msolve_qq_reverse_variables": {"verdict": verdict},
            }

        smoke = {
            "unit": {
                "expected": "UNIT",
                "singular": {"verdict": "UNIT"},
                "msolve": {"verdict": "UNIT"},
            },
            "nonunit": {
                "expected": "NONUNIT",
                "singular": {"verdict": "NONUNIT"},
                "msolve": {"verdict": "NONUNIT"},
            },
        }
        with mock.patch.object(cegar, "exact_crosscheck", side_effect=fake_crosscheck), mock.patch.object(
            cegar.metric_oracle, "smoke_gates", return_value=smoke
        ):
            document = multi_core_bank.build_document(
                multi_core_bank.DEFAULT_INPUT,
                profile=(4, 5, 6),
                round_index=0,
                max_oracle_calls=64,
                max_minimal_cores=4,
                max_map_iterations=128,
            )
        cores = {frozenset(record["rows"]) for record in document["result"]["minimal_cores"]}
        self.assertEqual(cores, {frozenset(core) for core in forced})
        self.assertTrue(document["scope"]["solver_output_is_not_a_lean_producer"])


if __name__ == "__main__":
    unittest.main()
