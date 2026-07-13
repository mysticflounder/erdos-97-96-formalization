from __future__ import annotations

import importlib.util
import json
from pathlib import Path
import sys
import unittest


REPO_ROOT = Path(__file__).resolve().parents[3]
SCRATCH = REPO_ROOT / "scratch" / "census-554"
SCRIPT = SCRATCH / "perp_subsumption_probe.py"
sys.path.insert(0, str(SCRATCH))
SPEC = importlib.util.spec_from_file_location("perp_subsumption_probe", SCRIPT)
assert SPEC is not None and SPEC.loader is not None
probe = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = probe
SPEC.loader.exec_module(probe)

CACHED_SCRIPT = SCRATCH / "perp_subsumption_cached_probe.py"
CACHED_SPEC = importlib.util.spec_from_file_location(
    "perp_subsumption_cached_probe", CACHED_SCRIPT
)
assert CACHED_SPEC is not None and CACHED_SPEC.loader is not None
cached_probe = importlib.util.module_from_spec(CACHED_SPEC)
sys.modules[CACHED_SPEC.name] = cached_probe
CACHED_SPEC.loader.exec_module(cached_probe)


class PerpSubsumptionProbeTest(unittest.TestCase):
    def test_replacement_is_the_minimized_proved_core(self) -> None:
        row = {
            "pattern": {
                "0": [4, 8],
                "1": [0, 6, 8],
                "2": [4, 8, 9],
                "6": [0, 2, 4],
                "8": [0, 2, 9],
                "9": [0, 1, 4],
            }
        }
        replacements = probe._replacement_map([row])
        self.assertEqual(len(replacements), 1)
        minimized = next(iter(replacements.values()))
        self.assertEqual(
            {center: set(members) for center, members in minimized.items()},
            {0: {4, 8}, 2: {4, 8}, 6: {0, 2}, 8: {0, 2}},
        )
        detection = probe.formalized_structural_oracle.build_detection(
            minimized, probe._STAGE
        )
        self.assertEqual(detection["core"]["foci"], [0, 2])
        self.assertEqual(detection["core"]["points"], [4, 6, 8])

    def test_nonmatching_motif_is_unchanged(self) -> None:
        row = {"pattern": {"0": [3, 8], "3": [0, 5], "5": [0, 3]}}
        self.assertEqual(probe._replacement_map([row]), {})

    def test_runtime_fingerprint_binds_policy_and_wrapper(self) -> None:
        fingerprint = probe._runtime_fingerprint()
        self.assertEqual(len(fingerprint["perp_subsumption_probe"]), 64)
        self.assertEqual(len(fingerprint["perp_subsumption_policy"]), 64)
        self.assertEqual(
            fingerprint["perp_subsumption_policy"],
            probe.hashlib.sha256(probe._POLICY.encode("utf-8")).hexdigest(),
        )

    def test_cached_runtime_fingerprint_binds_code_policy_and_artifact(self) -> None:
        fingerprint = cached_probe._runtime_fingerprint()
        self.assertEqual(
            fingerprint["perp_subsumption_cache_artifact"],
            cached_probe._EXPECTED_CACHE_SHA256,
        )
        self.assertEqual(len(fingerprint["perp_subsumption_cache_code"]), 64)
        self.assertEqual(len(fingerprint["perp_subsumption_cached_probe"]), 64)
        self.assertEqual(
            fingerprint["perp_subsumption_policy"],
            cached_probe.hashlib.sha256(
                cached_probe._cache.POLICY.encode("utf-8")
            ).hexdigest(),
        )


if __name__ == "__main__":
    unittest.main()
