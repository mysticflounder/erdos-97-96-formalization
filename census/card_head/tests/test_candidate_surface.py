from __future__ import annotations

import json
import math
import unittest
from pathlib import Path

from census.card_head.candidate_surface import (
    MOSER,
    CandidateSurfaceError,
    build_model,
    candidate_class_ok,
    candidate_classes,
    candidate_count_fixture_document,
    role_candidate_counts,
    validate_candidate_count_fixtures,
)
from census.card_head.profiles import labeled_cap_profiles


REPO_ROOT = Path(__file__).parents[3]
FIXTURE_PATH = REPO_ROOT / "census/card_head/candidate_count_fixtures.json"

HISTORICAL_N12_ALL = {
    (6, 5, 4): {
        "U": 101,
        "V": 53,
        "W": 20,
        "S_INTERIOR": 260,
        "O1_INTERIOR": 283,
        "O2_INTERIOR": 301,
    },
    (5, 6, 4): {
        "U": 53,
        "V": 101,
        "W": 20,
        "S_INTERIOR": 283,
        "O1_INTERIOR": 260,
        "O2_INTERIOR": 301,
    },
    (5, 5, 5): {
        "U": 56,
        "V": 56,
        "W": 56,
        "S_INTERIOR": 283,
        "O1_INTERIOR": 283,
        "O2_INTERIOR": 283,
    },
}


def closed_form_count(model, center):
    if center in MOSER:
        containing = [cap - {center} for cap in model.caps if center in cap]
        if len(containing) != 2 or containing[0] & containing[1]:
            raise AssertionError("Moser-center cap partition is malformed")
        remainder = (
            set(range(model.cardinality))
            - {center}
            - containing[0]
            - containing[1]
        )
        return sum(
            math.comb(len(containing[0]), first)
            * math.comb(len(containing[1]), second)
            * math.comb(len(remainder), 4 - first - second)
            for first in range(2)
            for second in range(2)
            if 0 <= 4 - first - second <= len(remainder)
        )

    same = model.own_cap_interior(center)
    foreign = set(range(model.cardinality)) - MOSER - {center} - same
    return sum(
        math.comb(3, moser_count)
        * math.comb(len(same), same_count)
        * math.comb(len(foreign), 4 - moser_count - same_count)
        for moser_count in range(3)
        for same_count in range(3)
        if not (moser_count >= 2 and same_count >= 1)
        and 0 <= 4 - moser_count - same_count <= len(foreign)
    )


class CandidateSurfaceTests(unittest.TestCase):
    def test_card12_port_matches_every_historical_all_count(self):
        for profile, expected in HISTORICAL_N12_ALL.items():
            with self.subTest(profile=profile):
                self.assertEqual(role_candidate_counts(build_model(12, profile)), expected)

    def test_enumerated_counts_match_independent_closed_form(self):
        for cardinality in (12, 13, 14):
            for profile in labeled_cap_profiles(cardinality):
                model = build_model(cardinality, profile)
                for center in range(cardinality):
                    with self.subTest(
                        cardinality=cardinality, profile=profile, center=center
                    ):
                        self.assertEqual(
                            len(candidate_classes(model, center)),
                            closed_form_count(model, center),
                        )

    def test_post_sub2_cut_semantics_do_not_decide_s2_position(self):
        model = build_model(12, (6, 5, 4))
        center = 3
        self.assertTrue(candidate_class_ok(model, center, (4, 5, 7, 10)))
        self.assertFalse(candidate_class_ok(model, center, (4, 5, 6, 7)))
        self.assertTrue(candidate_class_ok(model, center, (0, 1, 7, 10)))
        self.assertFalse(candidate_class_ok(model, center, (0, 1, 4, 7)))

    def test_committed_fixture_is_exactly_regenerated(self):
        loaded = json.loads(FIXTURE_PATH.read_text(encoding="utf-8"))
        self.assertEqual(validate_candidate_count_fixtures(loaded), loaded)
        self.assertEqual(loaded, candidate_count_fixture_document())

    def test_fixture_tampering_is_rejected(self):
        document = candidate_count_fixture_document()
        document["profiles"][0]["candidate_total"] += 1
        with self.assertRaisesRegex(CandidateSurfaceError, "differ"):
            validate_candidate_count_fixtures(document)


if __name__ == "__main__":
    unittest.main()
