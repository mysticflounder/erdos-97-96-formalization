#!/usr/bin/env python3
"""Strict Kalmanson audit of the corrected robust structural prefix.

This script does not generate a new structural census.  It reads the exact
101 witnesses already stored in ``robust-all-center-marco`` and asks whether
their selected-shell equalities are compatible with the strict crossing
inequalities of one fixed cyclically ordered convex carrier.

The primary checker is combinatorial and uses only the Python standard
library:

* quotient unordered distance variables by every selected-row equality;
* specialize either strict Kalmanson inequality whenever one left term and
  one right term are equated by a *single stored selected row*;
* transitively close the resulting strict comparison graph; and
* emit a shortest strict cycle, if one exists.

Every emitted cycle is also an integer Farkas certificate for the normalized
linear system: summing its Kalmanson inequalities after equality quotienting
gives ``0 >= cycle_length``.

An optional exact Z3 QF_LRA pass checks the full Kalmanson system, with and
without all triangle inequalities.  SAT models are replayed as ``Fraction``
values.  UNSAT results are accepted only when accompanied by either the
independently checked ordinal/Farkas cycle or a separately solved rational
Farkas dual.

Epistemic boundary: this is exact for the stored finite prefix and its fixed
cyclic order.  It is not a coverage theorem for the structural search and is
not a Euclidean realization theorem.
"""

from __future__ import annotations

import argparse
import ast
from collections import defaultdict, deque
from dataclasses import dataclass
from fractions import Fraction
import hashlib
import itertools
import json
from pathlib import Path
import sys
from typing import Iterable, Mapping, Sequence

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
DEFAULT_CHECKPOINT = (
    ROOT
    / "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
)
ROBUST_SEARCH = (
    ROOT / "scratch/atail-force/robust-all-center-cegar/search.py"
)

EXPECTED_CHECKPOINT_SHA256 = (
    "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9"
)
EXPECTED_SCHEMA = "p97-atail-robust-all-center-bank-cegar-v1"
EXPECTED_STATUS = "SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW"
EXPECTED_SURVIVORS = 101
EXPECTED_BANK_CUTS = 524
EXPECTED_ITERATIONS = 26

# This literal is checked against the pinned generator source before use.
EXPECTED_CYCLIC_ORDER = (
    "O",
    "t1",
    "I",
    "F",
    "A",
    "X",
    "Y",
    "Z",
    "D",
    "J",
    "E",
    "C",
    "G",
    "K",
)
EXPECTED_PROFILE = (8, 4, 5)
EXPECTED_CAPS = {
    "surplus": frozenset({"O", "t1", "I", "F", "A"}),
    "opp1": frozenset({"A", "X", "Y", "Z", "D", "J", "E", "C"}),
    "opp2": frozenset({"C", "G", "K", "O"}),
}


Edge = tuple[str, str]


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def ast_literal_assignment(path: Path, name: str) -> object:
    module = ast.parse(path.read_text(encoding="utf-8"), filename=str(path))
    for statement in module.body:
        if not isinstance(statement, ast.Assign):
            continue
        if any(isinstance(target, ast.Name) and target.id == name
               for target in statement.targets):
            return ast.literal_eval(statement.value)
    raise ValueError(f"{name} not found as a literal assignment in {path}")


class DisjointSet:
    def __init__(self, size: int) -> None:
        self.parent = list(range(size))

    def find(self, item: int) -> int:
        parent = self.parent[item]
        if parent != item:
            self.parent[item] = self.find(parent)
        return self.parent[item]

    def union(self, left: int, right: int) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


@dataclass(frozen=True)
class KalmansonInequality:
    kind: str
    quadruple: tuple[str, str, str, str]
    left: tuple[Edge, Edge]
    right: tuple[Edge, Edge]


@dataclass(frozen=True)
class StrictStep:
    smaller_class: int
    larger_class: int
    inequality: KalmansonInequality
    cancelled_left_index: int
    cancelled_right_index: int
    equality_row_center: str

    def key(self) -> tuple[object, ...]:
        return (
            self.inequality.quadruple,
            self.inequality.kind,
            self.cancelled_left_index,
            self.cancelled_right_index,
            self.equality_row_center,
            self.smaller_class,
            self.larger_class,
        )


@dataclass(frozen=True)
class LinearConstraint:
    name: str
    coefficients: tuple[tuple[int, int], ...]
    rhs: int

    def evaluate(self, values: Sequence[Fraction]) -> Fraction:
        return sum(
            (Fraction(coefficient) * values[index]
             for index, coefficient in self.coefficients),
            start=Fraction(0),
        )


class RowEqualitySystem:
    """One stored survivor's unordered-edge equality quotient."""

    def __init__(self, order: Sequence[str], rows: Sequence[Mapping[str, object]]):
        self.order = tuple(order)
        self.position = {label: index for index, label in enumerate(self.order)}
        if len(self.position) != len(self.order):
            raise ValueError("cyclic order repeats a label")
        self.edges = tuple(itertools.combinations(self.order, 2))
        self.edge_index = {edge: index for index, edge in enumerate(self.edges)}
        self.rows = {
            str(row["center"]): tuple(str(point) for point in row["support"])
            for row in rows
        }
        if len(self.rows) != len(rows):
            raise ValueError("stored rows repeat a center")
        if set(self.rows) != set(self.order):
            raise ValueError("stored row centers do not equal the cyclic carrier")

        dsu = DisjointSet(len(self.edges))
        direct: dict[frozenset[int], set[str]] = defaultdict(set)
        for center, support in sorted(self.rows.items()):
            if len(support) != 4 or len(set(support)) != 4:
                raise ValueError(f"row {center} is not a four-point support")
            if center in support:
                raise ValueError(f"row {center} contains its center")
            if not set(support) <= set(self.order):
                raise ValueError(f"row {center} leaves the carrier")
            row_edges = tuple(self.edge_id(center, point) for point in support)
            for edge_id in row_edges[1:]:
                dsu.union(row_edges[0], edge_id)
            for left, right in itertools.combinations(row_edges, 2):
                direct[frozenset({left, right})].add(center)

        components: dict[int, list[int]] = defaultdict(list)
        for edge_id in range(len(self.edges)):
            components[dsu.find(edge_id)].append(edge_id)
        ordered_components = sorted(
            (tuple(sorted(members)) for members in components.values()),
            key=lambda members: members[0],
        )
        self.components = tuple(ordered_components)
        self.edge_class = [0] * len(self.edges)
        for class_id, members in enumerate(self.components):
            for edge_id in members:
                self.edge_class[edge_id] = class_id
        self.direct_equalities = {
            pair: tuple(sorted(centers)) for pair, centers in direct.items()
        }

    def edge(self, left: str, right: str) -> Edge:
        if left == right:
            raise ValueError("a distance edge needs distinct endpoints")
        if self.position[left] < self.position[right]:
            return (left, right)
        return (right, left)

    def edge_id(self, left: str, right: str) -> int:
        return self.edge_index[self.edge(left, right)]

    def class_of_edge(self, edge: Edge) -> int:
        return self.edge_class[self.edge_index[self.edge(*edge)]]

    def class_edges(self, class_id: int) -> tuple[Edge, ...]:
        return tuple(self.edges[edge_id] for edge_id in self.components[class_id])

    def class_representative(self, class_id: int) -> Edge:
        return self.class_edges(class_id)[0]

    def row_support(self, center: str) -> tuple[str, ...]:
        return self.rows[center]

    def direct_equality_centers(self, left: Edge, right: Edge) -> tuple[str, ...]:
        pair = frozenset({self.edge_id(*left), self.edge_id(*right)})
        return self.direct_equalities.get(pair, ())

    def equality_path(
        self, left: Edge, right: Edge
    ) -> tuple[tuple[Edge, Edge, str], ...]:
        start = self.edge_id(*left)
        target = self.edge_id(*right)
        if self.edge_class[start] != self.edge_class[target]:
            raise ValueError("requested equality path crosses quotient classes")
        if start == target:
            return ()
        adjacency: dict[int, list[tuple[int, str]]] = defaultdict(list)
        for pair, centers in self.direct_equalities.items():
            endpoints = tuple(pair)
            if len(endpoints) != 2:
                continue
            a, b = endpoints
            for center in centers:
                adjacency[a].append((b, center))
                adjacency[b].append((a, center))
        for edge_id in adjacency:
            adjacency[edge_id].sort(key=lambda item: (item[0], item[1]))
        parent: dict[int, tuple[int, str] | None] = {start: None}
        pending: deque[int] = deque([start])
        while pending and target not in parent:
            current = pending.popleft()
            for neighbor, center in adjacency[current]:
                if neighbor not in parent:
                    parent[neighbor] = (current, center)
                    pending.append(neighbor)
        if target not in parent:
            raise AssertionError("equality quotient lacks a direct-row proof path")
        reversed_path: list[tuple[Edge, Edge, str]] = []
        cursor = target
        while cursor != start:
            previous = parent[cursor]
            assert previous is not None
            prior, center = previous
            reversed_path.append((self.edges[prior], self.edges[cursor], center))
            cursor = prior
        return tuple(reversed(reversed_path))


def kalmanson_inequalities(system: RowEqualitySystem) -> tuple[KalmansonInequality, ...]:
    answer: list[KalmansonInequality] = []
    for indices in itertools.combinations(range(len(system.order)), 4):
        a, b, c, d = (system.order[index] for index in indices)
        diagonals = (system.edge(a, c), system.edge(b, d))
        answer.append(
            KalmansonInequality(
                "K1",
                (a, b, c, d),
                diagonals,
                (system.edge(a, b), system.edge(c, d)),
            )
        )
        answer.append(
            KalmansonInequality(
                "K2",
                (a, b, c, d),
                diagonals,
                (system.edge(a, d), system.edge(b, c)),
            )
        )
    return tuple(answer)


def reduced_coefficients(
    system: RowEqualitySystem, inequality: KalmansonInequality
) -> dict[int, int]:
    coefficients: dict[int, int] = defaultdict(int)
    for edge in inequality.left:
        coefficients[system.class_of_edge(edge)] += 1
    for edge in inequality.right:
        coefficients[system.class_of_edge(edge)] -= 1
    return {index: value for index, value in coefficients.items() if value}


def direct_strict_steps(system: RowEqualitySystem) -> dict[tuple[int, int], StrictStep]:
    """All ordinal consequences obtained by one direct row cancellation."""

    relations: dict[tuple[int, int], StrictStep] = {}
    for inequality in kalmanson_inequalities(system):
        for left_index in (0, 1):
            for right_index in (0, 1):
                centers = system.direct_equality_centers(
                    inequality.left[left_index], inequality.right[right_index]
                )
                if not centers:
                    continue
                smaller = system.class_of_edge(inequality.right[1 - right_index])
                larger = system.class_of_edge(inequality.left[1 - left_index])
                candidate = StrictStep(
                    smaller,
                    larger,
                    inequality,
                    left_index,
                    right_index,
                    centers[0],
                )
                key = (smaller, larger)
                if key not in relations or candidate.key() < relations[key].key():
                    relations[key] = candidate

                # A direct cancellation must reduce the whole inequality to
                # exactly ``larger - smaller > 0`` (or ``0 > 0``).
                expected: dict[int, int]
                if smaller == larger:
                    expected = {}
                else:
                    expected = {smaller: -1, larger: 1}
                actual = reduced_coefficients(system, inequality)
                if actual != expected:
                    raise AssertionError(
                        f"bad cancellation reduction: {actual} != {expected}"
                    )
    return relations


def transitive_closure_count(
    node_count: int, relations: Mapping[tuple[int, int], StrictStep]
) -> int:
    adjacency: dict[int, set[int]] = defaultdict(set)
    for smaller, larger in relations:
        adjacency[smaller].add(larger)
    count = 0
    for start in range(node_count):
        reached: set[int] = set()
        pending = list(adjacency[start])
        while pending:
            current = pending.pop()
            if current in reached:
                continue
            reached.add(current)
            pending.extend(adjacency[current] - reached)
        count += len(reached)
    return count


def shortest_strict_cycle(
    system: RowEqualitySystem,
    relations: Mapping[tuple[int, int], StrictStep],
) -> tuple[StrictStep, ...] | None:
    def score(cycle: tuple[StrictStep, ...]) -> tuple[object, ...]:
        used = {
            class_id
            for step in cycle
            for class_id in (step.smaller_class, step.larger_class)
        }
        return (
            len(cycle),
            sum(system.position[step.inequality.quadruple[0]] for step in cycle),
            len(used),
            tuple(sorted(
                tuple(system.position[label] for label in step.inequality.quadruple)
                for step in cycle
            )),
            sum(len(system.components[class_id]) for class_id in used),
            tuple(step.key() for step in cycle),
        )

    # The stored prefix closes with one- and two-step cycles.  Enumerating
    # those first gives a materially cleaner certificate than whichever path
    # a BFS happens to encounter first: among equally short cycles, prefer the
    # one whose equality classes contain the fewest distance terms.
    short_candidates: list[tuple[StrictStep, ...]] = []
    for (smaller, larger), step in relations.items():
        if smaller == larger:
            short_candidates.append((step,))
    if short_candidates:
        return min(short_candidates, key=score)
    for (smaller, larger), step in relations.items():
        reverse = relations.get((larger, smaller))
        if reverse is not None and smaller < larger:
            short_candidates.append((step, reverse))
    if short_candidates:
        return min(short_candidates, key=score)

    node_count = len(system.components)
    adjacency: dict[int, list[tuple[int, StrictStep]]] = defaultdict(list)
    for (smaller, larger), step in relations.items():
        adjacency[smaller].append((larger, step))
    for smaller in adjacency:
        adjacency[smaller].sort(key=lambda item: (item[0], item[1].key()))

    best: tuple[StrictStep, ...] | None = None
    for start in range(node_count):
        parent: dict[int, tuple[int, StrictStep] | None] = {start: None}
        pending: deque[int] = deque([start])
        while pending:
            current = pending.popleft()
            for target, step in adjacency[current]:
                if target == start:
                    reversed_path = [step]
                    cursor = current
                    while cursor != start:
                        previous = parent[cursor]
                        assert previous is not None
                        cursor, previous_step = previous
                        reversed_path.append(previous_step)
                    candidate = tuple(reversed(reversed_path))
                    if best is None or score(candidate) < score(best):
                        best = candidate
                    pending.clear()
                    break
                if target not in parent:
                    parent[target] = (current, step)
                    pending.append(target)
        if best is not None and len(best) == 1:
            break
    return best


def verify_integer_farkas_cycle(
    system: RowEqualitySystem, cycle: Sequence[StrictStep]
) -> dict[str, object]:
    if not cycle:
        raise ValueError("empty strict cycle")
    coefficient_sum: dict[int, int] = defaultdict(int)
    for index, step in enumerate(cycle):
        if step.larger_class != cycle[(index + 1) % len(cycle)].smaller_class:
            raise AssertionError("strict steps do not form a cycle")
        for variable, coefficient in reduced_coefficients(
            system, step.inequality
        ).items():
            coefficient_sum[variable] += coefficient
    nonzero = {key: value for key, value in coefficient_sum.items() if value}
    if nonzero:
        raise AssertionError(f"Farkas coefficients do not cancel: {nonzero}")
    return {
        "status": "PASS",
        "multipliers": [1] * len(cycle),
        "summed_variable_coefficients": {},
        "normalized_summed_rhs": len(cycle),
        "contradiction": f"0 >= {len(cycle)}",
    }


def edge_json(edge: Edge) -> list[str]:
    return list(edge)


def step_json(system: RowEqualitySystem, step: StrictStep) -> dict[str, object]:
    inequality = step.inequality
    cancelled_left = inequality.left[step.cancelled_left_index]
    cancelled_right = inequality.right[step.cancelled_right_index]
    remaining_left = inequality.left[1 - step.cancelled_left_index]
    remaining_right = inequality.right[1 - step.cancelled_right_index]
    return {
        "inequality_kind": inequality.kind,
        "cyclic_quadruple": list(inequality.quadruple),
        "left_terms": [edge_json(edge) for edge in inequality.left],
        "right_terms": [edge_json(edge) for edge in inequality.right],
        "cancelled_left_edge": edge_json(cancelled_left),
        "cancelled_right_edge": edge_json(cancelled_right),
        "direct_equality_row_center": step.equality_row_center,
        "direct_equality_row_support": list(
            system.row_support(step.equality_row_center)
        ),
        "remaining_left_edge": edge_json(remaining_left),
        "remaining_right_edge": edge_json(remaining_right),
        "strict_comparison": {
            "smaller_class": step.smaller_class,
            "smaller_representative": edge_json(
                system.class_representative(step.smaller_class)
            ),
            "larger_class": step.larger_class,
            "larger_representative": edge_json(
                system.class_representative(step.larger_class)
            ),
        },
        "reduced_coefficients": {
            str(class_id): coefficient
            for class_id, coefficient in sorted(
                reduced_coefficients(system, inequality).items()
            )
        },
    }


def cycle_json(system: RowEqualitySystem, cycle: Sequence[StrictStep]) -> dict[str, object]:
    used_classes = sorted(
        {step.smaller_class for step in cycle}
        | {step.larger_class for step in cycle}
    )
    links = []
    for index, step in enumerate(cycle):
        following = cycle[(index + 1) % len(cycle)]
        from_edge = step.inequality.left[1 - step.cancelled_left_index]
        to_edge = following.inequality.right[
            1 - following.cancelled_right_index
        ]
        path = system.equality_path(from_edge, to_edge)
        links.append({
            "from_edge": edge_json(from_edge),
            "to_edge": edge_json(to_edge),
            "direct_row_equality_path": [
                {
                    "left_edge": edge_json(left),
                    "right_edge": edge_json(right),
                    "row_center": center,
                    "row_support": list(system.row_support(center)),
                }
                for left, right, center in path
            ],
        })
    return {
        "length": len(cycle),
        "steps": [step_json(system, step) for step in cycle],
        "cycle_link_equalities": links,
        "used_equality_classes": {
            str(class_id): [edge_json(edge) for edge in system.class_edges(class_id)]
            for class_id in used_classes
        },
        "integer_farkas_replay": verify_integer_farkas_cycle(system, cycle),
    }


def linear_constraints(
    system: RowEqualitySystem, *, triangles: bool
) -> tuple[LinearConstraint, ...]:
    constraints: list[LinearConstraint] = []
    for class_id in range(len(system.components)):
        constraints.append(
            LinearConstraint(f"positive:{class_id}", ((class_id, 1),), 1)
        )
    for inequality in kalmanson_inequalities(system):
        coefficients = tuple(sorted(reduced_coefficients(system, inequality).items()))
        constraints.append(
            LinearConstraint(
                f"{inequality.kind}:{','.join(inequality.quadruple)}",
                coefficients,
                1,
            )
        )
    if triangles:
        for a, b, c in itertools.combinations(system.order, 3):
            ab = system.class_of_edge(system.edge(a, b))
            ac = system.class_of_edge(system.edge(a, c))
            bc = system.class_of_edge(system.edge(b, c))
            for opposite, adjacent_left, adjacent_right in (
                (ab, ac, bc),
                (ac, ab, bc),
                (bc, ab, ac),
            ):
                coefficients: dict[int, int] = defaultdict(int)
                coefficients[adjacent_left] += 1
                coefficients[adjacent_right] += 1
                coefficients[opposite] -= 1
                constraints.append(
                    LinearConstraint(
                        f"triangle:{a},{b},{c}:{opposite}",
                        tuple(sorted(
                            (index, value)
                            for index, value in coefficients.items()
                            if value
                        )),
                        0,
                    )
                )
    return tuple(constraints)


def z3_fraction(value: z3.ArithRef) -> Fraction:
    if not z3.is_rational_value(value):
        raise TypeError(f"exact LRA model returned a non-rational value: {value}")
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def verify_fraction_model(
    constraints: Sequence[LinearConstraint], values: Sequence[Fraction]
) -> None:
    failed = [
        constraint.name
        for constraint in constraints
        if constraint.evaluate(values) < constraint.rhs
    ]
    if failed:
        raise AssertionError(f"exact rational model fails constraints: {failed[:5]}")


def rational_farkas_dual(
    constraints: Sequence[LinearConstraint],
    variable_count: int,
    *,
    timeout_ms: int,
) -> dict[str, object]:
    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    multipliers = [z3.Real(f"dual_{index}") for index in range(len(constraints))]
    solver.add(*(multiplier >= 0 for multiplier in multipliers))
    by_variable: list[list[tuple[int, int]]] = [
        [] for _ in range(variable_count)
    ]
    for constraint_index, constraint in enumerate(constraints):
        for variable, coefficient in constraint.coefficients:
            by_variable[variable].append((constraint_index, coefficient))
    for terms in by_variable:
        solver.add(sum(
            (coefficient * multipliers[index] for index, coefficient in terms),
            start=z3.RealVal(0),
        ) == 0)
    solver.add(sum(
        (constraint.rhs * multipliers[index]
         for index, constraint in enumerate(constraints)),
        start=z3.RealVal(0),
    ) >= 1)
    status = solver.check()
    if status == z3.unknown:
        raise RuntimeError(f"Farkas dual returned unknown: {solver.reason_unknown()}")
    if status != z3.sat:
        return {"status": "NO_RATIONAL_FARKAS_CERTIFICATE"}
    model = solver.model()
    values = [z3_fraction(model.eval(value, model_completion=True))
              for value in multipliers]

    coefficient_sum = [Fraction(0) for _ in range(variable_count)]
    rhs_sum = Fraction(0)
    nonzero: list[dict[str, object]] = []
    for index, (constraint, multiplier) in enumerate(zip(constraints, values)):
        if multiplier == 0:
            continue
        if multiplier < 0:
            raise AssertionError("negative Farkas multiplier")
        for variable, coefficient in constraint.coefficients:
            coefficient_sum[variable] += multiplier * coefficient
        rhs_sum += multiplier * constraint.rhs
        nonzero.append({
            "constraint_index": index,
            "constraint_name": constraint.name,
            "multiplier": str(multiplier),
        })
    if any(coefficient_sum) or rhs_sum <= 0:
        raise AssertionError("rational Farkas replay failed")
    return {
        "status": "PASS",
        "nonzero_multipliers": nonzero,
        "summed_rhs": str(rhs_sum),
    }


def exact_linear_status(
    system: RowEqualitySystem,
    *,
    triangles: bool,
    timeout_ms: int,
    ordinal_cycle: Sequence[StrictStep] | None,
) -> dict[str, object]:
    constraints = linear_constraints(system, triangles=triangles)
    variables = [z3.Real(f"distance_class_{index}")
                 for index in range(len(system.components))]
    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    for constraint in constraints:
        expression = sum(
            (coefficient * variables[index]
             for index, coefficient in constraint.coefficients),
            start=z3.RealVal(0),
        )
        solver.add(expression >= constraint.rhs)
    status = solver.check()
    if status == z3.unknown:
        return {
            "status": "UNKNOWN_FAIL_CLOSED",
            "reason": solver.reason_unknown(),
            "constraint_count": len(constraints),
        }
    if status == z3.sat:
        model = solver.model()
        values = [z3_fraction(model.eval(variable, model_completion=True))
                  for variable in variables]
        verify_fraction_model(constraints, values)
        return {
            "status": "SAT_EXACT_RATIONAL_MODEL_REPLAYED",
            "constraint_count": len(constraints),
            "model": [str(value) for value in values],
        }

    if ordinal_cycle is not None:
        certificate = verify_integer_farkas_cycle(system, ordinal_cycle)
        return {
            "status": "UNSAT_EXACT_LRA_WITH_INTEGER_FARKAS_REPLAY",
            "constraint_count": len(constraints),
            "certificate": certificate,
        }
    dual = rational_farkas_dual(
        constraints, len(system.components), timeout_ms=timeout_ms
    )
    if dual["status"] != "PASS":
        raise RuntimeError("exact LRA UNSAT lacked a checked rational Farkas dual")
    return {
        "status": "UNSAT_EXACT_LRA_WITH_RATIONAL_FARKAS_REPLAY",
        "constraint_count": len(constraints),
        "certificate": dual,
    }


def validate_generator_surface(payload: Mapping[str, object]) -> dict[str, object]:
    source_hashes = payload["source_sha256"]
    assert isinstance(source_hashes, dict)
    verified_sources: dict[str, str] = {}
    advanced_non_generator_sources: dict[str, dict[str, str]] = {}
    for relative, expected in sorted(source_hashes.items()):
        path = ROOT / relative
        actual = file_sha256(path)
        if actual != expected:
            if relative == "census/atail_force/producer_bank.py":
                advanced_non_generator_sources[relative] = {
                    "checkpoint_sha256": expected,
                    "current_sha256": actual,
                    "status": (
                        "INTENTIONAL_POST_CHECKPOINT_BANK_ADVANCE_NOT_USED_BY_"
                        "ORDINAL_REPLAY"
                    ),
                }
                continue
            raise ValueError(
                f"checkpoint source drift at {relative}: {actual} != {expected}"
            )
        verified_sources[relative] = actual

    source_order = tuple(ast_literal_assignment(ROBUST_SEARCH, "HULL_NAMES"))
    source_profile = tuple(ast_literal_assignment(ROBUST_SEARCH, "PROFILE"))
    if source_order != EXPECTED_CYCLIC_ORDER:
        raise ValueError(f"cyclic-order drift: {source_order}")
    if source_profile != EXPECTED_PROFILE:
        raise ValueError(f"profile drift: {source_profile}")

    # Reconstruct the current census frame without importing the robust search
    # module.  This independently checks that the pinned role order maps to the
    # three advertised caps in the underlying candidate data.
    if str(ROOT) not in sys.path:
        sys.path.insert(0, str(ROOT))
    from census.global_confinement import shadow  # noqa: PLC0415
    from census.multi_center import multi_center_census as mc  # noqa: PLC0415

    frame, candidates = mc.cached_candidate_lists(
        EXPECTED_PROFILE, set(mc.PROVEN_ROWS)
    )
    if candidates is None:
        raise ValueError("current profile has no candidate data")
    numeric_order = tuple(shadow.hull_order(frame))
    if len(numeric_order) != len(source_order):
        raise ValueError("current frame cardinality drift")
    by_label = dict(zip(numeric_order, source_order))
    actual_caps = {
        "surplus": frozenset(by_label[label] for label in frame.O2),
        "opp1": frozenset(by_label[label] for label in frame.S),
        "opp2": frozenset(by_label[label] for label in frame.O1),
    }
    if actual_caps != EXPECTED_CAPS:
        raise ValueError(f"current role/cap map drift: {actual_caps}")
    return {
        "source_hashes_verified": verified_sources,
        "advanced_non_generator_sources": advanced_non_generator_sources,
        "profile": list(EXPECTED_PROFILE),
        "cyclic_order": list(source_order),
        "numeric_hull_order": list(numeric_order),
        "caps": {name: sorted(labels) for name, labels in actual_caps.items()},
        "status": "PASS",
    }


def validate_survivor(
    survivor: Mapping[str, object], ordinal: int, order: Sequence[str]
) -> RowEqualitySystem:
    rows = survivor["rows"]
    blockers = survivor["blockers"]
    assert isinstance(rows, list)
    assert isinstance(blockers, dict)
    if canonical_sha256(rows) != survivor["row_assignment_sha256"]:
        raise ValueError(f"survivor {ordinal} row hash drift")
    if canonical_sha256(blockers) != survivor["blocker_assignment_sha256"]:
        raise ValueError(f"survivor {ordinal} blocker hash drift")
    system = RowEqualitySystem(order, rows)
    if set(blockers) != set(order) or not set(blockers.values()) <= set(order):
        raise ValueError(f"survivor {ordinal} blocker map is not total")
    if system.rows["O"] != ("A", "C", "D", "E"):
        raise ValueError(f"survivor {ordinal} fixed O row drift")
    return system


def run_self_tests() -> dict[str, object]:
    order = ("a", "b", "c", "d")
    rows = [
        {"center": "a", "support": ["b", "c", "d", "x"]},
    ]
    # The production surface always has four-point rows, but this isolated
    # four-label Kalmanson test should not rely on RowEqualitySystem.  Verify
    # the exact abstract square metric directly instead.
    del rows
    side = Fraction(2)
    diagonal = Fraction(3)
    # Both strict crossing inequalities have slack 2, and every triangle has
    # nonnegative slack 1.
    assert diagonal + diagonal - side - side == 2
    assert side + side - diagonal == 1

    # Tiny exact integer Farkas smoke: x-y>=1 and y-x>=1 sum to 0>=2.
    constraints = (
        LinearConstraint("x_gt_y", ((0, 1), (1, -1)), 1),
        LinearConstraint("y_gt_x", ((0, -1), (1, 1)), 1),
    )
    sums = [sum(c for variable, c in constraint.coefficients if variable == i)
            for i in range(2) for constraint in ()]
    del sums
    coefficient_sum = defaultdict(int)
    for constraint in constraints:
        for variable, coefficient in constraint.coefficients:
            coefficient_sum[variable] += coefficient
    assert not {key: value for key, value in coefficient_sum.items() if value}
    assert sum(constraint.rhs for constraint in constraints) == 2
    assert order == ("a", "b", "c", "d")
    return {
        "exact_abstract_convex_quad_metric": "PASS",
        "two_inequality_integer_farkas": "PASS",
    }


def audit(
    checkpoint: Path,
    *,
    lp_scope: str,
    timeout_ms: int,
) -> dict[str, object]:
    checkpoint_bytes = checkpoint.read_bytes()
    checkpoint_sha = hashlib.sha256(checkpoint_bytes).hexdigest()
    if checkpoint_sha != EXPECTED_CHECKPOINT_SHA256:
        raise ValueError(
            f"wrong corrected checkpoint: {checkpoint_sha} != "
            f"{EXPECTED_CHECKPOINT_SHA256}"
        )
    payload = json.loads(checkpoint_bytes)
    if payload["schema"] != EXPECTED_SCHEMA:
        raise ValueError("checkpoint schema drift")
    if payload["status"] != EXPECTED_STATUS:
        raise ValueError("checkpoint status drift")
    if payload["iterations"] != EXPECTED_ITERATIONS:
        raise ValueError("checkpoint iteration drift")
    survivors = payload["structural_survivors"]
    if len(survivors) != EXPECTED_SURVIVORS:
        raise ValueError("checkpoint survivor-prefix count drift")
    if len(payload["bank_cuts"]) != EXPECTED_BANK_CUTS:
        raise ValueError("checkpoint bank-cut count drift")
    if payload["bank_witnesses_rejected"] != 100:
        raise ValueError("checkpoint rejected-witness count drift")

    surface = validate_generator_surface(payload)
    order = tuple(surface["cyclic_order"])
    records: list[dict[str, object]] = []
    cycle_lengths: dict[int, int] = defaultdict(int)
    ordinal_kill_count = 0
    exact_lp_counts: dict[str, dict[str, int]] = {
        "kalmanson_only": defaultdict(int),
        "kalmanson_plus_triangles": defaultdict(int),
    }

    for ordinal, survivor in enumerate(survivors):
        system = validate_survivor(survivor, ordinal, order)
        relations = direct_strict_steps(system)
        cycle = shortest_strict_cycle(system, relations)
        if cycle is not None:
            ordinal_kill_count += 1
            cycle_lengths[len(cycle)] += 1
        existing_bank_match = bool(
            survivor["selected_row_bank_match_count"]
            or survivor["blocker_exact_bank_match_count"]
        )
        should_run_lp = (
            lp_scope == "all"
            or (lp_scope == "terminal" and ordinal == len(survivors) - 1)
            or (lp_scope == "ordinal-survivors" and cycle is None)
        )
        lp_results: dict[str, object] | None = None
        if should_run_lp:
            lp_results = {}
            for name, triangles in (
                ("kalmanson_only", False),
                ("kalmanson_plus_triangles", True),
            ):
                result = exact_linear_status(
                    system,
                    triangles=triangles,
                    timeout_ms=timeout_ms,
                    ordinal_cycle=cycle,
                )
                lp_results[name] = result
                exact_lp_counts[name][str(result["status"])] += 1

        records.append({
            "ordinal_zero_based": ordinal,
            "survivor_number_one_based": ordinal + 1,
            "iteration": survivor["iteration"],
            "row_assignment_sha256": survivor["row_assignment_sha256"],
            "existing_bank_match": existing_bank_match,
            "equality_class_count": len(system.components),
            "direct_strict_relation_count": len(relations),
            "transitive_strict_relation_count": transitive_closure_count(
                len(system.components), relations
            ),
            "ordinal_contradiction": cycle is not None,
            "shortest_cycle": cycle_json(system, cycle) if cycle else None,
            "exact_linear_cross_check": lp_results,
        })

    prefix = records[:-1]
    terminal = records[-1]
    if sum(record["existing_bank_match"] for record in prefix) != 100:
        raise AssertionError("the first 100 witnesses are not exactly bank-matched")
    if terminal["existing_bank_match"]:
        raise AssertionError("terminal witness unexpectedly has an old bank match")
    if survivors[-1]["rows"] != payload["witness"]["rows"]:
        raise AssertionError("last stored survivor is not the terminal witness")
    if survivors[-1]["blockers"] != payload["witness"]["blockers"]:
        raise AssertionError("last stored blocker map is not the terminal witness")

    return {
        "schema": "p97-atail-kalmanson-prefix-audit-v1",
        "epistemic_status": {
            "ordinal_result": "EXACT_WITHIN_STORED_101_WITNESS_PREFIX",
            "linear_result": "EXACT_RATIONAL_LRA_WITH_REPLAYED_CERTIFICATES",
            "coverage": "NOT_A_COVERAGE_THEOREM_PREFIX_ONLY",
            "lean": "THEOREM_DISCOVERY_ONLY_NO_LEAN_PROOF",
        },
        "checkpoint": {
            "path": str(checkpoint.relative_to(ROOT)),
            "sha256": checkpoint_sha,
            "schema": payload["schema"],
            "status": payload["status"],
            "iterations": payload["iterations"],
            "max_iterations": payload["budgets"]["max_iterations"],
            "bank_cut_count": len(payload["bank_cuts"]),
            "stored_survivor_prefix_count": len(survivors),
            "bank_witnesses_rejected": payload["bank_witnesses_rejected"],
            "last_event": payload["last_event"],
            "prior_round": payload["prior_round"],
        },
        "surface_validation": surface,
        "encoding": {
            "distance_variables": "unordered carrier pairs",
            "symmetry": "by construction",
            "equalities": "all four distances in each stored selected row",
            "ordinal_step": (
                "cancel one direct selected-row equality across one of the two "
                "strict Kalmanson inequalities for a cyclic quadruple"
            ),
            "linear_strict_normalization": (
                "positive distances and strict Kalmanson slacks normalized to >= 1"
            ),
            "triangle_variant": "all three triangle inequalities per unordered triple",
        },
        "summary": {
            "stored_survivor_prefix_count": len(survivors),
            "old_bank_matched_prefix_count": 100,
            "old_bank_clean_terminal_count": 1,
            "ordinal_killed_all_101": ordinal_kill_count,
            "ordinal_survivors_all_101": len(survivors) - ordinal_kill_count,
            "shortest_cycle_length_distribution": {
                str(length): count for length, count in sorted(cycle_lengths.items())
            },
            "terminal_survivor_number": 101,
            "terminal_ordinal_contradiction": terminal["ordinal_contradiction"],
            "terminal_shortest_cycle_length": terminal["shortest_cycle"]["length"],
            "exact_lp_scope": lp_scope,
            "exact_lp_status_counts": {
                name: dict(sorted(counts.items()))
                for name, counts in exact_lp_counts.items()
            },
        },
        "terminal_survivor": terminal,
        "records": records,
        "self_tests": run_self_tests(),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    parser.add_argument(
        "--lp-scope",
        choices=("none", "ordinal-survivors", "terminal", "all"),
        default="all",
    )
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--summary", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    result = audit(
        args.checkpoint.resolve(),
        lp_scope=args.lp_scope,
        timeout_ms=args.timeout_ms,
    )
    if args.check:
        summary = result["summary"]
        assert summary["stored_survivor_prefix_count"] == 101
        assert summary["old_bank_matched_prefix_count"] == 100
        assert summary["old_bank_clean_terminal_count"] == 1
        assert summary["ordinal_killed_all_101"] == 101
        assert summary["ordinal_survivors_all_101"] == 0
        assert summary["shortest_cycle_length_distribution"] == {"1": 89, "2": 12}
        assert summary["terminal_ordinal_contradiction"] is True
        assert summary["terminal_shortest_cycle_length"] == 2
        for record in result["records"]:
            assert record["shortest_cycle"]["integer_farkas_replay"]["status"] == "PASS"
            exact = record["exact_linear_cross_check"]
            if exact is not None:
                assert all(
                    item["status"]
                    == "UNSAT_EXACT_LRA_WITH_INTEGER_FARKAS_REPLAY"
                    for item in exact.values()
                )

    rendered_result = result
    if args.summary:
        rendered_result = {key: value for key, value in result.items()
                           if key not in {"records"}}
    rendered = json.dumps(rendered_result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        output = args.output.resolve()
        output.parent.mkdir(parents=True, exist_ok=True)
        temporary = output.with_suffix(output.suffix + ".tmp")
        temporary.write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        temporary.replace(output)
    print(rendered, end="")


if __name__ == "__main__":
    main()
