#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path
import tempfile
import unittest

from domain import validate_orbit_model
from parallel_sweep import (
    SAT_STATUS,
    TERMINAL_STATUSES,
    UNKNOWN_STATUS,
    build_jobs,
    run,
)


def _args(output_dir: Path) -> argparse.Namespace:
    return argparse.Namespace(
        workers=2,
        min_period=2,
        max_period=2,
        min_point_slack=4,
        max_point_slack=4,
        queries=["some_hit", "all_omission"],
        fixed_radius_cases=[False, True],
        timeout_ms=20_000,
        seed=0,
        max_circle_triple_constraints=500_000,
        max_canonical_candidates=50_000,
        checkpoint_every=2,
        output_dir=output_dir,
    )


class ParallelSweepTests(unittest.TestCase):
    def test_job_order_is_deterministic_and_duplicate_free(self) -> None:
        jobs = build_jobs(
            min_period=2,
            max_period=3,
            min_point_slack=1,
            max_point_slack=3,
            queries=["all_omission", "some_hit", "some_hit"],
            fixed_radius_cases=[True, False, True],
        )
        self.assertEqual(jobs, sorted(jobs))
        self.assertEqual(len(jobs), 24)
        self.assertEqual(len({job.key for job in jobs}), len(jobs))

    def test_bounded_parallel_sweep_is_verified_and_sorted(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            output_dir = Path(temporary)
            manifest = run(_args(output_dir))
            self.assertEqual(manifest["status"], "COMPLETE_DISCOVERY_SWEEP")
            self.assertEqual(manifest["job_count"], 4)
            self.assertEqual(manifest["status_counts"][SAT_STATUS], 4)
            self.assertEqual(
                sum(
                    item["job_count"]
                    for item in manifest["job_runtime_provenance"]
                ),
                manifest["job_count"],
            )

            results = [
                json.loads(line)
                for line in (output_dir / "results.jsonl").read_text().splitlines()
            ]
            self.assertTrue(
                all(
                    set(record["runtime_provenance"])
                    == {"python", "z3", "platform", "host"}
                    for record in results
                )
            )
            self.assertEqual(
                [record["job_key"] for record in results],
                sorted(
                    (record["job_key"] for record in results),
                    key=lambda key: (
                        "query=all_omission" in key,
                        "radius=fixed" in key,
                    ),
                ),
            )
            models = [
                json.loads(line)
                for line in (output_dir / "models.jsonl").read_text().splitlines()
            ]
            self.assertGreaterEqual(len(models), 1)
            for model in models:
                validate_orbit_model(model)
            self.assertFalse(list(output_dir.glob("*.tmp")))

    def test_resume_skips_terminal_jobs(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            output_dir = Path(temporary)
            first = run(_args(output_dir))
            second = run(_args(output_dir))
            self.assertEqual(first["job_count"], second["resumed_terminal_count"])
            self.assertEqual(second["attempted_this_invocation"], 0)

    def test_configuration_mismatch_fails_closed(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            output_dir = Path(temporary)
            run(_args(output_dir))
            changed = _args(output_dir)
            changed.max_point_slack = 5
            with self.assertRaisesRegex(RuntimeError, "configuration mismatch"):
                run(changed)

    def test_audit_mutation_of_unsat_point_count_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            output_dir = Path(temporary)
            args = _args(output_dir)
            args.min_point_slack = 1
            args.max_point_slack = 1
            args.queries = ["some_hit"]
            args.fixed_radius_cases = [False]
            run(args)
            results_path = output_dir / "results.jsonl"
            record = json.loads(results_path.read_text())
            record["point_count"] += 1
            results_path.write_text(json.dumps(record, sort_keys=True) + "\n")
            with self.assertRaisesRegex(RuntimeError, "base field mismatch"):
                run(args)

    def test_all_checkpoint_derived_fields_are_verified(self) -> None:
        mutations = {
            "recorded_jobs": [],
            "terminal_jobs": [],
            "unknown_jobs": ["invented"],
            "model_count": 999,
        }
        for field, mutation in mutations.items():
            with self.subTest(field=field), tempfile.TemporaryDirectory() as temporary:
                output_dir = Path(temporary)
                args = _args(output_dir)
                run(args)
                checkpoint_path = output_dir / "checkpoint.json"
                checkpoint = json.loads(checkpoint_path.read_text())
                checkpoint[field] = mutation
                checkpoint_path.write_text(
                    json.dumps(checkpoint, indent=2, sort_keys=True) + "\n"
                )
                with self.assertRaisesRegex(
                    RuntimeError, f"checkpoint/results disagreement in {field}"
                ):
                    run(args)

    def test_resource_preflight_is_conservative_but_allows_slack_one(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            args = _args(Path(temporary))
            args.min_period = 30
            args.max_period = 30
            args.min_point_slack = 2
            args.max_point_slack = 2
            args.max_circle_triple_constraints = 1
            with self.assertRaisesRegex(RuntimeError, "resource preflight rejected"):
                run(args)

        with tempfile.TemporaryDirectory() as temporary:
            args = _args(Path(temporary))
            args.min_period = 4
            args.max_period = 4
            args.min_point_slack = 1
            args.max_point_slack = 1
            args.max_circle_triple_constraints = 1
            manifest = run(args)
            self.assertEqual(manifest["status"], "COMPLETE_DISCOVERY_SWEEP")

    def test_unknown_is_nonterminal(self) -> None:
        self.assertNotIn(UNKNOWN_STATUS, TERMINAL_STATUSES)


if __name__ == "__main__":
    unittest.main()
