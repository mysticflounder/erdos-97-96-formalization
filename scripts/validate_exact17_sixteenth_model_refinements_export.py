"""Validate the Lean exact-17 seventeenth-child export.

Lean is authoritative. This checker requires the authenticated sixteenth root
as a byte-identical prefix, independently regenerates all eight four-clause
occurrence orbits, and checks that every orbit cuts the motivating model.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from validate_exact17_fifth_convex_five_point_export import (
    ORDERS,
    VARIABLES,
    Hit,
    assignment_map,
    clause_satisfied,
    expected_clause,
    parse_clause,
    read_header,
)

PARENT_CLAUSES = 5_846_112
ORBIT_CLAUSES = 4
MOTIFS: tuple[tuple[str, tuple[Hit, ...]], ...] = (
    (
        "bisector_one",
        ((1, 6), (1, 15), (5, 1), (5, 7), (6, 7), (6, 15), (15, 1), (15, 6)),
    ),
    (
        "bisector_two",
        (
            (13, 16),
            (13, 10),
            (1, 15),
            (1, 16),
            (15, 1),
            (15, 10),
            (16, 1),
            (16, 15),
        ),
    ),
    (
        "kalmanson_l",
        (
            (14, 0),
            (14, 8),
            (13, 0),
            (13, 10),
            (7, 3),
            (7, 10),
            (10, 14),
            (10, 8),
            (10, 3),
        ),
    ),
    (
        "equilateral_collision",
        (
            (12, 6),
            (12, 15),
            (1, 6),
            (1, 15),
            (1, 16),
            (15, 1),
            (15, 6),
            (16, 12),
            (16, 1),
            (16, 15),
        ),
    ),
    (
        "convex_five_one",
        ((11, 2), (11, 4), (7, 11), (7, 4), (7, 3), (3, 2), (3, 4)),
    ),
    (
        "convex_five_two",
        (
            (1, 6),
            (1, 15),
            (2, 1),
            (2, 5),
            (6, 5),
            (6, 15),
            (15, 1),
            (15, 2),
            (15, 6),
        ),
    ),
    ("generic_cancellation", ((3, 2), (3, 14), (8, 0), (8, 14), (11, 0), (11, 2))),
    (
        "perpendicular_bisector",
        ((14, 0), (14, 8), (14, 13), (8, 0), (8, 14), (8, 13), (10, 14), (10, 8)),
    ),
)
NEW_CLAUSES = len(MOTIFS) * ORBIT_CLAUSES
CHILD_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES


def validate(parent_path: Path, child_path: Path, model_path: Path) -> dict[str, object]:
    model = assignment_map(model_path)
    suffix_digest = hashlib.sha256()
    observed_suffix = 0
    cut_by_orbit: dict[str, list[int]] = {name: [] for name, _ in MOTIFS}

    with (
        parent_path.open(encoding="ascii") as parent,
        child_path.open(encoding="ascii") as child,
    ):
        if read_header(parent, parent_path) != (VARIABLES, PARENT_CLAUSES):
            raise ValueError("unexpected parent header")
        if read_header(child, child_path) != (VARIABLES, CHILD_CLAUSES):
            raise ValueError("unexpected child header")

        for index in range(PARENT_CLAUSES):
            parent_line = parent.readline()
            child_line = child.readline()
            if not parent_line or parent_line != child_line:
                raise ValueError(f"parent-prefix mismatch at clause {index + 1}")
        if parent.readline():
            raise ValueError("parent file contains extra clauses")

        for orbit_name, motif in MOTIFS:
            for order_index, order in enumerate(ORDERS):
                for reverse in (False, True):
                    line = child.readline()
                    if not line:
                        raise ValueError(f"truncated {orbit_name} suffix")
                    context = f"{orbit_name}/{order_index}/{reverse}"
                    observed = parse_clause(line, context=context)
                    expected = expected_clause(order_index, order, motif, reverse=reverse)
                    if observed != expected:
                        raise ValueError(
                            f"clause mismatch at {context}: {observed} != {expected}"
                        )
                    clause_number = PARENT_CLAUSES + observed_suffix + 1
                    if not clause_satisfied(observed, model):
                        cut_by_orbit[orbit_name].append(clause_number)
                    suffix_digest.update(line.encode("ascii"))
                    observed_suffix += 1

        if child.readline():
            raise ValueError("child file contains extra clauses")

    if observed_suffix != NEW_CLAUSES:
        raise ValueError("wrong combined suffix clause count")
    for orbit_name, cuts in cut_by_orbit.items():
        if not cuts:
            raise ValueError(f"{orbit_name} orbit does not cut motivating model")
    return {
        "schema": "p97-exact17-sixteenth-model-refinements-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "orbit_clauses": ORBIT_CLAUSES,
        "new_clauses": NEW_CLAUSES,
        "suffix_sha256": suffix_digest.hexdigest(),
        "motivating_model_cut_clauses": cut_by_orbit,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--child", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    report = validate(args.parent, args.child, args.model)
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
