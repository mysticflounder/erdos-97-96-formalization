from __future__ import annotations

import copy
import hashlib
import json
import shutil
from collections import Counter
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import rigid221_card18_predicate_coverage_v2 as coverage_v2
from census.p97_search import rigid221_card18_predicate_coverage_v3 as coverage

REPO_ROOT = Path(__file__).parents[3]
EXPECTED_DELTA_IDS = (
    "bi.u.actual_blocker_ne_center.1",
    "bi.u.actual_blocker_ne_center.2",
    "bi.xv.actual_blocker_ne_center.1",
    "bi.xv.actual_blocker_ne_center.2",
    "live.deleted_center.not_in_opposite_class",
    "live.next_row_physical_hits.le1",
    "q.huXvRow",
    "role.physical_five.all_distinct",
    "role.source_1.not_alias_u_or_xv",
    "role.source_2.not_alias_u_or_xv",
    "source_pair.source_1.outside_xv_row",
    "source_pair.source_2.outside_xv_row",
)
EXPECTED_DELTA_SHA256 = (
    "cf567de6d9978c9ab1e074e8498585a9ab6ea8273c998eed612a9db57c10aead"
)
EXPECTED_CANDIDATE_ID_SHA256 = (
    "ca7a9c209a01eb76153f4784569a5282bd54c96734d4e4db492a61b61d616561"
)
EXPECTED_SOURCE_ID_SHA256 = (
    "a315997b0b0336787d4ea74c8de981a484541326b76911ea26c3579a363a3f9f"
)
EXPECTED_CANDIDATE_ROWS_SHA256 = (
    "93130f6c5d8d59ccec64528653698eb7ca36b73a7eae734701e0d185d5644f3e"
)
EXPECTED_SOURCE_ROWS_SHA256 = (
    "cec1d8d443070eed81e50baec5ea2c83a861f9e0427879f5aa67473d03dc7f7e"
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
    receipt = json.loads((REPO_ROOT / coverage.CROSSED_CUSTODY_PATH).read_bytes())
    source_paths = [item["path"] for item in receipt["lean_source_manifest"]]
    fixed = [
        coverage.CANDIDATE_PATH,
        coverage.V2_COVERAGE_MODULE_PATH,
        coverage.V2_MANIFEST_PATH,
        coverage.V1_COVERAGE_MODULE_PATH,
        coverage.V1_MANIFEST_PATH,
        coverage.LABELED_CUSTODY_PATH,
        coverage.LABELED_SOURCE_PATH,
        coverage.LABELED_AXIOM_PATH,
        coverage.CROSSED_SOURCE_PATH,
        coverage.CROSSED_AXIOM_PATH,
        coverage.CROSSED_CUSTODY_PATH,
        coverage.ENRICHMENT_SOURCE_PATH,
        coverage.COVERAGE_V3_MODULE_PATH,
    ]
    return tuple(sorted(set(source_paths + fixed)))


def _copy_live_tree(destination: Path) -> None:
    for relative in _all_live_paths():
        target = destination / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(REPO_ROOT / relative, target)


@pytest.fixture(scope="module")
def live_manifest() -> dict[str, Any]:
    return coverage.build_predicate_coverage_v3_manifest(REPO_ROOT)


def test_schema_hashes_and_immutable_v2_baseline() -> None:
    assert coverage.SCHEMA == "p97-rigid221-card18-predicate-coverage/v3"
    assert coverage.LANE_ID_METADATA == "rigid221-card18-predicate-coverage-v3-20260827"
    assert (
        coverage.LANE_BASE_HEAD_METADATA == "2d6eb3ef92ea381990c12b2633a7bfd015e28174"
    )
    assert (
        coverage.FROZEN_CONFIGURATION_SHA256
        == "2c85fb76c85513297fc64766ff3a6d6043deb9576044faf7581278e24be91ba9"
    )
    assert coverage.FROZEN_DELTA_ID_SET_SHA256 == EXPECTED_DELTA_SHA256
    assert coverage.DELTA_CANDIDATE_IDS == EXPECTED_DELTA_IDS
    assert coverage.FROZEN_CANDIDATE_ID_SET_SHA256 == EXPECTED_CANDIDATE_ID_SHA256
    assert coverage.FROZEN_LEAN_SOURCE_ID_SET_SHA256 == EXPECTED_SOURCE_ID_SHA256
    assert coverage.FROZEN_V3_CANDIDATE_ROWS_SHA256 == EXPECTED_CANDIDATE_ROWS_SHA256
    assert coverage.FROZEN_V3_LEAN_SOURCE_ROWS_SHA256 == EXPECTED_SOURCE_ROWS_SHA256
    assert (
        _json_hash(coverage._configuration_snapshot())
        == coverage.FROZEN_CONFIGURATION_SHA256
    )
    module = (REPO_ROOT / coverage.V2_COVERAGE_MODULE_PATH).read_bytes()
    artifact = (REPO_ROOT / coverage.V2_MANIFEST_PATH).read_bytes()
    assert (len(module), hashlib.sha256(module).hexdigest()) == (
        coverage.V2_COVERAGE_MODULE_BYTES,
        coverage.V2_COVERAGE_MODULE_SHA256,
    )
    assert (len(artifact), hashlib.sha256(artifact).hexdigest()) == (
        coverage.V2_MANIFEST_BYTES,
        coverage.V2_MANIFEST_FILE_SHA256,
    )
    assert (
        list(coverage_v2.frozen_v2_candidate_predicate_records())
        == coverage._v2_candidate_rows()
    )
    assert (
        list(coverage_v2.frozen_v2_lean_source_universe()) == coverage._v2_source_rows()
    )


def test_exact_twelve_candidate_delta(live_manifest: dict[str, Any]) -> None:
    old = {
        item["id"]: item for item in coverage_v2.frozen_v2_candidate_predicate_records()
    }
    new = {item["id"]: item for item in live_manifest["candidate_predicates"]}
    assert old.keys() == new.keys() and len(new) == 188
    changed = []
    for key in sorted(old):
        if key in EXPECTED_DELTA_IDS:
            expected = copy.deepcopy(old[key])
            expected["lean_coverage_status"] = coverage.LABEL_DATA_AVAILABLE
            expected["lean_source_ids"] = [coverage.ENRICHMENT_SOURCE_ID]
            assert (
                old[key]["lean_coverage_status"] == coverage.PROP_AVAILABLE_NOT_EMITTED
            )
            assert new[key] == expected
            changed.append(key)
        else:
            assert new[key] == old[key]
    assert tuple(changed) == EXPECTED_DELTA_IDS
    assert _json_hash(changed) == EXPECTED_DELTA_SHA256


def test_exactly_one_enrichment_source_row(live_manifest: dict[str, Any]) -> None:
    old = {item["id"]: item for item in coverage_v2.frozen_v2_lean_source_universe()}
    new = {item["id"]: item for item in live_manifest["lean_source_universe"]}
    assert len(old) == 37 and len(new) == 38
    assert set(new) - set(old) == {coverage.ENRICHMENT_SOURCE_ID}
    for key, value in old.items():
        assert new[key] == value
    enrichment = new[coverage.ENRICHMENT_SOURCE_ID]
    assert enrichment == coverage._enrichment_source_row()
    source = (REPO_ROOT / coverage.ENRICHMENT_SOURCE_PATH).read_bytes()
    assert (len(source), hashlib.sha256(source).hexdigest()) == (
        18989,
        "62e2d79bb56e7f87c7b5aa56398485fc547033ba369a2affe50fc8698b8b1bec",
    )
    assert coverage.ENRICHMENT_ROOT_MODULE in {
        item["module"] for item in enrichment["lean_anchors"]
    }
    assert len(enrichment["lean_anchors"]) == 35
    assert (
        _json_hash(enrichment["lean_anchors"])
        == coverage.FROZEN_ENRICHMENT_ANCHOR_SET_SHA256
    )
    assert (
        enrichment["noncomputable"] is True
        and enrichment["executable"] is False
        and enrichment["blocking"] is False
    )


def test_enrichment_custody_field_is_domain_separated_no_custody(
    live_manifest: dict[str, Any],
) -> None:
    source_rows = {item["id"]: item for item in live_manifest["lean_source_universe"]}
    enrichment = source_rows[coverage.ENRICHMENT_SOURCE_ID]
    expected = hashlib.sha256(
        coverage.ENRICHMENT_NO_CUSTODY_BINDING_DOMAIN.encode("ascii")
    ).hexdigest()
    assert expected == coverage.ENRICHMENT_NO_CUSTODY_BINDING_DIGEST
    assert enrichment["custody_digest"] == expected
    assert enrichment["custody_digest"] != coverage.ENRICHMENT_SOURCE_SHA256
    binding = live_manifest["bindings"]["enrichment_source"]
    assert binding["custody_status"] == "NONE_LIVE_SOURCE_BINDING_ONLY"
    assert binding["schema_compatibility_digest"] == expected


def test_counts_flags_and_hashes(live_manifest: dict[str, Any]) -> None:
    candidates, sources = (
        live_manifest["candidate_predicates"],
        live_manifest["lean_source_universe"],
    )
    summary = live_manifest["coverage_summary"]
    assert len(candidates) == summary["candidate_count"] == 188
    assert len(sources) == summary["lean_source_count"] == 38
    assert Counter(item["origin"] for item in candidates) == Counter(
        {"CALLER_ASSERTION": 42, "CALLER_DATA": 39, "LOCALLY_RECOMPUTED": 107}
    )
    assert Counter(item["lean_coverage_status"] for item in candidates) == Counter(
        {
            coverage.LABEL_DATA_AVAILABLE: 127,
            coverage.PROP_AVAILABLE_NOT_EMITTED: 58,
            coverage.ABSENT_FROM_LABELED_EXPORT: 3,
        }
    )
    assert Counter(item["status"] for item in sources) == Counter(
        {
            coverage.LABEL_DATA_AVAILABLE: 15,
            coverage.PROP_AVAILABLE_NOT_EMITTED: 16,
            coverage.ABSENT_FROM_LABELED_EXPORT: 7,
        }
    )
    assert _json_hash(candidates) == EXPECTED_CANDIDATE_ROWS_SHA256
    assert _json_hash(sources) == EXPECTED_SOURCE_ROWS_SHA256
    assert all(
        not item["source_entitled"] and not item["hard_clause_admission"]
        for item in candidates
    )
    assert live_manifest["admission"]["hard_clause_count"] == 0
    assert all(
        value is False
        for key, value in live_manifest["admission"].items()
        if key not in {"hard_clause_count", "noncomputable_projection_present"}
    )


def test_canonical_roundtrip_and_live_attestation(
    live_manifest: dict[str, Any],
) -> None:
    payload = coverage.encode_predicate_coverage_v3_manifest(live_manifest)
    assert payload == _canonical(live_manifest)
    assert coverage.parse_predicate_coverage_v3_manifest(payload) == live_manifest
    assert (
        coverage.attest_predicate_coverage_v3_manifest(REPO_ROOT, payload)
        == live_manifest
    )
    assert coverage.build_predicate_coverage_v3_manifest(REPO_ROOT) == live_manifest


def test_strict_parse_and_mutations_reject(live_manifest: dict[str, Any]) -> None:
    payload = coverage.encode_predicate_coverage_v3_manifest(live_manifest)
    for malformed in (payload + b"\n", b"NaN"):
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageV3Error):
            coverage.parse_predicate_coverage_v3_manifest(malformed)
    for key, index in (("candidate_predicates", 10), ("lean_source_universe", 10)):
        changed = copy.deepcopy(live_manifest)
        changed[key].pop(index)
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageV3Error):
            coverage.validate_predicate_coverage_v3_manifest(_rehash(changed))


def test_enrichment_and_binding_drift_reject(live_manifest: dict[str, Any]) -> None:
    changed = copy.deepcopy(live_manifest)
    changed["lean_source_universe"][-1]["lean_anchors"].pop()
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV3Error):
        coverage.validate_predicate_coverage_v3_manifest(_rehash(changed))
    changed = copy.deepcopy(live_manifest)
    changed["bindings"]["v2_coverage_module"]["sha256"] = "0" * 64
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV3Error):
        coverage.validate_predicate_coverage_v3_manifest(_rehash(changed))


def test_live_enrichment_source_drift_rejects(tmp_path: Path) -> None:
    root = tmp_path / "repo"
    _copy_live_tree(root)
    (root / coverage.ENRICHMENT_SOURCE_PATH).write_bytes(b"drift")
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV3Error):
        coverage.build_predicate_coverage_v3_manifest(root)


def test_public_rows_are_independent_copies() -> None:
    rows = coverage.frozen_v3_candidate_predicate_records()
    rows[0]["id"] = "mutated"
    assert coverage.frozen_v3_candidate_predicate_records()[0]["id"] != "mutated"
    sources = coverage.frozen_v3_lean_source_universe()
    sources[-1]["lean_anchors"].clear()
    assert coverage.frozen_v3_lean_source_universe()[-1]["lean_anchors"]
