from __future__ import annotations

import unittest

from census.atail_force import distinct_equality_witness as witness
from census.atail_force import three_center_surface as surface


class DistinctEqualityWitnessTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        _report, cls.classes = surface.load_inventory()

    def test_exact_distinct_witness_for_low_and_high_support_rows(self) -> None:
        rows = [
            min(self.classes, key=lambda joint: joint.interior_point_count),
            max(self.classes, key=lambda joint: joint.interior_point_count),
        ]
        for joint in rows:
            with self.subTest(class_id=joint.class_id):
                result = witness.find_witness(
                    joint, surface.canonical_decoration(joint)
                )
                self.assertIn("substitutions", result)
if __name__ == "__main__":
    unittest.main()
