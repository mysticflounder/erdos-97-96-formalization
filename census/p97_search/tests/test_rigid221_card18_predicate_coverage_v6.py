from __future__ import annotations

import copy
import hashlib
import json
import shutil
from collections import Counter
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import rigid221_card18_predicate_coverage as coverage_v1
from census.p97_search import rigid221_card18_predicate_coverage_v2 as coverage_v2
from census.p97_search import rigid221_card18_predicate_coverage_v3 as coverage_v3
from census.p97_search import rigid221_card18_predicate_coverage_v4 as coverage_v4
from census.p97_search import rigid221_card18_predicate_coverage_v5 as coverage_v5
from census.p97_search import rigid221_card18_predicate_coverage_v6 as coverage

REPO_ROOT = Path(__file__).parents[3]
ARTIFACT_PATH = REPO_ROOT / "certificates/rigid221_card18_predicate_coverage_v6.json"
EXPECTED_CANDIDATE_ROWS_SHA256 = (
    "93130f6c5d8d59ccec64528653698eb7ca36b73a7eae734701e0d185d5644f3e"
)
EXPECTED_SOURCE_ROWS_SHA256 = (
    "a278b38f19da9b5b611d47b4b496d28d78cf68fc2ba8cbd1969492534434fdfe"
)
EXPECTED_REFRESH_IDS_SHA256 = (
    "28dc1f316c91a9c9aef64972ecfdd3f9ef034f723005afefa02db90c504ba433"
)


def _canonical(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode()


def _json_hash(value: Any) -> str:
    return hashlib.sha256(_canonical(value)).hexdigest()


def _rehash(manifest: dict[str, Any]) -> dict[str, Any]:
    body = dict(manifest)
    body.pop("manifest_sha256", None)
    manifest["manifest_sha256"] = _json_hash(body)
    return manifest


def _all_live_paths() -> tuple[str, ...]:
    paths = {
        coverage.V5_MODULE_PATH,
        coverage.V5_MANIFEST_PATH,
        coverage.LABELED_CUSTODY_MODULE_PATH,
        coverage.LABELED_CUSTODY_PATH,
        coverage.CROSSED_CUSTODY_MODULE_PATH,
        coverage.CROSSED_CUSTODY_PATH,
        coverage.COVERAGE_V6_MODULE_PATH,
    }
    for receipt_path in (coverage.LABELED_CUSTODY_PATH, coverage.CROSSED_CUSTODY_PATH):
        receipt = json.loads((REPO_ROOT / receipt_path).read_bytes())
        paths.update(row["path"] for row in receipt["lean_source_manifest"])
    return tuple(sorted(paths))


def _copy_live_tree(destination: Path) -> None:
    for relative in _all_live_paths():
        target = destination / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(REPO_ROOT / relative, target)


@pytest.fixture(scope="module")
def live_manifest() -> dict[str, Any]:
    return coverage.build_predicate_coverage_v6_manifest(REPO_ROOT)


def test_schema_configuration_and_immutable_input_bindings() -> None:
    assert coverage.SCHEMA == "p97-rigid221-card18-predicate-coverage/v6"
    assert (
        coverage.LANE_BASE_HEAD_METADATA == "ff935411514804caf003171164807f79d16a341e"
    )
    assert _json_hash(coverage._configuration_snapshot()) == (
        coverage.FROZEN_CONFIGURATION_SHA256
    )
    for path, size, digest in (
        (coverage.V5_MODULE_PATH, coverage.V5_MODULE_BYTES, coverage.V5_MODULE_SHA256),
        (
            coverage.V5_MANIFEST_PATH,
            coverage.V5_MANIFEST_BYTES,
            coverage.V5_MANIFEST_FILE_SHA256,
        ),
        (
            coverage.LABELED_CUSTODY_MODULE_PATH,
            coverage.LABELED_CUSTODY_MODULE_BYTES,
            coverage.LABELED_CUSTODY_MODULE_SHA256,
        ),
        (
            coverage.LABELED_CUSTODY_PATH,
            coverage.LABELED_CUSTODY_BYTES,
            coverage.LABELED_CUSTODY_FILE_SHA256,
        ),
        (
            coverage.CROSSED_CUSTODY_MODULE_PATH,
            coverage.CROSSED_CUSTODY_MODULE_BYTES,
            coverage.CROSSED_CUSTODY_MODULE_SHA256,
        ),
        (
            coverage.CROSSED_CUSTODY_PATH,
            coverage.CROSSED_CUSTODY_BYTES,
            coverage.CROSSED_CUSTODY_FILE_SHA256,
        ),
    ):
        payload = (REPO_ROOT / path).read_bytes()
        assert (len(payload), hashlib.sha256(payload).hexdigest()) == (size, digest)
    predecessor = coverage_v5.parse_predicate_coverage_v5_manifest(
        (REPO_ROOT / coverage.V5_MANIFEST_PATH).read_bytes()
    )
    assert predecessor["manifest_sha256"] == coverage.V5_MANIFEST_SHA256


def test_exact_37_row_custody_only_delta(live_manifest: dict[str, Any]) -> None:
    old = list(coverage_v5.frozen_v5_lean_source_universe())
    new = live_manifest["lean_source_universe"]
    assert len(old) == len(new) == 38
    changed: list[str] = []
    for before, after in zip(old, new, strict=True):
        assert before["id"] == after["id"]
        differing = {key for key in before if before[key] != after[key]}
        if differing:
            assert differing == {"custody_digest"}
            changed.append(before["id"])
            expected_digest = (
                coverage.CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256
                if before["id"] == coverage_v3.PROFILE_SOURCE_ID
                else coverage.LABELED_CUSTODY_SOURCE_MANIFEST_SHA256
            )
            assert after["custody_digest"] == expected_digest
        else:
            assert before["id"] == coverage_v3.ENRICHMENT_SOURCE_ID
            assert after["custody_digest"] == (
                coverage_v3.ENRICHMENT_NO_CUSTODY_BINDING_DIGEST
            )
    assert len(changed) == 37
    assert _json_hash(changed) == EXPECTED_REFRESH_IDS_SHA256


def test_candidates_admission_counts_and_hashes(live_manifest: dict[str, Any]) -> None:
    candidates = live_manifest["candidate_predicates"]
    sources = live_manifest["lean_source_universe"]
    assert candidates == list(coverage_v5.frozen_v5_candidate_predicate_records())
    assert _json_hash(candidates) == EXPECTED_CANDIDATE_ROWS_SHA256
    assert _json_hash(sources) == EXPECTED_SOURCE_ROWS_SHA256
    summary = live_manifest["coverage_summary"]
    assert summary["candidate_count"] == 188
    assert summary["lean_source_count"] == 38
    assert summary["delta_count"] == 0
    assert summary["custody_refresh_count"] == 37
    assert summary["custody_refresh_id_set_sha256"] == EXPECTED_REFRESH_IDS_SHA256
    assert Counter(row["origin"] for row in candidates) == Counter(
        summary["candidate_origin_counts"]
    )
    assert Counter(row["status"] for row in sources) == Counter(
        summary["lean_status_counts"]
    )
    assert all(
        not row["source_entitled"] and not row["hard_clause_admission"]
        for row in candidates
    )
    assert live_manifest["admission"]["hard_clause_count"] == 0
    assert all(
        value is False
        for key, value in live_manifest["admission"].items()
        if key not in {"hard_clause_count", "noncomputable_projection_present"}
    )


def test_kernel_manifest_counts_and_excludes_exact_a2_cap_metric() -> None:
    labeled = coverage._strict_copy(
        list(
            coverage.labeled_custody_v4.frozen_labeled_projection_lean_source_manifest()
        )
    )
    crossed = coverage._strict_copy(
        list(
            coverage.crossed_custody_v4.frozen_crossed_incidence_lean_source_manifest()
        )
    )
    assert len(labeled) == 26 and len(crossed) == 27
    assert all("ExactA2CapMetric" not in row["module"] for row in labeled + crossed)


def test_canonical_artifact_roundtrip_and_live_attestation(
    live_manifest: dict[str, Any],
) -> None:
    payload = coverage.encode_predicate_coverage_v6_manifest(live_manifest)
    assert payload == _canonical(live_manifest)
    assert ARTIFACT_PATH.read_bytes() == payload
    assert coverage.parse_predicate_coverage_v6_manifest(payload) == live_manifest
    assert coverage.attest_predicate_coverage_v6_manifest(REPO_ROOT, payload) == (
        live_manifest
    )
    assert coverage.build_predicate_coverage_v6_manifest(REPO_ROOT) == live_manifest


def test_strict_json_tampering_and_admission_escalation_reject(
    live_manifest: dict[str, Any],
) -> None:
    payload = coverage.encode_predicate_coverage_v6_manifest(live_manifest)
    duplicate = payload.replace(b'"schema":', b'"schema":"duplicate","schema":', 1)
    for malformed in (payload + b"\n", b"NaN", duplicate):
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageV6Error):
            coverage.parse_predicate_coverage_v6_manifest(malformed)
    changed = copy.deepcopy(live_manifest)
    changed["lean_source_universe"][0]["custody_digest"] = "0" * 64
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV6Error):
        coverage.validate_predicate_coverage_v6_manifest(_rehash(changed))
    changed = copy.deepcopy(live_manifest)
    changed["admission"]["solver_admission"] = True
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV6Error):
        coverage.validate_predicate_coverage_v6_manifest(_rehash(changed))


def test_v1_through_v6_schema_cross_rejection(live_manifest: dict[str, Any]) -> None:
    payload = coverage.encode_predicate_coverage_v6_manifest(live_manifest)
    for parser, error in (
        (
            coverage_v1.parse_predicate_coverage_manifest,
            coverage_v1.Rigid221Card18PredicateCoverageError,
        ),
        (
            coverage_v2.parse_predicate_coverage_v2_manifest,
            coverage_v2.Rigid221Card18PredicateCoverageV2Error,
        ),
        (
            coverage_v3.parse_predicate_coverage_v3_manifest,
            coverage_v3.Rigid221Card18PredicateCoverageV3Error,
        ),
        (
            coverage_v4.parse_predicate_coverage_v4_manifest,
            coverage_v4.Rigid221Card18PredicateCoverageV4Error,
        ),
        (
            coverage_v5.parse_predicate_coverage_v5_manifest,
            coverage_v5.Rigid221Card18PredicateCoverageV5Error,
        ),
    ):
        with pytest.raises(error):
            parser(payload)
    for old_path in (
        "certificates/rigid221_card18_predicate_coverage_v1.json",
        "certificates/rigid221_card18_predicate_coverage_v2.json",
        "certificates/rigid221_card18_predicate_coverage_v3.json",
        coverage.V5_MANIFEST_PATH,
    ):
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageV6Error):
            coverage.parse_predicate_coverage_v6_manifest(
                (REPO_ROOT / old_path).read_bytes()
            )


def test_tampered_predecessor_module_rejects(tmp_path: Path) -> None:
    root = tmp_path / "repo"
    _copy_live_tree(root)
    (root / coverage.V5_MODULE_PATH).write_bytes(b"drift")
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV6Error):
        coverage.build_predicate_coverage_v6_manifest(root)


def test_stale_custody_receipt_rejects_live_source_drift(tmp_path: Path) -> None:
    root = tmp_path / "repo"
    _copy_live_tree(root)
    receipt = json.loads((root / coverage.LABELED_CUSTODY_PATH).read_bytes())
    source_path = receipt["lean_source_manifest"][0]["path"]
    (root / source_path).write_bytes(b"drift")
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV6Error):
        coverage.build_predicate_coverage_v6_manifest(root)


def test_public_rows_are_independent_copies() -> None:
    candidates = coverage.frozen_v6_candidate_predicate_records()
    candidates[0]["id"] = "mutated"
    assert coverage.frozen_v6_candidate_predicate_records()[0]["id"] != "mutated"
    sources = coverage.frozen_v6_lean_source_universe()
    sources[0]["lean_anchors"].clear()
    assert coverage.frozen_v6_lean_source_universe()[0]["lean_anchors"]
