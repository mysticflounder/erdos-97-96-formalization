# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import unittest

from census.global_confinement.metric_realizability_cvc5_core_miner import (
    _classify_crosscheck,
)


class MetricRealizabilityCvc5CoreMinerTests(unittest.TestCase):
    def test_crosscheck_classification(self) -> None:
        self.assertEqual(
            _classify_crosscheck("UNSAT", "UNSAT"), "CROSSCHECKED_UNSAT"
        )
        self.assertEqual(
            _classify_crosscheck("UNSAT", "UNKNOWN"),
            "CVC5_UNSAT_Z3_UNKNOWN",
        )
        self.assertEqual(
            _classify_crosscheck("UNSAT", "SAT"), "SOLVER_DISAGREEMENT"
        )
        self.assertEqual(
            _classify_crosscheck("UNKNOWN", "UNSAT"), "CORE_NOT_REVALIDATED"
        )


if __name__ == "__main__":
    unittest.main()
