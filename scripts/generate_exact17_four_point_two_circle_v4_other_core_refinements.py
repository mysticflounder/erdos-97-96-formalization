"""Promote the two non-FourPoint formalized cores from the exact-17 v4 ledger."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections.abc import Mapping
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
LEDGER = (
    REPO
    / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "refinements-sat-portfolio-v4-20260822/sat-profile-portfolio-v4/artifacts/"
    "candidate-ledger.json"
)
LEAN_OUTPUT = (
    REPO
    / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V4OtherCoreRefinements.lean"
)
LEDGER_SHA256 = "a3f7e3b098e13831684d8c219d0d4e632ff9a1196f5d875e3f1b893f25ffc828"
LEAN_SHA256 = "730b3de4ff25e560a1eca1ee249efe6c010958bf169f50c7591cbf6cc165c3e7"
LEDGER_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "wave-only-candidate-ledger/v2"
)
CANDIDATE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "wave-only-candidate/v1"
)
FAMILY = "formalized-core-bank"
N = 17
PARENT_CLAUSES = 7_409_516
SUFFIX_CLAUSES = 8
ROOT_CLAUSES = PARENT_CLAUSES + SUFFIX_CLAUSES
EXPECTED_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXPECTED_EXACT_PARENT_MULTIPLICITY = (0, 0, 0, 0, 0, 0, 0, 0)
EXPECTED_PARENT_SUBSUMER_COUNTS = (0, 0, 0, 0, 0, 0, 0, 0)
EXPECTED_PARENT_SUBSUMER_LENGTHS = (None, None, None, None, None, None, None, None)

TOP_KEYS = {
    "candidates",
    "candidates_examined",
    "cnf_sha256",
    "complete_no_candidates",
    "decoded_selectors",
    "family_inventory",
    "job_id",
    "manifest_sha256",
    "model_sha256",
    "portfolio_cell_id",
    "producer_manifest_sha256",
    "scan_complete",
    "scanner",
    "scanner_dependencies",
    "schema",
    "source_valid_family_inventory",
    "source_valid_only",
    "status",
    "variable_map_sha256",
    "wave_manifest_sha256",
}
CANDIDATE_KEYS = {
    "candidate_id",
    "family",
    "lean_consumer",
    "payload",
    "record_sha256",
    "schema",
    "source_valid",
    "support",
}
EXPECTED_FAMILY_INVENTORY = {
    "complete_equality_component_counts": {
        "candidate_count": 0,
        "component_count": 85,
        "oriented_edge_count": 272,
        "pair_count": 136,
        "row_transition_count": 204,
        "unordered_edge_count": 136,
    },
    "excluded_diagnostic_stage_counts": {
        "equality-convex-two-kalmanson-cancellation": 1
    },
    "family_candidate_counts": {
        FAMILY: 4,
        "perpendicular-bisector-equality-component": 0,
        "two-kalmanson-cancellation": 59,
    },
    "formalized_stage_counts": {
        "equality-convex-eight-point-five-selected-row-kalmanson-m": 1,
        "equality-convex-four-point-two-circle-bisector-order": 1,
        "equality-convex-four-point-two-circle-bisector-order-reverse": 1,
        "equality-convex-two-kalmanson-cancellation": 1,
        "equality-duplicate-center": 1,
    },
    "two_kalmanson_pairing_counts": {
        "forward_record_count": 201,
        "minimal_forward_support_count": 59,
        "minimal_paired_union_count": 59,
        "minimal_reverse_support_count": 59,
        "paired_union_count": 1728,
        "reverse_record_count": 201,
    },
}
EXPECTED_TOP_VALUES = {
    "cnf_sha256": "24415eae34594b8256f0254fd65793ab32d62909edd84ba85ec09375dab6b59f",
    "job_id": "b9190a9a-397d-41ca-82a9-20c0385d44dc",
    "model_sha256": "30eb299b7093a471b43b46403c442efa88898765c340ff63c40f834c3d233922",
    "portfolio_cell_id": (
        "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
        "next-center-02-physical-none-sat-profile-v1"
    ),
    "producer_manifest_sha256": (
        "b2471486b6f29a67495c0f1d2ae73b49825374273d9a552c6e65ee672019596d"
    ),
    "variable_map_sha256": (
        "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
    ),
    "wave_manifest_sha256": (
        "7afc95013632d781522a4bf9fbb6b5d5b3e7596f6f73b203ffc71c258d76b453"
    ),
}
EXPECTED_TARGETS = {
    "duplicate": {
        "candidate_id": (
            "formalized-core-bank:"
            "0bb873f35f1760015d4c7b037e4396c9bf4db8469bce4dfd7ed32859fcd2819f"
        ),
        "record_sha256": (
            "9941fc54d7a43eb8ce1c054793380cb80d7503a6067e06e7f5fd0267a99ee427"
        ),
        "consumer": "Problem97.Census554.false_of_metricCoreAlternative",
        "record": {
            "core": {"centers": [1, 11], "triple": [0, 8, 10]},
            "cyclic_orientation": "invariant",
            "lean_consumer": "Problem97.Census554.false_of_metricCoreAlternative",
            "orientation": "invariant",
            "source": "metric-bank",
            "stage": "equality-duplicate-center",
        },
        "canonical": {"centers": [14, 3], "triple": [0, 2, 4]},
        "hits": ((0, 3), (0, 15), (3, 2), (3, 4), (3, 15),
                 (14, 0), (14, 2), (14, 4), (15, 0), (15, 3)),
    },
    "schema_m": {
        "candidate_id": (
            "formalized-core-bank:"
            "160db1e102e7ec93dd93c33ca15192e53e07ee9b81d17b43b21c70bfcbe834bd"
        ),
        "record_sha256": (
            "6441c261b415e4a08babfc34edc9d577050afac53cb7675878bae52195ffa6b4"
        ),
        "consumer": (
            "Problem97.CapCrossingKalmansonBridge."
            "false_of_five_selected_rows_in_eight_ccw_order_M"
        ),
        "record": {
            "core": {"a": 0, "b": 6, "c": 8, "d": 11, "e": 10,
                     "f": 15, "g": 4, "h": 13},
            "cyclic_orientation": "forward",
            "lean_consumer": (
                "Problem97.CapCrossingKalmansonBridge."
                "false_of_five_selected_rows_in_eight_ccw_order_M"
            ),
            "metadata": {
                "boundary_rotation_start": 0,
                "lean_module": "Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas",
                "requires_rotated_ccw_enumeration": False,
            },
            "orientation": "forward",
            "source": "metric-bank-direct-rows",
            "stage": "equality-convex-eight-point-five-selected-row-kalmanson-m",
        },
        "canonical": {"a": 0, "b": 1, "c": 2, "d": 3, "e": 4,
                      "f": 9, "g": 12, "h": 15},
        "hits": ((0, 1), (0, 3), (0, 15), (12, 0), (12, 1), (3, 2),
                 (3, 15), (4, 2), (4, 9), (1, 0), (1, 9)),
    },
}


class PromotionError(ValueError):
    """The authenticated candidate ledger cannot be promoted."""


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode()


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def self_hash(value: Mapping[str, Any], field: str) -> str:
    return sha256_bytes(
        canonical_json_bytes({key: item for key, item in value.items() if key != field})
    )


def _reject_constant(value: str) -> None:
    raise PromotionError(f"non-finite JSON constant: {value}")


def _object_without_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise PromotionError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def strict_json(raw: bytes) -> dict[str, Any]:
    try:
        value = json.loads(
            raw,
            object_pairs_hook=_object_without_duplicates,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise PromotionError("invalid candidate ledger JSON") from exc
    if type(value) is not dict:
        raise PromotionError("candidate ledger must be an object")
    return value


def require_exact_keys(value: Any, expected: set[str], label: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != expected:
        raise PromotionError(f"{label} schema drifted")
    return value


def candidate_identity_material(candidate: Mapping[str, Any]) -> dict[str, Any]:
    return {
        key: candidate.get(key)
        for key in ("schema", "family", "source_valid", "lean_consumer", "support", "payload")
    }


def candidate_id(candidate: Mapping[str, Any]) -> str:
    digest = sha256_bytes(canonical_json_bytes(candidate_identity_material(candidate)))
    return f"{candidate.get('family')}:{digest}"


def load_authenticated_ledger(path: Path = LEDGER) -> dict[str, Any]:
    if path.resolve() != LEDGER.resolve():
        raise PromotionError("candidate ledger path drifted")
    raw = path.read_bytes()
    if sha256_bytes(raw) != LEDGER_SHA256:
        raise PromotionError("candidate ledger hash drifted")
    return strict_json(raw)


def _decoded_rows(ledger: Mapping[str, Any]) -> tuple[dict[int, tuple[int, ...]], dict[int, int]]:
    decoded = ledger.get("decoded_selectors")
    if type(decoded) is not dict or set(decoded) != {
        "NamedOrder", "assignment_sha256", "nextCenter", "order", "rows"
    }:
        raise PromotionError("decoded selector schema drifted")
    if decoded["NamedOrder"] != 0 or decoded["nextCenter"] != 2:
        raise PromotionError("decoded selector binding drifted")
    if tuple(decoded["order"]) != EXPECTED_ORDER:
        raise PromotionError("decoded named order drifted")
    raw_rows = decoded["rows"]
    if type(raw_rows) is not dict or set(raw_rows) != {str(i) for i in range(N)}:
        raise PromotionError("decoded row table drifted")
    rows: dict[int, tuple[int, ...]] = {}
    for center in range(N):
        row = raw_rows[str(center)]
        if type(row) is not list or len(row) != 4 or row != sorted(set(row)):
            raise PromotionError("decoded selected row drifted")
        if any(type(point) is not int or not 0 <= point < N for point in row):
            raise PromotionError("decoded selected row label drifted")
        rows[center] = tuple(row)
    inverse = {physical: position for position, physical in enumerate(EXPECTED_ORDER)}
    if len(inverse) != N:
        raise PromotionError("decoded named order is not a permutation")
    return rows, inverse


def _canonical_record(record: Mapping[str, Any], inverse: Mapping[int, int]) -> dict[str, Any]:
    core = record["core"]
    if set(core) == {"centers", "triple"}:
        return {
            "centers": [inverse[value] for value in core["centers"]],
            "triple": [inverse[value] for value in core["triple"]],
        }
    if set(core) == set("abcdefgh"):
        return {key: inverse[core[key]] for key in "abcdefgh"}
    raise PromotionError("target core schema drifted")


def validate_ledger(ledger: Mapping[str, Any]) -> dict[str, Mapping[str, Any]]:
    require_exact_keys(ledger, TOP_KEYS, "ledger")
    if (
        ledger["schema"] != LEDGER_SCHEMA
        or ledger["status"] != "COMPLETE"
        or ledger["scan_complete"] is not True
        or ledger["source_valid_only"] is not True
        or ledger["complete_no_candidates"] is not False
        or ledger["candidates_examined"] != 63
    ):
        raise PromotionError("ledger schema/status/count drifted")
    if ledger["manifest_sha256"] != self_hash(ledger, "manifest_sha256"):
        raise PromotionError("ledger self-hash drifted")
    if ledger["family_inventory"] != EXPECTED_FAMILY_INVENTORY:
        raise PromotionError("family inventory drifted")
    if ledger["source_valid_family_inventory"] != [
        FAMILY,
        "perpendicular-bisector-equality-component",
        "two-kalmanson-cancellation",
    ]:
        raise PromotionError("source-valid family inventory drifted")
    for key, expected in EXPECTED_TOP_VALUES.items():
        if ledger[key] != expected:
            raise PromotionError(f"top-level {key} drifted")
    candidates = ledger["candidates"]
    if type(candidates) is not list or len(candidates) != 63:
        raise PromotionError("candidate array drifted")
    targets_by_id = {item["candidate_id"]: tag for tag, item in EXPECTED_TARGETS.items()}
    selected: dict[str, Mapping[str, Any]] = {}
    family_counts = {
        FAMILY: 0,
        "perpendicular-bisector-equality-component": 0,
        "two-kalmanson-cancellation": 0,
    }
    for index, candidate in enumerate(candidates):
        require_exact_keys(candidate, CANDIDATE_KEYS, f"candidate[{index}]")
        if candidate["schema"] != CANDIDATE_SCHEMA or candidate["source_valid"] is not True:
            raise PromotionError("candidate schema/source-valid drifted")
        if candidate["record_sha256"] != self_hash(candidate, "record_sha256"):
            raise PromotionError("candidate record hash drifted")
        if candidate["candidate_id"] != candidate_id(candidate):
            raise PromotionError("candidate id drifted")
        family = candidate["family"]
        if family not in family_counts:
            raise PromotionError("unexpected candidate family")
        family_counts[family] += 1
        tag = targets_by_id.get(candidate["candidate_id"])
        if tag is not None:
            selected[tag] = candidate
    if family_counts != {FAMILY: 4, "perpendicular-bisector-equality-component": 0,
                         "two-kalmanson-cancellation": 59}:
        raise PromotionError("candidate family counts drifted")
    if set(selected) != set(EXPECTED_TARGETS):
        raise PromotionError("target candidate selection drifted")
    rows, inverse = _decoded_rows(ledger)
    full_support = sorted(
        [[center, point] for center in range(N) for point in rows[center]],
        key=canonical_json_bytes,
    )
    for tag, candidate in selected.items():
        expected = EXPECTED_TARGETS[tag]
        if candidate["family"] != FAMILY or candidate["support"] != full_support:
            raise PromotionError("target source support drifted")
        if candidate["record_sha256"] != expected["record_sha256"]:
            raise PromotionError("target record identity drifted")
        if candidate["lean_consumer"] != expected["consumer"]:
            raise PromotionError("target consumer drifted")
        payload = require_exact_keys(
            candidate["payload"],
            {"canonical_bank_record", "full_selected_row_support_replay"},
            "target payload",
        )
        if payload["full_selected_row_support_replay"] is not True:
            raise PromotionError("target full-support replay flag drifted")
        record = payload["canonical_bank_record"]
        if record != expected["record"]:
            raise PromotionError("target canonical bank record drifted")
        if _canonical_record(record, inverse) != expected["canonical"]:
            raise PromotionError("target physical-to-canonical map drifted")
        for center, point in expected["hits"]:
            physical_center = EXPECTED_ORDER[center]
            physical_point = EXPECTED_ORDER[point]
            if physical_point not in rows[physical_center]:
                raise PromotionError("target clause uses an unauthenticated positive hit")
    return selected


def _label_at_position(order: int, position: int) -> int:
    tables = (
        EXPECTED_ORDER,
        (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    )
    return tables[order][position]


def dimacs_suffix_clauses() -> tuple[tuple[int, ...], ...]:
    clauses: list[tuple[int, ...]] = []
    for tag in ("duplicate", "schema_m"):
        hits = EXPECTED_TARGETS[tag]["hits"]
        for order in range(2):
            for reverse in (False, True):
                def oriented(
                    position: int, order: int = order, reverse: bool = reverse
                ) -> int:
                    return _label_at_position(order, N - 1 - position if reverse else position)

                clauses.append(
                    tuple([-307 - order]
                          + [-(1 + N * oriented(center) + oriented(point))
                             for center, point in hits])
                )
    return tuple(clauses)


def verify_parent_novelty(parent_cell_cnf: Path) -> None:
    exact = [0] * SUFFIX_CLAUSES
    subsumers = [0] * SUFFIX_CLAUSES
    witness_lengths: list[int | None] = [None] * SUFFIX_CLAUSES
    suffix = dimacs_suffix_clauses()
    suffix_sets = [set(clause) for clause in suffix]
    with parent_cell_cnf.open(encoding="ascii") as handle:
        for line in handle:
            if line.startswith("p "):
                break
        else:
            raise PromotionError("parent witness CNF lacks a header")
        processed = 0
        for line in handle:
            if processed == PARENT_CLAUSES:
                break
            fields = tuple(int(item) for item in line.split())
            if not fields or fields[-1] != 0:
                raise PromotionError("malformed parent witness CNF clause")
            clause = fields[:-1]
            processed += 1
            clause_set = set(clause)
            for suffix_index, suffix_set in enumerate(suffix_sets):
                if clause == suffix[suffix_index]:
                    exact[suffix_index] += 1
                if clause_set <= suffix_set:
                    subsumers[suffix_index] += 1
                    if witness_lengths[suffix_index] is None:
                        witness_lengths[suffix_index] = len(clause)
        if processed != PARENT_CLAUSES:
            raise PromotionError("parent witness CNF ended before the parent root")
    if tuple(exact) != EXPECTED_EXACT_PARENT_MULTIPLICITY:
        raise PromotionError("exact parent novelty drifted")
    if tuple(subsumers) != EXPECTED_PARENT_SUBSUMER_COUNTS:
        raise PromotionError("parent subsumption novelty drifted")
    if tuple(witness_lengths) != EXPECTED_PARENT_SUBSUMER_LENGTHS:
        raise PromotionError("parent subsumer length drifted")


LEAN_SOURCE = '/-\nCopyright (c) 2026 Adam McKenna. All rights reserved.\nReleased under Apache 2.0 license as described in the LICENSE file.\nAuthors: Adam McKenna\n-/\n\nimport Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements\nimport Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas\n\n/-!\n# Source-valid duplicate-center and schema-M refinements from the exact-seventeen v4 ledger\n\nThe authenticated v4 survivor supplies one duplicate-center core and one five-row\nschema-M obstruction. Each source adapter uses only the explicitly listed positive\nselected-row hits before its four order/orientation clauses are appended.\n-/\n\nopen scoped EuclideanGeometry\n\nnamespace Problem97\nnamespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinements\n\nopen ATailBlockerVExactSeventeenSourceNormalForm\nopen ATailBlockerVExactSeventeenSourceCnf\nopen ATailBlockerVExactSeventeenSourceCnfCdefg\nopen ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation\nopen ATailFrontierLiveClosure.GenericRowNogoodCertificate\nopen Census554.EqualityCore\nopen ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements\n\nprivate abbrev priorOrientedHits :=\n  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits\n\nprivate abbrev occurrenceClause :=\n  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause\n\nprivate abbrev occurrenceClauses :=\n  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses\n\nprivate theorem sourceAssign_occurrenceClauses {A : Finset ℝ²}\n    (source : SourceRealization A) (hits : List Hit)\n    (hvalid : ∀ order direction,\n      Std.Sat.CNF.Clause.eval (sourceAssign source.model)\n        (occurrenceClause hits order direction) = true) :\n    ∀ clause ∈ occurrenceClauses hits,\n      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by\n  intro clause hclause\n  simp only [occurrenceClauses,\n    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,\n    List.mem_flatMap, List.mem_map] at hclause\n  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause\n  exact hvalid order direction\n\n/- ## Duplicate-center obstruction -/\n\ndef duplicateCenterHits : List Hit :=\n  [(0, 3), (0, 15), (3, 2), (3, 4), (3, 15),\n    (14, 0), (14, 2), (14, 4), (15, 0), (15, 3)]\n\ndef duplicateCenterForwardChoices : List (RowChoice Label) :=\n  [{ center := 0, support := {3, 15} },\n    { center := 3, support := {2, 4, 15} },\n    { center := 14, support := {0, 2, 4} },\n    { center := 15, support := {0, 3} }]\n\ndef duplicateCenterReflectedChoices : List (RowChoice Label) :=\n  [{ center := 1, support := {13, 16} },\n    { center := 2, support := {12, 14, 16} },\n    { center := 13, support := {1, 12, 14} },\n    { center := 16, support := {1, 13} }]\n\ntheorem duplicateCenterForwardCover :\n    ∀ choice ∈ duplicateCenterForwardChoices, ∀ point ∈ choice.support,\n      (choice.center, point) ∈ duplicateCenterHits := by\n  decide\n\ntheorem duplicateCenterReflectedCover :\n    ∀ choice ∈ duplicateCenterReflectedChoices, ∀ point ∈ choice.support,\n      (Fin.rev choice.center, Fin.rev point) ∈ duplicateCenterHits := by\n  decide\n\ndef duplicateCenterForwardData : DuplicateCenterData Label := {\n  p := 0\n  q := 2\n  r := 4\n  a := 14\n  b := 3\n  ap_aq := ⟨(14, 0), [.row 14 0 2], (14, 2)⟩\n  ap_ar := ⟨(14, 0), [.row 14 0 4], (14, 4)⟩\n  bp_bq := ⟨(3, 0),\n    [.flip 3 0, .row 0 3 15, .flip 0 15, .row 15 0 3,\n      .flip 15 3, .row 3 15 2],\n    (3, 2)⟩\n  bp_br := ⟨(3, 0),\n    [.flip 3 0, .row 0 3 15, .flip 0 15, .row 15 0 3,\n      .flip 15 3, .row 3 15 4],\n    (3, 4)⟩ }\n\ndef duplicateCenterReflectedData : DuplicateCenterData Label := {\n  p := 16\n  q := 14\n  r := 12\n  a := 2\n  b := 13\n  ap_aq := ⟨(2, 16), [.row 2 16 14], (2, 14)⟩\n  ap_ar := ⟨(2, 16), [.row 2 16 12], (2, 12)⟩\n  bp_bq := ⟨(13, 16),\n    [.flip 13 16, .row 16 13 1, .flip 16 1, .row 1 16 13,\n      .flip 1 13, .row 13 1 14],\n    (13, 14)⟩\n  bp_br := ⟨(13, 16),\n    [.flip 13 16, .row 16 13 1, .flip 16 1, .row 1 16 13,\n      .flip 1 13, .row 13 1 12],\n    (13, 12)⟩ }\n\ntheorem duplicateCenterForwardData_check :\n    duplicateCenterForwardData.check duplicateCenterForwardChoices = true := by\n  native_decide\n\ntheorem duplicateCenterReflectedData_check :\n    duplicateCenterReflectedData.check duplicateCenterReflectedChoices = true := by\n  native_decide\n\nprivate theorem false_of_duplicateCenterHits {A : Finset ℝ²}\n    (source : SourceRealization A) (order : NamedOrder)\n    (direction : Orientation) (horder : order = source.model.order)\n    (hall : ∀ hit ∈ priorOrientedHits duplicateCenterHits order direction,\n      hit.2 ∈ source.model.selected hit.1) : False := by\n  subst order\n  have hreal := sourceRealizesBoundaryPattern source\n  by_cases hsame : source.orientation = direction\n  · have hrows :=\n      ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same\n        source source.model.order direction rfl hsame duplicateCenterHits\n        duplicateCenterForwardChoices duplicateCenterForwardCover hall\n    rcases nonempty_duplicateCenterCore_of_positiveCheck hrows duplicateCenterForwardData\n      duplicateCenterForwardData_check with ⟨core⟩\n    exact Census554.EqualityCore.not_realizes_of_duplicateCenterCore core\n      ⟨source.boundary, hreal⟩\n  · have hrows :=\n      ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne\n        source source.model.order direction rfl hsame duplicateCenterHits\n        duplicateCenterReflectedChoices duplicateCenterReflectedCover hall\n    rcases nonempty_duplicateCenterCore_of_positiveCheck hrows duplicateCenterReflectedData\n      duplicateCenterReflectedData_check with ⟨core⟩\n    exact Census554.EqualityCore.not_realizes_of_duplicateCenterCore core\n      ⟨source.boundary, hreal⟩\n\ndef duplicateCenterClause (order : NamedOrder) (direction : Orientation) :\n    Std.Sat.CNF.Clause Atom := occurrenceClause duplicateCenterHits order direction\n\ndef duplicateCenterClauses : Std.Sat.CNF Atom := occurrenceClauses duplicateCenterHits\n\ntheorem sourceAssign_duplicateCenterClause {A : Finset ℝ²}\n    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :\n    Std.Sat.CNF.Clause.eval (sourceAssign source.model)\n      (duplicateCenterClause order direction) = true := by\n  apply sourceAssign_nogoodClause\n  intro horder hall\n  exact false_of_duplicateCenterHits source order direction horder.symm hall\n\n/- ## Schema-M five-row obstruction -/\n\ndef schemaMHits : List Hit :=\n  [(0, 1), (0, 3), (0, 15), (12, 0), (12, 1), (3, 2),\n    (3, 15), (4, 2), (4, 9), (1, 0), (1, 9)]\n\ndef schemaMForwardChoices : List (RowChoice Label) :=\n  [{ center := 0, support := {1, 3, 15} },\n    { center := 12, support := {0, 1} },\n    { center := 3, support := {2, 15} },\n    { center := 4, support := {2, 9} },\n    { center := 1, support := {0, 9} }]\n\ndef schemaMReflectedChoices : List (RowChoice Label) :=\n  [{ center := 16, support := {1, 13, 15} },\n    { center := 4, support := {15, 16} },\n    { center := 13, support := {1, 14} },\n    { center := 12, support := {7, 14} },\n    { center := 15, support := {7, 16} }]\n\ntheorem schemaMForwardCover :\n    ∀ choice ∈ schemaMForwardChoices, ∀ point ∈ choice.support,\n      (choice.center, point) ∈ schemaMHits := by\n  decide\n\ntheorem schemaMReflectedCover :\n    ∀ choice ∈ schemaMReflectedChoices, ∀ point ∈ choice.support,\n      (Fin.rev choice.center, Fin.rev point) ∈ schemaMHits := by\n  decide\n\nprivate theorem labelIndex_sourceIndexEquiv_symm {A : Finset ℝ²}\n    (source : SourceRealization A) (index : Label) :\n    source.labelIndex\n        ((sourceIndexEquiv source.model.order source.orientation).symm index) = index := by\n  rw [source.labelIndex_eq]\n  exact (sourceIndexEquiv source.model.order source.orientation).apply_symm_apply index\n\nprivate theorem selectedFourClass_support_cast {A : Finset ℝ²} {center₁ center₂ : ℝ²}\n    (hcenter : center₁ = center₂) (row : SelectedFourClass A center₁) :\n    (hcenter ▸ row).support = row.support := by\n  subst center₂\n  rfl\n\nprivate noncomputable def selectedRowAtPosition {A : Finset ℝ²}\n    (source : SourceRealization A) (index : Label) :\n    SelectedFourClass A (source.cardBoundary (source.toCardIndex index)) :=\n  let row := source.selectedRow\n    ((sourceIndexEquiv source.model.order source.orientation).symm index)\n  have hcenter :\n      source.boundary\n          (source.labelIndex\n            ((sourceIndexEquiv source.model.order source.orientation).symm index)) =\n        source.cardBoundary (source.toCardIndex index) := by\n    rw [SourceRealization.cardBoundary_toCardIndex,\n      labelIndex_sourceIndexEquiv_symm]\n  hcenter ▸ row\n\n@[simp] private theorem selectedRowAtPosition_support {A : Finset ℝ²}\n    (source : SourceRealization A) (index : Label) :\n    (selectedRowAtPosition source index).support =\n      (source.selectedRow\n        ((sourceIndexEquiv source.model.order source.orientation).symm index)).support := by\n  unfold selectedRowAtPosition\n  apply selectedFourClass_support_cast\n\nprivate theorem mem_selectedRowAtPosition_of_positiveRows {A : Finset ℝ²}\n    (source : SourceRealization A) (choices : List (RowChoice Label))\n    (hrows : PositiveRowsMatch\n      (reindexRowPattern\n        (sourceIndexEquiv source.model.order source.orientation)\n        source.model.selected) choices)\n    (choice : RowChoice Label) (hchoice : choice ∈ choices)\n    (point : Label) (hpoint : point ∈ choice.support) :\n    source.cardBoundary (source.toCardIndex point) ∈\n      (selectedRowAtPosition source choice.center).support := by\n  have hmem := hrows choice hchoice hpoint\n  rw [mem_reindexRowPattern_iff] at hmem\n  have hsource := source.mem_selectedRow_of_mem_model hmem\n  rw [selectedRowAtPosition_support, SourceRealization.cardBoundary_toCardIndex]\n  simpa only [labelIndex_sourceIndexEquiv_symm] using hsource\n\nprivate theorem false_of_schemaMForwardRows {A : Finset ℝ²}\n    (source : SourceRealization A)\n    (hrows : PositiveRowsMatch\n      (reindexRowPattern\n        (sourceIndexEquiv source.model.order source.orientation)\n        source.model.selected) schemaMForwardChoices) : False := by\n  apply CapCrossingKalmansonBridge.false_of_five_selected_rows_in_eight_ccw_order_M\n    source.carrier_convexIndep source.cardBoundary_injective source.cardBoundary_image\n    source.cardBoundary_ccw\n    (source.toCardIndex_lt (by decide : (0 : Label) < 1))\n    (source.toCardIndex_lt (by decide : (1 : Label) < 2))\n    (source.toCardIndex_lt (by decide : (2 : Label) < 3))\n    (source.toCardIndex_lt (by decide : (3 : Label) < 4))\n    (source.toCardIndex_lt (by decide : (4 : Label) < 9))\n    (source.toCardIndex_lt (by decide : (9 : Label) < 12))\n    (source.toCardIndex_lt (by decide : (12 : Label) < 15))\n    (selectedRowAtPosition source 0) (selectedRowAtPosition source 12)\n    (selectedRowAtPosition source 3) (selectedRowAtPosition source 4)\n    (selectedRowAtPosition source 1)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 0, support := {1, 3, 15} } (by decide) 3 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 0, support := {1, 3, 15} } (by decide) 1 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 0, support := {1, 3, 15} } (by decide) 15 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 12, support := {0, 1} } (by decide) 0 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 12, support := {0, 1} } (by decide) 1 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 3, support := {2, 15} } (by decide) 2 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 3, support := {2, 15} } (by decide) 15 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 4, support := {2, 9} } (by decide) 2 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 4, support := {2, 9} } (by decide) 9 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 1, support := {0, 9} } (by decide) 0 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMForwardChoices hrows\n      { center := 1, support := {0, 9} } (by decide) 9 (by decide)\n\nprivate theorem false_of_schemaMReflectedRows {A : Finset ℝ²}\n    (source : SourceRealization A)\n    (hrows : PositiveRowsMatch\n      (reindexRowPattern\n        (sourceIndexEquiv source.model.order source.orientation)\n        source.model.selected) schemaMReflectedChoices) : False := by\n  apply\n    CapCrossingKalmansonBridge.false_of_five_selected_rows_in_eight_ccw_order_M_of_decreasing\n    source.carrier_convexIndep source.cardBoundary_injective source.cardBoundary_image\n    source.cardBoundary_ccw\n    (source.toCardIndex_lt (by decide : (15 : Label) < 16))\n    (source.toCardIndex_lt (by decide : (14 : Label) < 15))\n    (source.toCardIndex_lt (by decide : (13 : Label) < 14))\n    (source.toCardIndex_lt (by decide : (12 : Label) < 13))\n    (source.toCardIndex_lt (by decide : (7 : Label) < 12))\n    (source.toCardIndex_lt (by decide : (4 : Label) < 7))\n    (source.toCardIndex_lt (by decide : (1 : Label) < 4))\n    (selectedRowAtPosition source 16) (selectedRowAtPosition source 4)\n    (selectedRowAtPosition source 13) (selectedRowAtPosition source 12)\n    (selectedRowAtPosition source 15)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 16, support := {1, 13, 15} } (by decide) 13 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 16, support := {1, 13, 15} } (by decide) 15 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 16, support := {1, 13, 15} } (by decide) 1 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 4, support := {15, 16} } (by decide) 16 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 4, support := {15, 16} } (by decide) 15 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 13, support := {1, 14} } (by decide) 14 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 13, support := {1, 14} } (by decide) 1 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 12, support := {7, 14} } (by decide) 14 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 12, support := {7, 14} } (by decide) 7 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 15, support := {7, 16} } (by decide) 16 (by decide)\n  · exact mem_selectedRowAtPosition_of_positiveRows source schemaMReflectedChoices hrows\n      { center := 15, support := {7, 16} } (by decide) 7 (by decide)\n\nprivate theorem false_of_schemaMHits {A : Finset ℝ²}\n    (source : SourceRealization A) (order : NamedOrder)\n    (direction : Orientation) (horder : order = source.model.order)\n    (hall : ∀ hit ∈ priorOrientedHits schemaMHits order direction,\n      hit.2 ∈ source.model.selected hit.1) : False := by\n  subst order\n  by_cases hsame : source.orientation = direction\n  · exact false_of_schemaMForwardRows source\n      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same\n        source source.model.order direction rfl hsame schemaMHits\n        schemaMForwardChoices schemaMForwardCover hall)\n  · exact false_of_schemaMReflectedRows source\n      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne\n        source source.model.order direction rfl hsame schemaMHits\n        schemaMReflectedChoices schemaMReflectedCover hall)\n\ndef schemaMClause (order : NamedOrder) (direction : Orientation) :\n    Std.Sat.CNF.Clause Atom := occurrenceClause schemaMHits order direction\n\ndef schemaMClauses : Std.Sat.CNF Atom := occurrenceClauses schemaMHits\n\ntheorem sourceAssign_schemaMClause {A : Finset ℝ²}\n    (source : SourceRealization A) (order : NamedOrder) (direction : Orientation) :\n    Std.Sat.CNF.Clause.eval (sourceAssign source.model)\n      (schemaMClause order direction) = true := by\n  apply sourceAssign_nogoodClause\n  intro horder hall\n  exact false_of_schemaMHits source order direction horder.symm hall\n\n/- ## Complete two-family suffix and successor CNF -/\n\ndef fourPointTwoCircleV4OtherCoreRefinementClauses : Std.Sat.CNF Atom :=\n  duplicateCenterClauses ++ schemaMClauses\n\ntheorem fourPointTwoCircleV4OtherCoreRefinementClauses_length :\n    fourPointTwoCircleV4OtherCoreRefinementClauses.length = 8 := by\n  native_decide\n\ntheorem fourPointTwoCircleV4OtherCoreRefinementClauses_nodup :\n    fourPointTwoCircleV4OtherCoreRefinementClauses.Nodup := by\n  native_decide\n\ntheorem sourceAssign_fourPointTwoCircleV4OtherCoreRefinementClauses {A : Finset ℝ²}\n    (source : SourceRealization A) :\n    ∀ clause ∈ fourPointTwoCircleV4OtherCoreRefinementClauses,\n      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by\n  intro clause hclause\n  rcases List.mem_append.mp hclause with hduplicate | hschemaM\n  · exact sourceAssign_occurrenceClauses source duplicateCenterHits\n      (sourceAssign_duplicateCenterClause source) clause hduplicate\n  · exact sourceAssign_occurrenceClauses source schemaMHits\n      (sourceAssign_schemaMClause source) clause hschemaM\n\ndef canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf :\n    Std.Sat.CNF Atom :=\n  canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf ++\n    fourPointTwoCircleV4OtherCoreRefinementClauses\n\ntheorem canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf_length :\n    canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf.length =\n      7409524 := by\n  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf,\n    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf_length,\n    fourPointTwoCircleV4OtherCoreRefinementClauses_length]\n\ntheorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf\n    {A : Finset ℝ²} (source : SourceRealization A)\n    (horder : source.model.order = 0) :\n    Std.Sat.CNF.eval (sourceAssign source.model)\n      canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf = true := by\n  rw [Std.Sat.CNF.eval, List.all_eq_true]\n  intro clause hclause\n  rcases List.mem_append.mp hclause with hparent | hsuffix\n  · have hparentEval :=\n      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf source horder\n    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval\n    exact hparentEval clause hparent\n  · exact sourceAssign_fourPointTwoCircleV4OtherCoreRefinementClauses source clause hsuffix\n\n#print axioms sourceAssign_duplicateCenterClause\n#print axioms sourceAssign_schemaMClause\n#print axioms fourPointTwoCircleV4OtherCoreRefinementClauses_nodup\n#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinementCnf\n\nend ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinements\nend Problem97\n'


def render_lean(ledger: Mapping[str, Any]) -> str:
    validate_ledger(ledger)
    if sha256_bytes(LEAN_SOURCE.encode()) != LEAN_SHA256:
        raise PromotionError("embedded Lean source hash drifted")
    return LEAN_SOURCE


def write_text_once(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() or path.is_symlink():
        raise FileExistsError(f"immutable publication target exists: {path}")
    descriptor, staged_name = tempfile.mkstemp(prefix=f".{path.name}.stage-", dir=path.parent)
    staged = Path(staged_name)
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(content.encode())
            handle.flush()
            os.fsync(handle.fileno())
        os.link(staged, path)
        directory = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    finally:
        staged.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--candidate-ledger", type=Path, default=LEDGER)
    parser.add_argument("--lean-output", type=Path, default=LEAN_OUTPUT)
    parser.add_argument("--verify-parent-cnf", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    ledger = load_authenticated_ledger(args.candidate_ledger)
    rendered = render_lean(ledger)
    if args.verify_parent_cnf is not None:
        verify_parent_novelty(args.verify_parent_cnf)
    if args.check:
        if not args.lean_output.is_file() or args.lean_output.read_text() != rendered:
            raise PromotionError("checked Lean output drifted")
        print(
            f"PASS {args.lean_output}: 2 candidates, {SUFFIX_CLAUSES} strictly new "
            f"clauses, {ROOT_CLAUSES} root clauses"
        )
        return 0
    write_text_once(args.lean_output, rendered)
    print(
        f"generated {args.lean_output}: 2 candidates, {SUFFIX_CLAUSES} strictly new "
        f"clauses, {ROOT_CLAUSES} root clauses"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
