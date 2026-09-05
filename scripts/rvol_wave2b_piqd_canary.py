#!/usr/bin/env python3
"""Deterministic Fin-9 Wave 2b encoder and bounded PiQD-session canary.

The pure encoder and certificate routines in this module do not invoke a
solver.  The ``preview`` and ``prepare`` CLI actions are likewise local-only.
Only the separately selected ``run`` action opens a PiQD session, and the live
transport reaches it exclusively through ``piqc session ...`` commands.

This is a discovery-only finite abstraction.  Its SAT/UNSAT dispositions do
not state a source-level or Lean theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
import subprocess
import tempfile
import unicodedata
from collections import deque
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any, Protocol

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_CONTRACT_PATH = ROOT / "docs/specs/rvol-wave2b-piqd-canary-v1.json"
NUM_VERTICES = 9
NUM_VARIABLES = 72
ITERATION_SCHEMA = "rvol-wave2b-iteration/v1"
TERMINAL_SCHEMA = "rvol-wave2b-terminal/v1"
VARIABLE_MAP_SCHEMA = "rvol-wave2b-variable-map/v1"
ROOT_CLAUSE_INVENTORY_SCHEMA = "rvol-wave2b-root-clause-inventory/v1"
SEMANTIC_REFINEMENT = "SEMANTIC_REFINEMENT"
EXPECTED_CONTRACT_SCHEMA = "rvol-wave2b-piqd-canary-contract/v1"
EXPECTED_CLAIM_IDENTITY = "rvol-wave2b-fin9-natural-order-all-row-atomic-kalmanson-v1"
TERMINAL_STATUSES = frozenset(
    {
        "DISCOVERY_UNSAT",
        "ALIVE_UNRESOLVED_ABSTRACT_MODEL",
        "UNKNOWN_FAIL_CLOSED",
        "INVALID_ENCODING_MODEL",
        "CERTFAIL",
        "MAXITER",
        "PIQD_ERROR",
    }
)
DETAIL_STATUSES = frozenset({"INVALID_ENCODING_MODEL", "CERTFAIL", "PIQD_ERROR"})

Membership = tuple[int, int]
DistancePair = tuple[int, int]
Clause = tuple[int, ...]
Rows = tuple[tuple[int, ...], ...]


class CanaryError(RuntimeError):
    """A contract, encoding, transport, or artifact gate failed closed."""


def canonical_json_bytes(value: Any) -> bytes:
    """Canonical compact ASCII JSON, without a trailing newline."""

    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=True,
        allow_nan=False,
    ).encode("ascii")


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def bounded_detail(value: object) -> str:
    """Canonical 1..1000-code-point diagnostic text for failure terminals."""

    text = str(value)
    normalized_characters: list[str] = []
    for character in text:
        category = unicodedata.category(character)
        if category in {"Cc", "Cf"}:
            normalized_characters.append(" ")
        elif category == "Cs":
            normalized_characters.append("\ufffd")
        else:
            normalized_characters.append(character)
    normalized = "".join(normalized_characters)
    collapsed = " ".join(normalized.split())
    if not collapsed:
        collapsed = "unspecified failure"
    return collapsed[-1000:]


def _failure_detail(prefix: str, value: object, prior: str | None = None) -> str:
    item = bounded_detail(f"{prefix}: {value}")
    return bounded_detail(f"{prior}; {item}" if prior else item)


def _self_hash(record: Mapping[str, Any], field: str) -> str:
    unsigned = dict(record)
    unsigned.pop(field, None)
    return sha256_bytes(canonical_json_bytes(unsigned))


def _reject_json_constant(value: str) -> None:
    raise CanaryError(f"nonstandard JSON constant {value!r}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise CanaryError(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def strict_json_bytes(payload: bytes, label: str) -> Any:
    try:
        return json.loads(
            payload,
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_json_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise CanaryError(f"{label} is not strict JSON: {exc}") from exc


@dataclass(frozen=True)
class Contract:
    payload: Mapping[str, Any]
    exact_bytes: bytes
    contract_sha256: str
    file_sha256: str
    max_iterations: int
    conflict_limit: int
    solver_name: str


def load_contract(path: Path = DEFAULT_CONTRACT_PATH) -> Contract:
    exact = path.read_bytes()
    payload = strict_json_bytes(exact, "Wave 2b contract")
    if not isinstance(payload, dict):
        raise CanaryError("Wave 2b contract must be a JSON object")
    if payload.get("schema") != EXPECTED_CONTRACT_SCHEMA:
        raise CanaryError("Wave 2b contract has the wrong schema")
    claim = payload.get("claim")
    if not isinstance(claim, dict) or claim.get("identity") != EXPECTED_CLAIM_IDENTITY:
        raise CanaryError("Wave 2b contract has the wrong claim identity")
    declared_hash = payload.get("contract_sha256")
    if not isinstance(declared_hash, str) or declared_hash != _self_hash(
        payload, "contract_sha256"
    ):
        raise CanaryError("Wave 2b contract self-hash mismatch")
    cell = payload.get("cell")
    variables = payload.get("variables")
    budgets = payload.get("budgets")
    toolchain = payload.get("toolchain")
    if not isinstance(cell, dict) or cell.get("cardinality") != NUM_VERTICES:
        raise CanaryError("contract does not declare the Fin-9 cell")
    if not isinstance(variables, dict) or variables.get("count") != NUM_VARIABLES:
        raise CanaryError("contract does not declare the 72-variable map")
    if not isinstance(budgets, dict) or not isinstance(toolchain, dict):
        raise CanaryError("contract is missing budgets or toolchain")
    max_iterations = budgets.get("max_iterations")
    conflict_limit = budgets.get("conflict_limit_per_solve")
    solver_name = toolchain.get("solver")
    if type(max_iterations) is not int or max_iterations <= 0:
        raise CanaryError("contract max_iterations must be a positive integer")
    if type(conflict_limit) is not int or conflict_limit <= 0:
        raise CanaryError("contract conflict limit must be a positive integer")
    if not isinstance(solver_name, str) or not solver_name:
        raise CanaryError("contract solver name must be nonempty")
    return Contract(
        payload=payload,
        exact_bytes=exact,
        contract_sha256=declared_hash,
        file_sha256=sha256_bytes(exact),
        max_iterations=max_iterations,
        conflict_limit=conflict_limit,
        solver_name=solver_name,
    )


def var_id(center: int, point: int) -> int:
    """The contract's one-based variable id for x(center, point)."""

    if not (0 <= center < NUM_VERTICES and 0 <= point < NUM_VERTICES):
        raise ValueError("center and point must lie in Fin 9")
    if center == point:
        raise ValueError("center membership variables are intentionally omitted")
    return 1 + 8 * center + (point if point < center else point - 1)


def membership_of_var(variable: int) -> Membership:
    if type(variable) is not int or not (1 <= variable <= NUM_VARIABLES):
        raise ValueError("variable id must lie in 1..72")
    center, offset = divmod(variable - 1, 8)
    point = offset if offset < center else offset + 1
    return center, point


def variable_map() -> tuple[dict[str, Any], ...]:
    return tuple(
        {
            "var": variable,
            "center": membership_of_var(variable)[0],
            "point": membership_of_var(variable)[1],
            "semantic": True,
        }
        for variable in range(1, NUM_VARIABLES + 1)
    )


def variable_map_record(contract_sha256: str) -> dict[str, Any]:
    record: dict[str, Any] = {
        "schema": VARIABLE_MAP_SCHEMA,
        "contract_sha256": contract_sha256,
        "num_vars": NUM_VARIABLES,
        "variables": list(variable_map()),
    }
    record["variable_map_sha256"] = _self_hash(record, "variable_map_sha256")
    return record


def between_cyclic(start: int, point: int, end: int) -> bool:
    """Whether point is strictly on the positive natural-order arc start→end."""

    if len({start, point, end}) != 3:
        return False
    if start < end:
        return start < point < end
    return point > start or point < end


def _exactly_k(literals: Sequence[int], k: int) -> list[Clause]:
    values = tuple(literals)
    if not (0 <= k <= len(values)):
        raise ValueError("invalid exact-cardinality bound")
    clauses: list[Clause] = []
    for subset in itertools.combinations(values, len(values) - k + 1):
        clauses.append(tuple(subset))
    for subset in itertools.combinations(values, k + 1):
        clauses.append(tuple(-value for value in subset))
    return clauses


def root_clause_partitions() -> tuple[tuple[str, tuple[Clause, ...]], ...]:
    """Emit ROOT_STATIC producer partitions in the contract's exact order."""

    row_cardinality: list[Clause] = []
    for center in range(NUM_VERTICES):
        row_vars = [
            var_id(center, point) for point in range(NUM_VERTICES) if point != center
        ]
        row_cardinality.extend(_exactly_k(row_vars, 4))

    # Center exclusion has no clauses: x(c,c) is absent from the universe.
    center_exclusion: list[Clause] = []

    source_cover: list[Clause] = []
    for point in range(NUM_VERTICES):
        source_cover.append(
            tuple(
                var_id(center, point)
                for center in range(NUM_VERTICES)
                if center != point
            )
        )

    row_intersection: list[Clause] = []
    for first, second in itertools.combinations(range(NUM_VERTICES), 2):
        common_domain = [
            point for point in range(NUM_VERTICES) if point not in {first, second}
        ]
        for triple in itertools.combinations(common_domain, 3):
            row_intersection.append(
                tuple(
                    literal
                    for point in triple
                    for literal in (-var_id(first, point), -var_id(second, point))
                )
            )

    pair_codegree: list[Clause] = []
    for first, second in itertools.combinations(range(NUM_VERTICES), 2):
        possible_centers = [
            center for center in range(NUM_VERTICES) if center not in {first, second}
        ]
        for centers in itertools.combinations(possible_centers, 3):
            pair_codegree.append(
                tuple(
                    literal
                    for center in centers
                    for literal in (-var_id(center, first), -var_id(center, second))
                )
            )

    strong_connectivity: list[Clause] = []
    all_mask = (1 << NUM_VERTICES) - 1
    for mask in range(1, all_mask):
        inside = [vertex for vertex in range(NUM_VERTICES) if mask & (1 << vertex)]
        outside = [vertex for vertex in range(NUM_VERTICES) if not mask & (1 << vertex)]
        strong_connectivity.append(
            tuple(var_id(center, point) for center in inside for point in outside)
        )

    shared_pair_alternation: list[Clause] = []
    for first, second in itertools.combinations(range(NUM_VERTICES), 2):
        common_domain = [
            point for point in range(NUM_VERTICES) if point not in {first, second}
        ]
        for p, q in itertools.combinations(common_domain, 2):
            alternates = between_cyclic(first, p, second) ^ between_cyclic(
                first, q, second
            )
            if not alternates:
                shared_pair_alternation.append(
                    (
                        -var_id(first, p),
                        -var_id(first, q),
                        -var_id(second, p),
                        -var_id(second, q),
                    )
                )

    raw = (
        ("row_cardinality_eq_4", row_cardinality),
        ("center_excluded_by_variable_omission", center_exclusion),
        ("source_cover", source_cover),
        ("row_intersection_le_2", row_intersection),
        ("pair_codegree_le_2", pair_codegree),
        ("strong_support_connectivity", strong_connectivity),
        ("shared_pair_alternation", shared_pair_alternation),
    )
    return tuple((name, validate_clauses(clauses)) for name, clauses in raw)


def root_clauses() -> tuple[Clause, ...]:
    """Flatten the exact ordered ROOT_STATIC producer inventory."""

    return tuple(
        clause
        for _producer_name, producer_clauses in root_clause_partitions()
        for clause in producer_clauses
    )


def root_clause_inventory_record(contract_sha256: str) -> dict[str, Any]:
    partitions = root_clause_partitions()
    flattened = tuple(clause for _name, clauses in partitions for clause in clauses)
    canonical_instances = [
        tuple(sorted(clause, key=lambda literal: (abs(literal), literal)))
        for clause in flattened
    ]
    record: dict[str, Any] = {
        "schema": ROOT_CLAUSE_INVENTORY_SCHEMA,
        "contract_sha256": contract_sha256,
        "producers": [
            {
                "name": name,
                "count": len(clauses),
                "clauses_sha256": sha256_bytes(
                    canonical_json_bytes([list(clause) for clause in clauses])
                ),
            }
            for name, clauses in partitions
        ],
        "total_clauses": len(flattened),
        "duplicate_clause_instances": len(flattened) - len(set(canonical_instances)),
        "root_cnf_sha256": sha256_bytes(dimacs_bytes(flattened)),
    }
    record["inventory_sha256"] = _self_hash(record, "inventory_sha256")
    return record


def validate_clauses(clauses: Sequence[Sequence[int]]) -> tuple[Clause, ...]:
    result: list[Clause] = []
    for index, clause in enumerate(clauses):
        if isinstance(clause, (str, bytes)):
            raise CanaryError(f"clause {index} is not a literal sequence")
        normalized: list[int] = []
        seen: set[int] = set()
        for literal in clause:
            if type(literal) is not int or literal == 0:
                raise CanaryError(f"clause {index} has a non-DIMACS literal")
            if abs(literal) > NUM_VARIABLES:
                raise CanaryError(f"clause {index} exceeds the variable map")
            if literal in seen:
                raise CanaryError(f"clause {index} repeats a literal")
            if -literal in seen:
                raise CanaryError(f"clause {index} is tautological")
            seen.add(literal)
            normalized.append(literal)
        result.append(tuple(normalized))
    return tuple(result)


def dimacs_bytes(clauses: Sequence[Sequence[int]]) -> bytes:
    normalized = validate_clauses(clauses)
    lines = [f"p cnf {NUM_VARIABLES} {len(normalized)}"]
    lines.extend(
        " ".join(str(literal) for literal in clause) + " 0" for clause in normalized
    )
    return ("\n".join(lines) + "\n").encode("ascii")


def parse_dimacs(payload: bytes) -> tuple[Clause, ...]:
    try:
        lines = payload.decode("ascii").splitlines()
    except UnicodeDecodeError as exc:
        raise CanaryError("DIMACS is not ASCII") from exc
    if not lines or lines[0].split() != [
        "p",
        "cnf",
        str(NUM_VARIABLES),
        str(len(lines) - 1),
    ]:
        raise CanaryError("DIMACS header does not match its body")
    clauses: list[Clause] = []
    for line_number, line in enumerate(lines[1:], start=2):
        fields = line.split()
        if not fields or fields[-1] != "0" or "0" in fields[:-1]:
            raise CanaryError(f"DIMACS line {line_number} is not one terminated clause")
        try:
            clause = tuple(int(field) for field in fields[:-1])
        except ValueError as exc:
            raise CanaryError(
                f"DIMACS line {line_number} contains non-integers"
            ) from exc
        clauses.append(clause)
    return validate_clauses(clauses)


def normalize_assignment(assignment: Sequence[int]) -> tuple[int, ...]:
    if isinstance(assignment, (str, bytes)):
        raise CanaryError("assignment must be a sequence of signed literals")
    values: dict[int, bool] = {}
    for literal in assignment:
        if type(literal) is not int or literal == 0 or abs(literal) > NUM_VARIABLES:
            raise CanaryError("assignment contains an invalid signed literal")
        variable = abs(literal)
        truth = literal > 0
        if variable in values:
            raise CanaryError("assignment repeats or contradicts a variable")
        values[variable] = truth
    if set(values) != set(range(1, NUM_VARIABLES + 1)):
        raise CanaryError("assignment is partial")
    return tuple(
        variable if values[variable] else -variable
        for variable in range(1, NUM_VARIABLES + 1)
    )


def replay_clauses(clauses: Sequence[Sequence[int]], assignment: Sequence[int]) -> bool:
    normalized = normalize_assignment(assignment)
    true_literals = set(normalized)
    return all(
        any(literal in true_literals for literal in clause) for clause in clauses
    )


def decode_rows(assignment: Sequence[int]) -> Rows:
    normalized = normalize_assignment(assignment)
    positive = {literal for literal in normalized if literal > 0}
    return tuple(
        tuple(
            point
            for point in range(NUM_VERTICES)
            if point != center and var_id(center, point) in positive
        )
        for center in range(NUM_VERTICES)
    )


def _strongly_connected(rows: Rows) -> bool:
    def reachable(start: int, reverse: bool) -> set[int]:
        seen = {start}
        queue = deque([start])
        while queue:
            current = queue.popleft()
            if reverse:
                neighbors = [
                    center for center, row in enumerate(rows) if current in row
                ]
            else:
                neighbors = list(rows[current])
            for neighbor in neighbors:
                if neighbor not in seen:
                    seen.add(neighbor)
                    queue.append(neighbor)
        return seen

    expected = set(range(NUM_VERTICES))
    return reachable(0, False) == expected and reachable(0, True) == expected


def validate_decoded_rows(rows: Sequence[Sequence[int]]) -> Rows:
    if len(rows) != NUM_VERTICES:
        raise CanaryError("decoded object does not have nine rows")
    for row in rows:
        if isinstance(row, (str, bytes)) or any(
            type(point) is not int for point in row
        ):
            raise CanaryError("decoded row contains a non-integer point")
    normalized: Rows = tuple(tuple(sorted(row)) for row in rows)
    for center, row in enumerate(normalized):
        if len(row) != 4 or len(set(row)) != 4:
            raise CanaryError("decoded row does not have four distinct members")
        if center in row or any(
            type(point) is not int or not 0 <= point < NUM_VERTICES for point in row
        ):
            raise CanaryError("decoded row violates the Fin-9 center-exclusion domain")
    if any(
        not any(point in row for row in normalized) for point in range(NUM_VERTICES)
    ):
        raise CanaryError("decoded rows violate source coverage")
    for first, second in itertools.combinations(range(NUM_VERTICES), 2):
        intersection = set(normalized[first]) & set(normalized[second])
        if len(intersection) > 2:
            raise CanaryError("decoded rows violate row-intersection at most two")
        if len(intersection) == 2:
            p, q = sorted(intersection)
            if not (
                between_cyclic(first, p, second) ^ between_cyclic(first, q, second)
            ):
                raise CanaryError("decoded rows violate shared-pair alternation")
    for p, q in itertools.combinations(range(NUM_VERTICES), 2):
        codegree = sum(p in row and q in row for row in normalized)
        if codegree > 2:
            raise CanaryError("decoded rows violate pair codegree at most two")
    if not _strongly_connected(normalized):
        raise CanaryError("decoded support graph is not strongly connected")
    return normalized


def validate_assignment(
    clauses: Sequence[Sequence[int]], assignment: Sequence[int]
) -> tuple[tuple[int, ...], Rows]:
    normalized = normalize_assignment(assignment)
    if not replay_clauses(clauses, normalized):
        raise CanaryError("PiQD assignment does not satisfy the exact current CNF")
    rows = validate_decoded_rows(decode_rows(normalized))
    return normalized, rows


def distance_pair(a: int, b: int) -> DistancePair:
    if a == b:
        raise ValueError("distance pairs require distinct vertices")
    return (a, b) if a < b else (b, a)


@dataclass(frozen=True, order=True)
class Inequality:
    indices: tuple[int, int, int, int]
    kind: str

    @property
    def order_key(self) -> tuple[int, int, int, int, int]:
        return (*self.indices, 0 if self.kind == "K1" else 1)

    def raw_vector(self) -> dict[DistancePair, int]:
        i, j, k, l = self.indices
        terms = [(distance_pair(i, k), 1), (distance_pair(j, l), 1)]
        if self.kind == "K1":
            terms.extend([(distance_pair(i, j), -1), (distance_pair(k, l), -1)])
        elif self.kind == "K2":
            terms.extend([(distance_pair(i, l), -1), (distance_pair(j, k), -1)])
        else:
            raise CanaryError("unknown Kalmanson inequality kind")
        result: dict[DistancePair, int] = {}
        for pair, coefficient in terms:
            result[pair] = result.get(pair, 0) + coefficient
        return {
            pair: coefficient for pair, coefficient in result.items() if coefficient
        }


def inequalities() -> tuple[Inequality, ...]:
    result: list[Inequality] = []
    for indices in itertools.combinations(range(NUM_VERTICES), 4):
        result.append(Inequality(indices, "K1"))
        result.append(Inequality(indices, "K2"))
    return tuple(result)


@dataclass(frozen=True)
class EqualityGraph:
    adjacency: Mapping[
        DistancePair, tuple[tuple[DistancePair, tuple[Membership, ...]], ...]
    ]
    representative: Mapping[DistancePair, DistancePair]


def equality_graph(rows: Sequence[Sequence[int]]) -> EqualityGraph:
    adjacency: dict[DistancePair, dict[DistancePair, tuple[Membership, ...]]] = {
        pair: {} for pair in itertools.combinations(range(NUM_VERTICES), 2)
    }
    for center, row in enumerate(rows):
        members = tuple(sorted(set(row)))
        for p in members:
            if p == center or not 0 <= p < NUM_VERTICES:
                raise CanaryError("equality graph received an invalid membership")
        for p, q in itertools.combinations(members, 2):
            left = distance_pair(center, p)
            right = distance_pair(center, q)
            antecedents = tuple(sorted(((center, p), (center, q))))
            adjacency[left][right] = antecedents
            adjacency[right][left] = antecedents

    representatives: dict[DistancePair, DistancePair] = {}
    for start in sorted(adjacency):
        if start in representatives:
            continue
        component: list[DistancePair] = []
        queue = [start]
        seen = {start}
        while queue:
            current = queue.pop()
            component.append(current)
            for neighbor in adjacency[current]:
                if neighbor not in seen:
                    seen.add(neighbor)
                    queue.append(neighbor)
        representative = min(component)
        for pair in component:
            representatives[pair] = representative

    frozen = {
        pair: tuple((neighbor, edges[neighbor]) for neighbor in sorted(edges))
        for pair, edges in adjacency.items()
    }
    return EqualityGraph(frozen, representatives)


def _rows_from_memberships(memberships: Sequence[Membership]) -> Rows:
    rows: list[list[int]] = [[] for _ in range(NUM_VERTICES)]
    seen: set[Membership] = set()
    for membership in memberships:
        if (
            not isinstance(membership, tuple)
            or len(membership) != 2
            or any(type(value) is not int for value in membership)
        ):
            raise CanaryError("antecedent membership is malformed")
        center, point = membership
        if not (
            0 <= center < NUM_VERTICES and 0 <= point < NUM_VERTICES and center != point
        ):
            raise CanaryError("antecedent membership is outside the variable map")
        if membership in seen:
            raise CanaryError("antecedent memberships are not duplicate-free")
        seen.add(membership)
        rows[center].append(point)
    return tuple(tuple(sorted(row)) for row in rows)


def reduced_vector(
    inequality: Inequality, graph: EqualityGraph
) -> dict[DistancePair, int]:
    result: dict[DistancePair, int] = {}
    for pair, coefficient in inequality.raw_vector().items():
        representative = graph.representative[pair]
        result[representative] = result.get(representative, 0) + coefficient
    return {
        pair: coefficient for pair, coefficient in sorted(result.items()) if coefficient
    }


def _path_antecedents(
    graph: EqualityGraph, start: DistancePair, end: DistancePair
) -> set[Membership]:
    if start == end:
        return set()
    queue = deque([start])
    parent: dict[DistancePair, tuple[DistancePair, tuple[Membership, ...]]] = {}
    seen = {start}
    while queue:
        current = queue.popleft()
        for neighbor, edge_memberships in graph.adjacency[current]:
            if neighbor in seen:
                continue
            seen.add(neighbor)
            parent[neighbor] = (current, edge_memberships)
            if neighbor == end:
                queue.clear()
                break
            queue.append(neighbor)
    if end not in parent:
        raise CanaryError("declared equality representative is unreachable")
    result: set[Membership] = set()
    current = end
    while current != start:
        previous, edge_memberships = parent[current]
        result.update(edge_memberships)
        current = previous
    return result


def _antecedents_for_inequalities(
    selected: Sequence[Inequality], graph: EqualityGraph
) -> tuple[Membership, ...]:
    result: set[Membership] = set()
    for inequality in selected:
        for pair in sorted(inequality.raw_vector()):
            result.update(_path_antecedents(graph, pair, graph.representative[pair]))
    return tuple(sorted(result))


def _vector_record(vector: Mapping[DistancePair, int]) -> list[dict[str, Any]]:
    return [
        {"distance_pair": [pair[0], pair[1]], "coefficient": coefficient}
        for pair, coefficient in sorted(vector.items())
    ]


def _inequality_record(
    inequality: Inequality, vector: Mapping[DistancePair, int]
) -> dict[str, Any]:
    return {
        "kind": inequality.kind,
        "indices": list(inequality.indices),
        "reduced_vector": _vector_record(vector),
    }


def _opposite(
    first: Mapping[DistancePair, int], second: Mapping[DistancePair, int]
) -> bool:
    if not first or not second:
        return False
    keys = set(first) | set(second)
    return all(first.get(key, 0) + second.get(key, 0) == 0 for key in keys)


def _certificate(
    kind: str,
    selected: Sequence[tuple[Inequality, Mapping[DistancePair, int]]],
    graph: EqualityGraph,
) -> dict[str, Any]:
    record: dict[str, Any] = {
        "kind": kind,
        "inequalities": [
            _inequality_record(inequality, vector) for inequality, vector in selected
        ],
        "antecedent_memberships": [
            [center, point]
            for center, point in _antecedents_for_inequalities(
                [inequality for inequality, _ in selected], graph
            )
        ],
    }
    record["certificate_sha256"] = _self_hash(record, "certificate_sha256")
    return record


def detect_atomic_certificate(rows: Sequence[Sequence[int]]) -> dict[str, Any] | None:
    """Select the first canonical ZERO_VECTOR, else OPPOSITE_PAIR certificate."""

    normalized = tuple(tuple(sorted(set(row))) for row in rows)
    graph = equality_graph(normalized)
    reduced = [
        (inequality, reduced_vector(inequality, graph)) for inequality in inequalities()
    ]
    for inequality, vector in reduced:
        if not vector:
            return _certificate("ZERO_VECTOR", [(inequality, vector)], graph)
    for left_index, (left, left_vector) in enumerate(reduced):
        for right, right_vector in reduced[left_index + 1 :]:
            if _opposite(left_vector, right_vector):
                return _certificate(
                    "OPPOSITE_PAIR",
                    [(left, left_vector), (right, right_vector)],
                    graph,
                )
    return None


def _parse_inequality_record(record: Any) -> tuple[Inequality, dict[DistancePair, int]]:
    if not isinstance(record, dict) or set(record) != {
        "kind",
        "indices",
        "reduced_vector",
    }:
        raise CanaryError("certificate inequality has the wrong shape")
    kind = record.get("kind")
    indices = record.get("indices")
    vector = record.get("reduced_vector")
    if kind not in {"K1", "K2"} or not isinstance(indices, list) or len(indices) != 4:
        raise CanaryError("certificate inequality descriptor is malformed")
    if any(type(value) is not int for value in indices) or not (
        0 <= indices[0] < indices[1] < indices[2] < indices[3] < NUM_VERTICES
    ):
        raise CanaryError("certificate inequality indices are not canonical")
    inequality = Inequality(tuple(indices), kind)
    if not isinstance(vector, list):
        raise CanaryError("certificate reduced vector must be a list")
    parsed: dict[DistancePair, int] = {}
    previous: DistancePair | None = None
    for entry in vector:
        if not isinstance(entry, dict) or set(entry) != {
            "distance_pair",
            "coefficient",
        }:
            raise CanaryError("certificate reduced-vector entry has the wrong shape")
        pair_value = entry["distance_pair"]
        coefficient = entry["coefficient"]
        if (
            not isinstance(pair_value, list)
            or len(pair_value) != 2
            or any(type(value) is not int for value in pair_value)
            or not 0 <= pair_value[0] < pair_value[1] < NUM_VERTICES
            or type(coefficient) is not int
            or coefficient == 0
        ):
            raise CanaryError("certificate reduced-vector entry is malformed")
        pair = (pair_value[0], pair_value[1])
        if previous is not None and pair <= previous:
            raise CanaryError("certificate reduced vector is not strictly sorted")
        previous = pair
        parsed[pair] = coefficient
    return inequality, parsed


def verify_certificate(certificate: Mapping[str, Any]) -> tuple[Membership, ...]:
    if set(certificate) != {
        "kind",
        "inequalities",
        "antecedent_memberships",
        "certificate_sha256",
    }:
        raise CanaryError("certificate has the wrong keys")
    if certificate.get("certificate_sha256") != _self_hash(
        certificate, "certificate_sha256"
    ):
        raise CanaryError("certificate self-hash mismatch")
    kind = certificate.get("kind")
    raw_inequalities = certificate.get("inequalities")
    raw_memberships = certificate.get("antecedent_memberships")
    if kind not in {"ZERO_VECTOR", "OPPOSITE_PAIR"}:
        raise CanaryError("certificate kind is invalid")
    expected_count = 1 if kind == "ZERO_VECTOR" else 2
    if (
        not isinstance(raw_inequalities, list)
        or len(raw_inequalities) != expected_count
    ):
        raise CanaryError("certificate has the wrong number of inequalities")
    parsed = [_parse_inequality_record(record) for record in raw_inequalities]
    if [item[0].order_key for item in parsed] != sorted(
        item[0].order_key for item in parsed
    ):
        raise CanaryError("certificate inequalities are not canonical")
    if not isinstance(raw_memberships, list):
        raise CanaryError("certificate antecedents must be a list")
    memberships: list[Membership] = []
    for value in raw_memberships:
        if not isinstance(value, list) or len(value) != 2:
            raise CanaryError("certificate antecedent membership is malformed")
        memberships.append((value[0], value[1]))
    if memberships != sorted(memberships):
        raise CanaryError("certificate antecedents are not canonical")
    rows = _rows_from_memberships(memberships)
    graph = equality_graph(rows)
    recomputed = [reduced_vector(inequality, graph) for inequality, _ in parsed]
    if recomputed != [vector for _, vector in parsed]:
        raise CanaryError("certificate reduced vectors do not replay from antecedents")
    if kind == "ZERO_VECTOR":
        if recomputed[0]:
            raise CanaryError("ZERO_VECTOR certificate is nonzero")
    elif not _opposite(recomputed[0], recomputed[1]):
        raise CanaryError("OPPOSITE_PAIR certificate vectors are not opposite")
    required = _antecedents_for_inequalities([item[0] for item in parsed], graph)
    if tuple(memberships) != required:
        raise CanaryError(
            "certificate antecedents are not the exact canonical path witness"
        )
    return tuple(memberships)


def local_cut(certificate: Mapping[str, Any]) -> dict[str, Any]:
    memberships = verify_certificate(certificate)
    clause = sorted((-var_id(center, point) for center, point in memberships), key=abs)
    if not clause:
        raise CanaryError("atomic certificate produced an empty local antecedent")
    record: dict[str, Any] = {"class": SEMANTIC_REFINEMENT, "clause": clause}
    record["cut_sha256"] = _self_hash(record, "cut_sha256")
    return record


def verify_local_cut(certificate: Mapping[str, Any], cut: Mapping[str, Any]) -> Clause:
    expected = local_cut(certificate)
    if dict(cut) != expected:
        raise CanaryError("local cut does not exactly negate its path antecedents")
    clause = tuple(expected["clause"])
    validate_clauses((clause,))
    return clause


class ArtifactSink(Protocol):
    def exists(self, relative_path: str) -> bool: ...

    def read_bytes(self, relative_path: str) -> bytes: ...

    def write_bytes(self, relative_path: str, payload: bytes) -> None: ...

    def append_bytes(self, relative_path: str, payload: bytes) -> None: ...


def _safe_relative_path(value: str) -> PurePosixPath:
    path = PurePosixPath(value)
    if (
        path.is_absolute()
        or not path.parts
        or any(part in {"", ".", ".."} for part in path.parts)
    ):
        raise CanaryError(f"unsafe artifact path {value!r}")
    return path


class DirectoryArtifactSink:
    """Atomic-file artifact sink rooted at one governed run directory."""

    def __init__(self, root: Path) -> None:
        self.root = root

    def _path(self, relative_path: str) -> Path:
        return self.root.joinpath(*_safe_relative_path(relative_path).parts)

    def exists(self, relative_path: str) -> bool:
        return self._path(relative_path).is_file()

    def read_bytes(self, relative_path: str) -> bytes:
        return self._path(relative_path).read_bytes()

    def write_bytes(self, relative_path: str, payload: bytes) -> None:
        path = self._path(relative_path)
        path.parent.mkdir(parents=True, exist_ok=True)
        temporary = path.with_name(f".{path.name}.tmp-{os.getpid()}")
        with temporary.open("wb") as handle:
            handle.write(payload)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)

    def append_bytes(self, relative_path: str, payload: bytes) -> None:
        path = self._path(relative_path)
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("ab") as handle:
            handle.write(payload)
            handle.flush()
            os.fsync(handle.fileno())


class MemoryArtifactSink:
    """Small deterministic sink for injected-transport tests."""

    def __init__(self) -> None:
        self.files: dict[str, bytes] = {}

    def exists(self, relative_path: str) -> bool:
        _safe_relative_path(relative_path)
        return relative_path in self.files

    def read_bytes(self, relative_path: str) -> bytes:
        _safe_relative_path(relative_path)
        return self.files[relative_path]

    def write_bytes(self, relative_path: str, payload: bytes) -> None:
        _safe_relative_path(relative_path)
        self.files[relative_path] = bytes(payload)

    def append_bytes(self, relative_path: str, payload: bytes) -> None:
        _safe_relative_path(relative_path)
        self.files[relative_path] = self.files.get(relative_path, b"") + bytes(payload)


def prepare_artifacts(
    sink: ArtifactSink, contract_path: Path = DEFAULT_CONTRACT_PATH
) -> dict[str, Any]:
    contract = load_contract(contract_path)
    clauses = root_clauses()
    cnf = dimacs_bytes(clauses)
    map_record = variable_map_record(contract.contract_sha256)
    inventory_record = root_clause_inventory_record(contract.contract_sha256)
    sink.write_bytes("artifacts/contract.json", contract.exact_bytes)
    sink.write_bytes("artifacts/root.cnf", cnf)
    sink.write_bytes(
        "artifacts/variable-map.json", canonical_json_bytes(map_record) + b"\n"
    )
    sink.write_bytes(
        "artifacts/root-clause-inventory.json",
        canonical_json_bytes(inventory_record) + b"\n",
    )
    return {
        "contract_file_sha256": contract.file_sha256,
        "contract_sha256": contract.contract_sha256,
        "root_cnf_sha256": sha256_bytes(cnf),
        "num_vars": NUM_VARIABLES,
        "num_clauses": len(clauses),
        "variable_map_sha256": map_record["variable_map_sha256"],
        "root_clause_inventory_sha256": inventory_record["inventory_sha256"],
    }


def preview(contract_path: Path = DEFAULT_CONTRACT_PATH) -> dict[str, Any]:
    contract = load_contract(contract_path)
    clauses = root_clauses()
    cnf = dimacs_bytes(clauses)
    inventory = root_clause_inventory_record(contract.contract_sha256)
    return {
        "contract_file_sha256": contract.file_sha256,
        "contract_sha256": contract.contract_sha256,
        "root_cnf_sha256": sha256_bytes(cnf),
        "num_vars": NUM_VARIABLES,
        "num_clauses": len(clauses),
        "root_clause_inventory_sha256": inventory["inventory_sha256"],
        "dimacs_preview": cnf.decode("ascii").splitlines()[:12],
        "solver_started": False,
    }


class SessionTransport(Protocol):
    mode: str
    solver_name: str

    def open(self, root_cnf: bytes) -> str: ...

    def add_clause(self, session_id: str, clause: Clause) -> Mapping[str, Any]: ...

    def solve(self, session_id: str, *, conflict_limit: int) -> Mapping[str, Any]: ...

    def receipts(self, session_id: str) -> bytes: ...

    def export_cnf(self, session_id: str) -> bytes: ...

    def close(self, session_id: str) -> None: ...


class PiqcSessionTransport:
    """Live session transport.  It invokes piqc and never a solver binary."""

    mode = "LIVE"

    def __init__(
        self,
        *,
        solver_name: str,
        server: str = "http://127.0.0.1:7272",
        piqc: str = "piqc",
        label: str = EXPECTED_CLAIM_IDENTITY,
        command_timeout_seconds: int = 1800,
    ) -> None:
        self.solver_name = solver_name
        self.server = server
        self.piqc = piqc
        self.label = label
        self.command_timeout_seconds = command_timeout_seconds

    def _command(self, *arguments: str) -> subprocess.CompletedProcess[bytes]:
        command = [self.piqc, "--server", self.server, *arguments]
        try:
            completed = subprocess.run(
                command,
                stdin=subprocess.DEVNULL,
                capture_output=True,
                check=False,
                timeout=self.command_timeout_seconds,
            )
        except (OSError, subprocess.TimeoutExpired) as exc:
            raise CanaryError(f"piqc command failed: {exc}") from exc
        if completed.returncode != 0:
            detail = completed.stderr.decode("utf-8", "replace")[-1000:].strip()
            raise CanaryError(f"piqc exited {completed.returncode}: {detail}")
        return completed

    def _json_command(self, *arguments: str) -> Mapping[str, Any]:
        payload = strict_json_bytes(self._command(*arguments).stdout, "piqc response")
        if not isinstance(payload, dict):
            raise CanaryError("piqc response is not a JSON object")
        return payload

    def open(self, root_cnf: bytes) -> str:
        created = self._json_command(
            "session",
            "new",
            "--solver",
            self.solver_name,
            "--lane",
            "sat",
            "--label",
            self.label,
        )
        session_id = created.get("id")
        if not isinstance(session_id, str) or not session_id:
            raise CanaryError("piqc session new returned no session id")
        try:
            temporary_path: str | None = None
            try:
                with tempfile.NamedTemporaryFile(
                    prefix="rvol-wave2b-", suffix=".cnf", delete=False
                ) as handle:
                    handle.write(root_cnf)
                    handle.flush()
                    os.fsync(handle.fileno())
                    temporary_path = handle.name
                self._json_command(
                    "session", "add", session_id, "--file", temporary_path
                )
            finally:
                if temporary_path is not None:
                    try:
                        os.unlink(temporary_path)
                    except FileNotFoundError:
                        pass
        except Exception as exc:
            detail = bounded_detail(f"post-create initialization failed: {exc}")
            try:
                self.close(session_id)
            except Exception as close_exc:  # noqa: BLE001
                detail = bounded_detail(f"{detail}; cleanup close failed: {close_exc}")
            raise CanaryError(detail) from exc
        return session_id

    def add_clause(self, session_id: str, clause: Clause) -> Mapping[str, Any]:
        text = " ".join(str(literal) for literal in clause)
        return self._json_command("session", "add", session_id, "--clause", text)

    def solve(self, session_id: str, *, conflict_limit: int) -> Mapping[str, Any]:
        return self._json_command(
            "session",
            "solve",
            session_id,
            "--conflict-limit",
            str(conflict_limit),
        )

    def receipts(self, session_id: str) -> bytes:
        return self._command("session", "receipts", session_id).stdout

    def export_cnf(self, session_id: str) -> bytes:
        temporary_path: str | None = None
        try:
            with tempfile.NamedTemporaryFile(
                prefix="rvol-wave2b-export-", suffix=".cnf", delete=False
            ) as handle:
                temporary_path = handle.name
            os.unlink(temporary_path)
            self._command("session", "export", session_id, "--out", temporary_path)
            return Path(temporary_path).read_bytes()
        finally:
            if temporary_path is not None:
                try:
                    os.unlink(temporary_path)
                except FileNotFoundError:
                    pass

    def close(self, session_id: str) -> None:
        self._json_command("session", "close", session_id)


def _iteration_record(
    *,
    contract_sha256: str,
    iteration: int,
    parent_cnf_sha256: str,
    previous_record_sha256: str | None,
    assignment: tuple[int, ...],
    rows: Rows,
    disposition: str,
    certificate: Mapping[str, Any] | None,
    cut: Mapping[str, Any] | None,
    child_cnf_sha256: str,
) -> dict[str, Any]:
    record: dict[str, Any] = {
        "schema": ITERATION_SCHEMA,
        "contract_sha256": contract_sha256,
        "iteration": iteration,
        "parent_cnf_sha256": parent_cnf_sha256,
        "previous_record_sha256": previous_record_sha256,
        "assignment": list(assignment),
        "decoded_rows": [list(row) for row in rows],
        "disposition": disposition,
        "certificate": dict(certificate) if certificate is not None else None,
        "cut": dict(cut) if cut is not None else None,
        "child_cnf_sha256": child_cnf_sha256,
    }
    record["record_sha256"] = _self_hash(record, "record_sha256")
    return record


def _validate_terminal(
    terminal: Any,
    *,
    contract: Contract,
    root_cnf_sha256: str,
    sink: ArtifactSink,
) -> dict[str, Any]:
    if not isinstance(terminal, dict) or set(terminal) != {
        "schema",
        "contract_sha256",
        "status",
        "iteration_count",
        "root_cnf_sha256",
        "final_cnf_sha256",
        "last_record_sha256",
        "detail",
        "piqd",
        "terminal_sha256",
    }:
        raise CanaryError("existing terminal record has the wrong shape")
    if terminal.get("schema") != TERMINAL_SCHEMA:
        raise CanaryError("existing terminal record has the wrong schema")
    if terminal.get("contract_sha256") != contract.contract_sha256:
        raise CanaryError("existing terminal record crosses contracts")
    if terminal.get("root_cnf_sha256") != root_cnf_sha256:
        raise CanaryError("existing terminal record crosses root CNFs")
    if terminal.get("status") not in TERMINAL_STATUSES:
        raise CanaryError("existing terminal record has an invalid status")
    detail = terminal.get("detail")
    if terminal["status"] in DETAIL_STATUSES:
        if (
            not isinstance(detail, str)
            or not detail
            or len(detail) > 1000
            or bounded_detail(detail) != detail
        ):
            raise CanaryError("existing failure terminal has invalid detail")
    elif detail is not None:
        raise CanaryError("existing normal terminal must have null detail")
    piqd = terminal.get("piqd")
    if not isinstance(piqd, dict) or set(piqd) != {
        "mode",
        "session_id",
        "solver_name",
        "receipts_path",
        "receipts_sha256",
    }:
        raise CanaryError("existing terminal has malformed PiQD custody")
    if not isinstance(piqd.get("solver_name"), str) or not piqd["solver_name"]:
        raise CanaryError("existing terminal has no solver name")
    if piqd.get("mode") == "FAKE":
        if any(
            piqd.get(field) is not None
            for field in ("session_id", "receipts_path", "receipts_sha256")
        ):
            raise CanaryError("FAKE terminal carries live PiQD custody")
    elif piqd.get("mode") == "LIVE":
        session_id = piqd.get("session_id")
        receipts_path = piqd.get("receipts_path")
        receipts_sha256 = piqd.get("receipts_sha256")
        if session_id is not None and (
            not isinstance(session_id, str) or not session_id
        ):
            raise CanaryError("LIVE terminal session id is malformed")
        if (receipts_path is None) != (receipts_sha256 is None):
            raise CanaryError("LIVE terminal has partial receipt custody")
        if terminal["status"] != "PIQD_ERROR" and (
            session_id is None or receipts_path is None
        ):
            raise CanaryError("LIVE non-error terminal lacks receipt custody")
        if receipts_path is not None:
            if receipts_path != "events/piqd-receipts.json" or not isinstance(
                receipts_sha256, str
            ):
                raise CanaryError("LIVE terminal receipt metadata is malformed")
            if (
                not sink.exists(receipts_path)
                or sha256_bytes(sink.read_bytes(receipts_path)) != receipts_sha256
            ):
                raise CanaryError("LIVE terminal receipt digest mismatch")
    else:
        raise CanaryError("existing terminal has invalid PiQD mode")
    if terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256"):
        raise CanaryError("existing terminal record self-hash mismatch")
    return dict(terminal)


def _terminal_record(
    *,
    contract: Contract,
    status: str,
    iteration_count: int,
    root_cnf_sha256: str,
    final_cnf_sha256: str,
    last_record_sha256: str | None,
    detail: str | None,
    transport: SessionTransport,
    session_id: str | None,
    receipts: bytes | None,
    sink: ArtifactSink,
) -> dict[str, Any]:
    if status not in TERMINAL_STATUSES:
        raise CanaryError("invalid terminal status")
    if status in DETAIL_STATUSES:
        if not isinstance(detail, str) or bounded_detail(detail) != detail:
            raise CanaryError("failure terminal requires canonical bounded detail")
    elif detail is not None:
        raise CanaryError("normal terminal requires null detail")
    mode = getattr(transport, "mode", None)
    solver_name = getattr(transport, "solver_name", None)
    if (
        mode not in {"FAKE", "LIVE"}
        or not isinstance(solver_name, str)
        or not solver_name
    ):
        raise CanaryError("transport does not declare a valid mode and solver name")
    if mode == "FAKE":
        piqd = {
            "mode": "FAKE",
            "session_id": None,
            "solver_name": solver_name,
            "receipts_path": None,
            "receipts_sha256": None,
        }
    else:
        if status != "PIQD_ERROR" and (
            not isinstance(session_id, str) or not session_id or receipts is None
        ):
            raise CanaryError("live non-error terminal lacks session receipts")
        if receipts is None:
            piqd = {
                "mode": "LIVE",
                "session_id": session_id,
                "solver_name": solver_name,
                "receipts_path": None,
                "receipts_sha256": None,
            }
        else:
            if not isinstance(session_id, str) or not session_id:
                raise CanaryError("live receipts have no PiQD session id")
            strict_json_bytes(receipts, "PiQD receipts")
            piqd = {
                "mode": "LIVE",
                "session_id": session_id,
                "solver_name": solver_name,
                "receipts_path": "events/piqd-receipts.json",
                "receipts_sha256": sha256_bytes(receipts),
            }
    record: dict[str, Any] = {
        "schema": TERMINAL_SCHEMA,
        "contract_sha256": contract.contract_sha256,
        "status": status,
        "iteration_count": iteration_count,
        "root_cnf_sha256": root_cnf_sha256,
        "final_cnf_sha256": final_cnf_sha256,
        "last_record_sha256": last_record_sha256,
        "detail": detail,
        "piqd": piqd,
    }
    record["terminal_sha256"] = _self_hash(record, "terminal_sha256")
    sink.write_bytes("events/terminal.json", canonical_json_bytes(record) + b"\n")
    return record


def _solve_status(response: Mapping[str, Any]) -> str:
    status = response.get("status")
    if status not in {"SAT", "UNSAT", "UNKNOWN"}:
        raise CanaryError("PiQD solve response has no recognized status")
    return status


def run_cegar(
    transport: SessionTransport,
    sink: ArtifactSink,
    *,
    contract_path: Path = DEFAULT_CONTRACT_PATH,
    max_iterations: int | None = None,
    conflict_limit: int | None = None,
) -> dict[str, Any]:
    """Run the bounded append-only loop through an injected PiQD transport.

    If a valid terminal record already exists, this is an idempotent no-op:
    no artifact is written and no transport method is called.
    """

    contract = load_contract(contract_path)
    clauses = list(root_clauses())
    root_cnf = dimacs_bytes(clauses)
    root_hash = sha256_bytes(root_cnf)
    if sink.exists("events/terminal.json"):
        terminal = strict_json_bytes(
            sink.read_bytes("events/terminal.json"), "existing terminal record"
        )
        return _validate_terminal(
            terminal,
            contract=contract,
            root_cnf_sha256=root_hash,
            sink=sink,
        )
    if sink.exists("events/iterations.jsonl") and sink.read_bytes(
        "events/iterations.jsonl"
    ):
        raise CanaryError(
            "incomplete prior iteration ledger requires operator resolution"
        )

    prepare_artifacts(sink, contract_path)
    # Zero-iteration terminals still carry an explicit empty ledger.
    sink.write_bytes("events/iterations.jsonl", b"")
    budget = contract.max_iterations if max_iterations is None else max_iterations
    conflicts = contract.conflict_limit if conflict_limit is None else conflict_limit
    if type(budget) is not int or budget <= 0:
        raise CanaryError("max_iterations must be a positive integer")
    if type(conflicts) is not int or conflicts <= 0:
        raise CanaryError("conflict_limit must be a positive integer")

    session_id: str | None = None
    last_record_hash: str | None = None
    iteration_count = 0
    status: str | None = None
    detail: str | None = None
    try:
        session_id = transport.open(root_cnf)
        if not isinstance(session_id, str) or not session_id:
            raise CanaryError("transport returned an invalid session id")
        for iteration in range(budget):
            parent_cnf = dimacs_bytes(clauses)
            parent_hash = sha256_bytes(parent_cnf)
            response = transport.solve(session_id, conflict_limit=conflicts)
            solve_status = _solve_status(response)
            if solve_status == "UNSAT":
                status = "DISCOVERY_UNSAT"
                break
            if solve_status == "UNKNOWN":
                status = "UNKNOWN_FAIL_CLOSED"
                break

            model = response.get("model")
            if not isinstance(model, list):
                status = "INVALID_ENCODING_MODEL"
                detail = bounded_detail(
                    "PiQD SAT response did not contain a literal-list model"
                )
                break
            replay = response.get("model_replay")
            if (
                getattr(transport, "mode", None) == "LIVE"
                and isinstance(replay, dict)
                and replay.get("outcome") != "SATISFIED"
            ):
                status = "INVALID_ENCODING_MODEL"
                detail = bounded_detail("PiQD model replay did not report SATISFIED")
                break
            try:
                assignment, rows = validate_assignment(clauses, model)
            except CanaryError as exc:
                status = "INVALID_ENCODING_MODEL"
                detail = _failure_detail("model validation failed", exc)
                break
            certificate = detect_atomic_certificate(rows)
            if certificate is None:
                record = _iteration_record(
                    contract_sha256=contract.contract_sha256,
                    iteration=iteration,
                    parent_cnf_sha256=parent_hash,
                    previous_record_sha256=last_record_hash,
                    assignment=assignment,
                    rows=rows,
                    disposition="ALIVE_UNRESOLVED_ABSTRACT_MODEL",
                    certificate=None,
                    cut=None,
                    child_cnf_sha256=parent_hash,
                )
                sink.append_bytes(
                    "events/iterations.jsonl", canonical_json_bytes(record) + b"\n"
                )
                last_record_hash = record["record_sha256"]
                iteration_count += 1
                status = "ALIVE_UNRESOLVED_ABSTRACT_MODEL"
                break
            try:
                cut = local_cut(certificate)
                clause = verify_local_cut(certificate, cut)
                true_literals = set(assignment)
                if any(literal in true_literals for literal in clause):
                    raise CanaryError("local cut does not eliminate its current model")
            except CanaryError as exc:
                status = "CERTFAIL"
                detail = _failure_detail("certificate admission failed", exc)
                break
            child_clauses = [*clauses, clause]
            child_hash = sha256_bytes(dimacs_bytes(child_clauses))
            record = _iteration_record(
                contract_sha256=contract.contract_sha256,
                iteration=iteration,
                parent_cnf_sha256=parent_hash,
                previous_record_sha256=last_record_hash,
                assignment=assignment,
                rows=rows,
                disposition="SPURIOUS_WITH_REFINEMENT",
                certificate=certificate,
                cut=cut,
                child_cnf_sha256=child_hash,
            )
            sink.append_bytes(
                "events/iterations.jsonl", canonical_json_bytes(record) + b"\n"
            )
            last_record_hash = record["record_sha256"]
            iteration_count += 1
            clauses = child_clauses
            transport.add_clause(session_id, clause)
        else:
            status = "MAXITER"
    # The injected transport is an external boundary and may use its own
    # exception type.  Any exception from it is deliberately one PIQD_ERROR.
    except Exception as exc:  # noqa: BLE001
        status = "PIQD_ERROR"
        detail = _failure_detail("PiQD session operation failed", exc, detail)

    if status is None:
        status = "PIQD_ERROR"
        detail = bounded_detail("PiQD session ended without a terminal status")
    final_cnf = dimacs_bytes(clauses)
    final_hash = sha256_bytes(final_cnf)
    sink.write_bytes("artifacts/final.cnf", final_cnf)

    receipts: bytes | None = None
    mode = getattr(transport, "mode", None)
    if session_id is not None and mode == "LIVE":
        try:
            candidate_receipts = transport.receipts(session_id)
            strict_json_bytes(candidate_receipts, "PiQD receipts")
            sink.write_bytes("events/piqd-receipts.json", candidate_receipts)
            receipts = candidate_receipts
        except Exception as exc:  # noqa: BLE001
            status = "PIQD_ERROR"
            detail = _failure_detail("PiQD receipts failed", exc, detail)
            receipts = None
        if status != "PIQD_ERROR":
            try:
                exported_cnf = transport.export_cnf(session_id)
                if exported_cnf != final_cnf:
                    raise CanaryError(
                        "exported PiQD session differs from reconstructed final CNF"
                    )
                sink.write_bytes("artifacts/piqd-final.cnf", exported_cnf)
            except Exception as exc:  # noqa: BLE001
                status = "PIQD_ERROR"
                detail = _failure_detail("PiQD session export failed", exc, detail)
    if session_id is not None:
        try:
            transport.close(session_id)
        except Exception as exc:  # noqa: BLE001
            status = "PIQD_ERROR"
            detail = _failure_detail("PiQD session close failed", exc, detail)

    terminal = _terminal_record(
        contract=contract,
        status=status,
        iteration_count=iteration_count,
        root_cnf_sha256=root_hash,
        final_cnf_sha256=final_hash,
        last_record_sha256=last_record_hash,
        detail=detail,
        transport=transport,
        session_id=session_id,
        receipts=receipts,
        sink=sink,
    )
    return terminal


def _prepared_root_hash(sink: ArtifactSink, contract_path: Path) -> str:
    contract = load_contract(contract_path)
    expected_contract = contract.exact_bytes
    expected_root = dimacs_bytes(root_clauses())
    expected_map = (
        canonical_json_bytes(variable_map_record(contract.contract_sha256)) + b"\n"
    )
    expected_inventory = (
        canonical_json_bytes(root_clause_inventory_record(contract.contract_sha256))
        + b"\n"
    )
    expected = {
        "artifacts/contract.json": expected_contract,
        "artifacts/root.cnf": expected_root,
        "artifacts/variable-map.json": expected_map,
        "artifacts/root-clause-inventory.json": expected_inventory,
    }
    for path, payload in expected.items():
        if not sink.exists(path) or sink.read_bytes(path) != payload:
            raise CanaryError(f"prepared artifact {path} is missing or stale")
    return sha256_bytes(expected_root)


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--contract", type=Path, default=DEFAULT_CONTRACT_PATH)
    subparsers = parser.add_subparsers(dest="action", required=True)
    subparsers.add_parser(
        "preview", help="print the deterministic root preview; no solver"
    )
    prepare_parser = subparsers.add_parser(
        "prepare", help="write exact local artifacts; no solver"
    )
    prepare_parser.add_argument("--artifact-root", type=Path, required=True)
    run_parser = subparsers.add_parser(
        "run", help="explicitly launch the bounded PiQD session"
    )
    run_parser.add_argument("--artifact-root", type=Path, required=True)
    run_parser.add_argument("--reviewed-contract-sha256", required=True)
    run_parser.add_argument("--reviewed-root-sha256", required=True)
    run_parser.add_argument("--server", default="http://127.0.0.1:7272")
    run_parser.add_argument("--piqc", default="piqc")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        if args.action == "preview":
            result = preview(args.contract)
        elif args.action == "prepare":
            result = prepare_artifacts(
                DirectoryArtifactSink(args.artifact_root), args.contract
            )
        else:
            sink = DirectoryArtifactSink(args.artifact_root)
            expected_root_hash = _prepared_root_hash(sink, args.contract)
            if args.reviewed_root_sha256 != expected_root_hash:
                raise CanaryError(
                    "--reviewed-root-sha256 does not match the prepared root"
                )
            contract = load_contract(args.contract)
            if args.reviewed_contract_sha256 != contract.contract_sha256:
                raise CanaryError(
                    "--reviewed-contract-sha256 does not match the prepared contract"
                )
            transport = PiqcSessionTransport(
                solver_name=contract.solver_name,
                server=args.server,
                piqc=args.piqc,
            )
            result = run_cegar(transport, sink, contract_path=args.contract)
        if isinstance(result.get("detail"), str):
            print(f"terminal detail: {result['detail']}", file=os.sys.stderr)
        print(canonical_json_bytes(result).decode("ascii"))
        return 0
    except (CanaryError, OSError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
