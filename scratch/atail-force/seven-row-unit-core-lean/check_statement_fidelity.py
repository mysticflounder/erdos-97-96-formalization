#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Check that the invariant Lean theorem states the pinned 21 generators."""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

import analyze_equalities as system


HERE = Path(__file__).resolve().parent
LEAN = HERE / "SevenRowUnitCore.lean"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    source = LEAN.read_text(encoding="utf-8")
    theorem = source.split("theorem seven_row_anchor_collision", 1)[1].split(
        ":= by", 1
    )[0]
    matches = re.findall(
        r"\((h[0-9a-z_]+)\s*:\s*dist P(\d+) P(\d+)\s*=\s*"
        r"dist P(\d+) P(\d+)\)",
        theorem,
    )
    if len(matches) != 21:
        raise AssertionError(f"expected 21 distance hypotheses, found {len(matches)}")
    decoded = []
    for hypothesis, left_center, pivot, right_center, member in matches:
        if left_center != right_center:
            raise AssertionError(f"{hypothesis} changes center")
        decoded.append(
            f"ROW_{int(left_center)}_{int(pivot)}_{int(member)}"
        )
    expected = [name for name, _ in system.generators()]
    if decoded != expected:
        raise AssertionError(f"Lean row stream drift:\n{decoded}\n!=\n{expected}")
    polynomial_text = [polynomial for _, polynomial in system.generators()]
    digest = system.canonical_sha256(polynomial_text)
    if digest != system.EXPECTED_POLYNOMIAL_SHA256:
        raise AssertionError("normalized polynomial stream drift")
    report = {
        "schema": "p97-atail-seven-row-statement-fidelity-v1",
        "lean_file": str(LEAN),
        "lean_file_sha256": file_sha256(LEAN),
        "theorem": "Problem97.ATailSevenRowScratch.seven_row_anchor_collision",
        "hypothesis_count": len(matches),
        "generator_names": decoded,
        "expanded_polynomial_count": len(polynomial_text),
        "expanded_polynomial_sha256": digest,
        "matches_pinned_oracle_stream": True,
    }
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
