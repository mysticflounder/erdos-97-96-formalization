/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnf

/-!
# Export the checked exact-seventeen BlockerV source CNF

This executable writes the canonical DIMACS bytes defined in
`BlockerVExactSeventeenSourceCnf`.  It performs no independent re-encoding.
-/

open Problem97.ATailBlockerVExactSeventeenSourceCnf

def main (args : List String) : IO UInt32 := do
  match args with
  | [outputPath] =>
      IO.FS.writeFile outputPath dimacsString
      return 0
  | _ =>
      IO.eprintln "usage: exact17_source_cnf_export OUTPUT.cnf"
      return 2
