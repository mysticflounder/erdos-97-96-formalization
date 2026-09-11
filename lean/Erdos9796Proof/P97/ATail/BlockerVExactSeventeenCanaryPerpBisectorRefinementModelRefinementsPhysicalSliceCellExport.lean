/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCoverage
import Erdos9796Proof.P97.ListCNF

/-! Direct exporter for the canary perpendicular-bisector model-refinement root and cells. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCellExport

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCoverage

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCellExport def. -/
private def cnfDimacsString (cnf : ListCNF Atom) : String :=
  let dimacs := cnf.map fun clause ↦ clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause ↦ String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCellExport def. -/
def rootDimacsString : String :=
  cnfDimacsString canaryPerpBisectorModelRefinementCnf

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCellExport def. -/
def physicalSliceCellDimacsString
    (center : Label) (category : PhysicalSliceCategory) : String :=
  cnfDimacsString
    (canaryPerpBisectorModelRefinementPhysicalSliceCellCnf center category)

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCellExport def. -/
def parseCategory (center : Label) (text : String) : Option PhysicalSliceCategory :=
  if text = "none" then
    some .none
  else
    match text.toNat? with
    | none => none
    | some value =>
        if hbound : value < 17 then
          let category := PhysicalSliceCategory.unique (⟨value, hbound⟩ : Label)
          if category ∈ physicalSliceCategories center then some category else none
        else
          none

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCellExport def. -/
def run (args : List String) : IO UInt32 := do
  match args with
  | ["root", outputPath] =>
      IO.FS.writeFile outputPath rootDimacsString
      pure 0
  | [centerText, categoryText, outputPath] =>
      match centerText.toNat? with
      | none =>
          IO.eprintln s!"invalid center: {centerText}"
          pure 2
      | some centerValue =>
          if hbound : centerValue < 17 then
            let center : Label := ⟨centerValue, hbound⟩
            if center ∈ legalNextCenterLabels then
              match parseCategory center categoryText with
              | none =>
                  IO.eprintln s!"invalid physical category: {categoryText}"
                  pure 2
              | some category =>
                  IO.FS.writeFile outputPath
                    (physicalSliceCellDimacsString center category)
                  pure 0
            else
              IO.eprintln s!"center is not legal: {centerValue}"
              pure 2
          else
            IO.eprintln s!"center is out of range: {centerValue}"
            pure 2
  | _ =>
      IO.eprintln
        "usage: lake env lean --run <exporter> root <output.cnf> | \
          <center> <none|physical-label> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCellExport
end Problem97

open Problem97

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCellExport def. -/
def main (args : List String) : IO UInt32 :=
  ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementModelRefinementsPhysicalSliceCellExport.run
    args
