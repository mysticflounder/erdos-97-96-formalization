"""Validate the second Lean exact-17 generic-cancellation child export.

Lean is authoritative.  This independent checker recursively validates the
first generic-cancellation parent, requires a byte-identical parent prefix,
regenerates the four new clauses, and checks that they cut the motivating
tenth-root SAT model.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
from types import ModuleType
from typing import TextIO

Clause = tuple[int, ...]
Hit = tuple[int, int]

VARIABLES = 308
PARENT_CLAUSES = 5_846_080
NEW_CLAUSES = 4
CHILD_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
NAMED_ORDER_VARIABLES = (307, 308)
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
FORWARD_HITS: tuple[Hit, ...] = (
    (3, 2),
    (3, 13),
    (8, 0),
    (8, 13),
    (11, 0),
    (11, 2),
)


def load_validator(path: Path, name: str) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot import validator: {path}")
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
    order_index: int, order: tuple[int, ...], *, reverse: bool
) -> Clause:
    def oriented_label(position: int) -> int:
        return order[16 - position] if reverse else order[position]

    return (
        -NAMED_ORDER_VARIABLES[order_index],
        *(
            -hit_var(oriented_label(center), oriented_label(point))
            for center, point in FORWARD_HITS
        ),
    )


def assignment_map(model_path: Path) -> dict[int, bool]:
    payload = json.loads(model_path.read_text(encoding="utf-8"))
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


def validate(args: argparse.Namespace) -> dict[str, object]:
    parent_report = load_validator(
        args.parent_validator, "exact17_generic_cancellation_validator"
    ).validate(
        args.base,
        args.ancestor,
        args.grandparent,
        args.original_parent,
        args.three_row,
        args.hijk,
        args.interleaved,
        args.equality_chain,
        args.perp_bisector,
        args.two_kalmanson,
        args.swapped_de,
        args.generic_parent,
        args.hijk_model,
        args.interleaved_model,
        args.equality_chain_model,
        args.parent_model,
        args.swapped_de_model,
        args.generic_parent_model,
        args.swapped_de_validator,
        args.two_kalmanson_validator,
        args.perp_bisector_validator,
        args.equality_chain_validator,
        args.interleaved_validator,
        args.hijk_validator,
        args.three_row_validator,
        args.two_circle_validator,
        args.equal_k4_validator,
        args.cdefg_validator,
    )
    model = assignment_map(args.model)
    digest = hashlib.sha256()
    observed_suffix = 0
    model_cut_clauses: list[int] = []

    with (
        args.generic_parent.open(encoding="ascii") as parent,
        args.child.open(encoding="ascii") as child,
    ):
        if read_header(parent, args.generic_parent) != (VARIABLES, PARENT_CLAUSES):
            raise ValueError("unexpected parent header")
        if read_header(child, args.child) != (VARIABLES, CHILD_CLAUSES):
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
                    raise ValueError("truncated second-cancellation suffix")
                context = f"second-generic-cancellation/{order_index}/{reverse}"
                observed = parse_clause(line, context=context)
                expected = expected_clause(order_index, order, reverse=reverse)
                if observed != expected:
                    raise ValueError(
                        f"second-cancellation mismatch at {context}: "
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
        raise ValueError("wrong second-cancellation clause count")
    if not model_cut_clauses:
        raise ValueError("new suffix does not cut the motivating model")
    return {
        "schema": "p97-exact17-lean-second-generic-cancellation-export-validation/v1",
        "parent": parent_report,
        "parent_prefix_byte_identical": True,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "second_generic_cancellation_clauses": observed_suffix,
        "second_generic_cancellation_suffix_sha256": digest.hexdigest(),
        "motivating_model_cut_clauses": model_cut_clauses,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    for name in (
        "base",
        "ancestor",
        "grandparent",
        "original-parent",
        "three-row",
        "hijk",
        "interleaved",
        "equality-chain",
        "perp-bisector",
        "two-kalmanson",
        "swapped-de",
        "generic-parent",
        "child",
        "hijk-model",
        "interleaved-model",
        "equality-chain-model",
        "parent-model",
        "swapped-de-model",
        "generic-parent-model",
        "model",
        "parent-validator",
        "swapped-de-validator",
        "two-kalmanson-validator",
        "perp-bisector-validator",
        "equality-chain-validator",
        "interleaved-validator",
        "hijk-validator",
        "three-row-validator",
        "two-circle-validator",
        "equal-k4-validator",
        "cdefg-validator",
    ):
        parser.add_argument(f"--{name}", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    report = validate(args)
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
