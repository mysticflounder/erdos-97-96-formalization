#!/usr/bin/env python3
"""Fast source-fidelity checks for model.py."""

from __future__ import annotations

import json
import unittest
from pathlib import Path

import z3

from model import (
    PACKET_ROW_SUPPORTS,
    FreshThirdEncoding,
    RICH_FIELD_KEYS,
    SCHEMA_VERSION,
    R_CRITICAL_SUPPORT,
    SOURCE_SUPPORT,
)


HERE = Path(__file__).resolve().parent
TEST_TIMEOUT_MS = 60_000


class FreshThirdEncodingTests(unittest.TestCase):
    def check_sat(self, encoding: FreshThirdEncoding) -> z3.ModelRef:
        self.assertEqual(encoding.solver.check(), z3.sat)
        return encoding.solver.model()

    def test_schema_file_matches_code(self) -> None:
        schema = json.loads((HERE / "schema.json").read_text())
        self.assertEqual(schema["schema_version"], SCHEMA_VERSION)
        self.assertEqual(schema["alignment"]["cap_cases"], [0, 1, 2])
        self.assertEqual(
            schema["critical_no_qfree_projection"]["bound"], 3
        )
        self.assertEqual(
            schema["critical_no_qfree_projection"]["sources"],
            "every represented carrier role",
        )
        self.assertIn(
            "three existential CarrierPoint-valued slots",
            schema["critical_no_qfree_projection"]["encoding"],
        )
        self.assertEqual(
            set(schema["apex_rich_class_structure_projection"]["fields"]),
            set(RICH_FIELD_KEYS),
        )
        self.assertEqual(
            {
                "mpr_fresh",
                "mpr_collision",
                "mp_fresh",
                "mp_collision",
            },
            {
                key
                for key in schema["common_deletion_packets"]
                if key.startswith(("mpr_", "mp_"))
            },
        )
        self.assertIn(
            "does not say that every point",
            schema["common_deletion_packets"]["row_semantics"],
        )
        self.assertEqual(
            schema["alignment"]["conjuncts"],
            [
                "q_blocker_in_cap",
                "source_blocker_in_cap",
                "blockers_distinct",
                "q1_off_cap",
                "q2_off_cap",
                "q1_in_source_row",
                "q2_in_source_row",
            ],
        )

    def test_rich_field_centers_rotate_cyclically(self) -> None:
        for surplus_index in range(3):
            with self.subTest(surplus_index=surplus_index):
                encoding = FreshThirdEncoding(
                    surplus_index=surplus_index,
                    timeout_ms=TEST_TIMEOUT_MS,
                )
                self.assertEqual(
                    encoding.rich_centers,
                    {
                        "oppApex1": (
                            "v1",
                            "v2",
                            "v3",
                        )[(surplus_index + 1) % 3],
                        "oppApex2": (
                            "v1",
                            "v2",
                            "v3",
                        )[(surplus_index + 2) % 3],
                        "surplusApex": (
                            "v1",
                            "v2",
                            "v3",
                        )[surplus_index],
                    },
                )

    def test_q_blocker_may_equal_cap_source_blocker(self) -> None:
        encoding = FreshThirdEncoding(timeout_ms=TEST_TIMEOUT_MS)
        encoding.force_blocker_relation("equal")
        model = self.check_sat(encoding)
        self.assertTrue(
            z3.is_true(
                model.eval(encoding.same("bq", "bs"), model_completion=True)
            )
        )

    def test_cap_source_may_alias_q_source_functionally(self) -> None:
        encoding = FreshThirdEncoding(timeout_ms=TEST_TIMEOUT_MS)
        encoding.add("test_source_q1_alias", encoding.same("source", "q1"))
        model = self.check_sat(encoding)
        self.assertTrue(
            z3.is_true(
                model.eval(encoding.same("bq", "bs"), model_completion=True)
            )
        )

    def test_equal_blockers_disable_otherwise_complete_alignment_arm(self) -> None:
        encoding = FreshThirdEncoding(timeout_ms=TEST_TIMEOUT_MS)
        cap = 0
        encoding.add("test_equal_blockers", encoding.same("bq", "bs"))
        for atom in encoding.alignment_atoms(cap):
            if atom.name != "blockers_distinct":
                encoding.add("test_other_alignment_atoms", atom.formula)
        self.check_sat(encoding)

    def test_complete_alignment_arm_is_rejected(self) -> None:
        encoding = FreshThirdEncoding(timeout_ms=TEST_TIMEOUT_MS)
        encoding.add(
            "test_force_complete_alignment", encoding.alignment_arm(0)
        )
        self.assertEqual(encoding.solver.check(), z3.unsat)

    def test_each_cross_pair_view_is_present(self) -> None:
        encoding = FreshThirdEncoding(timeout_ms=TEST_TIMEOUT_MS)
        self.assertEqual(encoding.counts["cross_pair_deletion_view_p"], 1)
        self.assertEqual(encoding.counts["cross_pair_deletion_view_rho"], 1)

    def test_source_row_can_contain_both_q_sources_when_centers_alias(self) -> None:
        encoding = FreshThirdEncoding(timeout_ms=TEST_TIMEOUT_MS)
        encoding.add(
            "test_cross_row",
            encoding.same("bq", "bs"),
            encoding.in_support("q1", SOURCE_SUPPORT),
            encoding.in_support("q2", SOURCE_SUPPORT),
        )
        self.check_sat(encoding)

    def test_four_named_q2_survivors_on_one_bq_radius_are_rejected(self) -> None:
        encoding = FreshThirdEncoding(timeout_ms=TEST_TIMEOUT_MS)
        radius = encoding.distance("bq", "p1")
        encoding.add(
            "test_four_q2_survivors",
            encoding.positive_distance(radius),
            *(
                encoding.distance("bq", point) == radius
                for point in ("p2", "r1", "r2")
            ),
        )
        self.assertEqual(encoding.solver.check(), z3.unsat)

    def test_v4_packet_and_rich_field_counts(self) -> None:
        encoding = FreshThirdEncoding(timeout_ms=TEST_TIMEOUT_MS)
        self.assertEqual(encoding.n, 107)
        self.assertEqual(
            encoding.counts["apex_rich_class_structure_disjunctions"],
            3,
        )
        self.assertEqual(
            encoding.counts["tri_apex_blocker_vertex_exclusions"],
            3 * encoding.n,
        )
        self.assertEqual(
            encoding.counts["represented_center_not_all_three_apices"],
            encoding.n,
        )
        self.assertEqual(
            encoding.counts["all_named_no_qfree_three_slots"],
            encoding.n * encoding.n,
        )
        self.assertEqual(
            encoding.counts["all_named_actual_blocker_metric_projection"],
            encoding.n * (2 + encoding.n),
        )
        for packet in PACKET_ROW_SUPPORTS:
            with self.subTest(packet=packet):
                self.assertEqual(
                    encoding.counts[
                        f"{packet}_apex_q_deleted_exact_four"
                    ],
                    1,
                )
                self.assertEqual(
                    encoding.counts[
                        f"{packet}_blocker_q_deleted_exact_four"
                    ],
                    1,
                )
                self.assertEqual(
                    encoding.counts[f"{packet}_deletion_survival"],
                    2,
                )
                self.assertEqual(
                    encoding.counts[
                        f"{packet}_support_overlap_le_two"
                    ],
                    1,
                )

    def test_v4_named_consequences_reject_their_negations(self) -> None:
        encoding = FreshThirdEncoding(timeout_ms=TEST_TIMEOUT_MS)
        packet_apex, packet_blocker = PACKET_ROW_SUPPORTS["mpr_fresh"]
        center = "s2"
        center_radius = encoding.distance(center, "v1")
        probes = {
            "rich_apex_blocker_exclusion":
                encoding.blocker_of(encoding.pid(packet_apex[0]))
                == encoding.pid("v1"),
            "represented_center_all_apices":
                z3.And(
                    encoding.positive_distance(center_radius),
                    encoding.distance(center, "v2") == center_radius,
                    encoding.distance(center, "v3") == center_radius,
                ),
            "mprho_source_outside_predecessor_pair":
                z3.And(
                    encoding.different("mpr_source", "p1"),
                    encoding.different("mpr_source", "p2"),
                ),
            "mprho_reverse_omission_failure":
                encoding.in_support("mpr_source", R_CRITICAL_SUPPORT),
            "packet_deleted_source_in_support":
                encoding.same(packet_apex[0], "r1"),
            "packet_overlap_three":
                z3.And(
                    *(
                        encoding.same(packet_apex[i], packet_blocker[i])
                        for i in range(3)
                    )
                ),
            "source_blocker_bs_is_v1": encoding.same("bs", "v1"),
            "source_blocker_bs_is_v2": encoding.same("bs", "v2"),
            "source_blocker_bs_is_v3": encoding.same("bs", "v3"),
            "fresh_blocker_bq_is_v1": encoding.same("bq", "v1"),
            "fresh_blocker_bq_is_v2": encoding.same("bq", "v2"),
            "fresh_blocker_bq_is_v3": encoding.same("bq", "v3"),
        }
        for label, formula in probes.items():
            with self.subTest(label=label):
                encoding.solver.push()
                encoding.solver.add(formula)
                self.assertEqual(encoding.solver.check(), z3.unsat)
                encoding.solver.pop()

    def test_each_rich_disjunction_rejects_both_arms_missing(self) -> None:
        encoding = FreshThirdEncoding(timeout_ms=TEST_TIMEOUT_MS)
        for field in RICH_FIELD_KEYS:
            with self.subTest(field=field):
                encoding.solver.push()
                encoding.solver.add(
                    z3.Not(encoding.rich_arm_formulas[field]["six"]),
                    z3.Not(encoding.rich_arm_formulas[field]["two_k4"]),
                )
                self.assertEqual(encoding.solver.check(), z3.unsat)
                encoding.solver.pop()


if __name__ == "__main__":
    unittest.main(verbosity=2)
