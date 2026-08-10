from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace

from census.card_head.exact12_v14_structural_cegar import (
    STRUCTURAL_CERTIFICATE_SCHEMA,
)
from census.card_head.source_faithful_five_omission_cegar import (
    _new_instance,
    _sha256_json,
    detect_structural_certificate,
    learned_clause_for_certificate,
)
from census.card_head.source_faithful_five_omission_shared_bank import (
    EXPECTED_RECORD_SCHEMA,
    EXPECTED_RUN_SCHEMA,
    SharedFiveOmissionBankError,
    build_shared_bank_document,
    load_shared_bank,
    write_new_shared_bank,
)
from census.card_head.tests.test_source_faithful_five_omission import SAT_CUBE


class SourceFaithfulFiveOmissionSharedBankTests(unittest.TestCase):
    def _run(self, deleted_label: int, source_index: int = 0) -> SimpleNamespace:
        instance = _new_instance(deleted_label)
        certificate = detect_structural_certificate(SAT_CUBE, n=12)
        assert certificate is not None
        clause = learned_clause_for_certificate(instance, certificate)
        base_formula_sha256 = f"{deleted_label + 37:064x}"
        record = {
            "schema": EXPECTED_RECORD_SCHEMA,
            "index": source_index,
            "base_formula_sha256": base_formula_sha256,
            "formula_contract_sha256": "a" * 64,
            "detector_contract_sha256": "b" * 64,
            "deleted_label": deleted_label,
            "detector_stage": certificate["stage"],
            "certificate_schema": STRUCTURAL_CERTIFICATE_SCHEMA,
            "certificate": certificate,
            "certificate_sha256": _sha256_json(certificate),
            "learned_clause": list(clause),
        }
        record["record_sha256"] = _sha256_json(record)
        return SimpleNamespace(
            deleted_label=deleted_label,
            records=(record,),
            summary={
                "schema": EXPECTED_RUN_SCHEMA,
                "status": "ITERATION_LIMIT",
                "base_formula_sha256": base_formula_sha256,
                "current_formula_sha256": f"{deleted_label + 49:064x}",
                "formula_contract_sha256": "a" * 64,
                "detector_contract_sha256": "b" * 64,
                "tool_contract_sha256": "c" * 64,
            },
            summary_artifact={"sha256": f"{deleted_label + 13:064x}", "bytes": 1},
            journal_artifact={"sha256": f"{deleted_label + 25:064x}", "bytes": 1},
            terminal_record_sha256=record["record_sha256"],
        )

    def _runs(self) -> tuple[SimpleNamespace, ...]:
        return tuple(self._run(label) for label in range(12))

    def _targets(self) -> tuple[object, ...]:
        return tuple(_new_instance(label) for label in range(12))

    def test_cross_shard_duplicate_clause_is_stored_once_and_replayed(self) -> None:
        document = build_shared_bank_document(self._runs(), self._targets())
        self.assertEqual(document["source_run_count"], 12)
        self.assertEqual(document["record_count"], 1)
        self.assertEqual(len(document["records"][0]["occurrences"]), 12)
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "bank.json"
            write_new_shared_bank(path, document)
            banks = tuple(
                load_shared_bank(path, _new_instance(label)) for label in range(12)
            )
        self.assertTrue(all(len(bank.clauses) == 1 for bank in banks))

    def test_document_digest_tampering_is_rejected(self) -> None:
        document = build_shared_bank_document(self._runs(), self._targets())
        document["records"][0]["source_record_index"] = 99
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "bank.json"
            write_new_shared_bank(path, document)
            with self.assertRaisesRegex(
                SharedFiveOmissionBankError, "contract or digest"
            ):
                load_shared_bank(path, _new_instance(2))

    def test_rehashed_invalid_clause_is_rejected_by_exact_replay(self) -> None:
        document = build_shared_bank_document(self._runs(), self._targets())
        document["records"][0]["learned_clause"] = [-1]
        body = dict(document)
        body.pop("document_sha256")
        document["document_sha256"] = _sha256_json(body)
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "bank.json"
            write_new_shared_bank(path, document)
            with self.assertRaisesRegex(
                SharedFiveOmissionBankError, "learned clause failed replay"
            ):
                load_shared_bank(path, _new_instance(2))

    def test_rehashed_bootstrap_clause_digest_tampering_is_rejected(self) -> None:
        document = build_shared_bank_document(self._runs(), self._targets())
        document["bootstrap_clause_list_sha256"] = "0" * 64
        body = dict(document)
        body.pop("document_sha256")
        document["document_sha256"] = _sha256_json(body)
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "bank.json"
            write_new_shared_bank(path, document)
            with self.assertRaisesRegex(
                SharedFiveOmissionBankError, "bootstrap clause-list digest failed"
            ):
                load_shared_bank(path, _new_instance(2))

    def test_unsupported_stage_is_rejected_before_export(self) -> None:
        runs = list(self._runs())
        runs[0].records[0]["detector_stage"] = "ordered-unproved-stage"
        with self.assertRaisesRegex(
            SharedFiveOmissionBankError, "unsupported source detector stage"
        ):
            build_shared_bank_document(tuple(runs), self._targets())

    def test_missing_source_label_is_rejected(self) -> None:
        runs = list(self._runs())
        runs[-1] = self._run(0)
        with self.assertRaisesRegex(
            SharedFiveOmissionBankError, "exactly one source run"
        ):
            build_shared_bank_document(tuple(runs), self._targets())

    def test_contract_drift_is_rejected(self) -> None:
        runs = list(self._runs())
        runs[-1].summary["tool_contract_sha256"] = "d" * 64
        with self.assertRaisesRegex(
            SharedFiveOmissionBankError, "source run contracts disagree"
        ):
            build_shared_bank_document(tuple(runs), self._targets())

    def test_duplicate_target_label_is_rejected(self) -> None:
        targets = list(self._targets())
        targets[-1] = _new_instance(0)
        with self.assertRaisesRegex(SharedFiveOmissionBankError, "exactly one target"):
            build_shared_bank_document(self._runs(), tuple(targets))

    def test_noncanonical_serialization_is_rejected(self) -> None:
        document = build_shared_bank_document(self._runs(), self._targets())
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "bank.json"
            path.write_text(json.dumps(document, indent=2) + "\n")
            with self.assertRaisesRegex(
                SharedFiveOmissionBankError, "not canonically serialized"
            ):
                load_shared_bank(path, _new_instance(0))

    def test_write_is_create_only(self) -> None:
        document = build_shared_bank_document(self._runs(), self._targets())
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "bank.json"
            write_new_shared_bank(path, document)
            with self.assertRaises(FileExistsError):
                write_new_shared_bank(path, document)

    def test_occurrence_outside_source_journal_is_rejected(self) -> None:
        document = build_shared_bank_document(self._runs(), self._targets())
        document["records"][0]["occurrences"][0]["record_index"] = 1
        body = dict(document)
        body.pop("document_sha256")
        document["document_sha256"] = _sha256_json(body)
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "bank.json"
            write_new_shared_bank(path, document)
            with self.assertRaisesRegex(
                SharedFiveOmissionBankError, "exceeds its source journal"
            ):
                load_shared_bank(path, _new_instance(0))


if __name__ == "__main__":
    unittest.main()
