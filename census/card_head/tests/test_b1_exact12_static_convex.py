from __future__ import annotations

import unittest
from dataclasses import replace
from itertools import islice

from census.card_head.b1_exact12_static_convex import (
    STATIC_CONVEX_SCHEMA,
    B1Exact12StaticConvexError,
    canonical_convex_satisfies_delta,
    install_static_convex_extension,
)
from census.card_head.b1_exact12_static_equality import (
    canonical_extension_assignment,
    install_static_equality_extension,
)
from census.card_head.b1_exact12_static_geometry import (
    STATIC_GEOMETRY_SCHEMA,
    canonical_geometry_satisfies_delta,
    install_static_geometry_extension,
)
from census.card_head.b1_exact12_structural import (
    B1SourceSafeCoverInstance,
    cells,
    compile_cell,
    source_safe_cube_ok,
)
from census.card_head.candidate_surface import build_model
from census.card_head.sat_encoding import CoverInstance

PROFILE = (5, 5, 5)
WAVE_THREE_CUBE = {
    0: (4, 5, 6, 11),
    1: (2, 6, 7, 8),
    2: (8, 9, 10, 11),
    3: (0, 2, 10, 11),
    4: (5, 7, 8, 11),
    5: (6, 7, 9, 11),
    6: (5, 7, 9, 10),
    7: (5, 6, 8, 10),
    8: (3, 4, 6, 10),
    9: (2, 3, 4, 11),
    10: (1, 2, 4, 5),
    11: (1, 2, 6, 9),
}


def wave_three_fixture():
    cell = next(
        islice(cells(profiles=(PROFILE,), class_cards=(5,)), 1, 2)
    )
    instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
    CoverInstance.__init__(
        instance,
        build_model(12, PROFILE),
        candidate_provider=lambda _model, center: (WAVE_THREE_CUBE[center],),
        cube_validator=source_safe_cube_ok,
    )
    compiled = compile_cell(instance, cell)
    equality_layout = install_static_equality_extension(instance, compiled)
    geometry_layout = install_static_geometry_extension(
        instance, compiled, equality_layout
    )
    return instance, compiled, equality_layout, geometry_layout


class B1Exact12StaticConvexTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        (
            cls.instance,
            cls.compiled,
            cls.equality_layout,
            cls.geometry_layout,
        ) = wave_three_fixture()
        if not canonical_geometry_satisfies_delta(
            cls.instance,
            cls.compiled,
            cls.equality_layout,
            cls.geometry_layout,
            WAVE_THREE_CUBE,
        ):
            raise AssertionError("wave-3 cube must survive the geometry prefix")
        cls.convex_layout = install_static_convex_extension(
            cls.instance,
            cls.compiled,
            cls.equality_layout,
            cls.geometry_layout,
        )

    def test_installs_frozen_convex_suffix(self) -> None:
        layout = self.convex_layout
        self.assertEqual(layout.added_variables, 0)
        self.assertEqual(layout.perpendicular_bisector_clauses, 7_920)
        self.assertEqual(layout.added_clauses, 7_920)

        manifest = layout.manifest()
        self.assertEqual(STATIC_CONVEX_SCHEMA, "p97_b1_exact12_static_convex.v8")
        self.assertEqual(STATIC_GEOMETRY_SCHEMA, "p97_b1_exact12_static_geometry.v8")
        self.assertEqual(self.geometry_layout.added_clauses, 760_326)
        self.assertEqual(manifest["schema"], STATIC_CONVEX_SCHEMA)
        self.assertEqual(manifest["parent"]["schema"], STATIC_GEOMETRY_SCHEMA)
        self.assertFalse(manifest["promotion_eligible"])
        self.assertEqual(
            manifest["source_clause_ledger"][0]["source_theorem"],
            "Problem97.Census554.EqualityCore."
            "false_of_convexIndep_of_perpBisectorCore",
        )
        self.assertIn("generic_labeled_convex_ingress", manifest["omitted_rules"])
        self.assertEqual(len(manifest["manifest_sha256"]), 64)

    def test_wave_three_survivor_hits_known_convex_clause(self) -> None:
        equality = self.equality_layout
        edge_index = {edge: index for index, edge in enumerate(equality.edges)}

        def edge(left: int, right: int) -> int:
            return edge_index[tuple(sorted((left, right)))]

        def relation(first: int, second: int) -> int:
            return equality.relation_variables[tuple(sorted((first, second)))]

        witness_clause = tuple(
            -relation(edge(point, 5), edge(point, 6))
            for point in (0, 7, 9)
        )
        self.assertIn(witness_clause, self.convex_layout.convex_clause_delta)
        positive = canonical_extension_assignment(
            self.instance,
            self.compiled,
            equality,
            WAVE_THREE_CUBE,
            allow_appended_clauses=True,
        )
        self.assertTrue(all(-literal in positive for literal in witness_clause))
        self.assertFalse(
            canonical_convex_satisfies_delta(
                self.instance,
                self.compiled,
                equality,
                self.geometry_layout,
                self.convex_layout,
                WAVE_THREE_CUBE,
            )
        )

    def test_install_and_replay_fail_closed_on_drift(self) -> None:
        with self.assertRaisesRegex(B1Exact12StaticConvexError, "already installed"):
            install_static_convex_extension(
                self.instance,
                self.compiled,
                self.equality_layout,
                self.geometry_layout,
            )
        with self.assertRaisesRegex(B1Exact12StaticConvexError, "hashes"):
            canonical_convex_satisfies_delta(
                self.instance,
                self.compiled,
                self.equality_layout,
                self.geometry_layout,
                replace(self.convex_layout, final_cnf_sha256="0" * 64),
                WAVE_THREE_CUBE,
            )


if __name__ == "__main__":
    unittest.main()
