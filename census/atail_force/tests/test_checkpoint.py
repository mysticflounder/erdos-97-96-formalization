from __future__ import annotations

import unittest

from census.atail_force import checkpoint


class SurfaceCheckpointTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.document = checkpoint.build_checkpoint()

    def test_checkpoint_is_an_explicit_no_solver_preflight(self) -> None:
        document = self.document
        self.assertEqual(document["inventory"]["class_count"], 3375)
        self.assertGreater(document["order_surface"]["decorated_systems"], 3375)
        self.assertEqual(
            document["verdict"]["atail_force_surface"],
            "PREFLIGHT_COMPLETE_NO_SOLVER_RUN",
        )
        self.assertEqual(document["verdict"]["atail_force"], "OPEN_RESEARCH")
        self.assertEqual(document["exact_reduction"]["class_action"]["orbits"], 590)
        self.assertEqual(
            document["exact_reduction"]["equality_skeletons"]["s3_orbits"],
            70,
        )
        self.assertEqual(
            document["bare_equality_surface"]["exact_qsqrt3_collapsed_witnesses"],
            343,
        )
        self.assertFalse(
            document["bare_equality_surface"]["bare_equality_ideal_can_be_empty"]
        )
        self.assertFalse(document["scope"]["geometric_solver_invoked"])
        self.assertFalse(document["scope"]["full_filter_shared_radius_pair"])

    def test_committed_checkpoint_is_current(self) -> None:
        expected = checkpoint._canonical(self.document)
        actual = checkpoint.DEFAULT_CHECKPOINT.read_text(encoding="utf-8")
        self.assertEqual(actual, expected)


if __name__ == "__main__":
    unittest.main()
