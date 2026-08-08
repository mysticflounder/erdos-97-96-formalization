from __future__ import annotations

import copy
import unittest
from pathlib import Path

from census.card_head.exact12_v14_bound_jobs import (
    BOUND_JOB_SCHEMA,
    EXECUTION_STATUS,
    SEMANTIC_STATUS,
    Exact12V14BoundJobError,
    bound_cell,
    build_bound_job,
    instantiate_validated_bound_job,
    materialize_cell,
    validate_bound_job,
)
from census.card_head.exact12_v14_schedule import build_manifest

REPO_ROOT = Path(__file__).resolve().parents[3]


class Exact12V14BoundJobsTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.schedule_manifest = build_manifest(REPO_ROOT)
        cls.job = build_bound_job(cls.schedule_manifest, REPO_ROOT, 0)

    def test_cell_zero_has_frozen_exact_cnf_binding(self) -> None:
        job = self.job
        self.assertEqual(job["schema"], BOUND_JOB_SCHEMA)
        self.assertEqual(job["semantic_status"], SEMANTIC_STATUS)
        self.assertEqual(job["execution_gate"]["status"], EXECUTION_STATUS)
        self.assertEqual(job["cell_index"], 0)
        self.assertEqual(job["cell"]["arm"], "u_q")
        self.assertEqual(job["cell"]["distinguished_d"], 0)
        self.assertEqual(job["cnf"]["n_variables"], 42710)
        self.assertEqual(job["cnf"]["n_clauses"], 369355)
        self.assertEqual(
            job["cnf"]["sha256"],
            "cfc268f2915ff31e1af24a66a036e41e81f93aca0967e88c1b4a4158eb67a379",
        )
        self.assertEqual(
            job["execution_gate"]["promotion"],
            "FORBIDDEN_WITHOUT_TERMINAL_PROOF_AND_AGGREGATE_REPLAY",
        )
        validate_bound_job(job, self.schedule_manifest, REPO_ROOT)

    def test_validated_instance_rebuilds_the_bound_dimacs(self) -> None:
        materialized = instantiate_validated_bound_job(
            self.job, self.schedule_manifest, REPO_ROOT
        )
        self.assertEqual(
            materialized.instance.cnf.n_variables,
            self.job["cnf"]["n_variables"],
        )
        self.assertEqual(
            len(materialized.instance.cnf.clauses),
            self.job["cnf"]["n_clauses"],
        )
        self.assertEqual(materialized.compiled.cell, bound_cell(self.job))

    def test_tampering_is_rejected(self) -> None:
        mutations = []

        bad_cnf = copy.deepcopy(self.job)
        bad_cnf["cnf"]["sha256"] = "0" * 64
        mutations.append(bad_cnf)

        bad_cell = copy.deepcopy(self.job)
        bad_cell["cell"]["arm"] = "u_w"
        mutations.append(bad_cell)

        bad_source = copy.deepcopy(self.job)
        bad_source["source_to_cnf_contract"]["files"][0]["sha256"] = "f" * 64
        mutations.append(bad_source)

        bad_status = copy.deepcopy(self.job)
        bad_status["execution_gate"]["status"] = "CERTIFIED_UNSAT"
        mutations.append(bad_status)

        for mutation in mutations:
            with (
                self.subTest(mutation=mutation["job_id"]),
                self.assertRaises(Exact12V14BoundJobError),
            ):
                validate_bound_job(mutation, self.schedule_manifest, REPO_ROOT)

    def test_bad_indices_fail_closed(self) -> None:
        for cell_index in (-1, 648, True, 0.0):
            with (
                self.subTest(cell_index=cell_index),
                self.assertRaises(Exact12V14BoundJobError),
            ):
                materialize_cell(cell_index)  # type: ignore[arg-type]


if __name__ == "__main__":
    unittest.main()
