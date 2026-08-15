"""Validate the Lean exact-17 nineteenth-child export.

Lean is authoritative. This checker requires the authenticated eighteenth
root as a byte-identical prefix, independently regenerates the four-clause
two-Kalmanson cancellation orbit, and checks that it cuts the motivating
model.
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

PARENT_CLAUSES = 5_846_160
ORBIT_CLAUSES = 4
CANCELLATION_HITS: tuple[Hit, ...] = (
    (1, 11),
    (1, 15),
    (15, 1),
    (15, 12),
    (12, 0),
    (12, 15),
    (0, 11),
    (0, 12),
    (14, 0),
    (14, 1),
)
CHILD_CLAUSES = PARENT_CLAUSES + ORBIT_CLAUSES


def validate(parent_path: Path, child_path: Path, model_path: Path) -> dict[str, object]:
    model = assignment_map(model_path)
    suffix_digest = hashlib.sha256()
    cut_clauses: list[int] = []
    observed_suffix = 0

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

        for order_index, order in enumerate(ORDERS):
            for reverse in (False, True):
                line = child.readline()
                if not line:
                    raise ValueError("truncated cancellation suffix")
                context = f"cancellation/{order_index}/{reverse}"
                observed = parse_clause(line, context=context)
                expected = expected_clause(
                    order_index, order, CANCELLATION_HITS, reverse=reverse
                )
                if observed != expected:
                    raise ValueError(
                        f"clause mismatch at {context}: {observed} != {expected}"
                    )
                clause_number = PARENT_CLAUSES + observed_suffix + 1
                if not clause_satisfied(observed, model):
                    cut_clauses.append(clause_number)
                suffix_digest.update(line.encode("ascii"))
                observed_suffix += 1

        if child.readline():
            raise ValueError("child file contains extra clauses")

    if observed_suffix != ORBIT_CLAUSES:
        raise ValueError("wrong suffix clause count")
    if not cut_clauses:
        raise ValueError("cancellation orbit does not cut motivating model")
    return {
        "schema": "p97-exact17-eighteenth-model-refinements-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "orbit_clauses": ORBIT_CLAUSES,
        "new_clauses": ORBIT_CLAUSES,
        "suffix_sha256": suffix_digest.hexdigest(),
        "motivating_model_cut_clauses": cut_clauses,
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
