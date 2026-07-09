/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ResidualSoundness

/-!
# Data-first endpoint residual interfaces

This module exposes endpoint residual handoffs that reveal the residual label
data before asking for the remaining selected-class and finite-mask side
conditions.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

/-- Data-first left endpoint contradiction: after the residual label data is
exposed, the caller may choose the non-payload selected classes and prove the
remaining side conditions for that induced endpoint shadow. -/
theorem endpointLeft_residual_exists_false_of_selectedClass_core_data
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ², ∃ xLabel : ShadowBank.Label,
      let pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      IsEndpointEscapeeLabel xLabel ∧
        Function.Injective pointOf ∧
        pointOf xLabel = x ∧
        (∀ center : ShadowBank.Label, pointOf center ∈ A) ∧
        ((centerClass : ShadowBank.Label → Finset ℝ²) →
          centerClass .v =
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius →
          centerClass .w =
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho →
          (radiusOf : ShadowBank.Label → ℝ) →
          (∀ center : ShadowBank.Label,
            centerClass center =
              SelectedClass A (pointOf center) (radiusOf center)) →
          (∀ center : ShadowBank.Label, center ≠ .v → center ≠ .w →
            0 < radiusOf center) →
          (∀ center : ShadowBank.Label, center ≠ .v → center ≠ .w →
            SurplusCOMPGBank.maskCard
              (endpointPointMask pointOf (centerClass center)) = 4) →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.isMoserLabel center = false →
              (SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .u &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .v &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .w) =
                  false) →
          (∀ c cp l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.sepOKFor
              (endpointShadowOfPointClasses pointOf centerClass)
              c cp l₁ l₂ = true) →
          False) := by
  classical
  rcases endpointLeft_residual_exists_label_data hM44 hconv hend with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, aLabel, bLabel,
      hp12, hpPair, hq12, hqPair, hs12, hs13, hs23, hsSub,
      hxLabel, haLabel, hbLabel, hxLabelEq, _hT₁card, hI₁sub,
      hxLeftEq, haRightEq, _hT₂card, hI₂sub, hbLeftEq, huRightEq⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁ : p₁ ∈ S.oppInterior1 := by
      rw [hpPair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂ : p₂ ∈ S.oppInterior1 := by
      rw [hpPair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁ : q₁ ∈ S.oppInterior2 := by
      rw [hqPair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂ : q₂ ∈ S.oppInterior2 := by
      rw [hqPair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  let pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hinj : Function.Injective pointOf :=
    endpointLabelPoint_injective_of_mem S hp₁I hp₂I hq₁I hq₂I
      hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  have hpointMem : ∀ center : ShadowBank.Label, pointOf center ∈ A := by
    intro center
    cases center
    · exact S.oppositeVertexByIndex_mem S.surplusIdx
    · exact S.oppositeVertexByIndex_mem S.oppIndex1
    · exact S.oppositeVertexByIndex_mem S.oppIndex2
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs1I)
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs2I)
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs3I)
    · exact S.capByIndex_subset S.oppIndex1
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hp₁I)
    · exact S.capByIndex_subset S.oppIndex1
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hp₂I)
    · exact S.capByIndex_subset S.oppIndex2
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hq₁I)
    · exact S.capByIndex_subset S.oppIndex2
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hq₂I)
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxLabelEq, hpointMem, ?_⟩
  intro centerClass hvClass hwClass radiusOf hselected hradiusOther
    hcardOther hcirc hsep
  let shadow := endpointShadowOfPointClasses pointOf centerClass
  have hvMask :
      endpointPointMask pointOf (centerClass .v) =
        SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
    rw [hvClass]
    exact endpointLeft_residual_v_pointMask_eq hend hpPair hI₁sub
      hxLeftEq haRightEq hinj hxLabel haLabel
  have hwMask :
      endpointPointMask pointOf (centerClass .w) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
    rw [hwClass]
    exact endpointLeft_residual_w_pointMask_eq hend hqPair hI₂sub
      hbLeftEq huRightEq hinj hbLabel
  have hvOK :
      ShadowBank.endpointVShapeOK xLabel shadow = true := by
    exact endpointVShapeOK_shadowOfPointClasses_of_v_mask hvMask hxLabel
      haLabel
  have hwOK :
      ShadowBank.endpointWShapeOK shadow = true := by
    exact endpointWShapeOK_shadowOfPointClasses_of_w_mask hwMask hbLabel
  have hcard : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskCard
        (endpointPointMask pointOf (centerClass center)) = 4 := by
    intro center
    by_cases hv : center = .v
    · subst center
      exact endpointVMask_card_of_v_mask hvMask hxLabel haLabel
    by_cases hw : center = .w
    · subst center
      exact endpointWMask_card_of_w_mask hwMask hbLabel
    exact hcardOther center hv hw
  have hself : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskHas
        (endpointPointMask pointOf (centerClass center)) center =
          false := by
    intro center
    by_cases hv : center = .v
    · subst center
      exact endpointVMask_not_self_of_v_mask hvMask hxLabel haLabel
    by_cases hw : center = .w
    · subst center
      exact endpointWMask_not_self_of_w_mask hwMask hbLabel
    exact endpointPointMask_maskHas_self_false_of_selectedClass
      (A := A) (pointOf := pointOf) (centerClass := centerClass)
      (radiusOf := radiusOf) (hselected center) (hradiusOther center hv hw)
  have huClass :
      centerClass .u =
        SelectedClass A (S.oppositeVertexByIndex S.surplusIdx)
          (radiusOf .u) := by
    simpa [pointOf, endpointLabelPoint] using hselected .u
  have hleftU :
      (centerClass .u ∩ S.leftAdjacentCapByIndex S.surplusIdx).card ≤
        1 := by
    rw [huClass]
    exact
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv S.surplusIdx (radiusOf .u)
  have hrightU :
      (centerClass .u ∩ S.rightAdjacentCapByIndex S.surplusIdx).card ≤
        1 := by
    rw [huClass]
    exact
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv S.surplusIdx (radiusOf .u)
  have hwLeft :
      pointOf .w ∈ S.leftAdjacentCapByIndex S.surplusIdx := by
    rw [S.leftAdjacentCapByIndex_eq_capByIndex S.surplusIdx,
      ← S.oppIndex1_eq_leftAdjacentIndex_surplusIdx]
    simpa [pointOf, endpointLabelPoint,
      S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
      using S.rightOuterVertexByIndex_mem_capByIndex S.oppIndex1
  have hPwLeft :
      pointOf .Pw ∈ S.leftAdjacentCapByIndex S.surplusIdx := by
    have hpwInterior :
        pointOf .Pw ∈ S.leftAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1]
      simpa [pointOf, endpointLabelPoint, SurplusCapPacket.oppInterior1]
        using hp₁I
    exact S.leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex
      S.surplusIdx hpwInterior
  have hPuLeft :
      pointOf .Pu ∈ S.leftAdjacentCapByIndex S.surplusIdx := by
    have hpuInterior :
        pointOf .Pu ∈ S.leftAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1]
      simpa [pointOf, endpointLabelPoint, SurplusCapPacket.oppInterior1]
        using hp₂I
    exact S.leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex
      S.surplusIdx hpuInterior
  have hvRight :
      pointOf .v ∈ S.rightAdjacentCapByIndex S.surplusIdx := by
    rw [S.rightAdjacentCapByIndex_eq_capByIndex S.surplusIdx,
      ← S.oppIndex2_eq_rightAdjacentIndex_surplusIdx]
    simpa [pointOf, endpointLabelPoint,
      S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
      using S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex2
  have hQ1Right :
      pointOf .Q1 ∈ S.rightAdjacentCapByIndex S.surplusIdx := by
    have hqInterior :
        pointOf .Q1 ∈ S.rightAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2]
      simpa [pointOf, endpointLabelPoint, SurplusCapPacket.oppInterior2]
        using hq₁I
    exact S.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
      S.surplusIdx hqInterior
  have hQ2Right :
      pointOf .Q2 ∈ S.rightAdjacentCapByIndex S.surplusIdx := by
    have hqInterior :
        pointOf .Q2 ∈ S.rightAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2]
      simpa [pointOf, endpointLabelPoint, SurplusCapPacket.oppInterior2]
        using hq₂I
    exact S.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
      S.surplusIdx hqInterior
  have huv :
      SurplusCOMPGBank.maskInterCard
          (endpointPointMask pointOf (centerClass .u))
          SurplusCOMPGBank.cvNoUMask <= 1 :=
    endpointPointMask_cvNoUMask_le_one_of_inter_card
      hinj hwLeft hPwLeft hPuLeft hleftU
  have huw :
      SurplusCOMPGBank.maskInterCard
          (endpointPointMask pointOf (centerClass .u))
          SurplusCOMPGBank.cwNoUMask <= 1 :=
    endpointPointMask_cwNoUMask_le_one_of_inter_card
      hinj hvRight hQ1Right hQ2Right hrightU
  have hwv :
      SurplusCOMPGBank.maskInterCard
        (endpointPointMask pointOf (centerClass .w))
        SurplusCOMPGBank.cvNoWMask <= 1 :=
    endpointWMask_cvNoW_le_one_of_w_mask hwMask hbLabel
  have hwu :
      SurplusCOMPGBank.maskInterCard
          (endpointPointMask pointOf (centerClass .w))
          SurplusCOMPGBank.cuNoWMask <= 1 :=
    endpointWMask_cuNoW_le_one_of_w_mask hwMask hbLabel
  have hno3' : ∀ x y : ShadowBank.Label,
      (x, y) ∈ SurplusCOMPGBank.labelPairs →
      SurplusCOMPGBank.pointPairClassCount
        (endpointShadowOfPointClasses pointOf centerClass) x y <= 2 := by
    intro x y hpair
    exact endpointPointPairClassCount_le_two_of_selectedClasses
      hconv hinj hpointMem hselected hpair
  have hcounts' : ∀ assigned : List ShadowBank.Label,
      assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes →
      SurplusCOMPGBank.pairCountsOK
        (SurplusCOMPGBank.shadowPairCountsForAssigned
          (endpointShadowOfPointClasses pointOf centerClass) assigned) = true := by
    intro assigned hassigned
    exact
      SurplusCOMPGBank.pairCountsOK_shadowPairCountsForAssigned_of_pointPairClassCount
        hno3' hassigned
  have hsep' : ∀ c cp x y : ShadowBank.Label,
      (x, y) ∈ SurplusCOMPGBank.labelPairs →
      SurplusCOMPGBank.sepOKFor
        (endpointShadowOfPointClasses pointOf centerClass) c cp x y = true := by
    simpa [pointOf] using hsep
  have hsearchSep' : ∀ c cp : ShadowBank.Label,
      (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
      SurplusCOMPGBank.crossSeparationOKForMasks c
        (endpointPointMask pointOf (centerClass c)) cp
        (endpointPointMask pointOf (centerClass cp)) = true := by
    intro c cp _hpair
    simpa [endpointShadowOfPointClasses_centerMask] using
      SurplusCOMPGBank.crossSeparationOKForMasks_of_sepOKFor
        (shadow := endpointShadowOfPointClasses pointOf centerClass)
        (c := c) (cp := cp)
        (by
          intro l₁ l₂ hpair
          exact hsep' c cp l₁ l₂ hpair)
  have hinBank :
      ShadowBank.endpointShadowInBank xLabel shadow = true := by
    exact endpointShadowInBank_shadowOfPointClasses_of_mask_interfaces
      (pointOf := pointOf) (centerClass := centerClass) (escapee := xLabel)
      hcard hself hvOK hwOK huv huw hwv hwu hcirc hno3' hcounts' hsep'
      hsearchSep'
  exact false_of_endpointShadowInBank_of_selectedClass_interfaces
    (A := A) (pointOf := pointOf) (centerClass := centerClass)
    (radiusOf := radiusOf) hinBank hinj hselected

/-- Data-first right endpoint contradiction: after the mirror residual label
data is exposed, the caller may choose the non-payload selected classes and
prove the remaining side conditions for that induced endpoint shadow. -/
theorem endpointRight_residual_exists_false_of_selectedClass_core_data
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ², ∃ xLabel : ShadowBank.Label,
      let pointOf := endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      IsEndpointEscapeeLabel xLabel ∧
        Function.Injective pointOf ∧
        pointOf xLabel = x ∧
        (∀ center : ShadowBank.Label, pointOf center ∈ A) ∧
        ((centerClass : ShadowBank.Label → Finset ℝ²) →
          centerClass .v =
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius →
          centerClass .w =
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho →
          (radiusOf : ShadowBank.Label → ℝ) →
          (∀ center : ShadowBank.Label,
            centerClass center =
              SelectedClass A (pointOf center) (radiusOf center)) →
          (∀ center : ShadowBank.Label, center ≠ .v → center ≠ .w →
            0 < radiusOf center) →
          (∀ center : ShadowBank.Label, center ≠ .v → center ≠ .w →
            SurplusCOMPGBank.maskCard
              (endpointPointMask pointOf (centerClass center)) = 4) →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.isMoserLabel center = false →
              (SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .u &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .v &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .w) =
                  false) →
          (∀ c cp l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.sepOKFor
              (endpointShadowOfPointClasses pointOf centerClass)
              c cp l₁ l₂ = true) →
          False) := by
  classical
  rcases endpointRight_residual_exists_label_data hM44 hconv hend with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, aLabel, bLabel,
      hp12, hpPair, hq12, hqPair, hs12, hs13, hs23, hsSub,
      hxLabel, haLabel, hbLabel, hxLabelEq, _hT₂card, hI₂sub,
      haLeftEq, hxRightEq, _hT₁card, hI₁sub, huLeftEq, hbRightEq⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁ : p₁ ∈ S.oppInterior1 := by
      rw [hpPair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂ : p₂ ∈ S.oppInterior1 := by
      rw [hpPair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁ : q₁ ∈ S.oppInterior2 := by
      rw [hqPair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂ : q₂ ∈ S.oppInterior2 := by
      rw [hqPair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  let pointOf := endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hinj : Function.Injective pointOf :=
    endpointMirrorLabelPoint_injective_of_mem S hp₁I hp₂I hq₁I hq₂I
      hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  have hpointMem : ∀ center : ShadowBank.Label, pointOf center ∈ A := by
    intro center
    cases center
    · exact S.oppositeVertexByIndex_mem S.surplusIdx
    · exact S.oppositeVertexByIndex_mem S.oppIndex2
    · exact S.oppositeVertexByIndex_mem S.oppIndex1
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs1I)
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs2I)
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs3I)
    · exact S.capByIndex_subset S.oppIndex2
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hq₁I)
    · exact S.capByIndex_subset S.oppIndex2
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hq₂I)
    · exact S.capByIndex_subset S.oppIndex1
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hp₁I)
    · exact S.capByIndex_subset S.oppIndex1
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hp₂I)
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxLabelEq, hpointMem, ?_⟩
  intro centerClass hvClass hwClass radiusOf hselected hradiusOther
    hcardOther hcirc hsep
  let shadow := endpointShadowOfPointClasses pointOf centerClass
  have hvMask :
      endpointPointMask pointOf (centerClass .v) =
        SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
    rw [hvClass]
    exact endpointRight_residual_v_pointMask_eq hend hqPair hI₂sub
      haLeftEq hxRightEq hinj hxLabel haLabel
  have hwMask :
      endpointPointMask pointOf (centerClass .w) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
    rw [hwClass]
    exact endpointRight_residual_w_pointMask_eq hend hpPair hI₁sub
      huLeftEq hbRightEq hinj hbLabel
  have hvOK :
      ShadowBank.endpointVShapeOK xLabel shadow = true := by
    exact endpointVShapeOK_shadowOfPointClasses_of_v_mask hvMask hxLabel
      haLabel
  have hwOK :
      ShadowBank.endpointWShapeOK shadow = true := by
    exact endpointWShapeOK_shadowOfPointClasses_of_w_mask hwMask hbLabel
  have hcard : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskCard
        (endpointPointMask pointOf (centerClass center)) = 4 := by
    intro center
    by_cases hv : center = .v
    · subst center
      exact endpointVMask_card_of_v_mask hvMask hxLabel haLabel
    by_cases hw : center = .w
    · subst center
      exact endpointWMask_card_of_w_mask hwMask hbLabel
    exact hcardOther center hv hw
  have hself : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskHas
        (endpointPointMask pointOf (centerClass center)) center =
          false := by
    intro center
    by_cases hv : center = .v
    · subst center
      exact endpointVMask_not_self_of_v_mask hvMask hxLabel haLabel
    by_cases hw : center = .w
    · subst center
      exact endpointWMask_not_self_of_w_mask hwMask hbLabel
    exact endpointPointMask_maskHas_self_false_of_selectedClass
      (A := A) (pointOf := pointOf) (centerClass := centerClass)
      (radiusOf := radiusOf) (hselected center) (hradiusOther center hv hw)
  have huClass :
      centerClass .u =
        SelectedClass A (S.oppositeVertexByIndex S.surplusIdx)
          (radiusOf .u) := by
    simpa [pointOf, endpointMirrorLabelPoint] using hselected .u
  have hleftU :
      (centerClass .u ∩ S.leftAdjacentCapByIndex S.surplusIdx).card ≤
        1 := by
    rw [huClass]
    exact
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv S.surplusIdx (radiusOf .u)
  have hrightU :
      (centerClass .u ∩ S.rightAdjacentCapByIndex S.surplusIdx).card ≤
        1 := by
    rw [huClass]
    exact
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv S.surplusIdx (radiusOf .u)
  have hwRight :
      pointOf .w ∈ S.rightAdjacentCapByIndex S.surplusIdx := by
    rw [S.rightAdjacentCapByIndex_eq_capByIndex S.surplusIdx,
      ← S.oppIndex2_eq_rightAdjacentIndex_surplusIdx]
    simpa [pointOf, endpointMirrorLabelPoint,
      S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
      using S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex2
  have hPwRight :
      pointOf .Pw ∈ S.rightAdjacentCapByIndex S.surplusIdx := by
    have hpwInterior :
        pointOf .Pw ∈ S.rightAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2]
      simpa [pointOf, endpointMirrorLabelPoint, SurplusCapPacket.oppInterior2]
        using hq₁I
    exact S.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
      S.surplusIdx hpwInterior
  have hPuRight :
      pointOf .Pu ∈ S.rightAdjacentCapByIndex S.surplusIdx := by
    have hpuInterior :
        pointOf .Pu ∈ S.rightAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2]
      simpa [pointOf, endpointMirrorLabelPoint, SurplusCapPacket.oppInterior2]
        using hq₂I
    exact S.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
      S.surplusIdx hpuInterior
  have hvLeft :
      pointOf .v ∈ S.leftAdjacentCapByIndex S.surplusIdx := by
    rw [S.leftAdjacentCapByIndex_eq_capByIndex S.surplusIdx,
      ← S.oppIndex1_eq_leftAdjacentIndex_surplusIdx]
    simpa [pointOf, endpointMirrorLabelPoint,
      S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
      using S.rightOuterVertexByIndex_mem_capByIndex S.oppIndex1
  have hQ1Left :
      pointOf .Q1 ∈ S.leftAdjacentCapByIndex S.surplusIdx := by
    have hqInterior :
        pointOf .Q1 ∈ S.leftAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1]
      simpa [pointOf, endpointMirrorLabelPoint, SurplusCapPacket.oppInterior1]
        using hp₁I
    exact S.leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex
      S.surplusIdx hqInterior
  have hQ2Left :
      pointOf .Q2 ∈ S.leftAdjacentCapByIndex S.surplusIdx := by
    have hqInterior :
        pointOf .Q2 ∈ S.leftAdjacentInteriorByIndex S.surplusIdx := by
      rw [S.leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1]
      simpa [pointOf, endpointMirrorLabelPoint, SurplusCapPacket.oppInterior1]
        using hp₂I
    exact S.leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex
      S.surplusIdx hqInterior
  have huv :
      SurplusCOMPGBank.maskInterCard
          (endpointPointMask pointOf (centerClass .u))
          SurplusCOMPGBank.cvNoUMask <= 1 :=
    endpointPointMask_cvNoUMask_le_one_of_inter_card
      hinj hwRight hPwRight hPuRight hrightU
  have huw :
      SurplusCOMPGBank.maskInterCard
          (endpointPointMask pointOf (centerClass .u))
          SurplusCOMPGBank.cwNoUMask <= 1 :=
    endpointPointMask_cwNoUMask_le_one_of_inter_card
      hinj hvLeft hQ1Left hQ2Left hleftU
  have hwv :
      SurplusCOMPGBank.maskInterCard
        (endpointPointMask pointOf (centerClass .w))
          SurplusCOMPGBank.cvNoWMask <= 1 :=
    endpointWMask_cvNoW_le_one_of_w_mask hwMask hbLabel
  have hwu :
      SurplusCOMPGBank.maskInterCard
          (endpointPointMask pointOf (centerClass .w))
          SurplusCOMPGBank.cuNoWMask <= 1 :=
    endpointWMask_cuNoW_le_one_of_w_mask hwMask hbLabel
  have hno3' : ∀ x y : ShadowBank.Label,
      (x, y) ∈ SurplusCOMPGBank.labelPairs →
      SurplusCOMPGBank.pointPairClassCount
        (endpointShadowOfPointClasses pointOf centerClass) x y <= 2 := by
    intro x y hpair
    exact endpointPointPairClassCount_le_two_of_selectedClasses
      hconv hinj hpointMem hselected hpair
  have hcounts' : ∀ assigned : List ShadowBank.Label,
      assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes →
      SurplusCOMPGBank.pairCountsOK
        (SurplusCOMPGBank.shadowPairCountsForAssigned
          (endpointShadowOfPointClasses pointOf centerClass) assigned) = true := by
    intro assigned hassigned
    exact
      SurplusCOMPGBank.pairCountsOK_shadowPairCountsForAssigned_of_pointPairClassCount
        hno3' hassigned
  have hsep' : ∀ c cp x y : ShadowBank.Label,
      (x, y) ∈ SurplusCOMPGBank.labelPairs →
      SurplusCOMPGBank.sepOKFor
        (endpointShadowOfPointClasses pointOf centerClass) c cp x y = true := by
    simpa [pointOf] using hsep
  have hsearchSep' : ∀ c cp : ShadowBank.Label,
      (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
      SurplusCOMPGBank.crossSeparationOKForMasks c
        (endpointPointMask pointOf (centerClass c)) cp
        (endpointPointMask pointOf (centerClass cp)) = true := by
    intro c cp _hpair
    simpa [endpointShadowOfPointClasses_centerMask] using
      SurplusCOMPGBank.crossSeparationOKForMasks_of_sepOKFor
        (shadow := endpointShadowOfPointClasses pointOf centerClass)
        (c := c) (cp := cp)
        (by
          intro l₁ l₂ hpair
          exact hsep' c cp l₁ l₂ hpair)
  have hinBank :
      ShadowBank.endpointShadowInBank xLabel shadow = true := by
    exact endpointShadowInBank_shadowOfPointClasses_of_mask_interfaces
      (pointOf := pointOf) (centerClass := centerClass) (escapee := xLabel)
      hcard hself hvOK hwOK huv huw hwv hwu hcirc hno3' hcounts' hsep'
      hsearchSep'
  exact false_of_endpointShadowInBank_of_selectedClass_interfaces
    (A := A) (pointOf := pointOf) (centerClass := centerClass)
    (radiusOf := radiusOf) hinBank hinj hselected

/-- Data-first left endpoint contradiction in finite-shadow form: after the
residual label data is exposed, it is enough to produce a finite endpoint row
bank shadow and its metric interpretation. -/
theorem endpointLeft_residual_exists_false_of_metric_shadow_data
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
    ∃ xLabel aLabel bLabel : ShadowBank.Label,
      let pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      IsEndpointEscapeeLabel xLabel ∧
        IsEndpointVSurplusHitLabel aLabel ∧
        IsEndpointWSurplusHitLabel bLabel ∧
        Function.Injective pointOf ∧
        pointOf xLabel = x ∧
        (∀ center : ShadowBank.Label, pointOf center ∈ A) ∧
        endpointPointMask pointOf
          (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) =
            SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] ∧
        endpointPointMask pointOf
          (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho) =
            SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] ∧
        ((shadow : ShadowBank.Shadow) →
          ShadowBank.endpointShadowInBank xLabel shadow = true →
          Variables.EndpointMetricShadow pointOf shadow →
          False) := by
  classical
  rcases endpointLeft_residual_exists_label_data hM44 hconv hend with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, aLabel, bLabel,
      hp12, hpPair, hq12, hqPair, hs12, hs13, hs23, hsSub,
      hxLabel, haLabel, hbLabel, hxEq, _hT₁card, hI₁sub,
      hxLeftEq, haRightEq, _hT₂card, hI₂sub, hbLeftEq, huRightEq⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁ : p₁ ∈ S.oppInterior1 := by
      rw [hpPair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂ : p₂ ∈ S.oppInterior1 := by
      rw [hpPair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁ : q₁ ∈ S.oppInterior2 := by
      rw [hqPair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂ : q₂ ∈ S.oppInterior2 := by
      rw [hqPair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  let pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hinj : Function.Injective pointOf :=
    endpointLabelPoint_injective_of_mem S hp₁I hp₂I hq₁I hq₂I
      hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  have hpointMem : ∀ center : ShadowBank.Label, pointOf center ∈ A := by
    intro center
    cases center
    · exact S.oppositeVertexByIndex_mem S.surplusIdx
    · exact S.oppositeVertexByIndex_mem S.oppIndex1
    · exact S.oppositeVertexByIndex_mem S.oppIndex2
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs1I)
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs2I)
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs3I)
    · exact S.capByIndex_subset S.oppIndex1
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hp₁I)
    · exact S.capByIndex_subset S.oppIndex1
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hp₂I)
    · exact S.capByIndex_subset S.oppIndex2
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hq₁I)
    · exact S.capByIndex_subset S.oppIndex2
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hq₂I)
  have hvMask :
      endpointPointMask pointOf
          (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1)
            radius) =
        SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
    exact endpointLeft_residual_v_pointMask_eq hend hpPair hI₁sub
      hxLeftEq haRightEq hinj hxLabel haLabel
  have hwMask :
      endpointPointMask pointOf
          (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
            rho) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
    exact endpointLeft_residual_w_pointMask_eq hend hqPair hI₂sub
      hbLeftEq huRightEq hinj hbLabel
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, aLabel, bLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, haLabel, hbLabel, hinj, hxEq, hpointMem, hvMask,
    hwMask, ?_⟩
  intro shadow hinBank hmetric
  exact Variables.false_of_endpointShadowInBank_of_metricShadow hinBank
    hmetric

/-- Data-first right endpoint contradiction in finite-shadow form: after the
mirror residual label data is exposed, it is enough to produce a finite
endpoint row-bank shadow and its metric interpretation. -/
theorem endpointRight_residual_exists_false_of_metric_shadow_data
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
    ∃ xLabel aLabel bLabel : ShadowBank.Label,
      let pointOf := endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      IsEndpointEscapeeLabel xLabel ∧
        IsEndpointVSurplusHitLabel aLabel ∧
        IsEndpointWSurplusHitLabel bLabel ∧
        Function.Injective pointOf ∧
        pointOf xLabel = x ∧
        (∀ center : ShadowBank.Label, pointOf center ∈ A) ∧
        endpointPointMask pointOf
          (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius) =
            SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] ∧
        endpointPointMask pointOf
          (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho) =
            SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] ∧
        ((shadow : ShadowBank.Shadow) →
          ShadowBank.endpointShadowInBank xLabel shadow = true →
          Variables.EndpointMetricShadow pointOf shadow →
          False) := by
  classical
  rcases endpointRight_residual_exists_label_data hM44 hconv hend with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, aLabel, bLabel,
      hp12, hpPair, hq12, hqPair, hs12, hs13, hs23, hsSub,
      hxLabel, haLabel, hbLabel, hxEq, _hT₂card, hI₂sub,
      haLeftEq, hxRightEq, _hT₁card, hI₁sub, huLeftEq, hbRightEq⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₁ : p₁ ∈ S.oppInterior1 := by
      rw [hpPair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₁
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    have hp₂ : p₂ ∈ S.oppInterior1 := by
      rw [hpPair]
      simp
    simpa [SurplusCapPacket.oppInterior1] using hp₂
  have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₁ : q₁ ∈ S.oppInterior2 := by
      rw [hqPair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₁
  have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    have hq₂ : q₂ ∈ S.oppInterior2 := by
      rw [hqPair]
      simp
    simpa [SurplusCapPacket.oppInterior2] using hq₂
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx := hsSub (by simp)
  let pointOf := endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hinj : Function.Injective pointOf :=
    endpointMirrorLabelPoint_injective_of_mem S hp₁I hp₂I hq₁I hq₂I
      hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  have hpointMem : ∀ center : ShadowBank.Label, pointOf center ∈ A := by
    intro center
    cases center
    · exact S.oppositeVertexByIndex_mem S.surplusIdx
    · exact S.oppositeVertexByIndex_mem S.oppIndex2
    · exact S.oppositeVertexByIndex_mem S.oppIndex1
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs1I)
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs2I)
    · exact S.capByIndex_subset S.surplusIdx
        (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hs3I)
    · exact S.capByIndex_subset S.oppIndex2
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hq₁I)
    · exact S.capByIndex_subset S.oppIndex2
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hq₂I)
    · exact S.capByIndex_subset S.oppIndex1
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hp₁I)
    · exact S.capByIndex_subset S.oppIndex1
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hp₂I)
  have hvMask :
      endpointPointMask pointOf
          (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
            radius) =
        SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
    exact endpointRight_residual_v_pointMask_eq hend hqPair hI₂sub
      haLeftEq hxRightEq hinj hxLabel haLabel
  have hwMask :
      endpointPointMask pointOf
          (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1)
            rho) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
    exact endpointRight_residual_w_pointMask_eq hend hpPair hI₁sub
      huLeftEq hbRightEq hinj hbLabel
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, aLabel, bLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, haLabel, hbLabel, hinj, hxEq, hpointMem, hvMask,
    hwMask, ?_⟩
  intro shadow hinBank hmetric
  exact Variables.false_of_endpointShadowInBank_of_metricShadow hinBank
    hmetric

end EndpointCertificate

end Problem97
