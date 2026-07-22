#!/usr/bin/env python3
"""Replay stored first ordinal cores in the exact rational Kalmanson theory."""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path

import z3

from decision import (
    VERTICES,
    edge,
    ordinal_cycle_from_equalities,
    selected_equalities,
    verify_complete_class_geometry,
    verify_focus,
)


def exact_core_status(equalities: list[tuple[tuple[int, int], tuple[int, int], str]]) -> z3.CheckSatResult:
    distances = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in itertools.combinations(VERTICES, 2)
    }
    distance = lambda a, b: z3.RealVal(0) if a == b else distances[edge(a, b)]
    solver = z3.SolverFor("QF_LRA")
    for value in distances.values():
        solver.add(value >= 1)
    for a, b, c in itertools.combinations(VERTICES, 3):
        solver.add(distance(a, b) + distance(b, c) >= distance(a, c) + 1)
        solver.add(distance(a, c) + distance(b, c) >= distance(a, b) + 1)
        solver.add(distance(a, b) + distance(a, c) >= distance(b, c) + 1)
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diagonal = distance(a, c) + distance(b, d)
        solver.add(diagonal >= distance(a, b) + distance(c, d) + 1)
        solver.add(diagonal >= distance(a, d) + distance(b, c) + 1)
    for left, right, _ in equalities:
        solver.add(distances[left] == distances[right])
    return solver.check()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("results", type=Path, nargs="+")
    args = parser.parse_args()
    checked = 0
    for path in args.results:
        data = json.loads(path.read_text())
        record = data.get("first_ordinal_core")
        if record is None:
            raise SystemExit(f"{path}: no first ordinal core")
        decoded = record["decoded"]
        errors = verify_focus(decoded)
        errors.extend(verify_complete_class_geometry(decoded))
        if errors:
            raise SystemExit(f"{path}: decoded errors: {errors}")
        reasons = set(record["core"])
        equalities = [item for item in selected_equalities(decoded)
                      if item[2] in reasons]
        if {item[2] for item in equalities} != reasons:
            raise SystemExit(f"{path}: unexplained core reason")
        if ordinal_cycle_from_equalities(equalities) is None:
            raise SystemExit(f"{path}: graph cycle does not replay")
        for reason in sorted(reasons):
            trial = [item for item in equalities if item[2] != reason]
            if ordinal_cycle_from_equalities(trial) is not None:
                raise SystemExit(f"{path}: graph core is not deletion-minimal")
        if exact_core_status(equalities) != z3.unsat:
            raise SystemExit(f"{path}: exact LRA does not confirm UNSAT")
        checked += 1
    print(f"VERIFIED {checked} ordinal cores by graph replay and exact LRA")


if __name__ == "__main__":
    main()
