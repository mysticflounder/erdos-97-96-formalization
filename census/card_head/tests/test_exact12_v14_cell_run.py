from __future__ import annotations

import hashlib
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
from unittest.mock import patch

from census.card_head import exact12_v14_cell_run
from census.card_head.exact12_v14_cell_run import (
    cnf_assignment_satisfies,
    run_cell,
)
from census.card_head.sat_encoding import CadicalResult, EncodingError

DIMACS = "p cnf 1 1\n1 0\n"
CNF_SHA256 = hashlib.sha256(DIMACS.encode("ascii")).hexdigest()


def fake_materialization(*, with_blockers: bool = False):
    instance = SimpleNamespace(
        cnf=SimpleNamespace(n_variables=1, clauses=((1,),)),
        model=object(),
        dimacs=lambda: DIMACS,
    )
    compiled = SimpleNamespace(
        cell=object(), blocker_variables={1: 1} if with_blockers else {}
    )
    return instance, compiled


def fake_job() -> dict[str, object]:
    return {
        "job_id": "fake-exact12-v14-cell-0",
        "cnf": {"sha256": CNF_SHA256},
    }


class Exact12V14CellRunTest(unittest.TestCase):
    def test_cnf_assignment_satisfies_positive(self) -> None:
        self.assertTrue(
            cnf_assignment_satisfies(((1, -2), (2,)), (1, 2), n_variables=2)
        )

    def test_cnf_assignment_satisfies_negative(self) -> None:
        self.assertFalse(
            cnf_assignment_satisfies(((1, -2), (2,)), (2,), n_variables=2)
        )

    def test_cnf_assignment_satisfies_malformed(self) -> None:
        self.assertFalse(cnf_assignment_satisfies(((1,),), (0,)))
        self.assertFalse(cnf_assignment_satisfies(((1,),), (True,)))
        self.assertFalse(cnf_assignment_satisfies(((1,),), (2,), n_variables=1))
        self.assertFalse(cnf_assignment_satisfies(((1,),), (), n_variables=True))

    def test_unknown_solver_result_is_persisted_without_terminal_artifacts(self) -> None:
        instance, compiled = fake_materialization()
        calls: list[Path] = []

        def fake_solver(_instance, cnf_path: Path, **kwargs) -> CadicalResult:
            calls.append(cnf_path)
            self.assertIsNone(kwargs["proof_path"])
            return CadicalResult("UNKNOWN", None, 1, False, "fake UNKNOWN")

        with TemporaryDirectory() as temporary, patch.object(
            exact12_v14_cell_run,
            "build_manifest",
            return_value=object(),
        ), patch.object(
            exact12_v14_cell_run,
            "build_bound_job",
            return_value=fake_job(),
        ), patch.object(
            exact12_v14_cell_run,
            "instantiate_validated_bound_job",
            return_value=SimpleNamespace(instance=instance, compiled=compiled),
        ):
            workdir = Path(temporary) / "cell"
            summary = run_cell(Path(temporary), workdir, 0, solver=fake_solver)
            self.assertTrue((workdir / "summary.json").is_file())
            self.assertFalse((workdir / "terminal.cnf").exists())
            self.assertFalse((workdir / "terminal.drat").exists())

        self.assertEqual(summary["status"], "UNKNOWN")
        self.assertEqual(summary["discovery_verdict"], "UNKNOWN")
        self.assertIsNone(summary["terminal_verdict"])
        self.assertEqual(len(calls), 1)

    def test_discovery_unsat_requires_verified_terminal_proof(self) -> None:
        instance, compiled = fake_materialization()
        calls: list[tuple[Path, Path | None]] = []

        def fake_solver(_instance, cnf_path: Path, **kwargs) -> CadicalResult:
            proof_path = kwargs["proof_path"]
            calls.append((cnf_path, proof_path))
            if proof_path is None:
                return CadicalResult("UNSAT", None, 20, False, "discovery UNSAT")
            proof_path.write_text("fake proof\n", encoding="ascii")
            return CadicalResult("UNSAT", None, 20, True, "verified terminal")

        with TemporaryDirectory() as temporary, patch.object(
            exact12_v14_cell_run,
            "build_manifest",
            return_value=object(),
        ), patch.object(
            exact12_v14_cell_run,
            "build_bound_job",
            return_value=fake_job(),
        ), patch.object(
            exact12_v14_cell_run,
            "instantiate_validated_bound_job",
            return_value=SimpleNamespace(instance=instance, compiled=compiled),
        ):
            workdir = Path(temporary) / "cell"
            summary = run_cell(Path(temporary), workdir, 0, solver=fake_solver)
            self.assertEqual(calls[0][0].read_bytes(), calls[1][0].read_bytes())
            self.assertEqual(
                calls[1][1].read_text(encoding="ascii"), "fake proof\n"
            )

        self.assertEqual(summary["status"], "UNSAT_DRAT_VERIFIED")
        self.assertEqual(summary["terminal_verdict"], "UNSAT")
        self.assertTrue(summary["terminal_proof_verified"])
        self.assertEqual(len(calls), 2)
        self.assertIsNone(calls[0][1])

    def test_invalid_timeout_and_workdir_reuse_fail_closed(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            invalid_workdir = root / "invalid"
            with self.assertRaisesRegex(EncodingError, "timeout_seconds"):
                run_cell(root, invalid_workdir, 0, timeout_seconds=0)
            self.assertFalse(invalid_workdir.exists())

            stale_workdir = root / "stale"
            stale_workdir.mkdir()
            (stale_workdir / "stale.txt").write_text("stale\n", encoding="ascii")
            with self.assertRaisesRegex(EncodingError, "empty"):
                run_cell(root, stale_workdir, 0)
            self.assertTrue((stale_workdir / "stale.txt").is_file())

            instance, compiled = fake_materialization()

            def fake_solver(_instance, _cnf_path: Path, **kwargs) -> CadicalResult:
                return CadicalResult("UNKNOWN", None, 1, False, "fake UNKNOWN")

            with patch.object(
                exact12_v14_cell_run,
                "build_manifest",
                return_value=object(),
            ), patch.object(
                exact12_v14_cell_run,
                "build_bound_job",
                return_value=fake_job(),
            ), patch.object(
                exact12_v14_cell_run,
                "instantiate_validated_bound_job",
                return_value=SimpleNamespace(instance=instance, compiled=compiled),
            ):
                reusable = root / "reusable"
                run_cell(root, reusable, 0, solver=fake_solver)
                with self.assertRaisesRegex(EncodingError, "empty"):
                    run_cell(root, reusable, 0, solver=fake_solver)

    def test_sat_replay_failure_does_not_require_real_cell_model(self) -> None:
        instance, compiled = fake_materialization()

        def fake_solver(_instance, _cnf_path: Path, **kwargs) -> CadicalResult:
            return CadicalResult(
                "SAT",
                {},
                10,
                False,
                "fake SAT",
                frozenset({1}),
            )

        with TemporaryDirectory() as temporary, patch.object(
            exact12_v14_cell_run,
            "build_manifest",
            return_value=object(),
        ), patch.object(
            exact12_v14_cell_run,
            "build_bound_job",
            return_value=fake_job(),
        ), patch.object(
            exact12_v14_cell_run,
            "instantiate_validated_bound_job",
            return_value=SimpleNamespace(instance=instance, compiled=compiled),
        ), patch.object(
            exact12_v14_cell_run,
            "decode_blockers",
            return_value={},
        ), patch.object(
            exact12_v14_cell_run,
            "source_faithful_cube_ok",
            return_value=False,
        ), patch.object(
            exact12_v14_cell_run,
            "added_constraints_hold",
            return_value=True,
        ):
            summary = run_cell(
                Path(temporary), Path(temporary) / "cell", 0, solver=fake_solver
            )

        self.assertEqual(summary["status"], "SAT_REPLAY_FAILED")
        self.assertFalse(summary["replay"]["model"])
        self.assertFalse(summary["replay"]["candidate"])
        self.assertTrue(summary["replay"]["exact_cnf"])


if __name__ == "__main__":
    unittest.main()
