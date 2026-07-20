/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FrontierPairGlobalDeletionSplit

/-!
# Scratch: install the robust-minimal context at the frontier split

This is the first source-faithful adapter after the retained frontier pair.
It does not manufacture the missing `firstClass_not_card_four` fact.  Instead,
under that explicit branch hypothesis, the directed split either installs the
fields required by the robust-second-apex minimal-deletion reduction or
returns the already banked companion common-deletion packet.  The structure is
kept local so this check does not import the older scratch module, whose
stage-one predecessor has a namespace collision with the current production
tree.  Its fields intentionally match that reduction's context one-for-one.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierPairRobustContextAdapter

open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATAILStageOnePrescribedApexDichotomy
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailFrontierCommonDeletionEscape
open ATailFrontierPairGlobalDeletionSplit
open ATailDeletionRobustness
open ATailCommonDeletionTwoCenter

attribute [local instance] Classical.propDecidable

/-- The robust-minimal context fields, retained without importing the older
scratch implementation.  This is an interface check, not a replacement for
the reduction theorem. -/
structure FrontierPairCrossRobustContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Prop where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  firstClass_not_card_four :
    (SelectedClass D.A S.oppApex1 r).card ≠ 4
  directed_cross_hit :
    P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support
  carrier_card_ge_fourteen : 14 ≤ D.A.card
  opposite_second_cap_card_ge_six : 6 ≤ S.oppCap2.card
  secondApex_robust : FullyDeletionRobustAt D S.oppApex2

/-- The directed frontier split installs the existing robust minimal-deletion
context on the cross-membership arm.  The other arm is returned unchanged as
the source-faithful companion packet. -/
theorem frontierPair_globalStep_robustContext_or_companion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (step : FrontierPairGlobalStep L)
    (hfirstClass_not_card_four :
      (SelectedClass D.A S.oppApex1 firstRadius).card ≠ 4) :
    Nonempty (FrontierPairCrossRobustContext F.pair) ∨
      Nonempty (CommonDeletionTwoCenterPacket D H F.pair.w
        S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A)) := by
  rcases step.directed with ⟨directed⟩
  cases directed with
  | crossMembership companion_mem_actualSupport
      _actualBlocker_not_mem_surplusCap =>
      exact Or.inl ⟨{
        minimal := R.minimal
        noM44 := R.noM44
        firstClass_not_card_four := hfirstClass_not_card_four
        directed_cross_hit := companion_mem_actualSupport
        carrier_card_ge_fourteen := L.carrier_card_ge_fourteen
        opposite_second_cap_card_ge_six := L.secondOppCap_card_ge_six
        secondApex_robust := B.secondApex_robust }⟩
  | companionCommonDeletion packet =>
      exact Or.inr ⟨packet⟩

/-- Parent-facing three-way normal form.  The exact-card-four arm is kept
explicit instead of being smuggled into the robust-minimal context. -/
theorem frontierPair_globalStep_exactFour_or_robustContext_or_companion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (step : FrontierPairGlobalStep L) :
    (SelectedClass D.A S.oppApex1 firstRadius).card = 4 ∨
      Nonempty (FrontierPairCrossRobustContext F.pair) ∨
      Nonempty (CommonDeletionTwoCenterPacket D H F.pair.w
        S.oppApex1 (H.centerAt F.pair.q F.pair.q_mem_A)) := by
  by_cases hfour : (SelectedClass D.A S.oppApex1 firstRadius).card = 4
  · exact Or.inl hfour
  · exact Or.inr (frontierPair_globalStep_robustContext_or_companion
      L step hfour)

#print axioms frontierPair_globalStep_robustContext_or_companion
#print axioms frontierPair_globalStep_exactFour_or_robustContext_or_companion

end ATailFrontierPairRobustContextAdapter
end Problem97
