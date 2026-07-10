from __future__ import annotations

import unittest

from census.census_554 import cover_probe_smoke
from census.census_554.combinatorics import AUTOMORPHISMS


class CombinatoricsTests(unittest.TestCase):
    def test_profile_group_has_72_distinct_elements(self):
        self.assertEqual(len(AUTOMORPHISMS), 72)
        self.assertEqual(len(set(AUTOMORPHISMS)), 72)

    def test_self_contained_smoke(self):
        self.assertEqual(cover_probe_smoke.main(), 0)


if __name__ == "__main__":
    unittest.main()
