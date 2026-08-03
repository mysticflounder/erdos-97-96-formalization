"""Focused contract tests for the spawn-safe v30 composition adapter."""

from __future__ import annotations

import copy
import json
import multiprocessing
import os
import tempfile
import unittest
from concurrent.futures import ProcessPoolExecutor
from dataclasses import asdict
from pathlib import Path

import z3

import round5_cegar_v12 as v12
import round5_cegar_v16 as v16
import round5_cegar_v19 as v19
import round5_cegar_v29 as v29
import round5_cegar_v30 as v30

AUTHENTICATED_SUMMARY = (
    v30.HERE
    / "artifacts-v29-c-full-nonapex-shell"
    / "20260802T210119.317640Z-retry-pid32065"
    / "summary.json"
)


class V30AdapterTests(unittest.TestCase):
    def test_provenance_chains_dependencies_and_declares_artifacts(self) -> None:
        frozen = v30.provenance()
        self.assertEqual(frozen["schema_version"], 30)
        self.assertEqual(frozen["script_sha256"], v30.file_sha256(v30.SCRIPT_PATH))
        self.assertEqual(frozen["schema_sha256"], v30.file_sha256(v30.SCHEMA_PATH))
        dependencies = frozen["v30_dependency_sha256"]
        self.assertEqual(
            dependencies["round5_cegar_v29.py"],
            v30.file_sha256(v30.HERE / "round5_cegar_v29.py"),
        )
        self.assertEqual(
            dependencies["round5_cegar_v19.py"],
            v30.file_sha256(v30.HERE / "round5_cegar_v19.py"),
        )
        self.assertEqual(
            frozen["retry_source_contract"]["sha256"],
            v30.AUTHENTICATED_V29_SUMMARY_SHA256,
        )
        self.assertEqual(
            frozen["artifact_contract"]["default_directory"],
            v30.DEFAULT_ARTIFACT_DIR.name,
        )
        self.assertEqual(frozen["artifact_contract"]["names"], v30.ARTIFACT_NAMES)
        self.assertEqual(frozen["spawn_contract"]["worker_range"], [1, 24])
        self.assertEqual(
            frozen["focused_test_source_sha256"], v30.file_sha256(Path(__file__))
        )

    def test_runtime_context_binds_and_restores_every_global(self) -> None:
        watched = (
            (v12, "SCHEMA_VERSION"),
            (v12, "SCRIPT_PATH"),
            (v12, "SCHEMA_PATH"),
            (v12, "Encoding"),
            (v12, "source_contract"),
            (v12, "provenance"),
            (v16, "SCHEMA_VERSION"),
            (v16, "SCRIPT_PATH"),
            (v16, "SCHEMA_PATH"),
            (v16, "Encoding"),
            (v16, "source_contract"),
            (v16, "provenance"),
            (v19, "SCHEMA_VERSION"),
            (v19, "SCRIPT_PATH"),
            (v19, "SCHEMA_PATH"),
            (v19, "source_contract"),
            (v19, "provenance"),
            (v19, "verify_frozen_provenance"),
        )
        before = {(id(owner), name): getattr(owner, name) for owner, name in watched}
        before_active = v12.v9.active_full_shells
        with (
            self.assertRaisesRegex(RuntimeError, "sentinel"),
            v30._bound_v30_runtime(),
        ):
            self.assertIs(v12.Encoding, v29.Encoding)
            self.assertIs(v16.Encoding, v29.Encoding)
            self.assertIs(v19.provenance, v30.provenance)
            self.assertIs(v19.source_contract, v30.source_contract)
            self.assertIs(v12.v9.active_full_shells, v29.active_full_shells)
            raise RuntimeError("sentinel")
        for owner, name in watched:
            self.assertIs(getattr(owner, name), before[id(owner), name])
        self.assertIs(v12.v9.active_full_shells, before_active)

    def test_v19_complete_assignment_gate_remains_exactly_825(self) -> None:
        variable = z3.Bool("v30_incomplete_assignment")
        with self.assertRaisesRegex(RuntimeError, "exactly 825 unique"):
            v19.check_assignment(
                (z3.Or(variable, z3.Not(variable)),),
                (v19.Fix(variable, True),),
                timeout_ms=1,
                seed=97,
                iteration=0,
            )

    def test_v30_profile_specific_semantic_universe_is_exact(self) -> None:
        for profiles, expected in (
            ("SSS", 780),
            ("DSS", 795),
            ("SDD", 810),
            ("DDD", 825),
        ):
            with self.subTest(profiles=profiles):
                case = v30.Case("paired", profiles, 0, 1, None)
                self.assertEqual(v30.expected_semantic_bool_count(case), expected)

        left = z3.Bool("v30_exact_left")
        right = z3.Bool("v30_exact_right")
        frozen = (z3.And(z3.Or(left, z3.Not(left)), right),)
        exact = (v19.Fix(left, True), v19.Fix(right, False))
        self.assertEqual(len(v30._validate_complete_semantic_fixes(frozen, exact)), 2)
        for bad in (
            exact[:1],
            (exact[0], exact[0]),
            (exact[0], v19.Fix(z3.Bool("v30_wrong_name"), False)),
            (*exact, v19.Fix(z3.Bool("v30_extra_name"), True)),
        ):
            with (
                self.subTest(bad=tuple(str(fix.variable) for fix in bad)),
                self.assertRaisesRegex(RuntimeError, "duplicate|not complete"),
            ):
                v30._validate_complete_semantic_fixes(frozen, bad)

    def test_hybrid_raw_probe_admits_only_replayed_unsat(self) -> None:
        case = v30.Case("paired", "SDD", 0, 1, None)
        fixes = tuple(
            v19.Fix(z3.Bool(f"v30_fix_{index}"), True) for index in range(810)
        )
        frozen = (z3.And(*(fix.variable for fix in fixes)),)
        raw_record = {
            "status": "unsat",
            "replay": {"status": "unsat"},
        }
        observed: dict[str, object] = {}

        def fake_v19_solve_case(**kwargs: object) -> dict[str, object]:
            del kwargs
            outcome = v19.check_assignment(frozen, fixes, 5000, 97, 0, "frozen")
            observed["outcome"] = outcome
            target = Path(temporary) / case.case_id
            target.mkdir(parents=True)
            return {"budgets": {}}

        def fake_raw_check(
            *args: object,
        ) -> tuple[str, None, tuple[v19.Fix, ...], dict[str, object]]:
            del args
            return "unsat", None, fixes[:7], raw_record

        old_solve = v19.solve_case
        old_raw = v16.check_assignment
        with tempfile.TemporaryDirectory() as temporary:
            v19.solve_case = fake_v19_solve_case
            v16.check_assignment = fake_raw_check
            try:
                result = v30.solve_case(
                    case=case,
                    timeout_ms=5000,
                    out_dir=Path(temporary),
                    raw_probe_timeout_ms=1000,
                )
            finally:
                v19.solve_case = old_solve
                v16.check_assignment = old_raw
        outcome = observed["outcome"]
        self.assertEqual(outcome[0], "unsat")
        self.assertEqual(outcome[2], fixes[:7])
        self.assertFalse(outcome[3]["normalized_fallback_used"])
        self.assertEqual(outcome[3]["raw_probe"]["replay"]["status"], "unsat")
        self.assertEqual(result["adapter_contract"]["raw_probe_timeout_ms"], 1000)
        self.assertEqual(result["adapter_contract"]["semantic_bool_count"], 810)

    def test_hybrid_unknown_falls_back_to_v19(self) -> None:
        case = v30.Case("paired", "SDD", 0, 1, None)
        fixes = tuple(
            v19.Fix(z3.Bool(f"v30_fallback_{index}"), True) for index in range(810)
        )
        frozen = (z3.And(*(fix.variable for fix in fixes)),)
        observed: dict[str, object] = {}

        def fake_v19_solve_case(**kwargs: object) -> dict[str, object]:
            del kwargs
            outcome = v19.check_assignment(frozen, fixes, 5000, 97, 0, "frozen")
            observed["outcome"] = outcome
            target = Path(temporary) / case.case_id
            target.mkdir(parents=True)
            return {"budgets": {}}

        def fake_raw_check(
            *args: object,
        ) -> tuple[str, None, tuple[()], dict[str, object]]:
            del args
            return "unknown", None, (), {"reason_unknown": "timeout"}

        def fake_normalized_check(
            *args: object,
        ) -> tuple[str, None, tuple[()], dict[str, object]]:
            del args
            return "unsat", None, (), {"lane": "normalized_dual_replay"}

        old_solve = v19.solve_case
        old_raw = v16.check_assignment
        old_normalized = v30.check_complete_assignment
        with tempfile.TemporaryDirectory() as temporary:
            v19.solve_case = fake_v19_solve_case
            v16.check_assignment = fake_raw_check
            v30.check_complete_assignment = fake_normalized_check
            try:
                v30.solve_case(
                    case=case,
                    timeout_ms=5000,
                    out_dir=Path(temporary),
                    raw_probe_timeout_ms=1000,
                )
            finally:
                v19.solve_case = old_solve
                v16.check_assignment = old_raw
                v30.check_complete_assignment = old_normalized
        outcome = observed["outcome"]
        self.assertEqual(outcome[0], "unsat")
        self.assertTrue(outcome[3]["normalized_fallback_used"])
        self.assertEqual(outcome[3]["raw_probe"]["status"], "unknown")

    def test_stable_seed_is_deterministic_and_case_sensitive(self) -> None:
        first = v30.stable_case_seed(1001, "paired_SSS_k0_d1")
        self.assertEqual(first, v30.stable_case_seed(1001, "paired_SSS_k0_d1"))
        self.assertEqual(first, v29.stable_case_seed(1001, "paired_SSS_k0_d1"))
        self.assertNotEqual(first, v30.stable_case_seed(1001, "fresh_DDD_k0_d2_f1"))
        self.assertGreater(first, 0)

    def test_authenticated_v29_retry_summary_is_fail_closed(self) -> None:
        prior, digest = v30.load_authenticated_v29_summary(AUTHENTICATED_SUMMARY)
        self.assertEqual(digest, v30.AUTHENTICATED_V29_SUMMARY_SHA256)
        self.assertEqual(prior["counts"], {"unknown": 67})
        with tempfile.TemporaryDirectory() as temporary:
            changed = Path(temporary) / "summary.json"
            payload = json.loads(AUTHENTICATED_SUMMARY.read_text())
            payload["complete"] = True
            changed.write_text(json.dumps(payload))
            with self.assertRaisesRegex(ValueError, "authenticated v29 summary bytes"):
                v30.load_authenticated_v29_summary(changed)

    def test_authenticated_retry_selection_can_isolate_repaired_810_cases(self) -> None:
        prior, _ = v30.load_authenticated_v29_summary(AUTHENTICATED_SUMMARY)
        cases_810 = v30.select_authenticated_retry_cases(prior, semantic_bool_count=810)
        cases_825 = v30.select_authenticated_retry_cases(prior, semantic_bool_count=825)
        self.assertEqual(len(cases_810), 43)
        self.assertEqual(len(cases_825), 24)
        self.assertEqual(
            [case.case_id for case in cases_810],
            sorted(case.case_id for case in cases_810),
        )
        self.assertTrue(
            all(v30.expected_semantic_bool_count(case) == 810 for case in cases_810)
        )
        self.assertTrue(
            all(v30.expected_semantic_bool_count(case) == 825 for case in cases_825)
        )
        self.assertFalse(
            v30.select_authenticated_retry_cases(prior, semantic_bool_count=795)
        )

    def test_actual_spawn_child_attests_composed_contract(self) -> None:
        case = v30.Case("paired", "SSS", 0, 1, None)
        context = multiprocessing.get_context("spawn")
        with ProcessPoolExecutor(max_workers=1, mp_context=context) as pool:
            result = pool.submit(v30._spawn_contract_probe, asdict(case)).result(
                timeout=90
            )
        self.assertNotEqual(result["pid"], os.getpid())
        self.assertEqual(result["start_method"], "spawn")
        self.assertEqual(result["schema_version"], 30)
        self.assertEqual(result["global_K4_count"], 465)
        self.assertEqual(result["nonapex_superadditivity_count"], 4368)
        self.assertTrue(result["v16_encoding_bound"])
        self.assertTrue(result["v19_provenance_bound"])
        self.assertEqual(result["script_sha256"], v30.provenance()["script_sha256"])

    def test_parent_validation_rejects_contract_drift(self) -> None:
        frozen = v30.provenance()
        case = v30.Case("paired", "DDD", 0, 1, None)
        valid = {
            **frozen,
            "case_id": case.case_id,
            "case": asdict(case),
            "status": "unknown",
            "complete": False,
            "semantic_bool_count": 825,
            "adapter_contract": {"semantic_bool_count": 825},
            "constraint_counts": {
                "global_K4": 465,
                "nonapex_global_k4_squared_superadditivity": 4368,
            },
            "worker_attestation": {
                **v30._worker_attestation(frozen),
                "start_method": "spawn",
            },
            "assignment_journal": {},
            "power_cut_row_kind_counts": {},
        }
        with tempfile.TemporaryDirectory() as temporary:
            result_path = Path(temporary) / "result.json"
            v12.write_json(result_path, valid)
            self.assertEqual(
                v30._validate_child_result(valid, case, frozen, result_path), []
            )

            bad = copy.deepcopy(valid)
            bad["semantic_bool_count"] = 824
            v12.write_json(result_path, bad)
            errors = v30._validate_child_result(bad, case, frozen, result_path)
            self.assertTrue(any("825" in error for error in errors))

            prepass_closed = copy.deepcopy(valid)
            sss_case = v30.Case("paired", "SSS", 0, 1, None)
            prepass_closed.update(
                {
                    "case_id": sss_case.case_id,
                    "case": asdict(sss_case),
                    "status": "unsat",
                    "complete": True,
                    "semantic_bool_count": 780,
                    "adapter_contract": {"semantic_bool_count": 780},
                    "assignment_checks": 0,
                    "unsat_phase": "inherited_boolean_prepass",
                }
            )
            v12.write_json(result_path, prepass_closed)
            self.assertEqual(
                v30._validate_child_result(
                    prepass_closed, sss_case, frozen, result_path
                ),
                [],
            )

            for profiles, count in (("DSS", 795), ("SDD", 810)):
                profile_case = v30.Case("paired", profiles, 0, 1, None)
                profile_result = copy.deepcopy(valid)
                profile_result.update(
                    {
                        "case_id": profile_case.case_id,
                        "case": asdict(profile_case),
                        "semantic_bool_count": count,
                        "adapter_contract": {"semantic_bool_count": count},
                    }
                )
                v12.write_json(result_path, profile_result)
                self.assertEqual(
                    v30._validate_child_result(
                        profile_result, profile_case, frozen, result_path
                    ),
                    [],
                )

            bad = copy.deepcopy(valid)
            bad["worker_attestation"]["start_method"] = "fork"
            v12.write_json(result_path, bad)
            errors = v30._validate_child_result(bad, case, frozen, result_path)
            self.assertTrue(any("attestation mismatch" in error for error in errors))

            bad = copy.deepcopy(valid)
            bad["complete"] = True
            v12.write_json(result_path, bad)
            errors = v30._validate_child_result(bad, case, frozen, result_path)
            self.assertTrue(any("fail-closed" in error for error in errors))

    def test_artifact_promotion_renames_v19_outputs(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            case_dir = Path(temporary)
            for old in (
                "cegar_trace_v19.json",
                "boolean_prepass_v19.json",
                "boolean_master_v19.smt2.gz",
                "full_frozen_v19.smt2.gz",
            ):
                (case_dir / old).write_bytes(b"fixture")
            (case_dir / "assignment-journal-v19").mkdir()
            result: dict[str, object] = {
                "cegar_trace_file": "cegar_trace_v19.json",
                "boolean_prepass_file": "boolean_prepass_v19.json",
                "assignment_journal": {"directory": "assignment-journal-v19"},
                "reason_incomplete": "v19_assignment_budget_exhausted",
            }
            v30._promote_artifacts(case_dir, result)
            self.assertEqual(result["cegar_trace_file"], "cegar_trace_v30.json")
            self.assertEqual(result["boolean_prepass_file"], "boolean_prepass_v30.json")
            self.assertEqual(
                result["assignment_journal"]["directory"],
                "assignment-journal-v30",
            )
            self.assertEqual(
                result["reason_incomplete"], "v30_assignment_budget_exhausted"
            )
            self.assertEqual(
                result["result_hash_contract"]["external_attestation"],
                "summary.json:result_file_sha256_by_case[case_id]",
            )
            for new in (
                "cegar_trace_v30.json",
                "boolean_prepass_v30.json",
                "boolean_master_v30.smt2.gz",
                "full_frozen_v30.smt2.gz",
                "assignment-journal-v30",
            ):
                self.assertTrue((case_dir / new).exists(), new)

    def test_parser_defaults_to_v30_namespace(self) -> None:
        args = v30.parser().parse_args(["smoke"])
        self.assertEqual(args.artifacts, v30.DEFAULT_ARTIFACT_DIR)
        self.assertEqual(args.raw_probe_timeout_ms, 1000)
        retry = v30.parser().parse_args(
            [
                "retry",
                "--summary",
                str(AUTHENTICATED_SUMMARY),
                "--semantic-bool-count",
                "810",
            ]
        )
        self.assertEqual(retry.semantic_bool_count, 810)


if __name__ == "__main__":
    unittest.main()
