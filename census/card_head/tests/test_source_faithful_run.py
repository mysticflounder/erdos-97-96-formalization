from __future__ import annotations

import hashlib
import io
import json
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest.mock import patch

from census.card_head import source_faithful_run
from census.card_head.sat_encoding import CadicalResult, EncodingError
from census.card_head.source_faithful_run import (
    SOURCE_FAITHFUL_RUN_SCHEMA,
    SOURCE_FAITHFUL_SUCCESS_STATUSES,
    run_source_faithful,
)

SAT_CUBE = {
    0: [4, 5, 9, 11],
    1: [7, 8, 9, 11],
    2: [5, 8, 10, 11],
    3: [6, 8, 9, 10],
    4: [6, 7, 10, 11],
    5: [4, 7, 9, 10],
    6: [4, 5, 7, 8],
    7: [3, 5, 6, 9],
    8: [3, 4, 6, 11],
    9: [2, 5, 6, 7],
    10: [2, 4, 6, 8],
    11: [2, 3, 5, 10],
}


def _positive_variables_for_cube(instance, cube) -> frozenset[int]:
    """Build a complete true-variable set for the known SAT fixture."""

    assignment: dict[int, bool] = {}
    for center, candidate in cube.items():
        index = instance.candidate_index(center, candidate)
        assignment[instance.choice_variables[(center, index)]] = True

    clauses = instance.clauses_with()
    while True:
        changed = False
        for clause in clauses:
            values = [
                assignment[abs(literal)] if literal > 0 else not assignment[abs(literal)]
                for literal in clause
                if abs(literal) in assignment
            ]
            if any(values):
                continue
            unassigned = [
                literal for literal in clause if abs(literal) not in assignment
            ]
            if not unassigned:
                raise AssertionError(f"fixture assignment conflicts with {clause}")
            if len(unassigned) == 1:
                literal = unassigned[0]
                assignment[abs(literal)] = literal > 0
                changed = True
        if not changed:
            break

    for variable in range(1, instance.cnf.n_variables + 1):
        assignment.setdefault(variable, False)
    assert all(
        any(
            (literal > 0 and assignment[literal])
            or (literal < 0 and not assignment[-literal])
            for literal in clause
        )
        for clause in clauses
    )
    return frozenset(variable for variable, value in assignment.items() if value)


class SourceFaithfulRunTest(unittest.TestCase):
    def test_sat_run_records_metadata_without_a_proof(self) -> None:
        solver_options = {}

        def fake_solver(instance, cnf_path: Path, **kwargs) -> CadicalResult:
            self.assertTrue(cnf_path.is_file())
            self.assertFalse(kwargs["proof_path"].exists())
            solver_options.update(kwargs)
            return CadicalResult(
                "SAT",
                SAT_CUBE,
                10,
                False,
                "s SATISFIABLE",
                _positive_variables_for_cube(instance, SAT_CUBE),
            )

        with TemporaryDirectory() as temporary:
            workdir = Path(temporary)
            summary = run_source_faithful(
                workdir, timeout_seconds=17, nice=7, solver=fake_solver
            )
            persisted = json.loads((workdir / "summary.json").read_text())
            cnf_hash = hashlib.sha256((workdir / "base.cnf").read_bytes()).hexdigest()

        self.assertEqual(summary["schema"], SOURCE_FAITHFUL_RUN_SCHEMA)
        self.assertEqual(summary["status"], "SAT_WITNESS")
        self.assertEqual(summary["solver_verdict"], "SAT")
        self.assertFalse(summary["proof_verified"])
        self.assertTrue(summary["cube_replayed"])
        self.assertEqual(summary, persisted)
        self.assertEqual(summary["cardinality"], 12)
        self.assertEqual(summary["python_profile"], [5, 6, 4])
        self.assertEqual(summary["timeout_seconds"], 17)
        self.assertEqual(summary["nice"], 7)
        self.assertEqual(solver_options["timeout_seconds"], 17)
        self.assertEqual(solver_options["nice"], 7)
        self.assertGreater(summary["counts"]["base_variables"], 0)
        self.assertGreater(summary["counts"]["base_clauses"], 0)
        self.assertEqual(summary["hashes"]["cnf_sha256"], cnf_hash)
        self.assertIsNotNone(summary["artifacts"]["model"])
        self.assertIsNone(summary["artifacts"]["proof"])
        self.assertIsNone(summary["error"])

    def test_sat_missing_positive_assignment_is_persisted_as_malformed(self) -> None:
        def fake_solver(_instance, _cnf_path: Path, **_kwargs) -> CadicalResult:
            return CadicalResult("SAT", SAT_CUBE, 10, False, "missing assignment")

        with TemporaryDirectory() as temporary:
            summary = run_source_faithful(Path(temporary), solver=fake_solver)

        self.assertEqual(summary["status"], "SAT_MALFORMED")
        self.assertIn("did not contain positive variables", summary["error"])
        self.assertFalse(summary["cube_replayed"])

    def test_sat_cube_mismatch_is_persisted_as_malformed(self) -> None:
        def fake_solver(instance, _cnf_path: Path, **_kwargs) -> CadicalResult:
            mismatched_cube = {center: list(row) for center, row in SAT_CUBE.items()}
            mismatched_cube[0].append(11)
            return CadicalResult(
                "SAT",
                mismatched_cube,
                10,
                False,
                "cube mismatch",
                _positive_variables_for_cube(instance, SAT_CUBE),
            )

        with TemporaryDirectory() as temporary:
            summary = run_source_faithful(Path(temporary), solver=fake_solver)

        self.assertEqual(summary["status"], "SAT_MALFORMED")
        self.assertIn("disagrees with the decoded cube", summary["error"])
        self.assertFalse(summary["cube_replayed"])

    def test_sat_clause_unsatisfying_assignment_is_persisted_as_malformed(self) -> None:
        def fake_solver(instance, _cnf_path: Path, **_kwargs) -> CadicalResult:
            positive = set(_positive_variables_for_cube(instance, SAT_CUBE))
            index = instance.candidate_index(0, SAT_CUBE[0])
            positive.remove(instance.choice_variables[(0, index)])
            return CadicalResult(
                "SAT",
                SAT_CUBE,
                10,
                False,
                "clause-unsatisfying assignment",
                frozenset(positive),
            )

        with TemporaryDirectory() as temporary:
            summary = run_source_faithful(Path(temporary), solver=fake_solver)

        self.assertEqual(summary["status"], "SAT_MALFORMED")
        self.assertIn("failed CNF replay", summary["error"])
        self.assertFalse(summary["cube_replayed"])

    def test_verified_unsat_records_proof_artifact(self) -> None:
        def fake_solver(_instance, _cnf_path: Path, **kwargs) -> CadicalResult:
            kwargs["proof_path"].write_text("verified proof\n", encoding="utf-8")
            return CadicalResult("UNSAT", None, 20, True, "s UNSATISFIABLE")

        with TemporaryDirectory() as temporary:
            workdir = Path(temporary)
            summary = run_source_faithful(workdir, solver=fake_solver)
            persisted = json.loads((workdir / "summary.json").read_text())

        self.assertEqual(summary, persisted)
        self.assertEqual(summary["status"], "UNSAT_DRAT_VERIFIED")
        self.assertEqual(summary["solver_verdict"], "UNSAT")
        self.assertTrue(summary["proof_verified"])
        self.assertIsNotNone(summary["artifacts"]["proof"])
        self.assertIsNotNone(summary["hashes"]["proof_sha256"])
        self.assertIsNone(summary["artifacts"]["model"])

    def test_timeout_and_unknown_are_persisted_non_successes(self) -> None:
        for verdict, returncode in (("TIMEOUT", None), ("UNKNOWN", 1)):
            with self.subTest(verdict=verdict), TemporaryDirectory() as temporary:
                def fake_solver(
                    _instance,
                    _cnf_path: Path,
                    _verdict=verdict,
                    _returncode=returncode,
                    **_kwargs,
                ) -> CadicalResult:
                    return CadicalResult(
                        _verdict, None, _returncode, False, _verdict
                    )

                workdir = Path(temporary)
                summary = run_source_faithful(workdir, solver=fake_solver)
                persisted = json.loads((workdir / "summary.json").read_text())

                self.assertEqual(summary, persisted)
                self.assertEqual(summary["status"], verdict)
                self.assertEqual(summary["solver_verdict"], verdict)
                self.assertNotIn(summary["status"], SOURCE_FAITHFUL_SUCCESS_STATUSES)

    def test_malformed_sat_and_unverified_unsat_are_persisted(self) -> None:
        cases = (
            (
                CadicalResult(
                    "SAT",
                    {center: [0, 1, 2, 3] for center in range(12)},
                    10,
                    False,
                    "bad SAT",
                ),
                "SAT_MALFORMED",
            ),
            (
                CadicalResult("UNSAT", None, 20, False, "unverified UNSAT"),
                "UNSAT_UNVERIFIED",
            ),
        )
        for result, expected_status in cases:
            with self.subTest(status=expected_status), TemporaryDirectory() as temporary:
                def fake_solver(
                    _instance, _cnf_path: Path, _result=result, **_kwargs
                ) -> CadicalResult:
                    return _result

                workdir = Path(temporary)
                summary = run_source_faithful(workdir, solver=fake_solver)
                persisted = json.loads((workdir / "summary.json").read_text())

                self.assertEqual(summary, persisted)
                self.assertEqual(summary["status"], expected_status)
                self.assertEqual(summary["solver_verdict"], result.verdict)
                self.assertIsNotNone(summary["error"])
                self.assertNotIn(expected_status, SOURCE_FAITHFUL_SUCCESS_STATUSES)

    def test_raised_proof_failure_is_persisted(self) -> None:
        def fake_solver(_instance, _cnf_path: Path, **kwargs) -> CadicalResult:
            kwargs["proof_path"].write_text("invalid proof\n", encoding="utf-8")
            raise EncodingError("DRAT verification failed: fake checker failure")

        with TemporaryDirectory() as temporary:
            workdir = Path(temporary)
            summary = run_source_faithful(workdir, solver=fake_solver)
            persisted = json.loads((workdir / "summary.json").read_text())

        self.assertEqual(summary, persisted)
        self.assertEqual(summary["status"], "PIPELINE_ERROR")
        self.assertIsNone(summary["solver_verdict"])
        self.assertFalse(summary["proof_verified"])
        self.assertIn("fake checker failure", summary["error"])
        self.assertIsNotNone(summary["artifacts"]["proof"])

    def test_nonempty_workdir_is_rejected_without_writing(self) -> None:
        solver_called = False

        def fake_solver(_instance, _cnf_path: Path, **_kwargs) -> CadicalResult:
            nonlocal solver_called
            solver_called = True
            return CadicalResult("UNKNOWN", None, 1, False, "")

        with TemporaryDirectory() as temporary:
            workdir = Path(temporary)
            stale_path = workdir / "base.drat"
            stale_path.write_text("stale\n", encoding="utf-8")
            with self.assertRaisesRegex(EncodingError, "workdir must be empty"):
                run_source_faithful(workdir, solver=fake_solver)

            self.assertFalse(solver_called)
            self.assertEqual(stale_path.read_text(encoding="utf-8"), "stale\n")
            self.assertFalse((workdir / "summary.json").exists())

    def test_main_returns_zero_only_for_accepted_statuses(self) -> None:
        statuses = (
            ("SAT_WITNESS", 0),
            ("UNSAT_DRAT_VERIFIED", 0),
            ("TIMEOUT", 2),
            ("UNKNOWN", 2),
            ("SAT_MALFORMED", 2),
            ("UNSAT_UNVERIFIED", 2),
            ("PIPELINE_ERROR", 2),
        )
        for status, expected in statuses:
            with self.subTest(status=status), patch.object(
                source_faithful_run,
                "run_source_faithful",
                return_value={"status": status},
            ), patch(
                "sys.argv", ["source_faithful_run", "--workdir", "unused"]
            ), patch("sys.stdout", new_callable=io.StringIO):
                self.assertEqual(source_faithful_run.main(), expected)


if __name__ == "__main__":
    unittest.main()
