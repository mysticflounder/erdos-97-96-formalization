/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotion

/-! Export the Lean-owned cumulative V49 wave-v4 three-zero-atom child. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotionExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotion

def extendedFortyNinthWaveV4ThreeZeroAtomPromotionDimacsString : String :=
  let dimacs := extendedFortyNinthWaveV4ThreeZeroAtomPromotionCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedFortyNinthWaveV4ThreeZeroAtomPromotionDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotionExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotionExport.run args
