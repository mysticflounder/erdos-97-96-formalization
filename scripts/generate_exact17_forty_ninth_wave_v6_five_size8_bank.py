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
            f"""/-- P97 ATail {SCHEMA} def. -/
def {name}ForwardChoices : List (RowChoice Label) :=
  {base._lean_choices(forward["row_choices"])}

/-- P97 ATail {SCHEMA} def. -/
def {name}ReverseChoices : List (RowChoice Label) :=
  {base._lean_choices(reverse["row_choices"])}

/-- P97 ATail {SCHEMA} def. -/
def {name}Hits : List Hit :=
  {base._lean_hits(record["support"])}

/-- P97 ATail {SCHEMA} def. -/
def {name}ForwardData :
    WeightedKalmansonCancellationData Label :=
  {base.lean_weighted_data(forward)}

/-- P97 ATail {SCHEMA} def. -/
def {name}ReverseData :
    WeightedKalmansonCancellationData Label :=
  {base.lean_weighted_data(reverse)}

/-- P97 ATail {SCHEMA} def. -/
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
        f"/-- P97 ATail {SCHEMA} theorem. -/\n"
        f"theorem {name}_check : {name}.check = true := by\n  native_decide"
        for name in names
    )
    cases = "\n".join(f"  · exact {name}_check" for name in names)
    return f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenWeightedKalmansonSourceBridge
import Erdos9796Proof.P97.ListCNF

/-! Five source-valid size-eight V49 records mined from the V5 survivor. -/

open scoped EuclideanGeometry
namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Schemas

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenWeightedKalmansonSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

/-- P97 ATail {SCHEMA} abbrev. -/
private abbrev Hit := Label × Label

{chr(10).join(_definitions())}

{checks}

/-- P97 ATail {SCHEMA} def. -/
def fortyNinthWaveV6FiveSize8Occurrences : List WeightedSourceOccurrence :=
  [{", ".join(names)}]

/-- P97 ATail {SCHEMA} theorem. -/
theorem fortyNinthWaveV6FiveSize8Occurrences_length :
    fortyNinthWaveV6FiveSize8Occurrences.length = 5 := by
  rfl

/-- P97 ATail {SCHEMA} theorem. -/
theorem fortyNinthWaveV6FiveSize8Occurrences_check :
    ∀ occurrence ∈ fortyNinthWaveV6FiveSize8Occurrences,
      occurrence.check = true := by
  intro occurrence hoccur
  simp only [fortyNinthWaveV6FiveSize8Occurrences, List.mem_cons,
    List.mem_singleton, List.not_mem_nil, or_false] at hoccur
  rcases hoccur with rfl | rfl | rfl | rfl | rfl
{cases}

/-- P97 ATail {SCHEMA} def. -/
def fortyNinthWaveV6FiveSize8SchemaClauses : ListCNF Atom :=
  fortyNinthWaveV6FiveSize8Occurrences.flatMap fun occurrence =>
    namedOrders.flatMap fun order => directions.map fun direction =>
      weightedOccurrenceClause order direction occurrence

/-- P97 ATail {SCHEMA} theorem. -/
theorem fortyNinthWaveV6FiveSize8SchemaClauses_length :
    fortyNinthWaveV6FiveSize8SchemaClauses.length = 20 := by
  simp [fortyNinthWaveV6FiveSize8SchemaClauses,
    fortyNinthWaveV6FiveSize8Occurrences, namedOrders, directions]

/-- P97 ATail {SCHEMA} theorem. -/
theorem sourceAssign_fortyNinthWaveV6FiveSize8SchemaClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV6FiveSize8SchemaClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [fortyNinthWaveV6FiveSize8SchemaClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with
    ⟨occurrence, hoccur, order, horder, direction, hdirection, rfl⟩
  exact sourceAssign_weightedOccurrenceClause source occurrence
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
import Erdos9796Proof.P97.ListCNF

/-! Cumulative Lean-owned V49 V6 five-support promotion over V5. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Promotion

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion
open ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8Schemas

/-- P97 ATail {PROMOTION} def. -/
def fortyNinthWaveV6FiveSize8PromotionClauses : ListCNF Atom :=
  fortyNinthWaveV6FiveSize8SchemaClauses

/-- P97 ATail {PROMOTION} theorem. -/
theorem fortyNinthWaveV6FiveSize8PromotionClauses_length :
    fortyNinthWaveV6FiveSize8PromotionClauses.length = 20 := by
  simpa [fortyNinthWaveV6FiveSize8PromotionClauses] using
    fortyNinthWaveV6FiveSize8SchemaClauses_length

/-- P97 ATail {PROMOTION} theorem. -/
theorem sourceAssign_fortyNinthWaveV6FiveSize8PromotionClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ∀ clause ∈ fortyNinthWaveV6FiveSize8PromotionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  simpa [fortyNinthWaveV6FiveSize8PromotionClauses] using
    sourceAssign_fortyNinthWaveV6FiveSize8SchemaClauses source

/-- P97 ATail {PROMOTION} def. -/
def extendedFortyNinthWaveV6FiveSize8PromotionCnf : ListCNF Atom :=
  extendedFortyNinthWaveV5FiveSize8PromotionCnf ++
    fortyNinthWaveV6FiveSize8PromotionClauses

/-- P97 ATail {PROMOTION} theorem. -/
theorem extendedFortyNinthWaveV6FiveSize8PromotionCnf_length :
    extendedFortyNinthWaveV6FiveSize8PromotionCnf.length = 7198760 := by
  simp only [extendedFortyNinthWaveV6FiveSize8PromotionCnf, List.length_append,
    extendedFortyNinthWaveV5FiveSize8PromotionCnf_length,
    fortyNinthWaveV6FiveSize8PromotionClauses_length]

/-- P97 ATail {PROMOTION} theorem. -/
theorem sourceAssign_extendedFortyNinthWaveV6FiveSize8PromotionCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}} (source : SourceRealization A) :
    ListCNF.eval (sourceAssign source.model)
      extendedFortyNinthWaveV6FiveSize8PromotionCnf = true := by
  rw [ListCNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedFortyNinthWaveV6FiveSize8PromotionCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedFortyNinthWaveV5FiveSize8PromotionCnf source
    rw [ListCNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_fortyNinthWaveV6FiveSize8PromotionClauses source clause hsuffix

/-- P97 ATail {PROMOTION} theorem. -/
theorem false_of_sourceRealization_of_extendedFortyNinthWaveV6FiveSize8PromotionCnf_unsat
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      ListCNF.eval assignment extendedFortyNinthWaveV6FiveSize8PromotionCnf = true) :
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

/-- P97 ATail {EXPORT} def. -/
def extendedFortyNinthWaveV6FiveSize8PromotionDimacsString : String :=
  let dimacs := extendedFortyNinthWaveV6FiveSize8PromotionCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {{baseNumVars}} {{dimacs.length}}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

/-- P97 ATail {EXPORT} def. -/
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

/-- P97 ATail {EXPORT} def. -/
def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenFortyNinthWaveV6FiveSize8PromotionExport.run args
"""


def write_text_once(path: Path, text: str) -> bool:
    """Write ``text`` to a new ``path``; never overwrite different bytes.

    Returns ``True`` when the file was created and ``False`` when an existing
    file already holds exactly these bytes.  Raises ``FileExistsError`` when an
    existing file (or symlink) holds anything else.
    """
    data = text.encode("utf-8")
    if path.exists() or path.is_symlink():
        if path.is_symlink() or path.read_bytes() != data:
            raise FileExistsError(
                f"immutable publication target exists with different bytes: {path}"
            )
        return False
    with path.open("xb") as handle:
        handle.write(data)
    return True


def main() -> None:
    rendered = {
        OUT / f"{SCHEMA}.lean": schema_text(),
        OUT / f"{PROMOTION}.lean": promotion_text(),
        OUT / f"{EXPORT}.lean": export_text(),
    }
    for path, text in rendered.items():
        if path.is_symlink() or (
            path.exists() and path.read_bytes() != text.encode("utf-8")
        ):
            raise FileExistsError(
                f"immutable publication target exists with different bytes: {path}"
            )
    for path, text in rendered.items():
        write_text_once(path, text)
    print("generated V6 five-size8 Lean bank")


if __name__ == "__main__":
    main()
