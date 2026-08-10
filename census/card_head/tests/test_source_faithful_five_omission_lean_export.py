from __future__ import annotations

import hashlib
import json
import shutil
import tempfile
import unittest
from pathlib import Path

from census.card_head import source_faithful_five_omission_lean_export as exporter
from census.card_head.sat_encoding import solve_cadical
from census.card_head.source_faithful_five_omission import (
    SOURCE_FAITHFUL_FIVE_OMISSION_SCHEMA,
)
from census.card_head.source_faithful_five_omission_cegar import (
    DETECTOR_CONTRACT,
    DETECTOR_FILES,
    FORMULA_FILES,
    RUN_SCHEMA,
    FiveOmissionCegarError,
    _append_record,
    _artifact_no_follow,
    _canonical_json_bytes,
    _make_record,
    _new_instance,
    _sha256_json,
    _source_manifest,
    _tool_manifest,
    _write_json,
    detect_structural_certificate,
    learned_clause_for_certificate,
)
from census.card_head.tests.test_source_faithful_five_omission import SAT_CUBE


@unittest.skipUnless(shutil.which("cadical"), "CaDiCaL is required")
class SourceFaithfulFiveOmissionLeanExportTests(unittest.TestCase):
    repo_root = Path(__file__).resolve().parents[3]

    def _fixture(self, root: Path) -> tuple[Path, dict[str, object]]:
        workdir = root / "run"
        workdir.mkdir()
        deleted_label = 2
        instance = _new_instance(deleted_label)
        base_clause_count = len(instance.cnf.clauses)
        base_formula_sha256 = hashlib.sha256(
            instance.dimacs().encode("utf-8")
        ).hexdigest()
        formula_manifest = _source_manifest(self.repo_root, FORMULA_FILES)
        detector_manifest = _source_manifest(self.repo_root, DETECTOR_FILES)
        formula_contract_sha256 = _sha256_json(formula_manifest)
        detector_contract_sha256 = _sha256_json(detector_manifest)

        forced_instance = _new_instance(deleted_label)
        for center, candidate in SAT_CUBE.items():
            candidate_index = forced_instance.candidate_index(center, candidate)
            forced_instance.cnf.add_clause(
                (forced_instance.choice_variables[(center, candidate_index)],)
            )
        forced_instance.cnf.add_clause(
            (forced_instance.blocker_variables[9],)
        )
        for center in range(5):
            forced_instance.cnf.add_clause(
                (forced_instance.center_variables[center],)
            )
        result = solve_cadical(
            forced_instance,
            root / "witness.cnf",
            timeout_seconds=30,
            nice=10,
        )
        self.assertEqual(result.verdict, "SAT")
        self.assertIsNotNone(result.positive_variables)
        positive = result.positive_variables
        assert positive is not None
        cube, boundary = instance.decode_model_and_boundary(positive)
        certificate = detect_structural_certificate(cube, n=12)
        assert certificate is not None
        self.assertEqual(certificate["stage"], "equality-duplicate-center")
        clause = learned_clause_for_certificate(instance, certificate)
        record = _make_record(
            index=0,
            parent_sha256="",
            raw_base_formula_sha256=base_formula_sha256,
            base_formula_sha256=base_formula_sha256,
            shared_bank_document_sha256=None,
            formula_contract_sha256=formula_contract_sha256,
            detector_contract_sha256=detector_contract_sha256,
            deleted_label=deleted_label,
            cube=cube,
            witness=boundary,
            positive_variables=tuple(sorted(positive)),
            certificate=certificate,
            learned_clause=clause,
        )
        instance.cnf.add_clause(clause)
        journal = workdir / "journal.jsonl"
        journal.touch()
        _append_record(journal, record)
        journal_artifact = _artifact_no_follow(journal)
        assert journal_artifact is not None
        tool_manifest = _tool_manifest()
        summary: dict[str, object] = {
            "schema": RUN_SCHEMA,
            "scope": "test fixture; record-validity only",
            "finite_instance_schema": SOURCE_FAITHFUL_FIVE_OMISSION_SCHEMA,
            "deleted_label": deleted_label,
            "raw_base_formula_sha256": base_formula_sha256,
            "base_formula_sha256": base_formula_sha256,
            "current_formula_sha256": hashlib.sha256(
                instance.dimacs().encode("utf-8")
            ).hexdigest(),
            "n_variables": instance.cnf.n_variables,
            "raw_base_clause_count": base_clause_count,
            "base_clause_count": base_clause_count,
            "current_clause_count": base_clause_count + 1,
            "shared_bank": {
                "enabled": False,
                "schema": None,
                "artifact_sha256": None,
                "artifact_bytes": None,
                "document_sha256": None,
                "bootstrap_clause_list_sha256": None,
                "record_count": 0,
                "source_run_count": 0,
                "source_contract": None,
            },
            "selector_variables": {
                "deleted": list(instance.deleted_variables.values()),
                "blocker": list(instance.blocker_variables.values()),
                "centers": list(instance.center_variables.values()),
            },
            "formula_source_manifest": formula_manifest,
            "formula_contract_sha256": formula_contract_sha256,
            "detector_source_manifest": detector_manifest,
            "detector_contract_sha256": detector_contract_sha256,
            "tool_manifest": tool_manifest,
            "tool_contract_sha256": _sha256_json(tool_manifest),
            "tool_execution_assumption": "test fixture",
            "status": "ITERATION_LIMIT",
            "records": 1,
            "terminal_record_sha256": record["record_sha256"],
            "discovery_verdict": "SAT",
            "terminal_verdict": None,
            "terminal_proof_verified": False,
            "replay": {
                "same_labeling_boundary": True,
                "exact_cnf": True,
            },
            "journal_replayed": True,
            "source_manifests_rechecked": True,
            "tools_rechecked": True,
            "max_iterations": 1,
            "timeout_seconds": 60,
            "artifacts": {
                "journal": journal_artifact,
                "shared_bank": None,
                "discovery_cnf": None,
                "terminal_cnf": None,
                "proof": None,
                "survivor": None,
            },
            "error": None,
        }
        _write_json(workdir / "summary.json", summary)
        return workdir, record

    def test_valid_v3_snapshot_selects_detector_stage_without_legacy_alias(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            workdir, record = self._fixture(Path(temporary))
            self.assertNotIn("stage", record)
            run = exporter.load_authenticated_run(self.repo_root, workdir, 2)
            selected = exporter.select_duplicate_center_membership_records(run)
        self.assertEqual(len(selected), 1)
        self.assertEqual(selected[0]["iteration"], 0)

    def test_recomputed_record_hash_still_rejects_detector_stage_drift(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            workdir, record = self._fixture(Path(temporary))
            record["detector_stage"] = "equality-equilateral-bisector-collision"
            body = dict(record)
            body.pop("record_sha256")
            record["record_sha256"] = _sha256_json(body)
            journal = workdir / "journal.jsonl"
            journal.write_bytes(_canonical_json_bytes(record) + b"\n")
            summary_path = workdir / "summary.json"
            summary = json.loads(summary_path.read_text(encoding="utf-8"))
            summary["terminal_record_sha256"] = record["record_sha256"]
            summary["artifacts"]["journal"] = _artifact_no_follow(journal)
            summary_path.write_bytes(_canonical_json_bytes(summary) + b"\n")
            with self.assertRaisesRegex(
                FiveOmissionCegarError, "invalid certificate"
            ):
                exporter.load_authenticated_run(self.repo_root, workdir, 2)

    def test_stale_summary_contract_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            workdir, _record = self._fixture(Path(temporary))
            summary_path = workdir / "summary.json"
            summary = json.loads(summary_path.read_text(encoding="utf-8"))
            summary["formula_contract_sha256"] = "f" * 64
            summary_path.write_bytes(_canonical_json_bytes(summary) + b"\n")
            with self.assertRaisesRegex(FiveOmissionCegarError, "disagrees"):
                exporter.load_authenticated_run(self.repo_root, workdir, 2)

    def test_stale_current_formula_hash_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            workdir, _record = self._fixture(Path(temporary))
            summary_path = workdir / "summary.json"
            summary = json.loads(summary_path.read_text(encoding="utf-8"))
            summary["current_formula_sha256"] = "0" * 64
            summary_path.write_bytes(_canonical_json_bytes(summary) + b"\n")
            with self.assertRaisesRegex(FiveOmissionCegarError, "disagrees"):
                exporter.load_authenticated_run(self.repo_root, workdir, 2)

    def test_self_consistent_fake_tool_manifest_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            workdir, _record = self._fixture(Path(temporary))
            summary_path = workdir / "summary.json"
            summary = json.loads(summary_path.read_text(encoding="utf-8"))
            summary["tool_manifest"] = []
            summary["tool_contract_sha256"] = _sha256_json([])
            summary_path.write_bytes(_canonical_json_bytes(summary) + b"\n")
            with self.assertRaisesRegex(FiveOmissionCegarError, "disagrees"):
                exporter.load_authenticated_run(self.repo_root, workdir, 2)

    def test_wrong_deleted_label_is_rejected_before_export(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            workdir, _record = self._fixture(Path(temporary))
            with self.assertRaisesRegex(FiveOmissionCegarError, "deleted-label"):
                exporter.load_authenticated_run(self.repo_root, workdir, 3)

    def test_contract_literal_is_not_reinterpreted_by_exporter(self) -> None:
        self.assertEqual(
            DETECTOR_CONTRACT,
            "replayed order-independent MetricCoreAlternative certificate",
        )


if __name__ == "__main__":
    unittest.main()
