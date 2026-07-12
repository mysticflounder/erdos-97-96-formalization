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

open scoped EuclideanGeometry InnerProductSpace

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


private abbrev SameRadiusPointClasses
    (pointOf : Label → ℝ²) (centerClass : Label → Finset ℝ²) : Prop :=
  ∀ center a b : Label,
    pointOf a ∈ centerClass center →
      pointOf b ∈ centerClass center →
        dist (pointOf center) (pointOf a) =
          dist (pointOf center) (pointOf b)


private theorem mem_convexHull_three_of_same_side
    {O a b c : ℝ²}
    (harea : signedArea2 a b c ≠ 0)
    (ha : 0 ≤ signedArea2 O b c * signedArea2 a b c)
    (hb : 0 ≤ signedArea2 O c a * signedArea2 b c a)
    (hc : 0 ≤ signedArea2 O a b * signedArea2 c a b) :
    O ∈ convexHull ℝ ({a, b, c} : Set ℝ²) := by
  let Δ := signedArea2 a b c
  let α := signedArea2 O b c / Δ
  let β := signedArea2 O c a / Δ
  let γ := signedArea2 O a b / Δ
  have hΔ : Δ ≠ 0 := by simpa [Δ] using harea
  have hΔsq : 0 < Δ * Δ := mul_self_pos.mpr hΔ
  have hcycB : signedArea2 b c a = Δ := by
    simp only [Δ]
    unfold signedArea2
    ring
  have hcycC : signedArea2 c a b = Δ := by
    simp only [Δ]
    unfold signedArea2
    ring
  have hαmul : α * (Δ * Δ) = signedArea2 O b c * Δ := by
    simp only [α]
    field_simp
  have hβmul : β * (Δ * Δ) = signedArea2 O c a * Δ := by
    simp only [β]
    field_simp
  have hγmul : γ * (Δ * Δ) = signedArea2 O a b * Δ := by
    simp only [γ]
    field_simp
  have hα : 0 ≤ α := by
    have ha' : 0 ≤ signedArea2 O b c * Δ := by simpa [Δ] using ha
    nlinarith
  have hβ : 0 ≤ β := by
    have hb' : 0 ≤ signedArea2 O c a * Δ := by simpa [hcycB] using hb
    nlinarith
  have hγ : 0 ≤ γ := by
    have hc' : 0 ≤ signedArea2 O a b * Δ := by simpa [hcycC] using hc
    nlinarith
  have hareaSum :
      signedArea2 O b c + signedArea2 O c a + signedArea2 O a b = Δ := by
    simp only [Δ]
    unfold signedArea2
    ring
  have hsum : α + β + γ = 1 := by
    calc
      α + β + γ =
          (signedArea2 O b c + signedArea2 O c a +
            signedArea2 O a b) / Δ := by
              simp only [α, β, γ]
              ring
      _ = Δ / Δ := by rw [hareaSum]
      _ = 1 := div_self hΔ
  have hcombo : α • a + β • b + γ • c = O := by
    ext i
    fin_cases i
    · change α * a 0 + β * b 0 + γ * c 0 = O 0
      simp only [α, β, γ]
      field_simp [hΔ]
      simp only [Δ]
      unfold signedArea2
      ring
    · change α * a 1 + β * b 1 + γ * c 1 = O 1
      simp only [α, β, γ]
      field_simp [hΔ]
      simp only [Δ]
      unfold signedArea2
      ring
  refine mem_convexHull_of_exists_fintype (ι := Fin 3)
    (fun i => ![α, β, γ] i) (fun i => ![a, b, c] i) ?_ ?_ ?_ ?_
  · intro i
    fin_cases i <;> simp [hα, hβ, hγ]
  · simpa [Fin.sum_univ_three] using hsum
  · intro i
    fin_cases i <;> simp
  · simpa [Fin.sum_univ_three] using hcombo

private theorem mem_convexHull_three_of_equidistant_nonobtuse
    {O a b c : ℝ²}
    (harea : signedArea2 a b c ≠ 0)
    (hab : dist O a = dist O b)
    (hac : dist O a = dist O c)
    (hinnerA : 0 ≤ ⟪b - a, c - a⟫_ℝ)
    (hinnerB : 0 ≤ ⟪c - b, a - b⟫_ℝ)
    (hinnerC : 0 ≤ ⟪a - c, b - c⟫_ℝ) :
    O ∈ convexHull ℝ ({a, b, c} : Set ℝ²) := by
  have haO : ‖a - O‖ = dist O a := by
    rw [← dist_eq_norm]
    exact dist_comm a O
  have hbO : ‖b - O‖ = dist O a := by
    rw [← dist_eq_norm, dist_comm b O, ← hab]
  have hcO : ‖c - O‖ = dist O a := by
    rw [← dist_eq_norm, dist_comm c O, ← hac]
  exact mem_convexHull_three_of_same_side harea
    (center_same_side_as_apex_of_nonobtuse hbO hcO haO hinnerA)
    (center_same_side_as_apex_of_nonobtuse hcO haO hbO hinnerB)
    (center_same_side_as_apex_of_nonobtuse haO hbO hcO hinnerC)

private theorem rightPinnedLabelPoint_moser_nonobtuse
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) :
    let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
    0 ≤ ⟪pointOf .v - pointOf .u, pointOf .w - pointOf .u⟫_ℝ ∧
      0 ≤ ⟪pointOf .w - pointOf .v, pointOf .u - pointOf .v⟫_ℝ ∧
      0 ≤ ⟪pointOf .u - pointOf .w, pointOf .v - pointOf .w⟫_ℝ := by
  dsimp
  rcases hi : S.surplusIdx with ⟨i, hi_lt⟩
  interval_cases i
  · exact ⟨by
      simpa [rightPinnedLabelPoint, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi] using
          S.triangleNonObtuse.inner_at_v1, by
      simpa [rightPinnedLabelPoint, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi] using
          S.triangleNonObtuse.inner_at_v2, by
      simpa [rightPinnedLabelPoint, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi] using
          S.triangleNonObtuse.inner_at_v3⟩
  · exact ⟨by
      simpa [rightPinnedLabelPoint, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi] using
          S.triangleNonObtuse.inner_at_v2, by
      simpa [rightPinnedLabelPoint, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi] using
          S.triangleNonObtuse.inner_at_v3, by
      simpa [rightPinnedLabelPoint, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi] using
          S.triangleNonObtuse.inner_at_v1⟩
  · exact ⟨by
      simpa [rightPinnedLabelPoint, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi] using
          S.triangleNonObtuse.inner_at_v3, by
      simpa [rightPinnedLabelPoint, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi] using
          S.triangleNonObtuse.inner_at_v1, by
      simpa [rightPinnedLabelPoint, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi] using
          S.triangleNonObtuse.inner_at_v2⟩

private theorem no_nonMoser_triple_of_convexIndep_nonobtuse
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    {pointOf : Label → ℝ²} (hinj : Function.Injective pointOf)
    (hpointA : ∀ label : Label, pointOf label ∈ A)
    {centerClass : Label → Finset ℝ²}
    (hsame : SameRadiusPointClasses pointOf centerClass)
    (hnonobtuse :
      0 ≤ ⟪pointOf .v - pointOf .u, pointOf .w - pointOf .u⟫_ℝ ∧
        0 ≤ ⟪pointOf .w - pointOf .v, pointOf .u - pointOf .v⟫_ℝ ∧
        0 ≤ ⟪pointOf .u - pointOf .w, pointOf .v - pointOf .w⟫_ℝ) :
    ∀ center : Label, isMoserLabel center = false →
      (maskHas (pointMask pointOf (centerClass center)) .u &&
        maskHas (pointMask pointOf (centerClass center)) .v &&
        maskHas (pointMask pointOf (centerClass center)) .w) = false := by
  intro center hnonMoser
  cases htriple :
      (maskHas (pointMask pointOf (centerClass center)) .u &&
        maskHas (pointMask pointOf (centerClass center)) .v &&
        maskHas (pointMask pointOf (centerClass center)) .w)
  · rfl
  · exfalso
    have hbits :
        (maskHas (pointMask pointOf (centerClass center)) .u = true ∧
          maskHas (pointMask pointOf (centerClass center)) .v = true) ∧
          maskHas (pointMask pointOf (centerClass center)) .w = true := by
      simpa [Bool.and_eq_true] using htriple
    have huClass := pointMask_maskHas_mem hbits.1.1
    have hvClass := pointMask_maskHas_mem hbits.1.2
    have hwClass := pointMask_maskHas_mem hbits.2
    have huv := hsame center .u .v huClass hvClass
    have huw := hsame center .u .w huClass hwClass
    have harea : signedArea2 (pointOf .u) (pointOf .v) (pointOf .w) ≠ 0 := by
      intro hzero
      exact hconv.not_three_collinear (hpointA .u) (hpointA .v)
        (hpointA .w) (by
          intro h
          have : Label.u = Label.v := hinj h
          contradiction) (by
          intro h
          have : Label.u = Label.w := hinj h
          contradiction) (by
          intro h
          have : Label.v = Label.w := hinj h
          contradiction)
        (collinear_of_signedArea2_eq_zero _ _ _ hzero)
    have hcenterHull :
        pointOf center ∈
          convexHull ℝ ({pointOf .u, pointOf .v, pointOf .w} : Set ℝ²) :=
      mem_convexHull_three_of_equidistant_nonobtuse harea huv huw
        hnonobtuse.1 hnonobtuse.2.1 hnonobtuse.2.2
    have hcenterU : pointOf center ≠ pointOf .u := by
      intro h
      have hlabel : center = .u := hinj h
      subst center
      simp [isMoserLabel] at hnonMoser
    have hcenterV : pointOf center ≠ pointOf .v := by
      intro h
      have hlabel : center = .v := hinj h
      subst center
      simp [isMoserLabel] at hnonMoser
    have hcenterW : pointOf center ≠ pointOf .w := by
      intro h
      have hlabel : center = .w := hinj h
      subst center
      simp [isMoserLabel] at hnonMoser
    have hsub :
        ({pointOf .u, pointOf .v, pointOf .w} : Set ℝ²) ⊆
          (A : Set ℝ²) \ {pointOf center} := by
      intro z hz
      rcases hz with rfl | rfl | rfl
      · exact ⟨by exact_mod_cast hpointA .u, by simpa using hcenterU.symm⟩
      · exact ⟨by exact_mod_cast hpointA .v, by simpa using hcenterV.symm⟩
      · exact ⟨by exact_mod_cast hpointA .w, by simpa using hcenterW.symm⟩
    exact hconv (pointOf center) (by exact_mod_cast hpointA center)
      (convexHull_mono hsub hcenterHull)


private theorem capInteriorByIndex_card_eq_three_of_cap_card_eq_five
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcard : (S.capByIndex i).card = 5) :
    (S.capInteriorByIndex i).card = 3 := by
  fin_cases i
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv3 :
        S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv1 :
        S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv2 :
        S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3, hcard]

private theorem surplusInterior_eq_triple_of_surplus_card_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {s1 s2 s3 : ℝ²}
    (hsurplusCard : S.surplusCap.card = 5)
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub :
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx) :
    S.capInteriorByIndex S.surplusIdx =
      ({s1, s2, s3} : Finset ℝ²) := by
  have hcapCard : (S.capByIndex S.surplusIdx).card = 5 := by
    rcases hi : S.surplusIdx with ⟨i, hiLt⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.capByIndex, hi] using hsurplusCard
  have hinteriorCard :
      (S.capInteriorByIndex S.surplusIdx).card = 3 :=
    capInteriorByIndex_card_eq_three_of_cap_card_eq_five S
      S.surplusIdx hcapCard
  have htripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  exact (Finset.eq_of_subset_of_card_le hsSub (by omega)).symm

private theorem exists_escapeeLabel_eq_of_mem_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²)
    (hx : x ∈ ({q₁, q₂} : Finset ℝ²)) :
    ∃ label : ShadowBank.Label,
      IsEndpointEscapeeLabel label ∧
        endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label = x := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl
  · exact ⟨.Q1, Or.inl rfl, rfl⟩
  · exact ⟨.Q2, Or.inr rfl, rfl⟩

private theorem exists_vSurplusHitLabel_eq_of_mem_triple_or_w
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 a : ℝ²)
    (ha : a = S.oppositeVertexByIndex S.oppIndex2 ∨
      a ∈ ({s1, s2, s3} : Finset ℝ²)) :
    ∃ label : ShadowBank.Label,
      IsEndpointVSurplusHitLabel label ∧
        endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label = a := by
  rcases ha with ha | ha
  · exact ⟨.w, Or.inl rfl, by simpa [endpointLabelPoint] using ha.symm⟩
  · simp only [Finset.mem_insert, Finset.mem_singleton] at ha
    rcases ha with rfl | rfl | rfl
    · exact ⟨.s1, Or.inr (Or.inl rfl), rfl⟩
    · exact ⟨.s2, Or.inr (Or.inr (Or.inl rfl)), rfl⟩
    · exact ⟨.s3, Or.inr (Or.inr (Or.inr rfl)), rfl⟩

private theorem exists_wSurplusHitLabel_eq_of_mem_triple_or_v
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 b : ℝ²)
    (hb : b = S.oppositeVertexByIndex S.oppIndex1 ∨
      b ∈ ({s1, s2, s3} : Finset ℝ²)) :
    ∃ label : ShadowBank.Label,
      IsEndpointWSurplusHitLabel label ∧
        endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label = b := by
  rcases hb with hb | hb
  · exact ⟨.v, Or.inl rfl, by simpa [endpointLabelPoint] using hb.symm⟩
  · simp only [Finset.mem_insert, Finset.mem_singleton] at hb
    rcases hb with rfl | rfl | rfl
    · exact ⟨.s1, Or.inr (Or.inl rfl), rfl⟩
    · exact ⟨.s2, Or.inr (Or.inr (Or.inl rfl)), rfl⟩
    · exact ⟨.s3, Or.inr (Or.inr (Or.inr rfl)), rfl⟩


/-- Generated ordered center-pair entries are never diagonal. -/
private theorem orderedLabelPairs_ne {c cp : Label}
    (hpair : (c, cp) ∈ orderedLabelPairs) : c ≠ cp := by
  intro hEq
  subst hEq
  cases c <;> simp [orderedLabelPairs] at hpair

/-- Right-apex-order branch of the label-complete `m = 5` left endpoint residual
exclusion.  With the ambient CCW boundary order supplied and its right-apex
disjunct (`0 < iv < iw`), the ten hull-ordered labels exhaust `A`, so the
induced endpoint shadow is both a metric shadow and in the finite endpoint row
bank — a contradiction. -/
theorem endpointLeft_residual_false_of_card_five_rightApex
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hcard5 : S.surplusCap.card = 5)
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    {n : ℕ} (hn : 0 < n) {φ : Fin n → ℝ²} {iv iw : Fin n}
    (hφinj : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    (hccwBoundary : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hu : φ (⟨0, hn⟩ : Fin n) = S.oppositeVertexByIndex S.surplusIdx)
    (hv : φ iv = S.oppositeVertexByIndex S.oppIndex1)
    (hw : φ iw = S.oppositeVertexByIndex S.oppIndex2)
    (h0v : (⟨0, hn⟩ : Fin n) < iv) (hvw : iv < iw) :
    False := by
  classical
  have hradius : (0 : ℝ) < radius := hend.1
  have hρpos : (0 : ℝ) < rho := hend.2.1
  have hAcard : A.card = 10 := by have h := hM44.surplus_card_eq; omega
  rcases exists_surplusInterior_triple_covering hM44
      (R := (∅ : Finset ℝ²)) (by simp) (by simp) with
    ⟨t1, t2, t3, _hRt, ht12, ht13, ht23, htSub⟩
  have hTcard : ({t1, t2, t3} : Finset ℝ²).card = 3 := by
    simp [ht12, ht13, ht23]
  rcases exists_rightPinnedHullOrderLabels_of_apex_order hn hφinj hφimage
      hccwBoundary hu hv hw h0v hvw hM44
      (show t1 ∈ ({t1, t2, t3} : Finset ℝ²) by simp) hTcard htSub with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hpairQ, _hTeq2,
      _ht1Triple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I, hq₁I, hq₂I,
      hs1I, hs2I, hs3I, hcert⟩
  let pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hinj : Function.Injective pointOf :=
    endpointLabelPoint_injective_of_mem S hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
      hp12 hq12 hs12 hs13 hs23
  have hpointA : ∀ center : ShadowBank.Label, pointOf center ∈ A :=
    rightPinnedLabelPoint_mem_of_mem S hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
  have hcover := cover_of_card_ten hinj hpointA hAcard
  have hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 => pointOf (SurplusCOMPGBank.labelOfHullFin i)) :=
    isCcwConvexPolygon_of_hullOrderSubsequenceCertificate hcert
  have hsurpEq :
      S.capInteriorByIndex S.surplusIdx = ({s1, s2, s3} : Finset ℝ²) :=
    surplusInterior_eq_triple_of_surplus_card_five S hcard5 hs12 hs13 hs23 hsSub
  rcases exists_labelCompleteSupportClasses hK4 hinj hpointA hcover with
    ⟨supportClass, radiusOf, hsupSub, hsupSame, hsupCard, hsupSelf⟩
  rcases endpointLeft_residual_selectedClass_shapes hM44 hconv hend with
    ⟨p₁', p₂', q₁', q₂', a, b, _hp'12, _hpPair', _hq'12, hqPair',
      hxQ', _hT₁card, hI₁sub, hxLeftEq', haRightEq', _hT₂card, hI₂sub,
      hbLeftEq', _huRightEq'⟩
  -- escapee label
  have hxQ : x ∈ ({q₁, q₂} : Finset ℝ²) := by
    have hxOpp2 : x ∈ S.oppInterior2 := by rw [hqPair']; exact hxQ'
    rw [hpairQ] at hxOpp2; exact hxOpp2
  rcases exists_escapeeLabel_eq_of_mem_pair S p₁ p₂ q₁ q₂ s1 s2 s3 x hxQ with
    ⟨xLabel, hxLabel, hxLabelEq⟩
  -- v-hit label
  have haInter : a ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
      S.rightAdjacentCapByIndex S.oppIndex1 := by rw [haRightEq']; simp
  have haAlt : a = S.oppositeVertexByIndex S.oppIndex2 ∨
      a ∈ ({s1, s2, s3} : Finset ℝ²) := by
    by_cases houter : a = S.oppositeVertexByIndex S.oppIndex2
    · exact Or.inl houter
    · have haI : a ∈ S.capInteriorByIndex S.surplusIdx := by
        have hraw :=
          S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
            S.oppIndex1 hradius (Finset.mem_inter.mp haInter).1
            (Finset.mem_inter.mp haInter).2
            (by intro h; exact houter (by
              simpa [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
                using h))
        simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
          using hraw
      rw [hsurpEq] at haI; exact Or.inr haI
  rcases exists_vSurplusHitLabel_eq_of_mem_triple_or_w S p₁ p₂ q₁ q₂ s1 s2 s3 a
      haAlt with ⟨aLabel, haLabel, haLabelEq⟩
  -- w-hit label
  have hbInter : b ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
      S.leftAdjacentCapByIndex S.oppIndex2 := by rw [hbLeftEq']; simp
  have hbAlt : b = S.oppositeVertexByIndex S.oppIndex1 ∨
      b ∈ ({s1, s2, s3} : Finset ℝ²) := by
    by_cases houter : b = S.oppositeVertexByIndex S.oppIndex1
    · exact Or.inl houter
    · have hbI : b ∈ S.capInteriorByIndex S.surplusIdx := by
        have hraw :=
          S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
            S.oppIndex2 hρpos (Finset.mem_inter.mp hbInter).1
            (Finset.mem_inter.mp hbInter).2
            (by intro h; exact houter (by
              simpa [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
                using h))
        simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
          using hraw
      rw [hsurpEq] at hbI; exact Or.inr hbI
  rcases exists_wSurplusHitLabel_eq_of_mem_triple_or_v S p₁ p₂ q₁ q₂ s1 s2 s3 b
      hbAlt with ⟨bLabel, hbLabel, hbLabelEq⟩
  -- v / w masks
  have hvMask : endpointPointMask pointOf
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) =
      SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] :=
    endpointLeft_residual_v_pointMask_eq hend hpairP hI₁sub
      (by rw [← hxLabelEq] at hxLeftEq'; exact hxLeftEq')
      (by rw [← haLabelEq] at haRightEq'; exact haRightEq')
      hinj hxLabel haLabel
  have hwMask : endpointPointMask pointOf
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho) =
      SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] :=
    endpointLeft_residual_w_pointMask_eq hend hpairQ hI₂sub
      (by rw [← hbLabelEq] at hbLeftEq'; exact hbLeftEq')
      (by
        simpa [pointOf, endpointLabelPoint] using _huRightEq')
      hinj hbLabel
  -- center class
  let centerClass : ShadowBank.Label → Finset ℝ² := fun c =>
    match c with
    | .v => SelectedClass A (pointOf .v) radius
    | .w => SelectedClass A (pointOf .w) rho
    | c => supportClass c
  have hccv : centerClass .v =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := rfl
  have hccw' : centerClass .w =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho := rfl
  have hvMaskC : endpointPointMask pointOf (centerClass .v) =
      SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
    rw [hccv]; exact hvMask
  have hwMaskC : endpointPointMask pointOf (centerClass .w) =
      SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
    rw [hccw']; exact hwMask
  -- same-radius for all centers
  have hsame : ∀ center a' b' : ShadowBank.Label,
      pointOf a' ∈ centerClass center → pointOf b' ∈ centerClass center →
      dist (pointOf center) (pointOf a') = dist (pointOf center) (pointOf b') := by
    intro center a' b' ha' hb'
    cases center with
    | v =>
        exact (mem_selectedClass.mp ha').2.trans (mem_selectedClass.mp hb').2.symm
    | w =>
        exact (mem_selectedClass.mp ha').2.trans (mem_selectedClass.mp hb').2.symm
    | u => exact hsupSame _ a' b' ha' hb'
    | s1 => exact hsupSame _ a' b' ha' hb'
    | s2 => exact hsupSame _ a' b' ha' hb'
    | s3 => exact hsupSame _ a' b' ha' hb'
    | Pw => exact hsupSame _ a' b' ha' hb'
    | Pu => exact hsupSame _ a' b' ha' hb'
    | Q1 => exact hsupSame _ a' b' ha' hb'
    | Q2 => exact hsupSame _ a' b' ha' hb'
  -- 11 conditions
  have hcard : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskCard (endpointPointMask pointOf (centerClass center)) = 4 := by
    intro center
    cases center with
    | v => exact endpointVMask_card_of_v_mask (centerClass := centerClass) hvMaskC hxLabel haLabel
    | w => exact endpointWMask_card_of_w_mask (centerClass := centerClass) hwMaskC hbLabel
    | u => exact hsupCard _
    | s1 => exact hsupCard _
    | s2 => exact hsupCard _
    | s3 => exact hsupCard _
    | Pw => exact hsupCard _
    | Pu => exact hsupCard _
    | Q1 => exact hsupCard _
    | Q2 => exact hsupCard _
  have hself : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskHas (endpointPointMask pointOf (centerClass center)) center = false := by
    intro center
    cases center with
    | v => exact endpointVMask_not_self_of_v_mask (centerClass := centerClass) hvMaskC hxLabel haLabel
    | w => exact endpointWMask_not_self_of_w_mask (centerClass := centerClass) hwMaskC hbLabel
    | u => exact hsupSelf _
    | s1 => exact hsupSelf _
    | s2 => exact hsupSelf _
    | s3 => exact hsupSelf _
    | Pw => exact hsupSelf _
    | Pu => exact hsupSelf _
    | Q1 => exact hsupSelf _
    | Q2 => exact hsupSelf _
  have hvOK := endpointVShapeOK_shadowOfPointClasses_of_v_mask
    (centerClass := centerClass) hvMaskC hxLabel haLabel
  have hwOK := endpointWShapeOK_shadowOfPointClasses_of_w_mask
    (centerClass := centerClass) hwMaskC hbLabel
  have huBounds := rightPinned_u_maskInter_bounds S hconv hp₁I hp₂I hq₁I hq₂I
    hinj (supportClass := supportClass) (radiusOf := radiusOf) hsupSub
  have huv : SurplusCOMPGBank.maskInterCard
      (endpointPointMask pointOf (centerClass .u)) SurplusCOMPGBank.cvNoUMask ≤ 1 :=
    huBounds.1
  have huw : SurplusCOMPGBank.maskInterCard
      (endpointPointMask pointOf (centerClass .u)) SurplusCOMPGBank.cwNoUMask ≤ 1 :=
    huBounds.2
  have hwv := endpointWMask_cvNoW_le_one_of_w_mask (centerClass := centerClass) hwMaskC hbLabel
  have hwu := endpointWMask_cuNoW_le_one_of_w_mask (centerClass := centerClass) hwMaskC hbLabel
  have hcirc := no_nonMoser_triple_of_convexIndep_nonobtuse hconv hinj hpointA
    (centerClass := centerClass) (fun center a' b' => hsame center a' b')
    (rightPinnedLabelPoint_moser_nonobtuse S p₁ p₂ q₁ q₂ s1 s2 s3)
  have hno3 : ∀ l₁ l₂ : ShadowBank.Label,
      (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
      SurplusCOMPGBank.pointPairClassCount
        (endpointShadowOfPointClasses pointOf centerClass) l₁ l₂ ≤ 2 := by
    intro l₁ l₂ hpair
    exact pointPairClassCount_le_two_of_sameRadius hconv hinj hpointA
      (fun center a' b' => hsame center a' b') hpair
  have hcounts := prefixPairCountsOK_shadowOfPointClasses_of_sameRadius hconv hinj
    hpointA (centerClass := centerClass) (fun center a' b' => hsame center a' b')
  have hsearchSep : ∀ c cp : ShadowBank.Label,
      (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
      SurplusCOMPGBank.crossSeparationOKForMasks c
        (endpointPointMask pointOf (centerClass c)) cp
        (endpointPointMask pointOf (centerClass cp)) = true := by
    intro c cp hpair
    have hccp : c ≠ cp := orderedLabelPairs_ne hpair
    exact crossSeparationOKForMasks_of_sameRadius_ccwHull hccw hinj hccp
      (fun a' b' => hsame c a' b') (fun a' b' => hsame cp a' b')
  have hOK : ShadowBank.endpointShadowOK xLabel
      (endpointShadowOfPointClasses pointOf centerClass) = true :=
    endpointShadowOK_shadowOfPointClasses_of_components
      (endpointClassesShapeOK_shadowOfPointClasses_of_maskCard_not_mem hcard hself)
      hvOK hwOK
      (endpointOneHitOK_shadowOfPointClasses_of_mask_bounds huv huw hwv hwu)
      (endpointCircumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple hcirc)
      (endpointNoThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two hno3)
      (endpointSearchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
      (SurplusCOMPGBank.separationOK_shadowOfPointClasses_of_sepOKFor_labelPairs (by
        intro c cp l₁ l₂ hcpair hpair
        exact SurplusCOMPGBank.sepOKFor_of_crossSeparationOKForMasks
          (crossSeparationOKForMasks_of_sameRadius_ccwHull hccw hinj
            (orderedLabelPairs_ne
              (SurplusCOMPGBank.labelPairs_mem_orderedLabelPairs hcpair))
            (fun a' b' => hsame c a' b') (fun a' b' => hsame cp a' b')) hpair))
      (endpointSearchSeparationOK_shadowOfPointClasses_of_crossSeparation hsearchSep)
  have hInBank := ShadowBank.Search.endpointShadowInBank_of_endpointShadowOK hOK
  have hMetric := endpointMetricShadow_shadowOfPointClasses_of_sameRadius hinj
    (centerClass := centerClass) (fun {center a' b'} ha' hb' => hsame center a' b' ha' hb')
  exact Variables.false_of_endpointShadowInBank_of_metricShadow hInBank hMetric

/-- Left-apex-order (reflected) branch of the label-complete `m = 5` left
endpoint residual exclusion.  The left chooser supplies a reflected hull-order
certificate; using the swapped label septuple the induced endpoint shadow is
again a metric shadow in the finite endpoint row bank — a contradiction. -/
theorem endpointLeft_residual_false_of_card_five_leftApex
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hcard5 : S.surplusCap.card = 5)
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    {n : ℕ} (hn : 0 < n) {φ : Fin n → ℝ²} {iv iw : Fin n}
    (hφinj : Function.Injective φ)
    (hφimage : Finset.univ.image φ = A)
    (hccwBoundary : EuclideanGeometry.IsCcwConvexPolygon φ)
    (hu : φ (⟨0, hn⟩ : Fin n) = S.oppositeVertexByIndex S.surplusIdx)
    (hv : φ iv = S.oppositeVertexByIndex S.oppIndex1)
    (hw : φ iw = S.oppositeVertexByIndex S.oppIndex2)
    (h0w : (⟨0, hn⟩ : Fin n) < iw) (hwv : iw < iv) :
    False := by
  classical
  have hradius : (0 : ℝ) < radius := hend.1
  have hρpos : (0 : ℝ) < rho := hend.2.1
  have hAcard : A.card = 10 := by have h := hM44.surplus_card_eq; omega
  rcases exists_surplusInterior_triple_covering hM44
      (R := (∅ : Finset ℝ²)) (by simp) (by simp) with
    ⟨t1, t2, t3, _hRt, ht12, ht13, ht23, htSub⟩
  have hTcard : ({t1, t2, t3} : Finset ℝ²).card = 3 := by
    simp [ht12, ht13, ht23]
  rcases exists_leftPinnedHullOrderLabels_of_apex_order hn hφinj hφimage
      hccwBoundary hu hv hw h0w hwv hM44
      (show t1 ∈ ({t1, t2, t3} : Finset ℝ²) by simp) hTcard htSub with
    ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hpairQ, _hTeq2,
      _ht1Triple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I, hq₁I, hq₂I,
      hs1I, hs2I, hs3I, hcert⟩
  let pointOf := endpointLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1
  have hinj : Function.Injective pointOf :=
    endpointLabelPoint_injective_of_mem S hp₂I hp₁I hq₂I hq₁I hs3I hs2I hs1I
      hp12.symm hq12.symm hs23.symm hs13.symm hs12.symm
  have hpointA : ∀ center : ShadowBank.Label, pointOf center ∈ A :=
    rightPinnedLabelPoint_mem_of_mem S hp₂I hp₁I hq₂I hq₁I hs3I hs2I hs1I
  have hcover := cover_of_card_ten hinj hpointA hAcard
  have hccw : EuclideanGeometry.IsCcwConvexPolygon
      (fun i : Fin 10 => pointOf (SurplusCOMPGBank.reflectedHullLabel
        (SurplusCOMPGBank.labelOfHullFin i))) := by
    have hc := isCcwConvexPolygon_of_hullOrderSubsequenceCertificate hcert
    convert hc using 2
    rename_i i
    fin_cases i <;> rfl
  have hsSub' : ({s3, s2, s1} : Finset ℝ²) ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro z hz
    apply hsSub
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz ⊢
    tauto
  have hsurpEq :
      S.capInteriorByIndex S.surplusIdx = ({s3, s2, s1} : Finset ℝ²) :=
    surplusInterior_eq_triple_of_surplus_card_five S hcard5 hs23.symm hs13.symm
      hs12.symm hsSub'
  rcases exists_labelCompleteSupportClasses hK4 hinj hpointA hcover with
    ⟨supportClass, radiusOf, hsupSub, hsupSame, hsupCard, hsupSelf⟩
  rcases endpointLeft_residual_selectedClass_shapes hM44 hconv hend with
    ⟨p₁', p₂', q₁', q₂', a, b, _hp'12, _hpPair', _hq'12, hqPair',
      hxQ', _hT₁card, hI₁sub, hxLeftEq', haRightEq', _hT₂card, hI₂sub,
      hbLeftEq', _huRightEq'⟩
  have hxQ : x ∈ ({q₂, q₁} : Finset ℝ²) := by
    have hxOpp2 : x ∈ S.oppInterior2 := by rw [hqPair']; exact hxQ'
    rw [hpairQ] at hxOpp2
    simp only [Finset.mem_insert, Finset.mem_singleton] at hxOpp2 ⊢
    tauto
  rcases exists_escapeeLabel_eq_of_mem_pair S p₂ p₁ q₂ q₁ s3 s2 s1 x hxQ with
    ⟨xLabel, hxLabel, hxLabelEq⟩
  have haInter : a ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
      S.rightAdjacentCapByIndex S.oppIndex1 := by rw [haRightEq']; simp
  have haAlt : a = S.oppositeVertexByIndex S.oppIndex2 ∨
      a ∈ ({s3, s2, s1} : Finset ℝ²) := by
    by_cases houter : a = S.oppositeVertexByIndex S.oppIndex2
    · exact Or.inl houter
    · have haI : a ∈ S.capInteriorByIndex S.surplusIdx := by
        have hraw :=
          S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
            S.oppIndex1 hradius (Finset.mem_inter.mp haInter).1
            (Finset.mem_inter.mp haInter).2
            (by intro h; exact houter (by
              simpa [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
                using h))
        simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
          using hraw
      rw [hsurpEq] at haI; exact Or.inr haI
  rcases exists_vSurplusHitLabel_eq_of_mem_triple_or_w S p₂ p₁ q₂ q₁ s3 s2 s1 a
      haAlt with ⟨aLabel, haLabel, haLabelEq⟩
  have hbInter : b ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
      S.leftAdjacentCapByIndex S.oppIndex2 := by rw [hbLeftEq']; simp
  have hbAlt : b = S.oppositeVertexByIndex S.oppIndex1 ∨
      b ∈ ({s3, s2, s1} : Finset ℝ²) := by
    by_cases houter : b = S.oppositeVertexByIndex S.oppIndex1
    · exact Or.inl houter
    · have hbI : b ∈ S.capInteriorByIndex S.surplusIdx := by
        have hraw :=
          S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
            S.oppIndex2 hρpos (Finset.mem_inter.mp hbInter).1
            (Finset.mem_inter.mp hbInter).2
            (by intro h; exact houter (by
              simpa [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
                using h))
        simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
          using hraw
      rw [hsurpEq] at hbI; exact Or.inr hbI
  rcases exists_wSurplusHitLabel_eq_of_mem_triple_or_v S p₂ p₁ q₂ q₁ s3 s2 s1 b
      hbAlt with ⟨bLabel, hbLabel, hbLabelEq⟩
  have hpairPrev : S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
    rw [hpairP]; ext z; simp [or_comm]
  have hqPairrev : S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
    rw [hpairQ]; ext z; simp [or_comm]
  have hvMask : endpointPointMask pointOf
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) =
      SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] :=
    endpointLeft_residual_v_pointMask_eq hend hpairPrev hI₁sub
      (by rw [← hxLabelEq] at hxLeftEq'; exact hxLeftEq')
      (by rw [← haLabelEq] at haRightEq'; exact haRightEq')
      hinj hxLabel haLabel
  have hwMask : endpointPointMask pointOf
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho) =
      SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] :=
    endpointLeft_residual_w_pointMask_eq hend hqPairrev hI₂sub
      (by rw [← hbLabelEq] at hbLeftEq'; exact hbLeftEq')
      (by simpa [pointOf, endpointLabelPoint] using _huRightEq')
      hinj hbLabel
  let centerClass : ShadowBank.Label → Finset ℝ² := fun c =>
    match c with
    | .v => SelectedClass A (pointOf .v) radius
    | .w => SelectedClass A (pointOf .w) rho
    | c => supportClass c
  have hccv : centerClass .v =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := rfl
  have hccwEq : centerClass .w =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho := rfl
  have hvMaskC : endpointPointMask pointOf (centerClass .v) =
      SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
    rw [hccv]; exact hvMask
  have hwMaskC : endpointPointMask pointOf (centerClass .w) =
      SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
    rw [hccwEq]; exact hwMask
  have hsame : ∀ center a' b' : ShadowBank.Label,
      pointOf a' ∈ centerClass center → pointOf b' ∈ centerClass center →
      dist (pointOf center) (pointOf a') = dist (pointOf center) (pointOf b') := by
    intro center a' b' ha' hb'
    cases center with
    | v => exact (mem_selectedClass.mp ha').2.trans (mem_selectedClass.mp hb').2.symm
    | w => exact (mem_selectedClass.mp ha').2.trans (mem_selectedClass.mp hb').2.symm
    | u => exact hsupSame _ a' b' ha' hb'
    | s1 => exact hsupSame _ a' b' ha' hb'
    | s2 => exact hsupSame _ a' b' ha' hb'
    | s3 => exact hsupSame _ a' b' ha' hb'
    | Pw => exact hsupSame _ a' b' ha' hb'
    | Pu => exact hsupSame _ a' b' ha' hb'
    | Q1 => exact hsupSame _ a' b' ha' hb'
    | Q2 => exact hsupSame _ a' b' ha' hb'
  have hcard : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskCard (endpointPointMask pointOf (centerClass center)) = 4 := by
    intro center
    cases center with
    | v => exact endpointVMask_card_of_v_mask (centerClass := centerClass) hvMaskC hxLabel haLabel
    | w => exact endpointWMask_card_of_w_mask (centerClass := centerClass) hwMaskC hbLabel
    | u => exact hsupCard _
    | s1 => exact hsupCard _
    | s2 => exact hsupCard _
    | s3 => exact hsupCard _
    | Pw => exact hsupCard _
    | Pu => exact hsupCard _
    | Q1 => exact hsupCard _
    | Q2 => exact hsupCard _
  have hself : ∀ center : ShadowBank.Label,
      SurplusCOMPGBank.maskHas (endpointPointMask pointOf (centerClass center)) center = false := by
    intro center
    cases center with
    | v => exact endpointVMask_not_self_of_v_mask (centerClass := centerClass) hvMaskC hxLabel haLabel
    | w => exact endpointWMask_not_self_of_w_mask (centerClass := centerClass) hwMaskC hbLabel
    | u => exact hsupSelf _
    | s1 => exact hsupSelf _
    | s2 => exact hsupSelf _
    | s3 => exact hsupSelf _
    | Pw => exact hsupSelf _
    | Pu => exact hsupSelf _
    | Q1 => exact hsupSelf _
    | Q2 => exact hsupSelf _
  have hvOK := endpointVShapeOK_shadowOfPointClasses_of_v_mask
    (centerClass := centerClass) hvMaskC hxLabel haLabel
  have hwOK := endpointWShapeOK_shadowOfPointClasses_of_w_mask
    (centerClass := centerClass) hwMaskC hbLabel
  have huBounds := rightPinned_u_maskInter_bounds S hconv hp₂I hp₁I hq₂I hq₁I
    hinj (supportClass := supportClass) (radiusOf := radiusOf) hsupSub
  have huv : SurplusCOMPGBank.maskInterCard
      (endpointPointMask pointOf (centerClass .u)) SurplusCOMPGBank.cvNoUMask ≤ 1 :=
    huBounds.1
  have huw : SurplusCOMPGBank.maskInterCard
      (endpointPointMask pointOf (centerClass .u)) SurplusCOMPGBank.cwNoUMask ≤ 1 :=
    huBounds.2
  have hwv := endpointWMask_cvNoW_le_one_of_w_mask (centerClass := centerClass) hwMaskC hbLabel
  have hwu := endpointWMask_cuNoW_le_one_of_w_mask (centerClass := centerClass) hwMaskC hbLabel
  have hcirc := no_nonMoser_triple_of_convexIndep_nonobtuse hconv hinj hpointA
    (centerClass := centerClass) (fun center a' b' => hsame center a' b')
    (rightPinnedLabelPoint_moser_nonobtuse S p₂ p₁ q₂ q₁ s3 s2 s1)
  have hno3 : ∀ l₁ l₂ : ShadowBank.Label,
      (l₁, l₂) ∈ SurplusCOMPGBank.labelPairs →
      SurplusCOMPGBank.pointPairClassCount
        (endpointShadowOfPointClasses pointOf centerClass) l₁ l₂ ≤ 2 := by
    intro l₁ l₂ hpair
    exact pointPairClassCount_le_two_of_sameRadius hconv hinj hpointA
      (fun center a' b' => hsame center a' b') hpair
  have hcounts := prefixPairCountsOK_shadowOfPointClasses_of_sameRadius hconv hinj
    hpointA (centerClass := centerClass) (fun center a' b' => hsame center a' b')
  have hsearchSep : ∀ c cp : ShadowBank.Label,
      (c, cp) ∈ SurplusCOMPGBank.orderedLabelPairs →
      SurplusCOMPGBank.crossSeparationOKForMasks c
        (endpointPointMask pointOf (centerClass c)) cp
        (endpointPointMask pointOf (centerClass cp)) = true := by
    intro c cp hpair
    have hccp : c ≠ cp := orderedLabelPairs_ne hpair
    exact crossSeparationOKForMasks_of_sameRadius_reflectedCcwHull hccw hinj hccp
      (fun a' b' => hsame c a' b') (fun a' b' => hsame cp a' b')
  have hOK : ShadowBank.endpointShadowOK xLabel
      (endpointShadowOfPointClasses pointOf centerClass) = true :=
    endpointShadowOK_shadowOfPointClasses_of_components
      (endpointClassesShapeOK_shadowOfPointClasses_of_maskCard_not_mem hcard hself)
      hvOK hwOK
      (endpointOneHitOK_shadowOfPointClasses_of_mask_bounds huv huw hwv hwu)
      (endpointCircumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple hcirc)
      (endpointNoThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two hno3)
      (endpointSearchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
      (SurplusCOMPGBank.separationOK_shadowOfPointClasses_of_sepOKFor_labelPairs (by
        intro c cp l₁ l₂ hcpair hpair
        exact SurplusCOMPGBank.sepOKFor_of_crossSeparationOKForMasks
          (crossSeparationOKForMasks_of_sameRadius_reflectedCcwHull hccw hinj
            (orderedLabelPairs_ne
              (SurplusCOMPGBank.labelPairs_mem_orderedLabelPairs hcpair))
            (fun a' b' => hsame c a' b') (fun a' b' => hsame cp a' b')) hpair))
      (endpointSearchSeparationOK_shadowOfPointClasses_of_crossSeparation hsearchSep)
  have hInBank := ShadowBank.Search.endpointShadowInBank_of_endpointShadowOK hOK
  have hMetric := endpointMetricShadow_shadowOfPointClasses_of_sameRadius hinj
    (centerClass := centerClass) (fun {center a' b'} ha' hb' => hsame center a' b' ha' hb')
  exact Variables.false_of_endpointShadowInBank_of_metricShadow hInBank hMetric

/-- The label-complete `m = 5` left endpoint residual is impossible: dispatch on
the two ambient CCW apex orientations to the direct and reflected branches. -/
theorem endpointLeft_residual_false_of_card_five
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hne : A.Nonempty) (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hcard5 : S.surplusCap.card = 5)
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    False := by
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      hne hconv hK4 with
    ⟨n, hn, φ, iv, iw, hφinj, hφimage, hccwBoundary, hu, hv, hw, hapex⟩
  rcases hapex with ⟨h0v, hvw⟩ | ⟨h0w, hwv⟩
  · exact endpointLeft_residual_false_of_card_five_rightApex hM44 hconv hK4 hcard5
      hend hn hφinj hφimage hccwBoundary hu hv hw h0v hvw
  · exact endpointLeft_residual_false_of_card_five_leftApex hM44 hconv hK4 hcard5
      hend hn hφinj hφimage hccwBoundary hu hv hw h0w hwv
end EndpointCertificate

end Problem97
