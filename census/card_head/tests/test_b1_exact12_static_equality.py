from __future__ import annotations

import unittest
from dataclasses import replace

from census.card_head.b1_exact12_static_equality import (
    B1Exact12StaticEqualityError,
    canonical_extension_assignment,
    canonical_extension_satisfies_delta,
    install_static_equality_extension,
)
from census.card_head.b1_exact12_structural import (
    A2,
    FIVE_SHARED_MATE,
    B1Exact12Cell,
    B1SourceSafeCoverInstance,
    compile_cell,
    source_safe_cube_ok,
)
from census.card_head.candidate_surface import build_model
from census.card_head.sat_encoding import CoverInstance

PROFILE = (5, 6, 4)
STATIC_REJECTED_CUBE = {
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


def rejected_cell() -> B1Exact12Cell:
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
    instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
    CoverInstance.__init__(
        instance,
        build_model(12, PROFILE),
        candidate_provider=lambda _model, center: (STATIC_REJECTED_CUBE[center],),
        cube_validator=source_safe_cube_ok,
    )
    return instance


def compiled_fixture():
    instance = singleton_instance()
    compiled = compile_cell(instance, rejected_cell())
    return instance, compiled


class B1Exact12StaticEqualityTests(unittest.TestCase):
    def test_installs_frozen_counts_and_physical_apex_unit(self) -> None:
        instance, compiled = compiled_fixture()
        layout = install_static_equality_extension(instance, compiled)

        self.assertEqual(len(layout.edges), 66)
        self.assertEqual(len(layout.relation_variables), 2_145)
        self.assertEqual(layout.added_variables, 2_145)
        self.assertEqual(layout.row_implication_clauses, 72)
        self.assertEqual(layout.transitivity_clauses, 137_280)
        self.assertEqual(layout.duplicate_center_clauses, 7_920)
        self.assertEqual(layout.physical_apex_unit_clauses, 1)
        self.assertEqual(layout.added_clauses, 145_273)

        edge_index = {edge: index for index, edge in enumerate(layout.edges)}
        aq = edge_index[tuple(sorted((A2, compiled.cell.q)))]
        ar = edge_index[tuple(sorted((A2, compiled.cell.r)))]
        physical_unit = layout.relation_variables[tuple(sorted((aq, ar)))]
        self.assertEqual(layout.clause_delta[-1], (physical_unit,))
        self.assertEqual(layout.physical_apex_q, compiled.cell.q)
        self.assertEqual(layout.physical_apex_r, compiled.cell.r)
        self.assertEqual(layout.physical_apex_relation_variable, physical_unit)
        self.assertIn(
            physical_unit,
            canonical_extension_assignment(
                instance, compiled, layout, STATIC_REJECTED_CUBE
            ),
        )

        manifest = layout.manifest()
        self.assertFalse(manifest["promotion_eligible"])
        self.assertEqual(manifest["counts"]["physical_apex_unit_clauses"], 1)
        self.assertEqual(
            manifest["physical_apex_equality"],
            {
                "apex": A2,
                "q": compiled.cell.q,
                "r": compiled.cell.r,
                "variable": physical_unit,
            },
        )
        self.assertIn(
            "generic_labeled_metric_valuation_ingress",
            manifest["omitted_rules"],
        )
        self.assertEqual(len(manifest["manifest_sha256"]), 64)

    def test_canonical_replay_detects_static_duplicate_center_core(self) -> None:
        instance, compiled = compiled_fixture()
        layout = install_static_equality_extension(instance, compiled)

        self.assertTrue(source_safe_cube_ok(instance.model, STATIC_REJECTED_CUBE))
        self.assertFalse(
            canonical_extension_satisfies_delta(
                instance, compiled, layout, STATIC_REJECTED_CUBE
            )
        )

    def test_install_and_replay_fail_closed_on_drift(self) -> None:
        instance, compiled = compiled_fixture()
        layout = install_static_equality_extension(instance, compiled)

        with self.assertRaisesRegex(
            B1Exact12StaticEqualityError, "already installed"
        ):
            install_static_equality_extension(instance, compiled)
        with self.assertRaisesRegex(B1Exact12StaticEqualityError, "hashes"):
            canonical_extension_assignment(
                instance,
                compiled,
                replace(layout, final_cnf_sha256="0" * 64),
                STATIC_REJECTED_CUBE,
            )
        malformed_cube = dict(STATIC_REJECTED_CUBE)
        malformed_cube[True] = malformed_cube.pop(1)
        with self.assertRaisesRegex(B1Exact12StaticEqualityError, "integer centers"):
            canonical_extension_assignment(
                instance, compiled, layout, malformed_cube
            )

        alternate_instance = B1SourceSafeCoverInstance.__new__(
            B1SourceSafeCoverInstance
        )
        CoverInstance.__init__(
            alternate_instance,
            build_model(12, PROFILE),
            candidate_provider=lambda _model, center: (
                (STATIC_REJECTED_CUBE[center], (1, 2, 3, 5))
                if center == 0
                else (STATIC_REJECTED_CUBE[center],)
            ),
            cube_validator=source_safe_cube_ok,
        )
        alternate_compiled = compile_cell(alternate_instance, rejected_cell())
        alternate_layout = install_static_equality_extension(
            alternate_instance, alternate_compiled
        )
        globally_invalid_cube = dict(STATIC_REJECTED_CUBE)
        globally_invalid_cube[0] = (1, 2, 3, 5)
        with self.assertRaisesRegex(B1Exact12StaticEqualityError, "source-safe base"):
            canonical_extension_assignment(
                alternate_instance,
                alternate_compiled,
                alternate_layout,
                globally_invalid_cube,
            )

        generic = CoverInstance(
            build_model(12, PROFILE),
            candidate_provider=lambda _model, center: (
                STATIC_REJECTED_CUBE[center],
            ),
            cube_validator=source_safe_cube_ok,
        )
        with self.assertRaisesRegex(B1Exact12StaticEqualityError, "B1 source-safe"):
            install_static_equality_extension(generic, compiled)  # type: ignore[arg-type]


if __name__ == "__main__":
    unittest.main()
