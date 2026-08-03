#!/usr/bin/env python3
"""Schema-v8 paired-arm probe: v7 triple capacity on paired normal forms.

The live retained-omission core has two normal-form arms.  Schemas v5--v7
were deliberately fresh-arm-only because their squared-shell separation is
licensed only there.  The global full-shell, cap-localization, and
three-carrier-point centre-capacity constraints are nevertheless valid for
the paired-common-deletion arm.  This wrapper reuses exactly those clauses,
while accepting only paired cases so that a fresh-only square-separation
assumption cannot enter the run.
"""

from __future__ import annotations

import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_VERSION = 8
V7_DIR = HERE.parent / "round7-triple-center-multiplicity"
if str(V7_DIR) not in sys.path:
    sys.path.insert(0, str(V7_DIR))

import run_full_multiplicity_triple_center as v7


def selected_cases(case_ids: list[str]):
    """Select only the paired arm from the frozen target-case universe."""
    base = v7.v6.v5.v4.base
    by_id = {case.case_id: case for case in base.all_cases()}
    missing = sorted(set(case_ids) - by_id.keys())
    if missing:
        raise SystemExit(f"unknown case ids: {missing}")
    cases = [by_id[case_id] for case_id in case_ids]
    invalid = [case.case_id for case in cases if case.arm != "paired"]
    if invalid:
        raise SystemExit(f"schema v8 is paired-arm only: {invalid}")
    return cases


def main() -> int:
    """Run the v7 encoding with paired-arm selection and v8 provenance."""
    v7.HERE = HERE
    v7.SCRIPT_PATH = SCRIPT_PATH
    v7.SCHEMA_VERSION = SCHEMA_VERSION
    v7.v6.selected_cases = selected_cases
    return v7.main()


if __name__ == "__main__":
    raise SystemExit(main())
