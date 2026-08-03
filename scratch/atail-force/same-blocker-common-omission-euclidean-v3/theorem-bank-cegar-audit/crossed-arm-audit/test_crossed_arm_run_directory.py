#!/usr/bin/env python3
"""Solver-free lifecycle checks for crossed-arm run directories."""

from __future__ import annotations

import importlib.util
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock


MODULE_PATH = Path(__file__).with_name("crossed_arm_cegar.py")
SPEC = importlib.util.spec_from_file_location(
    "crossed_arm_run_directory_under_test", MODULE_PATH
)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"cannot import {MODULE_PATH}")
crossed_arm_cegar = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = crossed_arm_cegar
SPEC.loader.exec_module(crossed_arm_cegar)


class AuditConstructionReached(Exception):
    """Stop run_arm immediately after its directory decision."""


class CrossedArmRunDirectoryTest(unittest.TestCase):
    arm = crossed_arm_cegar.ARMS[0]
    run_tag = "run-directory-test"
    representation = (
        crossed_arm_cegar.incidence_cegar.DEFAULT_CRITICAL_K4_REPRESENTATION
    )

    def target(self, root: Path) -> Path:
        suffix = crossed_arm_cegar.critical_k4_artifact_suffix(
            self.representation
        )
        return root / f"{self.arm}-{self.run_tag}{suffix}"

    def run_until_audit(
        self,
        root: Path,
        *,
        resume_result: Path | None = None,
        universal_cut_import: Path | None = None,
    ) -> None:
        with mock.patch.object(
            crossed_arm_cegar, "HERE", root
        ), mock.patch.object(
            crossed_arm_cegar,
            "CrossedAudit",
            side_effect=AuditConstructionReached,
        ):
            crossed_arm_cegar.run_arm(
                self.arm,
                timeout_ms=1,
                max_iterations=1,
                run_tag=self.run_tag,
                resume_result=resume_result,
                universal_cut_import=universal_cut_import,
                critical_k4_representation=self.representation,
            )

    def test_fresh_run_rejects_existing_target_before_audit(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = self.target(root)
            target.mkdir()
            sentinel = target / "existing-state.json"
            sentinel.write_text("preserve me\n")

            with self.assertRaises(FileExistsError):
                self.run_until_audit(root)

            self.assertEqual(sentinel.read_text(), "preserve me\n")

    def test_explicit_resume_may_reuse_existing_target(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            target = self.target(root)
            target.mkdir()
            sentinel = target / "existing-state.json"
            sentinel.write_text("resume state\n")

            with self.assertRaises(AuditConstructionReached):
                self.run_until_audit(
                    root,
                    resume_result=target / "result.json",
                )

            self.assertEqual(sentinel.read_text(), "resume state\n")

    def test_universal_import_remains_a_fresh_run(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            self.target(root).mkdir()

            with self.assertRaises(FileExistsError):
                self.run_until_audit(
                    root,
                    universal_cut_import=root / "prior-result.json",
                )


if __name__ == "__main__":
    unittest.main()
