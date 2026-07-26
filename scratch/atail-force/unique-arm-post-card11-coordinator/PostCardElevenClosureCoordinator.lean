/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CardElevenOriginalUniqueFourClosure
import ExactFourSurvivalCover
import UniqueFiveDistinctPhysicalSecondApexSplit
import CoincidentBlockerJointU5Ingress

/-!
# Original unique-radius arm after the card-eleven certificates

This coordinator consumes every checked producer currently available after
the fixed-cardinality exact-four certificate:

* exact four on carriers of cardinality at least twelve reaches the physical
  second-apex robust-or-swapped outcome;
* exact five with distinct blockers reaches the bi-apex-robust-or-swapped
  outcome; and
* exact five with a coincident blocker reaches a concrete U5 incidence-bank
  ingress.

Consequently the production unique-radius arm has exactly the three terminal
consumer obligations recorded by `OriginalUniqueRadiusArmPostCardElevenClosers`.
This file proves the coordinator, not those terminal consumers.
-/

namespace Problem97
namespace ATailUniqueArmPostCardElevenCoordinatorScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFiveCoincidentDirectFalseScratch
open ATailUniqueFiveDistinctHybridScratch
open ATailUniqueFourCardElevenCertificateScratch
open ATailUniqueFourSourceCloserScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}

/-- Exact three-way terminal interface after all currently checked source
producers and the card-eleven exact-four certificate have been consumed. -/
structure OriginalUniqueRadiusArmPostCardElevenClosers
    (F : CriticalPairFrontier D S radius H) : Prop where
  exactFourLarge :
    ∀ (R : OriginalUniqueFourResidual F),
      12 ≤ D.A.card →
      ExactFourPhysicalConsumerOutcome R →
      False
  exactFiveDistinct :
    ∀ (R : OriginalUniqueFiveDistinctBlockersResidual F),
      OriginalUniqueFiveDistinctPhysicalSecondOutcome R →
      False
  exactFiveCoincident :
    ∀ (R : OriginalUniqueFiveCoincidentBlockerResidual F),
      CoincidentBlockerU5IngressOutcome R →
      False

/-- The three post-card-eleven terminal consumers close the production-facing
original unique-radius arm.  The lower bound on the selected class is kept to
match the production theorem's exact field interface; the checked dispatcher
itself obtains the sharper exact-four/exact-five split. -/
theorem false_of_originalFrontierUniqueRadiusArm_of_postCardElevenClosers
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (_hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hunique : OriginalFrontierUniqueRadiusArm F)
    (hclose : OriginalUniqueRadiusArmPostCardElevenClosers F) :
    False := by
  rcases nonempty_originalUniqueRadiusArmPostCardEleven
      F hmin hNoM44 hcard hunique with ⟨postCardEleven⟩
  cases postCardEleven with
  | exactFourLarge R hlarge =>
      rcases nonempty_exactFourPhysicalConsumerOutcome R with ⟨outcome⟩
      exact hclose.exactFourLarge R hlarge outcome
  | exactFiveDistinct R =>
      exact hclose.exactFiveDistinct R (physicalSecondApex_split R)
  | exactFiveCoincident R =>
      rcases nonempty_coincidentBlockerU5IngressOutcome R with ⟨outcome⟩
      exact hclose.exactFiveCoincident R outcome

#print axioms OriginalUniqueRadiusArmPostCardElevenClosers
#print axioms false_of_originalFrontierUniqueRadiusArm_of_postCardElevenClosers

end ATailUniqueArmPostCardElevenCoordinatorScratch
end Problem97
