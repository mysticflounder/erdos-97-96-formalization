#!/usr/bin/env python3
"""CEGAR for single-Kalmanson collisions after global row-equality closure.

The outer layer is the faithful whole-carrier structural object from
``cegar.py``.  For each decoded row table this script unions *all* distance
terms identified by selected-row equalities.  An increasing quadruple is
rejected when either strict Kalmanson inequality has the same two-term
multiset on both sides modulo that global quotient.

Each refinement contains only the row memberships on shortest equality paths
that realize the multiset identification.  It is transported by increasing
embeddings of the complete core vertex set and by order reversal.  This is a
bounded theorem-discovery search, not a proof of arbitrary-cardinality
coverage.  A SAT result is only a survivor of the single-inequality quotient
filter; it is not a full-linear Kalmanson metric.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
import time
from collections import deque
from dataclasses import dataclass
from pathlib import Path

import z3

import cegar


DistanceTerm = tuple[int, int]
Membership = tuple[int, int]


def distance_term(left: int, right: int) -> DistanceTerm:
    if left == right:
        raise ValueError("distance term requires distinct endpoints")
    return tuple(sorted((left, right)))


class UnionFind:
    def __init__(self, terms: list[DistanceTerm]):
        self.parent = {term: term for term in terms}
        self.rank = {term: 0 for term in terms}

    def find(self, term: DistanceTerm) -> DistanceTerm:
        parent = self.parent[term]
        if parent != term:
            self.parent[term] = self.find(parent)
        return self.parent[term]

    def union(self, left: DistanceTerm, right: DistanceTerm) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root == right_root:
            return
        if self.rank[left_root] < self.rank[right_root]:
            left_root, right_root = right_root, left_root
        self.parent[right_root] = left_root
        if self.rank[left_root] == self.rank[right_root]:
            self.rank[left_root] += 1


@dataclass(frozen=True)
class EqualityEdge:
    left: DistanceTerm
    right: DistanceTerm
    center: int
    first: int
    second: int

    @property
    def memberships(self) -> frozenset[Membership]:
        return frozenset(((self.center, self.first), (self.center, self.second)))


@dataclass(frozen=True)
class Collision:
    kind: str
    quadruple: tuple[int, int, int, int]
    required_memberships: tuple[Membership, ...]
    equality_paths: tuple[tuple[EqualityEdge, ...], tuple[EqualityEdge, ...]]


def equality_closure(rows: dict[int, tuple[int, ...]], n: int):
    terms = [
        (left, right)
        for left in range(n)
        for right in range(left + 1, n)
    ]
    closure = UnionFind(terms)
    adjacency: dict[DistanceTerm, list[tuple[DistanceTerm, EqualityEdge]]] = {
        term: [] for term in terms
    }
    for center, support in rows.items():
        for first, second in itertools.combinations(support, 2):
            left = distance_term(center, first)
            right = distance_term(center, second)
            equality = EqualityEdge(left, right, center, first, second)
            closure.union(left, right)
            adjacency[left].append((right, equality))
            adjacency[right].append((left, equality))
    return closure, adjacency


def shortest_equality_path(
    start: DistanceTerm,
    target: DistanceTerm,
    adjacency: dict[DistanceTerm, list[tuple[DistanceTerm, EqualityEdge]]],
) -> tuple[EqualityEdge, ...]:
    if start == target:
        return ()
    queue = deque([start])
    previous: dict[DistanceTerm, tuple[DistanceTerm, EqualityEdge] | None] = {
        start: None
    }
    while queue:
        current = queue.popleft()
        for following, equality in adjacency[current]:
            if following in previous:
                continue
            previous[following] = (current, equality)
            if following == target:
                path: list[EqualityEdge] = []
                cursor = following
                while previous[cursor] is not None:
                    predecessor, edge = previous[cursor]
                    path.append(edge)
                    cursor = predecessor
                path.reverse()
                return tuple(path)
            queue.append(following)
    raise RuntimeError(f"no equality path from {start} to {target}")


def collision_for_sides(
    kind: str,
    quadruple: tuple[int, int, int, int],
    diagonals: tuple[DistanceTerm, DistanceTerm],
    sides: tuple[DistanceTerm, DistanceTerm],
    closure: UnionFind,
    adjacency: dict[DistanceTerm, list[tuple[DistanceTerm, EqualityEdge]]],
) -> Collision | None:
    diagonal_roots = tuple(closure.find(term) for term in diagonals)
    side_roots = tuple(closure.find(term) for term in sides)
    if sorted(diagonal_roots) != sorted(side_roots):
        return None

    if diagonal_roots[0] == side_roots[0] and diagonal_roots[1] == side_roots[1]:
        paired_sides = sides
    else:
        paired_sides = (sides[1], sides[0])
    paths = (
        shortest_equality_path(diagonals[0], paired_sides[0], adjacency),
        shortest_equality_path(diagonals[1], paired_sides[1], adjacency),
    )
    required = tuple(
        sorted(
            {
                membership
                for path in paths
                for equality in path
                for membership in equality.memberships
            }
        )
    )
    if not required:
        raise RuntimeError("distinct Kalmanson term multisets collided without rows")
    return Collision(kind, quadruple, required, paths)


def all_collisions(
    rows: dict[int, tuple[int, ...]], n: int
) -> tuple[Collision, ...]:
    closure, adjacency = equality_closure(rows, n)
    answer: list[Collision] = []
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = (distance_term(a, c), distance_term(b, d))
        for kind, sides in (
            ("K1", (distance_term(a, b), distance_term(c, d))),
            ("K2", (distance_term(a, d), distance_term(b, c))),
        ):
            collision = collision_for_sides(
                kind, (a, b, c, d), diagonals, sides, closure, adjacency
            )
            if collision is not None:
                answer.append(collision)
    return tuple(answer)


def schema_of_collision(collision: Collision):
    core_vertices = tuple(
        sorted(
            set(collision.quadruple)
            | {
                vertex
                for membership in collision.required_memberships
                for vertex in membership
            }
        )
    )
    role = {vertex: index for index, vertex in enumerate(core_vertices)}
    schema = tuple(
        sorted(
            (role[center], role[point])
            for center, point in collision.required_memberships
        )
    )
    reflected = tuple(
        sorted(
            (len(core_vertices) - 1 - center, len(core_vertices) - 1 - point)
            for center, point in schema
        )
    )
    return core_vertices, schema, reflected, (len(core_vertices), min(schema, reflected))


def schema_of_memberships(
    core_vertices: tuple[int, ...], required_memberships: tuple[Membership, ...]
):
    role = {vertex: index for index, vertex in enumerate(core_vertices)}
    schema = tuple(
        sorted(
            (role[center], role[point])
            for center, point in required_memberships
        )
    )
    reflected = tuple(
        sorted(
            (len(core_vertices) - 1 - center, len(core_vertices) - 1 - point)
            for center, point in schema
        )
    )
    return schema, reflected, (len(core_vertices), min(schema, reflected))


def add_schema_cuts(
    solver: z3.Solver,
    member: dict[Membership, z3.BoolRef],
    n: int,
    core_vertex_count: int,
    schema: tuple[Membership, ...],
    reflected: tuple[Membership, ...],
) -> int:
    count = 0
    for target_vertices in itertools.combinations(range(n), core_vertex_count):
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
            count += 1
    return count


def serialize_edge(edge: EqualityEdge) -> dict[str, object]:
    return {
        "left": list(edge.left),
        "right": list(edge.right),
        "center": edge.center,
        "memberships": [list(item) for item in sorted(edge.memberships)],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--second-apex", type=int, required=True)
    parser.add_argument("--wall-seconds", type=float, default=120.0)
    parser.add_argument("--outer-timeout-ms", type=int, default=30_000)
    parser.add_argument("--metric-timeout-ms", type=int, default=15_000)
    parser.add_argument("--full-linear", action="store_true")
    parser.add_argument("--preload-bank", type=Path)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument(
        "--preload",
        type=Path,
        action="append",
        default=[],
        help="preload transported schemas from an earlier compatible payload",
    )
    parser.add_argument("--max-refinements", type=int, default=100_000)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--summary-only", action="store_true")
    args = parser.parse_args()

    solver, member, blocker = cegar.build_structural(
        args.n, args.second_apex, args.outer_timeout_ms, args.random_seed
    )
    started = time.monotonic()
    deadline = started + args.wall_seconds
    seen_schemas: set[tuple[int, tuple[Membership, ...]]] = set()
    refinements: list[dict[str, object]] = []
    preloaded_schema_count = 0
    preloaded_embedding_cut_count = 0
    if args.preload_bank is not None:
        bank = json.loads(args.preload_bank.read_text(encoding="utf-8"))
        if bank.get("schema") != "p97-whole-carrier-kalmanson-transported-schema-bank-v1":
            raise ValueError("unexpected preload bank schema")
        for record in bank["schemas"]:
            core_vertex_count = int(record["core_vertex_count"])
            schema = tuple(tuple(item) for item in record["order_schema"])
            reflected = tuple(
                sorted(
                    (
                        core_vertex_count - 1 - center,
                        core_vertex_count - 1 - point,
                    )
                    for center, point in schema
                )
            )
            schema_key = (core_vertex_count, min(schema, reflected))
            if schema_key in seen_schemas:
                continue
            seen_schemas.add(schema_key)
            preloaded_embedding_cut_count += add_schema_cuts(
                solver,
                member,
                args.n,
                core_vertex_count,
                schema_key[1],
                reflected,
            )
            preloaded_schema_count += 1
    attempts = 0
    total_collisions = 0
    total_embedding_cuts = 0
    full_linear_check_count = 0
    full_linear_core_count = 0
    result: dict[str, object]

    for preload_path in args.preload:
        prior = json.loads(preload_path.read_text(encoding="utf-8"))
        if int(prior["n"]) != args.n:
            raise RuntimeError(f"preload cardinality mismatch: {preload_path}")
        for refinement in prior["refinements"]:
            core_vertex_count = len(refinement["complete_core_vertices"])
            schema = tuple(tuple(item) for item in refinement["order_schema"])
            reflected = tuple(
                sorted(
                    (
                        core_vertex_count - 1 - center,
                        core_vertex_count - 1 - point,
                    )
                    for center, point in schema
                )
            )
            schema_key = (core_vertex_count, min(schema, reflected))
            if schema_key in seen_schemas:
                continue
            seen_schemas.add(schema_key)
            preloaded_embedding_cut_count += add_schema_cuts(
                solver,
                member,
                args.n,
                core_vertex_count,
                schema,
                reflected,
            )
            preloaded_schema_count += 1

    while len(refinements) < args.max_refinements:
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            result = {"status": "UNKNOWN", "reason": "wall budget"}
            break
        solver.set(timeout=max(1, min(args.outer_timeout_ms, remaining_ms)))
        outer_status = solver.check()
        if outer_status != z3.sat:
            reason = solver.reason_unknown() if outer_status == z3.unknown else None
            if outer_status == z3.unknown and time.monotonic() >= deadline:
                reason = "wall budget"
            result = {"status": str(outer_status).upper(), "reason": reason}
            break

        attempts += 1
        model = solver.model()
        rows = cegar.selected_rows(model, member, args.n)
        collisions = all_collisions(rows, args.n)
        if not collisions:
            if not args.full_linear:
                result = {
                    "status": "SAT_GLOBAL_EQUALITY_QUOTIENT_SURVIVOR",
                    "rows": {str(center): list(row) for center, row in rows.items()},
                    "blockers": cegar.blocker_values(model, blocker, args.n),
                }
                break
            full_linear_check_count += 1
            metric_status, dependency_centers, metric_core, metric_payload = (
                cegar.metric_check(
                    rows, args.n, args.metric_timeout_ms, deadline,
                    args.random_seed
                )
            )
            if metric_status == z3.sat:
                result = {
                    "status": "SAT_VERIFIED_KALMANSON_SHADOW",
                    "rows": {str(center): list(row) for center, row in rows.items()},
                    "blockers": cegar.blocker_values(model, blocker, args.n),
                    "distances": metric_payload,
                }
                break
            if metric_status == z3.unknown:
                result = {"status": "UNKNOWN", "reason": metric_payload}
                break

            core_vertices = tuple(metric_payload["core_vertices"])
            required = tuple(metric_payload["required_memberships"])
            schema, reflected, schema_key = schema_of_memberships(
                core_vertices, required
            )
            if schema_key in seen_schemas:
                result = {
                    "status": "UNKNOWN",
                    "reason": "full LRA core produced no new transported schema",
                    "rows": {str(center): list(row) for center, row in rows.items()},
                }
                break
            seen_schemas.add(schema_key)
            embedding_count = add_schema_cuts(
                solver,
                member,
                args.n,
                len(core_vertices),
                schema,
                reflected,
            )
            total_embedding_cuts += embedding_count
            full_linear_core_count += 1
            refinements.append(
                {
                    "attempt": attempts,
                    "kind": "FULL_LRA",
                    "complete_core_vertices": list(core_vertices),
                    "dependency_centers": list(dependency_centers),
                    "required_memberships": [list(item) for item in required],
                    "metric_core": list(metric_core),
                    "constraint_kinds": list(metric_payload["constraint_kinds"]),
                    "order_schema": [list(item) for item in schema_key[1]],
                    "order_embedding_cut_count": embedding_count,
                }
            )
            continue

        total_collisions += len(collisions)
        new_this_attempt = 0
        for collision in collisions:
            core_vertices, schema, reflected, schema_key = schema_of_collision(collision)
            if schema_key in seen_schemas:
                continue
            seen_schemas.add(schema_key)
            embedding_count = add_schema_cuts(
                solver,
                member,
                args.n,
                len(core_vertices),
                schema,
                reflected,
            )
            total_embedding_cuts += embedding_count
            new_this_attempt += 1
            refinements.append(
                {
                    "attempt": attempts,
                    "kind": collision.kind,
                    "quadruple": list(collision.quadruple),
                    "complete_core_vertices": list(core_vertices),
                    "required_memberships": [
                        list(item) for item in collision.required_memberships
                    ],
                    "equality_paths": [
                        [serialize_edge(edge) for edge in path]
                        for path in collision.equality_paths
                    ],
                    "order_schema": [list(item) for item in schema_key[1]],
                    "order_embedding_cut_count": embedding_count,
                }
            )
            if len(refinements) >= args.max_refinements:
                break
        if new_this_attempt == 0:
            result = {
                "status": "UNKNOWN",
                "reason": "collision model produced no new transported schema",
                "rows": {str(center): list(row) for center, row in rows.items()},
            }
            break
    else:
        result = {"status": "UNKNOWN", "reason": "refinement budget"}

    elapsed = time.monotonic() - started
    result.update(
        {
            "schema": "p97-global-equality-quotient-kalmanson-cegar-v1",
            "epistemic_status": "BOUNDED_THEOREM_DISCOVERY_NOT_LEAN_PROOF",
            "n": args.n,
            "omitted_apices": [0, args.second_apex],
            "random_seed": args.random_seed,
            "preload_bank": str(args.preload_bank) if args.preload_bank else None,
            "elapsed_seconds": elapsed,
            "attempt_count": attempts,
            "refinement_count": len(refinements),
            "total_collision_count": total_collisions,
            "total_embedding_cut_count": total_embedding_cuts,
            "preload_paths": [str(path) for path in args.preload],
            "preloaded_schema_count": preloaded_schema_count,
            "preloaded_embedding_cut_count": preloaded_embedding_cut_count,
            "full_linear": args.full_linear,
            "full_linear_check_count": full_linear_check_count,
            "full_linear_core_count": full_linear_core_count,
            "schema_size_histogram": {
                str(size): sum(1 for core_size, _schema in seen_schemas if core_size == size)
                for size in sorted({core_size for core_size, _schema in seen_schemas})
            },
            "refinements": refinements,
        }
    )
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    if args.summary_only:
        summary = {
            key: result.get(key)
            for key in (
                "status",
                "reason",
                "n",
                "omitted_apices",
                "random_seed",
                "elapsed_seconds",
                "attempt_count",
                "refinement_count",
                "total_collision_count",
                "total_embedding_cut_count",
                "preload_paths",
                "preloaded_schema_count",
                "preloaded_embedding_cut_count",
                "full_linear",
                "full_linear_check_count",
                "full_linear_core_count",
                "schema_size_histogram",
                "rows",
                "blockers",
            )
            if key in result
        }
        summary["refinement_rate_per_second"] = (
            len(refinements) / elapsed if elapsed > 0 else math.inf
        )
        summary["first_refinements"] = refinements[:3]
        print(json.dumps(summary, indent=2, sort_keys=True))
    else:
        print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
