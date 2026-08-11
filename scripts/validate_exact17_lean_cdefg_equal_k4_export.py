"""Validate the Lean exact-17 C--G plus equal-K4 child export.

Lean is authoritative.  This independent standard-library checker verifies
that the child begins with the byte-identical checked C--G clauses and that
the complete suffix is exactly the Lean-enumerated equal-K4 family.
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

VARIABLES = 308
PARENT_CLAUSES = 2_189_852
EQUAL_K4_CLAUSES = 78_608
CHILD_CLAUSES = PARENT_CLAUSES + EQUAL_K4_CLAUSES


def load_parent_validator(path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location("exact17_cdefg_validator", path)
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


def expected_clause(a: int, b: int, c: int, d: int) -> Clause:
    return (
        -hit_var(b, a),
        -hit_var(b, d),
        -hit_var(c, a),
        -hit_var(c, b),
        -hit_var(c, d),
        -hit_var(d, a),
        -hit_var(d, b),
        -hit_var(d, c),
    )


def validate(
    base_path: Path,
    parent_path: Path,
    child_path: Path,
    parent_validator_path: Path,
) -> dict[str, object]:
    parent_validator = load_parent_validator(parent_validator_path)
    parent_report = parent_validator.validate(base_path, parent_path)

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

        for a in range(17):
            for b in range(17):
                for c in range(17):
                    for d in range(17):
                        if d == a:
                            continue
                        line = child.readline()
                        if not line:
                            raise ValueError(
                                f"truncated equal-K4 suffix at {a,b,c,d}"
                            )
                        observed = parse_clause(
                            line, context=f"equal-K4/{a}/{b}/{c}/{d}"
                        )
                        expected = expected_clause(a, b, c, d)
                        if observed != expected:
                            raise ValueError(
                                f"equal-K4 mismatch at {a,b,c,d}: "
                                f"{observed} != {expected}"
                            )
                        digest.update(line.encode("ascii"))
                        observed_suffix += 1

        if child.readline():
            raise ValueError("child file contains extra clauses")

    if observed_suffix != EQUAL_K4_CLAUSES:
        raise ValueError(
            f"wrong equal-K4 count: {observed_suffix} != {EQUAL_K4_CLAUSES}"
        )
    return {
        "schema": "p97-exact17-lean-cdefg-equal-k4-export-validation/v1",
        "parent": parent_report,
        "parent_prefix_byte_identical": True,
        "variables": VARIABLES,
        "clauses": CHILD_CLAUSES,
        "equal_k4_clauses": observed_suffix,
        "equal_k4_suffix_sha256": digest.hexdigest(),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base", type=Path, required=True)
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--child", type=Path, required=True)
    parser.add_argument("--parent-validator", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    report = validate(
        args.base, args.parent, args.child, args.parent_validator
    )
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
