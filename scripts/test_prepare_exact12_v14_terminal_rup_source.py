# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import subprocess
import tempfile
import unittest
from pathlib import Path
from unittest import mock

import materialize_checkpointed_rup as rup
import prepare_exact12_v14_terminal_rup_source as subject

CNF = """\
p cnf 3 4
1 2 0
-1 0
-2 0
3 0
"""


def _run_artifact(path: Path) -> dict[str, object]:
    return {
        "path": path.name,
        "bytes": path.stat().st_size,
        "sha256": subject._sha256(path),
    }


def _terminal_workdir(root: Path, *, status: str = "UNSAT_DRAT_VERIFIED") -> Path:
    workdir = root / "run"
    workdir.mkdir()
    job = workdir / "job.json"
    clause_delta = workdir / "clause_delta.json"
    discovery = workdir / "discovery.cnf"
    terminal = workdir / "terminal.cnf"
    proof = workdir / "terminal.drat"
    clause_delta_value = {"schema": "test-clause-delta.v1", "clauses": []}
    clause_delta.write_text(
        json.dumps(clause_delta_value, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    discovery.write_text(CNF, encoding="ascii")
    job_value = {
        "schema": subject.BOUND_JOB_SCHEMA,
        "cell_index": 0,
        "clause_delta_artifact": clause_delta_value,
        "cnf": {"sha256": subject._sha256(discovery)},
    }
    job.write_text(
        json.dumps(job_value, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    terminal.write_text(CNF, encoding="ascii")
    proof.write_text("proof\n", encoding="ascii")
    summary = {
        "schema": subject.CELL_RUN_SCHEMA,
        "cell_index": 0,
        "job_sha256": subject._canonical_json_sha256(job_value),
        "status": status,
        "discovery_verdict": "UNSAT",
        "terminal_verdict": "UNSAT",
        "terminal_proof_verified": True,
        "error": None,
        "artifacts": {
            "job": _run_artifact(job),
            "clause_delta": _run_artifact(clause_delta),
            "discovery_cnf": _run_artifact(discovery),
            "terminal_cnf": _run_artifact(terminal),
            "proof": _run_artifact(proof),
        },
    }
    (workdir / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return workdir


def _structural_terminal_workdir(root: Path) -> Path:
    workdir = _terminal_workdir(root)
    summary_path = workdir / "summary.json"
    summary = json.loads(summary_path.read_text(encoding="utf-8"))
    summary["schema"] = subject.STRUCTURAL_RUN_SCHEMA
    summary["artifacts"].pop("clause_delta")
    detector_manifest, _ = subject._expected_detector_manifest(
        Path(subject.__file__).resolve().parents[1]
    )
    detector_sha256 = subject._canonical_json_sha256(detector_manifest)
    certificate = {"stage": "test", "payload": [1, 2]}
    cube = {str(center): [] for center in range(12)}
    cube["0"] = [1, 2]
    positive_variables = [1, 2]
    record_body = {
        "schema": subject.STRUCTURAL_RECORD_SCHEMA,
        "index": 0,
        "parent_sha256": summary["job_sha256"],
        "job_sha256": summary["job_sha256"],
        "detector_contract_sha256": detector_sha256,
        "cell_index": 0,
        "detector_contract": subject.STRUCTURAL_DETECTOR_CONTRACT,
        "stage": certificate["stage"],
        "certificate": certificate,
        "certificate_sha256": subject._canonical_json_sha256(certificate),
        "learned_clause": [-1, -2],
        "cube": cube,
        "cube_sha256": subject._canonical_json_sha256(cube),
        "positive_variables": positive_variables,
        "assignment_sha256": subject._canonical_json_sha256(positive_variables),
    }
    record = {
        **record_body,
        "record_sha256": subject._canonical_json_sha256(record_body),
    }
    journal = workdir / "journal.jsonl"
    journal.write_text(
        json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n",
        encoding="utf-8",
    )
    summary.update(
        {
            "journal_replayed": True,
            "records": 1,
            "terminal_record_sha256": record["record_sha256"],
            "detector_contract_manifest": detector_manifest,
            "detector_contract_sha256": detector_sha256,
        }
    )
    summary["artifacts"]["journal"] = _run_artifact(journal)
    summary_path.write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return workdir


def _rewrite_structural_record(workdir: Path, mutate) -> None:
    summary_path = workdir / "summary.json"
    journal_path = workdir / "journal.jsonl"
    summary = json.loads(summary_path.read_text(encoding="utf-8"))
    record = json.loads(journal_path.read_text(encoding="utf-8"))
    mutate(summary, record)
    body = dict(record)
    body.pop("record_sha256", None)
    record["record_sha256"] = subject._canonical_json_sha256(body)
    summary["terminal_record_sha256"] = record["record_sha256"]
    journal_path.write_text(
        json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n",
        encoding="utf-8",
    )
    summary["artifacts"]["journal"] = _run_artifact(journal_path)
    summary_path.write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


class FakeDratTrim:
    def __init__(self, lrat: str = "4 d 4 0\n7 0 2 3 1 0\n"):
        self.lrat = lrat
        self.calls = 0

    def __call__(self, command, **_kwargs):
        self.calls += 1
        Path(command[command.index("-L") + 1]).write_text(self.lrat, encoding="ascii")
        return subprocess.CompletedProcess(command, 0, "s VERIFIED\n", "")


class PrepareExact12TerminalRupSourceTest(unittest.TestCase):
    def test_verified_terminal_run_publishes_dense_source(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _terminal_workdir(root)
            output = root / "source"
            runner = FakeDratTrim()
            receipt = subject.prepare_terminal_rup_source(
                workdir, output, command_runner=runner
            )
            self.assertEqual(runner.calls, 1)
            self.assertEqual(receipt["schema"], subject.RECEIPT_SCHEMA)
            self.assertEqual(receipt["normalization"]["additions"], 1)
            self.assertEqual(
                (output / "normalized.lrat").read_text(encoding="ascii"),
                "1 d 4 0\n5 0 2 3 1 0\n",
            )
            manifest, _, cnf_path, lrat_path = rup.load_source_manifest(
                output / "source-manifest.json"
            )
            self.assertEqual(manifest["schema"], rup.PURE_RUP_SOURCE_SCHEMA)
            self.assertEqual(cnf_path.read_text(encoding="ascii"), CNF)
            self.assertEqual(lrat_path.name, "normalized.lrat")
            self.assertTrue((output / "job.json").is_file())
            self.assertTrue((output / "clause_delta.json").is_file())
            self.assertTrue((output / "discovery.cnf").is_file())
            self.assertTrue((output / "drat-trim-output.txt").is_file())
            self.assertNotIn("checker", receipt)
            self.assertIn(
                "LEAN COMPACT-RUP REPLAY REQUIRED",
                receipt["drat_trim_precheck"]["epistemic_status"],
            )

    def test_nonterminal_summary_fails_before_checker(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _terminal_workdir(root, status="ITERATION_LIMIT")
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError, "not a clean verified terminal"
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)

    def test_artifact_drift_fails_before_checker(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _terminal_workdir(root)
            (workdir / "terminal.drat").write_text("tampered\n", encoding="ascii")
            runner = FakeDratTrim()
            with self.assertRaisesRegex(subject.TerminalRupSourceError, "artifact drift"):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)

    def test_summary_job_binding_drift_fails_before_checker(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _terminal_workdir(root)
            summary_path = workdir / "summary.json"
            summary = json.loads(summary_path.read_text(encoding="utf-8"))
            summary["job_sha256"] = "0" * 64
            summary_path.write_text(
                json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
            )
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError, "does not match its bound job"
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)

    def test_rat_hint_is_rejected_and_nothing_is_published(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _terminal_workdir(root)
            runner = FakeDratTrim("7 0 -2 3 1 0\n")
            output = root / "source"
            with self.assertRaisesRegex(subject.TerminalRupSourceError, "non-positive"):
                subject.prepare_terminal_rup_source(
                    workdir, output, command_runner=runner
                )
            self.assertFalse(output.exists())

    def test_staged_artifact_drift_fails_before_checker(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _terminal_workdir(root)
            runner = FakeDratTrim()
            real_copyfile = subject.shutil.copyfile

            def drifting_copy(source, destination):
                result = real_copyfile(source, destination)
                if Path(destination).name == "terminal.cnf":
                    Path(destination).write_bytes(Path(destination).read_bytes() + b"c")
                return result

            with (
                mock.patch.object(subject.shutil, "copyfile", drifting_copy),
                self.assertRaisesRegex(
                    subject.TerminalRupSourceError,
                    "staged terminal artifact drift",
                ),
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)
            self.assertFalse((root / "source").exists())

    def test_structural_journal_chain_is_copied_and_bound(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _structural_terminal_workdir(root)
            output = root / "source"
            receipt = subject.prepare_terminal_rup_source(
                workdir, output, command_runner=FakeDratTrim()
            )
            self.assertTrue((output / "journal.jsonl").is_file())
            self.assertEqual(
                receipt["terminal_record_sha256"],
                json.loads((workdir / "summary.json").read_text())["terminal_record_sha256"],
            )

    def test_structural_terminal_chain_head_drift_fails_before_checker(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _structural_terminal_workdir(root)
            summary_path = workdir / "summary.json"
            summary = json.loads(summary_path.read_text(encoding="utf-8"))
            summary["terminal_record_sha256"] = "0" * 64
            summary_path.write_text(
                json.dumps(summary, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError, "record count or chain head"
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)

    def test_structural_boolean_record_index_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _structural_terminal_workdir(root)
            _rewrite_structural_record(
                workdir, lambda _summary, record: record.__setitem__("index", False)
            )
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError, "failed chain authentication"
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)

    def test_structural_detector_manifest_must_match_source_files(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _structural_terminal_workdir(root)

            def drift_detector(summary, record):
                summary["detector_contract_manifest"][0]["sha256"] = "0" * 64
                digest = subject._canonical_json_sha256(
                    summary["detector_contract_manifest"]
                )
                summary["detector_contract_sha256"] = digest
                record["detector_contract_sha256"] = digest

            _rewrite_structural_record(workdir, drift_detector)
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError, "detector contract is malformed"
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)


if __name__ == "__main__":
    unittest.main()
