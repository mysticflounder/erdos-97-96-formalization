#!/usr/bin/env python3
"""Focused soundness tests for v16 Boolean-assignment CEGAR."""

from __future__ import annotations

import unittest
from pathlib import Path

import z3

import round5_cegar_v16 as v16


class V16SemanticBoolTests(unittest.TestCase):
    def test_semantic_bool_collection_is_complete_and_excludes_trackers(self) -> None:
        a, b = z3.Bools("a b")
        x = z3.Real("x")
        tracker = z3.Bool("track_family")
        formulas = (
            z3.Implies(a, x >= 0),
            z3.PbEq(((a, 1), (b, 1)), 1),
            z3.Implies(tracker, z3.And(a, b)),
            tracker,
        )
        self.assertEqual(
            tuple(str(item) for item in v16.collect_semantic_bools(formulas)),
            ("a", "b"),
        )
        self.assertEqual(v16.collect_tracker_names(formulas), ("track_family",))

    def test_model_completion_yields_a_complete_canonical_assignment(self) -> None:
        a, b = z3.Bools("a b")
        solver = z3.Solver()
        solver.add(a)
        self.assertEqual(solver.check(), z3.sat)
        assignment = v16.canonical_assignment(solver.model(), (a, b))
        self.assertEqual(tuple(name for name, _ in assignment), ("a", "b"))
        self.assertTrue(dict(assignment)["a"])
        self.assertIsInstance(dict(assignment)["b"], bool)

    def test_assignment_completeness_is_enforced(self) -> None:
        a, b = z3.Bools("a b")
        with self.assertRaisesRegex(RuntimeError, "not complete"):
            v16._fixes_for_assignment((a, b), (("a", True),))


class V16ReplayTests(unittest.TestCase):
    def test_unsat_core_replays_and_tampered_core_fails(self) -> None:
        a = z3.Bool("a")
        frozen = (z3.Not(a),)
        good = (v16.Fix(a, True),)
        replay = v16.replay_projected_core(frozen, good, 1000, 97)
        self.assertEqual(replay["status"], "unsat")
        v16.authenticate_unsat_core(replay)

        tampered = v16.replay_projected_core(
            frozen, (v16.Fix(a, False),), 1000, 97, nonce="tampered"
        )
        self.assertEqual(tampered["status"], "sat")
        with self.assertRaisesRegex(RuntimeError, "failed fresh frozen replay"):
            v16.authenticate_unsat_core(tampered)

    def test_assignment_check_projects_only_fresh_selectors(self) -> None:
        a, b = z3.Bools("a b")
        frozen = (z3.Or(z3.Not(a), z3.Not(b)),)
        status, model, core, record = v16.check_assignment(
            frozen, (v16.Fix(a, True), v16.Fix(b, True)), 1000, 97, 0
        )
        self.assertEqual(status, "unsat")
        self.assertIsNone(model)
        self.assertEqual({str(fix.variable) for fix in core}, {"a", "b"})
        self.assertEqual(record["replay"]["status"], "unsat")

    def test_opposite_assignment_blocker_excludes_core_and_keeps_opposite(self) -> None:
        a, b = z3.Bools("a b")
        blocker = v16.blocker_for_core((v16.Fix(a, True), v16.Fix(b, False)))
        self.assertTrue(z3.is_false(z3.simplify(z3.substitute(
            blocker, (a, z3.BoolVal(True)), (b, z3.BoolVal(False))
        ))))
        self.assertTrue(z3.is_true(z3.simplify(z3.substitute(
            blocker, (a, z3.BoolVal(False)), (b, z3.BoolVal(False))
        ))))

    def test_empty_replayed_core_blocks_all_only_for_globally_unsat_formula(self) -> None:
        frozen = (z3.BoolVal(False),)
        replay = v16.replay_projected_core(frozen, (), 1000, 97)
        v16.authenticate_unsat_core(replay)
        self.assertTrue(z3.is_false(v16.blocker_for_core(())))


class V16ProvenanceTests(unittest.TestCase):
    def test_provenance_and_schema_hashes_are_frozen(self) -> None:
        provenance = v16.provenance()
        self.assertEqual(provenance["schema_version"], 16)
        self.assertEqual(provenance["target"], v16.TARGET)
        for key in (
            "script_sha256", "base_v15_script_sha256", "base_v14_script_sha256",
            "base_v13_script_sha256", "base_v12_script_sha256",
            "base_v8_script_sha256", "miner_v9_script_sha256", "schema_sha256",
            "base_v15_schema_sha256", "base_v14_schema_sha256",
            "base_v13_schema_sha256", "base_v12_schema_sha256",
            "base_v8_schema_sha256", "uv_lock_sha256",
        ):
            self.assertEqual(len(provenance[key]), 64)
        self.assertIn(
            "replayed UNSAT",
            provenance["source_contract"]["role_map"]["boolean_assignment_cegar"],
        )

    def test_transitive_formula_and_schema_hashes_match_current_files(self) -> None:
        provenance = v16.provenance()
        expected = {
            "base_v15_script_sha256": "round5_cegar_v15.py",
            "base_v14_script_sha256": "round5_cegar_v14.py",
            "base_v13_script_sha256": "round5_cegar_v13.py",
            "base_v12_script_sha256": "round5_cegar_v12.py",
            "base_v8_script_sha256": "round5_cegar_v8.py",
            "base_v15_schema_sha256": "schema_v15.json",
            "base_v14_schema_sha256": "schema_v14.json",
            "base_v13_schema_sha256": "schema_v13.json",
            "base_v12_schema_sha256": "schema_v12.json",
            "base_v8_schema_sha256": "schema_v8.json",
        }
        for key, relative in expected.items():
            with self.subTest(key=key):
                self.assertEqual(
                    provenance[key], v16.file_sha256(v16.HERE / Path(relative))
                )

    def test_v14_or_v13_parent_worker_hash_mismatch_fails_closed(self) -> None:
        current = v16.provenance()
        for key in ("base_v14_script_sha256", "base_v13_script_sha256"):
            with self.subTest(key=key):
                frozen = dict(current)
                frozen[key] = "0" * 64
                with self.assertRaisesRegex(
                    RuntimeError, "frozen provenance differs from worker source"
                ):
                    v16.verify_frozen_provenance(frozen, current["script_sha256"])

    def test_parser_has_fail_closed_v16_budgets(self) -> None:
        args = v16.parser().parse_args([
            "case", "--arm", "fresh", "--profiles", "DDD",
            "--kept", "0", "--deleted", "2", "--fresh", "1",
        ])
        self.assertGreater(args.max_assignments, 0)
        self.assertGreater(args.replay_timeout_ms, 0)
        self.assertEqual(args.artifacts, v16.HERE / "artifacts-v16")


if __name__ == "__main__":
    unittest.main()
