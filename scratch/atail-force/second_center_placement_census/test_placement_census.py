#!/usr/bin/env python3
"""Regression and mutation gates for the exhaustive placement surface."""

from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
QUERY_DIR = HERE.parent / "second_center_query"
for path in (str(ROOT), str(QUERY_DIR), str(HERE)):
    if path not in sys.path:
        sys.path.insert(0, path)

import placement_census as producer  # noqa: E402
import validate_placement_census as validator  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402
import query as source_query  # noqa: E402


class PlacementCensusTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.checkpoint = json.loads((HERE / "checkpoint.json").read_text())
        cls.representatives = json.loads((HERE / "representatives.json").read_text())
        cls.validation = validator.validate()

    def test_independent_reenumeration_passes(self) -> None:
        self.assertEqual(
            self.validation["status"], "INDEPENDENT_EXACT_REENUMERATION_PASSED"
        )
        self.assertFalse(self.validation["target_faithful"])
        self.assertFalse(self.validation["row_system_existence_checked"])

    def test_exact_counts_and_orbit_sizes(self) -> None:
        cases = {tuple(case["profile"]): case for case in self.checkpoint["cases"]}
        self.assertEqual(cases[(4, 5, 6)]["raw_placement_count"], 253302)
        self.assertEqual(cases[(4, 5, 6)]["orbit_count"], 253302)
        self.assertEqual(cases[(4, 5, 6)]["orbit_size_histogram"], {"1": 253302})
        self.assertEqual(cases[(5, 5, 5)]["raw_placement_count"], 683424)
        self.assertEqual(cases[(5, 5, 5)]["orbit_count"], 113904)
        self.assertEqual(cases[(5, 5, 5)]["orbit_size_histogram"], {"6": 113904})
        self.assertEqual(self.checkpoint["totals"]["raw_placement_count"], 936726)
        self.assertEqual(self.checkpoint["totals"]["orbit_count"], 367206)

    def test_source_hashes_and_fail_closed_manifest(self) -> None:
        manifest = json.loads((HERE / "manifest.json").read_text())
        self.assertEqual(producer.validate_source_hashes(), producer.EXPECTED_SOURCE_HASHES)
        self.assertEqual(manifest["source"], producer.EXPECTED_SOURCE_HASHES)
        self.assertFalse(manifest["scope"]["target_faithful"])
        self.assertFalse(manifest["scope"]["row_system_existence_checked"])
        self.assertTrue(manifest["omitted_fail_closed"])

    def test_representative_codes_are_sorted_unique_and_round_trip(self) -> None:
        by_profile = {
            tuple(case["profile"]): case["representative_codes"]
            for case in self.representatives["cases"]
        }
        checkpoint_cases = {
            tuple(case["profile"]): case for case in self.checkpoint["cases"]
        }
        for profile, codes in by_profile.items():
            self.assertEqual(codes, sorted(set(codes)))
            self.assertEqual(
                producer.canonical_sha256(codes),
                checkpoint_cases[profile]["representative_codes_sha256"],
            )
            samples = codes[:3] + codes[len(codes) // 2:len(codes) // 2 + 3] + codes[-3:]
            for code in samples:
                self.assertEqual(producer.encode_placement(producer.decode_placement(code)), code)
        self.assertEqual(
            producer.file_sha256(HERE / "representatives.json"),
            self.checkpoint["representatives"]["file_sha256"],
        )

    def test_saved_query_seeds_are_covered(self) -> None:
        reps_by_profile = {
            tuple(case["profile"]): set(case["representative_codes"])
            for case in self.representatives["cases"]
        }
        for seed in source_query.CASE_SEEDS:
            profile = tuple(seed["profile"])
            frame, candidates = mc.cached_candidate_lists(profile, set(mc.PROVEN_ROWS))
            assert candidates is not None
            domains = producer.source_domains(frame, candidates)
            placement = producer.Placement(
                str(seed["surplus_cap"]),
                str(seed["second_large_cap"]),
                tuple(int(seed["labels"][role]) for role in producer.LABEL_ROLES),
            )
            self.assertTrue(producer.admitted(frame, candidates, domains, placement))
            automorphisms = producer.cyclic_automorphisms(frame, candidates)
            representative = min(
                producer.encode_placement(auto.apply(placement))
                for auto in automorphisms
            )
            self.assertIn(representative, reps_by_profile[profile])

    def test_mutations_are_rejected(self) -> None:
        frame, candidates = mc.cached_candidate_lists((4, 5, 6), set(mc.PROVEN_ROWS))
        assert candidates is not None
        domains = producer.source_domains(frame, candidates)
        seed = source_query.CASE_SEEDS[0]
        good = producer.Placement(
            str(seed["surplus_cap"]),
            str(seed["second_large_cap"]),
            tuple(int(seed["labels"][role]) for role in producer.LABEL_ROLES),
        )
        self.assertTrue(producer.admitted(frame, candidates, domains, good))
        duplicate = producer.Placement(
            good.surplus_cap,
            good.second_large_cap,
            (*good.labels[:-1], good.labels[0]),
        )
        self.assertFalse(producer.admitted(frame, candidates, domains, duplicate))
        small_surplus = producer.Placement("S", "O1", good.labels)
        self.assertFalse(producer.admitted(frame, candidates, domains, small_surplus))
        q_not_interior = producer.Placement(
            good.surplus_cap,
            good.second_large_cap,
            (good.labels[0], 8, *good.labels[2:]),
        )
        self.assertFalse(producer.admitted(frame, candidates, domains, q_not_interior))


if __name__ == "__main__":
    unittest.main()
