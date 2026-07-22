#!/usr/bin/env python3
"""Exact QF_LRA audit of the Fin 12 scope guard against cyclic Kalmanson closure.

The Lean guard records the three closed caps only as finite sets, so this audit
enumerates all 3!^3 = 216 cyclic orders compatible with those caps (up to global
reversal and cyclic rotation).  Distances are abstract symmetric variables.
Strict homogeneous inequalities are normalized to have slack at least one.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict, deque
import itertools
import json
from fractions import Fraction
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
RESULT_PATH = HERE / "KALMANSON_RESULT.json"
CORE_PATH = HERE / "KALMANSON_CORES.json"
SMT2_PATH = HERE / "KALMANSON_SAT_WITNESS.smt2"

N = 12
ROWS = (
    (1, 3, 5, 6),
    (0, 2, 7, 8),
    (0, 3, 7, 11),
    (1, 2, 5, 7),
    (1, 7, 8, 9),
    (4, 6, 9, 11),
    (0, 4, 8, 11),
    (4, 6, 8, 10),
    (7, 9, 10, 11),
    (3, 8, 10, 11),
    (2, 3, 8, 9),
    (5, 6, 9, 10),
)
FIRST_CLASS = (1, 3, 4, 5, 6)
SECOND_CLASS = (2, 3, 7, 8, 9)


def pair(i: int, j: int) -> tuple[int, int]:
    assert i != j
    return (i, j) if i < j else (j, i)


PAIR_KEYS = tuple(itertools.combinations(range(N), 2))


def cap_orders() -> list[tuple[int, ...]]:
    """All orders 0--surplus--10--first-opposite--11--second-opposite--0."""
    return [
        (0, *s, 10, *c1, 11, *c2)
        for s in itertools.permutations((2, 4, 7))
        for c1 in itertools.permutations((1, 3, 6))
        for c2 in itertools.permutations((5, 8, 9))
    ]


def rational(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def equality_specs(include_apex_classes: bool) -> list[tuple[str, tuple[int, int], tuple[int, int]]]:
    out: list[tuple[str, tuple[int, int], tuple[int, int]]] = []
    for center, targets in enumerate(ROWS):
        base = pair(center, targets[0])
        for slot, target in enumerate(targets[1:], start=1):
            out.append((f"row_{center}_slot_{slot}", pair(center, target), base))
    if include_apex_classes:
        for name, center, targets in (
            ("first_class", 0, FIRST_CLASS),
            ("second_class", 10, SECOND_CLASS),
        ):
            base = pair(center, targets[0])
            for slot, target in enumerate(targets[1:], start=1):
                out.append((f"{name}_slot_{slot}", pair(center, target), base))
    # Preserve the first occurrence of any duplicate linear equality.
    unique: dict[tuple[tuple[int, int], tuple[int, int]], tuple[str, tuple[int, int], tuple[int, int]]] = {}
    for spec in out:
        _, left, right = spec
        key = tuple(sorted((left, right)))
        unique.setdefault(key, spec)
    return list(unique.values())


def components(
    equalities: list[tuple[str, tuple[int, int], tuple[int, int]]],
) -> dict[tuple[int, int], tuple[int, int]]:
    parent = {node: node for node in PAIR_KEYS}

    def find(node: tuple[int, int]) -> tuple[int, int]:
        while parent[node] != node:
            parent[node] = parent[parent[node]]
            node = parent[node]
        return node

    def union(left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root, right_root = find(left), find(right)
        if left_root != right_root:
            parent[right_root] = left_root

    for _, left, right in equalities:
        union(left, right)
    return {node: find(node) for node in PAIR_KEYS}


def collapsed(
    lhs: tuple[tuple[int, int], tuple[int, int]],
    rhs: tuple[tuple[int, int], tuple[int, int]],
    equalities: list[tuple[str, tuple[int, int], tuple[int, int]]],
) -> bool:
    quotient = components(equalities)
    return Counter(quotient[node] for node in lhs) == Counter(quotient[node] for node in rhs)


def shortest_path(
    start: tuple[int, int],
    end: tuple[int, int],
    equalities: list[tuple[str, tuple[int, int], tuple[int, int]]],
) -> list[tuple[str, tuple[int, int], tuple[int, int]]]:
    if start == end:
        return []
    graph: dict[tuple[int, int], list[tuple[tuple[int, int], tuple[str, tuple[int, int], tuple[int, int]]]]] = defaultdict(list)
    for edge in equalities:
        _, left, right = edge
        graph[left].append((right, edge))
        graph[right].append((left, edge))
    queue = deque([start])
    previous: dict[tuple[int, int], tuple[tuple[int, int], tuple[str, tuple[int, int], tuple[int, int]]] | None] = {start: None}
    while queue:
        current = queue.popleft()
        for successor, edge in graph[current]:
            if successor in previous:
                continue
            previous[successor] = (current, edge)
            if successor == end:
                queue.clear()
                break
            queue.append(successor)
    assert end in previous
    path = []
    current = end
    while current != start:
        predecessor, edge = previous[current]  # type: ignore[misc]
        path.append(edge)
        current = predecessor
    path.reverse()
    return path


def matched_paths(
    lhs: tuple[tuple[int, int], tuple[int, int]],
    rhs: tuple[tuple[int, int], tuple[int, int]],
    equalities: list[tuple[str, tuple[int, int], tuple[int, int]]],
) -> list[tuple[tuple[int, int], tuple[int, int], list[tuple[str, tuple[int, int], tuple[int, int]]]]]:
    quotient = components(equalities)
    lhs_groups: dict[tuple[int, int], list[tuple[int, int]]] = defaultdict(list)
    rhs_groups: dict[tuple[int, int], list[tuple[int, int]]] = defaultdict(list)
    for node in lhs:
        lhs_groups[quotient[node]].append(node)
    for node in rhs:
        rhs_groups[quotient[node]].append(node)
    assert {key: len(value) for key, value in lhs_groups.items()} == {
        key: len(value) for key, value in rhs_groups.items()
    }
    result = []
    for key, left_nodes in lhs_groups.items():
        right_nodes = rhs_groups[key]
        choices = []
        for permutation in itertools.permutations(right_nodes):
            paths = [
                (left, right, shortest_path(left, right, equalities))
                for left, right in zip(left_nodes, permutation, strict=True)
            ]
            edge_names = {edge[0] for _, _, path in paths for edge in path}
            choices.append((len(edge_names), sum(len(path) for _, _, path in paths), paths))
        result.extend(min(choices, key=lambda item: (item[0], item[1]))[2])
    return result


def minimal_farkas_core(
    inequality_name: str,
    lhs: tuple[tuple[int, int], tuple[int, int]],
    rhs: tuple[tuple[int, int], tuple[int, int]],
    all_equalities: list[tuple[str, tuple[int, int], tuple[int, int]]],
) -> dict[str, object]:
    paths = matched_paths(lhs, rhs, all_equalities)
    used_names = {edge[0] for _, _, path in paths for edge in path}
    core = [edge for edge in all_equalities if edge[0] in used_names]
    for edge in list(reversed(core)):
        reduced = [candidate for candidate in core if candidate != edge]
        if collapsed(lhs, rhs, reduced):
            core = reduced

    paths = matched_paths(lhs, rhs, core)
    weights: Counter[str] = Counter()
    edge_map = {name: (left, right) for name, left, right in core}
    for start, end, path in paths:
        current = start
        for name, left, right in path:
            if current == left:
                weights[name] -= 1
                current = right
            else:
                assert current == right
                weights[name] += 1
                current = left
        assert current == end

    # Exact Farkas replay: inequality has coefficient +1 and each equality is
    # freely signed.  Their combined coefficient at every distance variable is zero.
    total: Counter[tuple[int, int]] = Counter()
    for node in lhs:
        total[node] += 1
    for node in rhs:
        total[node] -= 1
    for name, weight in weights.items():
        left, right = edge_map[name]
        total[left] += weight
        total[right] -= weight
    assert all(coefficient == 0 for coefficient in total.values())
    assert all(weights[name] != 0 for name, _, _ in core)
    for removed in core:
        assert not collapsed(lhs, rhs, [edge for edge in core if edge != removed])

    return {
        "inequality": inequality_name,
        "lhs": [f"d_{i}_{j}" for i, j in lhs],
        "rhs": [f"d_{i}_{j}" for i, j in rhs],
        "strict_weight": 1,
        "equality_weights": {name: weights[name] for name, _, _ in core},
        "equalities": {
            name: [f"d_{left[0]}_{left[1]}", f"d_{right[0]}_{right[1]}"]
            for name, left, right in core
        },
        "replay": "inequality plus signed equality weights has zero linear left side but normalized right side 1",
        "deletion_minimal": True,
    }


def best_direct_core(order: tuple[int, ...]) -> dict[str, object]:
    equalities = equality_specs(False)
    quotient = components(equalities)
    candidates = []
    for positions in itertools.combinations(range(N), 4):
        a, b, c, e = (order[k] for k in positions)
        lhs = (pair(a, c), pair(b, e))
        for kind, rhs in (
            ("adjacent", (pair(a, b), pair(c, e))),
            ("opposite", (pair(a, e), pair(b, c))),
        ):
            if Counter(quotient[node] for node in lhs) != Counter(quotient[node] for node in rhs):
                continue
            name = f"kalmanson_{kind}_{a}_{b}_{c}_{e}"
            core = minimal_farkas_core(name, lhs, rhs, equalities)
            candidates.append((len(core["equalities"]), name, core))
    assert candidates, f"no direct one-inequality core for order {order}"
    return min(candidates, key=lambda item: (item[0], item[1]))[2]


def all_order_cores() -> dict[str, object]:
    records = []
    schema_counts: Counter[str] = Counter()
    schema_examples: dict[str, dict[str, object]] = {}
    for order in cap_orders():
        core = best_direct_core(order)
        signature = json.dumps(
            {
                "inequality": core["inequality"],
                "equality_weights": core["equality_weights"],
            },
            sort_keys=True,
        )
        schema_counts[signature] += 1
        schema_examples.setdefault(signature, core)
        records.append({"order": list(order), "core_signature": signature})
    schemas = [
        {"coverage_count": count, "core": schema_examples[signature]}
        for signature, count in sorted(schema_counts.items(), key=lambda item: (-item[1], item[0]))
    ]
    # This one core is universal: every compatible order has
    # 0 < 2 < 6 < 11.  Rows 2 and 6 both make the chord {0,11}
    # equidistant from their centers.
    universal_lhs = (pair(0, 6), pair(2, 11))
    universal_rhs = (pair(0, 2), pair(6, 11))
    assert all(
        order.index(0) < order.index(2) < order.index(6) < order.index(11)
        for order in cap_orders()
    )
    universal_core = minimal_farkas_core(
        "kalmanson_adjacent_0_2_6_11",
        universal_lhs,
        universal_rhs,
        equality_specs(False),
    )
    return {
        "schema": "unique5-distinct-biapex-one-kalmanson-farkas-v1",
        "coverage": "all 216 cap-compatible cyclic orders for this fixed row table",
        "universal_core_coverage_count": 216,
        "universal_core": universal_core,
        "core_schema_count": len(schemas),
        "schemas": schemas,
        "order_records": records,
    }


def build_solver(
    order: tuple[int, ...],
    *,
    include_apex_classes: bool,
    include_triangles: bool,
    tracked: bool = False,
) -> tuple[z3.Solver, dict[tuple[int, int], z3.ArithRef], dict[str, z3.BoolRef]]:
    distances = {ij: z3.Real(f"d_{ij[0]}_{ij[1]}") for ij in PAIR_KEYS}
    solver = z3.Solver()
    labels: dict[str, z3.BoolRef] = {}

    def add(name: str, formula: z3.BoolRef) -> None:
        if tracked:
            label = z3.Bool(name)
            labels[name] = label
            solver.assert_and_track(formula, label)
        else:
            solver.add(formula)

    def d(i: int, j: int) -> z3.ArithRef:
        return distances[pair(i, j)]

    for i, j in PAIR_KEYS:
        add(f"positive_{i}_{j}", distances[(i, j)] >= 1)

    for name, left, right in equality_specs(include_apex_classes):
        add(name, distances[left] == distances[right])

    for positions in itertools.combinations(range(N), 4):
        a, b, c, e = (order[k] for k in positions)
        stem = "_".join(map(str, (a, b, c, e)))
        diagonals = d(a, c) + d(b, e)
        add(f"kalmanson_adjacent_{stem}", diagonals >= d(a, b) + d(c, e) + 1)
        add(f"kalmanson_opposite_{stem}", diagonals >= d(a, e) + d(b, c) + 1)

    if include_triangles:
        for i, j, k in itertools.combinations(range(N), 3):
            add(f"triangle_{i}_{j}_{k}_ij", d(i, j) + d(j, k) >= d(i, k) + 1)
            add(f"triangle_{i}_{j}_{k}_ik", d(i, j) + d(i, k) >= d(j, k) + 1)
            add(f"triangle_{i}_{j}_{k}_jk", d(i, k) + d(j, k) >= d(i, j) + 1)

    return solver, distances, labels


def verify_model(
    order: tuple[int, ...],
    values: dict[tuple[int, int], Fraction],
    *,
    include_apex_classes: bool,
    include_triangles: bool,
) -> dict[str, Fraction | int]:
    def d(i: int, j: int) -> Fraction:
        return values[pair(i, j)]

    assert all(values[ij] >= 1 for ij in PAIR_KEYS)
    for _, left, right in equality_specs(include_apex_classes):
        assert values[left] == values[right]

    minimum_kalmanson_slack: Fraction | None = None
    for positions in itertools.combinations(range(N), 4):
        a, b, c, e = (order[k] for k in positions)
        diagonals = d(a, c) + d(b, e)
        for sides in (d(a, b) + d(c, e), d(a, e) + d(b, c)):
            slack = diagonals - sides
            assert slack >= 1
            minimum_kalmanson_slack = slack if minimum_kalmanson_slack is None else min(minimum_kalmanson_slack, slack)

    minimum_triangle_slack: Fraction | None = None
    if include_triangles:
        for i, j, k in itertools.combinations(range(N), 3):
            slacks = (
                d(i, j) + d(j, k) - d(i, k),
                d(i, j) + d(i, k) - d(j, k),
                d(i, k) + d(j, k) - d(i, j),
            )
            assert min(slacks) >= 1
            local = min(slacks)
            minimum_triangle_slack = local if minimum_triangle_slack is None else min(minimum_triangle_slack, local)

    return {
        "minimum_distance": min(values.values()),
        "minimum_kalmanson_slack": minimum_kalmanson_slack or 0,
        "minimum_triangle_slack": minimum_triangle_slack or 0,
    }


def solve_profile(include_apex_classes: bool, include_triangles: bool) -> dict[str, object]:
    unknown: list[list[int]] = []
    for index, order in enumerate(cap_orders()):
        solver, distances, _ = build_solver(
            order,
            include_apex_classes=include_apex_classes,
            include_triangles=include_triangles,
        )
        solver.set(timeout=30_000)
        status = solver.check()
        if status == z3.sat:
            model = solver.model()
            values = {ij: rational(model.eval(variable, model_completion=True)) for ij, variable in distances.items()}
            checks = verify_model(
                order,
                values,
                include_apex_classes=include_apex_classes,
                include_triangles=include_triangles,
            )
            return {
                "status": "SAT",
                "tested_orders": index + 1,
                "surviving_order": list(order),
                "distances": {f"{i},{j}": str(values[(i, j)]) for i, j in PAIR_KEYS},
                "exact_substitution_check": {key: str(value) for key, value in checks.items()},
                "_smt2": solver.to_smt2(),
            }
        if status == z3.unknown:
            unknown.append(list(order))
    return {
        "status": "UNKNOWN" if unknown else "UNSAT_ALL_ORDERS",
        "tested_orders": len(cap_orders()),
        "unknown_orders": unknown,
    }


def smoke_tests() -> None:
    x01, x02, x03, x12, x13, x23 = z3.Reals("s01 s02 s03 s12 s13 s23")
    sat_solver = z3.Solver()
    sat_solver.add(x02 + x13 >= x01 + x23 + 1)
    sat_solver.add(x02 + x13 >= x03 + x12 + 1)
    assert sat_solver.check() == z3.sat

    unsat_solver = z3.Solver()
    unsat_solver.add(x02 + x13 >= x01 + x23 + 1)
    unsat_solver.add(x02 == x01, x13 == x23)
    assert unsat_solver.check() == z3.unsat


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true", help="recompute and compare with the checked-in result")
    args = parser.parse_args()

    smoke_tests()
    profiles: dict[str, object] = {}
    for name, apex, triangles in (
        ("selected_rows_only", False, False),
        ("rows_plus_complete_apex_classes", True, False),
        ("selected_rows_plus_triangles", False, True),
        ("rows_complete_apex_classes_plus_triangles", True, True),
    ):
        profiles[name] = solve_profile(apex, triangles)

    strongest = profiles["rows_complete_apex_classes_plus_triangles"]
    strongest_smt2 = strongest.pop("_smt2", None)
    for profile in profiles.values():
        profile.pop("_smt2", None)

    result = {
        "schema": "unique5-distinct-biapex-kalmanson-v1",
        "order_semantics": "0, perm(2,4,7), 10, perm(1,3,6), 11, perm(5,8,9)",
        "compatible_order_count": len(cap_orders()),
        "strict_normalization": "all strict homogeneous slacks are normalized to >= 1",
        "profiles": profiles,
    }
    cores = all_order_cores()

    encoded = json.dumps(result, indent=2, sort_keys=True) + "\n"
    encoded_cores = json.dumps(cores, indent=2, sort_keys=True) + "\n"
    if args.check:
        assert RESULT_PATH.read_text() == encoded
        assert CORE_PATH.read_text() == encoded_cores
        print(f"CHECKED {RESULT_PATH.name}")
        print(f"CHECKED {CORE_PATH.name}")
    else:
        RESULT_PATH.write_text(encoded)
        CORE_PATH.write_text(encoded_cores)
        if strongest["status"] == "SAT" and strongest_smt2 is not None:
            SMT2_PATH.write_text(str(strongest_smt2) + "\n(check-sat)\n")
        elif SMT2_PATH.exists():
            SMT2_PATH.unlink()
        print(encoded, end="")


if __name__ == "__main__":
    main()
