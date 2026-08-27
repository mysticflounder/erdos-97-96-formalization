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

from census.p97_search import rigid221_card18_labeled_projection_custody as custody
from census.p97_search import rigid221_card18_predicate_coverage as coverage

REPO_ROOT = Path(__file__).parents[3]

BI = "BI_SURVIVAL_COMMON_DELETION_RECTANGLE"
U = "U_DELETION_MISSING_INCIDENCE"
XV = "XV_DELETION_MISSING_INCIDENCE"

EXPECTED_CANDIDATE_ID_SHA256 = (
    "ca7a9c209a01eb76153f4784569a5282bd54c96734d4e4db492a61b61d616561"
)
EXPECTED_SOURCE_ID_SHA256 = (
    "28dc1f316c91a9c9aef64972ecfdd3f9ef034f723005afefa02db90c504ba433"
)

# This is deliberately independent of the implementation's generated source
# rows.  A missing/replaced spelling here changes the independently computed
# set digest even if the implementation mutates in concert.
EXPECTED_SOURCE_IDS = (
    "arm.constructor",
    "arm.deletion_profile",
    "bi.common_deletion_packet",
    "cap.fin18_membership_table",
    "cap.interior_facts",
    "cap.partition_arc",
    "carrier.card_eq_18",
    "carrier.fin18_labeling",
    "carrier.point_mem",
    "k4.fin18_predicate_table",
    "k4.minimality",
    "k4.radius_classification",
    "minimality.fin18_clause_projection",
    "order.fin18_cyclic",
    "parent.blocker_v_residual",
    "parent.p_context",
    "parent.source_heavy_packet",
    "profile.crossed_missing_incidence",
    "profile.deletion_survival",
    "radius.cross_row_equalities",
    "radius.physical_link",
    "radius.selected_shell",
    "radius.u5_same_radius",
    "roles.distinctness",
    "roles.label_values",
    "roles.point_equalities",
    "row.selected_shell",
    "row.u5_q_deleted_k4",
    "selected_row.fin18_order_table",
    "selected_row.origin_and_trace",
    "source.live_parent_facts",
    "source.neutral_origin",
    "support.bi_intersection",
    "support.bi_overlap",
    "support.crossed_membership",
    "support.four_support_record",
    "support.q_exclusion",
)

LABEL_DATA_IDS = {
    "arm.constructor",
    "arm.deletion_profile",
    "carrier.card_eq_18",
    "carrier.fin18_labeling",
    "carrier.point_mem",
    "roles.distinctness",
    "roles.label_values",
    "roles.point_equalities",
    "support.bi_intersection",
    "support.bi_overlap",
    "support.crossed_membership",
    "support.four_support_record",
    "support.q_exclusion",
}
PROP_ONLY_IDS = {
    "bi.common_deletion_packet",
    "cap.interior_facts",
    "cap.partition_arc",
    "k4.minimality",
    "k4.radius_classification",
    "parent.blocker_v_residual",
    "parent.p_context",
    "parent.source_heavy_packet",
    "profile.crossed_missing_incidence",
    "profile.deletion_survival",
    "radius.selected_shell",
    "radius.u5_same_radius",
    "row.selected_shell",
    "row.u5_q_deleted_k4",
    "selected_row.origin_and_trace",
    "source.live_parent_facts",
    "source.neutral_origin",
}
ABSENT_IDS = {
    "cap.fin18_membership_table",
    "k4.fin18_predicate_table",
    "minimality.fin18_clause_projection",
    "order.fin18_cyclic",
    "radius.cross_row_equalities",
    "radius.physical_link",
    "selected_row.fin18_order_table",
}


def _independent_candidate_ids() -> tuple[str, ...]:
    ids = [
        "boundary.full_source_faithful_model.false",
        "boundary.finite_ingress_proved.false",
        "boundary.coverage_lift_proved.false",
        "carrier.exact_cardinality.eq18",
        "carrier.labels.length_eq18",
        "carrier.labels.names_valid",
        "carrier.labels.unique",
    ]
    roles = (
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
    ids.extend(f"role.binding.{role}" for role in roles)
    ids.extend(f"role.in_carrier.{role}" for role in roles)
    ids.extend(
        (
            "role.u_ne_xv",
            "role.source_1_ne_source_2",
            "role.actual_center_1_ne_actual_center_2",
            "role.physical_five.all_distinct",
            "role.opp_apex_2.not_in_physical_five",
            "role.source_1.not_alias_u_or_xv",
            "role.source_2.not_alias_u_or_xv",
        )
    )
    ids.extend(
        f"q.{name}"
        for name in (
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
    )
    ids.extend(
        (
            "live.center_v_eq_deleted",
            "live.deleted_center.in_opposite_cap_interior",
            "live.deleted_center.not_in_opposite_class",
            "live.next_row_physical_hits.le1",
            "live.cardinality.live_ge18_and_diagnostic_eq18",
        )
    )
    for index in (1, 2):
        ids.extend(
            (
                f"source_pair.source_{index}.actual_center_link",
                f"source_pair.source_{index}.outside_xv_row",
            )
        )
    for deletion in ("u", "xv"):
        for index in (1, 2):
            ids.append(f"deletion.{deletion}.source_{index}.status")
    ids.append("deletion.profile.selects_exact_packet_arm")

    for arm_name in ("u_deletion", "xv_deletion"):
        for key in (
            "deletion_role",
            "actual_blocker_role",
            "common_member_role",
        ):
            ids.append(f"cross.{arm_name}.config.{key}")
        for row in ("c1", "c2", "co"):
            base = f"cross.{arm_name}.row.{row}"
            ids.extend(
                (
                    base + ".support",
                    base + ".card.declared_eq4",
                    base + ".support.length_eq4",
                    base + ".support.unique",
                    base + ".support.subset_carrier",
                    base + ".deletion_excluded",
                    base + ".common_member_included",
                    base + ".center_excluded",
                )
            )
        ids.extend(
            (
                f"cross.{arm_name}.row.c1.source_1_included",
                f"cross.{arm_name}.row.c2.source_2_included",
                f"cross.{arm_name}.incidence.c1_in_bo",
                f"cross.{arm_name}.incidence.opp_apex_2_in_k1",
                f"cross.{arm_name}.incidence.c2_in_k1",
                f"cross.{arm_name}.incidence.opp_apex_2_in_k2",
                f"cross.{arm_name}.incidence.c1_in_k2",
                f"cross.{arm_name}.incidence.conjunction_has_false",
            )
        )

    ids.append("bi.endpoint_coverage.ordered_u_xv")
    for endpoint in ("u", "xv"):
        base = f"bi.{endpoint}"
        ids.extend(
            (
                base + ".q_role",
                base + ".center_role.1",
                base + ".center_role.2",
                base + ".center.1.in_carrier",
                base + ".center.2.in_carrier",
                base + ".centers_distinct",
                base + ".actual_blocker_source_role",
                base + ".actual_blocker_role",
                base + ".actual_blocker_ne_center.1",
                base + ".actual_blocker_ne_center.2",
            )
        )
        for row in ("b1", "b2"):
            row_base = f"{base}.row.{row}"
            ids.extend(
                (
                    row_base + ".support",
                    row_base + ".card.declared_eq4",
                    row_base + ".support.length_eq4",
                    row_base + ".support.unique",
                    row_base + ".support.subset_carrier",
                    row_base + ".q_excluded",
                    row_base + ".center_excluded",
                )
            )
        ids.append(base + ".rows.overlap_le2")
    return tuple(sorted(ids))


def _independent_candidate_origins() -> dict[str, str]:
    ids = _independent_candidate_ids()
    assertion_ids = {
        canonical_id
        for canonical_id in ids
        if canonical_id.startswith(("boundary.", "q.", "live."))
        or canonical_id == "carrier.exact_cardinality.eq18"
        or canonical_id.endswith(
            (".outside_xv_row", ".status", ".card.declared_eq4")
        )
    }
    data_ids = {
        canonical_id
        for canonical_id in ids
        if canonical_id.startswith("role.binding.")
        or canonical_id.endswith(".actual_center_link")
        or (
            canonical_id.startswith("cross.")
            and (
                ".config." in canonical_id
                or canonical_id.endswith(".support")
            )
        )
        or (
            canonical_id.startswith("bi.")
            and (
                canonical_id.endswith(
                    (
                        ".q_role",
                        ".actual_blocker_source_role",
                        ".actual_blocker_role",
                        ".support",
                    )
                )
                or ".center_role." in canonical_id
            )
        )
    }
    assert not assertion_ids & data_ids
    return {
        canonical_id: (
            "CALLER_ASSERTION"
            if canonical_id in assertion_ids
            else "CALLER_DATA"
            if canonical_id in data_ids
            else "LOCALLY_RECOMPUTED"
        )
        for canonical_id in ids
    }


def _canonical(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode()


def _set_hash(ids: tuple[str, ...] | list[str]) -> str:
    return hashlib.sha256(_canonical(list(ids))).hexdigest()


def _rehash(manifest: dict[str, Any]) -> dict[str, Any]:
    body = copy.deepcopy(manifest)
    body.pop("manifest_sha256", None)
    body["manifest_sha256"] = hashlib.sha256(_canonical(body)).hexdigest()
    return body


def _candidate_row(manifest: dict[str, Any], canonical_id: str) -> dict[str, Any]:
    return next(
        row for row in manifest["candidate_predicates"] if row["id"] == canonical_id
    )


def _source_row(manifest: dict[str, Any], canonical_id: str) -> dict[str, Any]:
    return next(
        row for row in manifest["lean_source_universe"] if row["id"] == canonical_id
    )


@pytest.fixture(scope="module")
def live_manifest() -> dict[str, Any]:
    return coverage.build_predicate_coverage_manifest(REPO_ROOT)


def _copy_live_tree(destination: Path) -> None:
    paths = {
        coverage.CANDIDATE_PATH,
        coverage.COVERAGE_MODULE_PATH,
        coverage.CUSTODY_RECEIPT_PATH,
        coverage.LABELED_SOURCE_PATH,
        coverage.AXIOM_RECEIPT_PATH,
    }
    paths.update(record["path"] for record in custody.FROZEN_LEAN_SOURCE_MANIFEST)
    for relative in paths:
        target = destination / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(REPO_ROOT / relative, target)


def test_independent_candidate_universe_and_hash() -> None:
    ids = _independent_candidate_ids()
    assert len(ids) == 188
    assert len(set(ids)) == 188
    assert _set_hash(ids) == EXPECTED_CANDIDATE_ID_SHA256
    assert coverage.FROZEN_CANDIDATE_ID_SET_SHA256 == EXPECTED_CANDIDATE_ID_SHA256


def test_independent_source_universe_and_hash() -> None:
    assert len(EXPECTED_SOURCE_IDS) == 37
    assert EXPECTED_SOURCE_IDS == tuple(sorted(EXPECTED_SOURCE_IDS))
    assert _set_hash(EXPECTED_SOURCE_IDS) == EXPECTED_SOURCE_ID_SHA256
    assert coverage.FROZEN_LEAN_SOURCE_ID_SET_SHA256 == EXPECTED_SOURCE_ID_SHA256
    assert LABEL_DATA_IDS | PROP_ONLY_IDS | ABSENT_IDS == set(EXPECTED_SOURCE_IDS)
    assert not LABEL_DATA_IDS & PROP_ONLY_IDS
    assert not LABEL_DATA_IDS & ABSENT_IDS
    assert not PROP_ONLY_IDS & ABSENT_IDS


def test_exact_counts_and_orders(live_manifest: dict[str, Any]) -> None:
    candidate_rows = live_manifest["candidate_predicates"]
    source_rows = live_manifest["lean_source_universe"]
    assert [row["id"] for row in candidate_rows] == list(_independent_candidate_ids())
    assert [row["id"] for row in source_rows] == list(EXPECTED_SOURCE_IDS)
    assert Counter(row["origin"] for row in candidate_rows) == {
        "CALLER_ASSERTION": 42,
        "CALLER_DATA": 39,
        "LOCALLY_RECOMPUTED": 107,
    }
    assert Counter(row["status"] for row in source_rows) == {
        "LABEL_DATA_AVAILABLE": 13,
        "PROP_AVAILABLE_NOT_EMITTED": 17,
        "ABSENT_FROM_LABELED_EXPORT": 7,
    }
    expected_origins = _independent_candidate_origins()
    assert {row["id"]: row["origin"] for row in candidate_rows} == expected_origins
    expected_statuses = {
        **{canonical_id: "LABEL_DATA_AVAILABLE" for canonical_id in LABEL_DATA_IDS},
        **{
            canonical_id: "PROP_AVAILABLE_NOT_EMITTED"
            for canonical_id in PROP_ONLY_IDS
        },
        **{
            canonical_id: "ABSENT_FROM_LABELED_EXPORT"
            for canonical_id in ABSENT_IDS
        },
    }
    assert {row["id"]: row["status"] for row in source_rows} == expected_statuses
    for row in candidate_rows:
        statuses = {expected_statuses[source_id] for source_id in row["lean_source_ids"]}
        assert statuses == {row["lean_coverage_status"]}


def test_live_build_encode_parse_attest_roundtrip(
    live_manifest: dict[str, Any],
) -> None:
    first = coverage.encode_predicate_coverage_manifest(live_manifest)
    assert coverage.parse_predicate_coverage_manifest(first) == live_manifest
    assert coverage.encode_predicate_coverage_manifest(live_manifest) == first
    assert coverage.attest_predicate_coverage_manifest(REPO_ROOT, first) == live_manifest


def test_only_gap_ledger_admission_is_accepted(live_manifest: dict[str, Any]) -> None:
    assert live_manifest["admission"] == {
        "source_faithful_serializer": False,
        "python_lean_serialization_equivalence": False,
        "hard_clause_count": 0,
        "solver_admission": False,
        "canary_authorized": False,
        "proof_ready": False,
        "solver_ready": False,
        "noncomputable_projection_present": True,
    }
    assert all(not row["source_entitled"] for row in live_manifest["candidate_predicates"])
    assert all(
        not row["hard_clause_admission"]
        for row in live_manifest["candidate_predicates"]
    )


@pytest.mark.parametrize("section", ["candidate_predicates", "lean_source_universe"])
def test_omitted_duplicate_replaced_and_reordered_rows_reject(
    live_manifest: dict[str, Any], section: str
) -> None:
    for mutation in ("omitted", "duplicate", "replaced", "reordered"):
        changed = copy.deepcopy(live_manifest)
        rows = changed[section]
        if mutation == "omitted":
            rows.pop(0)
        elif mutation == "duplicate":
            rows[1] = copy.deepcopy(rows[0])
        elif mutation == "replaced":
            rows[0]["id"] = "unknown.replacement"
        else:
            rows[0], rows[1] = rows[1], rows[0]
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
            coverage.validate_predicate_coverage_manifest(_rehash(changed))


@pytest.mark.parametrize(
    ("canonical_id", "field", "replacement"),
    [
        ("q.hsecond", "origin", "CALLER_DATA"),
        ("role.binding.u", "representation", "DERIVED_BOOLEAN"),
        ("carrier.labels.unique", "representation", "LABEL"),
        ("q.hsecond", "arms", []),
        ("q.hsecond", "arms", ["all"]),
        ("q.hsecond", "arms", [XV, U, BI]),
    ],
)
def test_candidate_origin_representation_and_arms_mutations_reject(
    live_manifest: dict[str, Any],
    canonical_id: str,
    field: str,
    replacement: Any,
) -> None:
    changed = copy.deepcopy(live_manifest)
    _candidate_row(changed, canonical_id)[field] = replacement
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))


@pytest.mark.parametrize(
    ("canonical_id", "field", "replacement"),
    [
        ("carrier.card_eq_18", "status", "PROP_AVAILABLE_NOT_EMITTED"),
        ("carrier.card_eq_18", "representation", "LEAN_PROP_ONLY"),
        ("carrier.card_eq_18", "noncomputable", 1),
        ("parent.p_context", "executable", True),
        ("cap.fin18_membership_table", "blocking", False),
        ("cap.fin18_membership_table", "lean_anchors", [{"module": "M", "declaration": "D", "kind": "theorem"}]),
    ],
)
def test_source_status_representation_and_execution_mutations_reject(
    live_manifest: dict[str, Any],
    canonical_id: str,
    field: str,
    replacement: Any,
) -> None:
    changed = copy.deepcopy(live_manifest)
    _source_row(changed, canonical_id)[field] = replacement
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))


def test_dependency_unknown_duplicate_self_and_cycle_reject(
    live_manifest: dict[str, Any],
) -> None:
    target = "carrier.labels.unique"
    for dependencies in (["unknown.id"], ["role.binding.u", "role.binding.u"], [target]):
        changed = copy.deepcopy(live_manifest)
        _candidate_row(changed, target)["dependencies"] = dependencies
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
            coverage.validate_predicate_coverage_manifest(_rehash(changed))

    changed = copy.deepcopy(live_manifest)
    left = _candidate_row(changed, "carrier.labels.unique")
    right = _candidate_row(changed, "carrier.labels.names_valid")
    left["dependencies"] = [right["id"]]
    right["dependencies"] = [left["id"]]
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))


def test_cross_arm_dependency_rejects(live_manifest: dict[str, Any]) -> None:
    changed = copy.deepcopy(live_manifest)
    target = _candidate_row(changed, "cross.u_deletion.incidence.c1_in_bo")
    target["dependencies"] = [
        "cross.xv_deletion.row.co.support",
        "role.binding.actual_center_1",
    ]
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))


def test_algorithm_and_exact_input_rules_reject(live_manifest: dict[str, Any]) -> None:
    changed = copy.deepcopy(live_manifest)
    _candidate_row(changed, "carrier.labels.unique")["algorithm"] = None
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))

    changed = copy.deepcopy(live_manifest)
    row = _candidate_row(changed, "carrier.labels.unique")
    row["algorithm"]["inputs"] = ["carrier.labels", "carrier.labels"]
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))

    changed = copy.deepcopy(live_manifest)
    _candidate_row(changed, "q.hsecond")["algorithm"] = {
        "name": "caller_alias",
        "inputs": ["blocker_v_parent.attestations.hsecond"],
    }
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))


@pytest.mark.parametrize(
    ("canonical_id", "field", "replacement"),
    [
        ("q.hsecond", "source_entitled", True),
        ("q.hsecond", "source_entitled", 1),
        ("role.binding.u", "hard_clause_admission", True),
        ("role.binding.u", "hard_clause_admission", 0),
    ],
)
def test_caller_truth_or_hard_clause_escalation_rejects(
    live_manifest: dict[str, Any],
    canonical_id: str,
    field: str,
    replacement: Any,
) -> None:
    changed = copy.deepcopy(live_manifest)
    _candidate_row(changed, canonical_id)[field] = replacement
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))


def test_locally_recomputed_to_lean_escalation_rejects(
    live_manifest: dict[str, Any],
) -> None:
    changed = copy.deepcopy(live_manifest)
    row = _candidate_row(changed, "cross.u_deletion.incidence.c1_in_bo")
    row["lean_source_ids"] = ["support.four_support_record"]
    row["lean_coverage_status"] = "LABEL_DATA_AVAILABLE"
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))


@pytest.mark.parametrize(
    ("key", "replacement"),
    [
        ("source_faithful_serializer", True),
        ("python_lean_serialization_equivalence", True),
        ("hard_clause_count", 1),
        ("hard_clause_count", False),
        ("solver_admission", True),
        ("canary_authorized", True),
        ("proof_ready", True),
        ("solver_ready", True),
        ("noncomputable_projection_present", 1),
    ],
)
def test_global_admission_and_strict_boolean_mutations_reject(
    live_manifest: dict[str, Any], key: str, replacement: Any
) -> None:
    changed = copy.deepcopy(live_manifest)
    changed["admission"][key] = replacement
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))


@pytest.mark.parametrize(
    ("section", "key"),
    [
        ("candidate", "sha256"),
        ("candidate", "schema"),
        ("candidate", "schema_snapshot_sha256"),
        ("labeled_projection_custody", "receipt_sha256"),
        ("labeled_projection_custody", "configuration_sha256"),
        ("labeled_projection_custody", "root_module"),
        ("labeled_projection_custody", "schema"),
        ("labeled_projection_custody", "source_manifest_sha256"),
        ("labeled_projection_source", "sha256"),
        ("labeled_projection_axiom_receipt", "receipt_sha256"),
        ("labeled_projection_axiom_receipt", "lean_command"),
    ],
)
def test_stale_and_cross_receipt_bindings_reject(
    live_manifest: dict[str, Any], section: str, key: str
) -> None:
    changed = copy.deepcopy(live_manifest)
    value = changed["bindings"][section][key]
    changed["bindings"][section][key] = ("0" * 64 if len(value) == 64 else "wrong")
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))


def test_stale_candidate_and_lean_anchors_and_custody_reject(
    live_manifest: dict[str, Any],
) -> None:
    mutations = []
    first = copy.deepcopy(live_manifest)
    _candidate_row(first, "q.hsecond")["candidate_anchor"]["validator"] = "validate"
    mutations.append(first)
    second = copy.deepcopy(live_manifest)
    _source_row(second, "carrier.card_eq_18")["lean_anchors"][0]["declaration"] += ".stale"
    mutations.append(second)
    third = copy.deepcopy(live_manifest)
    _source_row(third, "carrier.card_eq_18")["custody_digest"] = "0" * 64
    mutations.append(third)
    for changed in mutations:
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
            coverage.validate_predicate_coverage_manifest(_rehash(changed))


def test_summary_counts_and_set_hashes_reject(live_manifest: dict[str, Any]) -> None:
    for path in (
        ("candidate_count",),
        ("candidate_origin_counts", "CALLER_DATA"),
        ("candidate_id_set_sha256",),
        ("lean_source_count",),
        ("lean_status_counts", "LABEL_DATA_AVAILABLE"),
        ("lean_source_id_set_sha256",),
    ):
        changed = copy.deepcopy(live_manifest)
        target = changed["coverage_summary"]
        for key in path[:-1]:
            target = target[key]
        key = path[-1]
        target[key] = target[key] + 1 if type(target[key]) is int else "0" * 64
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
            coverage.validate_predicate_coverage_manifest(_rehash(changed))


def test_unknown_extra_fields_and_wrong_schema_reject(
    live_manifest: dict[str, Any],
) -> None:
    changed = copy.deepcopy(live_manifest)
    changed["unexpected"] = False
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))
    changed = copy.deepcopy(live_manifest)
    changed["schema"] = custody.SCHEMA
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(_rehash(changed))


def test_malformed_list_elements_raise_only_coverage_error(
    live_manifest: dict[str, Any],
) -> None:
    mutations = []
    for section in ("candidate_predicates", "lean_source_universe"):
        changed = copy.deepcopy(live_manifest)
        changed[section][0] = 7
        mutations.append(changed)
    changed = copy.deepcopy(live_manifest)
    _candidate_row(changed, "q.hsecond")["lean_source_ids"] = [7]
    mutations.append(changed)
    changed = copy.deepcopy(live_manifest)
    _candidate_row(changed, "carrier.labels.unique")["dependencies"] = [7]
    mutations.append(changed)
    changed = copy.deepcopy(live_manifest)
    _source_row(changed, "carrier.card_eq_18")["lean_anchors"] = [7]
    mutations.append(changed)
    for manifest in mutations:
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
            coverage.validate_predicate_coverage_manifest(_rehash(manifest))


def test_wrong_self_hash_rejects(live_manifest: dict[str, Any]) -> None:
    changed = copy.deepcopy(live_manifest)
    changed["manifest_sha256"] = "0" * 64
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.validate_predicate_coverage_manifest(changed)


def test_noncanonical_duplicate_nan_and_infinity_json_reject(
    live_manifest: dict[str, Any],
) -> None:
    payload = coverage.encode_predicate_coverage_manifest(live_manifest)
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.parse_predicate_coverage_manifest(payload + b"\n")
    duplicate = payload.replace(b'{"admission":', b'{"schema":"duplicate","admission":', 1)
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.parse_predicate_coverage_manifest(duplicate)
    for constant in (b"NaN", b"Infinity", b"-Infinity"):
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
            coverage.parse_predicate_coverage_manifest(constant)


def test_custody_receipt_cannot_cross_parse_as_coverage() -> None:
    payload = (REPO_ROOT / coverage.CUSTODY_RECEIPT_PATH).read_bytes()
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.parse_predicate_coverage_manifest(payload)


def test_axiom_receipt_exact_body_and_self_hash_validation() -> None:
    payload = (REPO_ROOT / coverage.AXIOM_RECEIPT_PATH).read_bytes()
    coverage._validate_axiom_receipt(payload)
    value = json.loads(payload)
    value["lean_command"] = "#print axioms wrong"
    body = dict(value)
    del body["receipt_sha256"]
    value["receipt_sha256"] = hashlib.sha256(_canonical(body)).hexdigest()
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage._validate_axiom_receipt(_canonical(value))


def test_live_missing_symlink_hardlink_and_fifo_reject(tmp_path: Path) -> None:
    cases = ("missing", "symlink", "hardlink", "fifo")
    for case in cases:
        root = tmp_path / case
        _copy_live_tree(root)
        target = root / coverage.CANDIDATE_PATH
        target.unlink()
        if case == "symlink":
            outside = tmp_path / "outside-source.py"
            outside.write_bytes((REPO_ROOT / coverage.CANDIDATE_PATH).read_bytes())
            target.symlink_to(outside)
        elif case == "hardlink":
            original = root / "inside-alias.py"
            original.write_bytes((REPO_ROOT / coverage.CANDIDATE_PATH).read_bytes())
            try:
                os.link(original, target)
            except OSError:
                pytest.skip("hard links are unsupported on this filesystem")
        elif case == "fifo":
            if not hasattr(os, "mkfifo"):
                pytest.skip("FIFOs are unsupported on this platform")
            os.mkfifo(target)
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
            coverage.build_predicate_coverage_manifest(root)


def test_live_inside_repository_hardlink_alias_rejects(tmp_path: Path) -> None:
    root = tmp_path / "inside-hardlink"
    _copy_live_tree(root)
    target = root / coverage.CANDIDATE_PATH
    alias = root / "census/p97_search/candidate-alias.py"
    try:
        os.link(target, alias)
    except OSError:
        pytest.skip("hard links are unsupported on this filesystem")
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.build_predicate_coverage_manifest(root)


def test_symlinked_repository_root_rejects(tmp_path: Path) -> None:
    root = tmp_path / "real"
    _copy_live_tree(root)
    linked = tmp_path / "linked"
    linked.symlink_to(root, target_is_directory=True)
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage.build_predicate_coverage_manifest(linked)


@pytest.mark.parametrize(
    "path",
    ["", "/absolute", "../escape", "a/../b", "a//b", "a\\b", "a\x00b"],
)
def test_malformed_bound_paths_reject(path: str) -> None:
    with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
        coverage._validate_relative_path(path)


def test_coverage_module_live_hash_is_not_a_frozen_self_reference(
    live_manifest: dict[str, Any],
) -> None:
    payload = (REPO_ROOT / coverage.COVERAGE_MODULE_PATH).read_bytes()
    assert live_manifest["bindings"]["coverage_module"] == {
        "path": coverage.COVERAGE_MODULE_PATH,
        "bytes": len(payload),
        "sha256": hashlib.sha256(payload).hexdigest(),
    }
    assert "coverage_module" not in coverage._fixed_bindings()


def test_coordinated_configuration_and_defaults_tampering_fails_all_public_apis(
    monkeypatch: pytest.MonkeyPatch,
    live_manifest: dict[str, Any],
) -> None:
    payload = coverage.encode_predicate_coverage_manifest(live_manifest)
    monkeypatch.setattr(coverage, "SCHEMA", "coordinated-tamper")
    monkeypatch.setattr(coverage, "FROZEN_CONFIGURATION_SHA256", "0" * 64)
    monkeypatch.setattr(coverage._assert_frozen_configuration, "__defaults__", ("0" * 64,))
    public_calls = (
        coverage.frozen_candidate_predicate_records,
        coverage.frozen_lean_source_universe,
        lambda: coverage.build_predicate_coverage_manifest(REPO_ROOT),
        lambda: coverage.validate_predicate_coverage_manifest(live_manifest),
        lambda: coverage.encode_predicate_coverage_manifest(live_manifest),
        lambda: coverage.parse_predicate_coverage_manifest(payload),
        lambda: coverage.attest_predicate_coverage_manifest(REPO_ROOT, payload),
    )
    for call in public_calls:
        with pytest.raises(coverage.Rigid221Card18PredicateCoverageError):
            call()
