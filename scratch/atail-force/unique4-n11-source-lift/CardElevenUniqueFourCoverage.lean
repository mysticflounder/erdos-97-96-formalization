/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourClassCapDistribution
import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity
import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# Card-eleven exact-four coverage boundary

The two verified fixed-cardinality Boolean certificates use the exact-two
first-apex class distribution.  This file proves the source-level cap-profile
split at cardinality eleven and isolates the one branch those certificates do
not cover: a five-point first opposite cap containing at least three points of
the exact first-apex class in its strict interior.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourCardElevenLiftScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch

attribute [local instance] Classical.propDecidable

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- At cardinality eleven, the displayed surplus packet has one of the two
oriented profiles used by the fixed finite encoders. -/
theorem cardEleven_oriented_cap_profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (hcard : D.A.card = 11) :
    S.surplusCap.card = 5 ∧
      ((S.oppCap1.card = 4 ∧ S.oppCap2.card = 5) ∨
        (S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)) := by
  have hopposite := oppositeCaps_card_ge_four D S
  have hfirst : 4 ≤ S.oppCap1.card := by
    simpa only [← capByIndex_oppIndex1_eq_oppCap1] using hopposite.1
  have hsecond : 4 ≤ S.oppCap2.card := by
    simpa only [← capByIndex_oppIndex2_eq_oppCap2] using hopposite.2
  have hsurplus := S.surplus_card_gt_four
  have hsum := S.capSum
  have hnotBothFour :
      ¬ (S.oppCap1.card = 4 ∧ S.oppCap2.card = 4) := by
    rintro ⟨hfirstFour, hsecondFour⟩
    exact R.noM44 ⟨S, hfirstFour, hsecondFour⟩
  omega

/-- A four-point first opposite cap forces the exact-two class distribution.
The aligned three-hit arm is impossible because that cap has only two strict
interior vertices. -/
theorem exactTwo_of_firstOppCap_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (hfirst : S.oppCap1.card = 4) :
    Nonempty (ExactTwoStrictHitDistribution R) := by
  rcases exactFour_twoStrict_or_alignedInteriorFrontier R with htwo | haligned
  · exact htwo
  · rcases haligned with ⟨P⟩
    have hcapByIndex : (S.capByIndex S.oppIndex1).card = 4 := by
      simpa only [capByIndex_oppIndex1_eq_oppCap1] using hfirst
    have hinterior :
        (S.capInteriorByIndex S.oppIndex1).card = 2 :=
      S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four
        S.oppIndex1 hcapByIndex
    have hthree :
        3 ≤ (S.capInteriorByIndex S.oppIndex1).card :=
      P.three_strict_hits.trans
        (Finset.card_le_card Finset.inter_subset_right)
    omega

/-- Exact source coverage at cardinality eleven.

The two `exactTwo` constructors are precisely the source surfaces encoded by
the fixed p4 and p5 certificates.  The final constructor is the unencoded
aligned p5 surface. -/
inductive CardElevenUniqueFourCoverage
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type
  | exactTwoP4
      (profile : S.surplusCap.card = 5 ∧
        S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
      (distribution : ExactTwoStrictHitDistribution R)
  | exactTwoP5
      (profile : S.surplusCap.card = 5 ∧
        S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
      (distribution : ExactTwoStrictHitDistribution R)
  | alignedP5
      (profile : S.surplusCap.card = 5 ∧
        S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
      (aligned : AlignedInteriorFrontier R)

/-- Every exact-four residual on eleven carrier points enters one of the two
certified exact-two profiles or the still-open aligned p5 profile. -/
theorem nonempty_cardElevenUniqueFourCoverage
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (hcard : D.A.card = 11) :
    Nonempty (CardElevenUniqueFourCoverage R) := by
  rcases cardEleven_oriented_cap_profile R hcard with
    ⟨hsurplus, hprofile⟩
  rcases hprofile with ⟨hfirst, hsecond⟩ | ⟨hfirst, hsecond⟩
  · rcases exactTwo_of_firstOppCap_card_eq_four R hfirst with ⟨Q⟩
    exact ⟨CardElevenUniqueFourCoverage.exactTwoP4
      ⟨hsurplus, hfirst, hsecond⟩ Q⟩
  · rcases exactFour_twoStrict_or_alignedInteriorFrontier R with htwo | haligned
    · rcases htwo with ⟨Q⟩
      exact ⟨CardElevenUniqueFourCoverage.exactTwoP5
        ⟨hsurplus, hfirst, hsecond⟩ Q⟩
    · rcases haligned with ⟨P⟩
      exact ⟨CardElevenUniqueFourCoverage.alignedP5
        ⟨hsurplus, hfirst, hsecond⟩ P⟩

end ATailUniqueFourCardElevenLiftScratch
end Problem97

#print axioms Problem97.ATailUniqueFourCardElevenLiftScratch.cardEleven_oriented_cap_profile
#print axioms Problem97.ATailUniqueFourCardElevenLiftScratch.exactTwo_of_firstOppCap_card_eq_four
#print axioms Problem97.ATailUniqueFourCardElevenLiftScratch.nonempty_cardElevenUniqueFourCoverage
