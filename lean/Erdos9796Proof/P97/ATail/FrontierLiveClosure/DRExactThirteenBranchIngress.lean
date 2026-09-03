/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenValuation

/-!
# Exact-thirteen two-radius branch ingress

This module packages the finite exact-cardinality ingress supplied by
`DRExactThirteenValuation`.  It derives the interval saturation equalities from
the strict profile and the retained boundary blocks, then exposes the direct or
reflected finite label map.  It does not state a satisfiability or certificate
theorem, and it has no dependency on `Rigid221Closure`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing
open DRExactThirteenValuation
open ExactThirteenBoundaryBlocks

/-- The exact-card-thirteen finite source package used by the structural arm
encodings.  `orientation` is repeated explicitly so consumers need not unpack
the boundary-enumeration field merely to select the direct or mirror arm. -/
structure ExactThirteenBranchIngress
    {D : CounterexampleData} (S : SurplusCapPacket D.A) where
  P : ExactThirteenBoundaryBlocks S
  profile : Profile
  profile_spec : HasStrictProfile S profile
  pt : Fin 13 → ℝ²
  φ : Fin 13 → ℝ²
  idx : Fin 13 → Fin 13
  labelMap : LabelMap profile S pt
  boundaryEnumeration : ConvexBoundaryEnumeration profile pt φ idx
  orientation : idx = directIndex profile ∨ idx = mirrorIndex profile

namespace ExactThirteenBranchIngress

variable {D : CounterexampleData} {S : SurplusCapPacket D.A}

/-- Build the exact-card-thirteen finite ingress from the two-radius branch.
The no-five hypothesis is accepted as part of the branch packet for a direct
consumer, although the finite profile and boundary construction itself only
uses the two selected rows and their distinct radii. -/
theorem of_twoRadiusBranch
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (_hradii : otherRadius ≠ rho)
    (_hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (_hfirstRadius : firstRow.radius = rho)
    (_hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support)
    (hcard13 : D.A.card = 13) :
    Nonempty (ExactThirteenBranchIngress S) := by
  obtain ⟨P, _, _⟩ := ExactThirteenBoundaryBlocks.of_twoRadiusBranch
    R surface rho otherRadius firstRow secondRow _hradii _hfirstRadius
      _hsecondRadius hcard13
  obtain ⟨p, hp⟩ := exists_profile_of_boundaryBlocks P
  rcases P.blocks with hdirect | hmirror
  · obtain ⟨pt, φ, idx, hL, hE⟩ := direct_labelMap_of_profile_boundaryBlocks
      P p hp hdirect
    exact ⟨
      { P := P
        profile := p
        profile_spec := hp
        pt := pt
        φ := φ
        idx := idx
        labelMap := hL
        boundaryEnumeration := hE
        orientation := hE.orientation }⟩
  · obtain ⟨pt, φ, idx, hL, hE⟩ := mirror_labelMap_of_profile_boundaryBlocks
      P p hp hmirror
    exact ⟨
      { P := P
        profile := p
        profile_spec := hp
        pt := pt
        φ := φ
        idx := idx
        labelMap := hL
        boundaryEnumeration := hE
        orientation := hE.orientation }⟩

end ExactThirteenBranchIngress

end ATailFrontierLiveClosure
end Problem97
