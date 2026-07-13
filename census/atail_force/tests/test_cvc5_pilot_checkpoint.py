from __future__ import annotations

import copy
import unittest

from census.atail_force import cvc5_pilot_checkpoint as checkpoint
from census.atail_force.three_center_surface import SurfaceError


class Cvc5PilotCheckpointTests(unittest.TestCase):
    def test_terminal_checkpoint_normalizes_all_timeouts(self) -> None:
        result = checkpoint.build_checkpoint()
        self.assertEqual(result["normalized_status_counts"], {"TIMEOUT": 7})
        self.assertFalse(result["interpretation"]["mathematical_claim"])
        self.assertTrue(
            all(
                row["raw_verdict"] == "ERROR"
                and row["normalized_verdict"] == "TIMEOUT"
                for row in result["results"]
            )
        )

    def test_timeout_diagnostic_mutation_is_rejected(self) -> None:
        raw = checkpoint._read_json(checkpoint.RAW_RESULT, "raw")
        manifest = checkpoint._validated_manifest()
        record = copy.deepcopy(raw["results"][0])
        record["diagnostic_suffix"] = "unknown"
        with self.assertRaises(SurfaceError):
            checkpoint._normalize_record(record, manifest["cases"][0])


if __name__ == "__main__":
    unittest.main()
