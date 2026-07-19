#!/usr/bin/env python3
"""CEGAR probe for the bare strong-connectivity/Kalmanson conjecture.

The Boolean layer contains only four non-self members per selected row and
strong connectivity.  The exact LRA checker is imported from ``cegar.py``.
Every refinement is the fully tracked row-membership antecedent of an LRA
UNSAT core, transported only by increasing embeddings and reversal.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location("generic_biapex_cegar", HERE / "cegar.py")
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("cannot load sibling cegar.py")
CEGAR = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(CEGAR)


def build_structural(
    n: int, timeout_ms: int, seed: int, global_ordinal_filter: bool
):
    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=seed)
    member = {
        (center, point): z3.Bool(f"m_{center}_{point}")
        for center in range(n)
        for point in range(n)
    }
    for center in range(n):
        solver.add(z3.Not(member[center, center]))
        solver.add(
            z3.Sum(
                *(z3.If(member[center, point], 1, 0) for point in range(n))
            )
            == 4
        )

    vertices = tuple(range(n))
    for size in range(1, n):
        for subset_tuple in itertools.combinations(vertices, size):
            subset = frozenset(subset_tuple)
            complement = tuple(point for point in vertices if point not in subset)
            solver.add(
                z3.Or(
                    *(
                        member[center, point]
                        for center in subset
                        for point in complement
                    )
                )
            )

    if global_ordinal_filter:
        def edge(left: int, right: int) -> tuple[int, int]:
            return tuple(sorted((left, right)))

        rank = {
            (left, right): z3.Real(f"rank_{left}_{right}")
            for left in range(n)
            for right in range(left + 1, n)
        }
        for center in range(n):
            others = tuple(point for point in range(n) if point != center)
            for first, second in itertools.combinations(others, 2):
                solver.add(
                    z3.Implies(
                        z3.And(member[center, first], member[center, second]),
                        rank[edge(center, first)] == rank[edge(center, second)],
                    )
                )

        def strict_if_row_pair(
            center: int,
            first: int,
            second: int,
            smaller: tuple[int, int],
            larger: tuple[int, int],
        ) -> None:
            solver.add(
                z3.Implies(
                    z3.And(member[center, first], member[center, second]),
                    rank[smaller] < rank[larger],
                )
            )

        for a, b, c, d in itertools.combinations(range(n), 4):
            strict_if_row_pair(a, b, c, edge(c, d), edge(b, d))
            strict_if_row_pair(d, b, c, edge(a, b), edge(a, c))
            strict_if_row_pair(b, a, d, edge(c, d), edge(a, c))
            strict_if_row_pair(c, a, d, edge(a, b), edge(b, d))
            strict_if_row_pair(a, c, d, edge(b, c), edge(b, d))
            strict_if_row_pair(b, c, d, edge(a, d), edge(a, c))
            strict_if_row_pair(c, a, b, edge(a, d), edge(b, d))
            strict_if_row_pair(d, a, b, edge(b, c), edge(a, c))
    return solver, member


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--wall-seconds", type=float, default=120.0)
    parser.add_argument("--outer-timeout-ms", type=int, default=10_000)
    parser.add_argument("--metric-timeout-ms", type=int, default=10_000)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--global-ordinal-filter", action="store_true")
    parser.add_argument("--resume", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    solver, member = build_structural(
        args.n, args.outer_timeout_ms, args.seed, args.global_ordinal_filter
    )
    started = time.monotonic()
    refinements: list[dict[str, object]] = []
    seen: set[tuple[int, tuple[tuple[int, int], ...]]] = set()
    result: dict[str, object]

    if args.resume is not None:
        prior = json.loads(args.resume.read_text(encoding="utf-8"))
        if prior.get("n") != args.n:
            raise RuntimeError("resume cardinality mismatch")
        for refinement in prior.get("refinements", []):
            core_vertex_count = len(refinement["full_metric_core_vertices"])
            schema = tuple(tuple(item) for item in refinement["order_schema"])
            reflected = tuple(
                sorted(
                    (core_vertex_count - 1 - center, core_vertex_count - 1 - point)
                    for center, point in schema
                )
            )
            schema_key = (core_vertex_count, min(schema, reflected))
            if schema_key in seen:
                continue
            seen.add(schema_key)
            for target_vertices in itertools.combinations(range(args.n), core_vertex_count):
                for oriented in {schema, reflected}:
                    transformed = {
                        (target_vertices[center], target_vertices[point])
                        for center, point in oriented
                    }
                    solver.add(
                        z3.Or(
                            *(z3.Not(member[center, point]) for center, point in sorted(transformed))
                        )
                    )
            refinements.append(refinement)

    for attempt in itertools.count(1):
        if time.monotonic() - started >= args.wall_seconds:
            result = {"status": "UNKNOWN", "reason": "wall budget"}
            break
        outer_status = solver.check()
        if outer_status != z3.sat:
            result = {
                "status": str(outer_status).upper(),
                "reason": solver.reason_unknown() if outer_status == z3.unknown else None,
            }
            break
        model = solver.model()
        rows = CEGAR.selected_rows(model, member, args.n)
        metric_status, centers, core_names, payload = CEGAR.metric_check(
            rows, args.n, args.metric_timeout_ms,
            started + args.wall_seconds
        )
        if metric_status == z3.sat:
            result = {
                "status": "SAT_VERIFIED_KALMANSON_SHADOW",
                "rows": {str(center): list(row) for center, row in rows.items()},
                "distances": payload,
            }
            break
        if metric_status == z3.unknown:
            result = {"status": "UNKNOWN", "reason": payload}
            break

        core_vertices = tuple(payload["core_vertices"])
        role = {vertex: index for index, vertex in enumerate(core_vertices)}
        schema = tuple(
            sorted(
                (role[center], role[point])
                for center, point in payload["required_memberships"]
            )
        )
        reflected = tuple(
            sorted(
                (len(core_vertices) - 1 - center, len(core_vertices) - 1 - point)
                for center, point in schema
            )
        )
        schema_key = (len(core_vertices), min(schema, reflected))
        if schema_key in seen:
            result = {"status": "UNKNOWN", "reason": "repeated tracked schema"}
            break
        seen.add(schema_key)

        cut_count = 0
        for target_vertices in itertools.combinations(range(args.n), len(core_vertices)):
            for oriented in {schema, reflected}:
                transformed = {
                    (target_vertices[center], target_vertices[point])
                    for center, point in oriented
                }
                solver.add(
                    z3.Or(
                        *(z3.Not(member[center, point]) for center, point in sorted(transformed))
                    )
                )
                cut_count += 1
        refinements.append(
            {
                "attempt": attempt,
                "dependency_centers": list(centers),
                "metric_core": list(core_names),
                "required_memberships": [list(item) for item in payload["required_memberships"]],
                "full_metric_core_vertices": list(core_vertices),
                "order_schema": [list(item) for item in schema_key[1]],
                "order_embedding_cut_count": cut_count,
            }
        )

    result.update(
        {
            "schema": "p97-bare-strong-connectivity-kalmanson-cegar-v1",
            "epistemic_status": "BOUNDED_THEOREM_DISCOVERY_NOT_LEAN_PROOF",
            "n": args.n,
            "seed": args.seed,
            "global_ordinal_filter": args.global_ordinal_filter,
            "elapsed_seconds": time.monotonic() - started,
            "refinement_count": len(refinements),
            "refinements": refinements,
        }
    )
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
