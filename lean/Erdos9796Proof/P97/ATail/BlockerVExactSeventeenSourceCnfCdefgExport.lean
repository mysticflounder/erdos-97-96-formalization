/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefg

/-!
# Export the checked exact-seventeen BlockerV source CNF with schemas C--G

This executable writes the canonical DIMACS bytes of the Lean-authoritative
base formula extended by every checked cyclic placement of Kalmanson schemas
C through G.  It performs no independent re-encoding.
-/

open Problem97.ATailBlockerVExactSeventeenSourceCnf
open Problem97.ATailBlockerVExactSeventeenSourceCnfCdefg

/-- Canonical DIMACS text produced from the checked extended clause list. -/
def extendedDimacsString : String :=
  let dimacs := extendedCnf.map fun clause => clause.map litToDimacs
  let lines :=
    s!"p cnf {baseNumVars} {dimacs.length}" ::
      dimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

def main (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath extendedDimacsString
      return 0
  | _ =>
      IO.eprintln "usage: exact17_source_cdefg_cnf_export OUTPUT.cnf"
      return 2
