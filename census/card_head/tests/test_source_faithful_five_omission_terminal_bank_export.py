from __future__ import annotations

import unittest
from pathlib import Path

from census.card_head import (
    source_faithful_five_omission_terminal_bank_export as exporter,
)
from census.card_head.source_faithful_five_omission_cegar import (
    FiveOmissionCegarError,
    _new_instance,
    detect_structural_certificate,
    learned_clause_for_certificate,
)
from census.card_head.source_faithful_five_omission_lean_export import (
    AuthenticatedFiveOmissionRun,
)
from census.card_head.tests.test_source_faithful_five_omission import SAT_CUBE


class SourceFaithfulFiveOmissionTerminalBankExportTests(unittest.TestCase):
    @staticmethod
    def _record(
        *, index: int, certificate: dict[str, object], deleted_label: int = 0
    ) -> dict[str, object]:
        instance = _new_instance(deleted_label)
        return {
            "index": index,
            "detector_stage": certificate["stage"],
            "certificate": certificate,
            "learned_clause": list(
                learned_clause_for_certificate(instance, certificate)
            ),
        }

    @staticmethod
    def _run(
        records: list[dict[str, object]],
        *,
        bootstrap_records: list[dict[str, object]] | None = None,
    ) -> AuthenticatedFiveOmissionRun:
        return AuthenticatedFiveOmissionRun(
            workdir=Path("authenticated-run"),
            deleted_label=0,
            summary={
                "formula_contract_sha256": "1" * 64,
                "detector_contract_sha256": "2" * 64,
                "shared_bank": {
                    "enabled": bootstrap_records is not None,
                    "document_sha256": "6" * 64
                    if bootstrap_records is not None
                    else None,
                    "bootstrap_clause_list_sha256": "7" * 64
                    if bootstrap_records is not None
                    else None,
                },
            },
            summary_artifact={"sha256": "3" * 64},
            journal_artifact={"sha256": "4" * 64, "bytes": 123},
            bootstrap_records=tuple(bootstrap_records or ()),
            bootstrap_clauses=(),
            records=tuple(records),
            terminal_record_sha256="5" * 64,
        )

    @staticmethod
    def _duplicate_certificate() -> dict[str, object]:
        certificate = detect_structural_certificate(SAT_CUBE, n=12)
        assert certificate is not None
        assert certificate["stage"] == exporter.DUPLICATE_STAGE
        return certificate

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
        assert certificate["stage"] == exporter.BISECTOR_STAGE
        return certificate

    def test_mixed_supported_bank_renders_both_typed_constructors(self) -> None:
        records = [
            self._record(index=0, certificate=self._duplicate_certificate()),
            self._record(index=1, certificate=self._bisector_certificate()),
        ]
        run = self._run(records)

        selected = exporter.records_for_terminal_bank(run)
        source = exporter.render_terminal_bank(run, selected, "Test.MixedBank")

        self.assertIn("ofDuplicateCenter", source)
        self.assertIn("ofEquilateralBisectorCertificate", source)
        self.assertIn("def bank : List SourceOrderPositiveNogood := [cut0, cut1]", source)
        self.assertIn("theorem cut0_learnedClause_eq", source)
        self.assertIn("theorem cut1_learnedClause_eq", source)
        self.assertIn("theorem bank_encodable", source)
        self.assertNotIn("Journal iteration None", source)
        self.assertTrue(source.startswith("import "))
        self.assertIn("\n/-!\nGenerated from ", source)

    def test_unsupported_stage_fails_closed(self) -> None:
        certificate = self._duplicate_certificate()
        record = self._record(index=0, certificate=certificate)
        record["detector_stage"] = "unsupported-stage"
        run = self._run([record])

        with self.assertRaisesRegex(FiveOmissionCegarError, "unsupported"):
            exporter.records_for_terminal_bank(run)

    def test_bootstrap_precedes_local_records_and_limit_is_combined(self) -> None:
        bootstrap = self._record(index=9, certificate=self._duplicate_certificate())
        local = self._record(index=0, certificate=self._bisector_certificate())
        run = self._run([local], bootstrap_records=[bootstrap])

        selected = exporter.records_for_terminal_bank(run)
        self.assertEqual(selected, (bootstrap, local))
        self.assertEqual(exporter.records_for_terminal_bank(run, 1), (bootstrap,))

    def test_learned_clause_mismatch_is_rejected(self) -> None:
        record = self._record(
            index=0, certificate=self._bisector_certificate()
        )
        record["learned_clause"] = [-1]
        run = self._run([record])

        with self.assertRaisesRegex(FiveOmissionCegarError, "differs"):
            exporter.render_terminal_bank(run, tuple(run.records), "Test.BadClause")

    def test_partial_source_row_is_rejected(self) -> None:
        certificate = self._bisector_certificate()
        certificate["rows"][0]["support"] = certificate["rows"][0]["support"][:3]
        record = {
            "index": 0,
            "detector_stage": exporter.BISECTOR_STAGE,
            "certificate": certificate,
            "learned_clause": [],
        }
        run = self._run([record])

        with self.assertRaises(FiveOmissionCegarError):
            exporter.render_terminal_bank(run, tuple(run.records), "Test.PartialRow")


if __name__ == "__main__":
    unittest.main()
