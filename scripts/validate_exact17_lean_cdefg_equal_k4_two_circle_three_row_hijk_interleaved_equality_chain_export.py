"""Validate the Lean exact-17 equality-chain child export.

Lean is authoritative. This independent checker validates the complete
interleaved parent recursively, requires a byte-identical parent prefix,
regenerates every equality-chain clause, and confirms that the motivating
interleaved SAT model is cut.
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
Pair = tuple[int, int]

VARIABLES = 308
PARENT_CLAUSES = 3_915_420
EQUALITY_CHAIN_CLAUSES = 297_024
CHILD_CLAUSES = PARENT_CLAUSES + EQUALITY_CHAIN_CLAUSES
NAMED_ORDER_VARIABLES = (307, 308)
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
FIVE_OFFSET_CHOICES = tuple(reversed(tuple(combinations(range(1, 17), 5))))
EQUALITY_CHAIN_PAIRS: tuple[Pair, ...] = (
    (0, 3),
    (0, 4),
    (5, 1),
    (5, 3),
    (4, 0),
    (4, 2),
    (1, 0),
    (1, 2),
    (2, 1),
    (2, 4),
)


def load_parent_validator(path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(
        "exact17_interleaved_validator", path
    )
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
    offsets: tuple[int, int, int, int, int],
) -> Clause:
    local = (0, *offsets)
    point = lambda position: order[(cut + step * local[position]) % 17]
    return (
        -NAMED_ORDER_VARIABLES[order_index],
        *(
            -hit_var(point(center), point(target))
            for center, target in EQUALITY_CHAIN_PAIRS
        ),
    )


def assignment_map(model_path: Path) -> dict[int, bool]:
    payload = json.loads(model_path.read_text(encoding="utf-8"))
    signed = payload.get("assignment")
    if not isinstance(signed, list) or len(signed) != VARIABLES:
        raise ValueError("model assignment must contain exactly 308 signed literals")
    result: dict[int, bool] = {}
    for expected_var, literal in enumerate(signed, start=1):
        if not isinstance(literal, int) or abs(literal) != expected_var:
            raise ValueError(f"malformed model literal at variable {expected_var}")
        result[expected_var] = literal > 0
    return result


def clause_satisfied(clause: Clause, assignment: dict[int, bool]) -> bool:
    return any(assignment[abs(literal)] == (literal > 0) for literal in clause)


def validate(
    base_path: Path,
    ancestor_path: Path,
    grandparent_path: Path,
    parent_path: Path,
    three_row_path: Path,
    hijk_path: Path,
    interleaved_path: Path,
    child_path: Path,
    parent_model_path: Path,
    model_path: Path,
    parent_validator_path: Path,
    hijk_validator_path: Path,
    three_row_validator_path: Path,
    two_circle_validator_path: Path,
    equal_k4_validator_path: Path,
    cdefg_validator_path: Path,
) -> dict[str, object]:
    parent_validator = load_parent_validator(parent_validator_path)
    parent_report = parent_validator.validate(
        base_path,
        ancestor_path,
        grandparent_path,
        parent_path,
        three_row_path,
        hijk_path,
        interleaved_path,
        parent_model_path,
        hijk_validator_path,
        three_row_validator_path,
        two_circle_validator_path,
        equal_k4_validator_path,
        cdefg_validator_path,
    )
    model = assignment_map(model_path)

    digest = hashlib.sha256()
    observed_suffix = 0
    first_model_cut_clause: int | None = None
    with interleaved_path.open(encoding="ascii") as parent, child_path.open(
        encoding="ascii"
    ) as child:
        if read_header(parent, interleaved_path) != (VARIABLES, PARENT_CLAUSES):
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
                    for offsets in FIVE_OFFSET_CHOICES:
                        line = child.readline()
                        if not line:
                            raise ValueError(
                                "truncated equality-chain suffix at "
                                f"{order_index}/{step}/{cut}/{offsets}"
                            )
                        context = (
                            f"equality-chain/{order_index}/{step}/{cut}/{offsets}"
                        )
                        observed = parse_clause(line, context=context)
                        expected = expected_clause(
                            order_index, order, step, cut, offsets
                        )
                        if observed != expected:
                            raise ValueError(
                                f"equality-chain mismatch at {context}: "
                                f"{observed} != {expected}"
                            )
                        if (
                            first_model_cut_clause is None
                            and not clause_satisfied(observed, model)
                        ):
                            first_model_cut_clause = (
                                PARENT_CLAUSES + observed_suffix + 1
                            )
                        digest.update(line.encode("ascii"))
                        observed_suffix += 1

        if child.readline():
            raise ValueError("child file contains extra clauses")

    if observed_suffix != EQUALITY_CHAIN_CLAUSES:
        raise ValueError(
            "wrong equality-chain count: "
            f"{observed_suffix} != {EQUALITY_CHAIN_CLAUSES}"
        )
    if first_model_cut_clause is None:
        raise ValueError(
            "equality-chain suffix does not cut the motivating interleaved model"
        )
    return {
        "schema": "p97-exact17-lean-equality-chain-export-validation/v1",
        "parent": parent_report,
        "parent_prefix_byte_identical": True,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "equality_chain_clauses": observed_suffix,
        "equality_chain_suffix_sha256": digest.hexdigest(),
        "motivating_model_cut_clause": first_model_cut_clause,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base", type=Path, required=True)
    parser.add_argument("--ancestor", type=Path, required=True)
    parser.add_argument("--grandparent", type=Path, required=True)
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--three-row", type=Path, required=True)
    parser.add_argument("--hijk", type=Path, required=True)
    parser.add_argument("--interleaved", type=Path, required=True)
    parser.add_argument("--child", type=Path, required=True)
    parser.add_argument("--parent-model", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--parent-validator", type=Path, required=True)
    parser.add_argument("--hijk-validator", type=Path, required=True)
    parser.add_argument("--three-row-validator", type=Path, required=True)
    parser.add_argument("--two-circle-validator", type=Path, required=True)
    parser.add_argument("--equal-k4-validator", type=Path, required=True)
    parser.add_argument("--cdefg-validator", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    report = validate(
        args.base,
        args.ancestor,
        args.grandparent,
        args.parent,
        args.three_row,
        args.hijk,
        args.interleaved,
        args.child,
        args.parent_model,
        args.model,
        args.parent_validator,
        args.hijk_validator,
        args.three_row_validator,
        args.two_circle_validator,
        args.equal_k4_validator,
        args.cdefg_validator,
    )
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
