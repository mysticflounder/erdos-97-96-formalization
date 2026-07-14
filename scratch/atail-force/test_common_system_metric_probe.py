# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import json
import sys
import unittest
from collections import Counter
from pathlib import Path
from unittest.mock import patch


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import common_system_metric_probe as probe  # noqa: E402
import common_system_mec_optimizer as mec_probe  # noqa: E402


class CommonSystemMetricProbeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.checkpoint = json.loads(probe.CHECKPOINT.read_text(encoding="utf-8"))
        cls.pre_arc_checkpoint = json.loads(
            probe.PRE_ARC_OVERTAKE_CHECKPOINT.read_text(encoding="utf-8")
        )

    def test_banked_five_row_hinge_cores_replay_with_exact_roles(self) -> None:
        checkpoint = json.loads(
            (
                HERE
                / "second_center_query"
                / "multi_order_unit_core_clusters.json"
            ).read_text(encoding="utf-8")
        )
        expected = {
            (2, 0): (
                probe.six_point_hinge_tail_core,
                "equality-six-point-hinge-tail",
                {"A": 0, "B": 1, "C": 2, "D": 3, "H": 5, "T": 9},
                "false_of_sixPointHingeTailCore",
            ),
            (3, 0): (
                probe.five_point_hinge_cycle_core,
                "equality-five-point-hinge-cycle",
                {"A": 0, "B": 1, "C": 2, "D": 3, "H": 5},
                "false_of_fivePointHingeCycleCore",
            ),
            (3, 1): (
                probe.six_point_hinge_double_spoke_core,
                "equality-six-point-hinge-double-spoke",
                {"A": 0, "B": 1, "C": 2, "L": 4, "H": 5, "R": 6},
                "false_of_sixPointHingeDoubleSpokeCore",
            ),
            (6, 0): (
                probe.seven_point_hinge_closed_tail_core,
                "equality-seven-point-hinge-closed-tail",
                {
                    "A": 0,
                    "B": 1,
                    "L": 3,
                    "M": 4,
                    "H": 5,
                    "R": 6,
                    "T": 7,
                },
                "false_of_sevenPointHingeClosedTailCore",
            ),
        }
        banked = {
            (entry["shard_index"], entry["core_index"]): entry
            for entry in checkpoint["cores"]
            if entry["row_count"] == 5
        }
        self.assertEqual(set(banked), set(expected))
        for key, entry in banked.items():
            matcher, stage, roles, consumer = expected[key]
            rows = tuple(
                probe.metric_structure.MetricRow(
                    row["center"], tuple(row["support"]), exact=True
                )
                for row in entry["rows"]
            )
            match = matcher(rows, 12)
            self.assertIsNotNone(match)
            assert match is not None
            self.assertEqual(match["stage"], stage)
            self.assertEqual(match["core"], roles)
            self.assertEqual(
                match["lean_consumer"],
                "Problem97.Census554.EqualityCore." + consumer,
            )
            self.assertEqual(
                probe.equilateral_hinge_collision_core(rows, 12), match
            )
            for other_matcher, *_rest in expected.values():
                if other_matcher is not matcher:
                    self.assertIsNone(other_matcher(rows, 12))

    def test_checkpoint_scope_and_terminal_statuses(self) -> None:
        self.assertEqual(
            self.checkpoint["schema"],
            "p97-atail-common-critical-system-metric-cegar-v2",
        )
        self.assertFalse(self.checkpoint["scope"]["target_faithful"])
        self.assertFalse(
            self.checkpoint["scope"]["lean_critical_shell_system_constructed"]
        )
        self.assertTrue(
            self.checkpoint["scope"]["mec_geometry_required_from_live_target_frame"]
        )
        self.assertFalse(
            self.checkpoint["scope"]["mec_geometry_derived_from_equality_rows"]
        )
        cases = {tuple(case["profile"]): case for case in self.checkpoint["cases"]}
        self.assertEqual(cases[(4, 5, 6)]["accepted_cut_count"], 6)
        self.assertEqual(cases[(5, 5, 5)]["accepted_cut_count"], 21)
        self.assertEqual(
            cases[(4, 5, 6)]["final_status"],
            "FOUND_UNCOVERED_CROSSCHECKED_NONUNIT_EQUALITY_SHADOW",
        )
        self.assertEqual(
            cases[(5, 5, 5)]["final_status"],
            "FOUND_UNCOVERED_CROSSCHECKED_NONUNIT_EQUALITY_SHADOW",
        )
        last_555 = cases[(5, 5, 5)]["rounds"][-1]
        self.assertEqual(last_555["round"], 21)
        self.assertEqual(
            last_555["assignment_sha256"],
            "2854f002275620851be4b86b064d3f0fb02cb60099c6a60d36f241dd19fb82ec",
        )
        self.assertEqual(
            last_555["metric_rows"],
            [
                "0:1,2,3,4",
                "1:0,2,6,7",
                "2:3,8,9,10",
                "3:1,5,6,8",
                "4:1,2,9,11",
            ],
        )
        self.assertEqual(
            last_555["reported_status"],
            "FOUND_NONUNIT_WITHOUT_FORMALIZED_CORE_REAL_FEASIBILITY_UNDECIDED",
        )
        self.assertEqual(
            last_555["full_equality_ideal"],
            {
                "status": "CROSSCHECKED_NONUNIT",
                "verdicts": ["NONUNIT", "NONUNIT", "NONUNIT"],
            },
        )
        last_456 = cases[(4, 5, 6)]["rounds"][-1]
        self.assertEqual(last_456["round"], 6)
        self.assertEqual(
            last_456["assignment_sha256"],
            "268f0efa08c29ad02c622b5eabe9d9c221737680117c84015eebe05e70ba89f9",
        )
        self.assertEqual(
            last_456["metric_rows"],
            ["0:1,3,4,5", "1:0,2,5,6", "2:1,7,8,9", "3:0,8,10,11"],
        )
        self.assertEqual(
            last_456["full_equality_ideal"]["status"], "CROSSCHECKED_NONUNIT"
        )

    def test_pre_arc_overtake_archive_is_immutable(self) -> None:
        self.assertEqual(
            hashlib.sha256(
                probe.PRE_ARC_OVERTAKE_CHECKPOINT.read_bytes()
            ).hexdigest(),
            "fcb0b93588ad95dac43aa2a1bf1364d5f7a3a24cc5cb5f15739c8541cd11ca09",
        )

    def test_every_accepted_cut_has_a_kernel_consumer(self) -> None:
        counts = Counter()
        for case in self.checkpoint["cases"]:
            for round_record in case["rounds"]:
                cut = round_record.get("accepted_cut")
                if cut is None:
                    continue
                stage = cut["core"]["stage"]
                counts[stage] += 1
                if stage == "equality-convex-nested-equal-chords":
                    self.assertEqual(cut["row_count"], 3)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554.NestedEqualChordCore.false_of_core",
                    )
                elif stage == (
                    "equality-convex-six-point-"
                    "two-circle-arc-overtake-order"
                ):
                    self.assertEqual(cut["row_count"], 3)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554."
                        "SixPointTwoCircleArcOvertakeOrderCore.false_of_core",
                    )
                elif stage == "equality-convex-six-point-two-circle-order":
                    self.assertEqual(cut["row_count"], 4)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554.SixPointTwoCircleOrderCore."
                        "false_of_core",
                    )
                elif stage == "equality-convex-six-point-nested-center-order":
                    self.assertEqual(cut["row_count"], 4)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554.SixPointNestedCenterOrderCore."
                        "false_of_core",
                    )
                elif stage == "equality-convex-six-point-circle-chain-order":
                    self.assertEqual(cut["row_count"], 5)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554.SixPointCircleChainOrderCore."
                        "false_of_core",
                    )
                elif stage == "equality-convex-six-point-circle-chain-wrap-order":
                    self.assertEqual(cut["row_count"], 5)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554.SixPointCircleChainWrapOrderCore."
                        "false_of_core",
                    )
                elif stage == "equality-convex-seven-point-split-bridge-order":
                    self.assertEqual(cut["row_count"], 5)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554.SevenPointSplitBridgeOrderCore."
                        "false_of_core",
                    )
                elif stage == (
                    "equality-convex-seven-point-split-bridge-order-reverse"
                ):
                    self.assertEqual(cut["row_count"], 5)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554.SevenPointSplitBridgeOrderCore."
                        "false_of_core_of_neg",
                    )
                elif stage == (
                    "equality-convex-seven-point-split-bridge-tail-order"
                ):
                    self.assertEqual(cut["row_count"], 5)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554."
                        "SevenPointSplitBridgeTailOrderCore.false_of_core",
                    )
                elif stage == (
                    "equality-convex-seven-point-"
                    "split-bridge-tail-order-reverse"
                ):
                    self.assertEqual(cut["row_count"], 5)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554."
                        "SevenPointSplitBridgeTailOrderCore."
                        "false_of_core_of_neg",
                    )
                elif stage == (
                    "equality-convex-four-point-two-circle-bisector-order"
                ):
                    self.assertEqual(cut["row_count"], 3)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554."
                        "FourPointTwoCircleBisectorOrderCore.false_of_core",
                    )
                elif stage == (
                    "equality-convex-four-point-"
                    "two-circle-bisector-order-reverse"
                ):
                    self.assertEqual(cut["row_count"], 3)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554."
                        "FourPointTwoCircleBisectorOrderCore."
                        "false_of_core_of_neg",
                    )
                elif stage == (
                    "equality-convex-eight-point-"
                    "five-row-circle-intersection-order"
                ):
                    self.assertEqual(cut["row_count"], 5)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554."
                        "FiveRowCircleIntersectionOrderCore.false_of_core",
                    )
                elif stage == (
                    "equality-convex-eight-point-"
                    "five-row-circle-intersection-order-reverse"
                ):
                    self.assertEqual(cut["row_count"], 5)
                    self.assertEqual(
                        cut["core"]["lean_consumer"],
                        "Problem97.Census554."
                        "FiveRowCircleIntersectionOrderCore."
                        "false_of_core_of_neg",
                    )
                elif stage == "equality-mec-straddling-row-fixed-frame":
                    self.assertEqual(cut["row_count"], 3)
                    self.assertEqual(
                        cut["core"]["lean_consumers"],
                        {
                            "positive_global_orientation": (
                                "Problem97.Census554.MECStraddlingRowCore."
                                "false_of_core"
                            ),
                            "negative_global_orientation": (
                                "Problem97.Census554.MECStraddlingRowCore."
                                "false_of_core_of_neg"
                            ),
                        },
                    )
                    self.assertEqual(
                        cut["core"]["non_equality_dependencies"]["status"],
                        "REQUIRED_FROM_LIVE_FIXED_FRAME_NOT_EQUALITY_ROWS",
                    )
                else:
                    self.assertEqual(stage, "equality-exact-off-circle")
                    self.assertEqual(cut["row_count"], 3)
        self.assertEqual(counts["equality-exact-off-circle"], 6)
        self.assertEqual(counts["equality-convex-nested-equal-chords"], 9)
        self.assertEqual(counts["equality-convex-six-point-two-circle-order"], 3)
        self.assertEqual(
            counts[
                "equality-convex-six-point-two-circle-arc-overtake-order"
            ],
            6,
        )
        self.assertEqual(
            counts["equality-convex-six-point-nested-center-order"], 0
        )
        self.assertEqual(
            counts["equality-convex-six-point-circle-chain-order"], 0
        )
        self.assertEqual(
            counts["equality-convex-six-point-circle-chain-wrap-order"], 0
        )
        self.assertEqual(
            counts["equality-convex-seven-point-split-bridge-order"], 0
        )
        self.assertEqual(
            counts["equality-convex-seven-point-split-bridge-order-reverse"], 0
        )
        self.assertEqual(
            counts[
                "equality-convex-seven-point-split-bridge-tail-order"
            ],
            0,
        )
        self.assertEqual(
            counts[
                "equality-convex-seven-point-split-bridge-tail-order-reverse"
            ],
            0,
        )
        self.assertEqual(
            counts["equality-convex-four-point-two-circle-bisector-order"], 0
        )
        self.assertEqual(
            counts[
                "equality-convex-four-point-two-circle-bisector-order-reverse"
            ],
            0,
        )
        self.assertEqual(
            counts[
                "equality-convex-eight-point-"
                "five-row-circle-intersection-order"
            ],
            2,
        )
        self.assertEqual(
            counts[
                "equality-convex-eight-point-"
                "five-row-circle-intersection-order-reverse"
            ],
            0,
        )
        self.assertEqual(counts["equality-mec-straddling-row-fixed-frame"], 1)

    def test_preexisting_round_prefixes_are_preserved(self) -> None:
        cases = {tuple(case["profile"]): case for case in self.checkpoint["cases"]}
        expected = {
            (4, 5, 6): [
                (
                    "1db806dacee592510f689e99458fe4bd38185e2950eaea20f95b76e8b5b10458",
                    "equality-exact-off-circle",
                ),
                (
                    "ed26d6c539c348e54a0436b59d631b6215b141aff0eb6cc069ee82866cc1d08a",
                    "equality-convex-nested-equal-chords",
                ),
                (
                    "5fb448e6fd4b2fbb595d2515616e076d30ff8fde1370c457f78476cb54575713",
                    "equality-convex-nested-equal-chords",
                ),
                (
                    "b19454473724d4d86bca21ef0a715a8cde80f705454dd9420fef1edfd8e9c9c7",
                    "equality-convex-nested-equal-chords",
                ),
                (
                    "df99bb34309bb3ff8c4bf21b36570a3238b6ceda44216c03e17f8a495efabf94",
                    "equality-convex-nested-equal-chords",
                ),
                (
                    "cfeff7b85bf3bb68c5d5195600cf64d1578e16322bc79ce94ddcfc140727b03e",
                    "equality-mec-straddling-row-fixed-frame",
                ),
            ],
            (5, 5, 5): [
                (
                    "17f8872bf845fe5c40c69cc826ae15b3f612a08d1edb35ff5f7b9d8f91d52b93",
                    "equality-exact-off-circle",
                ),
                (
                    "07a3a8b83b0343110b05731863073f9c5f8716a10b909a7f3d289e417184d3d0",
                    "equality-exact-off-circle",
                ),
                (
                    "b59ae0a2b9b85368fb626f094105657fef3d115ffefc512d55fb695a0d01eddd",
                    "equality-exact-off-circle",
                ),
                (
                    "24a73b9eb8ffa18054822728620d6e9fa7e88270260ef7b9078096c4e151c894",
                    "equality-convex-nested-equal-chords",
                ),
                (
                    "2890ab24a8c82e61be88e06bd39869db2558d2d32bd9b2ff968d614cc73d8664",
                    "equality-convex-nested-equal-chords",
                ),
                (
                    "9540438e38c6e691254d9d8ac4aafc201450eb4dfcbae9be63795d37b8c1e2cb",
                    "equality-convex-nested-equal-chords",
                ),
                (
                    "c02b16daa78fffb305b91f2464381b0c5feb3c0981d64c643b647dd0f0fec9e1",
                    "equality-convex-nested-equal-chords",
                ),
                (
                    "b6dea0b54a611bed67a49862a4264b06eed12efbf31f35a2e4cb154c1fb7a8ce",
                    "equality-convex-six-point-two-circle-order",
                ),
                (
                    "d0a8e02f8a9d8fd882f7d8e6234e42055a8aab6ed53c9fd176aab2b4602a98e8",
                    "equality-convex-six-point-two-circle-order",
                ),
                (
                    "2849d2bcf05ee01656a020360e0f0883713c4748782630e92597a0cc17a2ea74",
                    "equality-convex-six-point-two-circle-order",
                ),
                (
                    "a48f53fcc24b4a6856838fc858da2dc5c082a5d876aabf5508f61261fdb12d26",
                    "equality-exact-off-circle",
                ),
                (
                    "8c0866ad340734c907d28b8276c6b28d49c12aa3cb7735d0161f30e504437f5b",
                    "equality-exact-off-circle",
                ),
                (
                    "7d0eef60f5c75f8ee306b1b4565d9b95ead91ca7fe37a6abff5a1ef391a0914d",
                    "equality-exact-off-circle",
                ),
                (
                    "d2132634bc16876a2a517bca0d9ee7d357a8326927daaa21310546a5163dcf34",
                    "equality-convex-nested-equal-chords",
                ),
                (
                    "8ae8d4701ed9f6fcff7aa521d5cc46564ae327871d64a2c819d9f2104aaa5ecf",
                    "equality-convex-six-point-nested-center-order",
                ),
                (
                    "12126e7755f2b03fa29ce85526a6145c0a68d7989f14d8688eb585d7b0e225f8",
                    "equality-convex-six-point-nested-center-order",
                ),
                (
                    "4f08e3ea7d57c0a91e0518c32368eeb75c09f04ae7c15aec43dfeded79d1c156",
                    "equality-convex-six-point-nested-center-order",
                ),
                (
                    "5ed077d946a2fb072906666e1714d7f7d73efc1fcb665f4c1974c250fcca7c89",
                    "equality-convex-six-point-circle-chain-order",
                ),
                (
                    "5dac7824ce5ab4dd7c6f18e2fb3c88306d64dc2cefe1bce2d3d696b8ad4e49f8",
                    "equality-convex-six-point-circle-chain-wrap-order",
                ),
                (
                    "928146519a285356977edf1a8d0f3c665354f374069841d37d6338c3a9777db2",
                    "equality-convex-six-point-circle-chain-wrap-order",
                ),
                (
                    "cf430fcdcb5a0f3747822381083882cdc3900f225fb86d32c7807f5704c02a67",
                    "equality-convex-seven-point-split-bridge-order",
                ),
                (
                    "f61b61bbc5d2e588f560c0bdf48c70121385b20e9ef52a6a3f04cc701af55250",
                    "equality-convex-seven-point-split-bridge-order",
                ),
                (
                    "ac6cb1b6360a767b99b9de594e86f5cbd854fd639b06503056d9d130e94d8d7b",
                    "equality-convex-seven-point-split-bridge-order",
                ),
            ],
        }
        for profile, prefix in expected.items():
            if profile == (5, 5, 5):
                prefix = prefix[:10]
            actual = [
                (
                    record["assignment_sha256"],
                    record["accepted_cut"]["core"]["stage"],
                )
                for record in cases[profile]["rounds"][: len(prefix)]
            ]
            self.assertEqual(actual, prefix)

    def test_arc_overtake_matcher_has_exact_archived_round_coverage(self) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        matched_rounds = []
        for record in case["rounds"]:
            rows = tuple(
                probe.cegar.decode_metric_row(encoded)
                for encoded in record["metric_rows"]
            )
            core = probe.six_point_two_circle_arc_overtake_order_core(
                rows, problem.frame.n, order
            )
            reverse_core = probe.six_point_two_circle_arc_overtake_order_core(
                rows, problem.frame.n, tuple(reversed(order))
            )
            self.assertIsNone(reverse_core, msg=f"round {record['round']}")
            if core is None:
                continue
            matched_rounds.append(record["round"])
            self.assertEqual(
                core["core"],
                {"O": 0, "A": 1, "D": 3, "E": 4, "F": 5, "C": 2},
            )
            self.assertEqual(
                core["lean_consumer"],
                "Problem97.Census554."
                "SixPointTwoCircleArcOvertakeOrderCore.false_of_core",
            )
        self.assertEqual(matched_rounds, list(range(10, 29)))

    def test_arc_overtake_cut_consolidates_current_rounds_ten_to_fifteen(
        self,
    ) -> None:
        case = self.checkpoint["cases"][1]
        stage = (
            "equality-convex-six-point-two-circle-arc-overtake-order"
        )
        for round_index in range(10, 16):
            with self.subTest(round_index=round_index):
                cut = case["rounds"][round_index]["accepted_cut"]
                self.assertEqual(cut["core"]["stage"], stage)
                self.assertEqual(cut["row_count"], 3)
                self.assertEqual(
                    {row["center"] for row in cut["rows"]}, {0, 1, 3}
                )

    def test_arc_overtake_matcher_needs_both_circles_and_order(self) -> None:
        metric_row = probe.metric_structure.MetricRow
        rows = (
            metric_row(0, (1, 2, 3, 4), exact=True),
            metric_row(1, (0, 2), exact=True),
            metric_row(3, (1, 4, 5), exact=True),
        )
        matcher = probe.six_point_two_circle_arc_overtake_order_core
        order = (0, 1, 3, 4, 5, 2)
        core = matcher(rows, 6, order)
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"],
            {"O": 0, "A": 1, "D": 3, "E": 4, "F": 5, "C": 2},
        )
        self.assertIsNone(matcher(rows[:2], 6, order))
        self.assertIsNone(matcher((rows[0], rows[2]), 6, order))
        self.assertIsNone(matcher((rows[1], rows[2]), 6, order))
        self.assertIsNone(matcher(rows, 6, (0, 1, 3, 5, 4, 2)))

    def test_five_row_circle_intersection_matcher_closes_round_nineteen(
        self,
    ) -> None:
        case = self.checkpoint["cases"][1]
        record = case["rounds"][19]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        core = probe.five_row_circle_intersection_order_core(
            rows, problem.frame.n, order
        )
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"],
            {
                "O": 0,
                "A": 1,
                "C": 2,
                "D": 3,
                "E": 4,
                "X5": 5,
                "X6": 6,
                "X9": 9,
            },
        )
        self.assertEqual(
            core["lean_consumer"],
            "Problem97.Census554."
            "FiveRowCircleIntersectionOrderCore.false_of_core",
        )
        self.assertEqual(probe.scan_formalized_core(problem, rows), core)
        retained, minimized_core = probe.minimize_formalized_core(
            problem, rows
        )
        self.assertEqual(len(retained), 5)
        self.assertEqual({row.center for row in retained}, {0, 1, 2, 3, 4})
        self.assertEqual(minimized_core, core)

    def test_five_row_circle_intersection_matcher_needs_all_rows_and_order(
        self,
    ) -> None:
        metric_row = probe.metric_structure.MetricRow
        rows = (
            metric_row(0, (1, 2, 3, 4), exact=True),
            metric_row(1, (0, 2, 6), exact=True),
            metric_row(2, (3, 9), exact=True),
            metric_row(3, (1, 5, 6), exact=True),
            metric_row(4, (0, 5, 9), exact=True),
        )
        matcher = probe.five_row_circle_intersection_order_core
        order = (0, 1, 3, 4, 2, 5, 6, 7, 8, 9)
        self.assertIsNotNone(matcher(rows, 10, order))
        for omitted in range(len(rows)):
            with self.subTest(omitted=omitted):
                self.assertIsNone(
                    matcher(rows[:omitted] + rows[omitted + 1 :], 10, order)
                )
        self.assertIsNone(
            matcher(rows, 10, (0, 1, 4, 3, 2, 5, 6, 7, 8, 9))
        )

    def test_five_row_circle_intersection_reverse_scan_uses_negative_consumer(
        self,
    ) -> None:
        record = self.checkpoint["cases"][1]["rounds"][19]
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        reflection = dict(zip(order, reversed(order), strict=True))
        metric_row = probe.metric_structure.MetricRow
        reflected = tuple(
            metric_row(
                reflection[row.center],
                tuple(reflection[label] for label in row.support),
                exact=True,
            )
            for row in (
                probe.cegar.decode_metric_row(encoded)
                for encoded in record["metric_rows"]
            )
        )
        self.assertIsNone(
            probe.five_row_circle_intersection_order_core(
                reflected, problem.frame.n, order
            )
        )
        core = probe.scan_formalized_core(problem, reflected)
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["stage"],
            "equality-convex-eight-point-"
            "five-row-circle-intersection-order-reverse",
        )
        self.assertEqual(core["cyclic_orientation"], "reverse")
        self.assertEqual(
            core["lean_consumer"],
            "Problem97.Census554."
            "FiveRowCircleIntersectionOrderCore.false_of_core_of_neg",
        )

    def test_arc_overtake_reverse_scan_uses_negative_consumer(self) -> None:
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        reflection = dict(zip(order, reversed(order), strict=True))
        record = self.pre_arc_checkpoint["cases"][1]["rounds"][10]
        metric_row = probe.metric_structure.MetricRow
        reflected = tuple(
            metric_row(
                reflection[row.center],
                tuple(reflection[label] for label in row.support),
                exact=True,
            )
            for row in (
                probe.cegar.decode_metric_row(encoded)
                for encoded in record["metric_rows"]
            )
        )
        self.assertIsNone(
            probe.six_point_two_circle_arc_overtake_order_core(
                reflected, problem.frame.n, order
            )
        )
        core = probe.scan_formalized_core(problem, reflected)
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["stage"],
            "equality-convex-six-point-two-circle-arc-overtake-order-reverse",
        )
        self.assertEqual(core["cyclic_orientation"], "reverse")
        self.assertEqual(
            core["lean_consumer"],
            "Problem97.Census554."
            "SixPointTwoCircleArcOvertakeOrderCore.false_of_core_of_neg",
        )

    def test_nested_matcher_replays_first_new_core(self) -> None:
        case = self.checkpoint["cases"][0]
        record = case["rounds"][1]
        rows = tuple(
            probe.metric_structure.MetricRow(
                int(row["center"]), tuple(row["support"]), bool(row["exact"])
            )
            for row in record["accepted_cut"]["rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[0]
        )
        core = probe.nested_equal_chord_core(
            rows, problem.frame.n, probe.shadow.hull_order(problem.frame)
        )
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"], {"o": 0, "a": 1, "b": 3, "c": 4, "d": 5}
        )

    def test_six_point_matcher_replays_555_round_seven_residual(self) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        record = case["rounds"][7]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        core = probe.six_point_two_circle_order_core(
            rows, problem.frame.n, order
        )
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"],
            {"A": 0, "P": 9, "Q": 11, "B": 1, "D": 3, "C": 2},
        )
        self.assertEqual(
            core["lean_consumer"],
            "Problem97.Census554.SixPointTwoCircleOrderCore.false_of_core",
        )

    def test_nested_center_matcher_replays_555_round_fourteen_residual(self) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        record = case["rounds"][14]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        core = probe.six_point_nested_center_order_core(
            rows, problem.frame.n, probe.shadow.hull_order(problem.frame)
        )
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"],
            {"O": 0, "A": 1, "D": 3, "E": 4, "X": 5, "C": 2},
        )
        self.assertEqual(
            core["lean_consumer"],
            "Problem97.Census554.SixPointNestedCenterOrderCore.false_of_core",
        )

    def test_nested_center_matcher_does_not_claim_next_555_survivor(self) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        record = case["rounds"][-1]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        self.assertIsNone(
            probe.six_point_nested_center_order_core(
                rows, problem.frame.n, probe.shadow.hull_order(problem.frame)
            )
        )

    def test_circle_chain_matcher_replays_555_round_seventeen_residual(self) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        record = case["rounds"][17]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        core = probe.six_point_circle_chain_order_core(
            rows, problem.frame.n, probe.shadow.hull_order(problem.frame)
        )
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"],
            {"O": 0, "A": 1, "D": 3, "E": 4, "C": 2, "Y": 8},
        )
        self.assertEqual(
            core["lean_consumer"],
            "Problem97.Census554.SixPointCircleChainOrderCore.false_of_core",
        )

    def test_wrap_order_matcher_replays_rounds_eighteen_and_nineteen(self) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        for round_index, expected_y in ((18, 9), (19, 10)):
            with self.subTest(round_index=round_index):
                record = case["rounds"][round_index]
                rows = tuple(
                    probe.cegar.decode_metric_row(encoded)
                    for encoded in record["metric_rows"]
                )
                self.assertIsNone(
                    probe.six_point_circle_chain_order_core(
                        rows, problem.frame.n, order
                    )
                )
                self.assertIsNone(
                    probe.six_point_circle_chain_order_core(
                        rows, problem.frame.n, tuple(reversed(order))
                    )
                )
                core = probe.six_point_circle_chain_wrap_order_core(
                    rows, problem.frame.n, order
                )
                self.assertIsNotNone(core)
                assert core is not None
                self.assertEqual(
                    core["core"],
                    {
                        "O": 0,
                        "Y": expected_y,
                        "A": 1,
                        "D": 3,
                        "E": 4,
                        "C": 2,
                    },
                )
                self.assertEqual(
                    core["lean_consumer"],
                    "Problem97.Census554.SixPointCircleChainWrapOrderCore."
                    "false_of_core",
                )

    def test_wrap_order_matcher_does_not_claim_round_twenty(self) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        record = case["rounds"][20]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        self.assertIsNone(
            probe.six_point_circle_chain_wrap_order_core(
                rows, problem.frame.n, order
            )
        )
        self.assertIsNone(
            probe.six_point_circle_chain_wrap_order_core(
                rows, problem.frame.n, tuple(reversed(order))
            )
        )

    def test_split_bridge_matcher_replays_rounds_twenty_through_twenty_two(
        self,
    ) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        for round_index, expected_w in ((20, 8), (21, 9), (22, 10)):
            with self.subTest(round_index=round_index):
                record = case["rounds"][round_index]
                rows = tuple(
                    probe.cegar.decode_metric_row(encoded)
                    for encoded in record["metric_rows"]
                )
                core = probe.seven_point_split_bridge_order_core(
                    rows, problem.frame.n, order
                )
                self.assertIsNotNone(core)
                assert core is not None
                self.assertEqual(
                    core["core"],
                    {
                        "O": 0,
                        "A": 1,
                        "C": 2,
                        "D": 3,
                        "E": 4,
                        "U": 6,
                        "W": expected_w,
                    },
                )
                self.assertEqual(
                    core["lean_consumer"],
                    "Problem97.Census554.SevenPointSplitBridgeOrderCore."
                    "false_of_core",
                )

    def test_split_bridge_matcher_requires_both_bridges_and_spine_order(self) -> None:
        metric_row = probe.metric_structure.MetricRow
        rows = (
            metric_row(0, (1, 2, 3, 4), exact=True),
            metric_row(1, (0, 2, 5), exact=True),
            metric_row(2, (3, 6), exact=True),
            metric_row(3, (1, 4, 5), exact=True),
            metric_row(4, (1, 6), exact=True),
        )
        order = (0, 5, 1, 3, 6, 4, 2)
        core = probe.seven_point_split_bridge_order_core(rows, 7, order)
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"],
            {"O": 0, "A": 1, "C": 2, "D": 3, "E": 4, "U": 5, "W": 6},
        )

        missing_first_bridge = (
            rows[0],
            rows[1],
            rows[2],
            metric_row(3, (1, 4), exact=True),
            rows[4],
        )
        self.assertIsNone(
            probe.seven_point_split_bridge_order_core(
                missing_first_bridge, 7, order
            )
        )

        missing_second_bridge = rows[:-1] + (
            metric_row(4, (1,), exact=True),
        )
        self.assertIsNone(
            probe.seven_point_split_bridge_order_core(
                missing_second_bridge, 7, order
            )
        )

        wrong_spine_order = (0, 5, 1, 4, 6, 3, 2)
        self.assertIsNone(
            probe.seven_point_split_bridge_order_core(
                rows, 7, wrong_spine_order
            )
        )

    def test_split_bridge_reverse_scan_uses_reflected_consumer(self) -> None:
        metric_row = probe.metric_structure.MetricRow
        rows = (
            metric_row(8, (7, 5, 6, 2), exact=True),
            metric_row(7, (8, 5, 4), exact=True),
            metric_row(6, (7, 2, 4), exact=True),
            metric_row(5, (6, 3), exact=True),
            metric_row(2, (7, 3), exact=True),
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        with patch.object(
            probe,
            "six_point_two_circle_arc_overtake_order_core",
            return_value=None,
        ):
            core = probe.scan_formalized_core(problem, rows)
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["stage"],
            "equality-convex-seven-point-split-bridge-order-reverse",
        )
        self.assertEqual(core["cyclic_orientation"], "reverse")
        self.assertEqual(
            core["lean_consumer"],
            "Problem97.Census554.SevenPointSplitBridgeOrderCore."
            "false_of_core_of_neg",
        )

    def test_tail_split_bridge_replays_rounds_twenty_four_through_twenty_six(
        self,
    ) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        for round_index, expected_w in ((24, 8), (25, 9), (26, 10)):
            with self.subTest(round_index=round_index):
                record = case["rounds"][round_index]
                rows = tuple(
                    probe.cegar.decode_metric_row(encoded)
                    for encoded in record["metric_rows"]
                )
                core = probe.seven_point_split_bridge_tail_order_core(
                    rows, problem.frame.n, order
                )
                self.assertIsNotNone(core)
                assert core is not None
                self.assertEqual(
                    core["core"],
                    {
                        "O": 0,
                        "A": 1,
                        "C": 2,
                        "D": 3,
                        "E": 4,
                        "U": 6,
                        "W": expected_w,
                    },
                )
                self.assertEqual(
                    core["lean_consumer"],
                    "Problem97.Census554."
                    "SevenPointSplitBridgeTailOrderCore.false_of_core",
                )
                self.assertEqual(
                    record["accepted_cut"]["core"]["stage"],
                    "equality-convex-seven-point-split-bridge-tail-order",
                )

        round_twenty_seven = case["rounds"][27]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in round_twenty_seven["metric_rows"]
        )
        self.assertIsNone(
            probe.seven_point_split_bridge_tail_order_core(
                rows, problem.frame.n, order
            )
        )
        self.assertIsNone(
            probe.seven_point_split_bridge_tail_order_core(
                rows, problem.frame.n, tuple(reversed(order))
            )
        )
        with patch.object(
            probe,
            "six_point_two_circle_arc_overtake_order_core",
            return_value=None,
        ):
            core = probe.scan_formalized_core(problem, rows)
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["stage"],
            "equality-convex-four-point-two-circle-bisector-order",
        )
        self.assertEqual(core["core"], {"Q": 0, "V": 5, "U": 3, "Y": 4})

    def test_tail_split_bridge_needs_both_bridges_and_spine_order(self) -> None:
        metric_row = probe.metric_structure.MetricRow
        rows = (
            metric_row(0, (1, 2, 3, 4), exact=True),
            metric_row(1, (0, 2, 5), exact=True),
            metric_row(2, (3, 6), exact=True),
            metric_row(3, (1, 4, 5), exact=True),
            metric_row(4, (2, 6), exact=True),
        )
        order = (0, 5, 1, 3, 6, 4, 2)
        matcher = probe.seven_point_split_bridge_tail_order_core
        core = matcher(rows, 7, order)
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"],
            {"O": 0, "A": 1, "C": 2, "D": 3, "E": 4, "U": 5, "W": 6},
        )
        self.assertIsNone(
            probe.seven_point_split_bridge_order_core(rows, 7, order)
        )

        missing_first_bridge = rows[:3] + (
            metric_row(3, (1, 4), exact=True),
            rows[4],
        )
        self.assertIsNone(matcher(missing_first_bridge, 7, order))

        missing_second_bridge = rows[:-1] + (
            metric_row(4, (2,), exact=True),
        )
        self.assertIsNone(matcher(missing_second_bridge, 7, order))

        wrong_spine_order = (0, 5, 1, 4, 6, 3, 2)
        self.assertIsNone(matcher(rows, 7, wrong_spine_order))

    def test_tail_split_bridge_reverse_scan_uses_negative_consumer(self) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        record = case["rounds"][24]
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        reflection = dict(zip(order, reversed(order), strict=True))
        metric_row = probe.metric_structure.MetricRow
        rows = tuple(
            metric_row(
                reflection[row.center],
                tuple(reflection[label] for label in row.support),
                exact=True,
            )
            for row in (
                probe.cegar.decode_metric_row(encoded)
                for encoded in record["metric_rows"]
            )
        )
        self.assertIsNone(
            probe.seven_point_split_bridge_tail_order_core(
                rows, problem.frame.n, order
            )
        )
        with patch.object(
            probe,
            "six_point_two_circle_arc_overtake_order_core",
            return_value=None,
        ):
            core = probe.scan_formalized_core(problem, rows)
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["stage"],
            "equality-convex-seven-point-split-bridge-tail-order-reverse",
        )
        self.assertEqual(core["cyclic_orientation"], "reverse")
        self.assertEqual(
            core["lean_consumer"],
            "Problem97.Census554.SevenPointSplitBridgeTailOrderCore."
            "false_of_core_of_neg",
        )

    def test_two_circle_bisector_matcher_replays_round_twenty_three(self) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        record = case["rounds"][23]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        core = probe.four_point_two_circle_bisector_order_core(
            rows, problem.frame.n, probe.shadow.hull_order(problem.frame)
        )
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"],
            {"Q": 0, "V": 5, "U": 3, "Y": 4},
        )
        self.assertEqual(
            core["lean_consumer"],
            "Problem97.Census554."
            "FourPointTwoCircleBisectorOrderCore.false_of_core",
        )

    def test_two_circle_bisector_matcher_needs_both_circles_and_order(self) -> None:
        metric_row = probe.metric_structure.MetricRow
        rows = (
            metric_row(0, (1, 2), exact=True),
            metric_row(1, (2, 3), exact=True),
            metric_row(2, (1, 3), exact=True),
        )
        matcher = probe.four_point_two_circle_bisector_order_core
        core = matcher(rows, 4, (0, 1, 2, 3))
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"],
            {"Q": 0, "V": 3, "U": 1, "Y": 2},
        )
        self.assertIsNone(matcher(rows[1:], 4, (0, 1, 2, 3)))
        self.assertIsNone(matcher(rows[:2], 4, (0, 1, 2, 3)))
        self.assertIsNone(matcher(rows, 4, (0, 1, 3, 2)))

    def test_two_circle_bisector_reverse_scan_uses_negative_consumer(self) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        record = case["rounds"][23]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        order = probe.shadow.hull_order(problem.frame)
        reverse_core = probe.four_point_two_circle_bisector_order_core(
            rows, problem.frame.n, tuple(reversed(order))
        )
        self.assertIsNotNone(reverse_core)
        assert reverse_core is not None
        with patch.object(
            probe,
            "six_point_two_circle_arc_overtake_order_core",
            return_value=None,
        ):
            with patch.object(
                probe,
                "four_point_two_circle_bisector_order_core",
                side_effect=[None, reverse_core],
            ):
                core = probe.scan_formalized_core(problem, rows)
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["stage"],
            "equality-convex-four-point-two-circle-bisector-order-reverse",
        )
        self.assertEqual(core["cyclic_orientation"], "reverse")
        self.assertEqual(
            core["lean_consumer"],
            "Problem97.Census554.FourPointTwoCircleBisectorOrderCore."
            "false_of_core_of_neg",
        )

    def test_two_circle_bisector_round_twenty_three_minimizes_to_three_rows(
        self,
    ) -> None:
        case = self.pre_arc_checkpoint["cases"][1]
        record = case["rounds"][23]
        decoded = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        rows = tuple(
            probe.metric_structure.MetricRow(
                row.center, row.support, exact=True
            )
            for row in decoded
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        with patch.object(
            probe,
            "six_point_two_circle_arc_overtake_order_core",
            return_value=None,
        ):
            retained, core = probe.minimize_formalized_core(problem, rows)
        self.assertEqual(len(retained), 3)
        self.assertEqual({row.center for row in retained}, {0, 3, 4})
        self.assertEqual(
            core["stage"],
            "equality-convex-four-point-two-circle-bisector-order",
        )

    def test_six_point_matcher_does_not_claim_456_round_five(self) -> None:
        case = self.checkpoint["cases"][0]
        record = case["rounds"][5]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[0]
        )
        core = probe.six_point_two_circle_order_core(
            rows, problem.frame.n, probe.shadow.hull_order(problem.frame)
        )
        self.assertIsNone(core)

    def test_mec_matcher_replays_456_round_five_residual(self) -> None:
        case = self.checkpoint["cases"][0]
        record = case["rounds"][5]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in record["metric_rows"]
        )
        problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[0]
        )
        core = probe.mec_straddling_row_core(problem, rows)
        self.assertIsNotNone(core)
        assert core is not None
        self.assertEqual(
            core["core"],
            {"o": 0, "a": 1, "p": 2, "s": 3, "x": 10, "y": 7},
        )
        self.assertEqual(core["cyclic_orientation_in_saved_order"], "forward")
        self.assertEqual(
            core["non_equality_dependencies"],
            {
                "status": "REQUIRED_FROM_LIVE_FIXED_FRAME_NOT_EQUALITY_ROWS",
                "profile": [4, 5, 6],
                "moser_mec_boundary_labels": [0, 1, 2],
                "mec_disk_labels": [10, 7],
                "nonobtuse_moser_vertex": 1,
                "strict_cyclic_orientation_triples": [
                    [0, 1, 2],
                    [0, 1, 3],
                    [0, 10, 3],
                    [0, 3, 7],
                ],
                "saved_hull_order": [0, 8, 9, 10, 11, 1, 3, 4, 2, 5, 6, 7],
            },
        )

    def test_mec_matcher_is_profile_aware(self) -> None:
        case = self.checkpoint["cases"][0]
        rows = tuple(
            probe.cegar.decode_metric_row(encoded)
            for encoded in case["rounds"][5]["metric_rows"]
        )
        other_problem = probe.build_problem(
            probe.cegar.metric_oracle.source_query.CASE_SEEDS[1]
        )
        self.assertIsNone(probe.mec_straddling_row_core(other_problem, rows))


class CommonSystemResidualOptimizerTests(unittest.TestCase):
    def test_saved_numerical_report_keeps_its_epistemic_boundary(self) -> None:
        path = HERE / "common_system_residual_optimizer.json"
        report = json.loads(path.read_text(encoding="utf-8"))
        self.assertEqual(
            report["epistemic_status"], "NUMERICAL_DISCOVERY_ONLY_NOT_A_PROOF"
        )
        cases = {tuple(case["profile"]): case for case in report["cases"]}
        for profile in ((4, 5, 6), (5, 5, 5)):
            case = cases[profile]
            self.assertEqual(
                case["status"],
                "NO_NUMERICAL_WITNESS_WITHIN_MULTISTART_BUDGET",
            )
            self.assertEqual(case["attempts_run"], 16)
            self.assertFalse(case["best_attempt"]["accepted"])
            self.assertIn("coordinates", case["best_attempt"]["diagnostics"])

    def test_mec_seed_accepts_a_best_attempt_without_a_witness(self) -> None:
        candidate = mec_probe.saved_candidate(12)
        self.assertEqual(candidate.shape, (20,))


if __name__ == "__main__":
    unittest.main()
