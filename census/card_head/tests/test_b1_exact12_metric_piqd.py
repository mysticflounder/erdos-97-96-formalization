from __future__ import annotations

import copy
import tempfile
import unittest
from dataclasses import replace
from pathlib import Path
from unittest.mock import patch

from census.card_head import b1_exact12_metric_piqd as metric_piqd

REPOSITORY_ROOT = Path(__file__).resolve().parents[3]
SOURCE_RESULT = (
    REPOSITORY_ROOT
    / "scratch/runs/b1-exact12-structural-20260830/wave-4/artifacts"
    / "b1-static-convex-p5-5-5-c5-raw-00000002.json"
)
WAVE6_SOURCE_RESULT = (
    REPOSITORY_ROOT
    / "scratch/runs/b1-exact12-structural-20260830/wave-6/artifacts"
    / "b1-static-convex-p5-5-5-c5-raw-00000002.json"
)
WAVE7_SOURCE_RESULT = (
    REPOSITORY_ROOT
    / "scratch/runs/b1-exact12-structural-20260830/wave-7/artifacts"
    / "b1-static-convex-p5-5-5-c5-raw-00000002.json"
)
WAVE9_SOURCE_RESULT = (
    REPOSITORY_ROOT
    / "scratch/runs/b1-exact12-structural-20260830/wave-9/artifacts"
    / "b1-static-convex-p5-5-5-c5-raw-00000002.json"
)
WAVE11_SOURCE_RESULT = (
    REPOSITORY_ROOT
    / "scratch/runs/b1-exact12-structural-20260830/wave-11/artifacts"
    / "b1-static-convex-p5-5-5-c5-raw-00000002.json"
)
WAVE13_SOURCE_RESULT = (
    REPOSITORY_ROOT
    / "scratch/runs/b1-exact12-structural-20260830/wave-13/artifacts"
    / "b1-static-convex-p5-5-5-c5-raw-00000002.json"
)
WAVE15_SOURCE_RESULT = (
    REPOSITORY_ROOT
    / "scratch/runs/b1-exact12-structural-20260830/wave-15/artifacts"
    / "b1-static-convex-p5-5-5-c5-raw-00000002.json"
)
WAVE17_SOURCE_RESULT = (
    REPOSITORY_ROOT
    / "scratch/runs/b1-exact12-structural-20260830/wave-17/artifacts"
    / "b1-static-convex-p5-5-5-c5-raw-00000002.json"
)
WAVE19_SOURCE_RESULT = (
    REPOSITORY_ROOT
    / "scratch/runs/b1-exact12-structural-20260830/wave-19/artifacts"
    / "b1-static-convex-p5-5-5-c5-raw-00000002.json"
)
RESIDUAL_ORDER = (0, 9, 11, 10, 1, 3, 5, 4, 2, 6, 7, 8)
REVERSE_BLOCK_ORDER = (0, 6, 8, 7, 2, 5, 3, 4, 1, 11, 9, 10)


class B1Exact12MetricPiqdTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.binding = metric_piqd.load_source_result(SOURCE_RESULT)
        cls.wave7_binding = metric_piqd.load_source_result(WAVE7_SOURCE_RESULT)
        cls.wave9_binding = metric_piqd.load_source_result(WAVE9_SOURCE_RESULT)
        cls.wave11_binding = metric_piqd.load_source_result(WAVE11_SOURCE_RESULT)
        cls.wave13_binding = metric_piqd.load_source_result(WAVE13_SOURCE_RESULT)
        cls.wave15_binding = metric_piqd.load_source_result(WAVE15_SOURCE_RESULT)
        cls.wave17_binding = metric_piqd.load_source_result(WAVE17_SOURCE_RESULT)
        cls.wave19_binding = metric_piqd.load_source_result(WAVE19_SOURCE_RESULT)

    def test_builds_deterministic_exact_false_system(self) -> None:
        system = metric_piqd.build_system(self.binding, RESIDUAL_ORDER)

        self.assertEqual(system["system_id"], "87a799480578bbdc145e")
        self.assertEqual(system["n"], 12)
        self.assertEqual(system["profile"], [5, 5, 5])
        self.assertEqual(system["order"], list(RESIDUAL_ORDER))
        self.assertEqual(len(system["rows"]), 12)
        self.assertEqual(
            [row["center"] for row in system["rows"]], list(range(12))
        )
        self.assertTrue(all(row["exact"] is False for row in system["rows"]))

    def test_loads_wave7_and_builds_pinned_system(self) -> None:
        system = metric_piqd.build_system(self.wave7_binding, RESIDUAL_ORDER)

        self.assertEqual(self.wave7_binding.revision.run_id, "wave-7")
        self.assertEqual(
            self.wave7_binding.result_capture.sha256,
            "5043335dda6359c4c0bcd6eae7ed9df4d6e2848c5c1c80ecf9be0ed9dec32daf",
        )
        self.assertEqual(
            self.wave7_binding.run_manifest_capture.sha256,
            "497a8c88823e1ea5ba4f820a2b4b8b684c054a788c53d5af38d7fb1e5cee8052",
        )
        self.assertEqual(system["system_id"], "d696b114d46f0ccd8a7b")
        self.assertEqual(system["sources"][0]["run_id"], "wave-7")
        self.assertEqual(
            system["sources"][0]["cnf_sha256"],
            "38bfd42bad689ef537f9af7d13a814e6988db9b104b9cd05bf8cf635ae17c64e",
        )
        geometry = self.wave7_binding.result["static_geometry_manifest"]
        convex = self.wave7_binding.result["static_convex_manifest"]
        self.assertEqual(geometry["schema"], "p97_b1_exact12_static_geometry.v2")
        self.assertEqual(convex["schema"], "p97_b1_exact12_static_convex.v2")
        self.assertEqual(
            convex["parent"]["schema"],
            "p97_b1_exact12_static_geometry.v2",
        )
        counts = geometry["counts"]
        self.assertEqual(counts["equilateral_bisector_clauses"], 95_040)
        self.assertEqual(counts["qcritical_aux_center_clauses"], 665_280)
        self.assertEqual(counts["total_geometry_clauses"], 760_320)
        self.assertEqual(
            counts["equilateral_bisector_clauses"]
            + counts["qcritical_aux_center_clauses"],
            counts["total_geometry_clauses"],
        )

    def test_loads_wave9_and_builds_pinned_system(self) -> None:
        order = (0, 9, 10, 11, 1, 3, 5, 4, 2, 6, 8, 7)
        system = metric_piqd.build_system(self.wave9_binding, order)

        self.assertEqual(self.wave9_binding.revision.run_id, "wave-9")
        self.assertEqual(
            self.wave9_binding.result_capture.sha256,
            "559ba92ce30e3517ce587c3e56d000d076ff43a6f4e4e81c7d3af1861bd3e800",
        )
        self.assertEqual(
            self.wave9_binding.run_manifest_capture.sha256,
            "eb2b48d9dfa0511c588fa6454d905c653e19cf3293ae34395b55eb68b3ecd2c2",
        )
        self.assertEqual(system["system_id"], "28d5d18112b6c6898870")
        self.assertEqual(system["sources"][0]["run_id"], "wave-9")
        self.assertEqual(
            system["sources"][0]["cnf_sha256"],
            "0e626e7266cfcbb8c3a2f5632f408bc75ea6bd794276af993252932ec85e997d",
        )
        geometry = self.wave9_binding.result["static_geometry_manifest"]
        convex = self.wave9_binding.result["static_convex_manifest"]
        self.assertEqual(geometry["schema"], "p97_b1_exact12_static_geometry.v3")
        self.assertEqual(convex["schema"], "p97_b1_exact12_static_convex.v3")
        self.assertEqual(
            convex["parent"]["schema"],
            "p97_b1_exact12_static_geometry.v3",
        )
        counts = geometry["counts"]
        self.assertEqual(counts["equilateral_bisector_clauses"], 95_040)
        self.assertEqual(counts["qcritical_aux_center_clauses"], 665_280)
        self.assertEqual(counts["seven_point_six_row_anchor_clauses"], 1)
        self.assertEqual(counts["total_geometry_clauses"], 760_321)
        self.assertEqual(
            counts["equilateral_bisector_clauses"]
            + counts["qcritical_aux_center_clauses"]
            + counts["seven_point_six_row_anchor_clauses"],
            counts["total_geometry_clauses"],
        )

    def test_loads_wave11_and_builds_pinned_system(self) -> None:
        order = (0, 9, 10, 11, 1, 3, 5, 4, 2, 6, 8, 7)
        system = metric_piqd.build_system(self.wave11_binding, order)

        self.assertEqual(self.wave11_binding.revision.run_id, "wave-11")
        self.assertEqual(
            self.wave11_binding.result_capture.sha256,
            "1a428aeaf477a664cdbf49fef51f78215faf918e95a70e8b0dcf32862c95d9e9",
        )
        self.assertEqual(
            self.wave11_binding.run_manifest_capture.sha256,
            "f1f1ce8fdf54f9e5faf03840858286c682526a6f3a260c0926dd5676d3f54df4",
        )
        self.assertEqual(system["system_id"], "4bdecde2d2f7a9d94575")
        self.assertEqual(system["sources"][0]["run_id"], "wave-11")
        self.assertEqual(
            system["sources"][0]["cnf_sha256"],
            "2b08cb602088947a024938a5c383bff5e2f9b026a4731435a8307cfec2bd1428",
        )
        geometry = self.wave11_binding.result["static_geometry_manifest"]
        convex = self.wave11_binding.result["static_convex_manifest"]
        self.assertEqual(geometry["schema"], "p97_b1_exact12_static_geometry.v4")
        self.assertEqual(convex["schema"], "p97_b1_exact12_static_convex.v4")
        self.assertEqual(
            convex["parent"]["schema"],
            "p97_b1_exact12_static_geometry.v4",
        )
        counts = geometry["counts"]
        self.assertEqual(counts["equilateral_bisector_clauses"], 95_040)
        self.assertEqual(counts["qcritical_aux_center_clauses"], 665_280)
        self.assertEqual(counts["seven_point_six_row_anchor_clauses"], 1)
        self.assertEqual(counts["seven_point_six_row_interlock_clauses"], 1)
        self.assertEqual(counts["total_geometry_clauses"], 760_322)
        self.assertEqual(
            counts["equilateral_bisector_clauses"]
            + counts["qcritical_aux_center_clauses"]
            + counts["seven_point_six_row_anchor_clauses"]
            + counts["seven_point_six_row_interlock_clauses"],
            counts["total_geometry_clauses"],
        )

    def test_loads_wave13_and_builds_pinned_system(self) -> None:
        order = (0, 9, 10, 11, 1, 3, 5, 4, 2, 6, 8, 7)
        system = metric_piqd.build_system(self.wave13_binding, order)

        self.assertEqual(self.wave13_binding.revision.run_id, "wave-13")
        self.assertEqual(
            self.wave13_binding.result_capture.sha256,
            "5a9cc9e980f458e39ed35de9bf738b4bae01d1926b2d08225a15b5d4f445631f",
        )
        self.assertEqual(
            self.wave13_binding.run_manifest_capture.sha256,
            "5b9b65639e128054739cdb04a9fde557e9adf0f1228aa7199b56f712424f9e1a",
        )
        self.assertEqual(system["system_id"], "9d528784e959be1bf64e")
        self.assertEqual(system["sources"][0]["run_id"], "wave-13")
        self.assertEqual(
            system["sources"][0]["cnf_sha256"],
            "613278fbba437a44553d35e0da2783d631a2811cf8806cf8e1127a24157cb374",
        )
        geometry = self.wave13_binding.result["static_geometry_manifest"]
        convex = self.wave13_binding.result["static_convex_manifest"]
        self.assertEqual(geometry["schema"], "p97_b1_exact12_static_geometry.v5")
        self.assertEqual(convex["schema"], "p97_b1_exact12_static_convex.v5")
        self.assertEqual(
            convex["parent"]["schema"],
            "p97_b1_exact12_static_geometry.v5",
        )
        counts = geometry["counts"]
        self.assertEqual(counts["equilateral_bisector_clauses"], 95_040)
        self.assertEqual(counts["qcritical_aux_center_clauses"], 665_280)
        self.assertEqual(counts["seven_point_six_row_anchor_clauses"], 1)
        self.assertEqual(counts["seven_point_six_row_interlock_clauses"], 1)
        self.assertEqual(counts["six_point_five_row_interlock_clauses"], 1)
        self.assertEqual(counts["total_geometry_clauses"], 760_323)
        self.assertEqual(
            counts["equilateral_bisector_clauses"]
            + counts["qcritical_aux_center_clauses"]
            + counts["seven_point_six_row_anchor_clauses"]
            + counts["seven_point_six_row_interlock_clauses"]
            + counts["six_point_five_row_interlock_clauses"],
            counts["total_geometry_clauses"],
        )

    def test_loads_wave15_and_builds_pinned_system(self) -> None:
        order = (0, 9, 10, 11, 1, 3, 5, 4, 2, 6, 8, 7)
        system = metric_piqd.build_system(self.wave15_binding, order)

        self.assertEqual(self.wave15_binding.revision.run_id, "wave-15")
        self.assertEqual(
            self.wave15_binding.result_capture.sha256,
            "8c5cc840cf1b8e10b309f866a4768ee2d8e5399469eb51e99e2aa5c9ee03ab0a",
        )
        self.assertEqual(
            self.wave15_binding.run_manifest_capture.sha256,
            "c590168de3b1a8e639f4b9dff8183a27bdf75c22188afe4932fe59b649d6ce83",
        )
        self.assertEqual(system["system_id"], "b31ae69353b378e12e00")
        self.assertEqual(system["sources"][0]["run_id"], "wave-15")
        self.assertEqual(
            system["sources"][0]["cnf_sha256"],
            "a54729622f73b323c25dff97174e2bc385dab0dc42814d826380c071dd7012eb",
        )
        geometry = self.wave15_binding.result["static_geometry_manifest"]
        convex = self.wave15_binding.result["static_convex_manifest"]
        self.assertEqual(geometry["schema"], "p97_b1_exact12_static_geometry.v6")
        self.assertEqual(convex["schema"], "p97_b1_exact12_static_convex.v6")
        self.assertEqual(
            convex["parent"]["schema"],
            "p97_b1_exact12_static_geometry.v6",
        )
        counts = geometry["counts"]
        self.assertEqual(counts["equilateral_bisector_clauses"], 95_040)
        self.assertEqual(counts["qcritical_aux_center_clauses"], 665_280)
        self.assertEqual(counts["seven_point_six_row_anchor_clauses"], 1)
        self.assertEqual(counts["seven_point_six_row_interlock_clauses"], 1)
        self.assertEqual(counts["six_point_five_row_interlock_clauses"], 1)
        self.assertEqual(counts["seven_point_seven_row_interlock_clauses"], 1)
        self.assertEqual(counts["total_geometry_clauses"], 760_324)
        self.assertEqual(
            counts["equilateral_bisector_clauses"]
            + counts["qcritical_aux_center_clauses"]
            + counts["seven_point_six_row_anchor_clauses"]
            + counts["seven_point_six_row_interlock_clauses"]
            + counts["six_point_five_row_interlock_clauses"]
            + counts["seven_point_seven_row_interlock_clauses"],
            counts["total_geometry_clauses"],
        )

    def test_loads_wave17_and_builds_pinned_system(self) -> None:
        order = (0, 9, 10, 11, 1, 3, 5, 4, 2, 6, 8, 7)
        system = metric_piqd.build_system(self.wave17_binding, order)

        self.assertEqual(self.wave17_binding.revision.run_id, "wave-17")
        self.assertEqual(
            self.wave17_binding.result_capture.sha256,
            "f663c379e8a6b21046dc50e6d62ce9d98c14d936be9f5133fa126002c476862b",
        )
        self.assertEqual(
            self.wave17_binding.run_manifest_capture.sha256,
            "d7b7415c4bd6a98181fb176685136d0863f80ff07ff34e721f37b47e11a482fe",
        )
        self.assertEqual(system["system_id"], "e28ad6ba21266e7ad92f")
        self.assertEqual(system["sources"][0]["run_id"], "wave-17")
        self.assertEqual(
            system["sources"][0]["cnf_sha256"],
            "fd3bf4e15cecfd88de1635bbe4eb1bdc3a4538b25ee9dd20f598eb54f80b2493",
        )
        self.assertEqual(self.wave17_binding.result["solver"]["verdict"], "SAT")
        self.assertEqual(
            self.wave17_binding.result["counts"],
            {
                "clauses": 1_305_214,
                "positive_variables": 30_739,
                "variables": 45_069,
            },
        )
        geometry = self.wave17_binding.result["static_geometry_manifest"]
        convex = self.wave17_binding.result["static_convex_manifest"]
        self.assertEqual(geometry["schema"], "p97_b1_exact12_static_geometry.v7")
        self.assertEqual(convex["schema"], "p97_b1_exact12_static_convex.v7")
        self.assertEqual(
            convex["parent"]["schema"],
            "p97_b1_exact12_static_geometry.v7",
        )
        counts = geometry["counts"]
        self.assertEqual(counts["added_clauses"], 760_325)
        self.assertEqual(counts["final_clauses"], 1_297_294)
        self.assertEqual(counts["equilateral_bisector_clauses"], 95_040)
        self.assertEqual(counts["qcritical_aux_center_clauses"], 665_280)
        self.assertEqual(counts["seven_point_six_row_anchor_clauses"], 1)
        self.assertEqual(counts["seven_point_six_row_interlock_clauses"], 1)
        self.assertEqual(counts["six_point_five_row_interlock_clauses"], 1)
        self.assertEqual(counts["seven_point_seven_row_interlock_clauses"], 1)
        self.assertEqual(counts["six_point_six_row_interlock_clauses"], 1)
        self.assertEqual(counts["total_geometry_clauses"], 760_325)
        self.assertEqual(
            counts["equilateral_bisector_clauses"]
            + counts["qcritical_aux_center_clauses"]
            + counts["seven_point_six_row_anchor_clauses"]
            + counts["seven_point_six_row_interlock_clauses"]
            + counts["six_point_five_row_interlock_clauses"]
            + counts["seven_point_seven_row_interlock_clauses"]
            + counts["six_point_six_row_interlock_clauses"],
            counts["total_geometry_clauses"],
        )

    def test_loads_wave19_and_builds_pinned_system(self) -> None:
        order = (0, 9, 10, 11, 1, 3, 5, 4, 2, 6, 8, 7)
        system = metric_piqd.build_system(self.wave19_binding, order)

        self.assertEqual(self.wave19_binding.revision.run_id, "wave-19")
        self.assertEqual(
            self.wave19_binding.result_capture.sha256,
            "8886e33919689fed27c1a184e83a2e01d60ee545ee6fea2b0d3c4940aa2f136e",
        )
        self.assertEqual(
            self.wave19_binding.run_manifest_capture.sha256,
            "9561c4a93089d4260e47cd013399bdc7f0547e59c79db798565416f9aecb339e",
        )
        self.assertEqual(system["system_id"], "d972d023a2ff60fd79f7")
        self.assertEqual(system["sources"][0]["run_id"], "wave-19")
        self.assertEqual(
            system["sources"][0]["cnf_sha256"],
            "d3ea806ab3032535faef6788a9d50018238688446ecb093d13fcbc3f462422e3",
        )
        self.assertEqual(self.wave19_binding.result["solver"]["verdict"], "SAT")
        self.assertEqual(
            self.wave19_binding.result["counts"],
            {
                "clauses": 1_305_215,
                "positive_variables": 30_733,
                "variables": 45_069,
            },
        )
        geometry = self.wave19_binding.result["static_geometry_manifest"]
        convex = self.wave19_binding.result["static_convex_manifest"]
        self.assertEqual(geometry["schema"], "p97_b1_exact12_static_geometry.v8")
        self.assertEqual(convex["schema"], "p97_b1_exact12_static_convex.v8")
        self.assertEqual(
            convex["parent"]["schema"],
            "p97_b1_exact12_static_geometry.v8",
        )
        counts = geometry["counts"]
        self.assertEqual(counts["added_clauses"], 760_326)
        self.assertEqual(counts["final_clauses"], 1_297_295)
        self.assertEqual(counts["seven_point_equilateral_median_interlock_clauses"], 1)
        self.assertEqual(counts["total_geometry_clauses"], 760_326)
        self.assertEqual(
            counts["equilateral_bisector_clauses"]
            + counts["qcritical_aux_center_clauses"]
            + counts["seven_point_six_row_anchor_clauses"]
            + counts["seven_point_six_row_interlock_clauses"]
            + counts["six_point_five_row_interlock_clauses"]
            + counts["seven_point_seven_row_interlock_clauses"]
            + counts["six_point_six_row_interlock_clauses"]
            + counts["seven_point_equilateral_median_interlock_clauses"],
            counts["total_geometry_clauses"],
        )

    def test_rejects_crossed_schema_hash_and_run(self) -> None:
        crossed_schema = copy.deepcopy(self.wave7_binding.result)
        crossed_schema["static_geometry_manifest"]["schema"] = (
            "p97_b1_exact12_static_geometry.v1"
        )
        with self.assertRaisesRegex(
            metric_piqd.B1Exact12MetricPiqdError, "schema is crossed"
        ):
            metric_piqd._validate_static_result(
                crossed_schema,
                WAVE7_SOURCE_RESULT,
                self.wave7_binding.revision,
            )

        crossed_capture = replace(
            self.wave7_binding.result_capture,
            sha256="0" * 64,
        )
        with self.assertRaisesRegex(
            metric_piqd.B1Exact12MetricPiqdError, "result file hash is crossed"
        ):
            metric_piqd._select_source_revision(
                self.wave7_binding.result,
                self.wave7_binding.run_manifest,
                crossed_capture,
                self.wave7_binding.run_manifest_capture,
            )

        crossed_manifest_capture = replace(
            self.wave7_binding.run_manifest_capture,
            sha256="0" * 64,
        )
        with self.assertRaisesRegex(
            metric_piqd.B1Exact12MetricPiqdError,
            "run manifest file hash is crossed",
        ):
            metric_piqd._select_source_revision(
                self.wave7_binding.result,
                self.wave7_binding.run_manifest,
                self.wave7_binding.result_capture,
                crossed_manifest_capture,
            )

        crossed_manifest = copy.deepcopy(self.wave7_binding.run_manifest)
        crossed_manifest["run_id"] = "wave-4"
        with self.assertRaisesRegex(
            metric_piqd.B1Exact12MetricPiqdError, "identities are crossed"
        ):
            metric_piqd._select_source_revision(
                self.wave7_binding.result,
                crossed_manifest,
                self.wave7_binding.result_capture,
                self.wave7_binding.run_manifest_capture,
            )

    def test_rejects_uncorrected_wave6_source(self) -> None:
        with self.assertRaisesRegex(
            metric_piqd.B1Exact12MetricPiqdError,
            "authenticated canonical source revision",
        ):
            metric_piqd.load_source_result(WAVE6_SOURCE_RESULT)

    def test_validates_both_cap_block_orientations(self) -> None:
        self.assertEqual(
            metric_piqd.validate_cap_block_order(RESIDUAL_ORDER),
            RESIDUAL_ORDER,
        )
        self.assertEqual(
            metric_piqd.validate_cap_block_order(REVERSE_BLOCK_ORDER),
            REVERSE_BLOCK_ORDER,
        )
        with self.assertRaisesRegex(
            metric_piqd.B1Exact12MetricPiqdError, "cap-block"
        ):
            metric_piqd.validate_cap_block_order(tuple(range(12)))
        malformed = list(RESIDUAL_ORDER)
        malformed[1] = True
        with self.assertRaisesRegex(
            metric_piqd.B1Exact12MetricPiqdError, "permutation"
        ):
            metric_piqd.validate_cap_block_order(malformed)

    def test_prepares_authenticated_full_convex_query(self) -> None:
        prepared = metric_piqd.prepare_stage(
            self.binding,
            RESIDUAL_ORDER,
            "full-convex",
            timeout_ms=300_000,
        )

        self.assertEqual(prepared.system["system_id"], "87a799480578bbdc145e")
        self.assertEqual(
            prepared.source_record["constraint_counts"],
            {
                "gauge": 4,
                "fixture_pins": 0,
                "equalities": 36,
                "exactness": 0,
                "distinctness": 66,
                "convexity": 120,
                "total": 226,
            },
        )
        self.assertEqual(len(prepared.query.journal_commands), 251)
        self.assertNotIn("(check-sat)", prepared.query.journal_commands)
        self.assertNotIn("(get-model)", prepared.query.journal_commands)
        self.assertEqual(len(prepared.query.source_files), 7)
        self.assertTrue(
            all(value is False for value in prepared.source_record["claims"].values())
        )

    def test_rejects_mutated_in_memory_binding(self) -> None:
        result = copy.deepcopy(self.binding.result)
        result["cube"]["0"] = [2, 3, 4, 6]
        tampered = replace(self.binding, result=result)
        with self.assertRaisesRegex(
            metric_piqd.B1Exact12MetricPiqdError, "in-memory binding"
        ):
            metric_piqd.build_system(tampered, RESIDUAL_ORDER)

    def test_unknown_run_publishes_create_once_custody(self) -> None:
        engine = {
            "raw_status": "UNKNOWN",
            "effective_status": "UNKNOWN",
            "solver": "z3",
            "session_id": "00000000-0000-4000-8000-000000000001",
        }
        with tempfile.TemporaryDirectory(dir=REPOSITORY_ROOT / "scratch") as temporary:
            output = Path(temporary) / "published"
            with patch.object(
                metric_piqd.neutral,
                "run_authenticated_single_solver_query",
                return_value=engine,
            ):
                result = metric_piqd.run_stage(
                    self.binding,
                    RESIDUAL_ORDER,
                    "exact-metric-relaxation",
                    timeout_s=1.0,
                    transport=object(),  # type: ignore[arg-type]
                    output_directory=output,
                )
            self.assertEqual(result["status"], "UNKNOWN")
            self.assertEqual(result["classification"], "UNKNOWN_INCONCLUSIVE")
            self.assertTrue((output / "result.json").is_file())
            self.assertTrue((output / "descriptor.json").is_file())

    def test_sat_without_semantic_replay_is_rejected(self) -> None:
        engine = {
            "raw_status": "SAT",
            "effective_status": "SAT",
            "solver": "z3",
            "semantic_replay": None,
        }
        with tempfile.TemporaryDirectory(dir=REPOSITORY_ROOT / "scratch") as temporary:
            output = Path(temporary) / "rejected"
            with (
                patch.object(
                    metric_piqd.neutral,
                    "run_authenticated_single_solver_query",
                    return_value=engine,
                ),
                self.assertRaisesRegex(
                    metric_piqd.B1Exact12MetricPiqdError,
                    "exact-rational semantic replay",
                ),
            ):
                metric_piqd.run_stage(
                    self.binding,
                    RESIDUAL_ORDER,
                    "full-convex",
                    timeout_s=1.0,
                    transport=object(),  # type: ignore[arg-type]
                    output_directory=output,
                )
            self.assertFalse(output.exists())


if __name__ == "__main__":
    unittest.main()
