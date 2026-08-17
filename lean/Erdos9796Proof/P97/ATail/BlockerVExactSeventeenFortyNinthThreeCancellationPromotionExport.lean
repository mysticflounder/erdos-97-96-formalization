/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthThreeCancellationPromotion

/-! Export the Lean-owned cumulative V49 three-cancellation child root. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthThreeCancellationPromotionExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortyNinthThreeCancellationPromotion

def extendedFortyNinthThreeCancellationPromotionDimacsString : String :=
  let dimacs := extendedFortyNinthThreeCancellationPromotionCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedFortyNinthThreeCancellationPromotionDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenFortyNinthThreeCancellationPromotionExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenFortyNinthThreeCancellationPromotionExport.run args
