#!/usr/bin/env python3
"""Finite, solver-free surface for the ATAIL shared-radius producer.

The surface fixes the three surviving cap profiles and keeps the cap roles
explicit.  It distinguishes a *full* exact apex-radius class, which may have
cardinality five, from a selected four-point witness contained in that class.

This module intentionally contains no coordinate variables and invokes no
solver.  Its target-facing contribution is the exact finite negation of the
desired off-surplus shared-radius pair: two full apex classes may have at most
one common off-surplus label.
"""
from __future__ import annotations

import json
import math
from dataclasses import asdict, dataclass, is_dataclass
from itertools import combinations
from typing import Any, Iterator, Literal, Mapping, Sequence

from census.multi_center import multi_center_census as mc


SCHEMA = "p97_atail_force_producer_surface.v1"
ApexRole = Literal["opp_apex1", "opp_apex2"]


class ProducerSurfaceError(ValueError):
    """A case or finite assignment violates the producer-surface contract."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise ProducerSurfaceError(message)


@dataclass(frozen=True)
class CapRoles:
    """The theorem-facing roles of the three named Moser caps."""

    surplus: str
    second_large: str
    remaining: str

    def as_dict(self) -> dict[str, str]:
        return asdict(self)


@dataclass(frozen=True)
class ProducerCase:
    """One role-aware finite profile surviving the cardinality reduction."""

    case_id: str
    cardinality: int
    profile: tuple[int, int, int]
    cap_roles: CapRoles
    opp_apex1: int
    opp_apex2: int
    opp_apex1_exact_sizes: tuple[int, ...]
    opp_apex2_exact_sizes: tuple[int, ...]

    def exact_sizes(self, role: ApexRole) -> tuple[int, ...]:
        if role == "opp_apex1":
            return self.opp_apex1_exact_sizes
        if role == "opp_apex2":
            return self.opp_apex2_exact_sizes
        raise ProducerSurfaceError(f"unknown apex role {role!r}")

    def apex(self, role: ApexRole) -> int:
        if role == "opp_apex1":
            return self.opp_apex1
        if role == "opp_apex2":
            return self.opp_apex2
        raise ProducerSurfaceError(f"unknown apex role {role!r}")

    def as_dict(self) -> dict[str, Any]:
        return {
            "case_id": self.case_id,
            "cardinality": self.cardinality,
            "profile": list(self.profile),
            "cap_roles": self.cap_roles.as_dict(),
            "opposite_apices": {
                "opp_apex1": self.opp_apex1,
                "opp_apex2": self.opp_apex2,
            },
            "exact_class_sizes": {
                "opp_apex1": list(self.opp_apex1_exact_sizes),
                "opp_apex2": list(self.opp_apex2_exact_sizes),
            },
        }


@dataclass(frozen=True)
class ExactApexClass:
    """The complete carrier intersection with one positive-radius circle."""

    role: ApexRole
    center: int
    support: tuple[int, ...]

    def as_dict(self) -> dict[str, Any]:
        return {
            "role": self.role,
            "center": self.center,
            "support": list(self.support),
            "cardinality": len(self.support),
            "full_exact_radius_class": True,
        }


@dataclass(frozen=True)
class SelectedFourWitness:
    """A four-point K4 witness selected inside one full exact class."""

    role: ApexRole
    center: int
    support: tuple[int, ...]

    def as_dict(self) -> dict[str, Any]:
        return {
            "role": self.role,
            "center": self.center,
            "support": list(self.support),
            "cardinality": 4,
            "full_exact_radius_class": False,
        }


@dataclass(frozen=True)
class ApexClassAssignment:
    """Full apex classes together with their separately chosen K4 witnesses."""

    opp_apex1_exact: ExactApexClass
    opp_apex2_exact: ExactApexClass
    opp_apex1_selected_four: SelectedFourWitness
    opp_apex2_selected_four: SelectedFourWitness

    def as_dict(self) -> dict[str, Any]:
        return {
            "exact_classes": {
                "opp_apex1": self.opp_apex1_exact.as_dict(),
                "opp_apex2": self.opp_apex2_exact.as_dict(),
            },
            "selected_four_witnesses": {
                "opp_apex1": self.opp_apex1_selected_four.as_dict(),
                "opp_apex2": self.opp_apex2_selected_four.as_dict(),
            },
        }


@dataclass(frozen=True)
class NegatedProducerPairClause:
    """One pairwise clause in the finite negation of the producer."""

    pair: tuple[int, int]
    same_first_apex_radius: bool
    same_second_apex_radius: bool
    satisfied: bool

    def as_dict(self) -> dict[str, Any]:
        return {
            "pair": list(self.pair),
            "same_first_apex_radius": self.same_first_apex_radius,
            "same_second_apex_radius": self.same_second_apex_radius,
            "satisfied": self.satisfied,
        }


@dataclass(frozen=True)
class NoSharedOffSurplusPairNegation:
    """All off-surplus label-pair clauses negating the desired conclusion."""

    case_id: str
    off_surplus_labels: tuple[int, ...]
    clauses: tuple[NegatedProducerPairClause, ...]
    holds: bool

    def as_dict(self) -> dict[str, Any]:
        return {
            "case_id": self.case_id,
            "off_surplus_labels": list(self.off_surplus_labels),
            "clause_count": len(self.clauses),
            "clauses": [clause.as_dict() for clause in self.clauses],
            "holds": self.holds,
        }


# The label gauge is the canonical one from `multi_center_census`: the closed
# surplus cap S has endpoints 1 and 2.  Unequal cap sizes remain oriented;
# `(6,5,4)` is not silently sorted to the historical `(4,5,6)` spelling.
PRODUCER_CASES: tuple[ProducerCase, ...] = (
    ProducerCase(
        case_id="card11_profile_554",
        cardinality=11,
        profile=(5, 5, 4),
        cap_roles=CapRoles("S", "O1", "O2"),
        opp_apex1=1,
        opp_apex2=2,
        opp_apex1_exact_sizes=(5,),
        opp_apex2_exact_sizes=(4,),
    ),
    ProducerCase(
        case_id="card12_profile_654",
        cardinality=12,
        profile=(6, 5, 4),
        cap_roles=CapRoles("S", "O1", "O2"),
        opp_apex1=1,
        opp_apex2=2,
        opp_apex1_exact_sizes=(5,),
        opp_apex2_exact_sizes=(4,),
    ),
    ProducerCase(
        case_id="card12_profile_555",
        cardinality=12,
        profile=(5, 5, 5),
        cap_roles=CapRoles("S", "O1", "O2"),
        opp_apex1=1,
        opp_apex2=2,
        opp_apex1_exact_sizes=(5,),
        opp_apex2_exact_sizes=(4, 5),
    ),
)


ENCODED_LEDGER: tuple[str, ...] = (
    "three explicit role-aware surviving cases: card11 (5,5,4), card12 (6,5,4), and card12 (5,5,5)",
    "canonical labeled Moser-cap frame and closed surplus-cap complement",
    "full exact first- and second-apex radius classes with allowed cardinalities four or five",
    "selected four-point K4 witnesses represented separately as subsets of the full exact classes",
    "finite negation of the producer on every unordered pair of distinct "
    "off-surplus carrier labels",
    "deterministic enumeration and canonical JSON serialization",
)

OMITTED_LEDGER: tuple[str, ...] = (
    "Euclidean coordinates and squared-distance equality or disequality constraints",
    "strict convexity, global cyclic orientation, cap-side signs, MEC disk "
    "containment, and nonobtuseness",
    "global K4 witnesses away from the two opposite apices",
    "CriticalShellSystem blocker choices, deletion failure, and same-center shell provenance",
    "U1LargeCapRouteBTailLiveData, localized no-q-free, fixed-triple, and "
    "supplied five-row provenance",
    "a complete finite translation of no-M44 beyond the already-derived profile list",
    "a Lean extraction theorem from the live leaf to this labeled surface",
    "any SAT, SMT, CAS, numerical, or Lean proof execution",
)


def case_by_id(case_id: str) -> ProducerCase:
    matches = [case for case in PRODUCER_CASES if case.case_id == case_id]
    _require(len(matches) == 1, f"unknown or duplicate producer case {case_id!r}")
    return matches[0]


def frame_for_case(case: ProducerCase) -> mc.Frame:
    """Build and validate the canonical finite carrier for one case."""

    _validate_case(case)
    frame = mc.build_frame(case.profile)
    _require(frame.n == case.cardinality, f"{case.case_id}: frame cardinality drift")
    return frame


def closed_cap(frame: mc.Frame, cap: str) -> frozenset[int]:
    _require(cap in mc.CAPS, f"unknown cap {cap!r}")
    return getattr(frame, cap)


def off_surplus_labels(case: ProducerCase) -> tuple[int, ...]:
    frame = frame_for_case(case)
    surplus = closed_cap(frame, case.cap_roles.surplus)
    return tuple(label for label in range(frame.n) if label not in surplus)


def _validate_case(case: ProducerCase) -> None:
    roles = (
        case.cap_roles.surplus,
        case.cap_roles.second_large,
        case.cap_roles.remaining,
    )
    _require(set(roles) == set(mc.CAPS), f"{case.case_id}: cap roles are not a partition")
    _require(
        sum(case.profile) == case.cardinality + 3,
        f"{case.case_id}: cap profile does not have the Moser overlap sum",
    )
    profile_sizes = dict(zip(mc.CAPS, case.profile))
    _require(
        profile_sizes[case.cap_roles.surplus] >= 5,
        f"{case.case_id}: surplus cap is not large",
    )
    _require(
        profile_sizes[case.cap_roles.second_large] >= 5,
        f"{case.case_id}: second-large cap is not large",
    )
    expected_apices = mc.CAP_VERTS[case.cap_roles.surplus]
    _require(
        frozenset((case.opp_apex1, case.opp_apex2)) == expected_apices,
        f"{case.case_id}: opposite apices are not the surplus-cap endpoints",
    )
    _require(case.opp_apex1 != case.opp_apex2, f"{case.case_id}: apex labels coincide")
    for role in ("opp_apex1", "opp_apex2"):
        sizes = case.exact_sizes(role)
        _require(bool(sizes), f"{case.case_id}: {role} has no allowed exact size")
        _require(tuple(sorted(set(sizes))) == sizes, f"{case.case_id}: noncanonical sizes")
        _require(all(size in (4, 5) for size in sizes), f"{case.case_id}: bad exact size")


def _validate_support(
    *, case: ProducerCase, center: int, support: Sequence[int], context: str
) -> None:
    frame = frame_for_case(case)
    _require(tuple(sorted(set(support))) == tuple(support), f"{context}: support is not canonical")
    _require(all(0 <= point < frame.n for point in support), f"{context}: label outside frame")
    _require(center not in support, f"{context}: positive-radius class contains its center")


def validate_exact_apex_class(case: ProducerCase, exact: ExactApexClass) -> None:
    context = f"{case.case_id}/{exact.role}/exact"
    _require(exact.center == case.apex(exact.role), f"{context}: wrong center")
    _validate_support(case=case, center=exact.center, support=exact.support, context=context)
    _require(
        len(exact.support) in case.exact_sizes(exact.role),
        f"{context}: cardinality {len(exact.support)} is not allowed",
    )


def validate_selected_four_witness(
    case: ProducerCase,
    exact: ExactApexClass,
    selected: SelectedFourWitness,
) -> None:
    validate_exact_apex_class(case, exact)
    context = f"{case.case_id}/{selected.role}/selected-four"
    _require(selected.role == exact.role, f"{context}: role does not match exact class")
    _require(selected.center == exact.center, f"{context}: center does not match exact class")
    _validate_support(
        case=case, center=selected.center, support=selected.support, context=context
    )
    _require(len(selected.support) == 4, f"{context}: witness does not have four points")
    _require(
        set(selected.support) <= set(exact.support),
        f"{context}: witness is not contained in the full exact class",
    )


def validate_assignment(case: ProducerCase, assignment: ApexClassAssignment) -> None:
    _require(
        assignment.opp_apex1_exact.role == "opp_apex1"
        and assignment.opp_apex2_exact.role == "opp_apex2",
        f"{case.case_id}: exact classes are attached to the wrong apex roles",
    )
    validate_selected_four_witness(
        case, assignment.opp_apex1_exact, assignment.opp_apex1_selected_four
    )
    validate_selected_four_witness(
        case, assignment.opp_apex2_exact, assignment.opp_apex2_selected_four
    )


def shared_off_surplus_labels(
    case: ProducerCase, assignment: ApexClassAssignment
) -> tuple[int, ...]:
    validate_assignment(case, assignment)
    off = set(off_surplus_labels(case))
    return tuple(
        sorted(
            off
            & set(assignment.opp_apex1_exact.support)
            & set(assignment.opp_apex2_exact.support)
        )
    )


def shared_off_surplus_pairs(
    case: ProducerCase, assignment: ApexClassAssignment
) -> tuple[tuple[int, int], ...]:
    return tuple(combinations(shared_off_surplus_labels(case, assignment), 2))


def no_shared_off_surplus_pair(
    case: ProducerCase, assignment: ApexClassAssignment
) -> bool:
    """Whether the exact finite negation of the producer conclusion holds."""

    return not shared_off_surplus_pairs(case, assignment)


def encode_no_shared_off_surplus_pair_negation(
    case: ProducerCase, assignment: ApexClassAssignment
) -> NoSharedOffSurplusPairNegation:
    """Materialize every pair clause in the negated producer.

    For off-surplus labels ``x != y``, the clause is satisfied exactly when
    the pair is not simultaneously contained in both full apex classes.
    """

    validate_assignment(case, assignment)
    first = set(assignment.opp_apex1_exact.support)
    second = set(assignment.opp_apex2_exact.support)
    off = off_surplus_labels(case)
    clauses = []
    for pair in combinations(off, 2):
        first_same = pair[0] in first and pair[1] in first
        second_same = pair[0] in second and pair[1] in second
        clauses.append(
            NegatedProducerPairClause(
                pair=pair,
                same_first_apex_radius=first_same,
                same_second_apex_radius=second_same,
                satisfied=not (first_same and second_same),
            )
        )
    result = NoSharedOffSurplusPairNegation(
        case_id=case.case_id,
        off_surplus_labels=off,
        clauses=tuple(clauses),
        holds=all(clause.satisfied for clause in clauses),
    )
    _require(
        result.holds == no_shared_off_surplus_pair(case, assignment),
        f"{case.case_id}: pair-clause encoding disagrees with intersection check",
    )
    return result


def iter_exact_apex_classes(
    case: ProducerCase, role: ApexRole
) -> Iterator[ExactApexClass]:
    """Enumerate all full exact-class supports allowed by one case and role."""

    frame = frame_for_case(case)
    center = case.apex(role)
    available = tuple(label for label in range(frame.n) if label != center)
    for size in case.exact_sizes(role):
        for support in combinations(available, size):
            yield ExactApexClass(role=role, center=center, support=support)


def iter_selected_four_witnesses(
    exact: ExactApexClass,
) -> Iterator[SelectedFourWitness]:
    """Enumerate every four-subset separately selectable from a full class."""

    for support in combinations(exact.support, 4):
        yield SelectedFourWitness(
            role=exact.role,
            center=exact.center,
            support=support,
        )


def _case_surface_counts(case: ProducerCase) -> dict[str, Any]:
    frame = frame_for_case(case)

    def counts(role: ApexRole) -> tuple[int, int]:
        exact_count = sum(math.comb(frame.n - 1, size) for size in case.exact_sizes(role))
        with_witness = sum(
            math.comb(frame.n - 1, size) * math.comb(size, 4)
            for size in case.exact_sizes(role)
        )
        return exact_count, with_witness

    first_exact, first_with_witness = counts("opp_apex1")
    second_exact, second_with_witness = counts("opp_apex2")
    off_count = len(off_surplus_labels(case))
    return {
        "carrier_labels": frame.n,
        "closed_caps": {
            cap: sorted(closed_cap(frame, cap)) for cap in mc.CAPS
        },
        "cap_interiors": {cap: list(frame.ints[cap]) for cap in mc.CAPS},
        "off_surplus_labels": list(off_surplus_labels(case)),
        "exact_class_support_counts": {
            "opp_apex1": first_exact,
            "opp_apex2": second_exact,
        },
        "exact_class_with_selected_four_counts": {
            "opp_apex1": first_with_witness,
            "opp_apex2": second_with_witness,
        },
        "raw_apex_assignment_count_before_target_negation": (
            first_with_witness * second_with_witness
        ),
        "negated_producer_pair_clause_count": math.comb(off_count, 2),
    }


def build_surface_document() -> dict[str, Any]:
    """Return the deterministic, solver-free producer-surface manifest."""

    case_ids = [case.case_id for case in PRODUCER_CASES]
    _require(len(case_ids) == len(set(case_ids)), "duplicate producer case id")
    return {
        "schema": SCHEMA,
        "epistemic_status": "FINITE_COMBINATORIAL_SURFACE_ONLY_NO_SOLVER_RUN",
        "cases": [
            {**case.as_dict(), "surface_counts": _case_surface_counts(case)}
            for case in PRODUCER_CASES
        ],
        "ledger": {
            "ENCODED": list(ENCODED_LEDGER),
            "OMITTED": list(OMITTED_LEDGER),
        },
        "scope": {
            "solver_invoked": False,
            "coordinates_encoded": False,
            "producer_negation_encoded": True,
            "full_exact_classes_distinct_from_selected_four": True,
            "lean_proof_claim": False,
        },
    }


def _canonical_value(value: Any) -> Any:
    if hasattr(value, "as_dict"):
        return _canonical_value(value.as_dict())
    if is_dataclass(value):
        return _canonical_value(asdict(value))
    if isinstance(value, Mapping):
        return {
            str(key): _canonical_value(item)
            for key, item in sorted(value.items(), key=lambda pair: str(pair[0]))
        }
    if isinstance(value, (tuple, list)):
        return [_canonical_value(item) for item in value]
    if isinstance(value, (set, frozenset)):
        return [_canonical_value(item) for item in sorted(value)]
    return value


def canonical_json(value: Any) -> str:
    """Canonical human-readable JSON used by manifests and checkpoints."""

    return json.dumps(_canonical_value(value), indent=2, sort_keys=True) + "\n"


if __name__ == "__main__":
    print(canonical_json(build_surface_document()), end="")
