from __future__ import annotations

import unittest
from dataclasses import replace

from census.card_head.b1_exact12_structural import (
    A2,
    FIVE_SHARED_MATE,
    B1Exact12Cell,
    B1Exact12StructuralError,
    B1SourceSafeCoverInstance,
    B1TraceArm,
    cells,
    compile_cell,
    decode_and_replay,
    replay_structural_cube,
    source_safe_candidate_class_ok,
    source_safe_candidate_classes,
    source_safe_cube_ok,
    trace_arms,
)
from census.card_head.candidate_surface import build_model
from census.card_head.profiles import labeled_cap_profiles
from census.card_head.sat_encoding import CoverInstance

PROFILE = (5, 6, 4)
SAT_CUBE = {
    0: (4, 5, 9, 11),
    1: (7, 8, 9, 11),
    2: (5, 8, 10, 11),
    3: (6, 8, 9, 10),
    4: (6, 7, 10, 11),
    5: (4, 7, 9, 10),
    6: (4, 5, 7, 8),
    7: (3, 5, 6, 9),
    8: (3, 4, 6, 11),
    9: (2, 5, 6, 7),
    10: (2, 4, 6, 8),
    11: (2, 3, 5, 10),
}


def replay_cell() -> B1Exact12Cell:
    """Name B1 traces already present in ``SAT_CUBE``."""

    return B1Exact12Cell(
        profile=PROFILE,
        physical=(6, 7, 8, 9, 11),
        q=9,
        r=11,
        u=7,
        v=8,
        mates=(6,),
        common_blocker=0,
        u_blocker=9,
        v_blocker=10,
        arm=FIVE_SHARED_MATE,
    )


def singleton_instance() -> B1SourceSafeCoverInstance:
    """Build the real CNF adapter with one independently valid row per center."""

    instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
    CoverInstance.__init__(
        instance,
        build_model(12, PROFILE),
        candidate_provider=lambda _model, center: (SAT_CUBE[center],),
        cube_validator=source_safe_cube_ok,
    )
    return instance


class B1Exact12StructuralTests(unittest.TestCase):
    def test_trace_arms_are_the_four_normalized_branches(self) -> None:
        five = trace_arms(5)
        six = trace_arms(6)
        self.assertEqual(
            five,
            (
                B1TraceArm("five_u_single_v_pair", 5, ("u",), ("v", "m0")),
                B1TraceArm("five_u_pair_v_single", 5, ("u", "m0"), ("v",)),
                B1TraceArm("five_shared_mate", 5, ("u", "m0"), ("v", "m0")),
            ),
        )
        self.assertEqual(
            six,
            (
                B1TraceArm(
                    "six_disjoint_pairs", 6, ("u", "m0"), ("v", "m1")
                ),
            ),
        )
        with self.assertRaisesRegex(B1Exact12StructuralError, "5 or 6"):
            trace_arms(4)

    def test_source_safe_predicates_accept_all_profiles_and_fail_closed(self) -> None:
        for profile in labeled_cap_profiles(12):
            model = build_model(12, profile)
            accepted = next(
                candidate
                for center in range(12)
                for candidate in (
                    tuple(point for point in range(12) if point != center)[:4],
                )
                if source_safe_candidate_class_ok(model, center, candidate)
            )
            self.assertEqual(len(accepted), 4)

        model = build_model(12, PROFILE)
        self.assertTrue(source_safe_candidate_class_ok(model, 3, (0, 1, 4, 5)))
        self.assertFalse(source_safe_candidate_class_ok(model, True, SAT_CUBE[1]))
        self.assertFalse(source_safe_candidate_class_ok(model, -1, (0, 1, 4, 5)))
        self.assertFalse(source_safe_candidate_class_ok(model, 3, (0, 1, 4)))
        self.assertFalse(source_safe_candidate_class_ok(model, 3, (0, 1, 4, 12)))
        self.assertTrue(source_safe_cube_ok(model, SAT_CUBE))
        self.assertFalse(source_safe_cube_ok(model, {3: SAT_CUBE[3]}))

    def test_cells_are_lazy_deterministic_and_cover_each_profile(self) -> None:
        first = tuple(cells(profiles=(PROFILE,), class_cards=(5,), limit=4))
        second = tuple(cells(profiles=(PROFILE,), class_cards=(5,), limit=4))
        self.assertEqual(first, second)
        self.assertEqual(len(first), 4)
        self.assertEqual(len(set(first)), 4)
        for cell in first:
            self.assertEqual(cell.physical, tuple(sorted(cell.physical)))
            self.assertEqual(
                set(cell.physical),
                {cell.q, cell.r, cell.u, cell.v, *cell.mates},
            )
            self.assertEqual(
                cell.blockers,
                (cell.common_blocker, cell.u_blocker, cell.v_blocker),
            )
            self.assertIn(cell.arm, trace_arms(len(cell.physical)))

        for profile in labeled_cap_profiles(12):
            cell = next(cells(profiles=(profile,), class_cards=(5,), limit=1))
            self.assertEqual(cell.profile, profile)

        with self.assertRaisesRegex(B1Exact12StructuralError, "unauthorized"):
            next(cells(profiles=((5, 4, 6),), limit=1))
        with self.assertRaisesRegex(B1Exact12StructuralError, "nonnegative"):
            next(cells(limit=True))

    def test_compile_adds_only_four_source_mapped_row_clauses(self) -> None:
        instance = singleton_instance()
        compiled = compile_cell(instance, replay_cell())

        self.assertEqual(compiled.base_n_variables, compiled.final_n_variables)
        self.assertEqual(compiled.final_n_clauses - compiled.base_n_clauses, 4)
        self.assertEqual(compiled.clause_delta, tuple(
            variables for _name, variables in compiled.required_variable_groups
        ))
        self.assertTrue(
            all(
                literal > 0
                for clause in compiled.clause_delta
                for literal in clause
            )
        )
        self.assertEqual(
            tuple(name for name, _variables in compiled.required_variable_groups),
            (
                "apex_row_subset_physical",
                "common_blocker_intersection_qr",
                "u_blocker_trace_intersection",
                "v_blocker_trace_intersection",
            ),
        )
        manifest = compiled.manifest()
        self.assertFalse(manifest["promotion_eligible"])
        self.assertEqual(manifest["cell"]["arm"], "five_shared_mate")
        self.assertIn(
            "metric_row_radius_and_distance_equalities", manifest["omitted_rules"]
        )

    def test_first_raw_cell_encodes_an_empty_required_row_group(self) -> None:
        first = next(cells(profiles=((5, 5, 5),), class_cards=(5,), limit=1))
        model = build_model(12, first.profile)
        rows = {
            center: source_safe_candidate_classes(model, center)[0]
            for center in range(12)
        }
        rows[A2] = next(
            row
            for row in source_safe_candidate_classes(model, A2)
            if not set(row) <= set(first.physical)
        )
        instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
        CoverInstance.__init__(
            instance,
            model,
            candidate_provider=lambda _model, center: (rows[center],),
            cube_validator=source_safe_cube_ok,
        )
        compiled = compile_cell(instance, first)
        empty_groups = tuple(
            name
            for name, variables in compiled.required_variable_groups
            if not variables
        )
        self.assertIn("apex_row_subset_physical", empty_groups)
        self.assertIn((), compiled.clause_delta)
        self.assertEqual(compiled.manifest()["empty_required_groups"], list(empty_groups))

    def test_decode_replays_the_cube_and_every_b1_constraint(self) -> None:
        instance = singleton_instance()
        compiled = compile_cell(instance, replay_cell())
        positive = tuple(instance.choice_variables.values())

        report = decode_and_replay(instance, compiled, positive)
        self.assertTrue(report["valid"])
        self.assertEqual(
            report["cube"],
            {str(center): list(SAT_CUBE[center]) for center in range(12)},
        )
        self.assertTrue(all(report["checks"].values()))
        self.assertTrue(
            all(replay_structural_cube(instance, compiled.cell, SAT_CUBE).values())
        )

        with self.assertRaisesRegex(B1Exact12StructuralError, "does not satisfy"):
            decode_and_replay(instance, compiled, positive[1:])
        with self.assertRaisesRegex(B1Exact12StructuralError, "invalid variable"):
            decode_and_replay(instance, compiled, (*positive, True))
        with self.assertRaisesRegex(B1Exact12StructuralError, "metadata"):
            decode_and_replay(
                instance,
                replace(compiled, clause_delta_sha256="0" * 64),
                positive,
            )

    def test_malformed_cells_and_instances_are_rejected(self) -> None:
        cell = replay_cell()
        with self.assertRaisesRegex(B1Exact12StructuralError, "apex"):
            replace(cell, physical=(A2, 6, 7, 8, 9))
        with self.assertRaisesRegex(B1Exact12StructuralError, "mate"):
            replace(cell, mates=(5,))
        generic = CoverInstance(
            build_model(12, PROFILE),
            candidate_provider=lambda _model, center: (SAT_CUBE[center],),
            cube_validator=source_safe_cube_ok,
        )
        with self.assertRaisesRegex(B1Exact12StructuralError, "source-safe instance"):
            compile_cell(generic, cell)  # type: ignore[arg-type]


if __name__ == "__main__":
    unittest.main()
