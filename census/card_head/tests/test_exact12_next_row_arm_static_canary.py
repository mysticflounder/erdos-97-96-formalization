from __future__ import annotations

import unittest
from pathlib import Path
from unittest.mock import patch

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_adjacent_apex_cross_block_membership_family_bank import (
    install_adjacent_apex_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
    _source_paths as apex_first_opposite_shared_pair_common_five_source_paths,
)
from census.card_head.exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
    install_apex_first_opposite_shared_pair_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank import (
    _source_paths as apex_first_opposite_shared_pair_second_opposite_common_five_source_paths,
)
from census.card_head.exact12_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank import (
    install_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank import (
    _source_paths as apex_first_opposite_shared_pair_surplus_common_five_source_paths,
)
from census.card_head.exact12_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank import (
    install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_first_surplus_second_common_five_membership_family_bank import (
    _source_paths as apex_first_surplus_second_common_five_source_paths,
)
from census.card_head.exact12_apex_first_surplus_second_common_five_membership_family_bank import (
    install_apex_first_surplus_second_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_internal_shared_pair_common_five_membership_family_bank import (
    install_apex_internal_shared_pair_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_pair_cross_block_membership_family_bank import (
    install_apex_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_shared_pair_cross_block_membership_family_bank import (
    install_apex_shared_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_triple_surplus_second_opposite_common_five_membership_family_bank import (
    _source_paths as apex_triple_surplus_second_opposite_common_five_source_paths,
)
from census.card_head.exact12_apex_triple_surplus_second_opposite_common_five_membership_family_bank import (
    install_apex_triple_surplus_second_opposite_common_five_membership_family_bank,
)
from census.card_head.exact12_apex_zero_cross_block_membership_family_bank import (
    install_apex_zero_cross_block_membership_family_bank,
)
from census.card_head.exact12_next_row_arm_static_canary import (
    EXPECTED_ARM_SUFFIX_CLAUSES,
    EXPECTED_FINAL_CLAUSES,
    EXPECTED_FINAL_DIMACS_SHA256,
    EXPECTED_POST_ARM_CLAUSES,
    EXPECTED_POST_ARM_DIMACS_SHA256,
    EXPECTED_PREFIX_CLAUSES,
    EXPECTED_PREFIX_DIMACS_SHA256,
    EXPECTED_PREFIX_VARIABLES,
    JOB_SCHEMA,
    RUN_SCHEMA,
    SOURCE_PATHS,
    TERMINAL_STATUS,
    Exact12NextRowArmStaticCanaryError,
    _build_job,
    _cnf_sha256,
    _required_artifact_hashes,
    _required_artifacts_authenticated,
    _required_result_artifact_hashes,
    _source_manifest,
    append_authenticated_named_arm_suffix,
    materialize_arm_static_canary,
    materialize_positive_membership_static_cell,
    run_arm_static_canary,
)
from census.card_head.exact12_next_row_valuation import (
    arm_cells,
    compile_arm_cell,
)
from census.card_head.exact12_second_apex_surplus_second_first_common_five_membership_family_bank import (
    _source_paths as second_apex_surplus_second_first_common_five_source_paths,
)
from census.card_head.exact12_second_apex_surplus_second_first_common_five_membership_family_bank import (
    install_second_apex_surplus_second_first_common_five_membership_family_bank,
)
from census.card_head.exact12_second_cap_apex_surplus_membership_family_bank import (
    install_second_cap_apex_surplus_membership_family_bank,
)
from census.card_head.exact12_surplus_apex_pair_membership_family_bank import (
    install_surplus_apex_pair_membership_family_bank,
)
from census.card_head.exact12_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank import (
    _source_paths as surplus_pair_second_opposite_apex_pair_common_five_source_paths,
)
from census.card_head.exact12_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank import (
    install_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank,
)
from census.card_head.exact12_surplus_three_triad_membership_family_bank import (
    install_surplus_three_triad_membership_family_bank,
)
from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.card_head.exact12_v14_ordered_coverage import (
    ARM_STATIC_CELL6_COMMON_FIVE_CUBE,
    ARM_STATIC_CELL6_COMMON_FIVE_LEAN_BINDING,
    ARM_STATIC_CELL6_FIFTH_COMMON_FIVE_CUBE,
    ARM_STATIC_CELL6_FIFTH_COMMON_FIVE_LEAN_BINDING,
    ARM_STATIC_CELL6_FOURTH_COMMON_FIVE_CUBE,
    ARM_STATIC_CELL6_FOURTH_COMMON_FIVE_LEAN_BINDING,
    ARM_STATIC_CELL6_SECOND_COMMON_FIVE_CUBE,
    ARM_STATIC_CELL6_SECOND_COMMON_FIVE_LEAN_BINDING,
    ARM_STATIC_CELL6_THIRD_COMMON_FIVE_CUBE,
    ARM_STATIC_CELL6_THIRD_COMMON_FIVE_LEAN_BINDING,
    detect_proof_backed_ordered_coverage,
    learned_clause_for_proof_backed_ordered_coverage,
)
from census.card_head.exact12_zero_center_cross_block_membership_family_bank import (
    install_zero_center_cross_block_membership_family_bank,
)
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

REPO_ROOT = Path(__file__).resolve().parents[3]


class Exact12NextRowArmStaticCanaryTests(unittest.TestCase):
    def test_canary_rejects_every_nonfrozen_arm(self) -> None:
        with self.assertRaisesRegex(
            Exact12NextRowArmStaticCanaryError, "only arm cell 6"
        ):
            run_arm_static_canary(REPO_ROOT, REPO_ROOT / "unused", 5)

    def test_authenticated_arm_suffix_has_frozen_identity(self) -> None:
        self.assertEqual(EXPECTED_PREFIX_VARIABLES, 45_337)
        self.assertEqual(EXPECTED_PREFIX_CLAUSES, 644_063)
        self.assertEqual(EXPECTED_POST_ARM_CLAUSES, 644_930)
        self.assertEqual(EXPECTED_FINAL_CLAUSES, 645_011)
        instance, compiled, layout, membership_bank = (
            materialize_positive_membership_static_cell(REPO_ROOT, 1)
        )
        surplus_apex_pair_family_bank = (
            install_surplus_apex_pair_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                membership_bank,
                cell_index=1,
            )
        )
        adjacent_apex_cross_block_family_bank = (
            install_adjacent_apex_cross_block_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                surplus_apex_pair_family_bank,
                cell_index=1,
            )
        )
        second_cap_apex_surplus_family_bank = (
            install_second_cap_apex_surplus_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                adjacent_apex_cross_block_family_bank,
                cell_index=1,
            )
        )
        surplus_three_triad_family_bank = (
            install_surplus_three_triad_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                second_cap_apex_surplus_family_bank,
                cell_index=1,
            )
        )
        zero_center_cross_block_family_bank = (
            install_zero_center_cross_block_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                surplus_three_triad_family_bank,
                cell_index=1,
            )
        )
        self.assertEqual(
            zero_center_cross_block_family_bank["family_id"],
            "zero-center-cross-block-x345-b6789-y1011.v1",
        )
        apex_zero_cross_block_family_bank = (
            install_apex_zero_cross_block_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                zero_center_cross_block_family_bank,
                cell_index=1,
            )
        )
        self.assertEqual(
            apex_zero_cross_block_family_bank["family_id"],
            "apex-zero-cross-block-a345-x6789-c1011.v1",
        )
        apex_pair_cross_block_family_bank = (
            install_apex_pair_cross_block_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                apex_zero_cross_block_family_bank,
                cell_index=1,
            )
        )
        self.assertEqual(
            apex_pair_cross_block_family_bank["family_id"],
            "apex-pair-cross-block-x6789-y345.v1",
        )
        apex_shared_pair_cross_block_family_bank = (
            install_apex_shared_pair_cross_block_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                apex_pair_cross_block_family_bank,
                cell_index=1,
            )
        )
        self.assertEqual(
            apex_shared_pair_cross_block_family_bank["family_id"],
            "apex-shared-pair-cross-block-a6789-b345-c1011.v1",
        )
        apex_internal_shared_pair_common_five_family_bank = (
            install_apex_internal_shared_pair_common_five_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                apex_shared_pair_cross_block_family_bank,
                cell_index=1,
            )
        )
        self.assertEqual(
            apex_internal_shared_pair_common_five_family_bank["family_id"],
            "apex-internal-shared-pair-common-five-a6789-b345-c6789.v1",
        )
        first_family_bank = (
            install_apex_first_opposite_shared_pair_common_five_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                apex_internal_shared_pair_common_five_family_bank,
                cell_index=1,
            )
        )
        self.assertEqual(
            first_family_bank["family_id"],
            "apex-first-opposite-shared-pair-common-five-x6789-b1011-y1011.v1",
        )
        second_family_bank = (
            install_apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                first_family_bank,
                cell_index=1,
            )
        )
        self.assertEqual(
            second_family_bank["family_id"],
            "apex-first-opposite-shared-pair-second-opposite-common-five-"
            "a6789-b345-c6789-y1011.v1",
        )
        third_family_bank = (
            install_apex_triple_surplus_second_opposite_common_five_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                second_family_bank,
                cell_index=1,
            )
        )
        self.assertEqual(
            third_family_bank["family_id"],
            "apex-triple-surplus-second-opposite-common-five-c345-y6789.v1",
        )
        fourth_family_bank = (
            install_surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                third_family_bank,
                cell_index=6,
            )
        )
        self.assertEqual(
            fourth_family_bank["family_id"],
            "surplus-pair-second-opposite-apex-pair-common-five-"
            "a345-y345-distinct-x6789.v1",
        )
        fifth_family_bank = (
            install_apex_first_surplus_second_common_five_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                fourth_family_bank,
                cell_index=6,
            )
        )
        self.assertEqual(
            fifth_family_bank["family_id"],
            "apex-first-surplus-second-common-five-a1011-b345-y6789.v1",
        )
        sixth_family_bank = (
            install_second_apex_surplus_second_first_common_five_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                fifth_family_bank,
                cell_index=6,
            )
        )
        self.assertEqual(
            sixth_family_bank["family_id"],
            "second-apex-surplus-second-first-common-five-b345-c6789-y1011.v1",
        )
        surplus_family_bank = (
            install_apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank(
                REPO_ROOT,
                instance,
                layout,
                sixth_family_bank,
                cell_index=6,
            )
        )
        self.assertEqual(
            surplus_family_bank["family_id"],
            "apex-first-opposite-shared-pair-surplus-common-five-"
            "x6789-b1011-y345.v1",
        )
        self.assertEqual(instance.cnf.n_variables, EXPECTED_PREFIX_VARIABLES)
        self.assertEqual(len(instance.cnf.clauses), EXPECTED_PREFIX_CLAUSES)
        self.assertEqual(_cnf_sha256(instance), EXPECTED_PREFIX_DIMACS_SHA256)
        arm_instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        arm_compiled = compile_arm_cell(arm_instance, arm_cells()[6])

        suffix = append_authenticated_named_arm_suffix(instance, compiled, arm_compiled)

        self.assertEqual(suffix["suffix"]["n_clauses"], EXPECTED_ARM_SUFFIX_CLAUSES)
        self.assertEqual(len(instance.cnf.clauses), EXPECTED_POST_ARM_CLAUSES)
        self.assertEqual(_cnf_sha256(instance), EXPECTED_POST_ARM_DIMACS_SHA256)

    def test_job_and_required_artifacts_bind_new_family_fail_closed(self) -> None:
        materialized = materialize_arm_static_canary(REPO_ROOT)
        job = _build_job(REPO_ROOT, materialized)
        self.assertEqual(job["schema"], JOB_SCHEMA)
        self.assertEqual(
            RUN_SCHEMA,
            "p97_rigid221_exact12_next_row_arm_static_canary_run.v7",
        )
        self.assertEqual(
            JOB_SCHEMA,
            "p97_rigid221_exact12_next_row_arm_static_canary_job.v7",
        )
        bank = (
            materialized.apex_first_opposite_shared_pair_common_five_family_bank
        )
        binding = job[
            "apex_first_opposite_shared_pair_common_five_membership_family_bank"
        ]

        self.assertEqual(binding["sha256"], bank["bank_sha256"])
        self.assertEqual(binding["family_id"], bank["family_id"])
        second_bank = (
            materialized.apex_first_opposite_shared_pair_second_opposite_common_five_family_bank
        )
        second_binding = job[
            "apex_first_opposite_shared_pair_second_opposite_common_five_membership_family_bank"
        ]
        self.assertEqual(second_binding["sha256"], second_bank["bank_sha256"])
        self.assertEqual(second_binding["family_id"], second_bank["family_id"])
        third_bank = (
            materialized.apex_triple_surplus_second_opposite_common_five_family_bank
        )
        third_binding = job[
            "apex_triple_surplus_second_opposite_common_five_membership_family_bank"
        ]
        self.assertEqual(third_binding["sha256"], third_bank["bank_sha256"])
        self.assertEqual(third_binding["family_id"], third_bank["family_id"])
        fourth_bank = (
            materialized.surplus_pair_second_opposite_apex_pair_common_five_family_bank
        )
        fourth_binding = job[
            "surplus_pair_second_opposite_apex_pair_common_five_membership_family_bank"
        ]
        self.assertEqual(fourth_binding["sha256"], fourth_bank["bank_sha256"])
        self.assertEqual(fourth_binding["family_id"], fourth_bank["family_id"])
        fifth_bank = materialized.apex_first_surplus_second_common_five_family_bank
        fifth_binding = job[
            "apex_first_surplus_second_common_five_membership_family_bank"
        ]
        self.assertEqual(fifth_binding["sha256"], fifth_bank["bank_sha256"])
        self.assertEqual(fifth_binding["family_id"], fifth_bank["family_id"])
        sixth_bank = (
            materialized.second_apex_surplus_second_first_common_five_family_bank
        )
        sixth_binding = job[
            "second_apex_surplus_second_first_common_five_membership_family_bank"
        ]
        self.assertEqual(sixth_binding["sha256"], sixth_bank["bank_sha256"])
        self.assertEqual(sixth_binding["family_id"], sixth_bank["family_id"])
        surplus_bank = (
            materialized.apex_first_opposite_shared_pair_surplus_common_five_family_bank
        )
        surplus_binding = job[
            "apex_first_opposite_shared_pair_surplus_common_five_membership_family_bank"
        ]
        self.assertEqual(surplus_binding["sha256"], surplus_bank["bank_sha256"])
        self.assertEqual(surplus_binding["family_id"], surplus_bank["family_id"])
        expected_source_paths = set(SOURCE_PATHS)
        expected_source_paths.update(
            apex_first_opposite_shared_pair_common_five_source_paths(REPO_ROOT)
        )
        expected_source_paths.update(
            apex_first_opposite_shared_pair_second_opposite_common_five_source_paths(
                REPO_ROOT
            )
        )
        expected_source_paths.update(
            apex_triple_surplus_second_opposite_common_five_source_paths(REPO_ROOT)
        )
        expected_source_paths.update(
            surplus_pair_second_opposite_apex_pair_common_five_source_paths(
                REPO_ROOT
            )
        )
        expected_source_paths.update(
            apex_first_surplus_second_common_five_source_paths(REPO_ROOT)
        )
        expected_source_paths.update(
            second_apex_surplus_second_first_common_five_source_paths(REPO_ROOT)
        )
        expected_source_paths.update(
            apex_first_opposite_shared_pair_surplus_common_five_source_paths(REPO_ROOT)
        )
        self.assertEqual(
            {record["path"] for record in job["sources"]}, expected_source_paths
        )
        required = _required_artifact_hashes(job, materialized)
        artifacts = {
            name: {"sha256": expected_sha256}
            for name, expected_sha256 in required.items()
        }
        self.assertTrue(_required_artifacts_authenticated(artifacts, required))

        artifacts[
            "apex_first_opposite_shared_pair_common_five_family_bank"
        ] = {"sha256": "0" * 64}
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))
        artifacts.pop("apex_first_opposite_shared_pair_common_five_family_bank")
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))

        artifacts = {
            name: {"sha256": expected_sha256}
            for name, expected_sha256 in required.items()
        }
        artifacts[
            "apex_triple_surplus_second_opposite_common_five_family_bank"
        ] = {"sha256": "0" * 64}
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))
        artifacts.pop(
            "apex_triple_surplus_second_opposite_common_five_family_bank"
        )
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))

        artifacts = {
            name: {"sha256": expected_sha256}
            for name, expected_sha256 in required.items()
        }
        artifacts[
            "surplus_pair_second_opposite_apex_pair_common_five_family_bank"
        ] = {"sha256": "0" * 64}
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))
        artifacts.pop(
            "surplus_pair_second_opposite_apex_pair_common_five_family_bank"
        )
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))

        artifacts = {
            name: {"sha256": expected_sha256}
            for name, expected_sha256 in required.items()
        }
        artifacts[
            "apex_first_surplus_second_common_five_family_bank"
        ] = {"sha256": "0" * 64}
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))
        artifacts.pop("apex_first_surplus_second_common_five_family_bank")
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))

        artifacts = {
            name: {"sha256": expected_sha256}
            for name, expected_sha256 in required.items()
        }
        artifacts[
            "second_apex_surplus_second_first_common_five_family_bank"
        ] = {"sha256": "0" * 64}
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))
        artifacts.pop("second_apex_surplus_second_first_common_five_family_bank")
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))

        artifacts = {
            name: {"sha256": expected_sha256}
            for name, expected_sha256 in required.items()
        }
        artifacts[
            "apex_first_opposite_shared_pair_surplus_common_five_family_bank"
        ] = {"sha256": "0" * 64}
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))
        artifacts.pop(
            "apex_first_opposite_shared_pair_surplus_common_five_family_bank"
        )
        self.assertFalse(_required_artifacts_authenticated(artifacts, required))

        self.assertEqual(
            materialized.instance.cnf.n_variables, EXPECTED_PREFIX_VARIABLES
        )
        self.assertEqual(len(materialized.instance.cnf.clauses), EXPECTED_FINAL_CLAUSES)
        self.assertEqual(
            _cnf_sha256(materialized.instance), EXPECTED_FINAL_DIMACS_SHA256
        )

    def test_success_statuses_require_their_result_artifacts(self) -> None:
        survivor = {"job_id": "bound-job", "assignment_sha256": "1" * 64}
        sat_required = _required_result_artifact_hashes(
            "SAT_WITNESS_REPLAYED",
            survivor=survivor,
            terminal_proof_sha256=None,
        )
        sat_artifacts = {
            "survivor": {"sha256": sat_required["survivor"]},
        }
        self.assertTrue(
            _required_artifacts_authenticated(sat_artifacts, sat_required)
        )
        sat_artifacts["survivor"] = {"sha256": "0" * 64}
        self.assertFalse(
            _required_artifacts_authenticated(sat_artifacts, sat_required)
        )
        with self.assertRaisesRegex(
            Exact12NextRowArmStaticCanaryError, "omitted its survivor"
        ):
            _required_result_artifact_hashes(
                "SAT_WITNESS_REPLAYED",
                survivor=None,
                terminal_proof_sha256=None,
            )

        terminal_required = _required_result_artifact_hashes(
            TERMINAL_STATUS,
            survivor=None,
            terminal_proof_sha256="2" * 64,
        )
        terminal_artifacts = {
            name: {"sha256": expected_sha256}
            for name, expected_sha256 in terminal_required.items()
        }
        self.assertTrue(
            _required_artifacts_authenticated(terminal_artifacts, terminal_required)
        )
        terminal_artifacts.pop("proof")
        self.assertFalse(
            _required_artifacts_authenticated(terminal_artifacts, terminal_required)
        )
        with self.assertRaisesRegex(
            Exact12NextRowArmStaticCanaryError, "omitted its proof hash"
        ):
            _required_result_artifact_hashes(
                TERMINAL_STATUS,
                survivor=None,
                terminal_proof_sha256=None,
            )

    def test_source_manifest_failure_is_rejected(self) -> None:
        with patch(
            "census.card_head.exact12_next_row_arm_static_canary._source_record",
            side_effect=ValueError("semantic source drift"),
        ), self.assertRaisesRegex(
            Exact12NextRowArmStaticCanaryError,
            "required canary source failed authentication",
        ):
            _source_manifest(REPO_ROOT)
        with patch(
            "census.card_head.exact12_next_row_arm_static_canary."
            "apex_first_surplus_second_common_five_source_paths",
            side_effect=ValueError("new family source drift"),
        ), self.assertRaisesRegex(
            Exact12NextRowArmStaticCanaryError,
            "required canary source failed authentication",
        ):
            _source_manifest(REPO_ROOT)
        with patch(
            "census.card_head.exact12_next_row_arm_static_canary."
            "second_apex_surplus_second_first_common_five_source_paths",
            side_effect=ValueError("v18 family source drift"),
        ), self.assertRaisesRegex(
            Exact12NextRowArmStaticCanaryError,
            "required canary source failed authentication",
        ):
            _source_manifest(REPO_ROOT)

    def test_cell6_survivor_has_proof_backed_common_five_cut(self) -> None:
        certificate = detect_proof_backed_ordered_coverage(
            ARM_STATIC_CELL6_COMMON_FIVE_CUBE
        )

        self.assertIsNotNone(certificate)
        assert certificate is not None
        self.assertEqual(
            certificate["generated_lean_nogood"],
            ARM_STATIC_CELL6_COMMON_FIVE_LEAN_BINDING,
        )
        self.assertEqual(len(certificate["coverage"]), 48)
        self.assertEqual(
            {entry["rule"] for entry in certificate["coverage"]},
            {"convex-five-point-common-orientation"},
        )
        self.assertEqual(
            [
                sum(
                    entry["orientation"] == orientation
                    for entry in certificate["coverage"]
                )
                for orientation in ("forward", "reverse")
            ],
            [24, 24],
        )
        self.assertEqual(
            learned_clause_for_proof_backed_ordered_coverage(
                materialize_cell(0).instance, certificate
            ),
            (-925, -1198, -2258),
        )

    def test_cell6_second_survivor_has_proof_backed_common_five_cut(self) -> None:
        certificate = detect_proof_backed_ordered_coverage(
            ARM_STATIC_CELL6_SECOND_COMMON_FIVE_CUBE
        )

        self.assertIsNotNone(certificate)
        assert certificate is not None
        self.assertEqual(
            certificate["generated_lean_nogood"],
            ARM_STATIC_CELL6_SECOND_COMMON_FIVE_LEAN_BINDING,
        )
        self.assertEqual(len(certificate["coverage"]), 48)
        self.assertEqual(
            {entry["rule"] for entry in certificate["coverage"]},
            {"convex-five-point-common-orientation"},
        )
        self.assertEqual(
            [
                sum(
                    entry["orientation"] == orientation
                    for entry in certificate["coverage"]
                )
                for orientation in ("forward", "reverse")
            ],
            [24, 24],
        )
        self.assertEqual(
            learned_clause_for_proof_backed_ordered_coverage(
                materialize_cell(0).instance, certificate
            ),
            (-156, -175, -2820),
        )

    def test_cell6_third_survivor_has_proof_backed_common_five_cut(self) -> None:
        certificate = detect_proof_backed_ordered_coverage(
            ARM_STATIC_CELL6_THIRD_COMMON_FIVE_CUBE
        )

        self.assertIsNotNone(certificate)
        assert certificate is not None
        self.assertEqual(
            certificate["generated_lean_nogood"],
            ARM_STATIC_CELL6_THIRD_COMMON_FIVE_LEAN_BINDING,
        )
        self.assertEqual(len(certificate["coverage"]), 48)
        self.assertEqual(
            {entry["rule"] for entry in certificate["coverage"]},
            {"convex-five-point-common-orientation"},
        )
        self.assertEqual(
            [
                sum(
                    entry["orientation"] == orientation
                    for entry in certificate["coverage"]
                )
                for orientation in ("forward", "reverse")
            ],
            [24, 24],
        )
        self.assertEqual(
            learned_clause_for_proof_backed_ordered_coverage(
                materialize_cell(0).instance, certificate
            ),
            (-61, -175, -1226),
        )

    def test_cell6_fourth_survivor_has_proof_backed_common_five_cut(self) -> None:
        certificate = detect_proof_backed_ordered_coverage(
            ARM_STATIC_CELL6_FOURTH_COMMON_FIVE_CUBE
        )

        self.assertIsNotNone(certificate)
        assert certificate is not None
        self.assertEqual(
            certificate["generated_lean_nogood"],
            ARM_STATIC_CELL6_FOURTH_COMMON_FIVE_LEAN_BINDING,
        )
        self.assertEqual(len(certificate["coverage"]), 48)
        self.assertEqual(
            {entry["rule"] for entry in certificate["coverage"]},
            {"convex-five-point-common-orientation"},
        )
        self.assertEqual(
            [
                sum(
                    entry["orientation"] == orientation
                    for entry in certificate["coverage"]
                )
                for orientation in ("forward", "reverse")
            ],
            [24, 24],
        )
        self.assertEqual(
            learned_clause_for_proof_backed_ordered_coverage(
                materialize_cell(0).instance, certificate
            ),
            (-18, -1342, -2445),
        )

    def test_cell6_fifth_survivor_has_proof_backed_common_five_cut(self) -> None:
        certificate = detect_proof_backed_ordered_coverage(
            ARM_STATIC_CELL6_FIFTH_COMMON_FIVE_CUBE
        )

        self.assertIsNotNone(certificate)
        assert certificate is not None
        self.assertEqual(
            certificate["generated_lean_nogood"],
            ARM_STATIC_CELL6_FIFTH_COMMON_FIVE_LEAN_BINDING,
        )
        self.assertEqual(len(certificate["coverage"]), 48)
        self.assertEqual(
            {entry["rule"] for entry in certificate["coverage"]},
            {"convex-five-point-common-orientation"},
        )
        self.assertEqual(
            [
                sum(
                    entry["orientation"] == orientation
                    for entry in certificate["coverage"]
                )
                for orientation in ("forward", "reverse")
            ],
            [24, 24],
        )
        self.assertEqual(
            learned_clause_for_proof_backed_ordered_coverage(
                materialize_cell(0).instance, certificate
            ),
            (-838, -1584, -2205),
        )


if __name__ == "__main__":
    unittest.main()
