from __future__ import annotations

import unittest

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_next_row_static_equality import (
    EXPECTED_DUPLICATE_CENTER_CLAUSES,
    EXPECTED_RELATION_VARIABLES,
    EXPECTED_ROW_IMPLICATION_CLAUSES,
    EXPECTED_TRANSITIVITY_CLAUSES,
    Exact12NextRowStaticEqualityError,
    canonical_extension_satisfies_delta,
    install_static_duplicate_center_extension,
)
from census.card_head.exact12_next_row_valuation import cells, compile_cell
from census.card_head.sat_encoding import CoverInstance
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)
from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _duplicate_center_core,
)

DUPLICATE_CENTER_CUBE = {
    0: [1, 2, 3, 4],
    1: [0, 2, 6, 8],
    2: [0, 1, 10, 11],
    3: [0, 1, 4, 5],
    4: [0, 2, 3, 5],
    5: [0, 3, 4, 6],
    6: [0, 7, 8, 10],
    7: [1, 3, 6, 8],
    8: [1, 5, 6, 9],
    9: [1, 2, 7, 8],
    10: [0, 7, 9, 11],
    11: [1, 7, 9, 10],
}

# Preserved SAT witness from the scratch full-static cell-8 benchmark.  It is
# used only to check the duplicate-center extension, not as closure evidence.
DETECTOR_CLEAN_CUBE = {
    0: [2, 3, 5, 11],
    1: [0, 2, 6, 8],
    2: [4, 6, 10, 11],
    3: [2, 4, 8, 10],
    4: [0, 1, 5, 6],
    5: [1, 2, 3, 10],
    6: [1, 5, 10, 11],
    7: [1, 3, 6, 8],
    8: [3, 5, 6, 9],
    9: [0, 2, 4, 5],
    10: [0, 1, 7, 9],
    11: [0, 3, 4, 7],
}


def duplicate_center_core(cube: dict[int, list[int]]):
    rows = [
        MetricRow(center=center, support=tuple(support), exact=False)
        for center, support in sorted(cube.items())
    ]
    return _duplicate_center_core(rows, 12)


class Exact12NextRowStaticEqualityTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        compile_cell(cls.instance, cells()[0])
        cls.layout = install_static_duplicate_center_extension(cls.instance)

    def test_frozen_counts_and_hashes(self) -> None:
        self.assertEqual(
            (
                self.layout.added_variables,
                self.layout.row_implication_clauses,
                self.layout.transitivity_clauses,
                self.layout.duplicate_center_clauses,
                self.layout.added_clauses,
            ),
            (
                EXPECTED_RELATION_VARIABLES,
                EXPECTED_ROW_IMPLICATION_CLAUSES,
                EXPECTED_TRANSITIVITY_CLAUSES,
                EXPECTED_DUPLICATE_CENTER_CLAUSES,
                163_440,
            ),
        )
        self.assertEqual(
            self.layout.initial_cnf_sha256,
            "59ebf477a00c92024813911daea844a58666f13b8e7e2364b4abddf389edfa28",
        )
        self.assertEqual(
            self.layout.final_cnf_sha256,
            "a82658d05be2d05027923e5da2d0c02e6081e0e5545ec24eee11efac89590498",
        )
        self.assertEqual(
            self.layout.clause_delta_sha256,
            "bca24367d5601a5870432b568848717ea50a0dcb703be03b74cefcfcbc799b83",
        )
        self.assertEqual(
            self.layout.relation_variable_map_sha256,
            "dcfdc234786f80c82200eea5f7be2cc7627a5bb0dae01372a3e3d919874e6fee",
        )

    def test_canonical_extension_matches_duplicate_center_detector(self) -> None:
        self.assertIsNotNone(duplicate_center_core(DUPLICATE_CENTER_CUBE))
        self.assertFalse(
            canonical_extension_satisfies_delta(
                self.instance, self.layout, DUPLICATE_CENTER_CUBE
            )
        )
        self.assertIsNone(duplicate_center_core(DETECTOR_CLEAN_CUBE))
        self.assertTrue(
            canonical_extension_satisfies_delta(
                self.instance, self.layout, DETECTOR_CLEAN_CUBE
            )
        )

    def test_clause_families_have_the_expected_literal_semantics(self) -> None:
        edge_index = {edge: index for index, edge in enumerate(self.layout.edges)}

        def edge(left: int, right: int) -> int:
            return edge_index[tuple(sorted((left, right)))]

        def equality(left: int, right: int) -> int:
            return self.layout.relation_variables[tuple(sorted((left, right)))]

        row = self.instance.candidates[0][0]
        choice = self.instance.choice_variables[(0, 0)]
        first_edge = edge(0, row[0])
        second_edge = edge(0, row[1])
        self.assertIn(
            (-choice, equality(first_edge, second_edge)),
            self.layout.clause_delta,
        )

        eq01 = equality(0, 1)
        eq02 = equality(0, 2)
        eq12 = equality(1, 2)
        self.assertIn((-eq01, -eq12, eq02), self.layout.clause_delta)

        duplicate_clause = tuple(
            -variable
            for variable in (
                equality(edge(0, 2), edge(0, 3)),
                equality(edge(0, 2), edge(0, 4)),
                equality(edge(1, 2), edge(1, 3)),
                equality(edge(1, 2), edge(1, 4)),
            )
        )
        self.assertIn(duplicate_clause, self.layout.clause_delta)

    def test_detector_equivalence_on_deterministic_candidate_sample(self) -> None:
        for offset in range(12):
            cube = {
                center: list(
                    self.instance.candidates[center][
                        (7 * center + offset) % len(self.instance.candidates[center])
                    ]
                )
                for center in range(12)
            }
            with self.subTest(offset=offset):
                self.assertEqual(
                    canonical_extension_satisfies_delta(
                        self.instance, self.layout, cube
                    ),
                    duplicate_center_core(cube) is None,
                )

    def test_layout_is_deterministic_and_variable_map_is_immutable(self) -> None:
        duplicate = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        compile_cell(duplicate, cells()[0])
        duplicate_layout = install_static_duplicate_center_extension(duplicate)
        self.assertEqual(duplicate_layout.clause_delta, self.layout.clause_delta)
        self.assertEqual(
            duplicate_layout.manifest()["hashes"], self.layout.manifest()["hashes"]
        )
        with self.assertRaises(TypeError):
            self.layout.relation_variables[(0, 1)] = 1  # type: ignore[index]

    def test_installation_is_single_use_and_precedes_pattern_banks(self) -> None:
        with self.assertRaisesRegex(
            Exact12NextRowStaticEqualityError, "already installed"
        ):
            install_static_duplicate_center_extension(self.instance)

        banked = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        compile_cell(banked, cells()[0])
        banked.add_pattern_instance({0: {1}})
        with self.assertRaisesRegex(
            Exact12NextRowStaticEqualityError, "before any learned pattern bank"
        ):
            install_static_duplicate_center_extension(banked)

    def test_generic_cover_instance_is_rejected(self) -> None:
        generic = CoverInstance(build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE))
        with self.assertRaisesRegex(
            Exact12NextRowStaticEqualityError, "source-faithful candidate class"
        ):
            install_static_duplicate_center_extension(generic)  # type: ignore[arg-type]


if __name__ == "__main__":
    unittest.main()
