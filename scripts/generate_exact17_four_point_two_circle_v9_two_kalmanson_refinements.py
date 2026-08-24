"""Render the authenticated V9 two-Kalmanson promotion packet.

This module intentionally accepts only the refrozen production ledger and its
accepted mine receipt.  The earlier V8 diagnostic ledger is never a fallback.
"""

from __future__ import annotations

import argparse
import importlib.util
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any, NamedTuple

REPO = Path(__file__).resolve().parents[1]
SCRIPTS = REPO / "scripts"
sys.path.insert(0, str(SCRIPTS))
sys.path.insert(0, str(REPO))


def _load(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load helper {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


V8 = _load(
    "exact17_v9_twok_v8_helper",
    SCRIPTS / "generate_exact17_four_point_two_circle_v8_two_kalmanson_refinements.py",
)
MINER = _load(
    "exact17_v9_twok_v8_miner",
    SCRIPTS
    / "mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_model.py",
)

PromotionError = V8.PromotionError
canonical_json_bytes = V8.canonical_json_bytes
sha256_bytes = V8.sha256_bytes
self_hash = V8.self_hash
strict_json = V8.strict_json
require_exact_keys = V8.require_exact_keys
candidate_id = V8.candidate_id
lean_occurrence = V8.lean_occurrence
lean_occurrence_check = V8.lean_occurrence_check
path_hits = V8.path_hits
write_text_once = V8.write_text_once
V4 = V8.V4
COMBINED = V8.COMBINED

OFFICIAL_ARTIFACTS = (
    REPO
    / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "v8-two-kalmanson-refinements-sat-portfolio-v8-refrozen-20260824/"
    "sat-profile-portfolio-v8-refrozen/artifacts"
)
LEDGER = OFFICIAL_ARTIFACTS / "candidate-ledger.json"
RECEIPT = OFFICIAL_ARTIFACTS / "mine-receipt.json"

PARENT_CNF = (
    REPO
    / "scratch/runs/exact17-v8-two-kalmanson-successor-preparer-20260823/"
    "preparation-v1/artifacts/cells/"
    "canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-"
    "refinements-next-center-02-physical-none/"
    "canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-"
    "refinements-next-center-02-physical-none.cnf"
)
PARENT_CNF_SHA256 = "cd555351507fdc28f7338818094ddc31aac9a55502ac33eb0860bf918137b87b"
PARENT_CNF_BYTES = 346_306_919
PARENT_PHYSICAL_CLAUSES = 7_409_845
PARENT_ROOT_CLAUSES = 7_409_839

# These pins are deliberately unfinalized in the scaffold.  A later promotion
# lane must populate every one from the official refrozen artifacts.  Keeping
# them empty makes accidental consumption of a diagnostic ledger impossible.
OFFICIAL_LEDGER_SHA256 = ""
OFFICIAL_RECEIPT_SHA256 = ""
LEDGER_SHA256 = OFFICIAL_LEDGER_SHA256
RECEIPT_SHA256 = OFFICIAL_RECEIPT_SHA256
EXPECTED_LEDGER_SHA256 = OFFICIAL_LEDGER_SHA256
EXPECTED_RECEIPT_SHA256 = OFFICIAL_RECEIPT_SHA256
EXPECTED_CANDIDATE_IDS: tuple[str, ...] = ()
EXPECTED_CANDIDATE_RECORD_SHA256: tuple[str, ...] = ()
EXPECTED_CANDIDATE_RECORDS: tuple[tuple[str, str], ...] = ()
EXPECTED_PARENT_EXACT_MULTIPLICITIES: tuple[int, ...] = ()
EXPECTED_PARENT_SUBSUMER_MULTIPLICITIES: tuple[int, ...] = ()
EXPECTED_PARENT_NOVELTY_CENSUS_SHA256 = "4a4d3e784ce9b89fdfc127803aaf52a3e6d64a65da68f1bbe569ab8aa13dbc81"
EXPECTED_STRICT_NEW_INDICES = (
    0, 1, 3, 4, 5, 6, 7, 8, 10, 12, 13, 14, 15, 16, 17, 18, 20, 22,
    23, 24, 26, 28, 29, 30, 31, 32, 34, 36, 37, 38, 40, 41, 42, 44, 45,
    47, 48, 49, 50, 52, 54, 56, 57, 58, 59, 60, 61, 63, 64, 66, 67, 68,
    72, 73, 74, 75,
)

V8_LEAN = (
    REPO
    / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V8TwoKalmansonRefinements.lean"
)
V8_LEAN_SHA256 = "d1d83a7fd4890be2ac2af56d51182cb2db3be43664f6601a2fffa7b04ff400b8"

N = 17
NUM_VARIABLES = 308
EXPECTED_TOTAL_CANDIDATES = 19
EXPECTED_OCCURRENCES = 19
EXPECTED_ORBIT_CLAUSES = 76
EXPECTED_PARENT_SUBSUMED_CLAUSES = 20
EXPECTED_STRICT_NEW_CLAUSES = 56
EXPECTED_V9_ROOT_CLAUSES = PARENT_ROOT_CLAUSES + EXPECTED_STRICT_NEW_CLAUSES
EXPECTED_ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
EXPECTED_ORBIT_JSON_SHA256 = "45f6534755d2242c4175824716ab6e7e1a7ef9251793ced6d20b21bd44c74206"
EXPECTED_STRICT_NEW_JSON_SHA256 = "e6f2940cdea17d8f5819c65e9c7b181f83f107034b5043ae73d9c6dcb354bcd2"
EXPECTED_STRICT_NEW_INDEX_LIST_SHA256 = "9b519c1292c89b4cd4a98f0cd6801d769b5eaa7fd300d9e1c9aab1dd1a649987"
FAMILY = "two-kalmanson-cancellation"
CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
    "false_of_twoKalmansonCancellationData_of_check"
)
LEDGER_SCHEMA = MINER.WAVE_MINE_LEDGER_SCHEMA
CANDIDATE_SCHEMA = MINER.WAVE_MINE_CANDIDATE_SCHEMA
RECEIPT_SCHEMA = MINER.WAVE_MINE_SCHEMA
MINER_SOURCE_BYTES = 10009
MINER_SOURCE_SHA256 = "e370ada228b6bcdff619e2997b0b3faa54ac11bbe913546e7b266398a7e402c5"
LEDGER_DESCRIPTOR_KEYS = {"bytes", "path", "sha256"}
TOP_KEYS = V8.TOP_KEYS
CANDIDATE_KEYS = V8.CANDIDATE_KEYS
TWOK_PAYLOAD_KEYS = V8.TWOK_PAYLOAD_KEYS
Occurrence = tuple[frozenset[tuple[int, int]], Mapping[str, Any], Mapping[str, Any]]


class ImmediateParentNovelty(NamedTuple):
    exact_duplicate_multiplicities: tuple[int, ...]
    strict_subsumer_multiplicities: tuple[int, ...]
    strict_new_indices: tuple[int, ...]
    census_sha256: str


def _canonical_sha256(value: Any) -> str:
    return sha256_bytes(canonical_json_bytes(value))


def _require_finalized_pins() -> None:
    if len(EXPECTED_LEDGER_SHA256) != 64 or len(EXPECTED_RECEIPT_SHA256) != 64:
        raise PromotionError("V9 production pins are unfinalized")
    if len(EXPECTED_CANDIDATE_IDS) != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("V9 candidate identity pins are unfinalized")
    if len(EXPECTED_CANDIDATE_RECORD_SHA256) != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("V9 candidate record pins are unfinalized")
    if len(EXPECTED_CANDIDATE_RECORDS) != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("V9 candidate identity-pair pins are unfinalized")
    if len(EXPECTED_PARENT_EXACT_MULTIPLICITIES) != EXPECTED_ORBIT_CLAUSES:
        raise PromotionError("V9 exact-multiplicity pins are unfinalized")
    if len(EXPECTED_PARENT_SUBSUMER_MULTIPLICITIES) != EXPECTED_ORBIT_CLAUSES:
        raise PromotionError("V9 subsumer-multiplicity pins are unfinalized")
    if len(EXPECTED_STRICT_NEW_INDICES) != EXPECTED_STRICT_NEW_CLAUSES:
        raise PromotionError("V9 strict-new index pins are unfinalized")
    if len(EXPECTED_PARENT_NOVELTY_CENSUS_SHA256) != 64:
        raise PromotionError("V9 novelty-census pin is unfinalized")


def _rows_and_order(ledger: Mapping[str, Any]) -> tuple[list[Any], tuple[int, ...]]:
    return V8._rows_and_order(ledger)


def _support(candidate: Mapping[str, Any]) -> frozenset[tuple[int, int]]:
    return V8._support(candidate)


def render_orbit_clauses(
    occurrences: Sequence[Occurrence],
) -> tuple[tuple[int, ...], ...]:
    return tuple(
        clause
        for hits, _forward, _reverse in occurrences
        for clause in V4.orbit_clauses(hits)
    )


def strict_new_clauses(
    clauses: Sequence[tuple[int, ...]], indices: Sequence[int]
) -> tuple[tuple[int, ...], ...]:
    if len(clauses) != EXPECTED_ORBIT_CLAUSES:
        raise PromotionError("V9 orbit clause count drifted")
    if type(indices) is not tuple:
        indices = tuple(indices)
    if len(indices) != EXPECTED_STRICT_NEW_CLAUSES:
        raise PromotionError("V9 strict-new clause count drifted")
    if any(type(index) is not int or not 0 <= index < len(clauses) for index in indices):
        raise PromotionError("V9 strict-new index list is malformed")
    if len(set(indices)) != len(indices):
        raise PromotionError("V9 strict-new index list is not unique")
    if tuple(indices) != EXPECTED_STRICT_NEW_INDICES:
        raise PromotionError("V9 strict-new index list drifted")
    if _canonical_sha256(list(indices)) != EXPECTED_STRICT_NEW_INDEX_LIST_SHA256:
        raise PromotionError("V9 strict-new index-list hash drifted")
    result = tuple(clauses[index] for index in indices)
    if len(set(result)) != EXPECTED_STRICT_NEW_CLAUSES:
        raise PromotionError("V9 strict-new clauses are not unique")
    if _canonical_sha256([list(clause) for clause in result]) != EXPECTED_STRICT_NEW_JSON_SHA256:
        raise PromotionError("V9 strict-new clause hash drifted")
    return result


def _validate_scanner(scanner: Any) -> None:
    if type(scanner) is not dict:
        raise PromotionError("V8 scanner identity is malformed")
    expected = {
        "name": MINER.MINER_NAME,
        "schema": MINER.MINER_SCHEMA,
        "source_path": MINER.MINER_RELATIVE,
        "version": MINER.MINER_VERSION,
    }
    for key, value in expected.items():
        if scanner.get(key) != value:
            raise PromotionError(f"V8 scanner {key} identity drifted")
    source = REPO / MINER.MINER_RELATIVE
    if source.stat().st_size != MINER_SOURCE_BYTES or sha256_bytes(source.read_bytes()) != MINER_SOURCE_SHA256:
        raise PromotionError("V8 miner source bytes/SHA drifted")
    if scanner.get("source_sha256") != MINER_SOURCE_SHA256:
        raise PromotionError("V8 scanner source identity drifted")


def validate_ledger(ledger: Mapping[str, Any]) -> list[Occurrence]:
    _require_finalized_pins()
    require_exact_keys(ledger, TOP_KEYS, "official V9 candidate ledger")
    if ledger.get("schema") != LEDGER_SCHEMA or ledger.get("status") != "COMPLETE":
        raise PromotionError("official V9 ledger schema/status drifted")
    if ledger.get("manifest_sha256") != self_hash(ledger, "manifest_sha256"):
        raise PromotionError("official V9 ledger self-hash drifted")
    if ledger.get("scan_complete") is not True or ledger.get("source_valid_only") is not True:
        raise PromotionError("official V9 ledger is not source-valid only")
    if ledger.get("complete_no_candidates") is not False:
        raise PromotionError("official V9 ledger incorrectly reports no candidates")
    if ledger.get("candidates_examined") != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("official V9 candidate census drifted")
    _validate_scanner(ledger.get("scanner"))
    if ledger.get("source_valid_family_inventory") != list(MINER.SOURCE_VALID_FAMILIES):
        raise PromotionError("official V9 source-valid family inventory drifted")
    family_inventory = ledger.get("family_inventory")
    if type(family_inventory) is not dict or family_inventory.get("family_candidate_counts") != {
        "formalized-core-bank": 0,
        "perpendicular-bisector-equality-component": 0,
        FAMILY: EXPECTED_TOTAL_CANDIDATES,
    }:
        raise PromotionError("official V9 family inventory drifted")
    candidates = ledger.get("candidates")
    if type(candidates) is not list or len(candidates) != EXPECTED_TOTAL_CANDIDATES:
        raise PromotionError("official V9 candidate record count drifted")
    rows, order = _rows_and_order(ledger)
    if order != EXPECTED_ORDER:
        raise PromotionError("official V9 decoded order drifted")
    reverse_order = tuple(reversed(order))
    occurrences: list[Occurrence] = []
    seen_supports: set[frozenset[tuple[int, int]]] = set()
    for index, raw_candidate in enumerate(candidates):
        candidate = require_exact_keys(raw_candidate, CANDIDATE_KEYS, f"V9 candidate {index}")
        if candidate.get("schema") != CANDIDATE_SCHEMA or candidate.get("source_valid") is not True:
            raise PromotionError(f"V9 candidate {index} schema/source-valid drifted")
        if candidate.get("candidate_id") != candidate_id(candidate):
            raise PromotionError(f"V9 candidate {index} identity replay failed")
        if candidate.get("record_sha256") != self_hash(candidate, "record_sha256"):
            raise PromotionError(f"V9 candidate {index} record self-hash drifted")
        if (candidate.get("candidate_id"), candidate.get("record_sha256")) != EXPECTED_CANDIDATE_RECORDS[index]:
            raise PromotionError(f"V9 candidate {index} defense-in-depth identity drifted")
        if candidate.get("candidate_id") != EXPECTED_CANDIDATE_IDS[index] or candidate.get("record_sha256") != EXPECTED_CANDIDATE_RECORD_SHA256[index]:
            raise PromotionError(f"V9 candidate {index} identity pin drifted")
        if candidate.get("family") != FAMILY or candidate.get("lean_consumer") != CONSUMER:
            raise PromotionError(f"V9 candidate {index} two-Kalmanson binding drifted")
        payload = require_exact_keys(candidate.get("payload"), TWOK_PAYLOAD_KEYS, f"V9 candidate {index} payload")
        if payload.get("paired_forward_reverse_replay") is not True or payload.get("occurrence_union_cover") is not True:
            raise PromotionError(f"V9 candidate {index} pairing certificate drifted")
        forward, reverse = payload.get("forward"), payload.get("reverse")
        if type(forward) is not dict or type(reverse) is not dict:
            raise PromotionError(f"V9 candidate {index} path records are malformed")
        hits = _support(candidate)
        if hits in seen_supports:
            raise PromotionError("V9 two-Kalmanson support is duplicated")
        seen_supports.add(hits)
        if path_hits(forward) != frozenset(tuple(hit) for hit in payload.get("forward_path_support", [])):
            raise PromotionError(f"V9 candidate {index} forward support drifted")
        if path_hits(reverse) != frozenset(tuple(hit) for hit in payload.get("reverse_path_support", [])):
            raise PromotionError(f"V9 candidate {index} reverse support drifted")
        if not path_hits(forward) <= hits or not V8.reflected(path_hits(reverse)) <= hits:
            raise PromotionError(f"V9 candidate {index} support/path certificate drifted")
        if forward.get("projection", {}).get("order") != list(order) or reverse.get("projection", {}).get("order") != list(reverse_order):
            raise PromotionError(f"V9 candidate {index} projection order drifted")
        if not lean_occurrence_check(hits, forward, reverse, rows=rows, forward_order=order, reverse_order=reverse_order):
            raise PromotionError(f"V9 candidate {index} structural replay failed")
        occurrences.append((hits, forward, reverse))
    clauses = render_orbit_clauses(occurrences)
    if len(clauses) != EXPECTED_ORBIT_CLAUSES or len(set(clauses)) != EXPECTED_ORBIT_CLAUSES:
        raise PromotionError("V9 orbit is not a 76-clause set")
    if _canonical_sha256([list(clause) for clause in clauses]) != EXPECTED_ORBIT_JSON_SHA256:
        raise PromotionError("V9 ordered orbit hash drifted")
    return occurrences


def _load_exact_artifact(path: Path, expected: Path, label: str) -> bytes:
    if path.is_symlink() or not path.is_file() or path.resolve() != expected.resolve():
        raise PromotionError(f"official {label} path drifted")
    return path.read_bytes()


def load_authenticated_ledger(path: Path = LEDGER) -> dict[str, Any]:
    _require_finalized_pins()
    raw = _load_exact_artifact(path, LEDGER, "ledger")
    if sha256_bytes(raw) != EXPECTED_LEDGER_SHA256:
        raise PromotionError("official V9 ledger byte hash drifted")
    ledger = strict_json(raw)
    validate_ledger(ledger)
    return ledger


def validate_receipt_descriptor(descriptor: Any, raw_ledger: bytes) -> None:
    if type(descriptor) is not dict or set(descriptor) != LEDGER_DESCRIPTOR_KEYS:
        raise PromotionError("official V9 receipt ledger descriptor keys drifted")
    expected_path = LEDGER.relative_to(REPO).as_posix()
    expected_sha = sha256_bytes(raw_ledger)
    if descriptor.get("path") != expected_path:
        raise PromotionError("official V9 receipt ledger descriptor path drifted")
    if descriptor.get("bytes") != len(raw_ledger) or descriptor.get("sha256") != expected_sha:
        raise PromotionError("official V9 receipt ledger descriptor identity drifted")


def validate_receipt_bindings(receipt: Mapping[str, Any], ledger: Mapping[str, Any]) -> None:
    for key in ("job_id", "model_sha256", "portfolio_cell_id"):
        if receipt.get(key) != ledger.get(key):
            raise PromotionError(f"official V9 receipt {key} binding drifted")


def load_authenticated_receipt(path: Path = RECEIPT, ledger_path: Path = LEDGER) -> dict[str, Any]:
    _require_finalized_pins()
    raw_ledger = _load_exact_artifact(ledger_path, LEDGER, "ledger")
    raw = _load_exact_artifact(path, RECEIPT, "mine receipt")
    if sha256_bytes(raw_ledger) != EXPECTED_LEDGER_SHA256:
        raise PromotionError("official V9 receipt ledger byte hash drifted")
    if sha256_bytes(raw) != EXPECTED_RECEIPT_SHA256:
        raise PromotionError("official V9 mine receipt byte hash drifted")
    receipt = strict_json(raw)
    keys = {"candidate_ledger", "candidate_ledger_sha256", "candidates_examined", "complete_equality_component_checked", "complete_no_candidates", "job_id", "model_sha256", "models_mined", "portfolio_cell_id", "scan_complete", "source_valid_only", "schema", "status"}
    require_exact_keys(receipt, keys, "official V9 mine receipt")
    if receipt.get("schema") != RECEIPT_SCHEMA or receipt.get("status") != "ACCEPTED":
        raise PromotionError("official V9 mine receipt schema/status drifted")
    if receipt.get("candidate_ledger_sha256") != sha256_bytes(raw_ledger):
        raise PromotionError("official V9 receipt/ledger identity drifted")
    validate_receipt_descriptor(receipt.get("candidate_ledger"), raw_ledger)
    ledger = strict_json(raw_ledger)
    validate_receipt_bindings(receipt, ledger)
    if receipt.get("candidates_examined") != EXPECTED_TOTAL_CANDIDATES or receipt.get("models_mined") != 1:
        raise PromotionError("official V9 receipt census drifted")
    if receipt.get("complete_equality_component_checked") is not True or receipt.get("complete_no_candidates") is not False or receipt.get("scan_complete") is not True or receipt.get("source_valid_only") is not True:
        raise PromotionError("official V9 receipt completeness drifted")
    return receipt


def verify_v8_parent_source(path: Path = V8_LEAN) -> None:
    raw = _load_exact_artifact(path, V8_LEAN, "V8 parent")
    if sha256_bytes(raw) != V8_LEAN_SHA256:
        raise PromotionError("V8 parent source identity drifted")


def compute_parent_facts(occurrences: Sequence[Occurrence], parent_cnf: Path = PARENT_CNF) -> ImmediateParentNovelty:
    _require_finalized_pins()
    verify_v8_parent_source()
    clauses = render_orbit_clauses(occurrences)
    baseline = COMBINED.classify_parent_prefix_novelty(
        parent_cnf, clauses, expected_sha256=PARENT_CNF_SHA256,
        expected_bytes=PARENT_CNF_BYTES, expected_num_variables=NUM_VARIABLES,
        expected_total_clauses=PARENT_PHYSICAL_CLAUSES, parent_prefix_clauses=PARENT_ROOT_CLAUSES,
    )
    strict_new = tuple(index for index in range(len(clauses)) if baseline.exact_duplicate_multiplicities[index] == 0 and baseline.strict_subsumer_multiplicities[index] == 0)
    if sum(count > 0 for count in baseline.strict_subsumer_multiplicities) != EXPECTED_PARENT_SUBSUMED_CLAUSES:
        raise PromotionError("V9 parent strict-subsumption census drifted")
    if baseline.exact_duplicate_multiplicities != EXPECTED_PARENT_EXACT_MULTIPLICITIES:
        raise PromotionError("V9 parent exact multiplicities drifted")
    if baseline.strict_subsumer_multiplicities != EXPECTED_PARENT_SUBSUMER_MULTIPLICITIES:
        raise PromotionError("V9 parent subsumer multiplicities drifted")
    if baseline.census_sha256 != EXPECTED_PARENT_NOVELTY_CENSUS_SHA256:
        raise PromotionError("V9 parent novelty census hash drifted")
    strict_new_clauses(clauses, strict_new)
    return ImmediateParentNovelty(baseline.exact_duplicate_multiplicities, baseline.strict_subsumer_multiplicities, strict_new, baseline.census_sha256)


def _occurrence_refinement_expression(index: int) -> str:
    occurrence, within = divmod(index, 4)
    order = within // 2
    direction = ".forward" if within % 2 == 0 else ".reverse"
    return f"occurrenceClause v9CancellationOccurrence{occurrence}.hits {order} {direction}"


def render_lean(ledger: Mapping[str, Any], strict_indices: Sequence[int]) -> str:
    occurrences = validate_ledger(ledger)
    strict_new_clauses(render_orbit_clauses(occurrences), strict_indices)
    definitions = []
    for index, (hits, forward, reverse) in enumerate(occurrences):
        definitions.append(f"def v9CancellationOccurrence{index} : CancellationOccurrence :=\n  {lean_occurrence(hits, forward, reverse).lstrip()}")
    names = ", ".join(f"v9CancellationOccurrence{index}" for index in range(EXPECTED_OCCURRENCES))
    expressions = ",\n    ".join(_occurrence_refinement_expression(index) for index in strict_indices)
    return f'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinements

/-! Authenticated V9 two-Kalmanson promotion over the V8 root. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements
open ATailFrontierLiveClosure.GenericRowNogoodCertificate
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinements

private abbrev occurrenceClause := ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClause
private abbrev occurrenceClauses := ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

{chr(10).join(definitions)}

def v9CancellationOccurrences : List CancellationOccurrence := [{names}]
theorem v9CancellationOccurrences_length : v9CancellationOccurrences.length = {EXPECTED_OCCURRENCES} := by native_decide
theorem v9CancellationOccurrences_all_check : v9CancellationOccurrences.all CancellationOccurrence.check = true := by native_decide
def v9TwoKalmansonOrbitClauses : Std.Sat.CNF Atom := v9CancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits
theorem v9TwoKalmansonOrbitClauses_length : v9TwoKalmansonOrbitClauses.length = {EXPECTED_ORBIT_CLAUSES} := by native_decide
theorem v9TwoKalmansonOrbitClauses_nodup : v9TwoKalmansonOrbitClauses.Nodup := by native_decide
theorem sourceAssign_v9TwoKalmansonOrbitClauses {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) : ∀ clause ∈ v9TwoKalmansonOrbitClauses, Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [v9TwoKalmansonOrbitClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp v9CancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses, ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction
def v9TwoKalmansonRefinementClauses : Std.Sat.CNF Atom := [{expressions}]
theorem v9TwoKalmansonRefinementClauses_length : v9TwoKalmansonRefinementClauses.length = {EXPECTED_STRICT_NEW_CLAUSES} := by native_decide
theorem v9TwoKalmansonRefinementClauses_nodup : v9TwoKalmansonRefinementClauses.Nodup := by native_decide
theorem v9TwoKalmansonRefinementClauses_subset_orbit : ∀ clause ∈ v9TwoKalmansonRefinementClauses, clause ∈ v9TwoKalmansonOrbitClauses := by native_decide
theorem sourceAssign_v9TwoKalmansonRefinementClauses {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) : ∀ clause ∈ v9TwoKalmansonRefinementClauses, Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  exact sourceAssign_v9TwoKalmansonOrbitClauses source clause (v9TwoKalmansonRefinementClauses_subset_orbit clause hclause)
def canaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinementCnf : Std.Sat.CNF Atom := canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf ++ v9TwoKalmansonRefinementClauses
theorem canaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinementCnf_length : canaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinementCnf.length = {EXPECTED_V9_ROOT_CLAUSES} := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinementCnf, canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf_length, v9TwoKalmansonRefinementClauses_length]
theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinementCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinementCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV8TwoKalmansonRefinementCnf
        source horder
    rw [Std.Sat.CNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_v9TwoKalmansonRefinementClauses source clause hsuffix

#print axioms v9CancellationOccurrences_all_check
#print axioms v9TwoKalmansonOrbitClauses_nodup
#print axioms sourceAssign_v9TwoKalmansonOrbitClauses
#print axioms v9TwoKalmansonRefinementClauses_nodup
#print axioms sourceAssign_v9TwoKalmansonRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinementCnf
end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV9TwoKalmansonRefinements
end Problem97
'''


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--candidate-ledger", type=Path, default=LEDGER)
    parser.add_argument("--mine-receipt", type=Path, default=RECEIPT)
    parser.add_argument("--parent-cnf", type=Path, default=PARENT_CNF)
    parser.add_argument("--lean-output", type=Path, required=True)
    args = parser.parse_args()
    ledger = load_authenticated_ledger(args.candidate_ledger)
    load_authenticated_receipt(args.mine_receipt, args.candidate_ledger)
    novelty = compute_parent_facts(validate_ledger(ledger), args.parent_cnf)
    write_text_once(args.lean_output, render_lean(ledger, novelty.strict_new_indices))
    print(f"promoted {EXPECTED_OCCURRENCES} occurrences / {EXPECTED_ORBIT_CLAUSES} orbit clauses; parent-subsumed={EXPECTED_PARENT_SUBSUMED_CLAUSES}; strict-new={EXPECTED_STRICT_NEW_CLAUSES}; root={EXPECTED_V9_ROOT_CLAUSES}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
