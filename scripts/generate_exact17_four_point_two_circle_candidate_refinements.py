"""Promote the authenticated v3 FourPointTwoCircle core candidates.

The source ledger stores every positive selected-row hit.  This generator
authenticates that ledger, reconstructs the two shortest equality-closure
certificates from the selected rows, and emits only the positive incidences
used by those certificates.  It never treats omitted hits as nonmembership.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections import deque
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
LEDGER = (
    REPO / "scratch/runs/exact17-canary-perp-bisector-survivor-two-kalmanson-"
    "refinements-sat-portfolio-v3-20260822/sat-profile-portfolio-v3/artifacts/"
    "candidate-ledger.json"
)
LEAN_OUTPUT = (
    REPO / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements.lean"
)
LEDGER_SHA256 = "b498bb9c14b28f93bf351c880b1778f19f670d258a9c4f7a96a71db25594a338"
LEDGER_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-"
    "wave-only-candidate-ledger/v2"
)
CANDIDATE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-"
    "wave-only-candidate/v1"
)
FAMILY = "formalized-core-bank"
OTHER_FAMILIES = {
    "perpendicular-bisector-equality-component": 0,
    "two-kalmanson-cancellation": 35,
}
EXPECTED_TOTAL_CANDIDATES = 37
EXPECTED_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXPECTED_SOURCE_VALID_FAMILIES = [FAMILY, *OTHER_FAMILIES]
PARENT_ROOT_CLAUSES = 7_409_512
EXPECTED_SUFFIX_CLAUSES = 4
EXPECTED_ROOT_CLAUSES = PARENT_ROOT_CLAUSES + EXPECTED_SUFFIX_CLAUSES
EXPECTED_LEAN_SHA256 = (
    "852303193ab05d5a5f5d5930b4a1813561c8bf10899130e0b847eaa50f6b4e0e"
)
N = 17

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
CORE_PAYLOAD_KEYS = {"canonical_bank_record", "full_selected_row_support_replay"}
CORE_RECORD_KEYS = {
    "core",
    "cyclic_orientation",
    "lean_consumer",
    "orientation",
    "source",
    "stage",
}
EXPECTED_FAMILY_INVENTORY = {
    "complete_equality_component_counts": {
        "candidate_count": 0,
        "component_count": 87,
        "oriented_edge_count": 272,
        "pair_count": 136,
        "row_transition_count": 204,
        "unordered_edge_count": 136,
    },
    "excluded_diagnostic_stage_counts": {
        "equality-convex-two-kalmanson-cancellation": 1
    },
    "family_candidate_counts": {
        FAMILY: 2,
        "perpendicular-bisector-equality-component": 0,
        "two-kalmanson-cancellation": 35,
    },
    "formalized_stage_counts": {
        "equality-convex-four-point-two-circle-bisector-order": 1,
        "equality-convex-four-point-two-circle-bisector-order-reverse": 1,
        "equality-convex-two-kalmanson-cancellation": 1,
    },
    "two_kalmanson_pairing_counts": {
        "forward_record_count": 104,
        "minimal_forward_support_count": 34,
        "minimal_paired_union_count": 35,
        "minimal_reverse_support_count": 35,
        "paired_union_count": 692,
        "reverse_record_count": 104,
    },
}


class PromotionError(ValueError):
    """The authenticated candidate ledger cannot be promoted."""


@dataclass(frozen=True)
class Step:
    kind: str
    center: int
    first: int
    second: int


@dataclass(frozen=True)
class CandidateSpec:
    tag: str
    consumer: str
    stage: str
    orientation: str
    physical_core: tuple[int, int, int, int]  # q, v, u, y
    canonical_core: tuple[int, int, int, int]
    qu_path: tuple[Step, ...]
    uv_path: tuple[Step, ...]
    hits: tuple[tuple[int, int], ...]
    choices: tuple[tuple[int, tuple[int, ...]], ...]


EXPECTED_SPECS = {
    "candidateA": {
        "candidate_id": "formalized-core-bank:31312dd43742aa3ff977c2411fc64c361a8f4eda23629c1060a924ea5aade0c5",
        "record_sha256": "0577274cf7a260a71f198abc5e0b41c618476c2e612678953bdffd6887668eb8",
        "consumer": "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core",
        "stage": "equality-convex-four-point-two-circle-bisector-order",
        "orientation": "forward",
        "physical_core": (10, 8, 9, 6),
        "canonical_core": (4, 2, 5, 1),
        "qu_path": (
            ("row", 4, 5, 14),
            ("flip", 4, 14, 4),
            ("row", 14, 4, 0),
            ("flip", 14, 0, 14),
            ("row", 0, 14, 1),
            ("flip", 0, 1, 0),
            ("row", 1, 0, 4),
            ("flip", 1, 4, 1),
        ),
        "uv_path": (
            ("flip", 5, 2, 5),
            ("row", 2, 5, 1),
            ("flip", 2, 1, 2),
        ),
        "hits": (
            (0, 1),
            (0, 14),
            (1, 0),
            (1, 4),
            (2, 1),
            (2, 5),
            (4, 5),
            (4, 14),
            (14, 0),
            (14, 4),
        ),
    },
    "candidateB": {
        "candidate_id": "formalized-core-bank:9ad23bd324fccb1abf2550980abf79a5c629f27a8b77fc9145dd64c42f751ea9",
        "record_sha256": "13b834bd4ea766c24330767b9cf169031a2eef9cd637e9db3fadb7af6a7ea61f",
        "consumer": "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg",
        "stage": "equality-convex-four-point-two-circle-bisector-order-reverse",
        "orientation": "reverse",
        "physical_core": (5, 1, 10, 6),
        "canonical_core": (13, 14, 4, 1),
        "qu_path": (
            ("flip", 13, 4, 13),
            ("row", 4, 13, 14),
            ("flip", 4, 14, 4),
            ("row", 14, 4, 0),
            ("flip", 14, 0, 14),
            ("row", 0, 14, 1),
            ("flip", 0, 1, 0),
            ("row", 1, 0, 13),
            ("flip", 1, 13, 1),
        ),
        "uv_path": (
            ("flip", 4, 14, 4),
            ("row", 14, 4, 1),
            ("flip", 14, 1, 14),
        ),
        "hits": (
            (0, 1),
            (0, 14),
            (1, 0),
            (1, 13),
            (4, 13),
            (4, 14),
            (14, 0),
            (14, 1),
            (14, 4),
        ),
    },
}


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode()


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def self_hash(value: Mapping[str, Any], field: str) -> str:
    unsigned = dict(value)
    unsigned.pop(field, None)
    return sha256_bytes(canonical_json_bytes(unsigned))


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
            raw.decode(),
            object_pairs_hook=_object_without_duplicates,
            parse_constant=_reject_constant,
        )
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise PromotionError("candidate ledger is not strict UTF-8 JSON") from exc
    if type(value) is not dict:
        raise PromotionError("candidate ledger is not a JSON object")
    return value


def require_exact_keys(value: Any, expected: set[str], label: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != expected:
        raise PromotionError(f"{label} schema drifted")
    return value


def candidate_identity_material(candidate: Mapping[str, Any]) -> dict[str, Any]:
    return {
        key: candidate.get(key)
        for key in (
            "schema",
            "family",
            "source_valid",
            "lean_consumer",
            "support",
            "payload",
        )
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


def _decoded_rows(
    ledger: Mapping[str, Any],
) -> tuple[dict[int, tuple[int, ...]], dict[int, int]]:
    decoded = ledger.get("decoded_selectors")
    if (
        type(decoded) is not dict
        or decoded.get("NamedOrder") != 0
        or decoded.get("nextCenter") != 2
    ):
        raise PromotionError("decoded selector binding drifted")
    order = tuple(decoded.get("order", ()))
    if order != EXPECTED_ORDER:
        raise PromotionError("decoded named order drifted")
    raw_rows = decoded.get("rows")
    if type(raw_rows) is not dict or set(raw_rows) != {str(i) for i in range(N)}:
        raise PromotionError("decoded row universe drifted")
    physical: dict[int, tuple[int, ...]] = {}
    for center in range(N):
        support = raw_rows[str(center)]
        if (
            type(support) is not list
            or len(support) != 4
            or any(type(x) is not int for x in support)
        ):
            raise PromotionError("decoded row dimensions drifted")
        if support != sorted(set(support)) or any(x < 0 or x >= N for x in support):
            raise PromotionError("decoded row support drifted")
        physical[center] = tuple(support)
    inverse = {label: position for position, label in enumerate(order)}
    canonical = {
        inverse[center]: tuple(sorted(inverse[point] for point in support))
        for center, support in physical.items()
    }
    return canonical, inverse


def _neighbors(
    edge: tuple[int, int], rows: Mapping[int, tuple[int, ...]]
) -> list[tuple[tuple[int, int], Step]]:
    first, second = edge
    result: list[tuple[tuple[int, int], Step]] = []
    if second in rows[first]:
        for point in rows[first]:
            if point != second:
                result.append(((first, point), Step("row", first, second, point)))
    result.append(((second, first), Step("flip", first, second, first)))
    return result


def shortest_path(
    rows: Mapping[int, tuple[int, ...]], start: tuple[int, int], target: tuple[int, int]
) -> tuple[Step, ...]:
    queue = deque([start])
    previous: dict[tuple[int, int], tuple[int, int] | None] = {start: None}
    action: dict[tuple[int, int], Step] = {}
    while queue:
        edge = queue.popleft()
        if edge == target:
            break
        for successor, step in _neighbors(edge, rows):
            if successor not in previous:
                previous[successor] = edge
                action[successor] = step
                queue.append(successor)
    if target not in previous:
        raise PromotionError("core equality path is unreachable")
    path: list[Step] = []
    cursor = target
    while previous[cursor] is not None:
        path.append(action[cursor])
        cursor = previous[cursor]  # type: ignore[assignment]
    path.reverse()
    return tuple(path)


def path_hits(*paths: tuple[Step, ...]) -> tuple[tuple[int, int], ...]:
    return tuple(
        sorted(
            {
                (step.center, step.first)
                for path in paths
                for step in path
                if step.kind == "row"
            }
            | {
                (step.center, step.second)
                for path in paths
                for step in path
                if step.kind == "row"
            }
        )
    )


def choices_from_hits(
    hits: tuple[tuple[int, int], ...],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    centers: dict[int, set[int]] = {}
    for center, point in hits:
        centers.setdefault(center, set()).add(point)
    return tuple(
        (center, tuple(sorted(points))) for center, points in sorted(centers.items())
    )


def _step_tuples(steps: tuple[Step, ...]) -> tuple[tuple[str, int, int, int], ...]:
    return tuple((step.kind, step.center, step.first, step.second) for step in steps)


def _validate_core_candidate(
    candidate: Mapping[str, Any],
    rows: Mapping[int, tuple[int, ...]],
    inverse: Mapping[int, int],
) -> CandidateSpec:
    payload = require_exact_keys(
        candidate["payload"], CORE_PAYLOAD_KEYS, "core payload"
    )
    record = require_exact_keys(
        payload["canonical_bank_record"], CORE_RECORD_KEYS, "core record"
    )
    if payload["full_selected_row_support_replay"] is not True:
        raise PromotionError("full selected-row replay flag drifted")
    core = record["core"]
    if type(core) is not dict or set(core) != {"Q", "U", "V", "Y"}:
        raise PromotionError("core schema drifted")
    physical_core = (core["Q"], core["V"], core["U"], core["Y"])
    matches = [
        (tag, expected)
        for tag, expected in EXPECTED_SPECS.items()
        if physical_core == expected["physical_core"]
    ]
    if len(matches) != 1:
        raise PromotionError("unexpected formalized core")
    tag, expected = matches[0]
    if (
        candidate["lean_consumer"] != expected["consumer"]
        or record["lean_consumer"] != expected["consumer"]
    ):
        raise PromotionError("formalized core consumer drifted")
    if record["stage"] != expected["stage"] or record["source"] != "common-system-bank":
        raise PromotionError("formalized core stage/source drifted")
    if (
        record["orientation"] != expected["orientation"]
        or record["cyclic_orientation"] != expected["orientation"]
    ):
        raise PromotionError("formalized core orientation drifted")
    canonical_core = tuple(inverse[x] for x in physical_core)
    if canonical_core != expected["canonical_core"]:
        raise PromotionError("physical-to-canonical core mapping drifted")
    q, v, u, y = canonical_core
    qu_path = shortest_path(rows, (q, u), (q, y))
    uv_path = shortest_path(rows, (u, v), (y, v))
    if (
        _step_tuples(qu_path) != expected["qu_path"]
        or _step_tuples(uv_path) != expected["uv_path"]
    ):
        raise PromotionError("deterministic equality path drifted")
    hits = path_hits(qu_path, uv_path)
    if hits != expected["hits"]:
        raise PromotionError("reduced source support drifted")
    for center, point in hits:
        if point not in rows[center]:
            raise PromotionError("equality path uses an unauthenticated row hit")
    if (
        candidate["candidate_id"] != expected["candidate_id"]
        or candidate["record_sha256"] != expected["record_sha256"]
    ):
        raise PromotionError("formalized core record identity drifted")
    return CandidateSpec(
        tag=tag,
        consumer=expected["consumer"],
        stage=expected["stage"],
        orientation=expected["orientation"],
        physical_core=physical_core,
        canonical_core=canonical_core,
        qu_path=qu_path,
        uv_path=uv_path,
        hits=hits,
        choices=choices_from_hits(hits),
    )


def validate_ledger(ledger: Mapping[str, Any]) -> tuple[CandidateSpec, CandidateSpec]:
    require_exact_keys(ledger, TOP_KEYS, "ledger")
    if (
        ledger["schema"] != LEDGER_SCHEMA
        or ledger["status"] != "COMPLETE"
        or ledger["scan_complete"] is not True
        or ledger["source_valid_only"] is not True
        or ledger["complete_no_candidates"] is not False
        or ledger["candidates_examined"] != EXPECTED_TOTAL_CANDIDATES
    ):
        raise PromotionError("ledger schema/status/count drifted")
    if ledger["manifest_sha256"] != self_hash(ledger, "manifest_sha256"):
        raise PromotionError("ledger self-hash drifted")
    if ledger["family_inventory"] != EXPECTED_FAMILY_INVENTORY:
        raise PromotionError("family inventory drifted")
    if ledger["source_valid_family_inventory"] != EXPECTED_SOURCE_VALID_FAMILIES:
        raise PromotionError("source-valid family inventory drifted")
    candidates = ledger["candidates"]
    if type(candidates) is not list or len(candidates) != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("candidate count drifted")
    formalized: list[Mapping[str, Any]] = []
    family_counts = {FAMILY: 0, **OTHER_FAMILIES}
    observed_counts = {family: 0 for family in family_counts}
    for index, candidate in enumerate(candidates):
        require_exact_keys(candidate, CANDIDATE_KEYS, f"candidate[{index}]")
        if (
            candidate["schema"] != CANDIDATE_SCHEMA
            or candidate["source_valid"] is not True
        ):
            raise PromotionError("candidate schema/source-valid drifted")
        if candidate["record_sha256"] != self_hash(candidate, "record_sha256"):
            raise PromotionError("candidate record hash drifted")
        if candidate["candidate_id"] != candidate_id(candidate):
            raise PromotionError("candidate id drifted")
        family = candidate["family"]
        if family not in observed_counts:
            raise PromotionError("unexpected candidate family")
        observed_counts[family] += 1
        if family == FAMILY:
            formalized.append(candidate)
    if observed_counts != {FAMILY: 2, **OTHER_FAMILIES} or len(formalized) != 2:
        raise PromotionError("candidate family counts drifted")
    rows, inverse = _decoded_rows(ledger)
    full_physical_support = sorted(
        [
            [center, point]
            for center in range(N)
            for point in ledger["decoded_selectors"]["rows"][str(center)]
        ],
        key=canonical_json_bytes,
    )
    specs: list[CandidateSpec] = []
    for candidate in formalized:
        if candidate["support"] != full_physical_support:
            raise PromotionError("formalized core full support drifted")
        specs.append(_validate_core_candidate(candidate, rows, inverse))
    specs.sort(key=lambda item: item.tag)
    if [item.tag for item in specs] != ["candidateA", "candidateB"]:
        raise PromotionError("formalized core selection drifted")
    return specs[0], specs[1]


def _lean_pairs(items: tuple[tuple[int, int], ...]) -> str:
    return "[" + ", ".join(f"({a}, {b})" for a, b in items) + "]"


def _lean_choices(items: tuple[tuple[int, tuple[int, ...]], ...]) -> str:
    rendered = []
    for center, support in items:
        points = ", ".join(str(point) for point in support)
        rendered.append(f"{{ center := {center}, support := {{{points}}} }}")
    return "[" + ",\n    ".join(rendered) + "]"


def _reflect_choices(
    items: tuple[tuple[int, tuple[int, ...]], ...],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    return tuple(
        sorted(
            (N - 1 - center, tuple(sorted(N - 1 - x for x in support)))
            for center, support in items
        )
    )


def _reflect_step(step: Step) -> Step:
    return Step(step.kind, N - 1 - step.center, N - 1 - step.first, N - 1 - step.second)


def _lean_steps(steps: tuple[Step, ...]) -> str:
    parts = []
    for step in steps:
        if step.kind == "row":
            parts.append(f".row {step.center} {step.first} {step.second}")
        else:
            parts.append(f".flip {step.center} {step.first}")
    return "[" + ", ".join(parts) + "]"


def _render_candidate_data(spec: CandidateSpec) -> str:
    reflected_choices = _reflect_choices(spec.choices)
    rq, rv, ru, ry = (N - 1 - x for x in spec.canonical_core)
    q, v, u, y = spec.canonical_core
    reflected_qu = tuple(_reflect_step(step) for step in spec.qu_path)
    reflected_uv = tuple(_reflect_step(step) for step in spec.uv_path)
    return f"""
def {spec.tag}Hits : List Hit :=
  {_lean_pairs(spec.hits)}

def {spec.tag}ForwardChoices : List (RowChoice Label) :=
  {_lean_choices(spec.choices)}

def {spec.tag}ReflectedChoices : List (RowChoice Label) :=
  {_lean_choices(reflected_choices)}

theorem {spec.tag}ForwardCover :
    ∀ choice ∈ {spec.tag}ForwardChoices, ∀ point ∈ choice.support,
      (choice.center, point) ∈ {spec.tag}Hits := by
  decide

theorem {spec.tag}ReflectedCover :
    ∀ choice ∈ {spec.tag}ReflectedChoices, ∀ point ∈ choice.support,
      (Fin.rev choice.center, Fin.rev point) ∈ {spec.tag}Hits := by
  decide

private def {spec.tag}ForwardCore {{P : RowPattern Label}}
    (hrows : PositiveRowsMatch P {spec.tag}ForwardChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {{
  q := {q}
  v := {v}
  u := {u}
  y := {y}
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨({q}, {u}), {_lean_steps(spec.qu_path)}, ({q}, {y})⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨({u}, {v}), {_lean_steps(spec.uv_path)}, ({y}, {v})⟩ (by decide) }}

private def {spec.tag}ReflectedCore {{P : RowPattern Label}}
    (hrows : PositiveRowsMatch P {spec.tag}ReflectedChoices) :
    Census554.FourPointTwoCircleBisectorOrderCore.Core P := {{
  q := {rq}
  v := {rv}
  u := {ru}
  y := {ry}
  huy := by decide
  qu_qy := edgeClosure_of_checkPath_positive hrows
    ⟨({rq}, {ru}), {_lean_steps(reflected_qu)}, ({rq}, {ry})⟩ (by decide)
  uv_yv := edgeClosure_of_checkPath_positive hrows
    ⟨({ru}, {rv}), {_lean_steps(reflected_uv)}, ({ry}, {rv})⟩ (by decide) }}
"""


LEAN_PREAMBLE = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge
import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore

/-!
# Source-valid FourPointTwoCircle refinements from the exact-seventeen v3 ledger

The authenticated v3 survivor contains two instances of the cardinality-generic
two-circle same-side obstruction.  The source adapter below retains only the
positive selected-row hits traversed by explicit equality-closure paths.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Census554.EqualityCore
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinementsV2

private abbrev priorOrientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

private abbrev occurrenceClause :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

private theorem signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

private theorem signedArea2_cycle (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 c a b := by
  simp only [signedArea2]
  ring
"""


LEAN_POSTAMBLE = f"""
private theorem false_of_candidateAForwardRows
    {{P : RowPattern Label}} {{pointOf : Label → ℝ²}}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateAForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (candidateAForwardCore hrows)
  · change 0 < signedArea2 (pointOf 5) (pointOf 4) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (4 : Label)) (k := (5 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 1) (pointOf 4) (pointOf 2)
    rw [signedArea2_swap23]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (2 : Label)) (k := (4 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_candidateAReflectedRows
    {{P : RowPattern Label}} {{pointOf : Label → ℝ²}}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateAReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (candidateAReflectedCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (11 : Label)) (j := (12 : Label)) (k := (14 : Label))
      (by decide) (by decide)
  · change signedArea2 (pointOf 15) (pointOf 12) (pointOf 14) < 0
    rw [signedArea2_cycle, signedArea2_cycle]
    exact hneg_of_ccw hreal.injective hccw
      (i := (12 : Label)) (j := (14 : Label)) (k := (15 : Label))
      (by decide) (by decide)

private theorem false_of_candidateBForwardRows
    {{P : RowPattern Label}} {{pointOf : Label → ℝ²}}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateBForwardChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg hreal
    (candidateBForwardCore hrows)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (4 : Label)) (j := (13 : Label)) (k := (14 : Label))
      (by decide) (by decide)
  · exact hneg_of_ccw hreal.injective hccw
      (i := (1 : Label)) (j := (13 : Label)) (k := (14 : Label))
      (by decide) (by decide)

private theorem false_of_candidateBReflectedRows
    {{P : RowPattern Label}} {{pointOf : Label → ℝ²}}
    (hreal : Realizes P pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (hrows : PositiveRowsMatch P candidateBReflectedChoices) : False := by
  apply Census554.FourPointTwoCircleBisectorOrderCore.false_of_core hreal
    (candidateBReflectedCore hrows)
  · change 0 < signedArea2 (pointOf 12) (pointOf 3) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (3 : Label)) (k := (12 : Label))
      (by decide) (by decide)
    linarith
  · change 0 < signedArea2 (pointOf 15) (pointOf 3) (pointOf 2)
    rw [signedArea2_swap13]
    have hneg := hneg_of_ccw hreal.injective hccw
      (i := (2 : Label)) (j := (3 : Label)) (k := (15 : Label))
      (by decide) (by decide)
    linarith

private theorem false_of_candidateAHits {{A : Finset ℝ²}}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits candidateAHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_candidateAForwardRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same
        source source.model.order direction rfl hsame candidateAHits
        candidateAForwardChoices candidateAForwardCover hall)
  · exact false_of_candidateAReflectedRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne
        source source.model.order direction rfl hsame candidateAHits
        candidateAReflectedChoices candidateAReflectedCover hall)

private theorem false_of_candidateBHits {{A : Finset ℝ²}}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (horder : order = source.model.order)
    (hall : ∀ hit ∈ priorOrientedHits candidateBHits order direction,
      hit.2 ∈ source.model.selected hit.1) : False := by
  subst order
  have hreal := sourceRealizesBoundaryPattern source
  by_cases hsame : source.orientation = direction
  · exact false_of_candidateBForwardRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_same
        source source.model.order direction rfl hsame candidateBHits
        candidateBForwardChoices candidateBForwardCover hall)
  · exact false_of_candidateBReflectedRows hreal source.boundary_ccw
      (ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge.positiveRowsMatch_of_ne
        source source.model.order direction rfl hsame candidateBHits
        candidateBReflectedChoices candidateBReflectedCover hall)

def candidateAClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := occurrenceClause candidateAHits order direction

def candidateBClause (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause Atom := occurrenceClause candidateBHits order direction

def candidateAClauses : Std.Sat.CNF Atom := occurrenceClauses candidateAHits

def candidateBClauses : Std.Sat.CNF Atom := occurrenceClauses candidateBHits

theorem sourceAssign_candidateAClause {{A : Finset ℝ²}} (source : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (candidateAClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_candidateAHits source order direction horder.symm hall

theorem sourceAssign_candidateBClause {{A : Finset ℝ²}} (source : SourceRealization A)
    (order : NamedOrder) (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (candidateBClause order direction) = true := by
  apply sourceAssign_nogoodClause
  intro horder hall
  exact false_of_candidateBHits source order direction horder.symm hall

private theorem sourceAssign_occurrenceClauses {{A : Finset ℝ²}}
    (source : SourceRealization A) (hits : List Hit)
    (hvalid : ∀ order direction,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model)
        (occurrenceClause hits order direction) = true) :
    ∀ clause ∈ occurrenceClauses hits,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact hvalid order direction

def fourPointTwoCircleRefinementClauses : Std.Sat.CNF Atom :=
  candidateBClauses

theorem fourPointTwoCircleRefinementClauses_length :
    fourPointTwoCircleRefinementClauses.length = {EXPECTED_SUFFIX_CLAUSES} := by
  native_decide

theorem fourPointTwoCircleRefinementClauses_nodup :
    fourPointTwoCircleRefinementClauses.Nodup := by
  native_decide

theorem candidateAClauses_already_in_v2 :
    ∀ clause ∈ candidateAClauses, clause ∈ twoKalmansonRefinementClauses := by
  native_decide

theorem candidateBClauses_disjoint_v2 :
    ∀ clause ∈ candidateBClauses,
      clause ∉ twoKalmansonRefinementClauses := by
  native_decide

theorem sourceAssign_fourPointTwoCircleRefinementClauses {{A : Finset ℝ²}}
    (source : SourceRealization A) :
    ∀ clause ∈ fourPointTwoCircleRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_occurrenceClauses source candidateBHits
    (sourceAssign_candidateBClause source) clause hclause

def canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf ++
    fourPointTwoCircleRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf.length =
      {EXPECTED_ROOT_CLAUSES} := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf,
    canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf_length,
    fourPointTwoCircleRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf
    {{A : Finset ℝ²}} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementV2Cnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_fourPointTwoCircleRefinementClauses source clause hsuffix

#print axioms sourceAssign_candidateAClause
#print axioms sourceAssign_candidateBClause
#print axioms fourPointTwoCircleRefinementClauses_nodup
#print axioms candidateAClauses_already_in_v2
#print axioms candidateBClauses_disjoint_v2
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements
end Problem97
"""


def render_lean(ledger: Mapping[str, Any]) -> str:
    candidate_a, candidate_b = validate_ledger(ledger)
    return (
        LEAN_PREAMBLE
        + _render_candidate_data(candidate_a)
        + _render_candidate_data(candidate_b)
        + LEAN_POSTAMBLE
    )


def write_text_once(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() or path.is_symlink():
        raise FileExistsError(f"immutable publication target exists: {path}")
    descriptor, staged_name = tempfile.mkstemp(
        prefix=f".{path.name}.stage-", dir=path.parent
    )
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
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    ledger = load_authenticated_ledger(args.candidate_ledger)
    rendered = render_lean(ledger)
    if args.check:
        if (
            not args.lean_output.is_file()
            or args.lean_output.read_text(encoding="utf-8") != rendered
        ):
            raise PromotionError("checked Lean output drifted")
        print(
            f"PASS {args.lean_output}: 2 candidates, 4 new clauses, {EXPECTED_ROOT_CLAUSES} root clauses"
        )
        return 0
    write_text_once(args.lean_output, rendered)
    print(
        f"generated {args.lean_output}: 2 candidates, 4 new clauses, {EXPECTED_ROOT_CLAUSES} root clauses"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
