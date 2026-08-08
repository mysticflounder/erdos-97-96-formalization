from __future__ import annotations

import copy
import unittest
from pathlib import Path

from census.card_head.exact12_v14_jobs import (
    EXECUTION_STATUS,
    SEMANTIC_STATUS,
    Exact12V14JobError,
    assert_execution_ready,
    build_job,
    build_job_set,
    validate_job,
    validate_job_set,
)
from census.card_head.exact12_v14_schedule import build_manifest, cells, json_sha256

REPO_ROOT = Path(__file__).resolve().parents[3]


class Exact12V14JobsTest(unittest.TestCase):
    def setUp(self) -> None:
        self.schedule_manifest = build_manifest(REPO_ROOT)

    def test_all_648_jobs_are_deterministic_and_unique(self) -> None:
        jobs = [
            build_job(self.schedule_manifest, REPO_ROOT, index)
            for index in range(len(cells()))
        ]
        self.assertEqual(len(jobs), 648)
        self.assertEqual(len({json_sha256(job) for job in jobs}), 648)
        self.assertEqual(jobs[0]["cell_index"], 0)
        self.assertEqual(jobs[-1]["cell_index"], 647)
        for job in jobs:
            self.assertEqual(job["semantic_status"], SEMANTIC_STATUS)
            self.assertEqual(job["execution_gate"]["status"], EXECUTION_STATUS)
            validate_job(job, self.schedule_manifest, REPO_ROOT)

    def test_execution_is_unconditionally_blocked(self) -> None:
        job = build_job(self.schedule_manifest, REPO_ROOT, 0)
        with self.assertRaisesRegex(
            Exact12V14JobError, "source-to-CNF valuation is unverified"
        ):
            assert_execution_ready(job, self.schedule_manifest, REPO_ROOT)

    def test_job_rejects_bad_indices_and_coordinate_tampering(self) -> None:
        for bad in (-1, 648, True, 1.0):
            with self.subTest(bad=bad), self.assertRaises(Exact12V14JobError):
                build_job(
                    self.schedule_manifest,
                    REPO_ROOT,
                    bad,  # type: ignore[arg-type]
                )

        job = build_job(self.schedule_manifest, REPO_ROOT, 1)
        job["cell"]["arm"] = "u_w"
        with self.assertRaisesRegex(Exact12V14JobError, "canonical"):
            validate_job(job, self.schedule_manifest, REPO_ROOT)

    def test_job_rejects_schedule_or_source_contract_drift(self) -> None:
        job = build_job(self.schedule_manifest, REPO_ROOT, 0)
        changed = copy.deepcopy(self.schedule_manifest)
        changed["source_contract"]["files"][0]["sha256"] = "0" * 64
        with self.assertRaisesRegex(Exact12V14JobError, "schedule manifest"):
            validate_job(job, changed, REPO_ROOT)

    def test_job_set_authenticates_exact_ordered_coverage(self) -> None:
        job_set = build_job_set(self.schedule_manifest, REPO_ROOT)
        self.assertEqual(job_set["job_count"], 648)
        self.assertEqual(len(job_set["jobs"]), 648)
        self.assertEqual(
            [entry["cell_index"] for entry in job_set["jobs"]], list(range(648))
        )
        validate_job_set(job_set, self.schedule_manifest, REPO_ROOT)

    def test_job_set_rejects_missing_duplicate_reordered_and_boolean_count(
        self,
    ) -> None:
        job_set = build_job_set(self.schedule_manifest, REPO_ROOT)
        variants = []

        missing = copy.deepcopy(job_set)
        missing["jobs"].pop()
        variants.append(missing)

        duplicate = copy.deepcopy(job_set)
        duplicate["jobs"][1] = copy.deepcopy(duplicate["jobs"][0])
        variants.append(duplicate)

        reordered = copy.deepcopy(job_set)
        reordered["jobs"].reverse()
        variants.append(reordered)

        boolean_count = copy.deepcopy(job_set)
        boolean_count["job_count"] = True
        variants.append(boolean_count)

        for variant in variants:
            with (
                self.subTest(variant=variant["jobs"][:1]),
                self.assertRaises(Exact12V14JobError),
            ):
                validate_job_set(variant, self.schedule_manifest, REPO_ROOT)


if __name__ == "__main__":
    unittest.main()
