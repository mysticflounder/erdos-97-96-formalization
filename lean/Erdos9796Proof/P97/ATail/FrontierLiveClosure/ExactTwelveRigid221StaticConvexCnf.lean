/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticGeometrySat

/-!
# Exact reconstruction of the static convex perpendicular-bisector layer

This reconstructs the deterministic pair/triple loop in
`census/card_head/exact12_next_row_static_convex.py`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticConvexCnf

open StaticEqualityCnf
open StaticRelationLayout

abbrev Label := ExactTwelveCarrierIngress.Label

/-- Compiler datum `(a,b,p,q,r)`. -/
abbrev PerpBisectorDatum := Label × Label × Label × Label × Label

def perpBisectorData : List PerpBisectorDatum :=
  SafeCoverCnf.allPairs.flatMap fun focus =>
    let nonfocus := (List.range 12).filter fun point =>
      point != focus.1 && point != focus.2
    (triplesOf nonfocus).map fun points =>
      (fin12 focus.1, fin12 focus.2, fin12 points.1,
        fin12 points.2.1, fin12 points.2.2)

def perpBisectorClause (datum : PerpBisectorDatum) : List Int :=
  let a := datum.1
  let b := datum.2.1
  let p := datum.2.2.1
  let q := datum.2.2.2.1
  let r := datum.2.2.2.2
  [relationVar (p, a) (p, b), relationVar (q, a) (q, b),
    relationVar (r, a) (r, b)].map fun v => -Int.ofNat v

def clauseDelta : List (List Int) :=
  perpBisectorData.map perpBisectorClause

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem clauseCountAnchor : clauseDelta.length = 7920 := by
  native_decide

end StaticConvexCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
