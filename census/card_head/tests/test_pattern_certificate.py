from __future__ import annotations

import copy
import unittest

from census.card_head.candidate_surface import build_model
from census.card_head.pattern_certificate import (
    CERTIFICATE_SCHEMA,
    CertificateError,
    verify_pattern_certificate,
)


PATTERN = {
    "0": [1, 3],
    "1": [0, 7],
    "3": [0, 1, 7],
    "7": [0, 3],
}

# The smallest historical 654_all certificate, stripped to its mathematical
# payload. It is a five-generator equality-only identity with no Rabinowitsch
# separator and is small enough to replay in every unit-test run.
BASE_CERTIFICATE = {
    "schema": "census12_pattern_certificate.v1",
    "profile": "654",
    "pattern": PATTERN,
    "kill": "base",
    "gauge": "pt0=(0,0), pt1=(1,0)",
    "identity": "sum_i coefficients[i]*generators[i] = 1",
    "python_exact_identity": True,
    "rab_pairs": [],
    "variables": ["x3x", "x3y", "x7x", "x7y"],
    "generators": [
        "1-1*x3x^2-1*x3y^2",
        "2*x7x-1*x7x^2-1*x7y^2",
        "-1+2*x3x",
        "2*x3x*x7x+2*x3y*x7y-1*x7x^2-1*x7y^2",
        "2*x3x*x7x-1*x3x^2+2*x3y*x7y-1*x3y^2",
    ],
    "generator_tags": [
        [0, 1, 3],
        [1, 0, 7],
        [3, 0, 1],
        [3, 0, 7],
        [7, 0, 3],
    ],
    "coefficients": [
        "-1/2*x3y*x7y+2*x7y^2-3/4*x7x+1",
        "-1/2*x3y*x7y+3/4*x7x+1/4",
        "-x3y*x7x*x7y+x3x*x7y^2+1/2*x7y^2-1/4*x7x",
        "1/2*x3y*x7y-3/4*x7x+5/4",
        "1/2*x3y*x7y+3/4*x7x-1",
    ],
}


class PatternCertificateTests(unittest.TestCase):
    def test_small_historical_identity_replays_exactly(self):
        model = build_model(12, (6, 5, 4))
        report = verify_pattern_certificate(model, PATTERN, BASE_CERTIFICATE)
        self.assertEqual(report["status"], "VERIFIED_EXACT_IDENTITY")
        self.assertEqual(report["generator_count"], 5)
        self.assertEqual(report["rab_pair_count"], 0)
        self.assertEqual(report["kill"], "base")

    def test_same_identity_is_cardinality_generic_under_permanent_schema(self):
        model = build_model(13, (5, 5, 6))
        certificate = copy.deepcopy(BASE_CERTIFICATE)
        certificate.update(
            {
                "schema": CERTIFICATE_SCHEMA,
                "cardinality": 13,
                "profile": [5, 5, 6],
            }
        )
        report = verify_pattern_certificate(model, PATTERN, certificate)
        self.assertEqual(report["cardinality"], 13)
        self.assertEqual(report["profile"], [5, 5, 6])

    def test_generator_drift_is_rejected_before_identity_replay(self):
        model = build_model(12, (6, 5, 4))
        certificate = copy.deepcopy(BASE_CERTIFICATE)
        certificate["generators"][0] = "1"
        with self.assertRaisesRegex(CertificateError, "generator 0"):
            verify_pattern_certificate(model, PATTERN, certificate)

    def test_cofactor_drift_fails_the_exact_identity(self):
        model = build_model(12, (6, 5, 4))
        certificate = copy.deepcopy(BASE_CERTIFICATE)
        certificate["coefficients"][0] = "0"
        with self.assertRaisesRegex(CertificateError, "does not equal one"):
            verify_pattern_certificate(model, PATTERN, certificate)

    def test_profile_and_optional_shape_are_rechecked(self):
        model = build_model(12, (6, 5, 4))
        certificate = copy.deepcopy(BASE_CERTIFICATE)
        certificate["profile"] = "555"
        with self.assertRaisesRegex(CertificateError, "profile"):
            verify_pattern_certificate(model, PATTERN, certificate)

        certificate = copy.deepcopy(BASE_CERTIFICATE)
        certificate["shape"] = "stale"
        with self.assertRaisesRegex(CertificateError, "shape"):
            verify_pattern_certificate(model, PATTERN, certificate)


if __name__ == "__main__":
    unittest.main()
