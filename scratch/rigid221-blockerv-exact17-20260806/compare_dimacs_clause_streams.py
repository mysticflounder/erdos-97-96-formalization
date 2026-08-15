#!/usr/bin/env python3
"""Compare two DIMACS formulas by their exact ordered clause streams."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from itertools import zip_longest
from pathlib import Path


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def load_uploader(path: Path):  # type: ignore[no-untyped-def]
    spec = importlib.util.spec_from_file_location("piqd_dimacs_uploader", path)
    if spec is None or spec.loader is None:
        raise ValueError("cannot load the DIMACS parser")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("left", type=Path)
    parser.add_argument("right", type=Path)
    args = parser.parse_args()

    script_dir = Path(__file__).resolve().parent
    uploader = load_uploader(script_dir / "upload_dimacs_to_piqd_session.py")
    left = args.left.resolve()
    right = args.right.resolve()
    left_vars, left_count, left_clauses = uploader.dimacs_clauses(left)
    right_vars, right_count, right_clauses = uploader.dimacs_clauses(right)
    if (left_vars, left_count) != (right_vars, right_count):
        raise ValueError("DIMACS dimensions differ")

    sentinel = object()
    seen = 0
    max_var = 0
    for seen, (left_clause, right_clause) in enumerate(
        zip_longest(left_clauses, right_clauses, fillvalue=sentinel), start=1
    ):
        if left_clause != right_clause:
            raise ValueError(f"ordered clause streams differ at clause {seen}")
        if left_clause is sentinel:
            raise AssertionError("equal exhausted iterators produced a sentinel pair")
        max_var = max(
            max_var,
            max((abs(literal) for literal in left_clause), default=0),
        )
    if seen != left_count:
        raise AssertionError("DIMACS parser count disagrees with the comparison")

    print(
        json.dumps(
            {
                "status": "PASS",
                "variables": left_vars,
                "clauses": left_count,
                "max_var": max_var,
                "left_sha256": sha256(left),
                "right_sha256": sha256(right),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
