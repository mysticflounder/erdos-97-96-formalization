/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticRelationAssignment

/-!
# Exact reconstruction of the static equality-clause layer

This is the Lean reconstruction of
`census/card_head/exact12_next_row_static_equality.py`: selected-row
implications, relation transitivity, and duplicate-center obstructions, in the
same deterministic enumeration order.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticEqualityCnf

open Census554.CoverCnf
open Census554.EqualityCore
open StaticRelationLayout

abbrev Label := ExactTwelveCarrierIngress.Label

/-- Two-element combinations with their exact ordered contents exposed. -/
def pairsOf (xs : List Nat) : List (Nat × Nat) :=
  (combos 2 xs).filterMap fun ys =>
    match ys with
    | [a, b] => some (a, b)
    | _ => none

/-- Three-element combinations with their exact ordered contents exposed. -/
def triplesOf (xs : List Nat) : List (Nat × Nat × Nat) :=
  (combos 3 xs).filterMap fun ys =>
    match ys with
    | [a, b, c] => some (a, b, c)
    | _ => none

/-- Endpoint values of one candidate support. -/
def candidateSupport (center candidateIndex : Nat) : List Nat :=
  (List.range 12).filter fun a =>
    ((SafeCoverCnf.candMasks center).getD candidateIndex 0).testBit a

/-- Compiler datum for one selected-row equality implication. -/
abbrev RowImplicationDatum := Label × Nat × Label × Label

def rowImplicationData : List RowImplicationDatum :=
  (List.range 12).flatMap fun center =>
    (List.range (SafeCoverCnf.candCount center)).flatMap fun candidateIndex =>
      (pairsOf (candidateSupport center candidateIndex)).map fun endpoints =>
        (fin12 center, candidateIndex, fin12 endpoints.1, fin12 endpoints.2)

def rowImplicationClause (datum : RowImplicationDatum) : List Int :=
  let center := datum.1
  let a := datum.2.2.1
  let b := datum.2.2.2
  [-Int.ofNat (SafeCoverCnf.xVar center.val datum.2.1),
    Int.ofNat (relationVar (center, a) (center, b))]

def rowImplicationClauses : List (List Int) :=
  rowImplicationData.map rowImplicationClause

/-- Lexicographic triples of the 66 compiler edge indices. -/
def relationTripleData : List (Nat × Nat × Nat) :=
  triplesOf (List.range 66)

def transitivityClausesAt (datum : Nat × Nat × Nat) : List (List Int) :=
  let first := edgeAt datum.1
  let second := edgeAt datum.2.1
  let third := edgeAt datum.2.2
  let firstSecond := relationVar first second
  let firstThird := relationVar first third
  let secondThird := relationVar second third
  [[-Int.ofNat firstSecond, -Int.ofNat secondThird, Int.ofNat firstThird],
   [-Int.ofNat firstSecond, -Int.ofNat firstThird, Int.ofNat secondThird],
   [-Int.ofNat firstThird, -Int.ofNat secondThird, Int.ofNat firstSecond]]

def transitivityClauses : List (List Int) :=
  relationTripleData.flatMap transitivityClausesAt

/-- Compiler datum `(firstCenter, secondCenter, first, second, third)` for one
duplicate-center obstruction. -/
abbrev DuplicateCenterDatum := Label × Label × Label × Label × Label

def duplicateCenterData : List DuplicateCenterDatum :=
  SafeCoverCnf.allPairs.flatMap fun centers =>
    let remaining := (List.range 12).filter fun p =>
      p != centers.1 && p != centers.2
    (triplesOf remaining).map fun points =>
      (fin12 centers.1, fin12 centers.2, fin12 points.1,
        fin12 points.2.1, fin12 points.2.2)

def duplicateCenterClause (datum : DuplicateCenterDatum) : List Int :=
  let a := datum.1
  let b := datum.2.1
  let p := datum.2.2.1
  let q := datum.2.2.2.1
  let r := datum.2.2.2.2
  [relationVar (a, p) (a, q), relationVar (a, p) (a, r),
    relationVar (b, p) (b, q), relationVar (b, p) (b, r)].map
      fun v => -Int.ofNat v

def duplicateCenterClauses : List (List Int) :=
  duplicateCenterData.map duplicateCenterClause

/-- Complete v1 static equality delta. -/
def clauseDelta : List (List Int) :=
  rowImplicationClauses ++ transitivityClauses ++ duplicateCenterClauses

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
/-- Exact Python-compatible family counts. -/
theorem clauseCountAnchors :
    rowImplicationClauses.length = 18240 ∧
    transitivityClauses.length = 137280 ∧
    duplicateCenterClauses.length = 7920 ∧
    clauseDelta.length = 163440 := by
  native_decide

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
theorem relationVar_comm (e f : Edge Label) :
    relationVar e f = relationVar f e := by
  native_decide +revert

end StaticEqualityCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
