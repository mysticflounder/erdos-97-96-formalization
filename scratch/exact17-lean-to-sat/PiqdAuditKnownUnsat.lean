import Std.Tactic.BVDecide

set_option linter.unusedVariables false

open Std.Sat
open Std.Tactic.BVDecide.Reflect

namespace PiqdAuditKnownUnsat

def parseDimacsClause (line : String) : List (Nat × Bool) :=
  (line.splitOn " ").filterMap fun tok =>
    match tok.trimAscii.toInt? with
    | some 0 => none
    | some n => some (n.natAbs - 1, decide (n > 0))
    | none => none

def parseDimacs (s : String) : CNF Nat :=
  let body := (s.splitOn "\n").filter fun l =>
    let t := l.trimAscii
    !t.isEmpty && !t.startsWith "c" && !t.startsWith "p"
  body.map parseDimacsClause

def cnfText : String :=
  "p cnf 1 2
1 0
-1 0
"

def lratText : String :=
  "3 0 1 2 0
"

def cnf : CNF Nat := parseDimacs cnfText

theorem live_piqd_known_unsat_smoke : cnf.Unsat :=
  verifyCert_correct cnf lratText (by native_decide)

end PiqdAuditKnownUnsat

#print axioms PiqdAuditKnownUnsat.live_piqd_known_unsat_smoke
