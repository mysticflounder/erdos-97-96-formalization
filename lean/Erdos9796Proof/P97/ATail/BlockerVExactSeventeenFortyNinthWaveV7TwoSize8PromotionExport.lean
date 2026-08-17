/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV7TwoSize8Promotion

/-! Direct exporter for the Lean-owned V7 cumulative CNF. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV7TwoSize8PromotionExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortyNinthWaveV7TwoSize8Promotion

def extendedFortyNinthWaveV7TwoSize8PromotionDimacsString : String :=
  let dimacs := extendedFortyNinthWaveV7TwoSize8PromotionCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "
" lines ++ "
"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedFortyNinthWaveV7TwoSize8PromotionDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenFortyNinthWaveV7TwoSize8PromotionExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenFortyNinthWaveV7TwoSize8PromotionExport.run args
