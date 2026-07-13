from __future__ import annotations

import json
import unittest

from census.atail_force import distinct_equality_checkpoint as checkpoint


class DistinctEqualityCheckpointTests(unittest.TestCase):
    def test_committed_checkpoint_records_complete_negative_surface(self) -> None:
        document = json.loads(
            checkpoint.DEFAULT_CHECKPOINT.read_text(encoding="utf-8")
        )
        self.assertEqual(document["replay"]["raw_equality_skeletons"], 343)
        self.assertEqual(document["replay"]["exact_equations_verified"], 4802)
        self.assertEqual(
            document["verdict"]["bare_or_saturated_equality_route"],
            "DONE_NEGATIVE",
        )
        self.assertFalse(
            document["scope"]["disk_nonobtuse_cap_and_order_inequalities"]
        )
        self.assertFalse(document["scope"]["full_filter_shared_radius_pair"])
if __name__ == "__main__":
    unittest.main()
