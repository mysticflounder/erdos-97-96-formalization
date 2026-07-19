#!/usr/bin/env python3
"""CEGAR search for a whole-carrier bi-apex Kalmanson shadow.

The outer solver chooses the complete selected-row/blocker incidence system.
Each decoded row system is checked by an independent linear-real-arithmetic
solver containing every strict Kalmanson inequality, positivity, triangle
inequalities, and all selected-row equalities.  An infeasible row system is
cut on the exact row memberships used by a minimized, fully tracked LRA core.
The cut is transported only through order embeddings of the core's complete
vertex set, including auxiliary vertices used by its metric inequalities.

This is bounded theorem discovery.  SAT is an abstract Kalmanson-metric
shadow, not a Euclidean realization.  Exhaustion is not a Lean proof.
"""

from __future__ import annotations

import argparse
import itertools
import json
import time
from fractions import Fraction
from pathlib import Path

import z3

from payload_verifier import verify_payload


def selected_rows(
    model: z3.ModelRef,
    member: dict[tuple[int, int], z3.BoolRef],
    n: int,
) -> dict[int, tuple[int, ...]]:
    rows = {}
    for center in range(n):
        support = tuple(
            point
            for point in range(n)
            if z3.is_true(model.eval(member[center, point], model_completion=True))
        )
        if len(support) != 4 or center in support:
            raise RuntimeError(f"invalid decoded row at {center}: {support}")
        rows[center] = support
    return rows


def build_structural(
    n: int, second_apex: int, timeout_ms: int, random_seed: int = 0
):
    if n < 5:
        raise ValueError("a four-point row requires at least five carrier vertices")
    if not 0 < second_apex < n:
        raise ValueError("second apex must differ from zero and lie in range")
    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=random_seed)
    member = {
        (center, point): z3.Bool(f"m_{center}_{point}")
        for center in range(n)
        for point in range(n)
    }
    blocker = {
        (source, center): z3.Bool(f"b_{source}_{center}")
        for source in range(n)
        for center in range(n)
    }

    for center in range(n):
        solver.add(z3.Not(member[center, center]))
        solver.add(
            z3.Sum(
                *(z3.If(member[center, point], 1, 0) for point in range(n))
            )
            == 4
        )

    for left, right in itertools.combinations(range(n), 2):
        solver.add(
            z3.Sum(
                *(
                    z3.If(z3.And(member[left, p], member[right, p]), 1, 0)
                    for p in range(n)
                )
            )
            <= 2
        )

    for first, second in itertools.combinations(range(n), 2):
        solver.add(
            z3.Sum(
                *(
                    z3.If(
                        z3.And(member[center, first], member[center, second]),
                        1,
                        0,
                    )
                    for center in range(n)
                )
            )
            <= 2
        )

    # If two distinct boundary centers bisect the same pair, the center chord
    # and point chord lie on one perpendicular-bisector line and their four
    # endpoints must alternate around the strictly convex boundary.  This is
    # the Boolean form of the ubiquitous two-row Kalmanson core.
    def in_open_interval(left: int, point: int, right: int) -> bool:
        return left < point < right

    for center_left, center_right in itertools.combinations(range(n), 2):
        remaining = tuple(
            point
            for point in range(n)
            if point not in {center_left, center_right}
        )
        for point_left, point_right in itertools.combinations(remaining, 2):
            alternates = in_open_interval(
                center_left, point_left, center_right
            ) != in_open_interval(center_left, point_right, center_right)
            if alternates:
                continue
            solver.add(
                z3.Not(
                    z3.And(
                        member[center_left, point_left],
                        member[center_left, point_right],
                        member[center_right, point_left],
                        member[center_right, point_right],
                    )
                )
            )

    vertices = tuple(range(n))
    for size in range(1, n):
        for subset_tuple in itertools.combinations(vertices, size):
            subset = frozenset(subset_tuple)
            complement = tuple(p for p in vertices if p not in subset)
            solver.add(
                z3.Or(
                    *(
                        member[center, point]
                        for center in subset
                        for point in complement
                    )
                )
            )

    for source in range(n):
        allowed = tuple(
            center
            for center in range(n)
            if center not in {source, 0, second_apex}
        )
        solver.add(z3.PbEq([(blocker[source, center], 1) for center in allowed], 1))
        for center in range(n):
            if center not in allowed:
                solver.add(z3.Not(blocker[source, center]))
            else:
                solver.add(
                    z3.Implies(blocker[source, center], member[center, source])
                )

    return solver, member, blocker


def distance_table(n: int) -> dict[tuple[int, int], z3.ArithRef]:
    return {
        (i, j): z3.Real(f"d_{i}_{j}")
        for i in range(n)
        for j in range(i + 1, n)
    }


def dist(
    table: dict[tuple[int, int], z3.ArithRef], left: int, right: int
) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0)
    return table[tuple(sorted((left, right)))]


def bounded_timeout_ms(timeout_ms: int, deadline: float) -> int | None:
    remaining_ms = int((deadline - time.monotonic()) * 1000)
    if remaining_ms <= 0:
        return None
    return max(1, min(timeout_ms, remaining_ms))


def metric_check(
    rows: dict[int, tuple[int, ...]],
    n: int,
    timeout_ms: int,
    deadline: float,
    random_seed: int = 0,
):
    solver = z3.Solver()
    solver.set(random_seed=random_seed)
    table = distance_table(n)
    tracked: dict[str, dict[str, object]] = {}

    def track(
        name: str,
        formula: z3.BoolRef,
        kind: str,
        vertices: tuple[int, ...],
        row_equality: tuple[int, int, int] | None = None,
    ) -> None:
        if name in tracked:
            raise RuntimeError(f"duplicate metric constraint name: {name}")
        tracked[name] = {
            "kind": kind,
            "vertices": vertices,
            "row_equality": row_equality,
            "formula": formula,
        }
        solver.assert_and_track(formula, z3.Bool(name))

    # The genuine metric has finitely many positive distances and strict
    # Kalmanson slacks, so homogeneity lets one scale all of them to at least
    # one simultaneously.
    for (left, right), variable in table.items():
        track(
            f"pos_{left}_{right}",
            variable >= 1,
            "positivity",
            (left, right),
        )

    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = dist(table, a, c) + dist(table, b, d)
        track(
            f"kal1_{a}_{b}_{c}_{d}",
            diagonals >= dist(table, a, b) + dist(table, c, d) + 1,
            "kalmanson_diagonals_vs_ab_cd",
            (a, b, c, d),
        )
        track(
            f"kal2_{a}_{b}_{c}_{d}",
            diagonals >= dist(table, a, d) + dist(table, b, c) + 1,
            "kalmanson_diagonals_vs_ad_bc",
            (a, b, c, d),
        )

    for a, b, c in itertools.combinations(range(n), 3):
        track(
            f"tri0_{a}_{b}_{c}",
            dist(table, a, b) + dist(table, b, c) >= dist(table, a, c),
            "triangle_ab_bc_ac",
            (a, b, c),
        )
        track(
            f"tri1_{a}_{b}_{c}",
            dist(table, a, c) + dist(table, b, c) >= dist(table, a, b),
            "triangle_ac_bc_ab",
            (a, b, c),
        )
        track(
            f"tri2_{a}_{b}_{c}",
            dist(table, a, b) + dist(table, a, c) >= dist(table, b, c),
            "triangle_ab_ac_bc",
            (a, b, c),
        )

    for center, support in rows.items():
        anchor = support[0]
        for point in support[1:]:
            name = f"row_{center}_{anchor}_{point}"
            track(
                name,
                dist(table, center, point) == dist(table, center, anchor),
                "row_equality",
                (center, anchor, point),
                (center, anchor, point),
            )

    check_timeout = bounded_timeout_ms(timeout_ms, deadline)
    if check_timeout is None:
        return z3.unknown, (), (), "wall budget"
    solver.set(timeout=check_timeout)
    status = solver.check()
    if status == z3.unsat:
        core_names_list = [str(item) for item in solver.unsat_core()]
        changed = True
        while changed:
            changed = False
            for name in tuple(core_names_list):
                check_timeout = bounded_timeout_ms(timeout_ms, deadline)
                if check_timeout is None:
                    break
                candidate = [item for item in core_names_list if item != name]
                minimizer = z3.Solver()
                minimizer.set(timeout=check_timeout, random_seed=random_seed)
                minimizer.add(*(tracked[item]["formula"] for item in candidate))
                candidate_status = minimizer.check()
                if candidate_status == z3.unsat:
                    core_names_list = candidate
                    changed = True
        core_names = tuple(core_names_list)
        core_equalities = tuple(
            tracked[name]["row_equality"]
            for name in core_names
            if tracked[name]["row_equality"] is not None
        )
        centers = tuple(sorted({center for center, _a, _p in core_equalities}))
        if not centers:
            raise RuntimeError("Kalmanson base unexpectedly UNSAT without rows")
        required_memberships = tuple(
            sorted(
                {
                    (center, endpoint)
                    for center, anchor, point in core_equalities
                    for endpoint in (anchor, point)
                }
            )
        )
        core_vertices = tuple(
            sorted(
                {
                    int(vertex)
                    for name in core_names
                    for vertex in tracked[name]["vertices"]
                }
            )
        )
        return (
            status,
            centers,
            core_names,
            {
                "required_memberships": required_memberships,
                "core_vertices": core_vertices,
                "constraint_kinds": [tracked[name]["kind"] for name in core_names],
            },
        )
    if status == z3.sat:
        model = solver.model()
        distances = {
            f"{left},{right}": str(model.eval(variable, model_completion=True))
            for (left, right), variable in table.items()
        }
        return status, (), (), distances
    return status, (), (), solver.reason_unknown()


def blocker_values(
    model: z3.ModelRef,
    blocker: dict[tuple[int, int], z3.BoolRef],
    n: int,
) -> dict[str, int]:
    answer = {}
    for source in range(n):
        chosen = [
            center
            for center in range(n)
            if z3.is_true(model.eval(blocker[source, center], model_completion=True))
        ]
        if len(chosen) != 1:
            raise RuntimeError(f"invalid blocker choice at {source}: {chosen}")
        answer[str(source)] = chosen[0]
    return answer


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--second-apex", type=int, required=True)
    parser.add_argument("--wall-seconds", type=float, default=120.0)
    parser.add_argument("--outer-timeout-ms", type=int, default=10_000)
    parser.add_argument("--metric-timeout-ms", type=int, default=10_000)
    parser.add_argument("--max-refinements", type=int, default=100_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--summary-only", action="store_true")
    args = parser.parse_args()
    if args.wall_seconds <= 0:
        raise SystemExit("wall-seconds must be positive")
    if args.outer_timeout_ms <= 0 or args.metric_timeout_ms <= 0:
        raise SystemExit("solver timeouts must be positive")

    started = time.monotonic()
    deadline = started + args.wall_seconds
    solver, member, blocker = build_structural(
        args.n, args.second_apex, args.outer_timeout_ms, args.random_seed
    )
    refinements: list[dict[str, object]] = []
    seen_order_schemas: set[tuple[int, tuple[tuple[int, int], ...]]] = set()
    result: dict[str, object] | None = None

    for attempt in range(1, args.max_refinements + 1):
        outer_timeout = bounded_timeout_ms(args.outer_timeout_ms, deadline)
        if outer_timeout is None:
            result = {"status": "UNKNOWN", "reason": "wall budget"}
            break
        solver.set(timeout=outer_timeout)
        outer_status = solver.check()
        if outer_status != z3.sat:
            reason = solver.reason_unknown() if outer_status == z3.unknown else None
            if outer_status == z3.unknown and time.monotonic() >= deadline:
                reason = "wall budget"
            result = {
                "status": str(outer_status).upper(),
                "reason": reason,
            }
            break
        model = solver.model()
        rows = selected_rows(model, member, args.n)
        metric_status, centers, core_names, metric_payload = metric_check(
            rows, args.n, args.metric_timeout_ms, deadline, args.random_seed
        )
        if metric_status == z3.sat:
            decoded_blockers = blocker_values(model, blocker, args.n)
            payload_verification = verify_payload(
                n=args.n,
                second_apex=args.second_apex,
                rows=rows,
                blockers={
                    int(source): center
                    for source, center in decoded_blockers.items()
                },
                distances=metric_payload,
                distance_lower_bound=Fraction(1),
            )
            result = {
                "status": "SAT_VERIFIED_KALMANSON_SHADOW",
                "rows": {str(center): list(row) for center, row in rows.items()},
                "blockers": decoded_blockers,
                "distances": metric_payload,
                "payload_verification": payload_verification,
            }
            break
        if metric_status == z3.unknown:
            reason = metric_payload
            if time.monotonic() >= deadline:
                reason = "wall budget"
            result = {"status": "UNKNOWN", "reason": reason}
            break
        core_vertices = tuple(metric_payload["core_vertices"])
        role = {vertex: index for index, vertex in enumerate(core_vertices)}
        order_schema = tuple(
            sorted(
                (role[center], role[point])
                for center, point in metric_payload["required_memberships"]
            )
        )
        reflected_schema = tuple(
            sorted(
                (
                    len(core_vertices) - 1 - center,
                    len(core_vertices) - 1 - point,
                )
                for center, point in order_schema
            )
        )
        schema_key = (len(core_vertices), min(order_schema, reflected_schema))
        is_new_schema = schema_key not in seen_order_schemas
        seen_order_schemas.add(schema_key)

        embedding_cut_count = 0
        if is_new_schema:
            embedding_budget_exhausted = False
            for target_vertices in itertools.combinations(
                range(args.n), len(core_vertices)
            ):
                for schema in {order_schema, reflected_schema}:
                    if time.monotonic() >= deadline:
                        embedding_budget_exhausted = True
                        break
                    transformed = {
                        (target_vertices[center], target_vertices[point])
                        for center, point in schema
                    }
                    solver.add(
                        z3.Or(
                            *(
                                z3.Not(member[center, point])
                                for center, point in sorted(transformed)
                            )
                        )
                    )
                    embedding_cut_count += 1
                if embedding_budget_exhausted:
                    break

        refinement = {
            "attempt": attempt,
            "dependency_centers": list(centers),
            "metric_core": list(core_names),
            "rows": {str(center): list(rows[center]) for center in centers},
            "required_memberships": [
                list(item) for item in metric_payload["required_memberships"]
            ],
            "full_metric_core_vertices": list(core_vertices),
            "constraint_kinds": list(metric_payload["constraint_kinds"]),
            "order_schema": [list(item) for item in schema_key[1]],
            "new_order_schema": is_new_schema,
            "order_embedding_cut_count": embedding_cut_count,
        }
        refinements.append(refinement)
        if not is_new_schema:
            result = {
                "status": "UNKNOWN",
                "reason": "repeated fully tracked order schema",
            }
            break
    else:
        result = {"status": "UNKNOWN", "reason": "refinement budget"}

    if result is None:
        raise RuntimeError("search produced no terminal result")
    result.update(
        {
            "schema": "p97-whole-carrier-biapex-kalmanson-cegar-v1",
            "epistemic_status": "BOUNDED_THEOREM_DISCOVERY_NOT_LEAN_PROOF",
            "n": args.n,
            "random_seed": args.random_seed,
            "omitted_apices": [0, args.second_apex],
            "elapsed_seconds": time.monotonic() - started,
            "refinement_count": len(refinements),
            "refinements": refinements,
        }
    )
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    if args.summary_only:
        core_center_histogram: dict[str, int] = {}
        core_constraint_histogram: dict[str, int] = {}
        for refinement in refinements:
            center_key = str(len(refinement["dependency_centers"]))
            constraint_key = str(len(refinement["metric_core"]))
            core_center_histogram[center_key] = (
                core_center_histogram.get(center_key, 0) + 1
            )
            core_constraint_histogram[constraint_key] = (
                core_constraint_histogram.get(constraint_key, 0) + 1
            )
        summary = {
            key: result.get(key)
            for key in (
                "status",
                "reason",
                "n",
                "omitted_apices",
                "elapsed_seconds",
                "refinement_count",
                "rows",
                "blockers",
            )
            if key in result
        }
        summary["core_center_count_histogram"] = core_center_histogram
        summary["core_constraint_count_histogram"] = core_constraint_histogram
        summary["first_refinements"] = refinements[:3]
        summary["order_schema_count"] = len(seen_order_schemas)
        print(json.dumps(summary, indent=2, sort_keys=True))
    else:
        print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
