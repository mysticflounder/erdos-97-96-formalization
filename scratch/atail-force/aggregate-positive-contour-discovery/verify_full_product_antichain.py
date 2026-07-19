#!/usr/bin/env python3
"""Independent replay for a full-product-antichain finite-search artifact."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
from collections import Counter
from pathlib import Path


Arc = tuple[int, int]


def circular_intervals(n: int) -> tuple[frozenset[int], ...]:
    return tuple(
        frozenset(range(left + 1, right + 1))
        for left in range(n)
        for right in range(left + 2, n)
        if not (left == 0 and right == n - 1)
    )


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def verify_certificate(
    n: int,
    intervals: tuple[frozenset[int], ...],
    raw: dict[str, object],
) -> frozenset[Arc]:
    changed_rows = raw["changed_rows"]
    assert isinstance(changed_rows, list) and changed_rows
    left: dict[int, int] = {}
    right: dict[int, int] = {}
    for entry in changed_rows:
        assert isinstance(entry, list) and len(entry) == 3
        center, left_target, right_target = map(int, entry)
        assert 0 <= center < n
        assert 0 <= left_target < n and 0 <= right_target < n
        assert center not in (left_target, right_target)
        assert left_target != right_target
        assert center not in left
        left[center] = left_target
        right[center] = right_target

    left_multiplicity = Counter(left.values())
    right_multiplicity = Counter(right.values())
    assert left_multiplicity == right_multiplicity
    difference = tuple(
        sum(c in interval and x not in interval for c, x in left.items())
        - sum(c in interval and x not in interval for c, x in right.items())
        for interval in intervals
    )
    assert difference == tuple(map(int, raw["profile_difference"]))  # type: ignore[arg-type]
    assert any(difference)
    assert all(value >= 0 for value in difference) or all(
        value <= 0 for value in difference
    )

    support = frozenset(
        (center, target)
        for center in left
        for target in (left[center], right[center])
    )
    saved_support = frozenset(
        tuple(map(int, entry)) for entry in raw["support"]  # type: ignore[arg-type]
    )
    assert support == saved_support
    return support


def base_clauses(n: int, variable: dict[Arc, int]) -> list[tuple[int, ...]]:
    clauses: list[tuple[int, ...]] = []
    for center in range(n):
        row = [variable[center, target] for target in range(n) if target != center]
        clauses.extend(
            tuple(-literal for literal in chosen)
            for chosen in itertools.combinations(row, 5)
        )
        clauses.extend(
            tuple(chosen) for chosen in itertools.combinations(row, n - 4)
        )

    for quadruple in itertools.combinations(range(n), 4):
        a, b, c, d = quadruple
        alternating = {frozenset((a, c)), frozenset((b, d))}
        vertices = frozenset(quadruple)
        for center_pair in itertools.combinations(quadruple, 2):
            centers = frozenset(center_pair)
            if centers in alternating:
                continue
            targets = vertices - centers
            center_left, center_right = sorted(centers)
            target_left, target_right = sorted(targets)
            clauses.append(
                (
                    -variable[center_left, target_left],
                    -variable[center_left, target_right],
                    -variable[center_right, target_left],
                    -variable[center_right, target_right],
                )
            )

    vertices = tuple(range(n))
    for size in range(1, n):
        for tail in itertools.combinations(vertices[1:], size - 1):
            subset = frozenset((0, *tail))
            if len(subset) == n:
                continue
            complement = frozenset(vertices) - subset
            clauses.append(
                tuple(
                    variable[source, target]
                    for source in subset
                    for target in complement
                )
            )
            clauses.append(
                tuple(
                    variable[source, target]
                    for source in complement
                    for target in subset
                )
            )
    return clauses


def parse_dimacs(path: Path) -> tuple[int, list[tuple[int, ...]]]:
    variable_count = -1
    expected_clause_count = -1
    clauses: list[tuple[int, ...]] = []
    for line in path.read_text(encoding="ascii").splitlines():
        if not line or line.startswith("c"):
            continue
        if line.startswith("p "):
            marker, kind, variables, count = line.split()
            assert marker == "p" and kind == "cnf"
            variable_count = int(variables)
            expected_clause_count = int(count)
            continue
        literals = tuple(map(int, line.split()))
        assert literals and literals[-1] == 0
        clauses.append(literals[:-1])
    assert variable_count >= 0
    assert len(clauses) == expected_clause_count
    assert all(0 < abs(literal) <= variable_count for clause in clauses for literal in clause)
    return variable_count, clauses


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("artifact", type=Path)
    parser.add_argument("cnf", type=Path)
    parser.add_argument("drat", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    artifact = json.loads(args.artifact.read_text(encoding="utf-8"))
    assert artifact["schema"] == "p97-full-four-row-product-antichain-cegar-v1"
    assert artifact["terminal"]["status"] == "EXHAUSTIVE_SMALL_N_UNSAT_EXTERNAL_Z3"
    n = int(artifact["n"])
    intervals = circular_intervals(n)
    certificates = artifact["cut_certificates"]
    assert isinstance(certificates, list)
    supports = [
        verify_certificate(n, intervals, certificate)
        for certificate in certificates
    ]
    assert len(supports) == len(set(supports))
    assert len(supports) == int(artifact["learned_comparable_support_cuts"])

    variable = {
        arc: index
        for index, arc in enumerate(
            ((center, target) for center in range(n) for target in range(n) if center != target),
            start=1,
        )
    }
    expected = base_clauses(n, variable)
    expected.extend(tuple(-variable[arc] for arc in sorted(support)) for support in supports)
    dimacs_variable_count, actual = parse_dimacs(args.cnf)
    assert dimacs_variable_count == len(variable)
    assert Counter(actual) == Counter(expected)
    assert sha256(args.cnf) == artifact["dimacs"]["sha256"]

    checked = subprocess.run(
        ["drat-trim", str(args.cnf), str(args.drat)],
        capture_output=True,
        text=True,
        timeout=60,
        check=False,
    )
    assert checked.returncode == 0
    assert "s VERIFIED" in checked.stdout.splitlines()

    support_sizes = Counter(len(support) for support in supports)
    payload = {
        "schema": "p97-full-four-row-product-antichain-replay-v1",
        "status": "VERIFIED",
        "n": n,
        "cut_certificate_count": len(certificates),
        "cut_support_size_histogram": {
            str(size): count for size, count in sorted(support_sizes.items())
        },
        "cnf_variable_count": dimacs_variable_count,
        "cnf_clause_count": len(actual),
        "artifact_sha256": sha256(args.artifact),
        "cnf_sha256": sha256(args.cnf),
        "drat_sha256": sha256(args.drat),
        "drat_trim_terminal": "s VERIFIED",
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
