from __future__ import annotations

import unittest
from types import SimpleNamespace

from census.card_head.candidate_surface import build_model
from census.card_head.sat_encoding import EncodingError
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
)
from census.card_head.source_faithful_five_omission import (
    SOURCE_FAITHFUL_FIVE_OMISSION_SCHEMA,
    FiveOmissionWitness,
    SourceFaithfulFiveOmissionInstance,
)

SAT_CUBE = {
    0: [4, 5, 9, 11],
    1: [7, 8, 9, 11],
    2: [5, 8, 10, 11],
    3: [6, 8, 9, 10],
    4: [6, 7, 10, 11],
    5: [4, 7, 9, 10],
    6: [4, 5, 7, 8],
    7: [3, 5, 6, 9],
    8: [3, 4, 6, 11],
    9: [2, 5, 6, 7],
    10: [2, 4, 6, 8],
    11: [2, 3, 5, 10],
}


class SourceFaithfulFiveOmissionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.instance = SourceFaithfulFiveOmissionInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )

    def positive_variables(
        self,
        *,
        deleted: int = 2,
        blocker: int = 9,
        centers: tuple[int, ...] = (0, 1, 2, 3, 4),
    ) -> set[int]:
        positive = {
            self.instance.choice_variables[
                (center, self.instance.candidate_index(center, candidate))
            ]
            for center, candidate in SAT_CUBE.items()
        }
        positive.add(self.instance.deleted_variables[deleted])
        positive.add(self.instance.blocker_variables[blocker])
        positive.update(self.instance.center_variables[center] for center in centers)
        return positive

    def test_constructor_rejects_non_exact_twelve_models(self) -> None:
        with self.assertRaisesRegex(EncodingError, "only for exact-12"):
            SourceFaithfulFiveOmissionInstance(SimpleNamespace(cardinality=11))

    def test_separate_schema_preserves_frozen_base_anchor(self) -> None:
        self.assertEqual(
            SOURCE_FAITHFUL_FIVE_OMISSION_SCHEMA,
            "p97_rigid221_exact12_source_safe_five_omission.v1",
        )
        self.assertEqual(self.instance.base_n_variables, 42560)
        self.assertEqual(self.instance.base_n_clauses, 368075)
        self.assertEqual(self.instance.five_omission_n_variables, 42680)
        self.assertEqual(self.instance.five_omission_n_clauses, 405266)
        self.assertEqual(
            self.instance.deleted_variables,
            {label: 42561 + label for label in range(12)},
        )
        self.assertEqual(
            self.instance.blocker_variables,
            {label: 42573 + label for label in range(12)},
        )
        self.assertEqual(
            self.instance.center_variables,
            {label: 42585 + label for label in range(12)},
        )

    def test_known_same_cube_boundary_decodes_and_replays(self) -> None:
        cube, witness = self.instance.decode_model_and_boundary(
            self.positive_variables()
        )
        self.assertEqual(cube, SAT_CUBE)
        self.assertEqual(
            witness,
            FiveOmissionWitness(2, 9, (0, 1, 2, 3, 4)),
        )

    def test_decoder_rejects_role_distinctness_failures(self) -> None:
        with self.assertRaisesRegex(EncodingError, "five-omission replay"):
            self.instance.decode_boundary_witness(self.positive_variables(blocker=2))
        with self.assertRaisesRegex(EncodingError, "five-omission replay"):
            self.instance.decode_boundary_witness(self.positive_variables(blocker=0))

    def test_decoder_rejects_malformed_positive_assignments(self) -> None:
        positive = tuple(self.positive_variables())
        with self.assertRaisesRegex(EncodingError, "duplicate"):
            self.instance.decode_boundary_witness((*positive, positive[0]))
        with self.assertRaisesRegex(EncodingError, "non-integer"):
            self.instance.decode_boundary_witness((*positive, True))
        with self.assertRaisesRegex(EncodingError, "out-of-range"):
            self.instance.decode_boundary_witness((*positive, 0))
        with self.assertRaisesRegex(EncodingError, "out-of-range"):
            self.instance.decode_boundary_witness(
                (*positive, self.instance.cnf.n_variables + 1)
            )

    def test_incidence_clauses_use_exact_choice_variables(self) -> None:
        clauses = set(self.instance.cnf.clauses)
        deleted_variable = self.instance.deleted_variables[2]

        blocker_choice = self.instance.choice_variables[
            (9, self.instance.candidate_index(9, SAT_CUBE[9]))
        ]
        self.assertNotIn(
            (
                -deleted_variable,
                -self.instance.blocker_variables[9],
                -blocker_choice,
            ),
            clauses,
        )

        omitted_choice = self.instance.choice_variables[
            (0, self.instance.candidate_index(0, SAT_CUBE[0]))
        ]
        self.assertNotIn(
            (
                -deleted_variable,
                -self.instance.center_variables[0],
                -omitted_choice,
            ),
            clauses,
        )

        containing_index = next(
            index
            for index, candidate in enumerate(self.instance.candidates[0])
            if 2 in candidate
        )
        containing_choice = self.instance.choice_variables[(0, containing_index)]
        self.assertIn(
            (
                -deleted_variable,
                -self.instance.center_variables[0],
                -containing_choice,
            ),
            clauses,
        )

        missing_index = next(
            index
            for index, candidate in enumerate(self.instance.candidates[9])
            if 2 not in candidate
        )
        missing_choice = self.instance.choice_variables[(9, missing_index)]
        self.assertIn(
            (
                -deleted_variable,
                -self.instance.blocker_variables[9],
                -missing_choice,
            ),
            clauses,
        )

    def test_selector_clauses_forbid_role_collisions(self) -> None:
        clauses = set(self.instance.cnf.clauses)
        for label in range(12):
            self.assertIn(
                (
                    -self.instance.deleted_variables[label],
                    -self.instance.blocker_variables[label],
                ),
                clauses,
            )
            self.assertIn(
                (
                    -self.instance.blocker_variables[label],
                    -self.instance.center_variables[label],
                ),
                clauses,
            )


if __name__ == "__main__":
    unittest.main()
