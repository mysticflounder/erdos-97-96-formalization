/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeometryCoverage
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Bank

/-!
# Endpoint residual certificate soundness

This module composes the geometric endpoint residual bridge, the finite endpoint
row-bank coverage theorem, and the generated certificate row-zero dispatch.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

/-- Selected-class membership gives the metric interpretation required by the
endpoint row-zero bank. -/
theorem endpointMetricShadow_of_selectedClass_interfaces
    {A : Finset ℝ²}
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    {centerClass : ShadowBank.Label → Finset ℝ²}
    {radiusOf : ShadowBank.Label → ℝ}
    (hinj : Function.Injective pointOf)
    (hselected : ∀ center : ShadowBank.Label,
      centerClass center = SelectedClass A (pointOf center) (radiusOf center))
    (hmem : ∀ {center member : ShadowBank.Label},
      shadow.classHas center member = true → pointOf member ∈ centerClass center) :
    Variables.EndpointMetricShadow pointOf shadow := by
  refine ⟨hinj, ?_⟩
  intro center a b ha hb
  have haMem : pointOf a ∈ centerClass center := hmem ha
  have hbMem : pointOf b ∈ centerClass center := hmem hb
  rw [hselected center] at haMem hbMem
  exact (mem_selectedClass.mp haMem).2.trans
    (mem_selectedClass.mp hbMem).2.symm

/-- Point-mask membership in an induced endpoint shadow gives the metric
interpretation required by the endpoint row-zero bank. -/
theorem endpointMetricShadow_of_endpointPointMask_selectedClass_interfaces
    {A : Finset ℝ²}
    {pointOf : ShadowBank.Label → ℝ²}
    {centerClass : ShadowBank.Label → Finset ℝ²}
    {radiusOf : ShadowBank.Label → ℝ}
    (hinj : Function.Injective pointOf)
    (hselected : ∀ center : ShadowBank.Label,
      centerClass center = SelectedClass A (pointOf center) (radiusOf center)) :
    Variables.EndpointMetricShadow pointOf
      (endpointShadowOfPointClasses pointOf centerClass) := by
  refine endpointMetricShadow_of_selectedClass_interfaces
    (A := A) (pointOf := pointOf)
    (shadow := endpointShadowOfPointClasses pointOf centerClass)
    (centerClass := centerClass) (radiusOf := radiusOf) hinj hselected ?_
  intro center member hclass
  exact endpointPointMask_maskHas_mem (by
    simpa [SurplusCOMPGBank.Shadow.classHas,
      endpointShadowOfPointClasses_centerMask] using hclass)

/-- Row-bank membership is contradictory once the induced endpoint shadow has
selected-class interfaces. -/
theorem false_of_endpointShadowInBank_of_selectedClass_interfaces
    {A : Finset ℝ²}
    {pointOf : ShadowBank.Label → ℝ²}
    {centerClass : ShadowBank.Label → Finset ℝ²}
    {radiusOf : ShadowBank.Label → ℝ}
    {escapee : ShadowBank.Label}
    (hin : ShadowBank.endpointShadowInBank escapee
      (endpointShadowOfPointClasses pointOf centerClass) = true)
    (hinj : Function.Injective pointOf)
    (hselected : ∀ center : ShadowBank.Label,
      centerClass center = SelectedClass A (pointOf center) (radiusOf center)) :
    False := by
  exact Variables.false_of_endpointShadowInBank_of_metricShadow hin
    (endpointMetricShadow_of_endpointPointMask_selectedClass_interfaces
      (A := A) (pointOf := pointOf) (centerClass := centerClass)
      (radiusOf := radiusOf) hinj hselected)

/-- A left endpoint residual contradicts the endpoint certificate bank once the
induced shadow has its metric interpretation and generic finite-mask
interfaces. -/
theorem endpointLeft_residual_exists_false_of_mask_interfaces
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    {centerClass : ShadowBank.Label → Finset ℝ²}
    (hvClass :
      centerClass .v =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hwClass :
      centerClass .w =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ², ∃ xLabel : ShadowBank.Label,
      let pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      let shadow := endpointShadowOfPointClasses pointOf centerClass
      IsEndpointEscapeeLabel xLabel ∧
        Function.Injective pointOf ∧
        pointOf xLabel = x ∧
        (Variables.EndpointMetricShadow pointOf shadow →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.maskCard
              (endpointPointMask pointOf (centerClass center)) = 4) →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.maskHas
              (endpointPointMask pointOf (centerClass center)) center =
                false) →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cvNoUMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cwNoUMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .w))
              SurplusCOMPGBank.cvNoWMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .w))
              SurplusCOMPGBank.cuNoWMask <= 1 →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.isMoserLabel center = false →
              (SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .u &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .v &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .w) =
                  false) →
          (∀ l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.pointPairClassCount shadow l₁ l₂ <= 2) →
          (∀ assigned : List ShadowBank.Label,
            assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes →
            SurplusCOMPGBank.pairCountsOK
              (SurplusCOMPGBank.shadowPairCountsForAssigned shadow
                assigned) = true) →
          (∀ c cp l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.sepOKFor shadow c cp l₁ l₂ = true) →
          (∀ c cp : ShadowBank.Label,
            (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
            SurplusCOMPGBank.crossSeparationOKForMasks c
              (endpointPointMask pointOf (centerClass c)) cp
              (endpointPointMask pointOf (centerClass cp)) = true) →
          False) := by
  rcases endpointLeft_residual_exists_endpointShadowInBank_of_mask_interfaces
      hM44 hconv hend hvClass hwClass with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel,
      hxLabel, hinj, hxEq, hinBank⟩
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxEq, ?_⟩
  intro hmetric hcard hself huv huw hwv hwu hcirc hno3 hcounts hsep
    hsearchSep
  exact Variables.false_of_endpointShadowInBank_of_metricShadow
    (hinBank hcard hself huv huw hwv hwu hcirc hno3 hcounts hsep
      hsearchSep)
    hmetric

/-- A left endpoint residual contradicts the endpoint certificate bank once the
induced shadow has selected-class and finite-mask interfaces. -/
theorem endpointLeft_residual_exists_false_of_selectedClass_interfaces
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    {centerClass : ShadowBank.Label → Finset ℝ²}
    (hvClass :
      centerClass .v =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hwClass :
      centerClass .w =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ², ∃ xLabel : ShadowBank.Label,
      let pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      let shadow := endpointShadowOfPointClasses pointOf centerClass
      IsEndpointEscapeeLabel xLabel ∧
        Function.Injective pointOf ∧
        pointOf xLabel = x ∧
        ((radiusOf : ShadowBank.Label → ℝ) →
          (∀ center : ShadowBank.Label,
            centerClass center =
              SelectedClass A (pointOf center) (radiusOf center)) →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.maskCard
              (endpointPointMask pointOf (centerClass center)) = 4) →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.maskHas
              (endpointPointMask pointOf (centerClass center)) center =
                false) →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cvNoUMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cwNoUMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .w))
              SurplusCOMPGBank.cvNoWMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .w))
              SurplusCOMPGBank.cuNoWMask <= 1 →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.isMoserLabel center = false →
              (SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .u &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .v &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .w) =
                  false) →
          (∀ l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.pointPairClassCount shadow l₁ l₂ <= 2) →
          (∀ assigned : List ShadowBank.Label,
            assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes →
            SurplusCOMPGBank.pairCountsOK
              (SurplusCOMPGBank.shadowPairCountsForAssigned shadow
                assigned) = true) →
          (∀ c cp l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.sepOKFor shadow c cp l₁ l₂ = true) →
          (∀ c cp : ShadowBank.Label,
            (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
            SurplusCOMPGBank.crossSeparationOKForMasks c
              (endpointPointMask pointOf (centerClass c)) cp
              (endpointPointMask pointOf (centerClass cp)) = true) →
          False) := by
  rcases endpointLeft_residual_exists_false_of_mask_interfaces
      hM44 hconv hend hvClass hwClass with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel,
      hxLabel, hinj, hxEq, hfalse⟩
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxEq, ?_⟩
  intro radiusOf hselected hcard hself huv huw hwv hwu hcirc hno3
    hcounts hsep hsearchSep
  exact hfalse
    (endpointMetricShadow_of_endpointPointMask_selectedClass_interfaces
      (A := A)
      (pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (centerClass := centerClass) (radiusOf := radiusOf)
      hinj hselected)
    hcard hself huv huw hwv hwu hcirc hno3 hcounts hsep hsearchSep

/-- A left endpoint residual contradicts the endpoint certificate bank once the
selected-class interfaces are supplied and the remaining finite-mask facts are
proved away from the residual-controlled `.v`/`.w` classes. -/
theorem endpointLeft_residual_exists_false_of_selectedClass_core_interfaces
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    {centerClass : ShadowBank.Label → Finset ℝ²}
    (hvClass :
      centerClass .v =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hwClass :
      centerClass .w =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ², ∃ xLabel : ShadowBank.Label,
      let pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      let shadow := endpointShadowOfPointClasses pointOf centerClass
      IsEndpointEscapeeLabel xLabel ∧
        Function.Injective pointOf ∧
        pointOf xLabel = x ∧
        ((radiusOf : ShadowBank.Label → ℝ) →
          (∀ center : ShadowBank.Label,
            centerClass center =
              SelectedClass A (pointOf center) (radiusOf center)) →
          (∀ center : ShadowBank.Label, center ≠ .v → center ≠ .w →
            SurplusCOMPGBank.maskCard
              (endpointPointMask pointOf (centerClass center)) = 4) →
          (∀ center : ShadowBank.Label, center ≠ .v → center ≠ .w →
            SurplusCOMPGBank.maskHas
              (endpointPointMask pointOf (centerClass center)) center =
                false) →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cvNoUMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cwNoUMask <= 1 →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.isMoserLabel center = false →
              (SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .u &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .v &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .w) =
                  false) →
          (∀ l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.pointPairClassCount shadow l₁ l₂ <= 2) →
          (∀ assigned : List ShadowBank.Label,
            assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes →
            SurplusCOMPGBank.pairCountsOK
              (SurplusCOMPGBank.shadowPairCountsForAssigned shadow
                assigned) = true) →
          (∀ c cp l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.sepOKFor shadow c cp l₁ l₂ = true) →
          (∀ c cp : ShadowBank.Label,
            (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
            SurplusCOMPGBank.crossSeparationOKForMasks c
              (endpointPointMask pointOf (centerClass c)) cp
              (endpointPointMask pointOf (centerClass cp)) = true) →
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
  let shadow := endpointShadowOfPointClasses pointOf centerClass
  have hinj : Function.Injective pointOf :=
    endpointLabelPoint_injective_of_mem S hp₁I hp₂I hq₁I hq₂I
      hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
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
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxLabelEq, ?_⟩
  intro radiusOf hselected hcardOther hselfOther huv huw hcirc hno3
    hcounts hsep hsearchSep
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
    exact hselfOther center hv hw
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
  have hinBank :
      ShadowBank.endpointShadowInBank xLabel shadow = true := by
    exact endpointShadowInBank_shadowOfPointClasses_of_mask_interfaces
      (pointOf := pointOf) (centerClass := centerClass) (escapee := xLabel)
      hcard hself hvOK hwOK huv huw hwv hwu hcirc hno3 hcounts hsep
      hsearchSep
  exact false_of_endpointShadowInBank_of_selectedClass_interfaces
    (A := A) (pointOf := pointOf) (centerClass := centerClass)
    (radiusOf := radiusOf) hinBank hinj hselected

/-- A right endpoint residual contradicts the endpoint certificate bank once the
induced shadow has its metric interpretation and generic finite-mask
interfaces. -/
theorem endpointRight_residual_exists_false_of_mask_interfaces
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x)
    {centerClass : ShadowBank.Label → Finset ℝ²}
    (hvClass :
      centerClass .v =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hwClass :
      centerClass .w =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ², ∃ xLabel : ShadowBank.Label,
      let pointOf := endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      let shadow := endpointShadowOfPointClasses pointOf centerClass
      IsEndpointEscapeeLabel xLabel ∧
        Function.Injective pointOf ∧
        pointOf xLabel = x ∧
        (Variables.EndpointMetricShadow pointOf shadow →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.maskCard
              (endpointPointMask pointOf (centerClass center)) = 4) →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.maskHas
              (endpointPointMask pointOf (centerClass center)) center =
                false) →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cvNoUMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cwNoUMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .w))
              SurplusCOMPGBank.cvNoWMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .w))
              SurplusCOMPGBank.cuNoWMask <= 1 →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.isMoserLabel center = false →
              (SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .u &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .v &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .w) =
                  false) →
          (∀ l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.pointPairClassCount shadow l₁ l₂ <= 2) →
          (∀ assigned : List ShadowBank.Label,
            assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes →
            SurplusCOMPGBank.pairCountsOK
              (SurplusCOMPGBank.shadowPairCountsForAssigned shadow
                assigned) = true) →
          (∀ c cp l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.sepOKFor shadow c cp l₁ l₂ = true) →
          (∀ c cp : ShadowBank.Label,
            (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
            SurplusCOMPGBank.crossSeparationOKForMasks c
              (endpointPointMask pointOf (centerClass c)) cp
              (endpointPointMask pointOf (centerClass cp)) = true) →
          False) := by
  rcases endpointRight_residual_exists_endpointShadowInBank_of_mask_interfaces
      hM44 hconv hend hvClass hwClass with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel,
      hxLabel, hinj, hxEq, hinBank⟩
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxEq, ?_⟩
  intro hmetric hcard hself huv huw hwv hwu hcirc hno3 hcounts hsep
    hsearchSep
  exact Variables.false_of_endpointShadowInBank_of_metricShadow
    (hinBank hcard hself huv huw hwv hwu hcirc hno3 hcounts hsep
      hsearchSep)
    hmetric

/-- A right endpoint residual contradicts the endpoint certificate bank once the
induced shadow has selected-class and finite-mask interfaces. -/
theorem endpointRight_residual_exists_false_of_selectedClass_interfaces
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x)
    {centerClass : ShadowBank.Label → Finset ℝ²}
    (hvClass :
      centerClass .v =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hwClass :
      centerClass .w =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ², ∃ xLabel : ShadowBank.Label,
      let pointOf := endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      let shadow := endpointShadowOfPointClasses pointOf centerClass
      IsEndpointEscapeeLabel xLabel ∧
        Function.Injective pointOf ∧
        pointOf xLabel = x ∧
        ((radiusOf : ShadowBank.Label → ℝ) →
          (∀ center : ShadowBank.Label,
            centerClass center =
              SelectedClass A (pointOf center) (radiusOf center)) →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.maskCard
              (endpointPointMask pointOf (centerClass center)) = 4) →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.maskHas
              (endpointPointMask pointOf (centerClass center)) center =
                false) →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cvNoUMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cwNoUMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .w))
              SurplusCOMPGBank.cvNoWMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .w))
              SurplusCOMPGBank.cuNoWMask <= 1 →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.isMoserLabel center = false →
              (SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .u &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .v &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .w) =
                  false) →
          (∀ l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.pointPairClassCount shadow l₁ l₂ <= 2) →
          (∀ assigned : List ShadowBank.Label,
            assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes →
            SurplusCOMPGBank.pairCountsOK
              (SurplusCOMPGBank.shadowPairCountsForAssigned shadow
                assigned) = true) →
          (∀ c cp l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.sepOKFor shadow c cp l₁ l₂ = true) →
          (∀ c cp : ShadowBank.Label,
            (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
            SurplusCOMPGBank.crossSeparationOKForMasks c
              (endpointPointMask pointOf (centerClass c)) cp
              (endpointPointMask pointOf (centerClass cp)) = true) →
          False) := by
  rcases endpointRight_residual_exists_false_of_mask_interfaces
      hM44 hconv hend hvClass hwClass with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel,
      hxLabel, hinj, hxEq, hfalse⟩
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxEq, ?_⟩
  intro radiusOf hselected hcard hself huv huw hwv hwu hcirc hno3
    hcounts hsep hsearchSep
  exact hfalse
    (endpointMetricShadow_of_endpointPointMask_selectedClass_interfaces
      (A := A)
      (pointOf := endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (centerClass := centerClass) (radiusOf := radiusOf)
      hinj hselected)
    hcard hself huv huw hwv hwu hcirc hno3 hcounts hsep hsearchSep

/-- A right endpoint residual contradicts the endpoint certificate bank once the
selected-class interfaces are supplied and the remaining finite-mask facts are
proved away from the residual-controlled `.v`/`.w` classes. -/
theorem endpointRight_residual_exists_false_of_selectedClass_core_interfaces
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x)
    {centerClass : ShadowBank.Label → Finset ℝ²}
    (hvClass :
      centerClass .v =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hwClass :
      centerClass .w =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ², ∃ xLabel : ShadowBank.Label,
      let pointOf := endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      let shadow := endpointShadowOfPointClasses pointOf centerClass
      IsEndpointEscapeeLabel xLabel ∧
        Function.Injective pointOf ∧
        pointOf xLabel = x ∧
        ((radiusOf : ShadowBank.Label → ℝ) →
          (∀ center : ShadowBank.Label,
            centerClass center =
              SelectedClass A (pointOf center) (radiusOf center)) →
          (∀ center : ShadowBank.Label, center ≠ .v → center ≠ .w →
            SurplusCOMPGBank.maskCard
              (endpointPointMask pointOf (centerClass center)) = 4) →
          (∀ center : ShadowBank.Label, center ≠ .v → center ≠ .w →
            SurplusCOMPGBank.maskHas
              (endpointPointMask pointOf (centerClass center)) center =
                false) →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cvNoUMask <= 1 →
          SurplusCOMPGBank.maskInterCard
              (endpointPointMask pointOf (centerClass .u))
              SurplusCOMPGBank.cwNoUMask <= 1 →
          (∀ center : ShadowBank.Label,
            SurplusCOMPGBank.isMoserLabel center = false →
              (SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .u &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .v &&
                SurplusCOMPGBank.maskHas
                  (endpointPointMask pointOf (centerClass center)) .w) =
                  false) →
          (∀ l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.pointPairClassCount shadow l₁ l₂ <= 2) →
          (∀ assigned : List ShadowBank.Label,
            assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes →
            SurplusCOMPGBank.pairCountsOK
              (SurplusCOMPGBank.shadowPairCountsForAssigned shadow
                assigned) = true) →
          (∀ c cp l₁ l₂ : ShadowBank.Label,
            (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
            SurplusCOMPGBank.sepOKFor shadow c cp l₁ l₂ = true) →
          (∀ c cp : ShadowBank.Label,
            (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
            SurplusCOMPGBank.crossSeparationOKForMasks c
              (endpointPointMask pointOf (centerClass c)) cp
              (endpointPointMask pointOf (centerClass cp)) = true) →
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
  let shadow := endpointShadowOfPointClasses pointOf centerClass
  have hinj : Function.Injective pointOf :=
    endpointMirrorLabelPoint_injective_of_mem S hp₁I hp₂I hq₁I hq₂I
      hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
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
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxLabelEq, ?_⟩
  intro radiusOf hselected hcardOther hselfOther huv huw hcirc hno3
    hcounts hsep hsearchSep
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
    exact hselfOther center hv hw
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
  have hinBank :
      ShadowBank.endpointShadowInBank xLabel shadow = true := by
    exact endpointShadowInBank_shadowOfPointClasses_of_mask_interfaces
      (pointOf := pointOf) (centerClass := centerClass) (escapee := xLabel)
      hcard hself hvOK hwOK huv huw hwv hwu hcirc hno3 hcounts hsep
      hsearchSep
  exact false_of_endpointShadowInBank_of_selectedClass_interfaces
    (A := A) (pointOf := pointOf) (centerClass := centerClass)
    (radiusOf := radiusOf) hinBank hinj hselected

end EndpointCertificate

end Problem97
