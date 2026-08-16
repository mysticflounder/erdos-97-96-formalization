/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenFortySeventhModelRefinements

/-! Export the checked exact-seventeen Forty-Seventh weighted wave-bank root. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenFortySeventhModelRefinementsExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenFortySeventhModelRefinements

def extendedFortySeventhModelRefinementsDimacsString : String :=
  let dimacs := extendedFortySeventhModelRefinementsCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedFortySeventhModelRefinementsDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenFortySeventhModelRefinementsExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenFortySeventhModelRefinementsExport.run args
