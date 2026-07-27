#!/usr/bin/env python3
"""Tests for the authenticated P4 finite row/arc materializer."""

from __future__ import annotations

import copy
from collections import Counter
import hashlib
import importlib.util
import json
from pathlib import Path
import shutil
import sys
import tempfile
import unittest


HERE = Path(__file__).resolve().parent
DURABLE_TEST_ROOT = HERE / "scratch-tests"
MODULE_PATH = HERE / "materialize_p4_direct_row_arc_finite.py"
SPEC = importlib.util.spec_from_file_location("p4_finite_materializer", MODULE_PATH)
assert SPEC is not None and SPEC.loader is not None
materializer = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = materializer
SPEC.loader.exec_module(materializer)


def independent_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def example_map_entry() -> dict[str, object]:
    return {
        "allocated_family": materializer.TARGET_FAMILY,
        "allocated_input_clause_index": 2_598_679,
        "allocated_input_clause_literal_order": [-10_283, 10_232],
        "candidate_provenance": [
            {
                "family": materializer.TARGET_FAMILY,
                "input_clause_index": 2_598_679,
                "input_clause_literal_order": [-10_283, 10_232],
                "literal_order_matches_core": False,
                "semantic_parameters": {
                    "center": 0,
                    "outer_arc": {
                        "center": 0,
                        "side": "left",
                        "turn_mask": 15,
                    },
                    "producer_function": "add_direct_curvature_overlay",
                    "row_support": [1, 5, 6, 7],
                },
            }
        ],
        "core_clause_index": 29_749,
        "core_clause_literal_order": [10_232, -10_283],
    }


class P4DirectRowArcFiniteMaterializerTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        DURABLE_TEST_ROOT.mkdir(parents=True, exist_ok=True)
        cls._temporary = tempfile.TemporaryDirectory(dir=DURABLE_TEST_ROOT)
        root = Path(cls._temporary.name)
        cls.first = root / "first"
        cls.second = root / "second"
        cls.first_manifest = materializer.materialize(cls.first)
        cls.second_manifest = materializer.materialize(cls.second)

    @classmethod
    def tearDownClass(cls) -> None:
        cls._temporary.cleanup()

    def test_pinned_source_hashes_and_exact_counts(self) -> None:
        self.assertEqual(
            independent_sha256(materializer.MAP_PATH),
            materializer.MAP_SHA256,
        )
        self.assertEqual(
            independent_sha256(materializer.COMPACT_MANIFEST_PATH),
            materializer.COMPACT_MANIFEST_SHA256,
        )
        self.assertEqual(
            independent_sha256(materializer.COMPACT_LEDGER_PATH),
            materializer.COMPACT_LEDGER_SHA256,
        )
        records = [
            json.loads(line)
            for line in (
                self.first / materializer.LEDGER_NAME
            ).read_text(encoding="utf-8").splitlines()
        ]
        self.assertEqual(len(records), 3_179)
        self.assertEqual(
            Counter(record["side"] for record in records),
            Counter({"left": 1_599, "right": 1_580}),
        )
        self.assertEqual(
            sorted(set(record["center"] for record in records)),
            list(range(11)),
        )
        self.assertEqual(
            len(
                {
                    (
                        record["center"],
                        tuple(record["row_support"]),
                        record["side"],
                        record["turn_mask"],
                    )
                    for record in records
                }
            ),
            3_179,
        )

    def test_exact_parameter_decoding(self) -> None:
        self.assertEqual(
            materializer.decode_target_entry(example_map_entry()),
            (29_749, 2_598_679, 0, (1, 5, 6, 7), "left", 15),
        )
        first_chunk = (
            self.first / materializer.chunk_filename(0)
        ).read_text(
            encoding="utf-8"
        )
        self.assertIn(
            "{ outputClauseIndex := 8430, coreClauseIndex := 29749, "
            "terminalClauseIndex := 2598679, datum := { row := "
            "⟨0, {1, 5, 6, 7}⟩, arc := ⟨0, .left, {0, 1, 2, 3}⟩ } },",
            first_chunk,
        )
        aggregate = (self.first / materializer.LEAN_NAME).read_text(
            encoding="utf-8"
        )
        self.assertIn(
            "∀ datum ∈ directRowArcFiniteData, datum.Valid := by",
            aggregate,
        )
        self.assertIn(
            "directRowArcFiniteOccurrences : List DirectRowArcFiniteOccurrence",
            aggregate,
        )
        self.assertNotIn("native_decide", aggregate)
        self.assertIn(
            "have h001 := List.forall_mem_append.2\n"
            "      ⟨directRowArcFiniteOccurrencesChunk000_batch_valid.2, "
            "directRowArcFiniteOccurrencesChunk001_batch_valid.2⟩",
            aggregate,
        )
        self.assertIn(
            "⟨h023, directRowArcFiniteOccurrencesChunk024_batch_valid.2⟩\n"
            "    exact h024",
            aggregate,
        )
        self.assertIn("directRowArcFiniteDataCount]", aggregate)
        chunk_native_decides = sum(
            (
                self.first / materializer.chunk_filename(index)
            ).read_text(encoding="utf-8").count("native_decide")
            for index in range(materializer.EXPECTED_CHUNK_COUNT)
        )
        self.assertEqual(
            chunk_native_decides, materializer.EXPECTED_CHUNK_COUNT
        )

    def test_deterministic_chunk_boundaries_and_import_aggregation(self) -> None:
        manifest = self.first_manifest
        chunks = manifest["lean_chunks"]
        self.assertEqual(len(chunks), 25)
        self.assertEqual(
            [chunk["datum_count"] for chunk in chunks],
            [128] * 24 + [107],
        )
        records = [
            json.loads(line)
            for line in (
                self.first / materializer.LEDGER_NAME
            ).read_text(encoding="utf-8").splitlines()
        ]
        for index, chunk in enumerate(chunks):
            start = index * materializer.CHUNK_SIZE
            stop = start + chunk["datum_count"]
            self.assertEqual(
                chunk["first_output_clause_index"],
                records[start]["output_clause_index"],
            )
            self.assertEqual(
                chunk["last_output_clause_index"],
                records[stop - 1]["output_clause_index"],
            )
        aggregate = (self.first / materializer.LEAN_NAME).read_text(
            encoding="utf-8"
        )
        import_lines = [
            line for line in aggregate.splitlines() if line.startswith("import ")
        ]
        self.assertEqual(
            import_lines,
            [
                f"import {materializer.chunk_module_name(index)}"
                for index in range(materializer.EXPECTED_CHUNK_COUNT)
            ],
        )
        definition_order = [
            aggregate.index(f"directRowArcFiniteOccurrencesChunk{index:03d}")
            for index in range(materializer.EXPECTED_CHUNK_COUNT)
        ]
        self.assertEqual(definition_order, sorted(definition_order))

    def test_deterministic_output_and_manifest_digests(self) -> None:
        for name in materializer.OUTPUT_NAMES:
            self.assertEqual(
                (self.first / name).read_bytes(),
                (self.second / name).read_bytes(),
            )
        manifest = materializer.verify_generated(self.first)
        self.assertEqual(manifest, self.first_manifest)
        self.assertEqual(manifest, self.second_manifest)
        self.assertEqual(
            manifest["stable_digest"]["sha256"],
            materializer.compute_stable_digest(manifest),
        )
        self.assertEqual(
            independent_sha256(self.first / materializer.LEAN_NAME),
            manifest["lean_module"]["sha256"],
        )
        for chunk in manifest["lean_chunks"]:
            self.assertEqual(
                independent_sha256(self.first / chunk["path"]),
                chunk["sha256"],
            )
        self.assertEqual(
            independent_sha256(self.first / materializer.LEDGER_NAME),
            manifest["provenance_ledger"]["sha256"],
        )

    def test_source_and_output_path_traversal_are_rejected(self) -> None:
        with self.assertRaises(materializer.MaterializationError):
            materializer.resolve_fixed_input(
                "../p4.input-core-map.json",
                allowed_dir=materializer.CORE_MAP_DIR,
                expected_name=materializer.MAP_PATH.name,
                label="test source",
            )
        with tempfile.TemporaryDirectory(dir=DURABLE_TEST_ROOT) as raw:
            with self.assertRaises(materializer.MaterializationError):
                materializer.safe_output_path(Path(raw), "../escape.lean")

    def test_semantic_mutations_are_rejected(self) -> None:
        wrong_center = copy.deepcopy(example_map_entry())
        wrong_center["candidate_provenance"][0]["semantic_parameters"][
            "outer_arc"
        ]["center"] = 1
        with self.assertRaises(materializer.MaterializationError):
            materializer.decode_target_entry(wrong_center)

        unsorted_support = copy.deepcopy(example_map_entry())
        unsorted_support["candidate_provenance"][0]["semantic_parameters"][
            "row_support"
        ] = [5, 1, 6, 7]
        with self.assertRaises(materializer.MaterializationError):
            materializer.decode_target_entry(unsorted_support)

        extra_parameter = copy.deepcopy(example_map_entry())
        extra_parameter["candidate_provenance"][0]["semantic_parameters"][
            "untrusted"
        ] = True
        with self.assertRaises(materializer.MaterializationError):
            materializer.decode_target_entry(extra_parameter)

        wrong_mask = copy.deepcopy(example_map_entry())
        wrong_mask["candidate_provenance"][0]["semantic_parameters"][
            "outer_arc"
        ]["turn_mask"] = 14
        with self.assertRaises(materializer.MaterializationError):
            materializer.decode_target_entry(wrong_mask)

    def test_hash_and_generated_mutations_are_rejected(self) -> None:
        with tempfile.TemporaryDirectory(dir=DURABLE_TEST_ROOT) as raw:
            drift = Path(raw) / materializer.MAP_PATH.name
            drift.write_bytes(b"{}\n")
            with self.assertRaises(materializer.MaterializationError):
                materializer.require_sha256(
                    drift, materializer.MAP_SHA256, "mutated map"
                )

            copied = Path(raw) / "generated"
            shutil.copytree(self.first, copied)
            lean_path = copied / materializer.LEAN_NAME
            lean_path.write_bytes(lean_path.read_bytes() + b"\n")
            with self.assertRaises(materializer.MaterializationError):
                materializer.verify_generated(copied)


if __name__ == "__main__":
    unittest.main(verbosity=2)
