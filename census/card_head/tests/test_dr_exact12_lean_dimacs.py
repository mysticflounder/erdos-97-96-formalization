"""The Lean mirror ``DRExactTwelveDimacs.clauses`` reproduces the encoder's DIMACS.

Plan item P3.4a (``docs/plans/2026-09-01-dr-two-radius-branch-closure.md``).
The Lean module
``lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/DRExactTwelveDimacs.lean``
is evaluated through ``lake env lean --run`` on a scratch driver that streams
the clause list in DIMACS form; the result is compared line by line with
``dr_exact12_structural.build("none", families=(...))`` and by sha256 with
the wave-5 manifest ``cnf-manifest-core2-none.json``.

Slow test (the Lean interpreter generates 254,412 clauses).  The whole module
is skipped when ``lake`` or the module's build products are absent, so the
ordinary suite does not depend on a Lean build.
"""

from __future__ import annotations

import hashlib
import json
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

from census.card_head.dr_exact12_structural import build

ROOT = Path(__file__).resolve().parents[3]
LEAN_ROOT = ROOT / "lean"
MODULE = "Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactTwelveDimacs"
OLEAN = (LEAN_ROOT / ".lake" / "build" / "lib" / "lean" / Path(*MODULE.split("."))).with_suffix(".olean")
FAMILIES = ("two_circle_same_arc", "five_point_circle_isosceles_order")
MANIFEST = ROOT / "scratch" / "runs" / "dr-two-radius-20260901" / "q1b-wave-5" / "artifacts" / "cnf-manifest-core2-none.json"
MANIFEST_SHA256_FIELD = "cnf_sha256"
# ``cnf-manifest-core2-none.json`` -> ``cnf_sha256`` (the manifest lives under the
# untracked ``scratch/`` tree, so its value is pinned here and re-read when present).
EXPECTED_SHA256 = "e29d1b2646d763425598fe0e5b1364118033b61df5aacdf5b907b6d0dad3bcb0"
LEAN_TIMEOUT_SECONDS = 900

DRIVER = f"""import {MODULE}

open Problem97.ATailFrontierLiveClosure.DRExactTwelveDimacs

def main (args : List String) : IO Unit := do
  let path := args[0]!
  IO.FS.withFile path .write fun h => do
    h.putStrLn s!"p cnf {{variableCount}} {{clauses.length}}"
    for clause in clauses do
      h.putStrLn (dimacsLine clause)
  for (family, count) in familyCounts do
    IO.println s!"{{family}} {{count}}"
"""


def _lean_module_available() -> bool:
    return shutil.which("lake") is not None and OLEAN.exists()


@unittest.skipUnless(_lean_module_available(), f"lake and the build products of {MODULE} are required")
class LeanDimacsMirrorTest(unittest.TestCase):
    def test_lean_clauses_match_encoder_dimacs(self) -> None:
        cnf, _layout = build("none", families=FAMILIES)
        expected = cnf.dimacs()
        self.assertEqual(hashlib.sha256(expected).hexdigest(), EXPECTED_SHA256)

        with tempfile.TemporaryDirectory(prefix="dr-exact12-lean-dimacs-") as tmp:
            driver = Path(tmp) / "DRExactTwelveDimacsDriver.lean"
            output = Path(tmp) / "lean.cnf"
            driver.write_text(DRIVER)
            completed = subprocess.run(
                ["lake", "env", "lean", "--run", str(driver), str(output)],
                cwd=LEAN_ROOT,
                capture_output=True,
                text=True,
                timeout=LEAN_TIMEOUT_SECONDS,
                check=False,
            )
            self.assertEqual(completed.returncode, 0, f"lake env lean failed:\n{completed.stdout}\n{completed.stderr}")
            actual = output.read_bytes()

        lean_counts = {family: int(count) for family, count in (line.split() for line in completed.stdout.splitlines() if line.strip())}
        self.assertEqual(lean_counts, cnf.counts)

        expected_lines = expected.decode("ascii").split("\n")
        actual_lines = actual.decode("ascii").split("\n")
        self.assertEqual(actual_lines[0], f"p cnf {cnf.n_variables} {len(cnf.clauses)}")
        for index, (want, got) in enumerate(zip(expected_lines, actual_lines)):
            if want != got:
                family = cnf.families[index - 1] if 1 <= index <= len(cnf.families) else "header"
                self.fail(f"first difference at line {index} ({family}): encoder {want!r}, Lean {got!r}")
        self.assertEqual(len(actual_lines), len(expected_lines))

        lean_sha256 = hashlib.sha256(actual).hexdigest()
        self.assertEqual(lean_sha256, EXPECTED_SHA256)
        if MANIFEST.exists():
            manifest = json.loads(MANIFEST.read_text())
            self.assertEqual(manifest[MANIFEST_SHA256_FIELD], lean_sha256)


if __name__ == "__main__":
    unittest.main()
