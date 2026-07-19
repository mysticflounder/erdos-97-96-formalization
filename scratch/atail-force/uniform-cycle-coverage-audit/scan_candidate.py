#!/usr/bin/env python3
"""Find a conjectured terminal in one verified structural SAT candidate."""

from __future__ import annotations

import argparse
import collections
import importlib.util
import itertools
import json
import sys
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
SEARCH = HERE.parent / "generic-biapex-kalmanson-search"
SHAPE = SEARCH / "schema-shape-audit"
sys.path.insert(0, str(SEARCH))

import global_equality_quotient_cegar as quotient  # noqa: E402


SPEC = importlib.util.spec_from_file_location(
    "cycle_subcore_check", SHAPE / "check_equality_cycle_subcores.py"
)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("cannot load equality-cycle checker")
CYCLE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(CYCLE)


def memberships_of_cycle(cycle: tuple[tuple[int, int, int], ...]):
    return tuple(
        sorted(
            (center, point)
            for center, left, right in cycle
            for point in (left, right)
        )
    )


def compact_cycle(cycle: tuple[tuple[int, int, int], ...]):
    active = sorted({vertex for edge in cycle for vertex in edge})
    rank = {vertex: index for index, vertex in enumerate(active)}
    centers = tuple(rank[center] for center, _left, _right in cycle)
    pairs = tuple((rank[left], rank[right]) for _center, left, right in cycle)
    return len(active), centers, pairs


class IncrementalKalmansonChecker:
    """Reuse each ordered-carrier Kalmanson base across many cycle types."""

    def __init__(self, timeout_ms: int = 10_000) -> None:
        self.timeout_ms = timeout_ms
        self.cache: dict[int, tuple[Any, Any]] = {}

    def base(self, n: int):
        found = self.cache.get(n)
        if found is not None:
            return found
        z3 = CYCLE.TRIANGLE.z3
        solver = z3.Solver()
        solver.set(timeout=self.timeout_ms)
        table = CYCLE.TRIANGLE.CEGAR.distance_table(n)
        dist = lambda left, right: CYCLE.TRIANGLE.CEGAR.dist(table, left, right)
        for a, b, c, d in itertools.combinations(range(n), 4):
            diagonals = dist(a, c) + dist(b, d)
            solver.add(diagonals >= dist(a, b) + dist(c, d) + 1)
            solver.add(diagonals >= dist(a, d) + dist(b, c) + 1)
        self.cache[n] = solver, dist
        return solver, dist

    def check(
        self,
        n: int,
        centers: tuple[int, ...],
        pairs: tuple[tuple[int, int], ...],
    ) -> str:
        solver, dist = self.base(n)
        solver.push()
        try:
            for center, (first, second) in zip(centers, pairs, strict=True):
                solver.add(dist(center, first) == dist(center, second))
            return str(solver.check()).upper()
        finally:
            solver.pop()


def reflected(n: int, schema: tuple[tuple[int, int], ...]):
    return tuple(sorted((n - 1 - center, n - 1 - point) for center, point in schema))


def canonical_schema(n: int, schema: tuple[tuple[int, int], ...]):
    schema = tuple(sorted(schema))
    return min(schema, reflected(n, schema))


def compact_schema(schema: tuple[tuple[int, int], ...]):
    """Normalize to the induced order on roles actually used by the terminal."""
    active = sorted({vertex for edge in schema for vertex in edge})
    rank = {vertex: index for index, vertex in enumerate(active)}
    compact = tuple(sorted((rank[center], rank[point]) for center, point in schema))
    return len(active), canonical_schema(len(active), compact)


def find_interlocking(rows: dict[int, tuple[int, ...]], n: int):
    row_sets = {center: set(support) for center, support in rows.items()}
    seen = set()
    for shift in range(n):
        for offsets in itertools.combinations(range(n), 6):
            A, B, X, C, D, Y = tuple((shift + offset) % n for offset in offsets)
            roles = (A, B, X, C, D, Y)
            if len(set(roles)) != 6 or roles in seen:
                continue
            seen.add(roles)
            if not ({X, Y} <= row_sets[A] and {X, Y} <= row_sets[C]):
                continue
            if not ({A, C} <= row_sets[B] and {A, C} <= row_sets[D]):
                continue
            core_vertex_count, schema = compact_schema(
                tuple(
                    sorted(
                        (
                            (A, X),
                            (A, Y),
                            (C, X),
                            (C, Y),
                            (B, A),
                            (B, C),
                            (D, A),
                            (D, C),
                        )
                    )
                ),
            )
            return {
                "kind": "COUPLED_INTERLOCKING_SHARED_PAIRS",
                "cyclic_roles": {"A": A, "B": B, "X": X, "C": C, "D": D, "Y": Y},
                "core_vertex_count": core_vertex_count,
                "order_schema": [list(edge) for edge in schema],
            }
    return None


def equality_cycles(rows: dict[int, tuple[int, ...]], n: int, size: int):
    adjacency: dict[int, list[tuple[int, int]]] = collections.defaultdict(list)
    for center, support in rows.items():
        for left, right in itertools.combinations(support, 2):
            adjacency[left].append((right, center))
            adjacency[right].append((left, center))

    found: set[tuple[tuple[int, int, int], ...]] = set()

    def visit(
        start: int,
        path: tuple[int, ...],
        centers: frozenset[int],
        edges: tuple[tuple[int, int, int], ...],
    ) -> None:
        current = path[-1]
        for following, center in adjacency[current]:
            if center in centers:
                continue
            edge = (center, min(current, following), max(current, following))
            if following == start and len(path) == size:
                found.add(tuple(sorted(edges + (edge,))))
            elif following not in path and len(path) < size:
                visit(
                    start,
                    path + (following,),
                    centers | {center},
                    edges + (edge,),
                )

    for start in range(n):
        visit(start, (start,), frozenset(), ())
    yield from sorted(found)


def find_cycle(rows: dict[int, tuple[int, ...]], n: int, max_checks: int):
    checked = 0
    cycle_count_by_size = {}
    unique_type_count_by_size = {}
    seen_order_types: set[tuple[int, str]] = set()
    kalmanson = IncrementalKalmansonChecker()
    for size in range(3, 8):
        cycles = list(equality_cycles(rows, n, size))
        cycle_count_by_size[str(size)] = len(cycles)
        for cycle in cycles:
            compact_n, centers, pairs = compact_cycle(cycle)
            order_type = CYCLE.canonical_order_type(compact_n, centers, pairs)
            type_key = (size, order_type)
            if type_key in seen_order_types:
                continue
            seen_order_types.add(type_key)
            unique_type_count_by_size[str(size)] = (
                unique_type_count_by_size.get(str(size), 0) + 1
            )
            checked += 1
            if checked > max_checks:
                return (
                    None,
                    checked - 1,
                    cycle_count_by_size,
                    unique_type_count_by_size,
                    "cycle order-type check budget",
                )
            status = kalmanson.check(compact_n, centers, pairs)
            if status == "UNSAT":
                core_vertex_count, schema = compact_schema(memberships_of_cycle(cycle))
                return (
                    {
                        "kind": "KALMANSON_UNSAT_EQUALITY_CYCLE",
                        "cycle_size": size,
                        "cycle_edges": [list(edge) for edge in cycle],
                        "canonical_order_type": order_type,
                        "kalmanson_only_status": status,
                        "has_ordinal_cycle": CYCLE.has_ordinal_cycle(
                            compact_n, centers, pairs
                        ),
                        "core_vertex_count": core_vertex_count,
                        "order_schema": [list(edge) for edge in schema],
                    },
                    checked,
                    cycle_count_by_size,
                    unique_type_count_by_size,
                    None,
                )
    return None, checked, cycle_count_by_size, unique_type_count_by_size, None


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("outer_result", type=Path)
    parser.add_argument("--max-cycle-checks", type=int, default=100_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    outer = json.loads(args.outer_result.read_text(encoding="utf-8"))
    if outer.get("solver_status") != "SAT" or outer.get("cnf_model_checked") is not True:
        raise ValueError("outer result is not a substitution-checked SAT model")
    n = int(outer["n"])
    rows = {
        int(center): tuple(int(point) for point in support)
        for center, support in outer["rows"].items()
    }
    collisions = quotient.all_collisions(rows, n)
    terminal: dict[str, Any] | None = None
    if collisions:
        collision = collisions[0]
        schema = canonical_schema(n, tuple(collision.required_memberships))
        terminal = {
            "kind": collision.kind,
            "quadruple": list(collision.quadruple),
            "equality_path_lengths": [len(path) for path in collision.equality_paths],
            "core_vertex_count": n,
            "order_schema": [list(edge) for edge in schema],
        }
    if terminal is None:
        terminal = find_interlocking(rows, n)
    checked_cycles = 0
    cycle_count_by_size: dict[str, int] = {}
    unique_cycle_type_count_by_size: dict[str, int] = {}
    reason = None
    if terminal is None:
        (
            terminal,
            checked_cycles,
            cycle_count_by_size,
            unique_cycle_type_count_by_size,
            reason,
        ) = find_cycle(rows, n, args.max_cycle_checks)

    payload = {
        "schema": "p97-uniform-cycle-coverage-candidate-scan-v1",
        "epistemic_status": "EXACT_BOUNDED_STRUCTURAL_AND_LRA_SCAN",
        "source": str(args.outer_result),
        "n": n,
        "single_kalmanson_collision_count": len(collisions),
        "cycle_checks": checked_cycles,
        "cycle_count_by_size": cycle_count_by_size,
        "unique_cycle_type_count_by_size": unique_cycle_type_count_by_size,
        "terminal": terminal,
        "status": "TERMINAL_FOUND" if terminal is not None else "NO_TERMINAL_FOUND",
        "reason": reason,
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
