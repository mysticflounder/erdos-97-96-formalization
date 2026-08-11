"""Validate the Lean exact-17 C--G export against the legacy schema fixture.

Lean is authoritative.  This independent standard-library checker verifies
that the extended export begins with the byte-identical checked base clauses
and that each guarded C--G family agrees with the legacy order-0 generator and
the corresponding order-1 placement table.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
from itertools import combinations
from pathlib import Path
from typing import TextIO

Clause = tuple[int, ...]
Hit = tuple[int, int]

BASE_CLAUSES = 209_692
VARIABLES = 308
NAMED_ORDER_VARIABLES = (307, 308)
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)

SCHEMAS: tuple[tuple[str, int, tuple[Hit, ...]], ...] = (
    (
        "C",
        7,
        ((0, 5), (0, 1), (5, 0), (5, 3), (5, 6), (2, 3), (2, 6),
         (4, 5), (4, 1)),
    ),
    (
        "D",
        6,
        ((0, 4), (0, 1), (4, 0), (4, 2), (4, 5), (1, 4), (1, 5),
         (3, 4), (3, 1), (3, 2)),
    ),
    (
        "E",
        6,
        ((0, 5), (0, 3), (4, 1), (4, 2), (1, 0), (1, 2), (1, 3),
         (2, 5), (2, 1)),
    ),
    (
        "F",
        7,
        ((0, 5), (0, 2), (5, 0), (5, 6), (5, 2), (1, 5), (1, 4),
         (3, 1), (3, 4), (3, 6)),
    ),
    (
        "G",
        6,
        ((0, 1), (0, 3), (1, 2), (1, 5), (2, 1), (2, 3), (4, 2),
         (4, 5)),
    ),
)


def legacy_var(center: int, point: int) -> int:
    if center == point:
        raise ValueError("a schema contains a self-hit")
    return 1 + center * 16 + point - (point > center)


def expected_family(order: tuple[int, ...], arity: int,
                    schema: tuple[Hit, ...]) -> set[Clause]:
    clauses: set[Clause] = set()
    for step in (1, -1):
        for cut in range(17):
            cycle = tuple(order[(cut + step * offset) % 17] for offset in range(17))
            for offsets in combinations(range(1, 17), arity - 1):
                points = (cycle[0], *(cycle[offset] for offset in offsets))
                clauses.add(tuple(sorted(
                    -legacy_var(points[center], points[point])
                    for center, point in schema
                )))
    return clauses


def read_header(stream: TextIO, path: Path) -> tuple[int, int]:
    fields = stream.readline().split()
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        raise ValueError(f"malformed DIMACS header: {path}")
    variables, clauses = map(int, fields[2:])
    return variables, clauses


def parse_clause(line: str, *, context: str) -> Clause:
    fields = tuple(map(int, line.split()))
    if not fields or fields[-1] != 0:
        raise ValueError(f"missing clause terminator: {context}")
    if len(fields) == 1:
        raise ValueError(f"empty clause: {context}")
    return fields[:-1]


def legacy_clause(clause: Clause, order_index: int, *, context: str) -> Clause:
    guard = -NAMED_ORDER_VARIABLES[order_index]
    if clause[0] != guard:
        raise ValueError(f"wrong named-order guard: {context}")
    converted: list[int] = []
    for literal in clause[1:]:
        if literal >= 0 or not 1 <= -literal <= 289:
            raise ValueError(f"non-hit schema literal {literal}: {context}")
        center, point = divmod(-literal - 1, 17)
        converted.append(-legacy_var(center, point))
    return tuple(sorted(converted))


def clause_digest(clauses: set[Clause]) -> str:
    digest = hashlib.sha256()
    for clause in sorted(clauses):
        digest.update((" ".join(map(str, clause)) + " 0\n").encode("ascii"))
    return digest.hexdigest()


def validate(base_path: Path, extended_path: Path) -> dict[str, object]:
    family_results: list[dict[str, object]] = []
    expected_total = BASE_CLAUSES + sum(
        2 * 2 * 17 * math.comb(16, arity - 1)
        for _name, arity, _schema in SCHEMAS
    )
    with base_path.open(encoding="ascii") as base, extended_path.open(
        encoding="ascii"
    ) as extended:
        base_header = read_header(base, base_path)
        extended_header = read_header(extended, extended_path)
        if base_header != (VARIABLES, BASE_CLAUSES):
            raise ValueError(f"unexpected base header: {base_header}")
        if extended_header != (VARIABLES, expected_total):
            raise ValueError(f"unexpected extended header: {extended_header}")

        for index in range(BASE_CLAUSES):
            base_line = base.readline()
            extended_line = extended.readline()
            if not base_line or base_line != extended_line:
                raise ValueError(f"base-prefix mismatch at clause {index + 1}")
        if base.readline():
            raise ValueError("base file contains extra clauses")

        for name, arity, schema in SCHEMAS:
            per_order_count = 2 * 17 * math.comb(16, arity - 1)
            for order_index, order in enumerate(ORDERS):
                observed: set[Clause] = set()
                for occurrence in range(per_order_count):
                    line = extended.readline()
                    if not line:
                        raise ValueError(f"truncated family {name}/{order_index}")
                    clause = parse_clause(
                        line, context=f"{name}/{order_index}/{occurrence}"
                    )
                    observed.add(legacy_clause(
                        clause, order_index,
                        context=f"{name}/{order_index}/{occurrence}",
                    ))
                expected = expected_family(order, arity, schema)
                if len(observed) != per_order_count:
                    raise ValueError(
                        f"duplicate clauses in family {name}/{order_index}: "
                        f"{len(observed)} != {per_order_count}"
                    )
                if observed != expected:
                    raise ValueError(f"semantic mismatch in family {name}/{order_index}")
                family_results.append({
                    "schema": name,
                    "named_order": order_index,
                    "clauses": len(observed),
                    "canonical_sha256": clause_digest(observed),
                    "legacy_order0_fixture": order_index == 0,
                })

        if extended.readline():
            raise ValueError("extended file contains extra clauses")

    return {
        "schema": "p97-exact17-lean-cdefg-export-validation/v1",
        "base_prefix_byte_identical": True,
        "variables": VARIABLES,
        "clauses": expected_total,
        "families": family_results,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base", type=Path, required=True)
    parser.add_argument("--extended", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    payload = json.dumps(
        validate(args.base, args.extended), indent=2, sort_keys=True
    ) + "\n"
    if args.report is None:
        print(payload, end="")
    else:
        args.report.write_text(payload, encoding="utf-8")
        print(f"validated exact-17 C--G export; report: {args.report}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
