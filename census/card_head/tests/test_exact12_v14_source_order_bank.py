# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import os
import tempfile
import unittest
from pathlib import Path
from unittest import mock

from census.card_head.exact12_next_row_arm_static_canary import (
    EXPECTED_SOURCE_ORDER_BANK_SHA256,
)
from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.card_head.exact12_v14_ordered_coverage import (
    ARM_STATIC_CELL6_COMMON_FIVE_LEAN_BINDING,
    ARM_STATIC_CELL6_FIFTH_COMMON_FIVE_LEAN_BINDING,
    ARM_STATIC_CELL6_FOURTH_COMMON_FIVE_LEAN_BINDING,
    ARM_STATIC_CELL6_SECOND_COMMON_FIVE_LEAN_BINDING,
    ARM_STATIC_CELL6_THIRD_COMMON_FIVE_LEAN_BINDING,
    FROZEN_V8_LEAN_BINDING,
    MIXED_V3_CELL2_LEAN_BINDING,
    MIXED_V3_CELL4_LEAN_BINDING,
    MIXED_V3_CELL5_LEAN_BINDING,
    MIXED_V3_CELL7_LEAN_BINDING,
    MIXED_V3_CELL8_LEAN_BINDING,
    MIXED_V4_CELL1_FOURTH_LEAN_BINDING,
    MIXED_V4_CELL1_LEAN_BINDING,
    MIXED_V4_CELL1_SECOND_LEAN_BINDING,
    MIXED_V4_CELL1_THIRD_LEAN_BINDING,
    MIXED_V4_CELL2_LEAN_BINDING,
    MIXED_V4_CELL2_SECOND_LEAN_BINDING,
    MIXED_V4_CELL4_LEAN_BINDING,
    MIXED_V4_CELL5_LEAN_BINDING,
    MIXED_V4_CELL8_LEAN_BINDING,
    MIXED_V4_CELL10_LEAN_BINDING,
    MIXED_V4_CELL10_SECOND_LEAN_BINDING,
    MIXED_V4_CELL11_LEAN_BINDING,
    MIXED_V5_CELL0_LEAN_BINDING,
    MIXED_V5_CELL3_LEAN_BINDING,
    MIXED_V5_CELL4_LEAN_BINDING,
    MIXED_V5_CELL9_LEAN_BINDING,
    MIXED_V5_CELL11_LEAN_BINDING,
    MIXED_V6_CELL0_LEAN_BINDING,
    MIXED_V6_CELL2_LEAN_BINDING,
    MIXED_V6_CELL6_LEAN_BINDING,
    MIXED_V6_CELL6_SECOND_LEAN_BINDING,
    MIXED_V6_CELL8_LEAN_BINDING,
    MIXED_V6_CELL9_LEAN_BINDING,
    MIXED_V6_CELL9_SECOND_LEAN_BINDING,
    MIXED_V6_CELL10_LEAN_BINDING,
    MIXED_V7_CELL8_EIGHTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_EIGHTH_LEAN_BINDING,
    MIXED_V7_CELL8_ELEVENTH_LEAN_BINDING,
    MIXED_V7_CELL8_FIFTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_FIFTH_LEAN_BINDING,
    MIXED_V7_CELL8_FOURTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_FOURTH_LEAN_BINDING,
    MIXED_V7_CELL8_LEAN_BINDING,
    MIXED_V7_CELL8_NINETEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_NINTH_LEAN_BINDING,
    MIXED_V7_CELL8_SECOND_LEAN_BINDING,
    MIXED_V7_CELL8_SEVENTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_SEVENTH_LEAN_BINDING,
    MIXED_V7_CELL8_SIXTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_SIXTH_LEAN_BINDING,
    MIXED_V7_CELL8_TENTH_LEAN_BINDING,
    MIXED_V7_CELL8_THIRD_LEAN_BINDING,
    MIXED_V7_CELL8_THIRTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_TWELFTH_LEAN_BINDING,
    MIXED_V7_CELL8_TWENTIETH_LEAN_BINDING,
    MIXED_V7_CELL8_TWENTY_FIFTH_LEAN_BINDING,
    MIXED_V7_CELL8_TWENTY_FIRST_LEAN_BINDING,
    MIXED_V7_CELL8_TWENTY_FOURTH_LEAN_BINDING,
    MIXED_V7_CELL8_TWENTY_SECOND_LEAN_BINDING,
    MIXED_V7_CELL8_TWENTY_THIRD_LEAN_BINDING,
    NEXT_ROW_CELL3_LEAN_BINDING,
    NEXT_ROW_STATIC_CONVEX_CELL0_LEAN_BINDING,
    NEXT_ROW_STATIC_CONVEX_CELL0_SECOND_LEAN_BINDING,
    NEXT_ROW_STATIC_CONVEX_CELL0_THIRD_LEAN_BINDING,
    STATIC_CELL1_AFTER_APEX_CROSS_BLOCK_LEAN_BINDING,
    STATIC_CELL1_AFTER_THREE_TRIAD_COMMON_FIVE_LEAN_BINDING,
    STATIC_CELL1_FOURTH_OPPOSITE_APEX_CHAIN_LEAN_BINDING,
    STATIC_CELL1_LATE_THREE_CORE_COMMON_FIVE_LEAN_BINDING,
    STATIC_CELL1_POST_CHAIN_COMMON_FIVE_LEAN_BINDING,
    STATIC_CELL1_POST_COMMON_FIVE_THREE_TRIAD_LEAN_BINDING,
    STATIC_CELL1_R9_COMMON_FIVE_LEAN_BINDING,
    STATIC_CELL1_R10_COMMON_FIVE_LEAN_BINDING,
    STATIC_CELL1_R11_COMMON_FIVE_LEAN_BINDING,
    STATIC_CELL1_R13_MIXED_LEAN_BINDING,
    STATIC_CELL1_R14_COMMON_FIVE_LEAN_BINDING,
    STATIC_CELL1_R15_COMMON_FIVE_LEAN_BINDING,
    STATIC_CELL1_SECOND_COMMON_FIVE_LEAN_BINDING,
    STATIC_CELL1_SURPLUS_CROSS_BLOCK_LEAN_BINDING,
    STATIC_CELL1_THIRD_BLOCK_SPANNING_LEAN_BINDING,
    V5R1_CELL1_COMMON_FIVE_LEAN_BINDING,
)
from census.card_head.exact12_v14_source_order_bank import (
    BANK_SCHEMA,
    Exact12V14SourceOrderBankError,
    _sha256_json,
    _source_record,
    attest_source_order_bank_live_sources,
    build_source_order_bank,
    build_source_order_bank_from_authenticated_sources,
    install_source_order_bank,
    snapshot_source_order_bank,
    validate_source_order_bank,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


class Exact12V14SourceOrderBankTest(unittest.TestCase):
    def setUp(self) -> None:
        self.materialized = materialize_cell(0)
        self.instance = self.materialized.instance

    def test_builds_eighty_one_lean_source_pinned_static_cuts(self) -> None:
        bank = build_source_order_bank(REPO_ROOT, self.instance)
        entry = bank["entries"][0]

        self.assertEqual(bank["schema"], BANK_SCHEMA)
        self.assertEqual(len(bank["entries"]), 81)
        self.assertEqual(
            bank["bank_sha256"], EXPECTED_SOURCE_ORDER_BANK_SHA256
        )
        self.assertEqual(entry["certificate_kind"], "source_order_positive_coverage")
        self.assertEqual(entry["certificate_schema"], entry["certificate"]["schema"])
        self.assertEqual(entry["generated_lean_nogood"], FROZEN_V8_LEAN_BINDING)
        self.assertEqual(
            entry["learned_clause"],
            [-variable for variable in entry["lean_choice_variables"]],
        )
        self.assertEqual(len(bank["lean_source_manifest"]), 88)
        self.assertEqual(
            entry["learned_clause"],
            [-42, -55, -169, -312, -501, -868, -1605, -2024, -2317, -2573, -2884],
        )
        expected = (
            (MIXED_V3_CELL2_LEAN_BINDING, [-55, -410, -498]),
            (MIXED_V3_CELL4_LEAN_BINDING, [-896, -1170, -2053, -2162]),
            (MIXED_V3_CELL5_LEAN_BINDING, [-35, -172, -1363, -1620, -2493]),
            (MIXED_V3_CELL7_LEAN_BINDING, [-29, -55, -546, -939, -2894]),
            (MIXED_V3_CELL8_LEAN_BINDING, [-55, -313, -2134]),
            (MIXED_V4_CELL4_LEAN_BINDING, [-55, -387, -703, -1605, -1935]),
            (MIXED_V4_CELL1_LEAN_BINDING, [-43, -164, -1171]),
            (MIXED_V4_CELL1_SECOND_LEAN_BINDING, [-160, -2312, -2864]),
            (MIXED_V4_CELL1_THIRD_LEAN_BINDING, [-160, -1383, -2548]),
            (
                MIXED_V4_CELL10_LEAN_BINDING,
                [-264, -704, -898, -1437, -2034, -2134],
            ),
            (MIXED_V4_CELL2_LEAN_BINDING, [-1156, -1640, -2537]),
            (MIXED_V4_CELL5_LEAN_BINDING, [-10, -846, -2550]),
            (MIXED_V4_CELL8_LEAN_BINDING, [-40, -160, -230]),
            (MIXED_V4_CELL11_LEAN_BINDING, [-1620, -2096, -3017]),
            (MIXED_V4_CELL1_FOURTH_LEAN_BINDING, [-22, -168, -1177]),
            (MIXED_V4_CELL2_SECOND_LEAN_BINDING, [-55, -704, -991]),
            (
                MIXED_V4_CELL10_SECOND_LEAN_BINDING,
                [-26, -834, -1200, -2034, -2310],
            ),
            (MIXED_V5_CELL4_LEAN_BINDING, [-29, -55, -165, -1342, -2138]),
            (MIXED_V5_CELL9_LEAN_BINDING, [-55, -370, -1170, -2207, -2560]),
            (MIXED_V5_CELL0_LEAN_BINDING, [-396, -612, -1262, -2343, -2747]),
            (MIXED_V5_CELL3_LEAN_BINDING, [-299, -611, -2918]),
            (MIXED_V5_CELL11_LEAN_BINDING, [-55, -223, -609, -1920, -2918]),
            (MIXED_V6_CELL9_LEAN_BINDING, [-55, -552, -1152]),
            (MIXED_V6_CELL6_LEAN_BINDING, [-1208, -1630, -2065, -2761]),
            (
                MIXED_V6_CELL9_SECOND_LEAN_BINDING,
                [-55, -155, -618, -2397],
            ),
            (MIXED_V6_CELL2_LEAN_BINDING, [-177, -1156, -1605]),
            (MIXED_V6_CELL8_LEAN_BINDING, [-289, -618, -2083]),
            (MIXED_V6_CELL0_LEAN_BINDING, [-6, -2431, -2872]),
            (
                MIXED_V6_CELL6_SECOND_LEAN_BINDING,
                [-55, -409, -632, -1264, -1605, -2092],
            ),
            (MIXED_V6_CELL10_LEAN_BINDING, [-55, -852, -2848]),
            (MIXED_V7_CELL8_LEAN_BINDING, [-55, -312, -2114]),
            (
                MIXED_V7_CELL8_SECOND_LEAN_BINDING,
                [-5, -55, -1640, -2065, -2419],
            ),
            (MIXED_V7_CELL8_THIRD_LEAN_BINDING, [-972, -2371, -2419]),
            (
                MIXED_V7_CELL8_FOURTH_LEAN_BINDING,
                [-55, -158, -312, -1366, -1641, -2371],
            ),
            (MIXED_V7_CELL8_FIFTH_LEAN_BINDING, [-55, -545, -2206]),
            (
                MIXED_V7_CELL8_SIXTH_LEAN_BINDING,
                [-34, -234, -841, -2034, -2300],
            ),
            (MIXED_V7_CELL8_SEVENTH_LEAN_BINDING, [-545, -930, -1393]),
            (
                MIXED_V7_CELL8_EIGHTH_LEAN_BINDING,
                [-55, -159, -345, -930, -1207, -2601],
            ),
            (MIXED_V7_CELL8_NINTH_LEAN_BINDING, [-55, -2118, -2408]),
            (MIXED_V7_CELL8_TENTH_LEAN_BINDING, [-55, -2120, -2408]),
            (MIXED_V7_CELL8_ELEVENTH_LEAN_BINDING, [-55, -2125, -2420]),
            (
                MIXED_V7_CELL8_TWELFTH_LEAN_BINDING,
                [-360, -936, -1241, -2651, -2761],
            ),
            (
                MIXED_V7_CELL8_THIRTEENTH_LEAN_BINDING,
                [-21, -55, -1169],
            ),
            (
                MIXED_V7_CELL8_FOURTEENTH_LEAN_BINDING,
                [-21, -166, -2425],
            ),
            (
                MIXED_V7_CELL8_FIFTEENTH_LEAN_BINDING,
                [-37, -156, -1169],
            ),
            (
                MIXED_V7_CELL8_SIXTEENTH_LEAN_BINDING,
                [-55, -288, -1182],
            ),
            (
                MIXED_V7_CELL8_SEVENTEENTH_LEAN_BINDING,
                [-55, -163, -1069, -1630, -2024],
            ),
            (
                MIXED_V7_CELL8_EIGHTEENTH_LEAN_BINDING,
                [-368, -951, -1719, -2065, -2291, -2420, -2992],
            ),
            (
                MIXED_V7_CELL8_NINETEENTH_LEAN_BINDING,
                [-367, -2085, -2420],
            ),
            (
                MIXED_V7_CELL8_TWENTIETH_LEAN_BINDING,
                [-516, -849, -1221],
            ),
            (
                MIXED_V7_CELL8_TWENTY_FIRST_LEAN_BINDING,
                [-19, -291, -618],
            ),
            (
                MIXED_V7_CELL8_TWENTY_SECOND_LEAN_BINDING,
                [-323, -1605, -2074],
            ),
            (
                MIXED_V7_CELL8_TWENTY_THIRD_LEAN_BINDING,
                [-21, -290, -936],
            ),
            (
                MIXED_V7_CELL8_TWENTY_FOURTH_LEAN_BINDING,
                [-55, -2118, -2420],
            ),
            (
                MIXED_V7_CELL8_TWENTY_FIFTH_LEAN_BINDING,
                [-504, -2118, -2484],
            ),
            (
                NEXT_ROW_CELL3_LEAN_BINDING,
                [-4, -87, -157, -817, -891, -1343, -1473, -2160, -2710, -2848],
            ),
            (
                NEXT_ROW_STATIC_CONVEX_CELL0_LEAN_BINDING,
                [-55, -231, -839, -1234, -1620, -2471, -2997],
            ),
            (
                NEXT_ROW_STATIC_CONVEX_CELL0_SECOND_LEAN_BINDING,
                [-231, -987, -1234, -1620, -2307, -2997],
            ),
            (
                NEXT_ROW_STATIC_CONVEX_CELL0_THIRD_LEAN_BINDING,
                [-231, -1442, -1620, -2471, -2997],
            ),
            (
                V5R1_CELL1_COMMON_FIVE_LEAN_BINDING,
                [-1, -61, -912, -1194, -1630, -2218],
            ),
            (
                STATIC_CELL1_SECOND_COMMON_FIVE_LEAN_BINDING,
                [-61, -175, -554, -912, -1630, -2239, -2702],
            ),
            (
                STATIC_CELL1_THIRD_BLOCK_SPANNING_LEAN_BINDING,
                [-61, -175, -912],
            ),
            (
                STATIC_CELL1_AFTER_THREE_TRIAD_COMMON_FIVE_LEAN_BINDING,
                [-61, -2239, -2994],
            ),
            (
                STATIC_CELL1_AFTER_APEX_CROSS_BLOCK_LEAN_BINDING,
                [-155, -924, -2301],
            ),
            (
                STATIC_CELL1_FOURTH_OPPOSITE_APEX_CHAIN_LEAN_BINDING,
                [-1, -61, -155, -1195],
            ),
            (
                STATIC_CELL1_SURPLUS_CROSS_BLOCK_LEAN_BINDING,
                [-157, -1032, -2065],
            ),
            (
                STATIC_CELL1_POST_CHAIN_COMMON_FIVE_LEAN_BINDING,
                [-61, -155, -2803],
            ),
            (
                STATIC_CELL1_POST_COMMON_FIVE_THREE_TRIAD_LEAN_BINDING,
                [-1451, -1957, -2672, -2955],
            ),
            (
                STATIC_CELL1_LATE_THREE_CORE_COMMON_FIVE_LEAN_BINDING,
                [-175, -554, -924, -1431, -2672],
            ),
            (
                STATIC_CELL1_R9_COMMON_FIVE_LEAN_BINDING,
                [-924, -1748, -2312],
            ),
            (
                STATIC_CELL1_R10_COMMON_FIVE_LEAN_BINDING,
                [-1748, -2309, -3008],
            ),
            (
                STATIC_CELL1_R11_COMMON_FIVE_LEAN_BINDING,
                [-1433, -2672, -2958],
            ),
            (
                STATIC_CELL1_R13_MIXED_LEAN_BINDING,
                [-1, -155, -175, -554, -924, -2672, -2958],
            ),
            (
                STATIC_CELL1_R14_COMMON_FIVE_LEAN_BINDING,
                [-924, -1748, -2308],
            ),
            (
                STATIC_CELL1_R15_COMMON_FIVE_LEAN_BINDING,
                [-1748, -2362, -2487],
            ),
            (
                ARM_STATIC_CELL6_COMMON_FIVE_LEAN_BINDING,
                [-925, -1198, -2258],
            ),
            (
                ARM_STATIC_CELL6_SECOND_COMMON_FIVE_LEAN_BINDING,
                [-156, -175, -2820],
            ),
            (
                ARM_STATIC_CELL6_THIRD_COMMON_FIVE_LEAN_BINDING,
                [-61, -175, -1226],
            ),
            (
                ARM_STATIC_CELL6_FOURTH_COMMON_FIVE_LEAN_BINDING,
                [-18, -1342, -2445],
            ),
            (
                ARM_STATIC_CELL6_FIFTH_COMMON_FIVE_LEAN_BINDING,
                [-838, -1584, -2205],
            ),
        )
        for bank_entry, (binding, clause) in zip(
            bank["entries"][1:], expected, strict=True
        ):
            self.assertEqual(bank_entry["generated_lean_nogood"], binding)
            self.assertEqual(bank_entry["learned_clause"], clause)
        self.assertTrue(bank["claims"]["lean_cut_source_pinned"])
        self.assertFalse(bank["claims"]["terminal_unsat"])
        self.assertFalse(bank["claims"]["live_theorem_closure"])
        validate_source_order_bank(REPO_ROOT, self.instance, bank)

    def test_installs_clause_exactly_once(self) -> None:
        before = len(self.instance.cnf.clauses)
        bank = install_source_order_bank(REPO_ROOT, self.instance)
        clauses = [tuple(entry["learned_clause"]) for entry in bank["entries"]]

        self.assertEqual(len(self.instance.cnf.clauses), before + 81)
        self.assertEqual(self.instance.cnf.clauses[-81:], clauses)
        with self.assertRaisesRegex(
            Exact12V14SourceOrderBankError, "already installed"
        ):
            install_source_order_bank(REPO_ROOT, self.instance)

    def test_authenticated_bytes_rebuild_exact_bank_without_path_reopen(self) -> None:
        expected = build_source_order_bank(REPO_ROOT, self.instance)
        source_records = {
            record["path"]: record
            for manifest_name in ("detector_manifest", "lean_source_manifest")
            for record in expected[manifest_name]
        }
        source_bytes = {
            relative: (REPO_ROOT / relative).read_bytes() for relative in source_records
        }

        rebuilt = build_source_order_bank_from_authenticated_sources(
            self.instance, source_bytes
        )

        self.assertEqual(rebuilt, expected)
        lean_path = expected["lean_source_manifest"][0]["path"]
        tampered = dict(source_bytes)
        tampered[lean_path] += b"\n"
        with self.assertRaisesRegex(
            Exact12V14SourceOrderBankError,
            "authenticated Lean nogood source bytes drifted",
        ):
            build_source_order_bank_from_authenticated_sources(self.instance, tampered)

        bytes_subclass = dict(source_bytes)
        bytes_subclass[lean_path] = type("BytesSubclass", (bytes,), {})(
            source_bytes[lean_path]
        )
        with self.assertRaisesRegex(
            Exact12V14SourceOrderBankError, "not immutable bytes"
        ):
            build_source_order_bank_from_authenticated_sources(
                self.instance, bytes_subclass
            )

    def test_supplied_bank_snapshot_requires_complete_self_authentication(self) -> None:
        bank = build_source_order_bank(REPO_ROOT, self.instance)
        snapshot = snapshot_source_order_bank(self.instance, bank)
        self.assertEqual(snapshot, bank)
        bank["entries"][0]["index"] = 99
        self.assertNotEqual(snapshot, bank)

        bank = build_source_order_bank(REPO_ROOT, self.instance)
        wrong_self_hash = copy.deepcopy(bank)
        wrong_self_hash["bank_sha256"] = "0" * 64
        with self.assertRaisesRegex(
            Exact12V14SourceOrderBankError, "schema or digest authentication"
        ):
            snapshot_source_order_bank(self.instance, wrong_self_hash)

        wrong_manifest_hash = copy.deepcopy(bank)
        wrong_manifest_hash["detector_manifest_sha256"] = "0" * 64
        body = copy.deepcopy(wrong_manifest_hash)
        body.pop("bank_sha256")
        wrong_manifest_hash["bank_sha256"] = _sha256_json(body)
        with self.assertRaisesRegex(
            Exact12V14SourceOrderBankError, "schema or digest authentication"
        ):
            snapshot_source_order_bank(self.instance, wrong_manifest_hash)

        wrong_claim = copy.deepcopy(bank)
        wrong_claim["claims"]["terminal_unsat"] = True
        body = copy.deepcopy(wrong_claim)
        body.pop("bank_sha256")
        wrong_claim["bank_sha256"] = _sha256_json(body)
        with self.assertRaisesRegex(
            Exact12V14SourceOrderBankError, "schema or digest authentication"
        ):
            snapshot_source_order_bank(self.instance, wrong_claim)

        for field, mutate in (
            (
                "Lean binding",
                lambda value: value["entries"][0]["generated_lean_nogood"].__setitem__(
                    "nogood_declaration", "Fake"
                ),
            ),
            (
                "Lean source manifest",
                lambda value: value["lean_source_manifest"][0].__setitem__(
                    "sha256", "0" * 64
                ),
            ),
            (
                "entry certificate digest",
                lambda value: value["entries"][0].__setitem__(
                    "certificate_sha256", "0" * 64
                ),
            ),
        ):
            resealed = build_source_order_bank(REPO_ROOT, self.instance)
            mutate(resealed)
            body = copy.deepcopy(resealed)
            body.pop("bank_sha256")
            resealed["bank_sha256"] = _sha256_json(body)
            with (
                self.subTest(field=field),
                self.assertRaises(Exact12V14SourceOrderBankError),
            ):
                snapshot_source_order_bank(self.instance, resealed)

    def test_tampering_fails_fresh_rebuild_gate(self) -> None:
        bank = build_source_order_bank(REPO_ROOT, self.instance)
        mutations = []
        clause = copy.deepcopy(bank)
        clause["entries"][0]["learned_clause"][0] = -1
        mutations.append(clause)
        declaration = copy.deepcopy(bank)
        declaration["entries"][0]["generated_lean_nogood"]["declaration"] = "Fake"
        mutations.append(declaration)
        source = copy.deepcopy(bank)
        source["lean_source_manifest"][0]["sha256"] = "0" * 64
        mutations.append(source)
        choices = copy.deepcopy(bank)
        choices["entries"][0]["generated_lean_nogood"]["choices"].pop()
        mutations.append(choices)
        consumer = copy.deepcopy(bank)
        consumer["lean_source_manifest"][2]["sha256"] = "0" * 64
        mutations.append(consumer)
        claims = copy.deepcopy(bank)
        claims["claims"]["terminal_unsat"] = True
        mutations.append(claims)

        for mutation in mutations:
            with (
                self.subTest(mutation=mutation),
                self.assertRaisesRegex(
                    Exact12V14SourceOrderBankError, "fresh proof-backed bank"
                ),
            ):
                validate_source_order_bank(REPO_ROOT, self.instance, mutation)

    def test_source_snapshot_rejects_escape_and_symlink(self) -> None:
        with self.assertRaisesRegex(
            Exact12V14SourceOrderBankError, "escapes repository"
        ):
            _source_record(REPO_ROOT, "../outside.py")

        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary).resolve()
            target = root / "target.lean"
            target.write_text("theorem target : True := by trivial\n")
            (root / "link.lean").symlink_to(target)
            with self.assertRaisesRegex(
                Exact12V14SourceOrderBankError, "missing regular"
            ):
                _source_record(root, "link.lean")

            target_directory = root / "target"
            target_directory.mkdir()
            (target_directory / "source.lean").write_text(
                "theorem nestedTarget : True := by trivial\n"
            )
            (root / "nested").symlink_to(target_directory, target_is_directory=True)
            with self.assertRaisesRegex(
                Exact12V14SourceOrderBankError, "missing regular"
            ):
                _source_record(root, "nested/source.lean")

    def test_source_snapshot_rejects_fifo_without_blocking(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            fifo = root / "source.lean"
            os.mkfifo(fifo)

            with self.assertRaisesRegex(
                Exact12V14SourceOrderBankError, "missing regular"
            ):
                _source_record(root, fifo.name)

    def test_live_source_attestation_rejects_lean_or_detector_drift(self) -> None:
        lean_manifest = [{"path": "source.lean", "bytes": 1, "sha256": "a"}]
        detector_manifest = [
            {"path": "detector.py", "bytes": 1, "sha256": "b"}
        ]
        bank = {
            "lean_source_manifest": lean_manifest,
            "detector_manifest": detector_manifest,
            "detector_manifest_sha256": _sha256_json(detector_manifest),
        }
        with mock.patch(
            "census.card_head.exact12_v14_source_order_bank."
            "_current_lean_source_manifest",
            return_value=lean_manifest,
        ), mock.patch(
            "census.card_head.exact12_v14_source_order_bank._detector_manifest",
            return_value=detector_manifest,
        ):
            attest_source_order_bank_live_sources(REPO_ROOT, bank)

        with mock.patch(
            "census.card_head.exact12_v14_source_order_bank."
            "_current_lean_source_manifest",
            return_value=[],
        ), self.assertRaisesRegex(
            Exact12V14SourceOrderBankError, "Lean sources"
        ):
            attest_source_order_bank_live_sources(REPO_ROOT, bank)

        with mock.patch(
            "census.card_head.exact12_v14_source_order_bank."
            "_current_lean_source_manifest",
            return_value=lean_manifest,
        ), mock.patch(
            "census.card_head.exact12_v14_source_order_bank._detector_manifest",
            return_value=[],
        ), self.assertRaisesRegex(
            Exact12V14SourceOrderBankError, "detector sources"
        ):
            attest_source_order_bank_live_sources(REPO_ROOT, bank)


if __name__ == "__main__":
    unittest.main()
