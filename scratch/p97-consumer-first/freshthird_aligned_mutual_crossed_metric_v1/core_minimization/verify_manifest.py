"""Verify the frozen core-minimization artifact manifest and key invariants."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
EXPECTED_CORE = ["k4_equal_13_10", "singleton_excludes_c_first_10"]


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    manifest = HERE / "SHA256SUMS"
    entries: list[Path] = []
    for line in manifest.read_text().splitlines():
        expected, relative = line.split("  ", 1)
        path = HERE / relative
        if digest(path) != expected:
            raise RuntimeError(f"hash mismatch: {relative}")
        entries.append(path)

    results = json.loads((HERE / "results.json").read_text())
    if results["core_extraction"]["minimized_core"] != EXPECTED_CORE:
        raise RuntimeError("unexpected minimized core")
    if results["stage_delta_distinction"]["final_stage_clause_count"] != 13:
        raise RuntimeError("the final-stage delta is no longer 13 clauses")
    if results["canonical_input"]["byte_exact_rebuild"] != "PASS":
        raise RuntimeError("canonical-input rebuild was not byte-exact")

    smt2_files = sorted((HERE / "generated").glob("*.smt2"))
    if len(smt2_files) != 10:
        raise RuntimeError(f"expected 10 SMT artifacts, got {len(smt2_files)}")
    for path in smt2_files:
        if path.read_text().count("(check-sat)") != 1:
            raise RuntimeError(f"one-check-sat integrity failed: {path.name}")
    if set(entries) != {*smt2_files, HERE / "results.json"}:
        raise RuntimeError("manifest coverage differs from the expected artifact set")

    print("PASS: hashes, exact core, 13-clause delta, and one-check-sat integrity")


if __name__ == "__main__":
    main()
