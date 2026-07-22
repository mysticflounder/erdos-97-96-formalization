#!/usr/bin/env python3
"""Replay recorded prefilter regressions in the integrated outer solver.

Each input is either a result produced before the ordinal-distance prefilter
was added, or a minimal repository-owned fixture containing its row-only
first core.  Fixing the full old assignment, or merely asserting the core's
row incidences, in the new outer must be UNSAT.

This is a regression check for the generic transport, not a coverage proof:
the old runs retained only one representative candidate apiece.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import z3

from decision import FocusOuter


def core_atoms(outer: FocusOuter, core: list[str]) -> list[z3.BoolRef]:
    families = {"m": outer.m, "g0": outer.cover[0], "g1": outer.cover[1]}
    atoms: list[z3.BoolRef] = []
    for name in core:
        parts = name.split("|")
        if len(parts) != 4 or parts[0] != "row" or parts[1] not in families:
            raise ValueError(f"unsupported regression core item: {name}")
        center = int(parts[2])
        left, right = map(int, parts[3].split("="))
        family = families[parts[1]]
        atoms.extend((family[center,left], family[center,right]))
    return atoms


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("results", nargs="+", type=Path)
    args = parser.parse_args()
    checked = 0
    for path in args.results:
        payload = json.loads(path.read_text())
        recorded = payload.get("first_core")
        core = payload.get("core") if recorded is None else recorded["core"]
        if not core or not all(item.startswith("row|") for item in core):
            raise SystemExit(f"{path}: first core is not row-only: {core}")
        outer = FocusOuter(
            str(payload["orbit"]), str(payload["radius_arm"]), 30_000, 1
        )
        if recorded is not None:
            outer.solver.add(*outer.assignment_atoms(recorded["decoded"]))
        else:
            outer.solver.add(*core_atoms(outer, core))
        status = outer.solver.check()
        if status != z3.unsat:
            raise SystemExit(f"{path}: integrated replay returned {status}")
        checked += 1
        print(f"PASS {path.name}: row-only regression rejected")
    print(f"PASS: {checked} recorded row-only regressions rejected by generic prefilter")


if __name__ == "__main__":
    main()
