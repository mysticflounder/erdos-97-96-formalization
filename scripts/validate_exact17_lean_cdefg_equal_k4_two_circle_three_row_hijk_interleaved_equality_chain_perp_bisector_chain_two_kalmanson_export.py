"""Validate the Lean exact-17 two-Kalmanson child export.

Lean is authoritative. This independent checker validates the complete
perpendicular-bisector-chain parent recursively, requires a byte-identical
parent prefix, regenerates every new clause, and confirms that the motivating
SAT model is cut.
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
PARENT_CLAUSES = 4_756_988
TWO_KALMANSON_CLAUSES = 544_544
CHILD_CLAUSES = PARENT_CLAUSES + TWO_KALMANSON_CLAUSES
NAMED_ORDER_VARIABLES = (307, 308)
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
SIX_OFFSET_CHOICES = tuple(reversed(tuple(combinations(range(1, 17), 6))))
TWO_KALMANSON_PAIRS: tuple[Pair, ...] = (
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 0),
    (0, 3),
    (0, 5),
    (0, 4),
    (5, 0),
    (5, 1),
    (6, 4),
    (6, 2),
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
    order_index: int,
    order: tuple[int, ...],
    step: int,
    cut: int,
    offsets: tuple[int, int, int, int, int, int],
) -> Clause:
    local = (0, *offsets)
    point = lambda position: order[(cut + step * local[position]) % 17]
    return (
        -NAMED_ORDER_VARIABLES[order_index],
        *(
            -hit_var(point(center), point(target))
            for center, target in TWO_KALMANSON_PAIRS
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


def validate(
    base_path: Path,
    ancestor_path: Path,
    grandparent_path: Path,
    parent_path: Path,
    three_row_path: Path,
    hijk_path: Path,
    interleaved_path: Path,
    equality_chain_path: Path,
    perp_bisector_path: Path,
    child_path: Path,
    hijk_model_path: Path,
    interleaved_model_path: Path,
    equality_chain_model_path: Path,
    model_path: Path,
    parent_validator_path: Path,
    equality_chain_validator_path: Path,
    interleaved_validator_path: Path,
    hijk_validator_path: Path,
    three_row_validator_path: Path,
    two_circle_validator_path: Path,
    equal_k4_validator_path: Path,
    cdefg_validator_path: Path,
) -> dict[str, object]:
    parent_report = load_validator(
        parent_validator_path, "exact17_perp_bisector_chain_validator"
    ).validate(
        base_path,
        ancestor_path,
        grandparent_path,
        parent_path,
        three_row_path,
        hijk_path,
        interleaved_path,
        equality_chain_path,
        perp_bisector_path,
        hijk_model_path,
        interleaved_model_path,
        equality_chain_model_path,
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
    first_model_cut_clause: int | None = None
    with (
        perp_bisector_path.open(encoding="ascii") as parent,
        child_path.open(encoding="ascii") as child,
    ):
        if read_header(parent, perp_bisector_path) != (VARIABLES, PARENT_CLAUSES):
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
                    for offsets in SIX_OFFSET_CHOICES:
                        line = child.readline()
                        if not line:
                            raise ValueError(
                                "truncated two-Kalmanson suffix at "
                                f"{order_index}/{step}/{cut}/{offsets}"
                            )
                        context = f"two-kalmanson/{order_index}/{step}/{cut}/{offsets}"
                        observed = parse_clause(line, context=context)
                        expected = expected_clause(
                            order_index, order, step, cut, offsets
                        )
                        if observed != expected:
                            raise ValueError(
                                f"two-Kalmanson mismatch at {context}: "
                                f"{observed} != {expected}"
                            )
                        if first_model_cut_clause is None and not clause_satisfied(
                            observed, model
                        ):
                            first_model_cut_clause = (
                                PARENT_CLAUSES + observed_suffix + 1
                            )
                        digest.update(line.encode("ascii"))
                        observed_suffix += 1

        if child.readline():
            raise ValueError("child file contains extra clauses")

    if observed_suffix != TWO_KALMANSON_CLAUSES:
        raise ValueError(
            f"wrong two-Kalmanson count: {observed_suffix} != {TWO_KALMANSON_CLAUSES}"
        )
    if first_model_cut_clause is None:
        raise ValueError("new suffix does not cut the motivating model")
    return {
        "schema": "p97-exact17-lean-two-kalmanson-export-validation/v1",
        "parent": parent_report,
        "parent_prefix_byte_identical": True,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "two_kalmanson_clauses": observed_suffix,
        "two_kalmanson_suffix_sha256": digest.hexdigest(),
        "motivating_model_cut_clause": first_model_cut_clause,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    for name in (
        "base",
        "ancestor",
        "grandparent",
        "parent",
        "three-row",
        "hijk",
        "interleaved",
        "equality-chain",
        "perp-bisector",
        "child",
        "hijk-model",
        "interleaved-model",
        "equality-chain-model",
        "model",
        "parent-validator",
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
        args.parent,
        args.three_row,
        args.hijk,
        args.interleaved,
        args.equality_chain,
        args.perp_bisector,
        args.child,
        args.hijk_model,
        args.interleaved_model,
        args.equality_chain_model,
        args.model,
        args.parent_validator,
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
