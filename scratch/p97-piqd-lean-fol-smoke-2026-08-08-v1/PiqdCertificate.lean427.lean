import Std.Tactic.BVDecide

/-! PIQD output with only the Lean 4.27 `CNF` constructor compatibility edit. -/

set_option linter.unusedVariables false

open Std.Sat
open Std.Tactic.BVDecide.Reflect

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
  "p cnf 3 6
1 0
2 0
3 0
-3 1 0
3 -1 0
-3 0
"

def lratText : String :=
  "7 0 3 6 0
"

def pocCnf : CNF Nat := parseDimacs cnfText

theorem piqd_job_78032d33_8fd9_442a_8551_cf69109cf12c_unsat_lean427 :
    pocCnf.Unsat :=
  verifyCert_correct pocCnf lratText (by native_decide)

#print axioms piqd_job_78032d33_8fd9_442a_8551_cf69109cf12c_unsat_lean427
