from __future__ import annotations

import json
import tempfile
import unittest
from collections import Counter
from dataclasses import replace
from pathlib import Path
from types import SimpleNamespace

from census.card_head import (
    source_faithful_five_omission_terminal_bank_export as terminal_exporter,
)
from census.card_head.exact12_v14_structural_cegar import (
    STRUCTURAL_CERTIFICATE_SCHEMA,
)
from census.card_head.source_faithful_five_omission_cegar import (
    RECORD_SCHEMA,
    RUN_SCHEMA,
    FiveOmissionCegarError,
    _new_instance,
    detect_structural_certificate,
    learned_clause_for_certificate,
)
from census.card_head.source_faithful_five_omission_lean_export import (
    AuthenticatedFiveOmissionRun,
)
from census.card_head.source_faithful_five_omission_shared_bank import (
    EXPECTED_RECORD_SCHEMA,
    EXPECTED_RUN_SCHEMA,
    build_shared_bank_document,
    load_shared_bank,
    write_new_shared_bank,
)
from census.card_head.source_faithful_five_omission_successor_bank import (
    FiveOmissionSuccessorBankError,
    _canonical_json_bytes,
    _sha256_json,
    build_successor_document,
    load_successor_bank,
    write_new_successor_bank,
)
from census.card_head.tests.test_source_faithful_five_omission import SAT_CUBE

REPO_ROOT = Path(__file__).resolve().parents[3]
ANCHOR_SCRATCH = REPO_ROOT / "scratch" / "rigid221-sourceheavy-anchor"
BOOTSTRAP_BANK = ANCHOR_SCRATCH / (
    "five-omission-v2-hardened-shared-bank-v2-i275-20260810.json"
)
SUCCESSOR_BANK = ANCHOR_SCRATCH / (
    "five-omission-v2-plus-v3-i275-successor-v1-20260810.json"
)


class SourceFaithfulFiveOmissionSuccessorBankTests(unittest.TestCase):
    @staticmethod
    def _bisector_certificate() -> dict[str, object]:
        cube = {
            0: [4, 5, 9, 11],
            1: [7, 8, 9, 11],
            2: [5, 8, 10, 11],
            3: [6, 8, 9, 10],
            4: [6, 7, 10, 11],
            5: [4, 7, 9, 10],
            6: [4, 5, 7, 8],
            7: [3, 4, 6, 11],
            8: [2, 5, 6, 9],
            9: [3, 5, 6, 7],
            10: [0, 1, 6, 8],
            11: [1, 3, 5, 10],
        }
        certificate = detect_structural_certificate(cube, n=12)
        assert certificate is not None
        assert certificate["stage"] == "equality-equilateral-bisector-collision"
        return certificate

    @staticmethod
    def _bootstrap_run(deleted_label: int) -> SimpleNamespace:
        instance = _new_instance(deleted_label)
        certificate = detect_structural_certificate(SAT_CUBE, n=12)
        assert certificate is not None
        clause = learned_clause_for_certificate(instance, certificate)
        base_hash = f"{deleted_label + 37:064x}"
        record = {
            "schema": EXPECTED_RECORD_SCHEMA,
            "index": 0,
            "base_formula_sha256": base_hash,
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
                "base_formula_sha256": base_hash,
                "current_formula_sha256": f"{deleted_label + 49:064x}",
                "formula_contract_sha256": "a" * 64,
                "detector_contract_sha256": "b" * 64,
                "tool_contract_sha256": "c" * 64,
            },
            summary_artifact={"sha256": f"{deleted_label + 13:064x}", "bytes": 1},
            journal_artifact={"sha256": f"{deleted_label + 25:064x}", "bytes": 1},
            terminal_record_sha256=record["record_sha256"],
        )

    @staticmethod
    def _local_run(
        deleted_label: int,
        certificate: dict[str, object],
        *,
        bootstrap_document_sha256: str,
    ) -> AuthenticatedFiveOmissionRun:
        instance = _new_instance(deleted_label)
        clause = learned_clause_for_certificate(instance, certificate)
        record = {
            "schema": RECORD_SCHEMA,
            "index": 0,
            "deleted_label": deleted_label,
            "detector_stage": certificate["stage"],
            "certificate_schema": STRUCTURAL_CERTIFICATE_SCHEMA,
            "certificate": certificate,
            "certificate_sha256": _sha256_json(certificate),
            "learned_clause": list(clause),
        }
        record["record_sha256"] = _sha256_json(record)
        summary = {
            "schema": RUN_SCHEMA,
            "status": "ITERATION_LIMIT",
            "raw_base_formula_sha256": f"{deleted_label + 101:064x}",
            "base_formula_sha256": f"{deleted_label + 113:064x}",
            "current_formula_sha256": f"{deleted_label + 127:064x}",
            "formula_contract_sha256": "d" * 64,
            "detector_contract_sha256": "e" * 64,
            "tool_contract_sha256": "f" * 64,
            "shared_bank": {
                "enabled": True,
                "schema": (
                    "p97_exact12_five_omission_shared_structural_bank.v2"
                ),
                "document_sha256": bootstrap_document_sha256,
            },
        }
        return AuthenticatedFiveOmissionRun(
            workdir=Path(f"deleted-{deleted_label}"),
            deleted_label=deleted_label,
            summary=summary,
            summary_artifact={
                "sha256": f"{deleted_label + 151:064x}",
                "bytes": 10,
            },
            journal_artifact={
                "sha256": f"{deleted_label + 163:064x}",
                "bytes": 20,
            },
            bootstrap_records=(),
            bootstrap_clauses=(),
            records=(record,),
            terminal_record_sha256=record["record_sha256"],
        )

    def _artifacts(
        self, temporary: str, certificate: dict[str, object] | None = None
    ) -> tuple[Path, list[object], tuple[object, ...], tuple[object, ...]]:
        targets = tuple(_new_instance(label) for label in range(12))
        bootstrap_runs = tuple(self._bootstrap_run(label) for label in range(12))
        bootstrap_document = build_shared_bank_document(bootstrap_runs, targets)
        bootstrap_path = Path(temporary) / "bootstrap.json"
        write_new_shared_bank(bootstrap_path, bootstrap_document)
        bootstrap_banks = tuple(
            load_shared_bank(bootstrap_path, target) for target in targets
        )
        local_certificate = certificate or self._bisector_certificate()
        local_runs = tuple(
            self._local_run(
                label,
                local_certificate,
                bootstrap_document_sha256=bootstrap_document["document_sha256"],
            )
            for label in range(12)
        )
        return bootstrap_path, list(bootstrap_banks), local_runs, targets

    def test_layers_are_authenticated_and_union_is_only_derived(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            bootstrap_path, bootstrap_banks, runs, targets = self._artifacts(temporary)
            document = build_successor_document(bootstrap_banks, runs, targets)
            path = Path(temporary) / "successor.json"
            write_new_successor_bank(path, document)
            bank = load_successor_bank(path, bootstrap_path, _new_instance(0))

        self.assertEqual(len(bank.bootstrap.records), 1)
        self.assertEqual(len(bank.local_records), 1)
        self.assertEqual(len(bank.derived_clauses), 2)
        self.assertEqual(
            [item["deleted_label"] for item in bank.local_records[0]["occurrences"]],
            list(range(12)),
        )
        records = terminal_exporter.records_for_successor_terminal_bank(bank)
        source = terminal_exporter.render_successor_terminal_bank(
            bank, 0, records, "Test.SuccessorBank"
        )
        self.assertEqual(records, bank.bootstrap.records + bank.local_records)
        self.assertEqual(
            tuple(tuple(record["learned_clause"]) for record in records),
            bank.derived_clauses,
        )
        self.assertIn("Successor artifact SHA-256", source)
        self.assertIn("ofDuplicateCenter", source)
        self.assertIn("ofEquilateralBisectorCertificate", source)

        with self.assertRaisesRegex(
            FiveOmissionCegarError, "not the canonical bank prefix"
        ):
            terminal_exporter.render_successor_terminal_bank(
                bank, 0, tuple(reversed(records)), "Test.SuccessorBank"
            )

    def test_forged_source_record_hash_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            _path, bootstrap_banks, runs, targets = self._artifacts(temporary)
            forged = dict(runs[0].records[0])
            forged["record_sha256"] = "0" * 64
            forged_runs = (replace(runs[0], records=(forged,)),) + runs[1:]
            with self.assertRaisesRegex(
                FiveOmissionSuccessorBankError,
                "local record certificate or custody failed",
            ):
                build_successor_document(bootstrap_banks, forged_runs, targets)

    def test_retained_716_cut_successor_regression(self) -> None:
        bank = load_successor_bank(SUCCESSOR_BANK, BOOTSTRAP_BANK, _new_instance(0))
        records = terminal_exporter.records_for_successor_terminal_bank(bank)

        self.assertEqual(len(bank.bootstrap.records), 441)
        self.assertEqual(len(bank.local_records), 275)
        self.assertEqual(len(records), 716)
        self.assertEqual(
            Counter(record["detector_stage"] for record in records),
            {
                "equality-duplicate-center": 696,
                "equality-equilateral-bisector-collision": 18,
                "equality-equal-k4": 2,
            },
        )
        source = terminal_exporter.render_successor_terminal_bank(
            bank, 0, records, "Test.RetainedSuccessorBank"
        )
        self.assertIn("def cut715", source)

    def test_local_clause_overlap_with_bootstrap_is_rejected(self) -> None:
        certificate = detect_structural_certificate(SAT_CUBE, n=12)
        assert certificate is not None
        with tempfile.TemporaryDirectory() as temporary:
            _path, bootstrap_banks, runs, targets = self._artifacts(
                temporary, certificate
            )
            with self.assertRaisesRegex(
                FiveOmissionSuccessorBankError, "overlaps the frozen bootstrap"
            ):
                build_successor_document(bootstrap_banks, runs, targets)

    def test_rehashed_local_clause_tampering_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            bootstrap_path, bootstrap_banks, runs, targets = self._artifacts(temporary)
            document = build_successor_document(bootstrap_banks, runs, targets)
            document["local_records"][0]["learned_clause"][0] *= -1
            document["local_records"][0]["learned_clause_sha256"] = _sha256_json(
                document["local_records"][0]["learned_clause"]
            )
            document["local_clause_list_sha256"] = _sha256_json(
                [record["learned_clause"] for record in document["local_records"]]
            )
            derived = [list(clause) for clause in bootstrap_banks[0].clauses]
            derived.extend(
                record["learned_clause"] for record in document["local_records"]
            )
            document["derived_clause_list_sha256"] = _sha256_json(derived)
            body = dict(document)
            body.pop("document_sha256")
            document["document_sha256"] = _sha256_json(body)
            path = Path(temporary) / "successor.json"
            path.write_bytes(_canonical_json_bytes(document) + b"\n")
            with self.assertRaisesRegex(
                FiveOmissionSuccessorBankError, "local learned clause failed replay"
            ):
                load_successor_bank(path, bootstrap_path, _new_instance(0))

    def test_noncanonical_serialization_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            bootstrap_path, bootstrap_banks, runs, targets = self._artifacts(temporary)
            document = build_successor_document(bootstrap_banks, runs, targets)
            path = Path(temporary) / "successor.json"
            path.write_text(json.dumps(document, indent=2) + "\n")
            with self.assertRaisesRegex(
                FiveOmissionSuccessorBankError, "not canonically serialized"
            ):
                load_successor_bank(path, bootstrap_path, _new_instance(0))


if __name__ == "__main__":
    unittest.main()
