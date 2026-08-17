"""Generate the next five source-valid size-eight V49 Kalmanson records."""

from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from scripts import generate_exact17_forty_ninth_wave_v5_five_size8_bank as base

MINE = ROOT / (
    "scratch/runs/exact17-forty-ninth-wave-v5-five-size8-20260817/"
    "export-v1/events/v5-wave-mine/v5-wave-mine.json"
)
OUT = ROOT / "lean/Erdos9796Proof/P97/ATail"
SCHEMA = "BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Schemas"
PROMOTION = "BlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion"
EXPORT = "BlockerVExactSeventeenFortyNinthWaveV6FiveSize8PromotionExport"


def _raw_core(core: dict) -> dict:
    return {
        "core": {
            "first_quad": core["first_quad"],
            "first_form": core["first_form"],
            "second_quad": core["second_quad"],
            "second_form": core["second_form"],
            "paths": core["paths"],
        }
    }


def _weighted(core: dict) -> dict:
    return base.weighted_record(_raw_core(core), (), ())["core"]


def _unique_size8() -> list[dict]:
    payload = json.loads(MINE.read_text(encoding="utf-8"))
    records: dict[tuple[tuple[int, int], ...], dict] = {}
    for record in payload["records"]:
        support = tuple(tuple(pair) for pair in record["support"])
        if len(support) == 8:
            records.setdefault(support, record)
    selected = [records[key] for key in sorted(records)]
    if len(selected) != 5:
        raise ValueError(
            f"expected five unique size-eight supports, got {len(selected)}"
        )
    return selected


def _definitions() -> list[str]:
    definitions: list[str] = []
    for index, record in enumerate(_unique_size8()):
        forward = _weighted(record["forward_core"])
        reverse = _weighted(record["reverse_core"])
        name = f"fortyNinthWaveV6Size8Occurrence{index:02d}"
        definitions.append(
            f"""def {name}ForwardChoices : List (RowChoice Label) :=
  {base._lean_choices(forward["row_choices"])}

def {name}ReverseChoices : List (RowChoice Label) :=
  {base._lean_choices(reverse["row_choices"])}

def {name}Hits : List Hit :=
  {base._lean_hits(record["support"])}

def {name}ForwardData :
    WeightedKalmansonCancellationData Label :=
  {base.lean_weighted_data(forward)}

def {name}ReverseData :
    WeightedKalmansonCancellationData Label :=
  {base.lean_weighted_data(reverse)}

def {name} : WeightedSourceOccurrence :=
  {{ hits := {name}Hits
    forwardChoices := {name}ForwardChoices
    reverseChoices := {name}ReverseChoices
    forwardData := {name}ForwardData
    reverseData := {name}ReverseData }}
"""
        )
    return definitions


def schema_text() -> str:
    names = [f"fortyNinthWaveV6Size8Occurrence{i:02d}" for i in range(5)]
    checks = "\n\n".join(
        f"theorem {name}_check : {name}.check = true := by\n  native_decide"
        for name in names
    )
    cases = "\n".join(f"  · exact {name}_check" for name in names)
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge

/-! Five source-valid size-eight V49 records mined from the V5 survivor. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Schemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

private abbrev Hit := Label × Label

{chr(10).join(_definitions())}

{checks}

def fortyNinthWaveV6FiveSize8Occurrences : List WeightedSourceOccurrence :=
  [{", ".join(names)}]

theorem fortyNinthWaveV6FiveSize8Occurrences_length :
    fortyNinthWaveV6FiveSize8Occurrences.length = 5 := by
  rfl

theorem fortyNinthWaveV6FiveSize8Occurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV6FiveSize8Occurrences,
      occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV6FiveSize8Occurrences, List.mem_cons,
    List.mem_singleton, List.not_mem_nil, or_false] at hoccur
  rcases hoccur with rfl | rfl | rfl | rfl | rfl
{cases}

def fortyNinthWaveV6FiveSize8SchemaClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV6FiveSize8Occurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order => directions.map fun direction =>
      weightedOccurrenceClause order direction occurrence

theorem fortyNinthWaveV6FiveSize8SchemaClauses_length :
    fortyNinthWaveV6FiveSize8SchemaClauses.length = 20 := by
  simp [fortyNinthWaveV6FiveSize8SchemaClauses,
    fortyNinthWaveV6FiveSize8Occurrences, namedOrders, directions]

theorem sourceAssign_fortyNinthWaveV6FiveSize8SchemaClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV6FiveSize8SchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV6FiveSize8SchemaClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨occurrence, hoccur, order, direction, rfl⟩
  exact weightedOccurrenceClause_source source
    (fortyNinthWaveV6FiveSize8Occurrences_check occurrence hoccur) order direction

end ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Schemas
end Problem97
"""


def promotion_text() -> str:
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion
import Erdos9796Proof.P97.ATail.{SCHEMA}

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion
open ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Schemas

def fortyNinthWaveV6FiveSize8PromotionClauses : Std.Sat.CNF Atom :=
  fortyNinthWaveV6FiveSize8SchemaClauses

theorem fortyNinthWaveV6FiveSize8PromotionClauses_length :
    fortyNinthWaveV6FiveSize8PromotionClauses.length = 20 := by
  simpa [fortyNinthWaveV6FiveSize8PromotionClauses] using
    fortyNinthWaveV6FiveSize8SchemaClauses_length

theorem sourceAssign_fortyNinthWaveV6FiveSize8PromotionClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV6FiveSize8PromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV6FiveSize8PromotionClauses] using
    sourceAssign_fortyNinthWaveV6FiveSize8SchemaClauses source

def extendedFortyNinthWaveV6FiveSize8PromotionCnf : Std.Sat.CNF Atom :=
  extendedFortyNinthWaveV5FiveSize8PromotionCnf ++
    fortyNinthWaveV6FiveSize8PromotionClauses

theorem extendedFortyNinthWaveV6FiveSize8PromotionCnf_length :
    extendedFortyNinthWaveV6FiveSize8PromotionCnf.length = 7198760 := by
  simp only [extendedFortyNinthWaveV6FiveSize8PromotionCnf, List.length_append,
    extendedFortyNinthWaveV5FiveSize8PromotionCnf_length,
    fortyNinthWaveV6FiveSize8PromotionClauses_length]

theorem sourceAssign_extendedFortyNinthWaveV6FiveSize8PromotionCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV6FiveSize8PromotionCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV6FiveSize8PromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · exact sourceAssign_extendedFortyNinthWaveV5FiveSize8PromotionCnf source clause hparent
  · exact sourceAssign_fortyNinthWaveV6FiveSize8PromotionClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedFortyNinthWaveV6FiveSize8PromotionCnf_unsat
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedFortyNinthWaveV6FiveSize8PromotionCnf = true) :
    False := by
  rcases hsource with ⟨source⟩
  exact hunsat ⟨sourceAssign source.model,
    sourceAssign_extendedFortyNinthWaveV6FiveSize8PromotionCnf source⟩

#print axioms sourceAssign_fortyNinthWaveV6FiveSize8PromotionClauses
#print axioms sourceAssign_extendedFortyNinthWaveV6FiveSize8PromotionCnf
#print axioms false_of_sourceRealization_of_extendedFortyNinthWaveV6FiveSize8PromotionCnf_unsat
end ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion
end Problem97
"""


def export_text() -> str:
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
-/

import Erdos9796Proof.P97.ATail.{PROMOTION}

/-! Export the Lean-owned cumulative V49 V6 five-support child. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8PromotionExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion

def extendedFortyNinthWaveV6FiveSize8PromotionDimacsString : String :=
  let dimacs := extendedFortyNinthWaveV6FiveSize8PromotionCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {{baseNumVars}} {{dimacs.length}}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedFortyNinthWaveV6FiveSize8PromotionDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8PromotionExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8PromotionExport.run args
"""


def main() -> None:
    (OUT / f"{SCHEMA}.lean").write_text(schema_text(), encoding="utf-8")
    (OUT / f"{PROMOTION}.lean").write_text(promotion_text(), encoding="utf-8")
    (OUT / f"{EXPORT}.lean").write_text(export_text(), encoding="utf-8")
    print("generated V6 five-size8 Lean bank")


if __name__ == "__main__":
    main()
