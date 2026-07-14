from __future__ import annotations

import copy
import unittest

from census.atail_force import producer_pattern_census_round2 as round2
from census.atail_force import producer_surface as surface


class ProducerPatternCensusRound2Tests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.selected = {
            case.case_id: round2.select_survivors(case)
            for case in surface.PRODUCER_CASES
        }

    def test_selects_spread_coverage_survivors(self) -> None:
        for case in surface.PRODUCER_CASES:
            items = self.selected[case.case_id]
            self.assertEqual(len(items), 12)
            ordinals = [item.survivor_ordinal for item in items]
            self.assertEqual(ordinals, sorted(set(ordinals)))
            self.assertGreater(ordinals[0], 0)
            self.assertLess(ordinals[-1], items[0].survivor_count - 1)

    def test_fixed_budget_and_fake_run(self) -> None:
        cvc5_calls = 0
        z3_calls = 0

        def cvc5_runner(system, _enabled):
            nonlocal cvc5_calls
            cvc5_calls += 1
            if cvc5_calls % 4 == 0:
                return {"status": "UNKNOWN", "stdout": "unknown\n"}
            names = system.atom_names()[:2]
            return {"status": "UNSAT", "stdout": f"unsat\n(|{names[0]}| |{names[1]}|)\n"}

        def z3_runner(_system, enabled, _timeout):
            nonlocal z3_calls
            z3_calls += 1
            names = tuple(enabled or ())
            return {"status": "UNSAT" if names else "SAT", "unsat_core": names}

        document = round2.run_census(cvc5_runner=cvc5_runner, z3_runner=z3_runner)
        self.assertEqual(cvc5_calls, 36)
        self.assertGreater(z3_calls, 0)
        self.assertEqual(document["policy"]["cvc5_retries"], 0)
        self.assertEqual(document["summary"]["status_counts"], {"UNKNOWN": 9, "UNSAT": 27})
        self.assertEqual(len(document["summary"]["solver_survivors"]), 9)
        round2.validate_checkpoint(document)

        mutated = copy.deepcopy(document)
        mutated["results"][0]["survivor_ordinal"] += 1
        body = {key: value for key, value in mutated.items() if key != "checkpoint_sha256"}
        mutated["checkpoint_sha256"] = round2.round1._json_digest(body)
        with self.assertRaises(round2.Round2CensusError):
            round2.validate_checkpoint(mutated)

    def test_budget_cannot_extend(self) -> None:
        with self.assertRaises(round2.Round2CensusError):
            round2.select_survivors(
                surface.PRODUCER_CASES[0], count=round2.SURVIVORS_PER_CASE + 1
            )

    def test_internal_cvc5_timeout_is_fail_closed(self) -> None:
        self.assertEqual(
            round2.normalized_cvc5_status(
                {"status": "ERROR", "stderr": "cvc5 interrupted by timeout.\n"}
            ),
            "TIMEOUT",
        )
        self.assertEqual(
            round2.normalized_cvc5_status({"status": "ERROR", "stderr": "parse"}),
            "ERROR",
        )


if __name__ == "__main__":
    unittest.main()
