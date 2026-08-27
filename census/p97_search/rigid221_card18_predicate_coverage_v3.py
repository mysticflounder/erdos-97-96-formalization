# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Fail-closed v3 predicate coverage for the Rigid221 card-18 packet.

This ledger derives the exact v2 predicate and source universes, then records
one reviewed Lean-source upgrade: the labeled finite enrichment emits the
selected row, physical five-class, deleted-center facts, and bi blocker labels.
It authenticates the frozen source and receipt inputs. It does not serialize
Lean values, establish a Python/Lean serialization relation, admit clauses,
run a solver, or authorize a canary.
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

from census.p97_search import (
    rigid221_card18_crossed_incidence_custody as crossed_custody,
)
from census.p97_search import rigid221_card18_predicate_coverage as coverage_v1
from census.p97_search import rigid221_card18_predicate_coverage_v2 as coverage_v2

SCHEMA: Final = "p97-rigid221-card18-predicate-coverage/v3"
LANE_ID_METADATA: Final = "rigid221-card18-predicate-coverage-v3-20260827"
LANE_BASE_HEAD_METADATA: Final = "2d6eb3ef92ea381990c12b2633a7bfd015e28174"

V1_SCHEMA: Final = "p97-rigid221-card18-predicate-coverage/v1"
V1_CONFIGURATION_SHA256: Final = (
    "dcb17cb8bd406f903599f56f5046ed56467bc6e68c91ef9d25e0b8c90fd76d5c"
)
V1_COVERAGE_MODULE_PATH: Final = (
    "census/p97_search/rigid221_card18_predicate_coverage.py"
)
V1_COVERAGE_MODULE_BYTES: Final = 70454
V1_COVERAGE_MODULE_SHA256: Final = (
    "fbf8a5cdac806a6f2d01929ce93aa4cbc490d557e91144728a85cfb60efee7da"
)
V1_MANIFEST_PATH: Final = "certificates/rigid221_card18_predicate_coverage_v1.json"
V1_MANIFEST_BYTES: Final = 134343
V1_MANIFEST_FILE_SHA256: Final = (
    "4031a8ce6d67c5b2d4f10c30753e5fe1aa615d544f679a5dcb303eea5dac69dc"
)
V1_MANIFEST_SHA256: Final = (
    "23bb018c8fb625dbd2e7f936322d7df5fc98a7ad87915b68a9684a3f10357e2e"
)

V2_SCHEMA: Final = "p97-rigid221-card18-predicate-coverage/v2"
V2_COVERAGE_MODULE_PATH: Final = (
    "census/p97_search/rigid221_card18_predicate_coverage_v2.py"
)
V2_COVERAGE_MODULE_BYTES: Final = 59747
V2_COVERAGE_MODULE_SHA256: Final = (
    "77ecf6d56ebe69ef74f219c9c0904992e2e631fbae769cef9cfd690837341fc2"
)
V2_MANIFEST_PATH: Final = "certificates/rigid221_card18_predicate_coverage_v2.json"
V2_MANIFEST_BYTES: Final = 143311
V2_MANIFEST_FILE_SHA256: Final = (
    "889d0f496baeefc4eb053370b45a04f88353d1180a2b52f26da37136b71d083e"
)
V2_MANIFEST_SHA256: Final = (
    "6e7770b29b15da91faa9b7648779a22c28e403a825263ffabdb0cdf0f1f89114"
)
V2_CONFIGURATION_SHA256: Final = (
    "0e4fcd139eed1723ff2a049a25ebd8ae0d0e4cd5eaa37fb73f04db3f85dbe651"
)

CANDIDATE_SCHEMA: Final = "p97-rigid221-card18-source-packet/v1"
CANDIDATE_PATH: Final = "census/p97_search/rigid221_card18_source_packet.py"
CANDIDATE_BYTES: Final = 35567
CANDIDATE_SHA256: Final = (
    "a7f0f9b63ffd35b4c97e58a0021cf25a7336bf8c75c33e7ca64f67cb1412169f"
)
CANDIDATE_SCHEMA_SNAPSHOT_SHA256: Final = (
    "d6b071068c8ec3bc55660dd9f5f0c0c51317c53054c1895feefca9e00c01b3fb"
)

LABELED_CUSTODY_PATH: Final = (
    "certificates/rigid221_card18_labeled_projection_source_custody_v1.json"
)
LABELED_CUSTODY_BYTES: Final = 8496
LABELED_CUSTODY_FILE_SHA256: Final = (
    "4a6a515bb49a79ef96bb98238b148b8eed71136c29baa2e9c43578a7d7d777d7"
)
LABELED_CUSTODY_RECEIPT_SHA256: Final = (
    "5afbd956e2a47b3a7e17f929edb534772b549c38bf1c5ea63e50f494cee0dbc0"
)
LABELED_CUSTODY_CONFIGURATION_SHA256: Final = (
    "d40a946f5e33a0e7409240fc36e4d6abb3128517a756699e935edfea125d53dd"
)
LABELED_CUSTODY_SOURCE_MANIFEST_SHA256: Final = (
    "c4fefbc7b39735805e0a9a30b1bc70ca5c33dd7f85e00013d163b0d2321138b2"
)
LABELED_CUSTODY_SCHEMA: Final = (
    "p97-rigid221-card18-labeled-projection-lean-source-custody/v1"
)
LABELED_ROOT_MODULE: Final = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledProjection"
)
LABELED_SOURCE_PATH: Final = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "Rigid221Card18LabeledProjection.lean"
)
LABELED_SOURCE_BYTES: Final = 28885
LABELED_SOURCE_SHA256: Final = (
    "37927775bbe67598b60d49f32a45cddefea70c14f4aceccaf9dcac596baa1239"
)
LABELED_AXIOM_PATH: Final = (
    "certificates/rigid221_card18_labeled_projection_axioms_20260827.json"
)
LABELED_AXIOM_BYTES: Final = 1405
LABELED_AXIOM_FILE_SHA256: Final = (
    "2e705659b52763ca80563f51f27993d74428849c497ac63839c799090153c2c1"
)
LABELED_AXIOM_RECEIPT_SHA256: Final = (
    "0ceab5d304e81b9cf156f7928f18a22177349860fe20392f7783c0c27b60378b"
)
LABELED_AXIOM_SCHEMA: Final = "p97-rigid221-card18-labeled-projection-axioms/v1"
LABELED_AXIOM_COMMAND: Final = (
    "#print axioms Problem97.ATailFrontierLiveClosure."
    "Rigid221Card18LabeledProjection."
    "rigid221ExactCardEighteenDataAlternativeToLabeled"
)

CROSSED_ROOT_MODULE: Final = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
    "Rigid221Card18CrossedIncidenceProjection"
)
CROSSED_SOURCE_PATH: Final = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "Rigid221Card18CrossedIncidenceProjection.lean"
)
CROSSED_SOURCE_BYTES: Final = 19558
CROSSED_SOURCE_SHA256: Final = (
    "27e356b50f38e974dc44884937d00c03e56c36c2180e3a01c619115576377439"
)
CROSSED_AXIOM_PATH: Final = (
    "certificates/rigid221_card18_crossed_incidence_projection_axioms_20260827.json"
)
CROSSED_AXIOM_BYTES: Final = 2266
CROSSED_AXIOM_FILE_SHA256: Final = (
    "604059c92e9ea71affd44ba2e4d0026da07afb185c824eed7954cdd7760cbf2f"
)
CROSSED_AXIOM_RECEIPT_SHA256: Final = (
    "f5d2b07cdbddb4fb4d6448f5bcc52ec7e8411659f8512676b4c0e311f5b83e52"
)
CROSSED_AXIOM_SCHEMA: Final = (
    "p97-rigid221-card18-crossed-incidence-projection-axioms/v1"
)
CROSSED_AXIOM_COMMANDS: Final = (
    (
        "#print axioms Problem97.ATailFrontierLiveClosure."
        "Rigid221Card18CrossedIncidenceProjection."
        "xvDeletionFiveIncidenceProfile_conjunctionHasFalse"
    ),
    (
        "#print axioms Problem97.ATailFrontierLiveClosure."
        "Rigid221Card18CrossedIncidenceProjection."
        "uDeletionFiveIncidenceProfile_conjunctionHasFalse"
    ),
    (
        "#print axioms Problem97.ATailFrontierLiveClosure."
        "Rigid221Card18CrossedIncidenceProjection."
        "rigid221ExactCardEighteenLabeledAlternativeToIncidence"
    ),
)
CROSSED_AXIOM_DECLARATIONS: Final = tuple(
    command.removeprefix("#print axioms ") for command in CROSSED_AXIOM_COMMANDS
)

CROSSED_CUSTODY_PATH: Final = (
    "certificates/rigid221_card18_crossed_incidence_source_custody_v1.json"
)
CROSSED_CUSTODY_BYTES: Final = 8958
CROSSED_CUSTODY_FILE_SHA256: Final = (
    "772b0d246070487c4e3e5dc9811581488e49177d21ec4110379e26f5479dfff3"
)
CROSSED_CUSTODY_RECEIPT_SHA256: Final = (
    "cab2d626f0a30dd55a10f4640d13046ae1003b657d1a53e1f81061939747fa3b"
)
CROSSED_CUSTODY_CONFIGURATION_SHA256: Final = (
    "28f9a2065e5566f2e065adea79ffe8608bb7ac0f0bbf1337387449bc4546bea2"
)
CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256: Final = (
    "fe1ecab611ba041527f0dd753a4f89ef94531a979faeb2adf9f87cc92afa030c"
)
CROSSED_CUSTODY_SCHEMA: Final = (
    "p97-rigid221-card18-crossed-incidence-projection-lean-source-custody/v1"
)

COVERAGE_V3_MODULE_PATH: Final = (
    "census/p97_search/rigid221_card18_predicate_coverage_v3.py"
)

ENRICHMENT_SOURCE_ID: Final = "enrichment.labeled_finite_data"
ENRICHMENT_REPRESENTATION: Final = "LEAN_LABELED_FINITE_ENRICHMENT"
ENRICHMENT_ROOT_MODULE: Final = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18LabeledEnrichment"
)
ENRICHMENT_SOURCE_PATH: Final = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "Rigid221Card18LabeledEnrichment.lean"
)
ENRICHMENT_SOURCE_BYTES: Final = 18989
ENRICHMENT_SOURCE_SHA256: Final = (
    "62e2d79bb56e7f87c7b5aa56398485fc547033ba369a2affe50fc8698b8b1bec"
)
ENRICHMENT_CUSTODY_STATUS: Final = "NONE_LIVE_SOURCE_BINDING_ONLY"
ENRICHMENT_NO_CUSTODY_BINDING_DOMAIN: Final = (
    f"{SCHEMA}:no-custody-live-source-binding:{ENRICHMENT_SOURCE_SHA256}"
)
ENRICHMENT_NO_CUSTODY_BINDING_DIGEST: Final = (
    "ece9e242bdeaf9a0b3feb550bf125440df4020e2e7c07c4e834878ddeb59088c"
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

PROFILE_SOURCE_ID: Final = "profile.crossed_missing_incidence"
PROFILE_REPRESENTATION: Final = "LEAN_FIN18_FIVE_INCIDENCE_BOOL_PROFILE"

DELTA_CANDIDATE_IDS: Final = (
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
FROZEN_DELTA_ID_SET_SHA256: Final = (
    "cf567de6d9978c9ab1e074e8498585a9ab6ea8273c998eed612a9db57c10aead"
)
FROZEN_CANDIDATE_ID_SET_SHA256: Final = (
    "ca7a9c209a01eb76153f4784569a5282bd54c96734d4e4db492a61b61d616561"
)
FROZEN_LEAN_SOURCE_ID_SET_SHA256: Final = (
    "a315997b0b0336787d4ea74c8de981a484541326b76911ea26c3579a363a3f9f"
)

_CROSSED_NAMESPACE: Final = (
    "Problem97.ATailFrontierLiveClosure.Rigid221Card18CrossedIncidenceProjection."
)
_BIT_THEOREMS: Final = (
    "actualCenter1InBO_iff",
    "oppApex2InK1_iff",
    "actualCenter2InK1_iff",
    "oppApex2InK2_iff",
    "actualCenter1InK2_iff",
)
_CROSSED_ANCHOR_SPECS: Final = tuple(
    sorted(
        (
            ("Rigid221FiveIncidenceProfile", "structure"),
            ("Rigid221FiveIncidenceProfile.allFive", "definition"),
            ("Rigid221FiveIncidenceProfile.conjunctionHasFalse", "definition"),
            ("Rigid221XvDeletionIncidenceProjection", "structure"),
            ("Rigid221UDeletionIncidenceProjection", "structure"),
            ("xvDeletionFiveIncidenceProfile", "definition"),
            ("uDeletionFiveIncidenceProfile", "definition"),
            ("rigid221XvDeletionIncidenceProjection", "definition"),
            ("rigid221UDeletionIncidenceProjection", "definition"),
            ("Rigid221ExactCardEighteenIncidenceAlternative", "inductive"),
            (
                "rigid221ExactCardEighteenLabeledAlternativeToIncidence",
                "definition",
            ),
            (
                "xvDeletionFiveIncidenceProfile_conjunctionHasFalse",
                "theorem",
            ),
            (
                "uDeletionFiveIncidenceProfile_conjunctionHasFalse",
                "theorem",
            ),
            *tuple(
                (f"xvDeletionFiveIncidenceProfile_{suffix}", "theorem")
                for suffix in _BIT_THEOREMS
            ),
            *tuple(
                (f"uDeletionFiveIncidenceProfile_{suffix}", "theorem")
                for suffix in _BIT_THEOREMS
            ),
        ),
        key=lambda item: (item[0], item[1]),
    )
)

_ENRICHMENT_NAMESPACE: Final = (
    "Problem97.ATailFrontierLiveClosure.Rigid221Card18LabeledEnrichment."
)
_ENRICHMENT_ANCHOR_SPECS: Final = tuple(
    sorted(
        (
            ("selectedXvSupport", "definition"),
            ("physicalFiveSupport", "definition"),
            ("deletedCenterVertex", "definition"),
            ("deletedCenterSupport", "definition"),
            ("Rigid221CommonLabeledEnrichment", "structure"),
            ("rigid221CommonLabeledEnrichment", "definition"),
            ("Rigid221BothDeletionsLabeledEnrichment", "structure"),
            ("rigid221BothDeletionsLabeledEnrichment", "definition"),
            ("Rigid221ExactCardEighteenEnrichedAlternative", "inductive"),
            ("rigid221ExactCardEighteenIncidenceAlternativeToEnriched", "definition"),
            *tuple(
                (f"Rigid221CommonLabeledEnrichment.{field}", "field")
                for field in (
                    "selectedXvRow",
                    "physicalFive",
                    "physicalFive_eq",
                    "physicalFive_card_eq_five",
                    "physicalFive_eq_roles",
                    "deletedCenterRow",
                    "xv_mem_selectedXvRow",
                    "u_mem_selectedXvRow",
                    "source1_not_mem_selectedXvRow",
                    "source2_not_mem_selectedXvRow",
                    "deletedCenter_mem_deletedCenterRow",
                    "deletedCenter_not_mem_physicalFive",
                    "deletedCenterRow_physicalFive_inter_le_one",
                )
            ),
            *tuple(
                (f"Rigid221BothDeletionsLabeledEnrichment.{field}", "field")
                for field in (
                    "original",
                    "common",
                    "uActualBlocker",
                    "xvActualBlocker",
                    "uActualBlocker_eq_xv",
                    "xvActualBlocker_eq_v",
                    "uActualBlocker_point",
                    "xvActualBlocker_point",
                    "uActualBlocker_ne_actualCenter1",
                    "uActualBlocker_ne_actualCenter2",
                    "xvActualBlocker_ne_actualCenter1",
                    "xvActualBlocker_ne_actualCenter2",
                )
            ),
        ),
        key=lambda item: (item[0], item[1]),
    )
)

FROZEN_CROSSED_ANCHOR_SET_SHA256: Final = (
    "a09c8667e1d5117849c7363c963ed48871c5f41889689b88f6e996b35729898a"
)
FROZEN_V3_CANDIDATE_ROWS_SHA256: Final = (
    "93130f6c5d8d59ccec64528653698eb7ca36b73a7eae734701e0d185d5644f3e"
)
FROZEN_V3_LEAN_SOURCE_ROWS_SHA256: Final = (
    "cec1d8d443070eed81e50baec5ea2c83a861f9e0427879f5aa67473d03dc7f7e"
)
FROZEN_ENRICHMENT_ANCHOR_SET_SHA256: Final = (
    "c88b936c54cd51fd0faad25a564a23165b263d8cb18b05d1191609ebda957010"
)
FROZEN_CONFIGURATION_SHA256: Final = (
    "2c85fb76c85513297fc64766ff3a6d6043deb9576044faf7581278e24be91ba9"
)

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
_CANDIDATE_ANCHOR_FIELDS: Final = frozenset({"module", "validator", "json_path"})
_ALGORITHM_FIELDS: Final = frozenset({"name", "inputs"})

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


class Rigid221Card18PredicateCoverageV3Error(ValueError):
    """The frozen v3 coverage ledger or a bound artifact is invalid."""


def _fail(message: str) -> NoReturn:
    raise Rigid221Card18PredicateCoverageV3Error(message)


def _canonical_json_bytes(value: Any) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            "predicate-coverage-v3 value is not strict JSON"
        ) from exc


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _strict_json(payload: bytes) -> Any:
    if type(payload) is not bytes:
        _fail("bound JSON payload is not immutable bytes")
    try:
        return json.loads(
            payload.decode("utf-8"),
            object_pairs_hook=_reject_duplicate_object_pairs,
            parse_constant=_reject_json_constant,
        )
    except Rigid221Card18PredicateCoverageV3Error:
        raise
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            "bound JSON artifact is not strict JSON"
        ) from exc


def _reject_duplicate_object_pairs(
    pairs: list[tuple[str, Any]],
) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            _fail(f"duplicate JSON object key: {key}")
        result[key] = value
    return result


def _reject_json_constant(value: str) -> NoReturn:
    _fail(f"non-finite JSON constant is forbidden: {value}")


def _strict_copy(value: Any) -> Any:
    try:
        return json.loads(_canonical_json_bytes(value))
    except json.JSONDecodeError as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            "frozen v1 value is not strict JSON"
        ) from exc


def _v2_candidate_rows() -> list[dict[str, Any]]:
    try:
        value = _strict_copy(list(coverage_v2.frozen_v2_candidate_predicate_records()))
    except coverage_v2.Rigid221Card18PredicateCoverageV2Error as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            "frozen v2 candidate universe failed its own guard"
        ) from exc
    if type(value) is not list or any(type(row) is not dict for row in value):
        _fail("frozen v2 candidate universe is malformed")
    return value


def _v2_source_rows() -> list[dict[str, Any]]:
    try:
        value = _strict_copy(list(coverage_v2.frozen_v2_lean_source_universe()))
    except coverage_v2.Rigid221Card18PredicateCoverageV2Error as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            "frozen v2 Lean-source universe failed its own guard"
        ) from exc
    if type(value) is not list or any(type(row) is not dict for row in value):
        _fail("frozen v2 Lean-source universe is malformed")
    return value


def _crossed_anchors() -> list[dict[str, str]]:
    return [
        {
            "module": CROSSED_ROOT_MODULE,
            "declaration": _CROSSED_NAMESPACE + declaration,
            "kind": kind,
        }
        for declaration, kind in _CROSSED_ANCHOR_SPECS
    ]


def _enrichment_anchors() -> list[dict[str, str]]:
    return [
        {
            "module": ENRICHMENT_ROOT_MODULE,
            "declaration": _ENRICHMENT_NAMESPACE + declaration,
            "kind": kind,
        }
        for declaration, kind in _ENRICHMENT_ANCHOR_SPECS
    ]


def _expected_candidate_records() -> list[dict[str, Any]]:
    rows = _v2_candidate_rows()
    delta = set(DELTA_CANDIDATE_IDS)
    for row in rows:
        if row.get("id") in delta:
            row["lean_coverage_status"] = LABEL_DATA_AVAILABLE
            row["lean_source_ids"] = [ENRICHMENT_SOURCE_ID]
    return rows


def _upgraded_profile_source_row() -> dict[str, Any]:
    return {
        "id": PROFILE_SOURCE_ID,
        "status": LABEL_DATA_AVAILABLE,
        "representation": PROFILE_REPRESENTATION,
        "lean_anchors": _crossed_anchors(),
        "custody_digest": CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256,
        "noncomputable": True,
        "executable": False,
        "blocking": False,
    }


def _enrichment_source_row() -> dict[str, Any]:
    return {
        "id": ENRICHMENT_SOURCE_ID,
        "status": LABEL_DATA_AVAILABLE,
        "representation": ENRICHMENT_REPRESENTATION,
        "lean_anchors": _enrichment_anchors(),
        # Schema-compatibility field only: this domain-separated value is
        # deliberately not a custody manifest or the raw module digest.
        "custody_digest": ENRICHMENT_NO_CUSTODY_BINDING_DIGEST,
        "noncomputable": True,
        "executable": False,
        "blocking": False,
    }


def _expected_lean_source_rows() -> list[dict[str, Any]]:
    rows = _v2_source_rows()
    rows.append(_enrichment_source_row())
    rows.sort(key=lambda row: row["id"])
    return rows


def _fixed_bindings() -> dict[str, Any]:
    return {
        "v2_coverage_module": {
            "path": V2_COVERAGE_MODULE_PATH,
            "bytes": V2_COVERAGE_MODULE_BYTES,
            "sha256": V2_COVERAGE_MODULE_SHA256,
            "schema": V2_SCHEMA,
        },
        "v2_coverage_manifest": {
            "path": V2_MANIFEST_PATH,
            "bytes": V2_MANIFEST_BYTES,
            "file_sha256": V2_MANIFEST_FILE_SHA256,
            "manifest_sha256": V2_MANIFEST_SHA256,
            "schema": V2_SCHEMA,
        },
        "v1_candidate": {
            "path": CANDIDATE_PATH,
            "bytes": CANDIDATE_BYTES,
            "sha256": CANDIDATE_SHA256,
            "schema": CANDIDATE_SCHEMA,
            "schema_snapshot_sha256": CANDIDATE_SCHEMA_SNAPSHOT_SHA256,
        },
        "v1_coverage_module": {
            "path": V1_COVERAGE_MODULE_PATH,
            "bytes": V1_COVERAGE_MODULE_BYTES,
            "sha256": V1_COVERAGE_MODULE_SHA256,
            "configuration_sha256": V1_CONFIGURATION_SHA256,
            "schema": V1_SCHEMA,
        },
        "v1_coverage_manifest": {
            "path": V1_MANIFEST_PATH,
            "bytes": V1_MANIFEST_BYTES,
            "file_sha256": V1_MANIFEST_FILE_SHA256,
            "manifest_sha256": V1_MANIFEST_SHA256,
            "schema": V1_SCHEMA,
        },
        "v1_labeled_projection_custody": {
            "path": LABELED_CUSTODY_PATH,
            "bytes": LABELED_CUSTODY_BYTES,
            "file_sha256": LABELED_CUSTODY_FILE_SHA256,
            "receipt_sha256": LABELED_CUSTODY_RECEIPT_SHA256,
            "configuration_sha256": LABELED_CUSTODY_CONFIGURATION_SHA256,
            "root_module": LABELED_ROOT_MODULE,
            "schema": LABELED_CUSTODY_SCHEMA,
            "source_manifest_sha256": LABELED_CUSTODY_SOURCE_MANIFEST_SHA256,
        },
        "v1_labeled_projection_source": {
            "path": LABELED_SOURCE_PATH,
            "bytes": LABELED_SOURCE_BYTES,
            "sha256": LABELED_SOURCE_SHA256,
        },
        "v1_labeled_projection_axiom_receipt": {
            "path": LABELED_AXIOM_PATH,
            "bytes": LABELED_AXIOM_BYTES,
            "file_sha256": LABELED_AXIOM_FILE_SHA256,
            "receipt_sha256": LABELED_AXIOM_RECEIPT_SHA256,
            "schema": LABELED_AXIOM_SCHEMA,
            "lean_command": LABELED_AXIOM_COMMAND,
            "source_path": LABELED_SOURCE_PATH,
            "source_sha256": LABELED_SOURCE_SHA256,
        },
        "crossed_incidence_source": {
            "path": CROSSED_SOURCE_PATH,
            "bytes": CROSSED_SOURCE_BYTES,
            "sha256": CROSSED_SOURCE_SHA256,
        },
        "crossed_incidence_axiom_receipt": {
            "path": CROSSED_AXIOM_PATH,
            "bytes": CROSSED_AXIOM_BYTES,
            "file_sha256": CROSSED_AXIOM_FILE_SHA256,
            "receipt_sha256": CROSSED_AXIOM_RECEIPT_SHA256,
            "schema": CROSSED_AXIOM_SCHEMA,
            "lean_commands": list(CROSSED_AXIOM_COMMANDS),
            "lean_declarations": list(CROSSED_AXIOM_DECLARATIONS),
            "lean_module": CROSSED_ROOT_MODULE,
            "source_path": CROSSED_SOURCE_PATH,
            "source_bytes": CROSSED_SOURCE_BYTES,
            "source_sha256": CROSSED_SOURCE_SHA256,
        },
        "crossed_incidence_custody": {
            "path": CROSSED_CUSTODY_PATH,
            "bytes": CROSSED_CUSTODY_BYTES,
            "file_sha256": CROSSED_CUSTODY_FILE_SHA256,
            "receipt_sha256": CROSSED_CUSTODY_RECEIPT_SHA256,
            "configuration_sha256": CROSSED_CUSTODY_CONFIGURATION_SHA256,
            "root_module": CROSSED_ROOT_MODULE,
            "schema": CROSSED_CUSTODY_SCHEMA,
            "source_manifest_sha256": CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256,
        },
        "enrichment_source": {
            "path": ENRICHMENT_SOURCE_PATH,
            "bytes": ENRICHMENT_SOURCE_BYTES,
            "sha256": ENRICHMENT_SOURCE_SHA256,
            "root_module": ENRICHMENT_ROOT_MODULE,
            "custody_status": ENRICHMENT_CUSTODY_STATUS,
            "schema_compatibility_digest": ENRICHMENT_NO_CUSTODY_BINDING_DIGEST,
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
        "candidate_rows_sha256": FROZEN_V3_CANDIDATE_ROWS_SHA256,
        "delta_count": 12,
        "delta_id_set_sha256": FROZEN_DELTA_ID_SET_SHA256,
        "lean_source_count": 38,
        "lean_status_counts": {
            LABEL_DATA_AVAILABLE: 15,
            PROP_AVAILABLE_NOT_EMITTED: 16,
            ABSENT_FROM_LABELED_EXPORT: 7,
        },
        "lean_source_id_set_sha256": FROZEN_LEAN_SOURCE_ID_SET_SHA256,
        "lean_source_rows_sha256": FROZEN_V3_LEAN_SOURCE_ROWS_SHA256,
    }


def _configuration_snapshot() -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "metadata": dict(_METADATA),
        "coverage_module_path": COVERAGE_V3_MODULE_PATH,
        "fixed_bindings": _fixed_bindings(),
        "v1_configuration_sha256": V1_CONFIGURATION_SHA256,
        "v2_configuration_sha256": V2_CONFIGURATION_SHA256,
        "candidate_records": _expected_candidate_records(),
        "lean_source_rows": _expected_lean_source_rows(),
        "crossed_anchor_specs": [list(item) for item in _CROSSED_ANCHOR_SPECS],
        "enrichment_anchor_specs": [list(item) for item in _ENRICHMENT_ANCHOR_SPECS],
        "delta_candidate_ids": list(DELTA_CANDIDATE_IDS),
        "frozen_hashes": {
            "candidate_id_set": FROZEN_CANDIDATE_ID_SET_SHA256,
            "candidate_rows": FROZEN_V3_CANDIDATE_ROWS_SHA256,
            "crossed_anchor_set": FROZEN_CROSSED_ANCHOR_SET_SHA256,
            "delta_id_set": FROZEN_DELTA_ID_SET_SHA256,
            "enrichment_no_custody_binding": ENRICHMENT_NO_CUSTODY_BINDING_DIGEST,
            "lean_source_id_set": FROZEN_LEAN_SOURCE_ID_SET_SHA256,
            "lean_source_rows": FROZEN_V3_LEAN_SOURCE_ROWS_SHA256,
        },
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
    }


def _assert_delta_shape(
    v2_candidates: list[dict[str, Any]],
    v3_candidates: list[dict[str, Any]],
    v2_sources: list[dict[str, Any]],
    v3_sources: list[dict[str, Any]],
) -> None:
    if len(v2_candidates) != 188 or len(v3_candidates) != 188:
        _fail("frozen candidate universe has the wrong count")
    changed_candidates: list[str] = []
    for old, new in zip(v2_candidates, v3_candidates, strict=True):
        if old.get("id") != new.get("id"):
            _fail("v3 candidate IDs diverge from v2")
        canonical_id = old.get("id")
        if canonical_id in DELTA_CANDIDATE_IDS:
            expected = dict(old)
            expected["lean_coverage_status"] = LABEL_DATA_AVAILABLE
            expected["lean_source_ids"] = [ENRICHMENT_SOURCE_ID]
            if (
                old.get("lean_coverage_status") != PROP_AVAILABLE_NOT_EMITTED
                or tuple(old.get("lean_source_ids", []))
                not in {
                    ("bi.common_deletion_packet",),
                    ("parent.blocker_v_residual",),
                    ("source.live_parent_facts",),
                    ("source.neutral_origin",),
                    ("parent.source_heavy_packet",),
                }
                or new != expected
            ):
                _fail("v3 candidate delta changes more than status/source fields")
            changed_candidates.append(canonical_id)
        elif new != old:
            _fail("non-delta v3 candidate row differs from v2")
    if changed_candidates != list(DELTA_CANDIDATE_IDS):
        _fail("v3 candidate delta is omitted, reordered, or replaced")

    if len(v2_sources) != 37 or len(v3_sources) != 38:
        _fail("frozen Lean-source universe has the wrong count")
    for old, new in zip(
        v2_sources,
        [row for row in v3_sources if row["id"] != ENRICHMENT_SOURCE_ID],
        strict=True,
    ):
        if old.get("id") != new.get("id"):
            _fail("v3 Lean-source IDs diverge from v2")
        if new != old:
            _fail("non-delta v3 Lean-source row differs from v2")
    if sum(row["id"] == ENRICHMENT_SOURCE_ID for row in v3_sources) != 1:
        _fail("v3 enrichment source row is omitted or duplicated")


def _assert_frozen_configuration() -> None:
    literal = "2c85fb76c85513297fc64766ff3a6d6043deb9576044faf7581278e24be91ba9"
    try:
        scalar_strings = (
            SCHEMA,
            LANE_ID_METADATA,
            LANE_BASE_HEAD_METADATA,
            V1_SCHEMA,
            V1_CONFIGURATION_SHA256,
            V1_COVERAGE_MODULE_PATH,
            V2_SCHEMA,
            V2_COVERAGE_MODULE_PATH,
            V2_COVERAGE_MODULE_SHA256,
            V2_MANIFEST_PATH,
            V2_MANIFEST_FILE_SHA256,
            V2_MANIFEST_SHA256,
            V2_CONFIGURATION_SHA256,
            V1_COVERAGE_MODULE_SHA256,
            V1_MANIFEST_PATH,
            V1_MANIFEST_FILE_SHA256,
            V1_MANIFEST_SHA256,
            CANDIDATE_SCHEMA,
            CANDIDATE_PATH,
            CANDIDATE_SHA256,
            CANDIDATE_SCHEMA_SNAPSHOT_SHA256,
            LABELED_CUSTODY_PATH,
            LABELED_CUSTODY_FILE_SHA256,
            LABELED_CUSTODY_RECEIPT_SHA256,
            LABELED_CUSTODY_CONFIGURATION_SHA256,
            LABELED_CUSTODY_SOURCE_MANIFEST_SHA256,
            LABELED_CUSTODY_SCHEMA,
            LABELED_ROOT_MODULE,
            LABELED_SOURCE_PATH,
            LABELED_SOURCE_SHA256,
            LABELED_AXIOM_PATH,
            LABELED_AXIOM_FILE_SHA256,
            LABELED_AXIOM_RECEIPT_SHA256,
            LABELED_AXIOM_SCHEMA,
            LABELED_AXIOM_COMMAND,
            CROSSED_ROOT_MODULE,
            CROSSED_SOURCE_PATH,
            CROSSED_SOURCE_SHA256,
            CROSSED_AXIOM_PATH,
            CROSSED_AXIOM_FILE_SHA256,
            CROSSED_AXIOM_RECEIPT_SHA256,
            CROSSED_AXIOM_SCHEMA,
            CROSSED_CUSTODY_PATH,
            CROSSED_CUSTODY_FILE_SHA256,
            CROSSED_CUSTODY_RECEIPT_SHA256,
            CROSSED_CUSTODY_CONFIGURATION_SHA256,
            CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256,
            CROSSED_CUSTODY_SCHEMA,
            ENRICHMENT_SOURCE_ID,
            ENRICHMENT_REPRESENTATION,
            ENRICHMENT_ROOT_MODULE,
            ENRICHMENT_SOURCE_PATH,
            ENRICHMENT_SOURCE_SHA256,
            ENRICHMENT_CUSTODY_STATUS,
            ENRICHMENT_NO_CUSTODY_BINDING_DOMAIN,
            ENRICHMENT_NO_CUSTODY_BINDING_DIGEST,
            COVERAGE_V3_MODULE_PATH,
            PROFILE_SOURCE_ID,
            PROFILE_REPRESENTATION,
            FROZEN_DELTA_ID_SET_SHA256,
            FROZEN_CANDIDATE_ID_SET_SHA256,
            FROZEN_LEAN_SOURCE_ID_SET_SHA256,
            FROZEN_CROSSED_ANCHOR_SET_SHA256,
            FROZEN_V3_CANDIDATE_ROWS_SHA256,
            FROZEN_V3_LEAN_SOURCE_ROWS_SHA256,
            FROZEN_CONFIGURATION_SHA256,
        )
        scalar_integers = (
            V1_COVERAGE_MODULE_BYTES,
            V2_COVERAGE_MODULE_BYTES,
            V2_MANIFEST_BYTES,
            V1_MANIFEST_BYTES,
            CANDIDATE_BYTES,
            LABELED_CUSTODY_BYTES,
            LABELED_SOURCE_BYTES,
            LABELED_AXIOM_BYTES,
            CROSSED_SOURCE_BYTES,
            CROSSED_AXIOM_BYTES,
            CROSSED_CUSTODY_BYTES,
            ENRICHMENT_SOURCE_BYTES,
        )
        if (
            any(type(value) is not str for value in scalar_strings)
            or any(type(value) is not int or value < 0 for value in scalar_integers)
            or any(
                _SHA256.fullmatch(value) is None
                for value in scalar_strings
                if len(value) == 64
            )
            or not isinstance(_METADATA, Mapping)
            or not isinstance(_ADMISSION, Mapping)
            or any(
                type(value) is not bool
                for key, value in _ADMISSION.items()
                if key != "hard_clause_count"
            )
            or type(_ADMISSION["hard_clause_count"]) is not int
            or not isinstance(_SHA256, re.Pattern)
            or not all(
                isinstance(value, frozenset)
                for value in (
                    _MANIFEST_FIELDS,
                    _CANDIDATE_FIELDS,
                    _SOURCE_FIELDS,
                    _ANCHOR_FIELDS,
                    _CANDIDATE_ANCHOR_FIELDS,
                    _ALGORITHM_FIELDS,
                )
            )
        ):
            _fail("frozen predicate-coverage-v3 configuration has malformed types")
        if (
            coverage_v1.SCHEMA != V1_SCHEMA
            or coverage_v1.FROZEN_CONFIGURATION_SHA256 != V1_CONFIGURATION_SHA256
            or coverage_v2.SCHEMA != V2_SCHEMA
            or coverage_v2.FROZEN_CONFIGURATION_SHA256 != V2_CONFIGURATION_SHA256
            or crossed_custody.SCHEMA != CROSSED_CUSTODY_SCHEMA
            or crossed_custody.FROZEN_CONFIGURATION_SHA256
            != CROSSED_CUSTODY_CONFIGURATION_SHA256
        ):
            _fail("imported v1 or crossed-custody configuration is stale")
        if (
            hashlib.sha256(
                ENRICHMENT_NO_CUSTODY_BINDING_DOMAIN.encode("ascii")
            ).hexdigest()
            != ENRICHMENT_NO_CUSTODY_BINDING_DIGEST
            or ENRICHMENT_NO_CUSTODY_BINDING_DIGEST == ENRICHMENT_SOURCE_SHA256
        ):
            _fail("enrichment no-custody binding digest is malformed")
        if (
            ARMS != tuple(sorted(ARMS))
            or len(ARMS) != len(set(ARMS))
            or DELTA_CANDIDATE_IDS != tuple(sorted(DELTA_CANDIDATE_IDS))
            or len(DELTA_CANDIDATE_IDS) != 12
            or len(DELTA_CANDIDATE_IDS) != len(set(DELTA_CANDIDATE_IDS))
            or _CROSSED_ANCHOR_SPECS != tuple(sorted(_CROSSED_ANCHOR_SPECS))
            or len(_CROSSED_ANCHOR_SPECS) != len(set(_CROSSED_ANCHOR_SPECS))
            or _ENRICHMENT_ANCHOR_SPECS != tuple(sorted(_ENRICHMENT_ANCHOR_SPECS))
            or len(_ENRICHMENT_ANCHOR_SPECS) != len(set(_ENRICHMENT_ANCHOR_SPECS))
        ):
            _fail("frozen arm, delta, or anchor order is not canonical")

        v2_candidates = _v2_candidate_rows()
        v3_candidates = _expected_candidate_records()
        v2_sources = _v2_source_rows()
        v3_sources = _expected_lean_source_rows()
        _assert_delta_shape(v2_candidates, v3_candidates, v2_sources, v3_sources)
        candidate_ids = [row["id"] for row in v3_candidates]
        source_ids = [row["id"] for row in v3_sources]
        if (
            candidate_ids != sorted(candidate_ids)
            or len(candidate_ids) != len(set(candidate_ids))
            or source_ids != sorted(source_ids)
            or len(source_ids) != len(set(source_ids))
            or Counter(row["origin"] for row in v3_candidates)
            != Counter({CALLER_ASSERTION: 42, CALLER_DATA: 39, LOCALLY_RECOMPUTED: 107})
            or Counter(row["status"] for row in v3_sources)
            != Counter(
                {
                    LABEL_DATA_AVAILABLE: 15,
                    PROP_AVAILABLE_NOT_EMITTED: 16,
                    ABSENT_FROM_LABELED_EXPORT: 7,
                }
            )
        ):
            _fail("frozen v3 predicate/source universe has wrong IDs or counts")
        if (
            _sha256_json(candidate_ids) != FROZEN_CANDIDATE_ID_SET_SHA256
            or _sha256_json(source_ids) != FROZEN_LEAN_SOURCE_ID_SET_SHA256
            or _sha256_json(list(DELTA_CANDIDATE_IDS)) != FROZEN_DELTA_ID_SET_SHA256
            or _sha256_json(_crossed_anchors()) != FROZEN_CROSSED_ANCHOR_SET_SHA256
            or _sha256_json(_enrichment_anchors())
            != FROZEN_ENRICHMENT_ANCHOR_SET_SHA256
            or _sha256_json(v3_candidates) != FROZEN_V3_CANDIDATE_ROWS_SHA256
            or _sha256_json(v3_sources) != FROZEN_V3_LEAN_SOURCE_ROWS_SHA256
        ):
            _fail("frozen v3 predicate/source/anchor hash drifted")
        current = _sha256_json(_configuration_snapshot())
        if FROZEN_CONFIGURATION_SHA256 != literal or current != literal:
            _fail("frozen predicate-coverage-v3 configuration digest drifted")
    except Rigid221Card18PredicateCoverageV3Error:
        raise
    except (AttributeError, KeyError, TypeError, ValueError) as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            "frozen predicate-coverage-v3 configuration is malformed"
        ) from exc


def frozen_v3_candidate_predicate_records() -> tuple[dict[str, Any], ...]:
    """Return independent copies of the 188 exact v3 candidate rows."""

    _assert_frozen_configuration()
    return tuple(_strict_copy(_expected_candidate_records()))


def frozen_v3_lean_source_universe() -> tuple[dict[str, Any], ...]:
    """Return independent copies of the 38 exact v3 Lean-source rows."""

    _assert_frozen_configuration()
    return tuple(_strict_copy(_expected_lean_source_rows()))


def _descriptor_flags() -> tuple[int, int]:
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    directory = getattr(os, "O_DIRECTORY", 0)
    nonblock = getattr(os, "O_NONBLOCK", 0)
    if (
        nofollow == 0
        or directory == 0
        or nonblock == 0
        or os.open not in os.supports_dir_fd
    ):
        _fail("platform lacks descriptor-relative no-follow artifact custody")
    close_on_exec = getattr(os, "O_CLOEXEC", 0)
    return (
        os.O_RDONLY | nofollow | directory | close_on_exec,
        os.O_RDONLY | nofollow | nonblock | close_on_exec,
    )


def _open_repo_root(repo_root: Path) -> int:
    """Open a resolved repository directory without following a symlink."""

    try:
        lexical = Path(os.path.abspath(os.fspath(repo_root)))
        resolved = lexical.resolve(strict=True)
    except (OSError, RuntimeError, TypeError, ValueError) as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
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
            old_descriptor = descriptor
            descriptor = next_descriptor
            os.close(old_descriptor)
        info = os.fstat(descriptor)
        if not stat.S_ISDIR(info.st_mode):
            _fail("repository root is not a directory")
        result = descriptor
        descriptor = None
        return result
    except Rigid221Card18PredicateCoverageV3Error:
        raise
    except OSError as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
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
    """Read a singly linked regular file with descriptor-relative no-follow."""

    parts = _validate_relative_path(relative)
    directory_flags, source_flags = _descriptor_flags()
    directory_descriptor: int | None = os.dup(root_descriptor)
    source_descriptor: int | None = None
    try:
        for component in parts[:-1]:
            next_descriptor = os.open(
                component,
                directory_flags,
                dir_fd=directory_descriptor,
            )
            old_descriptor = directory_descriptor
            directory_descriptor = next_descriptor
            os.close(old_descriptor)
        source_descriptor = os.open(
            parts[-1],
            source_flags,
            dir_fd=directory_descriptor,
        )
    except OSError as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            f"bound artifact is missing, nonregular, or symlinked: {relative}"
        ) from exc
    finally:
        if directory_descriptor is not None:
            try:
                os.close(directory_descriptor)
            except OSError:
                pass
    try:
        assert source_descriptor is not None
        info = os.fstat(source_descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            _fail(f"bound artifact is not a singly linked regular file: {relative}")
        chunks: list[bytes] = []
        while True:
            chunk = os.read(source_descriptor, 1 << 20)
            if not chunk:
                break
            chunks.append(chunk)
        return b"".join(chunks)
    except OSError as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            f"bound artifact could not be read: {relative}"
        ) from exc
    finally:
        if source_descriptor is not None:
            try:
                os.close(source_descriptor)
            except OSError:
                pass


def _artifact_record(payload: bytes, path: str) -> dict[str, Any]:
    return {
        "path": path,
        "bytes": len(payload),
        "sha256": hashlib.sha256(payload).hexdigest(),
    }


def _expected_v1_manifest_bindings() -> dict[str, Any]:
    fixed = _fixed_bindings()
    return {
        "candidate": {key: value for key, value in fixed["v1_candidate"].items()},
        "coverage_module": {
            "path": V1_COVERAGE_MODULE_PATH,
            "bytes": V1_COVERAGE_MODULE_BYTES,
            "sha256": V1_COVERAGE_MODULE_SHA256,
        },
        "labeled_projection_custody": {
            key: value for key, value in fixed["v1_labeled_projection_custody"].items()
        },
        "labeled_projection_source": {
            key: value for key, value in fixed["v1_labeled_projection_source"].items()
        },
        "labeled_projection_axiom_receipt": {
            key: value
            for key, value in fixed["v1_labeled_projection_axiom_receipt"].items()
        },
    }


def _validate_v1_manifest_payload(repo_root: Path, payload: bytes) -> None:
    value = _strict_json(payload)
    if type(value) is not dict or _canonical_json_bytes(value) != payload:
        _fail("v1 coverage manifest is not canonical JSON")
    if set(value) != _MANIFEST_FIELDS or value.get("schema") != V1_SCHEMA:
        _fail("v1 coverage manifest schema or fields are stale")
    digest = value.get("manifest_sha256")
    if type(digest) is not str or digest != V1_MANIFEST_SHA256:
        _fail("v1 coverage manifest self-hash is stale")
    body = dict(value)
    del body["manifest_sha256"]
    if _sha256_json(body) != digest:
        _fail("v1 coverage manifest body self-hash is wrong")
    if (
        value.get("bindings") != _expected_v1_manifest_bindings()
        or value.get("candidate_predicates")
        != list(coverage_v1.frozen_candidate_predicate_records())
        or value.get("lean_source_universe")
        != list(coverage_v1.frozen_lean_source_universe())
    ):
        _fail("v1 coverage manifest rows or bindings drifted")
    try:
        attested = coverage_v1.attest_predicate_coverage_manifest(repo_root, payload)
    except coverage_v1.Rigid221Card18PredicateCoverageError as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            "v1 coverage manifest did not attest live"
        ) from exc
    if attested != value:
        _fail("v1 coverage manifest cross-attested to different content")


def _validate_v2_manifest_payload(repo_root: Path, payload: bytes) -> None:
    value = _strict_json(payload)
    if type(value) is not dict or _canonical_json_bytes(value) != payload:
        _fail("v2 coverage manifest is not canonical JSON")
    if set(value) != _MANIFEST_FIELDS or value.get("schema") != V2_SCHEMA:
        _fail("v2 coverage manifest schema or fields are stale")
    digest = value.get("manifest_sha256")
    if type(digest) is not str or digest != V2_MANIFEST_SHA256:
        _fail("v2 coverage manifest self-hash is stale")
    body = dict(value)
    del body["manifest_sha256"]
    if _sha256_json(body) != digest:
        _fail("v2 coverage manifest body self-hash is wrong")
    try:
        attested = coverage_v2.attest_predicate_coverage_v2_manifest(repo_root, payload)
    except coverage_v2.Rigid221Card18PredicateCoverageV2Error as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            "v2 coverage manifest did not attest live"
        ) from exc
    if attested != value:
        _fail("v2 coverage manifest cross-attested to different content")


def _validate_crossed_axiom_receipt(payload: bytes) -> None:
    value = _strict_json(payload)
    fields = {
        "axioms",
        "exit_codes",
        "generated_utc",
        "lane_base",
        "lane_id",
        "lean_commands",
        "lean_declarations",
        "lean_module",
        "native_or_external_evidence_present",
        "receipt_sha256",
        "schema",
        "scope_note",
        "sorry_ax_present",
        "source_bytes",
        "source_path",
        "source_sha256",
        "tool",
    }
    if type(value) is not dict or set(value) != fields:
        _fail("crossed-incidence axiom receipt fields are malformed")
    required = {
        "schema": CROSSED_AXIOM_SCHEMA,
        "lean_commands": list(CROSSED_AXIOM_COMMANDS),
        "lean_declarations": list(CROSSED_AXIOM_DECLARATIONS),
        "lean_module": CROSSED_ROOT_MODULE,
        "source_path": CROSSED_SOURCE_PATH,
        "source_bytes": CROSSED_SOURCE_BYTES,
        "source_sha256": CROSSED_SOURCE_SHA256,
        "exit_codes": [0, 0, 0],
        "sorry_ax_present": False,
        "native_or_external_evidence_present": False,
    }
    for key, expected in required.items():
        if type(value[key]) is not type(expected) or value[key] != expected:
            _fail(f"crossed-incidence axiom receipt has stale or malformed {key}")
    if any(type(code) is not int for code in value["exit_codes"]):
        _fail("crossed-incidence axiom receipt exit codes are not exact integers")
    if (
        type(value["generated_utc"]) is not str
        or not value["generated_utc"]
        or type(value["lane_base"]) is not str
        or not value["lane_base"]
        or type(value["lane_id"]) is not str
        or not value["lane_id"]
        or type(value["scope_note"]) is not str
        or not value["scope_note"]
        or type(value["tool"]) is not str
        or not value["tool"]
        or type(value["axioms"]) is not list
        or any(
            type(item) is not dict
            or set(item) != {"name", "classification"}
            or any(type(part) is not str or not part for part in item.values())
            for item in value["axioms"]
        )
    ):
        _fail("crossed-incidence axiom receipt metadata or axioms are malformed")
    digest = value["receipt_sha256"]
    if type(digest) is not str or digest != CROSSED_AXIOM_RECEIPT_SHA256:
        _fail("crossed-incidence axiom receipt self-hash is stale")
    body = dict(value)
    del body["receipt_sha256"]
    if _sha256_json(body) != digest:
        _fail("crossed-incidence axiom receipt body self-hash is wrong")


def _validate_crossed_custody_receipt(repo_root: Path, payload: bytes) -> None:
    value = _strict_json(payload)
    if type(value) is not dict or _canonical_json_bytes(value) != payload:
        _fail("crossed-incidence custody receipt is not canonical JSON")
    try:
        attested = crossed_custody.attest_crossed_incidence_source_custody_receipt(
            repo_root,
            payload,
        )
    except crossed_custody.Rigid221Card18CrossedIncidenceCustodyError as exc:
        raise Rigid221Card18PredicateCoverageV3Error(
            "crossed-incidence source custody did not attest live"
        ) from exc
    if (
        attested != value
        or value.get("schema") != CROSSED_CUSTODY_SCHEMA
        or value.get("receipt_sha256") != CROSSED_CUSTODY_RECEIPT_SHA256
        or value.get("lean_root_modules") != [CROSSED_ROOT_MODULE]
        or _sha256_json(value.get("lean_source_manifest"))
        != CROSSED_CUSTODY_SOURCE_MANIFEST_SHA256
        or value.get("authentication", {}).get("lean_source_bytes_authenticated")
        is not True
        or any(
            flag is not False
            for key, flag in value.get("authentication", {}).items()
            if key != "lean_source_bytes_authenticated"
        )
    ):
        _fail("crossed-incidence custody receipt is stale or cross-attested")


def _attest_live_bindings(repo_root: Path) -> dict[str, Any]:
    _assert_frozen_configuration()
    paths = (
        CANDIDATE_PATH,
        V2_COVERAGE_MODULE_PATH,
        V2_MANIFEST_PATH,
        V1_COVERAGE_MODULE_PATH,
        V1_MANIFEST_PATH,
        LABELED_CUSTODY_PATH,
        LABELED_SOURCE_PATH,
        LABELED_AXIOM_PATH,
        CROSSED_SOURCE_PATH,
        CROSSED_AXIOM_PATH,
        CROSSED_CUSTODY_PATH,
        ENRICHMENT_SOURCE_PATH,
        COVERAGE_V3_MODULE_PATH,
    )
    root_descriptor = _open_repo_root(repo_root)
    try:
        payloads = {path: _read_bound_artifact(root_descriptor, path) for path in paths}
    finally:
        os.close(root_descriptor)
    expected = {
        CANDIDATE_PATH: (CANDIDATE_BYTES, CANDIDATE_SHA256),
        V2_COVERAGE_MODULE_PATH: (
            V2_COVERAGE_MODULE_BYTES,
            V2_COVERAGE_MODULE_SHA256,
        ),
        V2_MANIFEST_PATH: (V2_MANIFEST_BYTES, V2_MANIFEST_FILE_SHA256),
        V1_COVERAGE_MODULE_PATH: (
            V1_COVERAGE_MODULE_BYTES,
            V1_COVERAGE_MODULE_SHA256,
        ),
        V1_MANIFEST_PATH: (V1_MANIFEST_BYTES, V1_MANIFEST_FILE_SHA256),
        LABELED_CUSTODY_PATH: (
            LABELED_CUSTODY_BYTES,
            LABELED_CUSTODY_FILE_SHA256,
        ),
        LABELED_SOURCE_PATH: (LABELED_SOURCE_BYTES, LABELED_SOURCE_SHA256),
        LABELED_AXIOM_PATH: (LABELED_AXIOM_BYTES, LABELED_AXIOM_FILE_SHA256),
        CROSSED_SOURCE_PATH: (CROSSED_SOURCE_BYTES, CROSSED_SOURCE_SHA256),
        CROSSED_AXIOM_PATH: (CROSSED_AXIOM_BYTES, CROSSED_AXIOM_FILE_SHA256),
        CROSSED_CUSTODY_PATH: (
            CROSSED_CUSTODY_BYTES,
            CROSSED_CUSTODY_FILE_SHA256,
        ),
        ENRICHMENT_SOURCE_PATH: (ENRICHMENT_SOURCE_BYTES, ENRICHMENT_SOURCE_SHA256),
    }
    for path, (expected_bytes, expected_sha256) in expected.items():
        payload = payloads[path]
        if (
            len(payload) != expected_bytes
            or hashlib.sha256(payload).hexdigest() != expected_sha256
        ):
            _fail(f"live bound artifact bytes drifted: {path}")
    _validate_v1_manifest_payload(repo_root, payloads[V1_MANIFEST_PATH])
    _validate_v2_manifest_payload(repo_root, payloads[V2_MANIFEST_PATH])
    _validate_crossed_axiom_receipt(payloads[CROSSED_AXIOM_PATH])
    _validate_crossed_custody_receipt(repo_root, payloads[CROSSED_CUSTODY_PATH])
    return _artifact_record(payloads[COVERAGE_V3_MODULE_PATH], COVERAGE_V3_MODULE_PATH)


def _bindings_with_coverage(coverage_record: Mapping[str, Any]) -> dict[str, Any]:
    bindings = _fixed_bindings()
    bindings["coverage_v3_module"] = dict(coverage_record)
    return bindings


def _validate_binding_record(
    value: Any, expected: Mapping[str, Any], label: str
) -> None:
    if type(value) is not dict or set(value) != set(expected):
        _fail(f"{label} binding fields are malformed")
    for key, expected_value in expected.items():
        if type(value[key]) is not type(expected_value) or value[key] != expected_value:
            _fail(f"{label} binding {key} is stale or malformed")


def _validate_bindings(value: Any) -> None:
    fixed = _fixed_bindings()
    if type(value) is not dict or set(value) != {*fixed, "coverage_v3_module"}:
        _fail("predicate-coverage-v3 artifact binding fields are malformed")
    for key, expected in fixed.items():
        _validate_binding_record(value[key], expected, key)
    coverage_record = value["coverage_v3_module"]
    if (
        type(coverage_record) is not dict
        or set(coverage_record) != {"path", "bytes", "sha256"}
        or coverage_record.get("path") != COVERAGE_V3_MODULE_PATH
        or type(coverage_record.get("bytes")) is not int
        or coverage_record["bytes"] < 0
        or type(coverage_record.get("sha256")) is not str
        or _SHA256.fullmatch(coverage_record["sha256"]) is None
    ):
        _fail("predicate-coverage-v3 module binding is malformed")


def _validate_source_rows(rows: Any) -> dict[str, str]:
    if type(rows) is not list:
        _fail("v3 Lean-source universe is not a list")
    ids: list[str] = []
    statuses: dict[str, str] = {}
    for row in rows:
        if type(row) is not dict or set(row) != _SOURCE_FIELDS:
            _fail("v3 Lean-source row fields are malformed")
        canonical_id = row["id"]
        status = row["status"]
        representation = row["representation"]
        anchors = row["lean_anchors"]
        if (
            type(canonical_id) is not str
            or not canonical_id
            or type(status) is not str
            or status not in LEAN_STATUSES
            or type(representation) is not str
            or not representation
            or type(anchors) is not list
            or type(row["custody_digest"]) is not str
            or _SHA256.fullmatch(row["custody_digest"]) is None
            or type(row["noncomputable"]) is not bool
            or type(row["executable"]) is not bool
            or type(row["blocking"]) is not bool
        ):
            _fail("v3 Lean-source row values are malformed")
        for anchor in anchors:
            if (
                type(anchor) is not dict
                or set(anchor) != _ANCHOR_FIELDS
                or any(
                    type(anchor[field]) is not str or not anchor[field]
                    for field in _ANCHOR_FIELDS
                )
            ):
                _fail("v3 Lean declaration anchor is malformed")
        if anchors != sorted(
            anchors,
            key=lambda item: (item["module"], item["declaration"], item["kind"]),
        ) or len(
            {(item["module"], item["declaration"], item["kind"]) for item in anchors}
        ) != len(anchors):
            _fail("v3 Lean declaration anchors are reordered or duplicated")
        if status == ABSENT_FROM_LABELED_EXPORT:
            if (
                anchors
                or representation != "ABSENT"
                or row["executable"]
                or not row["blocking"]
            ):
                _fail("absent v3 Lean row gained an anchor or stopped blocking")
        elif not anchors:
            _fail("non-absent v3 Lean row lacks a declaration anchor")
        if status == PROP_AVAILABLE_NOT_EMITTED and (
            representation != "LEAN_PROP_ONLY"
            or row["executable"]
            or not row["blocking"]
        ):
            _fail("Prop-only v3 Lean row is malformed")
        if canonical_id == ENRICHMENT_SOURCE_ID:
            if row != _enrichment_source_row():
                _fail("enrichment Lean-source row is stale or escalated")
        elif canonical_id == PROFILE_SOURCE_ID:
            if row != _upgraded_profile_source_row():
                _fail("crossed-incidence profile source row is stale or escalated")
        elif row["custody_digest"] != LABELED_CUSTODY_SOURCE_MANIFEST_SHA256:
            _fail("non-delta v3 Lean row changed its v1 custody digest")
        ids.append(canonical_id)
        statuses[canonical_id] = status
    if ids != sorted(ids) or len(ids) != len(set(ids)):
        _fail("v3 Lean-source IDs are duplicated or reordered")
    if rows != _expected_lean_source_rows():
        _fail("v3 Lean-source universe differs from the frozen exact rows")
    if (
        _sha256_json(ids) != FROZEN_LEAN_SOURCE_ID_SET_SHA256
        or _sha256_json(rows) != FROZEN_V3_LEAN_SOURCE_ROWS_SHA256
    ):
        _fail("v3 Lean-source universe hash is stale")
    return statuses


def _validate_candidate_rows(rows: Any, source_statuses: Mapping[str, str]) -> None:
    if type(rows) is not list:
        _fail("v3 candidate predicate universe is not a list")
    representations_by_origin = {
        CALLER_ASSERTION: {
            "BOOLEAN_ASSERTION",
            "INTEGER_ASSERTION",
            "STATUS_ASSERTION",
        },
        CALLER_DATA: {"LABEL", "LABEL_SET", "ROLE_NAME"},
        LOCALLY_RECOMPUTED: {
            "DERIVED_BOOLEAN",
            "DERIVED_INTEGER",
            "DERIVED_ARM",
        },
    }
    ids: list[str] = []
    records_by_id: dict[str, dict[str, Any]] = {}
    for row in rows:
        if type(row) is not dict or set(row) != _CANDIDATE_FIELDS:
            _fail("v3 candidate predicate row fields are malformed")
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
            or representation not in representations_by_origin[origin]
            or type(source_ids) is not list
            or not source_ids
            or any(type(source_id) is not str for source_id in source_ids)
            or source_ids != sorted(source_ids)
            or len(source_ids) != len(set(source_ids))
            or any(source_id not in source_statuses for source_id in source_ids)
            or type(row["lean_coverage_status"]) is not str
            or type(arms) is not list
            or not arms
            or any(
                type(arm) is not str or arm not in ARMS or arm.lower() in {"all", "any"}
                for arm in arms
            )
            or arms != [arm for arm in ARMS if arm in arms]
            or len(arms) != len(set(arms))
            or type(dependencies) is not list
            or any(type(item) is not str for item in dependencies)
            or dependencies != sorted(dependencies)
            or len(dependencies) != len(set(dependencies))
            or canonical_id in dependencies
            or type(anchor) is not dict
            or set(anchor) != _CANDIDATE_ANCHOR_FIELDS
            or any(
                type(anchor[field]) is not str or not anchor[field]
                for field in _CANDIDATE_ANCHOR_FIELDS
            )
            or type(row["source_entitled"]) is not bool
            or row["source_entitled"]
            or type(row["hard_clause_admission"]) is not bool
            or row["hard_clause_admission"]
        ):
            _fail("v3 candidate row is malformed or escalated")
        referenced_statuses = {source_statuses[source_id] for source_id in source_ids}
        if len(referenced_statuses) != 1 or row["lean_coverage_status"] != next(
            iter(referenced_statuses)
        ):
            _fail("v3 candidate Lean status is not derived from source rows")
        algorithm = row["algorithm"]
        if origin == LOCALLY_RECOMPUTED:
            if (
                type(algorithm) is not dict
                or set(algorithm) != _ALGORITHM_FIELDS
                or type(algorithm["name"]) is not str
                or not algorithm["name"]
                or type(algorithm["inputs"]) is not list
                or not algorithm["inputs"]
                or any(
                    type(item) is not str or not item for item in algorithm["inputs"]
                )
                or algorithm["inputs"] != sorted(algorithm["inputs"])
                or len(algorithm["inputs"]) != len(set(algorithm["inputs"]))
            ):
                _fail("locally recomputed v3 row lacks an exact algorithm")
        elif algorithm is not None:
            _fail("caller-supplied v3 row gained a recomputation algorithm")
        ids.append(canonical_id)
        records_by_id[canonical_id] = row
    if ids != sorted(ids) or len(ids) != len(set(ids)):
        _fail("v3 candidate predicate IDs are duplicated or reordered")
    id_set = set(ids)
    for row in rows:
        for dependency in row["dependencies"]:
            if dependency not in id_set:
                _fail("v3 candidate dependency is unknown")
            if not set(row["arms"]).issubset(records_by_id[dependency]["arms"]):
                _fail("v3 candidate dependency is unavailable on a dependent arm")
    visiting: set[str] = set()
    visited: set[str] = set()

    def visit(node: str) -> None:
        if node in visiting:
            _fail("v3 candidate dependency graph contains a cycle")
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
        _fail("v3 candidate predicate universe differs from the frozen exact rows")
    if (
        _sha256_json(ids) != FROZEN_CANDIDATE_ID_SET_SHA256
        or _sha256_json(rows) != FROZEN_V3_CANDIDATE_ROWS_SHA256
    ):
        _fail("v3 candidate predicate universe hash is stale")


def validate_predicate_coverage_v3_manifest(
    manifest: Mapping[str, Any],
) -> dict[str, Any]:
    """Validate the exact v3 delta, bindings, admissions, and self-hash."""

    _assert_frozen_configuration()
    if not isinstance(manifest, Mapping):
        _fail("predicate-coverage-v3 manifest is not a mapping")
    snapshot = _strict_copy(manifest)
    if type(snapshot) is not dict or set(snapshot) != _MANIFEST_FIELDS:
        _fail("predicate-coverage-v3 manifest fields are malformed")
    if type(snapshot["schema"]) is not str or snapshot["schema"] != SCHEMA:
        _fail("predicate-coverage-v3 manifest schema is wrong")
    if type(snapshot["metadata"]) is not dict or snapshot["metadata"] != dict(
        _METADATA
    ):
        _fail("predicate-coverage-v3 lane metadata is wrong")
    _validate_bindings(snapshot["bindings"])
    source_statuses = _validate_source_rows(snapshot["lean_source_universe"])
    _validate_candidate_rows(snapshot["candidate_predicates"], source_statuses)
    summary = snapshot["coverage_summary"]
    if type(summary) is not dict or summary != _coverage_summary():
        _fail("predicate-coverage-v3 summary is stale")
    if (
        any(
            type(value) is not int
            for value in summary["candidate_origin_counts"].values()
        )
        or any(
            type(value) is not int for value in summary["lean_status_counts"].values()
        )
        or type(summary["candidate_count"]) is not int
        or type(summary["delta_count"]) is not int
        or type(summary["lean_source_count"]) is not int
    ):
        _fail("predicate-coverage-v3 counts have non-integer types")
    if Counter(row["origin"] for row in snapshot["candidate_predicates"]) != Counter(
        summary["candidate_origin_counts"]
    ):
        _fail("v3 candidate origin counts do not match rows")
    if Counter(row["status"] for row in snapshot["lean_source_universe"]) != Counter(
        summary["lean_status_counts"]
    ):
        _fail("v3 Lean status counts do not match rows")
    admission = snapshot["admission"]
    if type(admission) is not dict or set(admission) != set(_ADMISSION):
        _fail("predicate-coverage-v3 admission fields are malformed")
    for key, expected in _ADMISSION.items():
        if type(admission[key]) is not type(expected) or admission[key] != expected:
            _fail("predicate-coverage-v3 attempts a proof/solver-ready escalation")
    digest = snapshot["manifest_sha256"]
    if type(digest) is not str or _SHA256.fullmatch(digest) is None:
        _fail("predicate-coverage-v3 manifest self-hash is malformed")
    body = dict(snapshot)
    del body["manifest_sha256"]
    if _sha256_json(body) != digest:
        _fail("predicate-coverage-v3 manifest self-hash is wrong")
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


def build_predicate_coverage_v3_manifest(repo_root: Path) -> dict[str, Any]:
    """Freshly attest every v1 and crossed binding and build the v3 ledger."""

    coverage_record = _attest_live_bindings(repo_root)
    body = _manifest_body(coverage_record)
    return validate_predicate_coverage_v3_manifest(
        {**body, "manifest_sha256": _sha256_json(body)}
    )


def encode_predicate_coverage_v3_manifest(manifest: Mapping[str, Any]) -> bytes:
    """Return the unique canonical UTF-8 encoding of a valid v3 manifest."""

    _assert_frozen_configuration()
    return _canonical_json_bytes(validate_predicate_coverage_v3_manifest(manifest))


def parse_predicate_coverage_v3_manifest(payload: bytes) -> dict[str, Any]:
    """Parse duplicate-free strict JSON and require its canonical bytes."""

    _assert_frozen_configuration()
    if type(payload) is not bytes:
        _fail("predicate-coverage-v3 payload is not immutable bytes")
    value = _strict_json(payload)
    if _canonical_json_bytes(value) != payload:
        _fail("predicate-coverage-v3 payload is not canonical JSON")
    return validate_predicate_coverage_v3_manifest(value)


def attest_predicate_coverage_v3_manifest(
    repo_root: Path,
    payload: bytes,
) -> dict[str, Any]:
    """Bind canonical v3 bytes to fresh no-follow reads and live custody."""

    parsed = parse_predicate_coverage_v3_manifest(payload)
    live_coverage = _attest_live_bindings(repo_root)
    if parsed["bindings"]["coverage_v3_module"] != live_coverage:
        _fail("predicate-coverage-v3 module live hash is stale")
    fresh_body = _manifest_body(live_coverage)
    fresh = {**fresh_body, "manifest_sha256": _sha256_json(fresh_body)}
    if payload != _canonical_json_bytes(fresh):
        _fail("predicate-coverage-v3 manifest is not live-current")
    return parsed
