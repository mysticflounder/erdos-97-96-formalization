from __future__ import annotations

import copy
import hashlib
import unittest
from pathlib import Path

from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.card_head.exact12_v14_ordered_coverage import (
    FROZEN_V8_CUBE,
    FROZEN_V8_CUBE_SHA256,
    FROZEN_V8_LEAN_BINDING,
    FROZEN_V8_LEAN_CHOICES,
    FROZEN_V8_LEAN_CONSUMER_SOURCE,
    FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
    FROZEN_V8_LEAN_COVERAGE_SOURCE,
    FROZEN_V8_LEAN_COVERAGE_SOURCE_BYTES,
    FROZEN_V8_LEAN_COVERAGE_SOURCE_SHA256,
    FROZEN_V8_LEAN_SOURCE,
    FROZEN_V8_LEAN_SOURCE_BYTES,
    FROZEN_V8_LEAN_SOURCE_SHA256,
    LEAN_CONSUMER,
    LEAN_TERMINAL_CONSUMER,
    ORDER_UNIVERSE_SHA256,
    REQUIRED_SOURCE_HYPOTHESES,
    SOURCE_ORDERS,
    Exact12V14OrderedCoverageError,
    detect_ordered_coverage,
    detect_proof_backed_ordered_coverage,
    learned_clause_for_proof_backed_ordered_coverage,
    replay_ordered_coverage,
)

FROZEN_CUBE = {int(center): support for center, support in FROZEN_V8_CUBE.items()}
REPO_ROOT = Path(__file__).resolve().parents[3]


class Exact12V14OrderedCoverageTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.certificate = detect_ordered_coverage(FROZEN_CUBE)
        if cls.certificate is None:
            raise AssertionError("frozen positive-incidence witness lost coverage")

    def test_source_order_universe_is_exactly_24_plus_24(self) -> None:
        orientations = [orientation for orientation, _order in SOURCE_ORDERS]
        orders = [order for _orientation, order in SOURCE_ORDERS]

        self.assertEqual(len(SOURCE_ORDERS), 48)
        self.assertEqual(orientations.count("direct"), 24)
        self.assertEqual(orientations.count("mirror"), 24)
        self.assertEqual(len(set(orders)), 48)
        self.assertTrue(all(order[0] == 0 for order in orders))
        self.assertEqual(
            ORDER_UNIVERSE_SHA256,
            "ebc15a5e85c908f3d248e8fc364bef053c4d14e7afe92049d4d34d1dd767cd30",
        )

    def test_every_order_satisfies_the_lean_block_and_forced_predicates(self) -> None:
        for orientation, order in SOURCE_ORDERS:
            position = {label: index for index, label in enumerate(order)}
            forced = (
                position[6] < position[7] < position[8] < position[9]
                or position[9] < position[8] < position[7] < position[6]
            )
            self.assertTrue(forced)
            if orientation == "direct":
                self.assertLess(position[0], position[2])
                self.assertLess(position[2], position[1])
                self.assertTrue(
                    all(position[0] < position[x] < position[2] for x in range(6, 10))
                )
                self.assertTrue(
                    all(position[2] < position[x] < position[1] for x in range(3, 6))
                )
                self.assertTrue(all(position[1] < position[x] for x in (10, 11)))
            else:
                self.assertEqual(orientation, "mirror")
                self.assertLess(position[0], position[1])
                self.assertLess(position[1], position[2])
                self.assertTrue(
                    all(position[0] < position[x] < position[1] for x in (10, 11))
                )
                self.assertTrue(
                    all(position[1] < position[x] < position[2] for x in range(3, 6))
                )
                self.assertTrue(all(position[2] < position[x] for x in range(6, 10)))

    def test_frozen_witness_covers_every_order_with_positive_consumers(self) -> None:
        counts: dict[str, int] = {}
        for entry in self.certificate["coverage"]:
            rule = entry["rule"]
            counts[rule] = counts.get(rule, 0) + 1

        self.assertEqual(len(self.certificate["coverage"]), 48)
        self.assertEqual(
            counts,
            {
                "convex-five-point-common-orientation": 24,
                "selected-rows-kalmanson": 15,
                "two-rows-shared-late-pair": 9,
            },
        )
        self.assertTrue(
            all(row["exact"] is False for row in self.certificate["selected_rows"])
        )

    def test_certificate_roundtrips_and_memberships_are_present(self) -> None:
        key = replay_ordered_coverage(self.certificate)
        self.assertEqual(self.certificate["lean_consumer"], LEAN_CONSUMER)
        self.assertEqual(
            self.certificate["required_source_hypotheses"],
            list(REQUIRED_SOURCE_HYPOTHESES),
        )
        self.assertEqual(len(key), 11)
        self.assertEqual(
            self.certificate["generated_lean_nogood"], FROZEN_V8_LEAN_BINDING
        )
        self.assertEqual(
            self.certificate["generated_lean_nogood"]["cube_sha256"],
            FROZEN_V8_CUBE_SHA256,
        )
        self.assertEqual(
            self.certificate["generated_lean_nogood"]["choices"],
            FROZEN_V8_LEAN_CHOICES,
        )
        self.assertEqual(
            self.certificate["generated_lean_nogood"]["terminal_consumer_declaration"],
            LEAN_TERMINAL_CONSUMER,
        )
        self.assertEqual(
            [
                {"center": row["center"], "support": row["support"]}
                for row in self.certificate["selected_rows"]
            ],
            FROZEN_V8_LEAN_CHOICES,
        )
        for center, required in key:
            self.assertLessEqual(set(required), set(FROZEN_CUBE[center]))

    def test_generated_lean_binding_authenticates_current_sources(self) -> None:
        for relative, byte_count, digest in (
            (
                FROZEN_V8_LEAN_SOURCE,
                FROZEN_V8_LEAN_SOURCE_BYTES,
                FROZEN_V8_LEAN_SOURCE_SHA256,
            ),
            (
                FROZEN_V8_LEAN_COVERAGE_SOURCE,
                FROZEN_V8_LEAN_COVERAGE_SOURCE_BYTES,
                FROZEN_V8_LEAN_COVERAGE_SOURCE_SHA256,
            ),
            (
                FROZEN_V8_LEAN_CONSUMER_SOURCE,
                FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
                FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
            ),
        ):
            source = (REPO_ROOT / relative).read_bytes()
            self.assertEqual(len(source), byte_count)
            self.assertEqual(hashlib.sha256(source).hexdigest(), digest)

    def test_learned_clause_uses_bound_selected_rows_and_is_falsified(self) -> None:
        instance = materialize_cell(0).instance
        clause = learned_clause_for_proof_backed_ordered_coverage(
            instance, self.certificate
        )
        key = replay_ordered_coverage(self.certificate)
        selected = {
            instance.choice_variables[
                (center, instance.candidate_index(center, FROZEN_CUBE[center]))
            ]
            for center, _required in key
        }

        self.assertEqual(len(clause), len(key))
        self.assertTrue(all(-literal in selected for literal in clause))

    def test_unbound_coverage_remains_diagnostic_only(self) -> None:
        unbound = copy.deepcopy(FROZEN_CUBE)
        unbound[6] = [0, 1, 4, 8]
        diagnostic = detect_ordered_coverage(unbound)

        self.assertIsNotNone(diagnostic)
        self.assertNotIn("generated_lean_nogood", diagnostic)
        self.assertIsNone(detect_proof_backed_ordered_coverage(unbound))
        with self.assertRaisesRegex(
            Exact12V14OrderedCoverageError, "no generated Lean nogood"
        ):
            learned_clause_for_proof_backed_ordered_coverage(
                materialize_cell(0).instance, diagnostic
            )

    def test_certificate_binding_does_not_alias_module_constant(self) -> None:
        mutated = detect_proof_backed_ordered_coverage(FROZEN_CUBE)
        self.assertIsNotNone(mutated)
        mutated["generated_lean_nogood"]["choices"].pop()
        self.assertEqual(len(FROZEN_V8_LEAN_BINDING["choices"]), 11)

    def test_replay_rejects_order_coverage_and_closure_tampering(self) -> None:
        mutations = []

        order = copy.deepcopy(self.certificate)
        order["coverage"][0]["order"][1:3] = reversed(
            order["coverage"][0]["order"][1:3]
        )
        mutations.append(order)

        coverage = copy.deepcopy(self.certificate)
        coverage["coverage"].pop()
        mutations.append(coverage)

        closure = copy.deepcopy(self.certificate)
        closure["closure_certificates"][0]["proof_sha256"] = "0" * 64
        mutations.append(closure)

        row = copy.deepcopy(self.certificate)
        row["selected_rows"][0]["exact"] = True
        mutations.append(row)

        binding = copy.deepcopy(self.certificate)
        binding["generated_lean_nogood"]["source_sha256"] = "0" * 64
        mutations.append(binding)

        for index, mutation in enumerate(mutations):
            with (
                self.subTest(mutation=index),
                self.assertRaisesRegex(Exact12V14OrderedCoverageError, "exact replay"),
            ):
                replay_ordered_coverage(mutation)

    def test_malformed_cube_is_rejected_before_detection(self) -> None:
        malformed = copy.deepcopy(FROZEN_CUBE)
        malformed[0] = [0, 3, 5, 8]
        with self.assertRaisesRegex(
            Exact12V14OrderedCoverageError, "four distinct other labels"
        ):
            detect_ordered_coverage(malformed)

        unhashable = copy.deepcopy(FROZEN_CUBE)
        unhashable[0] = [[3], [5], [8], [10]]
        with self.assertRaisesRegex(
            Exact12V14OrderedCoverageError, "four distinct other labels"
        ):
            detect_ordered_coverage(unhashable)


if __name__ == "__main__":
    unittest.main()
