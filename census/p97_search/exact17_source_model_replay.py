# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact replay of one Child44 assumption-cell SAT assignment.

This module is the maintained inverse of the 308-atom Lean encoding in
``BlockerVExactSeventeenSourceCnf``.  The sole production entry point accepts
captured data only: it never contacts PIQD, launches a SAT solver, publishes
an artifact, or falls back to a legacy decoder.

The Kalmanson search is proposal-only.  A proposed feasible point is replayed
with ``Fraction`` against every one of the 4,760 strict inequalities.  A
proposed infeasibility certificate is converted to positive integral weights
and replayed by the production ``producer_bank`` checker, which reconstructs
all row-equality paths and names the checked Lean consumer.
"""

from __future__ import annotations

import hashlib
import itertools
import json
import math
import os
import stat
from collections import defaultdict
from collections.abc import Mapping
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from types import MappingProxyType
from typing import Any, Final, Literal

from census.atail_force import producer_bank

POINT_COUNT: Final = 17
VARIABLE_COUNT: Final = 308
PARENT_CLAUSE_COUNT: Final = 5_848_820
PARENT_BYTE_COUNT: Final = 291_704_790
CHILD44_PARENT_SHA256: Final = (
    "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
)

ORDERS: Final = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
LEGAL_NEXT_CENTERS: Final = (0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16)
OLD_CENTERS: Final = (8, 9, 10, 11)
SECOND_CAP: Final = frozenset({0, 2, 6, 7, 8, 9, 10, 11, 12})
OUTSIDE: Final = (1, 3, 4, 5, 13, 14, 15, 16)
PHYSICAL: Final = frozenset({6, 7, 8, 9, 10})
OLD_CAP_SLICES: Final[Mapping[int, frozenset[int]]] = MappingProxyType({
    8: frozenset({6, 9}),
    9: frozenset({6, 7}),
    10: frozenset({8, 9}),
    11: frozenset({8, 10}),
})
CELL_ASSUMPTIONS: Final[Mapping[str, tuple[int, ...]]] = MappingProxyType({
    f"next-center-{center:02d}": (290 + center,) for center in LEGAL_NEXT_CENTERS
})

_NATIVE_PATH = type(Path())
_KALMANSON_FORMS: Final = ("adjacentSides", "innerOuter")
_MAX_DIMACS_LINE_BYTES: Final = 1 << 20
_SOURCE_PREDICATES: Final = (
    "all_17_supports_present",
    "support_size_exactly_four",
    "support_excludes_self",
    "source_coverage_all_17_points",
    "pairwise_support_intersection_at_most_two",
    "old_center_fixed_cap_slices",
    "outside_multiplicity_exactly_one",
    "unique_legal_next_center",
    "next_support_contains_deleted_source_11",
    "next_physical_intersection_at_most_one",
    "unique_named_order",
)


class Child44ReplayError(ValueError):
    """A custody, assignment, source-semantic, or exact-replay gate failed."""


class Child44ReplayInconclusive(Child44ReplayError):
    """The untrusted proposal search produced no exactly replayable outcome."""


@dataclass(frozen=True)
class DecodedSourceModel:
    """Immutable inverse image of the proof-facing Lean ``SourceModel``."""

    rows: tuple[tuple[int, ...], ...]
    next_center: int
    named_order: int
    selected_order: tuple[int, ...]
    digest: str


@dataclass(frozen=True)
class WeightedTerm:
    """One positive term in an exact Kalmanson cancellation."""

    atom_index: int
    quad: tuple[int, int, int, int]
    form: Literal["adjacentSides", "innerOuter"]
    weight: int


@dataclass(frozen=True)
class ProposalProvenance:
    """Non-authoritative identity of the algorithm that proposed exact data."""

    engine: Literal["deterministic-delta-scan/v1", "z3-qf-lra/v1"]
    engine_version: str
    method: str


@dataclass(frozen=True)
class KalmansonFeasibleProposal:
    """Proposed rational values for every row-equality distance class."""

    class_values: tuple[tuple[int, int], ...]
    provenance: ProposalProvenance


@dataclass(frozen=True)
class KalmansonInfeasibleProposal:
    """Proposed nonnegative rational Farkas weights on Kalmanson atoms."""

    atom_indices: tuple[int, ...]
    weights: tuple[tuple[int, int], ...]
    provenance: ProposalProvenance


KalmansonProposal = KalmansonFeasibleProposal | KalmansonInfeasibleProposal


@dataclass(frozen=True)
class KalmansonClassification:
    """Closed exact outcome of the complete 4,760-atom linear replay."""

    status: Literal["LINEARLY_INFEASIBLE", "KALMANSON_FEASIBLE"]
    atom_count: int
    equality_class_count: int
    system_sha256: str
    proposal_sha256: str
    proposal_provenance: ProposalProvenance
    exact_evidence: bytes
    exact_evidence_sha256: str
    weighted_terms: tuple[WeightedTerm, ...]
    refinement_disposition: Literal[
        "EXACT_WEIGHTED_CERTIFICATE_READY",
        "NO_KALMANSON_CLAUSE_ROUTE_EDM_PTOLEMY",
    ]


@dataclass(frozen=True)
class Child44SatReplay:
    """Frozen result accepted by the shared assumption-CNF semantic profile."""

    schema: Literal["p97-exact17-child44-assumption-sat-replay/v1"]
    cell_id: str
    assumptions: tuple[int, ...]
    parent_sha256: str
    parent_bytes: int
    parent_variables: int
    parent_clauses: int
    assignment_sha256: str
    source_model: DecodedSourceModel
    source_predicates: tuple[str, ...]
    replay_sha256: str
    kalmanson: KalmansonClassification
    result_sha256: str


@dataclass(frozen=True)
class _RootContract:
    sha256: str
    variables: int
    clauses: int
    byte_count: int


@dataclass(frozen=True)
class _RootReplay:
    sha256: str
    variables: int
    clauses: int
    byte_count: int


@dataclass(frozen=True)
class _KalmansonAtom:
    index: int
    quad_labels: tuple[int, int, int, int]
    form: Literal["adjacentSides", "innerOuter"]
    coefficients: tuple[tuple[int, int], ...]


class _DisjointSet:
    def __init__(self, values: tuple[tuple[int, int], ...]) -> None:
        self._parent = {value: value for value in values}

    def find(self, value: tuple[int, int]) -> tuple[int, int]:
        parent = self._parent[value]
        if parent != value:
            self._parent[value] = self.find(parent)
        return self._parent[value]

    def union(self, left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            smaller, larger = sorted((left_root, right_root))
            self._parent[larger] = smaller


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=True,
        allow_nan=False,
    ).encode("ascii")


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise Child44ReplayError("distance edge has equal endpoints")
    return (left, right) if left < right else (right, left)


def _hit_var(center: int, point: int) -> int:
    """Mirror Lean ``hitVar``: the current root retains all 17x17 slots."""

    if (
        type(center) is not int
        or center not in range(POINT_COUNT)
        or type(point) is not int
        or point not in range(POINT_COUNT)
    ):
        raise Child44ReplayError("hit-variable labels are outside Fin 17")
    return 1 + POINT_COUNT * center + point


def _parse_assignment(assignment: tuple[int, ...]) -> tuple[bool, ...]:
    if type(assignment) is not tuple or len(assignment) != VARIABLE_COUNT:
        raise Child44ReplayError("assignment must be a builtin 308-literal tuple")
    truth = [False] * (VARIABLE_COUNT + 1)
    seen: set[int] = set()
    for literal in assignment:
        if type(literal) is not int or literal == 0:
            raise Child44ReplayError("assignment literals must be nonzero builtin ints")
        variable = abs(literal)
        if variable > VARIABLE_COUNT:
            raise Child44ReplayError("assignment literal is out of range")
        if variable in seen:
            raise Child44ReplayError("assignment repeats a variable")
        seen.add(variable)
        truth[variable] = literal > 0
    if seen != set(range(1, VARIABLE_COUNT + 1)):
        raise Child44ReplayError("assignment is not total over variables 1..308")
    return tuple(truth)


def _require_cell(
    cell_id: str,
    assumptions: tuple[int, ...],
    truth: tuple[bool, ...],
) -> int:
    if type(cell_id) is not str or cell_id not in CELL_ASSUMPTIONS:
        raise Child44ReplayError("cell_id is not a reviewed Child44 cell")
    if type(assumptions) is not tuple or any(type(item) is not int for item in assumptions):
        raise Child44ReplayError("assumptions must be a builtin tuple of builtin ints")
    expected = CELL_ASSUMPTIONS[cell_id]
    if assumptions != expected:
        raise Child44ReplayError("cell assumptions differ from the reviewed singleton")
    if not all(truth[abs(literal)] == (literal > 0) for literal in assumptions):
        raise Child44ReplayError("SAT assignment does not satisfy the signed cell assumption")
    return assumptions[0] - 290


def _decode_source_model(
    truth: tuple[bool, ...], expected_next_center: int
) -> DecodedSourceModel:
    rows = tuple(
        tuple(
            point
            for point in range(POINT_COUNT)
            if truth[_hit_var(center, point)]
        )
        for center in range(POINT_COUNT)
    )
    if any(len(row) != 4 for row in rows):
        raise Child44ReplayError("source replay: every support must have size four")
    if any(center in rows[center] for center in range(POINT_COUNT)):
        raise Child44ReplayError("source replay: a support contains its own center")
    if set().union(*(set(row) for row in rows)) != set(range(POINT_COUNT)):
        raise Child44ReplayError("source replay: selected supports do not cover all labels")
    if any(
        len(set(rows[left]) & set(rows[right])) > 2
        for left, right in itertools.combinations(range(POINT_COUNT), 2)
    ):
        raise Child44ReplayError("source replay: two supports intersect in more than two labels")
    if any(set(rows[center]) & SECOND_CAP != OLD_CAP_SLICES[center] for center in OLD_CENTERS):
        raise Child44ReplayError("source replay: an old-row cap slice drifted")
    if any(
        sum(point in rows[center] for center in OLD_CENTERS) != 1
        for point in OUTSIDE
    ):
        raise Child44ReplayError("source replay: old-row outside multiplicity is not one")

    next_centers = tuple(
        center for center in range(POINT_COUNT) if truth[290 + center]
    )
    if len(next_centers) != 1 or next_centers[0] not in LEGAL_NEXT_CENTERS:
        raise Child44ReplayError("source replay: next center is not uniquely legal")
    next_center = next_centers[0]
    if next_center != expected_next_center:
        raise Child44ReplayError("source replay: next center crossed the selected cell")
    if 11 not in rows[next_center]:
        raise Child44ReplayError("source replay: next support omits source label 11")
    if len(set(rows[next_center]) & PHYSICAL) > 1:
        raise Child44ReplayError("source replay: next support has two physical hits")

    named_orders = tuple(order for order in range(2) if truth[307 + order])
    if len(named_orders) != 1:
        raise Child44ReplayError("source replay: named order is not unique")
    named_order = named_orders[0]
    payload = {
        "named_order": named_order,
        "next_center": next_center,
        "rows": [list(row) for row in rows],
        "selected_order": list(ORDERS[named_order]),
    }
    return DecodedSourceModel(
        rows=rows,
        next_center=next_center,
        named_order=named_order,
        selected_order=ORDERS[named_order],
        digest=_sha256(_canonical_bytes(payload)),
    )


def _validate_decoded_source_model(source: DecodedSourceModel) -> None:
    """Reject externally constructed or mutated stand-ins for decoded source data."""

    if type(source) is not DecodedSourceModel:
        raise Child44ReplayError("source model has the wrong exact type")
    if (
        type(source.rows) is not tuple
        or len(source.rows) != POINT_COUNT
        or any(
            type(row) is not tuple
            or len(row) != 4
            or any(type(point) is not int or point not in range(POINT_COUNT) for point in row)
            or tuple(sorted(set(row))) != row
            for row in source.rows
        )
    ):
        raise Child44ReplayError("decoded source rows are not canonical exact-four rows")
    if type(source.next_center) is not int or source.next_center not in LEGAL_NEXT_CENTERS:
        raise Child44ReplayError("decoded source next center is not canonical")
    if type(source.named_order) is not int or source.named_order not in range(2):
        raise Child44ReplayError("decoded source named order is not canonical")
    if type(source.selected_order) is not tuple or source.selected_order != ORDERS[source.named_order]:
        raise Child44ReplayError("decoded source selected order crossed its named order")
    if any(center in source.rows[center] for center in range(POINT_COUNT)):
        raise Child44ReplayError("decoded source contains a diagonal hit")
    if set().union(*(set(row) for row in source.rows)) != set(range(POINT_COUNT)):
        raise Child44ReplayError("decoded source rows do not cover every label")
    if any(
        len(set(source.rows[left]) & set(source.rows[right])) > 2
        for left, right in itertools.combinations(range(POINT_COUNT), 2)
    ):
        raise Child44ReplayError("decoded source rows have a three-point intersection")
    if any(
        set(source.rows[center]) & SECOND_CAP != OLD_CAP_SLICES[center]
        for center in OLD_CENTERS
    ):
        raise Child44ReplayError("decoded source old-row cap slice drifted")
    if any(
        sum(point in source.rows[center] for center in OLD_CENTERS) != 1
        for point in OUTSIDE
    ):
        raise Child44ReplayError("decoded source outside multiplicity drifted")
    if 11 not in source.rows[source.next_center]:
        raise Child44ReplayError("decoded source next row omits label 11")
    if len(set(source.rows[source.next_center]) & PHYSICAL) > 1:
        raise Child44ReplayError("decoded source next row has two physical hits")
    payload = {
        "named_order": source.named_order,
        "next_center": source.next_center,
        "rows": [list(row) for row in source.rows],
        "selected_order": list(source.selected_order),
    }
    if type(source.digest) is not str or source.digest != _sha256(_canonical_bytes(payload)):
        raise Child44ReplayError("decoded source digest is not exact")


def _require_absolute_native_path(path: Path) -> None:
    if type(path) is not _NATIVE_PATH or not path.is_absolute():
        raise Child44ReplayError("parent_cnf_path must be an exact native absolute Path")
    if Path(os.path.normpath(os.fspath(path))) != path:
        raise Child44ReplayError("parent_cnf_path is not normalized")
    for ancestor in (path, *path.parents):
        try:
            metadata = ancestor.lstat()
        except OSError as error:
            raise Child44ReplayError("parent CNF path component is inaccessible") from error
        if stat.S_ISLNK(metadata.st_mode):
            raise Child44ReplayError("parent CNF path contains a symlink component")
        if ancestor != path and not stat.S_ISDIR(metadata.st_mode):
            raise Child44ReplayError("parent CNF ancestor is not a directory")


def _stream_dimacs_replay(
    path: Path,
    truth: tuple[bool, ...],
    contract: _RootContract,
) -> _RootReplay:
    _require_absolute_native_path(path)
    before = path.lstat()
    if stat.S_ISLNK(before.st_mode) or not stat.S_ISREG(before.st_mode):
        raise Child44ReplayError("parent CNF must be a nonsymlink regular file")

    digest = hashlib.sha256()
    byte_count = 0
    header: tuple[int, int] | None = None
    clause_count = 0
    pending = False
    clause_satisfied = False
    with path.open("rb") as stream:
        opened = os.fstat(stream.fileno())
        if (opened.st_dev, opened.st_ino) != (before.st_dev, before.st_ino):
            raise Child44ReplayError("parent CNF identity changed before open")
        while raw_line := stream.readline(_MAX_DIMACS_LINE_BYTES + 1):
            if len(raw_line) > _MAX_DIMACS_LINE_BYTES:
                raise Child44ReplayError("parent CNF line exceeds the bounded replay limit")
            digest.update(raw_line)
            byte_count += len(raw_line)
            try:
                line = raw_line.decode("ascii")
            except UnicodeDecodeError as error:
                raise Child44ReplayError("parent CNF is not ASCII DIMACS") from error
            stripped = line.strip()
            if not stripped or stripped.startswith("c"):
                continue
            fields = stripped.split()
            if fields[0] == "p":
                if header is not None or pending or clause_count:
                    raise Child44ReplayError("parent CNF header is duplicated or misplaced")
                if len(fields) != 4 or fields[1] != "cnf":
                    raise Child44ReplayError("parent CNF header is malformed")
                try:
                    header = (int(fields[2]), int(fields[3]))
                except ValueError as error:
                    raise Child44ReplayError("parent CNF dimensions are malformed") from error
                continue
            if header is None:
                raise Child44ReplayError("parent CNF clause precedes its header")
            for token in fields:
                try:
                    literal = int(token)
                except ValueError as error:
                    raise Child44ReplayError("parent CNF contains a noninteger token") from error
                if literal == 0:
                    clause_count += 1
                    if not clause_satisfied:
                        raise Child44ReplayError(
                            f"assignment falsifies parent CNF clause {clause_count}"
                        )
                    pending = False
                    clause_satisfied = False
                    continue
                variable = abs(literal)
                if variable > contract.variables:
                    raise Child44ReplayError("parent CNF literal exceeds the variable bound")
                pending = True
                clause_satisfied = clause_satisfied or (
                    truth[variable] == (literal > 0)
                )
        after_open = os.fstat(stream.fileno())
    after = path.lstat()
    if pending:
        raise Child44ReplayError("parent CNF ends inside an unterminated clause")
    if (
        (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns)
        != (after_open.st_dev, after_open.st_ino, after_open.st_size, after_open.st_mtime_ns)
        or (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns)
        != (after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns)
    ):
        raise Child44ReplayError("parent CNF changed during streaming replay")
    actual_sha256 = digest.hexdigest()
    if header != (contract.variables, contract.clauses):
        raise Child44ReplayError("parent CNF dimensions differ from the exact contract")
    if clause_count != contract.clauses:
        raise Child44ReplayError("parent CNF clause count differs from the exact contract")
    if byte_count != contract.byte_count or before.st_size != contract.byte_count:
        raise Child44ReplayError("parent CNF byte count differs from the exact contract")
    if actual_sha256 != contract.sha256:
        raise Child44ReplayError("parent CNF SHA-256 differs from the exact contract")
    return _RootReplay(actual_sha256, header[0], clause_count, byte_count)


def _kalmanson_edges(
    quad: tuple[int, int, int, int],
    form: Literal["adjacentSides", "innerOuter"],
) -> tuple[tuple[tuple[int, int], tuple[int, int]], tuple[tuple[int, int], tuple[int, int]]]:
    a, b, c, d = quad
    if form == "adjacentSides":
        left = ((_edge(a, b)), (_edge(c, d)))
    elif form == "innerOuter":
        left = ((_edge(a, d)), (_edge(b, c)))
    else:
        raise Child44ReplayError("Kalmanson form is not registered")
    return left, ((_edge(a, c)), (_edge(b, d)))


def _build_kalmanson_system(
    source: DecodedSourceModel,
) -> tuple[tuple[_KalmansonAtom, ...], int, str]:
    all_edges = tuple(itertools.combinations(range(POINT_COUNT), 2))
    closure = _DisjointSet(all_edges)
    position = {label: index for index, label in enumerate(source.selected_order)}
    for center, support in enumerate(source.rows):
        center_position = position[center]
        support_positions = tuple(position[point] for point in support)
        anchor = _edge(center_position, support_positions[0])
        for point_position in support_positions[1:]:
            closure.union(anchor, _edge(center_position, point_position))

    roots = tuple(sorted({closure.find(edge) for edge in all_edges}))
    class_index = {root: index for index, root in enumerate(roots)}
    members = tuple(
        tuple(edge for edge in all_edges if closure.find(edge) == root) for root in roots
    )
    atoms: list[_KalmansonAtom] = []
    for quad_positions in itertools.combinations(range(POINT_COUNT), 4):
        quad_labels = tuple(source.selected_order[index] for index in quad_positions)
        for form_value in _KALMANSON_FORMS:
            form: Literal["adjacentSides", "innerOuter"] = form_value  # type: ignore[assignment]
            left, right = _kalmanson_edges(quad_positions, form)
            coefficients: dict[int, int] = defaultdict(int)
            for edge in left:
                coefficients[class_index[closure.find(edge)]] += 1
            for edge in right:
                coefficients[class_index[closure.find(edge)]] -= 1
            atoms.append(
                _KalmansonAtom(
                    index=len(atoms),
                    quad_labels=quad_labels,  # type: ignore[arg-type]
                    form=form,
                    coefficients=tuple(
                        sorted((index, value) for index, value in coefficients.items() if value)
                    ),
                )
            )
    if len(atoms) != 2 * math.comb(POINT_COUNT, 4):
        raise AssertionError("exact17 Kalmanson atom count drifted")
    ledger = {
        "schema": "p97-exact17-child44-kalmanson-system/v1",
        "order": list(source.selected_order),
        "rows": [list(row) for row in source.rows],
        "equality_classes": [[list(edge) for edge in member] for member in members],
        "atoms": [
            {
                "index": atom.index,
                "quad": list(atom.quad_labels),
                "form": atom.form,
                "coefficients": [list(item) for item in atom.coefficients],
            }
            for atom in atoms
        ],
    }
    return tuple(atoms), len(roots), _sha256(_canonical_bytes(ledger))


def _fraction(value: Any) -> Fraction:
    if not hasattr(value, "as_fraction"):
        raise Child44ReplayError("linear proposal did not return an exact rational")
    result = value.as_fraction()
    if type(result) is not Fraction:
        result = Fraction(result)
    return result


def _primitive_integer_weights(weights: tuple[Fraction, ...]) -> tuple[int, ...]:
    if not weights or any(weight < 0 for weight in weights):
        raise Child44ReplayError("Farkas proposal has invalid rational weights")
    denominator = math.lcm(*(weight.denominator for weight in weights))
    integers = tuple(
        weight.numerator * (denominator // weight.denominator) for weight in weights
    )
    nonzero = tuple(value for value in integers if value)
    if not nonzero:
        raise Child44ReplayError("Farkas proposal is identically zero")
    divisor = math.gcd(*nonzero)
    return tuple(value // divisor for value in integers)


def _term_payload(term: WeightedTerm) -> dict[str, Any]:
    return {"quad": list(term.quad), "form": term.form, "weight": term.weight}


def _provenance_payload(provenance: ProposalProvenance) -> dict[str, str]:
    if type(provenance) is not ProposalProvenance:
        raise Child44ReplayError("Kalmanson proposal provenance has the wrong type")
    if provenance.engine not in {"deterministic-delta-scan/v1", "z3-qf-lra/v1"}:
        raise Child44ReplayError("Kalmanson proposal engine is not closed")
    if (
        type(provenance.engine_version) is not str
        or not provenance.engine_version
        or type(provenance.method) is not str
        or not provenance.method
    ):
        raise Child44ReplayError("Kalmanson proposal provenance is incomplete")
    allowed_methods = {
        "deterministic-delta-scan/v1": {
            "zero-or-opposite-equality-closure-delta"
        },
        "z3-qf-lra/v1": {
            "scaled-strict-margin-one-primal-witness",
            "unsat-core-nonnegative-farkas-weights",
        },
    }
    if provenance.method not in allowed_methods[provenance.engine]:
        raise Child44ReplayError("Kalmanson proposal method is not closed")
    if provenance.engine == "deterministic-delta-scan/v1" and provenance.engine_version != "1":
        raise Child44ReplayError("deterministic proposal version drifted")
    return {
        "engine": provenance.engine,
        "engine_version": provenance.engine_version,
        "method": provenance.method,
    }


def _proposal_payload(proposal: KalmansonProposal) -> dict[str, Any]:
    def canonical_rational(value: object, *, nonnegative: bool) -> bool:
        return (
            type(value) is tuple
            and len(value) == 2
            and all(type(item) is int for item in value)
            and value[1] > 0
            and math.gcd(abs(value[0]), value[1]) == 1
            and (not nonnegative or value[0] >= 0)
        )

    if type(proposal) is KalmansonFeasibleProposal:
        if type(proposal.class_values) is not tuple or any(
            not canonical_rational(value, nonnegative=False)
            for value in proposal.class_values
        ):
            raise Child44ReplayError("feasible proposal rationals are malformed")
        return {
            "kind": "KALMANSON_FEASIBLE_WITNESS",
            "class_values": [list(value) for value in proposal.class_values],
            "provenance": _provenance_payload(proposal.provenance),
        }
    if type(proposal) is KalmansonInfeasibleProposal:
        if (
            type(proposal.atom_indices) is not tuple
            or any(type(index) is not int for index in proposal.atom_indices)
            or tuple(sorted(set(proposal.atom_indices))) != proposal.atom_indices
            or type(proposal.weights) is not tuple
            or not proposal.weights
            or len(proposal.atom_indices) != len(proposal.weights)
            or any(
                not canonical_rational(value, nonnegative=True)
                for value in proposal.weights
            )
        ):
            raise Child44ReplayError("infeasible proposal terms are malformed")
        return {
            "kind": "KALMANSON_INFEASIBLE_WEIGHTS",
            "atom_indices": list(proposal.atom_indices),
            "weights": [list(value) for value in proposal.weights],
            "provenance": _provenance_payload(proposal.provenance),
        }
    raise Child44ReplayError("Kalmanson proposal has an unregistered type")


def _certify_infeasibility(
    source: DecodedSourceModel,
    atoms: tuple[_KalmansonAtom, ...],
    equality_class_count: int,
    system_sha256: str,
    indices: tuple[int, ...],
    weights: tuple[int, ...],
    proposal: KalmansonInfeasibleProposal,
    proposal_sha256: str,
) -> KalmansonClassification:
    if len(indices) != len(weights) or not indices or any(weight <= 0 for weight in weights):
        raise Child44ReplayError("weighted cancellation terms are not positive and aligned")
    balance = [0] * equality_class_count
    terms: list[WeightedTerm] = []
    for index, weight in zip(indices, weights, strict=True):
        atom = atoms[index]
        for coordinate, coefficient in atom.coefficients:
            balance[coordinate] += weight * coefficient
        terms.append(WeightedTerm(index, atom.quad_labels, atom.form, weight))
    if any(balance):
        raise Child44ReplayError("weighted cancellation has a nonzero exact residual")

    rows = tuple(
        producer_bank.MetricRow(center, support, exact=True)
        for center, support in enumerate(source.rows)
    )
    certificate = producer_bank.certify_weighted_kalmanson_cancellation(
        rows,
        POINT_COUNT,
        source.selected_order,
        tuple(_term_payload(term) for term in terms),
    )
    evidence = _canonical_bytes(
        {
            "schema": "p97-exact17-child44-exact-weighted-kalmanson-certificate/v1",
            "system_sha256": system_sha256,
            "proposal_sha256": proposal_sha256,
            "proposal_provenance": _provenance_payload(proposal.provenance),
            "atoms_replayed": len(atoms),
            "terms": [
                {
                    "atom_index": term.atom_index,
                    **_term_payload(term),
                }
                for term in terms
            ],
            "producer_bank_certificate": certificate,
        }
    )
    return KalmansonClassification(
        status="LINEARLY_INFEASIBLE",
        atom_count=len(atoms),
        equality_class_count=equality_class_count,
        system_sha256=system_sha256,
        proposal_sha256=proposal_sha256,
        proposal_provenance=proposal.provenance,
        exact_evidence=evidence,
        exact_evidence_sha256=_sha256(evidence),
        weighted_terms=tuple(terms),
        refinement_disposition="EXACT_WEIGHTED_CERTIFICATE_READY",
    )


def _fast_cancellation(
    atoms: tuple[_KalmansonAtom, ...],
) -> KalmansonInfeasibleProposal | None:
    provenance = ProposalProvenance(
        engine="deterministic-delta-scan/v1",
        engine_version="1",
        method="zero-or-opposite-equality-closure-delta",
    )
    by_signature: dict[tuple[tuple[int, int], ...], int] = {}
    for atom in atoms:
        if not atom.coefficients:
            return KalmansonInfeasibleProposal(
                atom_indices=(atom.index,),
                weights=((1, 1),),
                provenance=provenance,
            )
        opposite = tuple((index, -value) for index, value in atom.coefficients)
        previous = by_signature.get(opposite)
        if previous is not None:
            return KalmansonInfeasibleProposal(
                atom_indices=(previous, atom.index),
                weights=((1, 1), (1, 1)),
                provenance=provenance,
            )
        by_signature.setdefault(atom.coefficients, atom.index)
    return None


def _propose_kalmanson(
    atoms: tuple[_KalmansonAtom, ...], equality_class_count: int
) -> KalmansonProposal:
    """Use in-process Z3 only to propose exact rational replay data."""

    quick = _fast_cancellation(atoms)
    if quick is not None:
        return quick

    import z3

    provenance_version = z3.get_version_string()
    distances = tuple(z3.Real(f"kdist_{index}") for index in range(equality_class_count))
    solver = z3.Solver()
    tag_indices: dict[str, int] = {}
    for atom in atoms:
        expression = z3.Sum(
            *(coefficient * distances[index] for index, coefficient in atom.coefficients)
        )
        tag = z3.Bool(f"kalmanson_{atom.index}")
        solver.assert_and_track(expression <= -1, tag)
        tag_indices[tag.decl().name()] = atom.index
    verdict = solver.check()
    if verdict == z3.sat:
        model = solver.model()
        values = tuple(
            _fraction(model.eval(value, model_completion=True)) for value in distances
        )
        shift = max(Fraction(1) - min(values), Fraction(0))
        values = tuple(value + shift for value in values)
        return KalmansonFeasibleProposal(
            class_values=tuple((value.numerator, value.denominator) for value in values),
            provenance=ProposalProvenance(
                engine="z3-qf-lra/v1",
                engine_version=provenance_version,
                method="scaled-strict-margin-one-primal-witness",
            ),
        )
    if verdict != z3.unsat:
        raise Child44ReplayInconclusive(
            f"Kalmanson proposal search returned {verdict}; no fallback is allowed"
        )

    core_indices = tuple(
        sorted(tag_indices[tag.decl().name()] for tag in solver.unsat_core())
    )
    if not core_indices:
        raise Child44ReplayInconclusive("Kalmanson UNSAT proposal has an empty core")
    dual_weights = tuple(z3.Real(f"farkas_{index}") for index in core_indices)
    dual = z3.Solver()
    dual.add(*(weight >= 0 for weight in dual_weights))
    dual.add(z3.Sum(*dual_weights) == 1)
    for coordinate in range(equality_class_count):
        dual.add(
            z3.Sum(
                *(
                    weight
                    * dict(atoms[index].coefficients).get(coordinate, 0)
                    for index, weight in zip(core_indices, dual_weights, strict=True)
                )
            )
            == 0
        )
    dual_verdict = dual.check()
    if dual_verdict != z3.sat:
        raise Child44ReplayInconclusive(
            f"Farkas proposal search returned {dual_verdict}; no fallback is allowed"
        )
    dual_model = dual.model()
    weights = tuple(
        _fraction(dual_model.eval(weight, model_completion=True))
        for weight in dual_weights
    )
    return KalmansonInfeasibleProposal(
        atom_indices=core_indices,
        weights=tuple((weight.numerator, weight.denominator) for weight in weights),
        provenance=ProposalProvenance(
            engine="z3-qf-lra/v1",
            engine_version=provenance_version,
            method="unsat-core-nonnegative-farkas-weights",
        ),
    )


def _verify_kalmanson_proposal_against_system(
    source: DecodedSourceModel,
    atoms: tuple[_KalmansonAtom, ...],
    equality_class_count: int,
    system_sha256: str,
    proposal: KalmansonProposal,
) -> KalmansonClassification:
    """Deterministically verify a proposal without importing or calling Z3."""

    proposal_bytes = _canonical_bytes(_proposal_payload(proposal))
    proposal_sha256 = _sha256(proposal_bytes)
    if type(proposal) is KalmansonFeasibleProposal:
        if len(proposal.class_values) != equality_class_count:
            raise Child44ReplayError("feasible proposal has the wrong class count")
        witness = tuple(Fraction(numerator, denominator) for numerator, denominator in proposal.class_values)
        if any(value < 1 for value in witness):
            raise Child44ReplayError("exact Kalmanson witness is not positive")
        if any(
            sum(
                Fraction(coefficient) * witness[index]
                for index, coefficient in atom.coefficients
            )
            > -1
            for atom in atoms
        ):
            raise Child44ReplayError("exact Kalmanson witness fails a strict atom")
        evidence = _canonical_bytes(
            {
                "schema": "p97-exact17-child44-exact-kalmanson-feasible-witness/v1",
                "system_sha256": system_sha256,
                "proposal_sha256": proposal_sha256,
                "proposal_provenance": _provenance_payload(proposal.provenance),
                "class_values": [
                    {"numerator": value.numerator, "denominator": value.denominator}
                    for value in witness
                ],
                "atoms_replayed": len(atoms),
                "strict_margin": 1,
            }
        )
        return KalmansonClassification(
            status="KALMANSON_FEASIBLE",
            atom_count=len(atoms),
            equality_class_count=equality_class_count,
            system_sha256=system_sha256,
            proposal_sha256=proposal_sha256,
            proposal_provenance=proposal.provenance,
            exact_evidence=evidence,
            exact_evidence_sha256=_sha256(evidence),
            weighted_terms=(),
            refinement_disposition="NO_KALMANSON_CLAUSE_ROUTE_EDM_PTOLEMY",
        )
    if type(proposal) is KalmansonInfeasibleProposal:
        if any(index < 0 or index >= len(atoms) for index in proposal.atom_indices):
            raise Child44ReplayError("Farkas proposal references an unknown atom")
        rational_weights = tuple(
            Fraction(numerator, denominator) for numerator, denominator in proposal.weights
        )
        integer_weights = _primitive_integer_weights(rational_weights)
        nonzero = tuple(
            (index, weight)
            for index, weight in zip(
                proposal.atom_indices, integer_weights, strict=True
            )
            if weight
        )
        return _certify_infeasibility(
            source,
            atoms,
            equality_class_count,
            system_sha256,
            tuple(index for index, _ in nonzero),
            tuple(weight for _, weight in nonzero),
            proposal,
            proposal_sha256,
        )
    raise Child44ReplayError("Kalmanson proposal has an unregistered type")


def verify_exact17_kalmanson_proposal(
    source: DecodedSourceModel, proposal: KalmansonProposal
) -> KalmansonClassification:
    """Offline exact verifier; this function imports and calls no solver.

    This verifies the metric proposal against a structurally exact decoded
    object.  Only ``replay_child44_assumption_sat`` additionally proves that
    the object came from the authenticated parent assignment and cell.
    """

    _validate_decoded_source_model(source)
    atoms, equality_class_count, system_sha256 = _build_kalmanson_system(source)
    return _verify_kalmanson_proposal_against_system(
        source,
        atoms,
        equality_class_count,
        system_sha256,
        proposal,
    )


def _classify_kalmanson(source: DecodedSourceModel) -> KalmansonClassification:
    _validate_decoded_source_model(source)
    atoms, equality_class_count, system_sha256 = _build_kalmanson_system(source)
    proposal = _propose_kalmanson(atoms, equality_class_count)
    return _verify_kalmanson_proposal_against_system(
        source,
        atoms,
        equality_class_count,
        system_sha256,
        proposal,
    )


def replay_child44_assumption_sat(
    *,
    parent_cnf_path: Path,
    assignment: tuple[int, ...],
    cell_id: str,
    assumptions: tuple[int, ...],
    expected_parent_sha256: str,
) -> Child44SatReplay:
    """Replay one authenticated Child44 assumption-cell SAT assignment exactly.

    The API is intentionally closed.  It accepts no callbacks, alternate
    variable maps, solver identities, optional predicates, or fallback paths.
    """

    if type(expected_parent_sha256) is not str or expected_parent_sha256 != CHILD44_PARENT_SHA256:
        raise Child44ReplayError("expected parent SHA-256 is not the reviewed Child44 root")
    truth = _parse_assignment(assignment)
    expected_next_center = _require_cell(cell_id, assumptions, truth)
    source = _decode_source_model(truth, expected_next_center)
    root = _stream_dimacs_replay(
        parent_cnf_path,
        truth,
        _RootContract(
            sha256=expected_parent_sha256,
            variables=VARIABLE_COUNT,
            clauses=PARENT_CLAUSE_COUNT,
            byte_count=PARENT_BYTE_COUNT,
        ),
    )
    kalmanson = _classify_kalmanson(source)
    assignment_sha256 = _sha256(" ".join(map(str, assignment)).encode("ascii"))
    replay_payload = {
        "assignment_sha256": assignment_sha256,
        "assumptions": list(assumptions),
        "cell_id": cell_id,
        "parent": {
            "bytes": root.byte_count,
            "clauses": root.clauses,
            "sha256": root.sha256,
            "variables": root.variables,
        },
        "source_model_sha256": source.digest,
        "source_predicates": list(_SOURCE_PREDICATES),
    }
    replay_sha256 = _sha256(_canonical_bytes(replay_payload))
    result_payload = {
        "schema": "p97-exact17-child44-assumption-sat-replay/v1",
        **replay_payload,
        "replay_sha256": replay_sha256,
        "kalmanson": {
            "status": kalmanson.status,
            "system_sha256": kalmanson.system_sha256,
            "exact_evidence_sha256": kalmanson.exact_evidence_sha256,
            "refinement_disposition": kalmanson.refinement_disposition,
        },
    }
    return Child44SatReplay(
        schema="p97-exact17-child44-assumption-sat-replay/v1",
        cell_id=cell_id,
        assumptions=assumptions,
        parent_sha256=root.sha256,
        parent_bytes=root.byte_count,
        parent_variables=root.variables,
        parent_clauses=root.clauses,
        assignment_sha256=assignment_sha256,
        source_model=source,
        source_predicates=_SOURCE_PREDICATES,
        replay_sha256=replay_sha256,
        kalmanson=kalmanson,
        result_sha256=_sha256(_canonical_bytes(result_payload)),
    )


__all__ = [
    "CHILD44_PARENT_SHA256",
    "Child44ReplayError",
    "Child44ReplayInconclusive",
    "Child44SatReplay",
    "DecodedSourceModel",
    "KalmansonClassification",
    "KalmansonFeasibleProposal",
    "KalmansonInfeasibleProposal",
    "KalmansonProposal",
    "ProposalProvenance",
    "WeightedTerm",
    "replay_child44_assumption_sat",
    "verify_exact17_kalmanson_proposal",
]
