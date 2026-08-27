"""Strict pre-solver packets for the diagnostic Rigid221 card-18 slice.

The live Lean ingress assumes ``18 <= D.A.card``.  This module validates only
an artificial exact-18 diagnostic packet and deliberately exposes no solver,
certificate, proof, or promotion interface.
"""

from __future__ import annotations

import hashlib
import json
import re
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Final, NoReturn

SCHEMA: Final = "p97-rigid221-card18-source-packet/v1"

XV_DELETION_MISSING_INCIDENCE: Final = "XV_DELETION_MISSING_INCIDENCE"
U_DELETION_MISSING_INCIDENCE: Final = "U_DELETION_MISSING_INCIDENCE"
BI_SURVIVAL_COMMON_DELETION_RECTANGLE: Final = (
    "BI_SURVIVAL_COMMON_DELETION_RECTANGLE"
)
ARMS: Final = frozenset(
    {
        XV_DELETION_MISSING_INCIDENCE,
        U_DELETION_MISSING_INCIDENCE,
        BI_SURVIVAL_COMMON_DELETION_RECTANGLE,
    }
)

DIAGNOSTIC_SCOPE: Final = "DIAGNOSTIC_EXACT_N18"
EVIDENCE_CLASS: Final = "THEOREM_DISCOVERY_ONLY"
INTRINSIC_GUARD: Final = "INTRINSIC"
PAIR_PRODUCER_GUARD: Final = "NEUTRAL_LARGE_PAIR_PRODUCER"

SOURCE_PATH: Final = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "Rigid221SourceHeavy.lean"
)
SOURCE_MODULE: Final = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy"
)
SOURCE_REVISION: Final = "2866ed1e153594c4db0fed88544612ca3cd2c723"
SOURCE_SHA256: Final = (
    "c5e46308208ac2ae75fdf7e6a21db18fd03825af7f44bed7f3f47ffc630b542b"
)
CONTEXT_TYPE: Final = "ExactFourRigid221PhysicalApexSourceEqUContext"
SOURCE_HEAVY_PACKET_TYPE: Final = (
    "ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket"
)
BLOCKER_V_PARENT_TYPE: Final = "ExactFourRigid221PentagonBlockerVResidual"
COORDINATOR_THEOREM: Final = (
    "false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_"
    "pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_"
    "card_ge_eighteen"
)
LARGE_PAIR_PRODUCER_THEOREM: Final = (
    "pentagonOffClassBlocker_largeCard_threeColor_pair_neutral"
)
BI_RECTANGLE_PRODUCER_THEOREM: Final = (
    "pentagonOffClassBlocker_biSurvival_commonDeletionRectangle_neutral"
)

_ARM_LEAF_THEOREMS: Final = {
    XV_DELETION_MISSING_INCIDENCE: (
        "false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_"
        "pentagonBlockerV_card_ge_eighteen_xvDeletion_missingIncidence"
    ),
    U_DELETION_MISSING_INCIDENCE: (
        "false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_"
        "pentagonBlockerV_card_ge_eighteen_uDeletion_missingIncidence"
    ),
    BI_SURVIVAL_COMMON_DELETION_RECTANGLE: (
        "false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_"
        "pentagonBlockerV_card_ge_eighteen_"
        "biSurvival_commonDeletionRectangle"
    ),
}

_CROSSED_CONFIG: Final = {
    XV_DELETION_MISSING_INCIDENCE: {
        "deletion_role": "xv",
        "actual_blocker_role": "v",
        "common_member_role": "u",
        "row_producer": (
            "pentagonOffClassBlocker_xvDeletion_"
            "threeExactRows_common_u_neutral"
        ),
        "consumer": (
            "pentagonOffClassBlocker_xvDeletion_"
            "false_of_tetrahedron_incidences_neutral"
        ),
    },
    U_DELETION_MISSING_INCIDENCE: {
        "deletion_role": "u",
        "actual_blocker_role": "xv",
        "common_member_role": "xv",
        "row_producer": (
            "pentagonOffClassBlocker_uDeletion_"
            "threeExactRows_common_xv_neutral"
        ),
        "consumer": (
            "pentagonOffClassBlocker_uDeletion_"
            "false_of_tetrahedron_incidences_neutral"
        ),
    },
}

_ROLE_NAMES: Final = (
    "u",
    "v",
    "xu",
    "xv",
    "deleted",
    "opp_apex_2",
    "source_1",
    "source_2",
    "deleted_center",
    "actual_center_1",
    "actual_center_2",
)

_BLOCKER_V_ATTESTATIONS: Final = (
    "hsecond",
    "hxuA",
    "hxvA",
    "huXvRow",
    "huNotXuRow",
    "hxvNotXuRow",
    "hdeletedXuRow",
    "hvDeletedRow",
    "huNotDeletedRow",
    "hxuNotDeletedRow",
    "hxvNotDeletedRow",
    "hclassFive",
    "hxvInterior",
    "hblockerInterior",
    "hblockerEqV",
    "htraceBound",
    "htraceBoundXu",
)

_ROOT_KEYS: Final = frozenset(
    {
        "schema",
        "packet_id",
        "claim_boundary",
        "source_boundary",
        "carrier",
        "roles",
        "blocker_v_parent",
        "live_parent_facts",
        "source_pair",
        "arm",
        "deletion_profile",
        "arm_payload",
    }
)
_PACKET_ID = re.compile(r"[a-z0-9][a-z0-9._-]{0,127}\Z")
_CARRIER_LABEL = re.compile(r"[A-Za-z][A-Za-z0-9_.-]{0,63}\Z")


class SourcePacketError(ValueError):
    """The Card18 source-packet contract failed closed."""


PacketValidationError = SourcePacketError


def _fail(message: str) -> NoReturn:
    raise SourcePacketError(message)


def _exact_dict(
    value: object, expected: frozenset[str], path: str
) -> dict[str, Any]:
    if type(value) is not dict:
        _fail(f"{path} must be a builtin JSON object")
    if any(type(key) is not str for key in value):
        _fail(f"{path} keys must be builtin strings")
    keys = set(value)
    if keys != expected:
        missing = sorted(expected - keys)
        extra = sorted(keys - expected)
        _fail(f"{path} keys drifted: missing={missing}, extra={extra}")
    return value


def _exact_list(value: object, length: int, path: str) -> list[Any]:
    if type(value) is not list or len(value) != length:
        _fail(f"{path} must be a builtin list of length {length}")
    return value


def _expect_literal(value: object, expected: object, path: str) -> None:
    if type(value) is not type(expected) or value != expected:
        _fail(f"{path} must be {expected!r}")


def _exact_record(
    value: object, expected: Mapping[str, object], path: str
) -> dict[str, Any]:
    record = _exact_dict(value, frozenset(expected), path)
    for key, expected_value in expected.items():
        _expect_literal(record[key], expected_value, f"{path}.{key}")
    return record


def _require_string(value: object, path: str) -> str:
    if type(value) is not str or not value:
        _fail(f"{path} must be a nonempty builtin string")
    return value


def _require_role(
    value: object, expected: str, roles: Mapping[str, str], path: str
) -> None:
    role = _require_string(value, path)
    if role not in roles:
        _fail(f"{path} is a dangling role reference: {role!r}")
    if role != expected:
        _fail(f"{path} must reference role {expected!r}, got {role!r}")


def _reject_constant(value: str) -> NoReturn:
    _fail(f"non-finite JSON constant is forbidden: {value}")


def _object_without_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            _fail(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def canonical_json_bytes(value: object) -> bytes:
    """Return the repository's compact, sorted-key UTF-8 JSON encoding."""

    if isinstance(value, ValidatedPacket):
        return value.canonical_bytes
    try:
        return json.dumps(
            value,
            ensure_ascii=False,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError, UnicodeError, RecursionError) as exc:
        raise SourcePacketError("value is not finite canonical JSON") from exc


def parse_strict_json(payload: bytes) -> Any:
    """Parse duplicate-free JSON and require its byte-canonical spelling."""

    if type(payload) is not bytes:
        _fail("packet payload must be immutable bytes")
    try:
        value = json.loads(
            payload,
            object_pairs_hook=_object_without_duplicates,
            parse_constant=_reject_constant,
        )
    except SourcePacketError:
        raise
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise SourcePacketError("packet payload is not strict JSON") from exc
    if canonical_json_bytes(value) != payload:
        _fail("packet payload is not canonical JSON")
    return value


def expected_deletion_profile(arm: str) -> dict[str, dict[str, str]]:
    """Return a detached copy of the unique total profile for ``arm``."""

    if arm == XV_DELETION_MISSING_INCIDENCE:
        return {
            "u": {"source_1": "FAILS", "source_2": "FAILS"},
            "xv": {"source_1": "SURVIVES", "source_2": "SURVIVES"},
        }
    if arm == U_DELETION_MISSING_INCIDENCE:
        return {
            "u": {"source_1": "SURVIVES", "source_2": "SURVIVES"},
            "xv": {"source_1": "FAILS", "source_2": "FAILS"},
        }
    if arm == BI_SURVIVAL_COMMON_DELETION_RECTANGLE:
        return {
            "u": {"source_1": "SURVIVES", "source_2": "SURVIVES"},
            "xv": {"source_1": "SURVIVES", "source_2": "SURVIVES"},
        }
    _fail(f"unknown Card18 arm: {arm!r}")


def classify_deletion_profile(value: object) -> str:
    """Classify one total four-cell profile; partial/unknown data fails."""

    profile = _exact_dict(value, frozenset({"u", "xv"}), "deletion outcomes")
    for deletion in ("u", "xv"):
        row = _exact_dict(
            profile[deletion],
            frozenset({"source_1", "source_2"}),
            f"deletion outcomes.{deletion}",
        )
        for source in ("source_1", "source_2"):
            status = row[source]
            if type(status) is not str or status not in {"SURVIVES", "FAILS"}:
                _fail(
                    f"deletion outcomes.{deletion}.{source} must be total "
                    "SURVIVES/FAILS data"
                )
    matches = [arm for arm in ARMS if profile == expected_deletion_profile(arm)]
    if len(matches) != 1:
        _fail("deletion outcomes do not select exactly one Card18 arm")
    return matches[0]


def _validate_claim_boundary(value: object) -> None:
    _exact_record(
        value,
        {
            "scope": DIAGNOSTIC_SCOPE,
            "evidence_class": EVIDENCE_CLASS,
            "full_source_faithful_model": False,
            "finite_ingress_proved": False,
            "coverage_lift_proved": False,
        },
        "claim_boundary",
    )


def _validate_source_boundary(value: object, arm: str) -> None:
    expected = {
        "source_path": SOURCE_PATH,
        "source_module": SOURCE_MODULE,
        "repository_revision": SOURCE_REVISION,
        "source_sha256": SOURCE_SHA256,
        "context_type": CONTEXT_TYPE,
        "source_heavy_packet_type": SOURCE_HEAVY_PACKET_TYPE,
        "coordinator_theorem": COORDINATOR_THEOREM,
        "large_pair_producer_theorem": LARGE_PAIR_PRODUCER_THEOREM,
        "arm_leaf_theorem": _ARM_LEAF_THEOREMS[arm],
    }
    boundary = _exact_dict(
        value,
        frozenset(expected),
        "source_boundary",
    )
    for key, expected_value in expected.items():
        _expect_literal(boundary[key], expected_value, f"source_boundary.{key}")


def _validate_carrier(value: object) -> set[str]:
    carrier = _exact_dict(
        value,
        frozenset(
            {"materialization_guard", "scope", "exact_cardinality", "labels"}
        ),
        "carrier",
    )
    _expect_literal(
        carrier["materialization_guard"], INTRINSIC_GUARD, "carrier guard"
    )
    _expect_literal(carrier["scope"], DIAGNOSTIC_SCOPE, "carrier.scope")
    _expect_literal(carrier["exact_cardinality"], 18, "carrier.exact_cardinality")
    labels = _exact_list(carrier["labels"], 18, "carrier.labels")
    for index, label in enumerate(labels):
        if type(label) is not str or _CARRIER_LABEL.fullmatch(label) is None:
            _fail(f"carrier.labels[{index}] is not a valid carrier label")
    if len(set(labels)) != 18:
        _fail("carrier.labels must contain exactly 18 unique labels")
    if labels != sorted(labels):
        _fail("carrier.labels must be in canonical lexicographic order")
    return set(labels)


def _validate_roles(value: object, carrier: set[str]) -> dict[str, str]:
    wrapper = _exact_dict(
        value,
        frozenset({"materialization_guard", "bindings"}),
        "roles",
    )
    _expect_literal(
        wrapper["materialization_guard"], INTRINSIC_GUARD, "roles guard"
    )
    roles = _exact_dict(wrapper["bindings"], frozenset(_ROLE_NAMES), "roles.bindings")
    for role, label in roles.items():
        label = _require_string(label, f"roles.bindings.{role}")
        if label not in carrier:
            _fail(f"roles.bindings.{role} references non-carrier label {label!r}")
    for left, right, reason in (
        ("u", "xv", "deletion endpoints"),
        ("source_1", "source_2", "outside-row sources"),
        ("actual_center_1", "actual_center_2", "actual centers"),
    ):
        if roles[left] == roles[right]:
            _fail(f"{reason} must resolve to distinct carrier labels")
    physical_five = tuple(roles[role] for role in ("u", "xu", "v", "xv", "deleted"))
    if len(set(physical_five)) != 5:
        _fail("u, xu, v, xv, and deleted must be five distinct physical roles")
    if roles["opp_apex_2"] in physical_five:
        _fail("opp_apex_2 cannot alias a positive-radius physical-class role")
    for source_role in ("source_1", "source_2"):
        if roles[source_role] in {roles["u"], roles["xv"]}:
            _fail(f"{source_role} cannot alias a point contained in the xv row")
    return roles


def _validate_blocker_v_parent(value: object) -> None:
    parent = _exact_dict(
        value,
        frozenset(
            {"materialization_guard", "lean_binder", "lean_type", "attestations"}
        ),
        "blocker_v_parent",
    )
    _expect_literal(
        parent["materialization_guard"],
        INTRINSIC_GUARD,
        "blocker_v_parent guard",
    )
    _expect_literal(parent["lean_binder"], "_Q", "blocker_v_parent.lean_binder")
    _expect_literal(
        parent["lean_type"], BLOCKER_V_PARENT_TYPE, "blocker_v_parent.lean_type"
    )
    attestations = _exact_dict(
        parent["attestations"],
        frozenset(_BLOCKER_V_ATTESTATIONS),
        "blocker_v_parent.attestations",
    )
    for name, attested in attestations.items():
        _expect_literal(
            attested, True, f"blocker_v_parent.attestations.{name}"
        )


def _validate_live_parent_facts(
    value: object, roles: Mapping[str, str]
) -> None:
    facts = _exact_dict(
        value,
        frozenset(
            {
                "materialization_guard",
                "center_v_equals_deleted",
                "deleted_center_in_opposite_cap_interior",
                "deleted_center_off_opposite_class",
                "next_row_physical_hits",
                "cardinality",
            }
        ),
        "live_parent_facts",
    )
    _expect_literal(
        facts["materialization_guard"], INTRINSIC_GUARD, "live parent guard"
    )
    _exact_record(
        facts["center_v_equals_deleted"],
        {
            "lean_binder": "_hcenterV",
            "source_role": "v",
            "center_role": "deleted",
            "attested": True,
        },
        "live_parent_facts.center_v_equals_deleted",
    )
    _exact_record(
        facts["deleted_center_in_opposite_cap_interior"],
        {
            "lean_binder": "_hcenterDeletedInterior",
            "center_role": "deleted_center",
            "cap_center_role": "opp_apex_2",
            "attested": True,
        },
        "live_parent_facts.deleted_center_in_opposite_cap_interior",
    )
    _exact_record(
        facts["deleted_center_off_opposite_class"],
        {
            "lean_binder": "_hcenterDeletedOffClass",
            "center_role": "deleted_center",
            "class_center_role": "opp_apex_2",
            "attested": True,
        },
        "live_parent_facts.deleted_center_off_opposite_class",
    )
    _exact_record(
        facts["next_row_physical_hits"],
        {
            "lean_binder": "_hnextRowPhysicalHits",
            "row_source_role": "deleted_center",
            "class_center_role": "opp_apex_2",
            "relation": "CARDINALITY_AT_MOST",
            "bound": 1,
            "attested": True,
        },
        "live_parent_facts.next_row_physical_hits",
    )
    _exact_record(
        facts["cardinality"],
        {
            "lean_binder": "_hcard",
            "live_relation": "CARDINALITY_AT_LEAST",
            "live_bound": 18,
            "diagnostic_exact_cardinality": 18,
            "attested": True,
        },
        "live_parent_facts.cardinality",
    )
    # The expected records above are role references, not free labels.
    for role in ("v", "deleted", "deleted_center", "opp_apex_2"):
        if role not in roles:
            _fail(f"live_parent_facts has dangling role {role!r}")


def _validate_source_pair(value: object, roles: Mapping[str, str]) -> None:
    pair = _exact_dict(
        value,
        frozenset(
            {
                "materialization_guard",
                "producer_theorem",
                "center_constructor",
                "sources",
            }
        ),
        "source_pair",
    )
    _expect_literal(
        pair["materialization_guard"],
        PAIR_PRODUCER_GUARD,
        "source_pair guard",
    )
    _expect_literal(
        pair["producer_theorem"],
        LARGE_PAIR_PRODUCER_THEOREM,
        "source_pair.producer_theorem",
    )
    _expect_literal(
        pair["center_constructor"],
        "lateFirstApexSystem.centerAt",
        "source_pair.center_constructor",
    )
    sources = _exact_list(pair["sources"], 2, "source_pair.sources")
    for index, source in enumerate(sources, 1):
        source_role = f"source_{index}"
        center_role = f"actual_center_{index}"
        row = _exact_dict(
            source,
            frozenset(
                {
                    "source_role",
                    "actual_center_role",
                    "center_kind",
                    "outside_row_role",
                    "outside_xv_row",
                }
            ),
            f"source_pair.sources[{index - 1}]",
        )
        _require_role(
            row["source_role"],
            source_role,
            roles,
            f"source_pair.sources[{index - 1}].source_role",
        )
        _require_role(
            row["actual_center_role"],
            center_role,
            roles,
            f"source_pair.sources[{index - 1}].actual_center_role",
        )
        _expect_literal(
            row["center_kind"],
            "ACTUAL_BLOCKER",
            f"source_pair.sources[{index - 1}].center_kind",
        )
        _require_role(
            row["outside_row_role"],
            "xv",
            roles,
            f"source_pair.sources[{index - 1}].outside_row_role",
        )
        _expect_literal(
            row["outside_xv_row"],
            True,
            f"source_pair.sources[{index - 1}].outside_xv_row",
        )


def _validate_deletion_profile(value: object, arm: str) -> None:
    profile = _exact_dict(
        value,
        frozenset({"materialization_guard", "outcomes"}),
        "deletion_profile",
    )
    _expect_literal(
        profile["materialization_guard"], arm, "deletion_profile guard"
    )
    classified = classify_deletion_profile(profile["outcomes"])
    if classified != arm:
        _fail(
            f"deletion_profile selects {classified!r}, not packet arm {arm!r}"
        )


def _validate_crossed_payload(
    value: object, arm: str, roles: Mapping[str, str], carrier: set[str]
) -> None:
    config = _CROSSED_CONFIG[arm]
    deletion_role = config["deletion_role"]
    actual_blocker_role = config["actual_blocker_role"]
    common_role = config["common_member_role"]
    payload = _exact_dict(
        value,
        frozenset(
            {
                "materialization_guard",
                "kind",
                "exact_rows",
                "five_incidence_conjunction",
            }
        ),
        "arm_payload",
    )
    _expect_literal(payload["materialization_guard"], arm, "arm_payload guard")
    _expect_literal(payload["kind"], "CROSSED_MISSING_INCIDENCE", "arm_payload.kind")

    exact_rows = _exact_dict(
        payload["exact_rows"],
        frozenset(
            {
                "materialization_guard",
                "packet_type",
                "producer_theorem",
                "deletion_role",
                "deletion_actual_blocker_role",
                "common_member_role",
                "rows",
            }
        ),
        "arm_payload.exact_rows",
    )
    _expect_literal(
        exact_rows["materialization_guard"], arm, "exact_rows guard"
    )
    _expect_literal(
        exact_rows["packet_type"],
        "THREE_U5Q_DELETED_K4_CLASSES",
        "exact_rows.packet_type",
    )
    _expect_literal(
        exact_rows["producer_theorem"],
        config["row_producer"],
        "exact_rows.producer_theorem",
    )
    _require_role(
        exact_rows["deletion_role"],
        deletion_role,
        roles,
        "exact_rows.deletion_role",
    )
    _require_role(
        exact_rows["deletion_actual_blocker_role"],
        actual_blocker_role,
        roles,
        "exact_rows.deletion_actual_blocker_role",
    )
    _require_role(
        exact_rows["common_member_role"],
        common_role,
        roles,
        "exact_rows.common_member_role",
    )
    rows = _exact_list(exact_rows["rows"], 3, "exact_rows.rows")
    expected_rows = (
        ("C1", "K1", "SELECTED_SOURCE_ROW", "source_1", "actual_center_1"),
        ("C2", "K2", "SELECTED_SOURCE_ROW", "source_2", "actual_center_2"),
        ("CO", "BO", "PHYSICAL_BLOCKER_CLASS", "opp_apex_2", "opp_apex_2"),
    )
    for index, expected in enumerate(expected_rows):
        row_id, support_id, kind, origin_role, center_role = expected
        _exact_record(
            rows[index],
            {
                "row_id": row_id,
                "support_id": support_id,
                "row_kind": kind,
                "row_origin_role": origin_role,
                "center_role": center_role,
                "deletion_role": deletion_role,
                "common_member_role": common_role,
                "exact_cardinality": 4,
                "support": rows[index].get("support"),
            },
            f"exact_rows.rows[{index}]",
        )
        for role in (origin_role, center_role, deletion_role, common_role):
            if role not in roles:
                _fail(f"exact_rows.rows[{index}] has dangling role {role!r}")
        support = _exact_list(
            rows[index]["support"], 4, f"exact_rows.rows[{index}].support"
        )
        if any(type(label) is not str or label not in carrier for label in support):
            _fail(f"exact_rows.rows[{index}].support must contain carrier labels")
        if len(set(support)) != 4:
            _fail(f"exact_rows.rows[{index}].support must contain four unique labels")
        if roles[deletion_role] in support:
            _fail(f"exact_rows.rows[{index}] contains deleted role")
        if roles[common_role] not in support:
            _fail(f"exact_rows.rows[{index}] omits common member")
        if index < 2 and roles[origin_role] not in support:
            _fail(f"exact_rows.rows[{index}] omits source membership")
        if roles[center_role] in support:
            _fail(f"exact_rows.rows[{index}] contains its center")

    conjunction = _exact_dict(
        payload["five_incidence_conjunction"],
        frozenset(
            {
                "materialization_guard",
                "consumer_theorem",
                "logical_status",
                "atoms",
            }
        ),
        "arm_payload.five_incidence_conjunction",
    )
    _expect_literal(
        conjunction["materialization_guard"], arm, "five-incidence guard"
    )
    _expect_literal(
        conjunction["consumer_theorem"],
        config["consumer"],
        "five-incidence consumer_theorem",
    )
    _expect_literal(
        conjunction["logical_status"],
        "NEGATED",
        "five-incidence logical_status",
    )
    atoms = _exact_list(conjunction["atoms"], 5, "five-incidence atoms")
    expected_atoms = (
        ("c1_in_BO", "actual_center_1", "BO"),
        ("opp_apex_2_in_K1", "opp_apex_2", "K1"),
        ("c2_in_K1", "actual_center_2", "K1"),
        ("opp_apex_2_in_K2", "opp_apex_2", "K2"),
        ("c1_in_K2", "actual_center_1", "K2"),
    )
    memberships: list[bool] = []
    for index, (atom_id, member_role, support_ref) in enumerate(expected_atoms):
        atom = _exact_dict(
            atoms[index],
            frozenset({"atom_id", "member_role", "support_ref"}),
            f"five-incidence atoms[{index}]",
        )
        _expect_literal(atom["atom_id"], atom_id, f"atoms[{index}].atom_id")
        _require_role(
            atom["member_role"],
            member_role,
            roles,
            f"atoms[{index}].member_role",
        )
        _expect_literal(
            atom["support_ref"], support_ref, f"atoms[{index}].support_ref"
        )
        support_index = {"K1": 0, "K2": 1, "BO": 2}[support_ref]
        memberships.append(roles[member_role] in rows[support_index]["support"])
    if all(memberships):
        _fail(
            "a NEGATED five-incidence conjunction requires a concrete non-membership"
        )


def _validate_common_deletion_summary(
    value: object,
    q_role: str,
    arm: str,
    roles: Mapping[str, str],
    carrier: set[str],
    index: int,
) -> None:
    path = f"arm_payload.common_deletion_packets[{index}]"
    summary = _exact_dict(
        value,
        frozenset(
            {
                "materialization_guard",
                "packet_type",
                "q_role",
                "center_roles",
                "actual_blocker_source_role",
                "actual_blocker_role",
                "rows",
            }
        ),
        path,
    )
    _expect_literal(summary["materialization_guard"], arm, f"{path} guard")
    _expect_literal(
        summary["packet_type"], "CommonDeletionTwoCenterPacket", f"{path}.packet_type"
    )
    _require_role(summary["q_role"], q_role, roles, f"{path}.q_role")
    center_roles = _exact_list(summary["center_roles"], 2, f"{path}.center_roles")
    for center_index, center_role in enumerate(
        ("actual_center_1", "actual_center_2")
    ):
        _require_role(
            center_roles[center_index],
            center_role,
            roles,
            f"{path}.center_roles[{center_index}]",
        )
        if roles[center_role] not in carrier:
            _fail(f"{path}.center_roles[{center_index}] is not a carrier label")
    if roles[center_roles[0]] == roles[center_roles[1]]:
        _fail(f"{path}.center_roles must identify distinct centers")
    _require_role(
        summary["actual_blocker_source_role"],
        q_role,
        roles,
        f"{path}.actual_blocker_source_role",
    )
    actual_blocker_role = "xv" if q_role == "u" else "v"
    _require_role(
        summary["actual_blocker_role"],
        actual_blocker_role,
        roles,
        f"{path}.actual_blocker_role",
    )
    for center_role in ("actual_center_1", "actual_center_2"):
        if roles[center_role] == roles[actual_blocker_role]:
            _fail(
                f"{path}: {center_role} aliases the actual blocker "
                f"for deletion role {q_role!r}"
            )

    rows = _exact_list(summary["rows"], 2, f"{path}.rows")
    supports: list[list[Any]] = []
    for source_index in (1, 2):
        source_role = f"source_{source_index}"
        center_role = f"actual_center_{source_index}"
        _exact_record(
            rows[source_index - 1],
            {
                "row_id": f"B{source_index}",
                "row_kind": "EXACT_Q_DELETED_SELECTED_ROW",
                "source_role": source_role,
                "center_role": center_role,
                "deletion_role": q_role,
                "exact_cardinality": 4,
                "support": rows[source_index - 1].get("support"),
            },
            f"{path}.rows[{source_index - 1}]",
        )
        for role in (source_role, center_role, q_role):
            if role not in roles:
                _fail(f"{path} has dangling role {role!r}")
        support = _exact_list(
            rows[source_index - 1]["support"],
            4,
            f"{path}.rows[{source_index - 1}].support",
        )
        if any(type(label) is not str or label not in carrier for label in support):
            _fail(f"{path}.rows[{source_index - 1}].support must contain carrier labels")
        if len(set(support)) != 4:
            _fail(f"{path}.rows[{source_index - 1}].support must be unique")
        if roles[q_role] in support:
            _fail(f"{path}.rows[{source_index - 1}] contains deleted role")
        if roles[center_role] in support:
            _fail(f"{path}.rows[{source_index - 1}] contains its center")
        supports.append(support)
    if len(set(supports[0]).intersection(supports[1])) > 2:
        _fail(f"{path}.rows overlap cardinality exceeds two")


def _validate_bi_survival_payload(
    value: object, arm: str, roles: Mapping[str, str], carrier: set[str]
) -> None:
    payload = _exact_dict(
        value,
        frozenset(
            {
                "materialization_guard",
                "kind",
                "producer_theorem",
                "common_deletion_packets",
            }
        ),
        "arm_payload",
    )
    _expect_literal(payload["materialization_guard"], arm, "arm_payload guard")
    _expect_literal(
        payload["kind"], "COMMON_DELETION_RECTANGLE", "arm_payload.kind"
    )
    _expect_literal(
        payload["producer_theorem"],
        BI_RECTANGLE_PRODUCER_THEOREM,
        "arm_payload.producer_theorem",
    )
    summaries = _exact_list(
        payload["common_deletion_packets"],
        2,
        "arm_payload.common_deletion_packets",
    )
    q_roles: list[str] = []
    for summary in summaries:
        if type(summary) is not dict:
            _fail("common-deletion summary must be a builtin JSON object")
        q_roles.append(_require_string(summary.get("q_role"), "summary.q_role"))
    if q_roles != ["u", "xv"]:
        _fail("common-deletion summaries must cover q=u and q=xv exactly once")
    for index, q_role in enumerate(("u", "xv")):
        _validate_common_deletion_summary(
            summaries[index], q_role, arm, roles, carrier, index
        )


@dataclass(frozen=True, slots=True)
class ValidatedPacket:
    """An immutable canonical packet; detached dict views cannot mutate it."""

    _canonical_bytes: bytes
    arm: str

    def _revalidated_dict(self) -> dict[str, Any]:
        value = parse_strict_json(self._canonical_bytes)
        if type(value) is not dict:
            _fail("validated packet lost its object root")
        reparsed = validate_packet(value)
        if self.arm != reparsed.arm:
            _fail("validated packet arm disagrees with its canonical payload")
        return value

    @property
    def canonical_bytes(self) -> bytes:
        self._revalidated_dict()
        return self._canonical_bytes

    @property
    def sha256(self) -> str:
        return hashlib.sha256(self.canonical_bytes).hexdigest()

    @property
    def packet_id(self) -> str:
        return self.to_dict()["packet_id"]

    def to_dict(self) -> dict[str, Any]:
        return self._revalidated_dict()


@dataclass(frozen=True, slots=True)
class AuthenticatedSourcePacket:
    """A validated packet paired with an independently authenticated source byte hash.

    The packet's revision and import declarations remain metadata; this object
    authenticates only the pinned source file bytes.
    """

    packet: ValidatedPacket
    source_path: str
    source_sha256: str
    repository_revision: str
    imports_authenticated: bool = False


def authenticate_source_packet(
    value: object, repo_root: str | Path
) -> AuthenticatedSourcePacket:
    """Validate a packet, then authenticate the pinned source file under ``repo_root``.

    ``validate_packet`` alone is deliberately not an authentication result.
    Repository revision and imports are reported as metadata and are not
    authenticated by this byte-level check.
    """

    packet = validate_packet(value)
    try:
        root = Path(repo_root).resolve(strict=True)
        source = (root / SOURCE_PATH).resolve(strict=True)
    except OSError as exc:
        raise SourcePacketError("authenticated source file is unreadable") from exc
    try:
        source.relative_to(root)
    except ValueError as exc:
        raise SourcePacketError(
            "authenticated source resolves outside repository root"
        ) from exc
    try:
        digest = hashlib.sha256(source.read_bytes()).hexdigest()
    except OSError as exc:
        raise SourcePacketError("authenticated source file is unreadable") from exc
    if digest != SOURCE_SHA256:
        _fail("authenticated source SHA-256 does not match the pinned digest")
    boundary = packet.to_dict()["source_boundary"]
    return AuthenticatedSourcePacket(
        packet=packet,
        source_path=SOURCE_PATH,
        source_sha256=digest,
        repository_revision=boundary["repository_revision"],
    )


def validate_packet(value: object) -> ValidatedPacket:
    """Validate a plain JSON packet without filesystem or process activity."""

    if isinstance(value, ValidatedPacket):
        reparsed = validate_packet(parse_strict_json(value.canonical_bytes))
        if value.arm != reparsed.arm:
            _fail("validated packet arm disagrees with its canonical payload")
        return reparsed
    packet = _exact_dict(value, _ROOT_KEYS, "packet")
    _expect_literal(packet["schema"], SCHEMA, "packet.schema")
    packet_id = _require_string(packet["packet_id"], "packet.packet_id")
    if _PACKET_ID.fullmatch(packet_id) is None:
        _fail("packet.packet_id is not a canonical packet identifier")
    arm = _require_string(packet["arm"], "packet.arm")
    if arm not in ARMS:
        _fail(f"packet.arm is not a Card18 arm: {arm!r}")

    _validate_claim_boundary(packet["claim_boundary"])
    _validate_source_boundary(packet["source_boundary"], arm)
    carrier = _validate_carrier(packet["carrier"])
    roles = _validate_roles(packet["roles"], carrier)
    _validate_blocker_v_parent(packet["blocker_v_parent"])
    _validate_live_parent_facts(packet["live_parent_facts"], roles)
    _validate_source_pair(packet["source_pair"], roles)
    _validate_deletion_profile(packet["deletion_profile"], arm)
    if arm in _CROSSED_CONFIG:
        _validate_crossed_payload(packet["arm_payload"], arm, roles, carrier)
    else:
        _validate_bi_survival_payload(packet["arm_payload"], arm, roles, carrier)

    return ValidatedPacket(canonical_json_bytes(packet), arm)


def encode_packet(value: object) -> bytes:
    """Validate and encode one packet as canonical bytes."""

    return validate_packet(value).canonical_bytes


def decode_packet(payload: bytes) -> ValidatedPacket:
    """Strictly parse canonical bytes and validate the complete packet."""

    return validate_packet(parse_strict_json(payload))


def packet_sha256(value: object) -> str:
    """Return SHA-256 of the validated packet's exact canonical bytes."""

    return validate_packet(value).sha256
