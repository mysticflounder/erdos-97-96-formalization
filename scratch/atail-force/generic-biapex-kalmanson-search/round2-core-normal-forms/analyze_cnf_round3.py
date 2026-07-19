#!/usr/bin/env python3
"""Search full fixed-row tables for small alternate Kalmanson Farkas cores."""

from __future__ import annotations

import argparse
import itertools
import json
from collections import defaultdict, deque
from pathlib import Path

from analyze import (
    constraint_vector,
    deletion_minimize,
    farkas_multipliers,
    is_unsat,
    normalized_form,
)


Vector = tuple[tuple[tuple[int, int], int], ...]


def add_vectors(terms: list[tuple[int, dict[tuple[int, int], int]]]) -> Vector:
    total: dict[tuple[int, int], int] = defaultdict(int)
    for multiplier, vector in terms:
        for edge, coefficient in vector.items():
            total[edge] += multiplier * coefficient
    return tuple(sorted((edge, coefficient) for edge, coefficient in total.items() if coefficient))


def negate(vector: Vector) -> Vector:
    return tuple((edge, -coefficient) for edge, coefficient in vector)


def all_row_equalities(rows: dict[int, tuple[int, ...]]) -> tuple[str, ...]:
    return tuple(
        f"row_{center}_{left}_{right}"
        for center, support in sorted(rows.items())
        for left, right in itertools.combinations(sorted(support), 2)
    )


def all_kalmanson(n: int) -> tuple[str, ...]:
    return tuple(
        f"kal{kind}_{a}_{b}_{c}_{d}"
        for a, b, c, d in itertools.combinations(range(n), 4)
        for kind in (1, 2)
    )


def equality_combination_table(equalities: tuple[str, ...], max_count: int = 3):
    vectors = {name: constraint_vector(name)[1] for name in equalities}
    table: dict[Vector, tuple[tuple[str, int], ...]] = {}
    for count in range(1, max_count + 1):
        for names in itertools.combinations(equalities, count):
            for signs in itertools.product((-1, 1), repeat=count):
                vector = add_vectors(
                    [(sign, vectors[name]) for name, sign in zip(names, signs, strict=True)]
                )
                candidate = tuple(zip(names, signs, strict=True))
                previous = table.get(vector)
                if previous is None or candidate < previous:
                    table[vector] = candidate
    return table


def equality_graph(equalities: tuple[str, ...]):
    graph: dict[tuple[int, int], list[tuple[tuple[int, int], str]]] = defaultdict(list)
    for name in equalities:
        _kind, vector = constraint_vector(name)
        if len(vector) != 2 or set(vector.values()) != {-1, 1}:
            raise AssertionError(name)
        left, right = vector
        graph[left].append((right, name))
        graph[right].append((left, name))
    return graph


def graph_distance(graph, source, target) -> int | None:
    queue = deque([(source, 0)])
    seen = {source}
    while queue:
        node, distance = queue.popleft()
        if node == target:
            return distance
        for neighbor, _name in graph.get(node, ()):
            if neighbor not in seen:
                seen.add(neighbor)
                queue.append((neighbor, distance + 1))
    return None


def short_paths(graph, source, target, extra: int = 2, hard_cap: int = 7):
    minimum = graph_distance(graph, source, target)
    if minimum is None:
        return []
    cap = min(hard_cap, minimum + extra)
    answer: list[tuple[str, ...]] = []

    def visit(node, seen, path):
        if len(path) > cap:
            return
        if node == target:
            answer.append(tuple(path))
            return
        for neighbor, name in graph.get(node, ()):
            if neighbor in seen:
                continue
            visit(neighbor, seen | {neighbor}, [*path, name])

    visit(source, {source}, [])
    return answer


def best_single_kalmanson_path_core(kalmanson: tuple[str, ...], equalities: tuple[str, ...]):
    graph = equality_graph(equalities)
    best: tuple[str, ...] | None = None
    for name in kalmanson:
        _kind, vector = constraint_vector(name)
        positive = [edge for edge, coefficient in vector.items() if coefficient == 1]
        negative = [edge for edge, coefficient in vector.items() if coefficient == -1]
        for pairing in (tuple(zip(positive, negative)), tuple(zip(positive, reversed(negative)))):
            path_families = [short_paths(graph, source, target) for source, target in pairing]
            if any(not family for family in path_families):
                continue
            for first, second in itertools.product(*path_families):
                rows = tuple(sorted(set(first) | set(second)))
                if best is not None and len(rows) >= len(best) - 1:
                    continue
                candidate = (name, *rows)
                if not is_unsat(candidate):
                    continue
                minimized = deletion_minimize(candidate)
                if len(minimized) == len(candidate):
                    best = candidate
    return best


def best_small_hash_core(kalmanson: tuple[str, ...], equality_table):
    vectors = {name: constraint_vector(name)[1] for name in kalmanson}
    best: tuple[str, ...] | None = None
    for name in kalmanson:
        target = negate(add_vectors([(1, vectors[name])]))
        rows = equality_table.get(target)
        if rows is not None:
            candidate = (name, *(row for row, _sign in rows))
            if best is None or (len(candidate), candidate) < (len(best), best):
                best = candidate
    for index, left in enumerate(kalmanson):
        for right in kalmanson[index + 1 :]:
            target = negate(add_vectors([(1, vectors[left]), (1, vectors[right])]))
            rows = equality_table.get(target)
            if rows is None:
                continue
            candidate = (left, right, *(row for row, _sign in rows))
            if best is None or (len(candidate), candidate) < (len(best), best):
                best = candidate
    return best


def classify(names: tuple[str, ...]) -> str:
    inequality_count = sum(name.startswith("kal") for name in names)
    row_count = len(names) - inequality_count
    if inequality_count == 1:
        return f"ONE_KALMANSON_{row_count}_ROW_EQUALITY_CLOSURE"
    if inequality_count == 2 and row_count == 3:
        return "TWO_KALMANSON_THREE_ROW"
    return f"{inequality_count}_KALMANSON_{row_count}_ROW"


def abstract_normal_form(names: tuple[str, ...], multipliers) -> tuple[tuple[object, ...], ...]:
    """Forget ambient gaps while retaining each quadruple's ordered roles."""
    vertices = sorted({int(field) for name in names for field in name.split("_")[1:]})
    best = None
    for target_roles in itertools.permutations(range(len(vertices))):
        role = dict(zip(vertices, target_roles, strict=True))
        transformed = []
        for name in names:
            fields = name.split("_")
            kind = fields[0]
            mapped = tuple(role[int(field)] for field in fields[1:])
            if kind == "row":
                center, left, right = mapped
                mapped = (center, *sorted((left, right)))
            transformed.append((kind, *mapped, int(multipliers[name])))
        candidate = tuple(sorted(transformed))
        if best is None or candidate < best:
            best = candidate
    assert best is not None
    return best


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input_dir", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--limit", type=int)
    args = parser.parse_args()

    records = []
    shape_counts: dict[str, int] = defaultdict(int)
    normal_counts: dict[tuple[tuple[str, int], ...], int] = defaultdict(int)
    abstract_counts: dict[tuple[tuple[object, ...], ...], int] = defaultdict(int)
    hash_normal_counts: dict[tuple[tuple[str, int], ...], int] = defaultdict(int)
    hash_abstract_counts: dict[tuple[tuple[object, ...], ...], int] = defaultdict(int)
    paths = sorted(args.input_dir.glob("iteration_*.full_lra.json"))
    if args.limit is not None:
        paths = paths[: args.limit]
    for path in paths:
        payload = json.loads(path.read_text(encoding="utf-8"))
        rows = {int(center): tuple(support) for center, support in payload["rows"].items()}
        equalities = all_row_equalities(rows)
        kalmanson = all_kalmanson(int(payload["n"]))
        equality_table = equality_combination_table(equalities)
        hash_core = best_small_hash_core(kalmanson, equality_table)
        path_core = best_single_kalmanson_path_core(kalmanson, equalities)
        candidates = [core for core in (hash_core, path_core) if core is not None]
        if not candidates:
            alternate = tuple(payload["metric_core"])
            source = "ORACLE_CORE_NO_SMALL_ALTERNATE_FOUND"
        else:
            alternate = min(
                candidates,
                key=lambda core: (
                    len(core),
                    sum(name.startswith("kal") for name in core),
                    sum(name.startswith("row") for name in core),
                    core,
                ),
            )
            alternate = deletion_minimize(alternate)
            source = "FULL_ROW_TABLE_ALTERNATE"
        multipliers = farkas_multipliers(alternate)
        form = normalized_form(alternate, multipliers)
        abstract_form = abstract_normal_form(alternate, multipliers)
        hash_payload = None
        if hash_core is not None:
            hash_core = deletion_minimize(hash_core)
            hash_multipliers = farkas_multipliers(hash_core)
            hash_form = normalized_form(hash_core, hash_multipliers)
            hash_abstract_form = abstract_normal_form(hash_core, hash_multipliers)
            hash_normal_counts[hash_form] += 1
            hash_abstract_counts[hash_abstract_form] += 1
            hash_payload = {
                "shape": classify(hash_core),
                "constraint_count": len(hash_core),
                "constraints": list(hash_core),
                "multipliers": {
                    name: str(multiplier) for name, multiplier in hash_multipliers.items()
                },
                "normal_form": [
                    [name, coefficient]
                    for name, coefficient in hash_form
                ],
                "abstract_normal_form": [list(constraint) for constraint in hash_abstract_form],
            }
        one_k_payload = None
        if path_core is not None:
            path_core = deletion_minimize(path_core)
            path_multipliers = farkas_multipliers(path_core)
            one_k_payload = {
                "constraint_count": len(path_core),
                "row_equality_count": sum(name.startswith("row") for name in path_core),
                "constraints": list(path_core),
                "multipliers": {
                    name: str(multiplier) for name, multiplier in path_multipliers.items()
                },
                "normal_form": [
                    [name, coefficient]
                    for name, coefficient in normalized_form(path_core, path_multipliers)
                ],
            }
        shape = classify(alternate)
        shape_counts[shape] += 1
        normal_counts[form] += 1
        abstract_counts[abstract_form] += 1
        records.append(
            {
                "iteration": int(path.name.split("_")[1].split(".")[0]),
                "source": path.name,
                "alternate_source": source,
                "oracle_constraint_count": len(payload["metric_core"]),
                "alternate_constraint_count": len(alternate),
                "inequality_count": sum(name.startswith("kal") for name in alternate),
                "row_equality_count": sum(name.startswith("row") for name in alternate),
                "shape": shape,
                "constraints": list(alternate),
                "multipliers": {name: str(multiplier) for name, multiplier in multipliers.items()},
                "normal_form": [[name, coefficient] for name, coefficient in form],
                "abstract_normal_form": [list(constraint) for constraint in abstract_form],
                "small_hash_alternate": hash_payload,
                "one_kalmanson_alternate": one_k_payload,
            }
        )

    output = {
        "schema": "p97-cnf-round3-full-row-small-alternate-cores-v1",
        "record_count": len(records),
        "full_row_alternate_count": sum(
            record["alternate_source"] == "FULL_ROW_TABLE_ALTERNATE" for record in records
        ),
        "shape_counts": dict(sorted(shape_counts.items())),
        "normal_form_count": len(normal_counts),
        "normal_form_frequencies": sorted(normal_counts.values(), reverse=True),
        "abstract_normal_form_count": len(abstract_counts),
        "abstract_normal_form_frequencies": sorted(abstract_counts.values(), reverse=True),
        "one_kalmanson_alternate_count": sum(
            record["one_kalmanson_alternate"] is not None for record in records
        ),
        "two_kalmanson_three_row_alternate_count": sum(
            record["small_hash_alternate"] is not None
            and record["small_hash_alternate"]["shape"] == "TWO_KALMANSON_THREE_ROW"
            for record in records
        ),
        "two_kalmanson_three_row_order_normal_form_count": len(hash_normal_counts),
        "two_kalmanson_three_row_order_normal_form_frequencies": sorted(
            hash_normal_counts.values(), reverse=True
        ),
        "two_kalmanson_three_row_abstract_normal_form_count": len(hash_abstract_counts),
        "two_kalmanson_three_row_abstract_normal_form_frequencies": sorted(
            hash_abstract_counts.values(), reverse=True
        ),
        "records": records,
    }
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
