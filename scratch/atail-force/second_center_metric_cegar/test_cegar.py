#!/usr/bin/env python3
"""Regression tests for the fixed-placement metric CEGAR checkpoint."""

from __future__ import annotations

import copy
import importlib.util
import json
import sys
import unittest
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
for path in (str(ROOT), str(HERE)):
    if path not in sys.path:
        sys.path.insert(0, path)

import analyze_cores  # noqa: E402
import audit_row_origins  # noqa: E402
import bank_reuse_audit  # noqa: E402
import cegar  # noqa: E402
import repeated_core_bank_audit  # noqa: E402
import summarize_extensions  # noqa: E402


def load_validator():
    spec = importlib.util.spec_from_file_location(
        "p97_atail_metric_cegar_test_validator", HERE / "validator.py"
    )
    if spec is None or spec.loader is None:
        raise ImportError("cannot load CEGAR validator")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


class MetricCegarCheckpointTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.checkpoint = json.loads(cegar.CHECKPOINT.read_text(encoding="utf-8"))
        cls.analysis = json.loads(
            analyze_cores.DEFAULT_OUTPUT.read_text(encoding="utf-8")
        )
        cls.validator = load_validator()

    def test_structural_validator_accepts_checkpoint(self) -> None:
        result = self.validator.validate_document(self.checkpoint, api=cegar)
        self.assertEqual(result["case_count"], 2)
        self.assertTrue(result["all_structurally_validated"])

    def test_replay_refuses_round_budget_override(self) -> None:
        self.assertEqual(cegar.DEFAULT_MAX_ROUNDS, 8)
        with self.assertRaises(ValueError):
            cegar.build_document(saved=self.checkpoint, max_rounds=9)

    def test_all_accepted_cuts_are_unique_crosschecked_unit(self) -> None:
        cuts: set[cegar.Cut] = set()
        count = 0
        for case in self.checkpoint["cases"]:
            records = [case["bootstrap_cut"]] + [
                row["accepted_cut"] for row in case["rounds"]
            ]
            for record in records:
                self.assertEqual(record["crosscheck"]["status"], "CROSSCHECKED_UNIT")
                self.assertEqual(record["crosscheck"]["verdicts"], ["UNIT"] * 3)
                rows = tuple(cegar.decode_metric_row(value) for value in record["rows"])
                cut = cegar.cut_from_rows(rows)
                self.assertNotIn(cut, cuts)
                cuts.add(cut)
                count += 1
        self.assertEqual(count, 18)

    def test_metric_row_encoding_round_trip_and_monotone_cut(self) -> None:
        record = self.checkpoint["cases"][0]["bootstrap_cut"]
        rows = tuple(cegar.decode_metric_row(value) for value in record["rows"])
        self.assertEqual(cegar.encode_metric_rows(rows), record["rows"])
        cut = cegar.cut_from_rows(rows)
        class_rows = tuple(
            cegar.shadow.ClassRow(
                f"test:{index}",
                row.center,
                frozenset(row.support),
                exact=True,
            )
            for index, row in enumerate(rows)
        )
        self.assertTrue(cegar.contains_cut(class_rows, cut))
        self.assertFalse(cegar.contains_cut(class_rows[:-1], cut))

    def test_validator_rejects_noncanonical_duplicate_row(self) -> None:
        mutated = copy.deepcopy(self.checkpoint)
        cut = mutated["cases"][0]["bootstrap_cut"]
        cut["rows"].append(cut["rows"][0])
        with self.assertRaises(AssertionError):
            self.validator.validate_document(mutated, api=cegar)

    def test_core_analysis_counts_and_fail_closed_statuses(self) -> None:
        summary = self.analysis["summary"]
        self.assertEqual(self.analysis["schema"], analyze_cores.SCHEMA)
        self.assertEqual(self.analysis["core_count"], 18)
        self.assertEqual(summary["distinct_groups_preserving_0_and_1"], 18)
        self.assertEqual(summary["distinct_groups_under_free_point_relabeling"], 18)
        self.assertEqual(summary["crosschecked_force_zero_squared_distance_count"], 8)
        self.assertEqual(summary["undecided_fail_closed_collapse_count"], 10)
        for core in self.analysis["cores"]:
            collapse = core["collapse_01"]
            if collapse["status"] == "CROSSCHECKED_FORCED_ZERO_SQUARED_DISTANCE":
                self.assertEqual(
                    collapse["verdicts_singular_msolve_forward_reverse"],
                    ["UNIT"] * 3,
                )
            else:
                self.assertEqual(collapse["status"], "UNDECIDED_FAIL_CLOSED")
                self.assertIn(
                    "TIMEOUT",
                    collapse["verdicts_singular_msolve_forward_reverse"],
                )

    def test_five_row_motif_summary(self) -> None:
        motifs = self.analysis["five_row_motifs"]
        self.assertEqual(motifs["core_count"], 3)
        self.assertEqual(motifs["distinct_exact_types_preserving_0_and_1"], 3)
        self.assertEqual(
            motifs["distinct_exact_types_under_free_point_relabeling"], 3
        )
        self.assertEqual(
            motifs["largest_literal_shared_row_backbone"]["row_count"], 4
        )
        self.assertEqual(
            motifs["recurring_distinguished_hinge"]["multiplicity"], 3
        )

    def test_exact_canonical_signature_is_relabeling_invariant(self) -> None:
        rows = tuple(
            cegar.decode_metric_row(value)
            for value in self.analysis["cores"][0]["rows"]
        )
        points = analyze_cores.active_points(rows)
        movable = [point for point in points if point not in {0, 1}]
        mapping = {point: point for point in points}
        mapping[movable[0]], mapping[movable[1]] = movable[1], movable[0]
        relabeled = tuple(
            cegar.metric_oracle.MetricRow(
                mapping[row.center],
                tuple(sorted(mapping[point] for point in row.support)),
                exact=False,
            )
            for row in rows
        )
        original = analyze_cores.canonical_incidence_signature(
            rows, preserve_01=True
        )
        transformed = analyze_cores.canonical_incidence_signature(
            relabeled, preserve_01=True
        )
        self.assertEqual(
            original["canonical_sha256"], transformed["canonical_sha256"]
        )

    def test_bounded_bank_reuse_audit_replays_with_no_matches(self) -> None:
        saved = json.loads(
            bank_reuse_audit.DEFAULT_OUTPUT.read_text(encoding="utf-8")
        )
        replayed = bank_reuse_audit.build_document()
        self.assertEqual(saved, replayed)
        self.assertEqual(saved["summary"]["family_count"], 12)
        self.assertEqual(saved["summary"]["requested_family_count"], 11)
        self.assertEqual(saved["summary"]["supplemental_family_count"], 1)
        self.assertEqual(saved["summary"]["matched_family_count"], 0)
        self.assertEqual(saved["summary"]["total_match_count"], 0)
        self.assertTrue(
            saved["scope"]["exact_within_listed_families_and_closure_model"]
        )
        self.assertFalse(saved["scope"]["all_possible_theorem_banks_checked"])

    def test_extension_checkpoints_and_summary_are_structurally_valid(self) -> None:
        for budget, name in (
            (16, "checkpoint-round16.json"),
            (32, "checkpoint-round32.json"),
            (64, "checkpoint-round64.json"),
        ):
            payload = json.loads((HERE / name).read_text(encoding="utf-8"))
            self.validator.validate_document(payload, api=cegar)
            self.assertEqual(payload["budgets"]["max_rounds_per_case"], budget)
            self.assertTrue(
                all(
                    case["final_status"] == "STOPPED_ROUND_BUDGET"
                    for case in payload["cases"]
                )
            )
        saved = json.loads(
            summarize_extensions.DEFAULT_OUTPUT.read_text(encoding="utf-8")
        )
        self.assertEqual(saved, summarize_extensions.build_document())
        self.assertFalse(saved["summary"]["any_fixed_placement_exhausted"])
        self.assertFalse(saved["summary"]["any_crosschecked_nonunit_candidate"])
        self.assertEqual(saved["summary"]["largest_round_budget_per_case"], 64)
        self.assertTrue(
            saved["scope"]["round_64_hash_bound_resume_from_round_32"]
        )
        self.assertEqual(
            saved["checkpoints"][-1]["resume_provenance"][
                "checkpoint_sha256"
            ],
            saved["checkpoints"][-2]["sha256"],
        )

    def test_round32_shape_pass_has_no_repeated_exact_core(self) -> None:
        shapes = json.loads(
            (HERE / "core_shapes-round32.json").read_text(encoding="utf-8")
        )
        self.assertEqual(shapes["core_count"], 66)
        self.assertEqual(
            shapes["summary"]["distinct_groups_preserving_0_and_1"], 66
        )
        self.assertEqual(
            shapes["summary"]["distinct_groups_under_free_point_relabeling"],
            66,
        )
        self.assertEqual(shapes["five_row_motifs"]["core_count"], 6)
        self.assertEqual(
            shapes["five_row_motifs"][
                "distinct_exact_types_under_free_point_relabeling"
            ],
            6,
        )
        self.assertEqual(
            shapes["five_row_motifs"]["recurring_distinguished_hinge"][
                "multiplicity"
            ],
            6,
        )

    def test_round64_shape_pass_finds_one_repeated_exact_core(self) -> None:
        shapes = json.loads(
            (HERE / "core_shapes-round64.json").read_text(encoding="utf-8")
        )
        self.assertEqual(shapes["core_count"], 130)
        self.assertEqual(
            shapes["summary"]["distinct_groups_preserving_0_and_1"], 129
        )
        self.assertEqual(
            shapes["summary"]["distinct_groups_under_free_point_relabeling"],
            129,
        )
        repeated = [
            group
            for group in shapes["groups_under_free_point_relabeling"]
            if group["multiplicity"] > 1
        ]
        self.assertEqual(len(repeated), 1)
        self.assertEqual(
            [(member["profile"], member["round"]) for member in repeated[0]["members"]],
            [([5, 5, 5], 40), ([5, 5, 5], 62)],
        )

    def test_repeated_core_has_unique_existing_bank_match(self) -> None:
        saved = json.loads(
            repeated_core_bank_audit.DEFAULT_OUTPUT.read_text(encoding="utf-8")
        )
        repeated_core_bank_audit.verify_inputs()
        self.assertEqual(
            saved["summary"]["status"], "UNIQUE_EXISTING_SIX_POINT_CHAIN_MATCH"
        )
        self.assertEqual(saved["summary"]["total_match_count"], 1)
        self.assertEqual(saved["match"]["family"], "SixPointCircleChainCollisionCore")
        self.assertEqual(
            saved["match"]["unique_role_assignment"],
            {"A": 0, "B": 1, "C": 2, "D": 6, "E": 9, "F": 10},
        )

    def test_round64_cuts_are_not_source_row_only(self) -> None:
        saved = json.loads(
            audit_row_origins.DEFAULT_OUTPUT.read_text(encoding="utf-8")
        )
        replayed = audit_row_origins.build_audit(
            audit_row_origins.DEFAULT_CHECKPOINT.resolve()
        )
        self.assertEqual(saved, replayed)
        for case in saved["cases"]:
            self.assertEqual(case["round_count"], 64)
            self.assertEqual(case["cut_with_source_alias_for_every_row_count"], 0)
            self.assertEqual(case["source_only_cut_count"], 0)


if __name__ == "__main__":
    unittest.main()
