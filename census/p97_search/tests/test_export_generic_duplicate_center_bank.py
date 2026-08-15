from __future__ import annotations

import json
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest import TestCase, mock

from census.p97_search import export_generic_duplicate_center_bank as exporter


def _certificate(extra_unused_point: int) -> dict[str, object]:
    return {
        "rows": [
            {"center": 4, "support": [0, 1, extra_unused_point]},
            {"center": 7, "support": [2, 3]},
        ],
        "closure_paths": [
            {
                "steps": [
                    {"kind": "row", "center": 4, "first": 0, "second": 1},
                    {"kind": "flip", "first": 4, "second": 1},
                    {"kind": "row", "center": 7, "first": 2, "second": 3},
                ]
            }
        ],
    }


class ExportGenericDuplicateCenterBankTests(TestCase):
    def test_membership_rows_keep_only_traversed_positive_facts(self) -> None:
        self.assertEqual(
            exporter._membership_rows(_certificate(9)),
            [
                {"center": 4, "support": [0, 1]},
                {"center": 7, "support": [2, 3]},
            ],
        )

    def test_membership_mode_deduplicates_first_representative(self) -> None:
        records = [
            {
                "stage": exporter.STAGE,
                "iteration": iteration,
                "certificate": _certificate(unused),
            }
            for iteration, unused in ((10, 9), (11, 8))
        ]
        with TemporaryDirectory() as directory:
            journal = Path(directory) / "journal.jsonl"
            journal.write_text(
                "".join(json.dumps(record) + "\n" for record in records),
                encoding="utf-8",
            )
            selected = exporter._read_records(
                journal, None, membership_core=True
            )
        self.assertEqual([record["iteration"] for record in selected], [10])

    def test_membership_render_omits_exact_four_side_condition(self) -> None:
        with TemporaryDirectory() as directory:
            journal = Path(directory) / "journal.jsonl"
            journal.write_text("stable journal\n", encoding="utf-8")
            with mock.patch.object(exporter, "_record_lean", return_value="def record0 := 0"):
                rendered = exporter._render(
                    journal,
                    [{}],
                    "MembershipPilot",
                    1,
                    membership_core=True,
                )
        self.assertIn("distinct membership cores: 1", rendered)
        self.assertNotIn("bankFourSupportedCheck", rendered)
        self.assertNotIn("bank_fourSupported", rendered)

    def test_module_shards_validate_locally_and_coordinator_combines(self) -> None:
        records = [{}, {}, {}]
        with TemporaryDirectory() as directory:
            journal = Path(directory) / "journal.jsonl"
            journal.write_text("stable journal\n", encoding="utf-8")
            with mock.patch.object(exporter, "_record_lean", return_value="def r := 0"):
                coordinator, shards = exporter._render_module_shards(
                    journal,
                    records,
                    "MembershipBank",
                    "Pkg.MembershipBankShards",
                    2,
                    journal_digest="0" * 64,
                )
        self.assertEqual(len(shards), 2)
        self.assertTrue(all("theorem bankCheck_true" in source for _, _, source in shards))
        self.assertIn("import Pkg.MembershipBankShards.Part_001", coordinator)
        self.assertIn("import Pkg.MembershipBankShards.Part_002", coordinator)
        self.assertIn("List.mem_append", coordinator)
        self.assertNotIn("native_decide", coordinator)

    def test_manifest_authenticates_each_generated_module(self) -> None:
        records = [{}, {}, {}]
        shards = [
            ("Pkg.Shards.Part_001", "BankShards.Part_001", "first\n"),
            ("Pkg.Shards.Part_002", "BankShards.Part_002", "second\n"),
        ]
        manifest = exporter._manifest_document(
            journal=Path("journal.jsonl"),
            journal_digest="a" * 64,
            journal_size=123,
            out=Path("Bank.lean"),
            coordinator="coordinator\n",
            records=records,
            namespace="Bank",
            module_prefix="Pkg.Shards",
            records_per_module=2,
            shards=shards,
        )
        self.assertEqual(manifest["distinct_core_count"], 3)
        self.assertEqual(
            [entry["record_count"] for entry in manifest["shards"]],
            [2, 1],
        )
        self.assertEqual(
            manifest["shards"][0]["sha256"],
            exporter._sha256_text("first\n"),
        )
        self.assertIn("not a coverage", manifest["scope"])
