/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ContextFrames
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoFullSecondApexClassesLargeInteriorOrGrid

/-!
# Card-at-least-thirteen two-radius split

This source-clean adapter preserves the binder shape of the card-at-least-
thirteen exact-four two-radius branch and exposes the row-local split needed
by its consumers.  The robust surface and carrier-cardinality hypotheses are
retained in the interface for direct branch compatibility; the split itself
uses the ambient convex-independence witness, the two row radii, the no-five
bounds, and row disjointness.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailOrientedPhysicalApexIngress
open ATailUniqueArmRouteAuditScratch

attribute [local instance] Classical.propDecidable

/-- Adapter for the card-at-least-thirteen exact-four two-radius branch:
the two supplied second-apex rows either have at least five strict-interior
points in union or form the exact adjacent-cap grid. -/
theorem two_full_secondApex_classes_largeInterior_or_grid_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (_hcard : 12 < D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (_hradii : otherRadius ≠ rho)
    (_hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (_hfirstRadius : firstRow.radius = rho)
    (_hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support) :
    5 ≤ ((firstRow.support ∩ S.oppInterior2) ∪
      (secondRow.support ∩ S.oppInterior2)).card ∨
      S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2
        firstRow.radius secondRow.radius := by
  have hrowRadii : firstRow.radius ≠ secondRow.radius := by
    intro hEq
    exact _hradii (_hsecondRadius.symm.trans (hEq.symm.trans _hfirstRadius))
  have hsplit := two_full_secondApex_classes_largeInterior_or_grid S D.convex
    firstRow secondRow _hdisjoint hrowRadii
      (_hnoFive firstRow.radius firstRow.radius_pos)
      (_hnoFive secondRow.radius secondRow.radius_pos)
  simpa only using hsplit

end ATailFrontierLiveClosure
end Problem97
