from __future__ import annotations

import unittest

from census.card_head.candidate_surface import (
    CandidateSurfaceError,
    build_model,
    candidate_class_ok,
    candidate_classes,
    cube_ok,
)
from census.card_head.sat_encoding import CoverInstance, EncodingError
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
    SOURCE_FAITHFUL_EXCLUDED_RULES,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SOURCE_THEOREM_PROFILE,
    SourceFaithfulCoverInstance,
    source_faithful_candidate_class_ok,
    source_faithful_candidate_classes,
    source_faithful_cube_ok,
)


class SourceFaithfulCandidateSurfaceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.model = build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)

    def test_schema_names_exact12_contract_and_unsupported_rules(self):
        self.assertEqual(
            SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
            "p97_rigid221_exact12_source_safe_candidate.v1",
        )
        self.assertEqual(SOURCE_FAITHFUL_PYTHON_PROFILE, (5, 6, 4))
        self.assertEqual(SOURCE_THEOREM_PROFILE, (5, 4, 6))
        self.assertIn(
            "mixed_moser_ge_2_same_cap_ge_1",
            SOURCE_FAITHFUL_EXCLUDED_RULES,
        )
        self.assertLessEqual(
            {
                "probe_physical_apex_membership",
                "probe_physical_circle_C2",
                "probe_physical_pair_at_most_one",
                "probe_physical_blocker_injectivity",
            },
            set(SOURCE_FAITHFUL_EXCLUDED_RULES),
        )

    def test_representative_mixed_row_is_source_safe_only(self):
        center = 3
        mixed_row = (0, 1, 4, 5)
        self.assertTrue(
            source_faithful_candidate_class_ok(self.model, center, mixed_row)
        )
        self.assertFalse(candidate_class_ok(self.model, center, mixed_row))
        safe = set(source_faithful_candidate_classes(self.model, center))
        historical = set(candidate_classes(self.model, center))
        self.assertLess(historical, safe)
        self.assertIn(mixed_row, safe - historical)

    def test_malformed_inputs_are_rejected(self):
        row = (0, 1, 4, 5)
        for center in (-1, 12):
            with self.subTest(center=center):
                self.assertFalse(
                    source_faithful_candidate_class_ok(self.model, center, row)
                )
                with self.assertRaisesRegex(
                    CandidateSurfaceError, "outside the model"
                ):
                    source_faithful_candidate_classes(self.model, center)
        self.assertFalse(
            source_faithful_candidate_class_ok(self.model, 3, row[:-1])
        )
        self.assertFalse(
            source_faithful_candidate_class_ok(self.model, 3, (*row, 8))
        )
        self.assertFalse(source_faithful_cube_ok(self.model, {3: row}))
        self.assertFalse(cube_ok(self.model, {3: row}))
        with self.assertRaisesRegex(CandidateSurfaceError, "frozen profile"):
            SourceFaithfulCoverInstance(build_model(13, (5, 5, 6)))
        with self.assertRaisesRegex(CandidateSurfaceError, "frozen profile"):
            SourceFaithfulCoverInstance(build_model(12, (6, 5, 4)))

    def test_instances_index_different_surfaces(self):
        mixed_row = (0, 1, 4, 5)
        historical = CoverInstance(self.model)
        safe = SourceFaithfulCoverInstance(self.model)
        with self.assertRaisesRegex(EncodingError, "absent"):
            historical.candidate_index(3, mixed_row)
        safe_index = safe.candidate_index(3, mixed_row)
        self.assertEqual(safe.candidates[3][safe_index], mixed_row)

    def test_frozen_table_and_base_cnf_anchors(self):
        safe = SourceFaithfulCoverInstance(self.model)
        self.assertEqual(
            [len(safe.candidates[center]) for center in range(12)],
            [53, 101, 20, 322, 322, 322, 314, 314, 314, 314, 322, 322],
        )
        self.assertEqual(len(safe.choice_variables), 3040)
        self.assertEqual(safe.base_n_variables, 42560)
        self.assertEqual(safe.base_n_clauses, 368075)
        self.assertEqual(safe.n_c2_clauses, 268031)

    def test_cover_instance_defaults_preserve_historical_behavior(self):
        historical = CoverInstance(self.model)
        self.assertIs(historical.candidate_provider, candidate_classes)
        self.assertIs(historical.cube_validator, cube_ok)
        self.assertEqual(historical.candidates[3], candidate_classes(self.model, 3))


if __name__ == "__main__":
    unittest.main()
