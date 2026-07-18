#!/usr/bin/env python3
"""Exact Boolean cross-check of the selected-pair alternation surface."""

from __future__ import annotations

import argparse
import itertools
import json
import time
from pathlib import Path

import z3


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--connectivity", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    n = args.n
    if n < 5:
        raise ValueError("n must be at least five")

    started = time.monotonic()
    solver = z3.Solver()
    solver.set(timeout=args.timeout_ms, random_seed=0)
    member = {
        (center, point): z3.Bool(f"m_{center}_{point}")
        for center in range(n)
        for point in range(n)
        if point != center
    }
    for center in range(n):
        solver.add(
            z3.PbEq(
                [(member[center, point], 1) for point in range(n) if point != center],
                4,
            )
        )

    alternation_clause_count = 0
    for quadruple in itertools.combinations(range(n), 4):
        a, b, c, d = quadruple
        alternating = {frozenset((a, c)), frozenset((b, d))}
        vertices = frozenset(quadruple)
        for centers_tuple in itertools.combinations(quadruple, 2):
            centers = frozenset(centers_tuple)
            if centers in alternating:
                continue
            targets = vertices - centers
            center_left, center_right = sorted(centers)
            target_left, target_right = sorted(targets)
            solver.add(
                z3.Or(
                    z3.Not(member[center_left, target_left]),
                    z3.Not(member[center_left, target_right]),
                    z3.Not(member[center_right, target_left]),
                    z3.Not(member[center_right, target_right]),
                )
            )
            alternation_clause_count += 1

    connectivity_clause_count = 0
    if args.connectivity:
        vertices = tuple(range(n))
        for size in range(1, n):
            for tail in itertools.combinations(vertices[1:], size - 1):
                subset = frozenset((0, *tail))
                if len(subset) == n:
                    continue
                complement = frozenset(vertices) - subset
                solver.add(
                    z3.Or(
                        [member[source, target] for source in subset for target in complement]
                    ),
                    z3.Or(
                        [member[source, target] for source in complement for target in subset]
                    ),
                )
                connectivity_clause_count += 2

    status = solver.check()
    payload: dict[str, object] = {
        "schema": "p97-four-row-selected-pair-alternation-decision-v1",
        "epistemic_status": "EXACT_IF_SAT_EXTERNAL_SMT_IF_UNSAT",
        "n": n,
        "connectivity": args.connectivity,
        "status": str(status).upper(),
        "alternation_clause_count": alternation_clause_count,
        "connectivity_clause_count": connectivity_clause_count,
        "elapsed_seconds": time.monotonic() - started,
        "solver_statistics": str(solver.statistics()),
    }
    if status == z3.sat:
        model = solver.model()
        rows = {
            center: tuple(
                point
                for point in range(n)
                if point != center
                and z3.is_true(model.eval(member[center, point], model_completion=True))
            )
            for center in range(n)
        }
        assert all(len(row) == 4 for row in rows.values())
        for quadruple in itertools.combinations(range(n), 4):
            a, b, c, d = quadruple
            alternating = {frozenset((a, c)), frozenset((b, d))}
            vertices = frozenset(quadruple)
            for centers_tuple in itertools.combinations(quadruple, 2):
                centers = frozenset(centers_tuple)
                if centers in alternating:
                    continue
                targets = vertices - centers
                assert not all(targets <= frozenset(rows[center]) for center in centers)
        payload["verified_rows"] = {
            str(center): list(row) for center, row in rows.items()
        }
    elif status == z3.unknown:
        payload["reason"] = solver.reason_unknown()
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
