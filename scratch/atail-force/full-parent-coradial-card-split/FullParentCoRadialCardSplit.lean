/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveExactSix

/-!
# Correct cardinality boundary for the full-parent co-radial producer

The exact-six all-reverse leaf is already contradictory.  Consequently the
missing first-apex co-radial occurrence should only be requested on the
remaining `7 <= card` surface.  This file kernel-checks that dispatcher at the
complete `R`/`B`/`L` parent boundary.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFullParentCoRadialCardSplitScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailParentExactFiveExactSix
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

/-- The all-reverse branch needs a co-radial occurrence only after the
already-closed exact-six case has been removed. -/
theorem false_of_fullParentExactFiveAllReverseData_of_geSevenOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (occurrenceOfGeSeven :
      7 ≤ S.oppCap2.card →
        FirstApexCoRadialTransitionReversePairOccurrence A) : False := by
  by_cases hcapSix : S.oppCap2.card = 6
  · exact
      false_of_fullParentExactFiveAllReverseData_of_secondCap_card_eq_six
        A hcapSix
  · have hcapSeven : 7 ≤ S.oppCap2.card := by
      have hcapSixLower := L.secondOppCap_card_ge_six
      omega
    exact false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence
      A (occurrenceOfGeSeven hcapSeven)

/-- Exact-five parent dispatcher with the two independent mathematical
inputs exposed: the mutual-omission consumer and the all-reverse co-radial
producer restricted to the genuinely open cardinality range. -/
theorem false_of_fullParentExactFive_of_mutualConsumer_and_geSevenOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (mutualFalse : FullParentExactFiveMutualData L profile → False)
    (allReverseOccurrenceOfGeSeven :
      ∀ (continuation :
          LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
        (A : FullParentExactFiveAllReverseData L profile continuation),
        7 ≤ S.oppCap2.card →
          FirstApexCoRadialTransitionReversePairOccurrence A) : False := by
  rcases nonempty_mutualOmissionPair_or_fullParentExactFiveAllReverseData
      L profile with hmutual | ⟨continuation, hallReverse⟩
  · exact mutualFalse hmutual.some
  · exact false_of_fullParentExactFiveAllReverseData_of_geSevenOccurrence
      L hallReverse.some
      (allReverseOccurrenceOfGeSeven continuation hallReverse.some)

#print axioms false_of_fullParentExactFiveAllReverseData_of_geSevenOccurrence
#print axioms false_of_fullParentExactFive_of_mutualConsumer_and_geSevenOccurrence

end ATailFullParentCoRadialCardSplitScratch
end Problem97
