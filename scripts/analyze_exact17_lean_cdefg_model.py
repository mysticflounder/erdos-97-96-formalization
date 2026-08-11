"""Replay and decode a PIQD model for the checked exact-17 C--G CNF."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

AUTHORIZED_SHA256 = "763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527"
VARIABLE_COUNT = 308
CLAUSE_COUNT = 2_189_852
POINT_COUNT = 17


def reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_assignment(path: Path) -> dict[int, bool]:
    payload = json.loads(path.read_text(), object_pairs_hook=reject_duplicate_keys)
    raw = payload.get("assignment")
    if not isinstance(raw, list):
        raise TypeError("model must contain an assignment list")
    assignment: dict[int, bool] = {}
    for literal in raw:
        if not isinstance(literal, int) or isinstance(literal, bool) or literal == 0:
            raise ValueError(f"invalid assignment literal: {literal!r}")
        variable = abs(literal)
        if variable in assignment:
            raise ValueError(f"duplicate assignment for variable {variable}")
        assignment[variable] = literal > 0
    expected = set(range(1, VARIABLE_COUNT + 1))
    if set(assignment) != expected:
        missing = sorted(expected - set(assignment))
        extra = sorted(set(assignment) - expected)
        raise ValueError(f"assignment is not total: missing={missing}, extra={extra}")
    return assignment


def replay_cnf(
    path: Path,
    assignment: dict[int, bool],
    *,
    authorized_sha256: str,
    clause_count: int,
) -> tuple[str, int, int]:
    digest = hashlib.sha256()
    variables: int | None = None
    declared_clauses: int | None = None
    observed_clauses = 0
    pending: list[int] = []

    with path.open("rb") as handle:
        for line_number, raw_line in enumerate(handle, start=1):
            digest.update(raw_line)
            line = raw_line.decode("ascii").strip()
            if not line or line.startswith("c"):
                continue
            if line.startswith("p"):
                parts = line.split()
                if parts[:2] != ["p", "cnf"] or len(parts) != 4 or variables is not None:
                    raise ValueError(f"invalid DIMACS header at line {line_number}")
                variables, declared_clauses = int(parts[2]), int(parts[3])
                continue
            if variables is None:
                raise ValueError(f"clause before DIMACS header at line {line_number}")
            for token in line.split():
                literal = int(token)
                if literal == 0:
                    if not pending:
                        raise ValueError(f"empty clause at line {line_number}")
                    if not any(assignment[abs(item)] == (item > 0) for item in pending):
                        raise ValueError(
                            f"assignment falsifies clause {observed_clauses + 1}: {pending}"
                        )
                    observed_clauses += 1
                    pending.clear()
                else:
                    if abs(literal) > variables:
                        raise ValueError(f"literal out of range at line {line_number}: {literal}")
                    pending.append(literal)

    if pending:
        raise ValueError("unterminated final clause")
    if variables != VARIABLE_COUNT or declared_clauses != clause_count:
        raise ValueError(
            f"unexpected header: variables={variables}, clauses={declared_clauses}"
        )
    if observed_clauses != declared_clauses:
        raise ValueError(
            f"clause count mismatch: declared={declared_clauses}, observed={observed_clauses}"
        )
    actual_sha = digest.hexdigest()
    if actual_sha != authorized_sha256:
        raise ValueError(f"unauthorized CNF SHA-256: {actual_sha}")
    return actual_sha, variables, observed_clauses


def decode(assignment: dict[int, bool]) -> dict[str, Any]:
    rows = {
        str(center): [
            point
            for point in range(POINT_COUNT)
            if assignment[1 + POINT_COUNT * center + point]
        ]
        for center in range(POINT_COUNT)
    }
    diagonal_hits = [center for center in range(POINT_COUNT) if center in rows[str(center)]]
    next_centers = [center for center in range(POINT_COUNT) if assignment[290 + center]]
    named_orders = [order for order in range(2) if assignment[307 + order]]
    return {
        "rows": rows,
        "row_sizes": {center: len(points) for center, points in rows.items()},
        "diagonal_hits": diagonal_hits,
        "next_centers": next_centers,
        "named_orders": named_orders,
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--authorized-sha256", default=AUTHORIZED_SHA256)
    parser.add_argument("--clause-count", type=int, default=CLAUSE_COUNT)
    parser.add_argument("--output", type=Path)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    assignment = load_assignment(args.model)
    sha256, variables, clauses = replay_cnf(
        args.cnf,
        assignment,
        authorized_sha256=args.authorized_sha256,
        clause_count=args.clause_count,
    )
    result = {
        "status": "PASS",
        "cnf_sha256": sha256,
        "variables": variables,
        "clauses": clauses,
        **decode(assignment),
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")
        print(json.dumps({"status": "PASS", "output": str(args.output)}))


if __name__ == "__main__":
    main()
