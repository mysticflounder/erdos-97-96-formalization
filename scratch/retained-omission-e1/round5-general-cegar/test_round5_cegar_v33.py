"""Focused contract tests for the v33 endpoint shared-blocker seed slice."""

from __future__ import annotations

import argparse
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
import round5_cegar_v30 as v30
import round5_cegar_v32 as v32
import round5_cegar_v33 as v33


@cache
def build_encoding(profiles: str = "SSS") -> v33.Encoding:
    return v33.Encoding(
        v33.Case("fresh", profiles, 0, 1, 2), timeout_ms=1, seed=97
    )


def all_constraints(encoding: v33.Encoding) -> tuple[z3.BoolRef, ...]:
    return tuple(
        constraint
        for family in encoding.groups.values()
        for constraint in family
    )


def sexprs(items: list[z3.BoolRef] | tuple[z3.BoolRef, ...]) -> set[str]:
    return {item.sexpr() for item in items}


class V33EndpointSeedTests(unittest.TestCase):
    def test_exact_semantic_universe_and_family_counts(self) -> None:
        self.assertEqual(v33.J_DOMAIN, tuple(range(4, 15)))
        self.assertEqual(v33.SEMANTIC_BOOL_DELTA, 251)
        self.assertEqual(sum(v33.NEW_FAMILY_COUNTS.values()), 702)
        for profiles in ("SSS", "SDD", "DDD"):
            with self.subTest(profiles=profiles):
                encoding = build_encoding(profiles)
                solver, _ = encoding.make_solver()
                semantic = {
                    str(item) for item in v16.collect_semantic_bools(solver.assertions())
                }
                expected = 1031 + 15 * profiles.count("D")
                self.assertEqual(len(semantic), expected)
                self.assertEqual(v33.expected_semantic_bool_count(encoding.case), expected)
                self.assertEqual(
                    {name for name in semantic if name.startswith("endpoint_j_")},
                    {f"endpoint_j_{point}" for point in range(4, 15)},
                )
                self.assertEqual(
                    {name for name in semantic if name.startswith("endpoint_qrow_")},
                    {f"endpoint_qrow_{point}" for point in range(15)},
                )
                self.assertEqual(
                    {name for name in semantic if name.startswith("endpoint_qsel_")},
                    {
                        f"endpoint_qsel_{center}_{point}"
                        for center in range(15)
                        for point in range(15)
                    },
                )
                counts = encoding.constraint_counts()
                for family, count in v33.NEW_FAMILY_COUNTS.items():
                    self.assertEqual(counts[family], count)
        paired = v33.Case("paired", "SSS", 0, 1, None)
        with self.assertRaisesRegex(ValueError, "fresh arm"):
            v33.expected_semantic_bool_count(paired)
        with self.assertRaisesRegex(ValueError, "fresh arm"):
            v33.Encoding(paired, timeout_ms=1, seed=97)

    def test_new_clause_families_have_the_exact_intended_form(self) -> None:
        encoding = build_encoding()
        kept, fresh = 0, 2
        frontier = encoding.rich[0, 0]["support"]
        self.assertIsInstance(frontier, list)

        expected_collision = [
            encoding.block[fresh, center] == encoding.block[kept, center]
            for center in v8.CENTER_CANDIDATES
        ]
        self.assertEqual(
            sexprs(encoding.groups[v33.ENDPOINT_COLLISION_FAMILY]),
            sexprs(expected_collision),
        )

        expected_cross = [
            z3.Implies(
                encoding.endpoint_j[point],
                encoding.dynamic_row_member(point, fresh),
            )
            for point in v33.J_DOMAIN
        ]
        self.assertEqual(
            sexprs(encoding.groups[v33.J_CROSS_HIT_FAMILY]), sexprs(expected_cross)
        )
        expected_shared = [
            z3.Implies(
                encoding.endpoint_j[point],
                encoding.block[point, center] == encoding.block[kept, center],
            )
            for point in v33.J_DOMAIN
            for center in v8.CENTER_CANDIDATES
        ]
        self.assertEqual(
            sexprs(encoding.groups[v33.J_SHARED_BLOCKER_FAMILY]),
            sexprs(expected_shared),
        )

        def j_at(point: int) -> z3.BoolRef:
            return encoding.endpoint_j.get(point, z3.BoolVal(False))

        expected_frontier = [
            z3.And(encoding.endpoint_common[point], frontier[point])
            == (z3.BoolVal(True) if point == kept else j_at(point))
            for point in v8.POINTS
        ]
        self.assertEqual(
            sexprs(encoding.groups[v33.FRONTIER_INTERSECTION_FAMILY]),
            sexprs(expected_frontier),
        )

        expected_qrow = [v8.exactly(encoding.endpoint_qrow, 4)]
        expected_qrow.extend(
            z3.Implies(encoding.endpoint_qrow[point], frontier[point])
            for point in v8.POINTS
        )
        expected_qrow.append(encoding.endpoint_qrow[kept])
        expected_qrow.extend(
            z3.Implies(selected, encoding.endpoint_qrow[point])
            for point, selected in encoding.endpoint_j.items()
        )
        self.assertEqual(
            sexprs(encoding.groups[v33.QROW_FAMILY]), sexprs(expected_qrow)
        )

        expected_selected: list[z3.BoolRef] = []
        for center in v8.POINTS:
            row = [encoding.endpoint_qsel[center, point] for point in v8.POINTS]
            for point, selected in enumerate(row):
                expected_selected.extend(
                    (
                        z3.Implies(selected, encoding.endpoint_seed[center]),
                        z3.Implies(selected, encoding.k4[center, point]),
                    )
                )
            expected_selected.append(
                z3.Implies(encoding.endpoint_seed[center], v8.exactly(row, 4))
            )
        self.assertEqual(
            sexprs(encoding.groups[v33.SEED_SELECTED_ROWS_FAMILY]),
            sexprs(expected_selected),
        )

    def test_selected_subsets_are_not_registered_as_physical_circles(self) -> None:
        encoding = build_encoding()
        names = {circle.name for circle in encoding.circles}
        self.assertFalse(any("qrow" in name or "qsel" in name for name in names))
        new_names = {
            str(item)
            for item in (*encoding.endpoint_qrow, *encoding.endpoint_qsel.values())
        }
        for circle in encoding.circles:
            self.assertTrue(
                new_names.isdisjoint(str(item) for item in circle.support),
                circle.name,
            )

    def test_runtime_binding_is_nonrecursive_and_restores_after_error(self) -> None:
        watched = (
            (v12, "SCHEMA_VERSION"),
            (v12, "Encoding"),
            (v16, "SCHEMA_VERSION"),
            (v16, "Encoding"),
            (v19, "provenance"),
            (v30, "expected_semantic_bool_count"),
        )
        before = {(id(owner), name): getattr(owner, name) for owner, name in watched}
        inherited_trackers = v17.TRACKER_ALLOWLIST
        expected_trackers = inherited_trackers | {
            f"track_{v32.ACUTE_FAMILY}",
            f"track_{v32.S_PROFILE_FAMILY}",
            *(f"track_{family}" for family in v33.NEW_FAMILIES),
        }
        with (
            self.assertRaisesRegex(RuntimeError, "sentinel"),
            v33._bound_v33_runtime(),
        ):
            self.assertIs(v12.Encoding, v33.Encoding)
            self.assertIs(v16.Encoding, v33.Encoding)
            self.assertIs(v19.provenance, v33.provenance)
            self.assertIs(v30.expected_semantic_bool_count, v33.expected_semantic_bool_count)
            self.assertEqual(v30.expected_semantic_bool_count(build_encoding().case), 1031)
            self.assertEqual(v17.TRACKER_ALLOWLIST, expected_trackers)
            raise RuntimeError("sentinel")
        for owner, name in watched:
            self.assertIs(getattr(owner, name), before[id(owner), name])
        self.assertIs(v17.TRACKER_ALLOWLIST, inherited_trackers)

    def test_spawn_child_attests_v33_runtime_and_exact_prefixes(self) -> None:
        case = v33.Case("fresh", "SSS", 0, 1, 2)
        context = multiprocessing.get_context("spawn")
        with ProcessPoolExecutor(max_workers=1, mp_context=context) as pool:
            result = pool.submit(v33._spawn_contract_probe, asdict(case)).result(
                timeout=90
            )
        self.assertNotEqual(result["pid"], os.getpid())
        self.assertEqual(result["start_method"], "spawn")
        self.assertEqual(result["schema_version"], 33)
        self.assertEqual(result["encoding_class"], "round5_cegar_v33.Encoding")
        self.assertEqual(result["semantic_bool_count"], 1031)
        self.assertEqual(
            result["v33_semantic_prefix_counts"],
            {"endpoint_j": 11, "endpoint_qrow": 15, "endpoint_qsel": 225},
        )
        self.assertTrue(result["v12_encoding_bound"])
        self.assertTrue(result["v16_encoding_bound"])
        self.assertTrue(result["v19_provenance_bound"])
        self.assertTrue(result["v30_count_bound"])
        for family, count in v33.NEW_FAMILY_COUNTS.items():
            self.assertEqual(result["constraint_counts"][family], count)

    def test_provenance_pins_sources_and_exact_scope(self) -> None:
        frozen = v33.provenance()
        self.assertEqual(frozen["schema_version"], 33)
        self.assertEqual(frozen["script_sha256"], v33.file_sha256(v33.SCRIPT_PATH))
        self.assertEqual(frozen["schema_sha256"], v33.file_sha256(v33.SCHEMA_PATH))
        self.assertEqual(
            frozen["spawn_contract"]["encoding"], "round5_cegar_v33.Encoding"
        )
        contract = frozen["endpoint_shared_blocker_seed_contract"]
        self.assertEqual(contract["scope"], "exact n=15 ordinary fresh shared-blocker cross-hit arm")
        self.assertEqual(contract["semantic_boolean_delta"], 251)
        self.assertFalse(contract["full_circle_registration"])
        dependencies = frozen["v33_dependency_sha256"]
        for path in (
            v33.LEAN_FRONTIER_PATH,
            v33.LEAN_CONTINUATION_PATH,
            v33.LEAN_LOCALIZATION_PATH,
            v33.LEAN_ENDPOINT_FIBER_PATH,
        ):
            name = str(path.relative_to(v33.v29.PROJECT_ROOT))
            self.assertEqual(dependencies[name], v33.file_sha256(path))
        for family in v33.NEW_FAMILIES:
            self.assertIn(family, frozen["source_contract"]["role_map"])

    def test_parent_validation_checks_every_new_family(self) -> None:
        frozen = v33.provenance()
        case = v33.Case("fresh", "SDD", 0, 1, 2)
        count = v33.expected_semantic_bool_count(case)
        valid = {
            **frozen,
            "case_id": case.case_id,
            "case": asdict(case),
            "status": "unknown",
            "complete": False,
            "semantic_bool_count": count,
            "adapter_contract": {
                "encoding": "round5_cegar_v33.Encoding",
                "engine": "round5_cegar_v19.solve_case",
                "semantic_bool_count": count,
                "acute_clause_count": 8,
                "s_profile_clause_count": 12,
                "endpoint_seed_family_counts": v33.NEW_FAMILY_COUNTS,
            },
            "constraint_counts": {
                "global_K4": 465,
                "nonapex_global_k4_squared_superadditivity": 4368,
                v33.ACUTE_FAMILY: 8,
                v33.S_PROFILE_FAMILY: 12,
                **v33.NEW_FAMILY_COUNTS,
            },
            "worker_attestation": {
                **v33._worker_attestation(frozen),
                "start_method": "spawn",
            },
            "assignment_journal": {},
            "power_cut_row_kind_counts": {},
        }
        with tempfile.TemporaryDirectory() as temporary:
            result_path = Path(temporary) / "result.json"
            v12.write_json(result_path, valid)
            self.assertEqual(
                v33._validate_child_result(valid, case, frozen, result_path), []
            )
            for family in v33.NEW_FAMILIES:
                bad = copy.deepcopy(valid)
                bad["constraint_counts"][family] -= 1
                v12.write_json(result_path, bad)
                self.assertTrue(
                    v33._validate_child_result(bad, case, frozen, result_path)
                )

    def test_parser_and_artifact_namespace_are_v33(self) -> None:
        args = v33.parser().parse_args(["smoke"])
        self.assertEqual(args.artifacts, v33.DEFAULT_ARTIFACT_DIR)
        parser = v33.parser()
        commands = next(
            action
            for action in parser._actions
            if isinstance(action, argparse._SubParsersAction)
        )
        self.assertEqual(set(commands.choices), {"smoke", "case", "matrix"})
        arm = next(
            action
            for action in commands.choices["case"]._actions
            if action.dest == "arm"
        )
        self.assertEqual(tuple(arm.choices), ("fresh",))
        with tempfile.TemporaryDirectory() as temporary:
            case_dir = Path(temporary)
            (case_dir / "cegar_trace_v19.json").write_bytes(b"fixture")
            (case_dir / "assignment-journal-v19").mkdir()
            result: dict[str, object] = {
                "cegar_trace_file": "cegar_trace_v19.json",
                "assignment_journal": {"directory": "assignment-journal-v19"},
                "reason_incomplete": "v19_assignment_budget_exhausted",
            }
            v33._promote_artifacts(case_dir, result)
            self.assertEqual(result["cegar_trace_file"], "cegar_trace_v33.json")
            self.assertEqual(
                result["assignment_journal"]["directory"],
                "assignment-journal-v33",
            )
            self.assertEqual(
                result["reason_incomplete"], "v33_assignment_budget_exhausted"
            )


if __name__ == "__main__":
    unittest.main()
