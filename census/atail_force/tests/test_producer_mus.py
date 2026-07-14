from __future__ import annotations

import unittest

from census.atail_force.producer_mus import MarcoEnumerator, MarcoError


class ProducerMusTests(unittest.TestCase):
    def test_enumerates_multiple_minimal_cores(self) -> None:
        def oracle(subset: frozenset[str]) -> str:
            if {"a", "b"} <= subset or {"b", "c"} <= subset:
                return "UNSAT"
            return "SAT"

        result = MarcoEnumerator(
            ("a", "b", "c", "d"),
            oracle,
            max_oracle_calls=64,
            max_minimal_cores=8,
        ).run()
        self.assertEqual(result.status, "MAP_EXHAUSTED")
        self.assertEqual(
            {core.atoms for core in result.minimal_cores},
            {("a", "b"), ("b", "c")},
        )

    def test_unknown_stops_without_a_blocking_claim(self) -> None:
        calls = 0

        def oracle(_subset: frozenset[str]) -> str:
            nonlocal calls
            calls += 1
            return "UNKNOWN"

        result = MarcoEnumerator(("a", "b"), oracle).run()
        self.assertEqual(result.status, "UNKNOWN_FAIL_CLOSED")
        self.assertEqual(result.oracle_calls, 1)
        self.assertEqual(calls, 1)
        self.assertEqual(result.minimal_cores, ())
        self.assertIsNotNone(result.unknown_subset)

    def test_oracle_budget_stops_cleanly(self) -> None:
        result = MarcoEnumerator(
            ("a", "b", "c"),
            lambda subset: "UNSAT" if len(subset) >= 2 else "SAT",
            max_oracle_calls=1,
        ).run()
        self.assertEqual(result.status, "ORACLE_BUDGET")
        self.assertLessEqual(result.oracle_calls, 1)

    def test_rejects_duplicate_universe(self) -> None:
        with self.assertRaises(MarcoError):
            MarcoEnumerator(("a", "a"), lambda _subset: "SAT")


if __name__ == "__main__":
    unittest.main()
