/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorTwoKalmansonCancellationPhysicalSliceCoverage

/-! Direct exporter for one exact-17 two-Kalmanson four-row bisector physical-slice cell. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorTwoKalmansonCancellationPhysicalSliceCellExport

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorTwoKalmansonCancellation
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage
open ATailBlockerVExactSeventeenSparseSixPointNextCenterPhysicalSliceCoverage
open ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorTwoKalmansonCancellationPhysicalSliceCoverage

private def cnfDimacsString (cnf : Std.Sat.CNF Atom) : String :=
  let dimacs := cnf.map fun clause => clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause => String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def rootDimacsString : String :=
  cnfDimacsString extendedCocircularOrderSparseSixPointFourRowBisectorTwoKalmansonCnf

def physicalSliceCellDimacsString
    (center : Label) (category : PhysicalSliceCategory) : String :=
  cnfDimacsString
    (sparseSixPointFourRowTwoCircleBisectorTwoKalmansonPhysicalSliceCellCnf
      center category)

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

end ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorTwoKalmansonCancellationPhysicalSliceCellExport
end Problem97

open Problem97

def main (args : List String) : IO UInt32 :=
  ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisectorTwoKalmansonCancellationPhysicalSliceCellExport.run
    args
