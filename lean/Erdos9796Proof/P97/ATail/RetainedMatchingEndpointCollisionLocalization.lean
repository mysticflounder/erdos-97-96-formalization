/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedCollisionCapLocalization
import Erdos9796Proof.P97.ATail.RetainedMatchingEndpointContinuation

/-!
# Cap localization for a retained-matching endpoint collision

Status: `ON-SPINE SUPPORT`.  This module preserves the prescribed sources of
the endpoint shared-blocker branch.  It packages the retained row source and
the fourth first-apex row point as a `RetainedRadiusCollision`, then excludes
the latter point from the strict first-cap interior whenever the opposite
fiber endpoint supplies a third common-shell point there.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedMatchingEndpointCollisionLocalization

open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedCollisionCapLocalization
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointContinuation

attribute [local instance] Classical.propDecidable

namespace EndpointFreshFirstApexRowSource

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The retained endpoint row source and its fourth row point form a
source-prescribed retained-radius collision when their actual blockers agree.
The constructor keeps those exact sources instead of re-running the global
blocker-map dichotomy. -/
def retainedRadiusCollisionOfSharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hshared :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    RetainedRadiusCollision (R := R) := by
  let Jsource : CriticalShellSystem.CarrierVertex D.A := ⟨Q.J, Q.J_mem_A⟩
  have hsource₁Mem :
      E.fiber.source₁.1 ∈ SelectedClass D.A S.oppApex1 radius := by
    simpa only [← Q.C_eq_fiber_source₁] using Q.C_mem_radius
  have hsources : E.fiber.source₁ ≠ Jsource := by
    intro h
    apply Q.J_ne_C
    calc
      Q.J = Jsource.1 := rfl
      _ = E.fiber.source₁.1 := congrArg Subtype.val h.symm
      _ = Q.C := Q.C_eq_fiber_source₁.symm
  have hblockers :
      H.blockerVertex E.fiber.source₁ = H.blockerVertex Jsource := by
    apply Subtype.ext
    exact hshared
  exact RetainedRadiusCollision.ofSources
    E.fiber.source₁ Jsource hsource₁Mem Q.J_mem_radius hsources hblockers

@[simp] theorem retainedRadiusCollisionOfSharedBlocker_source₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hshared :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    (retainedRadiusCollisionOfSharedBlocker Q hshared).fiber.source₁ =
      E.fiber.source₁ := by
  simp [retainedRadiusCollisionOfSharedBlocker]

@[simp] theorem retainedRadiusCollisionOfSharedBlocker_source₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hshared :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A) :
    (retainedRadiusCollisionOfSharedBlocker Q hshared).fiber.source₂ =
      ⟨Q.J, Q.J_mem_A⟩ := by
  simp [retainedRadiusCollisionOfSharedBlocker]

/-- A shared-blocker fourth row point cannot also lie in the strict first-cap
interior when the opposite endpoint is a third common-shell point there. -/
theorem J_not_mem_firstCapInterior_of_sharedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support)
    (hshared :
      H.centerAt E.fiber.source₁.1 E.fiber.source₁.2 =
        H.centerAt Q.J Q.J_mem_A)
    (hKInterior : Q.K ∈ S.capInteriorByIndex S.oppIndex1) :
    Q.J ∉ S.capInteriorByIndex S.oppIndex1 := by
  intro hJInterior
  let collision := retainedRadiusCollisionOfSharedBlocker Q hshared
  have hsource₁Interior :
      collision.fiber.source₁.1 ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [show collision.fiber.source₁ = E.fiber.source₁ by simp [collision]]
    rw [E.fiber_source₁_eq_first]
    exact W.first_mem_capInterior
  have hsource₂Interior :
      collision.fiber.source₂.1 ∈ S.capInteriorByIndex S.oppIndex1 := by
    simpa only [show collision.fiber.source₂ = ⟨Q.J, Q.J_mem_A⟩ by
      simp [collision]] using hJInterior
  have hcap :=
    commonShell_inter_firstCap_eq_sources
      collision hsource₁Interior hsource₂Interior
  have hKCommon :
      Q.K ∈
        (H.selectedAt collision.fiber.source₁.1
          collision.fiber.source₁.2).toCriticalFourShell.support := by
    rw [collision.fiber.supports_eq]
    simpa only [show collision.fiber.source₂ = ⟨Q.J, Q.J_mem_A⟩ by
      simp [collision]] using K_mem_J_shell
  have hKInter :
      Q.K ∈
        (H.selectedAt collision.fiber.source₁.1
          collision.fiber.source₁.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr
      ⟨hKCommon,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hKInterior⟩
  rw [hcap] at hKInter
  have hKPair : Q.K = Q.C ∨ Q.K = Q.J := by
    simpa only [Finset.mem_insert, Finset.mem_singleton,
      show collision.fiber.source₁.1 = Q.C by
        rw [show collision.fiber.source₁ = E.fiber.source₁ by simp [collision]]
        exact Q.C_eq_fiber_source₁.symm,
      show collision.fiber.source₂.1 = Q.J by simp [collision]] using hKInter
  exact hKPair.elim
    (fun hKC ↦ Q.fiber_orientation.ne hKC.symm)
    (fun hKJ ↦ Q.J_ne_K hKJ.symm)

/-- Any endpoint-row point on the retained first-apex radius that is outside
the strict first-cap interior lies in one of the two adjacent closed caps. -/
theorem J_mem_leftAdjacentCap_or_rightAdjacentCap_of_not_mem_firstCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E)
    (hJOutside : Q.J ∉ S.capInteriorByIndex S.oppIndex1) :
    Q.J ∈ S.leftAdjacentCapByIndex S.oppIndex1 ∨
      Q.J ∈ S.rightAdjacentCapByIndex S.oppIndex1 := by
  have happ :=
    oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have hJIndexed :
      Q.J ∈
        SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex1) radius := by
    rw [← happ]
    exact Q.J_mem_radius
  have hJDiff :
      Q.J ∈
        SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) radius \
          S.capInteriorByIndex S.oppIndex1 :=
    Finset.mem_sdiff.mpr ⟨hJIndexed, hJOutside⟩
  have hcover :=
    S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
      S.oppIndex1 F.radius_pos hJDiff
  rcases Finset.mem_union.mp hcover with hleft | hright
  · exact Or.inl (Finset.mem_inter.mp hleft).2
  · exact Or.inr (Finset.mem_inter.mp hright).2

end EndpointFreshFirstApexRowSource

end ATailRetainedMatchingEndpointCollisionLocalization
end Problem97
