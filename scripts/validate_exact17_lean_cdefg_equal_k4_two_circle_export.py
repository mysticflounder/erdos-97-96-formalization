"""Validate the Lean exact-17 complete two-circle child export.

Lean is authoritative.  This independent standard-library checker validates
the complete parent recursively, requires a byte-identical parent prefix, and
regenerates every guarded two-circle cyclic-placement clause.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from itertools import combinations
from pathlib import Path
from types import ModuleType
from typing import TextIO

Clause = tuple[int, ...]

VARIABLES = 308
PARENT_CLAUSES = 2_268_460
TWO_CIRCLE_CLAUSES = 38_080
CHILD_CLAUSES = PARENT_CLAUSES + TWO_CIRCLE_CLAUSES
NAMED_ORDER_VARIABLES = (307, 308)
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
THREE_OFFSET_CHOICES = tuple(reversed(tuple(combinations(range(1, 17), 3))))


def load_parent_validator(path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location("exact17_equal_k4_validator", path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot import parent validator: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


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
    return fields[:-1]


def hit_var(center: int, point: int) -> int:
    return 1 + center * 17 + point


def expected_clause(
    order_index: int,
    order: tuple[int, ...],
    step: int,
    cut: int,
    offsets: tuple[int, int, int],
) -> Clause:
    b, c, d = offsets
    point = lambda offset: order[(cut + step * offset) % 17]
    a_point = point(0)
    b_point = point(b)
    c_point = point(c)
    d_point = point(d)
    return (
        -NAMED_ORDER_VARIABLES[order_index],
        -hit_var(a_point, b_point),
        -hit_var(a_point, c_point),
        -hit_var(d_point, b_point),
        -hit_var(d_point, c_point),
    )


def validate(
    base_path: Path,
    grandparent_path: Path,
    parent_path: Path,
    child_path: Path,
    parent_validator_path: Path,
    grandparent_validator_path: Path,
) -> dict[str, object]:
    parent_validator = load_parent_validator(parent_validator_path)
    parent_report = parent_validator.validate(
        base_path, grandparent_path, parent_path, grandparent_validator_path
    )

    digest = hashlib.sha256()
    observed_suffix = 0
    with parent_path.open(encoding="ascii") as parent, child_path.open(
        encoding="ascii"
    ) as child:
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
            for step in (1, -1):
                for cut in range(17):
                    for offsets in THREE_OFFSET_CHOICES:
                        line = child.readline()
                        if not line:
                            raise ValueError(
                                "truncated two-circle suffix at "
                                f"{order_index}/{step}/{cut}/{offsets}"
                            )
                        observed = parse_clause(
                            line,
                            context=(
                                f"two-circle/{order_index}/{step}/{cut}/{offsets}"
                            ),
                        )
                        expected = expected_clause(
                            order_index, order, step, cut, offsets
                        )
                        if observed != expected:
                            raise ValueError(
                                "two-circle mismatch at "
                                f"{order_index}/{step}/{cut}/{offsets}: "
                                f"{observed} != {expected}"
                            )
                        digest.update(line.encode("ascii"))
                        observed_suffix += 1

        if child.readline():
            raise ValueError("child file contains extra clauses")

    if observed_suffix != TWO_CIRCLE_CLAUSES:
        raise ValueError(
            f"wrong two-circle count: {observed_suffix} != {TWO_CIRCLE_CLAUSES}"
        )
    return {
        "schema": "p97-exact17-lean-two-circle-export-validation/v1",
        "parent": parent_report,
        "parent_prefix_byte_identical": True,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "two_circle_clauses": observed_suffix,
        "two_circle_suffix_sha256": digest.hexdigest(),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base", type=Path, required=True)
    parser.add_argument("--grandparent", type=Path, required=True)
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--child", type=Path, required=True)
    parser.add_argument("--parent-validator", type=Path, required=True)
    parser.add_argument("--grandparent-validator", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    report = validate(
        args.base,
        args.grandparent,
        args.parent,
        args.child,
        args.parent_validator,
        args.grandparent_validator,
    )
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
