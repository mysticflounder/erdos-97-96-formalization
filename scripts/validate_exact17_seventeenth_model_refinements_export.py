"""Validate the Lean exact-17 eighteenth-child export.

Lean is authoritative. This checker requires the authenticated seventeenth
root as a byte-identical prefix, independently regenerates all four four-clause
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

PARENT_CLAUSES = 5_846_144
ORBIT_CLAUSES = 4
MOTIFS: tuple[tuple[str, tuple[Hit, ...]], ...] = (
    (
        "bisector",
        (
            (0, 11),
            (0, 12),
            (11, 0),
            (11, 4),
            (12, 0),
            (12, 15),
            (15, 4),
            (15, 12),
            (16, 11),
            (16, 15),
        ),
    ),
    (
        "convex_five_one",
        ((10, 1), (10, 7), (5, 1), (5, 7), (6, 5), (6, 7), (6, 10)),
    ),
    (
        "convex_five_two",
        ((10, 1), (10, 7), (5, 1), (5, 7), (2, 1), (2, 5), (2, 10)),
    ),
    (
        "generic_cancellation",
        ((3, 2), (3, 13), (12, 0), (12, 2), (8, 0), (8, 13)),
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
        "schema": "p97-exact17-seventeenth-model-refinements-export-validation/v1",
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
