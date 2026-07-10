/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.RemovableVertexAxiom.Base

/-!
# Pinned-surplus metric-shadow producer

This shard contains the active producer obligation for the pinned-surplus
residual branch.  It imports the stable removable-vertex base shard but does not
import the generated row-zero bank.
-/

open scoped EuclideanGeometry

namespace Problem97

open SurplusCOMPGBank

private abbrev SameRadiusPointClasses
    (pointOf : Label → ℝ²) (centerClass : Label → Finset ℝ²) : Prop :=
  ∀ center a b : Label,
    pointOf a ∈ centerClass center →
      pointOf b ∈ centerClass center →
        dist (pointOf center) (pointOf a) =
          dist (pointOf center) (pointOf b)

private abbrev PinnedSurplusSupportClasses
    (pointOf : Label → ℝ²) (sstar : Label)
    (centerClass : Label → Finset ℝ²) : Prop :=
  (∀ center a b : Label, center ≠ .v → center ≠ .w →
    pointOf a ∈ centerClass center →
      pointOf b ∈ centerClass center →
        dist (pointOf center) (pointOf a) =
          dist (pointOf center) (pointOf b)) ∧
    ∀ center : Label, center ≠ .v → center ≠ .w →
      pointMask pointOf (centerClass center) ∈ candidateMasks sstar center

private theorem noThreeOK_shadowOfPointClasses_of_sameRadius
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    {pointOf : Label → ℝ²}
    (hinj : Function.Injective pointOf)
    (hpointMem : ∀ center : Label, pointOf center ∈ A)
    {centerClass : Label → Finset ℝ²}
    (hsame : SameRadiusPointClasses pointOf centerClass) :
    noThreeOK (shadowOfPointClasses pointOf centerClass) = true := by
  unfold noThreeOK
  rw [List.all_eq_true]
  intro pointPair hpointPair
  exact decide_eq_true
    (pointPairClassCount_le_two_of_sameRadius hconv hinj hpointMem
      hsame hpointPair)

private theorem orderedLabelPairs_ne_local {c cp : Label}
    (hpair : (c, cp) ∈ orderedLabelPairs) : c ≠ cp := by
  intro hEq
  subst cp
  cases c <;> simp [orderedLabelPairs] at hpair

private theorem wSelectorMask_mem_candidateMasks
    {sstar leftHit rightHit : Label}
    (hsstar : isSurplusStar sstar = true)
    (hleft :
      leftHit = .v ∨ leftHit = .s1 ∨ leftHit = .s2 ∨ leftHit = .s3)
    (hright : rightHit = .u ∨ rightHit = .Pw ∨ rightHit = .Pu) :
    maskOfLabels [.Q1, .Q2, leftHit, rightHit] ∈
      candidateMasks sstar .w := by
  exact mem_candidateMasks_of_candidateMaskOK hsstar (by
    rcases hleft with rfl | rfl | rfl | rfl <;>
    rcases hright with rfl | rfl | rfl <;>
    cases sstar <;> simp [isSurplusStar] at hsstar <;> decide)

private theorem pointMask_eq_QQSelectorMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {leftHit rightHit : Label}
    (hleft :
      leftHit = .v ∨ leftHit = .s1 ∨ leftHit = .s2 ∨ leftHit = .s3)
    (hright : rightHit = .u ∨ rightHit = .Pw ∨ rightHit = .Pu) :
    pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf leftHit, pointOf rightHit} :
          Finset α) =
      maskOfLabels [.Q1, .Q2, leftHit, rightHit] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  rcases hleft with rfl | rfl | rfl | rfl <;>
  rcases hright with rfl | rfl | rfl <;>
    simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
      Label.index]

private theorem surplusStar_eq_s1_or_s2_or_s3 {label : Label}
    (hlabel : isSurplusStar label = true) :
    label = .s1 ∨ label = .s2 ∨ label = .s3 := by
  cases label <;> simp [isSurplusStar] at hlabel ⊢

private theorem wSelectorClass_mem_candidateMasks
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {T : Finset α} {sstar leftHit rightHit : Label}
    (hinj : Function.Injective pointOf)
    (hsstar : isSurplusStar sstar = true)
    (hleft :
      leftHit = .v ∨ leftHit = .s1 ∨ leftHit = .s2 ∨ leftHit = .s3)
    (hright : rightHit = .u ∨ rightHit = .Pw ∨ rightHit = .Pu)
    (hT :
      T = ({pointOf .Q1, pointOf .Q2, pointOf leftHit,
        pointOf rightHit} : Finset α)) :
    pointMask pointOf T ∈ candidateMasks sstar .w := by
  rw [hT, pointMask_eq_QQSelectorMask hinj hleft hright]
  exact wSelectorMask_mem_candidateMasks hsstar hleft hright

private noncomputable def pinnedSurplusCenterClass
    (A : Finset ℝ²) (pointOf : Label → ℝ²)
    (vRadius wRadius : ℝ)
    (supportClass : Label → Finset ℝ²) : Label → Finset ℝ²
  | .u => supportClass .u
  | .v => SelectedClass A (pointOf .v) vRadius
  | .w => SelectedClass A (pointOf .w) wRadius
  | .s1 => supportClass .s1
  | .s2 => supportClass .s2
  | .s3 => supportClass .s3
  | .Pw => supportClass .Pw
  | .Pu => supportClass .Pu
  | .Q1 => supportClass .Q1
  | .Q2 => supportClass .Q2

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

private theorem rightPinnedLabelPoint_covers_of_surplus_card_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hsurplusCard : S.surplusCap.card = 5)
    (hpairP : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub :
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx) :
    ∀ x ∈ A, ∃ label : Label,
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label = x := by
  intro x hxA
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hxA with
    hxMoser | ⟨i, hxi⟩
  · rcases exists_moserLabel_rightPinnedLabelPoint_eq_of_mem_triangle
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxMoser with ⟨label, _hlabel, hpoint⟩
    exact ⟨label, hpoint⟩
  · rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
      rfl | rfl | rfl
    · have htriple := surplusInterior_eq_triple_of_surplus_card_five S
        hsurplusCard hs12 hs13 hs23 hsSub
      have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := by
        simpa [htriple] using hxi
      simp only [Finset.mem_insert, Finset.mem_singleton] at hxTriple
      rcases hxTriple with rfl | rfl | rfl
      · exact ⟨.s1, rfl⟩
      · exact ⟨.s2, rfl⟩
      · exact ⟨.s3, rfl⟩
    · have hxPair : x ∈ ({p₁, p₂} : Finset ℝ²) := by
        rw [← hpairP]
        simpa [SurplusCapPacket.oppInterior1] using hxi
      simp only [Finset.mem_insert, Finset.mem_singleton] at hxPair
      rcases hxPair with rfl | rfl
      · exact ⟨.Pw, rfl⟩
      · exact ⟨.Pu, rfl⟩
    · rcases exists_QLabel_rightPinnedLabelPoint_eq_of_mem_oppInterior2
        S p₁ p₂ q₁ q₂ s1 s2 s3 hqpair
          (by simpa [SurplusCapPacket.oppInterior2] using hxi) with
        ⟨label, _hlabel, hpoint⟩
      exact ⟨label, hpoint⟩

private theorem leftPinnedLabelPoint_covers_of_surplus_card_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hsurplusCard : S.surplusCap.card = 5)
    (hpairP : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub :
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx) :
    ∀ x ∈ A, ∃ label : Label,
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label = x := by
  intro x hxA
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hxA with
    hxMoser | ⟨i, hxi⟩
  · rcases exists_moserLabel_leftPinnedLabelPoint_eq_of_mem_triangle
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxMoser with ⟨label, _hlabel, hpoint⟩
    exact ⟨label, hpoint⟩
  · rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
      rfl | rfl | rfl
    · have htriple := surplusInterior_eq_triple_of_surplus_card_five S
        hsurplusCard hs12 hs13 hs23 hsSub
      have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := by
        simpa [htriple] using hxi
      simp only [Finset.mem_insert, Finset.mem_singleton] at hxTriple
      rcases hxTriple with rfl | rfl | rfl
      · exact ⟨.s1, rfl⟩
      · exact ⟨.s2, rfl⟩
      · exact ⟨.s3, rfl⟩
    · rcases exists_QLabel_leftPinnedLabelPoint_eq_of_mem_oppInterior1
        S p₁ p₂ q₁ q₂ s1 s2 s3 hqpair
          (by simpa [SurplusCapPacket.oppInterior1] using hxi) with
        ⟨label, _hlabel, hpoint⟩
      exact ⟨label, hpoint⟩
    · have hxPair : x ∈ ({p₁, p₂} : Finset ℝ²) := by
        rw [← hpairP]
        simpa [SurplusCapPacket.oppInterior2] using hxi
      simp only [Finset.mem_insert, Finset.mem_singleton] at hxPair
      rcases hxPair with rfl | rfl
      · exact ⟨.Pw, rfl⟩
      · exact ⟨.Pu, rfl⟩

private theorem exists_labelCompleteSupportClasses_of_globalK4
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

private theorem leftPinned_u_maskInter_bounds
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {supportClass : Label → Finset ℝ²} {radiusOf : Label → ℝ}
    (hsub : ∀ center : Label,
      supportClass center ⊆
        SelectedClass A
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
          (radiusOf center)) :
    maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (supportClass .u))
          cvNoUMask ≤ 1 ∧
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (supportClass .u))
          cwNoUMask ≤ 1 := by
  let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hrightFixed : ∀ label : Label,
      maskHas cvNoUMask label = true →
        pointOf label ∈ S.rightAdjacentCapByIndex S.surplusIdx := by
    intro label hlabel
    rcases maskHas_cvNoUMask_cases hlabel with rfl | rfl | rfl
    · rw [S.rightAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex2_eq_rightAdjacentIndex_surplusIdx]
      simpa [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
        leftPinnedToRightLabel,
        ← S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
        using S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex2
    · rw [S.rightAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex2_eq_rightAdjacentIndex_surplusIdx]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hp₁I
    · rw [S.rightAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex2_eq_rightAdjacentIndex_surplusIdx]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hp₂I
  have hleftFixed : ∀ label : Label,
      maskHas cwNoUMask label = true →
        pointOf label ∈ S.leftAdjacentCapByIndex S.surplusIdx := by
    intro label hlabel
    rcases maskHas_cwNoUMask_cases hlabel with rfl | rfl | rfl
    · rw [S.leftAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex1_eq_leftAdjacentIndex_surplusIdx]
      simpa [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
        leftPinnedToRightLabel,
        ← S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
        using S.rightOuterVertexByIndex_mem_capByIndex S.oppIndex1
    · rw [S.leftAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex1_eq_leftAdjacentIndex_surplusIdx]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hq₁I
    · rw [S.leftAdjacentCapByIndex_eq_capByIndex,
        ← S.oppIndex1_eq_leftAdjacentIndex_surplusIdx]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hq₂I
  have hsupportSub :
      supportClass .u ⊆
        SelectedClass A (S.oppositeVertexByIndex S.surplusIdx)
          (radiusOf .u) := by
    simpa [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
      leftPinnedToRightLabel] using hsub .u
  constructor
  · calc
      maskInterCard (pointMask pointOf (supportClass .u)) cvNoUMask
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
  · calc
      maskInterCard (pointMask pointOf (supportClass .u)) cwNoUMask
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

private theorem selectedClass_eq_pair_left_right_singletons
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {q₁ q₂ leftHit rightHit : ℝ²}
    (hradius : 0 < radius)
    (hpair : S.capInteriorByIndex i = ({q₁, q₂} : Finset ℝ²))
    (hIsub :
      S.capInteriorByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hleft :
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i =
        ({leftHit} : Finset ℝ²))
    (hright :
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i =
        ({rightHit} : Finset ℝ²)) :
    SelectedClass A (S.oppositeVertexByIndex i) radius =
      ({q₁, q₂, leftHit, rightHit} : Finset ℝ²) := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex i) radius
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  ext z
  constructor
  · intro hz
    by_cases hzI : z ∈ S.capInteriorByIndex i
    · have hzPair : z ∈ ({q₁, q₂} : Finset ℝ²) := by
        simpa [hpair] using hzI
      simp only [Finset.mem_insert, Finset.mem_singleton] at hzPair ⊢
      rcases hzPair with rfl | rfl
      · exact Or.inl rfl
      · exact Or.inr (Or.inl rfl)
    · have hzOutside : z ∈ T \ S.capInteriorByIndex i := by
        exact Finset.mem_sdiff.mpr ⟨by simpa [T] using hz, hzI⟩
      have hzAdj := hcover hzOutside
      simp only [Finset.mem_union, Finset.mem_inter] at hzAdj
      rcases hzAdj with hzLeft | hzRight
      · have hzSingleton : z ∈ ({leftHit} : Finset ℝ²) := by
          rw [← hleft]
          simpa [T] using hzLeft
        have hzEq : z = leftHit := by simpa using hzSingleton
        simp [hzEq]
      · have hzSingleton : z ∈ ({rightHit} : Finset ℝ²) := by
          rw [← hright]
          simpa [T] using hzRight
        have hzEq : z = rightHit := by simpa using hzSingleton
        simp [hzEq]
  · intro hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hz | hz | hz | hz
    · subst z
      exact hIsub (by rw [hpair]; simp)
    · subst z
      exact hIsub (by rw [hpair]; simp)
    · subst z
      have hmem : leftHit ∈ T ∩ S.leftAdjacentCapByIndex i := by
        rw [hleft]
        simp
      exact by simpa [T] using (Finset.mem_inter.mp hmem).1
    · subst z
      have hmem : rightHit ∈ T ∩ S.rightAdjacentCapByIndex i := by
        rw [hright]
        simp
      exact by simpa [T] using (Finset.mem_inter.mp hmem).1

private theorem sameRadiusPointClasses_of_exact_vw_and_nonfixed
    {A : Finset ℝ²} {pointOf : Label → ℝ²}
    {centerClass : Label → Finset ℝ²} {vRadius wRadius : ℝ}
    (hVcenterClass :
      centerClass .v = SelectedClass A (pointOf .v) vRadius)
    (hWcenterClass :
      centerClass .w = SelectedClass A (pointOf .w) wRadius)
    (hNonfixed :
      ∀ center a b : Label, center ≠ .v → center ≠ .w →
        pointOf a ∈ centerClass center →
          pointOf b ∈ centerClass center →
            dist (pointOf center) (pointOf a) =
              dist (pointOf center) (pointOf b)) :
    SameRadiusPointClasses pointOf centerClass := by
  intro center a b ha hb
  by_cases hv : center = .v
  · subst center
    have ha' : pointOf a ∈ SelectedClass A (pointOf .v) vRadius := by
      simpa [hVcenterClass] using ha
    have hb' : pointOf b ∈ SelectedClass A (pointOf .v) vRadius := by
      simpa [hVcenterClass] using hb
    exact (mem_selectedClass.mp ha').2.trans
      (mem_selectedClass.mp hb').2.symm
  · by_cases hw : center = .w
    · subst center
      have ha' : pointOf a ∈ SelectedClass A (pointOf .w) wRadius := by
        simpa [hWcenterClass] using ha
      have hb' : pointOf b ∈ SelectedClass A (pointOf .w) wRadius := by
        simpa [hWcenterClass] using hb
      exact (mem_selectedClass.mp ha').2.trans
        (mem_selectedClass.mp hb').2.symm
    · exact hNonfixed center a b hv hw ha hb

/-- Labelled support-class producer still needed for the pinned-surplus
metric shadow.  Once the pinned residual has fixed the ten-label geometric
surface, this residual supplies the support classes used by the consumer, the
exact pinned `.v` class, the opposite `.w` selector class, a pointwise
same-radius proof for the non-fixed centers, and candidate-list membership for
the remaining centres. -/
abbrev IsM44PinnedSurplusNonVExactShapeProducerStatement : Prop :=
    ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
      HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
      ∀ S : SurplusCapPacket A, S.IsM44 →
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedRightSurplusResidualAt radius x →
          ∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
            p₁ ≠ p₂ →
            S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) →
            q₁ ≠ q₂ →
            S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) →
            s1 ≠ s2 → s1 ≠ s3 → s2 ≠ s3 →
            ({s1, s2, s3} : Finset ℝ²) ⊆
              S.capInteriorByIndex S.surplusIdx →
            p₁ ∈ S.capInteriorByIndex S.oppIndex1 →
            p₂ ∈ S.capInteriorByIndex S.oppIndex1 →
            q₁ ∈ S.capInteriorByIndex S.oppIndex2 →
            q₂ ∈ S.capInteriorByIndex S.oppIndex2 →
            s1 ∈ S.capInteriorByIndex S.surplusIdx →
            s2 ∈ S.capInteriorByIndex S.surplusIdx →
            s3 ∈ S.capInteriorByIndex S.surplusIdx →
            x ∈ ({s1, s2, s3} : Finset ℝ²) →
            ∀ {sstar : Label} {wRadius : ℝ},
              isSurplusStar sstar = true →
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
              ∃ supportClass : Label → Finset ℝ²,
                let pointOf :=
                  rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
                PinnedSurplusSupportClasses pointOf sstar
                  (pinnedSurplusCenterClass A pointOf radius wRadius
                    supportClass)) ∧
        (∀ {radius : ℝ} {x : ℝ²},
          S.PinnedLeftSurplusResidualAt radius x →
          ∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
            p₁ ≠ p₂ →
            S.oppInterior2 = ({p₁, p₂} : Finset ℝ²) →
            q₁ ≠ q₂ →
            S.oppInterior1 = ({q₁, q₂} : Finset ℝ²) →
            s1 ≠ s2 → s1 ≠ s3 → s2 ≠ s3 →
            ({s1, s2, s3} : Finset ℝ²) ⊆
              S.capInteriorByIndex S.surplusIdx →
            p₁ ∈ S.capInteriorByIndex S.oppIndex2 →
            p₂ ∈ S.capInteriorByIndex S.oppIndex2 →
            q₁ ∈ S.capInteriorByIndex S.oppIndex1 →
            q₂ ∈ S.capInteriorByIndex S.oppIndex1 →
            s1 ∈ S.capInteriorByIndex S.surplusIdx →
            s2 ∈ S.capInteriorByIndex S.surplusIdx →
            s3 ∈ S.capInteriorByIndex S.surplusIdx →
            x ∈ ({s1, s2, s3} : Finset ℝ²) →
            ∀ {sstar : Label} {wRadius : ℝ},
              isSurplusStar sstar = true →
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
              ∃ supportClass : Label → Finset ℝ²,
                let pointOf :=
                  leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
                PinnedSurplusSupportClasses pointOf sstar
                  (pinnedSurplusCenterClass A pointOf radius wRadius
                    supportClass))

/-- Named on-spine residual for the labelled support/candidate producer
part of the pinned-surplus metric-shadow producer. -/
theorem isM44PinnedSurplusNonVExactShapeProducer :
      IsM44PinnedSurplusNonVExactShapeProducerStatement := by
  sorry

/-- Remaining pinned-surplus producer obligation after the checked row-zero
bank contradiction is wired into the spine. -/
theorem isM44PinnedSurplusMetricShadowProducer :
      IsM44PinnedSurplusMetricShadowProducerStatement := by
  intro A hne hconv hK4 hgt hMin S hM44
  have hnonVShape :=
    isM44PinnedSurplusNonVExactShapeProducer A hne hconv hK4 hgt hMin S hM44
  rcases hM44.exists_nonSurplusMoserSelectorShapes hK4 hconv with
    ⟨opp1Radius, opp2Radius, hopp1RadiusPos, hopp1Shape,
      hopp2RadiusPos, hopp2Shape⟩
  rcases hopp1Shape with
    ⟨hopp1Card, hopp1InteriorSub, opp1LeftHit, opp1RightHit,
      hopp1LeftCap, hopp1RightCap, hopp1LeftSingleton,
      hopp1RightSingleton⟩
  rcases hopp2Shape with
    ⟨hopp2Card, hopp2InteriorSub, opp2LeftHit, opp2RightHit,
      hopp2LeftCap, hopp2RightCap, hopp2LeftSingleton,
      hopp2RightSingleton⟩
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      hne hconv hK4 with
    ⟨n, hn, φ, iv, iw, hφinj, hφimage, hccwBoundary, hu, hv, hw,
      hapexOrder⟩
  constructor
  · intro radius x hpinned
    classical
    have hxSurplus := S.pinnedRightSurplusResidual_mem_right_surplus hpinned
    have hxSurplusInterior :
        x ∈ S.capInteriorByIndex S.surplusIdx :=
      S.mem_surplusInterior_of_oppIndex1_right_surplus
        (S.pinnedRightSurplusResidual_radius_pos hpinned)
        (S.pinnedRightSurplusResidual_mem_selectedClass hpinned)
        hxSurplus
    have hopp2LeftT :
        opp2LeftHit ∈
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
            opp2Radius := by
      have hmem :
          opp2LeftHit ∈
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
                opp2Radius ∩
              S.leftAdjacentCapByIndex S.oppIndex2 := by
        rw [hopp2LeftSingleton]
        simp
      exact (Finset.mem_inter.mp hmem).1
    have hopp2RightT :
        opp2RightHit ∈
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
            opp2Radius := by
      have hmem :
          opp2RightHit ∈
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex2)
                opp2Radius ∩
              S.rightAdjacentCapByIndex S.oppIndex2 := by
        rw [hopp2RightSingleton]
        simp
      exact (Finset.mem_inter.mp hmem).1
    let R : Finset ℝ² :=
      ({x, opp2LeftHit} : Finset ℝ²).filter
        (fun z => z ∈ S.capInteriorByIndex S.surplusIdx)
    have hRsub : R ⊆ S.capInteriorByIndex S.surplusIdx := by
      intro z hz
      exact (Finset.mem_filter.mp hz).2
    have hRcard : R.card ≤ 3 := by
      have hleFilter : R.card ≤ ({x, opp2LeftHit} : Finset ℝ²).card :=
        Finset.card_filter_le _ _
      have hlePair : ({x, opp2LeftHit} : Finset ℝ²).card ≤ 2 :=
        Finset.card_le_two
      omega
    rcases EndpointCertificate.exists_surplusInterior_triple_covering
        hM44 hRsub hRcard with
      ⟨t1, t2, t3, hRtrip, ht12, ht13, ht23, htSub⟩
    have hxR : x ∈ R := by
      simp [R, hxSurplusInterior]
    have hxTripleT : x ∈ ({t1, t2, t3} : Finset ℝ²) := hRtrip hxR
    have hopp2LeftAltT :
        opp2LeftHit = S.oppositeVertexByIndex S.oppIndex1 ∨
          opp2LeftHit ∈ ({t1, t2, t3} : Finset ℝ²) := by
      by_cases houter :
          opp2LeftHit = S.oppositeVertexByIndex S.oppIndex1
      · exact Or.inl houter
      · have hleftI :
            opp2LeftHit ∈ S.capInteriorByIndex S.surplusIdx := by
          have hraw :=
            S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
              S.oppIndex2 hopp2RadiusPos hopp2LeftT hopp2LeftCap
              (by
                intro h
                exact houter (by
                  simpa [
                    S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
                    using h))
          simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
            using hraw
        have hleftR : opp2LeftHit ∈ R := by
          simp [R, hleftI]
        exact Or.inr (hRtrip hleftR)
    have hTcard : ({t1, t2, t3} : Finset ℝ²).card = 3 := by
      simp [ht12, ht13, ht23]
    have produceRight :
        ∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
          p₁ ≠ p₂ → S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) →
          q₁ ≠ q₂ → S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) →
          s1 ≠ s2 → s1 ≠ s3 → s2 ≠ s3 →
          ({s1, s2, s3} : Finset ℝ²) ⊆
            S.capInteriorByIndex S.surplusIdx →
          p₁ ∈ S.capInteriorByIndex S.oppIndex1 →
          p₂ ∈ S.capInteriorByIndex S.oppIndex1 →
          q₁ ∈ S.capInteriorByIndex S.oppIndex2 →
          q₂ ∈ S.capInteriorByIndex S.oppIndex2 →
          s1 ∈ S.capInteriorByIndex S.surplusIdx →
          s2 ∈ S.capInteriorByIndex S.surplusIdx →
          s3 ∈ S.capInteriorByIndex S.surplusIdx →
          x ∈ ({s1, s2, s3} : Finset ℝ²) →
          (opp2LeftHit = S.oppositeVertexByIndex S.oppIndex1 ∨
            opp2LeftHit ∈ ({s1, s2, s3} : Finset ℝ²)) →
          (∀ {centerClass : Label → Finset ℝ²},
            Function.Injective
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) →
            (∀ center a b : Label,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 a ∈
                  centerClass center →
                rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 b ∈
                  centerClass center →
                  dist
                      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
                      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 a) =
                    dist
                      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
                      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 b)) →
            ∀ c cp : Label, (c, cp) ∈ orderedLabelPairs →
              crossSeparationOKForMasks c
                  (pointMask
                    (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                    (centerClass c))
                  cp
                  (pointMask
                    (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                    (centerClass cp)) = true) →
          RightPinnedSurplusMetricShadowData S radius x := by
      intro p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpairP hq12 hqpair
        hs12 hs13 hs23 hsSub hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
        hxTriple hopp2LeftAlt hsearchSepOfSameRadius
      let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      have hinj : Function.Injective pointOf :=
        rightPinnedLabelPoint_injective_of_mem S
          hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13
          hs23
      have hpointA : ∀ center : Label, pointOf center ∈ A :=
        rightPinnedLabelPoint_mem_of_mem S
          hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
      rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
          S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
        ⟨sstar, hsstar, hsstar_eq⟩
      rcases hnonVShape.1 hpinned p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpairP
          hq12 hqpair hs12 hs13 hs23 hsSub hp₁I hp₂I hq₁I hq₂I
          hs1I hs2I hs3I hxTriple
          (sstar := sstar) (wRadius := opp2Radius) hsstar hsstar_eq with
        ⟨supportClass, hsupport⟩
      let centerClass :=
        pinnedSurplusCenterClass A pointOf radius opp2Radius supportClass
      have hVcenterClass :
          centerClass .v = SelectedClass A (pointOf .v) radius := rfl
      have hWselectedClass :
          centerClass .w = SelectedClass A (pointOf .w) opp2Radius := rfl
      rcases hsupport with ⟨hNonfixedSame, hNonVcandidate⟩
      have hsame : SameRadiusPointClasses pointOf centerClass :=
        sameRadiusPointClasses_of_exact_vw_and_nonfixed
          (A := A) hVcenterClass hWselectedClass hNonfixedSame
      have hmetric :
          EndpointCertificate.Variables.EndpointMetricShadow pointOf
            (shadowOfPointClasses pointOf centerClass) :=
        endpointMetricShadow_shadowOfPointClasses_of_sameRadius hinj
          (fun {center a b} ha hb => hsame center a b ha hb)
      have hno3 :
          noThreeOK (shadowOfPointClasses pointOf centerClass) = true :=
        noThreeOK_shadowOfPointClasses_of_sameRadius hconv hinj hpointA
          hsame
      have hcounts :
          PrefixPairCountsOK (shadowOfPointClasses pointOf centerClass) :=
        prefixPairCountsOK_shadowOfPointClasses_of_sameRadius hconv hinj
          hpointA hsame
      have hWclassGeom :
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) opp2Radius =
            ({q₁, q₂, opp2LeftHit, opp2RightHit} : Finset ℝ²) := by
        have hqpairCap :
            S.capInteriorByIndex S.oppIndex2 =
              ({q₁, q₂} : Finset ℝ²) := by
          simpa [SurplusCapPacket.oppInterior2] using hqpair
        exact selectedClass_eq_pair_left_right_singletons
          S S.oppIndex2 hopp2RadiusPos hqpairCap hopp2InteriorSub
          hopp2LeftSingleton hopp2RightSingleton
      have hleftLabel :
          ∃ leftLabel : Label,
            (leftLabel = .v ∨ leftLabel = .s1 ∨ leftLabel = .s2 ∨
              leftLabel = .s3) ∧
              pointOf leftLabel = opp2LeftHit := by
        rcases hopp2LeftAlt with houter | htriple
        · exact ⟨.v, Or.inl rfl, by
            simp [pointOf, rightPinnedLabelPoint, houter]⟩
        · rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
            S p₁ p₂ q₁ q₂ s1 s2 s3 htriple with
            ⟨leftLabel, hleftStar, hleftEq⟩
          exact ⟨leftLabel,
            Or.inr (surplusStar_eq_s1_or_s2_or_s3 hleftStar), by
              simpa [pointOf] using hleftEq⟩
      have hrightLabel :
          ∃ rightLabel : Label,
            (rightLabel = .u ∨ rightLabel = .Pw ∨ rightLabel = .Pu) ∧
              pointOf rightLabel = opp2RightHit := by
        by_cases houter :
            opp2RightHit = S.oppositeVertexByIndex S.surplusIdx
        · exact ⟨.u, Or.inl rfl, by
            simp [pointOf, rightPinnedLabelPoint, houter]⟩
        · have hrightI :
              opp2RightHit ∈ S.oppInterior1 := by
            have hraw :=
              S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
                S.oppIndex2 hopp2RadiusPos hopp2RightT hopp2RightCap
                (by
                  intro h
                  exact houter (by
                    simpa [
                      S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
                      using h))
            simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1]
              using hraw
          have hpairMem : opp2RightHit ∈ ({p₁, p₂} : Finset ℝ²) := by
            simpa [hpairP] using hrightI
          simp only [Finset.mem_insert, Finset.mem_singleton] at hpairMem
          rcases hpairMem with hrightEq | hrightEq
          · exact ⟨.Pw, Or.inr (Or.inl rfl), by
              simp [pointOf, rightPinnedLabelPoint, hrightEq]⟩
          · exact ⟨.Pu, Or.inr (Or.inr rfl), by
              simp [pointOf, rightPinnedLabelPoint, hrightEq]⟩
      rcases hleftLabel with ⟨leftLabel, hleftCases, hleftPoint⟩
      rcases hrightLabel with ⟨rightLabel, hrightCases, hrightPoint⟩
      have hWcenterClass :
          centerClass .w =
            ({pointOf .Q1, pointOf .Q2, pointOf leftLabel,
              pointOf rightLabel} : Finset ℝ²) := by
        rw [hWselectedClass]
        simpa [pointOf, rightPinnedLabelPoint, hleftPoint, hrightPoint]
          using hWclassGeom
      have hWcandidate :
          pointMask pointOf (centerClass .w) ∈ candidateMasks sstar .w :=
        wSelectorClass_mem_candidateMasks hinj hsstar hleftCases hrightCases
          hWcenterClass
      have hcandidate : ∀ center : Label,
          pointMask pointOf (centerClass center) ∈
            candidateMasks sstar center := by
        intro center
        by_cases hv : center = .v
        · subst center
          exact mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf hsstar (by
            rw [hVcenterClass]
            simpa [pointOf, rightPinnedLabelPoint] using
              pinnedRightSurplusResidual_pointMask_eq_pinnedMaskOf_of_pair
                S hpinned hxSurplus hinj hpairP hsstar hsstar_eq)
        · by_cases hw : center = .w
          · subst center
            exact hWcandidate
          · exact hNonVcandidate center hv hw
      have hsearchSep : ∀ c cp : Label, (c, cp) ∈ orderedLabelPairs →
          crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
            (pointMask pointOf (centerClass cp)) = true := by
        intro c cp hpair
        exact hsearchSepOfSameRadius hinj hsame c cp hpair
      have hsep : ∀ c cp a b : Label, (c, cp) ∈ labelPairs →
          (a, b) ∈ labelPairs →
            sepOKFor (shadowOfPointClasses pointOf centerClass) c cp a b =
              true := by
        intro c cp a b hcenterPair hab
        exact sepOKFor_of_crossSeparationOKForMasks
          (hsearchSep c cp (labelPairs_mem_orderedLabelPairs hcenterPair)) hab
      have hvalid :
          isValidPinnedFragment sstar
            (shadowOfPointClasses pointOf centerClass) = true := by
        exact isValidPinnedFragment_shadowOfPointClasses_of_candidate_lists
          hsstar hcandidate hno3 hcounts hsep hsearchSep
      refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar, ?_, ?_⟩
      · simpa [pointOf] using hvalid
      · simpa [pointOf] using hmetric
    rcases hapexOrder with hrightOrder | hleftOrder
    · rcases hrightOrder with ⟨h0v, hvw⟩
      rcases exists_rightPinnedHullOrderLabels_of_apex_order
          (A := A) (S := S) (x := x)
          (T := ({t1, t2, t3} : Finset ℝ²)) (n := n) (φ := φ)
          (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv hw
          h0v hvw hM44 hxTripleT hTcard htSub with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hqpair,
          hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
          hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
      have hopp2LeftAlt :
          opp2LeftHit = S.oppositeVertexByIndex S.oppIndex1 ∨
            opp2LeftHit ∈ ({s1, s2, s3} : Finset ℝ²) := by
        rcases hopp2LeftAltT with houter | htrip
        · exact Or.inl houter
        · exact Or.inr (by simpa [hTeq] using htrip)
      exact produceRight p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpairP hq12 hqpair
        hs12 hs13 hs23 hsSub hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
        hxTriple hopp2LeftAlt (by
          intro centerClass hinj hsame c cp hpair
          exact crossSeparationOKForMasks_of_sameRadius_ccwHull
            (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass := centerClass)
            (isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder)
            hinj (orderedLabelPairs_ne_local hpair) (hsame c) (hsame cp))
    · rcases hleftOrder with ⟨h0w, hwv⟩
      rcases exists_leftPinnedHullOrderLabels_of_apex_order
          (A := A) (S := S) (x := x)
          (T := ({t1, t2, t3} : Finset ℝ²)) (n := n) (φ := φ)
          (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv hw
          h0w hwv hM44 hxTripleT hTcard htSub with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hqpair,
          hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
          hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
      have hpairP_rev :
          S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
        rw [hpairP]
        ext z
        simp [or_comm]
      have hqpair_rev :
          S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
        rw [hqpair]
        ext z
        simp [or_comm]
      have hsSub_rev :
          ({s3, s2, s1} : Finset ℝ²) ⊆
            S.capInteriorByIndex S.surplusIdx := by
        intro z hz
        exact hsSub (by
          simpa [or_comm, or_left_comm, or_assoc] using hz)
      have hxTriple_rev : x ∈ ({s3, s2, s1} : Finset ℝ²) := by
        simpa [or_comm, or_left_comm, or_assoc] using hxTriple
      have hopp2LeftAltT_rev :
          opp2LeftHit = S.oppositeVertexByIndex S.oppIndex1 ∨
            opp2LeftHit ∈ ({s3, s2, s1} : Finset ℝ²) := by
        rcases hopp2LeftAltT with houter | htrip
        · exact Or.inl houter
        · have htrip' : opp2LeftHit ∈ ({s1, s2, s3} : Finset ℝ²) := by
            simpa [hTeq] using htrip
          exact Or.inr (by
            simpa [or_comm, or_left_comm, or_assoc] using htrip')
      have hccwReflected :
          EuclideanGeometry.IsCcwConvexPolygon
            (fun i : Fin 10 =>
              rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1
                (reflectedHullLabel (labelOfHullFin i))) := by
        have hccwLeft :
            EuclideanGeometry.IsCcwConvexPolygon
              (fun i : Fin 10 =>
                leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3
                  (labelOfHullFin i)) :=
          isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
        convert hccwLeft using 2
        rename_i i
        fin_cases i <;> rfl
      exact produceRight p₂ p₁ q₂ q₁ s3 s2 s1 hp12.symm hpairP_rev
        hq12.symm hqpair_rev hs23.symm hs13.symm hs12.symm hsSub_rev
        hp₂I hp₁I hq₂I hq₁I hs3I hs2I hs1I hxTriple_rev
        hopp2LeftAltT_rev (by
          intro centerClass hinj hsame c cp hpair
          exact crossSeparationOKForMasks_of_sameRadius_reflectedCcwHull
            (pointOf := rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1)
            (centerClass := centerClass)
            hccwReflected hinj (orderedLabelPairs_ne_local hpair)
            (hsame c) (hsame cp))
  · intro radius x hpinned
    classical
    have hxSurplus := S.pinnedLeftSurplusResidual_mem_left_surplus hpinned
    have hxSurplusInterior :
        x ∈ S.capInteriorByIndex S.surplusIdx :=
      S.mem_surplusInterior_of_oppIndex2_left_surplus
        (S.pinnedLeftSurplusResidual_radius_pos hpinned)
        (S.pinnedLeftSurplusResidual_mem_selectedClass hpinned)
        hxSurplus
    have hopp1LeftT :
        opp1LeftHit ∈
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex1)
            opp1Radius := by
      have hmem :
          opp1LeftHit ∈
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex1)
                opp1Radius ∩
              S.leftAdjacentCapByIndex S.oppIndex1 := by
        rw [hopp1LeftSingleton]
        simp
      exact (Finset.mem_inter.mp hmem).1
    have hopp1RightT :
        opp1RightHit ∈
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex1)
            opp1Radius := by
      have hmem :
          opp1RightHit ∈
            SelectedClass A (S.oppositeVertexByIndex S.oppIndex1)
                opp1Radius ∩
              S.rightAdjacentCapByIndex S.oppIndex1 := by
        rw [hopp1RightSingleton]
        simp
      exact (Finset.mem_inter.mp hmem).1
    let R : Finset ℝ² :=
      ({x, opp1RightHit} : Finset ℝ²).filter
        (fun z => z ∈ S.capInteriorByIndex S.surplusIdx)
    have hRsub : R ⊆ S.capInteriorByIndex S.surplusIdx := by
      intro z hz
      exact (Finset.mem_filter.mp hz).2
    have hRcard : R.card ≤ 3 := by
      have hleFilter : R.card ≤ ({x, opp1RightHit} : Finset ℝ²).card :=
        Finset.card_filter_le _ _
      have hlePair : ({x, opp1RightHit} : Finset ℝ²).card ≤ 2 :=
        Finset.card_le_two
      omega
    rcases EndpointCertificate.exists_surplusInterior_triple_covering
        hM44 hRsub hRcard with
      ⟨t1, t2, t3, hRtrip, ht12, ht13, ht23, htSub⟩
    have hxR : x ∈ R := by
      simp [R, hxSurplusInterior]
    have hxTripleT : x ∈ ({t1, t2, t3} : Finset ℝ²) := hRtrip hxR
    have hopp1RightAltT :
        opp1RightHit = S.oppositeVertexByIndex S.oppIndex2 ∨
          opp1RightHit ∈ ({t1, t2, t3} : Finset ℝ²) := by
      by_cases houter :
          opp1RightHit = S.oppositeVertexByIndex S.oppIndex2
      · exact Or.inl houter
      · have hrightI :
            opp1RightHit ∈ S.capInteriorByIndex S.surplusIdx := by
          have hraw :=
            S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
              S.oppIndex1 hopp1RadiusPos hopp1RightT hopp1RightCap
              (by
                intro h
                exact houter (by
                  simpa [
                    S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
                    using h))
          simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
            using hraw
        have hrightR : opp1RightHit ∈ R := by
          simp [R, hrightI]
        exact Or.inr (hRtrip hrightR)
    have hTcard : ({t1, t2, t3} : Finset ℝ²).card = 3 := by
      simp [ht12, ht13, ht23]
    have produceLeft :
        ∀ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
          p₁ ≠ p₂ → S.oppInterior2 = ({p₁, p₂} : Finset ℝ²) →
          q₁ ≠ q₂ → S.oppInterior1 = ({q₁, q₂} : Finset ℝ²) →
          s1 ≠ s2 → s1 ≠ s3 → s2 ≠ s3 →
          ({s1, s2, s3} : Finset ℝ²) ⊆
            S.capInteriorByIndex S.surplusIdx →
          p₁ ∈ S.capInteriorByIndex S.oppIndex2 →
          p₂ ∈ S.capInteriorByIndex S.oppIndex2 →
          q₁ ∈ S.capInteriorByIndex S.oppIndex1 →
          q₂ ∈ S.capInteriorByIndex S.oppIndex1 →
          s1 ∈ S.capInteriorByIndex S.surplusIdx →
          s2 ∈ S.capInteriorByIndex S.surplusIdx →
          s3 ∈ S.capInteriorByIndex S.surplusIdx →
          x ∈ ({s1, s2, s3} : Finset ℝ²) →
          (opp1RightHit = S.oppositeVertexByIndex S.oppIndex2 ∨
            opp1RightHit ∈ ({s1, s2, s3} : Finset ℝ²)) →
          (∀ {centerClass : Label → Finset ℝ²},
            Function.Injective
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) →
            (∀ center a b : Label,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 a ∈
                  centerClass center →
                leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 b ∈
                  centerClass center →
                  dist
                      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
                      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 a) =
                    dist
                      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 center)
                      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 b)) →
            ∀ c cp : Label, (c, cp) ∈ orderedLabelPairs →
              crossSeparationOKForMasks c
                  (pointMask
                    (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                    (centerClass c))
                  cp
                  (pointMask
                    (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                    (centerClass cp)) = true) →
          LeftPinnedSurplusMetricShadowData S radius x := by
      intro p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpairP hq12 hqpair
        hs12 hs13 hs23 hsSub hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
        hxTriple hopp1RightAlt hsearchSepOfSameRadius
      let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      have hinj : Function.Injective pointOf :=
        leftPinnedLabelPoint_injective_of_mem S
          hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13
          hs23
      have hpointA : ∀ center : Label, pointOf center ∈ A :=
        leftPinnedLabelPoint_mem_of_mem S
          hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I
      rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
          S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
        ⟨sstar, hsstar, hsstar_eq⟩
      rcases hnonVShape.2 hpinned p₁ p₂ q₁ q₂ s1 s2 s3 hp12 hpairP
          hq12 hqpair hs12 hs13 hs23 hsSub hp₁I hp₂I hq₁I hq₂I
          hs1I hs2I hs3I hxTriple
          (sstar := sstar) (wRadius := opp1Radius) hsstar hsstar_eq with
        ⟨supportClass, hsupport⟩
      let centerClass :=
        pinnedSurplusCenterClass A pointOf radius opp1Radius supportClass
      have hVcenterClass :
          centerClass .v = SelectedClass A (pointOf .v) radius := rfl
      have hWselectedClass :
          centerClass .w = SelectedClass A (pointOf .w) opp1Radius := rfl
      rcases hsupport with ⟨hNonfixedSame, hNonVcandidate⟩
      have hsame : SameRadiusPointClasses pointOf centerClass :=
        sameRadiusPointClasses_of_exact_vw_and_nonfixed
          (A := A) hVcenterClass hWselectedClass hNonfixedSame
      have hmetric :
          EndpointCertificate.Variables.EndpointMetricShadow pointOf
            (shadowOfPointClasses pointOf centerClass) :=
        endpointMetricShadow_shadowOfPointClasses_of_sameRadius hinj
          (fun {center a b} ha hb => hsame center a b ha hb)
      have hno3 :
          noThreeOK (shadowOfPointClasses pointOf centerClass) = true :=
        noThreeOK_shadowOfPointClasses_of_sameRadius hconv hinj hpointA
          hsame
      have hcounts :
          PrefixPairCountsOK (shadowOfPointClasses pointOf centerClass) :=
        prefixPairCountsOK_shadowOfPointClasses_of_sameRadius hconv hinj
          hpointA hsame
      have hWclassGeom :
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) opp1Radius =
            ({q₁, q₂, opp1LeftHit, opp1RightHit} : Finset ℝ²) := by
        have hqpairCap :
            S.capInteriorByIndex S.oppIndex1 =
              ({q₁, q₂} : Finset ℝ²) := by
          simpa [SurplusCapPacket.oppInterior1] using hqpair
        exact selectedClass_eq_pair_left_right_singletons
          S S.oppIndex1 hopp1RadiusPos hqpairCap hopp1InteriorSub
          hopp1LeftSingleton hopp1RightSingleton
      have hWclassGeomSwap :
          SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) opp1Radius =
            ({q₁, q₂, opp1RightHit, opp1LeftHit} : Finset ℝ²) := by
        rw [hWclassGeom]
        ext z
        simp only [Finset.mem_insert, Finset.mem_singleton]
        constructor
        · intro hz
          rcases hz with hz | hz | hz | hz
          · exact Or.inl hz
          · exact Or.inr (Or.inl hz)
          · exact Or.inr (Or.inr (Or.inr hz))
          · exact Or.inr (Or.inr (Or.inl hz))
        · intro hz
          rcases hz with hz | hz | hz | hz
          · exact Or.inl hz
          · exact Or.inr (Or.inl hz)
          · exact Or.inr (Or.inr (Or.inr hz))
          · exact Or.inr (Or.inr (Or.inl hz))
      have hleftLabel :
          ∃ leftLabel : Label,
            (leftLabel = .v ∨ leftLabel = .s1 ∨ leftLabel = .s2 ∨
              leftLabel = .s3) ∧
              pointOf leftLabel = opp1RightHit := by
        rcases hopp1RightAlt with houter | htriple
        · exact ⟨.v, Or.inl rfl, by
            simp [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
              leftPinnedToRightLabel, houter]⟩
        · rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
            S p₁ p₂ q₁ q₂ s1 s2 s3 htriple with
            ⟨leftLabel, hleftStar, hleftEq⟩
          exact ⟨leftLabel,
            Or.inr (surplusStar_eq_s1_or_s2_or_s3 hleftStar), by
              simpa [pointOf] using hleftEq⟩
      have hrightLabel :
          ∃ rightLabel : Label,
            (rightLabel = .u ∨ rightLabel = .Pw ∨ rightLabel = .Pu) ∧
              pointOf rightLabel = opp1LeftHit := by
        by_cases houter :
            opp1LeftHit = S.oppositeVertexByIndex S.surplusIdx
        · exact ⟨.u, Or.inl rfl, by
            simp [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
              leftPinnedToRightLabel, houter]⟩
        · have hleftI :
              opp1LeftHit ∈ S.oppInterior2 := by
            have hraw :=
              S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
                S.oppIndex1 hopp1RadiusPos hopp1LeftT hopp1LeftCap
                (by
                  intro h
                  exact houter (by
                    simpa [
                      S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
                      using h))
            simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2]
              using hraw
          have hpairMem : opp1LeftHit ∈ ({p₁, p₂} : Finset ℝ²) := by
            simpa [hpairP] using hleftI
          simp only [Finset.mem_insert, Finset.mem_singleton] at hpairMem
          rcases hpairMem with hrightEq | hrightEq
          · exact ⟨.Pw, Or.inr (Or.inl rfl), by
              simp [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
                leftPinnedToRightLabel, hrightEq]⟩
          · exact ⟨.Pu, Or.inr (Or.inr rfl), by
              simp [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
                leftPinnedToRightLabel, hrightEq]⟩
      rcases hleftLabel with ⟨leftLabel, hleftCases, hleftPoint⟩
      rcases hrightLabel with ⟨rightLabel, hrightCases, hrightPoint⟩
      have hWcenterClass :
          centerClass .w =
            ({pointOf .Q1, pointOf .Q2, pointOf leftLabel,
              pointOf rightLabel} : Finset ℝ²) := by
        rw [hWselectedClass]
        simpa [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
          leftPinnedToRightLabel, hleftPoint, hrightPoint]
          using hWclassGeomSwap
      have hWcandidate :
          pointMask pointOf (centerClass .w) ∈ candidateMasks sstar .w :=
        wSelectorClass_mem_candidateMasks hinj hsstar hleftCases hrightCases
          hWcenterClass
      have hcandidate : ∀ center : Label,
          pointMask pointOf (centerClass center) ∈
            candidateMasks sstar center := by
        intro center
        by_cases hv : center = .v
        · subst center
          exact mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf hsstar (by
            rw [hVcenterClass]
            simpa [pointOf, leftPinnedLabelPoint, rightPinnedLabelPoint,
              leftPinnedToRightLabel] using
              pinnedLeftSurplusResidual_pointMask_eq_pinnedMaskOf_of_pair
                S hpinned hxSurplus hinj hpairP hsstar hsstar_eq)
        · by_cases hw : center = .w
          · subst center
            exact hWcandidate
          · exact hNonVcandidate center hv hw
      have hsearchSep : ∀ c cp : Label, (c, cp) ∈ orderedLabelPairs →
          crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
            (pointMask pointOf (centerClass cp)) = true := by
        intro c cp hpair
        exact hsearchSepOfSameRadius hinj hsame c cp hpair
      have hsep : ∀ c cp a b : Label, (c, cp) ∈ labelPairs →
          (a, b) ∈ labelPairs →
            sepOKFor (shadowOfPointClasses pointOf centerClass) c cp a b =
              true := by
        intro c cp a b hcenterPair hab
        exact sepOKFor_of_crossSeparationOKForMasks
          (hsearchSep c cp (labelPairs_mem_orderedLabelPairs hcenterPair)) hab
      have hvalid :
          isValidPinnedFragment sstar
            (shadowOfPointClasses pointOf centerClass) = true := by
        exact isValidPinnedFragment_shadowOfPointClasses_of_candidate_lists
          hsstar hcandidate hno3 hcounts hsep hsearchSep
      refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar, ?_, ?_⟩
      · simpa [pointOf] using hvalid
      · simpa [pointOf] using hmetric
    rcases hapexOrder with hrightOrder | hleftOrder
    · rcases hrightOrder with ⟨h0v, hvw⟩
      rcases exists_rightPinnedHullOrderLabels_of_apex_order
          (A := A) (S := S) (x := x)
          (T := ({t1, t2, t3} : Finset ℝ²)) (n := n) (φ := φ)
          (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv hw
          h0v hvw hM44 hxTripleT hTcard htSub with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hqpair,
          hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
          hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
      have hpairP_rev :
          S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
        rw [hpairP]
        ext z
        simp [or_comm]
      have hqpair_rev :
          S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
        rw [hqpair]
        ext z
        simp [or_comm]
      have hsSub_rev :
          ({s3, s2, s1} : Finset ℝ²) ⊆
            S.capInteriorByIndex S.surplusIdx := by
        intro z hz
        exact hsSub (by
          simpa [or_comm, or_left_comm, or_assoc] using hz)
      have hxTriple_rev : x ∈ ({s3, s2, s1} : Finset ℝ²) := by
        simpa [or_comm, or_left_comm, or_assoc] using hxTriple
      have hopp1RightAltT_rev :
          opp1RightHit = S.oppositeVertexByIndex S.oppIndex2 ∨
            opp1RightHit ∈ ({s3, s2, s1} : Finset ℝ²) := by
        rcases hopp1RightAltT with houter | htrip
        · exact Or.inl houter
        · have htrip' : opp1RightHit ∈ ({s1, s2, s3} : Finset ℝ²) := by
            simpa [hTeq] using htrip
          exact Or.inr (by
            simpa [or_comm, or_left_comm, or_assoc] using htrip')
      have hccwReflected :
          EuclideanGeometry.IsCcwConvexPolygon
            (fun i : Fin 10 =>
              leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1
                (reflectedHullLabel (labelOfHullFin i))) := by
        have hccwRight :
            EuclideanGeometry.IsCcwConvexPolygon
              (fun i : Fin 10 =>
                rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
                  (labelOfHullFin i)) :=
          isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
        convert hccwRight using 2
        rename_i i
        fin_cases i <;> rfl
      exact produceLeft q₂ q₁ p₂ p₁ s3 s2 s1 hq12.symm hqpair_rev
        hp12.symm hpairP_rev hs23.symm hs13.symm hs12.symm hsSub_rev
        hq₂I hq₁I hp₂I hp₁I hs3I hs2I hs1I hxTriple_rev
        hopp1RightAltT_rev (by
          intro centerClass hinj hsame c cp hpair
          exact crossSeparationOKForMasks_of_sameRadius_reflectedCcwHull
            (pointOf := leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1)
            (centerClass := centerClass)
            hccwReflected hinj (orderedLabelPairs_ne_local hpair)
            (hsame c) (hsame cp))
    · rcases hleftOrder with ⟨h0w, hwv⟩
      rcases exists_leftPinnedHullOrderLabels_of_apex_order
          (A := A) (S := S) (x := x)
          (T := ({t1, t2, t3} : Finset ℝ²)) (n := n) (φ := φ)
          (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv hw
          h0w hwv hM44 hxTripleT hTcard htSub with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpairP, hq12, hqpair,
          hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
          hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
      have hopp1RightAlt :
          opp1RightHit = S.oppositeVertexByIndex S.oppIndex2 ∨
            opp1RightHit ∈ ({s1, s2, s3} : Finset ℝ²) := by
        rcases hopp1RightAltT with houter | htrip
        · exact Or.inl houter
        · exact Or.inr (by simpa [hTeq] using htrip)
      exact produceLeft q₁ q₂ p₁ p₂ s1 s2 s3 hq12 hqpair hp12 hpairP
        hs12 hs13 hs23 hsSub hq₁I hq₂I hp₁I hp₂I hs1I hs2I hs3I
        hxTriple hopp1RightAlt (by
          intro centerClass hinj hsame c cp hpair
          exact crossSeparationOKForMasks_of_sameRadius_ccwHull
            (pointOf := leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3)
            (centerClass := centerClass)
            (isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder)
            hinj (orderedLabelPairs_ne_local hpair) (hsame c) (hsame cp))

end Problem97
