from __future__ import annotations

import json
import shutil
import tempfile
import unittest
from pathlib import Path

from verify_results import VerificationError, verify_results

ROOT = Path(__file__).resolve().parent


class VerifyResultsTests(unittest.TestCase):
    def test_committed_fixture_verifies(self) -> None:
        verify_results(ROOT)

    def test_status_tampering_fails_closed(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            copy = Path(directory) / ROOT.name
            shutil.copytree(ROOT, copy)
            path = copy / "results.json"
            results = json.loads(path.read_text())
            results["queries"][0]["cvc5_pinned"]["status"] = "UNKNOWN"
            path.write_text(json.dumps(results))
            with self.assertRaises(VerificationError):
                verify_results(copy)

    def test_contract_tampering_fails_closed(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            copy = Path(directory) / ROOT.name
            shutil.copytree(ROOT, copy)
            path = copy / "results.json"
            results = json.loads(path.read_text())
            results["contract"]["not_encoded"].pop()
            path.write_text(json.dumps(results))
            with self.assertRaises(VerificationError):
                verify_results(copy)

    def test_check_sat_tampering_fails_closed(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            copy = Path(directory) / ROOT.name
            shutil.copytree(ROOT, copy)
            path = copy / "artifacts" / "control_radial_collision.smt2"
            path.write_text(path.read_text().replace("(check-sat)", "", 1))
            with self.assertRaises(VerificationError):
                verify_results(copy)


if __name__ == "__main__":
    unittest.main()
