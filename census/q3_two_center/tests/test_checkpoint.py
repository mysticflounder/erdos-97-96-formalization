from __future__ import annotations

import unittest

from census.q3_two_center import checkpoint


class CheckpointTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.document = checkpoint.build_checkpoint()

    def test_checkpoint_replays_complete_negative_q3_surface(self) -> None:
        document = self.document
        classification = document["classification"]
        self.assertEqual(classification["mirror_reduced_classes"], 87)
        self.assertEqual(classification["exact_rational_realizations"], 68)
        self.assertEqual(classification["exact_qsqrt3_realizations"], 4)
        self.assertEqual(classification["reported_killed_proven"], 15)
        self.assertEqual(classification["unclassified"], 0)
        self.assertEqual(
            document["verdict"]["atail_q3"],
            "DONE_NEGATIVE_WITHIN_STATED_SURFACES",
        )
        self.assertEqual(document["verdict"]["atail_force"], "OPEN_RESEARCH")

    def test_committed_checkpoint_is_current(self) -> None:
        expected = checkpoint._canonical(self.document)
        actual = checkpoint.DEFAULT_CHECKPOINT.read_text(encoding="utf-8")
        self.assertEqual(actual, expected)


if __name__ == "__main__":
    unittest.main()
