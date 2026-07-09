/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Geometry
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchCoverage
import Erdos9796Proof.P97.Dumitrescu.L1
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

private theorem endpoint_foldl_countP_add {α : Type _} (p : α → Bool) :
    ∀ (items : List α) (acc : Nat),
      items.foldl (fun acc item => if p item then acc + 1 else acc) acc =
        acc + List.countP p items := by
  intro items
  induction items with
  | nil => intro acc; simp
  | cons item rest ih =>
      intro acc
      by_cases h : p item = true
      · simp [h, ih, Nat.add_comm, Nat.add_left_comm]
      · simp [h, ih]

private theorem endpoint_pointPairClassCount_eq_countP
    (shadow : ShadowBank.Shadow) (x y : ShadowBank.Label) :
    SurplusCOMPGBank.pointPairClassCount shadow x y =
      List.countP
        (fun center =>
          SurplusCOMPGBank.pointPairHitByCenterMask center
            (shadow.centerMask center) (x, y))
        SurplusCOMPGBank.allLabels := by
  unfold SurplusCOMPGBank.pointPairClassCount
  have hfun :
      (fun acc center =>
        if center == x || center == y then
          acc
        else if shadow.classHas center x && shadow.classHas center y then
          acc + 1
        else
          acc) =
        (fun acc center =>
          if SurplusCOMPGBank.pointPairHitByCenterMask center
              (shadow.centerMask center) (x, y) then
            acc + 1
          else
            acc) := by
    funext acc center
    by_cases hx : center = x
    · simp [SurplusCOMPGBank.pointPairHitByCenterMask, hx]
    · by_cases hy : center = y
      · simp [SurplusCOMPGBank.pointPairHitByCenterMask, hy]
      · simp [SurplusCOMPGBank.pointPairHitByCenterMask,
          SurplusCOMPGBank.Shadow.classHas, hx, hy]
  rw [hfun, endpoint_foldl_countP_add]
  simp

private theorem endpoint_pointPairHit_classHas_left
    {shadow : ShadowBank.Shadow} {center x y : ShadowBank.Label}
    (hhit : SurplusCOMPGBank.pointPairHitByCenterMask center
      (shadow.centerMask center) (x, y) = true) :
    shadow.classHas center x = true := by
  unfold SurplusCOMPGBank.pointPairHitByCenterMask at hhit
  by_cases hx : center = x
  · simp only [SurplusCOMPGBank.Label.beq_eq_decide_eq, hx, decide_true,
      Bool.true_or, if_true, Bool.false_eq_true] at hhit
  by_cases hy : center = y
  · simp only [SurplusCOMPGBank.Label.beq_eq_decide_eq, hy, decide_true,
      Bool.or_true, if_true, Bool.false_eq_true] at hhit
  simp only [SurplusCOMPGBank.Label.beq_eq_decide_eq, hx, hy, decide_false,
    Bool.false_or, Bool.false_eq_true, if_false, Bool.and_eq_true] at hhit
  simpa [SurplusCOMPGBank.Shadow.classHas] using hhit.1

private theorem endpoint_pointPairHit_classHas_right
    {shadow : ShadowBank.Shadow} {center x y : ShadowBank.Label}
    (hhit : SurplusCOMPGBank.pointPairHitByCenterMask center
      (shadow.centerMask center) (x, y) = true) :
    shadow.classHas center y = true := by
  unfold SurplusCOMPGBank.pointPairHitByCenterMask at hhit
  by_cases hx : center = x
  · simp only [SurplusCOMPGBank.Label.beq_eq_decide_eq, hx, decide_true,
      Bool.true_or, if_true, Bool.false_eq_true] at hhit
  by_cases hy : center = y
  · simp only [SurplusCOMPGBank.Label.beq_eq_decide_eq, hy, decide_true,
      Bool.or_true, if_true, Bool.false_eq_true] at hhit
  simp only [SurplusCOMPGBank.Label.beq_eq_decide_eq, hx, hy, decide_false,
    Bool.false_or, Bool.false_eq_true, if_false, Bool.and_eq_true] at hhit
  simpa [SurplusCOMPGBank.Shadow.classHas] using hhit.2

/-- Selected-class interfaces and convex independence bound endpoint point-pair
class counts by two. -/
theorem endpointPointPairClassCount_le_two_of_selectedClasses
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    {pointOf : ShadowBank.Label → ℝ²}
    (hinj : Function.Injective pointOf)
    (hpointMem : ∀ center : ShadowBank.Label, pointOf center ∈ A)
    {centerClass : ShadowBank.Label → Finset ℝ²}
    {radiusOf : ShadowBank.Label → ℝ}
    (hselected : ∀ center : ShadowBank.Label,
      centerClass center = SelectedClass A (pointOf center) (radiusOf center))
    {x y : ShadowBank.Label}
    (hpair : (x, y) ∈ SurplusCOMPGBank.labelPairs) :
    SurplusCOMPGBank.pointPairClassCount
      (endpointShadowOfPointClasses pointOf centerClass) x y <= 2 := by
  classical
  let shadow := endpointShadowOfPointClasses pointOf centerClass
  let hitPred : ShadowBank.Label → Bool := fun center =>
    SurplusCOMPGBank.pointPairHitByCenterMask center
      (shadow.centerMask center) (x, y)
  let hits : Finset ShadowBank.Label :=
    (SurplusCOMPGBank.allLabels.filter hitPred).toFinset
  let target : Finset ℝ² :=
    A.filter (fun p => dist p (pointOf x) = dist p (pointOf y))
  have hcount_eq :
      SurplusCOMPGBank.pointPairClassCount shadow x y = hits.card := by
    rw [endpoint_pointPairClassCount_eq_countP, List.countP_eq_length_filter]
    have hnodupAll : SurplusCOMPGBank.allLabels.Nodup := by
      decide
    have hnodupHits : (SurplusCOMPGBank.allLabels.filter hitPred).Nodup :=
      List.Nodup.filter hitPred hnodupAll
    exact (List.toFinset_card_of_nodup hnodupHits).symm
  have hmaps : Set.MapsTo pointOf (↑hits) (↑target) := by
    intro center hcenter
    have hlist : center ∈ SurplusCOMPGBank.allLabels.filter hitPred := by
      simpa [hits] using hcenter
    rcases List.mem_filter.mp hlist with ⟨_hmemLabel, hhit⟩
    have hxHas : shadow.classHas center x = true :=
      endpoint_pointPairHit_classHas_left (shadow := shadow) hhit
    have hyHas : shadow.classHas center y = true :=
      endpoint_pointPairHit_classHas_right (shadow := shadow) hhit
    have hxMem : pointOf x ∈ centerClass center :=
      endpointPointMask_maskHas_mem (by
        simpa [shadow, SurplusCOMPGBank.Shadow.classHas,
          endpointShadowOfPointClasses_centerMask] using hxHas)
    have hyMem : pointOf y ∈ centerClass center :=
      endpointPointMask_maskHas_mem (by
        simpa [shadow, SurplusCOMPGBank.Shadow.classHas,
          endpointShadowOfPointClasses_centerMask] using hyHas)
    rw [hselected center] at hxMem hyMem
    have hdist : dist (pointOf center) (pointOf x) =
        dist (pointOf center) (pointOf y) :=
      (mem_selectedClass.mp hxMem).2.trans (mem_selectedClass.mp hyMem).2.symm
    exact Finset.mem_filter.mpr ⟨hpointMem center, hdist⟩
  have hinjOn : Set.InjOn pointOf (↑hits) := by
    intro a _ha b _hb hab
    exact hinj hab
  have hle_hits : hits.card <= target.card :=
    Finset.card_le_card_of_injOn pointOf hmaps hinjOn
  have hxy : x ≠ y := by
    cases x <;> cases y <;> simp [SurplusCOMPGBank.labelPairs] at hpair ⊢
  have hbase : pointOf x ≠ pointOf y := by
    intro hxyPoint
    exact hxy (hinj hxyPoint)
  have htarget : target.card <= 2 := by
    simpa [target] using
      (Dumitrescu.perpBisector_apex_bound hconv (hpointMem x) (hpointMem y)
        hbase)
  rw [hcount_eq]
  exact Nat.le_trans hle_hits htarget

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
