from __future__ import annotations

import unittest
from contextlib import ExitStack
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
from unittest.mock import patch

from census.card_head import exact12_next_row_arm_cell_run
from census.card_head.exact12_next_row_arm_cell_run import run_arm_cell
from census.card_head.sat_encoding import CadicalResult, EncodingError

DIMACS = "p cnf 1 1\n1 0\n"


def fake_materialization():
    instance = SimpleNamespace(
        cnf=SimpleNamespace(n_variables=1, clauses=((1,),)),
        model=object(),
        dimacs=lambda: DIMACS,
    )
    cell = SimpleNamespace(
        placement_index=0,
        joint_deletion=0,
        v=2,
        arm="u_q",
        base_cell=lambda: object(),
    )
    compiled = SimpleNamespace(
        cell=cell,
        base=SimpleNamespace(
            blocker_variables={(6, 0): 1},
            distinguished_d_variables={0: 1},
        ),
        clause_delta=((1,),),
        clause_delta_sha256="fake-clause-delta",
        named_deletion_clause_delta=((1,),),
        named_deletion_clause_delta_sha256="fake-arm-delta",
        final_n_variables=1,
        final_n_clauses=1,
        manifest=lambda: {"schema": "fake-arm-compiler"},
    )
    return instance, compiled


def patched_materialization(instance, compiled):
    stack = ExitStack()
    stack.enter_context(
        patch.object(
            exact12_next_row_arm_cell_run,
            "arm_cells",
            return_value=(compiled.cell,),
        )
    )
    stack.enter_context(
        patch.object(
            exact12_next_row_arm_cell_run, "build_model", return_value=object()
        )
    )
    stack.enter_context(
        patch.object(
            exact12_next_row_arm_cell_run,
            "SourceFaithfulCoverInstance",
            return_value=instance,
        )
    )
    stack.enter_context(
        patch.object(
            exact12_next_row_arm_cell_run,
            "compile_arm_cell",
            return_value=compiled,
        )
    )
    stack.enter_context(
        patch.object(
            exact12_next_row_arm_cell_run,
            "_source_manifest",
            return_value=[{"path": "fake", "bytes": 1, "sha256": "fake"}],
        )
    )
    return stack


class Exact12NextRowArmCellRunTest(unittest.TestCase):
    def test_source_manifest_covers_runner_and_lean_ingress_dependencies(
        self,
    ) -> None:
        repo_root = Path(__file__).resolve().parents[3]
        paths = {
            artifact["path"]
            for artifact in exact12_next_row_arm_cell_run._source_manifest(
                repo_root
            )
        }
        self.assertTrue(
            {
                "census/card_head/exact12_next_row_arm_cell_run.py",
                "census/card_head/exact12_next_row_cell_run.py",
                (
                    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
                    "ExactTwelveRigid221PhysicalCycleIngress.lean"
                ),
                (
                    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
                    "ExactTwelveRigid221V14SourceJobBridge.lean"
                ),
            }
            <= paths
        )

    def test_unknown_is_persisted_without_terminal_artifacts(self) -> None:
        instance, compiled = fake_materialization()

        def fake_solver(_instance, _cnf_path: Path, **kwargs) -> CadicalResult:
            self.assertIsNone(kwargs["proof_path"])
            return CadicalResult("UNKNOWN", None, 1, False, "fake UNKNOWN")

        with TemporaryDirectory() as temporary, patched_materialization(
            instance, compiled
        ):
            workdir = Path(temporary) / "arm-cell"
            summary = run_arm_cell(
                Path(temporary), workdir, 0, solver=fake_solver
            )
            self.assertTrue((workdir / "summary.json").is_file())
            self.assertFalse((workdir / "terminal.cnf").exists())
            self.assertFalse((workdir / "terminal.drat").exists())

        self.assertEqual(summary["status"], "UNKNOWN")

    def test_discovery_unsat_requires_verified_identical_terminal(self) -> None:
        instance, compiled = fake_materialization()
        calls: list[tuple[Path, Path | None]] = []

        def fake_solver(_instance, cnf_path: Path, **kwargs) -> CadicalResult:
            proof_path = kwargs["proof_path"]
            calls.append((cnf_path, proof_path))
            if proof_path is None:
                return CadicalResult("UNSAT", None, 20, False, "discovery UNSAT")
            proof_path.write_text("fake proof\n", encoding="ascii")
            return CadicalResult("UNSAT", None, 20, True, "verified terminal")

        with TemporaryDirectory() as temporary, patched_materialization(
            instance, compiled
        ):
            summary = run_arm_cell(
                Path(temporary),
                Path(temporary) / "arm-cell",
                0,
                solver=fake_solver,
            )
            self.assertEqual(calls[0][0].read_bytes(), calls[1][0].read_bytes())

        self.assertEqual(summary["status"], "UNSAT_DRAT_VERIFIED")
        self.assertTrue(summary["terminal_proof_verified"])
        self.assertEqual(len(calls), 2)

    def test_sat_witness_passes_arm_and_base_replay_gates(self) -> None:
        instance, compiled = fake_materialization()

        def fake_solver(_instance, _cnf_path: Path, **kwargs) -> CadicalResult:
            return CadicalResult(
                "SAT", {0: [0]}, 10, False, "fake SAT", frozenset({1})
            )

        with TemporaryDirectory() as temporary, patched_materialization(
            instance, compiled
        ), patch.object(
            exact12_next_row_arm_cell_run, "decode_blockers", return_value={6: 0}
        ), patch.object(
            exact12_next_row_arm_cell_run, "decode_distinguished_d", return_value=0
        ), patch.object(
            exact12_next_row_arm_cell_run,
            "source_faithful_cube_ok",
            return_value=True,
        ), patch.object(
            exact12_next_row_arm_cell_run,
            "added_constraints_hold",
            return_value=True,
        ), patch.object(
            exact12_next_row_arm_cell_run,
            "named_deletion_arm_holds",
            return_value=True,
        ):
            summary = run_arm_cell(
                Path(temporary),
                Path(temporary) / "arm-cell",
                0,
                solver=fake_solver,
            )

        self.assertEqual(summary["status"], "SAT_WITNESS_REPLAYED")
        self.assertEqual(
            summary["replay"],
            {
                "model": True,
                "candidate": True,
                "base_added_constraints": True,
                "named_deletion_arm": True,
                "exact_cnf": True,
            },
        )

    def test_sat_witness_fails_when_named_deletion_arm_fails(self) -> None:
        instance, compiled = fake_materialization()

        def fake_solver(_instance, _cnf_path: Path, **kwargs) -> CadicalResult:
            return CadicalResult(
                "SAT", {0: [0]}, 10, False, "fake SAT", frozenset({1})
            )

        with TemporaryDirectory() as temporary, patched_materialization(
            instance, compiled
        ), patch.object(
            exact12_next_row_arm_cell_run, "decode_blockers", return_value={6: 0}
        ), patch.object(
            exact12_next_row_arm_cell_run, "decode_distinguished_d", return_value=0
        ), patch.object(
            exact12_next_row_arm_cell_run,
            "source_faithful_cube_ok",
            return_value=True,
        ), patch.object(
            exact12_next_row_arm_cell_run,
            "added_constraints_hold",
            return_value=True,
        ), patch.object(
            exact12_next_row_arm_cell_run,
            "named_deletion_arm_holds",
            return_value=False,
        ):
            summary = run_arm_cell(
                Path(temporary),
                Path(temporary) / "arm-cell",
                0,
                solver=fake_solver,
            )

        self.assertEqual(summary["status"], "SAT_REPLAY_FAILED")
        self.assertFalse(summary["replay"]["model"])
        self.assertFalse(summary["replay"]["named_deletion_arm"])

    def test_invalid_arm_cell_and_workdir_reuse_fail_closed(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            with self.assertRaisesRegex(EncodingError, "arm_cell_index"):
                run_arm_cell(root, root / "invalid", 72)
            self.assertFalse((root / "invalid").exists())

            stale = root / "stale"
            stale.mkdir()
            stale.chmod(0o700)
            (stale / "artifact").write_text("stale\n", encoding="ascii")
            with self.assertRaisesRegex(EncodingError, "empty"):
                run_arm_cell(root, stale, 0)


if __name__ == "__main__":
    unittest.main()
