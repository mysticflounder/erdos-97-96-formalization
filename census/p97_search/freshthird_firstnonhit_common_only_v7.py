# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Source-current finite encoding of the reduced common-radius leaf.

The authenticated v6 CNF remains a byte-identical prefix.  V7 reindexes every
field of ``FirstNonHitCommonRadiusReducedFinitePayload`` representable in the
complete finite assignment, preserves the independent ``G`` selectors, and
finally selects the common-only leaf with the two historical unit literals.
The faithful six-center ``classAt``/``SelectedFourClass`` boundary is recorded
as omitted because that relation is absent from the assignment vocabulary.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from collections.abc import Sequence
from itertools import combinations, product
from pathlib import Path

import census.p97_search.freshthird_firstnonhit_common_payload_v6 as v6

SCHEMA = "p97-freshthird-firstnonhit-common-only-v7/cnf/v1"
MAP_SCHEMA = f"{SCHEMA}/map/v1"
MANIFEST_SCHEMA = f"{SCHEMA}/manifest/v1"
PROVENANCE_SCHEMA = f"{SCHEMA}/provenance/v1"
MIN_CARRIER_CARD = v6.MIN_CARRIER_CARD
PRODUCTION_N = 17

LEAN_COMMIT = "b03d793000eb85bda3f1bd6c4496510aeec3b42f"
INTERACTION_INGRESS_SOURCE_COMMIT = "c5d9861d991aae1e267c40f0c8daedfa2b9739d5"
SOURCE_TOTAL_CLAIM = False
PRODUCTION_LAUNCH_ENABLED = True
QUERY = v6.QUERY
BASE = v6.BASE
REDUCED_PAYLOAD_SOURCE_FILE = f"{BASE}FirstNonHitCommonRadiusReducedFinitePayload.lean"
INTERACTION_INGRESS_SOURCE_FILE = (
    f"{BASE}FirstNonHitCommonRadiusInteractionIngress.lean"
)
REDUCED_PAYLOAD_DECLARATION = "FirstNonHitCommonRadiusReducedFinitePayload"
REDUCED_PAYLOAD_SOURCE_CONSTRUCTOR = (
    "FirstNonHitCommonRadiusReducedFinitePayload.ofSource"
)
REDUCED_INGRESS_THEOREM = "freshThird_commonRadius_qReducedIngress"
SOURCE_HASHES = {
    **v6.SOURCE_HASHES,
    REDUCED_PAYLOAD_SOURCE_FILE: (
        "5885c746426b7d51a6dc620069c72458011d6c9f7bc653e89f164b9d808e732d"
    ),
    INTERACTION_INGRESS_SOURCE_FILE: (
        "492f40d96e90105c15141e7fd1ada7672ced502174beb0349bbb028f0d18f42b"
    ),
}
_REDUCED_SOURCE = (
    f"{REDUCED_PAYLOAD_DECLARATION}; constructor={REDUCED_PAYLOAD_SOURCE_CONSTRUCTOR}; "
    f"source={REDUCED_PAYLOAD_SOURCE_FILE}; "
    f"sha256={SOURCE_HASHES[REDUCED_PAYLOAD_SOURCE_FILE]}"
)
FAMILY_SOURCES = {
    **v6.FAMILY_SOURCES,
    "reduced_payload_source_pair": _REDUCED_SOURCE,
    "reduced_payload_interaction": _REDUCED_SOURCE,
    "reduced_payload_normalized_residual": _REDUCED_SOURCE,
    "reduced_payload_reduced_case": _REDUCED_SOURCE,
    "reduced_payload_exact_trace": _REDUCED_SOURCE,
    "reduced_payload_five_center_deletion": _REDUCED_SOURCE,
}
SIX_CENTER_OMISSION = (
    "FirstNonHitCommonRadiusMutualSixCenterDoubleNonHitIngress faithful "
    "SixCenterFaithfulCarrierBoundary classAt/SelectedFourClass component"
)
OMITTED_RELAXATIONS = (*v6.OMITTED_RELAXATIONS, SIX_CENTER_OMISSION)
PAYLOAD_FIELDS = v6.PAYLOAD_FIELDS
COMMON_SIDES = v6.COMMON_SIDES
RETAINED_ROLES = v6.RETAINED_ROLES
BLOCKER_REFERENCE_ROLES = v6.BLOCKER_REFERENCE_ROLES
APEX_ROLES = v6.APEX_ROLES
COMMON_GUARD_ROLE = v6.COMMON_GUARD_ROLE
LEGACY_COMMON_GUARD_ROLE = v6.LEGACY_COMMON_GUARD_ROLE
RETAINED_GUARD_ROLE = "hingress/retained"

PREDECESSOR_SCHEMA = v6.SCHEMA
PREDECESSOR_VARIABLES = 93_280
PREDECESSOR_CLAUSES = 606_898
PREDECESSOR_CNF_SHA256 = (
    "a520b6195e0337b629224835c51aa8a4e6b57088d898a32cc7318e71b0a6e403"
)
PREDECESSOR_SOURCE_SHA256 = (
    "317967139dfdca861a0e7c2eb28d572a98eab34ac44abe7818a42385613c7d76"
)

COMMON_GUARD_LITERAL = 93_212
RETAINED_FALSE_LITERAL = -90_537
EXPECTED_UNIT_LITERALS = (COMMON_GUARD_LITERAL, RETAINED_FALSE_LITERAL)
UNIT_FAMILY = "hingress"
UNIT_ROLES = (
    "hingress/common_only/common_radius_payload_true",
    "hingress/common_only/retained_false",
)

INTERACTION_ARMS = (
    "same_blocker",
    "source_omission",
    "different_caps",
    "same_cap",
)
NONHIT_ARMS = ("same_blocker", "source_omission")
NORMALIZED_RESIDUAL_ARMS = (
    "first_nonhit",
    "second_nonhit",
    "equal_cross_row_centers",
)
SOURCE_PAIR_ARMS = ("mutual_exact_trace", "one_sided_deletion")
REDUCED_CASE_ARMS = (
    "double_nonhit",
    "equal_cross_row_centers",
    "one_sided_deletion",
)
FIVE_CENTER_DELETION_ARMS = (
    "delete_first_one",
    "delete_second_one",
    "delete_first_two",
    "delete_second_two",
)
EXACT_TRACE_FIELDS = (
    "mutualMembership",
    "blockers_eq",
    "commonBlocker_firstCapInterior",
    "firstRow_firstCap_exactPair",
    "retainedSources_omitted",
)
REDUCED_PAYLOAD_FIELDS = (
    "common",
    "sourcePair",
    "interactionIngress.firstInteraction",
    "interactionIngress.secondInteraction",
    "interactionIngress.normalizedResidual",
    "reduced",
)

EncodingError = v6.EncodingError
VariableRecord = v6.VariableRecord
ClauseRecord = v6.ClauseRecord
Encoding = v6.Encoding
Bundle = v6.Bundle
v2 = v6.v2


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            sort_keys=True,
            separators=(",", ":"),
        )
        + "\n"
    ).encode()


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _dimacs(encoding: Encoding) -> bytes:
    return v6._dimacs(encoding)


class _DeltaBuilder:
    def __init__(self, base: Encoding) -> None:
        self.base = base
        self.variables = list(base.variables)
        self.clauses: list[ClauseRecord] = []
        self.role_to_id = {row.role: row.id for row in base.variables}

    def variable(self, role: str) -> int:
        if role in self.role_to_id:
            raise EncodingError(f"duplicate v7 variable role: {role}")
        identifier = len(self.variables) + 1
        self.variables.append(VariableRecord(identifier, role))
        self.role_to_id[role] = identifier
        return identifier

    def add(self, family: str, role: str, literals: Sequence[int]) -> ClauseRecord:
        if family not in FAMILY_SOURCES:
            raise EncodingError(f"unmapped v7 clause family: {family}")
        row = ClauseRecord(
            PREDECESSOR_CLAUSES + len(self.clauses) + 1,
            family,
            role,
            tuple(literals),
        )
        self.clauses.append(row)
        return row

    def guarded_choice(
        self,
        guard: int,
        family: str,
        scope: str,
        arms: Sequence[str],
    ) -> dict[str, int]:
        bits = {arm: self.variable(f"reduced_payload/{scope}/{arm}") for arm in arms}
        self.add(
            family,
            f"reduced_payload/{scope}/exhaustive",
            (-guard, *bits.values()),
        )
        for left, right in combinations(arms, 2):
            self.add(
                family,
                f"reduced_payload/{scope}/exclusive/{left}/{right}",
                (-guard, -bits[left], -bits[right]),
            )
        for arm, bit in bits.items():
            self.add(
                family,
                f"reduced_payload/{scope}/{arm}/guard",
                (-bit, guard),
            )
        return bits


def _role_bits(builder: _DeltaBuilder, role: str) -> list[int]:
    return [
        builder.role_to_id[f"role/{role}/{index}"] for index in range(builder.base.n)
    ]


def _common_source_bits(builder: _DeltaBuilder, side: str) -> list[int]:
    return [
        builder.role_to_id[f"common_source/{side}/{index}"]
        for index in range(builder.base.n)
    ]


def _common_blocker_bits(builder: _DeltaBuilder, side: str) -> list[int]:
    return [
        builder.role_to_id[f"common_blocker/{side}/{center}"]
        for center in range(builder.base.n)
    ]


def _encode_common_row_role_membership(
    builder: _DeltaBuilder,
    guard: int,
    side: str,
    point_role: str,
    truth: bool,
    family: str,
    scope: str,
) -> None:
    selectors = _common_source_bits(builder, side)
    points = _role_bits(builder, point_role)
    for source, point in product(range(builder.base.n), repeat=2):
        row = builder.role_to_id[f"row/{source}/{point}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/{source}/{point}",
            (-guard, -selectors[source], -points[point], row if truth else -row),
        )


def _encode_common_blocker_equal_named(
    builder: _DeltaBuilder,
    guard: int,
    side: str,
    named_role: str,
    family: str,
    scope: str,
) -> None:
    common = _common_blocker_bits(builder, side)
    named = [
        builder.role_to_id[f"named_blocker/{named_role}/{center}"]
        for center in range(builder.base.n)
    ]
    for center in range(builder.base.n):
        builder.add(
            family,
            f"reduced_payload/{scope}/{center}/lr",
            (-guard, -common[center], named[center]),
        )
        builder.add(
            family,
            f"reduced_payload/{scope}/{center}/rl",
            (-guard, common[center], -named[center]),
        )


def _encode_common_blockers_equal(
    builder: _DeltaBuilder,
    guard: int,
    family: str,
    scope: str,
) -> None:
    first = _common_blocker_bits(builder, "one")
    second = _common_blocker_bits(builder, "two")
    for center in range(builder.base.n):
        builder.add(
            family,
            f"reduced_payload/{scope}/{center}/lr",
            (-guard, -first[center], second[center]),
        )
        builder.add(
            family,
            f"reduced_payload/{scope}/{center}/rl",
            (-guard, first[center], -second[center]),
        )


def _encode_common_blocker_ne_named(
    builder: _DeltaBuilder,
    guard: int,
    side: str,
    named_role: str,
    family: str,
    scope: str,
) -> None:
    common = _common_blocker_bits(builder, side)
    for center in range(builder.base.n):
        named = builder.role_to_id[f"named_blocker/{named_role}/{center}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/{center}",
            (-guard, -common[center], -named),
        )


def _encode_same_blocker(
    builder: _DeltaBuilder,
    guard: int,
    side: str,
    family: str,
    scope: str,
) -> None:
    _encode_common_blocker_equal_named(
        builder, guard, side, v2.Q1, family, f"{scope}/blocker"
    )
    selectors = _common_source_bits(builder, side)
    for source, point in product(range(builder.base.n), repeat=2):
        row = builder.role_to_id[f"row/{source}/{point}"]
        fresh_row = builder.role_to_id[f"named_row/{v2.Q1}/{point}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/row/{source}/{point}/lr",
            (-guard, -selectors[source], -row, fresh_row),
        )
        builder.add(
            family,
            f"reduced_payload/{scope}/row/{source}/{point}/rl",
            (-guard, -selectors[source], row, -fresh_row),
        )


def _encode_has4_role_common_blocker(
    builder: _DeltaBuilder,
    guard: int,
    deleted_role: str,
    blocker_side: str,
    family: str,
    scope: str,
) -> None:
    deleted_bits = _role_bits(builder, deleted_role)
    blocker_bits = _common_blocker_bits(builder, blocker_side)
    for deleted, center in product(range(builder.base.n), repeat=2):
        has4 = builder.role_to_id[f"has4/{deleted}/{center}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/{deleted}/{center}",
            (-guard, -deleted_bits[deleted], -blocker_bits[center], has4),
        )


def _encode_source_omission(
    builder: _DeltaBuilder,
    guard: int,
    side: str,
    family: str,
    scope: str,
) -> None:
    choices = builder.guarded_choice(guard, family, f"{scope}/deleted", (v2.Q1, v2.Q2))
    for role, choice in choices.items():
        _encode_common_row_role_membership(
            builder, choice, side, role, False, family, f"{scope}/omits/{role}"
        )
        _encode_has4_role_common_blocker(
            builder,
            choice,
            role,
            side,
            family,
            f"{scope}/survives/{role}",
        )


def _encode_cross_row_hit(
    builder: _DeltaBuilder,
    guard: int,
    side: str,
    family: str,
    scope: str,
) -> None:
    _encode_common_blocker_ne_named(
        builder, guard, side, v2.Q1, family, f"{scope}/blocker_ne"
    )
    for role in (v2.Q1, v2.Q2):
        _encode_common_row_role_membership(
            builder, guard, side, role, True, family, f"{scope}/{role}_mem"
        )


def _encode_two_point_overlap(
    builder: _DeltaBuilder,
    guard: int,
    side: str,
    family: str,
    scope: str,
) -> None:
    _encode_cross_row_hit(builder, guard, side, family, f"{scope}/cross_hit")
    selectors = _common_source_bits(builder, side)
    q1 = _role_bits(builder, v2.Q1)
    q2 = _role_bits(builder, v2.Q2)
    for source, point in product(range(builder.base.n), repeat=2):
        row = builder.role_to_id[f"row/{source}/{point}"]
        fresh_row = builder.role_to_id[f"named_row/{v2.Q1}/{point}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/intersection/{source}/{point}",
            (
                -guard,
                -selectors[source],
                -row,
                -fresh_row,
                q1[point],
                q2[point],
            ),
        )
    for role in (v2.Q1, v2.Q2):
        bits = _role_bits(builder, role)
        for point in range(builder.base.n):
            fresh_row = builder.role_to_id[f"named_row/{v2.Q1}/{point}"]
            builder.add(
                family,
                f"reduced_payload/{scope}/fresh_row_contains/{role}/{point}",
                (-guard, -bits[point], fresh_row),
            )


def _encode_common_blocker_interior(
    builder: _DeltaBuilder,
    guard: int,
    side: str,
    cap: int,
    family: str,
    scope: str,
) -> None:
    blockers = _common_blocker_bits(builder, side)
    for center in range(builder.base.n):
        interior = builder.role_to_id[f"interior/{center}/{cap}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/{center}",
            (-guard, -blockers[center], interior),
        )


def _encode_interaction(
    builder: _DeltaBuilder,
    parent: int,
    side: str,
    family: str,
    scope: str,
) -> dict[str, int]:
    arms = builder.guarded_choice(parent, family, scope, INTERACTION_ARMS)
    _encode_same_blocker(
        builder, arms["same_blocker"], side, family, f"{scope}/same_blocker"
    )
    _encode_source_omission(
        builder,
        arms["source_omission"],
        side,
        family,
        f"{scope}/source_omission",
    )
    for arm in ("different_caps", "same_cap"):
        _encode_two_point_overlap(
            builder, arms[arm], side, family, f"{scope}/{arm}/common"
        )

    different_choices = builder.guarded_choice(
        arms["different_caps"],
        family,
        f"{scope}/different_caps/caps",
        tuple(
            f"{source_cap}_{fresh_cap}"
            for source_cap in range(3)
            for fresh_cap in range(3)
            if source_cap != fresh_cap
        ),
    )
    for label, choice in different_choices.items():
        source_cap, fresh_cap = (int(value) for value in label.split("_"))
        _encode_common_blocker_interior(
            builder,
            choice,
            side,
            source_cap,
            family,
            f"{scope}/different_caps/{label}/source",
        )
        fresh_interior = builder.role_to_id[f"blocker_interior/{v2.Q1}/{fresh_cap}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/different_caps/{label}/fresh",
            (-choice, fresh_interior),
        )

    same_choices = builder.guarded_choice(
        arms["same_cap"],
        family,
        f"{scope}/same_cap/cap",
        tuple(str(cap) for cap in range(3)),
    )
    for label, choice in same_choices.items():
        cap = int(label)
        _encode_common_blocker_interior(
            builder,
            choice,
            side,
            cap,
            family,
            f"{scope}/same_cap/{cap}/source",
        )
        fresh_interior = builder.role_to_id[f"blocker_interior/{v2.Q1}/{cap}"]
        fresh_one_cap = builder.role_to_id[f"named_cap/{v2.Q1}/{cap}"]
        fresh_two_cap = builder.role_to_id[f"named_cap/{v2.Q2}/{cap}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/same_cap/{cap}/fresh",
            (-choice, fresh_interior),
        )
        builder.add(
            family,
            f"reduced_payload/{scope}/same_cap/{cap}/endpoint",
            (-choice, fresh_one_cap, fresh_two_cap),
        )
    return arms


def _encode_nonhit(
    builder: _DeltaBuilder,
    parent: int,
    side: str,
    family: str,
    scope: str,
) -> dict[str, int]:
    arms = builder.guarded_choice(parent, family, scope, NONHIT_ARMS)
    _encode_same_blocker(
        builder, arms["same_blocker"], side, family, f"{scope}/same_blocker"
    )
    _encode_source_omission(
        builder,
        arms["source_omission"],
        side,
        family,
        f"{scope}/source_omission",
    )
    return arms


def _encode_exact_trace(
    builder: _DeltaBuilder,
    guard: int,
    family: str,
    scope: str,
) -> None:
    first = _common_source_bits(builder, "one")
    second = _common_source_bits(builder, "two")
    for first_source, second_source in product(range(builder.base.n), repeat=2):
        builder.add(
            family,
            f"reduced_payload/{scope}/mutual/one/{first_source}/{second_source}",
            (
                -guard,
                -first[first_source],
                -second[second_source],
                builder.role_to_id[f"row/{first_source}/{second_source}"],
            ),
        )
        builder.add(
            family,
            f"reduced_payload/{scope}/mutual/two/{first_source}/{second_source}",
            (
                -guard,
                -first[first_source],
                -second[second_source],
                builder.role_to_id[f"row/{second_source}/{first_source}"],
            ),
        )
    _encode_common_blockers_equal(builder, guard, family, f"{scope}/blockers_eq")
    _encode_common_blocker_interior(
        builder, guard, "one", 1, family, f"{scope}/blocker_first_cap"
    )
    for first_source, point in product(range(builder.base.n), repeat=2):
        row = builder.role_to_id[f"row/{first_source}/{point}"]
        cap = builder.role_to_id[f"cap/{point}/1"]
        builder.add(
            family,
            f"reduced_payload/{scope}/first_cap_pair/subset/{first_source}/{point}",
            (-guard, -first[first_source], -row, -cap, first[point], second[point]),
        )
        for side, bits in (("one", first), ("two", second)):
            builder.add(
                family,
                f"reduced_payload/{scope}/first_cap_pair/row/{side}/{first_source}/{point}",
                (-guard, -first[first_source], -bits[point], row),
            )
    for side, bits in (("one", first), ("two", second)):
        for point in range(builder.base.n):
            cap = builder.role_to_id[f"cap/{point}/1"]
            builder.add(
                family,
                f"reduced_payload/{scope}/first_cap_pair/cap/{side}/{point}",
                (-guard, -bits[point], cap),
            )
    for side, selectors in (("one", first), ("two", second)):
        for retained_role in RETAINED_ROLES:
            retained = _role_bits(builder, retained_role)
            for source, point in product(range(builder.base.n), repeat=2):
                row = builder.role_to_id[f"row/{source}/{point}"]
                builder.add(
                    family,
                    f"reduced_payload/{scope}/retained_omitted/{side}/"
                    f"{retained_role}/{source}/{point}",
                    (-guard, -selectors[source], -retained[point], -row),
                )


def _encode_has4_common_source_common_blocker(
    builder: _DeltaBuilder,
    guard: int,
    deleted_side: str,
    blocker_side: str,
    family: str,
    scope: str,
) -> None:
    deleted_bits = _common_source_bits(builder, deleted_side)
    blocker_bits = _common_blocker_bits(builder, blocker_side)
    for deleted, center in product(range(builder.base.n), repeat=2):
        has4 = builder.role_to_id[f"has4/{deleted}/{center}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/{deleted}/{center}",
            (-guard, -deleted_bits[deleted], -blocker_bits[center], has4),
        )


def _encode_one_sided_deletion(
    builder: _DeltaBuilder,
    guard: int,
    family: str,
    scope: str,
) -> None:
    orientations = builder.guarded_choice(
        guard,
        family,
        f"{scope}/orientation",
        ("delete_two_keep_one", "delete_one_keep_two"),
    )
    _encode_has4_common_source_common_blocker(
        builder,
        orientations["delete_two_keep_one"],
        "two",
        "one",
        family,
        f"{scope}/delete_two_keep_one",
    )
    _encode_has4_common_source_common_blocker(
        builder,
        orientations["delete_one_keep_two"],
        "one",
        "two",
        family,
        f"{scope}/delete_one_keep_two",
    )


def _encode_has4_role_role_center(
    builder: _DeltaBuilder,
    guard: int,
    deleted_role: str,
    center_role: str,
    family: str,
    scope: str,
) -> None:
    deleted_bits = _role_bits(builder, deleted_role)
    center_bits = _role_bits(builder, center_role)
    for deleted, center in product(range(builder.base.n), repeat=2):
        has4 = builder.role_to_id[f"has4/{deleted}/{center}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/{deleted}/{center}",
            (-guard, -deleted_bits[deleted], -center_bits[center], has4),
        )


def _encode_has4_role_named_blocker(
    builder: _DeltaBuilder,
    guard: int,
    deleted_role: str,
    source_role: str,
    family: str,
    scope: str,
) -> None:
    deleted_bits = _role_bits(builder, deleted_role)
    for deleted, center in product(range(builder.base.n), repeat=2):
        blocker = builder.role_to_id[f"named_blocker/{source_role}/{center}"]
        has4 = builder.role_to_id[f"has4/{deleted}/{center}"]
        builder.add(
            family,
            f"reduced_payload/{scope}/{deleted}/{center}",
            (-guard, -deleted_bits[deleted], -blocker, has4),
        )


def _encode_five_center_deletion(
    builder: _DeltaBuilder,
    guard: int,
    family: str,
    scope: str,
) -> dict[str, int]:
    arms = builder.guarded_choice(
        guard, family, f"{scope}/five_center", FIVE_CENTER_DELETION_ARMS
    )
    arm_roles = {
        "delete_first_one": (v2.P1, v2.R1),
        "delete_second_one": (v2.R1, v2.P1),
        "delete_first_two": (v2.P2, v2.R1),
        "delete_second_two": (v2.R2, v2.P1),
    }
    for arm, (deleted, other_source) in arm_roles.items():
        branch = arms[arm]
        _encode_has4_role_common_blocker(
            builder,
            branch,
            deleted,
            "one",
            family,
            f"{scope}/{arm}/common_blocker",
        )
        _encode_has4_role_role_center(
            builder,
            branch,
            deleted,
            v2.APEX,
            family,
            f"{scope}/{arm}/first_apex",
        )
        _encode_has4_role_named_blocker(
            builder,
            branch,
            deleted,
            other_source,
            family,
            f"{scope}/{arm}/other_blocker",
        )
        _encode_has4_role_role_center(
            builder,
            branch,
            deleted,
            "second_apex",
            family,
            f"{scope}/{arm}/second_apex",
        )
        _encode_has4_role_role_center(
            builder,
            branch,
            deleted,
            "surplus_apex",
            family,
            f"{scope}/{arm}/surplus_apex",
        )
    return arms


def _append_common_only_units(builder: _DeltaBuilder) -> None:
    common = builder.role_to_id.get(COMMON_GUARD_ROLE)
    retained = builder.role_to_id.get(RETAINED_GUARD_ROLE)
    if common != COMMON_GUARD_LITERAL or retained != abs(RETAINED_FALSE_LITERAL):
        raise EncodingError("authenticated v6 hinge-guard identifiers drifted")
    builder.add(UNIT_FAMILY, UNIT_ROLES[0], (common,))
    builder.add(UNIT_FAMILY, UNIT_ROLES[1], (-retained,))


def _build_delta(
    base: Encoding,
) -> tuple[tuple[VariableRecord, ...], tuple[ClauseRecord, ...]]:
    builder = _DeltaBuilder(base)
    common = builder.role_to_id[COMMON_GUARD_ROLE]

    source_pair = builder.guarded_choice(
        common,
        "reduced_payload_source_pair",
        "source_pair",
        SOURCE_PAIR_ARMS,
    )
    _encode_exact_trace(
        builder,
        source_pair["mutual_exact_trace"],
        "reduced_payload_exact_trace",
        "source_pair/mutual_exact_trace",
    )
    _encode_one_sided_deletion(
        builder,
        source_pair["one_sided_deletion"],
        "reduced_payload_source_pair",
        "source_pair/one_sided_deletion",
    )

    for side in COMMON_SIDES:
        _encode_interaction(
            builder,
            common,
            side,
            "reduced_payload_interaction",
            f"interaction/{side}",
        )

    residual = builder.guarded_choice(
        common,
        "reduced_payload_normalized_residual",
        "normalized_residual",
        NORMALIZED_RESIDUAL_ARMS,
    )
    _encode_nonhit(
        builder,
        residual["first_nonhit"],
        "one",
        "reduced_payload_normalized_residual",
        "normalized_residual/first_nonhit",
    )
    _encode_nonhit(
        builder,
        residual["second_nonhit"],
        "two",
        "reduced_payload_normalized_residual",
        "normalized_residual/second_nonhit",
    )
    _encode_cross_row_hit(
        builder,
        residual["equal_cross_row_centers"],
        "one",
        "reduced_payload_normalized_residual",
        "normalized_residual/equal_cross_row_centers/first_hit",
    )
    _encode_cross_row_hit(
        builder,
        residual["equal_cross_row_centers"],
        "two",
        "reduced_payload_normalized_residual",
        "normalized_residual/equal_cross_row_centers/second_hit",
    )
    _encode_common_blockers_equal(
        builder,
        residual["equal_cross_row_centers"],
        "reduced_payload_normalized_residual",
        "normalized_residual/equal_cross_row_centers/centers_eq",
    )

    reduced = builder.guarded_choice(
        common,
        "reduced_payload_reduced_case",
        "reduced_case",
        REDUCED_CASE_ARMS,
    )
    double = reduced["double_nonhit"]
    _encode_exact_trace(
        builder,
        double,
        "reduced_payload_exact_trace",
        "reduced_case/double_nonhit/exact_trace",
    )
    _encode_nonhit(
        builder,
        double,
        "one",
        "reduced_payload_reduced_case",
        "reduced_case/double_nonhit/first_nonhit",
    )
    _encode_nonhit(
        builder,
        double,
        "two",
        "reduced_payload_reduced_case",
        "reduced_case/double_nonhit/second_nonhit",
    )
    _encode_five_center_deletion(
        builder,
        double,
        "reduced_payload_five_center_deletion",
        "reduced_case/double_nonhit",
    )
    equal = reduced["equal_cross_row_centers"]
    _encode_cross_row_hit(
        builder,
        equal,
        "one",
        "reduced_payload_reduced_case",
        "reduced_case/equal_cross_row_centers/first_hit",
    )
    _encode_cross_row_hit(
        builder,
        equal,
        "two",
        "reduced_payload_reduced_case",
        "reduced_case/equal_cross_row_centers/second_hit",
    )
    _encode_common_blockers_equal(
        builder,
        equal,
        "reduced_payload_reduced_case",
        "reduced_case/equal_cross_row_centers/centers_eq",
    )
    _encode_one_sided_deletion(
        builder,
        reduced["one_sided_deletion"],
        "reduced_payload_reduced_case",
        "reduced_case/one_sided_deletion",
    )
    _append_common_only_units(builder)
    return (
        tuple(builder.variables[PREDECESSOR_VARIABLES:]),
        tuple(builder.clauses),
    )


def _expected_contract(base: Encoding) -> dict[str, object]:
    return {
        **base.semantic_contract,
        "predecessor": {
            "schema": PREDECESSOR_SCHEMA,
            "variables": PREDECESSOR_VARIABLES,
            "clauses": PREDECESSOR_CLAUSES,
            "cnf_sha256": PREDECESSOR_CNF_SHA256,
            "source_sha256": PREDECESSOR_SOURCE_SHA256,
        },
        "omitted_relaxations": list(OMITTED_RELAXATIONS),
        "hingress_arms": ["retained", "common_radius_payload"],
        "hingress_selected_leaf": "common_radius_payload",
        "common_only": {
            "common_guard_role": COMMON_GUARD_ROLE,
            "common_guard_literal": COMMON_GUARD_LITERAL,
            "common_guard_value": True,
            "retained_guard_role": RETAINED_GUARD_ROLE,
            "retained_guard_literal": RETAINED_FALSE_LITERAL,
            "retained_guard_value": False,
            "unit_clause_count": 2,
            "base_payload_field_count": len(PAYLOAD_FIELDS),
            "reduced_payload_fields": list(REDUCED_PAYLOAD_FIELDS),
            "source_pair_arms": list(SOURCE_PAIR_ARMS),
            "interaction_arms_per_side": list(INTERACTION_ARMS),
            "normalized_residual_arms": list(NORMALIZED_RESIDUAL_ARMS),
            "reduced_case_arms": list(REDUCED_CASE_ARMS),
            "exact_trace_fields": list(EXACT_TRACE_FIELDS),
            "double_nonhit_nonhit_arms": list(NONHIT_ARMS),
            "five_center_deletion_arms": list(FIVE_CENTER_DELETION_ARMS),
            "independent_g_surface": True,
            "identified_with_named_c": False,
            "duplicate_prop_witnesses_reused": True,
            "faithful_six_center_boundary_encoded": False,
            "faithful_six_center_boundary_omission": SIX_CENTER_OMISSION,
            "query_unchanged": True,
        },
    }


def _delta_document(encoding: Encoding) -> dict[str, object]:
    suffix = encoding.clauses[PREDECESSOR_CLAUSES:]
    family_counts = Counter(row.family for row in suffix)
    return {
        "schema": f"{SCHEMA}/delta/v1",
        "predecessor_schema": PREDECESSOR_SCHEMA,
        "predecessor_cnf_sha256": PREDECESSOR_CNF_SHA256,
        "total_added_variables": len(encoding.variables) - PREDECESSOR_VARIABLES,
        "total_added_clauses": len(suffix),
        "family_clause_counts": dict(sorted(family_counts.items())),
        "source_pair_arms": list(SOURCE_PAIR_ARMS),
        "interaction_arms_per_side": list(INTERACTION_ARMS),
        "normalized_residual_arms": list(NORMALIZED_RESIDUAL_ARMS),
        "reduced_case_arms": list(REDUCED_CASE_ARMS),
        "five_center_deletion_arms": list(FIVE_CENTER_DELETION_ARMS),
        "exact_trace_fields": list(EXACT_TRACE_FIELDS),
        "unit_literals": list(EXPECTED_UNIT_LITERALS),
        "unit_roles": list(UNIT_ROLES),
        "unit_family": UNIT_FAMILY,
        "query_unchanged": True,
        "faithful_six_center_boundary_encoded": False,
        "faithful_six_center_boundary_omission": SIX_CENTER_OMISSION,
        "ordering": (
            "source-pair split; both G-Q interactions; normalized residual; "
            "reduced case; common-only units"
        ),
    }


def _provenance_document(base: Encoding, encoding: Encoding) -> dict[str, object]:
    predecessor = v6._provenance_document(base)
    return {
        "schema": PROVENANCE_SCHEMA,
        "predecessor": predecessor,
        "predecessor_encoder_sha256": PREDECESSOR_SOURCE_SHA256,
        "reduced_payload_source": {
            "declaration": REDUCED_PAYLOAD_DECLARATION,
            "constructor": REDUCED_PAYLOAD_SOURCE_CONSTRUCTOR,
            "path": REDUCED_PAYLOAD_SOURCE_FILE,
            "source_commit": LEAN_COMMIT,
            "sha256": SOURCE_HASHES[REDUCED_PAYLOAD_SOURCE_FILE],
        },
        "source_theorem": {
            "declaration": REDUCED_INGRESS_THEOREM,
            "path": INTERACTION_INGRESS_SOURCE_FILE,
            "source_commit": INTERACTION_INGRESS_SOURCE_COMMIT,
            "sha256": SOURCE_HASHES[INTERACTION_INGRESS_SOURCE_FILE],
        },
        "new_variable_range": {
            "first_id": PREDECESSOR_VARIABLES + 1,
            "last_id": len(encoding.variables),
            "role_prefix": "reduced_payload/",
        },
        "clause_delta": _delta_document(encoding),
        "clause_family_sources": dict(sorted(FAMILY_SOURCES.items())),
        "query_unchanged_from_v6": True,
        "independence_boundary": {
            "producer_surface": "G.surface",
            "named_surface": "C",
            "identified": False,
            "canonical_selector_mentions_in_delta": 0,
        },
        "omitted_unrepresentable_source_field": {
            "source_type": "SixCenterFaithfulCarrierBoundary",
            "missing_relations": ["classAt", "SelectedFourClass"],
            "reason": "FirstNonHitSourceTotalFiniteAssignment has neither relation",
            "encoded": False,
        },
        "source_revision_boundary": {
            "payload_projection_commit": LEAN_COMMIT,
            "interaction_ingress_commit": INTERACTION_INGRESS_SOURCE_COMMIT,
            "repository_head_claimed": False,
            "target_files_authenticated_unchanged": True,
            "policy": (
                "authenticate pinned target bytes; a later descendant repository "
                "HEAD is not relabeled as the source revision"
            ),
        },
    }


def run_encoding_controls() -> None:
    v6.run_encoding_controls()
    if EXPECTED_UNIT_LITERALS != (93_212, -90_537):
        raise EncodingError("v7 unit literal contract drift")
    if UNIT_FAMILY not in FAMILY_SOURCES:
        raise EncodingError("v7 source family contract drift")
    if set(FAMILY_SOURCES) - set(v6.FAMILY_SOURCES) != {
        "reduced_payload_source_pair",
        "reduced_payload_interaction",
        "reduced_payload_normalized_residual",
        "reduced_payload_reduced_case",
        "reduced_payload_exact_trace",
        "reduced_payload_five_center_deletion",
    }:
        raise EncodingError("v7 reduced-payload source family inventory drift")
    if SIX_CENTER_OMISSION not in OMITTED_RELAXATIONS:
        raise EncodingError("v7 faithful six-center omission is not recorded")


def encode(n: int) -> Encoding:
    """Return exact v6 plus the reduced finite payload and common-only units."""

    base = v6.encode(n)
    if (
        len(base.variables) != PREDECESSOR_VARIABLES
        or len(base.clauses) != PREDECESSOR_CLAUSES
        or _sha256(_dimacs(base)) != PREDECESSOR_CNF_SHA256
    ):
        raise EncodingError("authenticated v6 predecessor drift")
    new_variables, delta = _build_delta(base)
    result = Encoding(
        base.n,
        base.variables + new_variables,
        base.clauses + delta,
        _expected_contract(base),
    )
    _validate_semantic_encoding(result, base)
    return result


def _validate_semantic_encoding(encoding: Encoding, base: Encoding) -> None:
    expected_variables, expected_delta = _build_delta(base)
    if encoding.variables != base.variables + expected_variables:
        raise EncodingError("v7 reduced-payload variable inventory drift")
    if encoding.clauses[:PREDECESSOR_CLAUSES] != base.clauses:
        raise EncodingError("v6 clause prefix changed")
    if encoding.clauses[PREDECESSOR_CLAUSES:] != expected_delta:
        raise EncodingError("v7 reduced-payload clause delta drift")
    units = expected_delta[-2:]
    if tuple(row.literals[0] for row in units) != EXPECTED_UNIT_LITERALS:
        raise EncodingError("v7 unit literal polarity drift")
    if any(row.family != UNIT_FAMILY for row in units):
        raise EncodingError("v7 unit source family drift")
    if tuple(row.role for row in units) != UNIT_ROLES:
        raise EncodingError("v7 common-only unit role drift")
    if encoding.semantic_contract != _expected_contract(base):
        raise EncodingError("v7 semantic contract drift")
    canonical_ids = {
        next(row.id for row in encoding.variables if row.role == f"role/{role}/{index}")
        for role in (v2.C1, v2.C2)
        for index in range(encoding.n)
    }
    if any(
        canonical_ids.intersection(abs(literal) for literal in row.literals)
        for row in expected_delta[:-2]
    ):
        raise EncodingError("v7 reduced payload aliases the named C surface")
    if any(row.family not in FAMILY_SOURCES for row in encoding.clauses):
        raise EncodingError("v7 clause family lacks a source binding")
    if encoding.semantic_contract["omitted_relaxations"] != list(OMITTED_RELAXATIONS):
        raise EncodingError("v7 omission inventory drift")
    if [row.id for row in encoding.clauses] != list(
        range(1, len(encoding.clauses) + 1)
    ):
        raise EncodingError("v7 clause identifiers are not contiguous")
    if len({row.role for row in encoding.clauses}) != len(encoding.clauses):
        raise EncodingError("v7 clause roles are not unique")


def validate_semantic_encoding(encoding: Encoding) -> None:
    if type(encoding.n) is not int or encoding.n != PRODUCTION_N:
        raise EncodingError("v7 supports only the authenticated n=17 predecessor")
    base = v6.encode(encoding.n)
    if _sha256(_dimacs(base)) != PREDECESSOR_CNF_SHA256:
        raise EncodingError("v6 predecessor replay digest mismatch")
    _validate_semantic_encoding(encoding, base)


def source_snapshot() -> dict[str, object]:
    rows = []
    root = Path(__file__).resolve().parents[2]
    for path, expected in sorted(SOURCE_HASHES.items()):
        data = v2._read_source_without_links(root, path)
        actual = _sha256(data)
        if actual != expected:
            raise EncodingError(f"source drift for {path}: {actual} != {expected}")
        rows.append({"path": path, "sha256": actual, "size": len(data)})
    return {
        "schema": f"{SCHEMA}/sources/v1",
        "commit": LEAN_COMMIT,
        "files": rows,
        "target_file_revisions": {
            REDUCED_PAYLOAD_SOURCE_FILE: LEAN_COMMIT,
            INTERACTION_INGRESS_SOURCE_FILE: INTERACTION_INGRESS_SOURCE_COMMIT,
        },
        "revision_policy": (
            "pinned target bytes are authenticated unchanged; current repository "
            "HEAD is not asserted to be the source revision"
        ),
    }


def _map_document(encoding: Encoding, base: Encoding) -> dict[str, object]:
    return {
        "schema": MAP_SCHEMA,
        "n": encoding.n,
        "variables": [{"id": row.id, "role": row.role} for row in encoding.variables],
        "clauses": [
            {
                "id": row.id,
                "family": row.family,
                "role": row.role,
                "literals": list(row.literals),
            }
            for row in encoding.clauses
        ],
        "provenance": _provenance_document(base, encoding),
        "semantic_contract": encoding.semantic_contract,
    }


def emit_bundle(n: int = PRODUCTION_N) -> Bundle:
    run_encoding_controls()
    encoding = encode(n)
    base = v6.encode(n)
    cnf = _dimacs(encoding)
    variable_map = _canonical_json(_map_document(encoding, base))
    sources = _canonical_json(source_snapshot())
    family_counts = Counter(row.family for row in encoding.clauses)
    manifest = {
        "schema": MANIFEST_SCHEMA,
        "n": encoding.n,
        "lean_commit": LEAN_COMMIT,
        "source_total": SOURCE_TOTAL_CLAIM,
        "launch_enabled": PRODUCTION_LAUNCH_ENABLED,
        "solver_run": False,
        "solver_verdict": None,
        "generic_cardinality_lift": False,
        "finite_encoding_emitted": True,
        "query_is_separate_assumption": True,
        "query": QUERY,
        "query_unchanged_from_predecessor": True,
        "omitted_relaxations": list(OMITTED_RELAXATIONS),
        "variables": len(encoding.variables),
        "clauses": len(encoding.clauses),
        "family_clause_counts": dict(sorted(family_counts.items())),
        "predecessor": encoding.semantic_contract["predecessor"],
        "clause_delta": _delta_document(encoding),
        "common_payload_field_count": len(PAYLOAD_FIELDS),
        "common_payload_complete": True,
        "common_payload_active": True,
        "retained_active": False,
        "common_surface_identified_with_c": False,
        "reduced_payload_source": REDUCED_PAYLOAD_DECLARATION,
        "reduced_payload_source_theorem": REDUCED_INGRESS_THEOREM,
        "reduced_payload_fields": list(REDUCED_PAYLOAD_FIELDS),
        "reduced_payload_complete_for_finite_assignment": True,
        "faithful_six_center_boundary_encoded": False,
        "faithful_six_center_boundary_omission": SIX_CENTER_OMISSION,
        "cnf_sha256": _sha256(cnf),
        "map_sha256": _sha256(variable_map),
        "sources_sha256": _sha256(sources),
    }
    manifest["manifest_sha256"] = _sha256(_canonical_json(manifest))
    bundle = Bundle(cnf, variable_map, sources, _canonical_json(manifest))
    validate_bundle(bundle)
    return bundle


def _strict_json(data: bytes, description: str) -> dict[str, object]:
    return v6._strict_json(data, description)


def validate_bundle(bundle: Bundle) -> dict[str, object]:
    manifest = _strict_json(bundle.manifest, "manifest")
    variable_map = _strict_json(bundle.variable_map, "map")
    sources = _strict_json(bundle.sources, "sources")
    for value, data in (
        (manifest, bundle.manifest),
        (variable_map, bundle.variable_map),
        (sources, bundle.sources),
    ):
        if _canonical_json(value) != data:
            raise EncodingError("bundle JSON is not canonical")
    if manifest.get("schema") != MANIFEST_SCHEMA:
        raise EncodingError("manifest schema drift")
    if variable_map.get("schema") != MAP_SCHEMA:
        raise EncodingError("map schema drift")
    if sources != source_snapshot() or manifest.get("lean_commit") != LEAN_COMMIT:
        raise EncodingError("source snapshot/commit binding drift")
    if manifest.get("source_total") is not False:
        raise EncodingError("source_total must remain false")
    if manifest.get("launch_enabled") is not PRODUCTION_LAUNCH_ENABLED:
        raise EncodingError("emitter launch gate drift")
    if (
        manifest.get("solver_run") is not False
        or manifest.get("solver_verdict") is not None
    ):
        raise EncodingError("emitter manifest falsely reports a solver run")
    if manifest.get("query_is_separate_assumption") is not True:
        raise EncodingError("query must remain a separate assumption")
    if (
        manifest.get("query") != QUERY
        or manifest.get("query_unchanged_from_predecessor") is not True
    ):
        raise EncodingError("query predecessor binding drift")
    if manifest.get("common_payload_active") is not True:
        raise EncodingError("common-only guard metadata drift")
    if manifest.get("retained_active") is not False:
        raise EncodingError("retained-false metadata drift")
    if manifest.get("common_surface_identified_with_c") is not False:
        raise EncodingError("independent G-surface metadata drift")
    if manifest.get("reduced_payload_source") != REDUCED_PAYLOAD_DECLARATION:
        raise EncodingError("reduced-payload source binding drift")
    if manifest.get("reduced_payload_source_theorem") != REDUCED_INGRESS_THEOREM:
        raise EncodingError("reduced-payload source theorem binding drift")
    if manifest.get("reduced_payload_fields") != list(REDUCED_PAYLOAD_FIELDS):
        raise EncodingError("reduced-payload field inventory drift")
    if manifest.get("reduced_payload_complete_for_finite_assignment") is not True:
        raise EncodingError("finite-assignment completeness metadata drift")
    if manifest.get("faithful_six_center_boundary_encoded") is not False:
        raise EncodingError("six-center omission metadata drift")
    if manifest.get("faithful_six_center_boundary_omission") != SIX_CENTER_OMISSION:
        raise EncodingError("six-center omission explanation drift")
    if manifest.get("cnf_sha256") != _sha256(bundle.cnf):
        raise EncodingError("CNF digest mismatch")
    if manifest.get("map_sha256") != _sha256(bundle.variable_map):
        raise EncodingError("map digest mismatch")
    if manifest.get("sources_sha256") != _sha256(bundle.sources):
        raise EncodingError("sources digest mismatch")
    unsigned = dict(manifest)
    digest = unsigned.pop("manifest_sha256", None)
    if digest != _sha256(_canonical_json(unsigned)):
        raise EncodingError("manifest self-hash mismatch")

    lines = bundle.cnf.decode("ascii").splitlines()
    expected_variables = manifest.get("variables")
    expected_clauses = manifest.get("clauses")
    if type(expected_variables) is not int or type(expected_clauses) is not int:
        raise EncodingError("manifest counts must be integers")
    if not lines or lines[0] != f"p cnf {expected_variables} {expected_clauses}":
        raise EncodingError("DIMACS header drift")
    parsed: list[tuple[int, ...]] = []
    for line in lines[1:]:
        values = [int(value) for value in line.split()]
        if not values or values[-1] != 0 or 0 in values[:-1]:
            raise EncodingError("malformed DIMACS clause")
        if any(abs(value) > expected_variables for value in values[:-1]):
            raise EncodingError("DIMACS literal out of range")
        parsed.append(tuple(values[:-1]))
    if len(parsed) != expected_clauses:
        raise EncodingError("DIMACS clause count mismatch")

    map_variables = variable_map.get("variables")
    map_clauses = variable_map.get("clauses")
    if type(map_variables) is not list or type(map_clauses) is not list:
        raise EncodingError("map rows must be lists")
    variables = tuple(
        VariableRecord(row["id"], row["role"])
        for row in map_variables
        if type(row) is dict and set(row) == {"id", "role"}
    )
    clauses = tuple(
        ClauseRecord(row["id"], row["family"], row["role"], literals)
        for row, literals in zip(map_clauses, parsed, strict=True)
        if type(row) is dict
        and set(row) == {"id", "family", "role", "literals"}
        and row.get("literals") == list(literals)
    )
    contract = variable_map.get("semantic_contract")
    if (
        len(variables) != expected_variables
        or len(clauses) != expected_clauses
        or type(contract) is not dict
    ):
        raise EncodingError("map rows do not replay CNF")
    encoding = Encoding(PRODUCTION_N, variables, clauses, contract)
    validate_semantic_encoding(encoding)
    base = v6.encode(PRODUCTION_N)
    if variable_map.get("provenance") != _provenance_document(base, encoding):
        raise EncodingError("provenance drift")
    if manifest.get("family_clause_counts") != dict(
        sorted(Counter(row.family for row in clauses).items())
    ):
        raise EncodingError("family clause counts do not replay")
    if manifest.get("clause_delta") != _delta_document(encoding):
        raise EncodingError("clause delta manifest drift")
    if manifest.get("variables") != len(variables):
        raise EncodingError("manifest variable count drift")
    if manifest.get("clauses") != len(clauses):
        raise EncodingError("manifest clause count drift")
    return manifest


def write_bundle(bundle: Bundle, output_dir: Path) -> tuple[Path, ...]:
    validate_bundle(bundle)
    output_dir.mkdir(parents=True, exist_ok=True)
    artifacts = (
        (output_dir / "problem.cnf", bundle.cnf),
        (output_dir / "problem.map.json", bundle.variable_map),
        (output_dir / "problem.sources.json", bundle.sources),
        (output_dir / "problem.manifest.json", bundle.manifest),
    )
    for path, data in artifacts:
        v2._write_exact(path, data)
    return tuple(path for path, _data in artifacts)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=PRODUCTION_N)
    parser.add_argument("--output-dir", type=Path)
    args = parser.parse_args(argv)
    bundle = emit_bundle(args.n)
    manifest = validate_bundle(bundle)
    if args.output_dir is not None:
        write_bundle(bundle, args.output_dir)
    print(json.dumps(manifest, allow_nan=False, sort_keys=True, separators=(",", ":")))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
