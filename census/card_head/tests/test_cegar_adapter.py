from __future__ import annotations

import copy
import unittest

from census.card_head.cegar_adapter import (
    PROPOSAL_SCHEMA,
    CegarAdapterError,
    prepare_iteration,
)
from census.card_head.run_manifest import build_manifest, json_sha256
from census.card_head.tests.test_pattern_certificate import (
    BASE_CERTIFICATE,
    PATTERN,
)


SOURCE_CUBE = {
    "0": [1, 2, 3, 4],
    "1": [0, 2, 7, 8],
    "2": [0, 1, 10, 11],
    "3": [0, 1, 7, 9],
    "4": [0, 2, 9, 10],
    "5": [0, 3, 4, 11],
    "6": [0, 4, 5, 8],
    "7": [0, 3, 5, 6],
    "8": [1, 2, 5, 10],
    "9": [1, 5, 6, 7],
    "10": [1, 3, 6, 8],
    "11": [1, 4, 8, 9],
}


def valid_manifest():
    return build_manifest(
        run_id="ahead-n12-654-adapter-test",
        cardinality=12,
        profile=(6, 5, 4),
        wall_seconds=3600,
        max_new_bank_rows=20,
        max_consecutive_shape_stale=5,
        source_hashes={"census/card_head/runner.py": "0" * 64},
        created_utc="2026-07-13T11:00:00Z",
    )


def valid_proposal(manifest):
    return {
        "schema": PROPOSAL_SCHEMA,
        "run_id": manifest["run_id"],
        "manifest_sha256": json_sha256(manifest),
        "iteration": 0,
        "elapsed_seconds": 12.5,
        "source_cube": SOURCE_CUBE,
        "min_support": 4,
        "patterns": [
            {
                "pattern": PATTERN,
                "certificate": BASE_CERTIFICATE,
            }
        ],
    }


class CegarAdapterTests(unittest.TestCase):
    def test_exact_proposal_prepares_without_claiming_publication(self):
        manifest = valid_manifest()
        prepared = prepare_iteration(
            manifest,
            valid_proposal(manifest),
            bank_rows=[],
        )
        report = prepared.report()
        self.assertEqual(
            report["status"], "PREPARED_EXACT_CERTIFICATES_NOT_PUBLISHED"
        )
        self.assertEqual(report["bank_rows_before"], 0)
        self.assertEqual(report["bank_rows_after"], 1)
        self.assertEqual(report["witness_shape_count"], 1)
        self.assertEqual(report["fresh_shape_count"], 1)
        self.assertEqual(report["patterns"][0]["orbit_size"], 12)
        self.assertIn("not a bank commit", report["scope"])

    def test_manifest_binding_is_mandatory(self):
        manifest = valid_manifest()
        proposal = valid_proposal(manifest)
        proposal["manifest_sha256"] = "f" * 64
        with self.assertRaisesRegex(CegarAdapterError, "manifest digest"):
            prepare_iteration(manifest, proposal, bank_rows=[])

    def test_source_cube_is_independently_checked(self):
        manifest = valid_manifest()
        proposal = valid_proposal(manifest)
        proposal["source_cube"] = copy.deepcopy(SOURCE_CUBE)
        proposal["source_cube"]["0"] = [1, 1, 3, 4]
        with self.assertRaisesRegex(CegarAdapterError, "cube_ok"):
            prepare_iteration(manifest, proposal, bank_rows=[])

    def test_certificate_failure_cannot_cross_the_adapter(self):
        manifest = valid_manifest()
        proposal = valid_proposal(manifest)
        proposal["patterns"] = copy.deepcopy(proposal["patterns"])
        proposal["patterns"][0]["certificate"]["coefficients"][0] = "0"
        with self.assertRaisesRegex(CegarAdapterError, "certificate failed"):
            prepare_iteration(manifest, proposal, bank_rows=[])

    def test_existing_orbit_makes_the_sat_witness_invalid(self):
        manifest = valid_manifest()
        with self.assertRaisesRegex(CegarAdapterError, "already banked"):
            prepare_iteration(
                manifest,
                valid_proposal(manifest),
                bank_rows=[{"pattern": PATTERN}],
            )

    def test_proposal_schema_is_closed_to_untracked_fields(self):
        manifest = valid_manifest()
        proposal = valid_proposal(manifest)
        proposal["solver_says"] = "TRUST_ME"
        with self.assertRaisesRegex(CegarAdapterError, "keys differ"):
            prepare_iteration(manifest, proposal, bank_rows=[])


if __name__ == "__main__":
    unittest.main()
