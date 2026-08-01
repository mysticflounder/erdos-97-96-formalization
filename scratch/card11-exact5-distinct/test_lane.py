#!/usr/bin/env python3
"""End-to-end tests for the encode-only lane."""

from __future__ import annotations

import hashlib
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

from verify_exact5_distinct import ARMS, verify


HERE = Path(__file__).resolve().parent


class LaneTests(unittest.TestCase):
    def test_both_arms_and_mutation_rejection(self) -> None:
        hashes: list[str] = []
        with tempfile.TemporaryDirectory(dir=HERE) as directory:
            out = Path(directory)
            for index, arm in enumerate(ARMS):
                cnf = out / f"arm-{index}.cnf"
                result = out / f"arm-{index}.json"
                subprocess.run([
                    sys.executable, str(HERE / "encode_exact5_distinct.py"),
                    "--arm", arm, "--cnf", str(cnf), "--result", str(result),
                ], check=True, capture_output=True, text=True)
                report = verify(cnf, result)
                self.assertEqual(report["status"], "VERIFIED_ENCODE_ONLY")
                self.assertEqual((report["variables"], report["clauses"]), (935, 55200))
                hashes.append(report["cnf_sha256"])

            self.assertNotEqual(hashes[0], hashes[1])
            bad_cnf = out / "mutated.cnf"
            lines = (out / "arm-0.cnf").read_text(encoding="ascii").splitlines()
            clause_index = next(i for i, line in enumerate(lines)
                                if line and line[0] not in {"c", "p"})
            literals = lines[clause_index].split()
            literals[0] = str(-int(literals[0]))
            lines[clause_index] = " ".join(literals)
            bad_cnf.write_text("\n".join(lines) + "\n", encoding="ascii")
            bad_result = out / "mutated.json"
            payload = json.loads((out / "arm-0.json").read_text(encoding="utf-8"))
            payload["cnf_sha256"] = hashlib.sha256(bad_cnf.read_bytes()).hexdigest()
            bad_result.write_text(json.dumps(payload), encoding="utf-8")
            with self.assertRaisesRegex(ValueError, "clause_multiset"):
                verify(bad_cnf, bad_result)


if __name__ == "__main__":
    unittest.main()
