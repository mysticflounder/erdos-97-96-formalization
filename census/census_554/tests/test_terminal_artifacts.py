from __future__ import annotations

import json
import subprocess
import tempfile
import unittest
from pathlib import Path

from census.census_554.io_protocol import row_sha256
from census.census_554.terminal_artifacts import (
    TerminalArtifactError,
    publish_unsat_artifacts,
)


def _validate(row, cert):
    assert cert["pid"] == row["pid"]
    assert cert["proof"] == "checked"


class FakeRunner:
    def __init__(self, verify=True):
        self.verify = verify

    def __call__(self, command, **_kwargs):
        if command[0] == "cadical":
            Path(command[3]).write_text("proof\n", encoding="ascii")
            return subprocess.CompletedProcess(
                command, 20, "s UNSATISFIABLE\n", ""
            )
        if self.verify:
            cnf_path = Path(command[1])
            core_path = Path(command[command.index("-c") + 1])
            lrat_path = Path(command[command.index("-L") + 1])
            core_path.write_bytes(cnf_path.read_bytes())
            lrat_path.write_text("1 0 0\n", encoding="ascii")
            return subprocess.CompletedProcess(command, 0, "s VERIFIED\n", "")
        return subprocess.CompletedProcess(command, 1, "s NOT VERIFIED\n", "")


def _fixture(root: Path):
    certs = root / "certs"
    certs.mkdir()
    row = {
        "pid": "pat_00000",
        "pattern": {"0": [1, 2]},
        "kill": "base",
        "n_orbit": 1,
        "k": 3,
        "iter": -1,
        "cert": "certs/pat_00000.json",
    }
    cert = {
        "pid": "pat_00000",
        "pattern": row["pattern"],
        "kill": "base",
        "proof": "checked",
    }
    root.joinpath("bank.jsonl").write_text(json.dumps(row) + "\n", encoding="utf-8")
    certs.joinpath("pat_00000.json").write_text(json.dumps(cert), encoding="utf-8")
    instance = {
        "source_pid": row["pid"],
        "source_row_sha256": row_sha256(row),
        "canonical_motif": [[0, [1, 2]]],
        "support_injection": [[0, 0], [1, 1], [2, 2]],
        "pattern": [[0, [1, 2]]],
        "clause": [-1],
    }
    return instance


class TerminalArtifactTests(unittest.TestCase):
    def test_verified_proof_publishes_marker_last(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            instance = _fixture(root)
            marker = publish_unsat_artifacts(
                root,
                dimacs="p cnf 1 2\n1 0\n-1 0\n",
                instances=[instance],
                run_metadata={"command": "test"},
                certificate_validator=_validate,
                hash_certificates=True,
                command_runner=FakeRunner(),
            )
            marker_path = root / "COVERAGE_COMPLETE.json"
            self.assertTrue(marker_path.is_file())
            self.assertEqual(json.loads(marker_path.read_text()), marker)
            self.assertTrue((root / marker["metadata"]).is_file())

    def test_failed_checker_cannot_publish_marker(self):
        with tempfile.TemporaryDirectory() as root_string:
            root = Path(root_string)
            instance = _fixture(root)
            with self.assertRaisesRegex(TerminalArtifactError, "did not verify"):
                publish_unsat_artifacts(
                    root,
                    dimacs="p cnf 1 2\n1 0\n-1 0\n",
                    instances=[instance],
                    run_metadata={"command": "test"},
                    certificate_validator=_validate,
                    command_runner=FakeRunner(verify=False),
                )
            self.assertFalse(root.joinpath("COVERAGE_COMPLETE.json").exists())
            generation_dir = root / "coverage_terminal/generations"
            self.assertEqual(list(generation_dir.iterdir()), [])


if __name__ == "__main__":
    unittest.main()
