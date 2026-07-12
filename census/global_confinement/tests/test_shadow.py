# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import unittest
from itertools import product

from census.global_confinement.probe import ordered_surplus_placements, packet_labels
from census.global_confinement.shadow import (
    ChoiceRow,
    ClassRow,
    RowChoice,
    VariableRow,
    cyclic_separated,
    hull_order,
    rows_compatible,
    solve_rows,
    solve_choice_rows,
    verify_assignment,
)
from census.multi_center import multi_center_census as mc


class GlobalConfinementShadowTests(unittest.TestCase):
    def setUp(self) -> None:
        self.labels = packet_labels(11)
        self.frame, candidates = mc.cached_candidate_lists(
            self.labels.profile, set(mc.PROVEN_ROWS)
        )
        assert candidates is not None
        self.candidates = candidates

    def test_packet_labels_n11(self) -> None:
        self.assertEqual(self.labels.profile, (6, 4, 4))
        self.assertEqual(self.frame.n, 11)
        self.assertEqual(self.labels.pin_source, 3)
        self.assertEqual(self.labels.deleted, 4)
        self.assertEqual(self.labels.pin_class, frozenset((0, 3, 7, 8)))
        self.assertTrue(
            mc.candidate_ok(
                self.frame,
                set(mc.PROVEN_ROWS),
                1,
                self.labels.pin_class,
            )
        )

    def test_all_ordered_n11_placements(self) -> None:
        placements = ordered_surplus_placements(11)
        self.assertEqual(len(placements), 12)
        self.assertEqual(
            {(row.pin_source, row.deleted) for row in placements},
            {
                (source, deleted)
                for source in self.frame.ints["S"]
                for deleted in self.frame.ints["S"]
                if source != deleted
            },
        )
        for row in placements:
            self.assertIn(row.pin_source, row.pin_class)
            self.assertNotIn(row.deleted, row.pin_class)

    def test_invalid_placement_is_rejected(self) -> None:
        with self.assertRaises(ValueError):
            packet_labels(11, pin_source_index=2, deleted_index=2)

    def test_cyclic_separation(self) -> None:
        order = hull_order(self.frame)
        self.assertEqual(order, (0, 9, 10, 1, 3, 4, 5, 6, 2, 7, 8))
        self.assertTrue(cyclic_separated(order, 0, 1, 9, 2))
        self.assertFalse(cyclic_separated(order, 0, 1, 9, 10))

    def test_same_center_exact_row_must_be_equal_or_disjoint(self) -> None:
        exact = ClassRow("exact", 1, frozenset((0, 3, 7, 8)), exact=True)
        equal = ClassRow("equal", 1, exact.support)
        overlap = ClassRow("overlap", 1, frozenset((0, 4, 5, 6)))
        disjoint = ClassRow("disjoint", 1, frozenset((2, 4, 9, 10)))
        self.assertTrue(rows_compatible(self.frame, exact, equal))
        self.assertFalse(rows_compatible(self.frame, exact, overlap))
        self.assertTrue(rows_compatible(self.frame, exact, disjoint))

    def test_solver_returns_independently_validated_witness(self) -> None:
        pin = ClassRow("pinned", 1, self.labels.pin_class, exact=True)
        result = solve_rows(
            self.frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=(pin,),
            variable_rows=(
                VariableRow("row:0", 0, tuple(self.candidates[0])),
                VariableRow("row:2", 2, tuple(self.candidates[2])),
            ),
            max_nodes=20_000,
            want_assignment=True,
        )
        self.assertEqual(result["status"], "SAT")
        rows = tuple(
            ClassRow(
                name,
                record["center"],
                frozenset(record["support"]),
                exact=record["exact"],
            )
            for name, record in result["assignment"].items()
        )
        self.assertEqual(
            verify_assignment(self.frame, set(mc.PROVEN_ROWS), rows),
            (True, None),
        )

    def test_node_cap_is_not_reported_as_unsat(self) -> None:
        result = solve_rows(
            self.frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=(),
            variable_rows=(VariableRow("row:0", 0, tuple(self.candidates[0])),),
            max_nodes=1,
        )
        self.assertIn(result["status"], {"SAT", "INDETERMINATE"})

    def test_incremental_solver_matches_small_bruteforce(self) -> None:
        specs = (
            VariableRow("row:0", 0, tuple(self.candidates[0][:5])),
            VariableRow("row:2", 2, tuple(self.candidates[2][:5])),
            VariableRow("row:3", 3, tuple(self.candidates[3][:5])),
        )
        fixed = (
            ClassRow("pinned", 1, self.labels.pin_class, exact=True),
        )
        brute_sat = False
        for supports in product(*(spec.candidates for spec in specs)):
            rows = (*fixed, *(ClassRow(spec.name, spec.center, support)
                              for spec, support in zip(specs, supports, strict=True)))
            if verify_assignment(self.frame, set(mc.PROVEN_ROWS), rows)[0]:
                brute_sat = True
                break
        result = solve_rows(
            self.frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=fixed,
            variable_rows=specs,
            max_nodes=10_000,
        )
        self.assertEqual(result["status"] == "SAT", brute_sat)

    def test_source_row_may_choose_its_center(self) -> None:
        pin = ClassRow("pinned", 1, self.labels.pin_class, exact=True)
        choices = tuple(
            RowChoice(center, support)
            for center in (0, 2)
            for support in self.candidates[center]
            if self.labels.deleted in support
        )
        result = solve_choice_rows(
            self.frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=(pin,),
            choice_rows=(ChoiceRow("source:4", choices, exact=True),),
            max_nodes=10_000,
            want_assignment=True,
        )
        self.assertEqual(result["status"], "SAT")
        selected = result["assignment"]["source:4"]
        self.assertIn(selected["center"], {0, 2})
        self.assertIn(self.labels.deleted, selected["support"])

    def test_extra_compatibility_filters_fixed_and_variable_pairs(self) -> None:
        fixed = ClassRow("fixed", 1, self.labels.pin_class, exact=True)
        source = self.labels.deleted

        def require_source_at_shared_center(
            left: ClassRow, right: ClassRow
        ) -> bool:
            for blocker, other in ((left, right), (right, left)):
                if (
                    blocker.name == "shell"
                    and blocker.center == other.center
                    and source not in other.support
                ):
                    return False
            return True

        choices = (
            RowChoice(1, frozenset((2, 4, 9, 10))),
            RowChoice(2, next(
                support
                for support in self.candidates[2]
                if source in support
            )),
        )
        result = solve_choice_rows(
            self.frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=(fixed,),
            choice_rows=(ChoiceRow("shell", choices, exact=True),),
            max_nodes=10_000,
            want_assignment=True,
            extra_compatible=require_source_at_shared_center,
        )
        self.assertEqual(result["status"], "SAT")
        self.assertEqual(result["assignment"]["shell"]["center"], 2)

    def test_prefix_compatibility_prunes_global_row_sets(self) -> None:
        first, second = self.candidates[0][:2]

        def reject_first(rows: tuple[ClassRow, ...]) -> bool:
            return all(row.name != "row:0" or row.support != first for row in rows)

        result = solve_rows(
            self.frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=(),
            variable_rows=(VariableRow("row:0", 0, (first, second)),),
            max_nodes=10_000,
            want_assignment=True,
            prefix_compatible=reject_first,
        )
        self.assertEqual(result["status"], "SAT")
        self.assertEqual(
            frozenset(result["assignment"]["row:0"]["support"]), second
        )

    def test_prefix_compatibility_can_reject_fixed_rows(self) -> None:
        pin = ClassRow("pinned", 1, self.labels.pin_class, exact=True)
        result = solve_choice_rows(
            self.frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=(pin,),
            choice_rows=(),
            max_nodes=10_000,
            prefix_compatible=lambda _rows: False,
        )
        self.assertEqual(result, {"status": "UNSAT", "nodes": 0})

    def test_complete_compatibility_backtracks_at_leaf(self) -> None:
        choices = tuple(sorted(self.candidates[0][:2], key=lambda row: tuple(row)))
        rejected = choices[0]
        result = solve_rows(
            self.frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=(),
            variable_rows=(VariableRow("row:0", 0, choices),),
            max_nodes=10_000,
            want_assignment=True,
            complete_compatible=lambda rows: all(
                row.name != "row:0" or row.support != rejected for row in rows
            ),
        )
        self.assertEqual(result["status"], "SAT")
        self.assertNotEqual(
            frozenset(result["assignment"]["row:0"]["support"]), rejected
        )

    def test_complete_compatibility_can_reject_every_leaf(self) -> None:
        result = solve_rows(
            self.frame,
            set(mc.PROVEN_ROWS),
            fixed_rows=(),
            variable_rows=(
                VariableRow("row:0", 0, tuple(self.candidates[0][:2])),
            ),
            max_nodes=10_000,
            complete_compatible=lambda _rows: False,
        )
        self.assertEqual(result["status"], "UNSAT")


if __name__ == "__main__":
    unittest.main()
