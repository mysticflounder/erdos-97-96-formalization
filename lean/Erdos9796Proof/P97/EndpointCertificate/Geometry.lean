/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowBank
import Erdos9796Proof.P97.SurplusM44Packet

/-!
# Geometry bridge for endpoint certificates

This module contains hand-written bridge lemmas from the `SurplusCapPacket`
endpoint residual predicates to the finite endpoint fragment vocabulary.  The
generated certificate rows live under `EndpointCertificate.Patterns`; this file
only proves geometric shape facts used before selecting a certificate row.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace EndpointCertificate

/-- Geometric interpretation of the ten endpoint-fragment labels in the
left-oriented convention used by the finite endpoint bank. -/
def endpointLabelPoint
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) :
    ShadowBank.Label → ℝ²
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

/-- Geometric interpretation of the ten endpoint-fragment labels in the mirror
orientation used for right endpoint residuals. -/
def endpointMirrorLabelPoint
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) :
    ShadowBank.Label → ℝ²
  | .u => S.oppositeVertexByIndex S.surplusIdx
  | .v => S.oppositeVertexByIndex S.oppIndex2
  | .w => S.oppositeVertexByIndex S.oppIndex1
  | .s1 => s1
  | .s2 => s2
  | .s3 => s3
  | .Pw => q₁
  | .Pu => q₂
  | .Q1 => p₁
  | .Q2 => p₂

/-- Labels allowed for the escape point in the endpoint fragment. -/
def IsEndpointEscapeeLabel (label : ShadowBank.Label) : Prop :=
  label = .Q1 ∨ label = .Q2

/-- Labels allowed for the surplus-side hit in the `.v` endpoint class. -/
def IsEndpointVSurplusHitLabel (label : ShadowBank.Label) : Prop :=
  label = .w ∨ label = .s1 ∨ label = .s2 ∨ label = .s3

/-- Labels allowed for the surplus-side hit in the `.w` endpoint class. -/
def IsEndpointWSurplusHitLabel (label : ShadowBank.Label) : Prop :=
  label = .v ∨ label = .s1 ∨ label = .s2 ∨ label = .s3

/-- The finite incidence mask induced by a geometric selected class and the
endpoint-fragment label map. -/
def endpointPointMask {α : Type _} [DecidableEq α]
    (pointOf : ShadowBank.Label → α) (T : Finset α) : Nat :=
  SurplusCOMPGBank.allLabels.foldl
    (fun acc label => if pointOf label ∈ T then label.bit + acc else acc) 0

private theorem endpointPointMask_foldl_le_add_maskOfLabels
    {α : Type _} [DecidableEq α] (pointOf : ShadowBank.Label → α)
    (T : Finset α) (labels : List ShadowBank.Label) (acc : Nat) :
    labels.foldl
        (fun acc label => if pointOf label ∈ T then label.bit + acc else acc)
        acc ≤
      acc + SurplusCOMPGBank.maskOfLabels labels := by
  induction labels generalizing acc with
  | nil => simp [SurplusCOMPGBank.maskOfLabels]
  | cons label rest ih =>
      simp only [List.foldl_cons, SurplusCOMPGBank.maskOfLabels]
      by_cases h : pointOf label ∈ T
      · have hle := ih (label.bit + acc)
        simp [h]
        omega
      · have hle := ih acc
        simp [h]
        omega

private theorem endpointPointMask_foldl_preserve_bit_of_forall_lt
    {α : Type _} [DecidableEq α] (pointOf : ShadowBank.Label → α)
    (T : Finset α) (labels : List ShadowBank.Label) {k acc : Nat}
    (hlabels : ∀ label ∈ labels, k < label.index) :
    (labels.foldl
        (fun acc label => if pointOf label ∈ T then label.bit + acc else acc)
        acc).testBit k = acc.testBit k := by
  induction labels generalizing acc with
  | nil => rfl
  | cons label rest ih =>
      simp only [List.foldl_cons]
      have hlabel : k < label.index := hlabels label (by simp)
      have hrest : ∀ l ∈ rest, k < l.index := by
        intro l hl
        exact hlabels l (by simp [hl])
      by_cases hmem : pointOf label ∈ T
      · rw [ih hrest]
        simp [hmem]
        simpa [SurplusCOMPGBank.Label.bit] using
          (Nat.testBit_two_pow_add_gt hlabel acc)
      · rw [ih hrest]
        simp [hmem]

private theorem endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
    {α : Type _} [DecidableEq α]
    {pointOf : ShadowBank.Label → α} {T : Finset α}
    {pref suff : List ShadowBank.Label} {label : ShadowBank.Label}
    (hall : SurplusCOMPGBank.allLabels = pref ++ label :: suff)
    (hpref : SurplusCOMPGBank.maskOfLabels pref < 2 ^ label.index)
    (hsuff : ∀ member ∈ suff, label.index < member.index)
    (hnot : pointOf label ∉ T) :
    SurplusCOMPGBank.maskHas (endpointPointMask pointOf T) label = false := by
  unfold endpointPointMask SurplusCOMPGBank.maskHas
  rw [hall]
  rw [List.foldl_append, List.foldl_cons]
  rw [endpointPointMask_foldl_preserve_bit_of_forall_lt pointOf T suff hsuff]
  have hle := endpointPointMask_foldl_le_add_maskOfLabels pointOf T pref 0
  have hlt :
      pref.foldl
          (fun acc label => if pointOf label ∈ T then label.bit + acc else acc)
          0 <
        2 ^ label.index := by
    have hle' :
        pref.foldl
            (fun acc label => if pointOf label ∈ T then label.bit + acc else acc)
            0 ≤ SurplusCOMPGBank.maskOfLabels pref := by
      simpa using hle
    exact Nat.lt_of_le_of_lt hle' hpref
  simpa [hnot] using Nat.testBit_eq_false_of_lt hlt

/-- If a label's point is not in the geometric class, its endpoint point-mask bit
is false. -/
theorem endpointPointMask_maskHas_false_of_not_mem
    {α : Type _} [DecidableEq α]
    {pointOf : ShadowBank.Label → α} {T : Finset α}
    {label : ShadowBank.Label}
    (hnot : pointOf label ∉ T) :
    SurplusCOMPGBank.maskHas (endpointPointMask pointOf T) label = false := by
  cases label
  · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := []) (suff := [.v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u]) (suff := [.w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v]) (suff := [.s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w]) (suff := [.s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1]) (suff := [.s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2]) (suff := [.Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3]) (suff := [.Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw]) (suff := [.Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu]) (suff := [.Q2])
      rfl (by decide) (by decide) hnot
  · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1]) (suff := [])
      rfl (by decide) (by decide) hnot

/-- A true bit in an endpoint point mask comes from membership in the geometric
class used to build that mask. -/
theorem endpointPointMask_maskHas_mem
    {α : Type _} [DecidableEq α]
    {pointOf : ShadowBank.Label → α} {T : Finset α}
    {label : ShadowBank.Label}
    (hbit : SurplusCOMPGBank.maskHas (endpointPointMask pointOf T) label = true) :
    pointOf label ∈ T := by
  by_contra hnot
  have hfalse :
      SurplusCOMPGBank.maskHas (endpointPointMask pointOf T) label = false := by
    cases label
    · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
        (pref := []) (suff := [.v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
        rfl (by decide) (by decide) hnot
    · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
        (pref := [.u]) (suff := [.w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
        rfl (by decide) (by decide) hnot
    · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
        (pref := [.u, .v]) (suff := [.s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
        rfl (by decide) (by decide) hnot
    · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
        (pref := [.u, .v, .w]) (suff := [.s2, .s3, .Pw, .Pu, .Q1, .Q2])
        rfl (by decide) (by decide) hnot
    · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
        (pref := [.u, .v, .w, .s1]) (suff := [.s3, .Pw, .Pu, .Q1, .Q2])
        rfl (by decide) (by decide) hnot
    · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
        (pref := [.u, .v, .w, .s1, .s2]) (suff := [.Pw, .Pu, .Q1, .Q2])
        rfl (by decide) (by decide) hnot
    · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
        (pref := [.u, .v, .w, .s1, .s2, .s3]) (suff := [.Pu, .Q1, .Q2])
        rfl (by decide) (by decide) hnot
    · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
        (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw]) (suff := [.Q1, .Q2])
        rfl (by decide) (by decide) hnot
    · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
        (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu]) (suff := [.Q2])
        rfl (by decide) (by decide) hnot
    · exact endpointPointMask_maskHas_false_of_not_mem_of_prefix_suffix
        (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1]) (suff := [])
        rfl (by decide) (by decide) hnot
  rw [hfalse] at hbit
  contradiction

/-- A positive selected-class radius prevents a center label from appearing in
its own endpoint point mask. -/
theorem endpointPointMask_maskHas_self_false_of_selectedClass
    {A : Finset ℝ²}
    {pointOf : ShadowBank.Label → ℝ²}
    {centerClass : ShadowBank.Label → Finset ℝ²}
    {radiusOf : ShadowBank.Label → ℝ}
    {center : ShadowBank.Label}
    (hselected :
      centerClass center = SelectedClass A (pointOf center) (radiusOf center))
    (hradius : 0 < radiusOf center) :
    SurplusCOMPGBank.maskHas
      (endpointPointMask pointOf (centerClass center)) center = false := by
  apply endpointPointMask_maskHas_false_of_not_mem
  rw [hselected]
  intro hmem
  have hdist : dist (pointOf center) (pointOf center) = radiusOf center :=
    (mem_selectedClass.mp hmem).2
  rw [dist_self] at hdist
  exact hradius.ne' hdist.symm

private theorem not_both_mem_of_inter_card_le_one
    {α : Type _} [DecidableEq α] {T C : Finset α} {x y : α}
    (hxy : x ≠ y) (hxC : x ∈ C) (hyC : y ∈ C)
    (hcard : (T ∩ C).card ≤ 1) :
    ¬ (x ∈ T ∧ y ∈ T) := by
  intro hboth
  have hsub : ({x, y} : Finset α) ⊆ T ∩ C := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hboth.1, hxC⟩
    · exact Finset.mem_inter.mpr ⟨hboth.2, hyC⟩
  have hpaircard : ({x, y} : Finset α).card = 2 := by
    simp [hxy]
  have hle := Finset.card_le_card hsub
  omega

private theorem maskInterCard_cvNoUMask_le_one_of_no_pair_bits (mask : Nat)
    (hwPw : ¬ (SurplusCOMPGBank.maskHas mask .w = true ∧
      SurplusCOMPGBank.maskHas mask .Pw = true))
    (hwPu : ¬ (SurplusCOMPGBank.maskHas mask .w = true ∧
      SurplusCOMPGBank.maskHas mask .Pu = true))
    (hPwPu : ¬ (SurplusCOMPGBank.maskHas mask .Pw = true ∧
      SurplusCOMPGBank.maskHas mask .Pu = true)) :
    SurplusCOMPGBank.maskInterCard mask SurplusCOMPGBank.cvNoUMask <= 1 := by
  have h9 : Nat.testBit 196 9 = false := by decide
  have h8 : Nat.testBit 196 8 = false := by decide
  have h7 : Nat.testBit 196 7 = true := by decide
  have h6 : Nat.testBit 196 6 = true := by decide
  have h5 : Nat.testBit 196 5 = false := by decide
  have h4 : Nat.testBit 196 4 = false := by decide
  have h3 : Nat.testBit 196 3 = false := by decide
  have h2 : Nat.testBit 196 2 = true := by decide
  have h1 : Nat.testBit 196 1 = false := by decide
  have h0 : Nat.testBit 196 0 = false := by decide
  by_cases hw : mask.testBit 2 = true <;>
    by_cases hPw : mask.testBit 6 = true <;>
    by_cases hPu : mask.testBit 7 = true
  all_goals
    first
    | exact False.elim (hwPw ⟨by simpa [SurplusCOMPGBank.maskHas,
          SurplusCOMPGBank.Label.index] using hw,
        by simpa [SurplusCOMPGBank.maskHas, SurplusCOMPGBank.Label.index]
          using hPw⟩)
    | exact False.elim (hwPu ⟨by simpa [SurplusCOMPGBank.maskHas,
          SurplusCOMPGBank.Label.index] using hw,
        by simpa [SurplusCOMPGBank.maskHas, SurplusCOMPGBank.Label.index]
          using hPu⟩)
    | exact False.elim (hPwPu ⟨by simpa [SurplusCOMPGBank.maskHas,
          SurplusCOMPGBank.Label.index] using hPw,
        by simpa [SurplusCOMPGBank.maskHas, SurplusCOMPGBank.Label.index]
          using hPu⟩)
    | simp [SurplusCOMPGBank.maskInterCard, SurplusCOMPGBank.cvNoUMask,
        SurplusCOMPGBank.maskOfLabels, SurplusCOMPGBank.maskHas,
        SurplusCOMPGBank.allLabels, SurplusCOMPGBank.Label.bit,
        SurplusCOMPGBank.Label.index, h9, h8, h7, h6, h5, h4, h3, h2,
        h1, h0, hw, hPw, hPu]

private theorem maskInterCard_cwNoUMask_le_one_of_no_pair_bits (mask : Nat)
    (hvQ1 : ¬ (SurplusCOMPGBank.maskHas mask .v = true ∧
      SurplusCOMPGBank.maskHas mask .Q1 = true))
    (hvQ2 : ¬ (SurplusCOMPGBank.maskHas mask .v = true ∧
      SurplusCOMPGBank.maskHas mask .Q2 = true))
    (hQ1Q2 : ¬ (SurplusCOMPGBank.maskHas mask .Q1 = true ∧
      SurplusCOMPGBank.maskHas mask .Q2 = true)) :
    SurplusCOMPGBank.maskInterCard mask SurplusCOMPGBank.cwNoUMask <= 1 := by
  have h9 : Nat.testBit 770 9 = true := by decide
  have h8 : Nat.testBit 770 8 = true := by decide
  have h7 : Nat.testBit 770 7 = false := by decide
  have h6 : Nat.testBit 770 6 = false := by decide
  have h5 : Nat.testBit 770 5 = false := by decide
  have h4 : Nat.testBit 770 4 = false := by decide
  have h3 : Nat.testBit 770 3 = false := by decide
  have h2 : Nat.testBit 770 2 = false := by decide
  have h1 : Nat.testBit 770 1 = true := by decide
  have h0 : Nat.testBit 770 0 = false := by decide
  by_cases hv : mask.testBit 1 = true <;>
    by_cases hQ1 : mask.testBit 8 = true <;>
    by_cases hQ2 : mask.testBit 9 = true
  all_goals
    first
    | exact False.elim (hvQ1 ⟨by simpa [SurplusCOMPGBank.maskHas,
          SurplusCOMPGBank.Label.index] using hv,
        by simpa [SurplusCOMPGBank.maskHas, SurplusCOMPGBank.Label.index]
          using hQ1⟩)
    | exact False.elim (hvQ2 ⟨by simpa [SurplusCOMPGBank.maskHas,
          SurplusCOMPGBank.Label.index] using hv,
        by simpa [SurplusCOMPGBank.maskHas, SurplusCOMPGBank.Label.index]
          using hQ2⟩)
    | exact False.elim (hQ1Q2 ⟨by simpa [SurplusCOMPGBank.maskHas,
          SurplusCOMPGBank.Label.index] using hQ1,
        by simpa [SurplusCOMPGBank.maskHas, SurplusCOMPGBank.Label.index]
          using hQ2⟩)
    | simp [SurplusCOMPGBank.maskInterCard, SurplusCOMPGBank.cwNoUMask,
        SurplusCOMPGBank.maskOfLabels, SurplusCOMPGBank.maskHas,
        SurplusCOMPGBank.allLabels, SurplusCOMPGBank.Label.bit,
        SurplusCOMPGBank.Label.index, h9, h8, h7, h6, h5, h4, h3, h2,
        h1, h0, hv, hQ1, hQ2]

/-- A geometric one-hit bound on the three `.v`-without-`.u` labels transfers
to the endpoint finite mask. -/
theorem endpointPointMask_cvNoUMask_le_one_of_inter_card
    {α : Type _} [DecidableEq α]
    {pointOf : ShadowBank.Label → α} {T C : Finset α}
    (hinj : Function.Injective pointOf)
    (hwC : pointOf .w ∈ C)
    (hPwC : pointOf .Pw ∈ C)
    (hPuC : pointOf .Pu ∈ C)
    (hcard : (T ∩ C).card ≤ 1) :
    SurplusCOMPGBank.maskInterCard (endpointPointMask pointOf T)
      SurplusCOMPGBank.cvNoUMask <= 1 := by
  have hnot_w_Pw : ¬ (pointOf .w ∈ T ∧ pointOf .Pw ∈ T) :=
    not_both_mem_of_inter_card_le_one
      (hinj.ne
        (by decide :
          (SurplusCOMPGBank.Label.w : SurplusCOMPGBank.Label) ≠ .Pw))
      hwC hPwC hcard
  have hnot_w_Pu : ¬ (pointOf .w ∈ T ∧ pointOf .Pu ∈ T) :=
    not_both_mem_of_inter_card_le_one
      (hinj.ne
        (by decide :
          (SurplusCOMPGBank.Label.w : SurplusCOMPGBank.Label) ≠ .Pu))
      hwC hPuC hcard
  have hnot_Pw_Pu : ¬ (pointOf .Pw ∈ T ∧ pointOf .Pu ∈ T) :=
    not_both_mem_of_inter_card_le_one
      (hinj.ne
        (by decide :
          (SurplusCOMPGBank.Label.Pw : SurplusCOMPGBank.Label) ≠ .Pu))
      hPwC hPuC hcard
  refine maskInterCard_cvNoUMask_le_one_of_no_pair_bits _ ?_ ?_ ?_
  · intro h
    exact hnot_w_Pw ⟨endpointPointMask_maskHas_mem h.1,
      endpointPointMask_maskHas_mem h.2⟩
  · intro h
    exact hnot_w_Pu ⟨endpointPointMask_maskHas_mem h.1,
      endpointPointMask_maskHas_mem h.2⟩
  · intro h
    exact hnot_Pw_Pu ⟨endpointPointMask_maskHas_mem h.1,
      endpointPointMask_maskHas_mem h.2⟩

/-- A geometric one-hit bound on the three `.w`-without-`.u` labels transfers
to the endpoint finite mask. -/
theorem endpointPointMask_cwNoUMask_le_one_of_inter_card
    {α : Type _} [DecidableEq α]
    {pointOf : ShadowBank.Label → α} {T C : Finset α}
    (hinj : Function.Injective pointOf)
    (hvC : pointOf .v ∈ C)
    (hQ1C : pointOf .Q1 ∈ C)
    (hQ2C : pointOf .Q2 ∈ C)
    (hcard : (T ∩ C).card ≤ 1) :
    SurplusCOMPGBank.maskInterCard (endpointPointMask pointOf T)
      SurplusCOMPGBank.cwNoUMask <= 1 := by
  have hnot_v_Q1 : ¬ (pointOf .v ∈ T ∧ pointOf .Q1 ∈ T) :=
    not_both_mem_of_inter_card_le_one
      (hinj.ne
        (by decide :
          (SurplusCOMPGBank.Label.v : SurplusCOMPGBank.Label) ≠ .Q1))
      hvC hQ1C hcard
  have hnot_v_Q2 : ¬ (pointOf .v ∈ T ∧ pointOf .Q2 ∈ T) :=
    not_both_mem_of_inter_card_le_one
      (hinj.ne
        (by decide :
          (SurplusCOMPGBank.Label.v : SurplusCOMPGBank.Label) ≠ .Q2))
      hvC hQ2C hcard
  have hnot_Q1_Q2 : ¬ (pointOf .Q1 ∈ T ∧ pointOf .Q2 ∈ T) :=
    not_both_mem_of_inter_card_le_one
      (hinj.ne
        (by decide :
          (SurplusCOMPGBank.Label.Q1 : SurplusCOMPGBank.Label) ≠ .Q2))
      hQ1C hQ2C hcard
  refine maskInterCard_cwNoUMask_le_one_of_no_pair_bits _ ?_ ?_ ?_
  · intro h
    exact hnot_v_Q1 ⟨endpointPointMask_maskHas_mem h.1,
      endpointPointMask_maskHas_mem h.2⟩
  · intro h
    exact hnot_v_Q2 ⟨endpointPointMask_maskHas_mem h.1,
      endpointPointMask_maskHas_mem h.2⟩
  · intro h
    exact hnot_Q1_Q2 ⟨endpointPointMask_maskHas_mem h.1,
      endpointPointMask_maskHas_mem h.2⟩

/-- The finite endpoint shadow induced by geometric point classes. -/
def endpointShadowOfPointClasses {α : Type _} [DecidableEq α]
    (pointOf : ShadowBank.Label → α)
    (centerClass : ShadowBank.Label → Finset α) :
    ShadowBank.Shadow :=
  { masks := SurplusCOMPGBank.allLabels.map
      (fun center => endpointPointMask pointOf (centerClass center)) }

theorem endpointShadowOfPointClasses_hasTenMasks
    {α : Type _} [DecidableEq α] (pointOf : ShadowBank.Label → α)
    (centerClass : ShadowBank.Label → Finset α) :
    (endpointShadowOfPointClasses pointOf centerClass).hasTenMasks = true := by
  simp [endpointShadowOfPointClasses, SurplusCOMPGBank.Shadow.hasTenMasks,
    SurplusCOMPGBank.allLabels, SurplusCOMPGBank.labelCount]

theorem endpointShadowOfPointClasses_centerMask
    {α : Type _} [DecidableEq α] (pointOf : ShadowBank.Label → α)
    (centerClass : ShadowBank.Label → Finset α) (center : ShadowBank.Label) :
    (endpointShadowOfPointClasses pointOf centerClass).centerMask center =
      endpointPointMask pointOf (centerClass center) := by
  cases center <;>
    simp [endpointShadowOfPointClasses, SurplusCOMPGBank.Shadow.centerMask,
      SurplusCOMPGBank.allLabels, SurplusCOMPGBank.Label.index]

private theorem allLabels_map_endpointLabelPoint
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) :
    SurplusCOMPGBank.allLabels.map
        (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) =
      [S.oppositeVertexByIndex S.surplusIdx,
        S.oppositeVertexByIndex S.oppIndex1,
        S.oppositeVertexByIndex S.oppIndex2,
        s1, s2, s3, p₁, p₂, q₁, q₂] := by
  rfl

private theorem allLabels_map_endpointMirrorLabelPoint
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) :
    SurplusCOMPGBank.allLabels.map
        (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) =
      [S.oppositeVertexByIndex S.surplusIdx,
        S.oppositeVertexByIndex S.oppIndex2,
        S.oppositeVertexByIndex S.oppIndex1,
        s1, s2, s3, q₁, q₂, p₁, p₂] := by
  rfl

private theorem endpointLabelPoint_pairwise_of_mem
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
      (SurplusCOMPGBank.allLabels.map
        (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)) := by
  rw [allLabels_map_endpointLabelPoint]
  exact S.pinnedSurplusTenLabels_pairwise_of_mem
    hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23

private theorem endpointMirrorLabelPoint_pairwise_of_mem
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
      (SurplusCOMPGBank.allLabels.map
        (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)) := by
  rw [allLabels_map_endpointMirrorLabelPoint]
  have hbase := S.pinnedSurplusTenLabels_pairwise_of_mem
    hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23
  simp at hbase ⊢
  aesop

private theorem injective_of_allLabels_map_pairwise
    {α : Type _} {pointOf : ShadowBank.Label → α}
    (hpair : List.Pairwise (fun x y : α => x ≠ y)
      (SurplusCOMPGBank.allLabels.map pointOf)) :
    Function.Injective pointOf := by
  intro a b hab
  simp [SurplusCOMPGBank.allLabels] at hpair
  cases a <;> cases b <;> simp at hab ⊢
  all_goals aesop

/-- The left-oriented endpoint label map is injective once the two non-surplus
interior pairs and surplus triple are chosen in their packet interiors. -/
theorem endpointLabelPoint_injective_of_mem
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
      (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) :=
  injective_of_allLabels_map_pairwise
    (endpointLabelPoint_pairwise_of_mem S
      hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23)

/-- The mirror endpoint label map is injective once the two non-surplus
interior pairs and surplus triple are chosen in their packet interiors. -/
theorem endpointMirrorLabelPoint_injective_of_mem
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
      (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) :=
  injective_of_allLabels_map_pairwise
    (endpointMirrorLabelPoint_pairwise_of_mem S
      hp₁I hp₂I hq₁I hq₂I hs1I hs2I hs3I hp12 hq12 hs12 hs13 hs23)

private theorem endpointPointMask_eq_maskOfLabels_v
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    (hinj : Function.Injective pointOf) {xLabel aLabel : ShadowBank.Label}
    (hx : IsEndpointEscapeeLabel xLabel)
    (ha : IsEndpointVSurplusHitLabel aLabel) :
    endpointPointMask pointOf
        ({pointOf .Pw, pointOf .Pu, pointOf xLabel, pointOf aLabel} :
          Finset α) =
      SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
  have hpoint_eq : ∀ a b : ShadowBank.Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  rcases hx with rfl | rfl <;>
    rcases ha with rfl | rfl | rfl | rfl <;>
      simp [endpointPointMask, SurplusCOMPGBank.allLabels,
        SurplusCOMPGBank.maskOfLabels, hpoint_eq,
        SurplusCOMPGBank.Label.bit, SurplusCOMPGBank.Label.index]

private theorem endpointPointMask_eq_maskOfLabels_w
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    (hinj : Function.Injective pointOf) {bLabel : ShadowBank.Label}
    (hb : IsEndpointWSurplusHitLabel bLabel) :
    endpointPointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf bLabel, pointOf .u} :
          Finset α) =
      SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
  have hpoint_eq : ∀ a b : ShadowBank.Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  rcases hb with rfl | rfl | rfl | rfl <;>
    simp [endpointPointMask, SurplusCOMPGBank.allLabels,
      SurplusCOMPGBank.maskOfLabels, hpoint_eq,
      SurplusCOMPGBank.Label.bit, SurplusCOMPGBank.Label.index]

/-- An exact `.v` point-mask supplies the endpoint `.v` Boolean shape check
for the induced shadow. -/
theorem endpointVShapeOK_shadowOfPointClasses_of_v_mask
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    {escapee aLabel : ShadowBank.Label}
    (hmask :
      endpointPointMask pointOf (centerClass .v) =
        SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, escapee, aLabel])
    (hescape : IsEndpointEscapeeLabel escapee)
    (ha : IsEndpointVSurplusHitLabel aLabel) :
    ShadowBank.endpointVShapeOK escapee
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
  rcases hescape with rfl | rfl <;>
    rcases ha with rfl | rfl | rfl | rfl <;>
      simp only [ShadowBank.endpointVShapeOK, ShadowBank.escapeeOK,
        ShadowBank.vCuHitMask, SurplusCOMPGBank.Shadow.classHas,
        endpointShadowOfPointClasses_centerMask, hmask,
        SurplusCOMPGBank.maskOfLabels, SurplusCOMPGBank.maskHas,
        SurplusCOMPGBank.maskInterCard, SurplusCOMPGBank.allLabels,
        SurplusCOMPGBank.Label.bit, SurplusCOMPGBank.Label.index,
        Bool.true_and] <;>
    decide

/-- An exact `.w` point-mask supplies the endpoint `.w` Boolean shape check
for the induced shadow. -/
theorem endpointWShapeOK_shadowOfPointClasses_of_w_mask
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    {bLabel : ShadowBank.Label}
    (hmask :
      endpointPointMask pointOf (centerClass .w) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u])
    (hb : IsEndpointWSurplusHitLabel bLabel) :
    ShadowBank.endpointWShapeOK
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
  rcases hb with rfl | rfl | rfl | rfl <;>
    simp only [ShadowBank.endpointWShapeOK, ShadowBank.wCuHitMask,
      SurplusCOMPGBank.Shadow.classHas,
      endpointShadowOfPointClasses_centerMask, hmask,
      SurplusCOMPGBank.maskOfLabels, SurplusCOMPGBank.maskHas,
      SurplusCOMPGBank.maskInterCard, SurplusCOMPGBank.allLabels,
      SurplusCOMPGBank.Label.bit, SurplusCOMPGBank.Label.index] <;>
    decide

/-- An endpoint `.v` mask has exactly four labeled members. -/
theorem endpointVMask_card_of_v_mask
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    {escapee aLabel : ShadowBank.Label}
    (hmask :
      endpointPointMask pointOf (centerClass .v) =
        SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, escapee, aLabel])
    (hescape : IsEndpointEscapeeLabel escapee)
    (ha : IsEndpointVSurplusHitLabel aLabel) :
    SurplusCOMPGBank.maskCard
      (endpointPointMask pointOf (centerClass .v)) = 4 := by
  rw [hmask]
  rcases hescape with rfl | rfl <;>
    rcases ha with rfl | rfl | rfl | rfl <;>
      decide

/-- An endpoint `.v` mask does not contain its own center label. -/
theorem endpointVMask_not_self_of_v_mask
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    {escapee aLabel : ShadowBank.Label}
    (hmask :
      endpointPointMask pointOf (centerClass .v) =
        SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, escapee, aLabel])
    (hescape : IsEndpointEscapeeLabel escapee)
    (ha : IsEndpointVSurplusHitLabel aLabel) :
    SurplusCOMPGBank.maskHas
      (endpointPointMask pointOf (centerClass .v)) .v = false := by
  rw [hmask]
  rcases hescape with rfl | rfl <;>
    rcases ha with rfl | rfl | rfl | rfl <;>
      decide

/-- An endpoint `.w` mask has exactly four labeled members. -/
theorem endpointWMask_card_of_w_mask
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    {bLabel : ShadowBank.Label}
    (hmask :
      endpointPointMask pointOf (centerClass .w) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u])
    (hb : IsEndpointWSurplusHitLabel bLabel) :
    SurplusCOMPGBank.maskCard
      (endpointPointMask pointOf (centerClass .w)) = 4 := by
  rw [hmask]
  rcases hb with rfl | rfl | rfl | rfl <;>
    decide

/-- An endpoint `.w` mask does not contain its own center label. -/
theorem endpointWMask_not_self_of_w_mask
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    {bLabel : ShadowBank.Label}
    (hmask :
      endpointPointMask pointOf (centerClass .w) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u])
    (hb : IsEndpointWSurplusHitLabel bLabel) :
    SurplusCOMPGBank.maskHas
      (endpointPointMask pointOf (centerClass .w)) .w = false := by
  rw [hmask]
  rcases hb with rfl | rfl | rfl | rfl <;>
    decide

/-- An endpoint `.w` mask meets the `.v`-without-`.w` one-hit mask in at most
one label. -/
theorem endpointWMask_cvNoW_le_one_of_w_mask
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    {bLabel : ShadowBank.Label}
    (hmask :
      endpointPointMask pointOf (centerClass .w) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u])
    (hb : IsEndpointWSurplusHitLabel bLabel) :
    SurplusCOMPGBank.maskInterCard
      (endpointPointMask pointOf (centerClass .w))
      SurplusCOMPGBank.cvNoWMask <= 1 := by
  rw [hmask]
  rcases hb with rfl | rfl | rfl | rfl <;>
    decide

/-- An endpoint `.w` mask meets the `.u`-without-`.w` one-hit mask in at most
one label. -/
theorem endpointWMask_cuNoW_le_one_of_w_mask
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    {bLabel : ShadowBank.Label}
    (hmask :
      endpointPointMask pointOf (centerClass .w) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u])
    (hb : IsEndpointWSurplusHitLabel bLabel) :
    SurplusCOMPGBank.maskInterCard
      (endpointPointMask pointOf (centerClass .w))
      SurplusCOMPGBank.cuNoWMask <= 1 := by
  rw [hmask]
  rcases hb with rfl | rfl | rfl | rfl <;>
    decide

/-- Component-wise generated Boolean facts for an induced endpoint shadow
assemble into the endpoint finite-bank predicate. -/
theorem endpointShadowOK_shadowOfPointClasses_of_components
    {α : Type _} [DecidableEq α] {pointOf : ShadowBank.Label → α}
    {centerClass : ShadowBank.Label → Finset α}
    {escapee : ShadowBank.Label}
    (hclasses :
      (endpointShadowOfPointClasses pointOf centerClass).classesShapeOK = true)
    (hv :
      ShadowBank.endpointVShapeOK escapee
        (endpointShadowOfPointClasses pointOf centerClass) = true)
    (hw :
      ShadowBank.endpointWShapeOK
        (endpointShadowOfPointClasses pointOf centerClass) = true)
    (hone :
      SurplusCOMPGBank.oneHitOK
        (endpointShadowOfPointClasses pointOf centerClass) = true)
    (hcirc :
      SurplusCOMPGBank.circumcenterOK
        (endpointShadowOfPointClasses pointOf centerClass) = true)
    (hno3 :
      SurplusCOMPGBank.noThreeOK
        (endpointShadowOfPointClasses pointOf centerClass) = true)
    (hcounts :
      SurplusCOMPGBank.searchPairCountsOK
        (endpointShadowOfPointClasses pointOf centerClass) = true)
    (hsep :
      SurplusCOMPGBank.separationOK
        (endpointShadowOfPointClasses pointOf centerClass) = true)
    (hsearchSep :
      SurplusCOMPGBank.searchSeparationOK
        (endpointShadowOfPointClasses pointOf centerClass) = true) :
    ShadowBank.endpointShadowOK escapee
      (endpointShadowOfPointClasses pointOf centerClass) = true := by
  simp [ShadowBank.endpointShadowOK,
    endpointShadowOfPointClasses_hasTenMasks, hclasses, hv, hw, hone, hcirc,
    hno3, hcounts, hsep, hsearchSep]

private theorem selectedClass_eq_pair_left_right_singletons
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {p₁ p₂ leftHit rightHit : ℝ²}
    (hradius : 0 < radius)
    (hpair : S.capInteriorByIndex i = ({p₁, p₂} : Finset ℝ²))
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
      ({p₁, p₂, leftHit, rightHit} : Finset ℝ²) := by
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
    · have hzPair : z ∈ ({p₁, p₂} : Finset ℝ²) := by
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

/-- Any surplus-interior subset of size at most three can be promoted to the
three surplus labels used by the endpoint finite fragment. -/
theorem exists_surplusInterior_triple_covering
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {R : Finset ℝ²}
    (hRsub : R ⊆ S.capInteriorByIndex S.surplusIdx)
    (hRcard : R.card ≤ 3) :
    ∃ s1 s2 s3 : ℝ²,
      R ⊆ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  classical
  rcases Finset.exists_subsuperset_card_eq
      (s := R) (t := S.capInteriorByIndex S.surplusIdx) (n := 3)
      hRsub hRcard hM44.surplusInterior_card_ge_three with
    ⟨T, hRT, hTsub, hTcard⟩
  rw [Finset.card_eq_three] at hTcard
  rcases hTcard with ⟨s1, s2, s3, hs12, hs13, hs23, hT_eq⟩
  exact ⟨s1, s2, s3, by
      intro x hx
      simpa [hT_eq] using hRT hx,
    hs12, hs13, hs23, by
      rw [← hT_eq]
      exact hTsub⟩

/-- Two named surplus-interior points can be included simultaneously in the
three surplus labels used by the endpoint fragment. -/
theorem exists_surplusInterior_triple_covering_pair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x y : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hy : y ∈ S.capInteriorByIndex S.surplusIdx) :
    ∃ s1 s2 s3 : ℝ²,
      x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      y ∈ ({s1, s2, s3} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
  classical
  have hpairSub :
      ({x, y} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hx
    · exact hy
  have hpairCard : ({x, y} : Finset ℝ²).card ≤ 3 := by
    have hle : ({x, y} : Finset ℝ²).card ≤ 2 := Finset.card_le_two
    omega
  rcases exists_surplusInterior_triple_covering hM44 hpairSub hpairCard with
    ⟨s1, s2, s3, hpairT, hs12, hs13, hs23, hTsub⟩
  exact ⟨s1, s2, s3, hpairT (by simp), hpairT (by simp),
    hs12, hs13, hs23, hTsub⟩

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

private theorem exists_mirrorEscapeeLabel_eq_of_mem_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²)
    (hx : x ∈ ({p₁, p₂} : Finset ℝ²)) :
    ∃ label : ShadowBank.Label,
      IsEndpointEscapeeLabel label ∧
        endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label = x := by
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

private theorem exists_mirrorVSurplusHitLabel_eq_of_mem_triple_or_w
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 a : ℝ²)
    (ha : a = S.oppositeVertexByIndex S.oppIndex1 ∨
      a ∈ ({s1, s2, s3} : Finset ℝ²)) :
    ∃ label : ShadowBank.Label,
      IsEndpointVSurplusHitLabel label ∧
        endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label = a := by
  rcases ha with ha | ha
  · exact ⟨.w, Or.inl rfl, by simpa [endpointMirrorLabelPoint] using ha.symm⟩
  · simp only [Finset.mem_insert, Finset.mem_singleton] at ha
    rcases ha with rfl | rfl | rfl
    · exact ⟨.s1, Or.inr (Or.inl rfl), rfl⟩
    · exact ⟨.s2, Or.inr (Or.inr (Or.inl rfl)), rfl⟩
    · exact ⟨.s3, Or.inr (Or.inr (Or.inr rfl)), rfl⟩

private theorem exists_mirrorWSurplusHitLabel_eq_of_mem_triple_or_v
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 b : ℝ²)
    (hb : b = S.oppositeVertexByIndex S.oppIndex2 ∨
      b ∈ ({s1, s2, s3} : Finset ℝ²)) :
    ∃ label : ShadowBank.Label,
      IsEndpointWSurplusHitLabel label ∧
        endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 label = b := by
  rcases hb with hb | hb
  · exact ⟨.v, Or.inl rfl, by simpa [endpointMirrorLabelPoint] using hb.symm⟩
  · simp only [Finset.mem_insert, Finset.mem_singleton] at hb
    rcases hb with rfl | rfl | rfl
    · exact ⟨.s1, Or.inr (Or.inl rfl), rfl⟩
    · exact ⟨.s2, Or.inr (Or.inr (Or.inl rfl)), rfl⟩
    · exact ⟨.s3, Or.inr (Or.inr (Or.inr rfl)), rfl⟩

/-- A left endpoint residual at the first non-surplus cap index determines the
two endpoint-fragment selected classes.

The first class is centered at `.v` in the endpoint fragment convention and has
the two private points of the first non-surplus cap, the escape point `x` in the
second non-surplus cap, and one surplus-side adjacent singleton.  The second
class is centered at `.w`; it has the two private points of the second
non-surplus cap, the surplus apex endpoint, and one surplus-side adjacent
singleton. -/
theorem endpointLeft_residual_selectedClass_shapes
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    ∃ p₁ p₂ q₁ q₂ a b : ℝ²,
      p₁ ≠ p₂ ∧
      S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
      q₁ ≠ q₂ ∧
      S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
      x ∈ ({q₁, q₂} : Finset ℝ²) ∧
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 ∧
      S.oppInterior1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1 =
        ({x} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 =
        ({a} : Finset ℝ²) ∧
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho).card = 4 ∧
      S.oppInterior2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
          S.leftAdjacentCapByIndex S.oppIndex2 =
        ({b} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
          S.rightAdjacentCapByIndex S.oppIndex2 =
        ({S.oppositeVertexByIndex S.surplusIdx} : Finset ℝ²) := by
  classical
  rcases hend with
    ⟨hradius, hρ, hcard₁, hxT₁, hxEsc, hcard₂raw, _hxρ,
      hsharedρ, _hsharedFirst⟩
  rcases hM44.exists_oppInterior_pairs with
    ⟨p₁, p₂, q₁, q₂, hp₁₂, hpPair, hq₁₂, hqPair⟩
  let T₁ := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius
  let T₂ := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho
  rcases S.moserSelectorShapeAt_of_convexIndep hconv S.oppIndex1
      hradius hM44.oppIndex1_cap_card_eq_four hcard₁ with
    ⟨hT₁card, hI₁sub, y, a, _hyLeft, _haRight, hyEq, haEq⟩
  have hxLeft : x ∈ T₁ ∩ S.leftAdjacentCapByIndex S.oppIndex1 := by
    exact Finset.mem_inter.mpr
      ⟨by simpa [T₁] using hxT₁, (Finset.mem_sdiff.mp hxEsc).1⟩
  have hx_eq_y : x = y := by
    have hxSingleton : x ∈ ({y} : Finset ℝ²) := by
      rw [← hyEq]
      exact hxLeft
    simpa using hxSingleton
  have hxLeftEq :
      T₁ ∩ S.leftAdjacentCapByIndex S.oppIndex1 =
        ({x} : Finset ℝ²) := by
    simpa [hx_eq_y] using hyEq
  have hxInterior₂ : x ∈ S.oppInterior2 := by
    have hxI :=
      S.mem_leftAdjacentInteriorByIndex_of_left_strict_escape S.oppIndex1
        hradius hxT₁ hxEsc
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2] using hxI
  have hxQ : x ∈ ({q₁, q₂} : Finset ℝ²) := by
    simpa [hqPair] using hxInterior₂
  have hcard₂ : 4 ≤ T₂.card := by
    simpa [T₂,
      S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
      using hcard₂raw
  rcases S.moserSelectorShapeAt_of_convexIndep hconv S.oppIndex2
      hρ hM44.oppIndex2_cap_card_eq_four hcard₂ with
    ⟨hT₂card, hI₂sub, b, z, _hbLeft, _hzRight, hbEq, hzEq⟩
  have huT₂ :
      S.oppositeVertexByIndex S.surplusIdx ∈ T₂ := by
    refine mem_selectedClass.mpr ⟨S.oppositeVertexByIndex_mem S.surplusIdx, ?_⟩
    have hdist :
        dist (S.oppositeVertexByIndex S.surplusIdx)
            (S.oppositeVertexByIndex S.oppIndex2) = rho := by
      simpa [
        S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx,
        S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
        using hsharedρ
    simpa [dist_comm] using hdist
  have huRight :
      S.oppositeVertexByIndex S.surplusIdx ∈
        T₂ ∩ S.rightAdjacentCapByIndex S.oppIndex2 := by
    exact Finset.mem_inter.mpr
      ⟨huT₂, by
        simpa [
          S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
          using S.rightOuterVertexByIndex_mem_rightAdjacentCapByIndex
            S.oppIndex2⟩
  have hu_eq_z : S.oppositeVertexByIndex S.surplusIdx = z := by
    have huSingleton :
        S.oppositeVertexByIndex S.surplusIdx ∈ ({z} : Finset ℝ²) := by
      rw [← hzEq]
      exact huRight
    simpa using huSingleton
  have huRightEq :
      T₂ ∩ S.rightAdjacentCapByIndex S.oppIndex2 =
        ({S.oppositeVertexByIndex S.surplusIdx} : Finset ℝ²) := by
    simpa [hu_eq_z] using hzEq
  refine ⟨p₁, p₂, q₁, q₂, a, b, hp₁₂, hpPair, hq₁₂, hqPair, hxQ, ?_,
    ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · simpa [T₁] using hT₁card
  · simpa [T₁, SurplusCapPacket.oppInterior1] using hI₁sub
  · simpa [T₁] using hxLeftEq
  · simpa [T₁] using haEq
  · simpa [T₂] using hT₂card
  · simpa [T₂, SurplusCapPacket.oppInterior2] using hI₂sub
  · simpa [T₂] using hbEq
  · simpa [T₂] using huRightEq

/-- A left endpoint residual can be relabelled by the ten endpoint-fragment
labels, including labels for the two free surplus-side hits. -/
theorem endpointLeft_residual_exists_label_data
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
    ∃ xLabel aLabel bLabel : ShadowBank.Label,
      p₁ ≠ p₂ ∧
      S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
      q₁ ≠ q₂ ∧
      S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      IsEndpointEscapeeLabel xLabel ∧
      IsEndpointVSurplusHitLabel aLabel ∧
      IsEndpointWSurplusHitLabel bLabel ∧
      endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 xLabel = x ∧
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card = 4 ∧
      S.oppInterior1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 xLabel} :
          Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 aLabel} :
          Finset ℝ²) ∧
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho).card = 4 ∧
      S.oppInterior2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
          S.leftAdjacentCapByIndex S.oppIndex2 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 bLabel} :
          Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
          S.rightAdjacentCapByIndex S.oppIndex2 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u} :
          Finset ℝ²) := by
  classical
  have hshape := endpointLeft_residual_selectedClass_shapes hM44 hconv hend
  rcases hend with
    ⟨hradius, _hρpos, _hcard₁raw, _hxT₁raw, _hxEsc, _hcard₂raw,
      _hxρ, _hsharedρ, _hsharedFirst⟩
  rcases hshape with
    ⟨p₁, p₂, q₁, q₂, a, b, hp₁₂, hpPair, hq₁₂, hqPair, hxQ,
      hT₁card, hI₁sub, hxLeftEq, haRightEq, hT₂card, hI₂sub, hbLeftEq,
      huRightEq⟩
  let T₁ := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius
  let T₂ := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho
  have haInter :
      a ∈ T₁ ∩ S.rightAdjacentCapByIndex S.oppIndex1 := by
    rw [haRightEq]
    simp
  have hbInter :
      b ∈ T₂ ∩ S.leftAdjacentCapByIndex S.oppIndex2 := by
    rw [hbLeftEq]
    simp
  let R : Finset ℝ² :=
    ({a, b} : Finset ℝ²).filter
      (fun z => z ∈ S.capInteriorByIndex S.surplusIdx)
  have hRsub : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro z hz
    exact (Finset.mem_filter.mp hz).2
  have hRcard : R.card ≤ 3 := by
    have hleFilter : R.card ≤ ({a, b} : Finset ℝ²).card :=
      Finset.card_filter_le _ _
    have hlePair : ({a, b} : Finset ℝ²).card ≤ 2 := Finset.card_le_two
    omega
  rcases exists_surplusInterior_triple_covering hM44 hRsub hRcard with
    ⟨s1, s2, s3, hRtrip, hs12, hs13, hs23, hStripleSub⟩
  have haAlt :
      a = S.oppositeVertexByIndex S.oppIndex2 ∨
        a ∈ ({s1, s2, s3} : Finset ℝ²) := by
    by_cases haOuter : a = S.oppositeVertexByIndex S.oppIndex2
    · exact Or.inl haOuter
    · have haI : a ∈ S.capInteriorByIndex S.surplusIdx := by
        have haIraw :=
          S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
            S.oppIndex1 hradius
            (by simpa [T₁] using (Finset.mem_inter.mp haInter).1)
            (Finset.mem_inter.mp haInter).2
            (by
              intro h
              exact haOuter (by
                simpa [
                  S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
                  using h))
        simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
          using haIraw
      have haR : a ∈ R := by
        simp [R, haI]
      exact Or.inr (hRtrip haR)
  have hbAlt :
      b = S.oppositeVertexByIndex S.oppIndex1 ∨
        b ∈ ({s1, s2, s3} : Finset ℝ²) := by
    by_cases hbOuter : b = S.oppositeVertexByIndex S.oppIndex1
    · exact Or.inl hbOuter
    · have hbI : b ∈ S.capInteriorByIndex S.surplusIdx := by
        have hbIraw :=
          S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
            S.oppIndex2 _hρpos
            (by simpa [T₂] using (Finset.mem_inter.mp hbInter).1)
            (Finset.mem_inter.mp hbInter).2
            (by
              intro h
              exact hbOuter (by
                simpa [
                  S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
                  using h))
        simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
          using hbIraw
      have hbR : b ∈ R := by
        simp [R, hbI]
      exact Or.inr (hRtrip hbR)
  rcases exists_escapeeLabel_eq_of_mem_pair
      S p₁ p₂ q₁ q₂ s1 s2 s3 x hxQ with
    ⟨xLabel, hxLabel, hxLabelEq⟩
  rcases exists_vSurplusHitLabel_eq_of_mem_triple_or_w
      S p₁ p₂ q₁ q₂ s1 s2 s3 a haAlt with
    ⟨aLabel, haLabel, haLabelEq⟩
  rcases exists_wSurplusHitLabel_eq_of_mem_triple_or_v
      S p₁ p₂ q₁ q₂ s1 s2 s3 b hbAlt with
    ⟨bLabel, hbLabel, hbLabelEq⟩
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, aLabel, bLabel,
    hp₁₂, hpPair, hq₁₂, hqPair, hs12, hs13, hs23, hStripleSub,
    hxLabel, haLabel, hbLabel, hxLabelEq, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact hT₁card
  · exact hI₁sub
  · simpa [hxLabelEq] using hxLeftEq
  · simpa [haLabelEq] using haRightEq
  · exact hT₂card
  · exact hI₂sub
  · simpa [hbLabelEq] using hbLeftEq
  · simpa [endpointLabelPoint] using huRightEq

/-- The `.v` selected class in a left endpoint residual induces the finite
endpoint mask `{Pw, Pu, escapee, surplus-side-hit}`. -/
theorem endpointLeft_residual_v_pointMask_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    {xLabel aLabel : ShadowBank.Label}
    (hpPair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hI₁sub :
      S.oppInterior1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxLeftEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 xLabel} :
          Finset ℝ²))
    (haRightEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 aLabel} :
          Finset ℝ²))
    (hinj :
      Function.Injective (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hxLabel : IsEndpointEscapeeLabel xLabel)
    (haLabel : IsEndpointVSurplusHitLabel aLabel) :
    endpointPointMask (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius) =
      SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
  rcases hend with ⟨hradius, _hρ, _hcard₁, _hxT₁, _hxEsc, _hcard₂,
    _hxρ, _hsharedρ, _hsharedFirst⟩
  let pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hpair :
      S.capInteriorByIndex S.oppIndex1 =
        ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior1] using hpPair
  have hsub :
      S.capInteriorByIndex S.oppIndex1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
    simpa [SurplusCapPacket.oppInterior1] using hI₁sub
  have hTraw := selectedClass_eq_pair_left_right_singletons
    S S.oppIndex1 hradius hpair hsub hxLeftEq haRightEq
  have hT :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius =
        ({pointOf .Pw, pointOf .Pu, pointOf xLabel, pointOf aLabel} :
          Finset ℝ²) := by
    simpa [pointOf, endpointLabelPoint] using hTraw
  rw [hT]
  exact endpointPointMask_eq_maskOfLabels_v
    (pointOf := pointOf) hinj hxLabel haLabel

/-- The `.w` selected class in a left endpoint residual induces the finite
endpoint mask `{Q1, Q2, surplus-side-hit, u}`. -/
theorem endpointLeft_residual_w_pointMask_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    {bLabel : ShadowBank.Label}
    (hqPair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hI₂sub :
      S.oppInterior2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho)
    (hbLeftEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
          S.leftAdjacentCapByIndex S.oppIndex2 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 bLabel} :
          Finset ℝ²))
    (huRightEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
          S.rightAdjacentCapByIndex S.oppIndex2 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u} :
          Finset ℝ²))
    (hinj :
      Function.Injective (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hbLabel : IsEndpointWSurplusHitLabel bLabel) :
    endpointPointMask (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho) =
      SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
  rcases hend with ⟨_hradius, hρ, _hcard₁, _hxT₁, _hxEsc, _hcard₂,
    _hxρ, _hsharedρ, _hsharedFirst⟩
  let pointOf := endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hpair :
      S.capInteriorByIndex S.oppIndex2 =
        ({q₁, q₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior2] using hqPair
  have hsub :
      S.capInteriorByIndex S.oppIndex2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho := by
    simpa [SurplusCapPacket.oppInterior2] using hI₂sub
  have hTraw := selectedClass_eq_pair_left_right_singletons
    S S.oppIndex2 hρ hpair hsub hbLeftEq huRightEq
  have hT :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho =
        ({pointOf .Q1, pointOf .Q2, pointOf bLabel, pointOf .u} :
          Finset ℝ²) := by
    simpa [pointOf, endpointLabelPoint] using hTraw
  rw [hT]
  exact endpointPointMask_eq_maskOfLabels_w
    (pointOf := pointOf) hinj hbLabel

/-- The `.v` selected class from a left endpoint residual satisfies the finite
endpoint `.v` shape check in any induced shadow whose `.v` class is that
selected class. -/
theorem endpointLeft_residual_vShapeOK_of_label_data
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    {xLabel aLabel : ShadowBank.Label}
    {centerClass : ShadowBank.Label → Finset ℝ²}
    (hvClass :
      centerClass .v =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hpPair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hI₁sub :
      S.oppInterior1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxLeftEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.leftAdjacentCapByIndex S.oppIndex1 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 xLabel} :
          Finset ℝ²))
    (haRightEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.rightAdjacentCapByIndex S.oppIndex1 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 aLabel} :
          Finset ℝ²))
    (hinj :
      Function.Injective (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hxLabel : IsEndpointEscapeeLabel xLabel)
    (haLabel : IsEndpointVSurplusHitLabel aLabel) :
    ShadowBank.endpointVShapeOK xLabel
      (endpointShadowOfPointClasses
        (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) centerClass) = true := by
  have hmask :
      endpointPointMask
          (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) (centerClass .v) =
        SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
    rw [hvClass]
    exact endpointLeft_residual_v_pointMask_eq hend hpPair hI₁sub
      hxLeftEq haRightEq hinj hxLabel haLabel
  exact endpointVShapeOK_shadowOfPointClasses_of_v_mask
    hmask hxLabel haLabel

/-- The `.w` selected class from a left endpoint residual satisfies the finite
endpoint `.w` shape check in any induced shadow whose `.w` class is that
selected class. -/
theorem endpointLeft_residual_wShapeOK_of_label_data
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeLeftAt S.oppIndex1 radius rho x)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    {bLabel : ShadowBank.Label}
    {centerClass : ShadowBank.Label → Finset ℝ²}
    (hwClass :
      centerClass .w =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho)
    (hqPair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hI₂sub :
      S.oppInterior2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho)
    (hbLeftEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
          S.leftAdjacentCapByIndex S.oppIndex2 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 bLabel} :
          Finset ℝ²))
    (huRightEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
          S.rightAdjacentCapByIndex S.oppIndex2 =
        ({endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u} :
          Finset ℝ²))
    (hinj :
      Function.Injective (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hbLabel : IsEndpointWSurplusHitLabel bLabel) :
    ShadowBank.endpointWShapeOK
      (endpointShadowOfPointClasses
        (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) centerClass) = true := by
  have hmask :
      endpointPointMask
          (endpointLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) (centerClass .w) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
    rw [hwClass]
    exact endpointLeft_residual_w_pointMask_eq hend hqPair hI₂sub
      hbLeftEq huRightEq hinj hbLabel
  exact endpointWShapeOK_shadowOfPointClasses_of_w_mask hmask hbLabel

/-- A left endpoint residual produces an induced endpoint shadow.  The two
endpoint-specific shape checks are discharged from the residual payload; the
generic finite-bank checks remain explicit component assumptions. -/
theorem endpointLeft_residual_exists_endpointShadowOK_of_components
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
          ShadowBank.endpointShadowOK xLabel shadow = true) := by
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
  have hvOK :
      ShadowBank.endpointVShapeOK xLabel
        (endpointShadowOfPointClasses pointOf centerClass) = true := by
    exact endpointLeft_residual_vShapeOK_of_label_data hend hvClass hpPair
      hI₁sub hxLeftEq haRightEq hinj hxLabel haLabel
  have hwOK :
      ShadowBank.endpointWShapeOK
        (endpointShadowOfPointClasses pointOf centerClass) = true := by
    exact endpointLeft_residual_wShapeOK_of_label_data hend hwClass hqPair
      hI₂sub hbLeftEq huRightEq hinj hbLabel
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxLabelEq, ?_⟩
  intro hclasses hone hcirc hno3 hcounts hsep hsearchSep
  exact endpointShadowOK_shadowOfPointClasses_of_components hclasses hvOK
    hwOK hone hcirc hno3 hcounts hsep hsearchSep

/-- A right endpoint residual at the second non-surplus cap index determines
the two mirror endpoint-fragment selected classes.

This is the mirror of `endpointLeft_residual_selectedClass_shapes`: the first
class is centered at the second non-surplus opposite vertex and uses the escape
point in the first non-surplus cap, while the second class is centered at the
first non-surplus opposite vertex and has the surplus apex endpoint as its
left-adjacent singleton. -/
theorem endpointRight_residual_selectedClass_shapes
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    ∃ p₁ p₂ q₁ q₂ a b : ℝ²,
      p₁ ≠ p₂ ∧
      S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
      q₁ ≠ q₂ ∧
      S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
      x ∈ ({p₁, p₂} : Finset ℝ²) ∧
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card = 4 ∧
      S.oppInterior2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
          S.leftAdjacentCapByIndex S.oppIndex2 =
        ({a} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
          S.rightAdjacentCapByIndex S.oppIndex2 =
        ({x} : Finset ℝ²) ∧
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho).card = 4 ∧
      S.oppInterior1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∩
          S.leftAdjacentCapByIndex S.oppIndex1 =
        ({S.oppositeVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∩
          S.rightAdjacentCapByIndex S.oppIndex1 =
        ({b} : Finset ℝ²) := by
  classical
  rcases hend with
    ⟨hradius, hρ, hcard₂, hxT₂, hxEsc, hcard₁raw, _hxρ,
      hsharedρ, _hsharedFirst⟩
  rcases hM44.exists_oppInterior_pairs with
    ⟨p₁, p₂, q₁, q₂, hp₁₂, hpPair, hq₁₂, hqPair⟩
  let T₂ := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius
  let T₁ := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho
  rcases S.moserSelectorShapeAt_of_convexIndep hconv S.oppIndex2
      hradius hM44.oppIndex2_cap_card_eq_four hcard₂ with
    ⟨hT₂card, hI₂sub, a, y, _haLeft, _hyRight, haEq, hyEq⟩
  have hxRight : x ∈ T₂ ∩ S.rightAdjacentCapByIndex S.oppIndex2 := by
    exact Finset.mem_inter.mpr
      ⟨by simpa [T₂] using hxT₂, (Finset.mem_sdiff.mp hxEsc).1⟩
  have hx_eq_y : x = y := by
    have hxSingleton : x ∈ ({y} : Finset ℝ²) := by
      rw [← hyEq]
      exact hxRight
    simpa using hxSingleton
  have hxRightEq :
      T₂ ∩ S.rightAdjacentCapByIndex S.oppIndex2 =
        ({x} : Finset ℝ²) := by
    simpa [hx_eq_y] using hyEq
  have hxInterior₁ : x ∈ S.oppInterior1 := by
    have hxI :=
      S.mem_rightAdjacentInteriorByIndex_of_right_strict_escape S.oppIndex2
        hradius hxT₂ hxEsc
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1] using hxI
  have hxP : x ∈ ({p₁, p₂} : Finset ℝ²) := by
    simpa [hpPair] using hxInterior₁
  have hcard₁ : 4 ≤ T₁.card := by
    simpa [T₁,
      S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
      using hcard₁raw
  rcases S.moserSelectorShapeAt_of_convexIndep hconv S.oppIndex1
      hρ hM44.oppIndex1_cap_card_eq_four hcard₁ with
    ⟨hT₁card, hI₁sub, z, b, _hzLeft, _hbRight, hzEq, hbEq⟩
  have huT₁ :
      S.oppositeVertexByIndex S.surplusIdx ∈ T₁ := by
    refine mem_selectedClass.mpr ⟨S.oppositeVertexByIndex_mem S.surplusIdx, ?_⟩
    have hdist :
        dist (S.oppositeVertexByIndex S.surplusIdx)
            (S.oppositeVertexByIndex S.oppIndex1) = rho := by
      simpa [
        S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx,
        S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
        using hsharedρ
    simpa [dist_comm] using hdist
  have huLeft :
      S.oppositeVertexByIndex S.surplusIdx ∈
        T₁ ∩ S.leftAdjacentCapByIndex S.oppIndex1 := by
    exact Finset.mem_inter.mpr
      ⟨huT₁, by
        simpa [
          S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
          using S.leftOuterVertexByIndex_mem_leftAdjacentCapByIndex
            S.oppIndex1⟩
  have hu_eq_z : S.oppositeVertexByIndex S.surplusIdx = z := by
    have huSingleton :
        S.oppositeVertexByIndex S.surplusIdx ∈ ({z} : Finset ℝ²) := by
      rw [← hzEq]
      exact huLeft
    simpa using huSingleton
  have huLeftEq :
      T₁ ∩ S.leftAdjacentCapByIndex S.oppIndex1 =
        ({S.oppositeVertexByIndex S.surplusIdx} : Finset ℝ²) := by
    simpa [hu_eq_z] using hzEq
  refine ⟨p₁, p₂, q₁, q₂, a, b, hp₁₂, hpPair, hq₁₂, hqPair, hxP, ?_,
    ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · simpa [T₂] using hT₂card
  · simpa [T₂, SurplusCapPacket.oppInterior2] using hI₂sub
  · simpa [T₂] using haEq
  · simpa [T₂] using hxRightEq
  · simpa [T₁] using hT₁card
  · simpa [T₁, SurplusCapPacket.oppInterior1] using hI₁sub
  · simpa [T₁] using huLeftEq
  · simpa [T₁] using hbEq

/-- A right endpoint residual can be relabelled by the generated endpoint
fragment convention after swapping the two non-surplus sides. -/
theorem endpointRight_residual_exists_label_data
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x) :
    ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
    ∃ xLabel aLabel bLabel : ShadowBank.Label,
      p₁ ≠ p₂ ∧
      S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
      q₁ ≠ q₂ ∧
      S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
      s1 ≠ s2 ∧ s1 ≠ s3 ∧ s2 ≠ s3 ∧
      ({s1, s2, s3} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      IsEndpointEscapeeLabel xLabel ∧
      IsEndpointVSurplusHitLabel aLabel ∧
      IsEndpointWSurplusHitLabel bLabel ∧
      endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 xLabel = x ∧
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card = 4 ∧
      S.oppInterior2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
          S.leftAdjacentCapByIndex S.oppIndex2 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 aLabel} :
          Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
          S.rightAdjacentCapByIndex S.oppIndex2 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 xLabel} :
          Finset ℝ²) ∧
      (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho).card = 4 ∧
      S.oppInterior1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∩
          S.leftAdjacentCapByIndex S.oppIndex1 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u} :
          Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∩
          S.rightAdjacentCapByIndex S.oppIndex1 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 bLabel} :
          Finset ℝ²) := by
  classical
  have hshape := endpointRight_residual_selectedClass_shapes hM44 hconv hend
  rcases hend with
    ⟨hradius, hρpos, _hcard₂raw, _hxT₂raw, _hxEsc, _hcard₁raw,
      _hxρ, _hsharedρ, _hsharedFirst⟩
  rcases hshape with
    ⟨p₁, p₂, q₁, q₂, a, b, hp₁₂, hpPair, hq₁₂, hqPair, hxP,
      hT₂card, hI₂sub, haLeftEq, hxRightEq, hT₁card, hI₁sub, huLeftEq,
      hbRightEq⟩
  let T₂ := SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius
  let T₁ := SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho
  have haInter :
      a ∈ T₂ ∩ S.leftAdjacentCapByIndex S.oppIndex2 := by
    rw [haLeftEq]
    simp
  have hbInter :
      b ∈ T₁ ∩ S.rightAdjacentCapByIndex S.oppIndex1 := by
    rw [hbRightEq]
    simp
  let R : Finset ℝ² :=
    ({a, b} : Finset ℝ²).filter
      (fun z => z ∈ S.capInteriorByIndex S.surplusIdx)
  have hRsub : R ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro z hz
    exact (Finset.mem_filter.mp hz).2
  have hRcard : R.card ≤ 3 := by
    have hleFilter : R.card ≤ ({a, b} : Finset ℝ²).card :=
      Finset.card_filter_le _ _
    have hlePair : ({a, b} : Finset ℝ²).card ≤ 2 := Finset.card_le_two
    omega
  rcases exists_surplusInterior_triple_covering hM44 hRsub hRcard with
    ⟨s1, s2, s3, hRtrip, hs12, hs13, hs23, hStripleSub⟩
  have haAlt :
      a = S.oppositeVertexByIndex S.oppIndex1 ∨
        a ∈ ({s1, s2, s3} : Finset ℝ²) := by
    by_cases haOuter : a = S.oppositeVertexByIndex S.oppIndex1
    · exact Or.inl haOuter
    · have haI : a ∈ S.capInteriorByIndex S.surplusIdx := by
        have haIraw :=
          S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
            S.oppIndex2 hradius
            (by simpa [T₂] using (Finset.mem_inter.mp haInter).1)
            (Finset.mem_inter.mp haInter).2
            (by
              intro h
              exact haOuter (by
                simpa [
                  S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
                  using h))
        simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
          using haIraw
      have haR : a ∈ R := by
        simp [R, haI]
      exact Or.inr (hRtrip haR)
  have hbAlt :
      b = S.oppositeVertexByIndex S.oppIndex2 ∨
        b ∈ ({s1, s2, s3} : Finset ℝ²) := by
    by_cases hbOuter : b = S.oppositeVertexByIndex S.oppIndex2
    · exact Or.inl hbOuter
    · have hbI : b ∈ S.capInteriorByIndex S.surplusIdx := by
        have hbIraw :=
          S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
            S.oppIndex1 hρpos
            (by simpa [T₁] using (Finset.mem_inter.mp hbInter).1)
            (Finset.mem_inter.mp hbInter).2
            (by
              intro h
              exact hbOuter (by
                simpa [
                  S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
                  using h))
        simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
          using hbIraw
      have hbR : b ∈ R := by
        simp [R, hbI]
      exact Or.inr (hRtrip hbR)
  rcases exists_mirrorEscapeeLabel_eq_of_mem_pair
      S p₁ p₂ q₁ q₂ s1 s2 s3 x hxP with
    ⟨xLabel, hxLabel, hxLabelEq⟩
  rcases exists_mirrorVSurplusHitLabel_eq_of_mem_triple_or_w
      S p₁ p₂ q₁ q₂ s1 s2 s3 a haAlt with
    ⟨aLabel, haLabel, haLabelEq⟩
  rcases exists_mirrorWSurplusHitLabel_eq_of_mem_triple_or_v
      S p₁ p₂ q₁ q₂ s1 s2 s3 b hbAlt with
    ⟨bLabel, hbLabel, hbLabelEq⟩
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, aLabel, bLabel,
    hp₁₂, hpPair, hq₁₂, hqPair, hs12, hs13, hs23, hStripleSub,
    hxLabel, haLabel, hbLabel, hxLabelEq, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact hT₂card
  · exact hI₂sub
  · simpa [haLabelEq] using haLeftEq
  · simpa [hxLabelEq] using hxRightEq
  · exact hT₁card
  · exact hI₁sub
  · simpa [endpointMirrorLabelPoint] using huLeftEq
  · simpa [hbLabelEq] using hbRightEq

/-- The `.v` selected class in a right endpoint residual induces the mirror
finite endpoint mask `{Pw, Pu, escapee, surplus-side-hit}`. -/
theorem endpointRight_residual_v_pointMask_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    {xLabel aLabel : ShadowBank.Label}
    (hqPair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hI₂sub :
      S.oppInterior2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (haLeftEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
          S.leftAdjacentCapByIndex S.oppIndex2 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 aLabel} :
          Finset ℝ²))
    (hxRightEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
          S.rightAdjacentCapByIndex S.oppIndex2 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 xLabel} :
          Finset ℝ²))
    (hinj :
      Function.Injective
        (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hxLabel : IsEndpointEscapeeLabel xLabel)
    (haLabel : IsEndpointVSurplusHitLabel aLabel) :
    endpointPointMask (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius) =
      SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
  rcases hend with ⟨hradius, _hρ, _hcard₂, _hxT₂, _hxEsc, _hcard₁,
    _hxρ, _hsharedρ, _hsharedFirst⟩
  let pointOf := endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hpair :
      S.capInteriorByIndex S.oppIndex2 =
        ({q₁, q₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior2] using hqPair
  have hsub :
      S.capInteriorByIndex S.oppIndex2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius := by
    simpa [SurplusCapPacket.oppInterior2] using hI₂sub
  have hTraw := selectedClass_eq_pair_left_right_singletons
    S S.oppIndex2 hradius hpair hsub haLeftEq hxRightEq
  have hT :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius =
        ({pointOf .Pw, pointOf .Pu, pointOf xLabel, pointOf aLabel} :
          Finset ℝ²) := by
    rw [hTraw]
    ext z
    simp [pointOf, endpointMirrorLabelPoint]
    tauto
  rw [hT]
  exact endpointPointMask_eq_maskOfLabels_v
    (pointOf := pointOf) hinj hxLabel haLabel

/-- The `.w` selected class in a right endpoint residual induces the mirror
finite endpoint mask `{Q1, Q2, surplus-side-hit, u}`. -/
theorem endpointRight_residual_w_pointMask_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    {bLabel : ShadowBank.Label}
    (hpPair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hI₁sub :
      S.oppInterior1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho)
    (huLeftEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∩
          S.leftAdjacentCapByIndex S.oppIndex1 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u} :
          Finset ℝ²))
    (hbRightEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∩
          S.rightAdjacentCapByIndex S.oppIndex1 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 bLabel} :
          Finset ℝ²))
    (hinj :
      Function.Injective
        (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hbLabel : IsEndpointWSurplusHitLabel bLabel) :
    endpointPointMask (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho) =
      SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
  rcases hend with ⟨_hradius, hρ, _hcard₂, _hxT₂, _hxEsc, _hcard₁,
    _hxρ, _hsharedρ, _hsharedFirst⟩
  let pointOf := endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hpair :
      S.capInteriorByIndex S.oppIndex1 =
        ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior1] using hpPair
  have hsub :
      S.capInteriorByIndex S.oppIndex1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho := by
    simpa [SurplusCapPacket.oppInterior1] using hI₁sub
  have hTraw := selectedClass_eq_pair_left_right_singletons
    S S.oppIndex1 hρ hpair hsub huLeftEq hbRightEq
  have hT :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho =
        ({pointOf .Q1, pointOf .Q2, pointOf bLabel, pointOf .u} :
          Finset ℝ²) := by
    rw [hTraw]
    ext z
    simp [pointOf, endpointMirrorLabelPoint]
    tauto
  rw [hT]
  exact endpointPointMask_eq_maskOfLabels_w
    (pointOf := pointOf) hinj hbLabel

/-- The `.v` selected class from a right endpoint residual satisfies the finite
mirror endpoint `.v` shape check. -/
theorem endpointRight_residual_vShapeOK_of_label_data
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    {xLabel aLabel : ShadowBank.Label}
    {centerClass : ShadowBank.Label → Finset ℝ²}
    (hvClass :
      centerClass .v =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hqPair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hI₂sub :
      S.oppInterior2 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (haLeftEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
          S.leftAdjacentCapByIndex S.oppIndex2 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 aLabel} :
          Finset ℝ²))
    (hxRightEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
          S.rightAdjacentCapByIndex S.oppIndex2 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 xLabel} :
          Finset ℝ²))
    (hinj :
      Function.Injective
        (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hxLabel : IsEndpointEscapeeLabel xLabel)
    (haLabel : IsEndpointVSurplusHitLabel aLabel) :
    ShadowBank.endpointVShapeOK xLabel
      (endpointShadowOfPointClasses
        (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) centerClass) =
        true := by
  have hmask :
      endpointPointMask
          (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .v) =
        SurplusCOMPGBank.maskOfLabels [.Pw, .Pu, xLabel, aLabel] := by
    rw [hvClass]
    exact endpointRight_residual_v_pointMask_eq hend hqPair hI₂sub
      haLeftEq hxRightEq hinj hxLabel haLabel
  exact endpointVShapeOK_shadowOfPointClasses_of_v_mask
    hmask hxLabel haLabel

/-- The `.w` selected class from a right endpoint residual satisfies the finite
mirror endpoint `.w` shape check. -/
theorem endpointRight_residual_wShapeOK_of_label_data
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {radius rho : ℝ} {x : ℝ²}
    (hend : S.EndpointEscapeRightAt S.oppIndex2 radius rho x)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    {bLabel : ShadowBank.Label}
    {centerClass : ShadowBank.Label → Finset ℝ²}
    (hwClass :
      centerClass .w =
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho)
    (hpPair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hI₁sub :
      S.oppInterior1 ⊆
        SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho)
    (huLeftEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∩
          S.leftAdjacentCapByIndex S.oppIndex1 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u} :
          Finset ℝ²))
    (hbRightEq :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) rho ∩
          S.rightAdjacentCapByIndex S.oppIndex1 =
        ({endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 bLabel} :
          Finset ℝ²))
    (hinj :
      Function.Injective
        (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hbLabel : IsEndpointWSurplusHitLabel bLabel) :
    ShadowBank.endpointWShapeOK
      (endpointShadowOfPointClasses
        (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) centerClass) =
        true := by
  have hmask :
      endpointPointMask
          (endpointMirrorLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        SurplusCOMPGBank.maskOfLabels [.Q1, .Q2, bLabel, .u] := by
    rw [hwClass]
    exact endpointRight_residual_w_pointMask_eq hend hpPair hI₁sub
      huLeftEq hbRightEq hinj hbLabel
  exact endpointWShapeOK_shadowOfPointClasses_of_w_mask hmask hbLabel

/-- A right endpoint residual produces an induced endpoint shadow in the mirror
endpoint-fragment orientation.  The endpoint-specific shape checks are
discharged from the residual payload; the generic finite-bank checks remain
explicit component assumptions. -/
theorem endpointRight_residual_exists_endpointShadowOK_of_components
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
          ShadowBank.endpointShadowOK xLabel shadow = true) := by
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
  have hvOK :
      ShadowBank.endpointVShapeOK xLabel
        (endpointShadowOfPointClasses pointOf centerClass) = true := by
    exact endpointRight_residual_vShapeOK_of_label_data hend hvClass hqPair
      hI₂sub haLeftEq hxRightEq hinj hxLabel haLabel
  have hwOK :
      ShadowBank.endpointWShapeOK
        (endpointShadowOfPointClasses pointOf centerClass) = true := by
    exact endpointRight_residual_wShapeOK_of_label_data hend hwClass hpPair
      hI₁sub huLeftEq hbRightEq hinj hbLabel
  refine ⟨p₁, p₂, q₁, q₂, s1, s2, s3, xLabel, ?_⟩
  dsimp only
  refine ⟨hxLabel, hinj, hxLabelEq, ?_⟩
  intro hclasses hone hcirc hno3 hcounts hsep hsearchSep
  exact endpointShadowOK_shadowOfPointClasses_of_components hclasses hvOK
    hwOK hone hcirc hno3 hcounts hsep hsearchSep

end EndpointCertificate

end Problem97
