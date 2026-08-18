"""Fail-closed source adapter for the FirstFiber outside-pair metric route.

The live Lean leaf does not yet expose a finite extractor.  This module defines
the exact packet contract that such an extractor must satisfy before any packet
can enter a piqd metric search.  It deliberately emits normalized systems only;
it does not infer cyclic order from a profile, invent omitted rows, or claim
coverage.
"""

from __future__ import annotations

import hashlib
import json
import re
from collections.abc import Mapping
from pathlib import Path, PurePosixPath
from typing import Any

SCHEMA = "p97-firstfiber-outside-pair-metric-source/v1"
PACKET_SCHEMA = "p97-firstfiber-outside-pair-metric-source/packet/v1"
METRIC_SCHEMA = "p97-firstfiber-outside-pair-metric-systems/v1"
_HEX64 = re.compile(r"[0-9a-f]{64}\Z")
_ROLES = (
    "source_blocker",
    "first_apex_blocker",
    "opp_apex1",
    "opp_apex2",
    "surplus_apex",
)
_ARMS = {"source", "other"}
_DELETED_IDENTITIES = {
    "source": "Q.source.1",
    "other": "Q.otherOutsidePoint",
}


class SourceAdapterError(ValueError):
    """The finite packet is not entitled to enter the metric lane."""


def _strict_object(value: object, keys: set[str], where: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != keys:
        raise SourceAdapterError(f"{where} has an inexact field set")
    return dict(value)


def _sha256(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def _int(value: object, where: str, *, minimum: int | None = None) -> int:
    if type(value) is not int or (minimum is not None and value < minimum):
        raise SourceAdapterError(f"{where} must be an integer")
    return value


def _permutation(value: object, n: int, where: str) -> tuple[int, ...]:
    if (
        type(value) is not list
        or len(value) != n
        or any(type(x) is not int for x in value)
    ):
        raise SourceAdapterError(f"{where} must list every boundary label")
    result = tuple(value)
    if sorted(result) != list(range(n)):
        raise SourceAdapterError(f"{where} is not a permutation of 0..n-1")
    return result


def _support(value: object, n: int, center: int, where: str) -> tuple[int, ...]:
    if type(value) is not list or len(value) != 4:
        raise SourceAdapterError(f"{where} must contain exactly four points")
    if any(type(x) is not int or not 0 <= x < n for x in value):
        raise SourceAdapterError(f"{where} contains an invalid point")
    result = tuple(sorted(value))
    if len(set(result)) != 4 or center in result:
        raise SourceAdapterError(f"{where} is not a four-class support")
    return result


def _validate_packet(raw: object) -> dict[str, Any]:
    packet = _strict_object(
        raw,
        {
            "schema",
            "packet_id",
            "n",
            "profile",
            "order",
            "deleted",
            "centers",
            "rows",
            "provenance",
        },
        "packet",
    )
    if packet["schema"] != PACKET_SCHEMA:
        raise SourceAdapterError("packet schema is unsupported")
    packet_id = packet["packet_id"]
    if type(packet_id) is not str or not re.fullmatch(r"[0-9a-f]{20}", packet_id):
        raise SourceAdapterError("packet_id must be 20 lowercase hex digits")
    n = _int(packet["n"], "packet.n", minimum=3)
    profile = packet["profile"]
    if (
        type(profile) is not list
        or not profile
        or any(type(x) is not int or x < 0 for x in profile)
    ):
        raise SourceAdapterError("packet.profile must be a nonnegative integer list")
    if sum(profile) - 3 != n:
        raise SourceAdapterError(
            "packet.profile must satisfy the cap-cardinality identity sum(profile)-3=n"
        )
    order = _permutation(packet["order"], n, "packet.order")
    deleted = _int(packet["deleted"], "packet.deleted")
    if not 0 <= deleted < n:
        raise SourceAdapterError("packet.deleted is outside the carrier")

    centers = _strict_object(packet["centers"], set(_ROLES), "packet.centers")
    parsed_centers: dict[str, int] = {}
    for role in _ROLES:
        center = _int(centers[role], f"packet.centers.{role}")
        if not 0 <= center < n:
            raise SourceAdapterError(f"packet.centers.{role} is outside the carrier")
        parsed_centers[role] = center
    if len(set(parsed_centers.values())) != len(_ROLES):
        raise SourceAdapterError("the five source centers are not distinct")
    if deleted in parsed_centers.values():
        raise SourceAdapterError("deleted point must differ from every named center")

    rows = packet["rows"]
    if type(rows) is not list or len(rows) != len(_ROLES):
        raise SourceAdapterError("packet.rows must contain exactly five rows")
    parsed_rows: list[dict[str, Any]] = []
    seen_roles: set[str] = set()
    for index, raw_row in enumerate(rows):
        row = _strict_object(
            raw_row, {"role", "center", "support", "exact"}, f"packet.rows[{index}]"
        )
        role = row["role"]
        if role not in _ROLES or role in seen_roles:
            raise SourceAdapterError(
                "packet row roles must be a permutation of the five centers"
            )
        seen_roles.add(role)
        center = _int(row["center"], f"packet.rows[{index}].center")
        if center != parsed_centers[role]:
            raise SourceAdapterError("row center disagrees with its role center")
        support = _support(row["support"], n, center, f"packet.rows[{index}].support")
        if deleted in support:
            raise SourceAdapterError("deleted point occurs in a q-deleted row")
        if row["exact"] is not True:
            raise SourceAdapterError("all five outside-pair rows must be exact")
        parsed_rows.append(
            {"role": role, "center": center, "support": list(support), "exact": True}
        )

    provenance = _strict_object(
        packet["provenance"],
        {
            "arm",
            "deleted_identity",
            "lean_declaration",
            "centers_distinct",
            "q_deleted",
            "outside_pair",
        },
        "packet.provenance",
    )
    if provenance["arm"] not in _ARMS:
        raise SourceAdapterError(
            "provenance.arm must identify the source or other outside point"
        )
    if (
        type(provenance["deleted_identity"]) is not str
        or not provenance["deleted_identity"]
    ):
        raise SourceAdapterError("provenance.deleted_identity is required")
    if provenance["deleted_identity"] != _DELETED_IDENTITIES[provenance["arm"]]:
        raise SourceAdapterError(
            "provenance.deleted_identity disagrees with provenance.arm"
        )
    if (
        provenance["lean_declaration"]
        != "false_of_capSource_firstFiber_outsidePairDeletionExactRows"
    ):
        raise SourceAdapterError("packet is not tied to the live FirstFiber leaf")
    for field in ("centers_distinct", "q_deleted", "outside_pair"):
        if provenance[field] is not True:
            raise SourceAdapterError(f"provenance.{field} must be proved true")
    return {
        "schema": PACKET_SCHEMA,
        "packet_id": packet_id,
        "n": n,
        "profile": list(profile),
        "order": list(order),
        "deleted": deleted,
        "centers": parsed_centers,
        "rows": sorted(
            parsed_rows, key=lambda row: (_ROLES.index(row["role"]), row["center"])
        ),
        "provenance": provenance,
    }


def normalize_source(raw: object) -> dict[str, Any]:
    """Validate and normalize a source extractor artifact."""

    source = _strict_object(raw, {"schema", "source_revision", "packets"}, "source")
    if source["schema"] != SCHEMA:
        raise SourceAdapterError("source schema is unsupported")
    revision = _strict_object(
        source["source_revision"],
        {"lean_path", "lean_sha256", "declaration"},
        "source_revision",
    )
    if type(revision["lean_path"]) is not str or not revision["lean_path"].endswith(
        ".lean"
    ):
        raise SourceAdapterError("source_revision.lean_path must name a Lean file")
    if (
        type(revision["lean_sha256"]) is not str
        or _HEX64.fullmatch(revision["lean_sha256"]) is None
    ):
        raise SourceAdapterError("source_revision.lean_sha256 is invalid")
    if (
        revision["declaration"]
        != "false_of_capSource_firstFiber_outsidePairDeletionExactRows"
    ):
        raise SourceAdapterError("source revision is not the live FirstFiber leaf")
    packets = source["packets"]
    if type(packets) is not list or not packets:
        raise SourceAdapterError("source.packets must be nonempty")
    normalized = [_validate_packet(packet) for packet in packets]
    ids = [packet["packet_id"] for packet in normalized]
    if ids != sorted(ids) or len(ids) != len(set(ids)):
        raise SourceAdapterError("packet IDs must be unique and sorted")
    return {
        "schema": SCHEMA,
        "source_revision": revision,
        "packets": normalized,
    }


def as_metric_system(packet: Mapping[str, Any]) -> dict[str, Any]:
    """Project one validated packet to the explicit-order metric system shape."""

    normalized = _validate_packet(packet)
    rows = [
        {key: row[key] for key in ("center", "support", "exact")}
        for row in normalized["rows"]
    ]
    payload = {
        "n": normalized["n"],
        "profile": normalized["profile"],
        "order": normalized["order"],
        "rows": rows,
    }
    system_id = _sha256(
        json.dumps(payload, sort_keys=True, separators=(",", ":")).encode()
    )[:20]
    return {
        "system_id": system_id,
        **payload,
        "sources": [
            {
                "packet_id": normalized["packet_id"],
                "provenance": normalized["provenance"],
            }
        ],
    }


def as_metric_payload(source: Mapping[str, Any]) -> dict[str, Any]:
    """Project a validated source artifact to explicit-order metric systems."""

    normalized = normalize_source(source)
    return {
        "schema": METRIC_SCHEMA,
        "source_revision": normalized["source_revision"],
        "systems": [as_metric_system(packet) for packet in normalized["packets"]],
    }


def load_source(path: Path) -> dict[str, Any]:
    """Read and validate one immutable JSON source artifact."""

    raw = path.read_bytes()
    source = normalize_source(json.loads(raw))
    revision_path = PurePosixPath(source["source_revision"]["lean_path"])
    if revision_path.is_absolute() or ".." in revision_path.parts:
        raise SourceAdapterError(
            "source_revision.lean_path must stay within the repository"
        )
    lean_path = Path.cwd().joinpath(*revision_path.parts)
    try:
        lean_raw = lean_path.read_bytes()
    except OSError as exc:
        raise SourceAdapterError("declared Lean source cannot be read") from exc
    if _sha256(lean_raw) != source["source_revision"]["lean_sha256"]:
        raise SourceAdapterError("declared Lean source digest does not match its bytes")
    if _sha256(path.read_bytes()) != _sha256(raw):
        raise SourceAdapterError("source changed during capture")
    return source
