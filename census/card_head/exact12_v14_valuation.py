"""Finite clause compiler for one exact-12 normalized-v14 schedule cell.

This module promotes the branch semantics out of the historical scratch
wrappers.  It compiles the checked finite predicates relative to a pristine
source-faithful C1/C2/C4 candidate instance and independently replays the added
constraints on decoded rows and blocker centers.

The compiler remains an untrusted finite producer.  It does not prove that the
648 cells form a disjoint partition, certify a terminal solver result, replay a
geometric detector, or close a Lean theorem.
"""

from __future__ import annotations

import hashlib
from collections.abc import Collection, Mapping
from dataclasses import dataclass
from typing import Any

from .exact12_v14_schedule import (
    DISTINGUISHED_D_CENTERS,
    NAMED_DELETION_ARMS,
    PLACEMENT_REPRESENTATIVES,
    Exact12V14Cell,
    cells,
    json_sha256,
)
from .sat_encoding import CoverInstance, EncodingError
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

COMPILER_SCHEMA = "p97_rigid221_exact12_full_v14_cell_compiler.v1"
CLAUSE_DELTA_ARTIFACT_SCHEMA = "p97_rigid221_exact12_full_v14_clause_delta.v1"
SEMANTIC_STATUS = "FINITE_SOURCE_PREDICATE_COMPILER"
SOURCE_FAITHFUL_CANDIDATE_SCHEMA = "p97_rigid221_exact12_source_safe_candidate.v1"
SOURCE_FAITHFUL_PYTHON_PROFILE = (5, 6, 4)
FROZEN_CANDIDATE_TABLE_SHA256 = (
    "46b88900a6373390c13de522913df992c91edb717c5c7fe058b8230f825ddbae"
)
FROZEN_BASE_CNF_SHA256 = (
    "c899dee2ce06c0448f5c05b14c1eeb758b0603e3b20ee983a3f963e7be9b72d6"
)

N = 12
O = 1
U = 6
C = 7
XV = 8
XU = 9
Q = 10
W = 11

ARM_SPEC: Mapping[str, tuple[int, int]] = {
    "u_q": (U, Q),
    "u_w": (U, W),
    "xv_q": (XV, Q),
    "xv_w": (XV, W),
    "xu_q": (XU, Q),
    "xu_w": (XU, W),
}


class Exact12V14ValuationError(ValueError):
    """The finite instance or requested cell violates the frozen contract."""


@dataclass(frozen=True)
class CompiledExact12V14Cell:
    """Deterministic metadata and variable map for one compiled cell."""

    cell: Exact12V14Cell
    physical: tuple[int, ...]
    row_at_o: tuple[int, ...]
    edges: Mapping[int, tuple[int, ...]]
    blocker_variables: Mapping[tuple[int, int], int]
    base_n_variables: int
    base_n_clauses: int
    final_n_variables: int
    final_n_clauses: int
    clause_delta: tuple[tuple[int, ...], ...]
    clause_delta_sha256: str
    blocker_variable_map_sha256: str

    def manifest(self) -> dict[str, Any]:
        """Return canonical JSON metadata without claiming solver coverage."""

        blocker_map = [
            {"source": source, "center": center, "variable": variable}
            for (source, center), variable in sorted(self.blocker_variables.items())
        ]
        return {
            "schema": COMPILER_SCHEMA,
            "semantic_status": SEMANTIC_STATUS,
            "scope": (
                "one finite normalized-v14 cell relative to the frozen "
                "source-safe candidate CNF; no terminal, replay, aggregate "
                "coverage, or Lean-closure claim"
            ),
            "cell": {
                "placement_index": self.cell.placement_index,
                "joint_deletion": self.cell.joint_deletion,
                "v": self.cell.v,
                "arm": self.cell.arm,
                "distinguished_d": self.cell.distinguished_d,
            },
            "physical": list(self.physical),
            "row_at_o": list(self.row_at_o),
            "edges": [
                {"source": source, "edge": list(edge)}
                for source, edge in self.edges.items()
            ],
            "blocker_variables": blocker_map,
            "counts": {
                "base_variables": self.base_n_variables,
                "base_clauses": self.base_n_clauses,
                "final_variables": self.final_n_variables,
                "final_clauses": self.final_n_clauses,
                "added_variables": self.final_n_variables - self.base_n_variables,
                "added_clauses": self.final_n_clauses - self.base_n_clauses,
            },
            "hashes": {
                "clause_delta_sha256": self.clause_delta_sha256,
                "blocker_variable_map_sha256": self.blocker_variable_map_sha256,
            },
        }

    def clause_delta_artifact(self, dimacs: str | bytes) -> dict[str, Any]:
        """Return and validate the ordered clause suffix for this compiled cell."""

        return build_clause_delta_artifact(self, dimacs)


def _validate_cell(cell: Exact12V14Cell) -> None:
    if not isinstance(cell, Exact12V14Cell):
        raise Exact12V14ValuationError("cell has the wrong type")
    if any(
        isinstance(value, bool) or not isinstance(value, int)
        for value in (
            cell.placement_index,
            cell.joint_deletion,
            cell.v,
            cell.distinguished_d,
        )
    ):
        raise Exact12V14ValuationError("cell integer fields must be plain integers")
    if not isinstance(cell.arm, str):
        raise Exact12V14ValuationError("cell arm must be a string")
    if not 0 <= cell.placement_index < len(PLACEMENT_REPRESENTATIVES):
        raise Exact12V14ValuationError("placement index is outside the schedule")
    if PLACEMENT_REPRESENTATIVES[cell.placement_index] != (
        cell.joint_deletion,
        cell.v,
    ):
        raise Exact12V14ValuationError("placement coordinates do not match their index")
    if cell.arm not in NAMED_DELETION_ARMS or cell.arm not in ARM_SPEC:
        raise Exact12V14ValuationError("named-deletion arm is outside the schedule")
    if cell.distinguished_d not in DISTINGUISHED_D_CENTERS:
        raise Exact12V14ValuationError("distinguished d is outside the schedule")
    if cell not in cells():
        raise Exact12V14ValuationError("cell is not in the frozen schedule")


def _validate_pristine_instance(instance: CoverInstance) -> None:
    if type(instance) is not SourceFaithfulCoverInstance:
        raise Exact12V14ValuationError(
            "instance must be the exact source-faithful candidate class"
        )
    if getattr(instance, "schema", None) != SOURCE_FAITHFUL_CANDIDATE_SCHEMA:
        raise Exact12V14ValuationError(
            "instance is not the frozen source-faithful candidate surface"
        )
    model = getattr(instance, "model", None)
    if model is None or model.cardinality != N:
        raise Exact12V14ValuationError("instance must have cardinality 12")
    if tuple(model.profile) != SOURCE_FAITHFUL_PYTHON_PROFILE:
        raise Exact12V14ValuationError("instance has the wrong exact-12 profile")
    if (
        instance.cnf.n_variables != instance.base_n_variables
        or len(instance.cnf.clauses) != instance.base_n_clauses
    ):
        raise Exact12V14ValuationError(
            "cell compiler requires a pristine source-faithful base instance"
        )
    candidate_payload = [
        [center, list(row)]
        for center in range(N)
        for row in instance.candidates[center]
    ]
    if json_sha256(candidate_payload) != FROZEN_CANDIDATE_TABLE_SHA256:
        raise Exact12V14ValuationError(
            "source-faithful candidate table differs from the frozen contract"
        )
    if json_sha256(instance.cnf.clauses) != FROZEN_BASE_CNF_SHA256:
        raise Exact12V14ValuationError(
            "source-faithful base CNF differs from the frozen contract"
        )


def _vars_matching(instance: CoverInstance, center: int, predicate: Any) -> list[int]:
    return [
        instance.choice_variables[(center, index)]
        for index, row in enumerate(instance.candidates[center])
        if predicate(frozenset(row))
    ]


def _require_any(
    instance: CoverInstance, variables: Collection[int], description: str
) -> None:
    choices = tuple(variables)
    if not choices:
        raise Exact12V14ValuationError(
            f"source-faithful choice set is empty: {description}"
        )
    instance.cnf.add_clause(choices)


def _require_exact_row(
    instance: CoverInstance, center: int, row: Collection[int]
) -> None:
    try:
        index = instance.candidate_index(center, row)
    except EncodingError as exc:
        raise Exact12V14ValuationError(
            f"required row at center {center} is absent from the candidate surface"
        ) from exc
    instance.cnf.add_clause((instance.choice_variables[(center, index)],))


def _add_physical_cycle(
    instance: CoverInstance,
    physical: frozenset[int],
    joint_deletion: int,
    v: int,
) -> tuple[dict[tuple[int, int], int], dict[int, tuple[int, ...]]]:
    edges: dict[int, tuple[int, ...]] = {
        U: tuple(sorted((U, XU))),
        XU: tuple(sorted((XU, joint_deletion))),
        joint_deletion: tuple(sorted((joint_deletion, v))),
        v: tuple(sorted((v, XV))),
        XV: tuple(sorted((XV, U))),
    }
    blocker: dict[tuple[int, int], int] = {}
    for source, edge_tuple in edges.items():
        edge = frozenset(edge_tuple)
        choices: list[int] = []
        for center in range(N):
            if center in (source, O):
                continue
            variable = instance.cnf.new_variable()
            blocker[(source, center)] = variable
            choices.append(variable)
            allowed_rows = _vars_matching(
                instance,
                center,
                lambda row, source=source, edge=edge: (
                    source in row and row & physical == edge
                ),
            )
            if allowed_rows:
                instance.cnf.add_clause((-variable, *allowed_rows))
            else:
                instance.cnf.add_clause((-variable,))
        _require_any(instance, choices, f"actual blocker of source {source}")
        instance.cnf.at_most_sinz(choices, 1)

    instance.cnf.add_clause((blocker[(U, XV)],))
    instance.cnf.add_clause((blocker[(XV, C)],))

    for center in range(N):
        variables = [
            blocker[(source, center)] for source in edges if (source, center) in blocker
        ]
        instance.cnf.at_most_sinz(variables, 1)
    return blocker, edges


def _add_named_deletion_arm(
    instance: CoverInstance,
    blocker: Mapping[tuple[int, int], int],
    arm: str,
) -> None:
    source, deletion = ARM_SPEC[arm]
    generated = 0
    for (candidate_source, center), blocker_variable in sorted(blocker.items()):
        if candidate_source != source:
            continue
        if center == 2:
            instance.cnf.add_clause((-blocker_variable,))
            generated += 1
        for index, row in enumerate(instance.candidates[center]):
            if deletion in row:
                choice = instance.choice_variables[(center, index)]
                instance.cnf.add_clause((-blocker_variable, -choice))
                generated += 1
    if generated == 0:
        raise Exact12V14ValuationError(f"named-deletion arm {arm} generated no clauses")


def _add_distinguished_d(
    instance: CoverInstance,
    blocker: Mapping[tuple[int, int], int],
    row_at_o: frozenset[int],
    distinguished_d: int,
) -> None:
    eligible_rows = _vars_matching(
        instance,
        distinguished_d,
        lambda row: C in row and XU not in row,
    )
    _require_any(instance, eligible_rows, f"distinguished d={distinguished_d}")

    blocker_at_d = blocker.get((XU, distinguished_d))
    if blocker_at_d is not None:
        instance.cnf.add_clause((-blocker_at_d,))
    elif distinguished_d != XU:
        raise Exact12V14ValuationError("distinguished d has no xu-blocker variable")

    if distinguished_d not in row_at_o:
        return
    row_d_positive = _vars_matching(
        instance,
        distinguished_d,
        lambda row: O in row and U in row,
    )
    row_c_positive = _vars_matching(
        instance,
        C,
        lambda row: O in row and distinguished_d in row,
    )
    for left in row_d_positive:
        for right in row_c_positive:
            instance.cnf.add_clause((-left, -right))


def compile_cell(
    instance: CoverInstance, cell: Exact12V14Cell
) -> CompiledExact12V14Cell:
    """Compile exactly one schedule branch into a pristine finite instance."""

    _validate_cell(cell)
    _validate_pristine_instance(instance)
    base_n_variables = instance.cnf.n_variables
    base_n_clauses = len(instance.cnf.clauses)

    row_at_o = frozenset((U, cell.joint_deletion, cell.v, XV))
    physical = frozenset((U, XU, cell.joint_deletion, cell.v, XV))
    _require_exact_row(instance, O, row_at_o)
    _require_any(
        instance,
        _vars_matching(
            instance,
            C,
            lambda row: row & physical == frozenset((U, XV)),
        ),
        "row[7] physical intersection {6,8}",
    )
    blocker, edges = _add_physical_cycle(
        instance, physical, cell.joint_deletion, cell.v
    )
    _add_named_deletion_arm(instance, blocker, cell.arm)
    _add_distinguished_d(instance, blocker, row_at_o, cell.distinguished_d)

    clause_delta = instance.cnf.clauses[base_n_clauses:]
    blocker_map_payload = [
        [source, center, variable]
        for (source, center), variable in sorted(blocker.items())
    ]
    return CompiledExact12V14Cell(
        cell=cell,
        physical=tuple(sorted(physical)),
        row_at_o=tuple(sorted(row_at_o)),
        edges=edges,
        blocker_variables=blocker,
        base_n_variables=base_n_variables,
        base_n_clauses=base_n_clauses,
        final_n_variables=instance.cnf.n_variables,
        final_n_clauses=len(instance.cnf.clauses),
        clause_delta=tuple(clause_delta),
        clause_delta_sha256=json_sha256(clause_delta),
        blocker_variable_map_sha256=json_sha256(blocker_map_payload),
    )


def _dimacs_payload(dimacs: str | bytes) -> bytes:
    if isinstance(dimacs, str):
        try:
            return dimacs.encode("ascii")
        except UnicodeEncodeError as exc:
            raise Exact12V14ValuationError("DIMACS must be ASCII") from exc
    if isinstance(dimacs, bytes):
        return dimacs
    raise Exact12V14ValuationError("DIMACS must be text or bytes")


def _parse_dimacs(dimacs: str | bytes) -> tuple[int, int, tuple[tuple[int, ...], ...]]:
    """Parse the complete clause stream emitted by the deterministic encoder."""

    payload = _dimacs_payload(dimacs)
    try:
        lines = payload.decode("ascii").splitlines()
    except UnicodeDecodeError as exc:
        raise Exact12V14ValuationError("DIMACS must be ASCII") from exc
    header: tuple[int, int] | None = None
    tokens: list[str] = []
    for line in lines:
        stripped = line.strip()
        if not stripped or stripped.startswith("c"):
            continue
        fields = stripped.split()
        if header is None:
            if fields[:2] != ["p", "cnf"] or len(fields) != 4:
                raise Exact12V14ValuationError("DIMACS has an invalid header")
            try:
                header = (int(fields[2]), int(fields[3]))
            except ValueError as exc:
                raise Exact12V14ValuationError("DIMACS header counts are invalid") from exc
            continue
        tokens.extend(fields)
    if header is None:
        raise Exact12V14ValuationError("DIMACS is missing its header")
    n_variables, n_clauses = header
    if n_variables < 0 or n_clauses < 0:
        raise Exact12V14ValuationError("DIMACS header counts must be nonnegative")
    clauses: list[tuple[int, ...]] = []
    current: list[int] = []
    for token in tokens:
        try:
            literal = int(token)
        except ValueError as exc:
            raise Exact12V14ValuationError("DIMACS contains a non-integer literal") from exc
        if literal == 0:
            clauses.append(tuple(current))
            current = []
        else:
            if abs(literal) > n_variables:
                raise Exact12V14ValuationError("DIMACS literal exceeds its variable count")
            current.append(literal)
    if current:
        raise Exact12V14ValuationError("DIMACS has an unterminated clause")
    if len(clauses) != n_clauses:
        raise Exact12V14ValuationError("DIMACS clause count does not match its header")
    return n_variables, n_clauses, tuple(clauses)


def _canonical_dimacs_clause_bytes(clauses: Collection[Collection[int]]) -> bytes:
    return "".join(" ".join(map(str, clause)) + " 0\n" for clause in clauses).encode(
        "ascii"
    )


def build_clause_delta_artifact(
    compiled: CompiledExact12V14Cell, dimacs: str | bytes
) -> dict[str, Any]:
    """Serialize the compiler's ordered clause delta and bind it to DIMACS."""

    dimacs_bytes = _dimacs_payload(dimacs)
    n_variables, n_clauses, clauses = _parse_dimacs(dimacs_bytes)
    delta = [list(clause) for clause in compiled.clause_delta]
    artifact = {
        "schema": CLAUSE_DELTA_ARTIFACT_SCHEMA,
        "semantic_status": "ORDERED_DIMACS_SUFFIX",
        "scope": (
            "one finite normalized-v14 cell; ordered compiler clause delta is "
            "checked against the complete DIMACS suffix after the frozen base"
        ),
        "cell": compiled.manifest()["cell"],
        "counts": {
            "base_variables": compiled.base_n_variables,
            "base_clauses": compiled.base_n_clauses,
            "delta_clauses": len(delta),
            "final_variables": compiled.final_n_variables,
            "final_clauses": compiled.final_n_clauses,
        },
        "clause_delta": delta,
        "hashes": {
            "base_clause_list_sha256": json_sha256(
                clauses[: compiled.base_n_clauses]
            ),
            "clause_delta_sha256": json_sha256(delta),
            "dimacs_sha256": hashlib.sha256(dimacs_bytes).hexdigest(),
            "dimacs_suffix_sha256": hashlib.sha256(
                _canonical_dimacs_clause_bytes(clauses[compiled.base_n_clauses :])
            ).hexdigest(),
        },
    }
    validate_clause_delta_artifact(artifact, compiled, dimacs_bytes)
    if n_variables != compiled.final_n_variables or n_clauses != compiled.final_n_clauses:
        raise Exact12V14ValuationError("DIMACS counts do not match the compiled cell")
    return artifact


def validate_clause_delta_artifact(
    artifact: Mapping[str, Any],
    compiled: CompiledExact12V14Cell,
    dimacs: str | bytes,
) -> None:
    """Fail closed unless the artifact is the compiled complete DIMACS suffix."""

    if not isinstance(artifact, Mapping):
        raise Exact12V14ValuationError("clause-delta artifact must be a JSON object")
    if artifact.get("schema") != CLAUSE_DELTA_ARTIFACT_SCHEMA:
        raise Exact12V14ValuationError("clause-delta artifact has the wrong schema")
    counts = artifact.get("counts")
    hashes = artifact.get("hashes")
    delta = artifact.get("clause_delta")
    if not isinstance(counts, Mapping) or not isinstance(hashes, Mapping):
        raise Exact12V14ValuationError("clause-delta artifact is missing metadata")
    if not isinstance(delta, list):
        raise Exact12V14ValuationError("clause_delta must be an ordered list")
    try:
        base_clauses = counts["base_clauses"]
        final_clauses = counts["final_clauses"]
        base_variables = counts["base_variables"]
        final_variables = counts["final_variables"]
    except KeyError as exc:
        raise Exact12V14ValuationError("clause-delta counts are incomplete") from exc
    if any(
        isinstance(value, bool) or not isinstance(value, int) or value < 0
        for value in (base_clauses, final_clauses, base_variables, final_variables)
    ):
        raise Exact12V14ValuationError("clause-delta counts are invalid")
    expected_counts = {
        "base_variables": compiled.base_n_variables,
        "base_clauses": compiled.base_n_clauses,
        "delta_clauses": len(compiled.clause_delta),
        "final_variables": compiled.final_n_variables,
        "final_clauses": compiled.final_n_clauses,
    }
    if dict(counts) != expected_counts:
        raise Exact12V14ValuationError(
            "clause-delta counts do not match the compiled cell"
        )
    if artifact.get("cell") != compiled.manifest()["cell"]:
        raise Exact12V14ValuationError(
            "clause-delta coordinate does not match the compiled cell"
        )
    try:
        normalized_delta = tuple(tuple(clause) for clause in delta)
    except TypeError as exc:
        raise Exact12V14ValuationError("clause_delta must contain clause lists") from exc
    if any(
        any(isinstance(literal, bool) or not isinstance(literal, int) for literal in clause)
        for clause in normalized_delta
    ):
        raise Exact12V14ValuationError("clause_delta literals must be plain integers")
    if normalized_delta != compiled.clause_delta:
        raise Exact12V14ValuationError(
            "clause_delta does not match the compiled ordered clause delta"
        )
    dimacs_bytes = _dimacs_payload(dimacs)
    n_variables, n_clauses, clauses = _parse_dimacs(dimacs_bytes)
    if (n_variables, n_clauses) != (final_variables, final_clauses):
        raise Exact12V14ValuationError("clause-delta metadata does not match DIMACS counts")
    if not 0 <= base_clauses <= final_clauses:
        raise Exact12V14ValuationError("base clause count is outside the DIMACS stream")
    expected = clauses[base_clauses:]
    if hashes.get("base_clause_list_sha256") != json_sha256(clauses[:base_clauses]):
        raise Exact12V14ValuationError("clause-delta base clause hash is invalid")
    if normalized_delta != expected:
        raise Exact12V14ValuationError(
            "clause_delta does not equal the complete DIMACS suffix after the base clause count"
        )
    if hashes.get("clause_delta_sha256") != json_sha256(delta):
        raise Exact12V14ValuationError("clause-delta hash does not match its ordered list")
    if hashes.get("clause_delta_sha256") != compiled.clause_delta_sha256:
        raise Exact12V14ValuationError("clause-delta hash does not match the compiler")
    if hashes.get("dimacs_sha256") != hashlib.sha256(dimacs_bytes).hexdigest():
        raise Exact12V14ValuationError("clause-delta DIMACS hash does not match its bytes")
    expected_suffix_hash = hashlib.sha256(
        _canonical_dimacs_clause_bytes(expected)
    ).hexdigest()
    if hashes.get("dimacs_suffix_sha256") != expected_suffix_hash:
        raise Exact12V14ValuationError("clause-delta DIMACS suffix hash is invalid")


def added_constraints_hold(
    cell: Exact12V14Cell,
    cube: Mapping[int, Collection[int]],
    blockers: Mapping[int, int],
) -> bool:
    """Independently replay the finite constraints added by ``compile_cell``."""

    try:
        _validate_cell(cell)
    except Exact12V14ValuationError:
        return False
    if set(cube) != set(range(N)):
        return False
    if any(isinstance(center, bool) or not isinstance(center, int) for center in cube):
        return False
    if set(blockers) != {U, XU, cell.joint_deletion, cell.v, XV}:
        return False
    if any(
        isinstance(source, bool) or not isinstance(source, int) for source in blockers
    ):
        return False
    if any(
        isinstance(center, bool) or not isinstance(center, int)
        for center in blockers.values()
    ):
        return False
    rows: dict[int, frozenset[int]] = {}
    for center in range(N):
        row = frozenset(cube[center])
        if any(isinstance(point, bool) or not isinstance(point, int) for point in row):
            return False
        rows[center] = row
    row_at_o = frozenset((U, cell.joint_deletion, cell.v, XV))
    physical = frozenset((U, XU, cell.joint_deletion, cell.v, XV))
    edges = {
        U: frozenset((U, XU)),
        XU: frozenset((XU, cell.joint_deletion)),
        cell.joint_deletion: frozenset((cell.joint_deletion, cell.v)),
        cell.v: frozenset((cell.v, XV)),
        XV: frozenset((XV, U)),
    }
    if rows[O] != row_at_o:
        return False
    if rows[C] & physical != frozenset((U, XV)):
        return False
    if blockers[U] != XV or blockers[XV] != C:
        return False
    if len(set(blockers.values())) != len(blockers):
        return False
    for source, center in blockers.items():
        if not 0 <= center < N or center in (source, O):
            return False
        if source not in rows[center] or rows[center] & physical != edges[source]:
            return False

    arm_source, deletion = ARM_SPEC[cell.arm]
    arm_center = blockers[arm_source]
    if arm_center == 2 or deletion in rows[arm_center]:
        return False

    d = cell.distinguished_d
    if C not in rows[d] or XU in rows[d] or blockers[XU] == d:
        return False
    forbidden_tetrahedron = (
        d in rows[O] and O in rows[d] and U in rows[d] and O in rows[C] and d in rows[C]
    )
    return not forbidden_tetrahedron


def decode_blockers(
    positive_variables: Collection[int],
    blocker_variables: Mapping[tuple[int, int], int],
) -> dict[int, int]:
    """Decode exactly one selected blocker center for each physical source."""

    positive = frozenset(positive_variables)
    sources = {source for source, _center in blocker_variables}
    decoded: dict[int, int] = {}
    for source in sorted(sources):
        selected = [
            center
            for (candidate_source, center), variable in blocker_variables.items()
            if candidate_source == source and variable in positive
        ]
        if len(selected) != 1:
            raise Exact12V14ValuationError(
                f"source {source} selects {len(selected)} blocker centers"
            )
        decoded[source] = selected[0]
    return decoded
