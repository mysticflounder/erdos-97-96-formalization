/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticEqualitySat

/-!
# Exact reconstruction of the static equilateral-bisector layer

This reconstructs the deterministic five-label permutation loop in
`census/card_head/exact12_next_row_static_geometry.py`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticGeometryCnf

open StaticEqualityCnf
open StaticRelationLayout

abbrev Label := ExactTwelveCarrierIngress.Label

/-- Length-`k` permutations in the same lexicographic recursive order as
Python's `itertools.permutations`. -/
def lexKPerms : Nat → List Nat → List (List Nat)
  | 0, _ => [[]]
  | k + 1, xs => xs.flatMap fun x =>
      (lexKPerms k (xs.erase x)).map fun rest => x :: rest

/-- Compiler datum `(p,a,b,c,x)`. -/
abbrev EquilateralDatum := Label × Label × Label × Label × Label

def equilateralData : List EquilateralDatum :=
  (lexKPerms 5 (List.range 12)).filterMap fun labels =>
    match labels with
    | [p, a, b, c, x] =>
        some (fin12 p, fin12 a, fin12 b, fin12 c, fin12 x)
    | _ => none

def equilateralClause (datum : EquilateralDatum) : List Int :=
  let p := datum.1
  let a := datum.2.1
  let b := datum.2.2.1
  let c := datum.2.2.2.1
  let x := datum.2.2.2.2
  [relationVar (p, a) (p, b), relationVar (p, a) (p, c),
    relationVar (p, a) (a, b), relationVar (p, a) (a, x),
    relationVar (p, a) (b, x), relationVar (c, x) (c, a)].map
      fun v => -Int.ofNat v

def clauseDelta : List (List Int) :=
  equilateralData.map equilateralClause

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem clauseCountAnchor : clauseDelta.length = 95040 := by
  native_decide

end StaticGeometryCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
