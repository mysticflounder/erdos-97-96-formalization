/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenValuation
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenCapBetweenness

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
  /-- The finite boundary map is the retained source boundary, not merely an
  arbitrary convex re-enumeration of the same carrier. -/
  boundary_realization :
    ∀ q : Fin 13, φ q = P.B.boundary (Fin.cast P.card_n.symm q)
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
  · obtain ⟨pt, φ, idx, hL, hE, hboundary⟩ :=
      direct_labelMap_of_profile_boundaryBlocks_with_boundary P p hp hdirect
    exact ⟨
      { P := P
        profile := p
        profile_spec := hp
        pt := pt
        φ := φ
        idx := idx
        labelMap := hL
        boundaryEnumeration := hE
        boundary_realization := hboundary
        orientation := hE.orientation }⟩
  · obtain ⟨pt, φ, idx, hL, hE, hboundary⟩ :=
      mirror_labelMap_of_profile_boundaryBlocks_with_boundary P p hp hmirror
    exact ⟨
      { P := P
        profile := p
        profile_spec := hp
        pt := pt
        φ := φ
        idx := idx
        labelMap := hL
        boundaryEnumeration := hE
        boundary_realization := hboundary
        orientation := hE.orientation }⟩

/- ## Source-consumer cap betweenness -/

/-- Transport the source cap-betweenness theorem through a live exact-thirteen
branch ingress.  The finite label map and boundary enumeration remain part of
the hypotheses, while the cap block supplies the local ordered-cap indices.
This is the source-facing adapter used by the card-thirteen structural arms;
it does not assert that any particular arm is contradictory. -/
theorem cap_betweenness_of_ingress
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²}
    (P : ExactThirteenBranchIngress S)
    (B : CGN.StrictCapBlockData D.A C)
    (hBn : B.n = 13)
    (hphi : ∀ q : Fin 13,
      P.φ q = B.phi (Fin.cast hBn.symm q))
    {j r s : Fin 13}
    (hjC : P.pt j ∈ C) (hrC : P.pt r ∈ C) (hsC : P.pt s ∈ C)
    (hrs : P.idx r < P.idx s) (hjr : j ≠ r) (hjs : j ≠ s)
    (heq : dist (P.pt j) (P.pt r) = dist (P.pt j) (P.pt s)) :
    (P.idx r < P.idx j ∧ P.idx j < P.idx s) ∨
      (P.idx j < P.idx s ∧ P.idx s < P.idx r) ∨
      (P.idx s < P.idx r ∧ P.idx r < P.idx j) := by
  exact DRExactThirteenValuation.capLabel_boundary_between_of_equidistant
    B P.labelMap P.boundaryEnumeration hBn hphi
    hjC hrC hsC hrs hjr hjs heq

end ExactThirteenBranchIngress

end ATailFrontierLiveClosure
end Problem97
