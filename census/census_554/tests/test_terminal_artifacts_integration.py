from __future__ import annotations

import json
import shutil
import tempfile
import unittest
from pathlib import Path

from census.census_554.io_protocol import row_sha256
from census.census_554.terminal_artifacts import publish_unsat_artifacts
from census.census_554.verify_completion import verify_completion


@unittest.skipUnless(
    shutil.which("cadical") and shutil.which("drat-trim"),
    "CaDiCaL and drat-trim are required for this integration gate",
)
class RealProofToolTests(unittest.TestCase):
    def test_tiny_unsat_proof_core_and_lrat_are_published(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            (root / "certs").mkdir()
            bank_row = {
                "pid": "pat_00000",
                "pattern": {"0": [1, 2]},
                "kill": "base",
                "cert": "certs/pat_00000.json",
            }
            certificate = {
                "pid": bank_row["pid"],
                "pattern": bank_row["pattern"],
                "kill": bank_row["kill"],
                "proof": "checked fixture",
            }
            (root / "bank.jsonl").write_text(
                json.dumps(bank_row) + "\n", encoding="utf-8"
            )
            (root / bank_row["cert"]).write_text(
                json.dumps(certificate), encoding="utf-8"
            )
            instance = {
                "source_pid": bank_row["pid"],
                "source_row_sha256": row_sha256(bank_row),
                "canonical_motif": [[0, [1, 2]]],
                "support_injection": [[0, 0], [1, 1], [2, 2]],
                "pattern": [[0, [1, 2]]],
                "clause": [-1],
            }

            def validate(row, cert):
                self.assertEqual(cert["pid"], row["pid"])

            marker = publish_unsat_artifacts(
                root,
                dimacs="p cnf 1 2\n1 0\n-1 0\n",
                instances=[instance],
                run_metadata={"command": "integration-test"},
                certificate_validator=validate,
                hash_certificates=True,
            )
            metadata = json.loads((root / marker["metadata"]).read_text())
            generation_dir = (root / marker["metadata"]).parent
            self.assertTrue(
                generation_dir.joinpath(metadata["artifacts"]["core"]["path"]).is_file()
            )
            self.assertTrue(
                generation_dir.joinpath(metadata["artifacts"]["lrat"]["path"]).is_file()
            )
            self.assertEqual(metadata["artifacts"]["instances"]["core_rows"], 1)
            verified = verify_completion(root)
            self.assertEqual(verified["generation"], marker["generation"])


if __name__ == "__main__":
    unittest.main()
