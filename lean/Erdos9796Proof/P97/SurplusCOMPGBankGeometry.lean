/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBank
import Erdos9796Proof.P97.SurplusM44Packet

/-!
# Geometric bridge for pinned surplus COMP-G shadows

This module contains the hand-written bridge between geometric pinned-surplus
payloads and the finite masks used by `SurplusCOMPGBank`.  The generated bank
module is intentionally left regenerable; geometry-facing lemmas live here.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace SurplusCOMPGBank

/-- Right-oriented geometric interpretation of the ten pinned surplus COMP-G
labels.  In this orientation `.v` is the first non-surplus apex, so the
right-surplus residual selected class is the generated pinned class. -/
def rightPinnedLabelPoint
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) :
    Label → ℝ²
  | .u => S.oppositeVertexByIndex S.surplusIdx
  | .v => S.oppositeVertexByIndex S.oppIndex1
  | .w => S.oppositeVertexByIndex S.oppIndex2
  | .s1 => s1
  | .s2 => s2
  | .s3 => s3
  | .Pw => p₁
  | .Pu => p₂
  | .Q1 => q₁
  | .Q2 => q₂

/-- Finite relabelling that turns the left-surplus mirror orientation into the
right-oriented generated bank convention. -/
def leftPinnedToRightLabel : Label → Label
  | .u => .u
  | .v => .w
  | .w => .v
  | .s1 => .s1
  | .s2 => .s2
  | .s3 => .s3
  | .Pw => .Q1
  | .Pu => .Q2
  | .Q1 => .Pw
  | .Q2 => .Pu

theorem leftPinnedToRightLabel_injective :
    Function.Injective leftPinnedToRightLabel := by
  intro a b h
  cases a <;> cases b <;> simp [leftPinnedToRightLabel] at h ⊢

/-- Left-oriented geometric interpretation of the ten pinned surplus COMP-G
labels.  It is defined as a relabelling of the right-oriented convention, with
`.v` now the second non-surplus apex. -/
def leftPinnedLabelPoint
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) :
    Label → ℝ² :=
  fun label =>
    rightPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3
      (leftPinnedToRightLabel label)

/-- The right-oriented label points occur in the same order as
`SurplusCOMPGBank.allLabels`. -/
theorem allLabels_map_rightPinnedLabelPoint
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) :
    allLabels.map (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) =
      [S.oppositeVertexByIndex S.surplusIdx,
        S.oppositeVertexByIndex S.oppIndex1,
        S.oppositeVertexByIndex S.oppIndex2,
        s1, s2, s3, p₁, p₂, q₁, q₂] := by
  rfl

/-- Pairwise geometric distinctness of the right-oriented COMP-G labels,
transported from the surplus packet's cap-interior separation facts. -/
theorem rightPinnedLabelPoint_pairwise_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3) :
    List.Pairwise (fun x y : ℝ² => x ≠ y)
      (allLabels.map (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)) := by
  rw [allLabels_map_rightPinnedLabelPoint]
  exact S.pinnedSurplusTenLabels_pairwise_of_mem
    hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23

/-- A pairwise-distinct copy of the ten labels gives an injective finite label
model. -/
theorem injective_of_allLabels_map_pairwise
    {α : Type _} {pointOf : Label → α}
    (hpair : List.Pairwise (fun x y : α => x ≠ y)
      (allLabels.map pointOf)) :
    Function.Injective pointOf := by
  intro a b hab
  simp [allLabels] at hpair
  cases a <;> cases b <;> simp at hab ⊢
  all_goals
    aesop

/-- The right-oriented geometric COMP-G label map is injective under the
standard pinned-surplus ten-label hypotheses. -/
theorem rightPinnedLabelPoint_injective_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3) :
    Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) :=
  injective_of_allLabels_map_pairwise
    (rightPinnedLabelPoint_pairwise_of_mem S
      hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23)

/-- The left-oriented geometric COMP-G label map is injective under the mirror
pinned-surplus ten-label hypotheses. -/
theorem leftPinnedLabelPoint_injective_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx)
    (hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx)
    (hp12 : p₁ ≠ p₂) (hq12 : q₁ ≠ q₂)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3) :
    Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) := by
  have hright :
      Function.Injective
        (rightPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3) :=
    rightPinnedLabelPoint_injective_of_mem S
      hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I hq12 hp12 hs12 hs13 hs23
  intro a b h
  exact leftPinnedToRightLabel_injective (hright (by
    simpa [leftPinnedLabelPoint] using h))

/-- A surplus triple member determines the corresponding generated surplus-star
label in the right-oriented COMP-G label map. -/
theorem exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) {x : ℝ²}
    (hx : x ∈ ({s1, s2, s3} : Finset ℝ²)) :
    ∃ sstar : Label,
      isSurplusStar sstar = true ∧
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl
  · exact ⟨.s1, rfl, rfl⟩
  · exact ⟨.s2, rfl, rfl⟩
  · exact ⟨.s3, rfl, rfl⟩

/-- A surplus triple member determines the corresponding generated surplus-star
label in the left-oriented COMP-G label map. -/
theorem exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) {x : ℝ²}
    (hx : x ∈ ({s1, s2, s3} : Finset ℝ²)) :
    ∃ sstar : Label,
      isSurplusStar sstar = true ∧
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl
  · exact ⟨.s1, rfl, rfl⟩
  · exact ⟨.s2, rfl, rfl⟩
  · exact ⟨.s3, rfl, rfl⟩

/-- The finite incidence mask induced by a geometric selected class and an
injectively labelled copy of the ten COMP-G points. -/
def pointMask {α : Type _} [DecidableEq α]
    (pointOf : Label → α) (T : Finset α) : Nat :=
  allLabels.foldl
    (fun acc label => if pointOf label ∈ T then label.bit + acc else acc) 0

/-- The finite mask fold never exceeds the mask containing all listed labels. -/
theorem pointMask_foldl_le_add_maskOfLabels
    {α : Type _} [DecidableEq α] (pointOf : Label → α) (T : Finset α)
    (labels : List Label) (acc : Nat) :
    labels.foldl
        (fun acc label => if pointOf label ∈ T then label.bit + acc else acc)
        acc ≤
      acc + maskOfLabels labels := by
  induction labels generalizing acc with
  | nil => simp [maskOfLabels]
  | cons label rest ih =>
      simp only [List.foldl_cons, maskOfLabels]
      by_cases h : pointOf label ∈ T
      · have hle := ih (label.bit + acc)
        simp [h]
        omega
      · have hle := ih acc
        simp [h]
        omega

/-- `pointMask` is bounded by the mask containing all ten generated labels. -/
theorem pointMask_le_maskOfLabels
    {α : Type _} [DecidableEq α] (pointOf : Label → α) (T : Finset α) :
    pointMask pointOf T ≤ maskOfLabels allLabels := by
  simpa [pointMask] using
    (pointMask_foldl_le_add_maskOfLabels pointOf T allLabels 0)

/-- Any geometric point mask is normalized, since it only uses the generated
ten-label bit positions. -/
theorem maskNormalized_pointMask
    {α : Type _} [DecidableEq α] (pointOf : Label → α) (T : Finset α) :
    maskNormalized (pointMask pointOf T) = true := by
  have hle : pointMask pointOf T ≤ maskOfLabels allLabels :=
    pointMask_le_maskOfLabels pointOf T
  have hbound : maskOfLabels allLabels < maskBound := by
    decide
  have hlt : pointMask pointOf T < maskBound := Nat.lt_of_le_of_lt hle hbound
  simp [maskNormalized, hlt]

/-- The generated shadow induced by ten geometric selected classes. -/
def shadowOfPointClasses {α : Type _} [DecidableEq α]
    (pointOf : Label → α) (centerClass : Label → Finset α) :
    Shadow :=
  { masks := allLabels.map (fun center => pointMask pointOf (centerClass center)) }

theorem shadowOfPointClasses_hasTenMasks
    {α : Type _} [DecidableEq α] (pointOf : Label → α)
    (centerClass : Label → Finset α) :
    (shadowOfPointClasses pointOf centerClass).hasTenMasks = true := by
  simp [shadowOfPointClasses, Shadow.hasTenMasks, allLabels, labelCount]

theorem shadowOfPointClasses_centerMask
    {α : Type _} [DecidableEq α] (pointOf : Label → α)
    (centerClass : Label → Finset α) (center : Label) :
    (shadowOfPointClasses pointOf centerClass).centerMask center =
      pointMask pointOf (centerClass center) := by
  cases center <;>
    simp [shadowOfPointClasses, Shadow.centerMask, allLabels, Label.index]

/-- A geometric `.v` point-mask proof supplies the generated pinned-class
Boolean for the induced shadow. -/
theorem pinnedClassOK_shadowOfPointClasses_of_pointMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hmask : pointMask pointOf (centerClass .v) = pinnedMaskOf sstar) :
    pinnedClassOK sstar (shadowOfPointClasses pointOf centerClass) = true := by
  exact pinnedClassOK_of_centerMask_eq_pinnedMaskOf hs
    (by
      rw [shadowOfPointClasses_centerMask]
      exact hmask)

/-- The generated pinned mask is below the ten-label mask bound. -/
theorem maskNormalized_pinnedMaskOf_of_isSurplusStar
    {sstar : Label} (hs : isSurplusStar sstar = true) :
    maskNormalized (pinnedMaskOf sstar) = true := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals decide

/-- The generated pinned mask contains exactly four labels. -/
theorem maskCard_pinnedMaskOf_of_isSurplusStar
    {sstar : Label} (hs : isSurplusStar sstar = true) :
    maskCard (pinnedMaskOf sstar) = 4 := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals decide

/-- The generated pinned `.v` class mask does not contain `.v` itself. -/
theorem maskHas_pinnedMaskOf_v_eq_false_of_isSurplusStar
    {sstar : Label} (hs : isSurplusStar sstar = true) :
    maskHas (pinnedMaskOf sstar) .v = false := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals decide

/-- An exact-four mask with no self-hit gives the generated shape Boolean for
one center; normalization is automatic for `pointMask`. -/
theorem classShapeOKAt_shadowOfPointClasses_of_maskCard_not_mem
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {center : Label}
    (hcard : maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself :
      maskHas (pointMask pointOf (centerClass center)) center = false) :
    (shadowOfPointClasses pointOf centerClass).classShapeOKAt center =
      true := by
  have hnorm : maskNormalized (pointMask pointOf (centerClass center)) = true :=
    maskNormalized_pointMask pointOf (centerClass center)
  simp [Shadow.classShapeOKAt, Shadow.classHas,
    shadowOfPointClasses_centerMask, hnorm, hcard, hself]

/-- Pointwise exact-four no-self masks give the generated all-class shape
Boolean; normalization is automatic for `pointMask`. -/
theorem classesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α}
    (hcard : ∀ center : Label,
      maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label,
      maskHas (pointMask pointOf (centerClass center)) center = false) :
    (shadowOfPointClasses pointOf centerClass).classesShapeOK = true := by
  simp [Shadow.classesShapeOK, allLabels,
    classShapeOKAt_shadowOfPointClasses_of_maskCard_not_mem, hcard, hself]

/-- Once the `.v` class has the generated pinned mask, the generated
class-shape Boolean only needs exact-four no-self facts for the other nine
centers. -/
theorem classesShapeOK_shadowOfPointClasses_of_pinned_v_and_other_shapes
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hpinned : pointMask pointOf (centerClass .v) = pinnedMaskOf sstar)
    (hcard : ∀ center : Label, center ≠ .v →
      maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v →
      maskHas (pointMask pointOf (centerClass center)) center = false) :
    (shadowOfPointClasses pointOf centerClass).classesShapeOK = true := by
  have hcard' : ∀ center : Label,
      maskCard (pointMask pointOf (centerClass center)) = 4 := by
    intro center
    by_cases hv : center = .v
    · subst center
      rw [hpinned]
      exact maskCard_pinnedMaskOf_of_isSurplusStar hs
    · exact hcard center hv
  have hself' : ∀ center : Label,
      maskHas (pointMask pointOf (centerClass center)) center = false := by
    intro center
    by_cases hv : center = .v
    · subst center
      rw [hpinned]
      exact maskHas_pinnedMaskOf_v_eq_false_of_isSurplusStar hs
    · exact hself center hv
  exact classesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
    hcard' hself'

/-- Mask-level `w`-squeeze facts give the generated `wSqueezeOK` Boolean for
the induced shadow. -/
theorem wSqueezeOK_shadowOfPointClasses_of_mask_facts
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α}
    (hQ1 : maskHas (pointMask pointOf (centerClass .w)) .Q1 = true)
    (hQ2 : maskHas (pointMask pointOf (centerClass .w)) .Q2 = true)
    (hcu :
      maskInterCard (pointMask pointOf (centerClass .w)) cuNoWMask = 1)
    (hcv :
      maskInterCard (pointMask pointOf (centerClass .w)) cvNoWMask = 1) :
    wSqueezeOK (shadowOfPointClasses pointOf centerClass) = true := by
  simp [wSqueezeOK, Shadow.classHas, shadowOfPointClasses_centerMask,
    hQ1, hQ2, hcu, hcv]

/-- Mask-level one-hit bounds give the generated `oneHitOK` Boolean for the
induced shadow. -/
theorem oneHitOK_shadowOfPointClasses_of_mask_bounds
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α}
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
    (hwv :
      maskInterCard (pointMask pointOf (centerClass .w)) cvNoWMask <= 1)
    (hwu :
      maskInterCard (pointMask pointOf (centerClass .w)) cuNoWMask <= 1) :
    oneHitOK (shadowOfPointClasses pointOf centerClass) = true := by
  simp [oneHitOK, shadowOfPointClasses_centerMask, huv, huw, hwv, hwu]

/-- A non-Moser-center no-three-Moser-hit mask condition gives the generated
circumcenter Boolean for one center in the induced shadow. -/
theorem circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {center : Label}
    (htriple : isMoserLabel center = false →
      (maskHas (pointMask pointOf (centerClass center)) .u &&
          maskHas (pointMask pointOf (centerClass center)) .v &&
          maskHas (pointMask pointOf (centerClass center)) .w) = false) :
    circumcenterOKAt (shadowOfPointClasses pointOf centerClass) center =
      true := by
  by_cases hm : isMoserLabel center = true
  · simp [circumcenterOKAt, hm]
  · have hmf : isMoserLabel center = false := by
      cases h : isMoserLabel center <;> simp_all
    have hraw := htriple hmf
    simp [circumcenterOKAt, Shadow.classHas, shadowOfPointClasses_centerMask,
      hmf, hraw]

/-- A non-Moser-center no-three-Moser-hit mask condition gives the generated
circumcenter Boolean for the induced shadow. -/
theorem circumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α}
    (htriple : ∀ center : Label, isMoserLabel center = false →
      (maskHas (pointMask pointOf (centerClass center)) .u &&
          maskHas (pointMask pointOf (centerClass center)) .v &&
          maskHas (pointMask pointOf (centerClass center)) .w) = false) :
    circumcenterOK (shadowOfPointClasses pointOf centerClass) = true := by
  simp only [circumcenterOK, allLabels, List.all_cons, List.all_nil,
    Bool.and_eq_true, Bool.and_true]
  constructor
  · exact circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
      (htriple .u)
  constructor
  · exact circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
      (htriple .v)
  constructor
  · exact circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
      (htriple .w)
  constructor
  · exact circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
      (htriple .s1)
  constructor
  · exact circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
      (htriple .s2)
  constructor
  · exact circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
      (htriple .s3)
  constructor
  · exact circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
      (htriple .Pw)
  constructor
  · exact circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
      (htriple .Pu)
  constructor
  · exact circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
      (htriple .Q1)
  · exact circumcenterOKAt_shadowOfPointClasses_of_no_nonmoser_triple
      (htriple .Q2)

/-- Point-pair class-count bounds give the generated `noThreeOK` Boolean for
the induced shadow. -/
theorem noThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α}
    (hcount : ∀ x y : Label,
      pointPairClassCount (shadowOfPointClasses pointOf centerClass) x y <= 2) :
    noThreeOK (shadowOfPointClasses pointOf centerClass) = true := by
  simp [noThreeOK, labelPairs, hcount]

/-- The generated prefix pair-count checker is exposed as an explicit
finite-list interface for induced geometric shadows. -/
theorem searchPairCountsOK_shadowOfPointClasses_of_prefixes
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α}
    (hprefix : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true) :
    searchPairCountsOK (shadowOfPointClasses pointOf centerClass) = true := by
  simp [searchPairCountsOK, fragmentSearchAssignedPrefixes, hprefix]

/-- The generated all-pairs separation checker is exposed as an explicit
finite `sepOKFor` interface for induced geometric shadows. -/
theorem separationOK_shadowOfPointClasses_of_sepOKFor
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α}
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true) :
    separationOK (shadowOfPointClasses pointOf centerClass) = true := by
  simp [separationOK, labelPairs, hsep]

/-- The generated search-separation checker is exposed as an explicit
finite-mask interface for induced geometric shadows. -/
theorem searchSeparationOK_shadowOfPointClasses_of_crossSeparation
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α}
    (hsep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    searchSeparationOK (shadowOfPointClasses pointOf centerClass) = true := by
  simp [searchSeparationOK, orderedLabelPairs, shadowOfPointClasses_centerMask,
    hsep]

/-- A raw Boolean trigger condition gives the generated private-trigger check
for one center in the induced shadow. -/
theorem triggerPrivateOKAt_shadowOfPointClasses_of_mask_condition
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {center sstar : Label}
    (hcondition :
      (maskHas (pointMask pointOf (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass center))
                uPwPuMask)) = false) :
    triggerPrivateOKAt (shadowOfPointClasses pointOf centerClass) center
      sstar = true := by
  simp [triggerPrivateOKAt, Shadow.classHas, shadowOfPointClasses_centerMask,
    hcondition]

/-- Component trigger facts and the final surplus-star one-hit bound give the
generated `fragmentTriggersOK` Boolean for the induced shadow. -/
theorem fragmentTriggersOK_shadowOfPointClasses_of_components
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (htrigger : ∀ center : Label,
      triggerPrivateOKAt (shadowOfPointClasses pointOf centerClass) center
        sstar = true)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass sstar)) uPwPuMask <= 1) :
    fragmentTriggersOK sstar
      (shadowOfPointClasses pointOf centerClass) = true := by
  simp [fragmentTriggersOK, previousSstarCenters,
    shadowOfPointClasses_centerMask, htrigger, hfinal]

/-- Component-wise generated Boolean facts for a geometric shadow assemble into
the finite pinned-fragment predicate consumed by the generated DFS bridge. -/
theorem isValidPinnedFragment_shadowOfPointClasses_of_components
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hclasses :
      (shadowOfPointClasses pointOf centerClass).classesShapeOK = true)
    (hpinned :
      pinnedClassOK sstar (shadowOfPointClasses pointOf centerClass) = true)
    (hw : wSqueezeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hone : oneHitOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcirc : circumcenterOK (shadowOfPointClasses pointOf centerClass) = true)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts :
      searchPairCountsOK (shadowOfPointClasses pointOf centerClass) = true)
    (hsep : separationOK (shadowOfPointClasses pointOf centerClass) = true)
    (hsearchSep :
      searchSeparationOK (shadowOfPointClasses pointOf centerClass) = true)
    (htriggers :
      fragmentTriggersOK sstar
        (shadowOfPointClasses pointOf centerClass) = true) :
    isValidPinnedFragment sstar
      (shadowOfPointClasses pointOf centerClass) = true := by
  simp [isValidPinnedFragment, hs, shadowOfPointClasses_hasTenMasks, hclasses,
    hpinned, hw, hone, hcirc, hno3, hcounts, hsep, hsearchSep, htriggers]

/-- A single finite interface for turning geometric point-class masks into a
valid generated pinned fragment.  The hypotheses are exactly the explicit
mask/prefix facts needed by the generated component Booleans. -/
theorem isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hcard : ∀ center : Label,
      maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label,
      maskHas (pointMask pointOf (centerClass center)) center = false)
    (hpinned : pointMask pointOf (centerClass .v) = pinnedMaskOf sstar)
    (hwQ1 : maskHas (pointMask pointOf (centerClass .w)) .Q1 = true)
    (hwQ2 : maskHas (pointMask pointOf (centerClass .w)) .Q2 = true)
    (hwcu :
      maskInterCard (pointMask pointOf (centerClass .w)) cuNoWMask = 1)
    (hwcv :
      maskInterCard (pointMask pointOf (centerClass .w)) cvNoWMask = 1)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
    (hwv :
      maskInterCard (pointMask pointOf (centerClass .w)) cvNoWMask <= 1)
    (hwu :
      maskInterCard (pointMask pointOf (centerClass .w)) cuNoWMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      (maskHas (pointMask pointOf (centerClass center)) .u &&
          maskHas (pointMask pointOf (centerClass center)) .v &&
          maskHas (pointMask pointOf (centerClass center)) .w) = false)
    (hno3 : ∀ x y : Label,
      pointPairClassCount (shadowOfPointClasses pointOf centerClass) x y <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true)
    (htrigger : ∀ center : Label,
      (maskHas (pointMask pointOf (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass sstar)) uPwPuMask <= 1) :
    isValidPinnedFragment sstar
      (shadowOfPointClasses pointOf centerClass) = true := by
  exact isValidPinnedFragment_shadowOfPointClasses_of_components hs
    (classesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
      hcard hself)
    (pinnedClassOK_shadowOfPointClasses_of_pointMask hs hpinned)
    (wSqueezeOK_shadowOfPointClasses_of_mask_facts
      hwQ1 hwQ2 hwcu hwcv)
    (oneHitOK_shadowOfPointClasses_of_mask_bounds
      huv huw hwv hwu)
    (circumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple hcirc)
    (noThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two hno3)
    (searchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
    (separationOK_shadowOfPointClasses_of_sepOKFor hsep)
    (searchSeparationOK_shadowOfPointClasses_of_crossSeparation hsearchSep)
    (fragmentTriggersOK_shadowOfPointClasses_of_components
      (fun center =>
        triggerPrivateOKAt_shadowOfPointClasses_of_mask_condition
          (htrigger center))
      hfinal)

/-- Variant of the finite mask interface that uses the generated pinned `.v`
mask to discharge the `.v` class-shape facts automatically. -/
theorem isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces_pinned_v
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hcard : ∀ center : Label, center ≠ .v →
      maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v →
      maskHas (pointMask pointOf (centerClass center)) center = false)
    (hpinned : pointMask pointOf (centerClass .v) = pinnedMaskOf sstar)
    (hwQ1 : maskHas (pointMask pointOf (centerClass .w)) .Q1 = true)
    (hwQ2 : maskHas (pointMask pointOf (centerClass .w)) .Q2 = true)
    (hwcu :
      maskInterCard (pointMask pointOf (centerClass .w)) cuNoWMask = 1)
    (hwcv :
      maskInterCard (pointMask pointOf (centerClass .w)) cvNoWMask = 1)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
    (hwv :
      maskInterCard (pointMask pointOf (centerClass .w)) cvNoWMask <= 1)
    (hwu :
      maskInterCard (pointMask pointOf (centerClass .w)) cuNoWMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      (maskHas (pointMask pointOf (centerClass center)) .u &&
          maskHas (pointMask pointOf (centerClass center)) .v &&
          maskHas (pointMask pointOf (centerClass center)) .w) = false)
    (hno3 : ∀ x y : Label,
      pointPairClassCount (shadowOfPointClasses pointOf centerClass) x y <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true)
    (htrigger : ∀ center : Label,
      (maskHas (pointMask pointOf (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass sstar)) uPwPuMask <= 1) :
    isValidPinnedFragment sstar
      (shadowOfPointClasses pointOf centerClass) = true := by
  exact isValidPinnedFragment_shadowOfPointClasses_of_components hs
    (classesShapeOK_shadowOfPointClasses_of_pinned_v_and_other_shapes
      hs hpinned hcard hself)
    (pinnedClassOK_shadowOfPointClasses_of_pointMask hs hpinned)
    (wSqueezeOK_shadowOfPointClasses_of_mask_facts
      hwQ1 hwQ2 hwcu hwcv)
    (oneHitOK_shadowOfPointClasses_of_mask_bounds
      huv huw hwv hwu)
    (circumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple hcirc)
    (noThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two hno3)
    (searchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
    (separationOK_shadowOfPointClasses_of_sepOKFor hsep)
    (searchSeparationOK_shadowOfPointClasses_of_crossSeparation hsearchSep)
    (fragmentTriggersOK_shadowOfPointClasses_of_components
      (fun center =>
        triggerPrivateOKAt_shadowOfPointClasses_of_mask_condition
          (htrigger center))
      hfinal)

/-- If a geometric class is exactly the four labels `{u, s*, Pw, Pu}`, then its
finite incidence mask is the generated pinned mask for `s*`. -/
theorem pointMask_eq_pinnedMaskOf
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    pointMask pointOf
        ({pointOf .u, pointOf sstar, pointOf .Pw, pointOf .Pu} :
          Finset α) =
      pinnedMaskOf sstar := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    simp [pointMask, allLabels, pinnedMaskOf, maskOfLabels, hpoint_eq,
      Label.bit, Label.index]

/-- The right-surplus pinned residual determines the finite pinned mask for the
generated `.v` class, after choosing a three-point surplus subpacket containing
the residual escape. -/
theorem pinnedRightSurplusResidual_exists_pinnedPointMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1))
    {q₁ q₂ s1 s2 s3 : ℝ²}
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq12 : q₁ ≠ q₂)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub : ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx) :
    ∃ sstar : Label, ∃ p₁ p₂ : ℝ²,
      isSurplusStar sstar = true ∧
        Function.Injective
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) ∧
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
        pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) =
          pinnedMaskOf sstar := by
  classical
  rcases S.pinnedRightSurplusResidual_selectedClass_eq_surplusApex
      hpinned hxSurplus with
    ⟨p₁, p₂, hp12, hpair, hT⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpair]
    simp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [hpair]
    simp
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx :=
    hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx :=
    hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx :=
    hsSub (by simp)
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hinj : Function.Injective pointOf :=
    rightPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  have hTmask :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius =
        ({pointOf .u, pointOf sstar, pointOf .Pw, pointOf .Pu} :
          Finset ℝ²) := by
    rw [hT]
    ext y
    simp [pointOf, rightPinnedLabelPoint, hsstar_eq]
    aesop
  refine ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, ?_⟩
  rw [hTmask]
  exact pointMask_eq_pinnedMaskOf hinj hsstar

/-- The left-surplus pinned residual is the mirror of the right-oriented bridge:
after relabelling the two non-surplus sides, it also determines the finite
pinned mask for the generated `.v` class. -/
theorem pinnedLeftSurplusResidual_exists_pinnedPointMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2))
    {q₁ q₂ s1 s2 s3 : ℝ²}
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq12 : q₁ ≠ q₂)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub : ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx) :
    ∃ sstar : Label, ∃ p₁ p₂ : ℝ²,
      isSurplusStar sstar = true ∧
        Function.Injective
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) ∧
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
        pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius) =
          pinnedMaskOf sstar := by
  classical
  rcases S.pinnedLeftSurplusResidual_selectedClass_eq_surplusApex
      hpinned hxSurplus with
    ⟨p₁, p₂, hp12, hpair, hT⟩
  have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpair]
    simp
  have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [hpair]
    simp
  have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx :=
    hsSub (by simp)
  have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx :=
    hsSub (by simp)
  have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx :=
    hsSub (by simp)
  rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hinj : Function.Injective pointOf :=
    leftPinnedLabelPoint_injective_of_mem S
      hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  have hTmask :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius =
        ({pointOf .u, pointOf sstar, pointOf .Pw, pointOf .Pu} :
          Finset ℝ²) := by
    rw [hT]
    ext y
    simp [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
      leftPinnedToRightLabel, hsstar_eq]
    aesop
  refine ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, ?_⟩
  rw [hTmask]
  exact pointMask_eq_pinnedMaskOf hinj hsstar

/-- The right-surplus residual supplies the generated pinned-class Boolean for
the induced geometric shadow, once the `.v` class is identified with the pinned
selected class. -/
theorem pinnedRightSurplusResidual_exists_pinnedClassOK
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1))
    {q₁ q₂ s1 s2 s3 : ℝ²}
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq12 : q₁ ≠ q₂)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub : ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx)
    {centerClass : Label → Finset ℝ²}
    (hv : centerClass .v =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) :
    ∃ sstar : Label, ∃ p₁ p₂ : ℝ²,
      isSurplusStar sstar = true ∧
        Function.Injective
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) ∧
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
        pinnedClassOK sstar
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) = true := by
  classical
  rcases pinnedRightSurplusResidual_exists_pinnedPointMask S hpinned hxSurplus
      hq₁I hq₂I hq12 hxTriple hs12 hs13 hs23 hsSub with
    ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, hmask⟩
  refine ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, ?_⟩
  exact pinnedClassOK_shadowOfPointClasses_of_pointMask hsstar (by
    rw [hv]
    exact hmask)

/-- The left-surplus mirror residual supplies the generated pinned-class Boolean
for the induced geometric shadow, once the `.v` class is identified with the
left-oriented pinned selected class. -/
theorem pinnedLeftSurplusResidual_exists_pinnedClassOK
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2))
    {q₁ q₂ s1 s2 s3 : ℝ²}
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq12 : q₁ ≠ q₂)
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub : ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx)
    {centerClass : Label → Finset ℝ²}
    (hv : centerClass .v =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius) :
    ∃ sstar : Label, ∃ p₁ p₂ : ℝ²,
      isSurplusStar sstar = true ∧
        Function.Injective
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) ∧
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
        pinnedClassOK sstar
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) = true := by
  classical
  rcases pinnedLeftSurplusResidual_exists_pinnedPointMask S hpinned hxSurplus
      hq₁I hq₂I hq12 hxTriple hs12 hs13 hs23 hsSub with
    ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, hmask⟩
  refine ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, ?_⟩
  exact pinnedClassOK_shadowOfPointClasses_of_pointMask hsstar (by
    rw [hv]
    exact hmask)

end SurplusCOMPGBank

end Problem97
