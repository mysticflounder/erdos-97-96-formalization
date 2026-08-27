from __future__ import annotations

import copy
import hashlib
import json
import os
import shutil
from collections import Counter
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import rigid221_card18_crossed_incidence_custody as custody
from census.p97_search import rigid221_card18_predicate_coverage as coverage_v1
from census.p97_search import rigid221_card18_predicate_coverage_v2 as coverage

REPO_ROOT = Path(__file__).parents[3]

EXPECTED_DELTA_IDS = (
    "cross.u_deletion.incidence.c1_in_bo",
    "cross.u_deletion.incidence.c1_in_k2",
    "cross.u_deletion.incidence.c2_in_k1",
    "cross.u_deletion.incidence.conjunction_has_false",
    "cross.u_deletion.incidence.opp_apex_2_in_k1",
    "cross.u_deletion.incidence.opp_apex_2_in_k2",
    "cross.xv_deletion.incidence.c1_in_bo",
    "cross.xv_deletion.incidence.c1_in_k2",
    "cross.xv_deletion.incidence.c2_in_k1",
    "cross.xv_deletion.incidence.conjunction_has_false",
    "cross.xv_deletion.incidence.opp_apex_2_in_k1",
    "cross.xv_deletion.incidence.opp_apex_2_in_k2",
)
EXPECTED_DELTA_SHA256 = (
    "1632720d34634da1c388c5053f141f8e3c637a4254574006e3198d777a854a6a"
)
EXPECTED_CANDIDATE_ID_SHA256 = (
    "ca7a9c209a01eb76153f4784569a5282bd54c96734d4e4db492a61b61d616561"
)
EXPECTED_SOURCE_ID_SHA256 = (
    "28dc1f316c91a9c9aef64972ecfdd3f9ef034f723005afefa02db90c504ba433"
)
EXPECTED_CONFIGURATION_SHA256 = (
    "0e4fcd139eed1723ff2a049a25ebd8ae0d0e4cd5eaa37fb73f04db3f85dbe651"
)
EXPECTED_CANDIDATE_ROWS_SHA256 = (
    "f9d4a1e9dff4ef038217a701cf3b6b6050af0251acfe48c0d3d4d46b7d562f98"
)
EXPECTED_SOURCE_ROWS_SHA256 = (
    "7e0970a8b76ce161080808feb7fbe59631bf5482712b5ad3e9869f240d7343f0"
)
EXPECTED_ANCHOR_SHA256 = (
    "a09c8667e1d5117849c7363c963ed48871c5f41889689b88f6e996b35729898a"
)


def _canonical(value: Any) -> bytes:
    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        allow_nan=False,
    ).encode()


def _json_hash(value: Any) -> str:
    return hashlib.sha256(_canonical(value)).hexdigest()


def _rehash(manifest: dict[str, Any]) -> dict[str, Any]:
    body = dict(manifest)
    body.pop("manifest_sha256", None)
    manifest["manifest_sha256"] = _json_hash(body)
    return manifest


def _candidate_row(manifest: dict[str, Any], canonical_id: str) -> dict[str, Any]:
    return next(
        row for row in manifest["candidate_predicates"] if row["id"] == canonical_id
    )


def _source_row(manifest: dict[str, Any], canonical_id: str) -> dict[str, Any]:
    return next(
        row for row in manifest["lean_source_universe"] if row["id"] == canonical_id
    )


def _all_live_paths() -> tuple[str, ...]:
    crossed_receipt = json.loads(
        (REPO_ROOT / coverage.CROSSED_CUSTODY_PATH).read_bytes()
    )
    source_paths = [row["path"] for row in crossed_receipt["lean_source_manifest"]]
    fixed_paths = [
        coverage.CANDIDATE_PATH,
        coverage.V1_COVERAGE_MODULE_PATH,
        coverage.V1_MANIFEST_PATH,
        coverage.LABELED_CUSTODY_PATH,
        coverage.LABELED_SOURCE_PATH,
        coverage.LABELED_AXIOM_PATH,
        coverage.CROSSED_SOURCE_PATH,
        coverage.CROSSED_AXIOM_PATH,
        coverage.CROSSED_CUSTODY_PATH,
        coverage.COVERAGE_MODULE_PATH,
    ]
    return tuple(sorted(set(source_paths + fixed_paths)))


def _copy_live_tree(destination: Path) -> None:
    for relative in _all_live_paths():
        target = destination / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(REPO_ROOT / relative, target)


@pytest.fixture(scope="module")
def live_manifest() -> dict[str, Any]:
    return coverage.build_predicate_coverage_v2_manifest(REPO_ROOT)


def test_schema_lane_and_frozen_hashes_are_exact() -> None:
    assert coverage.SCHEMA == "p97-rigid221-card18-predicate-coverage/v2"
    assert coverage.LANE_ID_METADATA == "rigid221-card18-predicate-coverage-v2-20260827"
    assert coverage.LANE_BASE_HEAD_METADATA == (
        "7b24c21f0b4764dae852c747b4b384b9a6a97fab"
    )
    assert coverage.FROZEN_CONFIGURATION_SHA256 == EXPECTED_CONFIGURATION_SHA256
    assert coverage.FROZEN_DELTA_ID_SET_SHA256 == EXPECTED_DELTA_SHA256
    assert coverage.FROZEN_CANDIDATE_ID_SET_SHA256 == EXPECTED_CANDIDATE_ID_SHA256
    assert coverage.FROZEN_LEAN_SOURCE_ID_SET_SHA256 == EXPECTED_SOURCE_ID_SHA256
    assert coverage.FROZEN_V2_CANDIDATE_ROWS_SHA256 == EXPECTED_CANDIDATE_ROWS_SHA256
    assert coverage.FROZEN_V2_LEAN_SOURCE_ROWS_SHA256 == EXPECTED_SOURCE_ROWS_SHA256
    assert coverage.FROZEN_CROSSED_ANCHOR_SET_SHA256 == EXPECTED_ANCHOR_SHA256
    assert (
        _json_hash(coverage._configuration_snapshot()) == EXPECTED_CONFIGURATION_SHA256
    )


def test_delta_ids_are_independently_regenerated() -> None:
    independently_generated = tuple(
        sorted(
            f"cross.{arm}_deletion.incidence.{predicate}"
            for arm in ("u", "xv")
            for predicate in (
                "c1_in_bo",
                "c1_in_k2",
                "c2_in_k1",
                "conjunction_has_false",
                "opp_apex_2_in_k1",
                "opp_apex_2_in_k2",
            )
        )
    )
    assert independently_generated == EXPECTED_DELTA_IDS
    assert coverage.DELTA_CANDIDATE_IDS == EXPECTED_DELTA_IDS
    assert _json_hash(list(independently_generated)) == EXPECTED_DELTA_SHA256


def test_candidate_delta_changes_only_twelve_status_fields(
    live_manifest: dict[str, Any],
) -> None:
    old_rows = {
        row["id"]: row for row in coverage_v1.frozen_candidate_predicate_records()
    }
    new_rows = {row["id"]: row for row in live_manifest["candidate_predicates"]}
    assert old_rows.keys() == new_rows.keys()
    changed: list[str] = []
    for canonical_id in sorted(old_rows):
        old = old_rows[canonical_id]
        new = new_rows[canonical_id]
        if canonical_id in EXPECTED_DELTA_IDS:
            expected = copy.deepcopy(old)
            expected["lean_coverage_status"] = coverage.LABEL_DATA_AVAILABLE
            assert old["lean_coverage_status"] == coverage.PROP_AVAILABLE_NOT_EMITTED
            assert old["lean_source_ids"] == [coverage.PROFILE_SOURCE_ID]
            assert new == expected
            changed.append(canonical_id)
        else:
            assert new == old
    assert tuple(changed) == EXPECTED_DELTA_IDS


def test_source_delta_changes_only_the_profile_bundle(
    live_manifest: dict[str, Any],
) -> None:
    old_rows = {row["id"]: row for row in coverage_v1.frozen_lean_source_universe()}
    new_rows = {row["id"]: row for row in live_manifest["lean_source_universe"]}
    assert old_rows.keys() == new_rows.keys()
    changed = [key for key in sorted(old_rows) if old_rows[key] != new_rows[key]]
    assert changed == [coverage.PROFILE_SOURCE_ID]
    profile = new_rows[coverage.PROFILE_SOURCE_ID]
    assert profile == coverage._upgraded_profile_source_row()
    assert profile["status"] == coverage.LABEL_DATA_AVAILABLE
    assert profile["representation"] == "LEAN_FIN18_FIVE_INCIDENCE_BOOL_PROFILE"
    assert profile["custody_digest"] == coverage.CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256
    assert profile["noncomputable"] is True
    assert profile["executable"] is False
    assert profile["blocking"] is False


def test_profile_anchor_set_is_exact_and_complete(
    live_manifest: dict[str, Any],
) -> None:
    anchors = _source_row(live_manifest, coverage.PROFILE_SOURCE_ID)["lean_anchors"]
    names = {anchor["declaration"].rsplit(".", 1)[-1] for anchor in anchors}
    for arm in ("u", "xv"):
        prefix = f"{arm}DeletionFiveIncidenceProfile"
        assert prefix in names
        assert f"{prefix}_conjunctionHasFalse" in names
        for suffix in (
            "actualCenter1InBO_iff",
            "oppApex2InK1_iff",
            "actualCenter2InK1_iff",
            "oppApex2InK2_iff",
            "actualCenter1InK2_iff",
        ):
            assert f"{prefix}_{suffix}" in names
    assert len(anchors) == 23
    assert _json_hash(anchors) == EXPECTED_ANCHOR_SHA256
    assert all(anchor["module"] == coverage.CROSSED_ROOT_MODULE for anchor in anchors)


def test_summary_counts_and_hashes_are_exact(live_manifest: dict[str, Any]) -> None:
    candidates = live_manifest["candidate_predicates"]
    sources = live_manifest["lean_source_universe"]
    summary = live_manifest["coverage_summary"]
    assert len(candidates) == summary["candidate_count"] == 188
    assert len(sources) == summary["lean_source_count"] == 37
    assert Counter(row["origin"] for row in candidates) == Counter(
        {"CALLER_ASSERTION": 42, "CALLER_DATA": 39, "LOCALLY_RECOMPUTED": 107}
    )
    assert Counter(row["lean_coverage_status"] for row in candidates) == Counter(
        {
            coverage.LABEL_DATA_AVAILABLE: 115,
            coverage.PROP_AVAILABLE_NOT_EMITTED: 70,
            coverage.ABSENT_FROM_LABELED_EXPORT: 3,
        }
    )
    assert Counter(row["status"] for row in sources) == Counter(
        {
            coverage.LABEL_DATA_AVAILABLE: 14,
            coverage.PROP_AVAILABLE_NOT_EMITTED: 16,
            coverage.ABSENT_FROM_LABELED_EXPORT: 7,
        }
    )
    assert _json_hash(candidates) == EXPECTED_CANDIDATE_ROWS_SHA256
    assert _json_hash(sources) == EXPECTED_SOURCE_ROWS_SHA256
    assert summary["delta_id_set_sha256"] == EXPECTED_DELTA_SHA256


def test_all_admission_and_entitlement_flags_remain_closed(
    live_manifest: dict[str, Any],
) -> None:
    assert all(
        not row["source_entitled"] for row in live_manifest["candidate_predicates"]
    )
    assert all(
        not row["hard_clause_admission"]
        for row in live_manifest["candidate_predicates"]
    )
    admission = live_manifest["admission"]
    assert admission["hard_clause_count"] == 0
    assert admission["noncomputable_projection_present"] is True
    assert all(
        value is False
        for key, value in admission.items()
        if key not in {"hard_clause_count", "noncomputable_projection_present"}
    )


def test_live_roundtrip_is_deterministic_and_attested(
    live_manifest: dict[str, Any],
) -> None:
    rebuilt = coverage.build_predicate_coverage_v2_manifest(REPO_ROOT)
    assert rebuilt == live_manifest
    payload = coverage.encode_predicate_coverage_v2_manifest(live_manifest)
    assert payload == _canonical(live_manifest)
    assert coverage.parse_predicate_coverage_v2_manifest(payload) == live_manifest
    assert coverage.attest_predicate_coverage_v2_manifest(REPO_ROOT, payload) == (
        live_manifest
    )


def test_live_bindings_include_v1_and_crossed_artifacts(
    live_manifest: dict[str, Any],
) -> None:
    bindings = live_manifest["bindings"]
    assert set(bindings) == {*coverage._fixed_bindings(), "coverage_v2_module"}
    assert (
        bindings["v1_coverage_module"]["sha256"] == coverage.V1_COVERAGE_MODULE_SHA256
    )
    assert bindings["v1_coverage_manifest"]["manifest_sha256"] == (
        coverage.V1_MANIFEST_SHA256
    )
    assert bindings["crossed_incidence_custody"]["receipt_sha256"] == (
        coverage.CROSSED_CUSTODY_RECEIPT_SHA256
    )
    assert bindings["crossed_incidence_axiom_receipt"]["receipt_sha256"] == (
        coverage.CROSSED_AXIOM_RECEIPT_SHA256
    )
    module_payload = (REPO_ROOT / coverage.COVERAGE_MODULE_PATH).read_bytes()
    assert bindings["coverage_v2_module"] == {
        "path": coverage.COVERAGE_MODULE_PATH,
        "bytes": len(module_payload),
        "sha256": hashlib.sha256(module_payload).hexdigest(),
    }
    assert "coverage_v2_module" not in coverage._fixed_bindings()


def test_v1_v2_and_custody_schemas_do_not_cross_attest(
    live_manifest: dict[str, Any],
) -> None:
    v2_payload = coverage.encode_predicate_coverage_v2_manifest(live_manifest)
    v1_payload = (REPO_ROOT / coverage.V1_MANIFEST_PATH).read_bytes()
    custody_payload = (REPO_ROOT / coverage.CROSSED_CUSTODY_PATH).read_bytes()
    with pytest.raises(coverage_v1.Rigid221Card18PredicateCoverageError):
        coverage_v1.parse_predicate_coverage_manifest(v2_payload)
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.parse_predicate_coverage_v2_manifest(v1_payload)
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.parse_predicate_coverage_v2_manifest(custody_payload)
    with pytest.raises(custody.Rigid221Card18CrossedIncidenceCustodyError):
        custody.parse_crossed_incidence_source_custody_receipt(v2_payload)


@pytest.mark.parametrize("mutation", ["omit", "replace", "duplicate", "reorder"])
def test_candidate_set_mutations_reject(
    live_manifest: dict[str, Any], mutation: str
) -> None:
    changed = copy.deepcopy(live_manifest)
    rows = changed["candidate_predicates"]
    if mutation == "omit":
        rows.pop(10)
    elif mutation == "replace":
        rows[10]["id"] = "replacement.id"
    elif mutation == "duplicate":
        rows[10] = copy.deepcopy(rows[11])
    else:
        rows[10], rows[11] = rows[11], rows[10]
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))


@pytest.mark.parametrize("mutation", ["omit", "replace", "duplicate", "reorder"])
def test_source_set_mutations_reject(
    live_manifest: dict[str, Any], mutation: str
) -> None:
    changed = copy.deepcopy(live_manifest)
    rows = changed["lean_source_universe"]
    if mutation == "omit":
        rows.pop(10)
    elif mutation == "replace":
        rows[10]["id"] = "replacement.source"
    elif mutation == "duplicate":
        rows[10] = copy.deepcopy(rows[11])
    else:
        rows[10], rows[11] = rows[11], rows[10]
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))


@pytest.mark.parametrize(
    ("canonical_id", "field", "value"),
    [
        (EXPECTED_DELTA_IDS[0], "lean_coverage_status", "PROP_AVAILABLE_NOT_EMITTED"),
        (EXPECTED_DELTA_IDS[1], "source_entitled", True),
        (EXPECTED_DELTA_IDS[2], "hard_clause_admission", True),
        ("carrier.exact_cardinality.eq18", "origin", "CALLER_DATA"),
        ("carrier.exact_cardinality.eq18", "representation", "LABEL"),
        ("carrier.exact_cardinality.eq18", "arms", ["all"]),
        ("carrier.exact_cardinality.eq18", "dependencies", ["unknown.id"]),
    ],
)
def test_candidate_status_entitlement_and_semantic_mutations_reject(
    live_manifest: dict[str, Any],
    canonical_id: str,
    field: str,
    value: Any,
) -> None:
    changed = copy.deepcopy(live_manifest)
    _candidate_row(changed, canonical_id)[field] = value
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))


def test_dependency_cycle_and_cross_arm_edge_reject(
    live_manifest: dict[str, Any],
) -> None:
    cycle = copy.deepcopy(live_manifest)
    first = _candidate_row(cycle, EXPECTED_DELTA_IDS[0])
    dependency = first["dependencies"][0]
    _candidate_row(cycle, dependency)["dependencies"] = [first["id"]]
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(cycle))

    cross_arm = copy.deepcopy(live_manifest)
    _candidate_row(cross_arm, EXPECTED_DELTA_IDS[0])["dependencies"] = [
        "cross.xv_deletion.row.c1.support"
    ]
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(cross_arm))


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("status", "PROP_AVAILABLE_NOT_EMITTED"),
        ("representation", "LEAN_PROP_ONLY"),
        ("custody_digest", "0" * 64),
        ("noncomputable", False),
        ("executable", True),
        ("blocking", True),
        ("lean_anchors", []),
    ],
)
def test_profile_source_status_anchor_and_digest_mutations_reject(
    live_manifest: dict[str, Any], field: str, value: Any
) -> None:
    changed = copy.deepcopy(live_manifest)
    _source_row(changed, coverage.PROFILE_SOURCE_ID)[field] = value
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))


def test_profile_anchor_omission_alias_and_order_mutations_reject(
    live_manifest: dict[str, Any],
) -> None:
    mutations: list[dict[str, Any]] = []
    omitted = copy.deepcopy(live_manifest)
    _source_row(omitted, coverage.PROFILE_SOURCE_ID)["lean_anchors"].pop()
    mutations.append(omitted)
    aliased = copy.deepcopy(live_manifest)
    anchors = _source_row(aliased, coverage.PROFILE_SOURCE_ID)["lean_anchors"]
    anchors[0] = copy.deepcopy(anchors[1])
    mutations.append(aliased)
    reordered = copy.deepcopy(live_manifest)
    anchors = _source_row(reordered, coverage.PROFILE_SOURCE_ID)["lean_anchors"]
    anchors[0], anchors[1] = anchors[1], anchors[0]
    mutations.append(reordered)
    for changed in mutations:
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
            coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))


@pytest.mark.parametrize(
    "summary_field",
    [
        "candidate_id_set_sha256",
        "candidate_rows_sha256",
        "delta_id_set_sha256",
        "lean_source_id_set_sha256",
        "lean_source_rows_sha256",
    ],
)
def test_exact_set_and_row_hash_mutations_reject(
    live_manifest: dict[str, Any], summary_field: str
) -> None:
    changed = copy.deepcopy(live_manifest)
    changed["coverage_summary"][summary_field] = "0" * 64
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))


@pytest.mark.parametrize(
    "binding",
    [
        "v1_candidate",
        "v1_coverage_module",
        "v1_coverage_manifest",
        "v1_labeled_projection_custody",
        "v1_labeled_projection_source",
        "v1_labeled_projection_axiom_receipt",
        "crossed_incidence_source",
        "crossed_incidence_axiom_receipt",
        "crossed_incidence_custody",
    ],
)
def test_stale_fixed_binding_mutations_reject(
    live_manifest: dict[str, Any], binding: str
) -> None:
    changed = copy.deepcopy(live_manifest)
    record = changed["bindings"][binding]
    hash_field = next(key for key in record if "sha256" in key)
    record[hash_field] = "0" * 64
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))


@pytest.mark.parametrize(
    "flag",
    [
        "source_faithful_serializer",
        "python_lean_serialization_equivalence",
        "solver_admission",
        "canary_authorized",
        "proof_ready",
        "solver_ready",
    ],
)
def test_admission_escalations_reject(live_manifest: dict[str, Any], flag: str) -> None:
    changed = copy.deepcopy(live_manifest)
    changed["admission"][flag] = True
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))


@pytest.mark.parametrize("value", [True, 1])
def test_hard_clause_count_escalation_and_bool_alias_reject(
    live_manifest: dict[str, Any], value: Any
) -> None:
    changed = copy.deepcopy(live_manifest)
    changed["admission"]["hard_clause_count"] = value
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))


def test_strict_candidate_and_source_booleans_reject_integer_aliases(
    live_manifest: dict[str, Any],
) -> None:
    changed = copy.deepcopy(live_manifest)
    changed["candidate_predicates"][0]["source_entitled"] = 0
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))
    changed = copy.deepcopy(live_manifest)
    changed["lean_source_universe"][0]["blocking"] = 1
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(_rehash(changed))


def test_wrong_unknown_and_missing_manifest_fields_reject(
    live_manifest: dict[str, Any],
) -> None:
    mutations: list[Any] = []
    wrong_schema = copy.deepcopy(live_manifest)
    wrong_schema["schema"] = coverage_v1.SCHEMA
    mutations.append(wrong_schema)
    extra = copy.deepcopy(live_manifest)
    extra["extra"] = False
    mutations.append(extra)
    missing = copy.deepcopy(live_manifest)
    del missing["admission"]
    mutations.append(missing)
    mutations.extend(([], "manifest", None))
    for changed in mutations:
        if type(changed) is dict:
            _rehash(changed)
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
            coverage.validate_predicate_coverage_v2_manifest(changed)


def test_wrong_self_hash_rejects(live_manifest: dict[str, Any]) -> None:
    changed = copy.deepcopy(live_manifest)
    changed["manifest_sha256"] = "0" * 64
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.validate_predicate_coverage_v2_manifest(changed)


def test_noncanonical_duplicate_nan_infinity_and_mutable_json_reject(
    live_manifest: dict[str, Any],
) -> None:
    payload = coverage.encode_predicate_coverage_v2_manifest(live_manifest)
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.parse_predicate_coverage_v2_manifest(payload + b"\n")
    duplicate = payload.replace(
        b'{"admission":', b'{"schema":"duplicate","admission":', 1
    )
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.parse_predicate_coverage_v2_manifest(duplicate)
    for constant in (b"NaN", b"Infinity", b"-Infinity"):
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
            coverage.parse_predicate_coverage_v2_manifest(constant)
    for mutable in (bytearray(payload), memoryview(payload), payload.decode()):
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
            coverage.parse_predicate_coverage_v2_manifest(mutable)  # type: ignore[arg-type]


def test_crossed_axiom_receipt_exact_body_and_commands_reject_mutation() -> None:
    payload = (REPO_ROOT / coverage.CROSSED_AXIOM_PATH).read_bytes()
    coverage._validate_crossed_axiom_receipt(payload)
    value = json.loads(payload)
    value["lean_commands"][0] = "#print axioms wrong"
    body = dict(value)
    del body["receipt_sha256"]
    value["receipt_sha256"] = _json_hash(body)
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage._validate_crossed_axiom_receipt(_canonical(value))


@pytest.mark.parametrize(
    ("relative", "replacement"),
    [
        (coverage.V1_COVERAGE_MODULE_PATH, b"v1 drift"),
        (coverage.V1_MANIFEST_PATH, b"{}"),
        (coverage.CROSSED_SOURCE_PATH, b"source drift"),
        (coverage.CROSSED_AXIOM_PATH, b"{}"),
        (coverage.CROSSED_CUSTODY_PATH, b"{}"),
    ],
)
def test_live_v1_and_crossed_artifact_drift_rejects(
    tmp_path: Path, relative: str, replacement: bytes
) -> None:
    root = tmp_path / "repo"
    _copy_live_tree(root)
    (root / relative).write_bytes(replacement)
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.build_predicate_coverage_v2_manifest(root)


def test_crossed_custody_receipt_cannot_be_replaced_by_old_receipt(
    tmp_path: Path,
) -> None:
    root = tmp_path / "repo"
    _copy_live_tree(root)
    (root / coverage.CROSSED_CUSTODY_PATH).write_bytes(
        (REPO_ROOT / coverage.LABELED_CUSTODY_PATH).read_bytes()
    )
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.build_predicate_coverage_v2_manifest(root)


@pytest.mark.parametrize(
    "path",
    ["", "/absolute", "../escape", "a/../b", "a//b", "a\\b", "a\x00b"],
)
def test_malformed_bound_paths_reject(path: str) -> None:
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage._validate_relative_path(path)


@pytest.mark.parametrize("case", ["missing", "symlink", "hardlink", "fifo"])
def test_descriptor_read_rejects_missing_symlink_hardlink_and_fifo(
    tmp_path: Path, case: str
) -> None:
    root = tmp_path / case
    root.mkdir()
    target = root / "artifact"
    if case == "symlink":
        outside = tmp_path / "outside"
        outside.write_bytes(b"payload")
        target.symlink_to(outside)
    elif case == "hardlink":
        outside = tmp_path / "outside"
        outside.write_bytes(b"payload")
        try:
            os.link(outside, target)
        except OSError:
            pytest.skip("hard links are unsupported on this filesystem")
    elif case == "fifo":
        if not hasattr(os, "mkfifo"):
            pytest.skip("FIFOs are unsupported on this platform")
        os.mkfifo(target)
    descriptor = coverage._open_repo_root(root)
    try:
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
            coverage._read_bound_artifact(descriptor, "artifact")
    finally:
        os.close(descriptor)


def test_live_inside_repository_hardlink_alias_rejects(tmp_path: Path) -> None:
    root = tmp_path / "repo"
    _copy_live_tree(root)
    target = root / coverage.CROSSED_SOURCE_PATH
    alias = root / "inside-alias.lean"
    try:
        os.link(target, alias)
    except OSError:
        pytest.skip("hard links are unsupported on this filesystem")
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage.build_predicate_coverage_v2_manifest(root)


def test_symlinked_repository_root_rejects(tmp_path: Path) -> None:
    real = tmp_path / "real"
    real.mkdir()
    linked = tmp_path / "linked"
    linked.symlink_to(real, target_is_directory=True)
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
        coverage._open_repo_root(linked)


def test_frozen_public_rows_are_independent_copies() -> None:
    first = coverage.frozen_v2_candidate_predicate_records()
    first[0]["id"] = "mutated"
    assert coverage.frozen_v2_candidate_predicate_records()[0]["id"] != "mutated"
    sources = coverage.frozen_v2_lean_source_universe()
    sources[0]["lean_anchors"].clear()
    assert coverage.frozen_v2_lean_source_universe()[0]["lean_anchors"]


def test_coordinated_configuration_and_defaults_tampering_fails_all_public_apis(
    monkeypatch: pytest.MonkeyPatch,
    live_manifest: dict[str, Any],
) -> None:
    payload = coverage.encode_predicate_coverage_v2_manifest(live_manifest)
    monkeypatch.setattr(coverage, "SCHEMA", "coordinated-tamper")
    monkeypatch.setattr(coverage, "FROZEN_CONFIGURATION_SHA256", "0" * 64)
    monkeypatch.setattr(
        coverage._assert_frozen_configuration, "__defaults__", ("0" * 64,)
    )
    monkeypatch.setattr(
        coverage._assert_frozen_configuration,
        "__kwdefaults__",
        {"literal": "0" * 64},
    )
    public_calls = (
        coverage.frozen_v2_candidate_predicate_records,
        coverage.frozen_v2_lean_source_universe,
        lambda: coverage.build_predicate_coverage_v2_manifest(REPO_ROOT),
        lambda: coverage.validate_predicate_coverage_v2_manifest(live_manifest),
        lambda: coverage.encode_predicate_coverage_v2_manifest(live_manifest),
        lambda: coverage.parse_predicate_coverage_v2_manifest(payload),
        lambda: coverage.attest_predicate_coverage_v2_manifest(REPO_ROOT, payload),
    )
    for call in public_calls:
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageV2Error):
            call()
