/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Promotion

/-! Direct exporter for the Lean-owned V8 cumulative CNF. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8PromotionExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Promotion

def extendedFortyNinthWaveV8SeventeenSize8PromotionDimacsString : String :=
  let dimacs := extendedFortyNinthWaveV8SeventeenSize8PromotionCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath
        extendedFortyNinthWaveV8SeventeenSize8PromotionDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8PromotionExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8PromotionExport.run args
