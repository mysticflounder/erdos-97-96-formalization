/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ResidualSoundness
import Erdos9796Proof.P97.EndpointCertificate.GeometryCoverage
import Erdos9796Proof.P97.PinnedHullOrder
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Endpoint geometry producer (label-complete `m = 5` regime)

This module builds the endpoint metric-shadow-in-bank producer for the
label-complete `m = 5` (`A.card = 10`) endpoint residual regime.  In this
regime the ten generated labels exhaust `A`, so every non-`.v/.w` selected
class is confined to the ten labels and the finite endpoint row bank's
side conditions become provable.

This first section ports (verbatim, over `ShadowBank.Label =
SurplusCOMPGBank.Label`) the finite point-mask cardinality machinery and the
label-complete support-class engine, previously private to the pinned-surplus
producer, so the endpoint producer can be built upstream of `Base.lean`.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

open SurplusCOMPGBank

private theorem pointMask_foldl_preserve_bit_of_forall_lt
    {α : Type _} [DecidableEq α] (pointOf : Label → α)
    (T : Finset α) (labels : List Label) {k acc : Nat}
    (hlabels : ∀ label ∈ labels, k < label.index) :
    (labels.foldl
        (fun acc label => if pointOf label ∈ T then label.bit + acc else acc)
        acc).testBit k = acc.testBit k := by
  induction labels generalizing acc with
  | nil => rfl
  | cons label rest ih =>
      simp only [List.foldl_cons]
      have hlabel : k < label.index := hlabels label (by simp)
      have hrest : ∀ member ∈ rest, k < member.index := by
        intro member hmember
        exact hlabels member (by simp [hmember])
      by_cases hmem : pointOf label ∈ T
      · rw [ih hrest]
        simp [hmem]
        simpa [Label.bit] using
          (Nat.testBit_two_pow_add_gt hlabel acc)
      · rw [ih hrest]
        simp [hmem]

private theorem pointMask_maskHas_true_of_mem_of_prefix_suffix
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} {T : Finset α}
    {pref suff : List Label} {label : Label}
    (hall : allLabels = pref ++ label :: suff)
    (hpref : maskOfLabels pref < 2 ^ label.index)
    (hsuff : ∀ member ∈ suff, label.index < member.index)
    (hmem : pointOf label ∈ T) :
    maskHas (pointMask pointOf T) label = true := by
  unfold pointMask maskHas
  rw [hall, List.foldl_append, List.foldl_cons]
  rw [pointMask_foldl_preserve_bit_of_forall_lt pointOf T suff hsuff]
  have hle := pointMask_foldl_le_add_maskOfLabels pointOf T pref 0
  have hlt :
      pref.foldl
          (fun acc member =>
            if pointOf member ∈ T then member.bit + acc else acc)
          0 <
        2 ^ label.index := by
    have hle' :
        pref.foldl
            (fun acc member =>
              if pointOf member ∈ T then member.bit + acc else acc)
            0 ≤ maskOfLabels pref := by
      simpa using hle
    exact Nat.lt_of_le_of_lt hle' hpref
  have hprefixFalse :
      (pref.foldl
          (fun acc member =>
            if pointOf member ∈ T then member.bit + acc else acc)
          0).testBit label.index = false :=
    Nat.testBit_eq_false_of_lt hlt
  simp only [hmem, if_true, Label.bit]
  rw [Nat.testBit_two_pow_add_eq]
  simpa [Label.bit] using congrArg Bool.not hprefixFalse

private theorem pointMask_maskHas_true_of_mem
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} {T : Finset α} {label : Label}
    (hmem : pointOf label ∈ T) :
    maskHas (pointMask pointOf T) label = true := by
  cases label
  · exact pointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [])
      (suff := [.v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact pointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u])
      (suff := [.w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact pointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v])
      (suff := [.s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact pointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w])
      (suff := [.s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact pointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1])
      (suff := [.s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact pointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2])
      (suff := [.Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact pointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3])
      (suff := [.Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact pointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw])
      (suff := [.Q1, .Q2])
      rfl (by decide) (by decide) hmem
  · exact pointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu])
      (suff := [.Q2])
      rfl (by decide) (by decide) hmem
  · exact pointMask_maskHas_true_of_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1])
      (suff := []) rfl (by decide) (by decide) hmem

private theorem pointMask_maskHas_iff_mem
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} {T : Finset α} {label : Label} :
    maskHas (pointMask pointOf T) label = true ↔ pointOf label ∈ T :=
  ⟨pointMask_maskHas_mem, pointMask_maskHas_true_of_mem⟩

private theorem foldl_count_true
    {α : Type _} (predicate : α → Bool) (items : List α) (acc : Nat) :
    items.foldl (fun count item => if predicate item then count + 1 else count)
        acc =
      acc + (items.filter predicate).length := by
  induction items generalizing acc with
  | nil => simp
  | cons item rest ih =>
      by_cases hitem : predicate item = true
      · simp [hitem, ih]
        omega
      · have hfalse : predicate item = false := by
          cases h : predicate item <;> simp_all
        simp [hfalse, ih]

private theorem maskCard_pointMask_eq_card_of_subset_range
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} (hinj : Function.Injective pointOf)
    {T : Finset α}
    (hcover : ∀ x ∈ T, ∃ label : Label, pointOf label = x) :
    maskCard (pointMask pointOf T) = T.card := by
  let labels := allLabels.filter fun label =>
    maskHas (pointMask pointOf T) label
  have hmaskCard : maskCard (pointMask pointOf T) = labels.length := by
    rw [maskCard, foldl_count_true]
    simp [labels]
  have hlabelsNodup : labels.Nodup := by
    exact (by decide : allLabels.Nodup).filter _
  have himage : labels.toFinset.image pointOf = T := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨label, hlabel, rfl⟩
      have hlabelList : label ∈ labels := by simpa using hlabel
      exact pointMask_maskHas_mem (List.mem_filter.mp hlabelList).2
    · intro hx
      rcases hcover x hx with ⟨label, rfl⟩
      apply Finset.mem_image.mpr
      refine ⟨label, ?_, rfl⟩
      simp only [List.mem_toFinset, labels, List.mem_filter]
      exact ⟨by cases label <;> simp [allLabels],
        pointMask_maskHas_true_of_mem hx⟩
  calc
    maskCard (pointMask pointOf T) = labels.length := hmaskCard
    _ = labels.toFinset.card :=
      (List.toFinset_card_of_nodup hlabelsNodup).symm
    _ = (labels.toFinset.image pointOf).card :=
      (Finset.card_image_of_injective _ hinj).symm
    _ = T.card := by rw [himage]

/-- Label-completeness of the ten generated labels when they exhaust a
ten-point ambient set.  An injective label point map into a ten-point `A`
with the ten-label domain is surjective onto `A`. -/
theorem cover_of_card_ten
    {A : Finset ℝ²} {pointOf : Label → ℝ²}
    (hinj : Function.Injective pointOf)
    (hpointA : ∀ center : Label, pointOf center ∈ A)
    (hcard : A.card = 10) :
    ∀ x ∈ A, ∃ label : Label, pointOf label = x := by
  classical
  have hnodup : allLabels.Nodup := by decide
  have himg : allLabels.toFinset.image pointOf = A := by
    apply Finset.eq_of_subset_of_card_le
    · intro y hy
      rcases Finset.mem_image.mp hy with ⟨l, _hl, rfl⟩
      exact hpointA l
    · rw [Finset.card_image_of_injective _ hinj,
        List.toFinset_card_of_nodup hnodup, hcard]
      decide
  intro x hx
  rw [← himg] at hx
  rcases Finset.mem_image.mp hx with ⟨l, _hl, hlx⟩
  exact ⟨l, hlx⟩

/-- The label-complete support-class engine: from a global `K4` property and a
label-complete point map, select, at every center, a four-point equidistant
class confined to the ten labels (exact mask card four, center excluded). -/
theorem exists_labelCompleteSupportClasses
    {A : Finset ℝ²} (hK4 : HasNEquidistantProperty 4 A)
    {pointOf : Label → ℝ²} (hinj : Function.Injective pointOf)
    (hpointA : ∀ center : Label, pointOf center ∈ A)
    (hcover : ∀ x ∈ A, ∃ label : Label, pointOf label = x) :
    ∃ supportClass : Label → Finset ℝ², ∃ radiusOf : Label → ℝ,
      (∀ center : Label,
        supportClass center ⊆
          SelectedClass A (pointOf center) (radiusOf center)) ∧
      (∀ center a b : Label,
        pointOf a ∈ supportClass center →
        pointOf b ∈ supportClass center →
        dist (pointOf center) (pointOf a) =
          dist (pointOf center) (pointOf b)) ∧
      (∀ center : Label,
        maskCard (pointMask pointOf (supportClass center)) = 4) ∧
      ∀ center : Label,
        maskHas (pointMask pointOf (supportClass center)) center = false := by
  classical
  let classAt : ∀ center : Label, SelectedFourClass A (pointOf center) :=
    fun center =>
      Classical.choice
        (exists_selectedFourClass_of_globalK4 hK4 (hpointA center))
  let supportClass : Label → Finset ℝ² := fun center => (classAt center).support
  let radiusOf : Label → ℝ := fun center => (classAt center).radius
  refine ⟨supportClass, radiusOf, ?_, ?_, ?_, ?_⟩
  · intro center x hx
    exact mem_selectedClass.mpr
      ⟨(classAt center).support_subset_A hx,
        (classAt center).support_eq_radius x hx⟩
  · intro center a b ha hb
    exact (classAt center).support_eq_radius _ ha |>.trans
      ((classAt center).support_eq_radius _ hb).symm
  · intro center
    rw [maskCard_pointMask_eq_card_of_subset_range hinj]
    · exact (classAt center).support_card
    · intro x hx
      exact hcover x ((classAt center).support_subset_A hx)
  · intro center
    apply pointMask_maskHas_false_of_not_mem
    exact (classAt center).center_not_mem


private theorem maskInterCard_pointMask_le_inter_card
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} (hinj : Function.Injective pointOf)
    (T C : Finset α) (fixedMask : Nat)
    (hfixed : ∀ label : Label, maskHas fixedMask label = true →
      pointOf label ∈ C) :
    maskInterCard (pointMask pointOf T) fixedMask ≤ (T ∩ C).card := by
  let labels := allLabels.filter fun label =>
    maskHas (pointMask pointOf T) label && maskHas fixedMask label
  have hmaskCard :
      maskInterCard (pointMask pointOf T) fixedMask = labels.length := by
    rw [maskInterCard, foldl_count_true]
    simp [labels]
  have hlabelsNodup : labels.Nodup := by
    exact (by decide : allLabels.Nodup).filter _
  have himageSub : labels.toFinset.image pointOf ⊆ T ∩ C := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨label, hlabel, rfl⟩
    have hlabelList : label ∈ labels := by simpa using hlabel
    have hbits := (List.mem_filter.mp hlabelList).2
    simp only [Bool.and_eq_true] at hbits
    exact Finset.mem_inter.mpr
      ⟨pointMask_maskHas_mem hbits.1, hfixed label hbits.2⟩
  calc
    maskInterCard (pointMask pointOf T) fixedMask = labels.length := hmaskCard
    _ = labels.toFinset.card :=
      (List.toFinset_card_of_nodup hlabelsNodup).symm
    _ = (labels.toFinset.image pointOf).card :=
      (Finset.card_image_of_injective _ hinj).symm
    _ ≤ (T ∩ C).card := Finset.card_le_card himageSub

private theorem maskHas_cvNoUMask_cases {label : Label}
    (hlabel : maskHas cvNoUMask label = true) :
    label = .w ∨ label = .Pw ∨ label = .Pu := by
  cases label with
  | w => exact Or.inl rfl
  | Pw => exact Or.inr (Or.inl rfl)
  | Pu => exact Or.inr (Or.inr rfl)
  | u | v | s1 | s2 | s3 | Q1 | Q2 =>
      exfalso
      revert hlabel
      decide

private theorem maskHas_cwNoUMask_cases {label : Label}
    (hlabel : maskHas cwNoUMask label = true) :
    label = .v ∨ label = .Q1 ∨ label = .Q2 := by
  cases label with
  | v => exact Or.inl rfl
  | Q1 => exact Or.inr (Or.inl rfl)
  | Q2 => exact Or.inr (Or.inr rfl)
  | u | w | s1 | s2 | s3 | Pw | Pu =>
      exfalso
      revert hlabel
      decide

private theorem rightPinned_u_maskInter_bounds
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {supportClass : Label → Finset ℝ²} {radiusOf : Label → ℝ}
    (hsub : ∀ center : Label,
      supportClass center ⊆
        SelectedClass A
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
          (radiusOf center)) :
    maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (supportClass .u))
          cvNoUMask ≤ 1 ∧
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (supportClass .u))
          cwNoUMask ≤ 1 := by
  let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hleftFixed : ∀ label : Label,
      maskHas cvNoUMask label = true →
        pointOf label ∈ S.leftAdjacentCapByIndex S.surplusIdx := by
    intro label hlabel
    rcases maskHas_cvNoUMask_cases hlabel with rfl | rfl | rfl
    · rw [S.leftAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex1_eq_leftAdjacentIndex_surplusIdx]
      simpa [pointOf, rightPinnedLabelPoint,
        ← S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
        using S.rightOuterVertexByIndex_mem_capByIndex S.oppIndex1
    · rw [S.leftAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex1_eq_leftAdjacentIndex_surplusIdx]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hp₁I
    · rw [S.leftAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex1_eq_leftAdjacentIndex_surplusIdx]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hp₂I
  have hrightFixed : ∀ label : Label,
      maskHas cwNoUMask label = true →
        pointOf label ∈ S.rightAdjacentCapByIndex S.surplusIdx := by
    intro label hlabel
    rcases maskHas_cwNoUMask_cases hlabel with rfl | rfl | rfl
    · rw [S.rightAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex2_eq_rightAdjacentIndex_surplusIdx]
      simpa [pointOf, rightPinnedLabelPoint,
        ← S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
        using S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex2
    · rw [S.rightAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex2_eq_rightAdjacentIndex_surplusIdx]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hq₁I
    · rw [S.rightAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex2_eq_rightAdjacentIndex_surplusIdx]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hq₂I
  have hsupportSub :
      supportClass .u ⊆
        SelectedClass A (S.oppositeVertexByIndex S.surplusIdx)
          (radiusOf .u) := by
    simpa [pointOf, rightPinnedLabelPoint] using hsub .u
  constructor
  · calc
      maskInterCard (pointMask pointOf (supportClass .u)) cvNoUMask
          ≤ (supportClass .u ∩
              S.leftAdjacentCapByIndex S.surplusIdx).card :=
        maskInterCard_pointMask_le_inter_card hinj _ _ _ hleftFixed
      _ ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx)
              (radiusOf .u) ∩
            S.leftAdjacentCapByIndex S.surplusIdx).card :=
        Finset.card_le_card (by
          intro x hx
          rw [Finset.mem_inter] at hx ⊢
          exact ⟨hsupportSub hx.1, hx.2⟩)
      _ ≤ 1 :=
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv S.surplusIdx (radiusOf .u)
  · calc
      maskInterCard (pointMask pointOf (supportClass .u)) cwNoUMask
          ≤ (supportClass .u ∩
              S.rightAdjacentCapByIndex S.surplusIdx).card :=
        maskInterCard_pointMask_le_inter_card hinj _ _ _ hrightFixed
      _ ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx)
              (radiusOf .u) ∩
            S.rightAdjacentCapByIndex S.surplusIdx).card :=
        Finset.card_le_card (by
          intro x hx
          rw [Finset.mem_inter] at hx ⊢
          exact ⟨hsupportSub hx.1, hx.2⟩)
      _ ≤ 1 :=
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv S.surplusIdx (radiusOf .u)

end EndpointCertificate

end Problem97
