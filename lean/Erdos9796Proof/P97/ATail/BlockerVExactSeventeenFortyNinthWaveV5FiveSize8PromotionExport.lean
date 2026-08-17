/-
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
  String.intercalate "\n" lines ++ "\n"

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
