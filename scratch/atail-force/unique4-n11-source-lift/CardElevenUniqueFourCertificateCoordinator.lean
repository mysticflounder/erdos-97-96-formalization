/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CardElevenUniqueFourCoverage
import MirrorLedgerAssembly
import P4FullLedgerSatisfaction
import P5ExactTwoClosure
import AlignedP5Closure

/-!
# Card-eleven exact-four certificate coordinator

This module composes the checked direct and reflected P4 terminals with the
already checked P5 exact-two and aligned-P5 terminals.
-/

namespace Problem97
namespace ATailUniqueFourCardElevenCertificateScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourAlignedP5BoundaryScratch
open ATailUniqueFourCardElevenLiftScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open P4DirectOuterValuationScratch
open P4MirrorValuationScratch
open P5ExactTwoCertificateClosureScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}

/-- The orientation split turns the direct and reflected P4 certificates into
a complete `(5,4,5)` exact-two terminal. -/
theorem false_of_p4ExactTwo
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
    (distribution : ExactTwoStrictHitDistribution R) :
    False := by
  rcases nonempty_p4DirectBoundaryPacket_or_mirror
      R profile distribution with hdirect | hmirror
  · rcases hdirect with ⟨P⟩
    exact false_of_p4DirectBoundaryPacket P
  · rcases hmirror with ⟨P⟩
    exact false_of_p4MirrorBoundaryPacket P

/-- All exact-four residuals on eleven carrier points are contradictory. -/
theorem false_of_cardElevenOriginalUniqueFourResidual
    (R : OriginalUniqueFourResidual F)
    (hcard : D.A.card = 11) :
    False := by
  rcases nonempty_cardElevenUniqueFourCoverage R hcard with ⟨coverage⟩
  cases coverage with
  | exactTwoP4 profile distribution =>
      exact false_of_p4ExactTwo R profile distribution
  | exactTwoP5 profile distribution =>
      exact false_of_p5ExactTwo R profile distribution
  | alignedP5 profile aligned =>
      exact false_of_alignedInteriorFrontier R profile aligned

end ATailUniqueFourCardElevenCertificateScratch
end Problem97
