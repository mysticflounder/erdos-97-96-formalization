#!/usr/bin/env python3
"""Independent regression tests for the P4 seed-0 compact materializer."""

from __future__ import annotations

from collections import Counter
import hashlib
import json
from pathlib import Path
import tempfile
import unittest

import materialize_p4_compact_seed0 as materializer


def independent_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def independent_parse_dimacs(
    path: Path,
) -> tuple[int, list[tuple[int, ...]]]:
    header: tuple[int, int] | None = None
    clauses: list[tuple[int, ...]] = []
    for raw_line in path.read_text(encoding="ascii").splitlines():
        if not raw_line or raw_line.startswith("c"):
            continue
        if raw_line.startswith("p "):
            fields = raw_line.split()
            if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                raise AssertionError("invalid test DIMACS header")
            header = (int(fields[2]), int(fields[3]))
            continue
        values = tuple(map(int, raw_line.split()))
        if not values or values[-1] != 0:
            raise AssertionError("invalid test DIMACS clause")
        clauses.append(values[:-1])
    if header is None or header[1] != len(clauses):
        raise AssertionError("test DIMACS count mismatch")
    return header[0], clauses


class MaterializeP4CompactSeed0Tests(unittest.TestCase):
    def test_production_reconstruction_is_exact_and_deterministic(self) -> None:
        with tempfile.TemporaryDirectory() as first_raw, tempfile.TemporaryDirectory() as second_raw:
            first = Path(first_raw)
            second = Path(second_raw)
            first_manifest = materializer.materialize(first)
            second_manifest = materializer.materialize(second)
            for name in materializer.OUTPUT_NAMES:
                self.assertEqual(
                    (first / name).read_bytes(),
                    (second / name).read_bytes(),
                    name,
                )

            source_variables, source_clauses = independent_parse_dimacs(
                materializer.HERE / "p4.input-core.cnf"
            )
            mapping = json.loads(
                (
                    materializer.HERE / "p4.input-core-map.json"
                ).read_text(encoding="utf-8")
            )
            selection = json.loads(
                materializer.SELECTION_PATH.read_text(encoding="utf-8")
            )
            retained = set(selection["retained_families"])
            expected_pairs = [
                (clause, entry)
                for clause, entry in zip(
                    source_clauses,
                    mapping["core_clauses"],
                    strict=True,
                )
                if entry["allocated_family"] in retained
            ]
            used = sorted(
                {
                    abs(literal)
                    for clause, _entry in expected_pairs
                    for literal in clause
                }
            )
            dense = {
                source: target for target, source in enumerate(used, 1)
            }
            expected_dense = [
                tuple(
                    dense[abs(literal)]
                    if literal > 0
                    else -dense[abs(literal)]
                    for literal in clause
                )
                for clause, _entry in expected_pairs
            ]
            output_variables, output_clauses = independent_parse_dimacs(
                first / materializer.CNF_NAME
            )
            self.assertEqual(source_variables, 12_672)
            self.assertEqual(output_variables, 2_557)
            self.assertEqual(output_clauses, expected_dense)
            self.assertEqual(len(output_clauses), 19_048)

            occurrence_records = [
                json.loads(line)
                for line in (
                    first / materializer.OCCURRENCES_NAME
                ).read_text(encoding="utf-8").splitlines()
            ]
            self.assertEqual(len(occurrence_records), len(expected_pairs))
            family_counts: Counter[str] = Counter()
            for output_index, (record, (source_clause, entry)) in enumerate(
                zip(occurrence_records, expected_pairs, strict=True), 1
            ):
                family_counts[record["family"]] += 1
                self.assertEqual(record["output_clause_index"], output_index)
                self.assertEqual(
                    record["source_core_clause_index"],
                    entry["core_clause_index"],
                )
                self.assertEqual(
                    record["source_terminal_clause_index"],
                    entry["allocated_input_clause_index"],
                )
                self.assertEqual(
                    record["source_core_literals"], list(source_clause)
                )
                self.assertEqual(
                    record["source_terminal_literals"],
                    entry["allocated_input_clause_literal_order"],
                )
                self.assertEqual(
                    record["dense_literals"],
                    list(expected_dense[output_index - 1]),
                )
            self.assertEqual(
                dict(sorted(family_counts.items())),
                materializer.EXPECTED_FAMILY_COUNTS,
            )
            self.assertEqual(
                first_manifest["stable_digest"]["sha256"],
                materializer.compute_stable_digest(first_manifest),
            )
            self.assertEqual(first_manifest, second_manifest)

    def test_source_and_output_path_traversal_are_rejected(self) -> None:
        with self.assertRaises(materializer.MaterializationError):
            materializer.resolve_source_dependency(
                "../p4.input-core.cnf",
                source_dir=materializer.HERE,
                expected_name="p4.input-core.cnf",
                label="test core",
            )
        with tempfile.TemporaryDirectory() as raw:
            with self.assertRaises(materializer.MaterializationError):
                materializer.safe_output_path(Path(raw), "../escape.cnf")

    def test_hash_drift_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            path = Path(raw) / "drift.json"
            path.write_bytes(b"{}\n")
            with self.assertRaises(materializer.MaterializationError):
                materializer.require_sha256(path, "0" * 64, "test artifact")

    def test_dimacs_count_and_order_drift_are_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            bad_count = Path(raw) / "bad-count.cnf"
            bad_count.write_text("p cnf 2 2\n1 0\n", encoding="ascii")
            with self.assertRaises(materializer.MaterializationError):
                materializer.parse_dimacs(bad_count)

            mapping = {
                "schema": "p97-unique4-exact-two-drat-input-core-map-v1",
                "profile": 4,
                "core": {
                    "sha256": materializer.CORE_SHA256,
                    "header_variable_count": 12_672,
                    "clause_count": 48_605,
                },
                "matching_summary": {
                    "allocation_is_injective": True,
                    "core_clause_count": 48_605,
                    "allocated_input_occurrence_count": 48_605,
                    "canonically_unmatched_count": 0,
                },
                "input_occurrence_provenance_invariants": {
                    "clause_order_preserved": True,
                    "literal_order_preserved": True,
                    "duplicate_occurrences_preserved": True,
                    "duplicate_literals_rejected": True,
                    "indexing": "one_based_dimacs_clause_occurrence",
                },
                "extraction_authentication": {
                    "schema": "p97-exacttwo-drat-core-extraction-v1",
                    "profile": 4,
                    "sha256": materializer.EXTRACTION_SHA256,
                    "core_sha256": materializer.CORE_SHA256,
                    "drat_trim_verdict": "s VERIFIED",
                    "path": str(
                        materializer.HERE
                        / "p4.input-core-extraction.json"
                    ),
                },
                "core_clauses": [
                    {
                        "core_clause_index": 2,
                        "core_clause_literal_order": [1],
                    }
                ],
            }
            with self.assertRaises(materializer.MaterializationError):
                materializer.validate_map_and_select(
                    mapping,
                    [(1,)],
                    retained=set(),
                    source_dir=materializer.HERE,
                )

    def test_generated_hashes_match_manifest(self) -> None:
        manifest = materializer.verify_generated(materializer.OUTPUT_DIR)
        self.assertEqual(
            independent_sha256(
                materializer.OUTPUT_DIR / materializer.CNF_NAME
            ),
            manifest["compact_cnf"]["sha256"],
        )
        self.assertEqual(
            independent_sha256(
                materializer.OUTPUT_DIR / materializer.OCCURRENCES_NAME
            ),
            manifest["source_occurrence_mapping"]["sha256"],
        )


if __name__ == "__main__":
    unittest.main(verbosity=2)
