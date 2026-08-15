"""Closed semantic profiles for assumption-CNF campaigns.

Profile JSON selects a reviewed profile and replay implementation through a
closed registry.  It cannot name an import path or inject a callback.  The
parsed profile retains only finite metadata and the exact digest of the raw
profile bytes; parent CNF bytes are streamed later by the reviewed replay API.
"""

from __future__ import annotations

import base64
import hashlib
import json
import re
from dataclasses import dataclass, fields, is_dataclass
from pathlib import Path, PurePosixPath
from typing import Any, Final

from .phase3_cegar_wave import canonical_json_bytes

CHILD44_SCHEMA: Final = "p97-exact17-child44-nextcenter-cells/v1"
CHILD44_PROFILE_ID: Final = "exact17-child44-nextcenter"
CHILD45_SCHEMA: Final = "p97-exact17-child45-nextcenter-cells/v1"
CHILD45_PROFILE_ID: Final = "exact17-child45-nextcenter"
ASSUMPTION_PROFILE_METADATA_SCHEMA: Final = "p97-assumption-cnf-profile-metadata/v1"
ASSUMPTION_SAT_RESULT_SCHEMA: Final = "p97-assumption-cnf-sat-result/v1"

_HEX = re.compile(r"^[0-9a-f]{64}$")
_UUID = re.compile(
    r"^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$"
)
_TOP_REQUIRED = frozenset(
    {
        "schema",
        "status",
        "evidence_scope",
        "parent",
        "solver",
        "variable_map",
        "identity_fields",
        "coverage",
        "cells",
        "result_contract",
    }
)
_PARENT_KEYS = frozenset(
    {
        "job_id",
        "root_sha256",
        "producer_manifest_sha256",
        "variables",
        "clauses",
        "bytes",
    }
)
_SOURCE_PARENT_KEYS = frozenset({"path", "sha256", "variables", "clauses", "bytes"})
_SOLVER_KEYS = frozenset(
    {"name", "sha256", "protocol_version", "lane", "conflict_limit", "timeout_ms"}
)
_VARIABLE_MAP_KEYS = frozenset(
    {"next_center_formula", "named_order_formula", "named_order_is_not_fixed_by_cell"}
)
_COVERAGE_KEYS = frozenset(
    {
        "legal_next_centers",
        "excluded_old_centers",
        "lean_antecedent",
        "lean_ingress_candidate",
        "coverage_required_before_promotion",
    }
)
_CELL_KEYS = frozenset({"id", "next_center", "assumptions"})
_RESULT_KEYS = frozenset(
    {"sat", "unsat", "unknown", "linearly_infeasible", "kalmanson_feasible"}
)
_CANARY_KEYS = frozenset(
    {"session_id", "assumptions", "status", "timeout_ms", "result_sha256", "note"}
)
_LEGAL_CENTERS = (0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16)
_OLD_CENTERS = (8, 9, 10, 11)
_IDENTITY_FIELDS = (
    "schema",
    "parent.root_sha256",
    "parent.producer_manifest_sha256",
    "cell.id",
    "cell.assumptions",
    "solver.name",
    "solver.sha256",
    "solver.protocol_version",
    "solver.conflict_limit",
)
_EXPECTED_RESULT_CONTRACT = (
    (
        "sat",
        "complete model replay against the authenticated session journal, signed assumptions, raw parent CNF, and source-semantic decoder; then complete exact Kalmanson replay",
    ),
    (
        "unsat",
        "discovery only until static handoff materializes parent plus unit clause and an independent proof replay succeeds",
    ),
    (
        "unknown",
        "cell remains open; receipt must bind deterministic conflict limit and session continuity",
    ),
    (
        "linearly_infeasible",
        "extract and independently replay a minimal positive weighted Kalmanson certificate before any learned clause is admitted",
    ),
    (
        "kalmanson_feasible",
        "retire Kalmanson refinement for that model and route to Euclidean EDM/Ptolemy realizability",
    ),
)


class AssumptionProfileError(ValueError):
    """The profile or an exact SAT replay failed closed."""


@dataclass(frozen=True)
class AssumptionCellProfile:
    """One canonical assumption cell in a finite campaign partition."""

    id: str
    next_center: int
    assumptions: tuple[int, ...]


@dataclass(frozen=True)
class AssumptionCampaignProfile:
    """Immutable, byte-addressed metadata for one closed campaign."""

    schema: str
    profile_id: str
    raw_sha256: str
    status: str
    evidence_scope: str
    parent_job_id: str
    parent_sha256: str
    producer_manifest_sha256: str
    variables: int
    clauses: int
    parent_byte_count: int
    solver_name: str
    solver_sha256: str
    solver_protocol_version: int
    solver_lane: str
    conflict_limit: int
    timeout_ms: int | None
    identity_fields: tuple[str, ...]
    legal_next_centers: tuple[int, ...]
    excluded_old_centers: tuple[int, ...]
    lean_antecedent: str
    lean_ingress_candidate: str
    coverage_required_before_promotion: bool
    cells: tuple[AssumptionCellProfile, ...]
    result_contract: tuple[tuple[str, str], ...]
    source_parent_path: str | None = None
    source_parent_sha256: str | None = None
    source_parent_variables: int | None = None
    source_parent_clauses: int | None = None
    source_parent_byte_count: int | None = None

    def cell(self, cell_id: str) -> AssumptionCellProfile:
        """Return a reviewed cell by exact ID."""

        if type(cell_id) is not str:
            raise AssumptionProfileError("cell id must be a builtin string")
        for cell in self.cells:
            if cell.id == cell_id:
                return cell
        raise AssumptionProfileError(f"unknown assumption cell: {cell_id}")


def _fail(message: str) -> None:
    raise AssumptionProfileError(message)


def _dict(value: object, keys: frozenset[str], label: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != keys:
        _fail(f"{label} keys drifted")
    return value


def _string(value: object, label: str) -> str:
    if type(value) is not str or not value:
        _fail(f"{label} must be a nonempty builtin string")
    return value


def _integer(value: object, label: str, *, positive: bool = False) -> int:
    if type(value) is not int or (positive and value <= 0):
        qualifier = "positive " if positive else ""
        _fail(f"{label} must be a {qualifier}builtin int")
    return value


def _sha(value: object, label: str) -> str:
    if type(value) is not str or _HEX.fullmatch(value) is None:
        _fail(f"{label} must be a lowercase SHA-256")
    return value


def _uuid(value: object, label: str) -> str:
    if type(value) is not str or _UUID.fullmatch(value) is None:
        _fail(f"{label} must be a canonical UUID")
    return value


def _list(value: object, label: str) -> list[Any]:
    if type(value) is not list:
        _fail(f"{label} must be a builtin list")
    return value


def _reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            _fail(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _parse_json(raw: bytes) -> dict[str, Any]:
    if type(raw) is not bytes or not raw:
        _fail("profile bytes must be nonempty builtin bytes")
    try:
        text = raw.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise AssumptionProfileError("profile is not UTF-8") from exc
    try:
        payload = json.loads(text, object_pairs_hook=_reject_duplicates)
    except (json.JSONDecodeError, AssumptionProfileError) as exc:
        if isinstance(exc, AssumptionProfileError):
            raise
        raise AssumptionProfileError("profile is not valid JSON") from exc
    if type(payload) is not dict:
        _fail("profile root must be a builtin object")
    return payload


def _validate_canary(
    value: object, production_cells: tuple[AssumptionCellProfile, ...]
) -> None:
    """Validate optional diagnostics without treating them as evidence."""

    canary = _dict(value, _CANARY_KEYS, "first_canary")
    _uuid(canary["session_id"], "first_canary.session_id")
    assumptions = tuple(
        _integer(item, "first_canary.assumptions[]")
        for item in _list(canary["assumptions"], "first_canary.assumptions")
    )
    if not assumptions or len(set(assumptions)) != len(assumptions):
        _fail("first_canary assumptions must be nonempty and unique")
    _string(canary["status"], "first_canary.status")
    _integer(canary["timeout_ms"], "first_canary.timeout_ms", positive=True)
    _sha(canary["result_sha256"], "first_canary.result_sha256")
    _string(canary["note"], "first_canary.note")
    if assumptions in {cell.assumptions for cell in production_cells}:
        _fail("first_canary must not impersonate a production cell")


def _parse_profile(
    payload: dict[str, Any],
    raw_sha256: str,
    *,
    schema: str,
    profile_id: str,
    label: str,
    parent_identity: tuple[str, str, int, int, int, str],
    source_parent_required: bool,
) -> AssumptionCampaignProfile:
    allowed = _TOP_REQUIRED | {"first_canary"}
    if source_parent_required:
        if "source_parent" not in payload:
            _fail("Child45 source_parent is required")
        allowed = allowed | {"source_parent"}
    if not (_TOP_REQUIRED <= set(payload) <= allowed):
        _fail("profile keys drifted")
    if payload["schema"] != schema:
        _fail(f"{label} schema drifted")
    if payload["status"] != "DESIGN_ONLY_NOT_SUBMITTED":
        _fail(f"{label} profile status is not the reviewed finite discovery status")
    expected_scope = "source-total exact-17 finite placement partition; no cell verdicts or closure claim"
    if payload["evidence_scope"] != expected_scope:
        _fail(f"{label} evidence scope drifted")

    parent = _dict(payload["parent"], _PARENT_KEYS, "parent")
    parent_job_id = _uuid(parent["job_id"], "parent.job_id")
    parent_sha = _sha(parent["root_sha256"], "parent.root_sha256")
    producer_sha = _sha(
        parent["producer_manifest_sha256"], "parent.producer_manifest_sha256"
    )
    variables = _integer(parent["variables"], "parent.variables", positive=True)
    clauses = _integer(parent["clauses"], "parent.clauses", positive=True)
    byte_count = _integer(parent["bytes"], "parent.bytes", positive=True)
    (
        expected_parent_sha,
        expected_producer_sha,
        expected_variables,
        expected_clauses,
        expected_bytes,
        expected_job_id,
    ) = parent_identity
    if (
        parent_sha != expected_parent_sha
        or producer_sha != expected_producer_sha
        or (variables, clauses, byte_count)
        != (expected_variables, expected_clauses, expected_bytes)
        or parent_job_id != expected_job_id
    ):
        _fail(f"{label} parent identity or dimensions drifted")

    source_parent_path = None
    source_parent_sha = None
    source_parent_variables = None
    source_parent_clauses = None
    source_parent_byte_count = None
    if source_parent_required:
        source_parent = _dict(
            payload["source_parent"], _SOURCE_PARENT_KEYS, "source_parent"
        )
        source_parent_path = _string(source_parent["path"], "source_parent.path")
        normalized_source_parent = PurePosixPath(source_parent_path)
        if (
            normalized_source_parent.is_absolute()
            or any(part in {"", ".", ".."} for part in normalized_source_parent.parts)
            or normalized_source_parent.as_posix() != source_parent_path
        ):
            _fail("source_parent.path must be a normalized repo-relative path")
        source_parent_sha = _sha(source_parent["sha256"], "source_parent.sha256")
        source_parent_variables = _integer(
            source_parent["variables"], "source_parent.variables", positive=True
        )
        source_parent_clauses = _integer(
            source_parent["clauses"], "source_parent.clauses", positive=True
        )
        source_parent_byte_count = _integer(
            source_parent["bytes"], "source_parent.bytes", positive=True
        )
        if (
            source_parent_path
            != "scratch/exact17-lean-to-sat/exact17-forty-fourth-root-forty-third-model-refinements.cnf"
            or source_parent_sha
            != "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
            or (
                source_parent_variables,
                source_parent_clauses,
                source_parent_byte_count,
            )
            != (308, 5_848_820, 291_704_790)
        ):
            _fail("Child45 source-parent identity or dimensions drifted")

    solver = _dict(payload["solver"], _SOLVER_KEYS, "solver")
    solver_name = _string(solver["name"], "solver.name")
    solver_sha = _sha(solver["sha256"], "solver.sha256")
    protocol = _integer(
        solver["protocol_version"], "solver.protocol_version", positive=True
    )
    lane = _string(solver["lane"], "solver.lane")
    conflict_limit = _integer(
        solver["conflict_limit"], "solver.conflict_limit", positive=True
    )
    timeout = solver["timeout_ms"]
    if timeout is not None:
        _integer(timeout, "solver.timeout_ms", positive=True)
    if (
        solver_name != "piqd-satworker-cadical-3.0.0"
        or solver_sha
        != "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
        or protocol != 1
        or lane != "sat"
        or conflict_limit != 3000
        or timeout is not None
    ):
        _fail("Child44 solver contract drifted")

    variable_map = _dict(payload["variable_map"], _VARIABLE_MAP_KEYS, "variable_map")
    if variable_map != {
        "next_center_formula": "290 + center",
        "named_order_formula": "307 + order",
        "named_order_is_not_fixed_by_cell": True,
    }:
        _fail(f"{label} variable map drifted")

    identity_fields = tuple(
        _string(item, "identity_fields[]")
        for item in _list(payload["identity_fields"], "identity_fields")
    )
    if identity_fields != _IDENTITY_FIELDS or len(set(identity_fields)) != len(
        identity_fields
    ):
        _fail(f"{label} identity fields drifted")

    coverage = _dict(payload["coverage"], _COVERAGE_KEYS, "coverage")
    legal = tuple(
        _integer(item, "coverage.legal_next_centers[]")
        for item in _list(coverage["legal_next_centers"], "coverage.legal_next_centers")
    )
    excluded = tuple(
        _integer(item, "coverage.excluded_old_centers[]")
        for item in _list(
            coverage["excluded_old_centers"], "coverage.excluded_old_centers"
        )
    )
    if legal != _LEGAL_CENTERS or excluded != _OLD_CENTERS:
        _fail(f"{label} legal-center coverage drifted")
    antecedent = _string(coverage["lean_antecedent"], "coverage.lean_antecedent")
    ingress = _string(
        coverage["lean_ingress_candidate"], "coverage.lean_ingress_candidate"
    )
    if (
        antecedent
        != "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel.nextCenter_not_old"
        or ingress
        != "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel.nextCenter_mem_legalNextCenterLabels"
        or coverage["coverage_required_before_promotion"] is not True
    ):
        _fail(f"{label} coverage proof binding drifted")

    raw_cells = _list(payload["cells"], "cells")
    cells: list[AssumptionCellProfile] = []
    for index, value in enumerate(raw_cells):
        item = _dict(value, _CELL_KEYS, f"cells[{index}]")
        cell_id = _string(item["id"], f"cells[{index}].id")
        center = _integer(item["next_center"], f"cells[{index}].next_center")
        assumptions = tuple(
            _integer(literal, f"cells[{index}].assumptions[]")
            for literal in _list(item["assumptions"], f"cells[{index}].assumptions")
        )
        cells.append(AssumptionCellProfile(cell_id, center, assumptions))
    expected_cells = tuple(
        AssumptionCellProfile(f"next-center-{center:02d}", center, (290 + center,))
        for center in _LEGAL_CENTERS
    )
    frozen_cells = tuple(cells)
    if frozen_cells != expected_cells:
        _fail(f"{label} cells are not the canonical ordered legal-center partition")
    if (
        len({cell.id for cell in frozen_cells}) != len(frozen_cells)
        or len({cell.assumptions for cell in frozen_cells}) != len(frozen_cells)
        or tuple(cell.next_center for cell in frozen_cells) != legal
    ):
        _fail(f"{label} cells are duplicate or incomplete")

    result = _dict(payload["result_contract"], _RESULT_KEYS, "result_contract")
    result_contract = tuple(
        (key, _string(result[key], f"result_contract.{key}"))
        for key, _expected in _EXPECTED_RESULT_CONTRACT
    )
    if result_contract != _EXPECTED_RESULT_CONTRACT:
        _fail(f"{label} finite/discovery-only result contract drifted")
    if "first_canary" in payload:
        _validate_canary(payload["first_canary"], frozen_cells)

    return AssumptionCampaignProfile(
        schema=schema,
        profile_id=profile_id,
        raw_sha256=raw_sha256,
        status=payload["status"],
        evidence_scope=payload["evidence_scope"],
        parent_job_id=parent_job_id,
        parent_sha256=parent_sha,
        producer_manifest_sha256=producer_sha,
        variables=variables,
        clauses=clauses,
        parent_byte_count=byte_count,
        solver_name=solver_name,
        solver_sha256=solver_sha,
        solver_protocol_version=protocol,
        solver_lane=lane,
        conflict_limit=conflict_limit,
        timeout_ms=timeout,
        identity_fields=identity_fields,
        legal_next_centers=legal,
        excluded_old_centers=excluded,
        lean_antecedent=antecedent,
        lean_ingress_candidate=ingress,
        coverage_required_before_promotion=True,
        cells=frozen_cells,
        result_contract=result_contract,
        source_parent_path=source_parent_path,
        source_parent_sha256=source_parent_sha,
        source_parent_variables=source_parent_variables,
        source_parent_clauses=source_parent_clauses,
        source_parent_byte_count=source_parent_byte_count,
    )


def _parse_child44(
    payload: dict[str, Any], raw_sha256: str
) -> AssumptionCampaignProfile:
    return _parse_profile(
        payload,
        raw_sha256,
        schema=CHILD44_SCHEMA,
        profile_id=CHILD44_PROFILE_ID,
        label="Child44",
        parent_identity=(
            "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9",
            "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048",
            308,
            5_848_820,
            291_704_790,
            "f717c352-2456-412a-ae45-d910f47d3e94",
        ),
        source_parent_required=False,
    )


def _parse_child45(
    payload: dict[str, Any], raw_sha256: str
) -> AssumptionCampaignProfile:
    return _parse_profile(
        payload,
        raw_sha256,
        schema=CHILD45_SCHEMA,
        profile_id=CHILD45_PROFILE_ID,
        label="Child45",
        parent_identity=(
            "3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2",
            "f790a9ea3f9100f0d63a61b8cc197d3417eaa9c553d578c1157413690157908a",
            308,
            5_848_824,
            291_704_992,
            "8726dcec-978e-4fdc-8ca0-c33d14197c81",
        ),
        source_parent_required=True,
    )


_PROFILE_REGISTRY: Final = {
    CHILD44_SCHEMA: (CHILD44_PROFILE_ID, _parse_child44, "child44"),
    CHILD45_SCHEMA: (CHILD45_PROFILE_ID, _parse_child45, "child45"),
}


def parse_assumption_campaign_profile(raw: bytes) -> AssumptionCampaignProfile:
    """Parse strict JSON, reject duplicate keys, and bind its exact raw digest."""

    payload = _parse_json(raw)
    schema = payload.get("schema")
    if type(schema) is not str or schema not in _PROFILE_REGISTRY:
        _fail(f"unknown assumption campaign schema: {schema!r}")
    _profile_id, parser, _replay_code = _PROFILE_REGISTRY[schema]
    return parser(payload, hashlib.sha256(raw).hexdigest())


def load_assumption_campaign_profile(path: Path) -> AssumptionCampaignProfile:
    """Read and parse a profile without retaining its source or parent bytes."""

    if type(path) is not type(Path()) or not path.is_absolute():
        _fail("profile path must be an absolute native Path")
    return parse_assumption_campaign_profile(path.read_bytes())


def assumption_campaign_metadata(profile: AssumptionCampaignProfile) -> dict[str, Any]:
    """Return canonical engine ingress metadata; no CNF bytes or path are retained."""

    _require_registered_profile(profile)
    metadata = {
        "schema": ASSUMPTION_PROFILE_METADATA_SCHEMA,
        "profile_schema": profile.schema,
        "profile_id": profile.profile_id,
        "profile_sha256": profile.raw_sha256,
        "parent": {
            "job_id": profile.parent_job_id,
            "sha256": profile.parent_sha256,
            "producer_manifest_sha256": profile.producer_manifest_sha256,
            "variables": profile.variables,
            "clauses": profile.clauses,
            "bytes": profile.parent_byte_count,
        },
        "solver": {
            "name": profile.solver_name,
            "sha256": profile.solver_sha256,
            "protocol_version": profile.solver_protocol_version,
            "lane": profile.solver_lane,
            "conflict_limit": profile.conflict_limit,
            "timeout_ms": profile.timeout_ms,
        },
        "identity_fields": list(profile.identity_fields),
        "coverage": {
            "legal_next_centers": list(profile.legal_next_centers),
            "excluded_old_centers": list(profile.excluded_old_centers),
            "required_before_promotion": profile.coverage_required_before_promotion,
        },
        "cells": [
            {
                "id": cell.id,
                "next_center": cell.next_center,
                "assumptions": list(cell.assumptions),
            }
            for cell in profile.cells
        ],
        "result_contract": dict(profile.result_contract),
    }
    if profile.source_parent_path is not None:
        metadata["source_parent"] = {
            "path": profile.source_parent_path,
            "sha256": profile.source_parent_sha256,
            "variables": profile.source_parent_variables,
            "clauses": profile.source_parent_clauses,
            "bytes": profile.source_parent_byte_count,
        }
    return metadata


def _require_registered_profile(profile: object) -> AssumptionCampaignProfile:
    if type(profile) is not AssumptionCampaignProfile:
        _fail("profile must be an exact AssumptionCampaignProfile")
    expected_cells = tuple(
        AssumptionCellProfile(f"next-center-{center:02d}", center, (290 + center,))
        for center in _LEGAL_CENTERS
    )
    if profile.schema == CHILD45_SCHEMA:
        if (
            profile.profile_id != CHILD45_PROFILE_ID
            or type(profile.raw_sha256) is not str
            or _HEX.fullmatch(profile.raw_sha256) is None
            or profile.status != "DESIGN_ONLY_NOT_SUBMITTED"
            or profile.evidence_scope
            != "source-total exact-17 finite placement partition; no cell verdicts or closure claim"
            or profile.parent_job_id != "8726dcec-978e-4fdc-8ca0-c33d14197c81"
            or profile.parent_sha256
            != "3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2"
            or profile.producer_manifest_sha256
            != "f790a9ea3f9100f0d63a61b8cc197d3417eaa9c553d578c1157413690157908a"
            or (profile.variables, profile.clauses, profile.parent_byte_count)
            != (308, 5_848_824, 291_704_992)
            or profile.source_parent_path
            != "scratch/exact17-lean-to-sat/exact17-forty-fourth-root-forty-third-model-refinements.cnf"
            or profile.source_parent_sha256
            != "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
            or (
                profile.source_parent_variables,
                profile.source_parent_clauses,
                profile.source_parent_byte_count,
            )
            != (308, 5_848_820, 291_704_790)
            or (
                profile.solver_name,
                profile.solver_sha256,
                profile.solver_protocol_version,
                profile.solver_lane,
                profile.conflict_limit,
                profile.timeout_ms,
            )
            != (
                "piqd-satworker-cadical-3.0.0",
                "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
                1,
                "sat",
                3000,
                None,
            )
            or profile.identity_fields != _IDENTITY_FIELDS
            or profile.legal_next_centers != _LEGAL_CENTERS
            or profile.excluded_old_centers != _OLD_CENTERS
            or profile.lean_antecedent
            != "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel.nextCenter_not_old"
            or profile.lean_ingress_candidate
            != "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel.nextCenter_mem_legalNextCenterLabels"
            or profile.coverage_required_before_promotion is not True
            or profile.cells != expected_cells
            or profile.result_contract != _EXPECTED_RESULT_CONTRACT
        ):
            _fail("profile is not a registered reviewed value")
        return profile
    if (
        profile.schema != CHILD44_SCHEMA
        or profile.profile_id != CHILD44_PROFILE_ID
        or type(profile.raw_sha256) is not str
        or _HEX.fullmatch(profile.raw_sha256) is None
        or profile.status != "DESIGN_ONLY_NOT_SUBMITTED"
        or profile.evidence_scope
        != "source-total exact-17 finite placement partition; no cell verdicts or closure claim"
        or profile.parent_job_id != "f717c352-2456-412a-ae45-d910f47d3e94"
        or profile.parent_sha256
        != "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
        or profile.producer_manifest_sha256
        != "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048"
        or (profile.variables, profile.clauses, profile.parent_byte_count)
        != (308, 5_848_820, 291_704_790)
        or (
            profile.solver_name,
            profile.solver_sha256,
            profile.solver_protocol_version,
            profile.solver_lane,
            profile.conflict_limit,
            profile.timeout_ms,
        )
        != (
            "piqd-satworker-cadical-3.0.0",
            "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965",
            1,
            "sat",
            3000,
            None,
        )
        or profile.identity_fields != _IDENTITY_FIELDS
        or profile.legal_next_centers != _LEGAL_CENTERS
        or profile.excluded_old_centers != _OLD_CENTERS
        or profile.lean_antecedent
        != "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel.nextCenter_not_old"
        or profile.lean_ingress_candidate
        != "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel.nextCenter_mem_legalNextCenterLabels"
        or profile.coverage_required_before_promotion is not True
        or profile.cells != expected_cells
        or profile.result_contract != _EXPECTED_RESULT_CONTRACT
    ):
        _fail("campaign profile is not a registered reviewed value")
    return profile


def _child44_replay(**kwargs: Any) -> object:
    from .exact17_source_model_replay import replay_child44_assumption_sat

    return replay_child44_assumption_sat(**kwargs)


def _child45_replay(**kwargs: Any) -> object:
    from .exact17_source_model_replay import replay_child45_assumption_sat

    return replay_child45_assumption_sat(**kwargs)


_REPLAY_REGISTRY: Final = {"child44": _child44_replay, "child45": _child45_replay}


def _builtin(value: object, label: str = "result") -> Any:
    if value is None or type(value) in {str, int, bool}:
        return value
    if type(value) is bytes:
        return {
            "base64": base64.b64encode(value).decode("ascii"),
            "sha256": hashlib.sha256(value).hexdigest(),
        }
    if type(value) is tuple:
        return [_builtin(item, label) for item in value]
    if is_dataclass(value) and not isinstance(value, type):
        params = getattr(type(value), "__dataclass_params__", None)
        if params is None or not params.frozen:
            _fail(f"{label} dataclass must be frozen")
        return {
            field.name: _builtin(getattr(value, field.name), label)
            for field in fields(value)
        }
    _fail(f"{label} contains a noncanonical value of type {type(value).__name__}")


def replay_sat(
    profile: AssumptionCampaignProfile,
    *,
    parent_cnf_path: Path,
    assignment: tuple[int, ...],
    cell: AssumptionCellProfile,
    source_parent_cnf_path: Path | None = None,
) -> dict[str, Any]:
    """Run the sole registered exact SAT replay and serialize its frozen result."""

    profile = _require_registered_profile(profile)
    if type(parent_cnf_path) is not type(Path()) or not parent_cnf_path.is_absolute():
        _fail("parent CNF path must be an absolute native Path")
    if source_parent_cnf_path is not None and (
        type(source_parent_cnf_path) is not type(Path())
        or not source_parent_cnf_path.is_absolute()
    ):
        _fail("source parent CNF path must be an absolute native Path")
    if profile.schema == CHILD44_SCHEMA and source_parent_cnf_path is not None:
        _fail("Child44 replay rejects a source parent CNF path")
    if profile.schema == CHILD45_SCHEMA and source_parent_cnf_path is None:
        _fail("Child45 replay requires a source parent CNF path")
    if type(cell) is not AssumptionCellProfile or profile.cell(cell.id) != cell:
        _fail("assumption cell crossed the campaign profile")
    if (
        type(assignment) is not tuple
        or len(assignment) != profile.variables
        or any(
            type(literal) is not int or literal == 0 or abs(literal) > profile.variables
            for literal in assignment
        )
        or {abs(literal) for literal in assignment}
        != set(range(1, profile.variables + 1))
        or any(
            abs(literal) != index + 1
            for index, literal in enumerate(assignment)
        )
    ):
        _fail(
            "SAT assignment must be a canonical total signed-literal tuple "
            "ordered by variable number"
        )
    replay_code = _PROFILE_REGISTRY[profile.schema][2]
    callback = _REPLAY_REGISTRY.get(replay_code)
    if callback is None:
        _fail("profile has no registered exact SAT replay")
    callback_kwargs = {
        "parent_cnf_path": parent_cnf_path,
        "assignment": assignment,
        "cell_id": cell.id,
        "assumptions": cell.assumptions,
        "expected_parent_sha256": profile.parent_sha256,
    }
    if profile.schema == CHILD45_SCHEMA:
        callback_kwargs = {
            **callback_kwargs,
            "parent_cnf_path": source_parent_cnf_path,
            "child_cnf_path": parent_cnf_path,
            "expected_parent_sha256": profile.source_parent_sha256,
            "expected_child_sha256": profile.parent_sha256,
        }
    try:
        result = callback(**callback_kwargs)
    except Exception as exc:
        raise AssumptionProfileError("registered exact SAT replay failed") from exc
    serialized = _builtin(result)
    if type(serialized) is not dict:
        _fail("exact SAT replay did not return a frozen dataclass")
    expected = {
        "schema": (
            "p97-exact17-child45-assumption-sat-replay/v1"
            if profile.schema == CHILD45_SCHEMA
            else "p97-exact17-child44-assumption-sat-replay/v1"
        ),
        "cell_id": cell.id,
        "assumptions": list(cell.assumptions),
    }
    if profile.schema == CHILD45_SCHEMA:
        expected.update(
            {
                "parent_sha256": profile.source_parent_sha256,
                "parent_bytes": profile.source_parent_byte_count,
                "parent_variables": profile.source_parent_variables,
                "parent_clauses": profile.source_parent_clauses,
                "root_sha256": profile.parent_sha256,
                "root_bytes": profile.parent_byte_count,
                "root_variables": profile.variables,
                "root_clauses": profile.clauses,
                "suffix_sha256": "7b0518974d2dba962d45a97c193c69b2e970b46979b5471ea8c7b50eca595590",
            }
        )
    else:
        expected.update(
            {
                "parent_sha256": profile.parent_sha256,
                "parent_bytes": profile.parent_byte_count,
                "parent_variables": profile.variables,
                "parent_clauses": profile.clauses,
            }
        )
    if any(serialized.get(key) != value for key, value in expected.items()):
        _fail("exact SAT replay result crossed profile identity")
    _sha(serialized.get("result_sha256"), "exact replay result_sha256")
    envelope = {
        "schema": ASSUMPTION_SAT_RESULT_SCHEMA,
        "profile_sha256": profile.raw_sha256,
        "result": serialized,
    }
    envelope["serialization_sha256"] = hashlib.sha256(
        canonical_json_bytes(envelope)
    ).hexdigest()
    return envelope


__all__ = [
    "ASSUMPTION_PROFILE_METADATA_SCHEMA",
    "ASSUMPTION_SAT_RESULT_SCHEMA",
    "CHILD44_PROFILE_ID",
    "CHILD44_SCHEMA",
    "AssumptionCampaignProfile",
    "AssumptionCellProfile",
    "AssumptionProfileError",
    "assumption_campaign_metadata",
    "load_assumption_campaign_profile",
    "parse_assumption_campaign_profile",
    "replay_sat",
]
