"""Generate the Lean-owned V49 V5 five-support Kalmanson bank."""

from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from census.atail_force.producer_bank import (
    MetricRow,
    enumerate_two_kalmanson_cancellations,
)
from census.p97_search.exact17_source_model_replay import ORDERS
from scripts.generate_exact17_forty_sixth_wave_mine import (
    _lean_choices,
    _lean_data,
    _lean_hits,
)
from scripts.generate_exact17_twenty_eighth_all_cancellation_refinements import (
    choose_exact_support_record,
    reflected,
)

MINE = ROOT / (
    "scratch/runs/exact17-forty-ninth-wave-v4-three-zero-atoms-20260817/"
    "export-v1/events/v4-wave-mine.json"
)
LOG = ROOT / (
    "scratch/runs/exact17-forty-ninth-wave-v4-three-zero-atoms-20260817/"
    "export-v1/events/cadical.log"
)
OUT = ROOT / "lean/Erdos9796Proof/P97/ATail"
ORDER = ORDERS[1]

SCHEMA = "BlockerVExactSeventeenFortyNinthWaveV5FiveSize8Schemas"
PROMOTION = "BlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion"
EXPORT = "BlockerVExactSeventeenFortyNinthWaveV5FiveSize8PromotionExport"


def rows_from_log() -> tuple[MetricRow, ...]:
    assignment: dict[int, bool] = {}
    for line in LOG.read_text().splitlines():
        if line.startswith("v "):
            for token in line.split()[1:]:
                if token != "0":
                    literal = int(token)
                    assignment[abs(literal)] = literal > 0
    if len(assignment) != 308:
        raise ValueError(f"expected 308 model variables, found {len(assignment)}")
    rows = tuple(
        MetricRow(
            center,
            tuple(point for point in range(17) if assignment[1 + 17 * center + point]),
            True,
        )
        for center in range(17)
    )
    if {len(row.support) for row in rows} != {4}:
        raise ValueError("model rows are not exact-four")
    return rows


def weighted_record(
    record: dict, rows: tuple[MetricRow, ...], order: tuple[int, ...]
) -> dict:
    core = record["core"]
    terms = [
        {"quad": core["first_quad"], "form": core["first_form"], "weight": 1},
        {"quad": core["second_quad"], "form": core["second_form"], "weight": 1},
    ]
    weighted_core = {
        "terms": terms,
        "pairings": [
            {"left": path["first"], "right": path["last"], "path": path}
            for path in core["paths"]
        ],
    }
    supports: dict[int, set[int]] = {}
    for pairing in weighted_core["pairings"]:
        for step in pairing["path"]["steps"]:
            if step["kind"] == "row":
                supports.setdefault(int(step["center"]), set()).update(
                    (int(step["first"]), int(step["second"]))
                )
    weighted_core["row_choices"] = [
        {"center": center, "support": sorted(points)}
        for center, points in sorted(supports.items())
    ]
    return {"core": weighted_core}


def lean_weighted_data(core: dict) -> str:
    terms = [
        {
            "quad": term.get("quad_labels", term["quad"]),
            "form": term["form"],
            "weight": term["weight"],
        }
        for term in core["terms"]
    ]
    return _lean_data({"terms": terms, "pairings": core["pairings"]})


def entries() -> list[str]:
    mine = json.loads(MINE.read_text())
    candidates = [
        candidate
        for candidate in mine["cancellations"][0]["candidates"]
        if candidate["support_size"] == 8
    ]
    if len(candidates) != 5:
        raise ValueError(f"expected five size-8 supports, found {len(candidates)}")
    rows = rows_from_log()
    forward = enumerate_two_kalmanson_cancellations(rows, 17, ORDER, max_cores=100_000)
    reverse_order = tuple(reversed(ORDER))
    reverse = enumerate_two_kalmanson_cancellations(
        rows, 17, reverse_order, max_cores=100_000
    )
    result: list[str] = []
    for candidate in candidates:
        hits = frozenset(tuple(hit) for hit in candidate["support"])
        forward_raw = choose_exact_support_record(
            hits, ORDER, records=forward, rows=rows
        )
        reverse_hits = reflected(hits)
        reverse_raw = choose_exact_support_record(
            reverse_hits, reverse_order, records=reverse, rows=rows
        )
        forward_projected = weighted_record(forward_raw, rows, ORDER)
        reverse_projected = weighted_record(reverse_raw, rows, reverse_order)
        forward_core = forward_projected["core"]
        reverse_core = reverse_projected["core"]
        index = len(result)
        result.append(
            f"""def fortyNinthWaveV5Size8Occurrence{index:02d}ForwardChoices : List (RowChoice Label) :=
  {_lean_choices(forward_core["row_choices"])}

def fortyNinthWaveV5Size8Occurrence{index:02d}ReverseChoices : List (RowChoice Label) :=
  {_lean_choices(reverse_core["row_choices"])}

def fortyNinthWaveV5Size8Occurrence{index:02d}Hits : List Hit :=
  {_lean_hits([list(hit) for hit in sorted(hits)])}

def fortyNinthWaveV5Size8Occurrence{index:02d}ForwardData :
    WeightedKalmansonCancellationData Label :=
  {lean_weighted_data(forward_core)}

def fortyNinthWaveV5Size8Occurrence{index:02d}ReverseData :
    WeightedKalmansonCancellationData Label :=
  {lean_weighted_data(reverse_core)}

def fortyNinthWaveV5Size8Occurrence{index:02d} : WeightedSourceOccurrence :=
  {{ hits := fortyNinthWaveV5Size8Occurrence{index:02d}Hits
    forwardChoices := fortyNinthWaveV5Size8Occurrence{index:02d}ForwardChoices
    reverseChoices := fortyNinthWaveV5Size8Occurrence{index:02d}ReverseChoices
    forwardData := fortyNinthWaveV5Size8Occurrence{index:02d}ForwardData
    reverseData := fortyNinthWaveV5Size8Occurrence{index:02d}ReverseData }}
"""
        )
    return result


def schema_text(items: list[str]) -> str:
    definitions = items
    checks = []
    names = []
    for index in range(len(items)):
        name = f"fortyNinthWaveV5Size8Occurrence{index:02d}"
        names.append(name)
        checks.append(
            f"theorem {name}_check : {name}.check = true := by\n  native_decide"
        )
    names_text = ",\n  ".join(names)
    checks_text = "\n\n".join(checks)
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Five inclusion-minimal size-eight source-valid V49 Kalmanson occurrences. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Schemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

{chr(10).join(definitions)}

{checks_text}

def fortyNinthWaveV5FiveSize8Occurrences : List WeightedSourceOccurrence :=
  [{names_text}]

theorem fortyNinthWaveV5FiveSize8Occurrences_length :
    fortyNinthWaveV5FiveSize8Occurrences.length = 5 := by
  rfl

theorem fortyNinthWaveV5FiveSize8Occurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV5FiveSize8Occurrences,
      occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV5FiveSize8Occurrences, List.mem_cons,
    List.mem_singleton, List.not_mem_nil, or_false] at hoccur
  rcases hoccur with rfl | rfl | rfl | rfl | rfl
  · exact fortyNinthWaveV5Size8Occurrence00_check
  · exact fortyNinthWaveV5Size8Occurrence01_check
  · exact fortyNinthWaveV5Size8Occurrence02_check
  · exact fortyNinthWaveV5Size8Occurrence03_check
  · exact fortyNinthWaveV5Size8Occurrence04_check

def fortyNinthWaveV5FiveSize8SchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV5FiveSize8Occurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order => directions.map fun direction =>
      weightedOccurrenceClause order direction occurrence

theorem fortyNinthWaveV5FiveSize8SchemaClauses_length :
    fortyNinthWaveV5FiveSize8SchemaClauses.length = 20 := by
  simp [fortyNinthWaveV5FiveSize8SchemaClauses,
    fortyNinthWaveV5FiveSize8Occurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthWaveV5FiveSize8SchemaClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV5FiveSize8SchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV5FiveSize8SchemaClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
    (fortyNinthWaveV5FiveSize8Occurrences_check occurrence hoccur) order direction

#print axioms sourceAssign_fortyNinthWaveV5FiveSize8SchemaClauses
end ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Schemas
end Problem97
"""


def promotion_text() -> str:
    return """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotion
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV5FiveSize8Schemas

/-! Lean-owned promotion of the V49 five-support size-eight successor. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotion
open ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Schemas

def fortyNinthWaveV5FiveSize8PromotionClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV5FiveSize8SchemaClauses

theorem fortyNinthWaveV5FiveSize8PromotionClauses_length :
    fortyNinthWaveV5FiveSize8PromotionClauses.length = 20 := by
  simpa [fortyNinthWaveV5FiveSize8PromotionClauses] using
    fortyNinthWaveV5FiveSize8SchemaClauses_length

theorem sourceAssign_fortyNinthWaveV5FiveSize8PromotionClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV5FiveSize8PromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV5FiveSize8PromotionClauses] using
    sourceAssign_fortyNinthWaveV5FiveSize8SchemaClauses source

def extendedFortyNinthWaveV5FiveSize8PromotionCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf ++
    fortyNinthWaveV5FiveSize8PromotionClauses

theorem extendedFortyNinthWaveV5FiveSize8PromotionCnf_length :
    extendedFortyNinthWaveV5FiveSize8PromotionCnf.length = 7198740 := by
  simp only [extendedFortyNinthWaveV5FiveSize8PromotionCnf, List.length_append,
    extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf_length,
    fortyNinthWaveV5FiveSize8PromotionClauses_length]

theorem sourceAssign_extendedFortyNinthWaveV5FiveSize8PromotionCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV5FiveSize8PromotionCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV5FiveSize8PromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthWaveV5FiveSize8PromotionClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyNinthWaveV5FiveSize8PromotionCnf_unsat
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyNinthWaveV5FiveSize8PromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthWaveV5FiveSize8PromotionCnf source⟩

#print axioms sourceAssign_fortyNinthWaveV5FiveSize8PromotionClauses
#print axioms sourceAssign_extendedFortyNinthWaveV5FiveSize8PromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthWaveV5FiveSize8PromotionCnf_unsat
end ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion
end Problem97
"""


def export_text() -> str:
    return """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion

/-! Export the Lean-owned cumulative V49 V5 five-support child. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8PromotionExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion

def extendedFortyNinthWaveV5FiveSize8PromotionDimacsString : String :=
  let dimacs := extendedFortyNinthWaveV5FiveSize8PromotionCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\\n" lines ++ "\\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedFortyNinthWaveV5FiveSize8PromotionDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8PromotionExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8PromotionExport.run args
"""


def main() -> None:
    items = entries()
    paths = {
        SCHEMA: schema_text(items),
        PROMOTION: promotion_text(),
        EXPORT: export_text(),
    }
    for name, text in paths.items():
        path = OUT / f"{name}.lean"
        if path.exists():
            raise FileExistsError(path)
        path.write_text(text)
        print(path, len(text))


if __name__ == "__main__":
    main()
