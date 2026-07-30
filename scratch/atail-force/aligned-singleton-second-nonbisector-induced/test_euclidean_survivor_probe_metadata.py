from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch


HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import euclidean_survivor_probe as probe  # noqa: E402


EXPECTED_ORIGINAL_NAMES = (
    "a0",
    "a1",
    "a2",
    "p1",
    "p2",
    "r1",
    "r2",
    "q",
    "other",
    "z",
    "t",
    "source",
    "b1",
    "b2",
    "bs",
    "bz",
    "s2",
    "s3",
    "s4",
    "p3",
    "p4",
    "r3",
    "r4",
    "z2",
    "z3",
    "z4",
    "x",
    "y",
    "be",
    "escape",
    "e2",
    "e3",
    "e4",
)
EXPECTED_CUSTOM_NAMES = EXPECTED_ORIGINAL_NAMES + (
    "cover_q",
    "cover_q_2",
    "cover_q_3",
    "cover_q_4",
    "global_k4_q_1",
    "global_k4_q_2",
    "global_k4_q_3",
    "global_k4_q_4",
)


class EuclideanSurvivorProbeMetadataTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.cg = probe.load_cegar()

    def custom_metadata(self) -> dict[str, object]:
        outer = self.cg.OuterMap(
            timeout_ms=1_000,
            random_seed=0,
            z_branch="cover",
            escape_arm="robust",
            global_tier="custom",
            cover_points=("q",),
            global_k4_centers=("q",),
            rich_apices=(),
            robust_deletions=(),
        )
        return self.cg.checkpoint_metadata(
            SimpleNamespace(
                z_branch="cover",
                escape_arm="robust",
                global_tier="custom",
                outer_only=False,
            ),
            outer,
        )

    def test_replay_reconstructs_exact_custom_q_q_empty_metadata(self) -> None:
        metadata = self.custom_metadata()
        expected_metadata = {
            "schema": (
                "p97-aligned-singleton-induced-metric-cegar-"
                "v19-source-faithful-projection-schema"
            ),
            "implementation_sha256": probe.sha256(probe.CEGAR),
            "z_branch": "cover",
            "escape_arm": "robust",
            "global_tier": "custom",
            "cover_points": ["q"],
            "global_k4_centers": ["q"],
            "rich_apices": [],
            "robust_deletions": [],
            "outer_only": False,
            "named_occurrences": 41,
            "original_named_occurrences": 33,
            "original_names": list(EXPECTED_ORIGINAL_NAMES),
            "names": list(EXPECTED_CUSTOM_NAMES),
        }
        self.assertEqual(metadata, expected_metadata)

        payload = {
            "status": "ALIVE",
            "survivor": {},
            "metadata": metadata,
            "implementation_sha256": probe.sha256(probe.CEGAR),
            "z_branch": "cover",
            "escape_arm": "robust",
            "global_tier": "custom",
            "outer_constraint_counts": {"deliberate": "mismatch"},
        }
        checkpoint = {"metadata": metadata}
        reconstructed: list[object] = []

        def recording_outer_map(**kwargs: object) -> object:
            outer = self.cg.OuterMap(**kwargs)
            reconstructed.append(outer)
            return outer

        replay_cg = SimpleNamespace(
            OuterMap=recording_outer_map,
            checkpoint_metadata=self.cg.checkpoint_metadata,
        )
        with tempfile.TemporaryDirectory() as raw_directory:
            directory = Path(raw_directory)
            result_path = directory / "result.json"
            checkpoint_path = directory / "checkpoint.json"
            result_path.write_text(json.dumps(payload), encoding="utf-8")
            checkpoint_path.write_text(json.dumps(checkpoint), encoding="utf-8")
            with patch.object(probe, "load_cegar", return_value=replay_cg):
                with self.assertRaisesRegex(
                    ValueError,
                    "recorded outer constraint ledger does not match current map",
                ):
                    probe.replay_survivor(
                        result_path,
                        checkpoint_path,
                        probe.Budget.start(10.0),
                    )

        self.assertEqual(len(reconstructed), 1)
        outer = reconstructed[0]
        self.assertEqual(outer.names, EXPECTED_CUSTOM_NAMES)
        self.assertEqual(
            probe.current_metadata(self.cg, payload, outer),
            expected_metadata,
        )

    def test_explicit_empty_custom_arrays_do_not_enable_defaults(self) -> None:
        metadata = {
            "cover_points": [],
            "global_k4_centers": [],
            "rich_apices": [],
            "robust_deletions": [],
        }
        outer = self.cg.OuterMap(
            timeout_ms=1_000,
            random_seed=0,
            z_branch="cover",
            escape_arm="robust",
            global_tier="custom",
            cover_points=probe.metadata_name_tuple(metadata, "cover_points"),
            global_k4_centers=probe.metadata_name_tuple(
                metadata, "global_k4_centers"
            ),
            rich_apices=probe.metadata_name_tuple(metadata, "rich_apices"),
            robust_deletions=probe.metadata_name_tuple(
                metadata, "robust_deletions"
            ),
        )
        self.assertEqual(outer.names, EXPECTED_ORIGINAL_NAMES)
        self.assertEqual(outer.minimal_cover_witnesses, {})
        self.assertEqual(outer.global_k4_supports, {})
        self.assertEqual(outer.rich_witnesses, {})
        self.assertEqual(outer.robust_survival_supports, {})

    def test_malformed_metadata_name_censuses_fail_closed(self) -> None:
        malformed = (
            ({}, "cover_points"),
            ({"cover_points": ()}, "cover_points"),
            ({"cover_points": ["q", 7]}, "cover_points"),
            ({"cover_points": ["q", "q"]}, "cover_points"),
        )
        for metadata, key in malformed:
            with self.subTest(metadata=metadata):
                with self.assertRaisesRegex(
                    ValueError,
                    "result metadata has an invalid cover_points census",
                ):
                    probe.metadata_name_tuple(metadata, key)


if __name__ == "__main__":
    unittest.main()
