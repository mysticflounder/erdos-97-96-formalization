#!/usr/bin/env python3
"""CEGAR for a fixed-card-15 closed-carrier Kalmanson shadow.

The structural outer is the 15-role abstraction in
``search_kalmanson_aware_survivor.py``.  Each model is first checked by exact
ordinal Kalmanson closure.  An ordinal cycle is reduced to its positive class
memberships and blocked.  Ordinal-acyclic models receive a complete QF_LRA
Kalmanson check; a deletion-minimal equality dependency is blocked on UNSAT.

SAT is an exact rational Kalmanson shadow, not a planar Euclidean/MEC model.
Neither SAT nor UNSAT covers the live residual: the outer silently identifies
the named roles with the entire carrier and permits no minimality-forced row
escape to an additional carrier point.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import time
from collections import deque
from dataclasses import dataclass
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location(
    "unique5_kalmanson_outer", HERE / "search_kalmanson_aware_survivor.py"
)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError("cannot import structural outer")
OUTER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(OUTER)

Atom = tuple[int, int]
Literal = tuple[str, int]


def edge(a: int, b: int) -> Atom:
    if a == b:
        raise ValueError("zero distance is not an atom")
    return (a, b) if a < b else (b, a)


class DisjointSet:
    def __init__(self, items):
        self.parent = {item: item for item in items}

    def find(self, item):
        if self.parent[item] != item:
            self.parent[item] = self.find(self.parent[item])
        return self.parent[item]

    def union(self, left, right):
        left, right = self.find(left), self.find(right)
        if left != right:
            self.parent[right] = left


@dataclass(frozen=True)
class EqualityReason:
    left: Atom
    right: Atom
    literals: tuple[Literal, ...]


@dataclass(frozen=True)
class StrictReason:
    source: Atom
    target: Atom
    quadruple: tuple[int, int, int, int]
    canceled_positive: Atom
    canceled_negative: Atom


def classes_from_payload(payload, retained: set[Literal] | None = None):
    rows = {int(c): set(row) for c, row in payload["rows"].items()}
    a0, b0 = map(set, payload["first_apex_classes"])

    def selected(kind: str, support: set[int]):
        if retained is None:
            return support
        return {p for p in support if (kind, p) in retained}

    classes = [
        (0, "a", selected("a", a0)),
        (0, "b", selected("b", b0)),
        (1, "fixed", set(OUTER.EXACT_FIVE)),
    ]
    for center in OUTER.V:
        if center in {0, 1}:
            continue
        classes.append((center, f"m{center}", selected(f"m{center}", rows[center])))
    return classes


def equality_reasons(payload, retained: set[Literal] | None = None):
    answer = []
    for center, kind, support in classes_from_payload(payload, retained):
        points = sorted(support)
        if len(points) < 2:
            continue
        anchor = points[0]
        for point in points[1:]:
            literals = () if kind == "fixed" else ((kind, anchor), (kind, point))
            answer.append(
                EqualityReason(edge(center, anchor), edge(center, point), literals)
            )
    return tuple(answer)


def equality_path(start, target, adjacency):
    if start == target:
        return ()
    parent = {start: None}
    queue = deque([start])
    while queue and target not in parent:
        current = queue.popleft()
        for neighbor, reason in adjacency.get(current, ()):
            if neighbor in parent:
                continue
            parent[neighbor] = (current, reason)
            queue.append(neighbor)
    if target not in parent:
        raise AssertionError(f"missing equality path {start} -> {target}")
    path = []
    current = target
    while current != start:
        predecessor, reason = parent[current]
        path.append(reason)
        current = predecessor
    path.reverse()
    return tuple(path)


def shortest_cycle(strict, dsu):
    adjacency = {}
    for reason in strict:
        source, target = dsu.find(reason.source), dsu.find(reason.target)
        if source == target:
            return (reason,)
        adjacency.setdefault(source, []).append(reason)
    best = None
    for start in sorted(adjacency):
        queue = deque([start])
        parent = {start: None}
        terminal = None
        while queue and terminal is None:
            current = queue.popleft()
            for reason in adjacency.get(current, ()):
                target = dsu.find(reason.target)
                if target == start:
                    terminal = (current, reason)
                    break
                if target not in parent:
                    parent[target] = (current, reason)
                    queue.append(target)
        if terminal is None:
            continue
        current, closing = terminal
        path = [closing]
        while current != start:
            predecessor, reason = parent[current]
            path.append(reason)
            current = predecessor
        path.reverse()
        candidate = tuple(path)
        if best is None or len(candidate) < len(best):
            best = candidate
    return best


def ordinal_cycle(payload, retained: set[Literal] | None = None):
    atoms = tuple(itertools.combinations(OUTER.V, 2))
    dsu = DisjointSet(atoms)
    equalities = equality_reasons(payload, retained)
    adjacency = {}
    for reason in equalities:
        dsu.union(reason.left, reason.right)
        adjacency.setdefault(reason.left, []).append((reason.right, reason))
        adjacency.setdefault(reason.right, []).append((reason.left, reason))

    strict = []
    for ia, ib, ic, id_ in itertools.combinations(range(OUTER.N), 4):
        a, b, c, d = (OUTER.ORDER[i] for i in (ia, ib, ic, id_))
        positive = (edge(a, c), edge(b, d))
        for negative in (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        ):
            for pi in range(2):
                for ni in range(2):
                    if dsu.find(positive[pi]) != dsu.find(negative[ni]):
                        continue
                    strict.append(
                        StrictReason(
                            negative[1 - ni], positive[1 - pi], (a, b, c, d),
                            positive[pi], negative[ni]
                        )
                    )
    cycle = shortest_cycle(strict, dsu)
    if cycle is None:
        return None

    literals = set()
    canceled_paths = []
    connector_paths = []
    for index, reason in enumerate(cycle):
        canceled = equality_path(
            reason.canceled_positive, reason.canceled_negative, adjacency
        )
        following = cycle[(index + 1) % len(cycle)]
        connector = equality_path(reason.target, following.source, adjacency)
        canceled_paths.append(canceled)
        connector_paths.append(connector)
        for equality in (*canceled, *connector):
            literals.update(equality.literals)
    return {
        "cycle": cycle,
        "literals": tuple(sorted(literals)),
        "canceled_paths": canceled_paths,
        "connector_paths": connector_paths,
    }


def minimize_ordinal_literals(payload, literals):
    retained = list(sorted(set(literals)))
    index = 0
    while index < len(retained):
        trial = retained[:index] + retained[index + 1:]
        if ordinal_cycle(payload, set(trial)) is not None:
            retained = trial
        else:
            index += 1
    replay = ordinal_cycle(payload, set(retained))
    if replay is None:
        raise AssertionError("minimized ordinal core did not replay")
    return tuple(retained), replay


def full_kalmanson(payload, timeout_ms: int):
    variables = {
        atom: z3.Real(f"d_{atom[0]}_{atom[1]}")
        for atom in itertools.combinations(OUTER.V, 2)
    }

    def value(a, b):
        return variables[edge(a, b)]

    formulas = {}
    dependencies = {}
    serial = 0
    for center, kind, support in classes_from_payload(payload):
        points = sorted(support)
        anchor = points[0]
        for point in points[1:]:
            name = f"eq_{serial}"
            serial += 1
            formulas[name] = value(center, anchor) == value(center, point)
            dependencies[name] = () if kind == "fixed" else (
                (kind, anchor), (kind, point)
            )
    kalmanson = []
    for ia, ib, ic, id_ in itertools.combinations(range(OUTER.N), 4):
        a, b, c, d = (OUTER.ORDER[i] for i in (ia, ib, ic, id_))
        diagonal = value(a, c) + value(b, d)
        kalmanson.append(diagonal >= value(a, b) + value(c, d) + 1)
        kalmanson.append(diagonal >= value(a, d) + value(b, c) + 1)

    solver = z3.SolverFor("QF_LRA")
    solver.set(timeout=timeout_ms, random_seed=0)
    solver.add(*kalmanson)
    for name in dependencies:
        solver.assert_and_track(formulas[name], z3.Bool(name))
    verdict = solver.check()
    if verdict == z3.unknown:
        return {"status": "UNKNOWN", "reason": solver.reason_unknown()}
    if verdict == z3.sat:
        model = solver.model()
        return {
            "status": "SAT",
            "distances": {
                f"{a},{b}": str(model.eval(variable, model_completion=True))
                for (a, b), variable in variables.items()
            },
        }

    core = [str(item) for item in solver.unsat_core()]
    index = 0
    while index < len(core):
        trial = core[:index] + core[index + 1:]
        probe = z3.SolverFor("QF_LRA")
        probe.set(timeout=timeout_ms, random_seed=1)
        probe.add(*kalmanson, *(formulas[name] for name in trial))
        result = probe.check()
        if result == z3.unknown:
            return {"status": "UNKNOWN", "reason": probe.reason_unknown()}
        if result == z3.unsat:
            core = trial
        else:
            index += 1
    literals = tuple(sorted({literal for name in core for literal in dependencies[name]}))
    if not literals:
        raise AssertionError("Kalmanson core unexpectedly has no variable class data")
    return {"status": "UNSAT_CORE", "core_names": core, "literals": literals}


def symbolic_literal(literal, member, class0a, class0b):
    kind, point = literal
    if kind == "a":
        return class0a[point]
    if kind == "b":
        return class0b[point]
    if kind.startswith("m"):
        return member[int(kind[1:]), point]
    raise AssertionError(literal)


def decode(model, member, blocker, class0a, class0b):
    return {
        "order": list(OUTER.ORDER),
        "caps": [sorted(cap) for cap in OUTER.CAPS],
        "exact_five": sorted(OUTER.EXACT_FIVE),
        "first_apex_classes": [
            [p for p in OUTER.V if z3.is_true(model.eval(class0a[p], model_completion=True))],
            [p for p in OUTER.V if z3.is_true(model.eval(class0b[p], model_completion=True))],
        ],
        "rows": {
            str(c): [p for p in OUTER.V if z3.is_true(model.eval(member[c, p], model_completion=True))]
            for c in OUTER.V
        },
        "blockers": {
            str(s): next(c for c in OUTER.V if z3.is_true(model.eval(blocker[s, c], model_completion=True)))
            for s in OUTER.V
        },
    }


def has_proper_k4_subset(payload):
    classes_by_center = {}
    for center, _kind, support in classes_from_payload(payload):
        classes_by_center.setdefault(center, []).append(set(support))
    for mask in range(1, (1 << OUTER.N) - 1):
        subset = {p for p in OUTER.V if mask & (1 << p)}
        if all(
            any(len(radius_class & subset) >= 4
                for radius_class in classes_by_center[center])
            for center in subset
        ):
            return sorted(subset)
    return None


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--seconds", type=float, default=300.0)
    parser.add_argument("--outer-timeout-ms", type=int, default=10_000)
    parser.add_argument("--lra-timeout-ms", type=int, default=10_000)
    parser.add_argument("--max-iterations", type=int, default=100_000)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    started = time.monotonic()
    deadline = started + args.seconds
    solver, member, blocker, class0a, class0b, _distance = OUTER.build(
        args.outer_timeout_ms, args.seed, with_metric=False
    )
    ordinal_cores = []
    linear_cores = []
    result = None
    for iteration in range(1, args.max_iterations + 1):
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            result = {"status": "UNKNOWN", "reason": "wall budget"}
            break
        solver.set(timeout=min(args.outer_timeout_ms, remaining_ms))
        verdict = solver.check()
        if verdict != z3.sat:
            result = {
                "status": str(verdict).upper(),
                "reason": solver.reason_unknown() if verdict == z3.unknown else None,
            }
            break
        payload = decode(solver.model(), member, blocker, class0a, class0b)
        cycle = ordinal_cycle(payload)
        if cycle is not None:
            literals, replay = minimize_ordinal_literals(payload, cycle["literals"])
            solver.add(z3.Not(z3.And(*(
                symbolic_literal(item, member, class0a, class0b)
                for item in literals
            ))))
            ordinal_cores.append({
                "iteration": iteration,
                "cycle_length": len(replay["cycle"]),
                "literals": [list(item) for item in literals],
            })
            if iteration % 100 == 0:
                print(json.dumps({
                    "iteration": iteration,
                    "ordinal_cores": len(ordinal_cores),
                    "linear_cores": len(linear_cores),
                }), flush=True)
            continue

        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            result = {"status": "UNKNOWN", "reason": "wall budget before LRA"}
            break
        lra = full_kalmanson(payload, min(args.lra_timeout_ms, remaining_ms))
        if lra["status"] == "UNKNOWN":
            result = {"status": "UNKNOWN", "reason": "LRA: " + lra["reason"]}
            break
        if lra["status"] == "UNSAT_CORE":
            literals = tuple(map(tuple, lra["literals"]))
            solver.add(z3.Not(z3.And(*(
                symbolic_literal(item, member, class0a, class0b)
                for item in literals
            ))))
            linear_cores.append({
                "iteration": iteration,
                "core_names": lra["core_names"],
                "literals": [list(item) for item in literals],
            })
            continue

        payload["distances"] = lra["distances"]
        bad_subset = has_proper_k4_subset(payload)
        if bad_subset is not None:
            # This should be excluded by strong connectivity of the selected
            # row table.  Fail closed if the independent complete-class audit
            # finds otherwise.
            result = {
                "status": "INTERNAL_ERROR_PROPER_K4_SUBSET",
                "subset": bad_subset,
            }
            break
        result = {
            "status": "SAT_VERIFIED_STRICT_KALMANSON_SHADOW",
            "epistemic_status": "EXACT_QF_LRA_NOT_EUCLIDEAN_NOT_LEAN",
            "payload": payload,
            "proper_k4_subset": None,
        }
        break
    else:
        result = {"status": "UNKNOWN", "reason": "iteration budget"}

    if result is None:
        raise RuntimeError("no terminal result")
    result.update({
        "elapsed_seconds": time.monotonic() - started,
        "ordinal_core_count": len(ordinal_cores),
        "linear_core_count": len(linear_cores),
        "iterations": len(ordinal_cores) + len(linear_cores) + 1,
        "first_ordinal_cores": ordinal_cores[:10],
        "first_linear_cores": linear_cores[:10],
    })
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
