from __future__ import annotations

import copy
import json
from pathlib import Path
import tempfile
import unittest
from unittest import mock

from census.census_554 import combinatorics
from census.census_554 import convex_structural_seeds as seeds


REPO_ROOT = Path(__file__).resolve().parents[3]
PROBE_RESULT = (
    REPO_ROOT
    / "scratch/census-554/separation_probe_runs"
    / "transition-bank5836-union-20260711T1035Z/result.json"
)


def _raw(payload) -> bytes:
    return json.dumps(payload, sort_keys=True, indent=2).encode() + b"\n"


class ConvexStructuralSeedsTest(unittest.TestCase):
    def test_real_frontier_builds_full_validated_profile_orbit(self):
        payload = seeds.build_seed_artifact(PROBE_RESULT)
        validated = seeds.validate_seed_artifact_bytes(
            _raw(payload), source_path=Path("fixture.json")
        )

        self.assertEqual(validated.schema, seeds.SCHEMA)
        self.assertEqual(validated.record_count, 36)
        self.assertEqual(len(set(validated.profile_orbit_keys)), 36)
        self.assertEqual(
            validated.profile_orbit_keys,
            tuple(
                combinatorics.serialize_pattern(pattern)
                for pattern in validated.patterns
            ),
        )
        self.assertIn(
            combinatorics.serialize_pattern(seeds.FOUR_ROW_PATTERN),
            validated.profile_orbit_keys,
        )
        self.assertEqual(
            validated.theorem_ids,
            (seeds.GENERIC_THEOREM, seeds.EXACT_THEOREM),
        )

        emitted = payload["seed_cores"][0]
        self.assertEqual(emitted["foci"], [1, 6])
        self.assertEqual(emitted["witnesses"], [3, 8, 10])
        self.assertEqual(emitted["minimization"]["minimum_active_rows"], 4)
        self.assertEqual(
            emitted["minimization"]["optimal_row_subsets"],
            [[1, 3, 6, 10]],
        )

        requested = payload["analysis"]["requested_fixed_labels_core"]
        self.assertEqual(requested["foci"], [1, 4])
        self.assertEqual(requested["witnesses"], [3, 5, 9])
        self.assertEqual(requested["minimization"]["minimum_active_rows"], 5)
        self.assertEqual(
            requested["minimization"]["optimal_row_subsets"],
            [[3, 4, 5, 6, 9]],
        )

    def test_every_exclusion_is_path_checked_and_not_a_bank_row(self):
        payload = seeds.build_seed_artifact(PROBE_RESULT)
        validated = seeds.validate_seed_artifact_bytes(
            _raw(payload), source_path=Path("fixture.json")
        )
        self.assertEqual(len(validated.records), 36)
        for record in validated.records:
            self.assertEqual(
                record["theorem"]["generic"], seeds.GENERIC_THEOREM
            )
            self.assertFalse(
                record["theorem"]["json_paths_emitted_as_lean_certificates"]
            )
            self.assertFalse(record["provenance"]["bank_compatible"])
            self.assertEqual(
                record["provenance"]["trust_class"],
                "convex-structural-theorem",
            )
            self.assertNotIn("source_pid", record["provenance"])
            self.assertNotIn("source_row_sha256", record["provenance"])
            self.assertNotIn("cert", record)
            pattern = {
                int(center): frozenset(mask)
                for center, mask in record["pattern"].items()
            }
            self.assertEqual(
                pattern,
                seeds._used_row_pattern(record["core"]["closure_paths"]),
            )

    def test_path_theorem_and_bank_boundary_tampering_are_rejected(self):
        base = seeds.build_seed_artifact(PROBE_RESULT)
        cases = []

        bad_path = copy.deepcopy(base)
        bad_path["exclusions"][0]["core"]["closure_paths"][0]["steps"][0][
            "second"
        ] = 2
        cases.append((bad_path, "exclusions do not regenerate"))

        bad_member = copy.deepcopy(base)
        bad_member["seed_cores"][0]["memberships"][0]["member"] = 8
        cases.append((bad_member, "membership fields do not match"))

        bad_theorem = copy.deepcopy(base)
        bad_theorem["theorem_contract"]["generic"] = "Untrusted.theorem"
        cases.append((bad_theorem, "wrong generic theorem"))

        bad_source_hash = copy.deepcopy(base)
        bad_source_hash["theorem_contract"]["source_sha256"] = "0" * 64
        cases.append((bad_source_hash, "source hash has drifted"))

        bad_bank = copy.deepcopy(base)
        bad_bank["source_probe"]["bank_rows"] += 1
        cases.append((bad_bank, "field has drifted: bank_rows"))

        false_bank_row = copy.deepcopy(base)
        false_bank_row["exclusions"][0]["provenance"]["bank_compatible"] = True
        cases.append((false_bank_row, "exclusions do not regenerate"))

        for payload, message in cases:
            with self.subTest(message=message):
                with self.assertRaisesRegex(seeds.StructuralSeedError, message):
                    seeds.validate_seed_artifact_bytes(
                        _raw(payload), source_path=Path("tampered.json")
                    )

    def test_pending_and_passed_build_evidence_are_explicit(self):
        pending = seeds.build_seed_artifact(PROBE_RESULT)
        pending_validated = seeds.validate_seed_artifact_bytes(
            _raw(pending), source_path=Path("pending.json")
        )
        self.assertEqual(pending_validated.record_count, 36)
        self.assertEqual(pending_validated.theorem_build_status, "pending")
        self.assertEqual(
            pending["theorem_contract"]["theorem_build"]["status"],
            "pending",
        )

        source_sha = pending["theorem_contract"]["source_sha256"]
        passed = seeds.build_seed_artifact(
            PROBE_RESULT,
            theorem_build=seeds.passed_theorem_build(source_sha),
        )
        passed_validated = seeds.validate_seed_artifact_bytes(
            _raw(passed), source_path=Path("passed.json")
        )
        self.assertEqual(passed_validated.record_count, 36)
        self.assertEqual(passed_validated.theorem_build_status, "passed")
        self.assertEqual(passed_validated.theorem_source_sha256, source_sha)
        self.assertEqual(len(passed_validated.theorem_contract_sha256), 64)
        evidence = passed["theorem_contract"]["theorem_build"]
        self.assertEqual(evidence["status"], "passed")
        self.assertEqual(evidence["command"], seeds.LEAN_BUILD_COMMAND)
        self.assertEqual(
            evidence["axiom_audits"],
            {
                seeds.GENERIC_THEOREM: seeds.EXPECTED_AXIOMS,
                seeds.EXACT_THEOREM: seeds.EXPECTED_AXIOMS,
            },
        )
        self.assertFalse(
            passed["theorem_contract"][
                "json_paths_emitted_as_lean_certificates"
            ]
        )

        bad_axioms = copy.deepcopy(passed)
        bad_axioms["theorem_contract"]["theorem_build"]["axiom_audits"][
            seeds.GENERIC_THEOREM
        ] = ["propext"]
        with self.assertRaisesRegex(
            seeds.StructuralSeedError,
            "passed theorem build evidence does not replay",
        ):
            seeds.validate_seed_artifact_bytes(
                _raw(bad_axioms), source_path=Path("bad-axioms.json")
            )

    def test_probe_result_hash_drift_is_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            result = Path(directory) / "result.json"
            result.write_bytes(PROBE_RESULT.read_bytes())
            payload = seeds.build_seed_artifact(result)
            source = json.loads(result.read_text())
            source["iteration"] += 1
            result.write_text(json.dumps(source, sort_keys=True) + "\n")
            with self.assertRaisesRegex(
                seeds.StructuralSeedError, "result hash has drifted"
            ):
                seeds.validate_seed_artifact_bytes(
                    _raw(payload), source_path=Path("drifted.json")
                )

    def test_snapshotted_source_result_makes_validation_self_contained(self):
        with tempfile.TemporaryDirectory() as directory:
            result = Path(directory) / "result.json"
            source_bytes = PROBE_RESULT.read_bytes()
            result.write_bytes(source_bytes)
            payload = seeds.build_seed_artifact(result)
            result.unlink()

            with self.assertRaises(FileNotFoundError):
                seeds.validate_seed_artifact_bytes(
                    _raw(payload), source_path=Path("without-snapshot.json")
                )
            validated = seeds.validate_seed_artifact_bytes(
                _raw(payload),
                source_path=Path("with-snapshot.json"),
                source_result_override=source_bytes,
            )
            self.assertEqual(validated.source_result_bytes, source_bytes)
            self.assertEqual(validated.source_result_path, result.resolve())
            self.assertEqual(
                validated.source_result_sha256,
                seeds._sha256_bytes(source_bytes),
            )

    def test_snapshotted_theorem_source_survives_repo_source_absence(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            result = root / "result.json"
            result.write_bytes(PROBE_RESULT.read_bytes())
            payload = seeds.build_seed_artifact(result)
            theorem_bytes = (seeds.REPO_ROOT / seeds.THEOREM_SOURCE).read_bytes()

            with mock.patch.object(seeds, "REPO_ROOT", root / "missing-repo"):
                with self.assertRaises(FileNotFoundError):
                    seeds.validate_seed_artifact_bytes(
                        _raw(payload),
                        source_path=Path("without-theorem-snapshot.json"),
                    )
                validated = seeds.validate_seed_artifact_bytes(
                    _raw(payload),
                    source_path=Path("with-theorem-snapshot.json"),
                    theorem_source_override=theorem_bytes,
                )
                self.assertEqual(validated.theorem_source_bytes, theorem_bytes)
                self.assertEqual(
                    validated.theorem_source_path,
                    root / "missing-repo" / seeds.THEOREM_SOURCE,
                )
                with self.assertRaisesRegex(
                    seeds.StructuralSeedError, "theorem source hash has drifted"
                ):
                    seeds.validate_seed_artifact_bytes(
                        _raw(payload),
                        source_path=Path("bad-theorem-snapshot.json"),
                        theorem_source_override=theorem_bytes + b"\n",
                    )

    def test_unique_run_is_published_only_after_reread_validation(self):
        with tempfile.TemporaryDirectory() as directory:
            work_root = Path(directory) / "runs"
            before = PROBE_RESULT.read_bytes()
            first = seeds.write_seed_run(PROBE_RESULT, work_root=work_root)
            second = seeds.write_seed_run(PROBE_RESULT, work_root=work_root)
            self.assertNotEqual(first, second)
            self.assertFalse(first.name.startswith("."))
            self.assertFalse(second.name.startswith("."))
            validated, raw = seeds.read_seed_artifact(
                first / "structural_seed.json"
            )
            manifest = json.loads((first / "run_manifest.json").read_text())
            self.assertEqual(manifest["status"], "validated")
            self.assertEqual(manifest["record_count"], 36)
            self.assertEqual(manifest["artifact_sha256"], validated.source_sha256)
            self.assertEqual(validated.source_sha256, seeds._sha256_bytes(raw))
            self.assertEqual(PROBE_RESULT.read_bytes(), before)


if __name__ == "__main__":
    unittest.main()
