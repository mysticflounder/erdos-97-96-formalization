"""Independent verifier for the RVOL Wave 2b PiQD canary artifacts.

This module deliberately does not import the producer.  It reconstructs the
finite row system, equality quotient, Kalmanson vectors, and CNF generations
from the durable records alone.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import sys
import unicodedata
from collections import defaultdict, deque
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any, NoReturn

REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_CONTRACT = REPO_ROOT / "docs/specs/rvol-wave2b-piqd-canary-v1.json"

CONTRACT_SCHEMA = "rvol-wave2b-piqd-canary-contract/v1"
VARIABLE_MAP_SCHEMA = "rvol-wave2b-variable-map/v1"
ROOT_INVENTORY_SCHEMA = "rvol-wave2b-root-clause-inventory/v1"
ITERATION_SCHEMA = "rvol-wave2b-iteration/v1"
TERMINAL_SCHEMA = "rvol-wave2b-terminal/v1"
CARDINALITY = 9
NUM_VARS = 72
MAX_TERMINAL_DETAIL_CHARS = 1000
HEX_DIGITS = frozenset("0123456789abcdef")


class VerificationError(ValueError):
    """A fail-closed artifact verification failure."""


def _fail(message: str) -> NoReturn:
    raise VerificationError(message)


def _is_int(value: Any) -> bool:
    return isinstance(value, int) and not isinstance(value, bool)


def _require_int(value: Any, where: str) -> int:
    if not _is_int(value):
        _fail(f"{where}: expected integer")
    return value


def _require_str(value: Any, where: str) -> str:
    if not isinstance(value, str):
        _fail(f"{where}: expected string")
    return value


def _require_hex(value: Any, where: str, *, nullable: bool = False) -> str | None:
    if value is None and nullable:
        return None
    text = _require_str(value, where)
    if len(text) != 64 or any(ch not in HEX_DIGITS for ch in text):
        _fail(f"{where}: expected lowercase SHA-256 hex")
    return text


def _strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            _fail(f"duplicate JSON key {key!r}")
        result[key] = value
    return result


def _reject_json_constant(value: str) -> NoReturn:
    _fail(f"non-standard JSON constant {value!r}")


def _parse_json_text(text: str, where: str) -> Any:
    try:
        return json.loads(
            text,
            object_pairs_hook=_strict_object,
            parse_constant=_reject_json_constant,
        )
    except VerificationError:
        raise
    except (json.JSONDecodeError, UnicodeError) as exc:
        _fail(f"{where}: malformed JSON: {exc}")


def _load_json(path: Path) -> dict[str, Any]:
    try:
        text = path.read_text(encoding="utf-8")
    except (OSError, UnicodeError) as exc:
        _fail(f"{path}: cannot read: {exc}")
    value = _parse_json_text(text, str(path))
    if not isinstance(value, dict):
        _fail(f"{path}: expected JSON object")
    return value


def _expect_keys(value: Any, expected: set[str], where: str) -> dict[str, Any]:
    if not isinstance(value, dict):
        _fail(f"{where}: expected object")
    actual = set(value)
    if actual != expected:
        missing = sorted(expected - actual)
        extra = sorted(actual - expected)
        _fail(f"{where}: key mismatch; missing={missing}, unknown={extra}")
    return value


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    unsigned = dict(value)
    unsigned.pop(field, None)
    return hashlib.sha256(_canonical_json_bytes(unsigned)).hexdigest()


def _verify_self_hash(value: Mapping[str, Any], field: str, where: str) -> str:
    recorded = _require_hex(value.get(field), f"{where}.{field}")
    computed = _self_hash(value, field)
    if recorded != computed:
        _fail(f"{where}: {field} mismatch: recorded={recorded}, computed={computed}")
    return computed


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _read_bytes(path: Path) -> bytes:
    try:
        return path.read_bytes()
    except OSError as exc:
        _fail(f"{path}: cannot read: {exc}")


@dataclass(frozen=True)
class Dimacs:
    num_vars: int
    clauses: tuple[tuple[int, ...], ...]


def parse_dimacs(data: bytes, where: str) -> Dimacs:
    """Parse strict ASCII DIMACS while allowing clauses to span lines."""
    try:
        text = data.decode("ascii")
    except UnicodeDecodeError as exc:
        _fail(f"{where}: DIMACS is not ASCII: {exc}")

    header: tuple[int, int] | None = None
    clause_tokens: list[int] = []
    clauses: list[tuple[int, ...]] = []
    for line_no, raw in enumerate(text.splitlines(), 1):
        line = raw.strip()
        if not line or line.startswith("c"):
            continue
        parts = line.split()
        if parts[0] == "p":
            if header is not None or clauses or clause_tokens:
                _fail(f"{where}:{line_no}: misplaced or duplicate DIMACS header")
            if len(parts) != 4 or parts[1] != "cnf":
                _fail(f"{where}:{line_no}: expected 'p cnf <vars> <clauses>'")
            try:
                num_vars, num_clauses = int(parts[2]), int(parts[3])
            except ValueError:
                _fail(f"{where}:{line_no}: non-integer DIMACS header")
            if num_vars < 0 or num_clauses < 0:
                _fail(f"{where}:{line_no}: negative DIMACS count")
            header = (num_vars, num_clauses)
            continue
        if header is None:
            _fail(f"{where}:{line_no}: clause data precedes header")
        for token in parts:
            try:
                literal = int(token)
            except ValueError:
                _fail(f"{where}:{line_no}: invalid literal {token!r}")
            if literal == 0:
                if len(set(clause_tokens)) != len(clause_tokens):
                    _fail(f"{where}:{line_no}: duplicate literal in clause")
                if any(-literal in clause_tokens for literal in clause_tokens):
                    _fail(f"{where}:{line_no}: tautological clause")
                clauses.append(tuple(clause_tokens))
                clause_tokens = []
            else:
                if abs(literal) > header[0]:
                    _fail(
                        f"{where}:{line_no}: literal {literal} exceeds variable range"
                    )
                clause_tokens.append(literal)
    if header is None:
        _fail(f"{where}: missing DIMACS header")
    if clause_tokens:
        _fail(f"{where}: unterminated final clause")
    if len(clauses) != header[1]:
        _fail(f"{where}: header declares {header[1]} clauses, parsed {len(clauses)}")
    return Dimacs(header[0], tuple(clauses))


def emit_dimacs(num_vars: int, clauses: Sequence[Sequence[int]]) -> bytes:
    lines = [f"p cnf {num_vars} {len(clauses)}"]
    lines.extend(
        " ".join(map(str, clause)) + (" " if clause else "") + "0" for clause in clauses
    )
    return ("\n".join(lines) + "\n").encode("ascii")


def _validate_contract(contract: dict[str, Any]) -> str:
    _expect_keys(
        contract,
        {
            "base_head",
            "budgets",
            "cell",
            "claim",
            "clause_classes",
            "compatibility_class",
            "contract_sha256",
            "created_utc",
            "decoder",
            "detector",
            "promotion_boundary",
            "refinement_contract",
            "schema",
            "terminal_statuses",
            "toolchain",
            "variables",
        },
        "contract",
    )
    if contract["schema"] != CONTRACT_SCHEMA:
        _fail(f"contract.schema: expected {CONTRACT_SCHEMA!r}")
    digest = _verify_self_hash(contract, "contract_sha256", "contract")
    _expect_keys(
        contract["budgets"],
        {"conflict_limit_per_solve", "max_iterations", "requested_cores"},
        "contract.budgets",
    )
    claim = _expect_keys(
        contract["claim"], {"identity", "mode", "query"}, "contract.claim"
    )
    if (
        claim["identity"]
        != "rvol-wave2b-fin9-natural-order-all-row-atomic-kalmanson-v1"
        or claim["mode"] != "DISCOVERY_ONLY"
    ):
        _fail("contract.claim: verifier supports only the declared discovery claim")
    clause_classes = _expect_keys(
        contract["clause_classes"],
        {
            "ASSUMPTION_CONTROL",
            "ENUMERATION_CONTROL",
            "LEARNED_CANDIDATE",
            "ROOT_STATIC",
            "SEMANTIC_REFINEMENT",
        },
        "contract.clause_classes",
    )
    if any(
        not isinstance(value, list) or any(not isinstance(item, str) for item in value)
        for value in clause_classes.values()
    ):
        _fail("contract.clause_classes: every class must be a string list")
    cell = _expect_keys(
        contract["cell"],
        {
            "cardinality",
            "center_excluded",
            "cyclic_order",
            "pair_codegree_max",
            "row_cardinality",
            "row_intersection_max",
            "shared_pair_alternation",
            "source_cover",
            "strong_support_connectivity",
            "vertices",
        },
        "contract.cell",
    )
    if cell["cardinality"] != CARDINALITY or cell["vertices"] != list(
        range(CARDINALITY)
    ):
        _fail("contract.cell: verifier supports exactly the declared Fin 9 cell")
    if cell["cyclic_order"] != list(range(CARDINALITY)):
        _fail("contract.cell.cyclic_order: expected natural order 0..8")
    variables = _expect_keys(
        contract["variables"],
        {"count", "kind", "mapping", "semantic"},
        "contract.variables",
    )
    if variables["count"] != NUM_VARS or variables["kind"] != "row_membership":
        _fail("contract.variables: expected 72 row-membership variables")
    if variables["semantic"] is not True:
        _fail("contract.variables.semantic: expected true")
    decoder = _expect_keys(
        contract["decoder"],
        {"auxiliary_variables", "mode", "projection", "row_decode"},
        "contract.decoder",
    )
    if (
        decoder["mode"] != "CANONICAL_PROJECTION_FUNCTION"
        or decoder["auxiliary_variables"] != []
    ):
        _fail("contract.decoder: expected canonical projection without auxiliaries")
    if contract["compatibility_class"] != "C":
        _fail("contract.compatibility_class: expected C")
    _expect_keys(
        contract["detector"],
        {
            "distance_equalities",
            "inequality_order",
            "k1_vector",
            "k2_vector",
            "opposite_pair",
            "selection",
            "zero_vector",
        },
        "contract.detector",
    )
    promotion = _expect_keys(
        contract["promotion_boundary"],
        {"abstract_coverage_requires", "forbidden_claims", "source_bridge_status"},
        "contract.promotion_boundary",
    )
    if promotion["source_bridge_status"] != "UNPROVED":
        _fail("contract.promotion_boundary: expected unproved source bridge")
    _expect_keys(
        contract["refinement_contract"],
        {
            "admission",
            "current_model_elimination",
            "future_model_soundness",
            "source_preservation",
            "theorem_interfaces",
        },
        "contract.refinement_contract",
    )
    _expect_keys(
        contract["toolchain"],
        {
            "piqd_protocol_version",
            "piqd_sha256",
            "piqd_version",
            "solver",
            "solver_sha256",
        },
        "contract.toolchain",
    )
    statuses = contract["terminal_statuses"]
    if (
        not isinstance(statuses, list)
        or any(not isinstance(status, str) for status in statuses)
        or len(statuses) != len(set(statuses))
    ):
        _fail("contract.terminal_statuses: expected duplicate-free string list")
    return digest


def _expected_var(center: int, point: int) -> int:
    if not (0 <= center < CARDINALITY and 0 <= point < CARDINALITY) or center == point:
        _fail(f"invalid membership ({center},{point})")
    return 1 + 8 * center + (point if point < center else point - 1)


def _exactly_k(literals: Sequence[int], count: int) -> list[tuple[int, ...]]:
    values = tuple(literals)
    return [
        *(
            tuple(subset)
            for subset in itertools.combinations(values, len(values) - count + 1)
        ),
        *(
            tuple(-literal for literal in subset)
            for subset in itertools.combinations(values, count + 1)
        ),
    ]


def _expected_root_clauses() -> tuple[tuple[int, ...], ...]:
    """Independently compile the contract's complete ROOT_STATIC inventory."""
    clauses: list[tuple[int, ...]] = []
    for center in range(CARDINALITY):
        row = [
            _expected_var(center, point)
            for point in range(CARDINALITY)
            if point != center
        ]
        clauses.extend(_exactly_k(row, 4))
    for point in range(CARDINALITY):
        clauses.append(
            tuple(
                _expected_var(center, point)
                for center in range(CARDINALITY)
                if center != point
            )
        )
    for first, second in itertools.combinations(range(CARDINALITY), 2):
        domain = [point for point in range(CARDINALITY) if point not in {first, second}]
        for triple in itertools.combinations(domain, 3):
            clauses.append(
                tuple(
                    literal
                    for point in triple
                    for literal in (
                        -_expected_var(first, point),
                        -_expected_var(second, point),
                    )
                )
            )
    for first, second in itertools.combinations(range(CARDINALITY), 2):
        centers = [
            center for center in range(CARDINALITY) if center not in {first, second}
        ]
        for selected in itertools.combinations(centers, 3):
            clauses.append(
                tuple(
                    literal
                    for center in selected
                    for literal in (
                        -_expected_var(center, first),
                        -_expected_var(center, second),
                    )
                )
            )
    all_mask = (1 << CARDINALITY) - 1
    for mask in range(1, all_mask):
        inside = [v for v in range(CARDINALITY) if mask & (1 << v)]
        outside = [v for v in range(CARDINALITY) if not mask & (1 << v)]
        clauses.append(
            tuple(
                _expected_var(center, point) for center in inside for point in outside
            )
        )
    for first, second in itertools.combinations(range(CARDINALITY), 2):
        domain = [point for point in range(CARDINALITY) if point not in {first, second}]
        for p, q in itertools.combinations(domain, 2):
            if _between_cyclic(first, p, second) == _between_cyclic(first, q, second):
                clauses.append(
                    (
                        -_expected_var(first, p),
                        -_expected_var(first, q),
                        -_expected_var(second, p),
                        -_expected_var(second, q),
                    )
                )
    return tuple(clauses)


def _expected_root_producers(
    clauses: tuple[tuple[int, ...], ...],
) -> tuple[tuple[str, tuple[tuple[int, ...], ...]], ...]:
    names_and_counts = (
        ("row_cardinality_eq_4", 1008),
        ("center_excluded_by_variable_omission", 0),
        ("source_cover", 9),
        ("row_intersection_le_2", 1260),
        ("pair_codegree_le_2", 1260),
        ("strong_support_connectivity", 510),
        ("shared_pair_alternation", 504),
    )
    result: list[tuple[str, tuple[tuple[int, ...], ...]]] = []
    offset = 0
    for name, count in names_and_counts:
        result.append((name, clauses[offset : offset + count]))
        offset += count
    if offset != len(clauses):
        _fail("internal root-producer partition does not cover root clauses")
    return tuple(result)


def _validate_root_inventory(
    value: dict[str, Any],
    contract: Mapping[str, Any],
    contract_sha256: str,
    root_cnf_sha256: str,
    clauses: tuple[tuple[int, ...], ...],
) -> str:
    _expect_keys(
        value,
        {
            "schema",
            "contract_sha256",
            "producers",
            "total_clauses",
            "duplicate_clause_instances",
            "root_cnf_sha256",
            "inventory_sha256",
        },
        "root-clause-inventory",
    )
    if value["schema"] != ROOT_INVENTORY_SCHEMA:
        _fail(f"root-clause-inventory.schema: expected {ROOT_INVENTORY_SCHEMA!r}")
    if value["contract_sha256"] != contract_sha256:
        _fail("root-clause-inventory.contract_sha256: contract mismatch")
    expected_producers = _expected_root_producers(clauses)
    declared_names = contract["clause_classes"]["ROOT_STATIC"]
    if [name for name, _ in expected_producers] != declared_names:
        _fail("contract ROOT_STATIC producer order differs from verifier contract")
    raw_producers = value["producers"]
    if not isinstance(raw_producers, list) or len(raw_producers) != len(
        expected_producers
    ):
        _fail("root-clause-inventory.producers: wrong producer count")
    for index, (raw, (name, producer_clauses)) in enumerate(
        zip(raw_producers, expected_producers, strict=True)
    ):
        where = f"root-clause-inventory.producers[{index}]"
        producer = _expect_keys(raw, {"name", "count", "clauses_sha256"}, where)
        if producer["name"] != name:
            _fail(f"{where}.name: producer order/name mismatch")
        if producer["count"] != len(producer_clauses) or not _is_int(producer["count"]):
            _fail(f"{where}.count: clause count mismatch")
        expected_digest = _sha256_bytes(
            _canonical_json_bytes([list(clause) for clause in producer_clauses])
        )
        if producer["clauses_sha256"] != expected_digest:
            _fail(f"{where}.clauses_sha256: producer clause digest mismatch")
    if value["total_clauses"] != len(clauses) or not _is_int(value["total_clauses"]):
        _fail("root-clause-inventory.total_clauses: expected 4551")
    canonical_instances = {
        tuple(sorted(clause, key=lambda literal: (abs(literal), literal)))
        for clause in clauses
    }
    duplicate_instances = len(clauses) - len(canonical_instances)
    if value["duplicate_clause_instances"] != duplicate_instances or not _is_int(
        value["duplicate_clause_instances"]
    ):
        _fail("root-clause-inventory.duplicate_clause_instances: mismatch")
    if value["root_cnf_sha256"] != root_cnf_sha256:
        _fail("root-clause-inventory.root_cnf_sha256: root mismatch")
    return _verify_self_hash(value, "inventory_sha256", "root-clause-inventory")


def _validate_variable_map(
    value: dict[str, Any], contract_sha256: str
) -> tuple[dict[int, tuple[int, int]], dict[tuple[int, int], int], str]:
    _expect_keys(
        value,
        {"schema", "contract_sha256", "num_vars", "variables", "variable_map_sha256"},
        "variable-map",
    )
    if value["schema"] != VARIABLE_MAP_SCHEMA:
        _fail(f"variable-map.schema: expected {VARIABLE_MAP_SCHEMA!r}")
    if value["contract_sha256"] != contract_sha256:
        _fail("variable-map.contract_sha256: contract mismatch")
    if value["num_vars"] != NUM_VARS:
        _fail(f"variable-map.num_vars: expected {NUM_VARS}")
    variables = value["variables"]
    if not isinstance(variables, list) or len(variables) != NUM_VARS:
        _fail("variable-map.variables: expected 72 entries")
    by_var: dict[int, tuple[int, int]] = {}
    by_membership: dict[tuple[int, int], int] = {}
    for index, raw in enumerate(variables, 1):
        entry = _expect_keys(
            raw,
            {"var", "center", "point", "semantic"},
            f"variable-map.variables[{index - 1}]",
        )
        var = _require_int(entry["var"], f"variable-map.variables[{index - 1}].var")
        center = _require_int(
            entry["center"], f"variable-map.variables[{index - 1}].center"
        )
        point = _require_int(
            entry["point"], f"variable-map.variables[{index - 1}].point"
        )
        if entry["semantic"] is not True:
            _fail(f"variable-map.variables[{index - 1}].semantic: expected true")
        if var != index or var != _expected_var(center, point):
            _fail(f"variable-map.variables[{index - 1}]: noncanonical variable mapping")
        membership = (center, point)
        if membership in by_membership:
            _fail(f"variable-map: duplicate membership {membership}")
        by_var[var] = membership
        by_membership[membership] = var
    digest = _verify_self_hash(value, "variable_map_sha256", "variable-map")
    return by_var, by_membership, digest


def _validate_assignment(raw: Any, where: str, num_vars: int) -> tuple[int, ...]:
    if not isinstance(raw, list) or len(raw) != num_vars:
        _fail(f"{where}: expected exactly {num_vars} signed literals")
    result: list[int] = []
    for var, value in enumerate(raw, 1):
        literal = _require_int(value, f"{where}[{var - 1}]")
        if abs(literal) != var:
            _fail(f"{where}[{var - 1}]: expected {var} or {-var}")
        result.append(literal)
    return tuple(result)


def _satisfies(assignment: Sequence[int], clauses: Iterable[Sequence[int]]) -> bool:
    truth = {abs(literal): literal > 0 for literal in assignment}
    return all(
        any(truth[abs(literal)] == (literal > 0) for literal in clause)
        for clause in clauses
    )


def _decode_rows(
    assignment: Sequence[int], by_var: Mapping[int, tuple[int, int]]
) -> tuple[tuple[int, ...], ...]:
    rows: list[list[int]] = [[] for _ in range(CARDINALITY)]
    for literal in assignment:
        if literal > 0:
            center, point = by_var[literal]
            rows[center].append(point)
    return tuple(tuple(sorted(row)) for row in rows)


def _between_cyclic(start: int, point: int, end: int) -> bool:
    return 0 < (point - start) % CARDINALITY < (end - start) % CARDINALITY


def _strongly_connected(rows: Sequence[Sequence[int]]) -> bool:
    def reached(reverse: bool) -> set[int]:
        todo = [0]
        seen = {0}
        while todo:
            vertex = todo.pop()
            if reverse:
                adjacent = [center for center, row in enumerate(rows) if vertex in row]
            else:
                adjacent = list(rows[vertex])
            for target in adjacent:
                if target not in seen:
                    seen.add(target)
                    todo.append(target)
        return seen

    return len(reached(False)) == CARDINALITY and len(reached(True)) == CARDINALITY


def _validate_decoded_rows(
    raw: Any, expected: tuple[tuple[int, ...], ...], where: str
) -> None:
    if not isinstance(raw, list) or len(raw) != CARDINALITY:
        _fail(f"{where}: expected nine rows")
    decoded: list[tuple[int, ...]] = []
    for center, row in enumerate(raw):
        if not isinstance(row, list) or any(not _is_int(point) for point in row):
            _fail(f"{where}[{center}]: expected integer list")
        if row != sorted(set(row)):
            _fail(f"{where}[{center}]: row is not strictly sorted")
        if any(not 0 <= point < CARDINALITY for point in row):
            _fail(f"{where}[{center}]: point outside Fin 9")
        decoded.append(tuple(row))
    actual = tuple(decoded)
    if actual != expected:
        _fail(f"{where}: does not match assignment projection")
    if any(len(row) != 4 or center in row for center, row in enumerate(actual)):
        _fail(f"{where}: row-cardinality or center-exclusion failure")
    if set().union(*(set(row) for row in actual)) != set(range(CARDINALITY)):
        _fail(f"{where}: source-cover failure")
    for c in range(CARDINALITY):
        for d in range(c + 1, CARDINALITY):
            common = sorted(set(actual[c]) & set(actual[d]))
            if len(common) > 2:
                _fail(f"{where}: rows {c},{d} intersect in more than two points")
            for i, p in enumerate(common):
                for q in common[i + 1 :]:
                    if _between_cyclic(c, p, d) == _between_cyclic(c, q, d):
                        _fail(
                            f"{where}: shared-pair alternation fails at rows {c},{d}, pair {p},{q}"
                        )
    for p in range(CARDINALITY):
        for q in range(p + 1, CARDINALITY):
            if sum(p in row and q in row for row in actual) > 2:
                _fail(f"{where}: pair {p},{q} has codegree greater than two")
    if not _strongly_connected(actual):
        _fail(f"{where}: support digraph is not strongly connected")


DistancePair = tuple[int, int]
Vector = dict[DistancePair, int]


class _UnionFind:
    def __init__(self) -> None:
        self.parent: dict[DistancePair, DistancePair] = {}

    def add(self, item: DistancePair) -> None:
        self.parent.setdefault(item, item)

    def find(self, item: DistancePair) -> DistancePair:
        self.add(item)
        parent = self.parent[item]
        if parent != item:
            self.parent[item] = self.find(parent)
        return self.parent[item]

    def union(self, left: DistancePair, right: DistancePair) -> None:
        a, b = self.find(left), self.find(right)
        if a != b:
            if b < a:
                a, b = b, a
            self.parent[b] = a


def _distance_pair(a: int, b: int) -> DistancePair:
    if a == b or not (0 <= a < CARDINALITY and 0 <= b < CARDINALITY):
        _fail(f"invalid distance pair ({a},{b})")
    return (a, b) if a < b else (b, a)


def _equality_graph(antecedents: Sequence[tuple[int, int]]) -> _UnionFind:
    union_find = _UnionFind()
    by_center: dict[int, list[DistancePair]] = defaultdict(list)
    for center, point in antecedents:
        pair = _distance_pair(center, point)
        by_center[center].append(pair)
        union_find.add(pair)
    for pairs in by_center.values():
        for pair in pairs[1:]:
            union_find.union(pairs[0], pair)
    return union_find


def _canonical_path_antecedents(
    antecedents: Sequence[tuple[int, int]],
    descriptors: Sequence[tuple[str, tuple[int, int, int, int]]],
    equality: _UnionFind,
) -> tuple[tuple[int, int], ...]:
    """Recompute the exact lexicographic BFS equality-path witness."""
    adjacency: dict[DistancePair, dict[DistancePair, tuple[tuple[int, int], ...]]] = {
        (left, right): {}
        for left in range(CARDINALITY)
        for right in range(left + 1, CARDINALITY)
    }
    by_center: dict[int, list[int]] = defaultdict(list)
    for center, point in antecedents:
        by_center[center].append(point)
    for center, points in by_center.items():
        points = sorted(points)
        for point_index, point in enumerate(points):
            for other in points[point_index + 1 :]:
                left = _distance_pair(center, point)
                right = _distance_pair(center, other)
                edge = tuple(sorted(((center, point), (center, other))))
                adjacency[left][right] = edge
                adjacency[right][left] = edge

    def path(start: DistancePair, end: DistancePair) -> set[tuple[int, int]]:
        if start == end:
            return set()
        queue = deque([start])
        parent: dict[
            DistancePair, tuple[DistancePair, tuple[tuple[int, int], ...]]
        ] = {}
        seen = {start}
        while queue:
            current = queue.popleft()
            for neighbor in sorted(adjacency[current]):
                if neighbor in seen:
                    continue
                seen.add(neighbor)
                parent[neighbor] = (current, adjacency[current][neighbor])
                if neighbor == end:
                    queue.clear()
                    break
                queue.append(neighbor)
        if end not in parent:
            _fail(
                f"certificate equality representative {end} is unreachable from {start}"
            )
        used: set[tuple[int, int]] = set()
        current = end
        while current != start:
            previous, edge = parent[current]
            used.update(edge)
            current = previous
        return used

    required: set[tuple[int, int]] = set()
    for kind, indices in descriptors:
        for pair in sorted(_raw_kalmanson_vector(kind, indices)):
            required.update(path(pair, equality.find(pair)))
    return tuple(sorted(required))


def _raw_kalmanson_vector(kind: str, indices: tuple[int, int, int, int]) -> Vector:
    i, j, k, ell = indices
    terms = [(_distance_pair(i, k), 1), (_distance_pair(j, ell), 1)]
    if kind == "K1":
        terms.extend([(_distance_pair(i, j), -1), (_distance_pair(k, ell), -1)])
    elif kind == "K2":
        terms.extend([(_distance_pair(i, ell), -1), (_distance_pair(j, k), -1)])
    else:
        _fail(f"unknown Kalmanson kind {kind!r}")
    result: Vector = defaultdict(int)
    for pair, coefficient in terms:
        result[pair] += coefficient
    return {pair: coefficient for pair, coefficient in result.items() if coefficient}


def _reduce_vector(vector: Mapping[DistancePair, int], equality: _UnionFind) -> Vector:
    reduced: Vector = defaultdict(int)
    for pair, coefficient in vector.items():
        reduced[equality.find(pair)] += coefficient
    return {pair: coefficient for pair, coefficient in reduced.items() if coefficient}


def _vector_entries(vector: Mapping[DistancePair, int]) -> list[dict[str, Any]]:
    return [
        {"distance_pair": list(pair), "coefficient": vector[pair]}
        for pair in sorted(vector)
    ]


def _parse_antecedents(raw: Any, where: str) -> tuple[tuple[int, int], ...]:
    if not isinstance(raw, list):
        _fail(f"{where}: expected list")
    result: list[tuple[int, int]] = []
    for index, item in enumerate(raw):
        if not isinstance(item, list) or len(item) != 2:
            _fail(f"{where}[{index}]: expected [center,point]")
        center = _require_int(item[0], f"{where}[{index}][0]")
        point = _require_int(item[1], f"{where}[{index}][1]")
        _expected_var(center, point)
        result.append((center, point))
    if result != sorted(set(result)):
        _fail(f"{where}: expected unique lexicographic memberships")
    return tuple(result)


def _descriptor_key(value: Mapping[str, Any]) -> tuple[tuple[int, ...], int]:
    return tuple(value["indices"]), 0 if value["kind"] == "K1" else 1


def _validate_certificate(
    raw: Any,
    assignment: Sequence[int],
    by_membership: Mapping[tuple[int, int], int],
    where: str,
) -> tuple[tuple[tuple[int, int], ...], str]:
    certificate = _expect_keys(
        raw,
        {"kind", "inequalities", "antecedent_memberships", "certificate_sha256"},
        where,
    )
    digest = _verify_self_hash(certificate, "certificate_sha256", where)
    kind = certificate["kind"]
    if kind not in {"ZERO_VECTOR", "OPPOSITE_PAIR"}:
        _fail(f"{where}.kind: unsupported certificate kind")
    antecedents = _parse_antecedents(
        certificate["antecedent_memberships"], f"{where}.antecedent_memberships"
    )
    positives = {literal for literal in assignment if literal > 0}
    for membership in antecedents:
        if by_membership[membership] not in positives:
            _fail(f"{where}: antecedent {membership} is false in source model")
    equality = _equality_graph(antecedents)

    inequalities = certificate["inequalities"]
    expected_count = 1 if kind == "ZERO_VECTOR" else 2
    if not isinstance(inequalities, list) or len(inequalities) != expected_count:
        _fail(f"{where}.inequalities: {kind} requires {expected_count} descriptor(s)")
    parsed: list[tuple[dict[str, Any], Vector]] = []
    descriptors: list[tuple[str, tuple[int, int, int, int]]] = []
    for index, raw_inequality in enumerate(inequalities):
        item_where = f"{where}.inequalities[{index}]"
        inequality = _expect_keys(
            raw_inequality, {"kind", "indices", "reduced_vector"}, item_where
        )
        inequality_kind = inequality["kind"]
        if inequality_kind not in {"K1", "K2"}:
            _fail(f"{item_where}.kind: expected K1 or K2")
        indices_raw = inequality["indices"]
        if (
            not isinstance(indices_raw, list)
            or len(indices_raw) != 4
            or any(not _is_int(v) for v in indices_raw)
        ):
            _fail(f"{item_where}.indices: expected four integers")
        indices = tuple(indices_raw)
        if list(indices) != sorted(set(indices)) or not all(
            0 <= v < CARDINALITY for v in indices
        ):
            _fail(f"{item_where}.indices: expected i<j<k<l in Fin 9")
        expected_vector = _reduce_vector(
            _raw_kalmanson_vector(inequality_kind, indices), equality
        )
        if inequality["reduced_vector"] != _vector_entries(expected_vector):
            _fail(
                f"{item_where}.reduced_vector: does not match independent quotient reduction"
            )
        parsed.append((inequality, expected_vector))
        descriptors.append((inequality_kind, indices))
    if [item for item, _ in parsed] != sorted(
        (item for item, _ in parsed), key=_descriptor_key
    ):
        _fail(f"{where}.inequalities: descriptors are not in canonical order")
    if kind == "ZERO_VECTOR":
        if parsed[0][1]:
            _fail(f"{where}: ZERO_VECTOR has nonzero reduced vector")
    else:
        left, right = parsed[0][1], parsed[1][1]
        if not left or not right:
            _fail(f"{where}: OPPOSITE_PAIR requires two nonzero vectors")
        keys = set(left) | set(right)
        if any(left.get(pair, 0) + right.get(pair, 0) != 0 for pair in keys):
            _fail(f"{where}: reduced vectors are not coefficientwise opposite")
    required = _canonical_path_antecedents(antecedents, descriptors, equality)
    if antecedents != required:
        _fail(f"{where}: antecedents are not the exact canonical path witness")
    # Quotienting by additional row equalities is a linear map.  It preserves
    # zero and coefficientwise negation; if an opposite vector later maps to
    # zero, either inequality itself becomes a ZERO_VECTOR certificate.
    return antecedents, digest


def _validate_cut(
    raw: Any,
    antecedents: Sequence[tuple[int, int]],
    by_membership: Mapping[tuple[int, int], int],
    where: str,
) -> tuple[tuple[int, ...], str]:
    cut = _expect_keys(raw, {"class", "clause", "cut_sha256"}, where)
    digest = _verify_self_hash(cut, "cut_sha256", where)
    if cut["class"] != "SEMANTIC_REFINEMENT":
        _fail(f"{where}.class: expected SEMANTIC_REFINEMENT")
    expected = tuple(-by_membership[membership] for membership in antecedents)
    clause = cut["clause"]
    if not isinstance(clause, list) or any(not _is_int(literal) for literal in clause):
        _fail(f"{where}.clause: expected integer list")
    if any(literal >= 0 for literal in clause):
        _fail(f"{where}.clause: every literal must be negative")
    if [abs(literal) for literal in clause] != sorted(
        abs(literal) for literal in clause
    ):
        _fail(f"{where}.clause: expected ascending absolute variable ids")
    if tuple(clause) != expected:
        _fail(f"{where}.clause: not the exact negation of certificate antecedents")
    return tuple(clause), digest


def _load_iterations(path: Path) -> list[dict[str, Any]]:
    data = _read_bytes(path)
    try:
        text = data.decode("ascii")
    except UnicodeDecodeError as exc:
        _fail(f"{path}: JSONL is not ASCII: {exc}")
    if text and not text.endswith("\n"):
        _fail(f"{path}: canonical JSONL must end with newline")
    records: list[dict[str, Any]] = []
    for line_no, line in enumerate(text.splitlines(), 1):
        if not line:
            _fail(f"{path}:{line_no}: blank JSONL record")
        value = _parse_json_text(line, f"{path}:{line_no}")
        if not isinstance(value, dict):
            _fail(f"{path}:{line_no}: expected object")
        if _canonical_json_bytes(value).decode("ascii") != line:
            _fail(f"{path}:{line_no}: record is not canonical compact sorted JSON")
        records.append(value)
    return records


def _safe_receipts_path(run_root: Path, recorded: str) -> Path:
    if recorded != "events/piqd-receipts.json":
        _fail("terminal.piqd.receipts_path: expected events/piqd-receipts.json")
    return run_root / "events" / "piqd-receipts.json"


def _dimacs_clause_body(data: bytes, where: str) -> bytes:
    header_end = data.find(b"\n")
    if header_end < 0:
        _fail(f"{where}: DIMACS header has no terminating newline")
    return data[header_end + 1 :]


def _validate_live_receipts(
    receipts_path: Path,
    *,
    session_id: str,
    terminal_status: str,
    conflict_limit: int,
    recorded_parent_cnfs: Sequence[bytes],
    final_cnf: bytes,
) -> int:
    envelope = _load_json(receipts_path)
    _expect_keys(
        envelope,
        {"count", "journal_path", "lane", "receipts", "receipts_path", "session_id"},
        "piqd_receipts",
    )
    if envelope["session_id"] != session_id:
        _fail("piqd_receipts.session_id: terminal session mismatch")
    if "/" in session_id or "\\" in session_id or not session_id:
        _fail("terminal.piqd.session_id: malformed path component")
    if envelope["lane"] != "sat":
        _fail("piqd_receipts.lane: expected sat")
    journal_path = _require_str(envelope["journal_path"], "piqd_receipts.journal_path")
    recorded_receipts_path = _require_str(
        envelope["receipts_path"], "piqd_receipts.receipts_path"
    )
    expected_session_component = f"/{session_id}/"
    if expected_session_component not in journal_path or not journal_path.endswith(
        "/journal.cnf"
    ):
        _fail("piqd_receipts.journal_path: does not identify the terminal session")
    if expected_session_component not in recorded_receipts_path or not (
        recorded_receipts_path.endswith("/receipts.jsonl")
    ):
        _fail("piqd_receipts.receipts_path: does not identify the terminal session")

    receipts = envelope["receipts"]
    if not isinstance(receipts, list):
        _fail("piqd_receipts.receipts: expected list")
    count = _require_int(envelope["count"], "piqd_receipts.count")
    if count != len(receipts):
        _fail("piqd_receipts.count: receipt-list length mismatch")

    extra_status = {
        "DISCOVERY_UNSAT": "UNSAT",
        "UNKNOWN_FAIL_CLOSED": "UNKNOWN",
        "INVALID_ENCODING_MODEL": "SAT",
        "CERTFAIL": "SAT",
    }.get(terminal_status)
    expected_statuses = ["SAT"] * len(recorded_parent_cnfs)
    expected_parents = list(recorded_parent_cnfs)
    if extra_status is not None:
        expected_statuses.append(extra_status)
        expected_parents.append(final_cnf)

    if terminal_status == "PIQD_ERROR":
        if count > len(recorded_parent_cnfs) + 1:
            _fail("piqd_receipts.count: too many solves for PIQD_ERROR ledger")
        expected_parents = [*recorded_parent_cnfs, final_cnf][:count]
        expected_statuses = ["SAT"] * min(count, len(recorded_parent_cnfs))
        if count > len(recorded_parent_cnfs):
            expected_statuses.append("ANY")
    elif count != len(expected_parents):
        _fail(
            "piqd_receipts.count: terminal status and iteration ledger require "
            f"{len(expected_parents)} solves, found {count}"
        )

    for index, (receipt_raw, parent_cnf, expected_status) in enumerate(
        zip(receipts, expected_parents, expected_statuses, strict=True)
    ):
        where = f"piqd_receipts.receipts[{index}]"
        if not isinstance(receipt_raw, dict):
            _fail(f"{where}: expected object")
        status = _require_str(receipt_raw.get("status"), f"{where}.status")
        expected_keys = {
            "assumptions",
            "at",
            "base_bytes",
            "base_clauses",
            "base_sha256",
            "conflict_limit",
            "model_recorded",
            "result_sha256",
            "solve_index",
            "status",
        }
        if status == "UNSAT":
            expected_keys.add("core")
        receipt = _expect_keys(
            receipt_raw,
            expected_keys,
            where,
        )
        if _require_int(receipt["solve_index"], f"{where}.solve_index") != index + 1:
            _fail(f"{where}.solve_index: expected contiguous one-based index")
        if not isinstance(receipt["assumptions"], list) or receipt["assumptions"]:
            _fail(f"{where}.assumptions: expected empty list")
        if _require_int(receipt["at"], f"{where}.at") <= 0:
            _fail(f"{where}.at: expected positive Unix timestamp")
        if (
            _require_int(receipt["conflict_limit"], f"{where}.conflict_limit")
            != conflict_limit
        ):
            _fail(f"{where}.conflict_limit: contract mismatch")
        if expected_status != "ANY" and status != expected_status:
            _fail(f"{where}.status: expected {expected_status}")
        if status not in {"SAT", "UNSAT", "UNKNOWN"}:
            _fail(f"{where}.status: unsupported PiQD result")
        if not isinstance(receipt["model_recorded"], bool) or receipt[
            "model_recorded"
        ] != (status == "SAT"):
            _fail(f"{where}.model_recorded: inconsistent with solve status")
        if status == "UNSAT" and (
            not isinstance(receipt["core"], list) or receipt["core"]
        ):
            _fail(f"{where}.core: expected empty core for an assumption-free solve")
        _require_hex(receipt["result_sha256"], f"{where}.result_sha256")

        parent = parse_dimacs(parent_cnf, f"{where}.parent_cnf")
        body = _dimacs_clause_body(parent_cnf, f"{where}.parent_cnf")
        if _require_int(receipt["base_bytes"], f"{where}.base_bytes") != len(body):
            _fail(f"{where}.base_bytes: reconstructed clause-body length mismatch")
        if _require_int(receipt["base_clauses"], f"{where}.base_clauses") != len(
            parent.clauses
        ):
            _fail(f"{where}.base_clauses: reconstructed parent mismatch")
        base_sha256 = _require_hex(receipt["base_sha256"], f"{where}.base_sha256")
        if base_sha256 != _sha256_bytes(body):
            _fail(f"{where}.base_sha256: reconstructed clause-body hash mismatch")
    return count


def _validate_terminal_detail(status: str, detail: Any) -> None:
    failure_statuses = {"INVALID_ENCODING_MODEL", "CERTFAIL", "PIQD_ERROR"}
    if status in failure_statuses:
        if (
            not isinstance(detail, str)
            or not detail.strip()
            or len(detail) > MAX_TERMINAL_DETAIL_CHARS
            or any(
                unicodedata.category(character) in {"Cc", "Cf", "Cs"}
                for character in detail
            )
        ):
            _fail(
                "terminal.detail: failure status requires normalized nonempty "
                f"detail of at most {MAX_TERMINAL_DETAIL_CHARS} Unicode scalar "
                "characters"
            )
    elif detail is not None:
        _fail("terminal.detail: nonfailure status requires null")


def verify_run(
    run_root: str | Path,
    contract_path: str | Path | None = None,
    *,
    require_live_piqd: bool = False,
) -> dict[str, Any]:
    """Verify a completed/checkpointed run root and return a compact summary."""
    root = Path(run_root)
    contract_file = root / "artifacts" / "contract.json"
    contract_bytes = _read_bytes(contract_file)
    contract = _load_json(contract_file)
    if contract_path is not None:
        supplied_path = Path(contract_path)
        if _read_bytes(supplied_path) != contract_bytes:
            _fail(
                f"{supplied_path}: supplied contract is not byte-identical to "
                f"authoritative {contract_file}"
            )
    contract_sha256 = _validate_contract(contract)
    variable_map = _load_json(root / "artifacts" / "variable-map.json")
    by_var, by_membership, variable_map_sha256 = _validate_variable_map(
        variable_map, contract_sha256
    )

    root_path = root / "artifacts" / "root.cnf"
    root_bytes = _read_bytes(root_path)
    root_dimacs = parse_dimacs(root_bytes, str(root_path))
    if root_dimacs.num_vars != NUM_VARS:
        _fail(f"{root_path}: expected {NUM_VARS} variables")
    if emit_dimacs(root_dimacs.num_vars, root_dimacs.clauses) != root_bytes:
        _fail(f"{root_path}: root CNF is not canonical DIMACS")
    expected_root_clauses = _expected_root_clauses()
    if root_dimacs.clauses != expected_root_clauses:
        _fail(f"{root_path}: clause inventory does not match the declared finite cell")
    root_cnf_sha256 = _sha256_bytes(root_bytes)
    root_inventory = _load_json(root / "artifacts" / "root-clause-inventory.json")
    root_inventory_sha256 = _validate_root_inventory(
        root_inventory,
        contract,
        contract_sha256,
        root_cnf_sha256,
        root_dimacs.clauses,
    )
    current_clauses: list[tuple[int, ...]] = list(root_dimacs.clauses)
    current_sha256 = root_cnf_sha256
    previous_record_sha256: str | None = None
    recorded_parent_cnfs: list[bytes] = []

    iteration_path = root / "events" / "iterations.jsonl"
    records = _load_iterations(iteration_path)
    alive_seen = False
    for index, record in enumerate(records):
        where = f"iterations[{index}]"
        _expect_keys(
            record,
            {
                "schema",
                "contract_sha256",
                "iteration",
                "parent_cnf_sha256",
                "previous_record_sha256",
                "assignment",
                "decoded_rows",
                "disposition",
                "certificate",
                "cut",
                "child_cnf_sha256",
                "record_sha256",
            },
            where,
        )
        if record["schema"] != ITERATION_SCHEMA:
            _fail(f"{where}.schema: expected {ITERATION_SCHEMA!r}")
        if record["contract_sha256"] != contract_sha256:
            _fail(f"{where}.contract_sha256: contract mismatch")
        if not _is_int(record["iteration"]) or record["iteration"] != index:
            _fail(f"{where}.iteration: expected zero-based index {index}")
        _require_hex(record["parent_cnf_sha256"], f"{where}.parent_cnf_sha256")
        if record["parent_cnf_sha256"] != current_sha256:
            _fail(f"{where}.parent_cnf_sha256: hash-chain discontinuity")
        recorded_parent_cnfs.append(emit_dimacs(NUM_VARS, current_clauses))
        _require_hex(
            record["previous_record_sha256"],
            f"{where}.previous_record_sha256",
            nullable=True,
        )
        if record["previous_record_sha256"] != previous_record_sha256:
            _fail(f"{where}.previous_record_sha256: record-chain discontinuity")
        assignment = _validate_assignment(
            record["assignment"], f"{where}.assignment", NUM_VARS
        )
        if not _satisfies(assignment, current_clauses):
            _fail(f"{where}.assignment: does not satisfy authenticated parent CNF")
        rows = _decode_rows(assignment, by_var)
        _validate_decoded_rows(record["decoded_rows"], rows, f"{where}.decoded_rows")
        disposition = record["disposition"]
        if disposition == "SPURIOUS_WITH_REFINEMENT":
            if alive_seen:
                _fail(f"{where}: record follows an ALIVE terminal model")
            if record["certificate"] is None or record["cut"] is None:
                _fail(f"{where}: certified disposition requires certificate and cut")
            antecedents, _ = _validate_certificate(
                record["certificate"], assignment, by_membership, f"{where}.certificate"
            )
            cut_clause, _ = _validate_cut(
                record["cut"], antecedents, by_membership, f"{where}.cut"
            )
            if _satisfies(assignment, [cut_clause]):
                _fail(f"{where}.cut: does not exclude its source model")
            current_clauses.append(cut_clause)
            child_bytes = emit_dimacs(NUM_VARS, current_clauses)
            child_sha256 = _sha256_bytes(child_bytes)
        elif disposition == "ALIVE_UNRESOLVED_ABSTRACT_MODEL":
            if record["certificate"] is not None or record["cut"] is not None:
                _fail(f"{where}: ALIVE disposition must not carry certificate or cut")
            alive_seen = True
            child_sha256 = current_sha256
        else:
            _fail(f"{where}.disposition: unsupported value {disposition!r}")
        _require_hex(record["child_cnf_sha256"], f"{where}.child_cnf_sha256")
        if record["child_cnf_sha256"] != child_sha256:
            _fail(f"{where}.child_cnf_sha256: canonical child reconstruction mismatch")
        current_sha256 = child_sha256
        previous_record_sha256 = _verify_self_hash(record, "record_sha256", where)

    if alive_seen and records[-1]["disposition"] != "ALIVE_UNRESOLVED_ABSTRACT_MODEL":
        _fail("iteration ledger: ALIVE model is not the final record")

    final_path = root / "artifacts" / "final.cnf"
    final_bytes = _read_bytes(final_path)
    final_dimacs = parse_dimacs(final_bytes, str(final_path))
    expected_final_bytes = emit_dimacs(NUM_VARS, current_clauses)
    if final_bytes != expected_final_bytes or final_dimacs != Dimacs(
        NUM_VARS, tuple(current_clauses)
    ):
        _fail(f"{final_path}: does not equal independently reconstructed final CNF")
    final_cnf_sha256 = _sha256_bytes(final_bytes)
    if final_cnf_sha256 != current_sha256:
        _fail(f"{final_path}: final hash-chain mismatch")

    terminal_path = root / "events" / "terminal.json"
    terminal = _load_json(terminal_path)
    _expect_keys(
        terminal,
        {
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
        },
        "terminal",
    )
    if terminal["schema"] != TERMINAL_SCHEMA:
        _fail(f"terminal.schema: expected {TERMINAL_SCHEMA!r}")
    if terminal["contract_sha256"] != contract_sha256:
        _fail("terminal.contract_sha256: contract mismatch")
    if terminal["status"] not in contract["terminal_statuses"]:
        _fail("terminal.status: not declared by contract")
    _validate_terminal_detail(terminal["status"], terminal["detail"])
    if not _is_int(terminal["iteration_count"]) or terminal["iteration_count"] != len(
        records
    ):
        _fail("terminal.iteration_count: ledger length mismatch")
    _require_hex(terminal["root_cnf_sha256"], "terminal.root_cnf_sha256")
    if terminal["root_cnf_sha256"] != root_cnf_sha256:
        _fail("terminal.root_cnf_sha256: root mismatch")
    _require_hex(terminal["final_cnf_sha256"], "terminal.final_cnf_sha256")
    if terminal["final_cnf_sha256"] != final_cnf_sha256:
        _fail("terminal.final_cnf_sha256: final mismatch")
    _require_hex(
        terminal["last_record_sha256"],
        "terminal.last_record_sha256",
        nullable=True,
    )
    if terminal["last_record_sha256"] != previous_record_sha256:
        _fail("terminal.last_record_sha256: record-chain mismatch")
    if terminal["status"] == "ALIVE_UNRESOLVED_ABSTRACT_MODEL":
        if (
            not records
            or records[-1]["disposition"] != "ALIVE_UNRESOLVED_ABSTRACT_MODEL"
        ):
            _fail("terminal.status: ALIVE requires a final ALIVE iteration record")
    elif alive_seen:
        _fail("terminal.status: final ALIVE record requires ALIVE terminal status")

    piqd = _expect_keys(
        terminal["piqd"],
        {"mode", "session_id", "solver_name", "receipts_path", "receipts_sha256"},
        "terminal.piqd",
    )
    if require_live_piqd and piqd["mode"] != "LIVE":
        _fail("terminal.piqd.mode: publication verification requires LIVE PiQD")
    _require_str(piqd["solver_name"], "terminal.piqd.solver_name")
    if not piqd["solver_name"]:
        _fail("terminal.piqd.solver_name: must be nonempty")
    piqd_receipt_count = 0
    if piqd["mode"] == "FAKE":
        if any(
            piqd[key] is not None
            for key in ("session_id", "receipts_path", "receipts_sha256")
        ):
            _fail("terminal.piqd: FAKE mode requires null session and receipts fields")
    elif piqd["mode"] == "LIVE":
        if terminal["status"] == "PIQD_ERROR":
            if piqd["session_id"] is not None and (
                not isinstance(piqd["session_id"], str) or not piqd["session_id"]
            ):
                _fail(
                    "terminal.piqd.session_id: LIVE PIQD_ERROR requires null or "
                    "nonempty string"
                )
            receipt_nulls = (
                piqd["receipts_path"] is None,
                piqd["receipts_sha256"] is None,
            )
            if receipt_nulls[0] != receipt_nulls[1]:
                _fail(
                    "terminal.piqd: LIVE PIQD_ERROR receipt path and hash must "
                    "both be null or both be present"
                )
            if not receipt_nulls[0]:
                receipts_path = _safe_receipts_path(root, piqd["receipts_path"])
                receipts_sha256 = _require_hex(
                    piqd["receipts_sha256"], "terminal.piqd.receipts_sha256"
                )
                if _sha256_bytes(_read_bytes(receipts_path)) != receipts_sha256:
                    _fail("terminal.piqd.receipts_sha256: receipt bytes mismatch")
                piqd_receipt_count = _validate_live_receipts(
                    receipts_path,
                    session_id=piqd["session_id"],
                    terminal_status=terminal["status"],
                    conflict_limit=contract["budgets"]["conflict_limit_per_solve"],
                    recorded_parent_cnfs=recorded_parent_cnfs,
                    final_cnf=final_bytes,
                )
        else:
            if not isinstance(piqd["session_id"], str) or not piqd["session_id"]:
                _fail("terminal.piqd.session_id: LIVE mode requires nonempty string")
            receipts_path = _safe_receipts_path(root, piqd["receipts_path"])
            receipts_sha256 = _require_hex(
                piqd["receipts_sha256"], "terminal.piqd.receipts_sha256"
            )
            if _sha256_bytes(_read_bytes(receipts_path)) != receipts_sha256:
                _fail("terminal.piqd.receipts_sha256: receipt bytes mismatch")
            piqd_receipt_count = _validate_live_receipts(
                receipts_path,
                session_id=piqd["session_id"],
                terminal_status=terminal["status"],
                conflict_limit=contract["budgets"]["conflict_limit_per_solve"],
                recorded_parent_cnfs=recorded_parent_cnfs,
                final_cnf=final_bytes,
            )
            exported_session_cnf = _read_bytes(root / "artifacts" / "piqd-final.cnf")
            if exported_session_cnf != final_bytes:
                _fail(
                    "artifacts/piqd-final.cnf: exported PiQD session does not equal "
                    "the independently reconstructed final CNF"
                )
    else:
        _fail("terminal.piqd.mode: expected FAKE or LIVE")
    terminal_sha256 = _verify_self_hash(terminal, "terminal_sha256", "terminal")

    return {
        "schema": "rvol-wave2b-independent-verification/v1",
        "status": "VERIFIED",
        "terminal_status": terminal["status"],
        "contract_sha256": contract_sha256,
        "variable_map_sha256": variable_map_sha256,
        "root_cnf_sha256": root_cnf_sha256,
        "root_inventory_sha256": root_inventory_sha256,
        "final_cnf_sha256": final_cnf_sha256,
        "iteration_count": len(records),
        "refinement_count": sum(
            record["disposition"] == "SPURIOUS_WITH_REFINEMENT" for record in records
        ),
        "last_record_sha256": previous_record_sha256,
        "terminal_sha256": terminal_sha256,
        "piqd_receipt_count": piqd_receipt_count,
        "piqd_session_export_sha256": (
            final_cnf_sha256
            if piqd["mode"] == "LIVE" and terminal["status"] != "PIQD_ERROR"
            else None
        ),
        "scope": "AUTHENTICATED_FINITE_ABSTRACT_CELL_ONLY",
    }


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "run_root", type=Path, help="run root containing artifacts/ and events/"
    )
    parser.add_argument(
        "--contract",
        type=Path,
        default=None,
        help=(
            "optional repository contract that must be byte-identical to the "
            "authoritative run-local artifacts/contract.json"
        ),
    )
    parser.add_argument(
        "--require-live-piqd",
        action="store_true",
        help="reject FAKE-mode artifacts when verifying a PiQD-only run",
    )
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        summary = verify_run(
            args.run_root,
            args.contract,
            require_live_piqd=args.require_live_piqd,
        )
    except VerificationError as exc:
        print(f"verification failed: {exc}", file=sys.stderr)
        return 1
    print(_canonical_json_bytes(summary).decode("ascii"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
