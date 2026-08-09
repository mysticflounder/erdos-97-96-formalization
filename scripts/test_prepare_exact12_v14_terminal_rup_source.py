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

STRUCTURAL_CNF = """\
p cnf 3 5
1 2 0
-1 0
-2 0
3 0
-1 -2 0
"""

CELL0_CUBE = {
    0: [1, 3, 4, 7],
    1: [0, 2, 6, 8],
    2: [0, 1, 10, 11],
    3: [0, 1, 4, 5],
    4: [0, 2, 3, 5],
    5: [0, 3, 4, 6],
    6: [0, 7, 8, 10],
    7: [1, 3, 6, 8],
    8: [1, 5, 6, 9],
    9: [1, 2, 7, 8],
    10: [0, 7, 9, 11],
    11: [1, 2, 9, 10],
}


class FakeCanonicalInstance:
    def __init__(self) -> None:
        self.rendered = CNF

    def dimacs(self) -> str:
        return self.rendered


class FakeCanonicalMaterialization:
    def __init__(self) -> None:
        self.instance = FakeCanonicalInstance()


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
        "cnf": {
            "bytes": discovery.stat().st_size,
            "encoding": "DIMACS",
            "n_clauses": 4,
            "n_variables": 3,
            "sha256": subject._sha256(discovery),
        },
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
    for name in ("discovery.cnf", "terminal.cnf"):
        (workdir / name).write_text(STRUCTURAL_CNF, encoding="ascii")
    summary["artifacts"]["discovery_cnf"] = _run_artifact(
        workdir / "discovery.cnf"
    )
    summary["artifacts"]["terminal_cnf"] = _run_artifact(workdir / "terminal.cnf")
    detector_manifest, _ = subject._expected_detector_manifest(
        Path(subject.__file__).resolve().parents[1]
    )
    detector_sha256 = subject._canonical_json_sha256(detector_manifest)
    certificate = {"stage": "equality-duplicate-center", "payload": [1, 2]}
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
        "certificate_kind": subject.STRUCTURAL_CERTIFICATE_KIND,
        "certificate_schema": subject.STRUCTURAL_CERTIFICATE_SCHEMA,
        "detector_stage": certificate["stage"],
        "certificate": certificate,
        "certificate_sha256": subject._canonical_json_sha256(certificate),
        "source_order_bank_index": None,
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


class DynamicFakeDratTrim:
    """Stand in only for drat-trim; all source and journal checks stay live."""

    def __init__(self) -> None:
        self.calls = 0

    def __call__(self, command, **_kwargs):
        self.calls += 1
        cnf = rup.parse_dimacs(Path(command[1]))
        addition_id = len(cnf.clauses) + 1
        Path(command[command.index("-L") + 1]).write_text(
            f"{addition_id} 0 1 0\n", encoding="ascii"
        )
        return subprocess.CompletedProcess(command, 0, "s VERIFIED\n", "")


class PrepareExact12TerminalRupSourceTest(unittest.TestCase):
    def setUp(self) -> None:
        self.canonical_rebuild = mock.patch.object(
            subject,
            "_canonical_materialization",
            side_effect=lambda _repo_root, _job: FakeCanonicalMaterialization(),
        ).start()

        def replay(_repo_root, instance, _journal_path, *, summary):
            self.assertEqual(summary["records"], 1)
            instance.rendered = STRUCTURAL_CNF
            return frozenset({(-1, -2)})

        self.semantic_replay = mock.patch.object(
            subject, "_semantic_replay_structural_journal", side_effect=replay
        ).start()
        self.addCleanup(mock.patch.stopall)

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

    def test_structural_unsupported_stage_fails_before_checker(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _structural_terminal_workdir(root)

            def replace_stage(_summary, record):
                record["detector_stage"] = "equality-perpendicular-bisector-convex"
                record["certificate"]["stage"] = record["detector_stage"]
                record["certificate_sha256"] = subject._canonical_json_sha256(
                    record["certificate"]
                )

            _rewrite_structural_record(workdir, replace_stage)
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError,
                "without a typed Lean terminal-bank ingress",
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)
            self.assertFalse((root / "source").exists())

    def test_structural_unsupported_certificate_family_fails_before_checker(
        self,
    ) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _structural_terminal_workdir(root)

            def replace_family(_summary, record):
                record["certificate_kind"] = "source_order_positive_coverage"
                record["certificate_schema"] = "source-order-test.v1"
                record["source_order_bank_index"] = 0

            _rewrite_structural_record(workdir, replace_family)
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError,
                "without a typed Lean terminal-bank ingress",
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)
            self.assertFalse((root / "source").exists())

    def test_structural_clause_suffix_must_match_journal(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _structural_terminal_workdir(root)
            _rewrite_structural_record(
                workdir,
                lambda _summary, record: record.__setitem__(
                    "learned_clause", [-1, -3]
                ),
            )
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError,
                "semantic journal replay learned-clause set drifted",
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)

    def test_self_consistent_job_and_formula_tamper_fails_source_rebuild(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _terminal_workdir(root)
            tampered = CNF.replace("p cnf 3 4", "p cnf 4 4")
            for name in ("discovery.cnf", "terminal.cnf"):
                (workdir / name).write_text(tampered, encoding="ascii")
            job_path = workdir / "job.json"
            job = json.loads(job_path.read_text(encoding="utf-8"))
            job["cnf"].update(
                {
                    "bytes": len(tampered.encode("ascii")),
                    "n_variables": 4,
                    "sha256": subject._sha256(workdir / "discovery.cnf"),
                }
            )
            job_path.write_text(
                json.dumps(job, indent=2, sort_keys=True) + "\n", encoding="utf-8"
            )
            summary_path = workdir / "summary.json"
            summary = json.loads(summary_path.read_text(encoding="utf-8"))
            summary["job_sha256"] = subject._canonical_json_sha256(job)
            for key, name in (
                ("job", "job.json"),
                ("discovery_cnf", "discovery.cnf"),
                ("terminal_cnf", "terminal.cnf"),
            ):
                summary["artifacts"][key] = _run_artifact(workdir / name)
            summary_path.write_text(
                json.dumps(summary, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            self.canonical_rebuild.side_effect = subject.TerminalRupSourceError(
                "bound job failed canonical source rebuild"
            )
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError, "failed canonical source rebuild"
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)

    def test_noncanonical_dimacs_bytes_fail_before_checker(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _terminal_workdir(root)
            noncanonical = "c alternate rendering\n" + CNF
            for name in ("discovery.cnf", "terminal.cnf"):
                (workdir / name).write_text(noncanonical, encoding="ascii")
            job_path = workdir / "job.json"
            job = json.loads(job_path.read_text(encoding="utf-8"))
            job["cnf"].update(
                {
                    "bytes": len(noncanonical.encode("ascii")),
                    "sha256": subject._sha256(workdir / "discovery.cnf"),
                }
            )
            job_path.write_text(
                json.dumps(job, indent=2, sort_keys=True) + "\n", encoding="utf-8"
            )
            summary_path = workdir / "summary.json"
            summary = json.loads(summary_path.read_text(encoding="utf-8"))
            summary["job_sha256"] = subject._canonical_json_sha256(job)
            for key, name in (
                ("job", "job.json"),
                ("discovery_cnf", "discovery.cnf"),
                ("terminal_cnf", "terminal.cnf"),
            ):
                summary["artifacts"][key] = _run_artifact(workdir / name)
            summary_path.write_text(
                json.dumps(summary, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError, "differs from canonical source rebuild"
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)

    def test_semantic_certificate_replay_failure_precedes_checker(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir = _structural_terminal_workdir(root)

            def mutate_certificate(_summary, record):
                record["certificate"]["payload"] = [2, 1]
                record["certificate_sha256"] = subject._canonical_json_sha256(
                    record["certificate"]
                )

            _rewrite_structural_record(workdir, mutate_certificate)
            self.semantic_replay.side_effect = subject.TerminalRupSourceError(
                "structural journal failed semantic certificate replay"
            )
            runner = FakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError, "failed semantic certificate replay"
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


class PrepareExact12TerminalRupSourceIntegrationTest(unittest.TestCase):
    """Exercise the live exact-12 compiler and structural replay boundary."""

    @classmethod
    def setUpClass(cls) -> None:
        cls.repo_root = Path(subject.__file__).resolve().parents[1]
        cls.schedule, cls.bound_jobs, cls.structural = subject._exact12_source_modules(
            cls.repo_root
        )
        manifest = cls.schedule.build_manifest(cls.repo_root)
        cls.job = cls.bound_jobs.build_bound_job(manifest, cls.repo_root, 0)

    def _write_real_workdir(
        self, root: Path, *, structural: bool
    ) -> tuple[Path, bytes, dict[str, object] | None]:
        workdir = root / "run"
        workdir.mkdir()
        job = json.loads(json.dumps(self.job))
        job_sha256 = subject._canonical_json_sha256(job)
        job_path = workdir / "job.json"
        job_path.write_text(
            json.dumps(job, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        proof_path = workdir / "terminal.drat"
        proof_path.write_text("proof\n", encoding="ascii")
        materialized = self.bound_jobs.materialize_cell(0)
        artifacts = {
            "job": _run_artifact(job_path),
            "proof": _run_artifact(proof_path),
        }
        summary: dict[str, object] = {
            "schema": (
                subject.STRUCTURAL_RUN_SCHEMA if structural else subject.CELL_RUN_SCHEMA
            ),
            "cell_index": 0,
            "job_sha256": job_sha256,
            "status": "UNSAT_DRAT_VERIFIED",
            "discovery_verdict": "UNSAT",
            "terminal_verdict": "UNSAT",
            "terminal_proof_verified": True,
            "error": None,
            "artifacts": artifacts,
        }
        record: dict[str, object] | None = None
        if structural:
            detector_manifest, _ = subject._expected_detector_manifest(self.repo_root)
            detector_sha256 = subject._canonical_json_sha256(detector_manifest)
            admitted_cut = self.structural.detect_admitted_cut(
                self.repo_root, materialized.instance, CELL0_CUBE
            )
            self.assertIsNotNone(admitted_cut)
            assert admitted_cut is not None
            selected = frozenset(
                materialized.instance.choice_variables[
                    (
                        center,
                        materialized.instance.candidate_index(
                            center, CELL0_CUBE[center]
                        ),
                    )
                ]
                for center in range(12)
            )
            record = self.structural._make_record(
                index=0,
                parent_sha256=job_sha256,
                job_sha256=job_sha256,
                detector_contract_sha256=detector_sha256,
                cell_index=0,
                admitted_cut=admitted_cut,
                cube=CELL0_CUBE,
                positive_variables=selected,
            )
            journal_path = workdir / "journal.jsonl"
            journal_path.write_text(
                json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n",
                encoding="utf-8",
            )
            count, terminal_record, _ = self.structural.replay_journal(
                self.repo_root,
                materialized.instance,
                journal_path,
                job_sha256=job_sha256,
                detector_contract_sha256=detector_sha256,
                cell_index=0,
            )
            self.assertEqual(count, 1)
            formula = materialized.instance.dimacs().encode("ascii")
            summary.update(
                {
                    "journal_replayed": True,
                    "records": count,
                    "terminal_record_sha256": terminal_record,
                    "detector_contract_manifest": detector_manifest,
                    "detector_contract_sha256": detector_sha256,
                }
            )
            artifacts["journal"] = _run_artifact(journal_path)
        else:
            formula = materialized.instance.dimacs().encode("ascii")
            clause_delta_path = workdir / "clause_delta.json"
            clause_delta_path.write_text(
                json.dumps(
                    job["clause_delta_artifact"], indent=2, sort_keys=True
                )
                + "\n",
                encoding="utf-8",
            )
            artifacts["clause_delta"] = _run_artifact(clause_delta_path)
        for key, name in (
            ("discovery_cnf", "discovery.cnf"),
            ("terminal_cnf", "terminal.cnf"),
        ):
            path = workdir / name
            path.write_bytes(formula)
            artifacts[key] = _run_artifact(path)
        (workdir / "summary.json").write_text(
            json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        return workdir, formula, record

    def _extend_with_real_source_order_record(self, workdir: Path) -> bytes:
        from census.card_head.exact12_v14_ordered_coverage import FROZEN_V8_CUBE

        summary_path = workdir / "summary.json"
        summary = json.loads(summary_path.read_text(encoding="utf-8"))
        journal_path = workdir / "journal.jsonl"
        records = [
            json.loads(line)
            for line in journal_path.read_text(encoding="utf-8").splitlines()
        ]
        self.assertEqual(len(records), 1)
        materialized = self.bound_jobs.materialize_cell(0)
        admitted_cut = self.structural.detect_admitted_cut(
            self.repo_root, materialized.instance, FROZEN_V8_CUBE
        )
        self.assertIsNotNone(admitted_cut)
        assert admitted_cut is not None
        self.assertEqual(
            admitted_cut.certificate_kind, subject.SOURCE_ORDER_CERTIFICATE_KIND
        )
        self.assertEqual(admitted_cut.bank_index, 0)
        positive_variables = frozenset(
            materialized.instance.choice_variables[
                (
                    center,
                    materialized.instance.candidate_index(
                        center, FROZEN_V8_CUBE[str(center)]
                    ),
                )
            ]
            for center in range(12)
        )
        record = self.structural._make_record(
            index=1,
            parent_sha256=records[0]["record_sha256"],
            job_sha256=summary["job_sha256"],
            detector_contract_sha256=summary["detector_contract_sha256"],
            cell_index=0,
            admitted_cut=admitted_cut,
            cube=FROZEN_V8_CUBE,
            positive_variables=positive_variables,
        )
        self.assertEqual(record["source_order_bank_index"], admitted_cut.bank_index)
        records.append(record)
        journal_path.write_text(
            "".join(
                json.dumps(item, sort_keys=True, separators=(",", ":")) + "\n"
                for item in records
            ),
            encoding="utf-8",
        )
        count, terminal_record, _ = self.structural.replay_journal(
            self.repo_root,
            materialized.instance,
            journal_path,
            job_sha256=summary["job_sha256"],
            detector_contract_sha256=summary["detector_contract_sha256"],
            cell_index=0,
        )
        self.assertEqual(count, 2)
        formula = materialized.instance.dimacs().encode("ascii")
        for name in ("discovery.cnf", "terminal.cnf"):
            (workdir / name).write_bytes(formula)
        summary["records"] = count
        summary["terminal_record_sha256"] = terminal_record
        for key, name in (
            ("journal", "journal.jsonl"),
            ("discovery_cnf", "discovery.cnf"),
            ("terminal_cnf", "terminal.cnf"),
        ):
            summary["artifacts"][key] = _run_artifact(workdir / name)
        summary_path.write_text(
            json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        return formula

    def test_real_structural_record_replays_and_preserves_exact_formula(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir, formula, _ = self._write_real_workdir(root, structural=True)
            runner = DynamicFakeDratTrim()
            output = root / "source"
            with mock.patch.object(
                subject,
                "_semantic_replay_structural_journal",
                wraps=subject._semantic_replay_structural_journal,
            ) as replay:
                receipt = subject.prepare_terminal_rup_source(
                    workdir, output, command_runner=runner
                )
            self.assertEqual(runner.calls, 1)
            self.assertEqual(replay.call_count, 2)
            self.assertIsNotNone(receipt["terminal_record_sha256"])
            self.assertEqual((output / "terminal.cnf").read_bytes(), formula)
            self.assertEqual((output / "discovery.cnf").read_bytes(), formula)

    def test_real_mixed_journal_publishes_typed_source_order_bank(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir, _, _ = self._write_real_workdir(root, structural=True)
            formula = self._extend_with_real_source_order_record(workdir)
            runner = DynamicFakeDratTrim()
            output = root / "source"
            with mock.patch.object(
                subject,
                "_semantic_replay_structural_journal",
                wraps=subject._semantic_replay_structural_journal,
            ) as replay:
                receipt = subject.prepare_terminal_rup_source(
                    workdir, output, command_runner=runner
                )
            self.assertEqual(runner.calls, 1)
            self.assertEqual(replay.call_count, 2)
            self.assertEqual(receipt["terminal_bank"]["entries"], 2)
            self.assertEqual(
                receipt["terminal_bank"]["lean_terminal_consumer"],
                subject.LEAN_TERMINAL_CONSUMER,
            )
            manifest = json.loads(
                (output / "terminal-bank-manifest.json").read_text(encoding="utf-8")
            )
            self.assertEqual(
                [entry["certificate_kind"] for entry in manifest["entries"]],
                [
                    subject.STRUCTURAL_CERTIFICATE_KIND,
                    subject.SOURCE_ORDER_CERTIFICATE_KIND,
                ],
            )
            self.assertEqual(
                manifest["entries"][0]["lean_ingress"]["adapter_declaration"],
                subject.LEAN_DUPLICATE_CENTER_ADAPTER,
            )
            self.assertEqual(
                manifest["entries"][1]["lean_ingress"]["kind"],
                "named_source_order_positive_nogood",
            )
            self.assertEqual(manifest["entries"][1]["source_order_bank_index"], 0)
            self.assertEqual((output / "terminal.cnf").read_bytes(), formula)

    def test_real_cell_rejects_self_consistent_source_tamper_before_checker(
        self,
    ) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir, _, _ = self._write_real_workdir(root, structural=False)
            n_variables = self.job["cnf"]["n_variables"]
            tampered = (workdir / "discovery.cnf").read_text(encoding="ascii").replace(
                f"p cnf {n_variables} ", f"p cnf {n_variables + 1} ", 1
            )
            for name in ("discovery.cnf", "terminal.cnf"):
                (workdir / name).write_text(tampered, encoding="ascii")
            job_path = workdir / "job.json"
            job = json.loads(job_path.read_text(encoding="utf-8"))
            job["cnf"].update(
                {
                    "bytes": len(tampered.encode("ascii")),
                    "n_variables": n_variables + 1,
                    "sha256": subject._sha256(workdir / "discovery.cnf"),
                }
            )
            job_path.write_text(
                json.dumps(job, indent=2, sort_keys=True) + "\n", encoding="utf-8"
            )
            summary_path = workdir / "summary.json"
            summary = json.loads(summary_path.read_text(encoding="utf-8"))
            summary["job_sha256"] = subject._canonical_json_sha256(job)
            for key, name in (
                ("job", "job.json"),
                ("discovery_cnf", "discovery.cnf"),
                ("terminal_cnf", "terminal.cnf"),
            ):
                summary["artifacts"][key] = _run_artifact(workdir / name)
            summary_path.write_text(
                json.dumps(summary, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            runner = DynamicFakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError, "failed canonical source rebuild"
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)

    def test_real_structural_rejects_rehashed_certificate_tamper_before_checker(
        self,
    ) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir, _, _ = self._write_real_workdir(root, structural=True)

            def mutate_certificate(_summary, record):
                record["certificate"]["core"]["triple"] = [0, 1, 5]
                record["certificate_sha256"] = subject._canonical_json_sha256(
                    record["certificate"]
                )

            _rewrite_structural_record(workdir, mutate_certificate)
            runner = DynamicFakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError,
                "failed semantic certificate replay",
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)

    def test_real_structural_rejects_alternate_dimacs_rendering_before_checker(
        self,
    ) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            workdir, formula, _ = self._write_real_workdir(root, structural=True)
            alternate = b"c alternate rendering\n" + formula
            for name in ("discovery.cnf", "terminal.cnf"):
                (workdir / name).write_bytes(alternate)
            summary_path = workdir / "summary.json"
            summary = json.loads(summary_path.read_text(encoding="utf-8"))
            for key, name in (
                ("discovery_cnf", "discovery.cnf"),
                ("terminal_cnf", "terminal.cnf"),
            ):
                summary["artifacts"][key] = _run_artifact(workdir / name)
            summary_path.write_text(
                json.dumps(summary, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            runner = DynamicFakeDratTrim()
            with self.assertRaisesRegex(
                subject.TerminalRupSourceError,
                "differs from canonical source rebuild",
            ):
                subject.prepare_terminal_rup_source(
                    workdir, root / "source", command_runner=runner
                )
            self.assertEqual(runner.calls, 0)


if __name__ == "__main__":
    unittest.main()
