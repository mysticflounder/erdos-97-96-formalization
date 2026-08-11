/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenGenericCancellationSecond

/-!
# Export the second checked exact-seventeen generic-cancellation child root

This executable writes canonical DIMACS bytes directly from the checked Lean
clause list. It performs no independent re-encoding.
-/

open Problem97.ATailBlockerVExactSeventeenSourceCnf
open Problem97.ATailBlockerVExactSeventeenGenericCancellationSecond

/-- Canonical DIMACS text produced from the checked child clause list. -/
def extendedSecondCancellationDimacsString : String :=
  let dimacs := extendedSecondCancellationCnf.map fun clause =>
    clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def main (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedSecondCancellationDimacsString
      return 0
  | _ =>
      IO.eprintln "usage: exact17_source_second_generic_cancellation_cnf_export OUTPUT.cnf"
      return 2
