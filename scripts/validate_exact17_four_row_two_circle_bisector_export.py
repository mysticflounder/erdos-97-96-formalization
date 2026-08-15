"""Validate the Lean exact-17 four-row two-circle child export.

Lean is authoritative. This checker requires a byte-identical authenticated
parent prefix, independently regenerates the four-clause orbit, and checks
that the suffix cuts the motivating fourteenth-root SAT model.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import TextIO

Clause = tuple[int, ...]
Hit = tuple[int, int]

VARIABLES = 308
PARENT_CLAUSES = 5_846_100
NEW_CLAUSES = 4
CHILD_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
NAMED_ORDER_VARIABLES = (307, 308)
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
MOTIF: tuple[Hit, ...] = (
    (9, 10),
    (9, 13),
    (13, 9),
    (13, 16),
    (16, 9),
    (16, 13),
    (7, 10),
    (7, 16),
)


def strict_object(pairs: list[tuple[str, object]]) -> dict[str, object]:
    result: dict[str, object] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def read_header(stream: TextIO, path: Path) -> tuple[int, int]:
    fields = stream.readline().split()
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        raise ValueError(f"malformed DIMACS header: {path}")
    return int(fields[2]), int(fields[3])


def parse_clause(line: str, *, context: str) -> Clause:
    fields = tuple(map(int, line.split()))
    if not fields or fields[-1] != 0:
        raise ValueError(f"missing clause terminator: {context}")
    if len(fields) == 1:
        raise ValueError(f"empty clause: {context}")
    clause = fields[:-1]
    if any(literal == 0 or abs(literal) > VARIABLES for literal in clause):
        raise ValueError(f"literal outside DIMACS range: {context}")
    return clause


def hit_var(center: int, point: int) -> int:
    return 1 + center * 17 + point


def expected_clause(
    order_index: int,
    order: tuple[int, ...],
    *,
    reverse: bool,
) -> Clause:
    def oriented_label(position: int) -> int:
        return order[16 - position] if reverse else order[position]

    return (
        -NAMED_ORDER_VARIABLES[order_index],
        *(
            -hit_var(oriented_label(center), oriented_label(point))
            for center, point in MOTIF
        ),
    )


def assignment_map(model_path: Path) -> dict[int, bool]:
    payload = json.loads(
        model_path.read_text(encoding="utf-8"), object_pairs_hook=strict_object
    )
    if not isinstance(payload, dict):
        raise TypeError("model payload must be a JSON object")
    signed = payload.get("assignment")
    if not isinstance(signed, list) or len(signed) != VARIABLES:
        raise ValueError("model assignment must contain exactly 308 signed literals")
    result: dict[int, bool] = {}
    for expected_var, literal in enumerate(signed, start=1):
        if type(literal) is not int or abs(literal) != expected_var:
            raise ValueError(f"malformed model literal at variable {expected_var}")
        result[expected_var] = literal > 0
    return result


def clause_satisfied(clause: Clause, assignment: dict[int, bool]) -> bool:
    return any(assignment[abs(literal)] == (literal > 0) for literal in clause)


def validate(parent_path: Path, child_path: Path, model_path: Path) -> dict[str, object]:
    model = assignment_map(model_path)
    digest = hashlib.sha256()
    observed_suffix = 0
    model_cut_clauses: list[int] = []

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
                    raise ValueError("truncated four-row bisector suffix")
                context = f"four-row-two-circle-bisector/{order_index}/{reverse}"
                observed = parse_clause(line, context=context)
                expected = expected_clause(order_index, order, reverse=reverse)
                if observed != expected:
                    raise ValueError(
                        f"four-row bisector mismatch at {context}: "
                        f"{observed} != {expected}"
                    )
                clause_number = PARENT_CLAUSES + observed_suffix + 1
                if not clause_satisfied(observed, model):
                    model_cut_clauses.append(clause_number)
                digest.update(line.encode("ascii"))
                observed_suffix += 1

        if child.readline():
            raise ValueError("child file contains extra clauses")

    if observed_suffix != NEW_CLAUSES:
        raise ValueError("wrong four-row bisector clause count")
    if not model_cut_clauses:
        raise ValueError("new suffix does not cut the motivating model")
    return {
        "schema": "p97-exact17-lean-four-row-two-circle-bisector-export-validation/v1",
        "parent_prefix_byte_identical": True,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "four_row_two_circle_bisector_clauses": observed_suffix,
        "four_row_two_circle_bisector_suffix_sha256": digest.hexdigest(),
        "motivating_model_cut_clauses": model_cut_clauses,
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
