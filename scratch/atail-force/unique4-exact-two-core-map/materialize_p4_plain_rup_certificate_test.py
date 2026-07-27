#!/usr/bin/env python3
"""Regression tests for the fixed P4 plain-RUP certificate manifest."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path
import tempfile
import unittest

import materialize_p4_plain_rup_certificate as materializer


class MaterializeP4PlainRupCertificateTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        # Hash and authenticate the 1.1 GiB package once for the test class.
        cls.manifest = materializer.build_manifest()

    def test_production_manifest_is_deterministic_and_exact(self) -> None:
        first = materializer.pretty_json_bytes(self.manifest)
        second = materializer.pretty_json_bytes(dict(self.manifest))
        self.assertEqual(first, second)
        self.assertEqual(
            self.manifest["compact_input_authentication"]["variable_count"],
            2_557,
        )
        self.assertEqual(
            self.manifest["compact_input_authentication"]["clause_count"],
            19_048,
        )
        normalization = self.manifest["normalization"]
        self.assertEqual(normalization["addition_count"], 1_232_281)
        self.assertEqual(normalization["deletion_action_count"], 598_140)
        self.assertEqual(normalization["first_dense_addition_id"], 19_049)
        self.assertEqual(normalization["last_dense_addition_id"], 1_251_329)
        self.assertEqual(
            self.manifest["epistemic_status"]["classification"],
            "EXTERNALLY VERIFIED PURE-RUP NORMALIZED CERTIFICATE",
        )
        self.assertIn(
            "Lean replay of the normalized certificate",
            self.manifest["epistemic_status"]["does_not_establish"],
        )

    def test_manifest_mutation_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            path = Path(raw) / "manifest.json"
            mutated = json.loads(
                materializer.pretty_json_bytes(self.manifest)
            )
            mutated["normalization"]["addition_count"] += 1
            path.write_text(
                json.dumps(mutated, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            with self.assertRaises(materializer.CertificateError):
                materializer.verify_manifest(path)

    def test_artifact_mutation_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            path = Path(raw) / "artifact"
            path.write_bytes(b"authenticated\n")
            digest = hashlib.sha256(path.read_bytes()).hexdigest()
            materializer.validate_artifact(
                path,
                expected_bytes=14,
                expected_sha256=digest,
                label="test artifact",
            )
            path.write_bytes(b"authenticaxed\n")
            with self.assertRaises(materializer.CertificateError):
                materializer.validate_artifact(
                    path,
                    expected_bytes=14,
                    expected_sha256=digest,
                    label="test artifact",
                )

    def test_path_traversal_and_absolute_paths_are_rejected(self) -> None:
        expected = materializer.EXPECTED_ARTIFACTS["solver_stdout"][0]
        for malicious in (
            "../../escape",
            "../p4-seed0-plain-rup-certificate/../escape",
            "/tmp/escape",
            "cadical-plain.stdout\x00suffix",
        ):
            with self.subTest(malicious=malicious):
                with self.assertRaises(materializer.CertificateError):
                    materializer.resolve_certificate_relative(
                        materializer.CERTIFICATE_DIR,
                        malicious,
                        expected_relative=expected,
                        label="test artifact",
                    )

    def test_exact_complete_line_checks_reject_substrings_and_duplicates(
        self,
    ) -> None:
        expected = materializer.SOLVER_VERDICT
        for lines in (
            [f"prefix {expected}"],
            [f"{expected} suffix"],
            [expected, expected],
            [],
        ):
            with self.subTest(lines=lines):
                with self.assertRaises(materializer.CertificateError):
                    materializer.require_unique_exact_line(
                        lines, expected, label="test log"
                    )
        materializer.require_unique_exact_line(
            [expected], expected, label="test log"
        )

    def test_output_is_relocatable_and_verify_only_matches(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            output = Path(raw) / materializer.MANIFEST_NAME
            emitted = materializer.materialize(output)
            verified = materializer.verify_manifest(output)
            self.assertEqual(emitted, verified)
            self.assertEqual(
                output.read_bytes(),
                materializer.pretty_json_bytes(self.manifest),
            )


if __name__ == "__main__":
    unittest.main()
