/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtySecondModelRefinements

/-!
# Export the checked exact-seventeen thirty-third child root

This executable writes canonical DIMACS bytes directly from the checked Lean
clause list.  It performs no independent re-encoding; the publication layer
separately pins and replays these exact bytes before admitting the child root.

The publication adapter authenticates this exporter together with the model,
`BlockerVExactSeventeenThirtySecondTwoCircleRefinement`, and
`BlockerVExactSeventeenThirtySecondKalmansonRefinement`; changing any of those
source bytes invalidates the external child33 pin.
-/

open Problem97.ATailBlockerVExactSeventeenSourceCnf
open Problem97.ATailBlockerVExactSeventeenThirtySecondModelRefinements

/-- Canonical DIMACS text produced from the checked child clause list. -/
def extendedThirtySecondModelRefinementsDimacsString : String :=
  let dimacs := extendedThirtySecondModelRefinementsCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def main (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedThirtySecondModelRefinementsDimacsString
      return 0
  | _ =>
      IO.eprintln
        "usage: exact17_source_thirty_second_model_refinements_cnf_export OUTPUT.cnf"
      return 2
