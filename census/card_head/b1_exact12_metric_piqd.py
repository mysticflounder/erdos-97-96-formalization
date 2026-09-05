"""Authenticated one-stage PIQD/Z3 probe for the B1 exact-12 survivor.

Only explicitly pinned canonical static-convex SAT source revisions are
accepted.  This module turns a completely replayed twelve-row cube into one
requested QF_NRA stage.  It has no local solver fallback.  PIQD UNSAT remains
finite solver evidence; SAT is retained only after exact-rational metric replay.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import re
import stat
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from types import MappingProxyType
from typing import Any

from census.endpoint_confinement import metric_realizability_piqd as metric_piqd
from census.p97_search import phase3_piqd_smt_source_adapter as neutral

from . import b1_exact12_static_equality_run as static_runner

RESULT_SCHEMA = "p97-b1-exact12-metric-piqd-result/v1"
SOURCE_SCHEMA = "p97-b1-exact12-metric-piqd-source/v1"
SYSTEM_SOURCE_SCHEMA = "p97-b1-exact12-metric-source-binding/v1"
DESCRIPTOR_SCHEMA = "p97-b1-exact12-metric-piqd-query/v1"
PROFILE_SCHEMA = "p97-b1-exact12-metric-piqd-z3-qfnra-one-shot/v1"
NORMALIZATION_SCHEMA = "p97-b1-exact12-metric-smt-normalization/v1"
STAGES = metric_piqd.STAGES

STATIC_RESULT_SCHEMA = static_runner.SCHEMA
RUN_MANIFEST_SCHEMA = static_runner.RUN_MANIFEST_SCHEMA
EXPECTED_LANE_ID = "b1-exact12-structural-20260830"
EXPECTED_PROFILE = (5, 5, 5)
DEFAULT_SERVER = "http://127.0.0.1:7272"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]

FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem": False,
    "global": False,
    "universal": False,
    "lean": False,
    "proof": False,
    "euclidean_problem97": False,
    "coverage": False,
    "closure": False,
    "promotion": False,
}

_RESULT_KEYS = {
    "schema",
    "semantic_status",
    "promotion_eligible",
    "closure_claim",
    "coverage_claim",
    "scope",
    "run",
    "cell",
    "structural_manifest",
    "static_equality_manifest",
    "static_geometry_manifest",
    "static_convex_manifest",
    "solver",
    "counts",
    "checks",
    "cube",
    "artifacts",
}
_REQUIRED_TRUE_CHECKS = {
    "apex_row_subset_physical",
    "canonical_convex_satisfies_delta",
    "canonical_dimacs_persisted",
    "canonical_extension_satisfies_delta",
    "canonical_geometry_satisfies_delta",
    "cap_interior_lower_bound",
    "common_blocker_intersection_qr",
    "diagnostic_non_promotable",
    "distinguished_centers_pairwise_distinct",
    "solver_assignment_satisfies_full_cnf",
    "source_safe_cube",
    "structural_cube_replayed",
    "trace_cover",
    "u_blocker_trace_intersection",
    "v_blocker_trace_intersection",
}
_RUN_MANIFEST_KEYS = {
    "schema",
    "lane_id",
    "run_id",
    "root",
    "base_head",
    "owner",
    "created_utc",
    "output_classes",
    "input_digests",
    "source_digests",
    "manifest_sha256",
}
_HEX20 = re.compile(r"[0-9a-f]{20}\Z")
_HEX40 = re.compile(r"[0-9a-f]{40}\Z")
_HEX64 = re.compile(r"[0-9a-f]{64}\Z")

_SURPLUS = frozenset({3, 4, 5})
_FIRST_OPPOSITE = frozenset({6, 7, 8})
_SECOND_OPPOSITE = frozenset({9, 10, 11})


class B1Exact12MetricPiqdError(RuntimeError):
    """The static source, query, custody, or semantic replay failed closed."""


@dataclass(frozen=True)
class _Capture:
    path: Path
    payload: bytes
    sha256: str
    identity: tuple[int, ...]


@dataclass(frozen=True)
class SourceRevision:
    """One immutable canonical static source revision accepted by this producer."""

    run_id: str
    timeout_seconds: int
    static_result_schema: str
    geometry_schema: str
    convex_schema: str
    final_variables: int
    final_clauses: int
    positive_variables: int
    cnf_sha256: str
    result_sha256: str
    run_manifest_sha256: str
    geometry_counts: tuple[tuple[str, int], ...]
    convex_counts: tuple[tuple[str, int], ...]


_SOURCE_REVISIONS_BY_RUN_ID: Mapping[str, SourceRevision] = MappingProxyType({
    "wave-4": SourceRevision(
        run_id="wave-4",
        timeout_seconds=30,
        static_result_schema=STATIC_RESULT_SCHEMA,
        geometry_schema="p97_b1_exact12_static_geometry.v1",
        convex_schema="p97_b1_exact12_static_convex.v1",
        final_variables=45_069,
        final_clauses=639_929,
        positive_variables=30_740,
        cnf_sha256=(
            "05c333aea3a4d5bfb4b65d072941aca7"
            "7365d5a5a2642fafdfc02de657c32f1d"
        ),
        result_sha256=(
            "0dda85b5a39c497d2e0391e48de2f779"
            "d7d57417ddd5897af4efbee4a87df7f6"
        ),
        run_manifest_sha256=(
            "2e98fce7526ac5e38a72553a53ba6223"
            "950bb4e3689a119e2504a3ee85a5e9c9"
        ),
        geometry_counts=(
            ("added_clauses", 95_040),
            ("added_variables", 0),
            ("equilateral_bisector_clauses", 95_040),
            ("final_clauses", 632_009),
            ("final_variables", 45_069),
            ("initial_clauses", 536_969),
            ("initial_variables", 45_069),
        ),
        convex_counts=(
            ("added_clauses", 7_920),
            ("added_variables", 0),
            ("final_clauses", 639_929),
            ("final_variables", 45_069),
            ("initial_clauses", 632_009),
            ("initial_variables", 45_069),
            ("perpendicular_bisector_clauses", 7_920),
        ),
    ),
    "wave-7": SourceRevision(
        run_id="wave-7",
        timeout_seconds=300,
        static_result_schema=STATIC_RESULT_SCHEMA,
        geometry_schema="p97_b1_exact12_static_geometry.v2",
        convex_schema="p97_b1_exact12_static_convex.v2",
        final_variables=45_069,
        final_clauses=1_305_209,
        positive_variables=31_247,
        cnf_sha256=(
            "38bfd42bad689ef537f9af7d13a814e6"
            "988db9b104b9cd05bf8cf635ae17c64e"
        ),
        result_sha256=(
            "5043335dda6359c4c0bcd6eae7ed9df4"
            "d6e2848c5c1c80ecf9be0ed9dec32daf"
        ),
        run_manifest_sha256=(
            "497a8c88823e1ea5ba4f820a2b4b8b68"
            "4c054a788c53d5af38d7fb1e5cee8052"
        ),
        geometry_counts=(
            ("added_clauses", 760_320),
            ("added_variables", 0),
            ("equilateral_bisector_clauses", 95_040),
            ("final_clauses", 1_297_289),
            ("final_variables", 45_069),
            ("initial_clauses", 536_969),
            ("initial_variables", 45_069),
            ("qcritical_aux_center_clauses", 665_280),
            ("total_geometry_clauses", 760_320),
        ),
        convex_counts=(
            ("added_clauses", 7_920),
            ("added_variables", 0),
            ("final_clauses", 1_305_209),
            ("final_variables", 45_069),
            ("initial_clauses", 1_297_289),
            ("initial_variables", 45_069),
            ("perpendicular_bisector_clauses", 7_920),
        ),
    ),
    "wave-9": SourceRevision(
        run_id="wave-9",
        timeout_seconds=300,
        static_result_schema=STATIC_RESULT_SCHEMA,
        geometry_schema="p97_b1_exact12_static_geometry.v3",
        convex_schema="p97_b1_exact12_static_convex.v3",
        final_variables=45_069,
        final_clauses=1_305_210,
        positive_variables=30_900,
        cnf_sha256=(
            "0e626e7266cfcbb8c3a2f5632f408bc"
            "75ea6bd794276af993252932ec85e997d"
        ),
        result_sha256=(
            "559ba92ce30e3517ce587c3e56d000d0"
            "76ff43a6f4e4e81c7d3af1861bd3e800"
        ),
        run_manifest_sha256=(
            "eb2b48d9dfa0511c588fa6454d905c65"
            "3e19cf3293ae34395b55eb68b3ecd2c2"
        ),
        geometry_counts=(
            ("added_clauses", 760_321),
            ("added_variables", 0),
            ("equilateral_bisector_clauses", 95_040),
            ("final_clauses", 1_297_290),
            ("final_variables", 45_069),
            ("initial_clauses", 536_969),
            ("initial_variables", 45_069),
            ("qcritical_aux_center_clauses", 665_280),
            ("seven_point_six_row_anchor_clauses", 1),
            ("total_geometry_clauses", 760_321),
        ),
        convex_counts=(
            ("added_clauses", 7_920),
            ("added_variables", 0),
            ("final_clauses", 1_305_210),
            ("final_variables", 45_069),
            ("initial_clauses", 1_297_290),
            ("initial_variables", 45_069),
            ("perpendicular_bisector_clauses", 7_920),
        ),
    ),
    "wave-11": SourceRevision(
        run_id="wave-11",
        timeout_seconds=300,
        static_result_schema=STATIC_RESULT_SCHEMA,
        geometry_schema="p97_b1_exact12_static_geometry.v4",
        convex_schema="p97_b1_exact12_static_convex.v4",
        final_variables=45_069,
        final_clauses=1_305_211,
        positive_variables=30_916,
        cnf_sha256=(
            "2b08cb602088947a024938a5c383bff5"
            "e2f9b026a4731435a8307cfec2bd1428"
        ),
        result_sha256=(
            "1a428aeaf477a664cdbf49fef51f7821"
            "5faf918e95a70e8b0dcf32862c95d9e9"
        ),
        run_manifest_sha256=(
            "f1f1ce8fdf54f9e5faf03840858286c6"
            "82526a6f3a260c0926dd5676d3f54df4"
        ),
        geometry_counts=(
            ("added_clauses", 760_322),
            ("added_variables", 0),
            ("equilateral_bisector_clauses", 95_040),
            ("final_clauses", 1_297_291),
            ("final_variables", 45_069),
            ("initial_clauses", 536_969),
            ("initial_variables", 45_069),
            ("qcritical_aux_center_clauses", 665_280),
            ("seven_point_six_row_anchor_clauses", 1),
            ("seven_point_six_row_interlock_clauses", 1),
            ("total_geometry_clauses", 760_322),
        ),
        convex_counts=(
            ("added_clauses", 7_920),
            ("added_variables", 0),
            ("final_clauses", 1_305_211),
            ("final_variables", 45_069),
            ("initial_clauses", 1_297_291),
            ("initial_variables", 45_069),
            ("perpendicular_bisector_clauses", 7_920),
        ),
    ),
    "wave-13": SourceRevision(
        run_id="wave-13",
        timeout_seconds=300,
        static_result_schema=STATIC_RESULT_SCHEMA,
        geometry_schema="p97_b1_exact12_static_geometry.v5",
        convex_schema="p97_b1_exact12_static_convex.v5",
        final_variables=45_069,
        final_clauses=1_305_212,
        positive_variables=31_155,
        cnf_sha256=(
            "613278fbba437a44553d35e0da2783d63"
            "1a2811cf8806cf8e1127a24157cb374"
        ),
        result_sha256=(
            "5a9cc9e980f458e39ed35de9bf738b4b"
            "ae01d1926b2d08225a15b5d4f445631f"
        ),
        run_manifest_sha256=(
            "5b9b65639e128054739cdb04a9fde557"
            "e9adf0f1228aa7199b56f712424f9e1a"
        ),
        geometry_counts=(
            ("added_clauses", 760_323),
            ("added_variables", 0),
            ("equilateral_bisector_clauses", 95_040),
            ("final_clauses", 1_297_292),
            ("final_variables", 45_069),
            ("initial_clauses", 536_969),
            ("initial_variables", 45_069),
            ("qcritical_aux_center_clauses", 665_280),
            ("seven_point_six_row_anchor_clauses", 1),
            ("seven_point_six_row_interlock_clauses", 1),
            ("six_point_five_row_interlock_clauses", 1),
            ("total_geometry_clauses", 760_323),
        ),
        convex_counts=(
            ("added_clauses", 7_920),
            ("added_variables", 0),
            ("final_clauses", 1_305_212),
            ("final_variables", 45_069),
            ("initial_clauses", 1_297_292),
            ("initial_variables", 45_069),
            ("perpendicular_bisector_clauses", 7_920),
        ),
    ),
    "wave-15": SourceRevision(
        run_id="wave-15",
        timeout_seconds=300,
        static_result_schema=STATIC_RESULT_SCHEMA,
        geometry_schema="p97_b1_exact12_static_geometry.v6",
        convex_schema="p97_b1_exact12_static_convex.v6",
        final_variables=45_069,
        final_clauses=1_305_213,
        positive_variables=30_908,
        cnf_sha256=(
            "a54729622f73b323c25dff97174e2bc38"
            "5dab0dc42814d826380c071dd7012eb"
        ),
        result_sha256=(
            "8c5cc840cf1b8e10b309f866a4768ee2"
            "d8e5399469eb51e99e2aa5c9ee03ab0a"
        ),
        run_manifest_sha256=(
            "c590168de3b1a8e639f4b9dff8183a27"
            "bdf75c22188afe4932fe59b649d6ce83"
        ),
        geometry_counts=(
            ("added_clauses", 760_324),
            ("added_variables", 0),
            ("equilateral_bisector_clauses", 95_040),
            ("final_clauses", 1_297_293),
            ("final_variables", 45_069),
            ("initial_clauses", 536_969),
            ("initial_variables", 45_069),
            ("qcritical_aux_center_clauses", 665_280),
            ("seven_point_seven_row_interlock_clauses", 1),
            ("seven_point_six_row_anchor_clauses", 1),
            ("seven_point_six_row_interlock_clauses", 1),
            ("six_point_five_row_interlock_clauses", 1),
            ("total_geometry_clauses", 760_324),
        ),
        convex_counts=(
            ("added_clauses", 7_920),
            ("added_variables", 0),
            ("final_clauses", 1_305_213),
            ("final_variables", 45_069),
            ("initial_clauses", 1_297_293),
            ("initial_variables", 45_069),
            ("perpendicular_bisector_clauses", 7_920),
        ),
    ),
    "wave-17": SourceRevision(
        run_id="wave-17",
        timeout_seconds=300,
        static_result_schema=STATIC_RESULT_SCHEMA,
        geometry_schema="p97_b1_exact12_static_geometry.v7",
        convex_schema="p97_b1_exact12_static_convex.v7",
        final_variables=45_069,
        final_clauses=1_305_214,
        positive_variables=30_739,
        cnf_sha256=(
            "fd3bf4e15cecfd88de1635bbe4eb1bdc"
            "3a4538b25ee9dd20f598eb54f80b2493"
        ),
        result_sha256=(
            "f663c379e8a6b21046dc50e6d62ce9d"
            "98c14d936be9f5133fa126002c476862b"
        ),
        run_manifest_sha256=(
            "d7b7415c4bd6a98181fb176685136d086"
            "3f80ff07ff34e721f37b47e11a482fe"
        ),
        geometry_counts=(
            ("added_clauses", 760_325),
            ("added_variables", 0),
            ("equilateral_bisector_clauses", 95_040),
            ("final_clauses", 1_297_294),
            ("final_variables", 45_069),
            ("initial_clauses", 536_969),
            ("initial_variables", 45_069),
            ("qcritical_aux_center_clauses", 665_280),
            ("seven_point_seven_row_interlock_clauses", 1),
            ("seven_point_six_row_anchor_clauses", 1),
            ("seven_point_six_row_interlock_clauses", 1),
            ("six_point_five_row_interlock_clauses", 1),
            ("six_point_six_row_interlock_clauses", 1),
            ("total_geometry_clauses", 760_325),
        ),
        convex_counts=(
            ("added_clauses", 7_920),
            ("added_variables", 0),
            ("final_clauses", 1_305_214),
            ("final_variables", 45_069),
            ("initial_clauses", 1_297_294),
            ("initial_variables", 45_069),
            ("perpendicular_bisector_clauses", 7_920),
        ),
    ),
    "wave-19": SourceRevision(
        run_id="wave-19",
        timeout_seconds=300,
        static_result_schema=STATIC_RESULT_SCHEMA,
        geometry_schema="p97_b1_exact12_static_geometry.v8",
        convex_schema="p97_b1_exact12_static_convex.v8",
        final_variables=45_069,
        final_clauses=1_305_215,
        positive_variables=30_733,
        cnf_sha256=(
            "d3ea806ab3032535faef6788a9d500182"
            "38688446ecb093d13fcbc3f462422e3"
        ),
        result_sha256=(
            "8886e33919689fed27c1a184e83a2e01"
            "d60ee545ee6fea2b0d3c4940aa2f136e"
        ),
        run_manifest_sha256=(
            "9561c4a93089d4260e47cd013399bdc7"
            "f0547e59c79db798565416f9aecb339e"
        ),
        geometry_counts=(
            ("added_clauses", 760_326),
            ("added_variables", 0),
            ("equilateral_bisector_clauses", 95_040),
            ("final_clauses", 1_297_295),
            ("final_variables", 45_069),
            ("initial_clauses", 536_969),
            ("initial_variables", 45_069),
            ("qcritical_aux_center_clauses", 665_280),
            ("seven_point_equilateral_median_interlock_clauses", 1),
            ("seven_point_seven_row_interlock_clauses", 1),
            ("seven_point_six_row_anchor_clauses", 1),
            ("seven_point_six_row_interlock_clauses", 1),
            ("six_point_five_row_interlock_clauses", 1),
            ("six_point_six_row_interlock_clauses", 1),
            ("total_geometry_clauses", 760_326),
        ),
        convex_counts=(
            ("added_clauses", 7_920),
            ("added_variables", 0),
            ("final_clauses", 1_305_215),
            ("final_variables", 45_069),
            ("initial_clauses", 1_297_295),
            ("initial_variables", 45_069),
            ("perpendicular_bisector_clauses", 7_920),
        ),
    ),
})


@dataclass(frozen=True)
class SourceBinding:
    """Authenticated canonical result, manifest, CNF, and executed producer."""

    revision: SourceRevision
    result: dict[str, Any]
    run_manifest: dict[str, Any]
    result_capture: _Capture
    run_manifest_capture: _Capture
    cnf_capture: _Capture
    producer_capture: _Capture


@dataclass(frozen=True)
class PreparedStage:
    """One deterministic, authenticated B1 source-semantic query."""

    stage: str
    system: dict[str, Any]
    source_record: dict[str, Any]
    source_record_bytes: bytes
    query: neutral.SourceSemanticQuery


def _canonical(value: object) -> bytes:
    try:
        metric_piqd._validate_builtin_tree(value, "B1 metric artifact")
        return json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            separators=(",", ":"),
            sort_keys=True,
        ).encode("utf-8")
    except (TypeError, ValueError, metric_piqd.EndpointMetricPiqdError) as exc:
        raise B1Exact12MetricPiqdError(
            "B1 metric artifact is not canonical builtin JSON"
        ) from exc


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _require_path(value: object, where: str) -> Path:
    if type(value) is not type(Path()):
        raise B1Exact12MetricPiqdError(
            f"{where} must be an exact platform Path"
        )
    return value


def _digest(value: object, where: str) -> str:
    if type(value) is not str or _HEX64.fullmatch(value) is None:
        raise B1Exact12MetricPiqdError(f"{where} is not a lowercase SHA-256")
    return value


def _capture_current(path: Path) -> _Capture:
    """Capture one private regular file componentwise without following links."""

    _require_path(path, "source path")
    descriptor: int | None = None
    rebound: int | None = None
    try:
        descriptor = metric_piqd._open_file_nofollow(path)
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise B1Exact12MetricPiqdError(
                f"source is not a private regular file: {path}"
            )
        if before.st_size > metric_piqd.MAX_SOURCE_BYTES:
            raise B1Exact12MetricPiqdError(f"source exceeds byte cap: {path}")
        payload = metric_piqd._read_descriptor(
            descriptor, metric_piqd.MAX_SOURCE_BYTES
        )
        after = os.fstat(descriptor)
        identity = metric_piqd._identity(before)
        if (
            len(payload) != before.st_size
            or len(payload) > metric_piqd.MAX_SOURCE_BYTES
            or metric_piqd._identity(after) != identity
        ):
            raise B1Exact12MetricPiqdError(f"source changed while read: {path}")
        rebound = metric_piqd._open_file_nofollow(path)
        if metric_piqd._identity(os.fstat(rebound)) != identity:
            raise B1Exact12MetricPiqdError(
                f"source path changed while read: {path}"
            )
        return _Capture(path, payload, _sha(payload), identity)
    except B1Exact12MetricPiqdError:
        raise
    except (OSError, metric_piqd.EndpointMetricPiqdError) as exc:
        raise B1Exact12MetricPiqdError(
            f"cannot authenticate current source: {path}"
        ) from exc
    finally:
        if rebound is not None:
            os.close(rebound)
        if descriptor is not None:
            os.close(descriptor)


def _strict_json_object(
    capture: _Capture, where: str, *, require_canonical: bool = True
) -> dict[str, Any]:
    if require_canonical:
        try:
            value = metric_piqd._strict_json_artifact(
                capture.payload, where, endpoint=True
            )
        except metric_piqd.EndpointMetricPiqdError as exc:
            raise B1Exact12MetricPiqdError(
                f"{where} is not strict canonical JSON"
            ) from exc
    else:
        def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
            result: dict[str, Any] = {}
            for key, item in items:
                if key in result:
                    raise ValueError(f"duplicate key {key!r}")
                result[key] = item
            return result

        def reject_float(_value: str) -> object:
            raise ValueError("floating-point JSON is forbidden")

        def reject_constant(_value: str) -> object:
            raise ValueError("non-JSON numeric constant is forbidden")

        try:
            value = json.loads(
                capture.payload.decode("utf-8"),
                object_pairs_hook=pairs,
                parse_float=reject_float,
                parse_constant=reject_constant,
            )
            metric_piqd._validate_builtin_tree(value, where)
        except (
            UnicodeDecodeError,
            ValueError,
            json.JSONDecodeError,
            metric_piqd.EndpointMetricPiqdError,
        ) as exc:
            raise B1Exact12MetricPiqdError(
                f"{where} is not strict duplicate-free JSON"
            ) from exc
    if type(value) is not dict:
        raise B1Exact12MetricPiqdError(f"{where} is not a JSON object")
    return value


def _validate_digest_map(value: object, where: str) -> dict[str, str]:
    if type(value) is not dict or not value:
        raise B1Exact12MetricPiqdError(f"{where} is not a nonempty digest map")
    result: dict[str, str] = {}
    for path, digest in value.items():
        if type(path) is not str or not path:
            raise B1Exact12MetricPiqdError(f"{where} has an invalid path")
        pure = PurePosixPath(path)
        if pure.is_absolute() or ".." in pure.parts or "." in pure.parts:
            raise B1Exact12MetricPiqdError(f"{where} has an unsafe path")
        result[path] = _digest(digest, f"{where} digest")
    return result


def _select_source_revision(
    result: dict[str, Any],
    manifest: dict[str, Any],
    result_capture: _Capture,
    run_manifest_capture: _Capture,
) -> SourceRevision:
    run = result.get("run")
    result_run_id = run.get("run_id") if type(run) is dict else None
    manifest_run_id = manifest.get("run_id")
    if (
        type(result_run_id) is not str
        or type(manifest_run_id) is not str
        or result_run_id != manifest_run_id
    ):
        raise B1Exact12MetricPiqdError(
            "static result and run manifest identities are crossed"
        )
    revision = _SOURCE_REVISIONS_BY_RUN_ID.get(result_run_id)
    if revision is None:
        raise B1Exact12MetricPiqdError(
            "static source is not an authenticated canonical source revision"
        )
    if result_capture.sha256 != revision.result_sha256:
        raise B1Exact12MetricPiqdError(
            "canonical static result file hash is crossed"
        )
    if run_manifest_capture.sha256 != revision.run_manifest_sha256:
        raise B1Exact12MetricPiqdError(
            "canonical run manifest file hash is crossed"
        )
    return revision


def _validate_run_manifest(
    manifest: dict[str, Any], run_root: Path, revision: SourceRevision
) -> tuple[str, Path]:
    if set(manifest) != _RUN_MANIFEST_KEYS:
        raise B1Exact12MetricPiqdError(
            "canonical run manifest has the wrong keys"
        )
    if (
        manifest.get("schema") != RUN_MANIFEST_SCHEMA
        or manifest.get("lane_id") != EXPECTED_LANE_ID
        or manifest.get("run_id") != revision.run_id
        or manifest.get("output_classes") != ["artifacts", "events", "tmp"]
    ):
        raise B1Exact12MetricPiqdError(
            "canonical run manifest identity is crossed"
        )
    if type(manifest.get("owner")) is not str or not manifest["owner"]:
        raise B1Exact12MetricPiqdError(
            "canonical run manifest owner is invalid"
        )
    if type(manifest.get("created_utc")) is not str or not manifest["created_utc"]:
        raise B1Exact12MetricPiqdError(
            "canonical run manifest creation time is invalid"
        )
    if type(manifest.get("base_head")) is not str or _HEX40.fullmatch(
        manifest["base_head"]
    ) is None:
        raise B1Exact12MetricPiqdError(
            "canonical run manifest base head is invalid"
        )
    claimed_manifest_sha256 = _digest(
        manifest.get("manifest_sha256"), "run manifest self hash"
    )
    unsigned = dict(manifest)
    unsigned.pop("manifest_sha256")
    if _sha(_canonical(unsigned)) != claimed_manifest_sha256:
        raise B1Exact12MetricPiqdError(
            "canonical run manifest self hash is invalid"
        )

    root_value = manifest.get("root")
    if type(root_value) is not str or not root_value:
        raise B1Exact12MetricPiqdError("canonical run root is invalid")
    root_pure = PurePosixPath(root_value)
    if ".." in root_pure.parts or "." in root_pure.parts:
        raise B1Exact12MetricPiqdError("canonical run root is unsafe")
    declared_root = Path(root_value)
    if not declared_root.is_absolute():
        declared_root = REPOSITORY_ROOT / declared_root
    if Path(os.path.abspath(declared_root)) != Path(os.path.abspath(run_root)):
        raise B1Exact12MetricPiqdError(
            "source result is not below the manifested canonical run root"
        )

    _validate_digest_map(manifest.get("input_digests"), "input_digests")
    source_digests = _validate_digest_map(
        manifest.get("source_digests"), "source_digests"
    )
    suffix = "/artifacts/executed-source/b1_exact12_static_equality_run.py"
    producer_paths = [path for path in source_digests if path.endswith(suffix)]
    if len(producer_paths) != 1:
        raise B1Exact12MetricPiqdError(
            "canonical manifest does not bind exactly one static runner source"
        )
    producer_key = producer_paths[0]
    root_key = PurePosixPath(root_value)
    producer_key_pure = PurePosixPath(producer_key)
    try:
        producer_relative = producer_key_pure.relative_to(root_key)
    except ValueError as exc:
        raise B1Exact12MetricPiqdError(
            "static runner source is outside the manifested run root"
        ) from exc
    producer_path = run_root.joinpath(*producer_relative.parts)
    return source_digests[producer_key], producer_path


def _validate_manifest_self_hash(value: object, schema: str, where: str) -> dict[str, Any]:
    if type(value) is not dict or value.get("schema") != schema:
        raise B1Exact12MetricPiqdError(f"{where} schema is crossed")
    if value.get("promotion_eligible") is not False:
        raise B1Exact12MetricPiqdError(f"{where} unexpectedly permits promotion")
    claimed = _digest(value.get("manifest_sha256"), f"{where} self hash")
    unsigned = dict(value)
    unsigned.pop("manifest_sha256")
    if _sha(_canonical(unsigned)) != claimed:
        raise B1Exact12MetricPiqdError(f"{where} self hash is invalid")
    return value


def _validate_exact_counts(
    value: object, expected: tuple[tuple[str, int], ...], where: str
) -> dict[str, int]:
    if type(value) is not dict or set(value) != {key for key, _count in expected}:
        raise B1Exact12MetricPiqdError(f"{where} have drifted")
    for key, expected_count in expected:
        actual = value.get(key)
        if type(actual) is not int or actual != expected_count:
            raise B1Exact12MetricPiqdError(f"{where} have drifted")
    return value


def _validate_cube(value: object) -> tuple[dict[str, Any], ...]:
    if type(value) is not dict or set(value) != {str(index) for index in range(12)}:
        raise B1Exact12MetricPiqdError("static SAT cube is not complete on 12 centers")
    rows: list[dict[str, Any]] = []
    for center in range(12):
        support = value[str(center)]
        if (
            type(support) is not list
            or len(support) != 4
            or any(type(point) is not int for point in support)
            or len(set(support)) != 4
            or center in support
            or any(point not in range(12) for point in support)
        ):
            raise B1Exact12MetricPiqdError(
                f"static SAT cube row {center} is incomplete or invalid"
            )
        rows.append({"center": center, "support": list(support), "exact": False})
    return tuple(rows)


def _validate_static_result(
    result: dict[str, Any], source_result: Path, revision: SourceRevision
) -> tuple[str, int, tuple[dict[str, Any], ...]]:
    if (
        set(result) != _RESULT_KEYS
        or result.get("schema") != revision.static_result_schema
    ):
        raise B1Exact12MetricPiqdError("static source result schema is crossed")
    if (
        result.get("semantic_status")
        != "diagnostic_exact12_single_cell_static_layers_only"
        or result.get("promotion_eligible") is not False
        or result.get("closure_claim") is not False
        or result.get("coverage_claim") is not False
    ):
        raise B1Exact12MetricPiqdError(
            "static source result makes a forbidden semantic claim"
        )
    run = result.get("run")
    if type(run) is not dict or run != {
        "class_card": 5,
        "lane_id": EXPECTED_LANE_ID,
        "profile": list(EXPECTED_PROFILE),
        "raw_cell_index": 2,
        "run_id": revision.run_id,
        "static_layer": "convex",
        "timeout_seconds": revision.timeout_seconds,
    }:
        raise B1Exact12MetricPiqdError(
            "static source is not the authenticated canonical profile-555 cell"
        )
    solver = result.get("solver")
    if type(solver) is not dict or solver.get("verdict") != "SAT":
        raise B1Exact12MetricPiqdError("canonical static source is not SAT")
    if solver.get("proof_verified") is not False:
        raise B1Exact12MetricPiqdError("SAT source has an invalid proof claim")

    checks = result.get("checks")
    if (
        type(checks) is not dict
        or set(checks) != _REQUIRED_TRUE_CHECKS
        or any(value is not True for value in checks.values())
    ):
        raise B1Exact12MetricPiqdError(
            "not every structural/full/static source replay check is true"
        )

    structural = result.get("structural_manifest")
    if (
        type(structural) is not dict
        or structural.get("schema") != "p97_b1_exact12_structural.v1"
        or structural.get("promotion_eligible") is not False
    ):
        raise B1Exact12MetricPiqdError("structural manifest is crossed")
    equality = _validate_manifest_self_hash(
        result.get("static_equality_manifest"),
        "p97_b1_exact12_static_equality.v1",
        "static equality manifest",
    )
    geometry = _validate_manifest_self_hash(
        result.get("static_geometry_manifest"),
        revision.geometry_schema,
        "static geometry manifest",
    )
    convex = _validate_manifest_self_hash(
        result.get("static_convex_manifest"),
        revision.convex_schema,
        "static convex manifest",
    )
    cell = result.get("cell")
    if (
        type(cell) is not dict
        or cell != structural.get("cell")
        or cell.get("profile") != list(EXPECTED_PROFILE)
    ):
        raise B1Exact12MetricPiqdError(
            "static result cell is not bound to the structural manifest"
        )
    structural_hash = _sha(_canonical(structural))
    equality_hashes = equality.get("hashes")
    if (
        type(equality_hashes) is not dict
        or equality_hashes.get("structural_manifest_sha256") != structural_hash
    ):
        raise B1Exact12MetricPiqdError(
            "static equality manifest is not bound to the structural manifest"
        )
    equality_hash = equality["manifest_sha256"]
    geometry_hash = geometry["manifest_sha256"]
    if (
        geometry.get("parent")
        != {
            "schema": "p97_b1_exact12_static_equality.v1",
            "manifest_sha256": equality_hash,
        }
        or convex.get("parent")
        != {
            "schema": revision.geometry_schema,
            "manifest_sha256": geometry_hash,
        }
    ):
        raise B1Exact12MetricPiqdError("static manifest parent chain is crossed")

    geometry_counts = _validate_exact_counts(
        geometry.get("counts"),
        revision.geometry_counts,
        "static geometry counts",
    )
    if revision.geometry_schema == "p97_b1_exact12_static_geometry.v2":
        equilateral = geometry_counts.get("equilateral_bisector_clauses")
        qcritical = geometry_counts.get("qcritical_aux_center_clauses")
        total = geometry_counts.get("total_geometry_clauses")
        if (
            type(equilateral) is not int
            or type(qcritical) is not int
            or type(total) is not int
            or equilateral + qcritical != total
            or geometry_counts.get("added_clauses") != total
        ):
            raise B1Exact12MetricPiqdError(
                "static geometry-v2 clause decomposition is invalid"
            )
    elif revision.geometry_schema == "p97_b1_exact12_static_geometry.v3":
        equilateral = geometry_counts.get("equilateral_bisector_clauses")
        qcritical = geometry_counts.get("qcritical_aux_center_clauses")
        anchor = geometry_counts.get("seven_point_six_row_anchor_clauses")
        total = geometry_counts.get("total_geometry_clauses")
        if (
            type(equilateral) is not int
            or type(qcritical) is not int
            or type(anchor) is not int
            or type(total) is not int
            or equilateral + qcritical + anchor != total
            or geometry_counts.get("added_clauses") != total
        ):
            raise B1Exact12MetricPiqdError(
                "static geometry-v3 clause decomposition is invalid"
            )
    elif revision.geometry_schema == "p97_b1_exact12_static_geometry.v4":
        equilateral = geometry_counts.get("equilateral_bisector_clauses")
        qcritical = geometry_counts.get("qcritical_aux_center_clauses")
        anchor = geometry_counts.get("seven_point_six_row_anchor_clauses")
        interlock = geometry_counts.get("seven_point_six_row_interlock_clauses")
        total = geometry_counts.get("total_geometry_clauses")
        if (
            type(equilateral) is not int
            or type(qcritical) is not int
            or type(anchor) is not int
            or type(interlock) is not int
            or type(total) is not int
            or equilateral + qcritical + anchor + interlock != total
            or geometry_counts.get("added_clauses") != total
        ):
            raise B1Exact12MetricPiqdError(
                "static geometry-v4 clause decomposition is invalid"
            )
    elif revision.geometry_schema == "p97_b1_exact12_static_geometry.v5":
        equilateral = geometry_counts.get("equilateral_bisector_clauses")
        qcritical = geometry_counts.get("qcritical_aux_center_clauses")
        anchor = geometry_counts.get("seven_point_six_row_anchor_clauses")
        interlock = geometry_counts.get("seven_point_six_row_interlock_clauses")
        five_row_interlock = geometry_counts.get(
            "six_point_five_row_interlock_clauses"
        )
        total = geometry_counts.get("total_geometry_clauses")
        if (
            type(equilateral) is not int
            or type(qcritical) is not int
            or type(anchor) is not int
            or type(interlock) is not int
            or type(five_row_interlock) is not int
            or type(total) is not int
            or equilateral
            + qcritical
            + anchor
            + interlock
            + five_row_interlock
            != total
            or geometry_counts.get("added_clauses") != total
        ):
            raise B1Exact12MetricPiqdError(
                "static geometry-v5 clause decomposition is invalid"
            )
    elif revision.geometry_schema == "p97_b1_exact12_static_geometry.v6":
        equilateral = geometry_counts.get("equilateral_bisector_clauses")
        qcritical = geometry_counts.get("qcritical_aux_center_clauses")
        anchor = geometry_counts.get("seven_point_six_row_anchor_clauses")
        six_row_interlock = geometry_counts.get(
            "seven_point_six_row_interlock_clauses"
        )
        five_row_interlock = geometry_counts.get(
            "six_point_five_row_interlock_clauses"
        )
        seven_row_interlock = geometry_counts.get(
            "seven_point_seven_row_interlock_clauses"
        )
        total = geometry_counts.get("total_geometry_clauses")
        if (
            equilateral != 95_040
            or qcritical != 665_280
            or anchor != 1
            or six_row_interlock != 1
            or five_row_interlock != 1
            or seven_row_interlock != 1
            or total != 760_324
            or equilateral
            + qcritical
            + anchor
            + six_row_interlock
            + five_row_interlock
            + seven_row_interlock
            != total
            or geometry_counts.get("added_clauses") != total
        ):
            raise B1Exact12MetricPiqdError(
                "static geometry-v6 clause decomposition is invalid"
            )
    elif revision.geometry_schema == "p97_b1_exact12_static_geometry.v7":
        equilateral = geometry_counts.get("equilateral_bisector_clauses")
        qcritical = geometry_counts.get("qcritical_aux_center_clauses")
        anchor = geometry_counts.get("seven_point_six_row_anchor_clauses")
        six_row_interlock = geometry_counts.get(
            "seven_point_six_row_interlock_clauses"
        )
        five_row_interlock = geometry_counts.get(
            "six_point_five_row_interlock_clauses"
        )
        seven_row_interlock = geometry_counts.get(
            "seven_point_seven_row_interlock_clauses"
        )
        six_point_six_row_interlock = geometry_counts.get(
            "six_point_six_row_interlock_clauses"
        )
        total = geometry_counts.get("total_geometry_clauses")
        if (
            equilateral != 95_040
            or qcritical != 665_280
            or anchor != 1
            or six_row_interlock != 1
            or five_row_interlock != 1
            or seven_row_interlock != 1
            or six_point_six_row_interlock != 1
            or total != 760_325
            or equilateral
            + qcritical
            + anchor
            + six_row_interlock
            + five_row_interlock
            + seven_row_interlock
            + six_point_six_row_interlock
            != total
            or geometry_counts.get("added_clauses") != total
        ):
            raise B1Exact12MetricPiqdError(
                "static geometry-v7 clause decomposition is invalid"
            )
    elif revision.geometry_schema == "p97_b1_exact12_static_geometry.v8":
        equilateral = geometry_counts.get("equilateral_bisector_clauses")
        qcritical = geometry_counts.get("qcritical_aux_center_clauses")
        anchor = geometry_counts.get("seven_point_six_row_anchor_clauses")
        six_row_interlock = geometry_counts.get(
            "seven_point_six_row_interlock_clauses"
        )
        five_row_interlock = geometry_counts.get(
            "six_point_five_row_interlock_clauses"
        )
        seven_row_interlock = geometry_counts.get(
            "seven_point_seven_row_interlock_clauses"
        )
        six_point_six_row_interlock = geometry_counts.get(
            "six_point_six_row_interlock_clauses"
        )
        equilateral_median_interlock = geometry_counts.get(
            "seven_point_equilateral_median_interlock_clauses"
        )
        total = geometry_counts.get("total_geometry_clauses")
        if (
            equilateral != 95_040
            or qcritical != 665_280
            or anchor != 1
            or six_row_interlock != 1
            or five_row_interlock != 1
            or seven_row_interlock != 1
            or six_point_six_row_interlock != 1
            or equilateral_median_interlock != 1
            or total != 760_326
            or equilateral
            + qcritical
            + anchor
            + six_row_interlock
            + five_row_interlock
            + seven_row_interlock
            + six_point_six_row_interlock
            + equilateral_median_interlock
            != total
            or geometry_counts.get("added_clauses") != total
        ):
            raise B1Exact12MetricPiqdError(
                "static geometry-v8 clause decomposition is invalid"
            )

    _validate_exact_counts(
        convex.get("counts"),
        revision.convex_counts,
        "static convex final counts",
    )
    result_counts = result.get("counts")
    expected_result_counts = {
        "clauses": revision.final_clauses,
        "positive_variables": revision.positive_variables,
        "variables": revision.final_variables,
    }
    if type(result_counts) is not dict or result_counts != expected_result_counts:
        raise B1Exact12MetricPiqdError("static result final counts have drifted")
    convex_hashes = convex.get("hashes")
    if type(convex_hashes) is not dict:
        raise B1Exact12MetricPiqdError("static convex hashes are absent")
    final_hash = _digest(
        convex_hashes.get("final_cnf_sha256"), "static convex final CNF hash"
    )
    if final_hash != revision.cnf_sha256:
        raise B1Exact12MetricPiqdError("static convex final CNF hash has drifted")

    artifacts = result.get("artifacts")
    if type(artifacts) is not dict or set(artifacts) != {"cnf", "proof", "result"}:
        raise B1Exact12MetricPiqdError("static source artifact ledger is crossed")
    if artifacts.get("result") != source_result.name:
        raise B1Exact12MetricPiqdError("static result does not name itself")
    cnf = artifacts.get("cnf")
    if type(cnf) is not dict or set(cnf) != {"path", "bytes", "sha256"}:
        raise B1Exact12MetricPiqdError("static CNF record is malformed")
    cnf_name = cnf.get("path")
    if (
        type(cnf_name) is not str
        or not cnf_name.endswith(".cnf")
        or PurePosixPath(cnf_name).name != cnf_name
        or "\\" in cnf_name
    ):
        raise B1Exact12MetricPiqdError("static CNF path is unsafe")
    if _digest(cnf.get("sha256"), "static CNF record hash") != final_hash:
        raise B1Exact12MetricPiqdError("static CNF record crosses the convex hash")
    cnf_bytes = cnf.get("bytes")
    if type(cnf_bytes) is not int or cnf_bytes <= 0:
        raise B1Exact12MetricPiqdError("static CNF byte count is invalid")
    return cnf_name, cnf_bytes, _validate_cube(result.get("cube"))


def load_source_result(source_result: Path) -> SourceBinding:
    """Load and fail-closed authenticate one pinned canonical static result."""

    source_result = _require_path(source_result, "source_result")
    if source_result.parent.name != "artifacts":
        raise B1Exact12MetricPiqdError(
            "source result must be in its governed artifacts directory"
        )
    run_root = source_result.parent.parent
    run_manifest_path = run_root / "run_manifest.json"
    result_capture = _capture_current(source_result)
    run_manifest_capture = _capture_current(run_manifest_path)
    result = _strict_json_object(result_capture, "static source result")
    run_manifest = _strict_json_object(
        run_manifest_capture,
        "canonical run manifest",
        require_canonical=False,
    )
    revision = _select_source_revision(
        result,
        run_manifest,
        result_capture,
        run_manifest_capture,
    )
    producer_sha256, producer_path = _validate_run_manifest(
        run_manifest, run_root, revision
    )
    cnf_name, cnf_bytes, _rows = _validate_static_result(
        result, source_result, revision
    )
    cnf_capture = _capture_current(source_result.parent / cnf_name)
    if (
        cnf_capture.sha256 != revision.cnf_sha256
        or len(cnf_capture.payload) != cnf_bytes
    ):
        raise B1Exact12MetricPiqdError(
            "referenced CNF bytes do not match the static source record"
        )
    producer_capture = _capture_current(producer_path)
    if producer_capture.sha256 != producer_sha256:
        raise B1Exact12MetricPiqdError(
            "executed static producer does not match the run manifest"
        )
    return SourceBinding(
        revision=revision,
        result=result,
        run_manifest=run_manifest,
        result_capture=result_capture,
        run_manifest_capture=run_manifest_capture,
        cnf_capture=cnf_capture,
        producer_capture=producer_capture,
    )


def capture_source(source_result: Path) -> SourceBinding:
    """Compatibility spelling for :func:`load_source_result`."""

    return load_source_result(source_result)


def _check_binding_current(binding: SourceBinding) -> SourceBinding:
    if type(binding) is not SourceBinding:
        raise B1Exact12MetricPiqdError("source binding has the wrong type")
    if type(binding.result) is not dict or type(binding.run_manifest) is not dict:
        raise B1Exact12MetricPiqdError(
            "source binding contains non-exact in-memory JSON objects"
        )
    current = load_source_result(binding.result_capture.path)
    if current != binding:
        raise B1Exact12MetricPiqdError(
            "canonical source or its in-memory binding changed after authentication"
        )
    return current


def validate_cap_block_order(order: Sequence[int]) -> tuple[int, ...]:
    """Validate one of the 432 oriented profile-555 cap-block orders."""

    if type(order) not in {list, tuple}:
        raise B1Exact12MetricPiqdError("order must be an exact list or tuple")
    normalized = tuple(order)
    if (
        len(normalized) != 12
        or any(type(point) is not int for point in normalized)
        or sorted(normalized) != list(range(12))
    ):
        raise B1Exact12MetricPiqdError("order must be a permutation of 0..11")
    direct = (
        normalized[0] == 0
        and frozenset(normalized[1:4]) == _SECOND_OPPOSITE
        and normalized[4] == 1
        and frozenset(normalized[5:8]) == _SURPLUS
        and normalized[8] == 2
        and frozenset(normalized[9:12]) == _FIRST_OPPOSITE
    )
    reverse = (
        normalized[0] == 0
        and frozenset(normalized[1:4]) == _FIRST_OPPOSITE
        and normalized[4] == 2
        and frozenset(normalized[5:8]) == _SURPLUS
        and normalized[8] == 1
        and frozenset(normalized[9:12]) == _SECOND_OPPOSITE
    )
    if not (direct or reverse):
        raise B1Exact12MetricPiqdError(
            "order is not a direct or reverse profile-555 cap-block boundary order"
        )
    return normalized


def build_system(
    binding: SourceBinding, order: Sequence[int]
) -> dict[str, Any]:
    """Build the deterministic exact-false metric system for one boundary order."""

    if type(binding) is not SourceBinding:
        raise B1Exact12MetricPiqdError("source binding has the wrong type")
    validated_binding = _check_binding_current(binding)
    normalized_order = validate_cap_block_order(order)
    rows = list(_validate_cube(validated_binding.result.get("cube")))
    sources = [
        {
            "schema": SYSTEM_SOURCE_SCHEMA,
            "lane_id": EXPECTED_LANE_ID,
            "run_id": validated_binding.revision.run_id,
            "static_result_schema": validated_binding.revision.static_result_schema,
            "static_result_sha256": validated_binding.result_capture.sha256,
            "run_manifest_sha256": validated_binding.run_manifest_capture.sha256,
            "cnf_sha256": validated_binding.cnf_capture.sha256,
            "static_producer_sha256": validated_binding.producer_capture.sha256,
        }
    ]
    preimage = {
        "schema": "p97-b1-exact12-metric-system-preimage/v1",
        "n": 12,
        "profile": list(EXPECTED_PROFILE),
        "order": list(normalized_order),
        "rows": rows,
        "sources": sources,
    }
    system = {
        "system_id": _sha(_canonical(preimage))[:20],
        "n": 12,
        "profile": list(EXPECTED_PROFILE),
        "order": list(normalized_order),
        "rows": rows,
        "sources": sources,
    }
    if _HEX20.fullmatch(system["system_id"]) is None:
        raise B1Exact12MetricPiqdError("deterministic system id is malformed")
    try:
        return metric_piqd._validate_system(system)
    except metric_piqd.EndpointMetricPiqdError as exc:
        raise B1Exact12MetricPiqdError("B1 metric system is invalid") from exc


def _portable_path(path: Path) -> str:
    absolute = Path(os.path.abspath(os.fspath(path)))
    try:
        return absolute.relative_to(REPOSITORY_ROOT).as_posix()
    except ValueError:
        return os.fspath(absolute)


def _implementation_captures() -> tuple[tuple[str, _Capture], ...]:
    paths = (
        ("b1_metric_producer", Path(__file__).resolve()),
        ("generic_smt_adapter", Path(neutral.__file__).resolve()),
        ("metric_encoder_replayer", Path(metric_piqd.__file__).resolve()),
    )
    return tuple((role, _capture_current(path)) for role, path in paths)


def prepare_stage(
    binding: SourceBinding,
    order: Sequence[int],
    stage: str,
    *,
    timeout_ms: int,
) -> PreparedStage:
    """Freeze one authenticated, deterministic B1 stage query."""

    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise B1Exact12MetricPiqdError("timeout_ms must be in 1..3600000")
    if stage not in STAGES:
        raise B1Exact12MetricPiqdError("unknown B1 metric stage")
    system = build_system(binding, order)
    try:
        commands, counts = metric_piqd.build_stage_smt2(system, stage)
    except metric_piqd.EndpointMetricPiqdError as exc:
        raise B1Exact12MetricPiqdError("cannot build B1 metric SMT2") from exc
    journal = b"".join(command.encode("utf-8") + b"\n" for command in commands)
    implementations = _implementation_captures()
    source_record = {
        "schema": SOURCE_SCHEMA,
        "system_id": system["system_id"],
        "stage": stage,
        "system": system,
        "system_sha256": _sha(_canonical(system)),
        "order_sha256": _sha(_canonical(system["order"])),
        "rows_sha256": _sha(_canonical(system["rows"])),
        "static_source": {
            "source_locator": _portable_path(binding.result_capture.path),
            "result": {
                "bytes": len(binding.result_capture.payload),
                "sha256": binding.result_capture.sha256,
                "identity": list(binding.result_capture.identity),
            },
            "run_manifest": {
                "bytes": len(binding.run_manifest_capture.payload),
                "sha256": binding.run_manifest_capture.sha256,
                "identity": list(binding.run_manifest_capture.identity),
            },
            "cnf": {
                "bytes": len(binding.cnf_capture.payload),
                "sha256": binding.cnf_capture.sha256,
                "identity": list(binding.cnf_capture.identity),
                "snapshotted": False,
            },
            "executed_producer": {
                "bytes": len(binding.producer_capture.payload),
                "sha256": binding.producer_capture.sha256,
                "identity": list(binding.producer_capture.identity),
            },
        },
        "constraint_counts": counts,
        "normalization": {
            "schema": NORMALIZATION_SCHEMA,
            "encoding": "utf-8",
            "line_endings": "LF",
            "state_commands_only": True,
            "journal_sha256": _sha(journal),
        },
        "implementation_sources": [
            {
                "role": role,
                "path": _portable_path(capture.path),
                "bytes": len(capture.payload),
                "sha256": capture.sha256,
            }
            for role, capture in implementations
        ],
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solver": "z3",
            "lane": "smt",
            "logic": "QF_NRA",
            "fresh_session": True,
            "solve_count": 1,
            "workers": 1,
            "timeout_ms": timeout_ms,
            "local_fallback": False,
        },
        "claims": dict(FALSE_CLAIMS),
    }
    source_record_bytes = _canonical(source_record) + b"\n"
    snapshots = [
        neutral.SourceSnapshot("0000-source-record.json", source_record_bytes),
        neutral.SourceSnapshot(
            "0001-static-result.json", binding.result_capture.payload
        ),
        neutral.SourceSnapshot(
            "0002-run-manifest.json", binding.run_manifest_capture.payload
        ),
        neutral.SourceSnapshot(
            "0003-executed-static-producer.py", binding.producer_capture.payload
        ),
    ]
    snapshots.extend(
        neutral.SourceSnapshot(f"implementation-{index:04d}-{role}.py", capture.payload)
        for index, (role, capture) in enumerate(implementations)
    )
    snapshots.sort(key=lambda item: item.path)
    semantic = {
        "system_id": system["system_id"],
        "stage": stage,
        "system": system,
        "constraint_counts": counts,
        "fixture_only": False,
        "fixture_pins": [],
        "normalization_sha256": _sha(journal),
        "source_record_sha256": _sha(source_record_bytes),
        "static_result_sha256": binding.result_capture.sha256,
        "run_manifest_sha256": binding.run_manifest_capture.sha256,
        "static_producer_sha256": binding.producer_capture.sha256,
        "cnf_sha256": binding.cnf_capture.sha256,
    }
    variables = [
        {"id": f"p{point:03d}-{axis}", "term": f"{axis}_{point}", "sort": "Real"}
        for point in range(12)
        for axis in ("x", "y")
    ]
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "p97-b1-exact12-metric", "version": "v1"},
        "semantic_verifier": {
            "id": "exact-rational-every-asserted-atom-replay",
            "version": "v1",
        },
        "stage_id": stage,
        "query_id": f"{system['system_id']}-{stage}",
        "sources": [
            {
                "path": item.path,
                "bytes": len(item.payload),
                "sha256": _sha(item.payload),
            }
            for item in snapshots
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {
            "path": "original.smt2",
            "bytes": len(journal),
            "sha256": _sha(journal),
        },
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solvers": ["z3"],
            "timeout_ms": timeout_ms,
        },
    }
    descriptor_bytes = _canonical(descriptor) + b"\n"
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=descriptor_bytes,
        original_smt2=journal,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=tuple(snapshots),
    )
    try:
        query = neutral.validate_authenticated_single_solver_query(
            query,
            solver="z3",
            descriptor_schema=DESCRIPTOR_SCHEMA,
            solver_profile_schema=PROFILE_SCHEMA,
            authenticated_journal_commands=commands,
        )
    except neutral.SmtSourceAdapterError as exc:
        raise B1Exact12MetricPiqdError(
            "B1 source-semantic query failed authentication"
        ) from exc
    return PreparedStage(stage, system, source_record, source_record_bytes, query)


def _classification(raw_status: object, effective_status: object) -> str:
    if raw_status == "SAT" and effective_status == "SAT_SEMANTICALLY_REPLAYED":
        return "SAT_EXACT_RATIONAL_REPLAYED_DIAGNOSTIC"
    if raw_status == "UNSAT":
        return "Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED"
    if raw_status == "UNKNOWN":
        return "UNKNOWN_INCONCLUSIVE"
    return "INCONCLUSIVE_NO_VERDICT"


def _compact_result(
    prepared: PreparedStage,
    engine: Mapping[str, object],
    output_directory: Path,
) -> dict[str, Any]:
    raw_status = engine.get("raw_status")
    effective_status = engine.get("effective_status")
    semantic_replay = engine.get("semantic_replay")
    if raw_status == "SAT" and (
        effective_status != "SAT_SEMANTICALLY_REPLAYED"
        or type(semantic_replay) is not dict
        or semantic_replay.get("accepted") is not True
    ):
        raise B1Exact12MetricPiqdError(
            "PIQD SAT did not pass exact-rational semantic replay"
        )
    if raw_status not in {"SAT", "UNSAT", "UNKNOWN", None}:
        raise B1Exact12MetricPiqdError("PIQD returned an invalid raw status")
    status = raw_status if raw_status in {"SAT", "UNSAT", "UNKNOWN"} else "UNKNOWN"
    result: dict[str, Any] = {
        "schema": RESULT_SCHEMA,
        "system_id": prepared.system["system_id"],
        "stage": prepared.stage,
        "order": prepared.system["order"],
        "status": status,
        "effective_status": effective_status,
        "classification": _classification(raw_status, effective_status),
        "route": "piqd-z3-qfnra-one-stage",
        "workers": 1,
        "local_fallback": False,
        "source_record_sha256": _sha(prepared.source_record_bytes),
        "descriptor_sha256": _sha(prepared.query.descriptor_bytes),
        "journal_sha256": _sha(prepared.query.journal_smt2),
        "solver_evidence": {
            "solver": engine.get("solver"),
            "session_id": engine.get("session_id"),
            "solver_signature": engine.get("solver_signature"),
            "solver_sha256": engine.get("solver_sha256"),
            "solve_index": engine.get("solve_index"),
            "result_sha256": engine.get("result_sha256"),
            "response_lost": engine.get("response_lost"),
            "reconciled_from_receipt": engine.get("reconciled_from_receipt"),
            "result_digest_advisory": engine.get("result_digest_advisory"),
        },
        "semantic_replay": semantic_replay,
        "output_custody": {
            "publication": "atomic-directory-rename-no-replace",
            "create_once": True,
            "directory": output_directory.name,
        },
        "claims": dict(FALSE_CLAIMS),
    }
    return result


def run_stage(
    binding: SourceBinding,
    order: Sequence[int],
    stage: str,
    *,
    timeout_s: float,
    transport: neutral.PiqdTransport,
    output_directory: Path,
) -> dict[str, Any]:
    """Run exactly one authenticated Z3 stage and publish create-once custody."""

    output_directory = _require_path(output_directory, "output_directory")
    if not output_directory.is_absolute():
        raise B1Exact12MetricPiqdError("output_directory must be absolute")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3_600
    ):
        raise B1Exact12MetricPiqdError("timeout_s must be in (0, 3600]")
    timeout_ms = max(1, int(timeout_s * 1000))
    prepared = prepare_stage(
        binding, order, stage, timeout_ms=timeout_ms
    )
    try:
        with neutral.SmtOutputTransaction(output_directory) as custody:
            custody.write_bytes("source-record.json", prepared.source_record_bytes)
            custody.write_bytes("descriptor.json", prepared.query.descriptor_bytes)
            custody.write_bytes("original.smt2", prepared.query.original_smt2)
            custody.write_bytes("journal.smt2", prepared.query.journal_smt2)
            for index, snapshot in enumerate(prepared.query.source_files):
                custody.write_bytes(
                    f"source-{index:04d}-{snapshot.path}", snapshot.payload
                )
            engine = neutral.run_authenticated_single_solver_query(
                prepared.query,
                solver="z3",
                descriptor_schema=DESCRIPTOR_SCHEMA,
                solver_profile_schema=PROFILE_SCHEMA,
                authenticated_journal_commands=prepared.query.journal_commands,
                transport=transport,
                semantic_verifier=metric_piqd.verify_sat_model,
                output_fd=custody.file_descriptor,
                used_session_ids=set(),
            )
            result = _compact_result(prepared, engine, output_directory)
            custody.write_bytes("result.json", _canonical(result) + b"\n")
            _check_binding_current(binding)
            custody.publish()
            return result
    except B1Exact12MetricPiqdError:
        raise
    except (
        OSError,
        neutral.SmtSourceAdapterError,
        metric_piqd.EndpointMetricPiqdError,
    ) as exc:
        raise B1Exact12MetricPiqdError(
            "authenticated B1 PIQD stage failed closed"
        ) from exc


def _parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-result", required=True, type=Path)
    parser.add_argument("--order", required=True, nargs=12, type=int)
    parser.add_argument("--stage", required=True, choices=STAGES)
    parser.add_argument("--timeout", type=float, default=900.0)
    parser.add_argument("--server", default=DEFAULT_SERVER)
    parser.add_argument("--output-dir", required=True, type=Path)
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    arguments = _parse_args(argv)
    try:
        binding = load_source_result(arguments.source_result)
        transport = neutral.UrllibPiqdTransport(
            arguments.server,
            http_timeout_s=max(1.0, arguments.timeout + 60.0),
        )
        result = run_stage(
            binding,
            arguments.order,
            arguments.stage,
            timeout_s=arguments.timeout,
            transport=transport,
            output_directory=arguments.output_dir.absolute(),
        )
    except B1Exact12MetricPiqdError as exc:
        raise SystemExit(str(exc)) from exc
    print(json.dumps(result, allow_nan=False, sort_keys=True))
    return 0


__all__ = [
    "DESCRIPTOR_SCHEMA",
    "FALSE_CLAIMS",
    "PROFILE_SCHEMA",
    "RESULT_SCHEMA",
    "SOURCE_SCHEMA",
    "STAGES",
    "B1Exact12MetricPiqdError",
    "PreparedStage",
    "SourceBinding",
    "build_system",
    "capture_source",
    "load_source_result",
    "main",
    "prepare_stage",
    "run_stage",
    "validate_cap_block_order",
]


if __name__ == "__main__":
    raise SystemExit(main())
