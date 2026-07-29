#!/usr/bin/env python3
"""Strict rational metric/Kalmanson gate for one Boolean survivor."""

from __future__ import annotations

import argparse
import itertools
import json
import time
from pathlib import Path

import z3


def rational_string(value: z3.RatNumRef) -> str:
    return f"{value.numerator_as_long()}/{value.denominator_as_long()}"


def check_partition(
    *,
    n: int,
    raw_classes: dict[int, list[frozenset[int]]],
    timeout_ms: int,
) -> dict[str, object]:
    if n != 17:
        raise ValueError("this gate is fixed at n=17")

    class_of: dict[tuple[int, int], frozenset[int]] = {}
    for center, blocks in raw_classes.items():
        for block in blocks:
            for point in block:
                class_of[center, point] = block

    table = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left in range(n)
        for right in range(left + 1, n)
    }

    def dist(left: int, right: int) -> z3.ArithRef:
        if left == right:
            return z3.RealVal(0)
        return table[min(left, right), max(left, right)]

    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=0)

    # Homogeneity allows every strict finite slack and every nonzero
    # inter-class gap to be normalized simultaneously to at least one.
    for variable in table.values():
        solver.add(variable >= 1)

    for left, middle, right in itertools.combinations(range(n), 3):
        solver.add(dist(left, middle) + dist(middle, right) >= dist(left, right) + 1)
        solver.add(dist(left, right) + dist(middle, right) >= dist(left, middle) + 1)
        solver.add(dist(left, middle) + dist(left, right) >= dist(middle, right) + 1)

    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = dist(a, c) + dist(b, d)
        solver.add(diagonals >= dist(a, b) + dist(c, d) + 1)
        solver.add(diagonals >= dist(a, d) + dist(b, c) + 1)

    equality_count = 0
    disequality_count = 0
    tracked: dict[str, tuple[bool, int, int, int]] = {}
    for center in range(n):
        targets = tuple(point for point in range(n) if point != center)
        for left, right in itertools.combinations(targets, 2):
            if class_of[center, left] == class_of[center, right]:
                name = f"eq_{center}_{left}_{right}"
                solver.assert_and_track(
                    dist(center, left) == dist(center, right),
                    z3.Bool(name),
                )
                tracked[name] = (True, center, left, right)
                equality_count += 1
            else:
                name = f"neq_{center}_{left}_{right}"
                solver.assert_and_track(
                    z3.Or(
                        dist(center, left) >= dist(center, right) + 1,
                        dist(center, right) >= dist(center, left) + 1,
                    ),
                    z3.Bool(name),
                )
                tracked[name] = (False, center, left, right)
                disequality_count += 1

    started = time.monotonic()
    status = solver.check()
    result: dict[str, object] = {
        "schema": "p97-aligned-singleton-second-nonbisector-metric-gate-v1",
        "epistemic_status": "BOUNDED_RATIONAL_KALMANSON_CHECK_NOT_EUCLIDEAN_NOT_LEAN",
        "n": n,
        "status": str(status).upper(),
        "elapsed_seconds": time.monotonic() - started,
        "equality_constraint_count": equality_count,
        "disequality_constraint_count": disequality_count,
        "strict_triangle_count": 3 * len(list(itertools.combinations(range(n), 3))),
        "strict_kalmanson_count": 2 * len(list(itertools.combinations(range(n), 4))),
    }
    if status == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
    if status == z3.unsat:
        result["unsat_core"] = [
            {
                "equal": tracked[str(label)][0],
                "center": tracked[str(label)][1],
                "left": tracked[str(label)][2],
                "right": tracked[str(label)][3],
            }
            for label in solver.unsat_core()
        ]
    if status == z3.sat:
        model = solver.model()
        result["distances"] = {
            f"{left},{right}": rational_string(
                model.eval(variable, model_completion=True)
            )
            for (left, right), variable in table.items()
        }
    return result


def check(payload_path: Path, timeout_ms: int) -> dict[str, object]:
    payload = json.loads(payload_path.read_text(encoding="utf-8"))
    if payload.get("status") != "SAT":
        raise ValueError("input is not a SAT Boolean survivor")
    raw_classes = {
        int(center): [frozenset(block) for block in blocks]
        for center, blocks in payload["equality_classes"].items()
    }
    result = check_partition(
        n=int(payload["n"]),
        raw_classes=raw_classes,
        timeout_ms=timeout_ms,
    )
    result["input"] = str(payload_path)
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("payload", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    args = parser.parse_args()
    result = check(args.payload, args.timeout_ms)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "status": result["status"],
                "elapsed_seconds": result["elapsed_seconds"],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
