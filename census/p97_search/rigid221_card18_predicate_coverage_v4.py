# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Fail-closed custody refresh for the frozen Card-18 coverage-v3 ledger.

Version 4 preserves the exact v3 candidate and source rows except for the 37
source ``custody_digest`` fields authenticated by the two custody-v2 receipts.
It does not admit clauses, run a solver, authenticate a serializer, or make a
proof claim.
"""

from __future__ import annotations

import hashlib
import json
import os
import re
from collections import Counter
from collections.abc import Mapping
from pathlib import Path
from types import MappingProxyType
from typing import Any, Final, NoReturn

from census.p97_search import (
    rigid221_card18_crossed_incidence_custody_v2 as crossed_custody_v2,
)
from census.p97_search import (
    rigid221_card18_labeled_projection_custody_v2 as labeled_custody_v2,
)
from census.p97_search import rigid221_card18_predicate_coverage_v3 as coverage_v3

SCHEMA: Final = "p97-rigid221-card18-predicate-coverage/v4"
LANE_ID_METADATA: Final = "rigid221-card18-custody-refresh-v2-20260828"
LANE_BASE_HEAD_METADATA: Final = "6d0fcc389255ac24be267636abb8f7545d63bcb7"

V3_SCHEMA: Final = "p97-rigid221-card18-predicate-coverage/v3"
V3_CONFIGURATION_SHA256: Final = (
    "2c85fb76c85513297fc64766ff3a6d6043deb9576044faf7581278e24be91ba9"
)
V3_MODULE_PATH: Final = "census/p97_search/rigid221_card18_predicate_coverage_v3.py"
V3_MODULE_BYTES: Final = 68892
V3_MODULE_SHA256: Final = (
    "0f892acee8e0d6f1e39c985b55cecaf848aa906130cb223eae42b0ee1e15b668"
)
V3_MANIFEST_PATH: Final = "certificates/rigid221_card18_predicate_coverage_v3.json"
V3_MANIFEST_BYTES: Final = 153018
V3_MANIFEST_FILE_SHA256: Final = (
    "6b909aa48ec05cb32735c81ecd6f0fe6bd820b7fb126b7e3c1700b162905d501"
)
V3_MANIFEST_SHA256: Final = (
    "818ab7814ac6ab9d926aee756b2e782e57d5138a3f3abadfaa6359e14389e9d9"
)

LABELED_CUSTODY_SCHEMA: Final = (
    "p97-rigid221-card18-labeled-projection-lean-source-custody/v2"
)
LABELED_CUSTODY_CONFIGURATION_SHA256: Final = (
    "4c3220862693a5488682b9721ba5bd58b9392c126ca81ab48566c7f20b7b2af4"
)
LABELED_CUSTODY_MODULE_PATH: Final = (
    "census/p97_search/rigid221_card18_labeled_projection_custody_v2.py"
)
LABELED_CUSTODY_MODULE_BYTES: Final = 36245
LABELED_CUSTODY_MODULE_SHA256: Final = (
    "4242ad8136a50f5656923e74505de144fee30a18379717c7e387ee49990ee9b4"
)
LABELED_CUSTODY_PATH: Final = (
    "certificates/rigid221_card18_labeled_projection_source_custody_v2.json"
)
LABELED_CUSTODY_BYTES: Final = 8499
LABELED_CUSTODY_FILE_SHA256: Final = (
    "d4ea2d9db4c538865616ced8250b8baca8ebe37963d6fd7ca44f83ffbafa5fb7"
)
LABELED_CUSTODY_RECEIPT_SHA256: Final = (
    "61fbb155d92d59809209112bbb2c57d22fb474bf62ad74a5aab1ed4310e9ec4a"
)
LABELED_CUSTODY_SOURCE_MANIFEST_SHA256: Final = (
    "aca73e5476aacfefd25b675e29a785d41a40e7b594bdccf6ed2ad4c98c3e93cc"
)

CROSSED_CUSTODY_SCHEMA: Final = (
    "p97-rigid221-card18-crossed-incidence-projection-lean-source-custody/v2"
)
CROSSED_CUSTODY_CONFIGURATION_SHA256: Final = (
    "25875b0a0ad6ef2d6ef3bcc7bfa32875d083899d2f7c8862310fe523983f0210"
)
CROSSED_CUSTODY_MODULE_PATH: Final = (
    "census/p97_search/rigid221_card18_crossed_incidence_custody_v2.py"
)
CROSSED_CUSTODY_MODULE_BYTES: Final = 36886
CROSSED_CUSTODY_MODULE_SHA256: Final = (
    "2ed04873e7bdc43c2cac79909507a6f3c0542b7fc6a73fb7bc70e72123bffde9"
)
CROSSED_CUSTODY_PATH: Final = (
    "certificates/rigid221_card18_crossed_incidence_source_custody_v2.json"
)
CROSSED_CUSTODY_BYTES: Final = 8961
CROSSED_CUSTODY_FILE_SHA256: Final = (
    "fe85bf58b97c97888599c7b03e74b46f2cdef2ef26ce0048877ba334a05297fc"
)
CROSSED_CUSTODY_RECEIPT_SHA256: Final = (
    "985ba69bb0e08d79d58259110a2c3240e4ffc0c141d5b054ee7ddb7ca5139056"
)
CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256: Final = (
    "0740aa1cefe54d9c68bc5b1852f685cdb11c8d7fba55f9b27898be59660ef90e"
)

COVERAGE_V4_MODULE_PATH: Final = (
    "census/p97_search/rigid221_card18_predicate_coverage_v4.py"
)
FROZEN_CANDIDATE_ID_SET_SHA256: Final = (
    "ca7a9c209a01eb76153f4784569a5282bd54c96734d4e4db492a61b61d616561"
)
FROZEN_CANDIDATE_ROWS_SHA256: Final = (
    "93130f6c5d8d59ccec64528653698eb7ca36b73a7eae734701e0d185d5644f3e"
)
FROZEN_SOURCE_ID_SET_SHA256: Final = (
    "a315997b0b0336787d4ea74c8de981a484541326b76911ea26c3579a363a3f9f"
)
FROZEN_SOURCE_ROWS_SHA256: Final = (
    "72b634e12de9eb68d9c2f7f451e997ba3ba54331eed9450e7c7a53d27185b7c4"
)
FROZEN_EMPTY_DELTA_ID_SET_SHA256: Final = (
    "4f53cda18c2baa0c0354bb5f9a3ecbe5ed12ab4d8e11ba873c2f11161202b945"
)
FROZEN_CUSTODY_REFRESH_ID_SET_SHA256: Final = (
    "28dc1f316c91a9c9aef64972ecfdd3f9ef034f723005afefa02db90c504ba433"
)
FROZEN_CONFIGURATION_SHA256: Final = (
    "982a54886646d6b87a96105e08fa7cc715803dc90db2260d39a1dab8451515ac"
)

_SHA256: Final = re.compile(r"[0-9a-f]{64}")
_MANIFEST_FIELDS: Final = frozenset(
    {
        "schema",
        "metadata",
        "bindings",
        "candidate_predicates",
        "lean_source_universe",
        "coverage_summary",
        "admission",
        "manifest_sha256",
    }
)
_METADATA: Final = MappingProxyType(
    {"lane_id": LANE_ID_METADATA, "lane_base_head": LANE_BASE_HEAD_METADATA}
)
_ADMISSION: Final = MappingProxyType(
    {
        "source_faithful_serializer": False,
        "python_lean_serialization_equivalence": False,
        "hard_clause_count": 0,
        "solver_admission": False,
        "canary_authorized": False,
        "proof_ready": False,
        "solver_ready": False,
        "noncomputable_projection_present": True,
    }
)


class Rigid221Card18PredicateCoverageV4Error(ValueError):
    """The frozen v4 coverage ledger or one of its bindings is invalid."""


def _fail(message: str) -> NoReturn:
    raise Rigid221Card18PredicateCoverageV4Error(message)


def _canonical_json_bytes(value: Any) -> bytes:
    try:
        return json.dumps(
            value, sort_keys=True, separators=(",", ":"), allow_nan=False
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise Rigid221Card18PredicateCoverageV4Error(
            "predicate-coverage-v4 value is not strict JSON"
        ) from exc


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _reject_duplicate_object_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            _fail(f"duplicate JSON object key: {key}")
        result[key] = value
    return result


def _reject_json_constant(value: str) -> NoReturn:
    _fail(f"non-finite JSON constant is forbidden: {value}")


def _strict_json(payload: bytes) -> Any:
    if type(payload) is not bytes:
        _fail("predicate-coverage-v4 payload is not immutable bytes")
    try:
        return json.loads(
            payload.decode("utf-8"),
            object_pairs_hook=_reject_duplicate_object_pairs,
            parse_constant=_reject_json_constant,
        )
    except Rigid221Card18PredicateCoverageV4Error:
        raise
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise Rigid221Card18PredicateCoverageV4Error(
            "predicate-coverage-v4 payload is not strict JSON"
        ) from exc


def _strict_copy(value: Any) -> Any:
    return _strict_json(_canonical_json_bytes(value))


def _candidate_rows() -> list[dict[str, Any]]:
    return _strict_copy(list(coverage_v3.frozen_v3_candidate_predicate_records()))


def _source_rows() -> list[dict[str, Any]]:
    rows = _strict_copy(list(coverage_v3.frozen_v3_lean_source_universe()))
    for row in rows:
        digest = row["custody_digest"]
        if digest == coverage_v3.LABELED_CUSTODY_SOURCE_MANIFEST_SHA256:
            row["custody_digest"] = LABELED_CUSTODY_SOURCE_MANIFEST_SHA256
        elif digest == coverage_v3.CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256:
            row["custody_digest"] = CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256
    return rows


def _custody_refresh_ids() -> list[str]:
    old_rows = list(coverage_v3.frozen_v3_lean_source_universe())
    new_rows = _source_rows()
    return [
        old["id"] for old, new in zip(old_rows, new_rows, strict=True) if old != new
    ]


def _fixed_bindings() -> dict[str, Any]:
    return {
        "coverage_v3_module": {
            "path": V3_MODULE_PATH,
            "bytes": V3_MODULE_BYTES,
            "sha256": V3_MODULE_SHA256,
            "schema": V3_SCHEMA,
            "configuration_sha256": V3_CONFIGURATION_SHA256,
        },
        "coverage_v3_manifest": {
            "path": V3_MANIFEST_PATH,
            "bytes": V3_MANIFEST_BYTES,
            "file_sha256": V3_MANIFEST_FILE_SHA256,
            "manifest_sha256": V3_MANIFEST_SHA256,
            "schema": V3_SCHEMA,
        },
        "labeled_custody_v2_module": {
            "path": LABELED_CUSTODY_MODULE_PATH,
            "bytes": LABELED_CUSTODY_MODULE_BYTES,
            "sha256": LABELED_CUSTODY_MODULE_SHA256,
            "schema": LABELED_CUSTODY_SCHEMA,
            "configuration_sha256": LABELED_CUSTODY_CONFIGURATION_SHA256,
        },
        "labeled_custody_v2_receipt": {
            "path": LABELED_CUSTODY_PATH,
            "bytes": LABELED_CUSTODY_BYTES,
            "file_sha256": LABELED_CUSTODY_FILE_SHA256,
            "receipt_sha256": LABELED_CUSTODY_RECEIPT_SHA256,
            "schema": LABELED_CUSTODY_SCHEMA,
            "source_manifest_sha256": LABELED_CUSTODY_SOURCE_MANIFEST_SHA256,
        },
        "crossed_custody_v2_module": {
            "path": CROSSED_CUSTODY_MODULE_PATH,
            "bytes": CROSSED_CUSTODY_MODULE_BYTES,
            "sha256": CROSSED_CUSTODY_MODULE_SHA256,
            "schema": CROSSED_CUSTODY_SCHEMA,
            "configuration_sha256": CROSSED_CUSTODY_CONFIGURATION_SHA256,
        },
        "crossed_custody_v2_receipt": {
            "path": CROSSED_CUSTODY_PATH,
            "bytes": CROSSED_CUSTODY_BYTES,
            "file_sha256": CROSSED_CUSTODY_FILE_SHA256,
            "receipt_sha256": CROSSED_CUSTODY_RECEIPT_SHA256,
            "schema": CROSSED_CUSTODY_SCHEMA,
            "source_manifest_sha256": CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256,
        },
    }


def _coverage_summary() -> dict[str, Any]:
    candidates = _candidate_rows()
    sources = _source_rows()
    return {
        "candidate_count": 188,
        "candidate_origin_counts": dict(
            sorted(Counter(row["origin"] for row in candidates).items())
        ),
        "candidate_id_set_sha256": FROZEN_CANDIDATE_ID_SET_SHA256,
        "candidate_rows_sha256": FROZEN_CANDIDATE_ROWS_SHA256,
        "delta_count": 0,
        "delta_id_set_sha256": FROZEN_EMPTY_DELTA_ID_SET_SHA256,
        "lean_source_count": 38,
        "lean_status_counts": dict(
            sorted(Counter(row["status"] for row in sources).items())
        ),
        "lean_source_id_set_sha256": FROZEN_SOURCE_ID_SET_SHA256,
        "lean_source_rows_sha256": FROZEN_SOURCE_ROWS_SHA256,
        "custody_refresh_count": 37,
        "custody_refresh_id_set_sha256": FROZEN_CUSTODY_REFRESH_ID_SET_SHA256,
    }


def _configuration_snapshot() -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "metadata": dict(_METADATA),
        "coverage_module_path": COVERAGE_V4_MODULE_PATH,
        "fixed_bindings": _fixed_bindings(),
        "candidate_rows": _candidate_rows(),
        "lean_source_rows": _source_rows(),
        "custody_refresh_ids": _custody_refresh_ids(),
        "coverage_summary": _coverage_summary(),
        "admission": dict(_ADMISSION),
        "manifest_fields": sorted(_MANIFEST_FIELDS),
    }


def _assert_frozen_configuration() -> None:
    try:
        if (
            coverage_v3.SCHEMA != V3_SCHEMA
            or coverage_v3.FROZEN_CONFIGURATION_SHA256 != V3_CONFIGURATION_SHA256
            or labeled_custody_v2.SCHEMA != LABELED_CUSTODY_SCHEMA
            or labeled_custody_v2.FROZEN_CONFIGURATION_SHA256
            != LABELED_CUSTODY_CONFIGURATION_SHA256
            or crossed_custody_v2.SCHEMA != CROSSED_CUSTODY_SCHEMA
            or crossed_custody_v2.FROZEN_CONFIGURATION_SHA256
            != CROSSED_CUSTODY_CONFIGURATION_SHA256
        ):
            _fail("imported predecessor or custody-v2 configuration is stale")
        labeled_manifest = list(
            labeled_custody_v2.frozen_labeled_projection_lean_source_manifest()
        )
        crossed_manifest = list(
            crossed_custody_v2.frozen_crossed_incidence_lean_source_manifest()
        )
        if (
            len(labeled_manifest) != 26
            or len(crossed_manifest) != 27
            or _sha256_json(labeled_manifest) != LABELED_CUSTODY_SOURCE_MANIFEST_SHA256
            or _sha256_json(crossed_manifest) != CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256
            or any("ExactA2CapMetric" in row["module"] for row in labeled_manifest)
            or any("ExactA2CapMetric" in row["module"] for row in crossed_manifest)
        ):
            _fail("custody-v2 source manifests have drifted")
        candidates = _candidate_rows()
        sources = _source_rows()
        refresh_ids = _custody_refresh_ids()
        old_sources = list(coverage_v3.frozen_v3_lean_source_universe())
        if (
            len(candidates) != 188
            or len(sources) != 38
            or [row["id"] for row in candidates]
            != sorted(row["id"] for row in candidates)
            or [row["id"] for row in sources] != sorted(row["id"] for row in sources)
            or len(refresh_ids) != 37
            or refresh_ids != sorted(refresh_ids)
            or _sha256_json([row["id"] for row in candidates])
            != FROZEN_CANDIDATE_ID_SET_SHA256
            or _sha256_json(candidates) != FROZEN_CANDIDATE_ROWS_SHA256
            or _sha256_json([row["id"] for row in sources])
            != FROZEN_SOURCE_ID_SET_SHA256
            or _sha256_json(sources) != FROZEN_SOURCE_ROWS_SHA256
            or _sha256_json(refresh_ids) != FROZEN_CUSTODY_REFRESH_ID_SET_SHA256
            or _sha256_json([]) != FROZEN_EMPTY_DELTA_ID_SET_SHA256
        ):
            _fail("frozen v4 candidate/source rows or hashes have drifted")
        for old, new in zip(old_sources, sources, strict=True):
            if old["id"] != new["id"]:
                _fail("v4 source IDs diverge from v3")
            changed = {key for key in old if old[key] != new[key]}
            if old["id"] in refresh_ids:
                if changed != {"custody_digest"}:
                    _fail("v4 custody refresh changes a non-custody source field")
            elif old != new:
                _fail("v4 changes a non-refresh source row")
        if candidates != list(coverage_v3.frozen_v3_candidate_predicate_records()):
            _fail("v4 changes a v3 candidate row")
        if _sha256_json(_configuration_snapshot()) != FROZEN_CONFIGURATION_SHA256:
            _fail("frozen predicate-coverage-v4 configuration digest drifted")
    except Rigid221Card18PredicateCoverageV4Error:
        raise
    except (AttributeError, KeyError, TypeError, ValueError) as exc:
        raise Rigid221Card18PredicateCoverageV4Error(
            "frozen predicate-coverage-v4 configuration is malformed"
        ) from exc


def frozen_v4_candidate_predicate_records() -> tuple[dict[str, Any], ...]:
    """Return independent copies of the exact 188 v4 candidate rows."""

    _assert_frozen_configuration()
    return tuple(_candidate_rows())


def frozen_v4_lean_source_universe() -> tuple[dict[str, Any], ...]:
    """Return independent copies of the exact 38 v4 source rows."""

    _assert_frozen_configuration()
    return tuple(_source_rows())


def _binding_with_module(module_record: Mapping[str, Any]) -> dict[str, Any]:
    bindings = _fixed_bindings()
    bindings["coverage_v4_module"] = dict(module_record)
    return bindings


def _validate_module_record(value: Any) -> None:
    if (
        type(value) is not dict
        or set(value) != {"path", "bytes", "sha256"}
        or value.get("path") != COVERAGE_V4_MODULE_PATH
        or type(value.get("bytes")) is not int
        or value["bytes"] < 0
        or type(value.get("sha256")) is not str
        or _SHA256.fullmatch(value["sha256"]) is None
    ):
        _fail("predicate-coverage-v4 module binding is malformed")


def validate_predicate_coverage_v4_manifest(
    manifest: Mapping[str, Any],
) -> dict[str, Any]:
    """Validate exact rows, bindings, closed admission, and the self-hash."""

    _assert_frozen_configuration()
    if not isinstance(manifest, Mapping):
        _fail("predicate-coverage-v4 manifest is not a mapping")
    snapshot = _strict_copy(manifest)
    if type(snapshot) is not dict or set(snapshot) != _MANIFEST_FIELDS:
        _fail("predicate-coverage-v4 manifest fields are malformed")
    if type(snapshot["schema"]) is not str or snapshot["schema"] != SCHEMA:
        _fail("predicate-coverage-v4 manifest schema is wrong")
    if snapshot["metadata"] != dict(_METADATA):
        _fail("predicate-coverage-v4 lane metadata is wrong")
    fixed = _fixed_bindings()
    bindings = snapshot["bindings"]
    if type(bindings) is not dict or set(bindings) != {*fixed, "coverage_v4_module"}:
        _fail("predicate-coverage-v4 bindings are malformed")
    for name, expected in fixed.items():
        if type(bindings[name]) is not dict or bindings[name] != expected:
            _fail(f"predicate-coverage-v4 binding is stale: {name}")
    _validate_module_record(bindings["coverage_v4_module"])
    if snapshot["candidate_predicates"] != _candidate_rows():
        _fail("predicate-coverage-v4 candidate rows differ from frozen v3")
    if snapshot["lean_source_universe"] != _source_rows():
        _fail("predicate-coverage-v4 source rows differ from the exact custody refresh")
    summary = snapshot["coverage_summary"]
    if type(summary) is not dict or summary != _coverage_summary():
        _fail("predicate-coverage-v4 summary is stale")
    count_fields = {
        "candidate_count",
        "delta_count",
        "lean_source_count",
        "custody_refresh_count",
    }
    if any(type(summary[key]) is not int for key in count_fields):
        _fail("predicate-coverage-v4 summary counts have non-integer types")
    if any(
        type(value) is not int
        for field in ("candidate_origin_counts", "lean_status_counts")
        for value in summary[field].values()
    ):
        _fail("predicate-coverage-v4 summary subtotals have non-integer types")
    admission = snapshot["admission"]
    if type(admission) is not dict or set(admission) != set(_ADMISSION):
        _fail("predicate-coverage-v4 admission fields are malformed")
    for key, expected in _ADMISSION.items():
        if type(admission[key]) is not type(expected) or admission[key] != expected:
            _fail("predicate-coverage-v4 attempts a proof/solver-ready escalation")
    digest = snapshot["manifest_sha256"]
    if type(digest) is not str or _SHA256.fullmatch(digest) is None:
        _fail("predicate-coverage-v4 manifest self-hash is malformed")
    body = dict(snapshot)
    del body["manifest_sha256"]
    if _sha256_json(body) != digest:
        _fail("predicate-coverage-v4 manifest self-hash is wrong")
    return snapshot


def _manifest_body(module_record: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "metadata": dict(_METADATA),
        "bindings": _binding_with_module(module_record),
        "candidate_predicates": _candidate_rows(),
        "lean_source_universe": _source_rows(),
        "coverage_summary": _coverage_summary(),
        "admission": dict(_ADMISSION),
    }


def _read_live_inputs(repo_root: Path) -> tuple[dict[str, Any], dict[str, bytes]]:
    _assert_frozen_configuration()
    paths = (
        V3_MODULE_PATH,
        V3_MANIFEST_PATH,
        LABELED_CUSTODY_MODULE_PATH,
        LABELED_CUSTODY_PATH,
        CROSSED_CUSTODY_MODULE_PATH,
        CROSSED_CUSTODY_PATH,
        COVERAGE_V4_MODULE_PATH,
    )
    try:
        root_descriptor = coverage_v3._open_repo_root(repo_root)
        try:
            payloads = {
                path: coverage_v3._read_bound_artifact(root_descriptor, path)
                for path in paths
            }
        finally:
            os.close(root_descriptor)
    except coverage_v3.Rigid221Card18PredicateCoverageV3Error as exc:
        raise Rigid221Card18PredicateCoverageV4Error(
            "a v4 bound path is missing, symlinked, multiply linked, or malformed"
        ) from exc
    expected = {
        V3_MODULE_PATH: (V3_MODULE_BYTES, V3_MODULE_SHA256),
        V3_MANIFEST_PATH: (V3_MANIFEST_BYTES, V3_MANIFEST_FILE_SHA256),
        LABELED_CUSTODY_MODULE_PATH: (
            LABELED_CUSTODY_MODULE_BYTES,
            LABELED_CUSTODY_MODULE_SHA256,
        ),
        LABELED_CUSTODY_PATH: (LABELED_CUSTODY_BYTES, LABELED_CUSTODY_FILE_SHA256),
        CROSSED_CUSTODY_MODULE_PATH: (
            CROSSED_CUSTODY_MODULE_BYTES,
            CROSSED_CUSTODY_MODULE_SHA256,
        ),
        CROSSED_CUSTODY_PATH: (CROSSED_CUSTODY_BYTES, CROSSED_CUSTODY_FILE_SHA256),
    }
    for path, (size, digest) in expected.items():
        payload = payloads[path]
        if len(payload) != size or hashlib.sha256(payload).hexdigest() != digest:
            _fail(f"live bound artifact bytes drifted: {path}")
    try:
        predecessor = coverage_v3.parse_predicate_coverage_v3_manifest(
            payloads[V3_MANIFEST_PATH]
        )
        labeled = labeled_custody_v2.attest_labeled_projection_source_custody_receipt(
            repo_root, payloads[LABELED_CUSTODY_PATH]
        )
        crossed = crossed_custody_v2.attest_crossed_incidence_source_custody_receipt(
            repo_root, payloads[CROSSED_CUSTODY_PATH]
        )
    except (
        coverage_v3.Rigid221Card18PredicateCoverageV3Error,
        labeled_custody_v2.Rigid221Card18LabeledProjectionCustodyV2Error,
        crossed_custody_v2.Rigid221Card18CrossedIncidenceCustodyV2Error,
    ) as exc:
        raise Rigid221Card18PredicateCoverageV4Error(
            "predecessor or custody-v2 receipt failed fresh attestation"
        ) from exc
    if predecessor["manifest_sha256"] != V3_MANIFEST_SHA256:
        _fail("coverage-v3 predecessor self-hash is stale")
    if labeled["receipt_sha256"] != LABELED_CUSTODY_RECEIPT_SHA256:
        _fail("labeled custody-v2 receipt self-hash is stale")
    if crossed["receipt_sha256"] != CROSSED_CUSTODY_RECEIPT_SHA256:
        _fail("crossed custody-v2 receipt self-hash is stale")
    module_payload = payloads[COVERAGE_V4_MODULE_PATH]
    return (
        {
            "path": COVERAGE_V4_MODULE_PATH,
            "bytes": len(module_payload),
            "sha256": hashlib.sha256(module_payload).hexdigest(),
        },
        payloads,
    )


def build_predicate_coverage_v4_manifest(repo_root: Path) -> dict[str, Any]:
    """Freshly attest the predecessor and both custody-v2 receipts."""

    module_record, _payloads = _read_live_inputs(repo_root)
    body = _manifest_body(module_record)
    return validate_predicate_coverage_v4_manifest(
        {**body, "manifest_sha256": _sha256_json(body)}
    )


def encode_predicate_coverage_v4_manifest(manifest: Mapping[str, Any]) -> bytes:
    """Return the unique canonical UTF-8 encoding of a valid v4 manifest."""

    return _canonical_json_bytes(validate_predicate_coverage_v4_manifest(manifest))


def parse_predicate_coverage_v4_manifest(payload: bytes) -> dict[str, Any]:
    """Parse duplicate-free strict JSON and require canonical bytes."""

    _assert_frozen_configuration()
    value = _strict_json(payload)
    if _canonical_json_bytes(value) != payload:
        _fail("predicate-coverage-v4 payload is not canonical JSON")
    return validate_predicate_coverage_v4_manifest(value)


def attest_predicate_coverage_v4_manifest(
    repo_root: Path, payload: bytes
) -> dict[str, Any]:
    """Bind canonical v4 bytes to fresh no-follow reads and live custody."""

    parsed = parse_predicate_coverage_v4_manifest(payload)
    module_record, _payloads = _read_live_inputs(repo_root)
    if parsed["bindings"]["coverage_v4_module"] != module_record:
        _fail("predicate-coverage-v4 module live hash is stale")
    body = _manifest_body(module_record)
    fresh = {**body, "manifest_sha256": _sha256_json(body)}
    if payload != _canonical_json_bytes(fresh):
        _fail("predicate-coverage-v4 manifest is not live-current")
    return parsed
