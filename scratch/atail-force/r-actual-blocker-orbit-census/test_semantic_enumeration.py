#!/usr/bin/env python3

from __future__ import annotations

from copy import deepcopy
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from domain import canonical_key, validate_orbit_model
from fixtures import all_omission_orbit
import semantic_enumeration as semantic_lane
from semantic_enumeration import (
    ResourceBudgetError,
    enumerate_semantics,
    semantic_canonical_key,
    semantic_signature,
)

LANE = Path(__file__).resolve().parent


class SemanticEnumerationTests(unittest.TestCase):
    def test_signature_excludes_inert_cap_labels(self) -> None:
        model = all_omission_orbit()
        signature = semantic_signature(model)
        self.assertNotIn("cap_roles", signature)
        self.assertNotIn("hit_opposite_side", signature)
        self.assertIn("shell_supports", signature)
        self.assertIn("apex_rows", signature)
        self.assertIn("inter_shell", signature)

    def test_canonical_key_ignores_inert_cap_labels(self) -> None:
        model = all_omission_orbit()
        altered = {**model, "cap_roles": ["opp_cap_1", "opp_cap_2"]}
        validate_orbit_model(altered)
        self.assertEqual(
            semantic_canonical_key(model), semantic_canonical_key(altered)
        )

    def test_canonical_key_ignores_cycle_base_source(self) -> None:
        model = all_omission_orbit()
        rotated = deepcopy(model)
        for field in (
            "sources",
            "mates",
            "hits",
            "hit_opposite_side",
            "cap_roles",
            "opaque_witnesses",
        ):
            rotated[field] = rotated[field][1:] + rotated[field][:1]
        validate_orbit_model(rotated)
        self.assertEqual(
            semantic_canonical_key(model), semantic_canonical_key(rotated)
        )

    def test_projection_forgets_some_full_color_partition_data(self) -> None:
        model = all_omission_orbit()
        recolored = deepcopy(model)
        # In the fixture, 0:5 shares a color with 1:4 and 2:3.  Splitting only
        # this edge preserves every projected incidence but changes the full
        # equality-color partition.
        recolored["edge_colors"]["0:5"] = 99
        validate_orbit_model(recolored)
        self.assertEqual(
            semantic_canonical_key(model), semantic_canonical_key(recolored)
        )
        self.assertNotEqual(canonical_key(model), canonical_key(recolored))

    def test_five_point_two_cycle_all_omission_is_complete_empty(self) -> None:
        manifest = enumerate_semantics(
            5,
            2,
            "all_omission",
            timeout_ms=20_000,
            max_signatures=4,
        )
        self.assertEqual(manifest["status"], "COMPLETE")
        self.assertEqual(manifest["signature_count"], 0)

    def test_six_point_two_cycle_emits_verified_bounded_records(self) -> None:
        with tempfile.TemporaryDirectory(
            prefix=".semantic-test-", dir=LANE
        ) as directory:
            output_dir = Path(directory)
            manifest = enumerate_semantics(
                6,
                2,
                "all_omission",
                timeout_ms=20_000,
                max_signatures=2,
                output_dir=output_dir,
            )
            self.assertIn(manifest["status"], {"COMPLETE", "PARTIAL_LIMIT"})
            self.assertGreaterEqual(manifest["signature_count"], 1)
            lines = (output_dir / "signatures.jsonl").read_text().splitlines()
            self.assertEqual(len(lines), manifest["signature_count"])
            hashes: set[str] = set()
            for line in lines:
                record = json.loads(line)
                validate_orbit_model(record["model"])
                self.assertNotIn("cap_roles", record["signature"])
                hashes.add(record["canonical_key_sha256"])
            self.assertEqual(len(hashes), len(lines))

            written_manifest = json.loads(
                (output_dir / "manifest.json").read_text()
            )
            self.assertEqual(written_manifest["status"], manifest["status"])
            self.assertIn("projected incidence-signature", manifest["scope"])
            self.assertIn("existential equality-color", manifest["scope"])
            self.assertFalse((output_dir / "checkpoint.json").exists())
            self.assertFalse(
                any(path.name.endswith(".tmp") for path in output_dir.iterdir())
            )

    def test_running_manifest_precedes_solver_construction(self) -> None:
        with tempfile.TemporaryDirectory(
            prefix=".semantic-running-test-", dir=LANE
        ) as directory:
            output_dir = Path(directory)
            original = semantic_lane._build_solver
            observed: dict[str, object] = {}

            def inspect_then_build(*args: object, **kwargs: object) -> object:
                observed["manifest"] = json.loads(
                    (output_dir / "manifest.json").read_text()
                )
                observed["records"] = (
                    output_dir / "signatures.jsonl"
                ).read_text()
                return original(*args, **kwargs)

            with patch.object(
                semantic_lane, "_build_solver", side_effect=inspect_then_build
            ):
                enumerate_semantics(
                    5,
                    2,
                    "all_omission",
                    timeout_ms=20_000,
                    max_signatures=1,
                    output_dir=output_dir,
                )
            self.assertEqual(observed["manifest"]["status"], "RUNNING")
            self.assertEqual(observed["records"], "")
            self.assertIn("parameters", observed["manifest"])
            self.assertIn("source_sha256", observed["manifest"])

    def test_nonempty_output_refused_unless_overwrite_is_explicit(self) -> None:
        with tempfile.TemporaryDirectory(
            prefix=".semantic-stale-test-", dir=LANE
        ) as directory:
            output_dir = Path(directory)
            stale = output_dir / "stale.txt"
            stale.write_text("not part of this run\n")
            with self.assertRaisesRegex(ValueError, "nonempty"):
                enumerate_semantics(
                    5,
                    2,
                    "all_omission",
                    max_signatures=1,
                    output_dir=output_dir,
                )
            self.assertTrue(stale.exists())

            manifest = enumerate_semantics(
                5,
                2,
                "all_omission",
                max_signatures=1,
                output_dir=output_dir,
                overwrite=True,
            )
            self.assertEqual(manifest["status"], "COMPLETE")
            self.assertFalse(stale.exists())
            self.assertFalse((output_dir / "checkpoint.json").exists())

    def test_circle_constraint_budget_rejects_before_solver_build(self) -> None:
        with patch.object(semantic_lane, "_build_solver") as build_solver:
            with self.assertRaisesRegex(
                ResourceBudgetError, "circle-triple constraint budget"
            ):
                enumerate_semantics(
                    7,
                    2,
                    "all_omission",
                    max_circle_triples=209,
                )
        build_solver.assert_not_called()

    def test_symmetry_budget_rejects_before_solver_or_permutation(self) -> None:
        with patch.object(semantic_lane, "_build_solver") as build_solver:
            with self.assertRaisesRegex(
                ResourceBudgetError, "symmetry-variant budget"
            ):
                enumerate_semantics(
                    7,
                    2,
                    "all_omission",
                    max_symmetry_variants=47,
                )
        build_solver.assert_not_called()
        with self.assertRaisesRegex(
            ResourceBudgetError, "before permutation"
        ):
            semantic_canonical_key(
                all_omission_orbit(), max_symmetry_variants=1
            )

    def test_period_six_needs_no_residual_non_source_point(self) -> None:
        for query in ("some_hit", "all_omission"):
            with self.subTest(query=query):
                manifest = enumerate_semantics(
                    7,
                    6,
                    query,
                    timeout_ms=20_000,
                    max_signatures=1,
                )
                self.assertEqual(manifest["signature_count"], 1)
                self.assertIn(manifest["status"], {"COMPLETE", "PARTIAL_LIMIT"})


if __name__ == "__main__":
    unittest.main()
