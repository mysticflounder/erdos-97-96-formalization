#!/usr/bin/env python3
"""Exact QF_LRA validation of the complete-row-compatible 25-role word.

This changes only the order of private first-block roles: x0,y0 precede nI,
matching the exact complete-b0-row witness.  The role identities and every
metric constraint are inherited from the fully-disjoint probe.
"""

from __future__ import annotations

import json
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "period-three-full-role-identity-quotient"
sys.path.insert(0, str(SOURCE))
import probe_fully_disjoint as base  # noqa: E402


BOUNDARY = (
    base.FIRST,
    "t0s", "nS",
    base.SECOND,
    "x0", "y0",
    "q", "w", "t0i", "t1i0", "t1i1", "t1i2", "nI",
    "x1", "y1", "x2", "y2",
    base.SURPLUS,
    "c0", "b0", "b2", "c1", "b1", "c2", "t1o",
)


def main() -> None:
    assert len(BOUNDARY) == len(set(BOUNDARY)) == 25
    base.BOUNDARY = BOUNDARY
    base.POINTS = BOUNDARY
    result = base.solve()
    payload = {
        "schema": "period3-complete-row-compatible-word-qf-lra-v1",
        "epistemic_status": (
            "EXACT_PROJECTED_QF_LRA_SAT_NOT_EUCLIDEAN_NOT_MEC_NOT_CSS_NOT_LEAN"
            if result["status"] == "sat"
            else "FIXED_WORD_QF_LRA_NOT_SAT_NOT_SOURCE_COVERAGE"
        ),
        "boundary": list(BOUNDARY),
        "complete_row_subsequence": [
            base.SECOND, "x0", "y0", "nI",
            "c0", "b0", "b2", "c1", "b1", "c2", "nS",
        ],
        "result": result,
    }
    output = HERE / "COMPLETE_ROW_WORD_LRA.json"
    output.write_text(json.dumps(payload, indent=2) + "\n")
    print(json.dumps(payload, indent=2))
    print(f"wrote {output}")


if __name__ == "__main__":
    main()
