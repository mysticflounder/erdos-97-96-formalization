#!/usr/bin/env python3
"""Check three-row equality-triangle subcores in a transported schema bank.

For each FULL_LRA schema, choose three centers and one two-member equality per
center whose three member pairs are the edges of a triangle.  Check that
subpattern alone against the complete normalized strict Kalmanson + triangle +
positivity LRA system on the schema's ordered core vertices.

This is an exact bounded LRA audit, not an arbitrary-cardinality proof.
"""

from __future__ import annotations

import argparse
import collections
import importlib.util
import itertools
import json
import sys
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
CEGAR_PATH = HERE.parent / "cegar.py"
sys.path.insert(0, str(CEGAR_PATH.parent))
SPEC = importlib.util.spec_from_file_location("schema_shape_cegar", CEGAR_PATH)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"cannot load {CEGAR_PATH}")
CEGAR = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(CEGAR)


def canonical_order_type(
    n: int,
    centers: tuple[int, int, int],
    pairs: tuple[tuple[int, int], tuple[int, int], tuple[int, int]],
) -> str:
    terminals = sorted(set().union(*(set(pair) for pair in pairs)))
    center_by_missing_terminal: dict[int, int] = {}
    for center, pair in zip(centers, pairs, strict=True):
        missing = [index for index, point in enumerate(terminals) if point not in pair]
        if len(missing) != 1:
            raise ValueError("not an equality triangle")
        center_by_missing_terminal[missing[0]] = center

    words = []
    for permutation in itertools.permutations(range(3)):
        tokens = []
        for vertex in range(n):
            token = []
            for old_index, center in center_by_missing_terminal.items():
                if vertex == center:
                    token.append(f"C{permutation[old_index]}")
            for old_index, point in enumerate(terminals):
                if vertex == point:
                    token.append(f"X{permutation[old_index]}")
            if token:
                tokens.append("".join(sorted(token)))
        words.append("|".join(tokens))
        words.append("|".join(reversed(tokens)))
    return min(words)


def triangle_witnesses(schema: dict[str, Any]):
    by_center: dict[int, set[int]] = collections.defaultdict(set)
    for center, point in schema["order_schema"]:
        by_center[center].add(point)
    for centers in itertools.combinations(by_center, 3):
        choices = (
            tuple(itertools.combinations(sorted(by_center[center]), 2))
            for center in centers
        )
        for pairs in itertools.product(*choices):
            terminals = set().union(*(set(pair) for pair in pairs))
            if len(terminals) != 3:
                continue
            if len({frozenset(pair) for pair in pairs}) != 3:
                continue
            yield centers, pairs


def check_subcore(
    n: int,
    centers: tuple[int, int, int],
    pairs: tuple[tuple[int, int], tuple[int, int], tuple[int, int]],
    timeout_ms: int,
) -> str:
    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    table = CEGAR.distance_table(n)
    dist = lambda left, right: CEGAR.dist(table, left, right)

    for variable in table.values():
        solver.add(variable >= 1)
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = dist(a, c) + dist(b, d)
        solver.add(diagonals >= dist(a, b) + dist(c, d) + 1)
        solver.add(diagonals >= dist(a, d) + dist(b, c) + 1)
    for a, b, c in itertools.combinations(range(n), 3):
        solver.add(dist(a, b) + dist(b, c) >= dist(a, c))
        solver.add(dist(a, c) + dist(b, c) >= dist(a, b))
        solver.add(dist(a, b) + dist(a, c) >= dist(b, c))
    for center, (first, second) in zip(centers, pairs, strict=True):
        solver.add(dist(center, first) == dist(center, second))
    return str(solver.check()).upper()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bank", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    results = []
    full_schema_count = 0
    schema_with_triangle_count = 0
    for schema_index, schema in enumerate(bank["schemas"]):
        if not any(item["kind"] == "FULL_LRA" for item in schema["provenance"]):
            continue
        full_schema_count += 1
        witnesses = list(triangle_witnesses(schema))
        if witnesses:
            schema_with_triangle_count += 1
        for centers, pairs in witnesses:
            results.append(
                {
                    "schema_index": schema_index,
                    "core_vertex_count": schema["core_vertex_count"],
                    "centers": list(centers),
                    "pairs": [list(pair) for pair in pairs],
                    "canonical_order_type": canonical_order_type(
                        schema["core_vertex_count"], centers, pairs
                    ),
                    "status": check_subcore(
                        schema["core_vertex_count"], centers, pairs, args.timeout_ms
                    ),
                }
            )

    status_by_order_type: dict[str, set[str]] = collections.defaultdict(set)
    schemas_by_order_type: dict[str, set[int]] = collections.defaultdict(set)
    for result in results:
        order_type = result["canonical_order_type"]
        status_by_order_type[order_type].add(result["status"])
        schemas_by_order_type[order_type].add(result["schema_index"])
    order_types = {
        order_type: {
            "statuses": sorted(status_by_order_type[order_type]),
            "schema_count": len(schemas_by_order_type[order_type]),
            "schema_indices": sorted(schemas_by_order_type[order_type]),
        }
        for order_type in sorted(status_by_order_type)
    }
    payload = {
        "schema": "p97-full-lra-equality-triangle-subcore-audit-v1",
        "epistemic_status": "EXACT_BOUNDED_LRA_NOT_UNIFORM_LEAN_COVERAGE",
        "source": str(args.bank),
        "full_lra_schema_count": full_schema_count,
        "schema_with_triangle_count": schema_with_triangle_count,
        "triangle_witness_count": len(results),
        "status_histogram": dict(
            sorted(collections.Counter(result["status"] for result in results).items())
        ),
        "order_type_count": len(order_types),
        "order_types": order_types,
        "results": results,
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
