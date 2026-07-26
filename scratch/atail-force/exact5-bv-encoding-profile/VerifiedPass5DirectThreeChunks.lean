/-
Generated from direct.source-core.pass5.json.

This file is data for Lean's verified BVLogicalExpr -> AIG -> CNF pipeline.
Pseudo-Boolean constraints are lowered by the proved-by-definition `atLeast`
recursion below.  No Z3 Tseitin clauses are imported.
-/
import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace Problem97.ATailExactFiveVerifiedPass5

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

/-- Boolean unary threshold: at least `bound` inputs are true. -/
def atLeast : List BVLogicalExpr → Nat → BVLogicalExpr
  | _, 0 => .const true
  | [], _ + 1 => .const false
  | item :: items, bound + 1 =>
      bor (band item (atLeast items bound)) (atLeast items (bound + 1))

def atMost (items : List BVLogicalExpr) (bound : Nat) : BVLogicalExpr :=
  bnot (atLeast items (bound + 1))

def exactly (items : List BVLogicalExpr) (bound : Nat) : BVLogicalExpr :=
  band (atLeast items bound) (bnot (atLeast items (bound + 1)))

theorem bands_sat_of_each (source : BVExpr.Assignment) :
    ∀ items : List BVLogicalExpr,
      (∀ item ∈ items, item.eval source = true) → (bands items).eval source = true := by
  intro items h
  induction items with
  | nil => rfl
  | cons item items ih =>
      simp only [bands, BVLogicalExpr.eval_gate, Gate.eval, Bool.and_eq_true]
      exact ⟨h item (by simp), ih (fun candidate hc => h candidate (by simp [hc]))⟩

def directChunk000Assertions : List BVLogicalExpr :=
  [ bnot (bvar 67),
    exactly [bvar 67, bvar 68, bvar 69, bvar 70, bvar 71, bvar 72, bvar 73, bvar 74, bvar 75, bvar 76, bvar 77, bvar 78, bvar 79] 4,
    bnot (bvar 82),
    exactly [bvar 80, bvar 81, bvar 82, bvar 83, bvar 84, bvar 85, bvar 86, bvar 87, bvar 88, bvar 89, bvar 90, bvar 91, bvar 92] 4,
    bnot (bvar 97),
    exactly [bvar 93, bvar 94, bvar 95, bvar 96, bvar 97, bvar 98, bvar 99, bvar 100, bvar 101, bvar 102, bvar 103, bvar 104, bvar 105] 4,
    bnot (bands [bvar 70, bvar 72, bvar 83, bvar 85]),
    bnot (bands [bvar 70, bvar 73, bvar 83, bvar 86]),
    bnot (bands [bvar 70, bvar 74, bvar 83, bvar 87]),
    bnot (bands [bvar 70, bvar 75, bvar 83, bvar 88]),
    bnot (bands [bvar 72, bvar 73, bvar 85, bvar 86]),
    bnot (bands [bvar 72, bvar 74, bvar 85, bvar 87]),
    bnot (bands [bvar 72, bvar 75, bvar 85, bvar 88]),
    bnot (bands [bvar 72, bvar 76, bvar 85, bvar 89]),
    bnot (bands [bvar 72, bvar 77, bvar 85, bvar 90]),
    bnot (bands [bvar 72, bvar 79, bvar 85, bvar 92]),
    bnot (bands [bvar 73, bvar 74, bvar 86, bvar 87]),
    bnot (bands [bvar 73, bvar 75, bvar 86, bvar 88]),
    bnot (bands [bvar 73, bvar 76, bvar 86, bvar 89]),
    bnot (bands [bvar 73, bvar 77, bvar 86, bvar 90]),
    bnot (bands [bvar 73, bvar 78, bvar 86, bvar 91]),
    bnot (bands [bvar 73, bvar 79, bvar 86, bvar 92]),
    bnot (bands [bvar 74, bvar 75, bvar 87, bvar 88]),
    bnot (bands [bvar 74, bvar 76, bvar 87, bvar 89]),
    bnot (bands [bvar 74, bvar 77, bvar 87, bvar 90]),
    bnot (bands [bvar 74, bvar 78, bvar 87, bvar 91]),
    bnot (bands [bvar 74, bvar 79, bvar 87, bvar 92]),
    atMost [bvar 97, bvar 98, bvar 99, bvar 100, bvar 101] 1,
    atMost [bvar 67, bvar 75, bvar 76, bvar 77, bvar 78, bvar 79] 1,
    atMost [bvar 67, bvar 68, bvar 69, bvar 70, bvar 71] 1,
    atMost [bvar 93, bvar 94, bvar 95, bvar 96, bvar 97] 1,
    bnot (bvar 30),
    exactly [bvar 28, bvar 29, bvar 30, bvar 31, bvar 32, bvar 33, bvar 34, bvar 35, bvar 36, bvar 37, bvar 38, bvar 39, bvar 40] 4,
    bnot (bvar 47),
    exactly [bvar 41, bvar 42, bvar 43, bvar 44, bvar 45, bvar 46, bvar 47, bvar 48, bvar 49, bvar 50, bvar 51, bvar 52, bvar 53] 4,
    bnot (bands [bvar 29, bvar 35, bvar 42, bvar 48]),
    atMost [bvar 45, bvar 46, bvar 47, bvar 48, bvar 49] 2,
    bnot (bvar 59),
    exactly [bvar 54, bvar 55, bvar 56, bvar 57, bvar 58, bvar 59, bvar 60, bvar 61, bvar 62, bvar 63, bvar 64, bvar 65, bvar 66] 4,
    atMost [bvar 58, bvar 59, bvar 60, bvar 61, bvar 62] 2,
    bnot (bands [bvar 68, bvar 72, bvar 42, bvar 46]),
    bnot (bands [bvar 69, bvar 72, bvar 43, bvar 46]),
    bnot (bands [bvar 70, bvar 72, bvar 44, bvar 46]),
    bnot (bands [bvar 71, bvar 72, bvar 45, bvar 46]),
    bnot (bands [bvar 74, bvar 75, bvar 48, bvar 49]),
    bnot (bands [bvar 74, bvar 76, bvar 48, bvar 50]),
    bnot (bands [bvar 74, bvar 77, bvar 48, bvar 51]),
    bnot (bands [bvar 74, bvar 78, bvar 48, bvar 52]),
    bnot (bands [bvar 74, bvar 79, bvar 48, bvar 53]),
    atMost [bands [bvar 80, bvar 41], bands [bvar 81, bvar 42], bands [bvar 82, bvar 43], bands [bvar 83, bvar 44], bands [bvar 84, bvar 45], bands [bvar 85, bvar 46], bands [bvar 86, bvar 47], bands [bvar 87, bvar 48], bands [bvar 88, bvar 49], bands [bvar 89, bvar 50], bands [bvar 90, bvar 51], bands [bvar 91, bvar 52], bands [bvar 92, bvar 53]] 2,
    bnot (bands [bvar 81, bvar 87, bvar 42, bvar 48]),
    bnot (bands [bvar 81, bvar 88, bvar 42, bvar 49]),
    bnot (bands [bvar 81, bvar 89, bvar 42, bvar 50]),
    bnot (bands [bvar 81, bvar 90, bvar 42, bvar 51]),
    bnot (bands [bvar 81, bvar 91, bvar 42, bvar 52]),
    bnot (bands [bvar 81, bvar 92, bvar 42, bvar 53]),
    bnot (bands [bvar 83, bvar 85, bvar 44, bvar 46]),
    bnot (bands [bvar 87, bvar 88, bvar 48, bvar 49]),
    bnot (bands [bvar 87, bvar 90, bvar 48, bvar 51]),
    bnot (bands [bvar 87, bvar 91, bvar 48, bvar 52]),
    bnot (bands [bvar 87, bvar 92, bvar 48, bvar 53]),
    bnot (bands [bvar 88, bvar 89, bvar 49, bvar 50]),
    bnot (bands [bvar 88, bvar 90, bvar 49, bvar 51]),
    bnot (bands [bvar 88, bvar 91, bvar 49, bvar 52]) ]

def directChunk000 : BVLogicalExpr := bands directChunk000Assertions

def directChunk001Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 88, bvar 92, bvar 49, bvar 53]),
    bnot (bands [bvar 73, bvar 74, bvar 60, bvar 61]),
    bnot (bands [bvar 73, bvar 75, bvar 60, bvar 62]),
    bnot (bands [bvar 73, bvar 76, bvar 60, bvar 63]),
    bnot (bands [bvar 73, bvar 77, bvar 60, bvar 64]),
    bnot (bands [bvar 73, bvar 78, bvar 60, bvar 65]),
    bnot (bands [bvar 73, bvar 79, bvar 60, bvar 66]),
    bnot (bands [bvar 74, bvar 75, bvar 61, bvar 62]),
    bnot (bands [bvar 74, bvar 76, bvar 61, bvar 63]),
    bnot (bands [bvar 74, bvar 77, bvar 61, bvar 64]),
    bnot (bands [bvar 74, bvar 78, bvar 61, bvar 65]),
    bnot (bands [bvar 74, bvar 79, bvar 61, bvar 66]),
    atMost [bands [bvar 80, bvar 54], bands [bvar 81, bvar 55], bands [bvar 82, bvar 56], bands [bvar 83, bvar 57], bands [bvar 84, bvar 58], bands [bvar 85, bvar 59], bands [bvar 86, bvar 60], bands [bvar 87, bvar 61], bands [bvar 88, bvar 62], bands [bvar 89, bvar 63], bands [bvar 90, bvar 64], bands [bvar 91, bvar 65], bands [bvar 92, bvar 66]] 2,
    bnot (bands [bvar 81, bvar 86, bvar 55, bvar 60]),
    bnot (bands [bvar 81, bvar 87, bvar 55, bvar 61]),
    bnot (bands [bvar 81, bvar 88, bvar 55, bvar 62]),
    bnot (bands [bvar 81, bvar 90, bvar 55, bvar 64]),
    bnot (bands [bvar 81, bvar 91, bvar 55, bvar 65]),
    bnot (bands [bvar 81, bvar 92, bvar 55, bvar 66]),
    bnot (bands [bvar 86, bvar 87, bvar 60, bvar 61]),
    bnot (bands [bvar 86, bvar 88, bvar 60, bvar 62]),
    bnot (bands [bvar 86, bvar 89, bvar 60, bvar 63]),
    bnot (bands [bvar 86, bvar 92, bvar 60, bvar 66]),
    bnot (bands [bvar 87, bvar 88, bvar 61, bvar 62]),
    bnot (bands [bvar 87, bvar 89, bvar 61, bvar 63]),
    bnot (bands [bvar 87, bvar 90, bvar 61, bvar 64]),
    bnot (bands [bvar 87, bvar 91, bvar 61, bvar 65]),
    bnot (bands [bvar 87, bvar 92, bvar 61, bvar 66]),
    bnot (bands [bvar 88, bvar 89, bvar 62, bvar 63]),
    bnot (bands [bvar 88, bvar 90, bvar 62, bvar 64]),
    bnot (bands [bvar 88, bvar 91, bvar 62, bvar 65]),
    bnot (bands [bvar 88, bvar 92, bvar 62, bvar 66]),
    bnot (bands [bvar 54, bvar 58, bvar 41, bvar 45]),
    bnot (bands [bvar 54, bvar 61, bvar 41, bvar 48]),
    bnot (bands [bvar 54, bvar 62, bvar 41, bvar 49]),
    bnot (bands [bvar 55, bvar 58, bvar 42, bvar 45]),
    bnot (bands [bvar 55, bvar 61, bvar 42, bvar 48]),
    bnot (bands [bvar 55, bvar 62, bvar 42, bvar 49]),
    bnot (bands [bvar 56, bvar 58, bvar 43, bvar 45]),
    bnot (bands [bvar 56, bvar 61, bvar 43, bvar 48]),
    bnot (bands [bvar 56, bvar 62, bvar 43, bvar 49]),
    bnot (bands [bvar 56, bvar 65, bvar 43, bvar 52]),
    bnot (bands [bvar 56, bvar 66, bvar 43, bvar 53]),
    bnot (bands [bvar 57, bvar 58, bvar 44, bvar 45]),
    bnot (bands [bvar 57, bvar 61, bvar 44, bvar 48]),
    bnot (bands [bvar 57, bvar 62, bvar 44, bvar 49]),
    bnot (bands [bvar 57, bvar 63, bvar 44, bvar 50]),
    bnot (bands [bvar 57, bvar 64, bvar 44, bvar 51]),
    bnot (bands [bvar 57, bvar 65, bvar 44, bvar 52]),
    bnot (bands [bvar 57, bvar 66, bvar 44, bvar 53]),
    bnot (bands [bvar 58, bvar 61, bvar 45, bvar 48]),
    bnot (bands [bvar 58, bvar 62, bvar 45, bvar 49]),
    bnot (bands [bvar 58, bvar 63, bvar 45, bvar 50]),
    bnot (bands [bvar 58, bvar 64, bvar 45, bvar 51]),
    bnot (bands [bvar 58, bvar 65, bvar 45, bvar 52]),
    bnot (bands [bvar 58, bvar 66, bvar 45, bvar 53]),
    bnot (bands [bvar 61, bvar 62, bvar 48, bvar 49]),
    bnot (bands [bvar 61, bvar 63, bvar 48, bvar 50]),
    bnot (bands [bvar 61, bvar 64, bvar 48, bvar 51]),
    bnot (bands [bvar 61, bvar 65, bvar 48, bvar 52]),
    bnot (bands [bvar 61, bvar 66, bvar 48, bvar 53]),
    bnot (bands [bvar 62, bvar 64, bvar 49, bvar 51]),
    bnot (bands [bvar 62, bvar 65, bvar 49, bvar 52]),
    bnot (bands [bvar 62, bvar 66, bvar 49, bvar 53]) ]

def directChunk001 : BVLogicalExpr := bands directChunk001Assertions

def directChunk002Assertions : List BVLogicalExpr :=
  [ exactly [bvar 128, bvar 129, bvar 130, bvar 131, bvar 132, bvar 133, bvar 134, bvar 135, bvar 136, bvar 137, bvar 138, bvar 139, bvar 140] 5,
    bvar 129,
    bvar 130,
    bvar 131,
    exactly [bvar 132, bvar 133, bvar 134, bvar 135] 1,
    exactly [bvar 128, bvar 137, bvar 138, bvar 139, bvar 140] 1,
    bimplies (bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))]) (bbeq (bvar 28) (bvar 80)),
    bimplies (bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))]) (bbeq (bvar 29) (bvar 81)),
    bimplies (bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))]) (bbeq (bvar 31) (bvar 83)),
    bimplies (bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))]) (bbeq (bvar 32) (bvar 84)),
    bimplies (bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))]) (bbeq (bvar 34) (bvar 86)),
    bimplies (bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))]) (bbeq (bvar 36) (bvar 88)),
    bimplies (bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))]) (bbeq (bvar 38) (bvar 90)),
    bimplies (bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))]) (bbeq (bvar 39) (bvar 91)),
    bimplies (bors [bveq ((.var 13 : BVExpr 4)) ((.const 2#4)), bveq ((.var 14 : BVExpr 4)) ((.const 2#4)), bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bveq ((.var 16 : BVExpr 4)) ((.const 2#4)), bveq ((.var 17 : BVExpr 4)) ((.const 2#4)), bveq ((.var 18 : BVExpr 4)) ((.const 2#4)), bveq ((.var 19 : BVExpr 4)) ((.const 2#4)), bveq ((.var 20 : BVExpr 4)) ((.const 2#4)), bveq ((.var 21 : BVExpr 4)) ((.const 2#4)), bveq ((.var 22 : BVExpr 4)) ((.const 2#4)), bveq ((.var 23 : BVExpr 4)) ((.const 2#4)), bveq ((.var 24 : BVExpr 4)) ((.const 2#4)), bveq ((.var 25 : BVExpr 4)) ((.const 2#4))]) (bbeq (bvar 40) (bvar 92)),
    exactly [bvar 0, bvar 1, bvar 2, bvar 3, bvar 4, bvar 5, bvar 6, bvar 7, bvar 8, bvar 9, bvar 10, bvar 11, bvar 12] 4,
    bnot (bvar 4),
    bimplies (bveq ((.var 26 : BVExpr 4)) ((.const 9#4))) (bnot (bvar 9)),
    bimplies (bveq ((.var 27 : BVExpr 4)) ((.const 9#4))) (bnot (bvar 9)),
    bimplies (bveq ((.var 26 : BVExpr 4)) ((.const 10#4))) (bnot (bvar 10)),
    bimplies (bveq ((.var 27 : BVExpr 4)) ((.const 10#4))) (bnot (bvar 10)),
    bimplies (bveq ((.var 26 : BVExpr 4)) ((.const 11#4))) (bnot (bvar 11)),
    bimplies (bveq ((.var 27 : BVExpr 4)) ((.const 11#4))) (bnot (bvar 11)),
    bimplies (bveq ((.var 26 : BVExpr 4)) ((.const 12#4))) (bnot (bvar 12)),
    bimplies (bveq ((.var 27 : BVExpr 4)) ((.const 12#4))) (bnot (bvar 12)),
    atMost [bvar 4, bvar 5, bvar 6, bvar 7, bvar 8] 1,
    atMost [bvar 0, bvar 1, bvar 2, bvar 3, bvar 4] 1,
    bnot (bands [bvar 43, bvar 42]),
    bnot (bands [bvar 56, bvar 57]),
    bveq ((.var 14 : BVExpr 4)) ((.const 2#4)),
    bvar 81,
    bvar 83,
    bnot (bvar 80),
    bnot (bvar 84),
    atLeast [bvar 102, bvar 103, bvar 104, bvar 105] 2,
    atLeast [bvar 9, bvar 10, bvar 11, bvar 12] 2,
    bors [bands [bveq ((.var 26 : BVExpr 4)) ((.const 9#4)), bvar 102], bands [bveq ((.var 26 : BVExpr 4)) ((.const 10#4)), bvar 103], bands [bveq ((.var 26 : BVExpr 4)) ((.const 11#4)), bvar 104], bands [bveq ((.var 26 : BVExpr 4)) ((.const 12#4)), bvar 105], bands [bveq ((.var 27 : BVExpr 4)) ((.const 9#4)), bvar 102], bands [bveq ((.var 27 : BVExpr 4)) ((.const 10#4)), bvar 103], bands [bveq ((.var 27 : BVExpr 4)) ((.const 11#4)), bvar 104], bands [bveq ((.var 27 : BVExpr 4)) ((.const 12#4)), bvar 105]],
    exactly [bors [bvar 93, bvar 0], bors [bvar 94, bvar 1], bors [bvar 95, bvar 2], bors [bvar 96, bvar 3], bors [bvar 97, bvar 4], bors [bvar 98, bvar 5], bors [bvar 99, bvar 6], bors [bvar 100, bvar 7], bors [bvar 101, bvar 8], bors [bvar 102, bvar 9], bors [bvar 103, bvar 10], bors [bvar 104, bvar 11], bors [bvar 105, bvar 12]] 6,
    bors [bvar 102, bvar 9],
    bors [bvar 103, bvar 10],
    bors [bvar 104, bvar 11],
    bors [bvar 105, bvar 12],
    bvult ((.var 106 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 107 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 108 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 109 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 110 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 111 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 112 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 113 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 114 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 115 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 116 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 117 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 118 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 119 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 120 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 121 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 122 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 123 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 124 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 125 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 126 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 127 : BVExpr 7)) ((.const 78#7)) ]

def directChunk002 : BVLogicalExpr := bands directChunk002Assertions


def directChunks : List BVLogicalExpr := [directChunk000, directChunk001, directChunk002]

def directExpr : BVLogicalExpr := bands directChunks

theorem directChunk000_sat_of_each (source : BVExpr.Assignment)
    (h : ∀ item ∈ directChunk000Assertions, item.eval source = true) :
    directChunk000.eval source = true :=
  bands_sat_of_each source directChunk000Assertions h

theorem directChunk001_sat_of_each (source : BVExpr.Assignment)
    (h : ∀ item ∈ directChunk001Assertions, item.eval source = true) :
    directChunk001.eval source = true :=
  bands_sat_of_each source directChunk001Assertions h

theorem directChunk002_sat_of_each (source : BVExpr.Assignment)
    (h : ∀ item ∈ directChunk002Assertions, item.eval source = true) :
    directChunk002.eval source = true :=
  bands_sat_of_each source directChunk002Assertions h


theorem directExpr_sat_of_chunks (source : BVExpr.Assignment)
    (h000 : directChunk000.eval source = true)
    (h001 : directChunk001.eval source = true)
    (h002 : directChunk002.eval source = true) : directExpr.eval source = true := by
  simp [directExpr, directChunks, bands, BVLogicalExpr.eval_gate, Gate.eval,
    h000, h001, h002]

def directCnf : CNF Nat := AIG.toCNF directExpr.bitblast.relabelNat

def literalToDimacs (literal : Nat × Bool) : String :=
  if literal.2 then toString (literal.1 + 1) else "-" ++ toString (literal.1 + 1)

def clauseToDimacs (clause : CNF.Clause Nat) : String :=
  String.intercalate " " (clause.map literalToDimacs) ++ " 0"

def maxVariable : CNF Nat → Nat
  | [] => 0
  | clause :: clauses =>
      Nat.max (clause.foldl (fun current literal => Nat.max current (literal.1 + 1)) 0)
        (maxVariable clauses)

def directDimacs : String :=
  let header := s!"p cnf {maxVariable directCnf} {directCnf.length}"
  String.intercalate "
" (header :: directCnf.map clauseToDimacs) ++ "
"

def run (arguments : List String) : IO Unit := do
  match arguments with
  | [output] => IO.FS.writeFile output directDimacs
  | _ => throw <| IO.userError "usage: VerifiedPass5Direct <output.cnf>"

end Problem97.ATailExactFiveVerifiedPass5

def main (arguments : List String) : IO Unit :=
  Problem97.ATailExactFiveVerifiedPass5.run arguments
