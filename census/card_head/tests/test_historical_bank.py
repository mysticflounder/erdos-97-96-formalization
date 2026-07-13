from __future__ import annotations

import json
import unittest

from census.card_head.candidate_surface import build_model
from census.card_head.historical_bank import (
    canonical_pattern_key,
    image_pattern,
    normalize_pattern,
    pattern_orbit,
    profile_automorphisms,
    window_shape_canon,
)


class HistoricalBankStructureTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.model = build_model(12, (6, 5, 4))
        cls.pattern = {
            4: {5, 9, 10},
            5: {4, 10},
            9: {4, 5},
            10: {4, 9},
        }

    def test_654_automorphism_count_and_orbit_match_historical_row_zero(self):
        self.assertEqual(len(profile_automorphisms(self.model)), 288)
        self.assertEqual(len(pattern_orbit(self.model, self.pattern)), 72)

    def test_shape_canon_matches_historical_row_zero(self):
        expected = "[[0,[1,3]],[1,[2,3]],[2,[0,3]],[3,[0,1,2]]]"
        actual = json.dumps(window_shape_canon(self.pattern), separators=(",", ":"))
        self.assertEqual(actual, expected)

    def test_canonical_key_is_invariant_under_every_profile_automorphism(self):
        expected = canonical_pattern_key(self.model, self.pattern)
        for mapping in profile_automorphisms(self.model):
            with self.subTest(mapping=mapping):
                image = image_pattern(self.pattern, mapping)
                self.assertEqual(canonical_pattern_key(self.model, image), expected)

    def test_normalization_rejects_a_center_inside_its_mask(self):
        with self.assertRaisesRegex(ValueError, "contains its center"):
            normalize_pattern(self.model, {4: [4, 5]})


if __name__ == "__main__":
    unittest.main()
