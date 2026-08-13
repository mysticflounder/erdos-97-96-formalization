/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyEighthModelRefinements

/-!
# Export the checked exact-seventeen thirty-ninth child root

This executable writes canonical DIMACS bytes directly from the forthcoming
checked Lean clause list.  It performs no independent re-encoding.
-/

open Problem97.ATailBlockerVExactSeventeenSourceCnf
open Problem97.ATailBlockerVExactSeventeenThirtyEighthModelRefinements

/-- Canonical DIMACS text produced from the checked child clause list. -/
def extendedThirtyEighthModelRefinementsDimacsString : String :=
  let dimacs := extendedThirtyEighthModelRefinementsCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def main (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedThirtyEighthModelRefinementsDimacsString
      return 0
  | _ =>
      IO.eprintln
        "usage: exact17_source_thirty_eighth_model_refinements_cnf_export OUTPUT.cnf"
      return 2
