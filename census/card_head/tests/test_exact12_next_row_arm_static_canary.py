from __future__ import annotations

import unittest
from pathlib import Path

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_adjacent_apex_cross_block_membership_family_bank import (
    install_adjacent_apex_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_pair_cross_block_membership_family_bank import (
    install_apex_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_shared_pair_cross_block_membership_family_bank import (
    install_apex_shared_pair_cross_block_membership_family_bank,
)
from census.card_head.exact12_apex_zero_cross_block_membership_family_bank import (
    install_apex_zero_cross_block_membership_family_bank,
)
from census.card_head.exact12_next_row_arm_static_canary import (
    EXPECTED_ARM_SUFFIX_CLAUSES,
    EXPECTED_POST_ARM_CLAUSES,
    EXPECTED_POST_ARM_DIMACS_SHA256,
    EXPECTED_PREFIX_CLAUSES,
    EXPECTED_PREFIX_DIMACS_SHA256,
    EXPECTED_PREFIX_VARIABLES,
    Exact12NextRowArmStaticCanaryError,
    _cnf_sha256,
    append_authenticated_named_arm_suffix,
    materialize_positive_membership_static_cell,
    run_arm_static_canary,
)
from census.card_head.exact12_next_row_valuation import (
    arm_cells,
    compile_arm_cell,
)
from census.card_head.exact12_second_cap_apex_surplus_membership_family_bank import (
    install_second_cap_apex_surplus_membership_family_bank,
)
from census.card_head.exact12_surplus_apex_pair_membership_family_bank import (
    install_surplus_apex_pair_membership_family_bank,
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
