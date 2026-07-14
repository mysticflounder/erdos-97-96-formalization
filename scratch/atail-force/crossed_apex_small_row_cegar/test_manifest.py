from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location(
    "crossed_apex_manifest", HERE / "manifest.py"
)
assert SPEC is not None and SPEC.loader is not None
manifest = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(manifest)


class CrossedApexManifestTest(unittest.TestCase):
    def test_distribution_families(self) -> None:
        self.assertEqual(
            manifest.row_distributions(4),
            ((0, 0, 4), (0, 1, 3), (1, 0, 3), (1, 1, 2)),
        )
        self.assertEqual(
            manifest.row_distributions(5),
            ((0, 0, 5), (0, 1, 4), (1, 0, 4), (1, 1, 3)),
        )

    def test_complete_outer_product(self) -> None:
        cases = manifest.build_cases()
        self.assertEqual(len(cases), 192)
        self.assertEqual(len({case["case_id"] for case in cases}), 192)

    def test_checked_manifest_is_current(self) -> None:
        manifest.check_manifest(HERE / "manifest.json")


if __name__ == "__main__":
    unittest.main()
