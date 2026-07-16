#!/usr/bin/env python3
"""Check direct hypergraph embeddings into the existing anchor-collision cores."""

from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ANALYSIS = HERE / "analyze.py"


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


# Each tuple is (center role, support roles).  Containment in one selected row
# supplies the required equality star.  The seven-row pattern is the already
# kernel-checked scratch `ATailSevenRowScratch.false_of_seven_rows`; the two
# production patterns are `EqualityCore.six_row_anchor_collision` and
# `Census554.surplus_source_collision`.  Roles 0 and 1 are the anchors whose
# collision supplies the contradiction.
PATTERNS = {
    "production_six_row_anchor_collision": (
        (0, (2, 3)),
        (1, (2, 0, 4)),
        (2, (3, 1)),
        (4, (5, 0)),
        (3, (4, 5, 1)),
        (5, (2, 3, 1)),
    ),
    "scratch_seven_row_anchor_collision": (
        (1, (0, 2, 6, 7)),
        (2, (0, 1, 9, 10)),
        (7, (2, 5, 9, 11)),
        (8, (0, 3, 5, 7)),
        (9, (3, 6, 8, 11)),
        (10, (1, 7, 8, 9)),
        (11, (1, 5, 6, 10)),
    ),
    # O=0, A=1, B=2, C=3, U=4, V=5, W=6.  Grouping the theorem's
    # eleven pair equalities by their common center gives these six stars.
    "production_surplus_source_collision": (
        (0, (1, 2, 3)),
        (3, (1, 0, 5)),
        (4, (1, 2)),
        (2, (4, 1, 3)),
        (5, (2, 0)),
        (6, (4, 0, 3, 5)),
    ),
}


def embedding(
    rows_by_center: dict[int, frozenset[int]],
    pattern: tuple[tuple[int, tuple[int, ...]], ...],
    *,
    distinct_roles: bool,
) -> dict[int, int] | None:
    roles = sorted(
        {center for center, _support in pattern}
        | {point for _center, support in pattern for point in support}
    )
    variables = {role: z3.Int(f"role_{role}") for role in roles}
    solver = z3.Solver()
    for variable in variables.values():
        solver.add(0 <= variable, variable < 14)
    if distinct_roles:
        solver.add(z3.Distinct(*variables.values()))
    # Every registered collision theorem needs only the two anchors to differ.
    solver.add(variables[0] != variables[1])
    for center_role, support_roles in pattern:
        alternatives = []
        for actual_center, actual_support in rows_by_center.items():
            alternatives.append(
                z3.And(
                    variables[center_role] == actual_center,
                    *(
                        z3.Or(
                            *(variables[role] == point for point in actual_support)
                        )
                        for role in support_roles
                    ),
                )
            )
        solver.add(z3.Or(*alternatives))
    if solver.check() != z3.sat:
        return None
    model = solver.model()
    return {role: model.eval(variable).as_long() for role, variable in variables.items()}


def main() -> int:
    analysis = load_module(ANALYSIS, "p97_bank_clean_match_analysis")
    rows, by_label = analysis.canonical_rows()
    rows_by_center = {row.center: frozenset(row.support) for row in rows}
    for name, pattern in PATTERNS.items():
        for distinct_roles in (True, False):
            qualifier = "DISTINCT" if distinct_roles else "ALIASED"
            match = embedding(
                rows_by_center, pattern, distinct_roles=distinct_roles
            )
            if match is None:
                print(f"{name}: NO_DIRECT_{qualifier}_ROLE_EMBEDDING")
            else:
                named = {role: by_label[label] for role, label in match.items()}
                print(f"{name}: {qualifier}_ROLE_EMBEDDING {named}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
