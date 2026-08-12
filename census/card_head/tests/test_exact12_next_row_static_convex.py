from __future__ import annotations

import hashlib
import unittest

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_next_row_static_convex import (
    EXPECTED_PERP_BISECTOR_CLAUSES,
    LABEL_SCOPE,
    STATIC_CONVEX_SCHEMA,
    Exact12NextRowStaticConvexError,
    canonical_extension_satisfies_delta,
    install_static_convex_arm_extension,
    install_static_convex_extension,
)
from census.card_head.exact12_next_row_static_geometry import (
    canonical_extension_satisfies_delta as geometry_extension_satisfies_delta,
)
from census.card_head.exact12_next_row_static_geometry import (
    install_static_geometry_extension,
)
from census.card_head.exact12_next_row_valuation import (
    arm_cells,
    cells,
    compile_arm_cell,
    compile_cell,
)
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

from .test_exact12_next_row_static_equality import DETECTOR_CLEAN_CUBE

PERP_BISECTOR_CANARY = {
    0: [1, 2, 3, 4],
    1: [0, 2, 6, 8],
    2: [0, 1, 10, 11],
    3: [0, 1, 4, 5],
    4: [0, 3, 5, 7],
    5: [0, 6, 7, 9],
    6: [0, 3, 9, 10],
    7: [1, 5, 6, 8],
    8: [1, 6, 9, 10],
    9: [0, 2, 4, 11],
    10: [2, 5, 7, 8],
    11: [3, 4, 7, 9],
}


def fresh_cell_zero():
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_cell(instance, cells()[0])
    return instance, compiled


def fresh_arm_cell_zero():
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_arm_cell(instance, arm_cells()[0])
    return instance, compiled


class StaticConvexTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.instance, cls.compiled = fresh_cell_zero()
        cls.layout = install_static_convex_extension(cls.instance, cls.compiled)

    def test_install_requires_the_compiled_next_row_contract(self) -> None:
        instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        with self.assertRaisesRegex(
            Exact12NextRowStaticConvexError, "compile_cell must run"
        ):
            install_static_convex_extension(instance)

    def test_frozen_manifest_and_clause_shape(self) -> None:
        manifest = self.layout.manifest()
        self.assertEqual(manifest["schema"], STATIC_CONVEX_SCHEMA)
        self.assertEqual(manifest["label_scope"], LABEL_SCOPE)
        self.assertEqual(
            self.layout.perpendicular_bisector_clauses,
            EXPECTED_PERP_BISECTOR_CLAUSES,
        )
        self.assertEqual(len(self.layout.convex_clause_delta), 7_920)
        self.assertEqual(self.layout.final_n_variables, 44_875)
        self.assertEqual(self.layout.final_n_clauses, 634_859)
        self.assertEqual(
            self.layout.convex_clause_delta_sha256,
            "49e6e5d5b8b4c68f7bccb0356d5bf38ce9ee25b0397fe555a00f9cddb2fbafa2",
        )
        self.assertEqual(
            self.layout.final_cnf_sha256,
            "0d4ab5fa17a63ef862533615eb534b0fb4be5892052788e2a47477e7bd250ff9",
        )
        self.assertTrue(
            all(
                len(clause) == 3
                and len(set(clause)) == 3
                and all(literal < 0 for literal in clause)
                for clause in self.layout.convex_clause_delta
            )
        )
        self.assertEqual(
            len(
                {
                    tuple(sorted(clause))
                    for clause in self.layout.convex_clause_delta
                }
            ),
            7_920,
        )
        self.assertEqual(
            self.layout.final_cnf_sha256,
            hashlib.sha256(self.instance.dimacs().encode("ascii")).hexdigest(),
        )

    def test_v2_canary_is_rejected_by_v3(self) -> None:
        v2_instance, _ = fresh_cell_zero()
        v2_layout = install_static_geometry_extension(v2_instance)
        self.assertTrue(
            geometry_extension_satisfies_delta(
                v2_instance, v2_layout, PERP_BISECTOR_CANARY
            )
        )
        self.assertFalse(
            canonical_extension_satisfies_delta(
                self.instance, self.layout, PERP_BISECTOR_CANARY
            )
        )

    def test_detector_clean_cube_survives_v3(self) -> None:
        self.assertTrue(
            canonical_extension_satisfies_delta(
                self.instance, self.layout, DETECTOR_CLEAN_CUBE
            )
        )

    def test_fixed_arm_suffix_can_install_the_same_static_layers(self) -> None:
        instance, compiled = fresh_arm_cell_zero()
        pre_static_clauses = compiled.final_n_clauses
        layout = install_static_convex_arm_extension(instance, compiled)
        self.assertEqual(
            layout.final_n_clauses - pre_static_clauses,
            266_400,
        )
        self.assertEqual(
            layout.final_n_variables - compiled.final_n_variables,
            2_145,
        )
        self.assertEqual(
            layout.final_cnf_sha256,
            hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest(),
        )


if __name__ == "__main__":
    unittest.main()
