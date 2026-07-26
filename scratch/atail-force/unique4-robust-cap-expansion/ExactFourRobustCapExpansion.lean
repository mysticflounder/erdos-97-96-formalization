/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ExactFourSurvivalCover
import RobustCompletionRadiusChoice
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds

/-!
# Post-card-eleven exact-four robust expansion

The robust constructor of `ExactFourPhysicalConsumerOutcome` cannot remain on
the card-eleven cap profile.  Once the carrier has at least twelve points,
the cap-sum identity forces growth in the surplus cap, the first opposite
cap, or the second opposite cap.  Full deletion robustness at the physical
second apex also supplies its exact radius classification.

This is a source-level refinement, not a contradiction theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourRobustCapExpansionScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourRobustCompletionRadiusChoiceScratch
open ATailUniqueFourSourceCloserScratch

attribute [local instance] Classical.propDecidable

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- Exact arithmetic retained on the branch where the first opposite cap
grows beyond the least robust exact-four profile. -/
structure ExactFourFirstOppositeCapGrowth
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop where
  surplusCap_card_eq_five : S.surplusCap.card = 5
  firstOppCap_card_ge_five : 5 ≤ S.oppCap1.card
  oppositeCaps_card_add_two_eq_carrier :
    S.oppCap1.card + S.oppCap2.card + 2 = D.A.card

/-- Exact arithmetic retained on the branch where the second opposite cap
grows beyond the least robust exact-four profile. -/
structure ExactFourSecondOppositeCapGrowth
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop where
  surplusCap_card_eq_five : S.surplusCap.card = 5
  firstOppCap_card_eq_four : S.oppCap1.card = 4
  secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card
  secondOppCap_card_add_six_eq_carrier :
    S.oppCap2.card + 6 = D.A.card

/-- The cap which must grow beyond the least robust exact-four profile
`(surplus, first opposite, second opposite) = (5, 4, 5)`, retaining the
exact arithmetic implied by the failed earlier growth tests. -/
inductive ExactFourRobustCapGrowth
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop
  | surplus
      (surplusCap_card_ge_six : 6 ≤ S.surplusCap.card)
  | firstOpposite
      (profile : ExactFourFirstOppositeCapGrowth S)
  | secondOpposite
      (profile : ExactFourSecondOppositeCapGrowth S)

/-- Strongest uniform source packet currently available on the robust
exact-four constructor after the card-eleven certificate. -/
structure ExactFourPostCardElevenRobustSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type where
  ingress : ExactFourPhysicalCommonDeletionIngress R
  secondApex_robust : FullyDeletionRobustAt D S.oppApex2
  firstOppCap_card_ge_four : 4 ≤ S.oppCap1.card
  secondOppCap_card_ge_five : 5 ≤ S.oppCap2.card
  radiusClassification :
    DeletionRobustRadiusClassification D S.oppApex2
  capGrowth : ExactFourRobustCapGrowth S

/-- At cardinality at least twelve, the least robust exact-four cap profile
cannot persist: its cap sum would give carrier cardinality eleven. -/
theorem robust_capGrowth_of_card_ge_twelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (hcard : 12 ≤ D.A.card)
    (hsecondRobust : FullyDeletionRobustAt D S.oppApex2) :
    ExactFourRobustCapGrowth S := by
  have hopposite := oppositeCaps_card_ge_four D S
  have hfirst : 4 ≤ S.oppCap1.card := by
    simpa only [← capByIndex_oppIndex1_eq_oppCap1] using hopposite.1
  have hsecond : 5 ≤ S.oppCap2.card :=
    second_oppCap_card_ge_five hsecondRobust
  have hsurplusRaw := S.surplus_card_gt_four
  have hsurplus : 5 ≤ S.surplusCap.card := by
    omega
  by_cases hsurplusSix : 6 ≤ S.surplusCap.card
  · exact .surplus hsurplusSix
  by_cases hfirstFive : 5 ≤ S.oppCap1.card
  · exact .firstOpposite {
      surplusCap_card_eq_five := by omega
      firstOppCap_card_ge_five := hfirstFive
      oppositeCaps_card_add_two_eq_carrier := by
        have hsum := S.capSum
        omega }
  by_cases hsecondSix : 6 ≤ S.oppCap2.card
  · exact .secondOpposite {
      surplusCap_card_eq_five := by omega
      firstOppCap_card_eq_four := by omega
      secondOppCap_card_ge_six := hsecondSix
      secondOppCap_card_add_six_eq_carrier := by
        have hsum := S.capSum
        omega }
  have hsum := S.capSum
  exfalso
  omega

/-- Refine the robust constructor of the exact-four physical consumer to
the radius-level and cap-growth surfaces needed by a genuine terminal. -/
theorem nonempty_postCardElevenRobustSurface_of_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (hcard : 12 ≤ D.A.card)
    (ingress : ExactFourPhysicalCommonDeletionIngress R)
    (hsecondRobust : FullyDeletionRobustAt D S.oppApex2) :
    Nonempty (ExactFourPostCardElevenRobustSurface R) := by
  have hopposite := oppositeCaps_card_ge_four D S
  exact ⟨{
    ingress := ingress
    secondApex_robust := hsecondRobust
    firstOppCap_card_ge_four := by
      simpa only [← capByIndex_oppIndex1_eq_oppCap1] using hopposite.1
    secondOppCap_card_ge_five :=
      second_oppCap_card_ge_five hsecondRobust
    radiusClassification :=
      fullyDeletionRobustAt_radiusClassification
        (oppApex2_mem_A S) hsecondRobust
    capGrowth := robust_capGrowth_of_card_ge_twelve hcard hsecondRobust }⟩

#print axioms ExactFourFirstOppositeCapGrowth
#print axioms ExactFourSecondOppositeCapGrowth
#print axioms robust_capGrowth_of_card_ge_twelve
#print axioms nonempty_postCardElevenRobustSurface_of_robust

end ATailUniqueFourRobustCapExpansionScratch
end Problem97
