from __future__ import annotations

import json
from pathlib import Path
import tempfile
import unittest

from census.census_554 import formalized_structural_oracle as oracle
from census.census_554 import perp_bisector_template_seeds as seeds


class PerpBisectorTemplateSeedsTest(unittest.TestCase):
    def test_complete_injection_quotient_feasibility_counts_and_hashes(self):
        self.assertEqual(
            seeds.CANONICAL_TEMPLATE,
            (
                (1, (2, 3)),
                (2, (0, 4)),
                (3, (0, 4)),
                (4, (2, 3)),
            ),
        )
        injected = seeds.injected_patterns()
        feasible = seeds.feasible_injected_patterns()
        self.assertEqual(seeds.ROLE_INJECTION_COUNT, 55_440)
        self.assertEqual(len(injected), 27_720)
        self.assertEqual(len({item.pattern_key for item in injected}), 27_720)
        self.assertEqual(len(feasible), 23_250)
        self.assertEqual(len(injected) - len(feasible), 4_470)
        self.assertTrue(all(seeds.pattern_row_feasible(item) for item in feasible))

        profile = seeds.candidate_profile()
        self.assertEqual(
            tuple(len(rows) for rows in profile),
            (210, 43, 16, 210, 210, 210, 210, 210, 210, 210, 210),
        )
        self.assertEqual(
            seeds.inventory_hashes(),
            {
                "all_patterns_sha256":
                    "780b0b45104f9317af5aa0c71098bb973929d1d36cb1046bf99e94dd791200e5",
                "feasible_patterns_sha256":
                    "b60cb068fd98efb262ff1d1e63fdb256e827ef7ff47e5d7a5d2efa66e98ee742",
                "candidate_profile_sha256":
                    "0796412fe113bc84bff6edc46ccda4a4112b47131226be4cdad4eb3e399e0ad0",
            },
        )
        seeds.assert_pinned_inventory()

        metadata = seeds.artifact_metadata()
        self.assertEqual(metadata["artifact_sha256"], seeds.EXPECTED_ARTIFACT_SHA256)
        self.assertEqual(metadata["artifact_bytes"], 1_969_430)
        self.assertEqual(metadata["pattern_count"], 23_250)

    def test_compact_artifact_replays_every_theorem_detection(self):
        raw = seeds.seed_artifact_bytes()
        self.assertEqual(raw, seeds.seed_artifact_bytes())
        validated = seeds.validate_seed_artifact_bytes(raw)
        self.assertEqual(validated.schema, seeds.SCHEMA)
        self.assertEqual(validated.pattern_count, 23_250)
        self.assertEqual(
            validated.feasible_patterns_sha256,
            seeds.EXPECTED_FEASIBLE_PATTERNS_SHA256,
        )

        detector_contract = seeds.build_seed_artifact()["detector_contract"]
        self.assertEqual(detector_contract["stage"], seeds.STAGE)
        self.assertEqual(
            detector_contract["theorem_source_sha256"],
            oracle.THEOREM_SOURCE_SHA256[detector_contract["theorem_source"]],
        )
        for seed in validated.seeds:
            detection = seed.detection
            self.assertEqual(detection["stage"], seeds.STAGE)
            self.assertEqual(detection["order"], None)
            self.assertEqual(len(detection["closure_paths"]), 3)
            self.assertEqual(
                detection["theorem_id"], detector_contract["theorem_id"]
            )
            self.assertEqual(
                detection["theorem_source_sha256"],
                detector_contract["theorem_source_sha256"],
            )
            self.assertEqual(seed.provenance["trust_class"], seeds.TRUST_CLASS)
            self.assertFalse(seed.provenance["bank_compatible"])

    def test_emit_is_atomic_idempotent_and_preserves_different_existing_bytes(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "perp-seeds.json"
            metadata = seeds.write_seed_artifact(path)
            self.assertEqual(
                metadata["artifact_sha256"], seeds.EXPECTED_ARTIFACT_SHA256
            )
            self.assertEqual(path.read_bytes(), seeds.seed_artifact_bytes())
            self.assertEqual(seeds.write_seed_artifact(path), metadata)
            loaded = seeds.load_pinned_seed_patterns(path)
            self.assertEqual(len(loaded), 23_250)
            self.assertEqual(
                loaded[0], seeds.feasible_injected_patterns()[0].as_pattern()
            )
            self.assertEqual(
                loaded[-1], seeds.feasible_injected_patterns()[-1].as_pattern()
            )

            path.write_bytes(b"preserve me\n")
            with self.assertRaisesRegex(
                seeds.PerpBisectorSeedError, "refusing to replace"
            ):
                seeds.write_seed_artifact(path)
            self.assertEqual(path.read_bytes(), b"preserve me\n")

    def test_tampering_is_rejected_before_use(self):
        payload = json.loads(seeds.seed_artifact_bytes())
        payload["seeds"][0]["pattern"] = payload["seeds"][1]["pattern"]
        raw = json.dumps(
            payload, sort_keys=True, separators=(",", ":")
        ).encode("utf-8") + b"\n"
        with self.assertRaisesRegex(
            seeds.PerpBisectorSeedError, "does not exactly regenerate"
        ):
            seeds.validate_seed_artifact_bytes(raw)


if __name__ == "__main__":
    unittest.main()
