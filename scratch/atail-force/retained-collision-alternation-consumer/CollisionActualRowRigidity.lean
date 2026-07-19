/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector

/-!
# Actual-row rigidity for a retained collision pair

The first apex and collision blocker already saturate the convex-carrier
perpendicular-bisector bound for the two collision sources.  Consequently,
any actual critical row containing both sources must have the same blocker
center as the collision fiber.  A genuinely new actual row through the same
pair is therefore an immediate equality-core contradiction, not a missing
Kalmanson row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace RetainedCollisionAlternationConsumerScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFirstApexCriticalFiber
open ATailCriticalFiberRetainedRadiusSelector

attribute [local instance] Classical.propDecidable

private theorem firstApex_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) : S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- Any actual critical row containing both retained collision sources has
the collision's common blocker as its center. -/
theorem actualRow_center_eq_commonBlocker_of_contains_collisionSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    {source : ℝ²} (hsource : source ∈ D.A)
    (hsource₁ :
      Q.fiber.source₁.1 ∈
        (H.selectedAt source hsource).toCriticalFourShell.support)
    (hsource₂ :
      Q.fiber.source₂.1 ∈
        (H.selectedAt source hsource).toCriticalFourShell.support) :
    H.centerAt source hsource =
      H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2 := by
  classical
  let o := S.oppApex1
  let a := H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2
  let z := H.centerAt source hsource
  have hoA : o ∈ D.A := by simpa [o] using firstApex_mem_A S
  have haA : a ∈ D.A := by simpa [a] using Q.fiber.commonBlocker_mem_A
  have hzA : z ∈ D.A := by
    simpa [z, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨source, hsource⟩).2
  have ha_ne_o : a ≠ o := by
    simpa [a, o] using Q.fiber.commonBlocker_ne_firstApex
  have hz_ne_o : z ≠ o := by
    simpa [z, o] using R.actualBlocker_ne_firstApex source hsource
  have hoEq : dist o Q.fiber.source₁.1 = dist o Q.fiber.source₂.1 := by
    simpa [o] using Q.firstApex_equidistant
  have haEq : dist a Q.fiber.source₁.1 = dist a Q.fiber.source₂.1 := by
    simpa [a] using Q.commonBlocker_equidistant
  have hzEq : dist z Q.fiber.source₁.1 = dist z Q.fiber.source₂.1 := by
    exact
      (H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
        Q.fiber.source₁.1 hsource₁
      |>.trans
        ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
          Q.fiber.source₂.1 hsource₂).symm
  by_contra hza
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    Q.fiber.source₁.2 Q.fiber.source₂.2 Q.fiber.source_points_ne
  have hoFilter :
      o ∈ D.A.filter (fun c ↦
        dist c Q.fiber.source₁.1 = dist c Q.fiber.source₂.1) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have haFilter :
      a ∈ D.A.filter (fun c ↦
        dist c Q.fiber.source₁.1 = dist c Q.fiber.source₂.1) :=
    Finset.mem_filter.mpr ⟨haA, haEq⟩
  have hzFilter :
      z ∈ D.A.filter (fun c ↦
        dist c Q.fiber.source₁.1 = dist c Q.fiber.source₂.1) :=
    Finset.mem_filter.mpr ⟨hzA, hzEq⟩
  have hthree :
      2 < (D.A.filter (fun c ↦
        dist c Q.fiber.source₁.1 = dist c Q.fiber.source₂.1)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, a, haFilter, z, hzFilter,
      ha_ne_o.symm, hz_ne_o.symm, Ne.symm hza⟩
  omega

/-- Equality-core terminal: a distinct actual blocker through both collision
sources is impossible. -/
theorem false_of_distinct_actualRow_contains_collisionSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R))
    {source : ℝ²} (hsource : source ∈ D.A)
    (hcenter_ne :
      H.centerAt source hsource ≠
        H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2)
    (hsource₁ :
      Q.fiber.source₁.1 ∈
        (H.selectedAt source hsource).toCriticalFourShell.support)
    (hsource₂ :
      Q.fiber.source₂.1 ∈
        (H.selectedAt source hsource).toCriticalFourShell.support) : False := by
  exact hcenter_ne
    (actualRow_center_eq_commonBlocker_of_contains_collisionSources
      Q hsource hsource₁ hsource₂)

#print axioms actualRow_center_eq_commonBlocker_of_contains_collisionSources
#print axioms false_of_distinct_actualRow_contains_collisionSources

end RetainedCollisionAlternationConsumerScratch
end Problem97
