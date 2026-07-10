from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from census.census_554.bank_audit import audit_bank


class BankAuditTests(unittest.TestCase):
    def test_identical_duplicate_is_normalized_but_orphan_fails(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            (root / "certs").mkdir()
            row = {
                "pid": "pat_00003",
                "pattern": {"0": [1, 2]},
                "cert": "certs/pat_00003.json",
            }
            (root / "bank.jsonl").write_text(
                json.dumps(row) + "\n" + json.dumps(row) + "\n",
                encoding="utf-8",
            )
            (root / row["cert"]).write_text("{}", encoding="utf-8")
            (root / "certs/pat_00004.json").write_text("{}", encoding="utf-8")
            report = audit_bank(root)
            self.assertEqual(report["bank"]["raw_rows"], 2)
            self.assertEqual(report["bank"]["normalized_rows"], 1)
            self.assertTrue(
                report["duplicates"]["ids"]["pat_00003"]["content_identical"]
            )
            self.assertTrue(
                report["duplicates"]["ids"]["pat_00003"]["proof_identical"]
            )
            self.assertEqual(
                report["certificates"]["orphans"], ["certs/pat_00004.json"]
            )
            self.assertEqual(report["status"], "FAIL")

    def test_clean_structural_fixture_passes(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            (root / "certs").mkdir()
            row = {
                "pid": "pat_00000",
                "pattern": {"0": [1, 2]},
                "cert": "certs/pat_00000.json",
            }
            (root / "bank.jsonl").write_text(json.dumps(row) + "\n")
            (root / row["cert"]).write_text("{}", encoding="utf-8")
            self.assertEqual(audit_bank(root)["status"], "STRUCTURAL_PASS")


if __name__ == "__main__":
    unittest.main()
