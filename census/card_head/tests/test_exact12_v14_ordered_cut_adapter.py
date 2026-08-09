# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import unittest
from pathlib import Path
from unittest.mock import patch

from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.card_head.exact12_v14_ordered_coverage import (
    FROZEN_V8_CUBE,
    MIXED_V3_CELL8_CUBE,
)
from census.card_head.exact12_v14_ordered_cut_adapter import (
    SOURCE_ORDER_CERTIFICATE_KIND,
    SOURCE_ORDER_DETECTOR_STAGE,
    Exact12V14OrderedCutAdapterError,
    detect_proof_backed_source_order_cut,
    replay_proof_backed_source_order_cut,
)
from census.card_head.exact12_v14_source_order_bank import build_source_order_bank

REPO_ROOT = Path(__file__).resolve().parents[3]


class Exact12V14OrderedCutAdapterTest(unittest.TestCase):
    def setUp(self) -> None:
        self.instance = materialize_cell(0).instance

    def test_admits_exactly_the_two_proof_backed_cubes(self) -> None:
        admitted = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, FROZEN_V8_CUBE
        )
        self.assertIsNotNone(admitted)
        assert admitted is not None
        self.assertEqual(admitted.certificate_kind, SOURCE_ORDER_CERTIFICATE_KIND)
        self.assertEqual(admitted.detector_stage, SOURCE_ORDER_DETECTOR_STAGE)
        self.assertEqual(
            admitted.learned_clause,
            (-42, -55, -169, -312, -501, -868, -1605, -2024, -2317, -2573, -2884),
        )
        cell8 = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V3_CELL8_CUBE
        )
        self.assertIsNotNone(cell8)
        assert cell8 is not None
        self.assertEqual(cell8.certificate_kind, SOURCE_ORDER_CERTIFICATE_KIND)
        self.assertEqual(cell8.detector_stage, SOURCE_ORDER_DETECTOR_STAGE)
        self.assertEqual(cell8.learned_clause, (-55, -313, -2134))

        different = copy.deepcopy(FROZEN_V8_CUBE)
        different["0"] = [1, 3, 4, 7]
        self.assertIsNone(
            detect_proof_backed_source_order_cut(REPO_ROOT, self.instance, different)
        )

    def test_replay_requires_exact_family_payload(self) -> None:
        admitted = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, FROZEN_V8_CUBE
        )
        assert admitted is not None
        clause = replay_proof_backed_source_order_cut(
            REPO_ROOT,
            self.instance,
            FROZEN_V8_CUBE,
            certificate_schema=admitted.certificate_schema,
            detector_stage=admitted.detector_stage,
            certificate=admitted.certificate,
        )
        self.assertEqual(clause, admitted.learned_clause)

        tampered = copy.deepcopy(admitted.certificate)
        tampered["generated_lean_nogood"]["nogood_declaration"] = "Fake"
        with self.assertRaisesRegex(
            Exact12V14OrderedCutAdapterError, "exact bank replay"
        ):
            replay_proof_backed_source_order_cut(
                REPO_ROOT,
                self.instance,
                FROZEN_V8_CUBE,
                certificate_schema=admitted.certificate_schema,
                detector_stage=admitted.detector_stage,
                certificate=tampered,
            )

        with self.assertRaisesRegex(
            Exact12V14OrderedCutAdapterError, "exact bank replay"
        ):
            replay_proof_backed_source_order_cut(
                REPO_ROOT,
                self.instance,
                FROZEN_V8_CUBE,
                certificate_schema="wrong-schema",
                detector_stage=admitted.detector_stage,
                certificate=admitted.certificate,
            )

    def test_rejects_bank_clause_that_does_not_recompile(self) -> None:
        bank = copy.deepcopy(build_source_order_bank(REPO_ROOT, self.instance))
        bank["entries"][0]["learned_clause"][0] = 1
        with (
            patch(
                "census.card_head.exact12_v14_ordered_cut_adapter.build_source_order_bank",
                return_value=bank,
            ),
            self.assertRaisesRegex(
                Exact12V14OrderedCutAdapterError, "exact recompilation"
            ),
        ):
            detect_proof_backed_source_order_cut(
                REPO_ROOT, self.instance, FROZEN_V8_CUBE
            )


if __name__ == "__main__":
    unittest.main()
