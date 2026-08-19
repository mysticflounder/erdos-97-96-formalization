"""Pin the v26 canary formula identity discovered by discover_v26_identity.py.

The prefix variable and clause counts are stamped by chain_canary_v14.py, which
takes them from the closure plan.  This script stamps the three digests and the
two derived clause counts that only a materialization can supply, and bumps the
PIQD project to the v14 run.

    uv run python .../pin_v26_identity.py            # apply
    uv run python .../pin_v26_identity.py --verify   # confirm every pin landed
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

REPO = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization")
CANARY = REPO / "census/card_head/exact12_next_row_arm_static_canary.py"
PIQD = REPO / "census/card_head/exact12_next_row_arm_static_piqd.py"

# Measured by discover_v26_identity.py against the chained canary.  The arm
# suffix still adds exactly 867 clauses and the source-order bank exactly 81,
# both unchanged from v25, so only the digests and totals move.
PREFIX_DIMACS_SHA256 = (
    "415be05fdedfb008b0a1eb5a5ca5e299ef7564e9287b89333dc4705235916a93"
)
POST_ARM_CLAUSES = 704_400
POST_ARM_DIMACS_SHA256 = (
    "8f072d08ada262fcb3ba98012a5fc638297c681509e8355e04dadd4dd350d2d3"
)
FINAL_CLAUSES = 704_481
FINAL_DIMACS_SHA256 = (
    "82be51273d21d1377692a288b8d5714fb120792cb2e6565834b79f9b228ebd78"
)

CANARY_REPLACEMENTS = (
    (
        '    "ef94a6d4624b242a77195455d312a8e7f880e3fe547882b23c67d0359ce4d759"\n',
        f'    "{PREFIX_DIMACS_SHA256}"\n',
    ),
    (
        "EXPECTED_POST_ARM_CLAUSES = 680_218\n",
        f"EXPECTED_POST_ARM_CLAUSES = {POST_ARM_CLAUSES:_}\n",
    ),
    (
        '    "4f15259e8d8494e4ebb741b52328cef4049049fe027159cd6ba0b19c4e50702d"\n',
        f'    "{POST_ARM_DIMACS_SHA256}"\n',
    ),
    (
        "EXPECTED_FINAL_CLAUSES = 680_299\n",
        f"EXPECTED_FINAL_CLAUSES = {FINAL_CLAUSES:_}\n",
    ),
    (
        '    "81b4e2e2fb6b39340253d0407a891d2d6b925cb444c56964e8dafdfb4597ae11"\n',
        f'    "{FINAL_DIMACS_SHA256}"\n',
    ),
)

PIQD_REPLACEMENTS = (
    (
        'PIQD_PROJECT = "p97-exact12-next-row-arm-static-cell6-v13-r1"',
        'PIQD_PROJECT = "p97-exact12-next-row-arm-static-cell6-v14-r1"',
    ),
)

TARGETS = ((CANARY, CANARY_REPLACEMENTS), (PIQD, PIQD_REPLACEMENTS))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--verify", action="store_true")
    arguments = parser.parse_args()
    missing = 0
    for path, replacements in TARGETS:
        text = path.read_text()
        for old, new in replacements:
            if arguments.verify:
                if new not in text:
                    print(f"MISSING in {path.name}: {new.strip()[:70]}")
                    missing += 1
                continue
            if text.count(old) != 1:
                raise SystemExit(f"{path.name}: anchor is not unique: {old.strip()[:60]}")
            text = text.replace(old, new)
        if not arguments.verify:
            path.write_text(text)
    if arguments.verify:
        if missing:
            print(f"{missing} pin(s) missing")
            return 1
        print("all v26 identity pins present")
        return 0
    print("stamped the v26 identity and the v14 PIQD project")
    return 0


if __name__ == "__main__":
    sys.exit(main())
