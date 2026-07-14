# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

from collections import Counter
from itertools import permutations
import random
import unittest

from census.global_confinement.metric_realizability_probe import (
    DEFAULT_INPUTS,
    MetricRow,
    _convex_rhombus_equilateral_core,
    _closure_circle_index,
    _duplicate_center_core,
    _equal_k4_core,
    _exact_off_circle_core,
    _exact_metric_unsat_core,
    _five_point_bisector_circle_core,
    _formalized_metric_core,
    _normalize_assignment,
    _perpendicular_bisector_core,
    _smoke_systems,
    _surplus_source_collision_core_from_closure,
    _three_triad_collision_core_from_closure,
    _row_equality_closure,
    _seven_point_orbit_collision_core_from_closure,
    _seven_point_circle_network_collision_core_from_closure,
    _seven_point_six_circle_collision_core_from_closure,
    _seven_point_six_circle_collision_core_b_from_closure,
    _seven_point_twin_four_circle_collision_core_from_closure,
    _six_point_five_circle_collision_core_a_from_closure,
    _six_point_five_circle_collision_core_b_from_closure,
    _six_point_five_circle_collision_core_c_from_closure,
    _seven_point_five_circle_collision_core_from_closure,
    _eight_point_five_circle_collision_core_from_closure,
    _six_point_circle_chain_collision_core_from_closure,
    _six_row_anchor_collision_core_from_closure,
    extract_systems,
    run_smoke,
)


class MetricRealizabilityProbeTests(unittest.TestCase):
    def test_duplicate_rows_merge_with_strongest_exact_flag(self) -> None:
        assignment = {
            "global:0": {"center": 0, "support": [1, 2, 3, 4], "exact": False},
            "shell:1": {"center": 0, "support": [4, 3, 2, 1], "exact": True},
        }
        rows = _normalize_assignment(assignment, 5)
        self.assertEqual(len(rows), 1)
        self.assertTrue(rows[0].exact)

    def test_duplicate_center_core_detects_transitive_row_equalities(self) -> None:
        rows = (
            MetricRow(0, (2, 3, 4, 5), True),
            MetricRow(1, (2, 3, 4, 6), False),
            MetricRow(2, (0, 1, 5, 6), False),
        )
        self.assertEqual(
            _duplicate_center_core(rows),
            {"triple": [2, 3, 4], "centers": [0, 1]},
        )

    def test_exact_off_circle_core_detects_forced_excluded_label(self) -> None:
        rows = (
            MetricRow(0, (1, 3, 4, 6), True),
            MetricRow(1, (0, 2, 7, 8), False),
            MetricRow(2, (1, 5, 7, 8), False),
            MetricRow(5, (0, 2, 7, 8), False),
        )
        self.assertEqual(
            _exact_off_circle_core(rows),
            {"center": 0, "support": [1, 3, 4, 6], "off_support": 5},
        )

    def test_equal_k4_core_detects_transitive_six_edge_class(self) -> None:
        rows = (
            MetricRow(0, (1, 2, 3, 4), False),
            MetricRow(1, (0, 2, 3, 4), False),
            MetricRow(2, (0, 1, 3, 4), False),
        )
        self.assertEqual(_equal_k4_core(rows, 5), {"points": [0, 1, 2, 3]})

    def test_extended_equilateral_bisector_core_is_leaf_only(self) -> None:
        rows = (
            MetricRow(0, (1, 2), False),
            MetricRow(1, (0, 3, 4), False),
            MetricRow(3, (0, 1, 2), False),
            MetricRow(4, (2, 3), False),
        )
        order = tuple(range(5))
        self.assertIsNone(
            _formalized_metric_core(
                rows,
                5,
                order,
                include_extended=False,
                include_ordered=False,
            )
        )
        self.assertEqual(
            _formalized_metric_core(rows, 5, order),
            {
                "stage": "equality-equilateral-bisector-collision",
                "core": {"p": 1, "a": 3, "b": 0, "c": 4, "x": 2},
            },
        )

    def test_extended_three_triad_core_is_leaf_only(self) -> None:
        rows = (
            MetricRow(0, (1, 2), False),
            MetricRow(1, (0, 3), False),
            MetricRow(2, (1, 3, 4), False),
            MetricRow(4, (0, 1, 3), False),
        )
        order = tuple(range(5))
        self.assertIsNone(
            _formalized_metric_core(
                rows,
                5,
                order,
                include_extended=False,
                include_ordered=False,
            )
        )
        self.assertEqual(
            _formalized_metric_core(rows, 5, order),
            {
                "stage": "equality-three-triad-collision",
                "core": {"a": 3, "b": 0, "c": 2, "d": 1, "e": 4},
            },
        )

    def test_three_triad_bitmask_detector_matches_permutation_reference(self) -> None:
        rng = random.Random(20260713)
        for n in range(5, 9):
            labels = tuple(range(n))
            for _ in range(100):
                rows = []
                for _ in range(rng.randrange(0, n + 2)):
                    center = rng.randrange(n)
                    available = [point for point in labels if point != center]
                    size = rng.randrange(1, min(5, len(available)) + 1)
                    rows.append(
                        MetricRow(
                            center,
                            tuple(rng.sample(available, size)),
                            False,
                        )
                    )
                closure = _row_equality_closure(n, tuple(rows))
                index = _closure_circle_index(closure, n)
                roots, _ = index
                reference = None
                for a, b, c, d, e in permutations(labels, 5):
                    if roots[b][c] != roots[b][d] or roots[b][c] != roots[d][a]:
                        continue
                    if roots[c][a] != roots[c][d] or roots[c][a] != roots[c][e]:
                        continue
                    if roots[e][a] == roots[e][b] == roots[e][d]:
                        reference = {"a": a, "b": b, "c": c, "d": d, "e": e}
                        break
                actual = _three_triad_collision_core_from_closure(
                    closure, n, index=index
                )
                self.assertEqual(reference is None, actual is None)

    def test_surplus_source_collision_core(self) -> None:
        rows = (
            MetricRow(0, (1, 2, 3), False),
            MetricRow(4, (1, 2), False),
            MetricRow(2, (4, 1, 3), False),
            MetricRow(3, (1, 0, 5), False),
            MetricRow(5, (2, 0), False),
            MetricRow(6, (4, 0, 3, 5), False),
        )
        self.assertEqual(
            _surplus_source_collision_core_from_closure(
                _row_equality_closure(7, rows), 7
            ),
            {"o": 0, "a": 1, "b": 2, "c": 3, "u": 4, "v": 5, "w": 6},
        )

    def test_surplus_source_collision_core_allows_aliased_roles(self) -> None:
        rows = (
            MetricRow(0, (1, 2, 3), False),
            MetricRow(3, (1, 0, 4), False),
            MetricRow(4, (1, 2, 0), False),
            MetricRow(2, (4, 3, 1), False),
            MetricRow(5, (4, 3, 0), False),
        )
        core = _surplus_source_collision_core_from_closure(
            _row_equality_closure(6, rows), 6
        )
        self.assertIsNotNone(core)
        assert core is not None
        self.assertNotEqual(core["o"], core["a"])
        self.assertLess(len(set(core.values())), 7)

    def test_six_row_anchor_collision_core(self) -> None:
        rows = (
            MetricRow(0, (7, 9), False),
            MetricRow(1, (0, 7, 8), False),
            MetricRow(7, (1, 9), False),
            MetricRow(8, (0, 10), False),
            MetricRow(9, (1, 8, 10), False),
            MetricRow(10, (1, 7, 9), False),
        )
        self.assertEqual(
            _six_row_anchor_collision_core_from_closure(
                _row_equality_closure(11, rows), 11
            ),
            {"o": 0, "a": 1, "b": 7, "c": 9, "u": 8, "v": 10},
        )

    def test_six_row_anchor_collision_core_allows_aliased_roles(self) -> None:
        rows = (
            MetricRow(0, (2, 3), False),
            MetricRow(1, (0, 2), False),
            MetricRow(2, (0, 1, 3, 4), False),
            MetricRow(3, (1, 2, 4), False),
            MetricRow(4, (1, 2, 3), False),
        )
        core = _six_row_anchor_collision_core_from_closure(
            _row_equality_closure(5, rows), 5
        )
        self.assertIsNotNone(core)
        assert core is not None
        self.assertNotEqual(core["o"], core["a"])
        self.assertLess(len(set(core.values())), 6)

    def test_six_point_circle_chain_collision_core(self) -> None:
        rows = (
            MetricRow(1, (0, 2, 6), False),
            MetricRow(2, (0, 1, 9, 10), False),
            MetricRow(6, (2, 9), False),
            MetricRow(9, (0, 10), False),
            MetricRow(10, (1, 6, 9), False),
        )
        expected = {"a": 0, "b": 1, "c": 2, "d": 6, "e": 9, "f": 10}
        self.assertEqual(
            _six_point_circle_chain_collision_core_from_closure(
                _row_equality_closure(11, rows), 11
            ),
            expected,
        )
        self.assertEqual(
            _formalized_metric_core(rows, 11, tuple(range(11))),
            {
                "stage": "equality-six-point-circle-chain-collision",
                "core": expected,
            },
        )

    def test_seven_point_six_circle_collision_core(self) -> None:
        rows = (
            MetricRow(0, (1, 2, 3, 4), False),
            MetricRow(2, (0, 1, 9, 10), False),
            MetricRow(6, (0, 2, 5, 11), False),
            MetricRow(9, (2, 6, 7, 10), False),
            MetricRow(10, (0, 1, 5, 7), False),
            MetricRow(11, (1, 6, 8, 10), False),
        )
        expected = {
            "o": 0,
            "a": 1,
            "b": 2,
            "c": 6,
            "d": 9,
            "e": 10,
            "f": 11,
        }
        self.assertEqual(
            _seven_point_six_circle_collision_core_from_closure(
                _row_equality_closure(12, rows), 12
            ),
            expected,
        )
        self.assertEqual(
            _formalized_metric_core(rows, 12, tuple(range(12))),
            {
                "stage": "equality-seven-point-six-circle-collision",
                "core": expected,
            },
        )

    def test_seven_point_six_circle_collision_core_b(self) -> None:
        rows = (
            MetricRow(0, (1, 4), False),
            MetricRow(1, (0, 7), False),
            MetricRow(7, (0, 4, 10), False),
            MetricRow(8, (1, 7, 9, 10), False),
            MetricRow(9, (0, 1, 8), False),
            MetricRow(10, (0, 4, 9), False),
        )
        expected = {
            "a": 0,
            "b": 4,
            "c": 7,
            "d": 10,
            "e": 1,
            "f": 8,
            "g": 9,
        }
        self.assertEqual(
            _seven_point_six_circle_collision_core_b_from_closure(
                _row_equality_closure(12, rows), 12
            ),
            expected,
        )
        self.assertEqual(
            _formalized_metric_core(rows, 12, tuple(range(12))),
            {
                "stage": "equality-seven-point-six-circle-collision-b",
                "core": expected,
            },
        )

    def test_six_point_five_circle_collision_cores(self) -> None:
        fixtures = (
            (
                "equality-six-point-five-circle-collision-a",
                _six_point_five_circle_collision_core_a_from_closure,
                (
                    MetricRow(0, (1, 2), False),
                    MetricRow(1, (0, 2, 6, 7), False),
                    MetricRow(6, (2, 7, 11), False),
                    MetricRow(7, (0, 6, 11), False),
                    MetricRow(11, (0, 1), False),
                ),
                {"o": 0, "a": 1, "b": 2, "c": 6, "e": 7, "f": 11},
            ),
            (
                "equality-six-point-five-circle-collision-b",
                _six_point_five_circle_collision_core_b_from_closure,
                (
                    MetricRow(1, (0, 2, 7), False),
                    MetricRow(2, (0, 1, 9, 11), False),
                    MetricRow(7, (0, 2), False),
                    MetricRow(9, (0, 11), False),
                    MetricRow(11, (1, 7, 9), False),
                ),
                {"o": 0, "a": 1, "b": 2, "c": 9, "e": 7, "f": 11},
            ),
            (
                "equality-six-point-five-circle-collision-c",
                _six_point_five_circle_collision_core_c_from_closure,
                (
                    MetricRow(1, (0, 2, 7, 8), False),
                    MetricRow(2, (0, 1, 11), False),
                    MetricRow(7, (2, 8, 11), False),
                    MetricRow(8, (0, 7), False),
                    MetricRow(11, (1, 7), False),
                ),
                {"o": 0, "a": 1, "b": 2, "c": 8, "e": 7, "f": 11},
            ),
        )
        for stage, finder, rows, expected in fixtures:
            with self.subTest(stage=stage):
                self.assertEqual(
                    finder(_row_equality_closure(12, rows), 12), expected
                )
                self.assertEqual(
                    _formalized_metric_core(rows, 12, tuple(range(12))),
                    {"stage": stage, "core": expected},
                )

    def test_large_five_circle_collision_cores(self) -> None:
        fixtures = (
            (
                "equality-seven-point-five-circle-collision",
                _seven_point_five_circle_collision_core_from_closure,
                (
                    MetricRow(0, (1, 2, 4), False),
                    MetricRow(1, (0, 2, 6, 7), False),
                    MetricRow(6, (2, 7, 10), False),
                    MetricRow(7, (0, 4, 6, 10), False),
                    MetricRow(10, (0, 4), False),
                ),
                {"a": 0, "b": 1, "c": 2, "d": 4,
                 "e": 7, "f": 6, "g": 10},
            ),
            (
                "equality-eight-point-five-circle-collision",
                _eight_point_five_circle_collision_core_from_closure,
                (
                    MetricRow(1, (0, 2, 6, 7), False),
                    MetricRow(2, (0, 1, 10, 11), False),
                    MetricRow(6, (2, 7, 10), False),
                    MetricRow(10, (4, 7, 11), False),
                    MetricRow(11, (1, 6, 10), False),
                ),
                {"o": 0, "a": 1, "b": 2, "c": 4,
                 "d": 7, "e": 6, "f": 10, "g": 11},
            ),
        )
        for stage, finder, rows, expected in fixtures:
            with self.subTest(stage=stage):
                self.assertEqual(
                    finder(_row_equality_closure(12, rows), 12), expected
                )
                self.assertEqual(
                    _formalized_metric_core(rows, 12, tuple(range(12))),
                    {"stage": stage, "core": expected},
                )

    def test_seven_point_twin_four_circle_collision_core(self) -> None:
        rows = (
            MetricRow(0, (1, 4), False),
            MetricRow(1, (0, 6), False),
            MetricRow(4, (1, 6, 10), False),
            MetricRow(9, (0, 4, 10, 11), False),
            MetricRow(10, (1, 6, 9, 11), False),
            MetricRow(11, (0, 1), False),
        )
        expected = {
            "o": 0,
            "a": 1,
            "b": 4,
            "c": 6,
            "d": 9,
            "e": 10,
            "f": 11,
        }
        self.assertEqual(
            _seven_point_twin_four_circle_collision_core_from_closure(
                _row_equality_closure(12, rows), 12
            ),
            expected,
        )
        self.assertEqual(
            _formalized_metric_core(rows, 12, tuple(range(12))),
            {
                "stage": "equality-seven-point-twin-four-circle-collision",
                "core": expected,
            },
        )

    def test_seven_point_orbit_collision_core(self) -> None:
        rows = (
            MetricRow(0, (1, 3, 4), False),
            MetricRow(1, (0, 3, 8, 9), False),
            MetricRow(3, (4, 5, 8), False),
            MetricRow(4, (1, 8), False),
            MetricRow(5, (4, 9), False),
            MetricRow(8, (1, 5, 9), False),
            MetricRow(9, (0, 3, 5), False),
        )
        self.assertEqual(
            _seven_point_orbit_collision_core_from_closure(
                _row_equality_closure(10, rows), 10
            ),
            {"o": 0, "a": 1, "b": 3, "c": 4, "u": 5, "v": 8, "w": 9},
        )

    def test_seven_point_circle_network_collision_core(self) -> None:
        rows = (
            MetricRow(0, (1, 2, 7), False),
            MetricRow(1, (0, 9), False),
            MetricRow(2, (0, 6, 10), False),
            MetricRow(6, (1, 7, 10), False),
            MetricRow(7, (2, 9, 10), False),
            MetricRow(9, (2, 10), False),
            MetricRow(10, (0, 7), False),
        )
        self.assertEqual(
            _seven_point_circle_network_collision_core_from_closure(
                _row_equality_closure(11, rows), 11
            ),
            {"o": 0, "a": 1, "b": 2, "c": 6, "u": 7, "v": 9, "w": 10},
        )

    def test_perpendicular_bisector_core_detects_three_forced_points(self) -> None:
        rows = (
            MetricRow(2, (0, 1, 5, 6), False),
            MetricRow(3, (0, 1, 5, 6), False),
            MetricRow(4, (0, 1, 5, 6), False),
        )
        self.assertEqual(
            _perpendicular_bisector_core(rows, 7),
            {"foci": [0, 1], "points": [2, 3, 4]},
        )

    def test_five_point_core_detects_ordered_metric_pattern(self) -> None:
        rows = (
            MetricRow(3, (1, 2, 8, 10), True),
            MetricRow(8, (0, 1, 3, 5), True),
            MetricRow(10, (0, 1, 4, 7), False),
        )
        order = (0, 10, 11, 1, 3, 4, 5, 6, 7, 2, 8, 9)
        self.assertEqual(
            _five_point_bisector_circle_core(rows, 12, order),
            {"a": 0, "x": 10, "b": 1, "c": 3, "y": 8},
        )

    def test_formalized_five_point_core_checks_reverse_orientation(self) -> None:
        rows = (
            MetricRow(0, (5, 6, 7, 9), False),
            MetricRow(6, (2, 5, 7, 10), False),
            MetricRow(7, (2, 4, 5, 8), False),
        )
        order = (0, 9, 10, 1, 3, 4, 5, 6, 2, 7, 8)
        self.assertIsNone(
            _five_point_bisector_circle_core(rows, 11, order)
        )
        self.assertEqual(
            _formalized_metric_core(rows, 11, order),
            {
                "stage": "equality-convex-five-point-reverse",
                "core": {"a": 2, "x": 6, "b": 5, "c": 0, "y": 7},
            },
        )

    def test_rhombus_equilateral_core_detects_ordered_metric_pattern(self) -> None:
        rows = (
            MetricRow(3, (4, 6, 9, 10), False),
            MetricRow(4, (0, 3, 6, 7), True),
            MetricRow(7, (2, 4, 5, 11), False),
            MetricRow(11, (3, 5, 7, 10), False),
        )
        order = (0, 10, 11, 1, 3, 4, 5, 6, 7, 2, 8, 9)
        self.assertEqual(
            _convex_rhombus_equilateral_core(rows, 12, order),
            {"a": 11, "b": 3, "c": 4, "x": 5, "y": 6, "d": 7},
        )
        self.assertEqual(
            _formalized_metric_core(rows, 12, order),
            {
                "stage": "equality-convex-rhombus-equilateral",
                "core": {"a": 11, "b": 3, "c": 4, "x": 5, "y": 6, "d": 7},
            },
        )

    def test_exact_metric_core_reports_required_smoke_rows(self) -> None:
        _sat_system, unsat_system = _smoke_systems()
        result = _exact_metric_unsat_core(unsat_system, 10.0)
        self.assertEqual(result["status"], "UNSAT")
        self.assertEqual(result["row_indices"], [0, 1])
        self.assertTrue(result["uses_ambient_distinctness"])

    def test_saved_inputs_have_stable_structural_partition(self) -> None:
        systems, extraction = extract_systems(DEFAULT_INPUTS)
        counts = Counter()
        rhombus_witnesses = []
        for system in systems:
            rows = tuple(
                MetricRow(
                    int(row["center"]),
                    tuple(row["support"]),
                    bool(row["exact"]),
                )
                for row in system["rows"]
            )
            if _duplicate_center_core(rows, int(system["n"])) is not None:
                counts["duplicate-center"] += 1
            elif _exact_off_circle_core(rows, int(system["n"])) is not None:
                counts["exact-off-circle"] += 1
            elif _equal_k4_core(rows, int(system["n"])) is not None:
                counts["equal-k4"] += 1
            elif _perpendicular_bisector_core(rows, int(system["n"])) is not None:
                counts["perpendicular-bisector"] += 1
            elif _five_point_bisector_circle_core(
                rows, int(system["n"]), tuple(system["order"])
            ) is not None:
                counts["convex-five-point"] += 1
            elif (rhombus_core := _convex_rhombus_equilateral_core(
                rows, int(system["n"]), tuple(system["order"])
            )) is not None:
                counts["convex-rhombus-equilateral"] += 1
                rhombus_witnesses.append((system["system_id"], rhombus_core))
            else:
                counts["other"] += 1
        self.assertEqual(extraction["unique_metric_systems"], 1325)
        self.assertEqual(
            counts,
            Counter({
                "duplicate-center": 1264,
                "exact-off-circle": 31,
                "perpendicular-bisector": 20,
                "convex-five-point": 9,
                "convex-rhombus-equilateral": 1,
            }),
        )
        self.assertEqual(
            rhombus_witnesses,
            [
                (
                    "70d66f0cd568debd988f",
                    {"a": 11, "b": 3, "c": 4, "x": 5, "y": 6, "d": 7},
                )
            ],
        )

    def test_metric_smoke_gate(self) -> None:
        result = run_smoke(10.0)
        self.assertTrue(result["passed"], result)


if __name__ == "__main__":
    unittest.main()
