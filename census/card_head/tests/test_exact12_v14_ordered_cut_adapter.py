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
    MIXED_V4_CELL1_CUBE,
    MIXED_V4_CELL1_SECOND_CUBE,
    MIXED_V4_CELL1_THIRD_CUBE,
    MIXED_V4_CELL4_CUBE,
    MIXED_V4_CELL10_CUBE,
    MIXED_V5_CELL0_CUBE,
    MIXED_V5_CELL3_CUBE,
    MIXED_V5_CELL4_CUBE,
    MIXED_V5_CELL9_CUBE,
    MIXED_V5_CELL11_CUBE,
)
from census.card_head.exact12_v14_ordered_cut_adapter import (
    SOURCE_ORDER_CERTIFICATE_KIND,
    SOURCE_ORDER_DETECTOR_STAGE,
    Exact12V14OrderedCutAdapterError,
    detect_proof_backed_source_order_cut,
    replay_proof_backed_source_order_cut,
)
from census.card_head.exact12_v14_source_order_bank import (
    _sha256_json,
    build_source_order_bank,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


def _reseal_bank(bank: dict[str, object]) -> None:
    body = copy.deepcopy(bank)
    body.pop("bank_sha256")
    bank["bank_sha256"] = _sha256_json(body)


class Exact12V14OrderedCutAdapterTest(unittest.TestCase):
    def setUp(self) -> None:
        self.instance = materialize_cell(0).instance

    def test_admits_representative_proof_backed_cubes(self) -> None:
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
        mixed_v4_cell4 = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V4_CELL4_CUBE
        )
        self.assertIsNotNone(mixed_v4_cell4)
        assert mixed_v4_cell4 is not None
        self.assertEqual(mixed_v4_cell4.bank_index, 6)
        self.assertEqual(mixed_v4_cell4.learned_clause, (-55, -387, -703, -1605, -1935))
        mixed_v4_cell1 = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V4_CELL1_CUBE
        )
        self.assertIsNotNone(mixed_v4_cell1)
        assert mixed_v4_cell1 is not None
        self.assertEqual(mixed_v4_cell1.bank_index, 7)
        self.assertEqual(mixed_v4_cell1.learned_clause, (-43, -164, -1171))
        mixed_v4_cell1_second = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V4_CELL1_SECOND_CUBE
        )
        self.assertIsNotNone(mixed_v4_cell1_second)
        assert mixed_v4_cell1_second is not None
        self.assertEqual(mixed_v4_cell1_second.bank_index, 8)
        self.assertEqual(mixed_v4_cell1_second.learned_clause, (-160, -2312, -2864))
        mixed_v4_cell1_third = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V4_CELL1_THIRD_CUBE
        )
        self.assertIsNotNone(mixed_v4_cell1_third)
        assert mixed_v4_cell1_third is not None
        self.assertEqual(mixed_v4_cell1_third.bank_index, 9)
        self.assertEqual(mixed_v4_cell1_third.learned_clause, (-160, -1383, -2548))
        mixed_v4_cell10 = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V4_CELL10_CUBE
        )
        self.assertIsNotNone(mixed_v4_cell10)
        assert mixed_v4_cell10 is not None
        self.assertEqual(mixed_v4_cell10.bank_index, 10)
        self.assertEqual(
            mixed_v4_cell10.learned_clause,
            (-264, -704, -898, -1437, -2034, -2134),
        )
        mixed_v5_cell4 = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V5_CELL4_CUBE
        )
        self.assertIsNotNone(mixed_v5_cell4)
        assert mixed_v5_cell4 is not None
        self.assertEqual(mixed_v5_cell4.bank_index, 18)
        self.assertEqual(
            mixed_v5_cell4.learned_clause,
            (-29, -55, -165, -1342, -2138),
        )
        mixed_v5_cell9 = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V5_CELL9_CUBE
        )
        self.assertIsNotNone(mixed_v5_cell9)
        assert mixed_v5_cell9 is not None
        self.assertEqual(mixed_v5_cell9.bank_index, 19)
        self.assertEqual(
            mixed_v5_cell9.learned_clause,
            (-55, -370, -1170, -2207, -2560),
        )
        mixed_v5_cell0 = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V5_CELL0_CUBE
        )
        self.assertIsNotNone(mixed_v5_cell0)
        assert mixed_v5_cell0 is not None
        self.assertEqual(mixed_v5_cell0.bank_index, 20)
        self.assertEqual(
            mixed_v5_cell0.learned_clause,
            (-396, -612, -1262, -2343, -2747),
        )
        mixed_v5_cell3 = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V5_CELL3_CUBE
        )
        self.assertIsNotNone(mixed_v5_cell3)
        assert mixed_v5_cell3 is not None
        self.assertEqual(mixed_v5_cell3.bank_index, 21)
        self.assertEqual(mixed_v5_cell3.learned_clause, (-299, -611, -2918))
        mixed_v5_cell11 = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, MIXED_V5_CELL11_CUBE
        )
        self.assertIsNotNone(mixed_v5_cell11)
        assert mixed_v5_cell11 is not None
        self.assertEqual(mixed_v5_cell11.bank_index, 22)
        self.assertEqual(
            mixed_v5_cell11.learned_clause,
            (-55, -223, -609, -1920, -2918),
        )

        different = copy.deepcopy(FROZEN_V8_CUBE)
        different["0"] = [1, 3, 4, 7]
        self.assertIsNone(
            detect_proof_backed_source_order_cut(REPO_ROOT, self.instance, different)
        )

    def test_admits_assignment_that_matches_authenticated_choice_subset(self) -> None:
        alternate = copy.deepcopy(FROZEN_V8_CUBE)
        alternate["6"] = [0, 1, 4, 7]
        admitted = detect_proof_backed_source_order_cut(
            REPO_ROOT, self.instance, alternate
        )
        self.assertIsNotNone(admitted)
        assert admitted is not None
        self.assertEqual(admitted.bank_index, 0)

    def test_authenticated_bank_detection_never_reopens_repository(self) -> None:
        bank = build_source_order_bank(REPO_ROOT, self.instance)
        with patch(
            "census.card_head.exact12_v14_ordered_cut_adapter.build_source_order_bank",
            side_effect=AssertionError("repository path reopened"),
        ):
            admitted = detect_proof_backed_source_order_cut(
                None,
                self.instance,
                MIXED_V4_CELL10_CUBE,
                source_order_bank=bank,
            )

        self.assertIsNotNone(admitted)
        assert admitted is not None
        self.assertEqual(admitted.bank_index, 10)
        self.assertEqual(
            admitted.learned_clause,
            (-264, -704, -898, -1437, -2034, -2134),
        )

        tampered = copy.deepcopy(bank)
        tampered["entries"][10]["learned_clause"][0] = -1
        with self.assertRaisesRegex(
            Exact12V14OrderedCutAdapterError, "schema or digest authentication"
        ):
            detect_proof_backed_source_order_cut(
                None,
                self.instance,
                MIXED_V4_CELL10_CUBE,
                source_order_bank=tampered,
            )

    def test_rejects_reindexed_or_reordered_bank(self) -> None:
        bank = copy.deepcopy(build_source_order_bank(REPO_ROOT, self.instance))
        first = copy.deepcopy(bank["entries"][0])
        first["index"] = 9
        second = copy.deepcopy(bank["entries"][0])
        second["index"] = 3
        bank["entries"] = [first, second]
        _reseal_bank(bank)
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
            bank_index=admitted.bank_index,
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
                bank_index=admitted.bank_index,
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
                bank_index=admitted.bank_index,
            )

        with self.assertRaisesRegex(
            Exact12V14OrderedCutAdapterError, "bank index or certificate"
        ):
            replay_proof_backed_source_order_cut(
                REPO_ROOT,
                self.instance,
                FROZEN_V8_CUBE,
                certificate_schema=admitted.certificate_schema,
                detector_stage=admitted.detector_stage,
                certificate=admitted.certificate,
                bank_index=admitted.bank_index + 1,
            )

    def test_rejects_bank_clause_that_does_not_recompile(self) -> None:
        bank = copy.deepcopy(build_source_order_bank(REPO_ROOT, self.instance))
        bank["entries"][0]["learned_clause"][0] = 1
        _reseal_bank(bank)
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

    def test_rejects_nonnegative_unique_bank_index_violation(self) -> None:
        for bad_index in (-1, True):
            bank = copy.deepcopy(build_source_order_bank(REPO_ROOT, self.instance))
            bank["entries"][0]["index"] = bad_index
            _reseal_bank(bank)
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

        bank = copy.deepcopy(build_source_order_bank(REPO_ROOT, self.instance))
        bank["entries"][1]["index"] = bank["entries"][0]["index"]
        _reseal_bank(bank)
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
