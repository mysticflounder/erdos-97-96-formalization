/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardGeThirteenTwoRadiusGoodSourceIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenOutcomeDispatcher

/-!
# Card-at-least-thirteen outcomes with a named-row good source

This module combines the exhaustive structural outcome split with a good
late-first-apex source that belongs to one of the two original second-apex
rows.  The source is retained across every outcome instead of being selected
again after the split.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCardGeThirteenTwoRadiusGoodSourceIngress
open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch

/-- The source-clean four-way card-at-least-thirteen outcome together with a
good source anchored in one of the two named radius rows. -/
structure CardGeThirteenAnchoredOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2) : Type where
  outcome : CardGeThirteenOutcome R firstRow secondRow
  namedRowGoodSource :
    TwoRadiusNamedRowGoodSourceIngress R firstRow secondRow

/-- Compose the exhaustive card-at-least-thirteen split with the source
anchored in one of the two rows supplied by the original branch. -/
theorem nonempty_cardGeThirteenAnchoredOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support) :
    Nonempty (CardGeThirteenAnchoredOutcome R firstRow secondRow) := by
  obtain ⟨outcome⟩ :=
    nonempty_cardGeThirteenOutcome R hcard surface rho otherRadius
      firstRow secondRow hradii hnoFive hfirstRadius hsecondRadius hdisjoint
  obtain ⟨namedRowGoodSource⟩ :=
    nonempty_twoRadiusNamedRowGoodSourceIngress
      R surface firstRow secondRow hnoFive hdisjoint
  exact ⟨⟨outcome, namedRowGoodSource⟩⟩

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.nonempty_cardGeThirteenAnchoredOutcome
