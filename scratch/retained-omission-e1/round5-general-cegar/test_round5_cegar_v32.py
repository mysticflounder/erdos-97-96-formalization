"""Focused contract tests for the composed v32 exact-fifteen cuts."""

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
import round5_cegar_v31 as v31
import round5_cegar_v32 as v32

AUTHENTICATED_SUMMARY = (
    v32.HERE
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
) -> v32.Encoding:
    return v32.Encoding(
        v32.Case(arm, profiles, kept, deleted, fresh), timeout_ms=1, seed=97
    )


def all_constraints(encoding: v29.Encoding) -> tuple[z3.BoolRef, ...]:
    return tuple(
        constraint
        for family in encoding.groups.values()
        for constraint in family
    )


class V32SProfileTests(unittest.TestCase):
    def test_exact_ordered_clause_sets_for_every_profile(self) -> None:
        for profiles in ("SSS", "SSD", "SDS", "DSS", "SDD", "DSD", "DDS", "DDD"):
            with self.subTest(profiles=profiles):
                encoding = build_encoding("fresh", profiles, fresh=2)
                family = encoding.groups.get(v32.S_PROFILE_FAMILY, ())
                expected: list[z3.BoolRef] = []
                for i, (apex, interior) in enumerate(
                    zip(v8.APICES, v8.INTERIORS, strict=True)
                ):
                    if profiles[i] != "S":
                        continue
                    for center in interior:
                        for member in interior:
                            if center == member:
                                continue
                            expected.append(
                                z3.Or(
                                    z3.Not(encoding.k4[center, apex]),
                                    z3.Not(encoding.k4[center, member]),
                                    z3.Not(encoding.k4[member, center]),
                                    encoding.k4[member, apex],
                                )
                            )
                self.assertEqual(len(family), 12 * profiles.count("S"))
                self.assertEqual(
                    {clause.sexpr() for clause in family},
                    {clause.sexpr() for clause in expected},
                )

    def test_composition_preserves_acute_and_semantic_counts(self) -> None:
        for arm, acute in (("paired", 0), ("fresh", 8)):
            for profiles in ("SSS", "DSS", "SDD", "DDD"):
                with self.subTest(arm=arm, profiles=profiles):
                    fresh = None if arm == "paired" else 2
                    encoding = build_encoding(arm, profiles, fresh=fresh)
                    self.assertEqual(
                        len(encoding.groups.get(v32.ACUTE_FAMILY, ())), acute
                    )
                    semantic = v16.collect_semantic_bools(all_constraints(encoding))
                    expected = 780 + 15 * profiles.count("D")
                    self.assertEqual(len(semantic), expected)
                    self.assertEqual(
                        v32.expected_semantic_bool_count(encoding.case), expected
                    )
                    self.assertEqual(len(encoding.groups["global_K4"]), 465)
                    self.assertEqual(
                        len(
                            encoding.groups[
                                "nonapex_global_k4_squared_superadditivity"
                            ]
                        ),
                        4368,
                    )

    def test_new_clauses_are_not_in_inherited_v31_encoding(self) -> None:
        case = v32.Case("fresh", "SSS", 0, 1, 2)
        inherited = v31.Encoding(case, timeout_ms=1, seed=97)
        strengthened = build_encoding("fresh", "SSS", fresh=2)
        inherited_sexprs = {
            clause.sexpr() for clause in all_constraints(inherited)
        }
        new_sexprs = {
            clause.sexpr()
            for clause in strengthened.groups[v32.S_PROFILE_FAMILY]
        }
        self.assertEqual(len(new_sexprs), 36)
        self.assertTrue(new_sexprs.isdisjoint(inherited_sexprs))

    def test_authenticated_retry_census_is_exact(self) -> None:
        prior, digest = v32.load_authenticated_v29_summary(AUTHENTICATED_SUMMARY)
        cases = v32.select_authenticated_retry_cases(prior)
        affected = [case for case in cases if "S" in case.profiles]
        unaffected = [case for case in cases if "S" not in case.profiles]
        self.assertEqual(digest, v32.AUTHENTICATED_V29_SUMMARY_SHA256)
        self.assertEqual(len(cases), 67)
        self.assertEqual(len(affected), 43)
        self.assertEqual(len(unaffected), 24)
        self.assertTrue(all(case.profiles == "DDD" for case in unaffected))
        self.assertEqual(
            sum(v32.expected_s_profile_clause_count(case) for case in cases),
            516,
        )

    def test_provenance_pins_composed_sources_and_lean_theorems(self) -> None:
        frozen = v32.provenance()
        self.assertEqual(frozen["schema_version"], 32)
        self.assertEqual(frozen["script_sha256"], v32.file_sha256(v32.SCRIPT_PATH))
        self.assertEqual(frozen["schema_sha256"], v32.file_sha256(v32.SCHEMA_PATH))
        dependencies = frozen["v32_dependency_sha256"]
        for name in (
            "round5_cegar_v31.py",
            "schema_v31.json",
            "test_round5_cegar_v31.py",
        ):
            self.assertEqual(dependencies[name], v32.file_sha256(v32.HERE / name))
        for path in (v32.LEAN_ADAPTER_PATH, v32.LEAN_KERNEL_PATH):
            name = str(path.relative_to(v29.PROJECT_ROOT))
            self.assertEqual(dependencies[name], v32.file_sha256(path))
        self.assertEqual(
            frozen["spawn_contract"]["encoding"], "round5_cegar_v32.Encoding"
        )
        contract = frozen["exact_fifteen_s_profile_mutual_class_contract"]
        self.assertEqual(contract["authenticated_source_cases_affected"], 43)
        self.assertEqual(contract["authenticated_source_total_clauses"], 516)
        self.assertEqual(contract["semantic_boolean_delta"], 0)
        self.assertIn(v32.ACUTE_FAMILY, frozen["source_contract"]["role_map"])
        self.assertIn(v32.S_PROFILE_FAMILY, frozen["source_contract"]["role_map"])
        source_files = frozen["source_contract"]["files"]
        for role, path in (
            ("exact_fifteen_s_profile_mutual_class_adapter", v32.LEAN_ADAPTER_PATH),
            ("mutual_shell_pair_shared_member_kernel", v32.LEAN_KERNEL_PATH),
        ):
            self.assertEqual(
                source_files[role],
                {
                    "path": str(path.relative_to(v29.PROJECT_ROOT)),
                    "sha256": v32.file_sha256(path),
                },
            )

    def test_frozen_provenance_mismatches_fail_closed(self) -> None:
        frozen = v32.provenance()
        v32.verify_frozen_provenance(
            frozen, expected_script_sha256=frozen["script_sha256"]
        )
        mutated = copy.deepcopy(frozen)
        mutated["schema_version"] = 31
        with self.assertRaisesRegex(RuntimeError, "differs"):
            v32.verify_frozen_provenance(mutated)
        with self.assertRaisesRegex(RuntimeError, "source hash differs"):
            v32.verify_frozen_provenance(frozen, expected_script_sha256="0" * 64)

    def test_runtime_binds_both_families_and_restores_after_error(self) -> None:
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
        inherited_trackers = v17.TRACKER_ALLOWLIST
        expected_trackers = inherited_trackers | {
            f"track_{v32.ACUTE_FAMILY}",
            f"track_{v32.S_PROFILE_FAMILY}",
        }
        with (
            self.assertRaisesRegex(RuntimeError, "sentinel"),
            v32._bound_v32_runtime(),
        ):
            self.assertIs(v12.Encoding, v32.Encoding)
            self.assertIs(v16.Encoding, v32.Encoding)
            self.assertIs(v19.provenance, v32.provenance)
            self.assertEqual(v17.TRACKER_ALLOWLIST, expected_trackers)
            solver, _ = build_encoding("fresh", "SSS", fresh=2).make_solver()
            actual = {str(item) for item in v17._tracker_refs(solver.assertions())}
            self.assertEqual(actual, expected_trackers)
            raise RuntimeError("sentinel")
        for owner, name in watched:
            self.assertIs(getattr(owner, name), before[id(owner), name])
        self.assertIs(v17.TRACKER_ALLOWLIST, inherited_trackers)

    def test_spawn_child_attests_composed_runtime(self) -> None:
        case = v32.Case("fresh", "SSS", 0, 1, 2)
        context = multiprocessing.get_context("spawn")
        with ProcessPoolExecutor(max_workers=1, mp_context=context) as pool:
            result = pool.submit(v32._spawn_contract_probe, asdict(case)).result(
                timeout=90
            )
        self.assertNotEqual(result["pid"], os.getpid())
        self.assertEqual(result["start_method"], "spawn")
        self.assertEqual(result["schema_version"], 32)
        self.assertEqual(result["encoding_class"], "round5_cegar_v32.Encoding")
        self.assertEqual(result["global_K4_count"], 465)
        self.assertEqual(result["nonapex_superadditivity_count"], 4368)
        self.assertEqual(result["reverse_hit_two_center_sqdist_acute_count"], 8)
        self.assertEqual(result["s_profile_mutual_class_count"], 36)
        self.assertTrue(result["v12_encoding_bound"])
        self.assertTrue(result["v16_encoding_bound"])
        self.assertTrue(result["v19_provenance_bound"])

    def test_parent_validation_checks_both_family_counts(self) -> None:
        frozen = v32.provenance()
        case = v32.Case("fresh", "SDD", 0, 1, 2)
        valid = {
            **frozen,
            "case_id": case.case_id,
            "case": asdict(case),
            "status": "unknown",
            "complete": False,
            "semantic_bool_count": 810,
            "adapter_contract": {
                "encoding": "round5_cegar_v32.Encoding",
                "engine": "round5_cegar_v19.solve_case",
                "acute_family": v32.ACUTE_FAMILY,
                "s_profile_family": v32.S_PROFILE_FAMILY,
                "semantic_bool_count": 810,
                "acute_clause_count": 8,
                "s_profile_clause_count": 12,
            },
            "constraint_counts": {
                "global_K4": 465,
                "nonapex_global_k4_squared_superadditivity": 4368,
                v32.ACUTE_FAMILY: 8,
                v32.S_PROFILE_FAMILY: 12,
            },
            "worker_attestation": {
                **v32._worker_attestation(frozen),
                "start_method": "spawn",
            },
            "assignment_journal": {},
            "power_cut_row_kind_counts": {},
        }
        with tempfile.TemporaryDirectory() as temporary:
            result_path = Path(temporary) / "result.json"
            v12.write_json(result_path, valid)
            self.assertEqual(
                v32._validate_child_result(valid, case, frozen, result_path), []
            )
            for field, key, bad_value in (
                ("constraint_counts", v32.S_PROFILE_FAMILY, 11),
                ("constraint_counts", v32.ACUTE_FAMILY, 7),
                ("adapter_contract", "s_profile_clause_count", 11),
                ("adapter_contract", "semantic_bool_count", 809),
                ("adapter_contract", "encoding", "round5_cegar_v31.Encoding"),
                ("adapter_contract", "engine", "round5_cegar_v16.solve_case"),
                ("adapter_contract", "acute_family", "wrong_acute_family"),
                ("adapter_contract", "s_profile_family", "wrong_s_family"),
            ):
                bad = copy.deepcopy(valid)
                bad[field][key] = bad_value
                v12.write_json(result_path, bad)
                self.assertTrue(
                    v32._validate_child_result(bad, case, frozen, result_path)
                )

    def test_parser_and_artifact_namespace_are_v32(self) -> None:
        args = v32.parser().parse_args(["smoke"])
        self.assertEqual(args.artifacts, v32.DEFAULT_ARTIFACT_DIR)
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
            v32._promote_artifacts(case_dir, result)
            self.assertEqual(result["cegar_trace_file"], "cegar_trace_v32.json")
            self.assertEqual(
                result["assignment_journal"]["directory"],
                "assignment-journal-v32",
            )
            self.assertEqual(
                result["reason_incomplete"], "v32_assignment_budget_exhausted"
            )


if __name__ == "__main__":
    unittest.main()
