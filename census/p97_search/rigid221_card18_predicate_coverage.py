# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Fail-closed predicate coverage for the diagnostic Rigid221 card-18 packet.

The manifest produced here is a gap ledger.  It binds the current Python
candidate validator, the labeled Lean projection, and their reviewed receipts.
It does not serialize Lean values, authenticate a Python/Lean equivalence,
admit solver clauses, run a solver, or make a proof claim.
"""

from __future__ import annotations

import hashlib
import json
import os
import re
import stat
from collections import Counter
from collections.abc import Mapping
from pathlib import Path, PurePosixPath
from types import MappingProxyType
from typing import Any, Final, NoReturn

from census.p97_search import rigid221_card18_labeled_projection_custody as custody

SCHEMA: Final = "p97-rigid221-card18-predicate-coverage/v1"
LANE_ID_METADATA: Final = "rigid221-card18-predicate-coverage-20260827"
LANE_BASE_HEAD_METADATA: Final = "f209fb40954447bacc944c4ba8ea56b7cabccb82"

CANDIDATE_SCHEMA: Final = "p97-rigid221-card18-source-packet/v1"
CANDIDATE_MODULE: Final = "census.p97_search.rigid221_card18_source_packet"
CANDIDATE_PATH: Final = "census/p97_search/rigid221_card18_source_packet.py"
CANDIDATE_BYTES: Final = 35567
CANDIDATE_SHA256: Final = (
    "a7f0f9b63ffd35b4c97e58a0021cf25a7336bf8c75c33e7ca64f67cb1412169f"
)

COVERAGE_MODULE_PATH: Final = (
    "census/p97_search/rigid221_card18_predicate_coverage.py"
)

CUSTODY_RECEIPT_PATH: Final = (
    "certificates/rigid221_card18_labeled_projection_source_custody_v1.json"
)
CUSTODY_RECEIPT_BYTES: Final = 8496
CUSTODY_RECEIPT_FILE_SHA256: Final = (
    "4a6a515bb49a79ef96bb98238b148b8eed71136c29baa2e9c43578a7d7d777d7"
)
CUSTODY_RECEIPT_SHA256: Final = (
    "5afbd956e2a47b3a7e17f929edb534772b549c38bf1c5ea63e50f494cee0dbc0"
)
CUSTODY_CONFIGURATION_SHA256: Final = (
    "d40a946f5e33a0e7409240fc36e4d6abb3128517a756699e935edfea125d53dd"
)
CUSTODY_SOURCE_MANIFEST_SHA256: Final = (
    "c4fefbc7b39735805e0a9a30b1bc70ca5c33dd7f85e00013d163b0d2321138b2"
)
CUSTODY_SCHEMA: Final = (
    "p97-rigid221-card18-labeled-projection-lean-source-custody/v1"
)
LABELED_ROOT_MODULE: Final = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
    "Rigid221Card18LabeledProjection"
)

LABELED_SOURCE_PATH: Final = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "Rigid221Card18LabeledProjection.lean"
)
LABELED_SOURCE_BYTES: Final = 28885
LABELED_SOURCE_SHA256: Final = (
    "37927775bbe67598b60d49f32a45cddefea70c14f4aceccaf9dcac596baa1239"
)

AXIOM_RECEIPT_PATH: Final = (
    "certificates/rigid221_card18_labeled_projection_axioms_20260827.json"
)
AXIOM_RECEIPT_BYTES: Final = 1405
AXIOM_RECEIPT_FILE_SHA256: Final = (
    "2e705659b52763ca80563f51f27993d74428849c497ac63839c799090153c2c1"
)
AXIOM_RECEIPT_SHA256: Final = (
    "0ceab5d304e81b9cf156f7928f18a22177349860fe20392f7783c0c27b60378b"
)
AXIOM_RECEIPT_SCHEMA: Final = (
    "p97-rigid221-card18-labeled-projection-axioms/v1"
)
AXIOM_COMMAND: Final = (
    "#print axioms Problem97.ATailFrontierLiveClosure."
    "Rigid221Card18LabeledProjection."
    "rigid221ExactCardEighteenDataAlternativeToLabeled"
)

BI_ARM: Final = "BI_SURVIVAL_COMMON_DELETION_RECTANGLE"
U_ARM: Final = "U_DELETION_MISSING_INCIDENCE"
XV_ARM: Final = "XV_DELETION_MISSING_INCIDENCE"
ARMS: Final = (BI_ARM, U_ARM, XV_ARM)

CALLER_ASSERTION: Final = "CALLER_ASSERTION"
CALLER_DATA: Final = "CALLER_DATA"
LOCALLY_RECOMPUTED: Final = "LOCALLY_RECOMPUTED"
ORIGINS: Final = (CALLER_ASSERTION, CALLER_DATA, LOCALLY_RECOMPUTED)

LABEL_DATA_AVAILABLE: Final = "LABEL_DATA_AVAILABLE"
PROP_AVAILABLE_NOT_EMITTED: Final = "PROP_AVAILABLE_NOT_EMITTED"
ABSENT_FROM_LABELED_EXPORT: Final = "ABSENT_FROM_LABELED_EXPORT"
LEAN_STATUSES: Final = (
    LABEL_DATA_AVAILABLE,
    PROP_AVAILABLE_NOT_EMITTED,
    ABSENT_FROM_LABELED_EXPORT,
)

FROZEN_CANDIDATE_ID_SET_SHA256: Final = (
    "ca7a9c209a01eb76153f4784569a5282bd54c96734d4e4db492a61b61d616561"
)
FROZEN_LEAN_SOURCE_ID_SET_SHA256: Final = (
    "28dc1f316c91a9c9aef64972ecfdd3f9ef034f723005afefa02db90c504ba433"
)
FROZEN_CANDIDATE_SCHEMA_SNAPSHOT_SHA256: Final = (
    "d6b071068c8ec3bc55660dd9f5f0c0c51317c53054c1895feefca9e00c01b3fb"
)
FROZEN_CONFIGURATION_SHA256: Final = (
    "dcb17cb8bd406f903599f56f5046ed56467bc6e68c91ef9d25e0b8c90fd76d5c"
)

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
_Q_FACTS: Final = (
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
_CROSSED_ARMS: Final = (
    ("u_deletion", U_ARM, "u", "xv", "xv"),
    ("xv_deletion", XV_ARM, "xv", "v", "u"),
)
_CROSSED_ROWS: Final = ("c1", "c2", "co")
_BI_ENDPOINTS: Final = (("u", "xv"), ("xv", "v"))
_BI_ROWS: Final = ("b1", "b2")

_SHA256: Final = re.compile(r"[0-9a-f]{64}\Z")
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
_CANDIDATE_FIELDS: Final = frozenset(
    {
        "id",
        "origin",
        "representation",
        "lean_source_ids",
        "lean_coverage_status",
        "arms",
        "dependencies",
        "algorithm",
        "candidate_anchor",
        "source_entitled",
        "hard_clause_admission",
    }
)
_SOURCE_FIELDS: Final = frozenset(
    {
        "id",
        "status",
        "representation",
        "lean_anchors",
        "custody_digest",
        "noncomputable",
        "executable",
        "blocking",
    }
)
_ANCHOR_FIELDS: Final = frozenset({"module", "declaration", "kind"})
_CANDIDATE_ANCHOR_FIELDS: Final = frozenset(
    {"module", "validator", "json_path"}
)
_ALGORITHM_FIELDS: Final = frozenset({"name", "inputs"})

_REPRESENTATIONS: Final = frozenset(
    {
        "BOOLEAN_ASSERTION",
        "INTEGER_ASSERTION",
        "STATUS_ASSERTION",
        "LABEL",
        "LABEL_SET",
        "ROLE_NAME",
        "DERIVED_BOOLEAN",
        "DERIVED_INTEGER",
        "DERIVED_ARM",
    }
)
_REPRESENTATIONS_BY_ORIGIN: Final = MappingProxyType(
    {
        CALLER_ASSERTION: frozenset(
            {"BOOLEAN_ASSERTION", "INTEGER_ASSERTION", "STATUS_ASSERTION"}
        ),
        CALLER_DATA: frozenset({"LABEL", "LABEL_SET", "ROLE_NAME"}),
        LOCALLY_RECOMPUTED: frozenset(
            {"DERIVED_BOOLEAN", "DERIVED_INTEGER", "DERIVED_ARM"}
        ),
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


class Rigid221Card18PredicateCoverageError(ValueError):
    """The frozen coverage ledger or one of its bound artifacts is invalid."""


def _fail(message: str) -> NoReturn:
    raise Rigid221Card18PredicateCoverageError(message)


def _canonical_json_bytes(value: Any) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise Rigid221Card18PredicateCoverageError(
            "predicate-coverage value is not strict JSON"
        ) from exc


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _anchor(module: str, declaration: str, kind: str) -> dict[str, str]:
    return {"module": module, "declaration": declaration, "kind": kind}


def _source_row(
    canonical_id: str,
    status: str,
    representation: str,
    anchors: tuple[dict[str, str], ...],
    *,
    noncomputable: bool,
) -> dict[str, Any]:
    return {
        "id": canonical_id,
        "status": status,
        "representation": representation,
        "lean_anchors": sorted(
            (dict(anchor) for anchor in anchors),
            key=lambda item: (item["module"], item["declaration"], item["kind"]),
        ),
        "custody_digest": CUSTODY_SOURCE_MANIFEST_SHA256,
        "noncomputable": noncomputable,
        "executable": False,
        "blocking": status != LABEL_DATA_AVAILABLE,
    }


def _expected_lean_source_rows() -> list[dict[str, Any]]:
    leaf = (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "Rigid221Card18LeafExport"
    )
    finite = (
        "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
        "Rigid221Card18FiniteDataExport"
    )
    labeled = LABELED_ROOT_MODULE
    ns = "Problem97.ATailFrontierLiveClosure."
    lns = ns + "Rigid221Card18LabeledProjection."
    fns = ns + "Rigid221Card18FiniteDataExport."
    rows = [
        _source_row(
            "carrier.card_eq_18",
            LABEL_DATA_AVAILABLE,
            "LEAN_FIELD",
            (_anchor(leaf, ns + "Rigid221ExactCardEighteenCarrier.card_eq", "structure_field"),),
            noncomputable=True,
        ),
        _source_row(
            "carrier.fin18_labeling",
            LABEL_DATA_AVAILABLE,
            "FIN18_EQUIVALENCE",
            (_anchor(leaf, ns + "Rigid221ExactCardEighteenCarrier.labeling", "structure_field"),),
            noncomputable=True,
        ),
        _source_row(
            "carrier.point_mem",
            LABEL_DATA_AVAILABLE,
            "LEAN_THEOREM",
            (_anchor(finite, fns + "pointOf_mem_carrier", "theorem"),),
            noncomputable=True,
        ),
        _source_row(
            "roles.label_values",
            LABEL_DATA_AVAILABLE,
            "FIN18_RECORD",
            (_anchor(labeled, lns + "Rigid221RoleLabels", "structure"),),
            noncomputable=True,
        ),
        _source_row(
            "roles.point_equalities",
            LABEL_DATA_AVAILABLE,
            "LEAN_FIELD_BUNDLE",
            (_anchor(labeled, lns + "Rigid221RoleLabels", "structure_field_bundle"),),
            noncomputable=True,
        ),
        _source_row(
            "roles.distinctness",
            LABEL_DATA_AVAILABLE,
            "LEAN_FIELD_BUNDLE",
            (_anchor(labeled, lns + "Rigid221RoleLabels", "structure_field_bundle"),),
            noncomputable=True,
        ),
        _source_row(
            "arm.constructor",
            LABEL_DATA_AVAILABLE,
            "LEAN_SUM_TYPE",
            (
                _anchor(
                    labeled,
                    lns + "Rigid221ExactCardEighteenLabeledAlternative",
                    "inductive",
                ),
            ),
            noncomputable=False,
        ),
        _source_row(
            "arm.deletion_profile",
            LABEL_DATA_AVAILABLE,
            "LEAN_PROFILE_DATA",
            tuple(
                _anchor(labeled, lns + name, kind)
                for name, kind in (
                    ("Rigid221Arm", "inductive"),
                    ("DeletionOutcome", "inductive"),
                    ("Rigid221FourCellProfile", "structure"),
                    ("armOfDataAlternative", "definition"),
                    ("profileOfDataAlternative", "definition"),
                )
            ),
            noncomputable=False,
        ),
        _source_row(
            "support.four_support_record",
            LABEL_DATA_AVAILABLE,
            "FIN18_SUPPORT_RECORD",
            (_anchor(labeled, lns + "LabeledFourSupport", "structure"),),
            noncomputable=True,
        ),
        _source_row(
            "support.q_exclusion",
            LABEL_DATA_AVAILABLE,
            "LEAN_FIELD_BUNDLE",
            tuple(
                _anchor(labeled, lns + name, "structure_field_bundle")
                for name in (
                    "Rigid221XvDeletionLabeledData",
                    "Rigid221UDeletionLabeledData",
                    "Rigid221BothDeletionsLabeledData",
                )
            ),
            noncomputable=True,
        ),
        _source_row(
            "support.crossed_membership",
            LABEL_DATA_AVAILABLE,
            "LEAN_FIELD_BUNDLE",
            tuple(
                _anchor(labeled, lns + name, "structure_field_bundle")
                for name in (
                    "Rigid221XvDeletionLabeledData",
                    "Rigid221UDeletionLabeledData",
                )
            ),
            noncomputable=True,
        ),
        _source_row(
            "support.bi_intersection",
            LABEL_DATA_AVAILABLE,
            "LEAN_FIELD_BUNDLE",
            (
                _anchor(
                    labeled,
                    lns + "Rigid221BothDeletionsLabeledData",
                    "structure_field_bundle",
                ),
            ),
            noncomputable=True,
        ),
        _source_row(
            "support.bi_overlap",
            LABEL_DATA_AVAILABLE,
            "LEAN_FIELD_BUNDLE",
            (
                _anchor(
                    labeled,
                    lns + "Rigid221BothDeletionsLabeledData",
                    "structure_field_bundle",
                ),
            ),
            noncomputable=True,
        ),
    ]

    prop_specs = (
        ("bi.common_deletion_packet", "Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter", "Problem97.ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket", "structure"),
        ("cap.interior_facts", "Erdos9796Proof.P97.Cap.PartitionFromMEC", "Problem97.SurplusCapPacket.capInteriorByIndex", "definition"),
        ("cap.partition_arc", "Erdos9796Proof.P97.Cap.Structure", "Problem97.CapTriple", "structure"),
        ("k4.minimality", "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueArmRouteAudit.OriginalUniqueResidualDispatch", "Problem97.ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual", "structure"),
        ("k4.radius_classification", "Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion", "Problem97.ATailExactFourRobustCapExpansion.ExactFourPostCardElevenRobustSurface.radiusClassification", "structure_field"),
        ("parent.blocker_v_residual", "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy", "Problem97.ATailFrontierLiveClosure.ExactFourRigid221PentagonBlockerVResidual", "structure"),
        ("parent.p_context", "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement", "Problem97.ATailFrontierLiveClosure.ExactFourRigid221PhysicalApexSourceEqUContext", "structure"),
        ("parent.source_heavy_packet", "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy", "Problem97.ATailFrontierLiveClosure.ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket", "structure"),
        ("profile.crossed_missing_incidence", leaf, ns + "Rigid221XvDeletionMissingIncidence.missingIncidence", "structure_field"),
        ("profile.deletion_survival", leaf, ns + "Rigid221ExactCardEighteenAlternative", "inductive"),
        ("radius.selected_shell", "Erdos9796Proof.P97.U1CarrierInjection", "Problem97.CriticalFourShell", "structure"),
        ("radius.u5_same_radius", "Erdos9796Proof.P97.U5GlobalIncidenceBasic", "Problem97.U5QDeletedK4Class", "structure"),
        ("row.selected_shell", "Erdos9796Proof.P97.U1CarrierInjection", "Problem97.CriticalFourShell.support_eq_radius", "theorem"),
        ("row.u5_q_deleted_k4", "Erdos9796Proof.P97.U5GlobalIncidenceBasic", "Problem97.U5QDeletedK4Class", "structure"),
        ("selected_row.origin_and_trace", "Erdos9796Proof.P97.U1CarrierInjection", "Problem97.CriticalShellSystem.selectedAt", "definition"),
        ("source.live_parent_facts", leaf, ns + "Rigid221ExactCardEighteenSource", "structure_field_bundle"),
        ("source.neutral_origin", leaf, ns + "Rigid221ExactCardEighteenSource", "structure_field_bundle"),
    )
    rows.extend(
        _source_row(
            canonical_id,
            PROP_AVAILABLE_NOT_EMITTED,
            "LEAN_PROP_ONLY",
            (_anchor(module, declaration, kind),),
            noncomputable=True,
        )
        for canonical_id, module, declaration, kind in prop_specs
    )
    absent_ids = (
        "cap.fin18_membership_table",
        "k4.fin18_predicate_table",
        "minimality.fin18_clause_projection",
        "order.fin18_cyclic",
        "radius.cross_row_equalities",
        "radius.physical_link",
        "selected_row.fin18_order_table",
    )
    rows.extend(
        _source_row(
            canonical_id,
            ABSENT_FROM_LABELED_EXPORT,
            "ABSENT",
            (),
            noncomputable=False,
        )
        for canonical_id in absent_ids
    )
    return sorted(rows, key=lambda row: row["id"])


def _candidate_schema_snapshot() -> dict[str, Any]:
    return {
        "schema": CANDIDATE_SCHEMA,
        "entrypoint": CANDIDATE_MODULE + ".validate_packet",
        "arms": list(ARMS),
        "claim_boundary_flags": [
            "coverage_lift_proved",
            "finite_ingress_proved",
            "full_source_faithful_model",
        ],
        "root_keys": sorted(
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
        ),
        "role_names": list(_ROLE_NAMES),
        "blocker_v_attestations": list(_Q_FACTS),
        "crossed_rows": list(_CROSSED_ROWS),
        "bi_endpoints": [endpoint for endpoint, _blocker in _BI_ENDPOINTS],
        "bi_rows": list(_BI_ROWS),
        "deletion_statuses": ["FAILS", "SURVIVES"],
    }


def _candidate_anchor(validator: str, json_path: str) -> dict[str, str]:
    return {
        "module": CANDIDATE_MODULE,
        "validator": validator,
        "json_path": json_path,
    }


def _record(
    canonical_id: str,
    origin: str,
    representation: str,
    source_id: str,
    arms: tuple[str, ...],
    validator: str,
    json_path: str,
    *,
    dependencies: tuple[str, ...] = (),
    algorithm_name: str | None = None,
    algorithm_inputs: tuple[str, ...] = (),
) -> dict[str, Any]:
    statuses = {row["id"]: row["status"] for row in _expected_lean_source_rows()}
    algorithm: dict[str, Any] | None = None
    if origin == LOCALLY_RECOMPUTED:
        assert algorithm_name is not None and algorithm_inputs
        algorithm = {
            "name": algorithm_name,
            "inputs": sorted(algorithm_inputs),
        }
    else:
        assert algorithm_name is None and not algorithm_inputs
    return {
        "id": canonical_id,
        "origin": origin,
        "representation": representation,
        "lean_source_ids": [source_id],
        "lean_coverage_status": statuses[source_id],
        "arms": [arm for arm in ARMS if arm in arms],
        "dependencies": sorted(dependencies),
        "algorithm": algorithm,
        "candidate_anchor": _candidate_anchor(validator, json_path),
        "source_entitled": False,
        "hard_clause_admission": False,
    }


def _expected_candidate_records() -> list[dict[str, Any]]:
    all_arms = ARMS
    rows: list[dict[str, Any]] = []

    for field in (
        "full_source_faithful_model",
        "finite_ingress_proved",
        "coverage_lift_proved",
    ):
        rows.append(
            _record(
                f"boundary.{field}.false",
                CALLER_ASSERTION,
                "BOOLEAN_ASSERTION",
                "minimality.fin18_clause_projection",
                all_arms,
                "_validate_claim_boundary",
                f"claim_boundary.{field}",
            )
        )

    rows.append(
        _record(
            "carrier.exact_cardinality.eq18",
            CALLER_ASSERTION,
            "INTEGER_ASSERTION",
            "carrier.card_eq_18",
            all_arms,
            "_validate_carrier",
            "carrier.exact_cardinality",
        )
    )
    for suffix, representation, algorithm, inputs in (
        ("length_eq18", "DERIVED_INTEGER", "length_equals", ("carrier.labels", "carrier.exact_cardinality")),
        ("names_valid", "DERIVED_BOOLEAN", "regex_fullmatch_each", ("carrier.labels",)),
        ("unique", "DERIVED_BOOLEAN", "set_cardinality_equals_length", ("carrier.labels",)),
    ):
        rows.append(
            _record(
                f"carrier.labels.{suffix}",
                LOCALLY_RECOMPUTED,
                representation,
                "carrier.fin18_labeling",
                all_arms,
                "_validate_carrier",
                "carrier.labels",
                algorithm_name=algorithm,
                algorithm_inputs=inputs,
            )
        )

    for role in _ROLE_NAMES:
        binding_id = f"role.binding.{role}"
        rows.append(
            _record(
                binding_id,
                CALLER_DATA,
                "LABEL",
                "roles.label_values",
                all_arms,
                "_validate_roles",
                f"roles.bindings.{role}",
            )
        )
        rows.append(
            _record(
                f"role.in_carrier.{role}",
                LOCALLY_RECOMPUTED,
                "DERIVED_BOOLEAN",
                "roles.point_equalities",
                all_arms,
                "_validate_roles",
                f"roles.bindings.{role}",
                dependencies=(binding_id,),
                algorithm_name="membership",
                algorithm_inputs=(f"roles.bindings.{role}", "carrier.labels"),
            )
        )

    relation_specs = (
        ("role.u_ne_xv", ("u", "xv"), "roles.distinctness"),
        ("role.source_1_ne_source_2", ("source_1", "source_2"), "roles.distinctness"),
        ("role.actual_center_1_ne_actual_center_2", ("actual_center_1", "actual_center_2"), "roles.distinctness"),
        ("role.physical_five.all_distinct", ("u", "xu", "v", "xv", "deleted"), "parent.source_heavy_packet"),
        ("role.opp_apex_2.not_in_physical_five", ("opp_apex_2", "u", "xu", "v", "xv", "deleted"), "parent.p_context"),
        ("role.source_1.not_alias_u_or_xv", ("source_1", "u", "xv"), "source.neutral_origin"),
        ("role.source_2.not_alias_u_or_xv", ("source_2", "u", "xv"), "source.neutral_origin"),
    )
    for canonical_id, role_names, source_id in relation_specs:
        rows.append(
            _record(
                canonical_id,
                LOCALLY_RECOMPUTED,
                "DERIVED_BOOLEAN",
                source_id,
                all_arms,
                "_validate_roles",
                "roles.bindings",
                dependencies=tuple(f"role.binding.{role}" for role in role_names),
                algorithm_name="label_distinctness",
                algorithm_inputs=tuple(f"roles.bindings.{role}" for role in role_names),
            )
        )

    for fact in _Q_FACTS:
        rows.append(
            _record(
                f"q.{fact}",
                CALLER_ASSERTION,
                "BOOLEAN_ASSERTION",
                "parent.blocker_v_residual",
                all_arms,
                "_validate_blocker_v_parent",
                f"blocker_v_parent.attestations.{fact}",
            )
        )

    live_paths = (
        ("live.center_v_eq_deleted", "center_v_equals_deleted"),
        ("live.deleted_center.in_opposite_cap_interior", "deleted_center_in_opposite_cap_interior"),
        ("live.deleted_center.not_in_opposite_class", "deleted_center_off_opposite_class"),
        ("live.next_row_physical_hits.le1", "next_row_physical_hits"),
        ("live.cardinality.live_ge18_and_diagnostic_eq18", "cardinality"),
    )
    for canonical_id, path in live_paths:
        rows.append(
            _record(
                canonical_id,
                CALLER_ASSERTION,
                "BOOLEAN_ASSERTION" if path not in {"next_row_physical_hits", "cardinality"} else "INTEGER_ASSERTION",
                "source.live_parent_facts",
                all_arms,
                "_validate_live_parent_facts",
                f"live_parent_facts.{path}",
            )
        )

    for source_index in (1, 2):
        rows.append(
            _record(
                f"source_pair.source_{source_index}.actual_center_link",
                CALLER_DATA,
                "ROLE_NAME",
                "bi.common_deletion_packet",
                all_arms,
                "_validate_source_pair",
                f"source_pair.source_{source_index}.actual_center_role",
            )
        )
        rows.append(
            _record(
                f"source_pair.source_{source_index}.outside_xv_row",
                CALLER_ASSERTION,
                "BOOLEAN_ASSERTION",
                "source.neutral_origin",
                all_arms,
                "_validate_source_pair",
                f"source_pair.source_{source_index}.outside_xv_row",
            )
        )

    deletion_ids: list[str] = []
    for deletion in ("u", "xv"):
        for source_index in (1, 2):
            canonical_id = f"deletion.{deletion}.source_{source_index}.status"
            deletion_ids.append(canonical_id)
            rows.append(
                _record(
                    canonical_id,
                    CALLER_ASSERTION,
                    "STATUS_ASSERTION",
                    "profile.deletion_survival",
                    all_arms,
                    "_validate_deletion_profile",
                    f"deletion_profile.{deletion}.source_{source_index}",
                )
            )
    rows.append(
        _record(
            "deletion.profile.selects_exact_packet_arm",
            LOCALLY_RECOMPUTED,
            "DERIVED_ARM",
            "arm.deletion_profile",
            all_arms,
            "classify_deletion_profile",
            "deletion_profile",
            dependencies=tuple(deletion_ids),
            algorithm_name="exact_profile_lookup",
            algorithm_inputs=("arm", "deletion_profile"),
        )
    )

    for prefix, arm, deletion_role, blocker_role, common_role in _CROSSED_ARMS:
        config = {
            "deletion_role": deletion_role,
            "actual_blocker_role": blocker_role,
            "common_member_role": common_role,
        }
        for key, role in config.items():
            rows.append(
                _record(
                    f"cross.{prefix}.config.{key}",
                    CALLER_DATA,
                    "ROLE_NAME",
                    "roles.label_values",
                    (arm,),
                    "_validate_crossed_payload",
                    f"arm_payload.{key}",
                    dependencies=(f"role.binding.{role}",),
                )
            )
        support_ids: dict[str, str] = {}
        for row_name in _CROSSED_ROWS:
            base = f"cross.{prefix}.row.{row_name}"
            support_id = base + ".support"
            support_ids[row_name] = support_id
            support_path = f"arm_payload.rows.{row_name.upper()}.support"
            rows.append(
                _record(
                    support_id,
                    CALLER_DATA,
                    "LABEL_SET",
                    "support.four_support_record",
                    (arm,),
                    "_validate_crossed_payload",
                    support_path,
                )
            )
            rows.append(
                _record(
                    base + ".card.declared_eq4",
                    CALLER_ASSERTION,
                    "INTEGER_ASSERTION",
                    "row.u5_q_deleted_k4",
                    (arm,),
                    "_validate_crossed_payload",
                    f"arm_payload.rows.{row_name.upper()}.cardinality",
                )
            )
            local_specs = (
                ("support.length_eq4", "DERIVED_INTEGER", "length_equals", (support_path, "literal:4"), (support_id,)),
                ("support.unique", "DERIVED_BOOLEAN", "set_cardinality_equals_length", (support_path,), (support_id,)),
                ("support.subset_carrier", "DERIVED_BOOLEAN", "subset", (support_path, "carrier.labels"), (support_id,)),
                ("deletion_excluded", "DERIVED_BOOLEAN", "not_membership", (support_path, "arm_payload.deletion_role"), (support_id, f"cross.{prefix}.config.deletion_role")),
                ("common_member_included", "DERIVED_BOOLEAN", "membership", (support_path, "arm_payload.common_member_role"), (support_id, f"cross.{prefix}.config.common_member_role")),
                ("center_excluded", "DERIVED_BOOLEAN", "not_membership", (support_path, "arm_payload.actual_blocker_role"), (support_id, f"cross.{prefix}.config.actual_blocker_role")),
            )
            for suffix, representation, algorithm, inputs, dependencies in local_specs:
                source_id = (
                    "support.four_support_record"
                    if suffix.startswith("support.")
                    else "row.u5_q_deleted_k4"
                )
                if suffix == "common_member_included":
                    source_id = "support.crossed_membership"
                rows.append(
                    _record(
                        base + "." + suffix,
                        LOCALLY_RECOMPUTED,
                        representation,
                        source_id,
                        (arm,),
                        "_validate_crossed_payload",
                        support_path,
                        dependencies=dependencies,
                        algorithm_name=algorithm,
                        algorithm_inputs=inputs,
                    )
                )

        for row_name, source_index in (("c1", 1), ("c2", 2)):
            rows.append(
                _record(
                    f"cross.{prefix}.row.{row_name}.source_{source_index}_included",
                    LOCALLY_RECOMPUTED,
                    "DERIVED_BOOLEAN",
                    "support.crossed_membership",
                    (arm,),
                    "_validate_crossed_payload",
                    f"arm_payload.rows.{row_name.upper()}.support",
                    dependencies=(support_ids[row_name], f"role.binding.source_{source_index}"),
                    algorithm_name="membership",
                    algorithm_inputs=(f"arm_payload.rows.{row_name.upper()}.support", f"roles.bindings.source_{source_index}"),
                )
            )

        incidence_specs = (
            ("c1_in_bo", "bo", "actual_center_1"),
            ("opp_apex_2_in_k1", "c1", "opp_apex_2"),
            ("c2_in_k1", "c1", "actual_center_2"),
            ("opp_apex_2_in_k2", "c2", "opp_apex_2"),
            ("c1_in_k2", "c2", "actual_center_1"),
        )
        incidence_ids: list[str] = []
        for suffix, row_name, role in incidence_specs:
            support_row = {"bo": "co", "k1": "c1", "k2": "c2"}.get(
                row_name, row_name
            )
            canonical_id = f"cross.{prefix}.incidence.{suffix}"
            incidence_ids.append(canonical_id)
            rows.append(
                _record(
                    canonical_id,
                    LOCALLY_RECOMPUTED,
                    "DERIVED_BOOLEAN",
                    "profile.crossed_missing_incidence",
                    (arm,),
                    "_validate_crossed_payload",
                    "arm_payload.incidence." + suffix,
                    dependencies=(support_ids[support_row], f"role.binding.{role}"),
                    algorithm_name="membership",
                    algorithm_inputs=(f"arm_payload.rows.{support_row.upper()}.support", f"roles.bindings.{role}"),
                )
            )
        rows.append(
            _record(
                f"cross.{prefix}.incidence.conjunction_has_false",
                LOCALLY_RECOMPUTED,
                "DERIVED_BOOLEAN",
                "profile.crossed_missing_incidence",
                (arm,),
                "_validate_crossed_payload",
                "arm_payload.incidence",
                dependencies=tuple(incidence_ids),
                algorithm_name="not_all",
                algorithm_inputs=tuple(f"arm_payload.incidence.{item.rsplit('.', 1)[-1]}" for item in incidence_ids),
            )
        )

    rows.append(
        _record(
            "bi.endpoint_coverage.ordered_u_xv",
            LOCALLY_RECOMPUTED,
            "DERIVED_BOOLEAN",
            "arm.constructor",
            (BI_ARM,),
            "_validate_bi_survival_payload",
            "arm_payload.common_deletions",
            algorithm_name="exact_key_order",
            algorithm_inputs=("arm_payload.common_deletions[0].q_role", "arm_payload.common_deletions[1].q_role"),
        )
    )
    for endpoint, blocker in _BI_ENDPOINTS:
        base = f"bi.{endpoint}"
        q_id = base + ".q_role"
        rows.append(
            _record(
                q_id,
                CALLER_DATA,
                "ROLE_NAME",
                "roles.label_values",
                (BI_ARM,),
                "_validate_bi_survival_payload",
                f"arm_payload.common_deletions[{endpoint}].q_role",
                dependencies=(f"role.binding.{endpoint}",),
            )
        )
        center_ids: dict[int, str] = {}
        for index in (1, 2):
            center_id = f"{base}.center_role.{index}"
            center_ids[index] = center_id
            role = f"actual_center_{index}"
            rows.append(
                _record(
                    center_id,
                    CALLER_DATA,
                    "ROLE_NAME",
                    "roles.label_values",
                    (BI_ARM,),
                    "_validate_common_deletion_summary",
                    f"arm_payload.common_deletions[{endpoint}].center_roles[{index - 1}]",
                    dependencies=(f"role.binding.{role}",),
                )
            )
            rows.append(
                _record(
                    f"{base}.center.{index}.in_carrier",
                    LOCALLY_RECOMPUTED,
                    "DERIVED_BOOLEAN",
                    "bi.common_deletion_packet",
                    (BI_ARM,),
                    "_validate_common_deletion_summary",
                    f"arm_payload.common_deletions[{endpoint}].center_roles[{index - 1}]",
                    dependencies=(center_id,),
                    algorithm_name="role_resolves_to_carrier_label",
                    algorithm_inputs=(f"arm_payload.common_deletions[{endpoint}].center_roles[{index - 1}]", "roles.bindings", "carrier.labels"),
                )
            )
        rows.append(
            _record(
                base + ".centers_distinct",
                LOCALLY_RECOMPUTED,
                "DERIVED_BOOLEAN",
                "bi.common_deletion_packet",
                (BI_ARM,),
                "_validate_common_deletion_summary",
                f"arm_payload.common_deletions[{endpoint}].center_roles",
                dependencies=(center_ids[1], center_ids[2]),
                algorithm_name="resolved_labels_distinct",
                algorithm_inputs=(f"arm_payload.common_deletions[{endpoint}].center_roles", "roles.bindings"),
            )
        )
        blocker_source_id = base + ".actual_blocker_source_role"
        blocker_id = base + ".actual_blocker_role"
        for canonical_id, path in (
            (blocker_source_id, "actual_blocker_source_role"),
            (blocker_id, "actual_blocker_role"),
        ):
            rows.append(
                _record(
                    canonical_id,
                    CALLER_DATA,
                    "ROLE_NAME",
                    "roles.label_values",
                    (BI_ARM,),
                    "_validate_common_deletion_summary",
                    f"arm_payload.common_deletions[{endpoint}].{path}",
                    dependencies=(f"role.binding.{blocker}",),
                )
            )
        for index in (1, 2):
            rows.append(
                _record(
                    f"{base}.actual_blocker_ne_center.{index}",
                    LOCALLY_RECOMPUTED,
                    "DERIVED_BOOLEAN",
                    "bi.common_deletion_packet",
                    (BI_ARM,),
                    "_validate_common_deletion_summary",
                    f"arm_payload.common_deletions[{endpoint}].actual_blocker_role",
                    dependencies=(blocker_id, center_ids[index]),
                    algorithm_name="resolved_labels_distinct",
                    algorithm_inputs=(f"arm_payload.common_deletions[{endpoint}].actual_blocker_role", f"arm_payload.common_deletions[{endpoint}].center_roles[{index - 1}]", "roles.bindings"),
                )
            )
        support_ids = {}
        for row_name, center_index in zip(_BI_ROWS, (1, 2), strict=True):
            row_base = f"{base}.row.{row_name}"
            support_id = row_base + ".support"
            support_ids[row_name] = support_id
            support_path = f"arm_payload.common_deletions[{endpoint}].rows.{row_name.upper()}.support"
            rows.append(
                _record(
                    support_id,
                    CALLER_DATA,
                    "LABEL_SET",
                    "support.four_support_record",
                    (BI_ARM,),
                    "_validate_common_deletion_summary",
                    support_path,
                )
            )
            rows.append(
                _record(
                    row_base + ".card.declared_eq4",
                    CALLER_ASSERTION,
                    "INTEGER_ASSERTION",
                    "bi.common_deletion_packet",
                    (BI_ARM,),
                    "_validate_common_deletion_summary",
                    f"arm_payload.common_deletions[{endpoint}].rows.{row_name.upper()}.cardinality",
                )
            )
            local_specs = (
                ("support.length_eq4", "DERIVED_INTEGER", "length_equals", (support_path, "literal:4"), (support_id,), "support.four_support_record"),
                ("support.unique", "DERIVED_BOOLEAN", "set_cardinality_equals_length", (support_path,), (support_id,), "support.four_support_record"),
                ("support.subset_carrier", "DERIVED_BOOLEAN", "subset", (support_path, "carrier.labels"), (support_id,), "support.four_support_record"),
                ("q_excluded", "DERIVED_BOOLEAN", "not_membership", (support_path, f"roles.bindings.{endpoint}"), (support_id, q_id), "support.q_exclusion"),
                ("center_excluded", "DERIVED_BOOLEAN", "not_membership", (support_path, f"arm_payload.common_deletions[{endpoint}].center_roles[{center_index - 1}]"), (support_id, center_ids[center_index]), "row.u5_q_deleted_k4"),
            )
            for suffix, representation, algorithm, inputs, dependencies, source_id in local_specs:
                rows.append(
                    _record(
                        row_base + "." + suffix,
                        LOCALLY_RECOMPUTED,
                        representation,
                        source_id,
                        (BI_ARM,),
                        "_validate_common_deletion_summary",
                        support_path,
                        dependencies=dependencies,
                        algorithm_name=algorithm,
                        algorithm_inputs=inputs,
                    )
                )
        rows.append(
            _record(
                base + ".rows.overlap_le2",
                LOCALLY_RECOMPUTED,
                "DERIVED_INTEGER",
                "support.bi_overlap",
                (BI_ARM,),
                "_validate_common_deletion_summary",
                f"arm_payload.common_deletions[{endpoint}].overlap_cardinality",
                dependencies=(support_ids["b1"], support_ids["b2"]),
                algorithm_name="intersection_cardinality_le",
                algorithm_inputs=(f"arm_payload.common_deletions[{endpoint}].rows.B1.support", f"arm_payload.common_deletions[{endpoint}].rows.B2.support", "literal:2"),
            )
        )
    return sorted(rows, key=lambda row: row["id"])


def _fixed_bindings() -> dict[str, Any]:
    return {
        "candidate": {
            "path": CANDIDATE_PATH,
            "bytes": CANDIDATE_BYTES,
            "sha256": CANDIDATE_SHA256,
            "schema": CANDIDATE_SCHEMA,
            "schema_snapshot_sha256": FROZEN_CANDIDATE_SCHEMA_SNAPSHOT_SHA256,
        },
        "labeled_projection_custody": {
            "path": CUSTODY_RECEIPT_PATH,
            "bytes": CUSTODY_RECEIPT_BYTES,
            "file_sha256": CUSTODY_RECEIPT_FILE_SHA256,
            "receipt_sha256": CUSTODY_RECEIPT_SHA256,
            "configuration_sha256": CUSTODY_CONFIGURATION_SHA256,
            "root_module": LABELED_ROOT_MODULE,
            "schema": CUSTODY_SCHEMA,
            "source_manifest_sha256": CUSTODY_SOURCE_MANIFEST_SHA256,
        },
        "labeled_projection_source": {
            "path": LABELED_SOURCE_PATH,
            "bytes": LABELED_SOURCE_BYTES,
            "sha256": LABELED_SOURCE_SHA256,
        },
        "labeled_projection_axiom_receipt": {
            "path": AXIOM_RECEIPT_PATH,
            "bytes": AXIOM_RECEIPT_BYTES,
            "file_sha256": AXIOM_RECEIPT_FILE_SHA256,
            "receipt_sha256": AXIOM_RECEIPT_SHA256,
            "schema": AXIOM_RECEIPT_SCHEMA,
            "lean_command": AXIOM_COMMAND,
            "source_path": LABELED_SOURCE_PATH,
            "source_sha256": LABELED_SOURCE_SHA256,
        },
    }


def _coverage_summary() -> dict[str, Any]:
    return {
        "candidate_count": 188,
        "candidate_origin_counts": {
            CALLER_ASSERTION: 42,
            CALLER_DATA: 39,
            LOCALLY_RECOMPUTED: 107,
        },
        "candidate_id_set_sha256": FROZEN_CANDIDATE_ID_SET_SHA256,
        "lean_source_count": 37,
        "lean_status_counts": {
            LABEL_DATA_AVAILABLE: 13,
            PROP_AVAILABLE_NOT_EMITTED: 17,
            ABSENT_FROM_LABELED_EXPORT: 7,
        },
        "lean_source_id_set_sha256": FROZEN_LEAN_SOURCE_ID_SET_SHA256,
    }


def _configuration_snapshot() -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "metadata": dict(_METADATA),
        "fixed_bindings": _fixed_bindings(),
        "coverage_module_path": COVERAGE_MODULE_PATH,
        "candidate_schema_snapshot": _candidate_schema_snapshot(),
        "candidate_records": _expected_candidate_records(),
        "lean_source_rows": _expected_lean_source_rows(),
        "coverage_summary": _coverage_summary(),
        "admission": dict(_ADMISSION),
        "arm_order": list(ARMS),
        "origins": list(ORIGINS),
        "lean_statuses": list(LEAN_STATUSES),
        "fields": {
            "manifest": sorted(_MANIFEST_FIELDS),
            "candidate": sorted(_CANDIDATE_FIELDS),
            "source": sorted(_SOURCE_FIELDS),
            "anchor": sorted(_ANCHOR_FIELDS),
            "candidate_anchor": sorted(_CANDIDATE_ANCHOR_FIELDS),
            "algorithm": sorted(_ALGORITHM_FIELDS),
        },
        "representations": sorted(_REPRESENTATIONS),
        "representations_by_origin": {
            key: sorted(value) for key, value in _REPRESENTATIONS_BY_ORIGIN.items()
        },
    }


def _assert_frozen_configuration() -> None:
    literal = "dcb17cb8bd406f903599f56f5046ed56467bc6e68c91ef9d25e0b8c90fd76d5c"
    scalar_strings = (
        SCHEMA,
        LANE_ID_METADATA,
        LANE_BASE_HEAD_METADATA,
        CANDIDATE_SCHEMA,
        CANDIDATE_MODULE,
        CANDIDATE_PATH,
        CANDIDATE_SHA256,
        COVERAGE_MODULE_PATH,
        CUSTODY_RECEIPT_PATH,
        CUSTODY_RECEIPT_FILE_SHA256,
        CUSTODY_RECEIPT_SHA256,
        CUSTODY_CONFIGURATION_SHA256,
        CUSTODY_SOURCE_MANIFEST_SHA256,
        CUSTODY_SCHEMA,
        LABELED_ROOT_MODULE,
        LABELED_SOURCE_PATH,
        LABELED_SOURCE_SHA256,
        AXIOM_RECEIPT_PATH,
        AXIOM_RECEIPT_FILE_SHA256,
        AXIOM_RECEIPT_SHA256,
        AXIOM_RECEIPT_SCHEMA,
        AXIOM_COMMAND,
        FROZEN_CANDIDATE_ID_SET_SHA256,
        FROZEN_LEAN_SOURCE_ID_SET_SHA256,
        FROZEN_CANDIDATE_SCHEMA_SNAPSHOT_SHA256,
        FROZEN_CONFIGURATION_SHA256,
    )
    if (
        any(type(value) is not str for value in scalar_strings)
        or any(type(value) is not int or value < 0 for value in (CANDIDATE_BYTES, CUSTODY_RECEIPT_BYTES, LABELED_SOURCE_BYTES, AXIOM_RECEIPT_BYTES))
        or not isinstance(_METADATA, Mapping)
        or not isinstance(_ADMISSION, Mapping)
        or any(type(value) is not bool for key, value in _ADMISSION.items() if key != "hard_clause_count")
        or type(_ADMISSION["hard_clause_count"]) is not int
        or not isinstance(_SHA256, re.Pattern)
        or not isinstance(_MANIFEST_FIELDS, frozenset)
        or not isinstance(_CANDIDATE_FIELDS, frozenset)
        or not isinstance(_SOURCE_FIELDS, frozenset)
        or not isinstance(_ANCHOR_FIELDS, frozenset)
        or not isinstance(_CANDIDATE_ANCHOR_FIELDS, frozenset)
        or not isinstance(_ALGORITHM_FIELDS, frozenset)
        or not isinstance(_REPRESENTATIONS, frozenset)
        or not isinstance(_REPRESENTATIONS_BY_ORIGIN, Mapping)
    ):
        _fail("frozen predicate-coverage configuration has malformed types")
    if ARMS != tuple(sorted(ARMS)) or len(ARMS) != len(set(ARMS)):
        _fail("arm order is not exact duplicate-free BI/U/XV order")
    candidates = _expected_candidate_records()
    sources = _expected_lean_source_rows()
    candidate_ids = [row["id"] for row in candidates]
    source_ids = [row["id"] for row in sources]
    if (
        len(candidate_ids) != 188
        or candidate_ids != sorted(candidate_ids)
        or len(candidate_ids) != len(set(candidate_ids))
        or Counter(row["origin"] for row in candidates)
        != Counter({CALLER_ASSERTION: 42, CALLER_DATA: 39, LOCALLY_RECOMPUTED: 107})
        or len(source_ids) != 37
        or source_ids != sorted(source_ids)
        or len(source_ids) != len(set(source_ids))
        or Counter(row["status"] for row in sources)
        != Counter({LABEL_DATA_AVAILABLE: 13, PROP_AVAILABLE_NOT_EMITTED: 17, ABSENT_FROM_LABELED_EXPORT: 7})
    ):
        _fail("frozen predicate/source universe has wrong IDs or counts")
    if (
        _sha256_json(candidate_ids) != FROZEN_CANDIDATE_ID_SET_SHA256
        or _sha256_json(source_ids) != FROZEN_LEAN_SOURCE_ID_SET_SHA256
        or _sha256_json(_candidate_schema_snapshot())
        != FROZEN_CANDIDATE_SCHEMA_SNAPSHOT_SHA256
    ):
        _fail("frozen predicate/source/schema set hash drifted")
    current = _sha256_json(_configuration_snapshot())
    if FROZEN_CONFIGURATION_SHA256 != literal or current != literal:
        _fail("frozen predicate-coverage configuration digest drifted")


def frozen_candidate_predicate_records() -> tuple[dict[str, Any], ...]:
    """Return independent copies of all 188 frozen candidate rows."""

    _assert_frozen_configuration()
    return tuple(json.loads(_canonical_json_bytes(row)) for row in _expected_candidate_records())


def frozen_lean_source_universe() -> tuple[dict[str, Any], ...]:
    """Return independent copies of all 37 frozen Lean source rows."""

    _assert_frozen_configuration()
    return tuple(json.loads(_canonical_json_bytes(row)) for row in _expected_lean_source_rows())


def _descriptor_flags() -> tuple[int, int]:
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    directory = getattr(os, "O_DIRECTORY", 0)
    nonblock = getattr(os, "O_NONBLOCK", 0)
    if nofollow == 0 or directory == 0 or nonblock == 0 or os.open not in os.supports_dir_fd:
        _fail("platform lacks descriptor-relative no-follow artifact custody")
    close_on_exec = getattr(os, "O_CLOEXEC", 0)
    return (
        os.O_RDONLY | nofollow | directory | close_on_exec,
        os.O_RDONLY | nofollow | nonblock | close_on_exec,
    )


def _open_repo_root(repo_root: Path) -> int:
    try:
        lexical = Path(os.path.abspath(os.fspath(repo_root)))
        resolved = lexical.resolve(strict=True)
    except (OSError, RuntimeError, TypeError, ValueError) as exc:
        raise Rigid221Card18PredicateCoverageError(
            "repository root is missing or malformed"
        ) from exc
    if lexical != resolved:
        _fail("repository root contains a symlink or path escape")
    directory_flags, _source_flags = _descriptor_flags()
    descriptor: int | None = None
    try:
        descriptor = os.open(lexical.anchor, directory_flags)
        for component in lexical.parts[1:]:
            next_descriptor = os.open(component, directory_flags, dir_fd=descriptor)
            previous = descriptor
            descriptor = next_descriptor
            os.close(previous)
        if not stat.S_ISDIR(os.fstat(descriptor).st_mode):
            _fail("repository root is not a directory")
        result = descriptor
        descriptor = None
        return result
    except Rigid221Card18PredicateCoverageError:
        raise
    except OSError as exc:
        raise Rigid221Card18PredicateCoverageError(
            "repository root is missing, non-directory, or symlinked"
        ) from exc
    finally:
        if descriptor is not None:
            try:
                os.close(descriptor)
            except OSError:
                pass


def _validate_relative_path(relative: str) -> tuple[str, ...]:
    if type(relative) is not str or not relative:
        _fail("bound artifact path is not a nonempty string")
    parts = relative.split("/")
    if (
        relative.startswith("/")
        or "\\" in relative
        or "\x00" in relative
        or any(part in {"", ".", ".."} for part in parts)
        or PurePosixPath(relative).as_posix() != relative
    ):
        _fail(f"bound artifact path escapes repository custody: {relative!r}")
    return tuple(parts)


def _read_bound_artifact(root_descriptor: int, relative: str) -> bytes:
    parts = _validate_relative_path(relative)
    directory_flags, file_flags = _descriptor_flags()
    descriptor: int | None = os.dup(root_descriptor)
    file_descriptor: int | None = None
    try:
        for component in parts[:-1]:
            next_descriptor = os.open(component, directory_flags, dir_fd=descriptor)
            previous = descriptor
            descriptor = next_descriptor
            os.close(previous)
        file_descriptor = os.open(parts[-1], file_flags, dir_fd=descriptor)
    except OSError as exc:
        raise Rigid221Card18PredicateCoverageError(
            f"bound artifact is missing, nonregular, or symlinked: {relative}"
        ) from exc
    finally:
        if descriptor is not None:
            try:
                os.close(descriptor)
            except OSError:
                pass
    try:
        assert file_descriptor is not None
        info = os.fstat(file_descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            _fail(f"bound artifact is not a singly linked regular file: {relative}")
        with os.fdopen(file_descriptor, "rb") as handle:
            file_descriptor = None
            return handle.read()
    finally:
        if file_descriptor is not None:
            try:
                os.close(file_descriptor)
            except OSError:
                pass


def _artifact_record(payload: bytes, path: str) -> dict[str, Any]:
    return {"path": path, "bytes": len(payload), "sha256": hashlib.sha256(payload).hexdigest()}


def _reject_duplicate_object_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            _fail(f"duplicate JSON object key in predicate-coverage data: {key!r}")
        result[key] = value
    return result


def _reject_json_constant(value: str) -> None:
    _fail(f"invalid JSON constant in predicate-coverage data: {value}")


def _strict_json(payload: bytes) -> Any:
    try:
        return json.loads(
            payload.decode("utf-8"),
            object_pairs_hook=_reject_duplicate_object_pairs,
            parse_constant=_reject_json_constant,
        )
    except Rigid221Card18PredicateCoverageError:
        raise
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise Rigid221Card18PredicateCoverageError(
            "bound JSON artifact is not strict JSON"
        ) from exc


def _validate_axiom_receipt(payload: bytes) -> None:
    value = _strict_json(payload)
    if type(value) is not dict:
        _fail("axiom receipt is not a JSON object")
    required = {
        "schema": AXIOM_RECEIPT_SCHEMA,
        "lean_command": AXIOM_COMMAND,
        "lean_module": LABELED_ROOT_MODULE,
        "source_path": LABELED_SOURCE_PATH,
        "source_sha256": LABELED_SOURCE_SHA256,
        "exit_code": 0,
        "sorry_ax_present": False,
        "native_or_external_evidence_present": False,
    }
    for key, expected in required.items():
        if key not in value or type(value[key]) is not type(expected) or value[key] != expected:
            _fail(f"axiom receipt has stale or malformed {key}")
    digest = value.get("receipt_sha256")
    if type(digest) is not str or _SHA256.fullmatch(digest) is None:
        _fail("axiom receipt self-hash is malformed")
    body = dict(value)
    del body["receipt_sha256"]
    if _sha256_json(body) != digest or digest != AXIOM_RECEIPT_SHA256:
        _fail("axiom receipt self-hash is stale")


def _attest_live_bindings(repo_root: Path) -> dict[str, Any]:
    _assert_frozen_configuration()
    root_descriptor = _open_repo_root(repo_root)
    try:
        candidate_payload = _read_bound_artifact(root_descriptor, CANDIDATE_PATH)
        coverage_payload = _read_bound_artifact(root_descriptor, COVERAGE_MODULE_PATH)
        custody_payload = _read_bound_artifact(root_descriptor, CUSTODY_RECEIPT_PATH)
        source_payload = _read_bound_artifact(root_descriptor, LABELED_SOURCE_PATH)
        axiom_payload = _read_bound_artifact(root_descriptor, AXIOM_RECEIPT_PATH)
    finally:
        os.close(root_descriptor)

    fixed_checks = (
        (candidate_payload, CANDIDATE_BYTES, CANDIDATE_SHA256, "candidate module"),
        (custody_payload, CUSTODY_RECEIPT_BYTES, CUSTODY_RECEIPT_FILE_SHA256, "custody receipt"),
        (source_payload, LABELED_SOURCE_BYTES, LABELED_SOURCE_SHA256, "labeled source"),
        (axiom_payload, AXIOM_RECEIPT_BYTES, AXIOM_RECEIPT_FILE_SHA256, "axiom receipt"),
    )
    for payload, expected_bytes, expected_digest, label in fixed_checks:
        if len(payload) != expected_bytes or hashlib.sha256(payload).hexdigest() != expected_digest:
            _fail(f"live {label} bytes drifted")
    try:
        custody_receipt = custody.attest_labeled_projection_source_custody_receipt(
            repo_root, custody_payload
        )
    except custody.Rigid221Card18LabeledProjectionCustodyError as exc:
        raise Rigid221Card18PredicateCoverageError(
            "labeled-projection source custody did not attest live"
        ) from exc
    if (
        custody.SCHEMA != CUSTODY_SCHEMA
        or custody.FROZEN_CONFIGURATION_SHA256 != CUSTODY_CONFIGURATION_SHA256
        or custody_receipt.get("schema") != CUSTODY_SCHEMA
        or custody_receipt.get("receipt_sha256") != CUSTODY_RECEIPT_SHA256
        or custody_receipt.get("lean_root_modules") != [LABELED_ROOT_MODULE]
        or _sha256_json(custody_receipt.get("lean_source_manifest"))
        != CUSTODY_SOURCE_MANIFEST_SHA256
    ):
        _fail("labeled-projection custody binding is stale or cross-attested")
    _validate_axiom_receipt(axiom_payload)
    return _artifact_record(coverage_payload, COVERAGE_MODULE_PATH)


def _bindings_with_coverage(coverage_record: Mapping[str, Any]) -> dict[str, Any]:
    bindings = _fixed_bindings()
    bindings["coverage_module"] = dict(coverage_record)
    return bindings


def _validate_binding_record(value: Any, expected: Mapping[str, Any], label: str) -> None:
    if type(value) is not dict or set(value) != set(expected):
        _fail(f"{label} binding fields are malformed")
    for key, expected_value in expected.items():
        if type(value[key]) is not type(expected_value) or value[key] != expected_value:
            _fail(f"{label} binding {key} is stale or malformed")


def _validate_bindings(value: Any) -> None:
    fixed = _fixed_bindings()
    if type(value) is not dict or set(value) != {*fixed, "coverage_module"}:
        _fail("artifact binding fields are malformed")
    for key, expected in fixed.items():
        _validate_binding_record(value[key], expected, key)
    coverage_record = value["coverage_module"]
    if type(coverage_record) is not dict or set(coverage_record) != {"path", "bytes", "sha256"}:
        _fail("coverage-module binding fields are malformed")
    if (
        coverage_record["path"] != COVERAGE_MODULE_PATH
        or type(coverage_record["bytes"]) is not int
        or coverage_record["bytes"] < 0
        or type(coverage_record["sha256"]) is not str
        or _SHA256.fullmatch(coverage_record["sha256"]) is None
    ):
        _fail("coverage-module live binding is malformed")


def _validate_source_rows(rows: Any) -> dict[str, str]:
    if type(rows) is not list:
        _fail("Lean source universe is not a list")
    ids: list[str] = []
    statuses: dict[str, str] = {}
    for row in rows:
        if type(row) is not dict or set(row) != _SOURCE_FIELDS:
            _fail("Lean source row fields are malformed")
        canonical_id = row["id"]
        status = row["status"]
        anchors = row["lean_anchors"]
        if (
            type(canonical_id) is not str
            or type(status) is not str
            or status not in LEAN_STATUSES
            or type(row["representation"]) is not str
            or type(anchors) is not list
            or row["custody_digest"] != CUSTODY_SOURCE_MANIFEST_SHA256
            or type(row["noncomputable"]) is not bool
            or type(row["executable"]) is not bool
            or type(row["blocking"]) is not bool
        ):
            _fail("Lean source row values are malformed")
        for anchor in anchors:
            if (
                type(anchor) is not dict
                or set(anchor) != _ANCHOR_FIELDS
                or any(type(anchor[field]) is not str or not anchor[field] for field in _ANCHOR_FIELDS)
            ):
                _fail("Lean declaration anchor is malformed")
        if anchors != sorted(anchors, key=lambda item: (item["module"], item["declaration"], item["kind"])):
            _fail("Lean declaration anchors are reordered")
        if status == ABSENT_FROM_LABELED_EXPORT:
            if anchors or row["representation"] != "ABSENT" or row["executable"] or not row["blocking"]:
                _fail("absent Lean row gained an anchor or stopped blocking")
        elif not anchors:
            _fail("non-absent Lean row lacks a declaration anchor")
        if status == PROP_AVAILABLE_NOT_EMITTED and (row["representation"] != "LEAN_PROP_ONLY" or row["executable"] or not row["blocking"]):
            _fail("Prop-only Lean row became executable or nonblocking")
        if status == LABEL_DATA_AVAILABLE:
            if any(anchor["kind"] not in {"structure", "structure_field", "structure_field_bundle", "inductive", "definition", "theorem"} for anchor in anchors):
                _fail("label-data Lean row lacks a concrete declaration kind")
            if row["executable"] or row["blocking"]:
                _fail("label-data row falsely claims executable output or blocking")
        ids.append(canonical_id)
        statuses[canonical_id] = status
    if ids != sorted(ids) or len(ids) != len(set(ids)):
        _fail("Lean source IDs are duplicated or reordered")
    if rows != _expected_lean_source_rows():
        _fail("Lean source universe differs from the frozen exact rows")
    if _sha256_json(ids) != FROZEN_LEAN_SOURCE_ID_SET_SHA256:
        _fail("Lean source ID set hash is stale")
    return statuses


def _validate_candidate_rows(rows: Any, source_statuses: Mapping[str, str]) -> None:
    if type(rows) is not list:
        _fail("candidate predicate universe is not a list")
    ids: list[str] = []
    records_by_id: dict[str, dict[str, Any]] = {}
    for row in rows:
        if type(row) is not dict or set(row) != _CANDIDATE_FIELDS:
            _fail("candidate predicate row fields are malformed")
        canonical_id = row["id"]
        origin = row["origin"]
        representation = row["representation"]
        source_ids = row["lean_source_ids"]
        arms = row["arms"]
        dependencies = row["dependencies"]
        anchor = row["candidate_anchor"]
        if (
            type(canonical_id) is not str
            or not canonical_id
            or type(origin) is not str
            or origin not in ORIGINS
            or type(representation) is not str
            or representation not in _REPRESENTATIONS
            or representation not in _REPRESENTATIONS_BY_ORIGIN[origin]
            or type(source_ids) is not list
            or not source_ids
            or any(type(source_id) is not str for source_id in source_ids)
            or source_ids != sorted(source_ids)
            or len(source_ids) != len(set(source_ids))
            or any(source_id not in source_statuses for source_id in source_ids)
            or type(row["lean_coverage_status"]) is not str
            or type(arms) is not list
            or not arms
            or any(type(arm) is not str or arm not in ARMS or arm.lower() in {"all", "any"} for arm in arms)
            or arms != [arm for arm in ARMS if arm in arms]
            or len(arms) != len(set(arms))
            or type(dependencies) is not list
            or any(type(item) is not str for item in dependencies)
            or dependencies != sorted(dependencies)
            or len(dependencies) != len(set(dependencies))
            or canonical_id in dependencies
            or type(anchor) is not dict
            or set(anchor) != _CANDIDATE_ANCHOR_FIELDS
            or anchor.get("module") != CANDIDATE_MODULE
            or any(type(anchor[field]) is not str or not anchor[field] for field in _CANDIDATE_ANCHOR_FIELDS)
            or type(row["source_entitled"]) is not bool
            or row["source_entitled"]
            or type(row["hard_clause_admission"]) is not bool
            or row["hard_clause_admission"]
        ):
            _fail("candidate predicate row values are malformed or escalated")
        referenced_statuses = {source_statuses[source_id] for source_id in source_ids}
        if len(referenced_statuses) != 1 or row["lean_coverage_status"] != next(iter(referenced_statuses)):
            _fail("candidate Lean status is not derived from its frozen source rows")
        algorithm = row["algorithm"]
        if origin == LOCALLY_RECOMPUTED:
            if (
                type(algorithm) is not dict
                or set(algorithm) != _ALGORITHM_FIELDS
                or type(algorithm["name"]) is not str
                or not algorithm["name"]
                or type(algorithm["inputs"]) is not list
                or not algorithm["inputs"]
                or any(type(item) is not str or not item for item in algorithm["inputs"])
                or algorithm["inputs"] != sorted(algorithm["inputs"])
                or len(algorithm["inputs"]) != len(set(algorithm["inputs"]))
            ):
                _fail("locally recomputed predicate lacks an exact algorithm/input set")
        elif algorithm is not None:
            _fail("caller-supplied predicate gained a recomputation algorithm")
        ids.append(canonical_id)
        records_by_id[canonical_id] = row
    if ids != sorted(ids) or len(ids) != len(set(ids)):
        _fail("candidate predicate IDs are duplicated or reordered")
    id_set = set(ids)
    for row in rows:
        for dependency in row["dependencies"]:
            if dependency not in id_set:
                _fail("candidate dependency is unknown")
            if not set(row["arms"]).issubset(records_by_id[dependency]["arms"]):
                _fail("candidate dependency is unavailable on a dependent arm")
    visiting: set[str] = set()
    visited: set[str] = set()

    def visit(node: str) -> None:
        if node in visiting:
            _fail("candidate dependency graph contains a cycle")
        if node in visited:
            return
        visiting.add(node)
        for dependency in records_by_id[node]["dependencies"]:
            visit(dependency)
        visiting.remove(node)
        visited.add(node)

    for canonical_id in ids:
        visit(canonical_id)
    if rows != _expected_candidate_records():
        _fail("candidate predicate universe differs from the frozen exact rows")
    if _sha256_json(ids) != FROZEN_CANDIDATE_ID_SET_SHA256:
        _fail("candidate predicate ID set hash is stale")


def validate_predicate_coverage_manifest(manifest: Mapping[str, Any]) -> dict[str, Any]:
    """Validate exact rows, bindings, cross-rules, admission, and self-hash."""

    _assert_frozen_configuration()
    if not isinstance(manifest, Mapping):
        _fail("predicate-coverage manifest is not a mapping")
    try:
        snapshot = json.loads(_canonical_json_bytes(manifest))
    except json.JSONDecodeError as exc:
        raise Rigid221Card18PredicateCoverageError(
            "predicate-coverage manifest is not strict JSON"
        ) from exc
    if type(snapshot) is not dict or set(snapshot) != _MANIFEST_FIELDS:
        _fail("predicate-coverage manifest fields are malformed")
    if snapshot["schema"] != SCHEMA or type(snapshot["schema"]) is not str:
        _fail("predicate-coverage manifest schema is wrong")
    if type(snapshot["metadata"]) is not dict or snapshot["metadata"] != dict(_METADATA):
        _fail("predicate-coverage lane metadata is wrong")
    _validate_bindings(snapshot["bindings"])
    statuses = _validate_source_rows(snapshot["lean_source_universe"])
    _validate_candidate_rows(snapshot["candidate_predicates"], statuses)
    summary = snapshot["coverage_summary"]
    if type(summary) is not dict or summary != _coverage_summary():
        _fail("predicate-coverage summary is stale")
    if any(type(value) is not int for value in summary["candidate_origin_counts"].values()) or any(type(value) is not int for value in summary["lean_status_counts"].values()):
        _fail("predicate-coverage counts have non-integer types")
    if Counter(row["origin"] for row in snapshot["candidate_predicates"]) != Counter(summary["candidate_origin_counts"]):
        _fail("candidate origin counts do not match rows")
    if Counter(row["status"] for row in snapshot["lean_source_universe"]) != Counter(summary["lean_status_counts"]):
        _fail("Lean status counts do not match rows")
    admission = snapshot["admission"]
    if type(admission) is not dict or set(admission) != set(_ADMISSION):
        _fail("admission fields are malformed")
    for key, expected in _ADMISSION.items():
        if type(admission[key]) is not type(expected) or admission[key] != expected:
            _fail("predicate-coverage manifest attempts a proof/solver-ready escalation")
    digest = snapshot["manifest_sha256"]
    if type(digest) is not str or _SHA256.fullmatch(digest) is None:
        _fail("predicate-coverage manifest self-hash is malformed")
    body = dict(snapshot)
    del body["manifest_sha256"]
    if _sha256_json(body) != digest:
        _fail("predicate-coverage manifest self-hash is wrong")
    return snapshot


def _manifest_body(coverage_record: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "metadata": dict(_METADATA),
        "bindings": _bindings_with_coverage(coverage_record),
        "candidate_predicates": _expected_candidate_records(),
        "lean_source_universe": _expected_lean_source_rows(),
        "coverage_summary": _coverage_summary(),
        "admission": dict(_ADMISSION),
    }


def build_predicate_coverage_manifest(repo_root: Path) -> dict[str, Any]:
    """Attest all bound live artifacts and build the canonical gap ledger."""

    coverage_record = _attest_live_bindings(repo_root)
    body = _manifest_body(coverage_record)
    return validate_predicate_coverage_manifest(
        {**body, "manifest_sha256": _sha256_json(body)}
    )


def encode_predicate_coverage_manifest(manifest: Mapping[str, Any]) -> bytes:
    """Return the unique canonical UTF-8 encoding of a valid manifest."""

    _assert_frozen_configuration()
    return _canonical_json_bytes(validate_predicate_coverage_manifest(manifest))


def parse_predicate_coverage_manifest(payload: bytes) -> dict[str, Any]:
    """Parse duplicate-free strict JSON and require its canonical bytes."""

    _assert_frozen_configuration()
    if type(payload) is not bytes:
        _fail("predicate-coverage payload is not immutable bytes")
    value = _strict_json(payload)
    if _canonical_json_bytes(value) != payload:
        _fail("predicate-coverage payload is not canonical JSON")
    return validate_predicate_coverage_manifest(value)


def attest_predicate_coverage_manifest(repo_root: Path, payload: bytes) -> dict[str, Any]:
    """Bind a canonical manifest to fresh no-follow reads and live custody."""

    parsed = parse_predicate_coverage_manifest(payload)
    live_coverage = _attest_live_bindings(repo_root)
    if parsed["bindings"]["coverage_module"] != live_coverage:
        _fail("coverage-module live hash is stale")
    fresh_body = _manifest_body(live_coverage)
    fresh = {**fresh_body, "manifest_sha256": _sha256_json(fresh_body)}
    if payload != _canonical_json_bytes(fresh):
        _fail("predicate-coverage manifest is not live-current")
    return parsed
