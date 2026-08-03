"""Detect and replay the seven-point three-rhombus obstruction.

The detector consumes only explicit positive directed shell memberships
``s(center, point)`` for ``n = 10``.  Two positives in a common center row
certify equality of the corresponding unordered distance edges.  A hit is an
injective seven-label copy of the fixed ten-edge theorem pattern contained in
one connected component of that equality graph.

Certificates store canonical shortest paths from each theorem edge to a
canonical root.  The learned clause negates exactly the positive memberships
used by those paths.  Pass ``lambda p, q: encoding.var("s", p, q)`` as
``var_lookup`` when integrating with :mod:`sat_generate`.

This module certifies a valid learned cut.  It deliberately records
``terminal_claim = false`` and makes no global Phase-3 closure claim.
"""

from __future__ import annotations

import hashlib
import itertools
import json
from collections import Counter, deque
from collections.abc import Callable, Iterable, Mapping, Sequence
from dataclasses import dataclass
from typing import Any

N = 10
CERTIFICATE_SCHEMA = "p97-phase3-three-rhombus-equality-closure-v1"
ROWS_SCHEMA = "p97-phase3-positive-rows-v1"
SEMANTIC_SCHEMA_LEGACY = "p97-phase3-semantic-assignment-v1-sbf"
SEMANTIC_SCHEMA_PROJECTED = "p97-phase3-semantic-assignment-v2-sf"

type Membership = tuple[int, int]
type Edge = tuple[int, int]
type MembershipVarLookup = Callable[[int, int], int]
type PositiveSource = Mapping[str, Any] | Iterable[Any]

# Edges in theorem-label coordinates.  Their later endpoints give the exact
# incremental constraints used by the lexicographic DFS below.
THEOREM_EDGES: tuple[Edge, ...] = (
    (0, 1),
    (0, 3),
    (0, 4),
    (0, 6),
    (1, 2),
    (2, 3),
    (2, 5),
    (3, 4),
    (4, 5),
    (5, 6),
)
PREVIOUS_NEIGHBORS: tuple[tuple[int, ...], ...] = tuple(
    tuple(left for left, right in THEOREM_EDGES if right == label)
    for label in range(7)
)

CERTIFICATE_FIELDS = frozenset(
    {
        "schema",
        "kind",
        "n",
        "pattern_labels",
        "pattern_edges",
        "root_edge",
        "equality_paths",
        "used_positive_memberships",
        "collision",
        "literal_count",
        "clause",
        "clause_sha256",
        "positive_evidence_sha256",
        "payload_sha256",
        "terminal_claim",
    }
)
PATH_FIELDS = frozenset({"edge", "steps"})
STEP_FIELDS = frozenset({"center", "first", "second"})
ROW_WRAPPER_FIELDS = frozenset({"schema", "rows"})
ROW_FIELDS = frozenset({"center", "exact", "support"})
SEMANTIC_WRAPPER_FIELDS = frozenset({"schema", "semantic_assignment"})


class CertificateError(ValueError):
    """A source, certificate, callback, or replay contract is invalid."""


class NoThreeRhombusError(CertificateError):
    """The positive equality closure contains no theorem embedding."""


@dataclass(frozen=True, order=True)
class EqualityStep:
    """One directed equality-graph step from ``first`` to ``second``."""

    center: int
    first: int
    second: int

    def as_json(self) -> dict[str, int]:
        return {
            "center": self.center,
            "first": self.first,
            "second": self.second,
        }


type EqualityGraph = dict[Edge, tuple[tuple[Edge, EqualityStep], ...]]


def canonical_bytes(value: Any) -> bytes:
    """Return the one canonical JSON representation used by every hash."""

    try:
        rendered = json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=True,
        )
    except (TypeError, ValueError) as exc:
        raise CertificateError(f"value is not canonical-JSON serializable: {exc}") from exc
    return rendered.encode("ascii")


def digest(value: Any) -> str:
    """SHA-256 of :func:`canonical_bytes`."""

    return hashlib.sha256(canonical_bytes(value)).hexdigest()


def _require_fields(
    value: Mapping[str, Any], expected: frozenset[str], where: str
) -> None:
    actual = set(value)
    if actual != expected:
        missing = sorted(expected - actual)
        extra = sorted(actual - expected)
        raise CertificateError(
            f"{where} fields mismatch: missing={missing}, extra={extra}"
        )


def _require_int(value: Any, where: str) -> int:
    if type(value) is not int:
        raise CertificateError(f"{where} must be an integer")
    return value


def _require_label(value: Any, where: str) -> int:
    label = _require_int(value, where)
    if not 0 <= label < N:
        raise CertificateError(f"{where} is not in Fin {N}")
    return label


def _edge(left: int, right: int) -> Edge:
    if left == right:
        raise CertificateError("a distance edge must have distinct endpoints")
    return (left, right) if left < right else (right, left)


def _json_edge(value: Any, where: str) -> Edge:
    if not isinstance(value, list) or len(value) != 2:
        raise CertificateError(f"{where} must be a two-element JSON list")
    left = _require_label(value[0], f"{where}[0]")
    right = _require_label(value[1], f"{where}[1]")
    if left >= right:
        raise CertificateError(f"{where} must be an ascending unordered edge")
    return left, right


def _json_membership(value: Any, where: str) -> Membership:
    if not isinstance(value, list) or len(value) != 2:
        raise CertificateError(f"{where} must be a two-element JSON list")
    center = _require_label(value[0], f"{where}[0]")
    point = _require_label(value[1], f"{where}[1]")
    if center == point:
        raise CertificateError(f"{where} must be off-center")
    return center, point


def _membership(value: Any, where: str) -> Membership:
    if not isinstance(value, (list, tuple)) or len(value) != 2:
        raise CertificateError(f"{where} must be a directed pair")
    center = _require_label(value[0], f"{where}[0]")
    point = _require_label(value[1], f"{where}[1]")
    if center == point:
        raise CertificateError(f"{where} must be off-center")
    return center, point


def normalize_positive_memberships(
    memberships: Iterable[Any],
) -> frozenset[Membership]:
    """Validate and deduplicate explicit positive directed memberships."""

    if isinstance(memberships, (str, bytes, Mapping)):
        raise CertificateError("positive memberships must be an iterable of pairs")
    return frozenset(
        _membership(item, f"positive_memberships[{index}]")
        for index, item in enumerate(memberships)
    )


def _all_s_names() -> frozenset[str]:
    return frozenset(
        f"s[{center},{point}]"
        for center in range(N)
        for point in range(N)
        if center != point
    )


def _all_f_names() -> frozenset[str]:
    return frozenset(
        f"f[{point},{cap}]" for point in range(3, N) for cap in range(3)
    )


def _all_b_names() -> frozenset[str]:
    return frozenset(
        f"b[{point},{center}]"
        for point in range(N)
        for center in range(N)
        if point != center
    )


def parse_semantic_assignment(obj: Mapping[str, Any]) -> frozenset[Membership]:
    """Extract true ``s`` atoms from a strict Phase-3 semantic assignment.

    Projected ``sf`` and legacy ``sbf`` schemas are recognized.  A bare
    semantic mapping is accepted only when its field set is exactly one of
    those two schemas (or the 90 ``s`` fields alone).  False atoms remain
    unused; the detector reasons only from explicitly true memberships.
    """

    if not isinstance(obj, Mapping):
        raise CertificateError("semantic assignment must be an object")
    schema: str | None = None
    semantic: Mapping[str, Any]
    if set(obj) == SEMANTIC_WRAPPER_FIELDS:
        schema_value = obj["schema"]
        if schema_value not in {
            SEMANTIC_SCHEMA_LEGACY,
            SEMANTIC_SCHEMA_PROJECTED,
        }:
            raise CertificateError(f"unknown semantic assignment schema: {schema_value!r}")
        schema = schema_value
        candidate = obj["semantic_assignment"]
        if not isinstance(candidate, Mapping):
            raise CertificateError("semantic_assignment must be an object")
        semantic = candidate
    else:
        semantic = obj

    s_names = _all_s_names()
    projected_names = s_names | _all_f_names()
    legacy_names = projected_names | _all_b_names()
    expected = {
        SEMANTIC_SCHEMA_PROJECTED: projected_names,
        SEMANTIC_SCHEMA_LEGACY: legacy_names,
    }.get(schema)
    actual = set(semantic)
    if expected is None:
        if actual == s_names:
            expected = s_names
        elif actual == projected_names:
            expected = projected_names
        elif actual == legacy_names:
            expected = legacy_names
        else:
            raise CertificateError(
                "bare semantic assignment does not have an exact supported field set"
            )
    if actual != expected:
        missing = sorted(expected - actual)
        extra = sorted(actual - expected)
        raise CertificateError(
            "semantic assignment fields mismatch: "
            f"missing={missing[:5]}, extra={extra[:5]}"
        )
    if any(type(value) is not bool for value in semantic.values()):
        raise CertificateError("semantic assignment values must all be Boolean")
    return frozenset(
        (center, point)
        for center in range(N)
        for point in range(N)
        if center != point and semantic[f"s[{center},{point}]"] is True
    )


def _memberships_from_rows(rows: Iterable[Any]) -> frozenset[Membership]:
    positives: set[Membership] = set()
    seen_centers: set[int] = set()
    for index, row in enumerate(rows):
        strict_json_row = isinstance(row, Mapping)
        if strict_json_row:
            _require_fields(row, ROW_FIELDS, f"rows[{index}]")
            center_value = row["center"]
            exact = row["exact"]
            support_value = row["support"]
        else:
            try:
                center_value = row.center
                exact = row.exact
                support_value = row.support
            except AttributeError as exc:
                raise CertificateError(
                    f"rows[{index}] is neither a strict row object nor a row-like value"
                ) from exc

        center = _require_label(center_value, f"rows[{index}].center")
        if center in seen_centers:
            raise CertificateError(f"duplicate row center {center}")
        seen_centers.add(center)
        if type(exact) is not bool:
            raise CertificateError(f"rows[{index}].exact must be Boolean")
        if isinstance(support_value, (str, bytes, Mapping)):
            raise CertificateError(f"rows[{index}].support must be an iterable")
        try:
            support_raw = list(support_value)
        except TypeError as exc:
            raise CertificateError(
                f"rows[{index}].support must be an iterable"
            ) from exc
        support = [
            _require_label(point, f"rows[{index}].support[{support_index}]")
            for support_index, point in enumerate(support_raw)
        ]
        if len(set(support)) != len(support) or center in support:
            raise CertificateError(
                f"rows[{index}].support must be unique and off-center"
            )
        if strict_json_row and support != sorted(support):
            raise CertificateError(f"rows[{index}].support must be sorted")
        positives.update((center, point) for point in support)
        # Crucially, exact=False contributes no negative off-support facts.
    return frozenset(positives)


def parse_positive_rows(obj: Mapping[str, Any]) -> frozenset[Membership]:
    """Parse the strict positive-row wrapper, using support only positively."""

    if not isinstance(obj, Mapping):
        raise CertificateError("positive-row input must be an object")
    _require_fields(obj, ROW_WRAPPER_FIELDS, "positive-row input")
    if obj["schema"] != ROWS_SCHEMA:
        raise CertificateError(f"unknown positive-row schema: {obj['schema']!r}")
    rows = obj["rows"]
    if not isinstance(rows, list):
        raise CertificateError("positive-row rows must be a JSON list")
    return _memberships_from_rows(rows)


def extract_positive_memberships(source: PositiveSource) -> frozenset[Membership]:
    """Normalize a strict wrapper, row sequence, or explicit pair iterable."""

    if isinstance(source, Mapping):
        if source.get("schema") == ROWS_SCHEMA or "rows" in source:
            return parse_positive_rows(source)
        return parse_semantic_assignment(source)
    if isinstance(source, (str, bytes)):
        raise CertificateError("positive source cannot be text")
    materialized = list(source)
    if not materialized:
        return frozenset()
    if all(
        isinstance(item, (list, tuple))
        and len(item) == 2
        and all(type(value) is int for value in item)
        for item in materialized
    ):
        return normalize_positive_memberships(materialized)
    return _memberships_from_rows(materialized)


def dense_membership_var(center: int, point: int) -> int:
    """The standalone dense variable numbering used by Phase-3 encodings."""

    center = _require_label(center, "center")
    point = _require_label(point, "point")
    if center == point:
        raise CertificateError("a membership variable must be off-center")
    return 1 + 9 * center + (point if point < center else point - 1)


def clause_for(
    memberships: Iterable[Any],
    *,
    var_lookup: MembershipVarLookup = dense_membership_var,
) -> list[int]:
    """Negate exactly the supplied positive memberships as a canonical clause."""

    normalized = sorted(normalize_positive_memberships(memberships))
    variables: list[int] = []
    for center, point in normalized:
        try:
            variable = var_lookup(center, point)
        except Exception as exc:
            raise CertificateError(
                f"membership variable lookup failed for {(center, point)}: {exc}"
            ) from exc
        if type(variable) is not int or variable <= 0:
            raise CertificateError(
                f"membership variable for {(center, point)} must be a positive integer"
            )
        variables.append(variable)
    if len(set(variables)) != len(variables):
        raise CertificateError("membership variable lookup is not injective")
    return sorted(-variable for variable in variables)


def positive_evidence(positives: Iterable[Any]) -> dict[str, Any]:
    normalized = sorted(normalize_positive_memberships(positives))
    return {"positive_memberships": [list(item) for item in normalized]}


def equality_graph(positives: Iterable[Any]) -> EqualityGraph:
    """Build the deterministic equality graph from positive common-row pairs."""

    normalized = normalize_positive_memberships(positives)
    mutable: dict[Edge, list[tuple[Edge, EqualityStep]]] = {
        (left, right): []
        for left in range(N)
        for right in range(left + 1, N)
    }
    for center in range(N):
        support = sorted(point for row, point in normalized if row == center)
        for first, second in itertools.combinations(support, 2):
            first_edge = _edge(center, first)
            second_edge = _edge(center, second)
            mutable[first_edge].append(
                (second_edge, EqualityStep(center, first, second))
            )
            mutable[second_edge].append(
                (first_edge, EqualityStep(center, second, first))
            )
    return {
        edge: tuple(
            sorted(
                neighbors,
                key=lambda item: (
                    item[0],
                    item[1].center,
                    item[1].first,
                    item[1].second,
                ),
            )
        )
        for edge, neighbors in mutable.items()
    }


def _component_ids(graph: EqualityGraph) -> tuple[dict[Edge, int], Counter[int]]:
    component_for: dict[Edge, int] = {}
    sizes: Counter[int] = Counter()
    component = 0
    for start in sorted(graph):
        if start in component_for:
            continue
        queue = deque([start])
        component_for[start] = component
        while queue:
            current = queue.popleft()
            sizes[component] += 1
            for neighbor, _step in graph[current]:
                if neighbor not in component_for:
                    component_for[neighbor] = component
                    queue.append(neighbor)
        component += 1
    return component_for, sizes


def find_canonical_embedding(positives: Iterable[Any]) -> tuple[int, ...] | None:
    """Find the lexicographically first injective theorem embedding.

    Labels are assigned in theorem order.  Every edge to an already assigned
    label is checked immediately, so the search preserves ``10P7`` lexical
    order without enumerating all permutations on typical misses.
    """

    graph = equality_graph(positives)
    component_for, component_sizes = _component_ids(graph)
    assigned = [-1] * 7
    used: set[int] = set()

    def search(label: int, chosen_component: int | None) -> tuple[int, ...] | None:
        if label == 7:
            return tuple(assigned)
        for point in range(N):
            if point in used:
                continue
            candidate_component = chosen_component
            compatible = True
            for previous_label in PREVIOUS_NEIGHBORS[label]:
                edge_component = component_for[
                    _edge(assigned[previous_label], point)
                ]
                if candidate_component is None:
                    candidate_component = edge_component
                    if component_sizes[edge_component] < len(THEOREM_EDGES):
                        compatible = False
                        break
                elif edge_component != candidate_component:
                    compatible = False
                    break
            if not compatible:
                continue
            assigned[label] = point
            used.add(point)
            result = search(label + 1, candidate_component)
            if result is not None:
                return result
            used.remove(point)
            assigned[label] = -1
        return None

    return search(0, None)


def canonical_embedding(positives: Iterable[Any]) -> tuple[int, ...]:
    """Raising form of :func:`find_canonical_embedding`."""

    embedding = find_canonical_embedding(positives)
    if embedding is None:
        raise NoThreeRhombusError(
            "positive equality closure contains no seven-point three-rhombus embedding"
        )
    return embedding


def _pattern_edges(labels: Sequence[int]) -> tuple[Edge, ...]:
    return tuple(
        sorted(_edge(labels[left], labels[right]) for left, right in THEOREM_EDGES)
    )


def canonical_path(
    graph: EqualityGraph, start: Edge, goal: Edge
) -> list[dict[str, int]]:
    """Return the canonical BFS path from ``start`` to ``goal``.

    Stored steps retain the adjacency direction in which BFS traversed them.
    Backtracking reverses only the step order, never ``first`` and ``second``.
    """

    if start not in graph or goal not in graph:
        raise CertificateError("canonical path endpoint is not a distance edge")
    predecessor: dict[Edge, tuple[Edge, EqualityStep] | None] = {start: None}
    queue = deque([start])
    while queue and goal not in predecessor:
        current = queue.popleft()
        for neighbor, step in graph[current]:
            if neighbor not in predecessor:
                predecessor[neighbor] = current, step
                queue.append(neighbor)
    if goal not in predecessor:
        raise CertificateError(f"no equality path from {start} to {goal}")

    reversed_steps: list[EqualityStep] = []
    current = goal
    while True:
        record = predecessor[current]
        if record is None:
            break
        previous, step = record
        reversed_steps.append(step)
        current = previous
    return [step.as_json() for step in reversed(reversed_steps)]


def _build_certificate(
    positives: frozenset[Membership],
    labels: tuple[int, ...],
    *,
    var_lookup: MembershipVarLookup,
) -> dict[str, Any]:
    graph = equality_graph(positives)
    edges = _pattern_edges(labels)
    root = min(edges)
    paths: list[dict[str, Any]] = []
    used: set[Membership] = set()
    for edge in edges:
        steps = canonical_path(graph, edge, root)
        for step in steps:
            used.add((step["center"], step["first"]))
            used.add((step["center"], step["second"]))
        paths.append({"edge": list(edge), "steps": steps})

    used_list = [list(item) for item in sorted(used)]
    clause = clause_for(used, var_lookup=var_lookup)
    payload: dict[str, Any] = {
        "schema": CERTIFICATE_SCHEMA,
        "kind": "equality-closure",
        "n": N,
        "pattern_labels": list(labels),
        "pattern_edges": [list(edge) for edge in edges],
        "root_edge": list(root),
        "equality_paths": paths,
        "used_positive_memberships": used_list,
        "collision": [labels[1], labels[6]],
        "literal_count": len(used_list),
        "clause": clause,
        "clause_sha256": digest(clause),
        "positive_evidence_sha256": digest(positive_evidence(positives)),
        "terminal_claim": False,
    }
    return {**payload, "payload_sha256": digest(payload)}


def detect_three_rhombus(
    source: PositiveSource,
    *,
    var_lookup: MembershipVarLookup = dense_membership_var,
) -> dict[str, Any] | None:
    """Return the canonical certificate, or ``None`` when there is no hit."""

    positives = extract_positive_memberships(source)
    labels = find_canonical_embedding(positives)
    if labels is None:
        return None
    return _build_certificate(positives, labels, var_lookup=var_lookup)


def generate_closure(
    source: PositiveSource,
    *,
    var_lookup: MembershipVarLookup = dense_membership_var,
) -> dict[str, Any]:
    """Generate the canonical closure certificate, raising on a miss."""

    certificate = detect_three_rhombus(source, var_lookup=var_lookup)
    if certificate is None:
        raise NoThreeRhombusError(
            "positive equality closure contains no seven-point three-rhombus embedding"
        )
    return certificate


def _labels_from_json(value: Any) -> tuple[int, ...]:
    if not isinstance(value, list) or len(value) != 7:
        raise CertificateError("pattern_labels must be a seven-element JSON list")
    labels = tuple(
        _require_label(label, f"pattern_labels[{index}]")
        for index, label in enumerate(value)
    )
    if len(set(labels)) != len(labels):
        raise CertificateError("pattern_labels must be pairwise distinct")
    return labels


def _json_membership_list(value: Any, where: str) -> tuple[Membership, ...]:
    if not isinstance(value, list):
        raise CertificateError(f"{where} must be a JSON list")
    parsed = tuple(
        _json_membership(item, f"{where}[{index}]")
        for index, item in enumerate(value)
    )
    if parsed != tuple(sorted(set(parsed))):
        raise CertificateError(f"{where} must be sorted and duplicate-free")
    return parsed


def validate_equality_paths(
    certificate: Mapping[str, Any], positives: Iterable[Any]
) -> frozenset[Membership]:
    """Independently validate every stored directed path.

    This check does not regenerate BFS paths.  It starts at each claimed edge,
    checks both positive memberships for every step, advances to the step's
    second distance edge, and requires the path to finish at ``root_edge``.
    """

    normalized = normalize_positive_memberships(positives)
    try:
        root_value = certificate["root_edge"]
        paths_value = certificate["equality_paths"]
    except KeyError as exc:
        raise CertificateError(f"certificate lacks path field {exc.args[0]!r}") from exc
    root = _json_edge(root_value, "root_edge")
    if not isinstance(paths_value, list):
        raise CertificateError("equality_paths must be a JSON list")

    used: set[Membership] = set()
    path_edges: list[Edge] = []
    for path_index, path in enumerate(paths_value):
        where = f"equality_paths[{path_index}]"
        if not isinstance(path, Mapping):
            raise CertificateError(f"{where} must be an object")
        _require_fields(path, PATH_FIELDS, where)
        current = _json_edge(path["edge"], f"{where}.edge")
        path_edges.append(current)
        steps = path["steps"]
        if not isinstance(steps, list):
            raise CertificateError(f"{where}.steps must be a JSON list")
        for step_index, step in enumerate(steps):
            step_where = f"{where}.steps[{step_index}]"
            if not isinstance(step, Mapping):
                raise CertificateError(f"{step_where} must be an object")
            _require_fields(step, STEP_FIELDS, step_where)
            center = _require_label(step["center"], f"{step_where}.center")
            first = _require_label(step["first"], f"{step_where}.first")
            second = _require_label(step["second"], f"{step_where}.second")
            if center in {first, second} or first == second:
                raise CertificateError(f"{step_where} is not a nontrivial row equality")
            first_membership = center, first
            second_membership = center, second
            if (
                first_membership not in normalized
                or second_membership not in normalized
            ):
                raise CertificateError(
                    f"{step_where} lacks its two explicit positive memberships"
                )
            if current != _edge(center, first):
                raise CertificateError(
                    f"{step_where} does not start at the current distance edge"
                )
            used.update((first_membership, second_membership))
            current = _edge(center, second)
        if current != root:
            raise CertificateError(f"{where} does not end at root_edge")

    pattern_value = certificate.get("pattern_edges")
    if pattern_value is not None:
        if not isinstance(pattern_value, list):
            raise CertificateError("pattern_edges must be a JSON list")
        pattern = [
            _json_edge(edge, f"pattern_edges[{index}]")
            for index, edge in enumerate(pattern_value)
        ]
        if path_edges != pattern:
            raise CertificateError(
                "equality path edges must exactly match ordered pattern_edges"
            )
    return frozenset(used)


def _check_payload_hash(certificate: Mapping[str, Any]) -> None:
    unsigned = dict(certificate)
    stored = unsigned.pop("payload_sha256", None)
    if stored != digest(unsigned):
        raise CertificateError("payload_sha256 mismatch")


def replay_closure(
    certificate: Mapping[str, Any],
    source: PositiveSource,
    *,
    var_lookup: MembershipVarLookup = dense_membership_var,
) -> tuple[int, ...]:
    """Strictly replay a canonical certificate and return its learned clause."""

    if not isinstance(certificate, Mapping):
        raise CertificateError("certificate must be an object")
    _require_fields(certificate, CERTIFICATE_FIELDS, "certificate")
    _check_payload_hash(certificate)
    if certificate["schema"] != CERTIFICATE_SCHEMA:
        raise CertificateError("certificate schema mismatch")
    if certificate["kind"] != "equality-closure":
        raise CertificateError("certificate kind mismatch")
    if type(certificate["n"]) is not int or certificate["n"] != N:
        raise CertificateError(f"certificate n must be exactly {N}")
    if certificate["terminal_claim"] is not False:
        raise CertificateError("three-rhombus certificate terminal_claim must be false")

    positives = extract_positive_memberships(source)
    labels = _labels_from_json(certificate["pattern_labels"])
    expected_edges = _pattern_edges(labels)
    pattern_value = certificate["pattern_edges"]
    if not isinstance(pattern_value, list) or len(pattern_value) != len(THEOREM_EDGES):
        raise CertificateError("pattern_edges must contain exactly ten edges")
    stored_edges = tuple(
        _json_edge(edge, f"pattern_edges[{index}]")
        for index, edge in enumerate(pattern_value)
    )
    if stored_edges != expected_edges:
        raise CertificateError("pattern_edges do not match pattern_labels")
    root = _json_edge(certificate["root_edge"], "root_edge")
    if root != min(expected_edges):
        raise CertificateError("root_edge is not the canonical pattern root")
    collision = certificate["collision"]
    if not isinstance(collision, list) or collision != [labels[1], labels[6]]:
        raise CertificateError("collision does not match the theorem labels")

    used_from_paths = validate_equality_paths(certificate, positives)
    stored_used = _json_membership_list(
        certificate["used_positive_memberships"],
        "used_positive_memberships",
    )
    if frozenset(stored_used) != used_from_paths:
        raise CertificateError(
            "used_positive_memberships is not the exact equality-path union"
        )
    literal_count = _require_int(certificate["literal_count"], "literal_count")
    if literal_count != len(stored_used):
        raise CertificateError("literal_count does not match used memberships")

    expected_clause = clause_for(stored_used, var_lookup=var_lookup)
    clause = certificate["clause"]
    if (
        not isinstance(clause, list)
        or any(type(literal) is not int or literal >= 0 for literal in clause)
        or clause != sorted(set(clause))
    ):
        raise CertificateError(
            "clause must be a sorted, duplicate-free list of negative integers"
        )
    if clause != expected_clause or len(clause) != literal_count:
        raise CertificateError(
            "clause is not the exact negation of used positive memberships"
        )
    if certificate["clause_sha256"] != digest(clause):
        raise CertificateError("clause_sha256 mismatch")
    if certificate["positive_evidence_sha256"] != digest(
        positive_evidence(positives)
    ):
        raise CertificateError("positive_evidence_sha256 mismatch")

    # Full canonical regeneration is deliberately last: path direction and
    # composability have already been checked independently above.
    expected = detect_three_rhombus(positives, var_lookup=var_lookup)
    if expected is None or dict(certificate) != expected:
        raise CertificateError(
            "certificate is not its strict canonical regeneration"
        )
    return tuple(clause)


def replay(
    certificate: Mapping[str, Any],
    source: PositiveSource,
    *,
    var_lookup: MembershipVarLookup = dense_membership_var,
) -> tuple[int, ...]:
    """Alias for :func:`replay_closure` for integration call sites."""

    return replay_closure(certificate, source, var_lookup=var_lookup)


__all__ = [
    "CERTIFICATE_FIELDS",
    "CERTIFICATE_SCHEMA",
    "ROWS_SCHEMA",
    "SEMANTIC_SCHEMA_LEGACY",
    "SEMANTIC_SCHEMA_PROJECTED",
    "THEOREM_EDGES",
    "CertificateError",
    "EqualityStep",
    "Membership",
    "MembershipVarLookup",
    "N",
    "NoThreeRhombusError",
    "canonical_bytes",
    "canonical_embedding",
    "canonical_path",
    "clause_for",
    "dense_membership_var",
    "detect_three_rhombus",
    "digest",
    "equality_graph",
    "extract_positive_memberships",
    "find_canonical_embedding",
    "generate_closure",
    "normalize_positive_memberships",
    "parse_positive_rows",
    "parse_semantic_assignment",
    "positive_evidence",
    "replay",
    "replay_closure",
    "validate_equality_paths",
]
