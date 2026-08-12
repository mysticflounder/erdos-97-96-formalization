from __future__ import annotations

import unittest

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_next_row_static_equality import (
    canonical_extension_satisfies_delta as equality_extension_satisfies_delta,
)
from census.card_head.exact12_next_row_static_geometry import (
    EXPECTED_EQUILATERAL_BISECTOR_CLAUSES,
    STATIC_GEOMETRY_SCHEMA,
    canonical_extension_satisfies_delta,
    install_static_geometry_extension,
)
from census.card_head.exact12_next_row_valuation import cells, compile_cell
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)
from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _formalized_metric_core,
)

from .test_exact12_next_row_static_equality import DETECTOR_CLEAN_CUBE

EQUILATERAL_BISECTOR_CANARY = {
    0: [1, 2, 3, 4],
    1: [0, 2, 6, 8],
    2: [0, 1, 10, 11],
    3: [0, 1, 4, 5],
    4: [0, 3, 5, 7],
    5: [0, 2, 7, 10],
    6: [0, 3, 4, 9],
    7: [1, 5, 6, 8],
    8: [1, 6, 9, 10],
    9: [1, 3, 7, 11],
    10: [2, 7, 8, 11],
    11: [4, 5, 7, 9],
}


def formalized_stage(cube: dict[int, list[int]]) -> str | None:
    rows = [
        MetricRow(center=center, support=tuple(support), exact=False)
        for center, support in sorted(cube.items())
    ]
    certificate = _formalized_metric_core(rows, 12, tuple(range(12)))
    return None if certificate is None else str(certificate["stage"])


class Exact12NextRowStaticGeometryTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        compile_cell(cls.instance, cells()[0])
        cls.layout = install_static_geometry_extension(cls.instance)

    def test_frozen_counts_and_hashes(self) -> None:
        self.assertEqual(self.layout.manifest()["schema"], STATIC_GEOMETRY_SCHEMA)
        self.assertEqual(
            self.layout.equilateral_bisector_clauses,
            EXPECTED_EQUILATERAL_BISECTOR_CLAUSES,
        )
        self.assertEqual(self.layout.final_n_variables, 44_875)
        self.assertEqual(self.layout.final_n_clauses, 626_939)
        self.assertEqual(
            self.layout.final_cnf_sha256,
            "c720f44cfd99ad25c01d1dcd1bee62d213c608983e66d04e751958fd94d421dd",
        )
        self.assertEqual(
            self.layout.geometry_clause_delta_sha256,
            "dc07e3eff4dc21b32d38e4ca8e1225e90210db62ce306e615b01f969fa4bbb9b",
        )

    def test_clause_family_is_unique_negative_six_literal_relation_data(self) -> None:
        relation_variables = set(self.layout.equality.relation_variables.values())
        self.assertEqual(
            len(
                {
                    tuple(sorted(clause))
                    for clause in self.layout.geometry_clause_delta
                }
            ),
            EXPECTED_EQUILATERAL_BISECTOR_CLAUSES,
        )
        for clause in self.layout.geometry_clause_delta:
            self.assertEqual(len(clause), 6)
            self.assertEqual(len(set(clause)), 6)
            self.assertTrue(all(literal < 0 for literal in clause))
            self.assertTrue(all(-literal in relation_variables for literal in clause))

    def test_v1_canary_is_rejected_by_exact_new_stage(self) -> None:
        self.assertEqual(
            formalized_stage(EQUILATERAL_BISECTOR_CANARY),
            "equality-equilateral-bisector-collision",
        )
        self.assertTrue(
            equality_extension_satisfies_delta(
                self.instance,
                self.layout.equality,
                EQUILATERAL_BISECTOR_CANARY,
            )
        )
        self.assertFalse(
            canonical_extension_satisfies_delta(
                self.instance,
                self.layout,
                EQUILATERAL_BISECTOR_CANARY,
            )
        )

    def test_non_equilateral_cube_preserves_canonical_extension(self) -> None:
        self.assertNotEqual(
            formalized_stage(DETECTOR_CLEAN_CUBE),
            "equality-equilateral-bisector-collision",
        )
        self.assertTrue(
            canonical_extension_satisfies_delta(
                self.instance,
                self.layout,
                DETECTOR_CLEAN_CUBE,
            )
        )


if __name__ == "__main__":
    unittest.main()
