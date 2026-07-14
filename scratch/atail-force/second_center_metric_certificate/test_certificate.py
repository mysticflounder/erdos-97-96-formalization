#!/usr/bin/env python3
"""Regression gates for the ATAIL five-row certificate artifacts."""

from __future__ import annotations

import json
import unittest
from pathlib import Path

import check
import extract
import targets


HERE = Path(__file__).resolve().parent


class CertificateRegression(unittest.TestCase):
    def test_source_provenance_and_target_hashes(self) -> None:
        self.assertEqual(targets.validate_source_hashes(), targets.EXPECTED_SOURCE_HASHES)
        built = targets.all_targets()
        expected = {
            "normalized_cegar_456_5row": (
                "583594c8e55bdf7d3e91734e9c3aa61451131664abea1540c78c660a599e6a63",
                "cfa015ef232fb3306cded3edcb734a7435416cc214c80248b02de48e7e3956fa",
            ),
            "normalized_oracle_456_6row": (
                "6c8607f5f4512ffd981867c4f385e3578760287200771dc885b4b57946a2bb00",
                "e48fb4ff55578eb10eb12d98e54243995a8631407f48bb32559592adcaf4cf88",
            ),
            "normalized_oracle_555_7row": (
                "b8c776e95c9019bc234713894ee30c99afe1f3c09caf38fdcf75c55793ba2519",
                "be83946641ac1a2fd8ced60284ca367e879337b1cc125f9ea94099da2d9d03f8",
            ),
        }
        for name, (row_hash, generator_hash) in expected.items():
            target = built[name]
            self.assertEqual(
                targets.canonical_sha256([row.encoded() for row in target.rows]), row_hash
            )
            self.assertEqual(
                targets.canonical_sha256(list(target.generators)), generator_hash
            )

    def test_unit_and_nonunit_smoke_gates(self) -> None:
        extraction_smoke = extract.smoke_gates()
        self.assertEqual(extraction_smoke["known_unit_membership"], "UNIT")
        self.assertEqual(extraction_smoke["known_nonunit_membership"], "NONUNIT")
        self.assertEqual(
            extraction_smoke["known_unit_certificate"],
            "CANDIDATE_CERTIFICATE_EXTRACTED",
        )
        self.assertTrue(all(check.smoke_gates().values()))

    def test_independent_certificate_replay(self) -> None:
        certificate = HERE / "certificate_normalized_cegar_456_5row.json"
        report = check.check_certificate(certificate)
        saved = json.loads(
            (HERE / "verification_normalized_cegar_456_5row.json").read_text()
        )
        self.assertTrue(report["verified_exact_identity"])
        self.assertTrue(report["independently_reconstructed_generators"])
        self.assertEqual(report, {k: v for k, v in saved.items() if k != "smoke_gates"})

    def test_rabinowitsch_is_unit_but_lift_is_no_verdict(self) -> None:
        membership = json.loads(
            (HERE / "result_rabinowitsch_relative_cegar_456_5row_membership.json").read_text()
        )
        lift = json.loads(
            (HERE / "result_rabinowitsch_relative_cegar_456_5row_liftstd.json").read_text()
        )
        self.assertEqual(membership["status"], "UNIT")
        self.assertEqual(lift["status"], "TIMEOUT_NO_VERDICT")
        self.assertEqual(lift["timeout_seconds"], 120.0)
        self.assertFalse((HERE / "certificate_rabinowitsch_relative_cegar_456_5row.json").exists())

    def test_checkpoint_artifact_hashes(self) -> None:
        checkpoint = json.loads((HERE / "checkpoint.json").read_text())
        manifest = json.loads((HERE / "manifest.json").read_text())
        self.assertEqual(
            checkpoint["status"],
            "NORMALIZED_FIVE_ROW_CERTIFICATE_EXACTLY_REPLAYED_AND_LEAN_KERNEL_CHECKED",
        )
        self.assertEqual(manifest["source"], targets.EXPECTED_SOURCE_HASHES)
        self.assertEqual(
            check.file_sha256(HERE / "certificate_normalized_cegar_456_5row.json"),
            checkpoint["cegar_five_row_core"]["independent_verification"]
            ["certificate_file_sha256"],
        )
        self.assertEqual(
            check.file_sha256(HERE / "verification_normalized_cegar_456_5row.json"),
            checkpoint["cegar_five_row_core"]["independent_verification"]
            ["verification_file_sha256"],
        )
        generated = HERE / "generated_normalized_cegar_456_5row.lean"
        self.assertEqual(
            check.file_sha256(generated), checkpoint["lean_fallback"]["file_sha256"]
        )
        generated_text = generated.read_text()
        self.assertIn("#print axioms normalizedCegar456FiveRowCertificate", generated_text)
        self.assertIn("set_option linter.unnecessarySeqFocus false in", generated_text)


if __name__ == "__main__":
    unittest.main()
