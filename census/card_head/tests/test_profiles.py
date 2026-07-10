from __future__ import annotations

import math
import unittest

from census.card_head.profiles import labeled_cap_profiles


EXPECTED = {
    12: ((5, 5, 5), (5, 6, 4), (6, 5, 4)),
    13: (
        (5, 5, 6),
        (5, 6, 5),
        (5, 7, 4),
        (6, 5, 5),
        (6, 6, 4),
        (7, 5, 4),
    ),
    14: (
        (5, 5, 7),
        (5, 6, 6),
        (5, 7, 5),
        (5, 8, 4),
        (6, 5, 6),
        (6, 6, 5),
        (6, 7, 4),
        (7, 5, 5),
        (7, 6, 4),
        (8, 5, 4),
    ),
}


class LabeledProfileTests(unittest.TestCase):
    def test_exact_card_12_through_14_surface(self):
        for n, expected in EXPECTED.items():
            with self.subTest(n=n):
                self.assertEqual(labeled_cap_profiles(n), expected)

    def test_count_is_weak_composition_count(self):
        for n in range(11, 25):
            excess = n + 3 - (5 + 5 + 4)
            expected = 0 if excess < 0 else math.comb(excess + 2, 2)
            self.assertEqual(len(labeled_cap_profiles(n)), expected)

    def test_every_profile_has_exact_declared_constraints(self):
        for n in range(11, 25):
            for first, second, third in labeled_cap_profiles(n):
                self.assertGreaterEqual(first, 5)
                self.assertGreaterEqual(second, 5)
                self.assertGreaterEqual(third, 4)
                self.assertEqual(first + second + third, n + 3)


if __name__ == "__main__":
    unittest.main()
