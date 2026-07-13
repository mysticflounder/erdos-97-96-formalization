from __future__ import annotations

import hashlib
import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import unittest


REPO_ROOT = Path(__file__).resolve().parents[3]
SCRATCH = REPO_ROOT / "scratch" / "census-554"
sys.path.insert(0, str(SCRATCH))


def _load(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


base = _load("cache_test_frozen_probe", SCRATCH / "frozen_separation_probe.py")
cache = _load("cache_test_perp_cache", SCRATCH / "perp_subsumption_cache.py")


MATCHING_PATTERN = {
    "0": [4, 8],
    "1": [0, 6, 8],
    "2": [4, 8, 9],
    "6": [0, 2, 4],
    "8": [0, 2, 9],
    "9": [0, 1, 4],
}
NONMATCHING_PATTERN = {"0": [3, 8], "3": [0, 5], "5": [0, 3]}


class PerpSubsumptionCacheTest(unittest.TestCase):
    def setUp(self) -> None:
        self.temporary = tempfile.TemporaryDirectory()
        self.root = Path(self.temporary.name)
        self.bank = self.root / "bank.jsonl"
        rows = [
            {"pid": "target", "pattern": MATCHING_PATTERN},
            {"pid": "other", "pattern": NONMATCHING_PATTERN},
        ]
        self.bank.write_text(
            "".join(json.dumps(row, sort_keys=True) + "\n" for row in rows),
            encoding="utf-8",
        )

    def tearDown(self) -> None:
        self.temporary.cleanup()

    def test_cache_is_deterministic_and_replays_exact_orbit(self) -> None:
        first = cache.build_cache_artifact(base, self.bank)
        second = cache.build_cache_artifact(base, self.bank)
        self.assertEqual(first, second)
        self.assertEqual(first["counts"]["targeted_source_rows"], 1)
        record = first["replacements"][0]
        replacement = cache._native_pattern(record["replacement_pattern"])
        expected = [
            base._json_pattern(image)
            for image, _mapping in base.combinatorics.orbit_with_maps(replacement)
        ]
        self.assertEqual(record["replacement_orbit"], expected)

        raw = cache.canonical_bytes(first)
        artifact_path = self.root / "cache.json"
        artifact_path.write_bytes(raw)
        decoded_artifact, decoded = cache.load_pinned_cache(
            base,
            artifact_path,
            expected_sha256=hashlib.sha256(raw).hexdigest(),
            bank_rows=base.read_frozen_bank(self.bank)[0],
            bank_path=self.bank,
        )
        self.assertEqual(decoded_artifact, first)
        self.assertEqual(len(decoded), 1)
        self.assertEqual(
            len(next(iter(decoded.values()))), len(record["replacement_orbit"])
        )

    def test_cache_fails_closed_on_bank_theorem_and_file_drift(self) -> None:
        artifact = cache.build_cache_artifact(base, self.bank)
        rows = base.read_frozen_bank(self.bank)[0]
        with self.assertRaisesRegex(cache.CacheError, "exact frozen bank"):
            cache.validate_cache_artifact(
                base,
                artifact,
                bank_rows=rows,
                bank_sha256="0" * 64,
            )

        theorem_drift = json.loads(json.dumps(artifact))
        theorem_drift["detector_contract"]["theorem_source_sha256"] = "0" * 64
        with self.assertRaisesRegex(cache.CacheError, "theorem contract"):
            cache.validate_cache_artifact(
                base,
                theorem_drift,
                bank_rows=rows,
                bank_sha256=hashlib.sha256(self.bank.read_bytes()).hexdigest(),
            )

        raw = cache.canonical_bytes(artifact)
        artifact_path = self.root / "cache.json"
        artifact_path.write_bytes(raw + b" ")
        with self.assertRaisesRegex(cache.CacheError, "hash mismatch"):
            cache.load_pinned_cache(
                base,
                artifact_path,
                expected_sha256=hashlib.sha256(raw).hexdigest(),
                bank_rows=rows,
                bank_path=self.bank,
            )

    def test_historical_runtime_requires_exact_explicit_contract(self) -> None:
        artifact = cache.build_cache_artifact(base, self.bank)
        historical = dict(artifact["runtime_contract"])
        historical["formalized_oracle_source_sha256"] = "0" * 64
        artifact["runtime_contract"] = historical
        rows = base.read_frozen_bank(self.bank)[0]
        bank_sha256 = hashlib.sha256(self.bank.read_bytes()).hexdigest()

        with self.assertRaisesRegex(cache.CacheError, "runtime contract"):
            cache.validate_cache_artifact(
                base,
                artifact,
                bank_rows=rows,
                bank_sha256=bank_sha256,
            )
        decoded = cache.validate_cache_artifact(
            base,
            artifact,
            bank_rows=rows,
            bank_sha256=bank_sha256,
            expected_runtime_contract=historical,
        )
        self.assertEqual(len(decoded), 1)

        raw = cache.canonical_bytes(artifact)
        artifact_path = self.root / "historical-cache.json"
        artifact_path.write_bytes(raw)
        loaded, loaded_orbits = cache.load_pinned_cache(
            base,
            artifact_path,
            expected_sha256=hashlib.sha256(raw).hexdigest(),
            bank_rows=rows,
            bank_path=self.bank,
            expected_runtime_contract=historical,
        )
        self.assertEqual(loaded, artifact)
        self.assertEqual(len(loaded_orbits), 1)

        wrong_contract = dict(historical)
        wrong_contract["formalized_oracle_source_sha256"] = "1" * 64
        with self.assertRaisesRegex(cache.CacheError, "runtime contract"):
            cache.load_pinned_cache(
                base,
                artifact_path,
                expected_sha256=hashlib.sha256(raw).hexdigest(),
                bank_rows=rows,
                bank_path=self.bank,
                expected_runtime_contract=wrong_contract,
            )


if __name__ == "__main__":
    unittest.main()
