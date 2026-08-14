/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtyNinthModelRefinements

/-!
# Export the checked exact-seventeen Child40 root
-/

open Problem97.ATailBlockerVExactSeventeenSourceCnf
open Problem97.ATailBlockerVExactSeventeenThirtyNinthModelRefinements

def extendedThirtyNinthModelRefinementsDimacsString : String :=
  let dimacs := extendedThirtyNinthModelRefinementsCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def main (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedThirtyNinthModelRefinementsDimacsString
      return 0
  | _ =>
      IO.eprintln
        "usage: exact17_source_thirty_ninth_model_refinements_cnf_export OUTPUT.cnf"
      return 2
