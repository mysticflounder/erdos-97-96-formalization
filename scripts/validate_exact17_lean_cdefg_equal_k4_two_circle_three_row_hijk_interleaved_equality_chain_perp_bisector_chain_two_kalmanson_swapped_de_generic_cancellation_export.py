"""Validate the Lean exact-17 generic-cancellation child export.

Lean is authoritative. This independent checker validates the complete
swapped-D/E parent recursively, requires a byte-identical parent prefix,
regenerates the four generic-cancellation clauses, and confirms that the
motivating ninth-root SAT model is cut.
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
PARENT_CLAUSES = 5_846_076
GENERIC_CANCELLATION_CLAUSES = 4
CHILD_CLAUSES = PARENT_CLAUSES + GENERIC_CANCELLATION_CLAUSES
NAMED_ORDER_VARIABLES = (307, 308)
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
FORWARD_HITS: tuple[Hit, ...] = (
    (1, 0),
    (1, 10),
    (10, 1),
    (10, 13),
    (11, 0),
    (11, 2),
    (13, 10),
    (13, 15),
    (15, 2),
    (15, 13),
    (16, 1),
    (16, 15),
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
    original_parent_path: Path,
    three_row_path: Path,
    hijk_path: Path,
    interleaved_path: Path,
    equality_chain_path: Path,
    perp_bisector_path: Path,
    two_kalmanson_path: Path,
    swapped_de_path: Path,
    child_path: Path,
    hijk_model_path: Path,
    interleaved_model_path: Path,
    equality_chain_model_path: Path,
    parent_model_path: Path,
    swapped_de_model_path: Path,
    model_path: Path,
    parent_validator_path: Path,
    two_kalmanson_validator_path: Path,
    perp_bisector_validator_path: Path,
    equality_chain_validator_path: Path,
    interleaved_validator_path: Path,
    hijk_validator_path: Path,
    three_row_validator_path: Path,
    two_circle_validator_path: Path,
    equal_k4_validator_path: Path,
    cdefg_validator_path: Path,
) -> dict[str, object]:
    parent_report = load_validator(
        parent_validator_path, "exact17_swapped_de_validator"
    ).validate(
        base_path,
        ancestor_path,
        grandparent_path,
        original_parent_path,
        three_row_path,
        hijk_path,
        interleaved_path,
        equality_chain_path,
        perp_bisector_path,
        two_kalmanson_path,
        swapped_de_path,
        hijk_model_path,
        interleaved_model_path,
        equality_chain_model_path,
        parent_model_path,
        swapped_de_model_path,
        two_kalmanson_validator_path,
        perp_bisector_validator_path,
        equality_chain_validator_path,
        interleaved_validator_path,
        hijk_validator_path,
        three_row_validator_path,
        two_circle_validator_path,
        equal_k4_validator_path,
        cdefg_validator_path,
    )
    model = assignment_map(model_path)

    digest = hashlib.sha256()
    observed_suffix = 0
    model_cut_clauses: list[int] = []
    with (
        swapped_de_path.open(encoding="ascii") as parent,
        child_path.open(encoding="ascii") as child,
    ):
        if read_header(parent, swapped_de_path) != (VARIABLES, PARENT_CLAUSES):
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
                    raise ValueError("truncated generic-cancellation suffix")
                context = f"generic-cancellation/{order_index}/{reverse}"
                observed = parse_clause(line, context=context)
                expected = expected_clause(order_index, order, reverse=reverse)
                if observed != expected:
                    raise ValueError(
                        f"generic-cancellation mismatch at {context}: "
                        f"{observed} != {expected}"
                    )
                clause_number = PARENT_CLAUSES + observed_suffix + 1
                if not clause_satisfied(observed, model):
                    model_cut_clauses.append(clause_number)
                digest.update(line.encode("ascii"))
                observed_suffix += 1

        if child.readline():
            raise ValueError("child file contains extra clauses")

    if observed_suffix != GENERIC_CANCELLATION_CLAUSES:
        raise ValueError("wrong generic-cancellation clause count")
    if not model_cut_clauses:
        raise ValueError("new suffix does not cut the motivating model")
    return {
        "schema": "p97-exact17-lean-generic-cancellation-export-validation/v1",
        "parent": parent_report,
        "parent_prefix_byte_identical": True,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "generic_cancellation_clauses": observed_suffix,
        "generic_cancellation_suffix_sha256": digest.hexdigest(),
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
        "child",
        "hijk-model",
        "interleaved-model",
        "equality-chain-model",
        "parent-model",
        "swapped-de-model",
        "model",
        "parent-validator",
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
    report = validate(
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
        args.child,
        args.hijk_model,
        args.interleaved_model,
        args.equality_chain_model,
        args.parent_model,
        args.swapped_de_model,
        args.model,
        args.parent_validator,
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
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
