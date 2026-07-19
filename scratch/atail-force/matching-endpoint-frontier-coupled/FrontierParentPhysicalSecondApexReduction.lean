/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ProductionPhysicalSecondApexCore
import ReciprocalSwapReduction

/-!
# Scratch: direct physical-second-apex reduction of the frontier parent

The common-deletion packet stored in every
`FrontierCommonDeletionParentResidual` already has the physical second apex as
its second center.  Therefore the uniform common-deletion consumer applies
before selecting any strict-interior sources.  The matching endpoint and
three-distinct-blocker leaves are not needed for this reduction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierParentPhysicalSecondApexReductionScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailRReciprocalSwapReductionScratch

/-- The protected swap adapter consumes the production critical endpoint. -/
theorem productionPhysicalSecondApex_commonDeletion_robust_or_swappedUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  rcases productionPhysicalSecondApex_commonDeletion_robust_or_critical C with
    hrobust | hcritical
  · exact Or.inl hrobust
  · exact Or.inr
      (secondApexCritical_reorients_to_firstApexUniqueFour
        hcritical.some.shell hcritical.some.deletion_blocked)

/-- Every frontier common-deletion parent reaches the physical-second-apex
robust branch or the protected swapped unique-four branch directly from its
stored packet. -/
theorem frontierCommonDeletionParent_secondApexRobust_or_swappedUniqueFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (FullyDeletionRobustAt D S.oppApex2) ∨
      Nonempty (SwappedFirstApexUniqueFourFrontier D S H) := by
  exact productionPhysicalSecondApex_commonDeletion_robust_or_swappedUniqueFour
    R.common.packet

/-- Motive-valued consumer boundary for one common-deletion parent. -/
theorem false_of_frontierCommonDeletionParent_physicalSecondApexConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (robustFalse : FullyDeletionRobustAt D S.oppApex2 → False)
    (swappedUniqueFourFalse :
      SwappedFirstApexUniqueFourFrontier D S H → False) :
    False := by
  rcases
      frontierCommonDeletionParent_secondApexRobust_or_swappedUniqueFour R with
    hrobust | hswapped
  · exact robustFalse hrobust.some
  · exact swappedUniqueFourFalse hswapped.some

/-- Direct parent assembler.  The common-deletion arm bypasses the entire
strict-interior terminal surface; only the physical robust consumer and the
protected swapped unique-four consumer remain alongside the original unique
arm. -/
theorem false_of_frontierPhysicalSecondApexConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (uniqueFalse : OriginalFrontierUniqueRadiusArm F → False)
    (robustFalse : FullyDeletionRobustAt D S.oppApex2 → False)
    (swappedUniqueFourFalse :
      SwappedFirstApexUniqueFourFrontier D S H → False) :
    False := by
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    F hmin hNoM44 hcard hfour uniqueFalse
  intro R
  exact false_of_frontierCommonDeletionParent_physicalSecondApexConsumers
    R robustFalse swappedUniqueFourFalse

#print axioms
  productionPhysicalSecondApex_commonDeletion_robust_or_critical
#print axioms
  productionPhysicalSecondApex_commonDeletion_robust_or_swappedUniqueFour
#print axioms
  frontierCommonDeletionParent_secondApexRobust_or_swappedUniqueFour
#print axioms
  false_of_frontierCommonDeletionParent_physicalSecondApexConsumers
#print axioms false_of_frontierPhysicalSecondApexConsumers

end ATailFrontierParentPhysicalSecondApexReductionScratch
end Problem97
