# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import tempfile
import unittest
from pathlib import Path

from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.card_head.exact12_v14_ordered_coverage import (
    FROZEN_V8_LEAN_BINDING,
    MIXED_V3_CELL8_LEAN_BINDING,
)
from census.card_head.exact12_v14_source_order_bank import (
    BANK_SCHEMA,
    Exact12V14SourceOrderBankError,
    _source_record,
    build_source_order_bank,
    install_source_order_bank,
    validate_source_order_bank,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


class Exact12V14SourceOrderBankTest(unittest.TestCase):
    def setUp(self) -> None:
        self.materialized = materialize_cell(0)
        self.instance = self.materialized.instance

    def test_builds_two_lean_proved_static_cuts(self) -> None:
        bank = build_source_order_bank(REPO_ROOT, self.instance)
        entry = bank["entries"][0]
        cell8 = bank["entries"][1]

        self.assertEqual(bank["schema"], BANK_SCHEMA)
        self.assertEqual(len(bank["entries"]), 2)
        self.assertEqual(entry["certificate_kind"], "source_order_positive_coverage")
        self.assertEqual(entry["certificate_schema"], entry["certificate"]["schema"])
        self.assertEqual(entry["generated_lean_nogood"], FROZEN_V8_LEAN_BINDING)
        self.assertEqual(
            entry["learned_clause"],
            [-variable for variable in entry["lean_choice_variables"]],
        )
        self.assertEqual(len(bank["lean_source_manifest"]), 4)
        self.assertEqual(
            entry["learned_clause"],
            [-42, -55, -169, -312, -501, -868, -1605, -2024, -2317, -2573, -2884],
        )
        self.assertEqual(
            cell8["generated_lean_nogood"], MIXED_V3_CELL8_LEAN_BINDING
        )
        self.assertEqual(cell8["learned_clause"], [-55, -313, -2134])
        self.assertTrue(bank["claims"]["lean_cut_proved"])
        self.assertFalse(bank["claims"]["terminal_unsat"])
        self.assertFalse(bank["claims"]["live_theorem_closure"])
        validate_source_order_bank(REPO_ROOT, self.instance, bank)

    def test_installs_clause_exactly_once(self) -> None:
        before = len(self.instance.cnf.clauses)
        bank = install_source_order_bank(REPO_ROOT, self.instance)
        clauses = [tuple(entry["learned_clause"]) for entry in bank["entries"]]

        self.assertEqual(len(self.instance.cnf.clauses), before + 2)
        self.assertEqual(self.instance.cnf.clauses[-2:], clauses)
        with self.assertRaisesRegex(
            Exact12V14SourceOrderBankError, "already installed"
        ):
            install_source_order_bank(REPO_ROOT, self.instance)

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
            root = Path(temporary)
            target = root / "target.lean"
            target.write_text("theorem target : True := by trivial\n")
            (root / "link.lean").symlink_to(target)
            with self.assertRaisesRegex(
                Exact12V14SourceOrderBankError, "missing regular"
            ):
                _source_record(root, "link.lean")


if __name__ == "__main__":
    unittest.main()
