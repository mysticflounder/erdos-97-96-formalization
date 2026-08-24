"""Verify the v27 canary formula identity pins discovered by discover_v27_identity.py.

Unlike pin_v26_identity.py, the v27 pins were stamped directly into the
canary/PIQD sources; this script is the replayable record of the measured
identity and confirms every pin is present.  It writes nothing.

    uv run python .../pin_v27_identity.py            # verify (default)
"""

from __future__ import annotations

import sys
from pathlib import Path

REPO = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization")
CANARY = REPO / "census/card_head/exact12_next_row_arm_static_canary.py"
PIQD = REPO / "census/card_head/exact12_next_row_arm_static_piqd.py"
VALIDATOR = REPO / "census/card_head/exact12_next_row_arm_static_v27_validator.py"

# Measured by discover_v27_identity.py on 2026-08-23 against the v26 canary
# (whose final identity replayed exactly) plus the installed 229-clause
# physically-bridged class-cut bank.
POST_SOURCE_ORDER_CLAUSES = 704_481
POST_SOURCE_ORDER_DIMACS_SHA256 = (
    "82be51273d21d1377692a288b8d5714fb120792cb2e6565834b79f9b228ebd78"
)
CLASS_CUT_CLAUSES = 229
CLASS_CUT_BANK_SHA256 = (
    "4ee8e46a036c04d3065f0b87160e23bdf21479f3021409ab2518cc25529ebb2c"
)
CLASS_CUT_INSTALLED_CNF_JSON_SHA256 = (
    "c25e722813d1741b618794558012b7f93ca32b053fc26b4285fe2337c0c75a6d"
)
FINAL_CLAUSES = 704_710
FINAL_DIMACS_SHA256 = (
    "8da06d5e45d1326fb256d3ca735a802c0bf942ce3e84f5df53125441526f2b5f"
)

REQUIRED = {
    CANARY: (
        f"EXPECTED_POST_SOURCE_ORDER_CLAUSES = {POST_SOURCE_ORDER_CLAUSES:_}",
        f'    "{POST_SOURCE_ORDER_DIMACS_SHA256}"',
        f"EXPECTED_CLASS_CUT_CLAUSES = {CLASS_CUT_CLAUSES}",
        f'    "{CLASS_CUT_BANK_SHA256}"',
        f'    "{CLASS_CUT_INSTALLED_CNF_JSON_SHA256}"',
        f"EXPECTED_FINAL_CLAUSES = {FINAL_CLAUSES:_}",
        f'    "{FINAL_DIMACS_SHA256}"',
        "false_of_terminalFullMembershipNamedDeletionArmPhysicalClassBank",
        '_canary_run.v15"',
        '_canary_job.v15"',
    ),
    PIQD: ('PIQD_PROJECT = "p97-exact12-next-row-arm-static-cell6-v15-r1"',),
    VALIDATOR: (
        f"EXPECTED_POST_SOURCE_ORDER_CLAUSES = {POST_SOURCE_ORDER_CLAUSES}",
        f'EXPECTED_POST_SOURCE_ORDER_SHA256 = "{POST_SOURCE_ORDER_DIMACS_SHA256}"',
        f"EXPECTED_CLASS_CUT_CLAUSES = {CLASS_CUT_CLAUSES}",
        f'EXPECTED_CLASS_CUT_SHA256 = "{CLASS_CUT_BANK_SHA256}"',
        (
            "EXPECTED_CLASS_CUT_INSTALLED_CNF_JSON_SHA256 = "
            f'"{CLASS_CUT_INSTALLED_CNF_JSON_SHA256}"'
        ),
        f"EXPECTED_FINAL_CLAUSES = {FINAL_CLAUSES}",
        f'EXPECTED_FINAL_SHA256 = "{FINAL_DIMACS_SHA256}"',
        "false_of_terminalFullMembershipNamedDeletionArmPhysicalClassBank",
        '_canary_run.v15"',
        "cell6-v15-r1",
    ),
}


def main() -> int:
    missing = 0
    for path, needles in REQUIRED.items():
        text = path.read_text()
        for needle in needles:
            if needle not in text:
                print(f"MISSING in {path.name}: {needle.strip()[:70]}")
                missing += 1
    if missing:
        print(f"{missing} pin(s) missing")
        return 1
    print("all v27 identity pins present")
    return 0


if __name__ == "__main__":
    sys.exit(main())
