"""Generate the exact-17 Child45 wave weighted Kalmanson bank.

The input is the authenticated, terminal Child45 ASSUMPTION_CNF envelope.  This
script performs the exact evidence and producer-bank checks before projecting
the nine deterministic union-support representatives into Lean data.  It also
writes a provenance ledger retaining every one of the eleven unique checked
certificates and all thirteen cell mappings.
"""

from __future__ import annotations

import argparse
import base64
import hashlib
import json
import re
import sys
from collections import defaultdict
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from census.atail_force import producer_bank
from census.p97_search import exact17_source_model_replay as replay

N = 17
VARIABLES = 308
PARENT_CLAUSES = 5_848_820
CHILD45_CLAUSES = 5_848_824
CURRENT_FORTYFIFTH_CLAUSES = 5_848_828
NEW_CLAUSES = 36
CHILD46_CLAUSES = CURRENT_FORTYFIFTH_CLAUSES + NEW_CLAUSES
CHILD45_ROOT_SHA256 = "3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2"
CHILD45_ROOT_BYTES = 291_704_992
CHILD45_SOURCE_PARENT_SHA256 = (
    "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
)
CHILD45_SOURCE_PARENT_BYTES = 291_704_790
CHILD45_PRODUCER_MANIFEST_SHA256 = (
    "f790a9ea3f9100f0d63a61b8cc197d3417eaa9c553d578c1157413690157908a"
)
CHILD45_PROFILE_SHA256 = (
    "845e9a10137267764e07bca6e2d01c1a0b3dff5856e646b569b8c46d51c7d48f"
)
RECEIPT_SHA256 = "4aad001c679627fa2797cbe4f207c3ff574dfa363f00cab223a5e73bee7f6160"
TERMINAL_ENVELOPE_SHA256 = (
    "28786f4898730b6776b0ce656eb16fbf74d25beed54e269a97fcf333dd3f2ee4"
)
TERMINAL_ENVELOPE_EMBEDDED_SHA256 = (
    "bc388ef9ccc39508f4be786131f04a0139a9bdd3c494933a7d886ad97e6cc85f"
)
RECEIPT_PATH = (
    ROOT / "scratch/exact17-child45-wave-mine/strict-validate-replay-production.json"
)
RECEIPT_SCHEMA = "p97-cegar-wave-cli/v1"
TERMINAL_ENVELOPE_SCHEMA = "p97-cegar-assumption-cnf-engine/v1"
FORTYFIFTH_SOURCE_RELATIVE = "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortyFifthModelRefinements.lean"
FORTYFIFTH_SOURCE_SHA256 = (
    "302a7fc5751bc9922d859fb0f2e085b0ca224a74ccad798e2a27a89c9b2ef4ea"
)
FORTYFIFTH_SOURCE_BYTES = 6272
FORTYFIFTH_EXPORT_RELATIVE = "scratch/exact17-lean-to-sat/exact17-forty-sixth-root-forty-fifth-model-refinements.cnf"
FORTYFIFTH_EXPORT_SHA256 = (
    "e74795bf5dcf5748e9872bf37f115c8d6237d0f3b0332d065a711bcbfc8aabe5"
)
FORTYFIFTH_EXPORT_BYTES = 291_705_130
INPUT_PATH = (
    ROOT / "scratch/cegar-wave-v2/exact17-child45-nextcenter-assumption-output.json"
)
PARENT_LEAN = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortyFifthModelRefinements.lean"
)
OUTPUT_LEAN = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortySixthModelRefinements.lean"
)
OUTPUT_LEDGER = (
    ROOT / "scratch/exact17-child45-wave-mine/child45-wave-occurrence-ledger.json"
)
REPRESENTATIVE_CELLS = (
    "next-center-00",
    "next-center-01",
    "next-center-02",
    "next-center-03",
    "next-center-04",
    "next-center-05",
    "next-center-06",
    "next-center-13",
    "next-center-16",
)
EXPECTED_CELLS = (
    "next-center-00",
    "next-center-01",
    "next-center-02",
    "next-center-03",
    "next-center-04",
    "next-center-05",
    "next-center-06",
    "next-center-07",
    "next-center-12",
    "next-center-13",
    "next-center-14",
    "next-center-15",
    "next-center-16",
)


def _strict_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _load_json(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=_strict_pairs)


def _load_authenticated_json(path: Path, expected_sha256: str) -> dict[str, Any]:
    payload = path.read_bytes()
    if sha256_bytes(payload) != expected_sha256:
        raise ValueError(f"authenticated JSON hash drifted: {path.name}")
    return json.loads(payload.decode("utf-8"), object_pairs_hook=_strict_pairs)


def _relative(path: Path) -> str:
    return str(path.resolve().relative_to(ROOT))


def canonical_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def _path_hits(core: dict[str, Any]) -> set[tuple[int, int]]:
    hits: set[tuple[int, int]] = set()
    for pairing in core["pairings"]:
        for step in pairing["path"]["steps"]:
            if step["kind"] == "row":
                hits.update(
                    ((step["center"], step["first"]), (step["center"], step["second"]))
                )
    return hits


def _path_choices(core: dict[str, Any]) -> dict[int, set[int]]:
    choices: dict[int, set[int]] = {}
    for pairing in core["pairings"]:
        for step in pairing["path"]["steps"]:
            if step["kind"] == "row":
                choices.setdefault(step["center"], set()).update(
                    (step["first"], step["second"])
                )
    return choices


def _position_core(core: dict[str, Any]) -> dict[str, Any]:
    # The producer's pairings and path steps already use boundary positions;
    # only the source-model `quad_labels` need translating to that space.
    pairings = core["pairings"]
    terms = []
    for term in core["terms"]:
        terms.append(
            {
                "quad": [term["quad"][key] for key in ("a", "b", "c", "d")],
                "form": term["form"],
                "weight": term["weight"],
            }
        )
    choices = [
        {"center": center, "support": sorted(support)}
        for center, support in sorted(_path_choices(core).items())
    ]
    return {"terms": terms, "pairings": pairings, "row_choices": choices}


def _validate_receipt(receipt_path: Path) -> dict[str, Any]:
    try:
        receipt = _load_authenticated_json(receipt_path, RECEIPT_SHA256)
    except ValueError as exc:
        raise ValueError("Child45 strict replay receipt hash drifted") from exc
    expected = {
        "classification": "SAT_SEMANTIC_REPLAYED",
        "command": "validate-replay",
        "custody_status": "OFFLINE_CROSS_BOUND",
        "envelope_sha256": TERMINAL_ENVELOPE_EMBEDDED_SHA256,
        "output": str(INPUT_PATH.resolve()),
        "schema": RECEIPT_SCHEMA,
        "status": "PASS",
    }
    if receipt != expected:
        raise ValueError(
            "strict replay receipt schema/status/command/custody binding drifted"
        )
    return receipt


def _validate_authenticated_envelope(
    input_path: Path, receipt_path: Path
) -> dict[str, Any]:
    _validate_receipt(receipt_path)
    try:
        envelope = _load_authenticated_json(input_path, TERMINAL_ENVELOPE_SHA256)
    except ValueError as exc:
        raise ValueError("terminal Child45 envelope hash drifted") from exc
    if envelope.get("schema") != TERMINAL_ENVELOPE_SCHEMA:
        raise ValueError("terminal Child45 envelope schema drifted")
    if envelope.get("envelope_sha256") != TERMINAL_ENVELOPE_EMBEDDED_SHA256:
        raise ValueError("terminal Child45 embedded envelope binding drifted")
    return envelope


def _validate_occurrence(cell: dict[str, Any]) -> dict[str, Any]:
    result = cell["semantic_replay"]["result"]
    if result["schema"] != "p97-exact17-child45-assumption-sat-replay/v1":
        raise ValueError("Child45 result schema drifted")
    if (
        result["root_sha256"] != CHILD45_ROOT_SHA256
        or result["root_bytes"] != CHILD45_ROOT_BYTES
    ):
        raise ValueError("Child45 root identity drifted")
    if (
        result["parent_sha256"] != CHILD45_SOURCE_PARENT_SHA256
        or result["parent_bytes"] != CHILD45_SOURCE_PARENT_BYTES
    ):
        raise ValueError("Child44 source-parent identity drifted")
    kalmanson = result["kalmanson"]
    if (
        kalmanson["status"] != "LINEARLY_INFEASIBLE"
        or kalmanson["refinement_disposition"] != "EXACT_WEIGHTED_CERTIFICATE_READY"
    ):
        raise ValueError("cell is not an exact weighted Kalmanson result")
    evidence_wrapper = kalmanson["exact_evidence"]
    evidence = base64.b64decode(evidence_wrapper["base64"], validate=True)
    evidence_hash = sha256_bytes(evidence)
    if (
        evidence_hash != evidence_wrapper["sha256"]
        or evidence_hash != kalmanson["exact_evidence_sha256"]
    ):
        raise ValueError("exact evidence hash drifted")
    evidence_value = json.loads(evidence)
    if (
        evidence_value["schema"]
        != "p97-exact17-child44-exact-weighted-kalmanson-certificate/v1"
    ):
        raise ValueError("exact evidence schema drifted")
    model = result["source_model"]
    source = replay.DecodedSourceModel(
        rows=tuple(tuple(row) for row in model["rows"]),
        next_center=model["next_center"],
        named_order=model["named_order"],
        selected_order=tuple(model["selected_order"]),
        digest=model["digest"],
    )
    replay._validate_decoded_source_model(source)
    atoms, _equality_classes, system_hash = replay._build_kalmanson_system(source)
    if (
        len(atoms) != 4_760
        or system_hash != kalmanson["system_sha256"]
        or system_hash != evidence_value["system_sha256"]
    ):
        raise ValueError("Kalmanson system identity drifted")
    terms = []
    for term in kalmanson["weighted_terms"]:
        atom = atoms[term["atom_index"]]
        if (
            tuple(term["quad"]) != atom.quad_labels
            or term["form"] != atom.form
            or term["weight"] <= 0
        ):
            raise ValueError("weighted term does not match its atom")
        terms.append(
            {"quad": list(term["quad"]), "form": term["form"], "weight": term["weight"]}
        )
    expected_evidence_terms = [
        {**term, "atom_index": kalmanson["weighted_terms"][index]["atom_index"]}
        for index, term in enumerate(terms)
    ]
    if evidence_value["terms"] != expected_evidence_terms:
        raise ValueError("exact evidence terms drifted")
    rows = tuple(
        producer_bank.MetricRow(index, tuple(row), exact=True)
        for index, row in enumerate(source.rows)
    )
    forward = producer_bank.certify_weighted_kalmanson_cancellation(
        rows, N, source.selected_order, terms
    )
    if forward != evidence_value["producer_bank_certificate"]:
        raise ValueError("forward producer certificate drifted")
    reverse_order = tuple(reversed(source.selected_order))
    reverse_terms = [
        {
            "quad": list(reversed(term["quad"])),
            "form": term["form"],
            "weight": term["weight"],
        }
        for term in terms
    ]
    reverse = producer_bank.certify_weighted_kalmanson_cancellation(
        rows, N, reverse_order, reverse_terms
    )
    # Pairing paths are emitted by the producer in canonical boundary-position
    # labels.  Reflect only the reverse orientation when forming source hits.
    forward_hits = _path_hits(forward["core"])
    reverse_hits = _path_hits(reverse["core"])
    reflected_reverse_hits = {(N - 1 - a, N - 1 - b) for a, b in reverse_hits}
    hits = forward_hits | reflected_reverse_hits
    forward_choices = _position_core(forward["core"])
    reverse_choices = _position_core(reverse["core"])
    for choice in forward_choices["row_choices"]:
        if any((choice["center"], point) not in hits for point in choice["support"]):
            raise ValueError("forward occurrence choice is outside union support")
    for choice in reverse_choices["row_choices"]:
        if any(
            (N - 1 - choice["center"], N - 1 - point) not in hits
            for point in choice["support"]
        ):
            raise ValueError("reverse occurrence choice is outside union support")
    occurrence = {
        "hits": sorted(hits),
        "forward_choices": forward_choices["row_choices"],
        "reverse_choices": reverse_choices["row_choices"],
        "forward_data": {
            "terms": forward_choices["terms"],
            "pairings": forward_choices["pairings"],
        },
        "reverse_data": {
            "terms": reverse_choices["terms"],
            "pairings": reverse_choices["pairings"],
        },
    }
    full_key = sha256_bytes(
        canonical_bytes(
            {
                "occurrence": occurrence,
                "forward_core": forward["core"],
                "reverse_core": reverse["core"],
            }
        )
    )
    provenance = {
        "cell_id": cell["cell_id"],
        "semantic_result_sha256": result["result_sha256"],
        "semantic_serialization_sha256": cell["semantic_replay"][
            "serialization_sha256"
        ],
        "assignment_sha256": result["assignment_sha256"],
        "source_model_sha256": model["digest"],
        "system_sha256": kalmanson["system_sha256"],
        "exact_evidence_sha256": evidence_hash,
        "proposal_sha256": kalmanson["proposal_sha256"],
        "full_occurrence_sha256": full_key,
    }
    return {
        "cell_id": cell["cell_id"],
        "full_key": full_key,
        "occurrence": occurrence,
        "forward_core": forward["core"],
        "reverse_core": reverse["core"],
        "provenance": provenance,
        "forward_reflected_support_equal": forward_hits == reflected_reverse_hits,
    }


INHERITED_SUPPORT_CENSUS_SHA256 = (
    "7cbd5787338c9a0ca8bf549f077067aa682ed2474bb66c29a9626b1f311a31c7"
)


def _inherited_support_census() -> list[dict[str, Any]]:
    files = sorted(
        (ROOT / "lean/Erdos9796Proof/P97/ATail").glob(
            "BlockerVExactSeventeenFortyThirdModelRefinementsShard*.lean"
        )
    )
    files += [
        ROOT
        / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortyFourthModelRefinements.lean"
    ]
    census: list[dict[str, Any]] = []
    for path in files:
        text = path.read_text(encoding="utf-8")
        for block in re.findall(
            r"hits := \[(.*?)\]\s*(?:forwardChoices|forwardData)", text, re.DOTALL
        ):
            support = sorted(
                [
                    list(map(int, pair))
                    for pair in re.findall(r"\((\d+)\s*,\s*(\d+)\)", block)
                ]
            )
            if support:
                census.append(
                    {
                        "path": _relative(path),
                        "sha256": sha256_file(path),
                        "hits": support,
                    }
                )
    census.append(
        {
            "path": FORTYFIFTH_SOURCE_RELATIVE,
            "sha256": FORTYFIFTH_SOURCE_SHA256,
            "hits": [[1, 4], [1, 8], [0, 8], [0, 5], [13, 5], [13, 4]],
        }
    )
    return census


def _inherited_supports() -> list[set[tuple[int, int]]]:
    census = _inherited_support_census()
    if sha256_bytes(canonical_bytes(census)) != INHERITED_SUPPORT_CENSUS_SHA256:
        raise ValueError("inherited support census drifted")
    return [set(map(tuple, item["hits"])) for item in census]


def _load_records(
    input_path: Path, envelope: dict[str, Any] | None = None
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    if (
        sha256_file(PARENT_LEAN) != FORTYFIFTH_SOURCE_SHA256
        or PARENT_LEAN.stat().st_size != FORTYFIFTH_SOURCE_BYTES
    ):
        raise ValueError("FortyFifth predecessor source identity drifted")
    predecessor_export = ROOT / FORTYFIFTH_EXPORT_RELATIVE
    if (
        sha256_file(predecessor_export) != FORTYFIFTH_EXPORT_SHA256
        or predecessor_export.stat().st_size != FORTYFIFTH_EXPORT_BYTES
    ):
        raise ValueError("FortyFifth predecessor export identity drifted")
    if envelope is None:
        envelope = _load_json(input_path)
    if envelope["summary"] != {
        "attempted": 13,
        "classification": "SAT_SEMANTIC_REPLAYED",
        "not_run": 0,
        "sat": 13,
        "total_cells": 13,
        "unknown": 0,
        "unsat": 0,
    }:
        raise ValueError("terminal Child45 summary is not the reviewed 13-cell result")
    profile = envelope["campaign"]
    if (
        profile["parent"]["sha256"] != CHILD45_ROOT_SHA256
        or profile["source_parent"]["sha256"] != CHILD45_SOURCE_PARENT_SHA256
    ):
        raise ValueError("Child45 campaign identity drifted")
    cells = envelope["cells"]
    if tuple(cell["cell_id"] for cell in cells) != EXPECTED_CELLS:
        raise ValueError("Child45 cell order drifted")
    records = [_validate_occurrence(cell) for cell in cells]
    return records, envelope


def collect_mine(
    input_path: Path = INPUT_PATH, receipt_path: Path = RECEIPT_PATH
) -> tuple[list[dict[str, Any]], list[dict[str, Any]], dict[str, Any]]:
    envelope = _validate_authenticated_envelope(input_path, receipt_path)
    records, _envelope = _load_records(input_path, envelope)
    groups: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for record in records:
        groups[record["full_key"]].append(record)
    unique_records = [
        min(group, key=lambda item: item["cell_id"]) for group in groups.values()
    ]
    support_groups: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for record in records:
        support_key = sha256_bytes(canonical_bytes(record["occurrence"]["hits"]))
        support_groups[support_key].append(record)
    representatives = []
    for group in support_groups.values():
        representatives.append(min(group, key=lambda item: item["cell_id"]))
    representatives.sort(key=lambda item: item["cell_id"])
    inherited = _inherited_supports()
    for record in representatives:
        support = set(map(tuple, record["occurrence"]["hits"]))
        if any(parent <= support or support < parent for parent in inherited):
            raise ValueError(
                f"support is subsumed by or subsumes an inherited bank support: {record['cell_id']}"
            )
    if tuple(record["cell_id"] for record in representatives) != REPRESENTATIVE_CELLS:
        raise ValueError("deterministic representative selection drifted")
    return (
        records,
        representatives,
        {
            "full_unique_count": len(unique_records),
            "support_unique_count": len(representatives),
            "inherited_support_count": len(inherited),
            "non_subsumed": True,
            "support_dedup_policy": "canonical union hits; lexicographically earliest cell representative; retain all full certificates in ledger",
        },
    )


def _lean_pair(edge: list[int]) -> str:
    return f"({edge[0]}, {edge[1]})"


def _lean_step(step: dict[str, Any]) -> str:
    if step["kind"] == "row":
        return f".row {step['center']} {step['first']} {step['second']}"
    return f".flip {step['first']} {step['second']}"


def _lean_path(path: dict[str, Any]) -> str:
    steps = ", ".join(_lean_step(step) for step in path["steps"])
    return f"⟨{_lean_pair(path['first'])}, [{steps}], {_lean_pair(path['last'])}⟩"


def _lean_data(data: dict[str, Any]) -> str:
    terms = ",\n       ".join(
        f"{{ quad := ⟨{', '.join(map(str, term['quad']))}⟩, form := .{term['form']}, weight := {term['weight']} }}"
        for term in data["terms"]
    )
    pairings = ",\n       ".join(
        f"{{ left := {_lean_pair(pairing['left'])}, right := {_lean_pair(pairing['right'])}, path := {_lean_path(pairing['path'])} }}"
        for pairing in data["pairings"]
    )
    return "{ terms := [" + terms + "],\n    pairings := [" + pairings + "] }"


def _lean_choices(choices: list[dict[str, Any]]) -> str:
    return (
        "["
        + ",\n   ".join(
            f"{{ center := {choice['center']}, support := {{{', '.join(map(str, choice['support']))}}} }}"
            for choice in choices
        )
        + "]"
    )


def _lean_hits(hits: list[list[int]]) -> str:
    return "[" + ", ".join(f"({a}, {b})" for a, b in hits) + "]"


def render_lean(representatives: list[dict[str, Any]]) -> str:
    blocks = []
    names = []
    for index, record in enumerate(representatives):
        name = f"waveOccurrence{index:02d}"
        names.append(name)
        occurrence = record["occurrence"]
        blocks.append(
            f"""def {name}ForwardChoices : List (RowChoice Label) :=
  {_lean_choices(occurrence["forward_choices"])}

def {name}ReverseChoices : List (RowChoice Label) :=
  {_lean_choices(occurrence["reverse_choices"])}

def {name}Hits : List Hit :=
  {_lean_hits(occurrence["hits"])}

def {name}ForwardData : WeightedKalmansonCancellationData Label :=
  {_lean_data(occurrence["forward_data"])}

def {name}ReverseData : WeightedKalmansonCancellationData Label :=
  {_lean_data(occurrence["reverse_data"])}

def {name} : WeightedSourceOccurrence :=
  {{ hits := {name}Hits
    forwardChoices := {name}ForwardChoices
    reverseChoices := {name}ReverseChoices
    forwardData := {name}ForwardData
    reverseData := {name}ReverseData }}

theorem {name}_check : {name}.check = true := by
  native_decide
"""
        )
    occurrence_list = ", ".join(names)
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyFifthModelRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Child45's nine checked wave-only union-support weighted Kalmanson occurrences. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenFortySixthModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenFortyFifthModelRefinements
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

{"".join(blocks)}
def waveOccurrences : List WeightedSourceOccurrence := [{occurrence_list}]

theorem waveOccurrences_length : waveOccurrences.length = 9 := by
  rfl

theorem waveOccurrences_check :
    ∀ occurrence ∈ waveOccurrences, occurrence.check = true := by
  native_decide

def fortySixthModelRefinementClauses : Std.Sat.CNF Atom :=
  waveOccurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order =>
      directions.map fun direction =>
        weightedOccurrenceClause order direction occurrence

theorem fortySixthModelRefinementClauses_length :
    fortySixthModelRefinementClauses.length = 36 := by
  simp [fortySixthModelRefinementClauses, waveOccurrences, namedOrders, directions]

theorem sourceAssign_fortySixthModelRefinementClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ fortySixthModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortySixthModelRefinementClauses, List.mem_flatMap, List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (waveOccurrences_check occurrence hoccur) order direction

def extendedFortySixthModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedFortyFifthModelRefinementsCnf ++ fortySixthModelRefinementClauses

theorem extendedFortySixthModelRefinementsCnf_length :
    extendedFortySixthModelRefinementsCnf.length = 5848864 := by
  simp only [extendedFortySixthModelRefinementsCnf, List.length_append,
    extendedFortyFifthModelRefinementsCnf_length,
    fortySixthModelRefinementClauses_length]

theorem sourceAssign_extendedFortySixthModelRefinementsCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortySixthModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortySixthModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyFifthModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortySixthModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortySixthModelRefinementsCnf_unsat
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortySixthModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortySixthModelRefinementsCnf source⟩

#print axioms waveOccurrences_check
#print axioms sourceAssign_fortySixthModelRefinementClauses
#print axioms sourceAssign_extendedFortySixthModelRefinementsCnf
#print axioms false_of_sourceRealization_of_extendedFortySixthModelRefinementsCnf_unsat

end ATailBlockerVExactSeventeenFortySixthModelRefinements
end Problem97
"""


def build_ledger(
    records: list[dict[str, Any]],
    representatives: list[dict[str, Any]],
    audit: dict[str, Any],
    input_path: Path,
) -> dict[str, Any]:
    support_keys = {
        sha256_bytes(canonical_bytes(record["occurrence"]["hits"])): record
        for record in representatives
    }
    full_groups: dict[str, list[str]] = defaultdict(list)
    for record in records:
        full_groups[record["full_key"]].append(record["cell_id"])
    unique_full = []
    for key in sorted(full_groups):
        record = next(item for item in records if item["full_key"] == key)
        unique_full.append(
            {
                "full_occurrence_sha256": key,
                "cell_ids": sorted(full_groups[key]),
                "representative_cell": min(full_groups[key]),
                "occurrence": record["occurrence"],
                "forward_core": record["forward_core"],
                "reverse_core": record["reverse_core"],
                "provenance": record["provenance"],
                "forward_reflected_support_equal": record[
                    "forward_reflected_support_equal"
                ],
            }
        )
    cell_map = []
    for record in records:
        support_key = sha256_bytes(canonical_bytes(record["occurrence"]["hits"]))
        cell_map.append(
            {
                **record["provenance"],
                "support_sha256": support_key,
                "representative_cell": support_keys[support_key]["cell_id"],
            }
        )
    inherited_census = _inherited_support_census()
    if (
        sha256_bytes(canonical_bytes(inherited_census))
        != INHERITED_SUPPORT_CENSUS_SHA256
    ):
        raise ValueError("inherited support census drifted")
    return {
        "schema": "p97-exact17-child45-wave-weighted-kalmanson-ledger/v1",
        "status": "AUTHENTICATED_PROMOTABLE",
        "input": {"path": _relative(input_path), "sha256": TERMINAL_ENVELOPE_SHA256},
        "receipt": {
            "path": _relative(RECEIPT_PATH),
            "sha256": RECEIPT_SHA256,
            "schema": RECEIPT_SCHEMA,
        },
        "terminal_envelope": {
            "path": _relative(input_path),
            "sha256": TERMINAL_ENVELOPE_SHA256,
            "embedded_sha256": TERMINAL_ENVELOPE_EMBEDDED_SHA256,
            "schema": TERMINAL_ENVELOPE_SCHEMA,
        },
        "predecessor": {
            "path": FORTYFIFTH_SOURCE_RELATIVE,
            "sha256": FORTYFIFTH_SOURCE_SHA256,
            "bytes": FORTYFIFTH_SOURCE_BYTES,
        },
        "predecessor_export": {
            "path": FORTYFIFTH_EXPORT_RELATIVE,
            "sha256": FORTYFIFTH_EXPORT_SHA256,
            "bytes": FORTYFIFTH_EXPORT_BYTES,
            "clauses": CURRENT_FORTYFIFTH_CLAUSES,
            "variables": VARIABLES,
        },
        "child45_root": {
            "sha256": CHILD45_ROOT_SHA256,
            "bytes": CHILD45_ROOT_BYTES,
            "clauses": CHILD45_CLAUSES,
            "variables": VARIABLES,
        },
        "child44_source_parent": {
            "sha256": CHILD45_SOURCE_PARENT_SHA256,
            "bytes": CHILD45_SOURCE_PARENT_BYTES,
            "clauses": PARENT_CLAUSES,
            "variables": VARIABLES,
        },
        "producer_manifest_sha256": CHILD45_PRODUCER_MANIFEST_SHA256,
        "profile_sha256": CHILD45_PROFILE_SHA256,
        "inherited_support_census": {
            "sha256": INHERITED_SUPPORT_CENSUS_SHA256,
            "records": inherited_census,
        },
        "new_root": {
            "parent_clauses": CURRENT_FORTYFIFTH_CLAUSES,
            "clauses": CHILD46_CLAUSES,
            "new_clauses": NEW_CLAUSES,
        },
        "audit": audit,
        "support_dedup": {
            "policy": audit["support_dedup_policy"],
            "representatives": [record["cell_id"] for record in representatives],
        },
        "full_certificate_records": unique_full,
        "cell_provenance": cell_map,
    }


def generate(
    input_path: Path = INPUT_PATH,
    output_lean: Path = OUTPUT_LEAN,
    output_ledger: Path = OUTPUT_LEDGER,
) -> dict[str, Any]:
    records, representatives, audit = collect_mine(input_path)
    output_lean.parent.mkdir(parents=True, exist_ok=True)
    output_lean.write_text(render_lean(representatives), encoding="utf-8")
    output_ledger.parent.mkdir(parents=True, exist_ok=True)
    ledger = build_ledger(records, representatives, audit, input_path)
    output_ledger.write_text(
        json.dumps(ledger, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return ledger


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, default=INPUT_PATH)
    parser.add_argument("--output-lean", type=Path, default=OUTPUT_LEAN)
    parser.add_argument("--output-ledger", type=Path, default=OUTPUT_LEDGER)
    args = parser.parse_args()
    ledger = generate(args.input, args.output_lean, args.output_ledger)
    print(
        json.dumps(
            {
                "full_unique_count": ledger["audit"]["full_unique_count"],
                "support_unique_count": ledger["audit"]["support_unique_count"],
                "new_clauses": ledger["new_root"]["new_clauses"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
