/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import PostCardElevenClosureCoordinator
import ExactFourRobustLargeRadiusContinuation
import SwappedExactFourCoupling

/-!
# Refined original unique-radius arm after the card-eleven certificates

The exact-four obligation in `PostCardElevenClosureCoordinator` still exposed
the raw robust-or-swapped producer.  This file consumes the strongest checked
source refinements on both constructors:

* the robust constructor carries the deletion-radius classification and the
  forced post-card-eleven cap-growth trichotomy; and
* the swapped constructor carries the coupled original/swapped exact-four
  surface, including the two retained pairs and both strict-cap incidences.

The exact-five terminal obligations are unchanged.  No terminal contradiction
is asserted here.
-/

namespace Problem97
namespace ATailUniqueArmPostCardElevenRefinedCoordinatorScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailUniqueArmPostCardElevenCoordinatorScratch
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFiveCoincidentDirectFalseScratch
open ATailUniqueFiveDistinctHybridScratch
open ATailUniqueFourRobustCapExpansionScratch
open ATailUniqueFourRobustLargeRadiusContinuationScratch
open ATailUniqueFourSourceCloserScratch
open ATailUniqueFourSwappedTerminalScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}

/-- Both exact-four constructors after the card-eleven certificate, refined
to the strongest currently checked source surfaces. -/
inductive ExactFourPostCardElevenRefinedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type
  | robust
      (continuation : ExactFourPostCardElevenRobustContinuation R)
  | swapped
      (surface : CoupledSwappedExactFourSurface R)

/-- The raw physical-second-apex split always reaches one of the two refined
post-card-eleven exact-four surfaces. -/
theorem nonempty_exactFourPostCardElevenRefinedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card) :
    Nonempty (ExactFourPostCardElevenRefinedOutcome R) := by
  rcases nonempty_exactFourPhysicalConsumerOutcome R with ⟨outcome⟩
  cases outcome with
  | robust ingress hsecondRobust =>
      rcases nonempty_postCardElevenRobustSurface_of_robust
          hcard ingress hsecondRobust with ⟨surface⟩
      rcases nonempty_exactFourPostCardElevenRobustContinuation
          R surface with ⟨continuation⟩
      exact ⟨.robust continuation⟩
  | swappedUniqueFour ingress swapped =>
      rcases nonempty_coupledSwappedExactFourSurface
          R ingress swapped with ⟨surface⟩
      exact ⟨.swapped surface⟩

/-- Exact three-way terminal interface after refining both constructors of the
large-cardinality exact-four producer. -/
structure OriginalUniqueRadiusArmPostCardElevenRefinedClosers
    (F : CriticalPairFrontier D S radius H) : Prop where
  exactFourLarge :
    ∀ (R : OriginalUniqueFourResidual F),
      12 ≤ D.A.card →
      ExactFourPostCardElevenRefinedOutcome R →
      False
  exactFiveDistinct :
    ∀ (R : OriginalUniqueFiveDistinctBlockersResidual F),
      OriginalUniqueFiveDistinctPhysicalSecondOutcome R →
      False
  exactFiveCoincident :
    ∀ (R : OriginalUniqueFiveCoincidentBlockerResidual F),
      CoincidentBlockerU5IngressOutcome R →
      False

/-- The refined exact-four consumer together with the two existing exact-five
consumers closes the production-facing original unique-radius arm. -/
theorem false_of_originalFrontierUniqueRadiusArm_of_refinedPostCardElevenClosers
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hunique : OriginalFrontierUniqueRadiusArm F)
    (hclose : OriginalUniqueRadiusArmPostCardElevenRefinedClosers F) :
    False := by
  apply false_of_originalFrontierUniqueRadiusArm_of_postCardElevenClosers
      F hmin hNoM44 hcard hfour hunique
  exact {
    exactFourLarge := by
      intro R hlarge _
      rcases nonempty_exactFourPostCardElevenRefinedOutcome
          R hlarge with ⟨outcome⟩
      exact hclose.exactFourLarge R hlarge outcome
    exactFiveDistinct := hclose.exactFiveDistinct
    exactFiveCoincident := hclose.exactFiveCoincident }

#print axioms ExactFourPostCardElevenRefinedOutcome
#print axioms nonempty_exactFourPostCardElevenRefinedOutcome
#print axioms OriginalUniqueRadiusArmPostCardElevenRefinedClosers
#print axioms false_of_originalFrontierUniqueRadiusArm_of_refinedPostCardElevenClosers

end ATailUniqueArmPostCardElevenRefinedCoordinatorScratch
end Problem97
