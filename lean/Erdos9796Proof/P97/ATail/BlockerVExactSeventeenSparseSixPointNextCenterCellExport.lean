/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSparseSixPointNextCenterCoverage

/-! Direct exporter for one exact-17 sparse-six next-center cell. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenSparseSixPointNextCenterCellExport

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSparseSixPointNextCenterCoverage

def sparseSixPointNextCenterCellDimacsString (center : Label) : String :=
  let dimacs := (sparseSixPointNextCenterCellCnf center).map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [centerText, outputPath] =>
      match centerText.toNat? with
      | none =>
          IO.eprintln s!"invalid center: {centerText}"
          pure 2
      | some centerValue =>
          if hbound : centerValue < 17 then
            let center : Label := ⟨centerValue, hbound⟩
            if center ∈ legalNextCenterLabels then
              IO.FS.writeFile outputPath
                (sparseSixPointNextCenterCellDimacsString center)
              pure 0
            else
              IO.eprintln s!"center is not legal: {centerValue}"
              pure 2
          else
            IO.eprintln s!"center is out of range: {centerValue}"
            pure 2
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <center> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenSparseSixPointNextCenterCellExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenSparseSixPointNextCenterCellExport.run args
