/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenBoundaryIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenValuation
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRZeroCutCapIntervals

/-!
# Exact-thirteen retained-cap ingress

This module composes the exact-thirteen profile ingress with the zero-cut
closed-cap interval package.  It retains the two non-wrapping cap blocks on
the common boundary; the wrapping cap remains available through the cyclic
recut interface described by `DRZeroCutCapIntervals`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing
open DRExactThirteenValuation

namespace ExactThirteenBoundaryBlocks

variable {D : CounterexampleData} {S : SurplusCapPacket D.A}

/-- Apply the retained non-wrapping cap package to an exact-thirteen boundary.
The result records the direct or mirror orientation and keeps `P.B.boundary`
as the common ambient enumeration for both retained blocks. -/
theorem retained_nonwrapping_caps
    (P : ExactThirteenBoundaryBlocks S) :
    (∃ (BS : CGN.StrictCapBlockData D.A (S.capByIndex S.surplusIdx))
        (B2 : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)),
        BS.n = P.B.n ∧ HEq BS.phi P.B.boundary ∧
          B2.n = P.B.n ∧ HEq B2.phi P.B.boundary) ∨
    (∃ (BS : CGN.StrictCapBlockData D.A (S.capByIndex S.surplusIdx))
        (B1 : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex1)),
        BS.n = P.B.n ∧ HEq BS.phi P.B.boundary ∧
          B1.n = P.B.n ∧ HEq B1.phi P.B.boundary) := by
  exact retained_nonwrapping_capBlocks_of_zeroCutBlocks S P.B P.hn P.iv P.iw
    P.surplus_eq P.first_eq P.second_eq P.blocks

/-- Branch-level exact-thirteen ingress with the retained pair of cap blocks.
This is a bookkeeping package only: it returns the exact profile and boundary
data together with the direct/mirror retained-cap alternative. -/
theorem retained_nonwrapping_caps_of_twoRadiusBranch
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard13 : D.A.card = 13) :
    ∃ P : ExactThirteenBoundaryBlocks S,
      P.profile = exactThirteen_capProfile_of_twoRadiusBranch R surface rho otherRadius
        firstRow secondRow hradii hfirstRadius hsecondRadius hcard13 ∧
      P.strict_profile = exactThirteen_profile_of_twoRadiusBranch R surface rho otherRadius
        firstRow secondRow hradii hfirstRadius hsecondRadius hcard13 ∧
      ((∃ (BS : CGN.StrictCapBlockData D.A (S.capByIndex S.surplusIdx))
          (B2 : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)),
          BS.n = P.B.n ∧ HEq BS.phi P.B.boundary ∧
            B2.n = P.B.n ∧ HEq B2.phi P.B.boundary) ∨
        (∃ (BS : CGN.StrictCapBlockData D.A (S.capByIndex S.surplusIdx))
          (B1 : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex1)),
          BS.n = P.B.n ∧ HEq BS.phi P.B.boundary ∧
            B1.n = P.B.n ∧ HEq B1.phi P.B.boundary)) := by
  obtain ⟨P, hprofile, hstrict⟩ :=
    ExactThirteenBoundaryBlocks.of_twoRadiusBranch R surface rho otherRadius
      firstRow secondRow hradii hfirstRadius hsecondRadius hcard13
  exact ⟨P, hprofile, hstrict, P.retained_nonwrapping_caps⟩

/- The complete direct/mirror package is kept alongside the retained
non-wrapping projection.  The third cap block uses the cyclically recut boundary
enumeration supplied by the zero-cut valuation theorem. -/

/-- Branch-level exact-thirteen ingress with all three source cap blocks.
This is the bookkeeping interface needed by a finite profile consumer: the
first two blocks use the common boundary and the third uses its cyclic recut. -/
theorem all_capBlocks_of_twoRadiusBranch
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hcard13 : D.A.card = 13) :
    ∃ P : ExactThirteenBoundaryBlocks S,
      P.profile = exactThirteen_capProfile_of_twoRadiusBranch R surface rho otherRadius
        firstRow secondRow hradii hfirstRadius hsecondRadius hcard13 ∧
      P.strict_profile = exactThirteen_profile_of_twoRadiusBranch R surface rho otherRadius
        firstRow secondRow hradii hfirstRadius hsecondRadius hcard13 ∧
      ((∃ (BS : CGN.StrictCapBlockData D.A (S.capByIndex S.surplusIdx))
          (B2 : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2))
          (BW : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex1)),
          BS.n = P.B.n ∧ HEq BS.phi P.B.boundary ∧
            B2.n = P.B.n ∧ HEq B2.phi P.B.boundary ∧
            BW.n = P.B.n ∧
              HEq BW.phi (fun q : Fin P.B.n => P.B.boundary (q + P.iw))) ∨
        (∃ (BS : CGN.StrictCapBlockData D.A (S.capByIndex S.surplusIdx))
          (B1 : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex1))
          (BW : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)),
          BS.n = P.B.n ∧ HEq BS.phi P.B.boundary ∧
            B1.n = P.B.n ∧ HEq B1.phi P.B.boundary ∧
            BW.n = P.B.n ∧
              HEq BW.phi (fun q : Fin P.B.n => P.B.boundary (q + P.iw)))) := by
  obtain ⟨P, hprofile, hstrict⟩ := ExactThirteenBoundaryBlocks.of_twoRadiusBranch
    R surface rho otherRadius firstRow secondRow hradii hfirstRadius
      hsecondRadius hcard13
  have hblocks :=
    DRExactThirteenValuation.all_capBlocks_of_zeroCutBlocks
      S P.B P.hn P.iv P.iw P.surplus_eq P.first_eq P.second_eq P.blocks
  exact ⟨P, hprofile, hstrict, hblocks⟩

end ExactThirteenBoundaryBlocks

end ATailFrontierLiveClosure
end Problem97
