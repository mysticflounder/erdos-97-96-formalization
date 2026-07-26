import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

abbrev bvar (index : Nat) : BVLogicalExpr :=
  .literal (.getLsbD (.var index : BVExpr 1) 0)

abbrev bnot (value : BVLogicalExpr) : BVLogicalExpr := .not value
abbrev band (left right : BVLogicalExpr) : BVLogicalExpr := .gate .and left right
abbrev bor (left right : BVLogicalExpr) : BVLogicalExpr := .gate .or left right
abbrev bbeq (left right : BVLogicalExpr) : BVLogicalExpr := .gate .beq left right
abbrev bimplies (left right : BVLogicalExpr) : BVLogicalExpr := bor (bnot left) right

def bands : List BVLogicalExpr → BVLogicalExpr
  | [] => .const true
  | item :: items => band item (bands items)

def bors : List BVLogicalExpr → BVLogicalExpr
  | [] => .const false
  | item :: items => bor item (bors items)

abbrev bveq {width : Nat} (left right : BVExpr width) : BVLogicalExpr :=
  .literal (.bin left .eq right)

abbrev bvult {width : Nat} (left right : BVExpr width) : BVLogicalExpr :=
  .literal (.bin left .ult right)

def bvule {width : Nat} (left right : BVExpr width) : BVLogicalExpr :=
  bnot (bvult right left)

def atLeast : List BVLogicalExpr → Nat → BVLogicalExpr
  | _, 0 => .const true
  | [], _ + 1 => .const false
  | item :: items, bound + 1 =>
      bor (band item (atLeast items bound)) (atLeast items (bound + 1))

def atMost (items : List BVLogicalExpr) (bound : Nat) : BVLogicalExpr :=
  bnot (atLeast items (bound + 1))

def exactly (items : List BVLogicalExpr) (bound : Nat) : BVLogicalExpr :=
  band (atLeast items bound) (bnot (atLeast items (bound + 1)))

def literalToDimacs (literal : Nat × Bool) : String :=
  if literal.2 then toString (literal.1 + 1) else "-" ++ toString (literal.1 + 1)

def clauseToDimacs (clause : CNF.Clause Nat) : String :=
  String.intercalate " " (clause.map literalToDimacs) ++ " 0"

def maxVariable (cnf : CNF Nat) : Nat :=
  cnf.foldl (fun current clause =>
    clause.foldl (fun current literal => Nat.max current (literal.1 + 1)) current) 0

def toDimacs (cnf : CNF Nat) : String :=
  let header := s!"p cnf {maxVariable cnf} {cnf.length}"
  String.intercalate "\n" (header :: cnf.map clauseToDimacs) ++ "\n"

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
