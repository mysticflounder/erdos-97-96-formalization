"""Deterministic candidate-class surface for the card-12--14 AHEAD lane.

This is the permanent, cardinality-generic port of the per-center admissibility
layer from ``scratch/census-12-gate/census12_lib.py``.  It encodes only:

* the labeled cap profile and its three distinguished Moser vertices;
* the full one-hit restriction at each Moser center; and
* the three post-SUB2 PROVEN cuts frozen by :mod:`census.card_head.run_manifest`.

The order-free ``s <= 2`` cut drops classes with at least three same-cap
interior members.  It deliberately does not encode or decide the convex-order
position of an ``s = 2`` class.  Enumerating this finite surface is not a
geometric closure theorem.
"""

from __future__ import annotations

import argparse
import json
from collections.abc import Collection, Mapping, Sequence
from dataclasses import dataclass
from itertools import combinations
from math import factorial
from typing import Any

from .profiles import labeled_cap_profiles
from .run_manifest import CUT_CONTRACT, PROOF_TIER, cut_contract_sha256


U, V, W = 0, 1, 2
MOSER = frozenset({U, V, W})
ROLE_ORDER = ("U", "V", "W", "S_INTERIOR", "O1_INTERIOR", "O2_INTERIOR")
FIXTURE_SCHEMA = "p97_ahead_candidate_count_fixtures.v1"
FIXTURE_SCOPE = (
    "Exhaustive per-center class counts within the labeled finite card-head "
    "admissibility abstraction; not a geometric closure theorem"
)


class CandidateSurfaceError(ValueError):
    """Raised when a profile or candidate-count fixture violates the contract."""


@dataclass(frozen=True)
class CapHeadModel:
    """One labeled cap profile with deterministic point labels."""

    cardinality: int
    profile: tuple[int, int, int]
    caps: tuple[frozenset[int], frozenset[int], frozenset[int]]
    interiors: tuple[tuple[int, ...], tuple[int, ...], tuple[int, ...]]

    def role_centers(self) -> tuple[tuple[str, tuple[int, ...]], ...]:
        return (
            ("U", (U,)),
            ("V", (V,)),
            ("W", (W,)),
            ("S_INTERIOR", self.interiors[0]),
            ("O1_INTERIOR", self.interiors[1]),
            ("O2_INTERIOR", self.interiors[2]),
        )

    def own_cap_interior(self, point: int) -> frozenset[int]:
        if point in MOSER or not 0 <= point < self.cardinality:
            raise CandidateSurfaceError("own-cap interior is defined only off MOSER")
        for interior in self.interiors:
            if point in interior:
                return frozenset(interior) - {point}
        raise AssertionError("validated model omitted a non-Moser point")


def build_model(cardinality: int, profile: Sequence[int]) -> CapHeadModel:
    """Build the deterministic point/cap layout for one authorized profile."""

    normalized = tuple(profile)
    if len(normalized) != 3 or normalized not in labeled_cap_profiles(cardinality):
        raise CandidateSurfaceError("profile is not authorized at this cardinality")

    interior_sizes = tuple(size - 2 for size in normalized)
    cursor = 3
    blocks: list[tuple[int, ...]] = []
    for size in interior_sizes:
        blocks.append(tuple(range(cursor, cursor + size)))
        cursor += size
    if cursor != cardinality:
        raise AssertionError("profile arithmetic did not consume every point")

    s_interior, o1_interior, o2_interior = blocks
    caps = (
        frozenset((V, W, *s_interior)),
        frozenset((U, W, *o1_interior)),
        frozenset((U, V, *o2_interior)),
    )
    model = CapHeadModel(
        cardinality=cardinality,
        profile=normalized,
        caps=caps,
        interiors=(s_interior, o1_interior, o2_interior),
    )
    _validate_model(model)
    return model


def _validate_model(model: CapHeadModel) -> None:
    if tuple(map(len, model.caps)) != model.profile:
        raise AssertionError("cap sizes do not match the profile")
    if model.caps[0] & model.caps[1] != {W}:
        raise AssertionError("S/O1 intersection must be the W vertex")
    if model.caps[0] & model.caps[2] != {V}:
        raise AssertionError("S/O2 intersection must be the V vertex")
    if model.caps[1] & model.caps[2] != {U}:
        raise AssertionError("O1/O2 intersection must be the U vertex")
    if set().union(*model.caps) != set(range(model.cardinality)):
        raise AssertionError("caps must cover exactly the model's point set")


def full_one_hit_ok(
    model: CapHeadModel, center: int, candidate: Collection[int]
) -> bool:
    """Check the full one-hit condition at a distinguished Moser center."""

    if center not in MOSER:
        return True
    chosen = frozenset(candidate)
    for cap in model.caps:
        if center in cap and len(chosen & (cap - {center})) > 1:
            return False
    return True


def candidate_class_ok(
    model: CapHeadModel, center: int, candidate: Collection[int]
) -> bool:
    """Check C1, full one-hit, and the frozen post-SUB2 PROVEN cuts."""

    chosen = frozenset(candidate)
    if not 0 <= center < model.cardinality:
        return False
    if len(chosen) != 4 or center in chosen:
        return False
    if not chosen <= set(range(model.cardinality)):
        return False
    if not full_one_hit_ok(model, center, chosen):
        return False
    if center in MOSER:
        return True

    moser_count = len(chosen & MOSER)
    same_cap_count = len(chosen & model.own_cap_interior(center))
    if moser_count > 2:
        return False
    if moser_count >= 2 and same_cap_count >= 1:
        return False
    if same_cap_count > 2:
        return False
    return True


def candidate_classes(
    model: CapHeadModel, center: int
) -> tuple[tuple[int, int, int, int], ...]:
    """Enumerate every admissible four-point class at ``center``."""

    if not 0 <= center < model.cardinality:
        raise CandidateSurfaceError("center is outside the model")
    others = (point for point in range(model.cardinality) if point != center)
    return tuple(
        candidate
        for candidate in combinations(others, 4)
        if candidate_class_ok(model, center, candidate)
    )


def cube_ok(model: CapHeadModel, cube: Mapping[int, Collection[int]]) -> bool:
    """Independently check C1/C2/C4 and every per-center admissibility rule."""

    if set(cube) != set(range(model.cardinality)):
        return False
    normalized: dict[int, frozenset[int]] = {}
    pair_counts: dict[tuple[int, int], int] = {}
    for center in range(model.cardinality):
        candidate = frozenset(cube[center])
        if not candidate_class_ok(model, center, candidate):
            return False
        normalized[center] = candidate
        for pair in combinations(sorted(candidate), 2):
            pair_counts[pair] = pair_counts.get(pair, 0) + 1
            if pair_counts[pair] > 2:
                return False
    return all(
        len(normalized[first] & normalized[second]) <= 2
        for first, second in combinations(range(model.cardinality), 2)
    )


def role_candidate_counts(model: CapHeadModel) -> dict[str, int]:
    """Return the common candidate count for every symmetry role."""

    result: dict[str, int] = {}
    for role, centers in model.role_centers():
        counts = {len(candidate_classes(model, center)) for center in centers}
        if len(counts) != 1:
            raise AssertionError(f"candidate count is not constant on role {role}")
        result[role] = counts.pop()
    return result


def profile_candidate_fixture(model: CapHeadModel) -> dict[str, Any]:
    """Return the canonical candidate-count fixture for one model."""

    role_counts = role_candidate_counts(model)
    multiplicities = {
        role: len(centers) for role, centers in model.role_centers()
    }
    return {
        "cardinality": model.cardinality,
        "profile": list(model.profile),
        "interior_sizes": [len(interior) for interior in model.interiors],
        "automorphism_count": factorial(len(model.interiors[0]))
        * factorial(len(model.interiors[1]))
        * factorial(len(model.interiors[2])),
        "role_multiplicities": multiplicities,
        "role_candidate_counts": role_counts,
        "candidate_total": sum(
            multiplicities[role] * role_counts[role] for role in ROLE_ORDER
        ),
    }


def candidate_count_fixture_document(
    cardinalities: Sequence[int] = (12, 13, 14),
) -> dict[str, Any]:
    """Generate the exact fixture document for the requested cardinalities."""

    profiles = [
        profile_candidate_fixture(build_model(cardinality, profile))
        for cardinality in cardinalities
        for profile in labeled_cap_profiles(cardinality)
    ]
    return {
        "schema": FIXTURE_SCHEMA,
        "proof_tier": PROOF_TIER,
        "cut_contract": CUT_CONTRACT,
        "cut_contract_sha256": cut_contract_sha256(),
        "scope": FIXTURE_SCOPE,
        "profiles": profiles,
    }


def validate_candidate_count_fixtures(value: Mapping[str, Any]) -> dict[str, Any]:
    """Require byte-semantic equality with the generated 12--14 fixture set."""

    expected = candidate_count_fixture_document()
    normalized = json.loads(json.dumps(value, sort_keys=True))
    if normalized != expected:
        raise CandidateSurfaceError(
            "candidate-count fixtures differ from the generated 12--14 surface"
        )
    return normalized


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n-min", type=int, default=12)
    parser.add_argument("--n-max", type=int, default=14)
    args = parser.parse_args()
    if args.n_min > args.n_max:
        parser.error("--n-min must not exceed --n-max")
    document = candidate_count_fixture_document(
        tuple(range(args.n_min, args.n_max + 1))
    )
    print(json.dumps(document, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
