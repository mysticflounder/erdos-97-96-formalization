/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustTwoRadiusCenterLocalization

/-!
# Normalizing the robust exact-four two-radius arm

The support-disjoint two-radius branch admits the checked minimal-deletion
normal form from the robust center-localization layer.  This wrapper preserves
the three exact endpoints without claiming that any endpoint is contradictory.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourRobustLargeRadiusContinuationScratch

open ATailDeletionRobustness
open ATailRobustTwoRadiusCenterLocalizationScratch

/-- Field-for-field compatibility from the production robustness packet to
the older scratch namespace used by the center-localization theorem. -/
theorem rtwoScratchRobust_of_production
    {D : CounterexampleData} {center : ℝ²}
    (R : ATailDeletionRobustness.FullyDeletionRobustAt D center) :
    ATailRTwoOffLiveHandlerScratch.FullyDeletionRobustAt D center :=
  { survives := R.survives }

/-- Field-for-field compatibility back to the production robustness packet,
so downstream endpoint consumers need not inherit the obsolete namespace. -/
theorem productionRobust_of_rtwoScratch
    {D : CounterexampleData} {center : ℝ²}
    (R : ATailRTwoOffLiveHandlerScratch.FullyDeletionRobustAt D center) :
    ATailDeletionRobustness.FullyDeletionRobustAt D center :=
  { survives := R.survives }

/-- The checked three-way endpoint obtained from a support-disjoint physical
row pair at the robust second opposite apex. -/
inductive ExactFourTwoRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (firstRow : SelectedFourClass D.A S.oppApex2) : Type
  | collisionInterval
      (endpoint : StrictPairCollisionIntervalEndpoint D S firstRow)
  | singletonCommonDeletion
      (endpoint : StrictPairSingletonCommonDeletionEndpoint D S H)
  | unequalCore
      (endpoint : StrictPairUnequalCoreEndpoint D S firstRow)

/-- Package the production center-localization theorem as the endpoint sum
consumed by the robust exact-four continuation. -/
theorem nonempty_exactFourTwoRadiusNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (hmin : D.Minimal)
    (H : CriticalShellSystem D.A)
    (R : FullyDeletionRobustAt D S.oppApex2)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (hcard : 4 < D.A.card) :
    Nonempty (ExactFourTwoRadiusNormalForm H firstRow) := by
  let scratchRobust := rtwoScratchRobust_of_production R
  rcases exists_strictPair_minimalDeletionNormalForm
      hmin H scratchRobust firstRow secondRow hdisjoint hcard with
    hcollision | hsingleton | hunequal
  · rcases hcollision with ⟨endpoint⟩
    exact ⟨.collisionInterval endpoint⟩
  · rcases hsingleton with ⟨endpoint⟩
    exact ⟨.singletonCommonDeletion endpoint⟩
  · rcases hunequal with ⟨endpoint⟩
    exact ⟨.unequalCore endpoint⟩

#print axioms ExactFourTwoRadiusNormalForm
#print axioms rtwoScratchRobust_of_production
#print axioms productionRobust_of_rtwoScratch
#print axioms nonempty_exactFourTwoRadiusNormalForm

end ATailUniqueFourRobustLargeRadiusContinuationScratch
end Problem97
