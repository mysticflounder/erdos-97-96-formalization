/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore
import Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector

/-!
# Retained collisions cannot have the old ordered closing shape

For a collision in the actual blocker map restricted to the retained
first-apex radius class, the two collision sources are equidistant from both
the first apex and their common blocker.  Convex separation therefore puts
the two sources on opposite boundary arcs between those centers.

The former ordered producer target instead places both sources after the
common blocker in a cut of the boundary of the form `O,A,X,J,C,K`.  This file
checks that those requirements are incompatible before the proposed
cross-row membership is used.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedCollisionOrderedConsumerScratch

open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiber
open ATailFirstApexCriticalFiberRow
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

/-- A retained-radius collision is automatically on the `rowHit` side of the
production first-apex split: both collision sources lie in the retained
class, so the `bothOff` constructor is impossible. -/
theorem nonempty_rowHit_of_retainedCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) : Nonempty (RowHit Q.fiber) := by
  rcases nonempty_outcome Q.fiber with ⟨outcome⟩
  cases outcome with
  | bothOff off => exact False.elim (off.source₁_off Q.source₁_mem_radius)
  | rowHit hit => exact ⟨hit⟩

/-- The exact old ordered row-hit producer packet, specialized to a retained
collision.  The theorem below shows that its boundary-order fields are
already inconsistent with the mandatory two-circle alternation. -/
structure RetainedCollisionOrderedRowHitFields
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) (hit : RowHit Q.fiber) : Type where
  C : ℝ²
  K : ℝ²
  fiber_orientation : IsFiberOrientation Q.fiber C K
  hitSource_eq_C : hit.hitSource = C
  J_mem_A : hit.other ∈ D.A
  K_mem_J_shell :
    K ∈ (H.selectedAt hit.other J_mem_A).toCriticalFourShell.support
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  iO : Fin D.A.card
  iA : Fin D.A.card
  iX : Fin D.A.card
  iJ : Fin D.A.card
  iC : Fin D.A.card
  iK : Fin D.A.card
  hOA : iO < iA
  hAX : iA < iX
  hXJ : iX < iJ
  hJC : iJ < iC
  hCK : iC < iK
  boundary_O : boundary iO = S.oppApex1
  boundary_A :
    boundary iA = H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2
  boundary_X : boundary iX = H.centerAt hit.other J_mem_A
  boundary_J : boundary iJ = hit.other
  boundary_C : boundary iC = C
  boundary_K : boundary iK = K

namespace RetainedCollisionOrderedRowHitFields

private theorem firstApex_equidistant
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {Q : RetainedRadiusCollision (R := R)} {hit : RowHit Q.fiber}
    (fields : RetainedCollisionOrderedRowHitFields Q hit) :
    dist S.oppApex1 fields.C = dist S.oppApex1 fields.K := by
  rcases fields.fiber_orientation with h | h
  · rw [h.1, h.2]
    exact Q.firstApex_equidistant
  · rw [h.1, h.2]
    exact Q.firstApex_equidistant.symm

/-- A retained collision cannot realize the former ordered row-hit target.
The contradiction uses only the boundary order and the two equal-distance
pairs; in particular `K_mem_J_shell`, minimality, MEC data, and `noM44` are
irrelevant once this incompatible order has been requested. -/
theorem false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {Q : RetainedRadiusCollision (R := R)} {hit : RowHit Q.fiber}
    (fields : RetainedCollisionOrderedRowHitFields Q hit) : False := by
  have hsep :
      SurplusCOMPGBank.btw fields.iO fields.iA fields.iC ↔
        ¬ SurplusCOMPGBank.btw fields.iO fields.iA fields.iK := by
    apply SurplusCOMPGBank.btw_sep fields.boundary_ccw fields.boundary_injective
    · exact ne_of_lt fields.hOA
    · exact ne_of_gt
        (fields.hOA.trans <| fields.hAX.trans <| fields.hXJ.trans <|
          fields.hJC.trans fields.hCK)
    · exact ne_of_gt
        (fields.hAX.trans <| fields.hXJ.trans <| fields.hJC.trans fields.hCK)
    · simpa only [fields.boundary_O, fields.boundary_C, fields.boundary_K,
        dist_comm] using fields.firstApex_equidistant
    · simpa only [fields.boundary_A, fields.boundary_C, fields.boundary_K,
        dist_comm]
        using fields.fiber_orientation.commonBlocker_equidistant
    · simpa only [fields.boundary_C, fields.boundary_K]
        using fields.fiber_orientation.ne
  have hC : ¬ SurplusCOMPGBank.btw fields.iO fields.iA fields.iC := by
    unfold SurplusCOMPGBank.btw
    rintro (⟨_, hCA⟩ | ⟨_, hCO⟩)
    · exact (not_lt_of_ge
        (le_of_lt <| fields.hAX.trans <| fields.hXJ.trans fields.hJC)) hCA
    · exact (not_lt_of_ge
        (le_of_lt <| fields.hOA.trans <| fields.hAX.trans <|
          fields.hXJ.trans fields.hJC)) hCO
  have hK : ¬ SurplusCOMPGBank.btw fields.iO fields.iA fields.iK := by
    unfold SurplusCOMPGBank.btw
    rintro (⟨_, hKA⟩ | ⟨_, hKO⟩)
    · exact (not_lt_of_ge
        (le_of_lt <| fields.hAX.trans <| fields.hXJ.trans <|
          fields.hJC.trans fields.hCK)) hKA
    · exact (not_lt_of_ge
        (le_of_lt <| fields.hOA.trans <| fields.hAX.trans <|
          fields.hXJ.trans <| fields.hJC.trans fields.hCK)) hKO
  exact hC (hsep.mpr hK)

end RetainedCollisionOrderedRowHitFields

#print axioms RetainedCollisionOrderedRowHitFields.firstApex_equidistant
#print axioms RetainedCollisionOrderedRowHitFields.false
#print axioms nonempty_rowHit_of_retainedCollision

end ATailRetainedCollisionOrderedConsumerScratch
end Problem97
