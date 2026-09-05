/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13RawIngress

/-!
# Source ingress for the exact-thirteen coarse cell census

This module records the finite signature used by the orientation-parametric
exact-thirteen census.  The two rows at the second apex are normalized as the
row omitting the uncovered label and the other row containing it.  No fixed
center, support, or boundary orientation is selected.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open DRExactThirteenValuation
open ExactThirteenBranchIngress

attribute [local instance] Classical.propDecidable

/-- The source-derived finite signature of one exact-thirteen coarse cell.
It retains both possible boundary orientations, the exact `2+3` split in the
fixed five-label interval, and all four source-row/second-apex-row overlap
bounds. -/
structure ExactThirteenCoarseCellSignature
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport
      R surface firstRow secondRow Q.base P)
    (O : CardGeThirteenRawOtherOuterSupport
      R surface firstRow secondRow Q.base P T) : Type where
  orientation :
    P.idx = directIndex P.profile ∨ P.idx = mirrorIndex P.profile
  profile_eq_secondOpposite : P.profile = .secondOpposite
  zraw_mem_I2 : T.zraw ∈ secondOppositeInterior .secondOpposite
  zraw_mem_Lraw : T.zraw ∈ O.Lraw
  zraw_not_mem_Kraw : T.zraw ∉ T.Kraw
  Kraw_Lraw_disjoint : Disjoint T.Kraw O.Lraw
  slice_partition :
    (T.Kraw ∩ secondOppositeInterior .secondOpposite) ∪
        (O.Lraw ∩ secondOppositeInterior .secondOpposite) =
      secondOppositeInterior .secondOpposite
  slice_cards :
    (((T.Kraw ∩ secondOppositeInterior .secondOpposite).card = 2 ∧
        (O.Lraw ∩ secondOppositeInterior .secondOpposite).card = 3) ∨
      ((T.Kraw ∩ secondOppositeInterior .secondOpposite).card = 3 ∧
        (O.Lraw ∩ secondOppositeInterior .secondOpposite).card = 2))
  C0raw_Kraw_inter_card_le_two : (T.C0raw ∩ T.Kraw).card ≤ 2
  C1raw_Kraw_inter_card_le_two : (T.C1raw ∩ T.Kraw).card ≤ 2
  C0raw_Lraw_inter_card_le_two : (T.C0raw ∩ O.Lraw).card ≤ 2
  C1raw_Lraw_inter_card_le_two : (T.C1raw ∩ O.Lraw).card ≤ 2

/-- The live exact-thirteen packet enters the orientation-by-interval coarse
cell domain used by the 100-cell census.  This theorem only packages source
facts; it makes no solver or certificate claim. -/
theorem nonempty_exactThirteenCoarseCellSignature
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (U : ExactThirteenRawTwoThreePartition P
      firstRow.support secondRow.support)
    (T : CardGeThirteenExact13RawTightSupport
      R surface firstRow secondRow Q.base P)
    (O : CardGeThirteenRawOtherOuterSupport
      R surface firstRow secondRow Q.base P T)
    (V : ExactThirteenFivePositionalRows
      R firstRow secondRow Q.base P) :
    Nonempty
      (ExactThirteenCoarseCellSignature
        R surface firstRow secondRow Q P T O) := by
  classical
  let I2 := secondOppositeInterior (.secondOpposite : Profile)
  have hI2 : U.I2raw = I2 := by
    simpa [I2] using U.I2raw_eq.trans
      (congrArg secondOppositeInterior U.profile_eq_secondOpposite)
  have hzI2 : T.zraw ∈ I2 := by
    simpa [I2, hI2] using
      (exactThirteen_zraw_mem_I2raw R surface firstRow secondRow Q P U T)
  have hzK : T.zraw ∉ T.Kraw := by
    intro hz
    exact (Finset.disjoint_left.mp O.Lraw_disjoint_Kraw)
      O.Lraw_mem_zraw hz
  have hC0 : T.C0raw = V.sourceRow₁.rawSupport := by
    apply raw_eq_of_image_eq P
    rw [T.C0raw_image, V.sourceRow₁.rawSupport_image]
  have hC1 : T.C1raw = V.sourceRow₂.rawSupport := by
    apply raw_eq_of_image_eq P
    rw [T.C1raw_image, V.sourceRow₂.rawSupport_image]
  have hUK : U.Kraw = V.secondApexRow₁.rawSupport := by
    apply raw_eq_of_image_eq P
    rw [U.Kraw_image, V.secondApexRow₁.rawSupport_image]
  have hUL : U.Lraw = V.secondApexRow₂.rawSupport := by
    apply raw_eq_of_image_eq P
    rw [U.Lraw_image, V.secondApexRow₂.rawSupport_image]
  rcases O.is_other with hfirst | hsecond
  · have hTK : T.Kraw = U.Lraw := by
      apply raw_eq_of_image_eq P
      rw [T.Kraw_image, hfirst.1, U.Lraw_image]
    have hOL : O.Lraw = U.Kraw := by
      apply raw_eq_of_image_eq P
      rw [hfirst.2, U.Kraw_image]
    have hslices :
        (((T.Kraw ∩ I2).card = 2 ∧ (O.Lraw ∩ I2).card = 3) ∨
          ((T.Kraw ∩ I2).card = 3 ∧ (O.Lraw ∩ I2).card = 2)) := by
      rcases U.slice_cards with h23 | h32
      · exact Or.inr ⟨by simpa [hTK, hI2] using h23.2,
          by simpa [hOL, hI2] using h23.1⟩
      · exact Or.inl ⟨by simpa [hTK, hI2] using h32.2,
          by simpa [hOL, hI2] using h32.1⟩
    exact ⟨{
      orientation := P.orientation
      profile_eq_secondOpposite := U.profile_eq_secondOpposite
      zraw_mem_I2 := by simpa [I2] using hzI2
      zraw_mem_Lraw := O.Lraw_mem_zraw
      zraw_not_mem_Kraw := hzK
      Kraw_Lraw_disjoint := O.Lraw_disjoint_Kraw.symm
      slice_partition := by
        simpa [I2, hTK, hOL, hI2, Finset.union_comm] using U.slice_partition
      slice_cards := by simpa [I2] using hslices
      C0raw_Kraw_inter_card_le_two := by
        simpa [hC0, hTK, hUL] using
          (fivePositionalRows_sourceRow₁_secondRow_inter_card_le_two
            R firstRow secondRow Q.base P V)
      C1raw_Kraw_inter_card_le_two := by
        simpa [hC1, hTK, hUL] using
          (fivePositionalRows_sourceRow₂_secondRow_inter_card_le_two
            R firstRow secondRow Q.base P V)
      C0raw_Lraw_inter_card_le_two := by
        simpa [hC0, hOL, hUK] using
          (fivePositionalRows_sourceRow₁_firstRow_inter_card_le_two
            R firstRow secondRow Q.base P V)
      C1raw_Lraw_inter_card_le_two := by
        simpa [hC1, hOL, hUK] using
          (fivePositionalRows_sourceRow₂_firstRow_inter_card_le_two
            R firstRow secondRow Q.base P V) }⟩
  · have hTK : T.Kraw = U.Kraw := by
      apply raw_eq_of_image_eq P
      rw [T.Kraw_image, hsecond.1, U.Kraw_image]
    have hOL : O.Lraw = U.Lraw := by
      apply raw_eq_of_image_eq P
      rw [hsecond.2, U.Lraw_image]
    exact ⟨{
      orientation := P.orientation
      profile_eq_secondOpposite := U.profile_eq_secondOpposite
      zraw_mem_I2 := by simpa [I2] using hzI2
      zraw_mem_Lraw := O.Lraw_mem_zraw
      zraw_not_mem_Kraw := hzK
      Kraw_Lraw_disjoint := O.Lraw_disjoint_Kraw.symm
      slice_partition := by
        simpa [I2, hTK, hOL, hI2] using U.slice_partition
      slice_cards := by simpa [I2, hTK, hOL, hI2] using U.slice_cards
      C0raw_Kraw_inter_card_le_two := by
        simpa [hC0, hTK, hUK] using
          (fivePositionalRows_sourceRow₁_firstRow_inter_card_le_two
            R firstRow secondRow Q.base P V)
      C1raw_Kraw_inter_card_le_two := by
        simpa [hC1, hTK, hUK] using
          (fivePositionalRows_sourceRow₂_firstRow_inter_card_le_two
            R firstRow secondRow Q.base P V)
      C0raw_Lraw_inter_card_le_two := by
        simpa [hC0, hOL, hUL] using
          (fivePositionalRows_sourceRow₁_secondRow_inter_card_le_two
            R firstRow secondRow Q.base P V)
      C1raw_Lraw_inter_card_le_two := by
        simpa [hC1, hOL, hUL] using
          (fivePositionalRows_sourceRow₂_secondRow_inter_card_le_two
            R firstRow secondRow Q.base P V) }⟩

end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.nonempty_exactThirteenCoarseCellSignature
