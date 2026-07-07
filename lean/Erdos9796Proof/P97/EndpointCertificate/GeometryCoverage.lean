/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Geometry
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchCoverage
import Erdos9796Proof.P97.SurplusCOMPGBankGeometry

/-!
# Endpoint residual row-bank coverage

This module composes the endpoint residual geometry bridge with the generated
finite-shadow coverage theorem.  It is separate from `Geometry` so the generated
search shards do not become part of the lightweight geometry import path.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace EndpointCertificate

/-- The endpoint-specific point-mask wrapper is definitionally the generic
COMP-G point mask. -/
theorem endpointPointMask_eq_pointMask
    {α : Type _} [DecidableEq α] (pointOf : ShadowBank.Label → α)
    (T : Finset α) :
    endpointPointMask pointOf T = SurplusCOMPGBank.pointMask pointOf T := by
  rfl

/-- The endpoint-specific shadow wrapper is definitionally the generic COMP-G
shadow wrapper. -/
theorem endpointShadowOfPointClasses_eq_shadowOfPointClasses
    {α : Type _} [DecidableEq α] (pointOf : ShadowBank.Label → α)
    (centerClass : ShadowBank.Label → Finset α) :
    endpointShadowOfPointClasses pointOf centerClass =
      SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass := by
  rfl

/-- Endpoint point-mask exact-four/no-self facts give the generated all-class
shape Boolean for the endpoint shadow. -/
theorem endpointClassesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    (hcard : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskCard
        (endpointPointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskHas
        (endpointPointMask pointOf (centerClass center)) center = false) :
    (endpointShadowOfPointClasses pointOf centerClass).classesShapeOK =
      true := by
  simpa [endpointPointMask_eq_pointMask,
    endpointShadowOfPointClasses_eq_shadowOfPointClasses] using
    (SurplusCOMPGBank.classesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
      (pointOf := pointOf) (centerClass := centerClass) hcard hself)

/-- Endpoint point-mask one-hit bounds give the generated one-hit Boolean for
the endpoint shadow. -/
theorem endpointOneHitOK_shadowOfPointClasses_of_mask_bounds
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    (huv :
      SurplusCOMPGBank.maskInterCard
        (endpointPointMask pointOf (centerClass .u))
        SurplusCOMPGBank.cvNoUMask <= 1)
    (huw :
      SurplusCOMPGBank.maskInterCard
        (endpointPointMask pointOf (centerClass .u))
        SurplusCOMPGBank.cwNoUMask <= 1)
    (hwv :
      SurplusCOMPGBank.maskInterCard
        (endpointPointMask pointOf (centerClass .w))
        SurplusCOMPGBank.cvNoWMask <= 1)
    (hwu :
      SurplusCOMPGBank.maskInterCard
        (endpointPointMask pointOf (centerClass .w))
        SurplusCOMPGBank.cuNoWMask <= 1) :
    SurplusCOMPGBank.oneHitOK
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
  simpa [endpointPointMask_eq_pointMask,
    endpointShadowOfPointClasses_eq_shadowOfPointClasses] using
    (SurplusCOMPGBank.oneHitOK_shadowOfPointClasses_of_mask_bounds
      (pointOf := pointOf) (centerClass := centerClass) huv huw hwv hwu)

/-- Endpoint point-mask no-circumcenter-hit facts give the generated
circumcenter Boolean for the endpoint shadow. -/
theorem endpointCircumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    (htriple : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.isMoserLabel center = false →
        (SurplusCOMPGBank.maskHas
            (endpointPointMask pointOf (centerClass center)) .u &&
          SurplusCOMPGBank.maskHas
            (endpointPointMask pointOf (centerClass center)) .v &&
          SurplusCOMPGBank.maskHas
            (endpointPointMask pointOf (centerClass center)) .w) = false) :
    SurplusCOMPGBank.circumcenterOK
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
  simpa [endpointPointMask_eq_pointMask,
    endpointShadowOfPointClasses_eq_shadowOfPointClasses] using
    (SurplusCOMPGBank.circumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple
      (pointOf := pointOf) (centerClass := centerClass) htriple)

/-- Point-pair class-count bounds give the generated no-three Boolean for the
endpoint shadow. -/
theorem endpointNoThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    (hcount : ∀ x y : ShadowBank.Label,
      (x, y) ∈ SurplusCOMPGBank.labelPairs →
      SurplusCOMPGBank.pointPairClassCount
        (endpointShadowOfPointClasses pointOf centerClass) x y <= 2) :
    SurplusCOMPGBank.noThreeOK
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
  simp [SurplusCOMPGBank.noThreeOK, SurplusCOMPGBank.labelPairs, hcount]

/-- Prefix pair-count facts give the generated pair-count Boolean for the
endpoint shadow. -/
theorem endpointSearchPairCountsOK_shadowOfPointClasses_of_prefixes
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    (hprefix : ∀ assigned : List ShadowBank.Label,
      assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes →
      SurplusCOMPGBank.pairCountsOK
        (SurplusCOMPGBank.shadowPairCountsForAssigned
          (endpointShadowOfPointClasses pointOf centerClass) assigned) = true) :
    SurplusCOMPGBank.searchPairCountsOK
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
  simp [SurplusCOMPGBank.searchPairCountsOK,
    SurplusCOMPGBank.fragmentSearchAssignedPrefixes, hprefix]

/-- Separation facts give the generated all-pairs separation Boolean for the
endpoint shadow. -/
theorem endpointSeparationOK_shadowOfPointClasses_of_sepOKFor
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    (hsep : ∀ c cp x y : ShadowBank.Label,
      (x, y) ∈ SurplusCOMPGBank.labelPairs →
      SurplusCOMPGBank.sepOKFor
        (endpointShadowOfPointClasses pointOf centerClass) c cp x y = true) :
    SurplusCOMPGBank.separationOK
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
  simp [SurplusCOMPGBank.separationOK, SurplusCOMPGBank.labelPairs, hsep]

/-- Cross-separation point-mask facts give the generated search-separation
Boolean for the endpoint shadow. -/
theorem endpointSearchSeparationOK_shadowOfPointClasses_of_crossSeparation
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    (hsep : ∀ c cp : ShadowBank.Label,
      (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
      SurplusCOMPGBank.crossSeparationOKForMasks c
        (endpointPointMask pointOf (centerClass c)) cp
        (endpointPointMask pointOf (centerClass cp)) = true) :
    SurplusCOMPGBank.searchSeparationOK
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
  unfold SurplusCOMPGBank.searchSeparationOK
  rw [List.all_eq_true]
  intro pair hpair
  simpa [endpointShadowOfPointClasses_centerMask] using
    hsep pair.1 pair.2 hpair

/-- Finite endpoint mask interfaces assemble into row-bank membership for the
induced endpoint shadow. -/
theorem endpointShadowInBank_shadowOfPointClasses_of_mask_interfaces
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    {escapee : ShadowBank.Label}
    (hcard : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskCard
        (endpointPointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskHas
        (endpointPointMask pointOf (centerClass center)) center = false)
    (hv :
      ShadowBank.endpointVShapeOK escapee
        (endpointShadowOfPointClasses pointOf centerClass) = true)
    (hw :
      ShadowBank.endpointWShapeOK
        (endpointShadowOfPointClasses pointOf centerClass) = true)
    (huv :
      SurplusCOMPGBank.maskInterCard
        (endpointPointMask pointOf (centerClass .u))
        SurplusCOMPGBank.cvNoUMask <= 1)
    (huw :
      SurplusCOMPGBank.maskInterCard
        (endpointPointMask pointOf (centerClass .u))
        SurplusCOMPGBank.cwNoUMask <= 1)
    (hwv :
      SurplusCOMPGBank.maskInterCard
        (endpointPointMask pointOf (centerClass .w))
        SurplusCOMPGBank.cvNoWMask <= 1)
    (hwu :
      SurplusCOMPGBank.maskInterCard
        (endpointPointMask pointOf (centerClass .w))
        SurplusCOMPGBank.cuNoWMask <= 1)
    (hcirc : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.isMoserLabel center = false →
        (SurplusCOMPGBank.maskHas
            (endpointPointMask pointOf (centerClass center)) .u &&
          SurplusCOMPGBank.maskHas
            (endpointPointMask pointOf (centerClass center)) .v &&
          SurplusCOMPGBank.maskHas
            (endpointPointMask pointOf (centerClass center)) .w) = false)
    (hno3 : ∀ x y : ShadowBank.Label,
      (x, y) ∈ SurplusCOMPGBank.labelPairs →
      SurplusCOMPGBank.pointPairClassCount
        (endpointShadowOfPointClasses pointOf centerClass) x y <= 2)
    (hcounts : ∀ assigned : List ShadowBank.Label,
      assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes →
      SurplusCOMPGBank.pairCountsOK
        (SurplusCOMPGBank.shadowPairCountsForAssigned
          (endpointShadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : ShadowBank.Label,
      (x, y) ∈ SurplusCOMPGBank.labelPairs →
      SurplusCOMPGBank.sepOKFor
        (endpointShadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : ShadowBank.Label,
      (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
      SurplusCOMPGBank.crossSeparationOKForMasks c
        (endpointPointMask pointOf (centerClass c)) cp
        (endpointPointMask pointOf (centerClass cp)) = true) :
    ShadowBank.endpointShadowInBank escapee
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
  have hOK : ShadowBank.endpointShadowOK escapee
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
    exact endpointShadowOK_shadowOfPointClasses_of_components
      (endpointClassesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
        hcard hself)
      hv hw
      (endpointOneHitOK_shadowOfPointClasses_of_mask_bounds
        huv huw hwv hwu)
      (endpointCircumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple
        hcirc)
      (endpointNoThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two
        hno3)
      (endpointSearchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
      (endpointSeparationOK_shadowOfPointClasses_of_sepOKFor hsep)
      (endpointSearchSeparationOK_shadowOfPointClasses_of_crossSeparation
        hsearchSep)
  exact ShadowBank.Search.endpointShadowInBank_of_endpointShadowOK hOK

/-- A left endpoint residual reaches the finite endpoint row bank once the
generic finite-shadow component checks are supplied. -/
theorem endpointLeft_residual_exists_endpointShadowInBank_of_components
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
        (shadow.classesShapeOK = true →
          SurplusCOMPGBank.oneHitOK shadow = true →
          SurplusCOMPGBank.circumcenterOK shadow = true →
          SurplusCOMPGBank.noThreeOK shadow = true →
          SurplusCOMPGBank.searchPairCountsOK shadow = true →
          SurplusCOMPGBank.separationOK shadow = true →
          SurplusCOMPGBank.searchSeparationOK shadow = true →
          ShadowBank.endpointShadowInBank xLabel shadow = true) := by
  rcases endpointLeft_residual_exists_endpointShadowOK_of_components
      hM44 hconv hend hvClass hwClass with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, hxLabel, hinj, hxEq, hOK⟩
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxEq, ?_⟩
  intro hclasses hone hcirc hno3 hcounts hsep hsearchSep
  exact ShadowBank.Search.endpointShadowInBank_of_endpointShadowOK
    (hOK hclasses hone hcirc hno3 hcounts hsep hsearchSep)

/-- A left endpoint residual reaches the finite endpoint row bank once the
finite point-mask interfaces for the induced endpoint shadow are supplied. -/
theorem endpointLeft_residual_exists_endpointShadowInBank_of_mask_interfaces
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
        ((∀ center : ShadowBank.Label,
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
          ShadowBank.endpointShadowInBank xLabel shadow = true) := by
  rcases endpointLeft_residual_exists_endpointShadowOK_of_components
      hM44 hconv hend hvClass hwClass with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, hxLabel, hinj, hxEq, hOK⟩
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxEq, ?_⟩
  intro hcard hself huv huw hwv hwu hcirc hno3 hcounts hsep hsearchSep
  exact ShadowBank.Search.endpointShadowInBank_of_endpointShadowOK
    (hOK
      (endpointClassesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
        hcard hself)
      (endpointOneHitOK_shadowOfPointClasses_of_mask_bounds
        huv huw hwv hwu)
      (endpointCircumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple
        hcirc)
      (endpointNoThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two
        hno3)
      (endpointSearchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
      (endpointSeparationOK_shadowOfPointClasses_of_sepOKFor hsep)
      (endpointSearchSeparationOK_shadowOfPointClasses_of_crossSeparation
        hsearchSep))

/-- A right endpoint residual reaches the finite endpoint row bank once the
generic finite-shadow component checks are supplied. -/
theorem endpointRight_residual_exists_endpointShadowInBank_of_components
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
        (shadow.classesShapeOK = true →
          SurplusCOMPGBank.oneHitOK shadow = true →
          SurplusCOMPGBank.circumcenterOK shadow = true →
          SurplusCOMPGBank.noThreeOK shadow = true →
          SurplusCOMPGBank.searchPairCountsOK shadow = true →
          SurplusCOMPGBank.separationOK shadow = true →
          SurplusCOMPGBank.searchSeparationOK shadow = true →
          ShadowBank.endpointShadowInBank xLabel shadow = true) := by
  rcases endpointRight_residual_exists_endpointShadowOK_of_components
      hM44 hconv hend hvClass hwClass with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, hxLabel, hinj, hxEq, hOK⟩
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxEq, ?_⟩
  intro hclasses hone hcirc hno3 hcounts hsep hsearchSep
  exact ShadowBank.Search.endpointShadowInBank_of_endpointShadowOK
    (hOK hclasses hone hcirc hno3 hcounts hsep hsearchSep)

/-- A right endpoint residual reaches the finite endpoint row bank once the
finite point-mask interfaces for the induced endpoint shadow are supplied. -/
theorem endpointRight_residual_exists_endpointShadowInBank_of_mask_interfaces
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
        ((∀ center : ShadowBank.Label,
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
          ShadowBank.endpointShadowInBank xLabel shadow = true) := by
  rcases endpointRight_residual_exists_endpointShadowOK_of_components
      hM44 hconv hend hvClass hwClass with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, hxLabel, hinj, hxEq, hOK⟩
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxEq, ?_⟩
  intro hcard hself huv huw hwv hwu hcirc hno3 hcounts hsep hsearchSep
  exact ShadowBank.Search.endpointShadowInBank_of_endpointShadowOK
    (hOK
      (endpointClassesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
        hcard hself)
      (endpointOneHitOK_shadowOfPointClasses_of_mask_bounds
        huv huw hwv hwu)
      (endpointCircumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple
        hcirc)
      (endpointNoThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two
        hno3)
      (endpointSearchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
      (endpointSeparationOK_shadowOfPointClasses_of_sepOKFor hsep)
      (endpointSearchSeparationOK_shadowOfPointClasses_of_crossSeparation
        hsearchSep))

end EndpointCertificate

end Problem97
