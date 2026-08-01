"""K-A-specific symbolic distance profiles for critical four-shell systems.

This module is deliberately separate from the generic Phase-3 realization
driver.  A :class:`CriticalFourShellRow` represents the *whole* positive-radius
class supplied by the K-A ``CriticalFourShell`` interface:

* its four named center-edges have equal length; and
* every other ambient edge incident to that center has a different length.

``NoQFreeAfterDeletion`` records that, after deleting the row source, no four
surviving non-center labels share a center-distance.  The optional
``unique_four_radius`` flag additionally says that the named four-class is the
only center-distance class of size at least four.

The implementation has two independent finite surfaces:

* a deterministic symbolic clause emitter over equality atoms between
  canonical unordered edges; and
* a complete finite-partition checker for concrete edge-distance partitions.

Neither surface checks coordinates, Euclidean realizability, convexity, or a
Lean theorem application.  Provenance strings are carried through to emitted
constraints, but are declarations by the caller rather than verified claims.
"""

from __future__ import annotations

from collections import Counter, defaultdict
from collections.abc import Hashable, Iterable, Mapping, Sequence
from dataclasses import dataclass
from itertools import combinations
from typing import Any

SCHEMA = "p97-k-a-critical-distance-profile-v1"
LANE = "K-A"
SYMBOLIC_TRUST = "DETERMINISTIC_PYTHON_SYMBOLIC_CHECK_NOT_KERNEL_LANDED"
PARTITION_TRUST = "DETERMINISTIC_FINITE_PARTITION_CHECK_NOT_EUCLIDEAN"
FORBIDDEN_CLAIMS = (
    "EUCLIDEAN_REALIZABLE",
    "EUCLIDEAN_INFEASIBLE",
    "LEAN_CLOSED",
    "PHASE3_EXHAUSTIVE",
)

Edge = tuple[int, int]

__all__ = [
    "FORBIDDEN_CLAIMS",
    "LANE",
    "PARTITION_TRUST",
    "SCHEMA",
    "SYMBOLIC_TRUST",
    "CompiledProfile",
    "CriticalDistanceProfile",
    "CriticalDistanceProfileError",
    "CriticalFourShellRow",
    "DistancePartition",
    "Edge",
    "EqualityAtom",
    "EqualityLiteral",
    "NoQFreeAfterDeletion",
    "PartitionCheckResult",
    "ProvenanceTag",
    "SymbolicCheckResult",
    "SymbolicClause",
    "canonical_edge",
    "check_distance_partition",
    "check_edge_relations",
    "check_symbolic_consistency",
    "emit_profile_clauses",
]


class CriticalDistanceProfileError(ValueError):
    """Raised when a K-A symbolic profile or partition is malformed."""


def _require_label(label: object, *, where: str) -> int:
    if type(label) is not int or label < 0:
        raise CriticalDistanceProfileError(f"{where} must be a nonnegative integer")
    return label


def canonical_edge(left: int, right: int, *, n: int | None = None) -> Edge:
    """Return the canonical orientation of one non-loop label edge."""

    left = _require_label(left, where="edge left endpoint")
    right = _require_label(right, where="edge right endpoint")
    if left == right:
        raise CriticalDistanceProfileError("distance edges may not be loops")
    if n is not None and (left >= n or right >= n):
        raise CriticalDistanceProfileError(f"edge {(left, right)} is outside 0..{n - 1}")
    return (left, right) if left < right else (right, left)


def _normalize_edge(edge: object, *, n: int | None = None) -> Edge:
    if (
        not isinstance(edge, tuple)
        or len(edge) != 2
        or type(edge[0]) is not int
        or type(edge[1]) is not int
    ):
        raise CriticalDistanceProfileError(f"malformed distance edge: {edge!r}")
    return canonical_edge(edge[0], edge[1], n=n)


def _all_edges(n: int) -> tuple[Edge, ...]:
    if type(n) is not int or n < 2:
        raise CriticalDistanceProfileError("n must be an integer at least two")
    return tuple(combinations(range(n), 2))


@dataclass(frozen=True, order=True)
class ProvenanceTag:
    """Caller-declared provenance carried into every generated constraint."""

    source_ref: str
    declared_status: str = "DECLARED_INPUT"
    detail: str = ""

    def __post_init__(self) -> None:
        if not isinstance(self.source_ref, str) or not self.source_ref.strip():
            raise CriticalDistanceProfileError("provenance source_ref must be nonempty")
        if not isinstance(self.declared_status, str) or not self.declared_status.strip():
            raise CriticalDistanceProfileError(
                "provenance declared_status must be nonempty"
            )
        if not isinstance(self.detail, str):
            raise CriticalDistanceProfileError("provenance detail must be a string")

    def as_record(self) -> dict[str, str]:
        return {
            "source_ref": self.source_ref,
            "declared_status": self.declared_status,
            "detail": self.detail,
            "status_is_caller_declaration": "true",
        }


@dataclass(frozen=True, order=True)
class EqualityAtom:
    """The proposition that two unordered geometric edges have equal length."""

    left: Edge
    right: Edge

    def __post_init__(self) -> None:
        left = _normalize_edge(self.left)
        right = _normalize_edge(self.right)
        if left == right:
            raise CriticalDistanceProfileError(
                "an equality atom must compare two distinct distance edges"
            )
        if right < left:
            left, right = right, left
        object.__setattr__(self, "left", left)
        object.__setattr__(self, "right", right)

    @classmethod
    def between(cls, first: Edge, second: Edge) -> EqualityAtom:
        return cls(first, second)

    def as_record(self) -> dict[str, list[int]]:
        return {"left": list(self.left), "right": list(self.right)}


@dataclass(frozen=True, order=True)
class EqualityLiteral:
    """A positive equality atom or its negative distance-disequality literal."""

    atom: EqualityAtom
    is_equal: bool

    def __post_init__(self) -> None:
        if type(self.is_equal) is not bool:
            raise CriticalDistanceProfileError("literal is_equal must be boolean")

    def as_record(self) -> dict[str, Any]:
        return {"is_equal": self.is_equal, "atom": self.atom.as_record()}


@dataclass(frozen=True)
class SymbolicClause:
    """One disjunction of edge-equality literals with source provenance."""

    literals: tuple[EqualityLiteral, ...]
    kind: str
    provenance: ProvenanceTag

    def __post_init__(self) -> None:
        if not self.literals:
            raise CriticalDistanceProfileError("symbolic clauses may not be empty")
        if not isinstance(self.kind, str) or not self.kind.strip():
            raise CriticalDistanceProfileError("symbolic clause kind must be nonempty")
        normalized = tuple(sorted(set(self.literals)))
        polarities: dict[EqualityAtom, set[bool]] = defaultdict(set)
        for literal in normalized:
            polarities[literal.atom].add(literal.is_equal)
        if any(len(values) > 1 for values in polarities.values()):
            raise CriticalDistanceProfileError(
                "tautological clauses with both atom polarities are not emitted"
            )
        object.__setattr__(self, "literals", normalized)

    def sort_key(self) -> tuple[Any, ...]:
        return (self.literals, self.kind, self.provenance)

    def as_record(self) -> dict[str, Any]:
        return {
            "kind": self.kind,
            "provenance": self.provenance.as_record(),
            "literals": [literal.as_record() for literal in self.literals],
        }


@dataclass(frozen=True, order=True)
class CriticalFourShellRow:
    """One exact whole-radius K-A ``CriticalFourShell`` row."""

    source: int
    center: int
    support: tuple[int, ...]
    provenance: ProvenanceTag
    unique_four_radius: bool = False

    def __post_init__(self) -> None:
        source = _require_label(self.source, where="critical row source")
        center = _require_label(self.center, where="critical row center")
        if source == center:
            raise CriticalDistanceProfileError(
                "critical row center must survive deletion of its source"
            )
        if not isinstance(self.support, tuple):
            raise CriticalDistanceProfileError("critical row support must be a tuple")
        support = tuple(
            sorted(
                _require_label(label, where="critical row support label")
                for label in self.support
            )
        )
        if len(support) != 4 or len(set(support)) != 4:
            raise CriticalDistanceProfileError(
                "CriticalFourShell support must contain exactly four distinct labels"
            )
        if source not in support:
            raise CriticalDistanceProfileError(
                "critical row source must belong to its whole radius class"
            )
        if center in support:
            raise CriticalDistanceProfileError(
                "critical row center cannot belong to its positive-radius support"
            )
        if type(self.unique_four_radius) is not bool:
            raise CriticalDistanceProfileError(
                "unique_four_radius must be a boolean"
            )
        object.__setattr__(self, "source", source)
        object.__setattr__(self, "center", center)
        object.__setattr__(self, "support", support)


@dataclass(frozen=True, order=True)
class NoQFreeAfterDeletion:
    """No four surviving non-center labels share a radius after source deletion."""

    source: int
    center: int
    provenance: ProvenanceTag

    def __post_init__(self) -> None:
        source = _require_label(self.source, where="no_qfree source")
        center = _require_label(self.center, where="no_qfree center")
        if source == center:
            raise CriticalDistanceProfileError(
                "no_qfree center must survive deletion of its source"
            )
        object.__setattr__(self, "source", source)
        object.__setattr__(self, "center", center)


@dataclass(frozen=True)
class CriticalDistanceProfile:
    """A finite K-A profile of exact shell rows and deletion blockers."""

    profile_id: str
    n: int
    rows: tuple[CriticalFourShellRow, ...]
    no_qfree: tuple[NoQFreeAfterDeletion, ...] = ()

    def __post_init__(self) -> None:
        if not isinstance(self.profile_id, str) or not self.profile_id.strip():
            raise CriticalDistanceProfileError("profile_id must be nonempty")
        _all_edges(self.n)
        rows = tuple(sorted(self.rows))
        blockers = tuple(sorted(self.no_qfree))
        for row in rows:
            if row.center >= self.n or any(label >= self.n for label in row.support):
                raise CriticalDistanceProfileError(
                    f"critical row {(row.source, row.center)} is outside 0..{self.n - 1}"
                )
        row_keys = {(row.source, row.center) for row in rows}
        for blocker in blockers:
            if blocker.source >= self.n or blocker.center >= self.n:
                raise CriticalDistanceProfileError(
                    f"no_qfree {(blocker.source, blocker.center)} is outside "
                    f"0..{self.n - 1}"
                )
            if (blocker.source, blocker.center) not in row_keys:
                raise CriticalDistanceProfileError(
                    "every no_qfree constraint must reference a critical shell row"
                )
        object.__setattr__(self, "rows", rows)
        object.__setattr__(self, "no_qfree", blockers)


def _atom_at_center(center: int, first: int, second: int) -> EqualityAtom:
    return EqualityAtom(
        canonical_edge(center, first),
        canonical_edge(center, second),
    )


def _negative_at_most_three_clause(
    center: int,
    labels: Sequence[int],
    *,
    kind: str,
    provenance: ProvenanceTag,
) -> SymbolicClause:
    if len(labels) != 4 or len(set(labels)) != 4:
        raise CriticalDistanceProfileError(
            "at-most-three clauses require four distinct labels"
        )
    anchor, *others = sorted(labels)
    return SymbolicClause(
        literals=tuple(
            EqualityLiteral(_atom_at_center(center, anchor, other), False)
            for other in others
        ),
        kind=kind,
        provenance=provenance,
    )


@dataclass(frozen=True)
class CompiledProfile:
    """Deterministically emitted abstract SAT/SMT clauses."""

    profile_id: str
    n: int
    clauses: tuple[SymbolicClause, ...]
    includes_equivalence_axioms: bool

    def __post_init__(self) -> None:
        _all_edges(self.n)
        if type(self.includes_equivalence_axioms) is not bool:
            raise CriticalDistanceProfileError(
                "includes_equivalence_axioms must be boolean"
            )
        object.__setattr__(
            self, "clauses", tuple(sorted(self.clauses, key=SymbolicClause.sort_key))
        )

    def metadata(self) -> dict[str, Any]:
        kind_counts = Counter(clause.kind for clause in self.clauses)
        provenance = sorted(
            {clause.provenance for clause in self.clauses}
        )
        return {
            "schema": SCHEMA,
            "lane": LANE,
            "profile_id": self.profile_id,
            "n": self.n,
            "status": "SYMBOLIC_CONSTRAINTS_ONLY",
            "trust": SYMBOLIC_TRUST,
            "clause_count": len(self.clauses),
            "clause_kind_counts": dict(sorted(kind_counts.items())),
            "includes_equivalence_axioms": self.includes_equivalence_axioms,
            "backend_contract": (
                "PROPOSITIONAL_EQUIVALENCE_AXIOMS_INCLUDED"
                if self.includes_equivalence_axioms
                else "BACKEND_MUST_INTERPRET_ATOMS_AS_ONE_GLOBAL_EQUALITY_RELATION"
            ),
            "positive_distance_boundary": (
                "distinct non-center labels denote positive distances only after "
                "a later injective geometric realization"
            ),
            "provenance": [tag.as_record() for tag in provenance],
            "forbidden_claims": list(FORBIDDEN_CLAIMS),
        }

    def as_record(self) -> dict[str, Any]:
        return {
            "metadata": self.metadata(),
            "clauses": [clause.as_record() for clause in self.clauses],
        }


def emit_profile_clauses(
    profile: CriticalDistanceProfile,
    *,
    include_equivalence_axioms: bool = False,
) -> CompiledProfile:
    """Compile one profile to deterministic abstract equality clauses.

    With ``include_equivalence_axioms=False``, a later SMT backend should map
    each atom to equality of shared distance terms.  With it set to ``True``,
    the emitter adds the three transitivity clauses for every triple of
    unordered carrier edges, making the abstract equality relation suitable
    for a purely propositional backend.  Symmetry is definitional in
    :class:`EqualityAtom`; reflexivity is implicit.
    """

    if type(include_equivalence_axioms) is not bool:
        raise CriticalDistanceProfileError(
            "include_equivalence_axioms must be boolean"
        )
    clauses: list[SymbolicClause] = []
    for row in profile.rows:
        reference = row.support[0]
        for label in row.support[1:]:
            clauses.append(
                SymbolicClause(
                    (EqualityLiteral(_atom_at_center(row.center, reference, label), True),),
                    "critical-four-selected-equality",
                    row.provenance,
                )
            )
        off_support = tuple(
            label
            for label in range(profile.n)
            if label != row.center and label not in row.support
        )
        for label in off_support:
            clauses.append(
                SymbolicClause(
                    (EqualityLiteral(_atom_at_center(row.center, reference, label), False),),
                    "critical-four-off-support-disequality",
                    row.provenance,
                )
            )
        if row.unique_four_radius:
            for labels in combinations(off_support, 4):
                clauses.append(
                    _negative_at_most_three_clause(
                        row.center,
                        labels,
                        kind="unique-four-other-class-at-most-three",
                        provenance=row.provenance,
                    )
                )

    for blocker in profile.no_qfree:
        survivors = tuple(
            label
            for label in range(profile.n)
            if label != blocker.center and label != blocker.source
        )
        for labels in combinations(survivors, 4):
            clauses.append(
                _negative_at_most_three_clause(
                    blocker.center,
                    labels,
                    kind="no-qfree-after-source-deletion",
                    provenance=blocker.provenance,
                )
            )

    if include_equivalence_axioms:
        axiom_source = ProvenanceTag(
            "critical_distance_profile.py",
            "BUILTIN_SYMBOLIC_AXIOM",
            "global equivalence relation on canonical unordered-edge lengths",
        )
        edges = _all_edges(profile.n)
        for first, second, third in combinations(edges, 3):
            first_second = EqualityAtom(first, second)
            first_third = EqualityAtom(first, third)
            second_third = EqualityAtom(second, third)
            for positive, negative_a, negative_b in (
                (first_third, first_second, second_third),
                (second_third, first_second, first_third),
                (first_second, first_third, second_third),
            ):
                clauses.append(
                    SymbolicClause(
                        (
                            EqualityLiteral(negative_a, False),
                            EqualityLiteral(negative_b, False),
                            EqualityLiteral(positive, True),
                        ),
                        "edge-equality-transitivity",
                        axiom_source,
                    )
                )

    return CompiledProfile(
        profile_id=profile.profile_id,
        n=profile.n,
        clauses=tuple(clauses),
        includes_equivalence_axioms=include_equivalence_axioms,
    )


class _UnionFind:
    def __init__(self, edges: Iterable[Edge]) -> None:
        self.parent = {edge: edge for edge in edges}

    def find(self, edge: Edge) -> Edge:
        parent = self.parent[edge]
        if parent != edge:
            self.parent[edge] = self.find(parent)
        return self.parent[edge]

    def union(self, left: Edge, right: Edge) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root == right_root:
            return
        if right_root < left_root:
            left_root, right_root = right_root, left_root
        self.parent[right_root] = left_root


@dataclass(frozen=True)
class SymbolicCheckResult:
    """Fail-closed consistency result for emitted partial equality information."""

    accepted: bool
    status: str
    violations: tuple[str, ...]
    nontrivial_equality_classes: tuple[tuple[Edge, ...], ...]

    def as_record(self) -> dict[str, Any]:
        return {
            "accepted": self.accepted,
            "status": self.status,
            "trust": SYMBOLIC_TRUST,
            "violations": list(self.violations),
            "nontrivial_equality_classes": [
                [list(edge) for edge in group]
                for group in self.nontrivial_equality_classes
            ],
            "forbidden_claims": list(FORBIDDEN_CLAIMS),
        }


def check_symbolic_consistency(compiled: CompiledProfile) -> SymbolicCheckResult:
    """Close unit equalities globally and detect forced clause conflicts."""

    edges = _all_edges(compiled.n)
    edge_set = frozenset(edges)
    closure = _UnionFind(edges)
    positive_units: list[tuple[SymbolicClause, EqualityLiteral]] = []
    negative_units: list[tuple[SymbolicClause, EqualityLiteral]] = []
    for clause in compiled.clauses:
        for literal in clause.literals:
            if literal.atom.left not in edge_set or literal.atom.right not in edge_set:
                raise CriticalDistanceProfileError(
                    "compiled equality atom is outside the profile carrier"
                )
        if len(clause.literals) == 1:
            literal = clause.literals[0]
            (positive_units if literal.is_equal else negative_units).append(
                (clause, literal)
            )

    for _, literal in positive_units:
        closure.union(literal.atom.left, literal.atom.right)

    violations: list[str] = []
    explicit_disequalities: set[tuple[Edge, Edge]] = set()
    for clause, literal in negative_units:
        left = closure.find(literal.atom.left)
        right = closure.find(literal.atom.right)
        if left == right:
            violations.append(
                f"{clause.kind}: equality/disequality conflict for "
                f"{literal.atom.left} and {literal.atom.right}"
            )
        else:
            explicit_disequalities.add(
                (left, right) if left < right else (right, left)
            )

    def literal_value(literal: EqualityLiteral) -> bool | None:
        left = closure.find(literal.atom.left)
        right = closure.find(literal.atom.right)
        if left == right:
            equality_value: bool | None = True
        elif ((left, right) if left < right else (right, left)) in explicit_disequalities:
            equality_value = False
        else:
            equality_value = None
        if equality_value is None:
            return None
        return equality_value if literal.is_equal else not equality_value

    for clause in compiled.clauses:
        if len(clause.literals) == 1:
            continue
        values = tuple(literal_value(literal) for literal in clause.literals)
        if values and all(value is False for value in values):
            violations.append(f"{clause.kind}: clause is false under equality closure")

    groups: dict[Edge, list[Edge]] = defaultdict(list)
    for edge in edges:
        groups[closure.find(edge)].append(edge)
    nontrivial = tuple(
        sorted(tuple(group) for group in groups.values() if len(group) > 1)
    )
    unique_violations = tuple(sorted(set(violations)))
    return SymbolicCheckResult(
        accepted=not unique_violations,
        status=(
            "SYMBOLIC_RELATIONS_CONSISTENT"
            if not unique_violations
            else "SYMBOLIC_RELATION_CONFLICT"
        ),
        violations=unique_violations,
        nontrivial_equality_classes=nontrivial,
    )


def check_edge_relations(
    n: int,
    *,
    equalities: Iterable[EqualityAtom] = (),
    disequalities: Iterable[EqualityAtom] = (),
) -> SymbolicCheckResult:
    """Check raw edge relations with the same global closure used for profiles."""

    provenance = ProvenanceTag(
        "check_edge_relations",
        "DECLARED_RELATION_INPUT",
        "direct symbolic equality/disequality consistency check",
    )
    clauses = [
        SymbolicClause(
            (EqualityLiteral(atom, True),),
            "declared-edge-equality",
            provenance,
        )
        for atom in equalities
    ]
    clauses.extend(
        SymbolicClause(
            (EqualityLiteral(atom, False),),
            "declared-edge-disequality",
            provenance,
        )
        for atom in disequalities
    )
    return check_symbolic_consistency(
        CompiledProfile(
            profile_id="direct-edge-relations",
            n=n,
            clauses=tuple(clauses),
            includes_equivalence_axioms=False,
        )
    )


@dataclass(frozen=True)
class DistancePartition:
    """A complete deterministic partition of all unordered carrier edges."""

    n: int
    classes: tuple[tuple[Edge, ...], ...]

    @classmethod
    def from_assignments(
        cls,
        n: int,
        assignments: (
            Mapping[Edge, Hashable] | Iterable[tuple[Edge, Hashable]]
        ),
    ) -> DistancePartition:
        expected = frozenset(_all_edges(n))
        items = assignments.items() if isinstance(assignments, Mapping) else assignments
        seen: dict[Edge, Hashable] = {}
        for raw_edge, class_token in items:
            edge = _normalize_edge(raw_edge, n=n)
            try:
                hash(class_token)
            except TypeError as exc:
                raise CriticalDistanceProfileError(
                    f"distance class token for {edge} is not hashable"
                ) from exc
            if edge in seen and seen[edge] != class_token:
                raise CriticalDistanceProfileError(
                    f"global unordered-edge assignment conflict for {edge}"
                )
            seen[edge] = class_token
        missing = sorted(expected - seen.keys())
        extra = sorted(seen.keys() - expected)
        if missing or extra:
            raise CriticalDistanceProfileError(
                f"distance partition must cover every edge; missing={missing}, extra={extra}"
            )
        grouped: dict[Hashable, list[Edge]] = defaultdict(list)
        for edge, token in seen.items():
            grouped[token].append(edge)
        classes = tuple(
            sorted(tuple(sorted(group)) for group in grouped.values())
        )
        return cls(n=n, classes=classes)

    def __post_init__(self) -> None:
        expected = tuple(_all_edges(self.n))
        normalized = tuple(
            sorted(
                tuple(sorted(_normalize_edge(edge, n=self.n) for edge in group))
                for group in self.classes
            )
        )
        flattened = tuple(edge for group in normalized for edge in group)
        if tuple(sorted(flattened)) != expected or len(flattened) != len(set(flattened)):
            raise CriticalDistanceProfileError(
                "distance partition classes must cover each unordered edge exactly once"
            )
        object.__setattr__(self, "classes", normalized)

    def class_of(self, edge: Edge) -> int:
        normalized = _normalize_edge(edge, n=self.n)
        for index, group in enumerate(self.classes):
            if normalized in group:
                return index
        raise AssertionError("validated partition lost an edge")

    def as_record(self) -> dict[str, Any]:
        return {
            "n": self.n,
            "classes": [[list(edge) for edge in group] for group in self.classes],
            "status": "FINITE_DISTANCE_PARTITION_ONLY",
            "trust": PARTITION_TRUST,
            "forbidden_claims": list(FORBIDDEN_CLAIMS),
        }


@dataclass(frozen=True)
class PartitionCheckResult:
    """Result of checking a complete symbolic distance partition."""

    accepted: bool
    status: str
    violations: tuple[str, ...]

    def as_record(self) -> dict[str, Any]:
        return {
            "accepted": self.accepted,
            "status": self.status,
            "trust": PARTITION_TRUST,
            "violations": list(self.violations),
            "forbidden_claims": list(FORBIDDEN_CLAIMS),
        }


def check_distance_partition(
    profile: CriticalDistanceProfile,
    partition: DistancePartition,
) -> PartitionCheckResult:
    """Check all exact-shell, deletion, and optional uniqueness conditions."""

    if profile.n != partition.n:
        raise CriticalDistanceProfileError(
            f"profile n={profile.n} does not match partition n={partition.n}"
        )
    violations: list[str] = []

    for row in profile.rows:
        support_classes = {
            partition.class_of(canonical_edge(row.center, label))
            for label in row.support
        }
        if len(support_classes) != 1:
            violations.append(
                f"row source={row.source} center={row.center}: selected support "
                "does not have one common radius"
            )
        named_class = partition.class_of(
            canonical_edge(row.center, row.support[0])
        )
        extra_members = tuple(
            label
            for label in range(profile.n)
            if label != row.center
            and label not in row.support
            and partition.class_of(canonical_edge(row.center, label)) == named_class
        )
        if extra_members:
            violations.append(
                f"row source={row.source} center={row.center}: off-support labels "
                f"{extra_members} are fifth-or-later members of the named radius"
            )
        if row.unique_four_radius:
            incident_classes: dict[int, list[int]] = defaultdict(list)
            for label in range(profile.n):
                if label != row.center:
                    incident_classes[
                        partition.class_of(canonical_edge(row.center, label))
                    ].append(label)
            oversized_other = tuple(
                tuple(labels)
                for class_index, labels in sorted(incident_classes.items())
                if class_index != named_class and len(labels) > 3
            )
            if oversized_other:
                violations.append(
                    f"row source={row.source} center={row.center}: "
                    f"unique-four semantics has other oversized classes "
                    f"{oversized_other}"
                )

    for blocker in profile.no_qfree:
        surviving_classes: dict[int, list[int]] = defaultdict(list)
        for label in range(profile.n):
            if label != blocker.center and label != blocker.source:
                surviving_classes[
                    partition.class_of(canonical_edge(blocker.center, label))
                ].append(label)
        hidden_four = tuple(
            tuple(labels)
            for _, labels in sorted(surviving_classes.items())
            if len(labels) > 3
        )
        if hidden_four:
            violations.append(
                f"no_qfree source={blocker.source} center={blocker.center}: "
                f"surviving four-class {hidden_four}"
            )

    unique_violations = tuple(sorted(set(violations)))
    return PartitionCheckResult(
        accepted=not unique_violations,
        status=(
            "FINITE_PARTITION_ACCEPTED"
            if not unique_violations
            else "FINITE_PARTITION_REJECTED"
        ),
        violations=unique_violations,
    )
