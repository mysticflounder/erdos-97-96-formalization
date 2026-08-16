/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSmallRoleCycleRefinements

/-! Export the checked exact-seventeen small-role-cycle formula. -/

namespace Problem97
namespace ATailBlockerVExactSeventeenSmallRoleCycleRefinementsExport

open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSmallRoleCycleRefinements

def extendedSmallRoleCycleDimacsString : String :=
  let dimacs := extendedSmallRoleCycleCnf.map fun clause => clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def run (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedSmallRoleCycleDimacsString
      pure 0
  | _ =>
      IO.eprintln "usage: lake env lean --run <exporter> <output.cnf>"
      pure 2

end ATailBlockerVExactSeventeenSmallRoleCycleRefinementsExport
end Problem97

def main (args : List String) : IO UInt32 :=
  Problem97.ATailBlockerVExactSeventeenSmallRoleCycleRefinementsExport.run args
