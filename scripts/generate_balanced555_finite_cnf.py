"""Generate the deterministic Boolean surface for the balanced ``(5,5,5)`` cell.

This is deliberately a finite *encoding* module.  It does not invoke a solver
and it does not treat a solver result as a proof.  The variables are the 132
off-diagonal carrier/row incidences, six role-permutation selectors, and ten
middle-label selectors.  Keeping this map small and explicit makes the DIMACS
bytes suitable for a later PiQD custody run and gives the Lean ingress a stable
atom ledger.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import sys
from collections.abc import Iterable
from dataclasses import dataclass
from pathlib import Path
from typing import Literal

Orientation = Literal["direct", "mirror"]
N = 12
N_VARS = 148
ROW_VARS = 132
ROLE_VARS = {f"permutation_{i}": 133 + i for i in range(6)}
MIDDLE_VARS = {f"middle_{i}": 139 + i for i in range(10)}

# Raw/effective counts are part of the finite contract.  Only effective
# occurrences become clauses; raw counts remain in the manifest for audit.
KALMANSON_COUNTS = {
    "S5A": (7920, 6006),
    "S5B": (7920, 6630),
    "S6A": (11088, 8694),
    "S6B": (11088, 8244),
    "S6C": (11088, 9408),
}


class Balanced555GenerationError(ValueError):
    """The finite encoding contract is malformed."""


@dataclass(frozen=True)
class Labels:
    surplus: int
    first_apex: int
    second_apex: int
    second_interior: tuple[int, int, int]
    surplus_interior: tuple[int, int, int]
    first_interior: tuple[int, int, int]
    caps: tuple[frozenset[int], frozenset[int], frozenset[int]]

    def as_dict(self) -> dict[str, object]:
        return {
            "surplus": self.surplus,
            "first_apex": self.first_apex,
            "second_apex": self.second_apex,
            "second_interior": list(self.second_interior),
            "surplus_interior": list(self.surplus_interior),
            "first_interior": list(self.first_interior),
            "caps": [sorted(cap) for cap in self.caps],
        }


@dataclass(frozen=True)
class RootKey:
    deleted: int
    retained: int
    third: int
    middle: int
    k0: tuple[int, ...]
    k1: tuple[int, ...]
    k2: tuple[int, ...]


@dataclass(frozen=True)
class KalmansonOccurrence:
    subset: tuple[int, ...]
    offset: int
    reflected: bool
    row_requirements: tuple[tuple[int, tuple[int, int]], ...]
    ordered_rows: tuple[tuple[int, tuple[int, int, int, int]], ...]


@dataclass(frozen=True)
class Clause:
    family: str
    literals: tuple[int, ...]
    root_index: int | None = None
    schema: str | None = None
    occurrence: KalmansonOccurrence | None = None


def variable(center: int, point: int) -> int:
    """The one-based DIMACS variable for ``point ∈ selectedRow(center)``."""

    if not (0 <= center < N and 0 <= point < N) or center == point:
        raise Balanced555GenerationError("carrier labels must be in Fin 12")
    return center * (N - 1) + (point if point < center else point - 1) + 1


def variable_name(var: int) -> str:
    if 1 <= var <= ROW_VARS:
        center, offset = divmod(var - 1, N - 1)
        point = offset if offset < center else offset + 1
        return f"row[{center},{point}]"
    for name, atom in {**ROLE_VARS, **MIDDLE_VARS}.items():
        if var == atom:
            return f"role.{name}"
    raise Balanced555GenerationError(f"variable outside 1..{N_VARS}: {var}")


def decode_variable(var: int) -> tuple[str, int, int] | tuple[str, str]:
    """Return a machine-readable inverse of :func:`variable`."""

    if 1 <= var <= ROW_VARS:
        center, offset = divmod(var - 1, N - 1)
        point = offset if offset < center else offset + 1
        return ("row", center, point)
    for name, atom in {**ROLE_VARS, **MIDDLE_VARS}.items():
        if var == atom:
            return ("role", name)
    raise Balanced555GenerationError(f"variable outside 1..{N_VARS}: {var}")


def labels_for_orientation(orientation: Orientation) -> Labels:
    if orientation == "direct":
        first, second = 4, 8
        second_int, first_int = (1, 2, 3), (9, 10, 11)
    elif orientation == "mirror":
        first, second = 8, 4
        second_int, first_int = (9, 10, 11), (1, 2, 3)
    else:
        raise Balanced555GenerationError(f"invalid orientation: {orientation!r}")
    # Closed cap blocks are the three consecutive five-label arcs.  Their
    # overlaps are the three apex labels, as in the boundary labeling.
    caps = (
        frozenset((0, 1, 2, 3, 4)),
        frozenset((4, 5, 6, 7, 8)),
        frozenset((8, 9, 10, 11, 0)),
    )
    return Labels(0, first, second, second_int, (5, 6, 7), first_int, caps)


def _support_tuples(center: int) -> list[tuple[int, ...]]:
    return [tuple(c) for c in itertools.combinations((p for p in range(N) if p != center), 4)]


def _moser_support_ok(labels: Labels, center: int, support: tuple[int, ...]) -> bool:
    s = set(support)
    if center == labels.surplus:
        opposite = set(labels.surplus_interior)
        adjacent = (labels.caps[0], labels.caps[2])
    elif center == labels.first_apex:
        opposite = set(labels.first_interior)
        adjacent = (
            (labels.caps[0], labels.caps[1])
            if labels.first_apex == 4
            else (labels.caps[1], labels.caps[2])
        )
    else:
        opposite = set(labels.second_interior)
        adjacent = (
            (labels.caps[1], labels.caps[2])
            if labels.second_apex == 8
            else (labels.caps[0], labels.caps[1])
        )
    return len(s & opposite) >= 2 and all(len(s & cap) <= 1 for cap in adjacent)


def local_domains(orientation: Orientation) -> dict[int, tuple[tuple[int, ...], ...]]:
    """Enumerate the 56 Moser and 301 non-Moser local four-row domains."""

    labels = labels_for_orientation(orientation)
    moser = {labels.surplus, labels.first_apex, labels.second_apex}
    result: dict[int, tuple[tuple[int, ...], ...]] = {}
    for center in range(N):
        supports = _support_tuples(center)
        if center in moser:
            chosen = [s for s in supports if _moser_support_ok(labels, center, s)]
            if len(chosen) != 56:
                raise Balanced555GenerationError("Moser local domain is not 56")
        else:
            # Every non-apex label belongs to exactly one closed cap.  The
            # local source contract imposes the cap upper bound there.
            containing = [cap for cap in labels.caps if center in cap]
            chosen = [s for s in supports if all(len(set(s) & cap) <= 2 for cap in containing)]
            if len(chosen) != 301:
                raise Balanced555GenerationError("non-Moser local domain is not 301")
        result[center] = tuple(chosen)
    if sorted(map(len, result.values())) != [56, 56, 56] + [301] * 9:
        raise Balanced555GenerationError("local-domain census mismatch")
    return result


def _root_role_tuples(labels: Labels) -> Iterable[tuple[int, int, int, int]]:
    first = labels.first_interior
    middle_candidates = tuple(p for p in range(N) if p not in (labels.first_apex, labels.second_apex))
    for deleted, retained, third in itertools.permutations(first):
        for middle in middle_candidates:
            yield deleted, retained, third, middle


def _valid_k_triples(
    orientation: Orientation, deleted: int, retained: int, third: int, middle: int
) -> tuple[tuple[tuple[int, ...], tuple[int, ...], tuple[int, ...]], ...]:
    domains = local_domains(orientation)
    labels = labels_for_orientation(orientation)
    universe = set(range(N))
    out = []
    for k0_tuple in domains[labels.first_apex]:
        k0 = set(k0_tuple)
        if deleted in k0 or retained not in k0 or third not in k0:
            continue
        for k1_tuple in domains[middle]:
            k1 = set(k1_tuple)
            if deleted in k1 or retained not in k1 or k0 & k1 != {retained}:
                continue
            for k2_tuple in domains[labels.second_apex]:
                k2 = set(k2_tuple)
                if deleted in k2 or k0 & k2 or k1 & k2:
                    continue
                if k0 | k1 | k2 != universe - {deleted}:
                    continue
                out.append((k0_tuple, k1_tuple, k2_tuple))
    return tuple(out)


def root_keys(orientation: Orientation) -> tuple[RootKey, ...]:
    labels = labels_for_orientation(orientation)
    all_roots: list[RootKey] = []
    for deleted, retained, third, middle in _root_role_tuples(labels):
        candidates = _valid_k_triples(orientation, deleted, retained, third, middle)
        all_roots.extend(RootKey(deleted, retained, third, middle, *triple) for triple in candidates)
    if len(all_roots) != 1656:
        raise Balanced555GenerationError(f"root census mismatch: {len(all_roots)}")
    return tuple(all_roots)


def _forbid_support(center: int, support: tuple[int, ...]) -> tuple[int, ...]:
    return tuple(-variable(center, point) for point in support)


def _non_kalmanson_clauses(orientation: Orientation) -> tuple[list[Clause], dict[str, int]]:
    clauses: list[Clause] = []

    # Role selectors are 133..138; middle selectors are 139..148.
    clauses.append(Clause("role_exact_one", tuple(range(133, 139))))
    clauses.extend(Clause("role_exact_one", (-(133 + i), -(133 + j)))
                   for i in range(6) for j in range(i))
    clauses.append(Clause("middle_exact_one", tuple(range(139, 149))))
    clauses.extend(Clause("middle_exact_one", (-(139 + i), -(139 + j)))
                   for i in range(10) for j in range(i))

    labels = labels_for_orientation(orientation)
    a1, a2 = labels.first_apex, labels.second_apex
    # Five fixed K0/K2 role facts per permutation.
    for i, (deleted, retained, third, _middle) in enumerate(_root_role_tuples(labels)):
        if i % 10:
            continue
        role = 133 + (i // 10) % 6
        for center, point, polarity in (
            (a1, deleted, -1), (a2, deleted, -1),
            (a1, retained, 1), (a2, retained, -1), (a1, third, 1),
        ):
            lit = polarity * variable(center, point)
            clauses.append(Clause("tight_membership", (-role, lit)))
    middle_labels = tuple(p for p in range(N) if p not in (a1, a2))
    for role_index in range(6):
        deleted, retained, _third = itertools.permutations(labels.first_interior).__iter__().__next__()
        # The role permutation is lexicographically indexed.
        deleted, retained, _third = list(itertools.permutations(labels.first_interior))[role_index]
        role = 133 + role_index
        for middle_index, middle in enumerate(middle_labels):
            msel = 139 + middle_index
            if middle != deleted:
                clauses.append(Clause("tight_membership", (-role, -msel, -variable(middle, deleted))))
            if middle != retained:
                clauses.append(Clause("tight_membership", (-role, -msel, variable(middle, retained))))
            else:
                clauses.append(Clause("tight_membership", (-role, -msel)))

    # K0/K2 disjointness, K1/K2 disjointness, and K0/K1 intersection bound.
    for point in range(N):
        if point not in (a1, a2):
            clauses.append(Clause("intersection", (-variable(a1, point), -variable(a2, point))))
    for middle_index, middle in enumerate(middle_labels):
        msel = 139 + middle_index
        for point in range(N):
            if point not in (middle, a2):
                clauses.append(Clause("intersection", (-msel, -variable(middle, point), -variable(a2, point))))
    perms = list(itertools.permutations(labels.first_interior))
    for role_index, (_deleted, retained, _third) in enumerate(perms):
        role = 133 + role_index
        for middle_index, middle in enumerate(middle_labels):
            msel = 139 + middle_index
            for point in range(N):
                if point not in (a1, middle, retained):
                    clauses.append(Clause("intersection", (-role, -msel, -variable(a1, point), -variable(middle, point))))
    # Every point other than deleted is covered by K0, K1, or K2.
    for role_index, (deleted, _retained, _third) in enumerate(perms):
        role = 133 + role_index
        for middle_index, middle in enumerate(middle_labels):
            msel = 139 + middle_index
            for point in range(N):
                if point == deleted:
                    continue
                literals = [-role, -msel]
                if point != a1:
                    literals.append(variable(a1, point))
                if point != middle:
                    literals.append(variable(middle, point))
                if point != a2:
                    literals.append(variable(a2, point))
                clauses.append(Clause("cover", tuple(literals)))
    # Shared-pair alternation: choose four distinct labels, then choose the
    # unordered center pair; exactly four of the six assignments are
    # non-alternating, giving 495 * 4 = 1,980 clauses.
    for four in itertools.combinations(range(N), 4):
        for centers in itertools.combinations(four, 2):
            points = tuple(p for p in four if p not in centers)
            types = {p: (0 if p in centers else 1) for p in four}
            ordered = tuple(sorted(four))
            alternating = all(types[ordered[i]] != types[ordered[(i + 1) % 4]] for i in range(4))
            if not alternating:
                literals = tuple(-variable(center, point) for center in centers for point in points)
                clauses.append(Clause("shared_alternation", literals))
    counts = {"row_card_at_most": 5544, "row_card_at_least": 1980,
              "cap_upper": 60, "apex_opposite_interior": 9, "apex_adjacent_cap": 36,
              "role_exact_one": 16, "middle_exact_one": 46, "tight_membership": 144,
              "intersection": 656, "cover": 660, "shared_alternation": 1980}
    # Add the row/cap families after the direct source connectors so their
    # ordering is stable and independently inspectable.
    rows: list[Clause] = []
    for center in range(N):
        candidates = [p for p in range(N) if p != center]
        rows.extend(Clause("row_card_at_most", tuple(-variable(center, p) for p in subset))
                    for subset in itertools.combinations(candidates, 5))
        rows.extend(Clause("row_card_at_least", tuple(variable(center, p) for p in subset))
                    for subset in itertools.combinations(candidates, 8))
    for cap in labels.caps:
        for center in sorted(cap):
            others = [p for p in range(N) if p != center and p in cap]
            rows.extend(Clause("cap_upper", tuple(-variable(center, p) for p in subset))
                        for subset in itertools.combinations(others, 3))
    moser = (labels.surplus, labels.first_apex, labels.second_apex)
    opposite = (labels.surplus_interior, labels.first_interior, labels.second_interior)
    adjacent = ((labels.caps[0], labels.caps[2]),
                ((labels.caps[0], labels.caps[1]) if labels.first_apex == 4 else (labels.caps[1], labels.caps[2])),
                ((labels.caps[1], labels.caps[2]) if labels.second_apex == 8 else (labels.caps[0], labels.caps[1])))
    for center, interior, caps in zip(moser, opposite, adjacent):
        rows.extend(Clause("apex_opposite_interior", tuple(variable(center, p) for p in subset))
                    for subset in itertools.combinations(interior, 2))
        for cap in caps:
            rows.extend(Clause("apex_adjacent_cap", tuple(-variable(center, p) for p in subset))
                        for subset in itertools.combinations([p for p in cap if p != center], 2))
    # The clauses are now in contract order: local, row/cap, selectors, and
    # pinned/intersection/cover connectors.
    selectors = clauses[:62]
    connectors = clauses[62:]
    return rows + selectors + connectors, counts


def _kalmanson_clauses(orientation: Orientation = "direct") -> tuple[list[Clause], dict[str, int]]:
    schemas = {
        "S5A": (5, ((0, (1, 2)), (1, (2, 3)), (4, (1, 3))), ((2, (0, 1, 2, 3)), (1, (0, 1, 3, 4)))),
        "S5B": (5, ((0, (1, 2)), (1, (2, 4)), (3, (1, 4))), ((2, (0, 1, 2, 3)), (1, (0, 1, 3, 4)))),
        "S6A": (6, ((0, (1, 2)), (3, (2, 5)), (4, (1, 5))), ((1, (0, 1, 2, 3)), (1, (1, 3, 4, 5)))),
        "S6B": (6, ((0, (1, 2)), (4, (1, 3)), (5, (2, 3))), ((1, (0, 1, 2, 5)), (2, (1, 3, 4, 5)))),
        "S6C": (6, ((0, (1, 3)), (4, (1, 2)), (5, (2, 3))), ((1, (0, 1, 2, 4)), (1, (0, 2, 3, 5)))),
    }
    clauses: list[Clause] = []
    domains = local_domains(orientation)
    counts = {f"kalmanson_{name}": 0 for name in schemas}
    for name, (k, row_pairs, ordered_rows) in schemas.items():
        for subset in itertools.combinations(range(N), k):
            for offset in range(k):
                for reflected in (False, True):
                    def image(position: int, *, subset=subset, offset=offset,
                              reflected=reflected, k=k) -> int:
                        step = -position if reflected else position
                        return subset[(offset + step) % k]

                    requirements = tuple(
                        (image(center), tuple(image(point) for point in pair))
                        for center, pair in row_pairs
                    )
                    transformed_rows = tuple(
                        (kind, tuple(image(point) for point in row))
                        for kind, row in ordered_rows
                    )
                    if not all(any(set(points) <= set(support) for support in domains[center])
                               for center, points in requirements):
                        continue
                    literals = tuple(-variable(center, point) for center, points in requirements for point in points)
                    occurrence = KalmansonOccurrence(
                        subset=subset,
                        offset=offset,
                        reflected=reflected,
                        row_requirements=requirements,
                        ordered_rows=transformed_rows,
                    )
                    clauses.append(Clause("kalmanson", literals, schema=name, occurrence=occurrence))
                    counts[f"kalmanson_{name}"] += 1
    expected = {f"kalmanson_{name}": effective for name, (_raw, effective) in KALMANSON_COUNTS.items()}
    if counts != expected:
        raise Balanced555GenerationError(f"Kalmanson occurrence census mismatch: {counts}")
    if len(clauses) != sum(expected.values()):
        raise Balanced555GenerationError("Kalmanson clause census mismatch")
    return clauses, counts


def validate_encoding(orientation: Orientation) -> None:
    """Run the solver-free contract checks used by the CLI and tests."""

    domains = local_domains(orientation)
    if sorted(len(supports) for supports in domains.values()) != [56, 56, 56] + [301] * 9:
        raise Balanced555GenerationError("local-domain self-check failed")
    if len(root_keys(orientation)) != 1656:
        raise Balanced555GenerationError("root self-check failed")
    clauses = clauses_for_orientation(orientation)
    if len(clauses) != 50113 or len({c.literals for c in clauses}) != 50113:
        raise Balanced555GenerationError("clause self-check failed")
    assignment = positive_assignment(orientation)
    for clause in clauses:
        if clause.family not in {"kalmanson", "shared_alternation"} and not clause_satisfied(clause, assignment):
            raise Balanced555GenerationError(f"positive control fails {clause.family}")


def clauses_for_orientation(orientation: Orientation) -> tuple[Clause, ...]:
    if orientation not in ("direct", "mirror"):
        raise Balanced555GenerationError(f"invalid orientation: {orientation!r}")
    base, _ = _non_kalmanson_clauses(orientation)
    kal, _ = _kalmanson_clauses(orientation)
    clauses = base + kal
    # The contract counts canonical clauses.  All families above are designed
    # with disjoint arities/signatures, but retain a defensive check here.
    if len({c.literals for c in clauses}) != 50113:
        raise Balanced555GenerationError("clause census or duplicate guard failed")
    return tuple(clauses)


def positive_assignment(orientation: Orientation) -> set[int]:
    """A hand-built SAT assignment for every non-Kalmanson/non-shared layer."""

    labels = labels_for_orientation(orientation)
    assignment = {133, 139}  # first role permutation and middle label 0
    domains = local_domains(orientation)
    # A source-valid pinned root, followed by arbitrary valid local rows at
    # the remaining centers.  This is a meaningful positive control for all
    # finite row/cardinality/connectivity clauses.
    deleted, retained, third = labels.first_interior
    middle = 0
    pinned: tuple[tuple[int, tuple[int, ...]], ...] | None = None
    for k0 in domains[labels.first_apex]:
        if deleted in k0 or retained not in k0 or third not in k0:
            continue
        for k1 in domains[middle]:
            if deleted in k1 or set(k0) & set(k1) != {retained}:
                continue
            for k2 in domains[labels.second_apex]:
                if deleted in k2 or set(k0) & set(k2) or set(k1) & set(k2):
                    continue
                if set(k0) | set(k1) | set(k2) == set(range(N)) - {deleted}:
                    pinned = ((labels.first_apex, k0), (middle, k1), (labels.second_apex, k2))
                    break
            if pinned is not None:
                break
        if pinned is not None:
            break
    if pinned is None:
        raise Balanced555GenerationError("positive pinned root not found")
    for center, support in domains.items():
        chosen = next((row for row in support if all(center != c or row == s for c, s in pinned)), support[0])
        assignment.update(variable(center, point) for point in chosen)
    for center, support in pinned:
        assignment.difference_update(variable(center, point) for point in range(N) if point != center)
        assignment.update(variable(center, point) for point in support)
    return assignment


def structural_positive_control(orientation: Orientation) -> tuple[tuple[Clause, ...], set[int]]:
    """Return the source-structural fragment and its explicit satisfying witness."""

    clauses = tuple(
        clause
        for clause in clauses_for_orientation(orientation)
        if clause.family not in {"kalmanson", "shared_alternation"}
    )
    assignment = positive_assignment(orientation)
    if len(clauses) != 9151:
        raise Balanced555GenerationError("structural positive-control clause census mismatch")
    if not all(clause_satisfied(clause, assignment) for clause in clauses):
        raise Balanced555GenerationError("structural positive-control witness does not satisfy the formula")
    return clauses, assignment


def clause_satisfied(clause: Clause | Iterable[int], assignment: set[int]) -> bool:
    literals = clause.literals if isinstance(clause, Clause) else tuple(clause)
    return any((literal > 0) == (abs(literal) in assignment) for literal in literals)


def dimacs_bytes(clauses: Iterable[Clause]) -> bytes:
    materialized = tuple(clauses)
    rows = [f"p cnf {N_VARS} {len(materialized)}"]
    rows.extend(" ".join(map(str, c.literals)) + " 0" for c in materialized)
    return ("\n".join(rows) + "\n").encode("ascii")


def _canonical_json(value: object) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode("utf-8")


def clause_ledger_bytes(clauses: tuple[Clause, ...]) -> bytes:
    rows = []
    for index, clause in enumerate(clauses, start=1):
        occurrence = clause.occurrence
        row: dict[str, object] = {
            "clause_index": index,
            "family": clause.family,
            "literals": list(clause.literals),
        }
        if clause.schema is not None:
            row["schema"] = clause.schema
        if occurrence is not None:
            row["occurrence"] = {
                "subset": list(occurrence.subset),
                "offset": occurrence.offset,
                "reflected": occurrence.reflected,
                "row_requirements": [
                    [center, list(points)] for center, points in occurrence.row_requirements
                ],
                "ordered_rows": [
                    [kind, list(points)] for kind, points in occurrence.ordered_rows
                ],
            }
        rows.append(json.dumps(row, sort_keys=True, separators=(",", ":")))
    return ("\n".join(rows) + "\n").encode("utf-8")


def build_manifest(
    orientation: Orientation,
    clauses: tuple[Clause, ...],
    cnf: bytes,
    clause_ledger: bytes,
) -> dict[str, object]:
    local = local_domains(orientation)
    roots = root_keys(orientation)
    family_counts: dict[str, int] = {}
    for clause in clauses:
        family_counts[clause.family] = family_counts.get(clause.family, 0) + 1
    return {
        "schema": "p97_balanced555_finite_cnf.v1",
        "orientation": orientation,
        "status": "FINITE_ENCODING_NO_SOLVER",
        "variables": {"count": N_VARS, "row_incidence_count": ROW_VARS, "role_atoms": ROLE_VARS},
        "labels": labels_for_orientation(orientation).as_dict(),
        "local_domains": {str(k): len(v) for k, v in local.items()},
        "root_count": len(roots),
        "raw_kalmanson_counts": {k: raw for k, (raw, _effective) in KALMANSON_COUNTS.items()},
        "effective_kalmanson_counts": {k: effective for k, (_raw, effective) in KALMANSON_COUNTS.items()},
        "clause_counts": family_counts,
        "clause_count": len(clauses),
        "cnf_sha256": hashlib.sha256(cnf).hexdigest(),
        "clause_ledger": {
            "schema": "p97_balanced555_clause_ledger_jsonl.v1",
            "row_count": len(clauses),
            "sha256": hashlib.sha256(clause_ledger).hexdigest(),
        },
        "variable_ledger": {str(i): variable_name(i) for i in range(1, N_VARS + 1)},
        "kalmanson_schema_counts": {
            name: {"raw": raw, "effective": effective}
            for name, (raw, effective) in KALMANSON_COUNTS.items()
        },
    }


def generate(
    output_dir: Path,
    orientation: Orientation,
    *,
    verbose: bool = False,
) -> tuple[Path, Path, Path, dict[str, object]]:
    if orientation not in ("direct", "mirror"):
        raise Balanced555GenerationError(f"invalid orientation: {orientation!r}")
    output_dir = Path(output_dir)
    if output_dir.exists() and not output_dir.is_dir():
        raise Balanced555GenerationError("output path is not a directory")
    output_dir.mkdir(parents=True, exist_ok=True)
    validate_encoding(orientation)
    clauses = clauses_for_orientation(orientation)
    cnf = dimacs_bytes(clauses)
    clause_ledger = clause_ledger_bytes(clauses)
    manifest = build_manifest(orientation, clauses, cnf, clause_ledger)
    cnf_path = output_dir / f"balanced555-{orientation}.cnf"
    ledger_path = output_dir / f"balanced555-{orientation}.clauses.jsonl"
    manifest_path = output_dir / f"balanced555-{orientation}.manifest.json"
    if cnf_path.exists() or ledger_path.exists() or manifest_path.exists():
        raise Balanced555GenerationError("refusing to replace existing output")
    cnf_path.write_bytes(cnf)
    ledger_path.write_bytes(clause_ledger)
    manifest_path.write_bytes(_canonical_json(manifest))
    if verbose:
        print(f"generated {cnf_path} ({len(clauses)} clauses)")
        print(f"clause ledger {ledger_path}")
        print(f"manifest {manifest_path}")
    return cnf_path, ledger_path, manifest_path, manifest


def generate_structural_positive_control(
    output_dir: Path,
    orientation: Orientation,
    *,
    verbose: bool = False,
) -> tuple[Path, Path, Path, dict[str, object]]:
    if orientation not in ("direct", "mirror"):
        raise Balanced555GenerationError(f"invalid orientation: {orientation!r}")
    output_dir = Path(output_dir)
    if output_dir.exists() and not output_dir.is_dir():
        raise Balanced555GenerationError("output path is not a directory")
    output_dir.mkdir(parents=True, exist_ok=True)
    clauses, assignment = structural_positive_control(orientation)
    cnf = dimacs_bytes(clauses)
    witness = _canonical_json({
        "schema": "p97_balanced555_structural_positive_witness.v1",
        "orientation": orientation,
        "true_variables": sorted(assignment),
    })
    manifest = {
        "schema": "p97_balanced555_structural_positive_control.v1",
        "orientation": orientation,
        "expected_status": "SAT",
        "variable_count": N_VARS,
        "clause_count": len(clauses),
        "excluded_families": ["kalmanson", "shared_alternation"],
        "cnf_sha256": hashlib.sha256(cnf).hexdigest(),
        "witness_sha256": hashlib.sha256(witness).hexdigest(),
    }
    stem = f"balanced555-{orientation}-structural-positive"
    cnf_path = output_dir / f"{stem}.cnf"
    witness_path = output_dir / f"{stem}.witness.json"
    manifest_path = output_dir / f"{stem}.manifest.json"
    if cnf_path.exists() or witness_path.exists() or manifest_path.exists():
        raise Balanced555GenerationError("refusing to replace existing output")
    cnf_path.write_bytes(cnf)
    witness_path.write_bytes(witness)
    manifest_path.write_bytes(_canonical_json(manifest))
    if verbose:
        print(f"generated positive control {cnf_path} ({len(clauses)} clauses)")
        print(f"witness {witness_path}")
        print(f"manifest {manifest_path}")
    return cnf_path, witness_path, manifest_path, manifest


def _main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orientation", choices=("direct", "mirror"), required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--kind", choices=("full", "structural-positive"), default="full")
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        if args.kind == "full":
            generate(args.output_dir, args.orientation, verbose=args.verbose)
        else:
            generate_structural_positive_control(
                args.output_dir,
                args.orientation,
                verbose=args.verbose,
            )
    except (Balanced555GenerationError, OSError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(_main())
