#!/usr/bin/env python3
"""Classify exact-five all-one L1 cores by ordinal/Farkas/triangle force."""

from __future__ import annotations

import argparse
import itertools
import json
from collections import Counter, defaultdict, deque
from pathlib import Path

import z3


N = 13
VERTICES = tuple(range(N))
EDGES = tuple(itertools.combinations(VERTICES, 2))
EDGE_ID = {pair: index for index, pair in enumerate(EDGES)}


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance loop")
    return (left, right) if left < right else (right, left)


class DSU:
    def __init__(self) -> None:
        self.parent = list(range(len(EDGES)))

    def find(self, value: int) -> int:
        if self.parent[value] != value:
            self.parent[value] = self.find(self.parent[value])
        return self.parent[value]

    def union(self, left: tuple[int, int], right: tuple[int, int]) -> None:
        a = self.find(EDGE_ID[left])
        b = self.find(EDGE_ID[right])
        if a != b:
            self.parent[b] = a


def quotient(core: dict[str, object]) -> DSU:
    result = DSU()
    for item in core["constraints"]:
        kind = item["kind"]
        if kind == "rowEquality":
            center = int(item["center"])
            result.union(
                edge(center, int(item["left"])),
                edge(center, int(item["right"])),
            )
        elif kind == "frontierFirstEquality":
            result.union(
                edge(4, int(item["q"])), edge(4, int(item["w"]))
            )
    return result


def shortest_ordinal_cycle(core: dict[str, object]) -> dict[str, object] | None:
    dsu = quotient(core)
    relation: dict[tuple[int, int], dict[str, object]] = {}
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        left = (edge(a, c), edge(b, d))
        for name, right in (
            ("K1", (edge(a, b), edge(c, d))),
            ("K2", (edge(a, d), edge(b, c))),
        ):
            coefficients: dict[int, int] = defaultdict(int)
            for item in left:
                coefficients[dsu.find(EDGE_ID[item])] += 1
            for item in right:
                coefficients[dsu.find(EDGE_ID[item])] -= 1
            reduced = {key: value for key, value in coefficients.items() if value}
            witness = {"kind": name, "quadruple": [a, b, c, d]}
            if not reduced:
                return {"length": 1, "steps": [witness], "kind": "strictLoop"}
            if len(reduced) != 2 or sorted(reduced.values()) != [-1, 1]:
                continue
            smaller = next(key for key, value in reduced.items() if value == -1)
            larger = next(key for key, value in reduced.items() if value == 1)
            relation.setdefault((smaller, larger), witness)

    adjacency: dict[int, list[int]] = defaultdict(list)
    for smaller, larger in relation:
        adjacency[smaller].append(larger)
    best: list[int] | None = None
    for start in sorted(adjacency):
        parent: dict[int, int | None] = {start: None}
        pending: deque[int] = deque([start])
        found: list[int] | None = None
        while pending and found is None:
            current = pending.popleft()
            for target in adjacency[current]:
                if target == start:
                    path = [current]
                    while path[-1] != start:
                        prior = parent[path[-1]]
                        assert prior is not None
                        path.append(prior)
                    found = list(reversed(path)) + [start]
                    break
                if target not in parent:
                    parent[target] = current
                    pending.append(target)
        if found is not None and (best is None or len(found) < len(best)):
            best = found
    if best is None:
        return None
    steps = [relation[(left, right)] for left, right in zip(best, best[1:])]
    return {"length": len(steps), "steps": steps, "kind": "strictCycle"}


CONSTRUCTORS = {
    ("K1", 0, 0): ("k1CancelA", 0),
    ("K1", 1, 0): ("k1CancelB", 1),
    ("K1", 0, 1): ("k1CancelC", 2),
    ("K1", 1, 1): ("k1CancelD", 3),
    ("K2", 0, 0): ("k2CancelA", 0),
    ("K2", 1, 1): ("k2CancelB", 1),
    ("K2", 0, 1): ("k2CancelC", 2),
    ("K2", 1, 0): ("k2CancelD", 3),
}


def direct_equality_groups(core: dict[str, object]) -> dict[int, DSU]:
    groups: dict[int, DSU] = {}
    for item in core["constraints"]:
        if item["kind"] == "rowEquality":
            center = int(item["center"])
            group = groups.setdefault(center, DSU())
            group.union(
                edge(center, int(item["left"])),
                edge(center, int(item["right"])),
            )
        elif item["kind"] == "frontierFirstEquality":
            group = groups.setdefault(4, DSU())
            group.union(edge(4, int(item["q"])), edge(4, int(item["w"])))
    return groups


def shortest_direct_cancel_cycle(
    core: dict[str, object], production_only: bool
) -> dict[str, object] | None:
    dsu = quotient(core)
    groups = direct_equality_groups(core)
    relation: dict[tuple[int, int], dict[str, object]] = {}
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        quadruple = (a, b, c, d)
        left = (edge(a, c), edge(b, d))
        for name, right in (
            ("K1", (edge(a, b), edge(c, d))),
            ("K2", (edge(a, d), edge(b, c))),
        ):
            for left_index in (0, 1):
                for right_index in (0, 1):
                    constructor, center_index = CONSTRUCTORS[
                        (name, left_index, right_index)
                    ]
                    if production_only and constructor not in {
                        "k1CancelC", "k2CancelA"
                    }:
                        continue
                    center = quadruple[center_index]
                    group = groups.get(center)
                    if group is None:
                        continue
                    left_edge = left[left_index]
                    right_edge = right[right_index]
                    if group.find(EDGE_ID[left_edge]) != group.find(EDGE_ID[right_edge]):
                        continue
                    smaller = dsu.find(EDGE_ID[right[1 - right_index]])
                    larger = dsu.find(EDGE_ID[left[1 - left_index]])
                    relation.setdefault((smaller, larger), {
                        "kind": name,
                        "quadruple": list(quadruple),
                        "constructor": constructor,
                        "center": center,
                    })
    loops = [value for (left, right), value in relation.items() if left == right]
    if loops:
        return {"length": 1, "steps": [loops[0]], "kind": "strictLoop"}
    adjacency: dict[int, list[int]] = defaultdict(list)
    for smaller, larger in relation:
        adjacency[smaller].append(larger)
    best: list[int] | None = None
    for start in sorted(adjacency):
        parent: dict[int, int | None] = {start: None}
        pending: deque[int] = deque([start])
        found: list[int] | None = None
        while pending and found is None:
            current = pending.popleft()
            for target in adjacency[current]:
                if target == start:
                    path = [current]
                    while path[-1] != start:
                        prior = parent[path[-1]]
                        assert prior is not None
                        path.append(prior)
                    found = list(reversed(path)) + [start]
                    break
                if target not in parent:
                    parent[target] = current
                    pending.append(target)
        if found is not None and (best is None or len(found) < len(best)):
            best = found
    if best is None:
        return None
    return {
        "length": len(best) - 1,
        "steps": [relation[pair] for pair in zip(best, best[1:])],
        "kind": "strictCycle",
    }


def metric_table() -> dict[tuple[int, int], z3.ArithRef]:
    return {pair: z3.Real(f"d_{pair[0]}_{pair[1]}") for pair in EDGES}


def distance(table: dict[tuple[int, int], z3.ArithRef],
             left: int, right: int) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0)
    return table[edge(left, right)]


def kalmanson_solver() -> tuple[z3.Solver, dict[tuple[int, int], z3.ArithRef]]:
    table = metric_table()
    solver = z3.Solver()
    solver.set(timeout=5_000)
    for variable in table.values():
        solver.add(variable >= 1)
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diagonals = distance(table, a, c) + distance(table, b, d)
        solver.add(diagonals >= distance(table, a, b) + distance(table, c, d) + 1)
        solver.add(diagonals >= distance(table, a, d) + distance(table, b, c) + 1)
    return solver, table


def core_atom(table: dict[tuple[int, int], z3.ArithRef],
              item: dict[str, object]) -> z3.BoolRef:
    kind = item["kind"]
    if kind == "rowEquality":
        center = int(item["center"])
        return distance(table, center, int(item["left"])) == distance(
            table, center, int(item["right"])
        )
    if kind == "frontierFirstEquality":
        return distance(table, 4, int(item["q"])) == distance(
            table, 4, int(item["w"])
        )
    if kind == "frontierSecondSeparation":
        left = distance(table, 8, int(item["q"]))
        right = distance(table, 8, int(item["w"]))
        return z3.Or(left >= right + 1, right >= left + 1)
    raise ValueError(kind)


def scope(core: dict[str, object]) -> tuple[str, tuple[str, ...]]:
    families = tuple(sorted({
        str(item["family"])
        for item in core["constraints"]
        if item["kind"] == "rowEquality"
    }))
    specials = {item["kind"] for item in core["constraints"]
                if item["kind"] != "rowEquality"}
    if specials:
        return "frontier", families
    if set(families) <= {"m"}:
        return "mOnly", families
    return "otherEqualityFamily", families


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("checkpoints", nargs="+", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    solver, table = kalmanson_solver()
    records = []
    summary: Counter[str] = Counter()
    by_orbit: dict[str, Counter[str]] = defaultdict(Counter)
    family_words: Counter[str] = Counter()
    cycle_lengths: Counter[int] = Counter()
    direct_cancel_counts: Counter[str] = Counter()

    for path in args.checkpoints:
        payload = json.loads(path.read_text())
        orbit = str(payload["orbit"])
        for index, core in enumerate(payload["concrete_core_blocks"]):
            surface, families = scope(core)
            family_words["+".join(families) or "none"] += 1
            cycle = shortest_ordinal_cycle(core)
            direct_cycle = shortest_direct_cancel_cycle(core, False)
            production_cycle = shortest_direct_cancel_cycle(core, True)
            direct_cancel_counts[
                "directCancelAll" if direct_cycle is not None else "noDirectCancelAll"
            ] += 1
            direct_cancel_counts[
                "productionDirectCancel" if production_cycle is not None
                else "noProductionDirectCancel"
            ] += 1
            if cycle is not None:
                force = "quotientOrdinalCycle"
                cycle_lengths[int(cycle["length"])] += 1
            else:
                solver.push()
                solver.add(*[core_atom(table, item) for item in core["constraints"]])
                status = solver.check()
                solver.pop()
                if status == z3.unsat:
                    force = "fullKalmansonFarkas"
                elif status == z3.sat:
                    force = "triangleRequired"
                else:
                    force = "kalmansonUnknown"
            category = f"{surface}:{force}"
            summary[category] += 1
            by_orbit[orbit][category] += 1
            records.append({
                "orbit": orbit,
                "core_index": index,
                "scope": surface,
                "families": list(families),
                "force": force,
                "cycle": cycle,
                "direct_cancel_cycle": direct_cycle,
                "production_direct_cancel_cycle": production_cycle,
                "constraint_count": len(core["constraints"]),
            })

    result = {
        "schema": "p97-exact5-all-one-core-classification-v1",
        "input_count": len(args.checkpoints),
        "core_count": len(records),
        "summary": dict(sorted(summary.items())),
        "by_orbit": {
            orbit: dict(sorted(counter.items()))
            for orbit, counter in sorted(by_orbit.items())
        },
        "family_words": dict(sorted(family_words.items())),
        "ordinal_cycle_lengths": {
            str(length): count for length, count in sorted(cycle_lengths.items())
        },
        "direct_cancel_counts": dict(sorted(direct_cancel_counts.items())),
        "records": records,
        "interpretation": {
            "quotientOrdinalCycle":
                "row equalities quotient a Kalmanson comparison graph to a strict cycle",
            "fullKalmansonFarkas":
                "not an ordinal comparison cycle, but Kalmanson plus equalities is UNSAT",
            "triangleRequired":
                "Kalmanson plus equalities is SAT; the original UNSAT uses triangle inequalities",
        },
    }
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    temporary.replace(args.output)
    print(json.dumps({key: result[key] for key in (
        "core_count", "summary", "by_orbit", "family_words",
        "ordinal_cycle_lengths",
        "direct_cancel_counts",
    )}, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
