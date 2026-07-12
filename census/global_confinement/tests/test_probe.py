# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import unittest

from census.global_confinement import probe


class GlobalConfinementProbeTests(unittest.TestCase):
    def test_first_n11_dangerous_row_regression(self) -> None:
        result = probe._dangerous_job((11, 0, (1, 2, 3, 4), 200_000))
        self.assertEqual(result["base"]["status"], "SAT")
        self.assertEqual(
            result["critical_center_counts"],
            {"SAT": 8, "UNSAT": 1, "INDETERMINATE": 0},
        )
        self.assertEqual(
            result["survival_counts"],
            {"SAT": 13, "UNSAT": 7, "INDETERMINATE": 0},
        )
        self.assertEqual(
            result["confinement_counts"],
            {"SAT": 0, "UNSAT": 20, "INDETERMINATE": 0},
        )


if __name__ == "__main__":
    unittest.main()
