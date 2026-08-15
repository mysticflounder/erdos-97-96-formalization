"""Synthetic v1 schema fixture for the FreshThird pinned-endpoint fan.

This is a packet/replay scaffold only.  It does not run a solver, invoke Lean,
serialize a Lean-produced packet, or assert that the pinned-endpoint residual
is closed.  Its hard-coded roles and values exercise the proposed schema; they
are not source evidence.  The packet deliberately keeps source-shaped field
families visible so that a later Lean-backed exporter can replace the fixture.
"""

from __future__ import annotations

import argparse
import json
from collections.abc import Iterable, Mapping, Sequence
from pathlib import Path
from typing import Any

from census.p97_search import (
    freshthird_firstnonhit_cap_interval_audit as cap_audit,
)
from census.p97_search import (
    freshthird_firstnonhit_six_point_order_audit as order_audit,
)

# Reuse the exact serialization and rational primitives used by the two
# existing FreshThird audits.  Keeping one implementation avoids subtly
# different canonical forms in artifacts from adjacent lanes.
_json_bytes = order_audit._json_bytes
_sha256 = order_audit._sha256
_q = order_audit._q
_parse_q = order_audit._parse_q
_sha256_file = cap_audit._sha256_file

AuditError = order_audit.AuditError

FORMAT = "p97_freshthird_firstnonhit_pinned_endpoint_fan_query_v1"
DIAGNOSTIC_STATUS = "SYNTHETIC_SCHEMA_FIXTURE_NOT_SOURCE_EXPORTED"
CONSUMER = (
    "Problem97.ATailFrontierLiveClosure."
    "false_of_freshThird_pinnedEndpoint_outsideSeedResidual"
)
PRODUCER = (
    "Problem97.ATailFrontierLiveClosure."
    "FreshThirdPinnedEndpointOutsideSeedQueryPacket.ofSource"
)
MAX_ROLES = 30

ROOT = Path(__file__).resolve().parents[2]
SPEC_PATH = "census/p97_search/FRESHTHIRD-PINNED-FAN-QUERY-SPEC.md"
SOURCE_FILES = (
    SPEC_PATH,
    "census/p97_search/freshthird_firstnonhit_six_point_order_audit.py",
    "census/p97_search/freshthird_firstnonhit_cap_interval_audit.py",
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FreshThirdPinnedFanPacket.lean",
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean",
)

SEED_ROLES = ("center_mem_seed",) + tuple(f"seed{i}" for i in range(1, 6))
ROW_ROLES = tuple(f"row{i}" for i in range(4))
BOUNDARY_ROLES = tuple(f"boundary{i}" for i in range(4))
BLOCKER_ROLES = tuple(f"canonical_blocker{i}" for i in range(4))
EXTRA_ROLES = tuple(
    f"extra{i}_{j}" for i in range(4) for j in range(3)
)
ROLE_NAMES = SEED_ROLES + ROW_ROLES + BOUNDARY_ROLES + BLOCKER_ROLES + EXTRA_ROLES

HROW_PATTERNS = (
    ("qOutside", "freshCenter", "qBetween", "sourceCenter", "canonicalSource", "qBetween"),
    ("qOutside", "freshCenter", "qBetween", "canonicalSource", "sourceCenter", "qOutside"),
    ("canonicalSource", "sourceCenter", "qBetween", "freshCenter", "qOutside", "qBetween"),
    ("sourceCenter", "canonicalSource", "qBetween", "freshCenter", "qOutside", "qOutside"),
)


def _expect_keys(value: Any, keys: Iterable[str], where: str) -> dict[str, Any]:
    if type(value) is not dict:
        raise AuditError(f"{where} must be an object")
    expected = set(keys)
    actual = set(value)
    if actual != expected:
        raise AuditError(
            f"{where} keys differ: missing={sorted(expected - actual)!r}, "
            f"extra={sorted(actual - expected)!r}"
        )
    return value


def _string(value: Any, where: str) -> str:
    if type(value) is not str or not value:
        raise AuditError(f"{where} must be a non-empty string")
    return value


def _integer(value: Any, where: str) -> int:
    if type(value) is not int:
        raise AuditError(f"{where} must be an integer")
    return value


def _boolean(value: Any, where: str) -> bool:
    if type(value) is not bool:
        raise AuditError(f"{where} must be boolean")
    return value


def _no_floats(value: Any, where: str = "packet") -> None:
    if type(value) is float:
        raise AuditError(f"{where} contains a floating-point value")
    if type(value) is dict:
        for key, child in value.items():
            if type(key) is not str:
                raise AuditError(f"{where} has a non-string key")
            _no_floats(child, f"{where}.{key}")
    elif type(value) is list:
        for index, child in enumerate(value):
            _no_floats(child, f"{where}[{index}]")


def _role(value: Any, roles: set[str], where: str) -> str:
    value = _string(value, where)
    if value not in roles:
        raise AuditError(f"{where} is not a declared role: {value!r}")
    return value


def _canonical_role_partition(arm: str) -> dict[str, Any]:
    aliases: list[list[str]] = []
    consumed: set[str] = set()
    if arm == "endpoint":
        for index in range(4):
            aliases.append([f"boundary{index}", f"row{index}"])
            consumed.update({f"boundary{index}", f"row{index}"})
    for role in ROLE_NAMES:
        if role not in consumed:
            aliases.append([role])
    aliases.sort(key=lambda group: tuple(group))
    representative = {
        role: group[0] for group in aliases for role in group
    }
    return {"classes": aliases, "representative": representative}


def _coordinates(arm: str) -> dict[str, list[str]]:
    coordinates: dict[str, tuple[int | str, int | str]] = {
        "center_mem_seed": (0, 0),
        "seed1": (0, 3),
        **{f"seed{i}": (10 + i, 10 + 2 * i) for i in range(2, 6)},
        "row0": (1, 0),
        "row1": (0, 1),
        "row2": (-1, 0),
        "row3": (0, -1),
        "canonical_blocker0": (0, 0),
        "canonical_blocker1": (0, 2),
        "canonical_blocker2": (-2, 0),
        "canonical_blocker3": (0, -2),
        "extra0_0": (1, 0),
        "extra0_1": (0, 1),
        "extra0_2": (-1, 0),
        "extra1_0": (1, 2),
        "extra1_1": (-1, 2),
        "extra1_2": (0, 3),
        "extra2_0": (-2, 1),
        "extra2_1": (-2, -1),
        "extra2_2": (-3, 0),
        "extra3_0": (1, -2),
        "extra3_1": (-1, -2),
        "extra3_2": (0, -3),
    }
    if arm == "off_endpoint":
        coordinates.update(
            {
                "boundary0": ("3/5", "19/5"),
                "boundary1": ("4/5", "18/5"),
                "boundary2": ("-3/5", "19/5"),
                "boundary3": ("-4/5", "18/5"),
            }
        )
    else:
        # ``boundary*`` is the canonical representative because alias classes
        # are sorted lexicographically.  The endpoint arm therefore stores one
        # coordinate for each boundary representative, while row references
        # resolve through the quotient during validation.
        for index in range(4):
            coordinates[f"boundary{index}"] = coordinates.pop(f"row{index}")
    return {
        role: [_q(value) if type(value) is int else value for value in point]
        for role, point in coordinates.items()
    }


def _sq_distance(left: Sequence[str], right: Sequence[str]) -> str:
    lx, ly = (_parse_q(value) for value in left)
    rx, ry = (_parse_q(value) for value in right)
    return _q((lx - rx) ** 2 + (ly - ry) ** 2)


def _metric_rows(
    arm: str, coordinates: Mapping[str, list[str]], reps: Mapping[str, str]
) -> dict[str, Any]:
    rows: dict[str, Any] = {}

    def row_record(name: str, center: str, support: Sequence[str]) -> dict[str, Any]:
        resolve = lambda role: coordinates[reps[role]]
        radius = _sq_distance(resolve(support[0]), resolve(center))
        return {
            "center_role": center,
            "support_roles": list(support),
            "support_card": 4,
            "radius_squared": radius,
            "equalities": {
                role: _sq_distance(resolve(role), resolve(center))
                for role in support
            },
        }

    rows["selected"] = row_record("selected", "center_mem_seed", ROW_ROLES)
    boundary_support = ROW_ROLES if arm == "endpoint" else BOUNDARY_ROLES
    rows["boundary"] = row_record(
        "boundary",
        "center_mem_seed" if arm == "endpoint" else "seed1",
        boundary_support,
    )
    blocker_supports = (
        ROW_ROLES,
        ("row1", "extra1_0", "extra1_1", "extra1_2"),
        ("row2", "extra2_0", "extra2_1", "extra2_2"),
        ("row3", "extra3_0", "extra3_1", "extra3_2"),
    )
    rows["blockers"] = {
        str(index): row_record(
            f"canonical_blocker{index}", f"canonical_blocker{index}", support
        )
        for index, support in enumerate(blocker_supports)
    }
    return rows


def _row_record(center: str, support: Sequence[str]) -> dict[str, Any]:
    return {
        "center_role": center,
        "slots": [
            {"slot": index, "role": role} for index, role in enumerate(support)
        ],
        "support_roles": list(support),
        "support_card": 4,
    }


def build_packet(arm: str = "endpoint") -> dict[str, Any]:
    """Build the deterministic diagnostic fixture for either source arm."""

    if arm not in {"endpoint", "off_endpoint"}:
        raise AuditError(f"unknown endpoint split arm: {arm!r}")
    partition = _canonical_role_partition(arm)
    representative = partition["representative"]
    coordinates = _coordinates(arm)
    boundary_support = ROW_ROLES if arm == "endpoint" else BOUNDARY_ROLES
    pinned_center_role = "center_mem_seed"
    fan_row_center_role = "center_mem_seed"
    endpoint_row_center_role = "center_mem_seed" if arm == "endpoint" else "seed1"
    blocker_supports = (
        ROW_ROLES,
        ("row1", "extra1_0", "extra1_1", "extra1_2"),
        ("row2", "extra2_0", "extra2_1", "extra2_2"),
        ("row3", "extra3_0", "extra3_1", "extra3_2"),
    )

    packet: dict[str, Any] = {
        "format": FORMAT,
        "diagnostic_status": DIAGNOSTIC_STATUS,
        "source_contract": {
            "consumer": CONSUMER,
            "producer": PRODUCER,
            "closure_claim": "NONE",
        },
        "field_provenance": {
            "source_entitled": [],
            "metadata_only": ["source_contract", "source_hashes"],
            "synthetic_schema_fixture": [
                "endpoint_split", "alias_partition", "rows", "blocker_records",
                "hrow_at", "escape",
            ],
            "untrusted_proposal": ["metric_witness"],
        },
        "role_universe": {"maximum": MAX_ROLES, "roles": list(ROLE_NAMES)},
        "endpoint_split": {
            "arm": arm,
            "pinned_center_role": pinned_center_role,
            "fan_row_center_role": fan_row_center_role,
            "endpoint_row_center_role": endpoint_row_center_role,
            "row_boundary_relation": "same_support" if arm == "endpoint" else "distinct_support",
            "row_escape_role": "row3",
            "boundary_escape_role": "row3" if arm == "endpoint" else "boundary3",
        },
        "alias_partition": partition,
        "rows": {
            "selected": _row_record(fan_row_center_role, ROW_ROLES),
            "boundary": _row_record(endpoint_row_center_role, boundary_support),
        },
        "blocker_records": [
            {
                "row_slot": index,
                "source_role": ROW_ROLES[index],
                "canonical_blocker_center_role": BLOCKER_ROLES[index],
                "support_roles": list(support),
                "support_card": 4,
                "deletion_blocking": {
                    "deleted_role": ROW_ROLES[index],
                    "blocked_after_deleting": True,
                    "source_relation": "canonical_source",
                },
                "chosen_deletion": {
                    "source_role": ROW_ROLES[index],
                    "deleted_role": ROW_ROLES[index],
                    "canonical_blocker_center_role": BLOCKER_ROLES[index],
                    "blocked_after_deleting": True,
                    "support_roles": list(support),
                },
                "source_relation": {
                    "center_relation": "equal" if index == 0 else "distinct",
                    "support_relation": "equal_support" if index == 0 else "overlap_card_at_most_2",
                    "overlap_card": 4 if index == 0 else 1,
                },
            }
            for index, support in enumerate(blocker_supports)
        ],
        "hrow_at": {
            "arm": 0,
            "names": {
                name: role
                for name, role in zip(
                    HROW_PATTERNS[0][:5],
                    (
                        "row0", "canonical_blocker1", "row1",
                        "canonical_blocker0", "row3",
                    ),
                    strict=True,
                )
            },
            "order_indices": [0, 1, 2, 3, 4],
            "endpoint_name": "qBetween",
            "endpoint_role": "row1",
            "endpoint_indices": {
                "qOutside": 0,
                "freshCenter": 1,
                "qBetween": 2,
                "sourceCenter": 3,
                "canonicalSource": 4,
            },
            "source_center_cap_placement": {
                "role": "canonical_blocker0",
                "cap_index": 0,
                "in_cap": True,
            },
            "fresh_center_cap_placement": {
                "role": "canonical_blocker1",
                "cap_index": 1,
                "in_cap": True,
            },
            "seed_membership": {
                "pinned_center_in_seed": True,
                "source_center_in_seed": False,
                "fresh_center_in_seed": False,
                "endpoint_role_in_seed": False,
                "escape_role_in_seed": False,
            },
            "seed_multiplicity": {
                "bound": 3,
                "center_role": pinned_center_role,
                "radius_squared": "0",
                "seed_count": 1,
            },
            "row_support_roles": list(boundary_support),
            "cap_index": 1,
            "cap_counts": {"inside": 2, "outside": 2, "total": 4},
        },
        "escape": {
            "role": "row3" if arm == "endpoint" else "boundary3",
            "row": "selected" if arm == "endpoint" else "boundary",
            "outside_seed": True,
            "seed_roles": list(SEED_ROLES),
        },
        "metric_witness": {
            "coordinates": coordinates,
            "rows": _metric_rows(arm, coordinates, representative),
        },
        "source_hashes": {
            path: _sha256_file(ROOT / path) for path in SOURCE_FILES
        },
    }
    # The representative map is authenticated as part of the packet, but it
    # is also used here to make accidental non-representative coordinates
    # visible during development.
    if set(coordinates) != {
        role for role in ROLE_NAMES if representative[role] == role
    }:
        raise AuditError("fixture coordinate keys do not match role representatives")
    packet["hashes"] = {
        "canonical_artifact_sha256": _sha256(packet),
    }
    validate_packet(packet)
    return packet


def _validate_partition(packet: Mapping[str, Any]) -> dict[str, str]:
    role_data = _expect_keys(packet["role_universe"], {"maximum", "roles"}, "role_universe")
    if _integer(role_data["maximum"], "role_universe.maximum") != MAX_ROLES:
        raise AuditError("role universe maximum changed")
    roles_value = role_data["roles"]
    if type(roles_value) is not list or roles_value != list(ROLE_NAMES):
        raise AuditError("role universe is not the canonical v1 role list")
    roles = set(roles_value)
    part = _expect_keys(packet["alias_partition"], {"classes", "representative"}, "alias_partition")
    classes = part["classes"]
    if type(classes) is not list or not classes:
        raise AuditError("alias_partition.classes must be non-empty")
    flattened: list[str] = []
    reps: dict[str, str] = {}
    previous: tuple[str, ...] | None = None
    for index, group in enumerate(classes):
        if type(group) is not list or not group or group != sorted(group):
            raise AuditError(f"alias class {index} is not sorted and non-empty")
        group_tuple = tuple(group)
        if previous is not None and group_tuple <= previous:
            raise AuditError("alias classes are not canonically ordered")
        previous = group_tuple
        if any(type(role) is not str for role in group) or any(role not in roles for role in group):
            raise AuditError(f"alias class {index} contains an undeclared role")
        for role in group:
            if role in reps:
                raise AuditError("alias partition repeats a role")
            reps[role] = group[0]
            flattened.append(role)
    if set(flattened) != roles or len(flattened) != len(roles):
        raise AuditError("alias partition does not cover roles exactly once")
    declared = part["representative"]
    if type(declared) is not dict or declared != reps:
        raise AuditError("alias representative map disagrees with partition")
    return reps


def _validate_row(row: Any, reps: Mapping[str, str], where: str) -> list[str]:
    row = _expect_keys(row, {"center_role", "slots", "support_roles", "support_card"}, where)
    roles = set(reps)
    _role(row["center_role"], roles, f"{where}.center_role")
    slots = row["slots"]
    if type(slots) is not list or len(slots) != 4:
        raise AuditError(f"{where}.slots must contain exactly four slots")
    slot_roles: list[str] = []
    for index, slot in enumerate(slots):
        slot = _expect_keys(slot, {"slot", "role"}, f"{where}.slots[{index}]")
        if _integer(slot["slot"], f"{where}.slots[{index}].slot") != index:
            raise AuditError(f"{where}.slots are not indexed 0..3")
        slot_roles.append(_role(slot["role"], roles, f"{where}.slots[{index}].role"))
    support = row["support_roles"]
    if type(support) is not list or len(support) != 4 or support != slot_roles:
        raise AuditError(f"{where}.support_roles disagrees with exact four slots")
    if len({reps[role] for role in support}) != 4:
        raise AuditError(f"{where} support aliases are not four distinct points")
    if _integer(row["support_card"], f"{where}.support_card") != 4:
        raise AuditError(f"{where}.support_card is not four")
    return support


def _validate_metric(packet: Mapping[str, Any], reps: Mapping[str, str]) -> None:
    metric = _expect_keys(packet["metric_witness"], {"coordinates", "rows"}, "metric_witness")
    coordinates = metric["coordinates"]
    if type(coordinates) is not dict:
        raise AuditError("metric_witness.coordinates must be an object")
    canonical_reps = {role for role, rep in reps.items() if role == rep}
    if set(coordinates) != canonical_reps:
        raise AuditError("metric coordinates do not match alias representatives")
    for role, point in coordinates.items():
        if type(point) is not list or len(point) != 2:
            raise AuditError(f"metric coordinate for {role} is not a rational pair")
        _parse_q(point[0])
        _parse_q(point[1])

    def resolved(role: str) -> list[str]:
        return coordinates[reps[role]]

    rows = _expect_keys(metric["rows"], {"selected", "boundary", "blockers"}, "metric_witness.rows")
    for name in ("selected", "boundary"):
        record = _expect_keys(rows[name], {"center_role", "support_roles", "support_card", "radius_squared", "equalities"}, f"metric_witness.rows.{name}")
        center = _role(record["center_role"], set(reps), f"metric_witness.rows.{name}.center_role")
        support = record["support_roles"]
        if type(support) is not list or len(support) != 4 or len({reps[_role(role, set(reps), "metric support role")] for role in support}) != 4:
            raise AuditError(f"metric_witness.rows.{name} does not have exact four support")
        if _integer(record["support_card"], f"metric_witness.rows.{name}.support_card") != 4:
            raise AuditError(f"metric_witness.rows.{name}.support_card is not four")
        radius = _parse_q(record["radius_squared"])
        equalities = record["equalities"]
        if type(equalities) is not dict or set(equalities) != set(support):
            raise AuditError(f"metric_witness.rows.{name}.equalities mismatch support")
        for role in support:
            actual = _q(_parse_q(_sq_distance(resolved(role), resolved(center))))
            if _parse_q(equalities[role]) != radius or actual != equalities[role]:
                raise AuditError(f"metric equality mismatch in {name} for {role}")
    blockers = rows["blockers"]
    if type(blockers) is not dict or set(blockers) != {str(i) for i in range(4)}:
        raise AuditError("metric blocker rows must be exactly four indexed records")
    for index in range(4):
        record = _expect_keys(blockers[str(index)], {"center_role", "support_roles", "support_card", "radius_squared", "equalities"}, f"metric_witness.rows.blockers[{index}]")
        center = _role(record["center_role"], set(reps), "metric blocker center")
        support = record["support_roles"]
        if type(support) is not list or len(support) != 4 or len({reps[_role(role, set(reps), "metric blocker support role")] for role in support}) != 4:
            raise AuditError("metric blocker support is not exact four")
        radius = _parse_q(record["radius_squared"])
        equalities = record["equalities"]
        if type(equalities) is not dict or set(equalities) != set(support):
            raise AuditError("metric blocker equality map mismatch")
        for role in support:
            _role(role, set(reps), "metric blocker support role")
            actual = _q(_parse_q(_sq_distance(resolved(role), resolved(center))))
            if _parse_q(equalities[role]) != radius or actual != equalities[role]:
                raise AuditError("metric blocker equality mismatch")


def validate_packet(packet: Mapping[str, Any]) -> None:
    """Fail-closed validation of a v1 packet, including its source hashes."""

    _no_floats(packet)
    packet = _expect_keys(
        packet,
        {
            "format", "diagnostic_status", "source_contract", "role_universe",
            "field_provenance", "endpoint_split", "alias_partition", "rows",
            "blocker_records", "hrow_at", "escape", "metric_witness",
            "source_hashes", "hashes",
        },
        "packet",
    )
    if packet["format"] != FORMAT or packet["diagnostic_status"] != DIAGNOSTIC_STATUS:
        raise AuditError("unsupported packet format or status")
    contract = _expect_keys(packet["source_contract"], {"consumer", "producer", "closure_claim"}, "source_contract")
    if contract != {"consumer": CONSUMER, "producer": PRODUCER, "closure_claim": "NONE"}:
        raise AuditError("source contract changed")
    provenance = _expect_keys(packet["field_provenance"], {
        "source_entitled", "metadata_only", "synthetic_schema_fixture",
        "untrusted_proposal",
    }, "field_provenance")
    if provenance != {
        "source_entitled": [],
        "metadata_only": ["source_contract", "source_hashes"],
        "synthetic_schema_fixture": [
            "endpoint_split", "alias_partition", "rows", "blocker_records",
            "hrow_at", "escape",
        ],
        "untrusted_proposal": ["metric_witness"],
    }:
        raise AuditError("field provenance classification changed")
    reps = _validate_partition(packet)
    roles = set(reps)
    split = _expect_keys(
        packet["endpoint_split"],
        {
            "arm", "pinned_center_role", "fan_row_center_role",
            "endpoint_row_center_role", "row_boundary_relation",
            "row_escape_role", "boundary_escape_role",
        },
        "endpoint_split",
    )
    arm = _string(split["arm"], "endpoint_split.arm")
    if arm not in {"endpoint", "off_endpoint"}:
        raise AuditError("unknown endpoint split arm")
    pinned_center = _role(split["pinned_center_role"], roles, "endpoint_split.pinned_center_role")
    fan_row_center = _role(split["fan_row_center_role"], roles, "endpoint_split.fan_row_center_role")
    boundary_center = _role(split["endpoint_row_center_role"], roles, "endpoint_split.endpoint_row_center_role")
    if pinned_center != "center_mem_seed" or fan_row_center != pinned_center:
        raise AuditError("pinned center is not the source-provided center_mem_seed")
    expected_relation = "same_support" if arm == "endpoint" else "distinct_support"
    if split["row_boundary_relation"] != expected_relation:
        raise AuditError("endpoint relation does not match arm")
    if (fan_row_center == boundary_center) != (arm == "endpoint"):
        raise AuditError("endpoint center identity does not match arm")
    _role(split["row_escape_role"], roles, "endpoint_split.row_escape_role")
    _role(split["boundary_escape_role"], roles, "endpoint_split.boundary_escape_role")

    rows = _expect_keys(packet["rows"], {"selected", "boundary"}, "rows")
    selected = _validate_row(rows["selected"], reps, "rows.selected")
    boundary = _validate_row(rows["boundary"], reps, "rows.boundary")
    if arm == "endpoint" and boundary != selected:
        raise AuditError("endpoint arm must identify row and boundary support")
    if arm == "off_endpoint" and boundary == selected:
        raise AuditError("off-endpoint arm must retain a distinct boundary support")

    blockers = packet["blocker_records"]
    if type(blockers) is not list or len(blockers) != 4:
        raise AuditError("there must be exactly four blocker records")
    for index, record in enumerate(blockers):
        record = _expect_keys(record, {"row_slot", "source_role", "canonical_blocker_center_role", "support_roles", "support_card", "deletion_blocking", "chosen_deletion", "source_relation"}, f"blocker_records[{index}]")
        if _integer(record["row_slot"], "blocker row slot") != index or record["source_role"] != selected[index]:
            raise AuditError("blocker source slot does not match selected row")
        if record["canonical_blocker_center_role"] != BLOCKER_ROLES[index]:
            raise AuditError("canonical blocker center order changed")
        _role(record["canonical_blocker_center_role"], roles, "canonical blocker center role")
        support = record["support_roles"]
        if type(support) is not list or len(support) != 4 or len({reps[_role(role, roles, "blocker support role")] for role in support}) != 4:
            raise AuditError("blocker support is not exact four")
        if _integer(record["support_card"], "blocker support card") != 4:
            raise AuditError("blocker support card is not four")
        deletion = _expect_keys(record["deletion_blocking"], {"deleted_role", "blocked_after_deleting", "source_relation"}, "deletion_blocking")
        if deletion["deleted_role"] != record["source_role"] or not _boolean(deletion["blocked_after_deleting"], "blocked_after_deleting") or deletion["source_relation"] != "canonical_source":
            raise AuditError("deletion-blocking/source relation mismatch")
        chosen = _expect_keys(record["chosen_deletion"], {"source_role", "deleted_role", "canonical_blocker_center_role", "blocked_after_deleting", "support_roles"}, "chosen_deletion")
        if (
            chosen["source_role"] != record["source_role"]
            or chosen["deleted_role"] != record["source_role"]
            or chosen["canonical_blocker_center_role"] != record["canonical_blocker_center_role"]
            or not _boolean(chosen["blocked_after_deleting"], "chosen deletion blocked")
            or chosen["support_roles"] != support
        ):
            raise AuditError("chosen per-source deletion data mismatch")
        relation = _expect_keys(record["source_relation"], {"center_relation", "support_relation", "overlap_card"}, "source_relation")
        expected_center = "equal" if index == 0 else "distinct"
        expected_support = "equal_support" if index == 0 else "overlap_card_at_most_2"
        if relation["center_relation"] != expected_center or relation["support_relation"] != expected_support:
            raise AuditError("blocker relation arm mismatch")
        if _integer(relation["overlap_card"], "overlap_card") != (4 if index == 0 else 1):
            raise AuditError("blocker overlap cardinality mismatch")

    hrow = _expect_keys(packet["hrow_at"], {"arm", "names", "order_indices", "endpoint_name", "endpoint_role", "endpoint_indices", "source_center_cap_placement", "fresh_center_cap_placement", "seed_membership", "seed_multiplicity", "row_support_roles", "cap_index", "cap_counts"}, "hrow_at")
    hrow_arm = _integer(hrow["arm"], "hrow_at.arm")
    if hrow_arm not in range(4):
        raise AuditError("hrowAt arm must be one of four alternatives")
    names = hrow["names"]
    if type(names) is not dict or set(names) != set(HROW_PATTERNS[hrow_arm][:5]):
        raise AuditError("hrowAt names do not match its arm")
    for role in names.values():
        _role(role, roles, "hrowAt name")
    indices = hrow["order_indices"]
    if type(indices) is not list or indices != list(range(5)):
        raise AuditError("hrowAt order indices are not canonical")
    endpoint_indices = _expect_keys(hrow["endpoint_indices"], set(HROW_PATTERNS[hrow_arm][:5]), "hrowAt endpoint indices")
    if endpoint_indices != {name: index for index, name in enumerate(HROW_PATTERNS[hrow_arm][:5])}:
        raise AuditError("hrowAt endpoint indices do not match names")
    endpoint_name = _string(hrow["endpoint_name"], "hrowAt endpoint name")
    if endpoint_name != HROW_PATTERNS[hrow_arm][5] or hrow["endpoint_role"] != names[endpoint_name]:
        raise AuditError("hrowAt endpoint name/role mismatch")
    if hrow["row_support_roles"] != boundary:
        raise AuditError("hrowAt row support differs from boundary row")
    for placement_name, expected_role, expected_cap in (
        ("source_center_cap_placement", names["sourceCenter"], 0),
        ("fresh_center_cap_placement", names["freshCenter"], 1),
    ):
        placement = _expect_keys(hrow[placement_name], {"role", "cap_index", "in_cap"}, f"hrowAt.{placement_name}")
        if placement["role"] != expected_role or _integer(placement["cap_index"], f"{placement_name}.cap_index") != expected_cap or not _boolean(placement["in_cap"], f"{placement_name}.in_cap"):
            raise AuditError(f"{placement_name} mismatch")
    membership = _expect_keys(hrow["seed_membership"], {"pinned_center_in_seed", "source_center_in_seed", "fresh_center_in_seed", "endpoint_role_in_seed", "escape_role_in_seed"}, "hrowAt.seed_membership")
    if not membership["pinned_center_in_seed"] or any(
        membership[key] for key in (
            "source_center_in_seed", "fresh_center_in_seed",
            "endpoint_role_in_seed", "escape_role_in_seed",
        )
    ):
        raise AuditError("hrowAt seed membership is inconsistent with center_mem_seed")
    multiplicity = _expect_keys(hrow["seed_multiplicity"], {"bound", "center_role", "radius_squared", "seed_count"}, "hrowAt.seed_multiplicity")
    if _integer(multiplicity["bound"], "seed multiplicity bound") != 3 or multiplicity["center_role"] != pinned_center or _parse_q(multiplicity["radius_squared"]) != 0 or _integer(multiplicity["seed_count"], "seed multiplicity count") != 1:
        raise AuditError("seed multiplicity witness is inconsistent")
    if _integer(hrow["cap_index"], "hrowAt cap index") not in range(3):
        raise AuditError("hrowAt cap index is malformed")
    counts = _expect_keys(hrow["cap_counts"], {"inside", "outside", "total"}, "hrowAt cap counts")
    if counts != {"inside": 2, "outside": 2, "total": 4}:
        raise AuditError("hrowAt cap counts are inconsistent")

    escape = _expect_keys(packet["escape"], {"role", "row", "outside_seed", "seed_roles"}, "escape")
    expected_escape = split["row_escape_role"] if arm == "endpoint" else split["boundary_escape_role"]
    expected_row = "selected" if arm == "endpoint" else "boundary"
    if escape["role"] != expected_escape or escape["row"] != expected_row or not _boolean(escape["outside_seed"], "escape.outside_seed") or escape["seed_roles"] != list(SEED_ROLES):
        raise AuditError("escape witness does not preserve branch provenance")
    if escape["role"] in escape["seed_roles"]:
        raise AuditError("escape role is aliased into the seed")

    _validate_metric(packet, reps)
    source_hashes = packet["source_hashes"]
    if type(source_hashes) is not dict or set(source_hashes) != set(SOURCE_FILES):
        raise AuditError("source hash ledger has missing or extra paths")
    for path, digest in source_hashes.items():
        if type(digest) is not str or len(digest) != 64 or any(char not in "0123456789abcdef" for char in digest) or digest != _sha256_file(ROOT / path):
            raise AuditError(f"source hash mismatch: {path}")
    hashes = _expect_keys(packet["hashes"], {"canonical_artifact_sha256"}, "hashes")
    if hashes["canonical_artifact_sha256"] != _sha256({key: value for key, value in packet.items() if key != "hashes"}):
        raise AuditError("canonical artifact hash mismatch")


def write_packet(path: Path, arm: str = "endpoint") -> dict[str, Any]:
    packet = build_packet(arm)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(_json_bytes(packet) + b"\n")
    return packet


def replay_packet(path: Path, arm: str | None = None) -> dict[str, Any]:
    try:
        packet = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise AuditError(f"cannot read pinned-fan packet: {path}") from exc
    validate_packet(packet)
    actual_arm = packet["endpoint_split"]["arm"]
    if arm is not None and arm != actual_arm:
        raise AuditError("requested replay arm differs from packet")
    expected = build_packet(actual_arm)
    if packet != expected:
        raise AuditError("packet differs from deterministic v1 replay")
    return packet


# Friendly explicit names for callers that treat this as a query artifact.
build_query = build_packet
validate_query = validate_packet
replay_query = replay_packet


def main(argv: Iterable[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--arm", choices=("endpoint", "off_endpoint"), default="endpoint")
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--replay", action="store_true")
    args = parser.parse_args(list(argv) if argv is not None else None)
    if args.replay:
        replay_packet(args.output, args.arm)
        print(f"replayed {args.output}")
    else:
        packet = write_packet(args.output, args.arm)
        print(json.dumps({"format": packet["format"], "arm": args.arm}, sort_keys=True))
        print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
