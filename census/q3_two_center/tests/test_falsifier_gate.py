from __future__ import annotations

import os
import unittest

from census.q3_two_center import falsifier_gate


class FalsifierGateTests(unittest.TestCase):
    def test_banked_inputs_are_tracked_at_runtime_path(self) -> None:
        missing = [
            path for _tag, path in falsifier_gate.FILES if not os.path.isfile(path)
        ]
        self.assertEqual(missing, [])

    def test_banked_witnesses_do_not_falsify_q3_kills(self) -> None:
        result = falsifier_gate.run_gate(emit=False)
        self.assertEqual(result["configurations"], 9)
        self.assertEqual(result["nonobtuse_triangles"], 396)
        self.assertEqual(result["findings"], [])


if __name__ == "__main__":
    unittest.main()
