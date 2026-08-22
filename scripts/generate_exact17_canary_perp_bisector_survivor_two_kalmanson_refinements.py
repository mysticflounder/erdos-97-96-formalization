"""Promote the authenticated canary survivor two-Kalmanson candidate ledger.

The input is the immutable wave-only ledger produced after the source-total
center-2/no-physical-hit canary.  Every one of its 17 candidates is replayed
through the same structural occurrence checker used by the miner before the
corresponding four order/orientation clauses are emitted as Lean data.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sys
import tempfile
from collections.abc import Mapping
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
SCRIPTS = Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPTS))
sys.path.insert(0, str(REPO))

from generate_exact17_twenty_eighth_all_cancellation_refinements import (
    lean_occurrence,
    lean_occurrence_check,
    path_hits,
    reflected,
)

from census.atail_force import producer_bank

LEDGER = (
    REPO
    / "scratch"
    / "runs"
    / "exact17-canary-perp-bisector-survivor-refinements-sat-portfolio-20260822"
    / "sat-profile-portfolio-v1"
    / "artifacts"
    / "candidate-ledger.json"
)
LEDGER_SHA256 = "3343a7b49b720cc56f0741fa8981e7f2344a48e05017665784b2353def33f588"
LEDGER_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-"
    "wave-only-candidate-ledger/v1"
)
CANDIDATE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-wave-only-candidate/v1"
)
FAMILY = "two-kalmanson-cancellation"
CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonCancellationData_of_check"
)
EXPECTED_OCCURRENCES = 17
CLAUSES_PER_OCCURRENCE = 4
EXPECTED_SUFFIX_CLAUSES = EXPECTED_OCCURRENCES * CLAUSES_PER_OCCURRENCE
PARENT_ROOT_CLAUSES = 7_409_304
EXPECTED_ROOT_CLAUSES = PARENT_ROOT_CLAUSES + EXPECTED_SUFFIX_CLAUSES
N = 17
EXPECTED_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXPECTED_SOURCE_VALID_FAMILIES = [
    "formalized-core-bank",
    "perpendicular-bisector-equality-component",
    FAMILY,
]

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
PAYLOAD_KEYS = {"forward", "reverse", "paired_forward_reverse_replay"}


class PromotionError(ValueError):
    """The authenticated candidate ledger cannot be promoted."""


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("utf-8")


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
            raw.decode("utf-8"),
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
        "schema": candidate.get("schema"),
        "family": candidate.get("family"),
        "source_valid": candidate.get("source_valid"),
        "lean_consumer": candidate.get("lean_consumer"),
        "support": candidate.get("support"),
        "payload": candidate.get("payload"),
    }


def candidate_id(candidate: Mapping[str, Any]) -> str:
    return f"{candidate.get('family')}:{sha256_bytes(canonical_json_bytes(candidate_identity_material(candidate)))}"


def _rows_and_order(ledger: Mapping[str, Any]) -> tuple[list[Any], tuple[int, ...]]:
    decoded = ledger.get("decoded_selectors")
    if type(decoded) is not dict:
        raise PromotionError("decoded selector block is missing")
    if decoded.get("NamedOrder") != 0 or decoded.get("nextCenter") != 2:
        raise PromotionError("decoded selector binding drifted")
    order = tuple(decoded.get("order", ()))
    if order != EXPECTED_ORDER:
        raise PromotionError("decoded named order drifted")
    rows = decoded.get("rows")
    if type(rows) is not dict or set(rows) != {str(index) for index in range(N)}:
        raise PromotionError("decoded selected-row bank is incomplete")
    selected_rows: list[Any] = []
    for center in range(N):
        support = rows[str(center)]
        if (
            type(support) is not list
            or len(support) != 4
            or any(type(point) is not int for point in support)
            or len(set(support)) != 4
            or center in support
            or any(not 0 <= point < N for point in support)
        ):
            raise PromotionError(f"decoded selected row {center} is malformed")
        selected_rows.append(
            producer_bank.MetricRow(center, tuple(support), exact=False)
        )
    return selected_rows, order


def _support(candidate: Mapping[str, Any]) -> frozenset[tuple[int, int]]:
    support = candidate.get("support")
    if type(support) is not list or not support:
        raise PromotionError("candidate support is empty or malformed")
    canonical = sorted(
        {canonical_json_bytes(item): item for item in support}.values(),
        key=canonical_json_bytes,
    )
    if support != canonical:
        raise PromotionError("candidate support is not canonical and duplicate-free")
    hits: set[tuple[int, int]] = set()
    for hit in support:
        if (
            type(hit) is not list
            or len(hit) != 2
            or any(type(index) is not int for index in hit)
            or any(not 0 <= index < N for index in hit)
        ):
            raise PromotionError("candidate support contains a malformed hit")
        hits.add((hit[0], hit[1]))
    return frozenset(hits)


def validate_ledger(
    ledger: Mapping[str, Any],
) -> list[tuple[frozenset[tuple[int, int]], dict[str, Any], dict[str, Any]]]:
    """Validate the ledger and replay all 17 checked occurrences."""

    require_exact_keys(ledger, TOP_KEYS, "candidate ledger")
    if ledger.get("schema") != LEDGER_SCHEMA:
        raise PromotionError("candidate ledger schema drifted")
    if ledger.get("status") != "COMPLETE":
        raise PromotionError("candidate ledger status is not COMPLETE")
    if ledger.get("manifest_sha256") != self_hash(ledger, "manifest_sha256"):
        raise PromotionError("candidate ledger self-hash drifted")
    if (
        ledger.get("scan_complete") is not True
        or ledger.get("source_valid_only") is not True
    ):
        raise PromotionError("candidate ledger is not a complete source-valid scan")
    if ledger.get("complete_no_candidates") is not False:
        raise PromotionError("candidate ledger incorrectly reports no candidates")
    candidates = ledger.get("candidates")
    if type(candidates) is not list or len(candidates) != EXPECTED_OCCURRENCES:
        raise PromotionError(f"expected exactly {EXPECTED_OCCURRENCES} candidates")
    if ledger.get("candidates_examined") != EXPECTED_OCCURRENCES:
        raise PromotionError("candidate census drifted")
    if ledger.get("source_valid_family_inventory") != EXPECTED_SOURCE_VALID_FAMILIES:
        raise PromotionError("source-valid family inventory drifted")
    family_counts = ledger.get("family_inventory", {}).get("family_candidate_counts")
    if family_counts != {
        "formalized-core-bank": 0,
        "perpendicular-bisector-equality-component": 0,
        FAMILY: EXPECTED_OCCURRENCES,
    }:
        raise PromotionError("candidate family census drifted")

    rows, order = _rows_and_order(ledger)
    reverse_order = tuple(reversed(order))
    occurrences = []
    seen_ids: set[str] = set()
    seen_supports: set[frozenset[tuple[int, int]]] = set()
    for index, raw_candidate in enumerate(candidates):
        candidate = require_exact_keys(
            raw_candidate, CANDIDATE_KEYS, f"candidate {index}"
        )
        if candidate.get("schema") != CANDIDATE_SCHEMA:
            raise PromotionError(f"candidate {index} schema drifted")
        if (
            candidate.get("family") != FAMILY
            or candidate.get("source_valid") is not True
        ):
            raise PromotionError(
                f"candidate {index} is not source-valid two-Kalmanson data"
            )
        if candidate.get("lean_consumer") != CONSUMER:
            raise PromotionError(f"candidate {index} Lean consumer drifted")
        if candidate.get("candidate_id") != candidate_id(candidate):
            raise PromotionError(f"candidate {index} identity drifted")
        if candidate.get("record_sha256") != self_hash(candidate, "record_sha256"):
            raise PromotionError(f"candidate {index} record self-hash drifted")
        if candidate["candidate_id"] in seen_ids:
            raise PromotionError("candidate ledger contains a duplicate identity")
        seen_ids.add(candidate["candidate_id"])

        payload = require_exact_keys(
            candidate.get("payload"), PAYLOAD_KEYS, f"candidate {index} payload"
        )
        if payload.get("paired_forward_reverse_replay") is not True:
            raise PromotionError(f"candidate {index} pairing is not certified")
        forward = payload.get("forward")
        reverse = payload.get("reverse")
        if type(forward) is not dict or type(reverse) is not dict:
            raise PromotionError(f"candidate {index} records are malformed")
        if (
            forward.get("lean_consumer") != CONSUMER
            or reverse.get("lean_consumer") != CONSUMER
        ):
            raise PromotionError(f"candidate {index} record consumer drifted")
        hits = _support(candidate)
        if hits in seen_supports:
            raise PromotionError("candidate ledger contains a duplicate support")
        seen_supports.add(hits)
        if path_hits(forward) != hits:
            raise PromotionError(f"candidate {index} support/core mismatch")
        if path_hits(reverse) != reflected(hits):
            raise PromotionError(f"candidate {index} reflected support/core mismatch")
        if forward.get("projection", {}).get("order") != list(order):
            raise PromotionError(f"candidate {index} forward order drifted")
        if reverse.get("projection", {}).get("order") != list(reverse_order):
            raise PromotionError(f"candidate {index} reverse order drifted")
        if not lean_occurrence_check(
            hits,
            forward,
            reverse,
            rows=rows,
            forward_order=order,
            reverse_order=reverse_order,
        ):
            raise PromotionError(f"candidate {index} structural replay failed")
        occurrences.append((hits, forward, reverse))
    return occurrences


def load_authenticated_ledger(path: Path) -> dict[str, Any]:
    if path.is_symlink() or not path.is_file():
        raise PromotionError("candidate ledger is missing or is a symlink")
    raw = path.read_bytes()
    if path.resolve() != LEDGER.resolve() or sha256_bytes(raw) != LEDGER_SHA256:
        raise PromotionError("candidate ledger path or byte hash drifted")
    ledger = strict_json(raw)
    validate_ledger(ledger)
    return ledger


LEAN_PREAMBLE = r"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements

/-!
# Full two-Kalmanson successor from the authenticated exact-seventeen canary

The canary survivor model contains seventeen source-valid two-Kalmanson
cancellations. Each occurrence carries checked forward and reflected data.
Their full named-order/orientation orbits contribute sixty-eight clauses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

/-- All seventeen source-valid cancellations from the authenticated canary model. -/
def cancellationOccurrences : List CancellationOccurrence :=
"""


LEAN_POSTAMBLE = rf"""

theorem cancellationOccurrences_length :
    cancellationOccurrences.length = {EXPECTED_OCCURRENCES} := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

/-- The complete named-order/orientation orbit of every checked occurrence. -/
def twoKalmansonRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem twoKalmansonRefinementClauses_length :
    twoKalmansonRefinementClauses.length = {EXPECTED_SUFFIX_CLAUSES} := by
  native_decide

theorem sourceAssign_twoKalmansonRefinementClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ twoKalmansonRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [twoKalmansonRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

/-- Lean-owned successor after adjoining all sixty-eight source-valid clauses. -/
def canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf : Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorRefinementCnf ++ twoKalmansonRefinementClauses

theorem canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf_length :
    canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf.length = {EXPECTED_ROOT_CLAUSES} := by
  simp [canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf,
    canaryPerpBisectorSurvivorRefinementCnf_length,
    twoKalmansonRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf,
    List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorRefinementCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_twoKalmansonRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf_unsat
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A)
    (horder : source.model.order = 0)
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment
        canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf = true) : False := by
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf source horder⟩

#print axioms cancellationOccurrences_all_check
#print axioms sourceAssign_twoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf
#print axioms false_of_sourceRealization_of_canaryPerpBisectorSurvivorTwoKalmansonRefinementCnf_unsat

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinements
end Problem97
"""


def render_lean(ledger: Mapping[str, Any]) -> str:
    occurrences = validate_ledger(ledger)
    entries = [
        lean_occurrence(hits, forward, reverse)
        for hits, forward, reverse in occurrences
    ]
    return LEAN_PREAMBLE + "[\n" + ",\n".join(entries) + "]\n" + LEAN_POSTAMBLE


def write_text_once(path: Path, content: str) -> None:
    """Publish one generated file without overwriting an existing path."""

    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() or path.is_symlink():
        raise FileExistsError(f"immutable publication target exists: {path}")
    descriptor, staged_name = tempfile.mkstemp(
        prefix=f".{path.name}.stage-", dir=path.parent
    )
    staged = Path(staged_name)
    try:
        raw = content.encode("utf-8")
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(raw)
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
    parser.add_argument("--lean-output", type=Path, required=True)
    args = parser.parse_args()
    ledger = load_authenticated_ledger(args.candidate_ledger)
    output = render_lean(ledger)
    write_text_once(args.lean_output, output)
    print(
        f"generated {args.lean_output}: {EXPECTED_OCCURRENCES} occurrences, "
        f"{EXPECTED_SUFFIX_CLAUSES} clauses, {EXPECTED_ROOT_CLAUSES} root clauses"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
