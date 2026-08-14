#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Tests for the next-row arm terminal pure-RUP source postprocessor.

The class fixture produces one authentic terminal cell workdir with the real
producer (``run_arm_cell`` on arm cell 52, real CaDiCaL and drat-trim), then
each test operates on an isolated copy.  The happy path runs the complete
postprocessor with real binaries; the fail-closed tests use recording fake
runners to prove that tampered inputs are rejected before any solver or
checker executes and that nothing is ever published.
"""

from __future__ import annotations

import hashlib
import json
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from typing import Any

REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

import materialize_checkpointed_rup as rup
import prepare_exact12_next_row_arm_terminal_rup_source as arm
import prepare_exact12_v14_terminal_rup_source as v14

from census.card_head import exact12_next_row_arm_cell_run as arm_run

ARM_CELL_INDEX = 52


def _canonical_sha256(payload: dict[str, Any]) -> str:
    return hashlib.sha256(
        json.dumps(payload, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def _pretty_sha256(payload: dict[str, Any]) -> str:
    return hashlib.sha256(v14._json_bytes(payload)).hexdigest()


def _write_json(path: Path, payload: dict[str, Any]) -> None:
    path.write_bytes(v14._json_bytes(payload))


def _load_json(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def _ledger_entry(path: Path) -> dict[str, Any]:
    data = path.read_bytes()
    return {
        "path": path.name,
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
    }


class RecordingRunner:
    """Refuses real work: records every invocation and reports failure."""

    def __init__(self) -> None:
        self.calls: list[list[str]] = []

    def __call__(
        self, command: list[str], **_kwargs: Any
    ) -> subprocess.CompletedProcess[str]:
        self.calls.append([str(part) for part in command])
        return subprocess.CompletedProcess(command, 1, stdout="", stderr="")


class ScriptedRunner:
    """Replays a fixed per-call script of (returncode, stdout) results."""

    def __init__(self, steps: list[tuple[int, str]]) -> None:
        self.steps = list(steps)
        self.calls: list[list[str]] = []

    def __call__(
        self, command: list[str], **_kwargs: Any
    ) -> subprocess.CompletedProcess[str]:
        self.calls.append([str(part) for part in command])
        if not self.steps:
            return subprocess.CompletedProcess(command, 1, stdout="", stderr="")
        returncode, stdout = self.steps.pop(0)
        return subprocess.CompletedProcess(
            command, returncode, stdout=stdout, stderr=""
        )


class PrepareNextRowArmTerminalRupSourceTest(unittest.TestCase):
    fixture_dir: tempfile.TemporaryDirectory[str]
    producer_workdir: Path

    @classmethod
    def setUpClass(cls) -> None:
        for binary in ("cadical", "drat-trim"):
            if shutil.which(binary) is None:
                raise unittest.SkipTest(f"{binary} is not on PATH")
        cls.fixture_dir = tempfile.TemporaryDirectory(prefix="arm52-fixture-")
        cls.producer_workdir = Path(cls.fixture_dir.name) / "cell-52"
        summary = arm_run.run_arm_cell(
            REPO_ROOT, cls.producer_workdir, ARM_CELL_INDEX, timeout_seconds=600
        )
        if summary["status"] != "UNSAT_DRAT_VERIFIED":
            raise AssertionError(
                f"fixture producer run is not terminal: {summary['status']!r}"
            )

    @classmethod
    def tearDownClass(cls) -> None:
        cls.fixture_dir.cleanup()

    def _copied_workdir(self) -> tuple[Path, Path]:
        root = Path(tempfile.mkdtemp(prefix="arm52-case-"))
        self.addCleanup(shutil.rmtree, root, ignore_errors=True)
        workdir = root / "workdir"
        shutil.copytree(self.producer_workdir, workdir)
        return root, workdir

    def _assert_nothing_published(self, output_dir: Path) -> None:
        self.assertFalse(output_dir.exists())
        leftovers = [
            entry.name
            for entry in output_dir.parent.iterdir()
            if entry.name.startswith(f".{output_dir.name}.stage-")
        ]
        self.assertEqual(leftovers, [])

    def test_verified_terminal_arm_run_publishes_pure_rup_source(self) -> None:
        root, workdir = self._copied_workdir()
        output = root / "source"
        receipt = arm.prepare_terminal_arm_rup_source(
            workdir, output, repo_root=REPO_ROOT
        )
        self.assertEqual(receipt["schema"], arm.RECEIPT_SCHEMA)
        self.assertEqual(receipt["arm_cell_index"], ARM_CELL_INDEX)
        self.assertIn("not aggregate", receipt["scope"])
        rematerialization = receipt["rematerialization"]
        self.assertEqual(rematerialization["semantics"], "current-source")
        self.assertTrue(rematerialization["cnf_bytes_identical"])
        job = _load_json(workdir / "job.json")
        self.assertEqual(
            [entry["path"] for entry in rematerialization["source_drift"]],
            [entry["path"] for entry in job["sources"]],
        )
        self.assertEqual(
            receipt["drat_trim_precheck"]["epistemic_status"],
            "UNTRUSTED_PRECHECK_ONLY; LEAN COMPACT-RUP REPLAY REQUIRED",
        )
        body = {
            key: value for key, value in receipt.items() if key != "receipt_sha256"
        }
        self.assertEqual(receipt["receipt_sha256"], _canonical_sha256(body))
        for record in receipt["artifacts"].values():
            published = output / record["path"]
            self.assertTrue(published.is_file())
            data = published.read_bytes()
            self.assertEqual(len(data), record["byte_count"])
            self.assertEqual(hashlib.sha256(data).hexdigest(), record["sha256"])
        manifest, _manifest_record, cnf_path, lrat_path = rup.load_source_manifest(
            output / "source-manifest.json"
        )
        self.assertEqual(manifest["schema"], rup.PURE_RUP_SOURCE_SCHEMA)
        self.assertEqual(cnf_path, (output / "terminal.cnf").resolve())
        self.assertEqual(lrat_path, (output / "normalized.lrat").resolve())
        self.assertEqual(
            manifest["artifacts"]["cnf"]["sha256"],
            hashlib.sha256(cnf_path.read_bytes()).hexdigest(),
        )
        self.assertEqual(
            manifest["artifacts"]["normalized_lrat"]["sha256"],
            hashlib.sha256(lrat_path.read_bytes()).hexdigest(),
        )
        self.assertEqual(
            (output / "terminal.cnf").read_bytes(),
            (workdir / "terminal.cnf").read_bytes(),
        )
        self.assertGreater((output / "normalized.lrat").stat().st_size, 0)
        self.assertEqual(receipt["fresh_proof"]["exit_code"], 20)

    def test_status_tamper_fails_before_any_checker_call(self) -> None:
        root, workdir = self._copied_workdir()
        summary_path = workdir / "summary.json"
        summary = _load_json(summary_path)
        summary["status"] = "SAT_WITNESS_REPLAYED"
        _write_json(summary_path, summary)
        runner = RecordingRunner()
        output = root / "source"
        with self.assertRaisesRegex(
            arm.TerminalRupSourceError, "clean verified terminal UNSAT"
        ):
            arm.prepare_terminal_arm_rup_source(
                workdir, output, repo_root=REPO_ROOT, command_runner=runner
            )
        self.assertEqual(runner.calls, [])
        self._assert_nothing_published(output)

    def test_artifact_drift_fails_before_any_checker_call(self) -> None:
        root, workdir = self._copied_workdir()
        with (workdir / "terminal.cnf").open("ab") as stream:
            stream.write(b"c tampered\n")
        runner = RecordingRunner()
        output = root / "source"
        with self.assertRaises(arm.TerminalRupSourceError):
            arm.prepare_terminal_arm_rup_source(
                workdir, output, repo_root=REPO_ROOT, command_runner=runner
            )
        self.assertEqual(runner.calls, [])
        self._assert_nothing_published(output)

    def test_self_consistent_cnf_tamper_fails_rematerialization(self) -> None:
        root, workdir = self._copied_workdir()
        cnf_lines = (workdir / "terminal.cnf").read_bytes().splitlines(keepends=True)
        self.assertTrue(cnf_lines[-1].endswith(b" 0\n"))
        cnf_lines[-1] = b"1 2 0\n"
        tampered_cnf = b"".join(cnf_lines)
        (workdir / "terminal.cnf").write_bytes(tampered_cnf)
        (workdir / "discovery.cnf").write_bytes(tampered_cnf)

        job_path = workdir / "job.json"
        job = _load_json(job_path)
        job.pop("job_id")
        job["cnf"]["bytes"] = len(tampered_cnf)
        job["cnf"]["sha256"] = hashlib.sha256(tampered_cnf).hexdigest()
        job["job_id"] = _pretty_sha256(job)
        _write_json(job_path, job)

        delta_path = workdir / "clause_delta.json"
        clause_delta = _load_json(delta_path)
        clause_delta["job_id"] = job["job_id"]
        _write_json(delta_path, clause_delta)

        summary_path = workdir / "summary.json"
        summary = _load_json(summary_path)
        summary["job_id"] = job["job_id"]
        summary["job_sha256"] = _pretty_sha256(job)
        for key, path in (
            ("job", job_path),
            ("clause_delta", delta_path),
            ("discovery_cnf", workdir / "discovery.cnf"),
            ("terminal_cnf", workdir / "terminal.cnf"),
        ):
            summary["artifacts"][key] = _ledger_entry(path)
        _write_json(summary_path, summary)

        runner = RecordingRunner()
        output = root / "source"
        with self.assertRaisesRegex(
            arm.TerminalRupSourceError, "current-source rematerialization"
        ):
            arm.prepare_terminal_arm_rup_source(
                workdir, output, repo_root=REPO_ROOT, command_runner=runner
            )
        self.assertEqual(runner.calls, [])
        self._assert_nothing_published(output)

    def test_clause_delta_tamper_fails_rematerialization(self) -> None:
        root, workdir = self._copied_workdir()
        delta_path = workdir / "clause_delta.json"
        clause_delta = _load_json(delta_path)
        self.assertTrue(clause_delta["clauses"])
        clause_delta["clauses"][0] = [literal + 1 for literal in
                                      clause_delta["clauses"][0]]
        _write_json(delta_path, clause_delta)
        summary_path = workdir / "summary.json"
        summary = _load_json(summary_path)
        summary["artifacts"]["clause_delta"] = _ledger_entry(delta_path)
        _write_json(summary_path, summary)

        runner = RecordingRunner()
        output = root / "source"
        with self.assertRaisesRegex(
            arm.TerminalRupSourceError, "clause delta or cell differs"
        ):
            arm.prepare_terminal_arm_rup_source(
                workdir, output, repo_root=REPO_ROOT, command_runner=runner
            )
        self.assertEqual(runner.calls, [])
        self._assert_nothing_published(output)

    def test_existing_output_directory_is_never_overwritten(self) -> None:
        root, workdir = self._copied_workdir()
        output = root / "source"
        output.mkdir()
        sentinel = output / "existing.txt"
        sentinel.write_text("keep", encoding="utf-8")
        runner = RecordingRunner()
        with self.assertRaisesRegex(
            arm.TerminalRupSourceError, "refusing to overwrite"
        ):
            arm.prepare_terminal_arm_rup_source(
                workdir, output, repo_root=REPO_ROOT, command_runner=runner
            )
        self.assertEqual(runner.calls, [])
        self.assertEqual(sentinel.read_text(encoding="utf-8"), "keep")

    def test_original_precheck_without_verified_line_fails_closed(self) -> None:
        root, workdir = self._copied_workdir()
        runner = ScriptedRunner([(0, "c parsed\nc no verdict line\n")])
        output = root / "source"
        with self.assertRaisesRegex(
            arm.TerminalRupSourceError, "original wave proof failed"
        ):
            arm.prepare_terminal_arm_rup_source(
                workdir, output, repo_root=REPO_ROOT, command_runner=runner
            )
        self.assertEqual(len(runner.calls), 1)
        self._assert_nothing_published(output)

    def test_solver_non_unsat_exit_fails_closed(self) -> None:
        root, workdir = self._copied_workdir()
        runner = ScriptedRunner([(0, "s VERIFIED\n"), (10, "s SATISFIABLE\n")])
        output = root / "source"
        with self.assertRaisesRegex(
            arm.TerminalRupSourceError, "did not report UNSAT"
        ):
            arm.prepare_terminal_arm_rup_source(
                workdir, output, repo_root=REPO_ROOT, command_runner=runner
            )
        self.assertEqual(len(runner.calls), 2)
        self.assertEqual(runner.calls[1][1], "--plain")
        self._assert_nothing_published(output)


if __name__ == "__main__":
    unittest.main()
