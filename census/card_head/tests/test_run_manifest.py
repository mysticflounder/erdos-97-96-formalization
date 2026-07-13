from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from census.card_head.profiles import labeled_cap_profiles
from census.card_head.run_manifest import (
    CUT_CONTRACT,
    PROVEN_CUTS,
    ManifestError,
    build_manifest,
    cut_contract_sha256,
    json_sha256,
    source_digests,
    validate_manifest,
    verify_source_digests,
    write_new_manifest,
)


SOURCE_HASHES = {
    "census/card_head/profiles.py": "0" * 64,
    "census/card_head/runner.py": "1" * 64,
}


def valid_manifest(**overrides):
    values = {
        "run_id": "ahead-n12-555-smoke",
        "cardinality": 12,
        "profile": (5, 5, 5),
        "wall_seconds": 3600,
        "max_new_bank_rows": 200,
        "max_consecutive_shape_stale": 25,
        "source_hashes": SOURCE_HASHES,
        "created_utc": "2026-07-13T09:00:00Z",
    }
    values.update(overrides)
    return build_manifest(**values)


class RunManifestTests(unittest.TestCase):
    def test_post_sub2_contract_is_exactly_proven(self):
        by_id = {cut["id"]: cut for cut in PROVEN_CUTS}
        self.assertEqual(
            set(by_id),
            {
                "packet_moser_count_le_two",
                "vertex_pair_same_cap_zero",
                "same_cap_count_le_two_proxy",
            },
        )
        self.assertTrue(all(cut["rigor"] == "PROVEN" for cut in PROVEN_CUTS))
        proxy_evidence = by_id["same_cap_count_le_two_proxy"]["evidence"]
        self.assertIn("Problem97.ATailSub2.sub2H_left_unsat", proxy_evidence)
        self.assertIn("Problem97.ATailSub2.sub2H_right_unsat", proxy_evidence)
        self.assertEqual(valid_manifest()["cut_contract"], CUT_CONTRACT)
        self.assertEqual(valid_manifest()["cut_contract_sha256"], cut_contract_sha256())

    def test_every_authorized_labeled_profile_validates(self):
        for cardinality in (12, 13, 14):
            for profile in labeled_cap_profiles(cardinality):
                with self.subTest(cardinality=cardinality, profile=profile):
                    manifest = valid_manifest(
                        run_id=f"ahead-n{cardinality}-{''.join(map(str, profile))}",
                        cardinality=cardinality,
                        profile=profile,
                    )
                    self.assertEqual(validate_manifest(manifest), manifest)

    def test_non_profile_and_non_proven_contract_are_rejected(self):
        with self.assertRaisesRegex(ManifestError, "admissible labeled profile"):
            valid_manifest(profile=(7, 4, 4))
        manifest = valid_manifest()
        manifest["proof_tier"] = "CONJECTURED"
        with self.assertRaisesRegex(ManifestError, "only PROVEN"):
            validate_manifest(manifest)
        manifest = valid_manifest()
        manifest["cut_contract_sha256"] = "f" * 64
        with self.assertRaisesRegex(ManifestError, "digest"):
            validate_manifest(manifest)
        manifest = valid_manifest()
        manifest["command"][2] = "0"
        with self.assertRaisesRegex(ManifestError, "entrypoint"):
            validate_manifest(manifest)

    def test_resource_and_all_three_stop_caps_are_enforced(self):
        with self.assertRaisesRegex(ManifestError, "authorized cap"):
            valid_manifest(max_workers=5)
        with self.assertRaisesRegex(ManifestError, "nice"):
            valid_manifest(nice=0)
        for field in (
            "wall_seconds",
            "max_new_bank_rows",
            "max_consecutive_shape_stale",
        ):
            with self.subTest(field=field):
                with self.assertRaisesRegex(ManifestError, field):
                    valid_manifest(**{field: 0})

    def test_artifact_and_source_paths_cannot_escape(self):
        manifest = valid_manifest()
        manifest["artifact_dir"] = "../scratch/escape"
        with self.assertRaisesRegex(ManifestError, "escape"):
            validate_manifest(manifest)
        manifest = valid_manifest()
        manifest["source_digests"] = {"../runner.py": "0" * 64}
        with self.assertRaisesRegex(ManifestError, "escape"):
            validate_manifest(manifest)

    def test_write_is_round_trip_stable_and_refuses_overwrite(self):
        with tempfile.TemporaryDirectory() as tmp:
            repo_root = Path(tmp)
            source = repo_root / "census/card_head/runner.py"
            source.parent.mkdir(parents=True)
            source.write_text("VERSION = 1\n", encoding="utf-8")
            hashes = source_digests(repo_root, [Path("census/card_head/runner.py")])
            manifest = valid_manifest(source_hashes=hashes)
            path = repo_root / "run_manifest.json"
            digest = write_new_manifest(path, manifest)
            loaded = json.loads(path.read_text(encoding="utf-8"))
            self.assertEqual(validate_manifest(loaded), manifest)
            self.assertEqual(verify_source_digests(repo_root, loaded), manifest)
            self.assertEqual(digest, json_sha256(manifest))
            with self.assertRaises(FileExistsError):
                write_new_manifest(path, manifest)
            source.write_text("VERSION = 2\n", encoding="utf-8")
            with self.assertRaisesRegex(ManifestError, "source digest mismatch"):
                verify_source_digests(repo_root, loaded)


if __name__ == "__main__":
    unittest.main()
