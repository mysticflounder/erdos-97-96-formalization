from __future__ import annotations

import copy
import json
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory

from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.card_head.exact12_v14_ordered_coverage import FROZEN_V8_CUBE
from census.card_head.exact12_v14_ordered_cut_adapter import (
    SOURCE_ORDER_CERTIFICATE_KIND,
    detect_proof_backed_source_order_cut,
)
from census.card_head.exact12_v14_structural_cegar import (
    LEGACY_RECORD_SCHEMA,
    RECORD_SCHEMA,
    STRUCTURAL_CERTIFICATE_KIND,
    Exact12V14StructuralCegarError,
    _make_record,
    _sha256_json,
    detect_admitted_cut,
    detect_structural_certificate,
    learned_clause_for_certificate,
    replay_journal,
    validate_structural_certificate,
)

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
JOB_SHA256 = "a" * 64
DETECTOR_CONTRACT_SHA256 = "d" * 64
REPO_ROOT = Path(__file__).resolve().parents[3]


class Exact12V14StructuralCegarTest(unittest.TestCase):
    def setUp(self) -> None:
        # This is the frozen SAT witness from cell 0, but all checks below
        # rebuild the bound instance without invoking a solver.
        self.materialized = materialize_cell(0)

    def _certificate(self) -> dict[str, object]:
        certificate = detect_structural_certificate(CELL0_CUBE)
        self.assertIsNotNone(certificate)
        assert certificate is not None
        return certificate

    def _record(self) -> dict[str, object]:
        admitted_cut = detect_admitted_cut(
            REPO_ROOT, self.materialized.instance, CELL0_CUBE
        )
        self.assertIsNotNone(admitted_cut)
        assert admitted_cut is not None
        selected = frozenset(
            self.materialized.instance.choice_variables[
                (center, self.materialized.instance.candidate_index(center, CELL0_CUBE[center]))
            ]
            for center in range(12)
        )
        return _make_record(
            index=0,
            parent_sha256=JOB_SHA256,
            job_sha256=JOB_SHA256,
            detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
            cell_index=0,
            admitted_cut=admitted_cut,
            cube=CELL0_CUBE,
            positive_variables=selected,
        )

    @staticmethod
    def _write_journal(path: Path, record: dict[str, object]) -> None:
        path.write_text(
            json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n",
            encoding="utf-8",
        )

    @staticmethod
    def _write_records(path: Path, records: list[dict[str, object]]) -> None:
        path.write_text(
            "".join(
                json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n"
                for record in records
            ),
            encoding="utf-8",
        )

    def test_cell0_detects_valid_equality_duplicate_center_certificate(self) -> None:
        certificate = self._certificate()

        self.assertTrue(
            self.materialized.instance.cube_validator(
                self.materialized.instance.model, CELL0_CUBE
            )
        )
        self.assertEqual(certificate["stage"], "equality-duplicate-center")
        self.assertEqual(certificate["core"], {"triple": [0, 1, 4], "centers": [2, 3]})
        self.assertTrue(validate_structural_certificate(certificate))

    def test_learned_clause_matches_bound_choices_and_is_falsified(self) -> None:
        certificate = self._certificate()
        instance = self.materialized.instance
        clause = learned_clause_for_certificate(instance, certificate)
        expected = tuple(
            -instance.choice_variables[
                (row["center"], instance.candidate_index(row["center"], row["support"]))
            ]
            for row in certificate["rows"]
        )
        selected = frozenset(
            instance.choice_variables[(center, instance.candidate_index(center, CELL0_CUBE[center]))]
            for center in range(12)
        )

        self.assertEqual(clause, expected)
        self.assertEqual(clause, (-6, -55, -155, -175, -525))
        self.assertTrue(all(-literal in selected for literal in clause))

    def test_authenticated_journal_replay_and_tampering_rejection(self) -> None:
        record = self._record()
        self.assertEqual(record["schema"], RECORD_SCHEMA)
        self.assertEqual(record["certificate_kind"], STRUCTURAL_CERTIFICATE_KIND)

        with TemporaryDirectory() as temporary:
            journal = Path(temporary) / "journal.jsonl"
            self._write_journal(journal, record)
            count, parent, clauses = replay_journal(
                REPO_ROOT,
                self.materialized.instance,
                journal,
                job_sha256=JOB_SHA256,
                detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
                cell_index=0,
            )
            self.assertEqual((count, parent), (1, record["record_sha256"]))
            self.assertEqual(clauses, frozenset({tuple(record["learned_clause"])}))

            certificate_tampered = copy.deepcopy(record)
            certificate_tampered["certificate"]["core"]["triple"][0] = 9
            body = dict(certificate_tampered)
            body.pop("record_sha256")
            certificate_tampered["record_sha256"] = _sha256_json(body)
            certificate_journal = Path(temporary) / "certificate-tampered.jsonl"
            self._write_journal(certificate_journal, certificate_tampered)
            with self.assertRaisesRegex(
                Exact12V14StructuralCegarError, "certificate hash"
            ):
                replay_journal(
                    REPO_ROOT,
                    materialize_cell(0).instance,
                    certificate_journal,
                    job_sha256=JOB_SHA256,
                    detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
                    cell_index=0,
                )

    def test_mixed_tagged_journal_and_legacy_rejection(self) -> None:
        instance = materialize_cell(0).instance
        record = self._record()
        ordered = detect_proof_backed_source_order_cut(
            REPO_ROOT, instance, FROZEN_V8_CUBE
        )
        structural = detect_admitted_cut(REPO_ROOT, instance, CELL0_CUBE)
        assert ordered is not None
        assert structural is not None
        self.assertEqual(ordered.certificate_kind, SOURCE_ORDER_CERTIFICATE_KIND)
        self.assertEqual(structural.certificate_kind, STRUCTURAL_CERTIFICATE_KIND)

        ordered_selected = frozenset(
            instance.choice_variables[
                (
                    center,
                    instance.candidate_index(center, FROZEN_V8_CUBE[str(center)]),
                )
            ]
            for center in range(12)
        )
        structural_selected = frozenset(
            instance.choice_variables[
                (center, instance.candidate_index(center, CELL0_CUBE[center]))
            ]
            for center in range(12)
        )
        first = _make_record(
            index=0,
            parent_sha256=JOB_SHA256,
            job_sha256=JOB_SHA256,
            detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
            cell_index=0,
            admitted_cut=ordered,
            cube=FROZEN_V8_CUBE,
            positive_variables=ordered_selected,
        )
        second = _make_record(
            index=1,
            parent_sha256=first["record_sha256"],
            job_sha256=JOB_SHA256,
            detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
            cell_index=0,
            admitted_cut=structural,
            cube=CELL0_CUBE,
            positive_variables=structural_selected,
        )

        with TemporaryDirectory() as temporary:
            journal = Path(temporary) / "mixed.jsonl"
            self._write_records(journal, [first, second])
            count, parent, clauses = replay_journal(
                REPO_ROOT,
                materialize_cell(0).instance,
                journal,
                job_sha256=JOB_SHA256,
                detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
                cell_index=0,
            )
            self.assertEqual((count, parent), (2, second["record_sha256"]))
            self.assertEqual(
                clauses,
                frozenset({ordered.learned_clause, structural.learned_clause}),
            )

            legacy = copy.deepcopy(first)
            legacy["schema"] = LEGACY_RECORD_SCHEMA
            legacy_path = Path(temporary) / "legacy.jsonl"
            self._write_journal(legacy_path, legacy)
            with self.assertRaisesRegex(
                Exact12V14StructuralCegarError, "explicit migration"
            ):
                replay_journal(
                    REPO_ROOT,
                    materialize_cell(0).instance,
                    legacy_path,
                    job_sha256=JOB_SHA256,
                    detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
                    cell_index=0,
                )

            laundered = copy.deepcopy(second)
            laundered["certificate_kind"] = SOURCE_ORDER_CERTIFICATE_KIND
            body = dict(laundered)
            body.pop("record_sha256")
            laundered["record_sha256"] = _sha256_json(body)
            laundered_path = Path(temporary) / "laundered.jsonl"
            self._write_records(laundered_path, [first, laundered])
            replay_instance = materialize_cell(0).instance
            clauses_before = len(replay_instance.cnf.clauses)
            with self.assertRaisesRegex(
                Exact12V14StructuralCegarError,
                "no proof-backed source-order cut",
            ):
                replay_journal(
                    REPO_ROOT,
                    replay_instance,
                    laundered_path,
                    job_sha256=JOB_SHA256,
                    detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
                    cell_index=0,
                )
            self.assertEqual(len(replay_instance.cnf.clauses), clauses_before)

            chain_tampered = copy.deepcopy(record)
            chain_tampered["parent_sha256"] = "b" * 64
            body = dict(chain_tampered)
            body.pop("record_sha256")
            chain_tampered["record_sha256"] = _sha256_json(body)
            chain_journal = Path(temporary) / "chain-tampered.jsonl"
            self._write_journal(chain_journal, chain_tampered)
            with self.assertRaisesRegex(
                Exact12V14StructuralCegarError, "chain authentication"
            ):
                replay_journal(
                    REPO_ROOT,
                    materialize_cell(0).instance,
                    chain_journal,
                    job_sha256=JOB_SHA256,
                    detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
                    cell_index=0,
                )

            cube_tampered = copy.deepcopy(record)
            cube_tampered["cube"]["0"][0] = 2
            body = dict(cube_tampered)
            body.pop("record_sha256")
            cube_tampered["record_sha256"] = _sha256_json(body)
            cube_journal = Path(temporary) / "cube-tampered.jsonl"
            self._write_journal(cube_journal, cube_tampered)
            with self.assertRaisesRegex(
                Exact12V14StructuralCegarError, "cube hash"
            ):
                replay_journal(
                    REPO_ROOT,
                    materialize_cell(0).instance,
                    cube_journal,
                    job_sha256=JOB_SHA256,
                    detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
                    cell_index=0,
                )

            assignment_tampered = copy.deepcopy(record)
            assignment_tampered["positive_variables"].append(1)
            assignment_tampered["positive_variables"].sort()
            body = dict(assignment_tampered)
            body.pop("record_sha256")
            assignment_tampered["record_sha256"] = _sha256_json(body)
            assignment_journal = Path(temporary) / "assignment-tampered.jsonl"
            self._write_journal(assignment_journal, assignment_tampered)
            with self.assertRaisesRegex(
                Exact12V14StructuralCegarError, "assignment hash"
            ):
                replay_journal(
                    REPO_ROOT,
                    materialize_cell(0).instance,
                    assignment_journal,
                    job_sha256=JOB_SHA256,
                    detector_contract_sha256=DETECTOR_CONTRACT_SHA256,
                    cell_index=0,
                )

    def test_malformed_cube_and_certificate_are_rejected(self) -> None:
        missing_center = dict(CELL0_CUBE)
        del missing_center[11]
        with self.assertRaisesRegex(Exact12V14StructuralCegarError, "every center"):
            detect_structural_certificate(missing_center)

        malformed = copy.deepcopy(self._certificate())
        malformed["rows"][0]["support"].append(1)
        self.assertFalse(validate_structural_certificate(malformed))
        with self.assertRaisesRegex(Exact12V14StructuralCegarError, "invalid certificate"):
            learned_clause_for_certificate(self.materialized.instance, malformed)

        self.assertFalse(validate_structural_certificate({}))


if __name__ == "__main__":
    unittest.main()
