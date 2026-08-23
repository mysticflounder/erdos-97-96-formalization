/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.TwoRadiusGridCapBoundarySigns
import Erdos9796Proof.P97.ATail.TwoRadiusGridEscapeSynchronization

/-! # Zero-cut assembly for the two-radius grid

This module combines the source-independent escape-synchronization and
boundary-sign kernels in the canonical zero-cut boundary supplied by a
surplus-cap packet.  It deliberately contains no source-selection data.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTwoRadiusGridZeroCutAssembly

open Census554
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing
open ATailTwoRadiusGridCoordinateGeometry
open ATailTwoRadiusGridEscapeSynchronization

private theorem oppositeVertexByIndex_oppIndex1_eq_oppApex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppositeVertexByIndex S.oppIndex1 = S.oppApex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex1, hi]

private theorem rightAdjacentCapByIndex_oppIndex1_eq_capByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentCapByIndex S.oppIndex1 =
      S.capByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.rightAdjacentCapByIndex,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.capByIndex, hi]

/-- The output needed by the D2 polynomial contradiction.  In the direct
zero-cut orientation the actual interior representatives have positive
transverse coordinate and all four boundary signs are positive.  In the
mirror orientation the actual representatives and signs are negative, while
the reflected escape representatives carry the positive nesting packet. -/
theorem twoRadiusGrid_zeroCut_assembly
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {a s sMinus L LMinus t : ℝ²}
    (haA : a ∈ D.A) (hLMinusA : LMinus ∈ D.A)
    (hsInside : s ∈ S.capInteriorByIndex S.oppIndex1)
    (hLInside : L ∈ S.capInteriorByIndex S.oppIndex1)
    (hsMinusLeft : sMinus ∈ S.leftAdjacentCapByIndex S.oppIndex1)
    (htRight : t ∈ S.rightAdjacentCapByIndex S.oppIndex1)
    (hoa : S.oppApex1 ≠ a) (hot : S.oppApex1 ≠ t)
    (hos : S.oppApex1 ≠ s) (hosMinus : S.oppApex1 ≠ sMinus)
    (hasMinus : a ≠ sMinus)
    (hssMinus : s ≠ sMinus) (haL : a ≠ L)
    (haLMinus : a ≠ LMinus) (hLLMinus : L ≠ LMinus)
    (hsReflect :
      scaledLongitudinalCoord S.oppApex1 a s =
          scaledLongitudinalCoord S.oppApex1 a sMinus ∧
        scaledTransverseCoord S.oppApex1 a s =
          -scaledTransverseCoord S.oppApex1 a sMinus)
    (hLReflect :
      scaledLongitudinalCoord S.oppApex1 a L =
          scaledLongitudinalCoord S.oppApex1 a LMinus ∧
        scaledTransverseCoord S.oppApex1 a L =
          -scaledTransverseCoord S.oppApex1 a LMinus)
    (hsO : dist S.oppApex1 s = dist S.oppApex1 sMinus)
    (hsA : dist a s = dist a sMinus)
    (hLO : dist S.oppApex1 L = dist S.oppApex1 LMinus)
    (hLA : dist a L = dist a LMinus)
    (hRadius : dist S.oppApex1 s < dist S.oppApex1 L)
    (hCommonBlocker : dist a s = dist a L)
    (hLMinusOutside : LMinus ∉ S.capInteriorByIndex S.oppIndex1) :
    (PositiveScaledNesting S.oppApex1 a s L ∧
        0 < signedArea2 S.oppApex1 a s ∧
        0 < signedArea2 S.oppApex1 s t ∧
        0 < signedArea2 S.oppApex1 sMinus t ∧
        (0 < signedArea2 S.oppApex1 L s →
          0 < signedArea2 L s t)) ∨
      ((scaledTransverseCoord S.oppApex1 a s < 0 ∧
          scaledTransverseCoord S.oppApex1 a L < 0) ∧
        PositiveScaledNesting S.oppApex1 a sMinus LMinus ∧
        signedArea2 S.oppApex1 a s < 0 ∧
        signedArea2 S.oppApex1 s t < 0 ∧
        signedArea2 S.oppApex1 sMinus t < 0 ∧
        (signedArea2 S.oppApex1 L s < 0 →
          signedArea2 L s t < 0)) := by
  classical
  let o : ℝ² := S.oppApex1
  have hoIndexed : S.oppositeVertexByIndex S.oppIndex1 = o := by
    exact oppositeVertexByIndex_oppIndex1_eq_oppApex1 S
  have hsMinusOutside : sMinus ∉ S.capInteriorByIndex S.oppIndex1 := by
    intro hsMinusInside
    have hprivate := S.capInteriorByIndex_mem_private S.oppIndex1 hsMinusInside
    exact (Finset.mem_sdiff.mp hprivate).2
      (Finset.mem_union.mpr (Or.inl hsMinusLeft))
  rcases exists_with_capBlocks S with
    ⟨B, hn, iv, iw, hu, hvIndexed, hw, hblocks⟩
  have hv : B.boundary iv = o := hvIndexed.trans hoIndexed
  have haIndex : ∃ ia : Fin B.n, B.boundary ia = a := by
    have haImage : a ∈ Finset.univ.image B.boundary := by
      simpa only [B.boundary_image] using haA
    rcases Finset.mem_image.mp haImage with ⟨ia, _hia, hia⟩
    exact ⟨ia, hia⟩
  have hLMinusIndex : ∃ iLMinus : Fin B.n, B.boundary iLMinus = LMinus := by
    have hImage : LMinus ∈ Finset.univ.image B.boundary := by
      simpa only [B.boundary_image] using hLMinusA
    rcases Finset.mem_image.mp hImage with ⟨iLMinus, _hi, hi⟩
    exact ⟨iLMinus, hi⟩
  rcases haIndex with ⟨ia, hia⟩
  rcases hLMinusIndex with ⟨iLMinus, hiLMinus⟩
  have hblock : BoundaryOrderConvex B
      (S.capInteriorByIndex S.oppIndex1) :=
    oppIndex1_capInterior_boundaryOrderConvex S B hn iv iw hu hvIndexed hw hblocks
  rcases hblocks with hdirect | hmirror
  · rcases hdirect.opp1_after s hsInside with ⟨is, hwis, his⟩
    rcases hdirect.opp1_after L hLInside with ⟨iL, hwiL, hiL⟩
    have hsMinusOpp2 : sMinus ∈ S.capByIndex S.oppIndex2 := by
      simpa only [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2]
        using hsMinusLeft
    have hleftInterval := S.capByIndex_interval_of_global_indices
      S.oppIndex2 B.boundary_ccw B.boundary_injective B.boundary_image
      hdirect.apex_order.1 (Or.inr hdirect.apex_order.2)
      (by simpa [hw] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm)
      (by simpa [hu] using
        S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm)
      (by simpa [hvIndexed] using
        S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm)
      sMinus
    rcases hleftInterval.mp hsMinusOpp2 with ⟨im, _hzim, himiv, him⟩
    have himivStrict : im < iv := by
      apply lt_of_le_of_ne himiv
      intro hEq
      apply hosMinus
      calc
        o = B.boundary iv := hv.symm
        _ = B.boundary im := congrArg B.boundary hEq.symm
        _ = sMinus := him
    have htSurplus : t ∈ S.capByIndex S.surplusIdx := by
      rw [← rightAdjacentCapByIndex_oppIndex1_eq_capByIndex_surplusIdx S]
      exact htRight
    have hrightInterval := S.capByIndex_interval_of_global_indices
      S.surplusIdx B.boundary_ccw B.boundary_injective B.boundary_image
      hdirect.apex_order.2 (Or.inl hdirect.apex_order.1)
      (by simpa [hu] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm)
      (by simpa [hvIndexed] using
        S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm)
      (by simpa [hw] using
        S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm)
      t
    rcases hrightInterval.mp htSurplus with ⟨it, hivit, hitiw, hit⟩
    have hivitStrict : iv < it := by
      apply lt_of_le_of_ne hivit
      intro hEq
      apply hot
      calc
        o = B.boundary iv := hv.symm
        _ = B.boundary it := congrArg B.boundary hEq
        _ = t := hit
    have hsync := twoRadiusGrid_escape_synchronization B
      (S.capInteriorByIndex S.oppIndex1)
      hv hia his him hiL hiLMinus D.convex hoa hos hosMinus hssMinus
      haL haLMinus hLLMinus hsReflect hLReflect hsO hsA hLO hLA hRadius
      hCommonBlocker hblock hsInside hsMinusOutside hLInside hLMinusOutside
    have hsign := boundary_sign_packet B hv hia his him hiL hit
      (by
        intro hEq
        apply hoa
        calc
          o = B.boundary iv := hv.symm
          _ = B.boundary ia := congrArg B.boundary hEq
          _ = a := hia)
      (by
        intro hEq
        apply hosMinus
        calc
          o = B.boundary iv := hv.symm
          _ = B.boundary im := congrArg B.boundary hEq.symm
          _ = sMinus := him)
      (by
        intro hEq
        apply hasMinus
        calc
          a = B.boundary ia := hia.symm
          _ = B.boundary im := congrArg B.boundary hEq.symm
          _ = sMinus := him)
      hssMinus hsO hsA
      (Or.inl ⟨himivStrict, hivitStrict,
        lt_of_le_of_lt hitiw hwis,
        lt_of_le_of_lt hitiw hwiL⟩)
    rcases hsync with hsync | hsync <;> rcases hsign with hsign | hsign
    · exact Or.inl ⟨hsync.2, hsign⟩
    · exact False.elim (by
        have hp := hsync.1.1
        have hn := hsign.1
        change scaledTransverseCoord o a s < 0 at hn
        linarith)
    · exact False.elim (by
        have hn := hsync.1.1
        have hp := hsign.1
        change 0 < scaledTransverseCoord o a s at hp
        linarith)
    · exact Or.inr ⟨hsync.1, hsync.2, hsign⟩
  · rcases hmirror.opp1_between s hsInside with ⟨is, hzIs, hisIw, his⟩
    rcases hmirror.opp1_between L hLInside with ⟨iL, hzIL, hiLIw, hiL⟩
    have hsMinusOpp2 : sMinus ∈ S.capByIndex S.oppIndex2 := by
      simpa only [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2]
        using hsMinusLeft
    have hleftComplement := S.capByIndex_complement_interval_of_global_indices
      S.oppIndex2 B.boundary_ccw B.boundary_injective B.boundary_image
      hmirror.apex_order.1 hmirror.apex_order.2
      (by simpa [hw] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm)
      (by simpa [hu] using
        S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm)
      (by simpa [hvIndexed] using
        S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm)
      sMinus
    rcases hleftComplement.mp hsMinusOpp2 with ⟨im, himSide, him⟩
    have himOrient : im < is ∨ iv < im := by
      rcases himSide with himZero | hivim
      · left
        exact lt_of_le_of_lt himZero hzIs
      · right
        apply lt_of_le_of_ne hivim
        intro hEq
        apply hosMinus
        calc
          o = B.boundary iv := hv.symm
          _ = B.boundary im := congrArg B.boundary hEq
          _ = sMinus := him
    have htSurplus : t ∈ S.capByIndex S.surplusIdx := by
      rw [← rightAdjacentCapByIndex_oppIndex1_eq_capByIndex_surplusIdx S]
      exact htRight
    have hrightInterval := S.capByIndex_reverse_interval_of_global_indices
      S.surplusIdx B.boundary_ccw B.boundary_injective B.boundary_image
      hmirror.apex_order.2 (Or.inl hmirror.apex_order.1)
      (by simpa [hu] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm)
      (by simpa [hvIndexed] using
        S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm)
      (by simpa [hw] using
        S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm)
      t
    rcases hrightInterval.mp htSurplus with ⟨it, hwit, hitiv, hit⟩
    have hitivStrict : it < iv := by
      apply lt_of_le_of_ne hitiv
      intro hEq
      apply hot
      calc
        o = B.boundary iv := hv.symm
        _ = B.boundary it := congrArg B.boundary hEq.symm
        _ = t := hit
    have hsync := twoRadiusGrid_escape_synchronization B
      (S.capInteriorByIndex S.oppIndex1)
      hv hia his him hiL hiLMinus D.convex hoa hos hosMinus hssMinus
      haL haLMinus hLLMinus hsReflect hLReflect hsO hsA hLO hLA hRadius
      hCommonBlocker hblock hsInside hsMinusOutside hLInside hLMinusOutside
    have hsign := boundary_sign_packet B hv hia his him hiL hit
      (by
        intro hEq
        apply hoa
        calc
          o = B.boundary iv := hv.symm
          _ = B.boundary ia := congrArg B.boundary hEq
          _ = a := hia)
      (by
        intro hEq
        apply hosMinus
        calc
          o = B.boundary iv := hv.symm
          _ = B.boundary im := congrArg B.boundary hEq.symm
          _ = sMinus := him)
      (by
        intro hEq
        apply hasMinus
        calc
          a = B.boundary ia := hia.symm
          _ = B.boundary im := congrArg B.boundary hEq.symm
          _ = sMinus := him)
      hssMinus hsO hsA
      (Or.inr ⟨lt_of_lt_of_le hisIw hwit, hitivStrict,
        lt_of_lt_of_le hiLIw hwit, himOrient⟩)
    rcases hsync with hsync | hsync <;> rcases hsign with hsign | hsign
    · exact Or.inl ⟨hsync.2, hsign⟩
    · exact False.elim (by
        have hp := hsync.1.1
        have hn := hsign.1
        change scaledTransverseCoord o a s < 0 at hn
        linarith)
    · exact False.elim (by
        have hn := hsync.1.1
        have hp := hsign.1
        change 0 < scaledTransverseCoord o a s at hp
        linarith)
    · exact Or.inr ⟨hsync.1, hsync.2, hsign⟩

end ATailTwoRadiusGridZeroCutAssembly
end Problem97
