"""Promote the authenticated v4 two-Kalmanson candidate family.

The immutable v4 wave-only ledger contains 63 source-valid records.  Exactly
59 belong to the generic two-Kalmanson cancellation family.  This adapter
validates the complete ledger, structurally replays those 59 records against
the decoded source rows, and emits their complete named-order/orientation
orbit as a Lean-owned 236-clause suffix over the FourPoint parent root.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any, NamedTuple

REPO = Path(__file__).resolve().parents[1]
SCRIPTS = REPO / "scripts"
sys.path.insert(0, str(SCRIPTS))
sys.path.insert(0, str(REPO))


def _load_v2_generator() -> Any:
    path = SCRIPTS / "generate_exact17_two_kalmanson_v2_candidate_refinements.py"
    spec = importlib.util.spec_from_file_location("exact17_two_kalmanson_v2", path)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load v2 two-Kalmanson generator")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


V2 = _load_v2_generator()
PromotionError = V2.PromotionError
canonical_json_bytes = V2.canonical_json_bytes
sha256_bytes = V2.sha256_bytes
self_hash = V2.self_hash
strict_json = V2.strict_json
require_exact_keys = V2.require_exact_keys
candidate_id = V2.candidate_id
lean_occurrence = V2.lean_occurrence
lean_occurrence_check = V2.lean_occurrence_check
path_hits = V2.path_hits
reflected = V2.reflected

LEDGER = (
    REPO
    / "scratch"
    / "runs"
    / "exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-"
      "sat-portfolio-v4-20260822"
    / "sat-profile-portfolio-v4"
    / "artifacts"
    / "candidate-ledger.json"
)
LEDGER_SHA256 = "a3f7e3b098e13831684d8c219d0d4e632ff9a1196f5d875e3f1b893f25ffc828"
LEDGER_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "wave-only-candidate-ledger/v2"
)
CANDIDATE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "wave-only-candidate/v1"
)
FAMILY = "two-kalmanson-cancellation"
CORE_FAMILY = "formalized-core-bank"
COMPONENT_FAMILY = "perpendicular-bisector-equality-component"
CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonCancellationData_of_check"
)
CORE_CONSUMERS = {
    "Problem97.CapCrossingKalmansonBridge.false_of_five_selected_rows_in_eight_ccw_order_M",
    "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core",
    "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg",
    "Problem97.Census554.false_of_metricCoreAlternative",
}

EXPECTED_TOTAL_CANDIDATES = 63
EXPECTED_OCCURRENCES = 59
CLAUSES_PER_OCCURRENCE = 4
EXPECTED_SUFFIX_CLAUSES = EXPECTED_OCCURRENCES * CLAUSES_PER_OCCURRENCE
PARENT_ROOT_CLAUSES = 7_409_516
EXPECTED_ROOT_CLAUSES = PARENT_ROOT_CLAUSES + EXPECTED_SUFFIX_CLAUSES
EXPECTED_PARENT_EXACT_DUPLICATE_CLAUSES = 0
EXPECTED_PARENT_STRICTLY_SUBSUMED_CLAUSES = 61
EXPECTED_STRICT_NEW_CLAUSES = 175
N = 17
EXPECTED_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXPECTED_SOURCE_VALID_FAMILIES = [CORE_FAMILY, COMPONENT_FAMILY, FAMILY]
EXPECTED_LEDGER_IDENTITY = {
    "job_id": "b9190a9a-397d-41ca-82a9-20c0385d44dc",
    "portfolio_cell_id": (
        "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
        "next-center-02-physical-none-sat-profile-v1"
    ),
    "cnf_sha256": "24415eae34594b8256f0254fd65793ab32d62909edd84ba85ec09375dab6b59f",
    "wave_manifest_sha256": "7afc95013632d781522a4bf9fbb6b5d5b3e7596f6f73b203ffc71c258d76b453",
    "producer_manifest_sha256": "b2471486b6f29a67495c0f1d2ae73b49825374273d9a552c6e65ee672019596d",
    "variable_map_sha256": "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f",
    "model_sha256": "30eb299b7093a471b43b46403c442efa88898765c340ff63c40f834c3d233922",
}
EXPECTED_SCANNER = {
    "name": "exact17-survivor-four-point-two-circle-refinements-source-valid-theorem-miner",
    "schema": (
        "p97-exact17-survivor-four-point-two-circle-refinements-"
        "source-valid-theorem-miner/v2"
    ),
    "source_path": (
        "scripts/mine_exact17_canary_perp_bisector_survivor_"
        "four_point_two_circle_refinements_sat_canary.py"
    ),
    "source_sha256": "5d6de1bd5e1675e3a71ac8ebaed0829d1a63b261e0b346663820860a06398e12",
    "version": "2",
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
    "excluded_diagnostic_stage_counts": {"equality-convex-two-kalmanson-cancellation": 1},
    "family_candidate_counts": {
        CORE_FAMILY: 4,
        COMPONENT_FAMILY: 0,
        FAMILY: EXPECTED_OCCURRENCES,
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
        "minimal_forward_support_count": EXPECTED_OCCURRENCES,
        "minimal_paired_union_count": EXPECTED_OCCURRENCES,
        "minimal_reverse_support_count": EXPECTED_OCCURRENCES,
        "paired_union_count": 1728,
        "reverse_record_count": 201,
    },
}

TOP_KEYS = V2.TOP_KEYS
CANDIDATE_KEYS = V2.CANDIDATE_KEYS
PAYLOAD_KEYS = V2.PAYLOAD_KEYS

ORDER_TABLES = (
    EXPECTED_ORDER,
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)


def _rows_and_order(ledger: Mapping[str, Any]) -> tuple[list[Any], tuple[int, ...]]:
    return V2._rows_and_order(ledger)


def _support(candidate: Mapping[str, Any]) -> frozenset[tuple[int, int]]:
    return V2._support(candidate)


def _validate_ledger_header(ledger: Mapping[str, Any]) -> list[Any]:
    require_exact_keys(ledger, TOP_KEYS, "candidate ledger")
    if ledger.get("schema") != LEDGER_SCHEMA or ledger.get("status") != "COMPLETE":
        raise PromotionError("candidate ledger schema/status drifted")
    if ledger.get("manifest_sha256") != self_hash(ledger, "manifest_sha256"):
        raise PromotionError("candidate ledger self-hash drifted")
    if ledger.get("scan_complete") is not True or ledger.get("source_valid_only") is not True:
        raise PromotionError("candidate ledger is not a complete source-valid scan")
    if ledger.get("complete_no_candidates") is not False:
        raise PromotionError("candidate ledger incorrectly reports no candidates")
    for key, expected in EXPECTED_LEDGER_IDENTITY.items():
        if ledger.get(key) != expected:
            raise PromotionError(f"candidate ledger {key} drifted")
    if ledger.get("scanner") != EXPECTED_SCANNER:
        raise PromotionError("candidate ledger scanner drifted")
    if ledger.get("source_valid_family_inventory") != EXPECTED_SOURCE_VALID_FAMILIES:
        raise PromotionError("source-valid family inventory drifted")
    if ledger.get("family_inventory") != EXPECTED_FAMILY_INVENTORY:
        raise PromotionError("candidate family inventory drifted")
    candidates = ledger.get("candidates")
    if type(candidates) is not list or len(candidates) != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("candidate census drifted")
    if ledger.get("candidates_examined") != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("candidate census count drifted")
    return candidates


Occurrence = tuple[frozenset[tuple[int, int]], dict[str, Any], dict[str, Any]]


def validate_ledger(ledger: Mapping[str, Any]) -> list[Occurrence]:
    """Validate the exact v4 ledger and replay all 59 generic occurrences."""

    candidates = _validate_ledger_header(ledger)
    rows, order = _rows_and_order(ledger)
    reverse_order = tuple(reversed(order))
    occurrences: list[Occurrence] = []
    seen_ids: set[str] = set()
    seen_supports: set[frozenset[tuple[int, int]]] = set()
    seen_core_consumers: set[str] = set()
    for index, raw_candidate in enumerate(candidates):
        candidate = require_exact_keys(raw_candidate, CANDIDATE_KEYS, f"candidate {index}")
        if candidate.get("schema") != CANDIDATE_SCHEMA:
            raise PromotionError(f"candidate {index} schema drifted")
        if candidate.get("source_valid") is not True:
            raise PromotionError(f"candidate {index} is not source-valid")
        if candidate.get("candidate_id") != candidate_id(candidate):
            raise PromotionError(f"candidate {index} identity drifted")
        if candidate.get("record_sha256") != self_hash(candidate, "record_sha256"):
            raise PromotionError(f"candidate {index} record self-hash drifted")
        if candidate["candidate_id"] in seen_ids:
            raise PromotionError("candidate ledger contains a duplicate identity")
        seen_ids.add(candidate["candidate_id"])
        family = candidate.get("family")
        if family == CORE_FAMILY:
            consumer = candidate.get("lean_consumer")
            if consumer not in CORE_CONSUMERS or consumer in seen_core_consumers:
                raise PromotionError(f"candidate {index} core consumer drifted")
            seen_core_consumers.add(consumer)
            _support(candidate)
            continue
        if family == COMPONENT_FAMILY:
            raise PromotionError("unexpected perpendicular-bisector candidate")
        if family != FAMILY or candidate.get("lean_consumer") != CONSUMER:
            raise PromotionError(f"candidate {index} family/consumer drifted")
        payload = require_exact_keys(candidate.get("payload"), PAYLOAD_KEYS, f"candidate {index} payload")
        if payload.get("paired_forward_reverse_replay") is not True or payload.get("occurrence_union_cover") is not True:
            raise PromotionError(f"candidate {index} pairing is not certified")
        forward, reverse = payload.get("forward"), payload.get("reverse")
        if type(forward) is not dict or type(reverse) is not dict:
            raise PromotionError(f"candidate {index} records are malformed")
        if forward.get("lean_consumer") != CONSUMER or reverse.get("lean_consumer") != CONSUMER:
            raise PromotionError(f"candidate {index} record consumer drifted")
        hits = _support(candidate)
        if hits in seen_supports:
            raise PromotionError("candidate ledger contains a duplicate support")
        seen_supports.add(hits)
        forward_support = path_hits(forward)
        reverse_support = path_hits(reverse)
        if (
            forward_support != frozenset(tuple(hit) for hit in payload.get("forward_path_support", []))
            or reverse_support != frozenset(tuple(hit) for hit in payload.get("reverse_path_support", []))
            or not forward_support <= hits
            or not reflected(reverse_support) <= hits
        ):
            raise PromotionError(f"candidate {index} support/core mismatch")
        if forward.get("projection", {}).get("order") != list(order) or reverse.get("projection", {}).get("order") != list(reverse_order):
            raise PromotionError(f"candidate {index} projection order drifted")
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
    if seen_core_consumers != CORE_CONSUMERS:
        raise PromotionError("formalized-core consumer census drifted")
    if len(occurrences) != EXPECTED_OCCURRENCES:
        raise PromotionError("two-Kalmanson candidate count drifted")
    clauses = render_dimacs_suffix(occurrences)
    if len(clauses) != EXPECTED_SUFFIX_CLAUSES or len(set(clauses)) != EXPECTED_SUFFIX_CLAUSES:
        raise PromotionError("complete order/orientation orbit is not duplicate-free")
    return occurrences


def load_authenticated_ledger(path: Path = LEDGER) -> dict[str, Any]:
    if path.is_symlink() or not path.is_file() or path.resolve() != LEDGER.resolve():
        raise PromotionError("candidate ledger path drifted")
    raw = path.read_bytes()
    if sha256_bytes(raw) != LEDGER_SHA256:
        raise PromotionError("candidate ledger byte hash drifted")
    ledger = strict_json(raw)
    validate_ledger(ledger)
    return ledger


def oriented_label(order: int, direction: int, index: int) -> int:
    position = index if direction == 0 else N - 1 - index
    return ORDER_TABLES[order][position]


def orbit_clauses(hits: frozenset[tuple[int, int]]) -> tuple[tuple[int, ...], ...]:
    clauses = []
    for order in range(2):
        for direction in range(2):
            literals = [-307 - order]
            literals.extend(
                -(1 + oriented_label(order, direction, center) * N + oriented_label(order, direction, point))
                for center, point in sorted(hits)
            )
            clauses.append(tuple(literals))
    result = tuple(clauses)
    if len(set(result)) != CLAUSES_PER_OCCURRENCE:
        raise PromotionError("an occurrence does not have a full four-clause orbit")
    return result


def render_dimacs_suffix(occurrences: Sequence[Occurrence]) -> tuple[tuple[int, ...], ...]:
    return tuple(
        clause
        for hits, _forward, _reverse in occurrences
        for clause in orbit_clauses(hits)
    )


class ParentNovelty(NamedTuple):
    exact_duplicate_multiplicities: tuple[int, ...]
    strict_subsumer_multiplicities: tuple[int, ...]

    @property
    def exact_duplicate_clause_count(self) -> int:
        return sum(count > 0 for count in self.exact_duplicate_multiplicities)

    @property
    def strictly_subsumed_clause_count(self) -> int:
        return sum(count > 0 for count in self.strict_subsumer_multiplicities)


def classify_parent_novelty(
    parent_cnf: Path,
    suffix: Sequence[tuple[int, ...]],
    *,
    expected_num_vars: int | None = None,
    expected_clause_count: int | None = None,
) -> ParentNovelty:
    """Stream a DIMACS parent and classify exact and strict clause subsumption."""

    if not parent_cnf.is_file() or parent_cnf.is_symlink():
        raise PromotionError("parent DIMACS path is not a regular file")
    target_sets = tuple(frozenset(clause) for clause in suffix)
    literal_masks: dict[int, int] = {}
    for index, clause in enumerate(target_sets):
        bit = 1 << index
        for literal in clause:
            literal_masks[literal] = literal_masks.get(literal, 0) | bit
    exact = [0] * len(suffix)
    strict = [0] * len(suffix)
    header_seen = False
    clause_count = 0
    with parent_cnf.open("r", encoding="ascii") as handle:
        for line in handle:
            if line.startswith("c") or not line.strip():
                continue
            if line.startswith("p cnf "):
                if header_seen:
                    raise PromotionError("parent DIMACS has duplicate headers")
                fields = line.split()
                if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                    raise PromotionError("parent DIMACS header is malformed")
                if expected_num_vars is not None and int(fields[2]) != expected_num_vars:
                    raise PromotionError("parent DIMACS variable count drifted")
                if expected_clause_count is not None and int(fields[3]) != expected_clause_count:
                    raise PromotionError("parent DIMACS declared clause count drifted")
                header_seen = True
                continue
            fields = line.split()
            if not fields or fields[-1] != "0":
                raise PromotionError("parent DIMACS clause is malformed")
            literals = frozenset(int(field) for field in fields[:-1])
            if 0 in literals:
                raise PromotionError("parent DIMACS clause has an interior zero literal")
            clause_count += 1
            mask = (1 << len(suffix)) - 1
            for literal in literals:
                mask &= literal_masks.get(literal, 0)
                if mask == 0:
                    break
            while mask:
                low = mask & -mask
                index = low.bit_length() - 1
                if len(literals) == len(target_sets[index]):
                    exact[index] += 1
                elif len(literals) < len(target_sets[index]):
                    strict[index] += 1
                mask ^= low
    if not header_seen:
        raise PromotionError("parent DIMACS header is missing")
    if expected_clause_count is not None and clause_count != expected_clause_count:
        raise PromotionError("parent DIMACS physical clause count drifted")
    return ParentNovelty(tuple(exact), tuple(strict))


LEAN_PREAMBLE = r'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements

/-! Source-valid v4 two-Kalmanson successor of the FourPoint root. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
'''


LEAN_POSTAMBLE = rf'''

theorem cancellationOccurrences_length : cancellationOccurrences.length = {EXPECTED_OCCURRENCES} := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def v4TwoKalmansonRefinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem v4TwoKalmansonRefinementClauses_length :
    v4TwoKalmansonRefinementClauses.length = {EXPECTED_SUFFIX_CLAUSES} := by
  native_decide

theorem v4TwoKalmansonRefinementClauses_nodup :
    v4TwoKalmansonRefinementClauses.Nodup := by
  native_decide

theorem sourceAssign_v4TwoKalmansonRefinementClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ v4TwoKalmansonRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [v4TwoKalmansonRefinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

def canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf :
    Std.Sat.CNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf ++
    v4TwoKalmansonRefinementClauses

theorem canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf.length =
      {EXPECTED_ROOT_CLAUSES} := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf_length,
    v4TwoKalmansonRefinementClauses_length]

theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_v4TwoKalmansonRefinementClauses source clause hsuffix

#print axioms cancellationOccurrences_all_check
#print axioms v4TwoKalmansonRefinementClauses_nodup
#print axioms sourceAssign_v4TwoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinements
end Problem97
'''


def render_lean(ledger: Mapping[str, Any]) -> str:
    occurrences = validate_ledger(ledger)
    entries = [lean_occurrence(hits, forward, reverse) for hits, forward, reverse in occurrences]
    return LEAN_PREAMBLE + "[\n" + ",\n".join(entries) + "]\n" + LEAN_POSTAMBLE


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--candidate-ledger", type=Path, default=LEDGER)
    parser.add_argument("--lean-output", type=Path, required=True)
    parser.add_argument("--parent-cnf", type=Path)
    args = parser.parse_args()
    ledger = load_authenticated_ledger(args.candidate_ledger)
    occurrences = validate_ledger(ledger)
    V2.write_text_once(args.lean_output, render_lean(ledger))
    message = {
        "occurrences": len(occurrences),
        "raw_suffix_clauses": EXPECTED_SUFFIX_CLAUSES,
        "root_clauses": EXPECTED_ROOT_CLAUSES,
    }
    if args.parent_cnf is not None:
        novelty = classify_parent_novelty(
            args.parent_cnf,
            render_dimacs_suffix(occurrences),
            expected_num_vars=308,
            expected_clause_count=PARENT_ROOT_CLAUSES,
        )
        if (
            novelty.exact_duplicate_clause_count != EXPECTED_PARENT_EXACT_DUPLICATE_CLAUSES
            or novelty.strictly_subsumed_clause_count
            != EXPECTED_PARENT_STRICTLY_SUBSUMED_CLAUSES
        ):
            raise PromotionError("parent exact/subsumption census drifted")
        message["parent_exact_duplicate_clauses"] = novelty.exact_duplicate_clause_count
        message["parent_strictly_subsumed_clauses"] = novelty.strictly_subsumed_clause_count
        message["strict_new_clauses"] = EXPECTED_STRICT_NEW_CLAUSES
    print(json.dumps(message, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
