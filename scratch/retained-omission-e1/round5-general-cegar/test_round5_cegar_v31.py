"""Focused contract tests for v31 reverse-hit two-center acute cuts."""

from __future__ import annotations

import copy
import multiprocessing
import os
import tempfile
import unittest
from concurrent.futures import ProcessPoolExecutor
from dataclasses import asdict
from functools import cache
from pathlib import Path

import z3

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v19 as v19
import round5_cegar_v29 as v29
import round5_cegar_v30 as v30
import round5_cegar_v31 as v31

AUTHENTICATED_SUMMARY = (
    v31.HERE
    / "artifacts-v29-c-full-nonapex-shell"
    / "20260802T210119.317640Z-retry-pid32065"
    / "summary.json"
)


@cache
def build_encoding(
    arm: str,
    profiles: str,
    kept: int = 0,
    deleted: int = 1,
    fresh: int | None = None,
) -> v31.Encoding:
    return v31.Encoding(
        v31.Case(arm, profiles, kept, deleted, fresh), timeout_ms=1, seed=97
    )


def all_constraints(encoding: v29.Encoding) -> tuple[z3.BoolRef, ...]:
    return tuple(
        constraint
        for family in encoding.groups.values()
        for constraint in family
    )


class V31AcuteTests(unittest.TestCase):
    def test_exact_guarded_clauses_and_paired_absence(self) -> None:
        paired = build_encoding("paired", "SSS")
        self.assertEqual(len(paired.groups.get(v31.ACUTE_FAMILY, ())), 0)

        cases = (
            ("fresh", 2),
            ("secondcap_collision", 4),
            ("secondcap_distinct", 4),
        )
        for arm, fresh in cases:
            with self.subTest(arm=arm):
                encoding = build_encoding(arm, "SSS", fresh=fresh)
                family = encoding.groups[v31.ACUTE_FAMILY]
                self.assertEqual(len(family), 8)
                apex = v8.APICES[0]
                kept = encoding.case.kept
                deleted = encoding.case.deleted
                expected: list[z3.BoolRef] = []
                for center in v8.INTERIORS[0]:
                    guard = encoding.block[deleted, center]
                    expected.extend(
                        (
                            z3.Implies(
                                guard,
                                encoding.s(apex, center)
                                + encoding.s(apex, kept)
                                >= encoding.s(center, kept) + 1,
                            ),
                            z3.Implies(
                                guard,
                                encoding.s(apex, center)
                                + encoding.s(center, kept)
                                >= encoding.s(apex, kept) + 1,
                            ),
                        )
                    )
                self.assertEqual(
                    {clause.sexpr() for clause in family},
                    {clause.sexpr() for clause in expected},
                )

    def test_authenticated_source_has_exactly_24_affected_cases(self) -> None:
        prior, digest = v31.load_authenticated_v29_summary(AUTHENTICATED_SUMMARY)
        cases = v31.select_authenticated_retry_cases(prior)
        affected = [case for case in cases if case.arm != "paired"]
        paired = [case for case in cases if case.arm == "paired"]
        self.assertEqual(digest, v31.AUTHENTICATED_V29_SUMMARY_SHA256)
        self.assertEqual(len(cases), 67)
        self.assertEqual(len(affected), 24)
        self.assertEqual(len(paired), 43)
        self.assertTrue(all(case.arm == "fresh" for case in affected))

    def test_profile_semantic_boolean_counts_are_unchanged(self) -> None:
        for profiles, expected in (
            ("SSS", 780),
            ("DSS", 795),
            ("SDD", 810),
            ("DDD", 825),
        ):
            with self.subTest(profiles=profiles):
                encoding = build_encoding("fresh", profiles, fresh=2)
                semantic = v16.collect_semantic_bools(all_constraints(encoding))
                self.assertEqual(len(semantic), expected)
                self.assertEqual(
                    v31.expected_semantic_bool_count(encoding.case),
                    v30.expected_semantic_bool_count(encoding.case),
                )

    def test_new_family_is_not_a_syntactic_duplicate_of_v29(self) -> None:
        case = v31.Case("fresh", "SSS", 0, 1, 2)
        inherited = v29.Encoding(case, timeout_ms=1, seed=97)
        strengthened = build_encoding("fresh", "SSS", fresh=2)
        inherited_sexprs = {
            clause.sexpr() for clause in all_constraints(inherited)
        }
        acute_sexprs = {
            clause.sexpr()
            for clause in strengthened.groups[v31.ACUTE_FAMILY]
        }
        self.assertEqual(len(acute_sexprs), 8)
        self.assertTrue(acute_sexprs.isdisjoint(inherited_sexprs))

    def test_provenance_binds_v30_retry_and_v31_delta(self) -> None:
        frozen = v31.provenance()
        self.assertEqual(frozen["schema_version"], 31)
        self.assertEqual(frozen["script_sha256"], v31.file_sha256(v31.SCRIPT_PATH))
        self.assertEqual(frozen["schema_sha256"], v31.file_sha256(v31.SCHEMA_PATH))
        dependencies = frozen["v31_dependency_sha256"]
        self.assertEqual(
            dependencies["round5_cegar_v30.py"],
            v31.file_sha256(v31.HERE / "round5_cegar_v30.py"),
        )
        self.assertEqual(
            frozen["retry_source_contract"]["sha256"],
            v30.AUTHENTICATED_V29_SUMMARY_SHA256,
        )
        self.assertEqual(
            frozen["spawn_contract"]["encoding"],
            "round5_cegar_v31.Encoding",
        )
        acute = frozen["reverse_hit_two_center_sqdist_acute_contract"]
        self.assertEqual(acute["clauses_per_nonpaired_case"], 8)
        self.assertEqual(acute["clauses_per_paired_case"], 0)
        self.assertEqual(acute["authenticated_source_cases_affected"], 24)
        self.assertEqual(acute["semantic_boolean_delta"], 0)
        self.assertIn(v31.ACUTE_FAMILY, frozen["source_contract"]["role_map"])

    def test_runtime_context_binds_and_restores_v31(self) -> None:
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
            v31._bound_v31_runtime(),
        ):
            self.assertIs(v12.Encoding, v31.Encoding)
            self.assertIs(v16.Encoding, v31.Encoding)
            self.assertIs(v19.provenance, v31.provenance)
            self.assertIs(v19.source_contract, v31.source_contract)
            self.assertIs(v12.v9.active_full_shells, v29.active_full_shells)
            raise RuntimeError("sentinel")
        for owner, name in watched:
            self.assertIs(getattr(owner, name), before[id(owner), name])
        self.assertIs(v12.v9.active_full_shells, before_active)

    def test_runtime_context_extends_tracker_allowlist_for_acute_family(self) -> None:
        inherited = v17.TRACKER_ALLOWLIST
        expected = inherited | {f"track_{v31.ACUTE_FAMILY}"}
        with v31._bound_v31_runtime():
            self.assertEqual(v17.TRACKER_ALLOWLIST, expected)
            solver, _ = build_encoding("fresh", "SSS", fresh=2).make_solver()
            actual = {str(item) for item in v17._tracker_refs(solver.assertions())}
            self.assertEqual(actual, expected)
        self.assertIs(v17.TRACKER_ALLOWLIST, inherited)

    def test_spawn_child_attests_v31_runtime_and_clause_family(self) -> None:
        case = v31.Case("fresh", "SSS", 0, 1, 2)
        context = multiprocessing.get_context("spawn")
        with ProcessPoolExecutor(max_workers=1, mp_context=context) as pool:
            result = pool.submit(v31._spawn_contract_probe, asdict(case)).result(
                timeout=90
            )
        self.assertNotEqual(result["pid"], os.getpid())
        self.assertEqual(result["start_method"], "spawn")
        self.assertEqual(result["schema_version"], 31)
        self.assertEqual(result["encoding_class"], "round5_cegar_v31.Encoding")
        self.assertEqual(result["global_K4_count"], 465)
        self.assertEqual(result["nonapex_superadditivity_count"], 4368)
        self.assertEqual(result["reverse_hit_two_center_sqdist_acute_count"], 8)
        self.assertTrue(result["v12_encoding_bound"])
        self.assertTrue(result["v16_encoding_bound"])
        self.assertTrue(result["v19_provenance_bound"])
        self.assertEqual(result["script_sha256"], v31.provenance()["script_sha256"])

    def test_parent_validation_checks_arm_specific_acute_count(self) -> None:
        frozen = v31.provenance()
        case = v31.Case("fresh", "DDD", 0, 1, 2)
        valid = {
            **frozen,
            "case_id": case.case_id,
            "case": asdict(case),
            "status": "unknown",
            "complete": False,
            "semantic_bool_count": 825,
            "adapter_contract": {
                "semantic_bool_count": 825,
                "acute_clause_count": 8,
            },
            "constraint_counts": {
                "global_K4": 465,
                "nonapex_global_k4_squared_superadditivity": 4368,
                v31.ACUTE_FAMILY: 8,
            },
            "worker_attestation": {
                **v31._worker_attestation(frozen),
                "start_method": "spawn",
            },
            "assignment_journal": {},
            "power_cut_row_kind_counts": {},
        }
        with tempfile.TemporaryDirectory() as temporary:
            result_path = Path(temporary) / "result.json"
            v12.write_json(result_path, valid)
            self.assertEqual(
                v31._validate_child_result(valid, case, frozen, result_path), []
            )

            bad = copy.deepcopy(valid)
            bad["constraint_counts"][v31.ACUTE_FAMILY] = 7
            v12.write_json(result_path, bad)
            errors = v31._validate_child_result(bad, case, frozen, result_path)
            self.assertTrue(any("contract count is not 8" in error for error in errors))

    def test_parser_and_artifact_namespace_are_v31(self) -> None:
        args = v31.parser().parse_args(["smoke"])
        self.assertEqual(args.artifacts, v31.DEFAULT_ARTIFACT_DIR)
        self.assertEqual(args.raw_probe_timeout_ms, 1000)
        with tempfile.TemporaryDirectory() as temporary:
            case_dir = Path(temporary)
            (case_dir / "cegar_trace_v19.json").write_bytes(b"fixture")
            (case_dir / "assignment-journal-v19").mkdir()
            result: dict[str, object] = {
                "cegar_trace_file": "cegar_trace_v19.json",
                "assignment_journal": {"directory": "assignment-journal-v19"},
                "reason_incomplete": "v19_assignment_budget_exhausted",
            }
            v31._promote_artifacts(case_dir, result)
            self.assertEqual(result["cegar_trace_file"], "cegar_trace_v31.json")
            self.assertEqual(
                result["assignment_journal"]["directory"],
                "assignment-journal-v31",
            )
            self.assertEqual(
                result["reason_incomplete"], "v31_assignment_budget_exhausted"
            )


if __name__ == "__main__":
    unittest.main()
