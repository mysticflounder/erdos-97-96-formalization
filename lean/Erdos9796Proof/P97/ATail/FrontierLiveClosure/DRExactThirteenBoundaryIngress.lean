/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoRadiusExactTwelveProfile
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing

/-!
# Exact-thirteen boundary ingress for the two-radius branch

This module records the finite-cardinality part of the source boundary
construction.  `ZeroCutBoundaryIndexing.exists_with_capBlocks` supplies a
boundary indexing at arbitrary cardinality; the boundary image and
injectivity identify its index cardinality with the carrier cardinality.
At cardinality thirteen, the three exact profile alternatives can therefore
be packaged together with the direct or reflected cap blocks without making a
finite label-order claim.
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

/-- The size of an injective boundary indexing is the size of its carrier. -/
theorem boundaryIndexing_card_eq_n
    {A : Finset ℝ²} (B : Census554.GeneralCarrierBridge.BoundaryIndexing A) :
    A.card = B.n := by
  have h := Finset.card_image_of_injective Finset.univ B.boundary_injective
  rw [B.boundary_image, Finset.card_univ, Fintype.card_fin] at h
  exact h

/-- The fixed-cardinality source package for the exact-thirteen two-radius
branch.  `B.card_n` is the finite ingress needed before a `Fin 13` label map
can be introduced; the cap blocks retain their source-level order data. -/
structure ExactThirteenBoundaryBlocks
    {D : CounterexampleData} (S : SurplusCapPacket D.A) where
  B : BoundaryIndexing D.A
  card_n : B.n = 13
  hn : 0 < B.n
  iv : Fin B.n
  iw : Fin B.n
  surplus_eq : B.boundary (zeroIndex hn) =
    S.oppositeVertexByIndex S.surplusIdx
  first_eq : B.boundary iv = S.oppositeVertexByIndex S.oppIndex1
  second_eq : B.boundary iw = S.oppositeVertexByIndex S.oppIndex2
  blocks : DirectBoundaryBlocks S B.boundary hn iv iw ∨
    MirrorBoundaryBlocks S B.boundary hn iv iw
  profile : ExactThirteenTwoRadiusCapProfile S
  strict_profile :
    ((S.capInteriorByIndex S.surplusIdx).card = 3 ∧
        S.oppInterior1.card = 2 ∧ S.oppInterior2.card = 5) ∨
      ((S.capInteriorByIndex S.surplusIdx).card = 4 ∧
        S.oppInterior1.card = 2 ∧ S.oppInterior2.card = 4) ∨
      ((S.capInteriorByIndex S.surplusIdx).card = 3 ∧
        S.oppInterior1.card = 3 ∧ S.oppInterior2.card = 4)

namespace ExactThirteenBoundaryBlocks

variable {D : CounterexampleData} {S : SurplusCapPacket D.A}

/-- The retained boundary has exactly thirteen points. -/
theorem boundary_card (P : ExactThirteenBoundaryBlocks S) : D.A.card = 13 := by
  rw [boundaryIndexing_card_eq_n P.B, P.card_n]

/-- Forgetting the inverse labels exposes the fixed `Fin 13` boundary needed
by finite card-13 consumers. -/
theorem fin13_boundary (P : ExactThirteenBoundaryBlocks S) :
    ∃ boundary : Fin 13 → ℝ²,
      Function.Injective boundary ∧
        Finset.univ.image boundary = D.A ∧
          EuclideanGeometry.IsCcwConvexPolygon boundary := by
  rw [← P.card_n]
  exact ⟨P.B.boundary, P.B.boundary_injective, P.B.boundary_image,
    P.B.boundary_ccw⟩

/-- The zero-cut construction and the exact-thirteen profile combine into a
fixed-cap-block package. -/
theorem of_profile (hcard13 : D.A.card = 13)
    (hprofile : ExactThirteenTwoRadiusCapProfile S)
    (hstrict :
      ((S.capInteriorByIndex S.surplusIdx).card = 3 ∧
          S.oppInterior1.card = 2 ∧ S.oppInterior2.card = 5) ∨
        ((S.capInteriorByIndex S.surplusIdx).card = 4 ∧
          S.oppInterior1.card = 2 ∧ S.oppInterior2.card = 4) ∨
        ((S.capInteriorByIndex S.surplusIdx).card = 3 ∧
          S.oppInterior1.card = 3 ∧ S.oppInterior2.card = 4)) :
    ∃ P : ExactThirteenBoundaryBlocks S, P.profile = hprofile ∧
      P.strict_profile = hstrict := by
  obtain ⟨B, hn, iv, iw, hsurplus, hfirst, hsecond, hblocks⟩ :=
    exists_with_capBlocks S
  have hcard : B.n = 13 := by
    have h := boundaryIndexing_card_eq_n B
    omega
  refine ⟨
    { B := B
      card_n := hcard
      hn := hn
      iv := iv
      iw := iw
      surplus_eq := hsurplus
      first_eq := hfirst
      second_eq := hsecond
      blocks := hblocks
      profile := hprofile
      strict_profile := hstrict }, rfl, rfl⟩

/-- Branch-level ingress: exact-cardinality profile extraction followed by
the source zero-cut boundary package. -/
theorem of_twoRadiusBranch
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
    ∃ P : ExactThirteenBoundaryBlocks S, P.profile =
      exactThirteen_capProfile_of_twoRadiusBranch R surface rho otherRadius
        firstRow secondRow hradii hfirstRadius hsecondRadius hcard13 ∧
      P.strict_profile =
        exactThirteen_profile_of_twoRadiusBranch R surface rho otherRadius
          firstRow secondRow hradii hfirstRadius hsecondRadius hcard13 := by
  exact of_profile hcard13
    (exactThirteen_capProfile_of_twoRadiusBranch R surface rho otherRadius firstRow
      secondRow hradii hfirstRadius hsecondRadius hcard13)
    (exactThirteen_profile_of_twoRadiusBranch R surface rho otherRadius firstRow
      secondRow hradii hfirstRadius hsecondRadius hcard13)

end ExactThirteenBoundaryBlocks

end ATailFrontierLiveClosure
end Problem97
