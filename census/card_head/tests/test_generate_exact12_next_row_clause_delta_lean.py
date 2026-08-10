from __future__ import annotations

import copy
import json
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from census.card_head.exact12_next_row_valuation import (
    Exact12NextRowValuationError,
)
from census.card_head.generate_exact12_next_row_clause_delta_lean import (
    ARTIFACT_SCHEMA,
    EXPECTED_CELL_COUNT,
    EXPECTED_DELTA_CLAUSES,
    build_cell_artifact,
    generate_all,
    render_lean_module,
    validate_cell_artifact,
)

REPO_ROOT = Path(__file__).resolve().parents[3]
ARTIFACT_DIR = REPO_ROOT / "certificates/p97_exact12_next_row"
LEAN_DIR = (
    REPO_ROOT
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure"
)


class GenerateExact12NextRowClauseDeltaLeanTest(unittest.TestCase):
    def test_checked_in_collection_is_exact_current_source_regeneration(self) -> None:
        generate_all(REPO_ROOT, ARTIFACT_DIR, LEAN_DIR, check=True)

    def test_all_cells_have_exact_schedule_and_delta_shape(self) -> None:
        coordinates: list[tuple[int, int]] = []
        for index in range(EXPECTED_CELL_COUNT):
            artifact = build_cell_artifact(REPO_ROOT, index)
            self.assertEqual(artifact["schema"], ARTIFACT_SCHEMA)
            self.assertEqual(
                artifact["counts"]["delta_clauses"], EXPECTED_DELTA_CLAUSES
            )
            self.assertEqual(artifact["cell"]["placement_index"], index)
            coordinates.append(
                (artifact["cell"]["joint_deletion"], artifact["cell"]["v"])
            )
            self.assertIn(
                "CompiledNextRowJob",
                render_lean_module(index, artifact),
            )
        self.assertEqual(len(set(coordinates)), EXPECTED_CELL_COUNT)

    def test_validator_rejects_clause_and_source_tampering(self) -> None:
        artifact = build_cell_artifact(REPO_ROOT, 0)
        clause_tamper = copy.deepcopy(artifact)
        clause_tamper["clause_delta"][0][0] *= -1
        with self.assertRaisesRegex(
            Exact12NextRowValuationError, "current compiler output"
        ):
            validate_cell_artifact(REPO_ROOT, clause_tamper, 0)

        source_tamper = copy.deepcopy(artifact)
        source_tamper["source_inventory"][0]["sha256"] = "0" * 64
        with self.assertRaisesRegex(Exact12NextRowValuationError, "stale"):
            validate_cell_artifact(REPO_ROOT, source_tamper, 0)

    def test_validator_rejects_coordinate_count_and_hash_tampering(self) -> None:
        artifact = build_cell_artifact(REPO_ROOT, 0)
        mutations = (
            ("cell", "v", 3, "coordinate"),
            ("counts", "delta_clauses", 383, "count metadata"),
            ("hashes", "clause_delta_sha256", "0" * 64, "hash metadata"),
            (
                "frozen_inputs",
                "candidate_table_sha256",
                "0" * 64,
                "frozen input hashes",
            ),
        )
        for section, key, value, message in mutations:
            with self.subTest(section=section, key=key):
                tampered = copy.deepcopy(artifact)
                tampered[section][key] = value
                with self.assertRaisesRegex(Exact12NextRowValuationError, message):
                    validate_cell_artifact(REPO_ROOT, tampered, 0)

    def test_source_change_aborts_before_publication(self) -> None:
        artifact = build_cell_artifact(REPO_ROOT, 0)
        inventory = artifact["source_inventory"]
        changed_inventory = copy.deepcopy(inventory)
        changed_inventory[0]["sha256"] = "0" * 64
        source_reads = [copy.deepcopy(inventory) for _ in range(24)]
        source_reads.append(changed_inventory)
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            artifact_dir = root / "artifacts"
            with patch(
                "census.card_head.generate_exact12_next_row_clause_delta_lean."
                "_source_inventory",
                side_effect=source_reads,
            ), self.assertRaisesRegex(
                Exact12NextRowValuationError, "changed before artifact publication"
            ):
                generate_all(REPO_ROOT, artifact_dir, root / "lean", check=False)
            self.assertFalse(artifact_dir.exists())

    def test_generator_refuses_to_overwrite_artifact_directory(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            artifact_dir = root / "artifacts"
            artifact_dir.mkdir()
            (artifact_dir / "sentinel").write_text("preserve\n")
            with self.assertRaises(FileExistsError):
                generate_all(REPO_ROOT, artifact_dir, root / "lean", check=False)
            self.assertEqual(
                (artifact_dir / "sentinel").read_text(encoding="utf-8"),
                "preserve\n",
            )

    def test_json_artifacts_are_canonical_json(self) -> None:
        for index in range(EXPECTED_CELL_COUNT):
            path = ARTIFACT_DIR / f"cell{index:04d}-clause-delta.json"
            raw = path.read_text(encoding="utf-8")
            self.assertEqual(
                raw, json.dumps(json.loads(raw), indent=2, sort_keys=True) + "\n"
            )


if __name__ == "__main__":
    unittest.main()
