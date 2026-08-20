/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCocircularPentagonOrderPromotion

/-! Direct exporter for the Lean-owned cocircular-pentagon order successor. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenCocircularPentagonOrderPromotionExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenCocircularPentagonOrderPromotion

def extendedCocircularPentagonOrderDimacsString : String :=
  let dimacs := extendedCocircularPentagonOrderCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedCocircularPentagonOrderDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenCocircularPentagonOrderPromotionExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenCocircularPentagonOrderPromotionExport.run args
