import Std.Tactic.BVDecide

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
  let body := (s.splitOn "\n").filter fun line =>
    let trimmed := line.trimAscii
    !trimmed.isEmpty && !trimmed.startsWith "c" && !trimmed.startsWith "p"
  body.map parseDimacsClause

def cnfText : String :=
  "p cnf 1 2\n1 0\n-1 0\n"

def lratText : String :=
  "3 0 1 2 0\n"

def replayCnf : CNF Nat := parseDimacs cnfText

theorem p97_piqd_replay_unsat : replayCnf.Unsat :=
  verifyCert_correct replayCnf lratText (by native_decide)
