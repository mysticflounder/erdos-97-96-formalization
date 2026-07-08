/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBank
import Erdos9796Proof.P97.SurplusSeededShadow
import Erdos9796Proof.P97.ErasedPinFixedSeedDFS
import Erdos9796Proof.P97.EndpointCertificate.MetricShadow
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

/-- A second distinct surplus-triple point determines a different surplus-star
label in the right-oriented COMP-G label map. -/
theorem exists_otherSurplusStar_rightPinnedLabelPoint_eq_of_mem_triple
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) {x y : ℝ²} {sstar : Label}
    (hy : y ∈ ({s1, s2, s3} : Finset ℝ²))
    (hyx : y ≠ x)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x) :
    ∃ other : Label,
      isSurplusStar other = true ∧ other ≠ sstar ∧
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 other = y := by
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hy with
    ⟨other, hother, hother_eq⟩
  refine ⟨other, hother, ?_, hother_eq⟩
  intro hsame
  exact hyx (by
    rw [← hother_eq, hsame, hsstar_eq])

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

/-- A second distinct surplus-triple point determines a different surplus-star
label in the left-oriented COMP-G label map. -/
theorem exists_otherSurplusStar_leftPinnedLabelPoint_eq_of_mem_triple
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) {x y : ℝ²} {sstar : Label}
    (hy : y ∈ ({s1, s2, s3} : Finset ℝ²))
    (hyx : y ≠ x)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x) :
    ∃ other : Label,
      isSurplusStar other = true ∧ other ≠ sstar ∧
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 other = y := by
  rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hy with
    ⟨other, hother, hother_eq⟩
  refine ⟨other, hother, ?_, hother_eq⟩
  intro hsame
  exact hyx (by
    rw [← hother_eq, hsame, hsstar_eq])

/-- A Moser-triangle vertex determines the corresponding generated Moser label
in the right-oriented COMP-G label map. -/
theorem exists_moserLabel_rightPinnedLabelPoint_eq_of_mem_triangle
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) {x : ℝ²}
    (hx : x ∈ S.triangle.verts) :
    ∃ mlabel : Label,
      (mlabel = .u ∨ mlabel = .v ∨ mlabel = .w) ∧
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 mlabel = x := by
  rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hx with
    hx_eq | hx_eq | hx_eq
  · exact ⟨.u, Or.inl rfl, by simpa [rightPinnedLabelPoint] using hx_eq.symm⟩
  · exact ⟨.v, Or.inr (Or.inl rfl),
      by simpa [rightPinnedLabelPoint] using hx_eq.symm⟩
  · exact ⟨.w, Or.inr (Or.inr rfl),
      by simpa [rightPinnedLabelPoint] using hx_eq.symm⟩

/-- A Moser-triangle vertex determines the corresponding generated Moser label
in the left-oriented COMP-G label map. -/
theorem exists_moserLabel_leftPinnedLabelPoint_eq_of_mem_triangle
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) {x : ℝ²}
    (hx : x ∈ S.triangle.verts) :
    ∃ mlabel : Label,
      (mlabel = .u ∨ mlabel = .v ∨ mlabel = .w) ∧
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 mlabel = x := by
  rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hx with
    hx_eq | hx_eq | hx_eq
  · exact ⟨.u, Or.inl rfl, by simpa [leftPinnedLabelPoint,
      rightPinnedLabelPoint, leftPinnedToRightLabel] using hx_eq.symm⟩
  · exact ⟨.w, Or.inr (Or.inr rfl),
      by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
        leftPinnedToRightLabel] using hx_eq.symm⟩
  · exact ⟨.v, Or.inr (Or.inl rfl),
      by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
        leftPinnedToRightLabel] using hx_eq.symm⟩

/-- A point in the second non-surplus interior pair determines the
corresponding `.Q` label in the right-oriented COMP-G label map. -/
theorem exists_QLabel_rightPinnedLabelPoint_eq_of_mem_oppInterior2
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) {x : ℝ²}
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hx : x ∈ S.oppInterior2) :
    ∃ qlabel : Label,
      (qlabel = .Q1 ∨ qlabel = .Q2) ∧
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 qlabel = x := by
  have hxPair : x ∈ ({q₁, q₂} : Finset ℝ²) := by
    simpa [hqpair] using hx
  simp only [Finset.mem_insert, Finset.mem_singleton] at hxPair
  rcases hxPair with hx_eq | hx_eq
  · exact ⟨.Q1, Or.inl rfl,
      by simpa [rightPinnedLabelPoint] using hx_eq.symm⟩
  · exact ⟨.Q2, Or.inr rfl,
      by simpa [rightPinnedLabelPoint] using hx_eq.symm⟩

/-- A point in the first non-surplus interior pair determines the
corresponding `.Q` label in the left-oriented COMP-G label map. -/
theorem exists_QLabel_leftPinnedLabelPoint_eq_of_mem_oppInterior1
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²) {x : ℝ²}
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hx : x ∈ S.oppInterior1) :
    ∃ qlabel : Label,
      (qlabel = .Q1 ∨ qlabel = .Q2) ∧
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 qlabel = x := by
  have hxPair : x ∈ ({q₁, q₂} : Finset ℝ²) := by
    simpa [hqpair] using hx
  simp only [Finset.mem_insert, Finset.mem_singleton] at hxPair
  rcases hxPair with hx_eq | hx_eq
  · exact ⟨.Q1, Or.inl rfl,
      by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
        leftPinnedToRightLabel] using hx_eq.symm⟩
  · exact ⟨.Q2, Or.inr rfl,
      by simpa [leftPinnedLabelPoint, rightPinnedLabelPoint,
        leftPinnedToRightLabel] using hx_eq.symm⟩

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
      have hrest : ∀ l ∈ rest, k < l.index := by
        intro l hl
        exact hlabels l (by simp [hl])
      by_cases hmem : pointOf label ∈ T
      · rw [ih hrest]
        simp [hmem]
        simpa [Label.bit] using
          (Nat.testBit_two_pow_add_gt hlabel acc)
      · rw [ih hrest]
        simp [hmem]

private theorem pointMask_maskHas_false_of_not_mem_of_prefix_suffix
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} {T : Finset α}
    {pref suff : List Label} {label : Label}
    (hall : allLabels = pref ++ label :: suff)
    (hpref : maskOfLabels pref < 2 ^ label.index)
    (hsuff : ∀ member ∈ suff, label.index < member.index)
    (hnot : pointOf label ∉ T) :
    maskHas (pointMask pointOf T) label = false := by
  unfold pointMask maskHas
  rw [hall]
  rw [List.foldl_append, List.foldl_cons]
  rw [pointMask_foldl_preserve_bit_of_forall_lt pointOf T suff hsuff]
  have hle := pointMask_foldl_le_add_maskOfLabels pointOf T pref 0
  have hlt :
      pref.foldl
          (fun acc label => if pointOf label ∈ T then label.bit + acc else acc)
          0 <
        2 ^ label.index := by
    have hle' :
        pref.foldl
            (fun acc label => if pointOf label ∈ T then label.bit + acc else acc)
            0 ≤ maskOfLabels pref := by
      simpa using hle
    exact Nat.lt_of_le_of_lt hle' hpref
  simpa [hnot] using Nat.testBit_eq_false_of_lt hlt

/-- If a label's point is not in a geometric class, its point-mask bit is
false. -/
theorem pointMask_maskHas_false_of_not_mem
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} {T : Finset α}
    {label : Label}
    (hnot : pointOf label ∉ T) :
    maskHas (pointMask pointOf T) label = false := by
  cases label
  · exact pointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := []) (suff := [.v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact pointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u]) (suff := [.w, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact pointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v]) (suff := [.s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact pointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w]) (suff := [.s2, .s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact pointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1]) (suff := [.s3, .Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact pointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2]) (suff := [.Pw, .Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact pointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3]) (suff := [.Pu, .Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact pointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw]) (suff := [.Q1, .Q2])
      rfl (by decide) (by decide) hnot
  · exact pointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu]) (suff := [.Q2])
      rfl (by decide) (by decide) hnot
  · exact pointMask_maskHas_false_of_not_mem_of_prefix_suffix
      (pref := [.u, .v, .w, .s1, .s2, .s3, .Pw, .Pu, .Q1]) (suff := [])
      rfl (by decide) (by decide) hnot

/-- A true bit in a point mask comes from membership in the geometric class
used to build that mask. -/
theorem pointMask_maskHas_mem
    {α : Type _} [DecidableEq α]
    {pointOf : Label → α} {T : Finset α}
    {label : Label}
    (hbit : maskHas (pointMask pointOf T) label = true) :
    pointOf label ∈ T := by
  by_contra hnot
  have hfalse : maskHas (pointMask pointOf T) label = false :=
    pointMask_maskHas_false_of_not_mem hnot
  rw [hfalse] at hbit
  contradiction

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

private theorem finset_eq_insert_insert_of_erase_erase_eq_pair
    {α : Type _} [DecidableEq α] {T : Finset α} {a b p q : α}
    (ha : a ∈ T) (hb : b ∈ T)
    (hpair : (T.erase a).erase b = ({p, q} : Finset α)) :
    T = ({a, b, p, q} : Finset α) := by
  ext x
  constructor
  · intro hx
    by_cases hxa : x = a
    · simp [hxa]
    by_cases hxb : x = b
    · simp [hxb]
    have hxerase : x ∈ (T.erase a).erase b := by
      simp [hxa, hxb, hx]
    have hxpair : x ∈ ({p, q} : Finset α) := by
      simpa [hpair] using hxerase
    simp only [Finset.mem_insert, Finset.mem_singleton] at hxpair ⊢
    rcases hxpair with hxp | hxq
    · exact Or.inr (Or.inr (Or.inl hxp))
    · exact Or.inr (Or.inr (Or.inr hxq))
  · intro hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact ha
    · exact hb
    · exact Finset.mem_of_mem_erase
        (Finset.mem_of_mem_erase (by rw [hpair]; simp))
    · exact Finset.mem_of_mem_erase
        (Finset.mem_of_mem_erase (by rw [hpair]; simp))

/-- A closed cap whose strict interior is the pair `{p₁,p₂}` is exactly its
two Moser endpoints together with those two strict interior points. -/
theorem capByIndex_eq_outer_vertices_insert_interior_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {p₁ p₂ : ℝ²}
    (hpair : S.capInteriorByIndex i = ({p₁, p₂} : Finset ℝ²)) :
    S.capByIndex i =
      ({S.leftOuterVertexByIndex i, S.rightOuterVertexByIndex i, p₁, p₂} :
        Finset ℝ²) := by
  fin_cases i
  · have hcap :
        S.partition.C1 =
          ({S.triangle.v2, S.triangle.v3, p₁, p₂} : Finset ℝ²) := by
      exact finset_eq_insert_insert_of_erase_erase_eq_pair
        S.partition.v2_mem_C1 S.partition.v3_mem_C1 (by
          simpa [SurplusCapPacket.capInteriorByIndex] using hpair)
    ext x
    simp [SurplusCapPacket.capByIndex,
      SurplusCapPacket.leftOuterVertexByIndex,
      SurplusCapPacket.rightOuterVertexByIndex, hcap]
    tauto
  · have hcap :
        S.partition.C2 =
          ({S.triangle.v3, S.triangle.v1, p₁, p₂} : Finset ℝ²) := by
      exact finset_eq_insert_insert_of_erase_erase_eq_pair
        S.partition.v3_mem_C2 S.partition.v1_mem_C2 (by
          simpa [SurplusCapPacket.capInteriorByIndex] using hpair)
    ext x
    simp [SurplusCapPacket.capByIndex,
      SurplusCapPacket.leftOuterVertexByIndex,
      SurplusCapPacket.rightOuterVertexByIndex, hcap]
    tauto
  · have hcap :
        S.partition.C3 =
          ({S.triangle.v1, S.triangle.v2, p₁, p₂} : Finset ℝ²) := by
      exact finset_eq_insert_insert_of_erase_erase_eq_pair
        S.partition.v1_mem_C3 S.partition.v2_mem_C3 (by
          simpa [SurplusCapPacket.capInteriorByIndex] using hpair)
    ext x
    simp [SurplusCapPacket.capByIndex,
      SurplusCapPacket.leftOuterVertexByIndex,
      SurplusCapPacket.rightOuterVertexByIndex, hcap]
    tauto

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

/-- Same-radius membership facts for the geometric classes give the metric
interpretation needed by the endpoint row-zero certificates. -/
theorem endpointMetricShadow_shadowOfPointClasses_of_sameRadius
    {pointOf : Label → ℝ²} {centerClass : Label → Finset ℝ²}
    (hinj : Function.Injective pointOf)
    (hsame : ∀ {center a b : Label},
      pointOf a ∈ centerClass center →
        pointOf b ∈ centerClass center →
          dist (pointOf center) (pointOf a) =
            dist (pointOf center) (pointOf b)) :
    EndpointCertificate.Variables.EndpointMetricShadow pointOf
      (shadowOfPointClasses pointOf centerClass) := by
  refine ⟨hinj, ?_⟩
  intro center a b ha hb
  exact hsame
    (pointMask_maskHas_mem (by
      simpa [Shadow.classHas, shadowOfPointClasses_centerMask] using ha))
    (pointMask_maskHas_mem (by
      simpa [Shadow.classHas, shadowOfPointClasses_centerMask] using hb))

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

private theorem firstOppExactCapMask_card :
    maskCard firstOppExactCapMask = 4 := by
  decide

private theorem firstOppExactCapMask_not_v :
    maskHas firstOppExactCapMask .v = false := by
  decide

private theorem secondOppExactCapMask_card :
    maskCard secondOppExactCapMask = 4 := by
  decide

private theorem secondOppExactCapMask_not_w :
    maskHas secondOppExactCapMask .w = false := by
  decide

private theorem secondOppExactCapMask_has_Q1 :
    maskHas secondOppExactCapMask .Q1 = true := by
  decide

private theorem secondOppExactCapMask_has_Q2 :
    maskHas secondOppExactCapMask .Q2 = true := by
  decide

private theorem secondOppExactCapMask_cuNoW :
    maskInterCard secondOppExactCapMask cuNoWMask = 1 := by
  decide

private theorem secondOppExactCapMask_cvNoW :
    maskInterCard secondOppExactCapMask cvNoWMask = 1 := by
  decide

private theorem secondOppExactCapMask_cuNoW_le_one :
    maskInterCard secondOppExactCapMask cuNoWMask <= 1 := by
  decide

private theorem secondOppExactCapMask_cvNoW_le_one :
    maskInterCard secondOppExactCapMask cvNoWMask <= 1 := by
  decide

private theorem oneSidedSeed_privateMask_card_of_mem {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds) :
    maskCard seed.privateMask = 4 := by
  have hall : oneSidedSeeds.all
      (fun seed : OneSidedSeed =>
        decide (maskCard seed.privateMask = 4)) = true := by
    decide
  exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed)

private theorem oneSidedSeed_privateMask_self_false_of_mem
    {seed : OneSidedSeed} (hseed : seed ∈ oneSidedSeeds) :
    maskHas seed.privateMask seed.privateCenter = false := by
  have hall : oneSidedSeeds.all
      (fun seed : OneSidedSeed =>
        decide (maskHas seed.privateMask seed.privateCenter = false)) =
      true := by
    decide
  exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed)

private theorem oneSidedSeed_privateMask_no_moser_triple_of_mem
    {seed : OneSidedSeed} (hseed : seed ∈ oneSidedSeeds) :
    (maskHas seed.privateMask .u &&
        maskHas seed.privateMask .v &&
        maskHas seed.privateMask .w) = false := by
  have hall : oneSidedSeeds.all
      (fun seed : OneSidedSeed =>
        decide ((maskHas seed.privateMask .u &&
            maskHas seed.privateMask .v &&
            maskHas seed.privateMask .w) = false)) = true := by
    decide
  exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed)

private theorem erasedPinFixedSeed_privateMask_card_of_mem
    {seed : OneSidedSeed} (hseed : seed ∈ erasedPinFixedSeeds) :
    maskCard seed.privateMask = 4 := by
  exact erasedPinFixedSeeds_privateMask_card seed hseed

private theorem erasedPinFixedSeed_privateMask_self_false_of_mem
    {seed : OneSidedSeed} (hseed : seed ∈ erasedPinFixedSeeds) :
    maskHas seed.privateMask seed.privateCenter = false := by
  exact erasedPinFixedSeeds_privateMask_self_false seed hseed

private theorem erasedPinFixedSeed_privateMask_no_moser_triple_of_mem
    {seed : OneSidedSeed} (hseed : seed ∈ erasedPinFixedSeeds) :
    (maskHas seed.privateMask .u &&
        maskHas seed.privateMask .v &&
        maskHas seed.privateMask .w) = false := by
  exact erasedPinFixedSeeds_privateMask_no_moser_triple seed hseed

/-- For listed one-sided seeds, the private center is fixed to the private
mask. -/
theorem oneSidedSeed_fixedMask_privateCenter_eq_some_of_mem
    {seed : OneSidedSeed} (hseed : seed ∈ oneSidedSeeds) :
    seed.fixedMask seed.privateCenter = some seed.privateMask := by
  have hall : oneSidedSeeds.all
      (fun seed : OneSidedSeed =>
        decide (seed.fixedMask seed.privateCenter = some seed.privateMask)) =
      true := by
    decide
  exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed)

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

/-- The generated fragment trigger only checks `.u`, `.Q1`, `.Q2`, the
previous surplus-star labels, and the final surplus-star one-hit bound. -/
theorem fragmentTriggersOK_shadowOfPointClasses_of_trigger_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hu :
      (maskHas (pointMask pointOf (centerClass .u)) sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .u))
                uPwPuMask)) = false)
    (hQ1 :
      (maskHas (pointMask pointOf (centerClass .Q1)) sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q1))
                uPwPuMask)) = false)
    (hQ2 :
      (maskHas (pointMask pointOf (centerClass .Q2)) sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q2))
                uPwPuMask)) = false)
    (hprevious : ∀ center : Label, center ∈ previousSstarCenters sstar →
      (maskHas (pointMask pointOf (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass sstar)) uPwPuMask <= 1) :
    fragmentTriggersOK sstar
      (shadowOfPointClasses pointOf centerClass) = true := by
  have huOK :
      triggerPrivateOKAt (shadowOfPointClasses pointOf centerClass) .u
        sstar = true :=
    triggerPrivateOKAt_shadowOfPointClasses_of_mask_condition hu
  have hQ1OK :
      triggerPrivateOKAt (shadowOfPointClasses pointOf centerClass) .Q1
        sstar = true :=
    triggerPrivateOKAt_shadowOfPointClasses_of_mask_condition hQ1
  have hQ2OK :
      triggerPrivateOKAt (shadowOfPointClasses pointOf centerClass) .Q2
        sstar = true :=
    triggerPrivateOKAt_shadowOfPointClasses_of_mask_condition hQ2
  cases sstar <;> simp [isSurplusStar] at hs
  · simp [fragmentTriggersOK, previousSstarCenters,
      shadowOfPointClasses_centerMask, huOK, hQ1OK, hQ2OK, hfinal]
  · have hs1OK :
        triggerPrivateOKAt (shadowOfPointClasses pointOf centerClass) .s1
          .s2 = true :=
      triggerPrivateOKAt_shadowOfPointClasses_of_mask_condition
        (hprevious .s1 (by simp [previousSstarCenters]))
    simp [fragmentTriggersOK, previousSstarCenters,
      shadowOfPointClasses_centerMask, huOK, hQ1OK, hQ2OK, hs1OK, hfinal]
  · have hs1OK :
        triggerPrivateOKAt (shadowOfPointClasses pointOf centerClass) .s1
          .s3 = true :=
      triggerPrivateOKAt_shadowOfPointClasses_of_mask_condition
        (hprevious .s1 (by simp [previousSstarCenters]))
    have hs2OK :
        triggerPrivateOKAt (shadowOfPointClasses pointOf centerClass) .s2
          .s3 = true :=
      triggerPrivateOKAt_shadowOfPointClasses_of_mask_condition
        (hprevious .s2 (by simp [previousSstarCenters]))
    simp [fragmentTriggersOK, previousSstarCenters,
      shadowOfPointClasses_centerMask, huOK, hQ1OK, hQ2OK, hs1OK, hs2OK,
      hfinal]

/-- Membership in the generated candidate table is equivalent to satisfying
the local candidate predicate, in the table-to-predicate direction needed by
the geometric bridge. -/
theorem candidateMaskOK_of_mem_candidateMasks
    {sstar center : Label} {mask : Nat}
    (hs : isSurplusStar sstar = true)
    (h : mask ∈ candidateMasks sstar center) :
    candidateMaskOK sstar center mask = true := by
  rw [candidateMasks_eq_filter_of_isSurplusStar hs] at h
  rw [candidateMasksByFilter] at h
  exact (List.mem_filter.mp h).2

/-- The generated pinned `.v` mask is one of the generated `.v` candidates. -/
theorem pinnedMaskOf_mem_candidateMasks_v
    {sstar : Label} (hs : isSurplusStar sstar = true) :
    pinnedMaskOf sstar ∈ candidateMasks sstar .v := by
  exact mem_candidateMasks_of_candidateMaskOK hs (by
    cases sstar <;> simp [isSurplusStar] at hs
    all_goals decide)

/-- A geometric `.v` point-mask equality to the generated pinned mask supplies
the `.v` candidate-membership obligation for the pinned shadow assembler. -/
theorem mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hpinned : pointMask pointOf (centerClass .v) = pinnedMaskOf sstar) :
    pointMask pointOf (centerClass .v) ∈ candidateMasks sstar .v := by
  rw [hpinned]
  exact pinnedMaskOf_mem_candidateMasks_v hs

/-- The generated second-opposite exact-cap mask is one of the generated `.w`
candidates for every surplus star. -/
theorem secondOppExactCapMask_mem_candidateMasks_w
    {sstar : Label} (hs : isSurplusStar sstar = true) :
    secondOppExactCapMask ∈ candidateMasks sstar .w := by
  exact mem_candidateMasks_of_candidateMaskOK hs (by
    cases sstar <;> simp [isSurplusStar] at hs
    all_goals decide)

/-- A geometric `.w` point-mask equality to the generated second-opposite
exact-cap mask supplies the `.w` candidate-membership obligation for the
pinned shadow assembler. -/
theorem mem_candidateMasks_w_of_pointMask_eq_secondOppExactCapMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hw : pointMask pointOf (centerClass .w) = secondOppExactCapMask) :
    pointMask pointOf (centerClass .w) ∈ candidateMasks sstar .w := by
  rw [hw]
  exact secondOppExactCapMask_mem_candidateMasks_w hs

/-- Every listed one-sided seed uses one of the surplus-star labels. -/
theorem isSurplusStar_oneSidedSeed_sstar_of_mem
    {seed : OneSidedSeed} (hseed : seed ∈ oneSidedSeeds) :
    isSurplusStar seed.sstar = true := by
  have hall : oneSidedSeeds.all
      (fun seed : OneSidedSeed =>
        decide (isSurplusStar seed.sstar = true)) = true := by
    decide
  exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed)

/-- Every listed one-sided seed private mask is also a generated pinned
candidate at its private center. -/
theorem oneSidedSeed_privateMask_mem_candidateMasks
    {seed : OneSidedSeed} (hseed : seed ∈ oneSidedSeeds) :
    seed.privateMask ∈ candidateMasks seed.sstar seed.privateCenter := by
  have hs : isSurplusStar seed.sstar = true :=
    isSurplusStar_oneSidedSeed_sstar_of_mem hseed
  exact mem_candidateMasks_of_candidateMaskOK hs (by
    have hall : oneSidedSeeds.all
        (fun seed : OneSidedSeed =>
          decide (candidateMaskOK seed.sstar seed.privateCenter
            seed.privateMask = true)) = true := by
      decide
    exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed))

/-- A geometric private-center point-mask equality to a listed one-sided seed's
private mask supplies the corresponding pinned candidate-membership obligation.
-/
theorem mem_candidateMasks_privateCenter_of_pointMask_eq_oneSidedSeed
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hmask : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask) :
    pointMask pointOf (centerClass seed.privateCenter) ∈
      candidateMasks seed.sstar seed.privateCenter := by
  rw [hmask]
  exact oneSidedSeed_privateMask_mem_candidateMasks hseed

/-- The first non-surplus exact-cap mask is the fixed seeded candidate at
`.v` for every listed one-sided seed. -/
theorem firstOppExactCapMask_mem_seed_candidateMasks_v
    {seed : OneSidedSeed} (hseed : seed ∈ oneSidedSeeds) :
    firstOppExactCapMask ∈ seed.candidateMasks .v := by
  have hall : oneSidedSeeds.all
      (fun seed : OneSidedSeed =>
        decide (firstOppExactCapMask ∈ seed.candidateMasks .v)) = true := by
    decide
  exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed)

/-- A geometric `.v` point-mask equality to the first exact cap supplies the
seeded candidate-membership obligation at `.v`. -/
theorem mem_seed_candidateMasks_v_of_pointMask_eq_firstOppExactCapMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hv : pointMask pointOf (centerClass .v) = firstOppExactCapMask) :
    pointMask pointOf (centerClass .v) ∈ seed.candidateMasks .v := by
  rw [hv]
  exact firstOppExactCapMask_mem_seed_candidateMasks_v hseed

/-- The second non-surplus exact-cap mask is the fixed seeded candidate at
`.w` for every listed one-sided seed. -/
theorem secondOppExactCapMask_mem_seed_candidateMasks_w
    {seed : OneSidedSeed} (hseed : seed ∈ oneSidedSeeds) :
    secondOppExactCapMask ∈ seed.candidateMasks .w := by
  have hall : oneSidedSeeds.all
      (fun seed : OneSidedSeed =>
        decide (secondOppExactCapMask ∈ seed.candidateMasks .w)) = true := by
    decide
  exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed)

/-- A geometric `.w` point-mask equality to the second exact cap supplies the
seeded candidate-membership obligation at `.w`. -/
theorem mem_seed_candidateMasks_w_of_pointMask_eq_secondOppExactCapMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hw : pointMask pointOf (centerClass .w) = secondOppExactCapMask) :
    pointMask pointOf (centerClass .w) ∈ seed.candidateMasks .w := by
  rw [hw]
  exact secondOppExactCapMask_mem_seed_candidateMasks_w hseed

/-- A listed one-sided seed's private mask is the fixed seeded candidate at its
private center. -/
theorem oneSidedSeed_privateMask_mem_seed_candidateMasks_privateCenter
    {seed : OneSidedSeed} (hseed : seed ∈ oneSidedSeeds) :
    seed.privateMask ∈ seed.candidateMasks seed.privateCenter := by
  have hall : oneSidedSeeds.all
      (fun seed : OneSidedSeed =>
        decide (seed.privateMask ∈ seed.candidateMasks seed.privateCenter)) =
      true := by
    decide
  exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed)

/-- A geometric private-center point-mask equality to a listed one-sided
seed's private mask supplies the seeded candidate-membership obligation at the
private center. -/
theorem mem_seed_candidateMasks_privateCenter_of_pointMask_eq_oneSidedSeed
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hmask : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask) :
    pointMask pointOf (centerClass seed.privateCenter) ∈
      seed.candidateMasks seed.privateCenter := by
  rw [hmask]
  exact oneSidedSeed_privateMask_mem_seed_candidateMasks_privateCenter hseed

private theorem localTriggerOKAt_of_candidateMaskOK
    {sstar center : Label} {mask : Nat}
    (h : candidateMaskOK sstar center mask = true) :
    localTriggerOKAt sstar center mask = true := by
  by_cases hlocal : localTriggerOKAt sstar center mask = true
  · exact hlocal
  · have hlocalFalse : localTriggerOKAt sstar center mask = false := by
      cases hcase : localTriggerOKAt sstar center mask <;> simp_all
    simp [candidateMaskOK, hlocalFalse] at h

private theorem localTriggerOKAt_of_oneSidedSeedCandidateMaskOK
    {sstar center : Label} {mask : Nat}
    (h : oneSidedSeedCandidateMaskOK sstar center mask = true) :
    localTriggerOKAt sstar center mask = true := by
  by_cases hlocal : localTriggerOKAt sstar center mask = true
  · exact hlocal
  · have hlocalFalse : localTriggerOKAt sstar center mask = false := by
      cases hcase : localTriggerOKAt sstar center mask <;> simp_all
    simp [oneSidedSeedCandidateMaskOK, hlocalFalse] at h

private theorem trigger_condition_of_localTriggerOKAt
    {sstar center : Label} {mask : Nat}
    (hfirst : center = .u ∨ center = .Q1 ∨ center = .Q2 ∨
      center ∈ previousSstarCenters sstar)
    (h : localTriggerOKAt sstar center mask = true) :
    (maskHas mask sstar &&
        decide (1 <= maskInterCard mask uPwPuMask)) = false := by
  cases hhas : maskHas mask sstar
  · simp
  · cases hle : decide (1 <= maskInterCard mask uPwPuMask)
    · simp
    · cases sstar <;> cases center <;>
        simp [previousSstarCenters, localTriggerOKAt, hhas, hle] at hfirst h

private theorem final_trigger_bound_of_localTriggerOKAt
    {sstar : Label} {mask : Nat}
    (hs : isSurplusStar sstar = true)
    (h : localTriggerOKAt sstar sstar mask = true) :
    maskInterCard mask uPwPuMask <= 1 := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    simpa [previousSstarCenters, localTriggerOKAt] using h

private theorem fragmentTriggersOK_shadowOfPointClasses_of_candidateMaskOK
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hOK : ∀ center : Label,
      candidateMaskOK sstar center
        (pointMask pointOf (centerClass center)) = true) :
    fragmentTriggersOK sstar
      (shadowOfPointClasses pointOf centerClass) = true := by
  have hlocal : ∀ center : Label,
      localTriggerOKAt sstar center
        (pointMask pointOf (centerClass center)) = true := by
    intro center
    exact localTriggerOKAt_of_candidateMaskOK (hOK center)
  exact fragmentTriggersOK_shadowOfPointClasses_of_trigger_interfaces hs
    (trigger_condition_of_localTriggerOKAt
      (Or.inl rfl) (hlocal .u))
    (trigger_condition_of_localTriggerOKAt
      (Or.inr (Or.inl rfl)) (hlocal .Q1))
    (trigger_condition_of_localTriggerOKAt
      (Or.inr (Or.inr (Or.inl rfl))) (hlocal .Q2))
    (by
      intro center hmem
      exact trigger_condition_of_localTriggerOKAt
        (Or.inr (Or.inr (Or.inr hmem))) (hlocal center))
    (final_trigger_bound_of_localTriggerOKAt hs (hlocal sstar))

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

/-- Generated candidate-mask membership supplies all per-center local Boolean
checks for the induced pinned fragment.  The global no-three, prefix-count, and
separation checks remain explicit geometric obligations. -/
theorem isValidPinnedFragment_shadowOfPointClasses_of_candidate_masks
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hcandidate : ∀ center : Label,
      pointMask pointOf (centerClass center) ∈ candidateMasks sstar center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    isValidPinnedFragment sstar
      (shadowOfPointClasses pointOf centerClass) = true := by
  have hOK : ∀ center : Label,
      candidateMaskOK sstar center
        (pointMask pointOf (centerClass center)) = true := by
    intro center
    exact candidateMaskOK_of_mem_candidateMasks hs (hcandidate center)
  exact isValidPinnedFragment_shadowOfPointClasses_of_components hs
    (by
      simp [Shadow.classesShapeOK, allLabels, Shadow.classShapeOKAt,
        Shadow.classHas, shadowOfPointClasses_centerMask, candidateMaskOK]
        at hOK ⊢
      aesop)
    (by
      have hv := hOK .v
      simp [pinnedClassOK, shadowOfPointClasses_centerMask,
        candidateMaskOK] at hv ⊢
      aesop)
    (by
      have hw := hOK .w
      simp [wSqueezeOK, Shadow.classHas, shadowOfPointClasses_centerMask,
        candidateMaskOK] at hw ⊢
      aesop)
    (by
      have hu := hOK .u
      have hw := hOK .w
      simp [oneHitOK, shadowOfPointClasses_centerMask,
        candidateMaskOK] at hu hw ⊢
      aesop)
    (by
      simp [circumcenterOK, circumcenterOKAt, allLabels, Shadow.classHas,
        shadowOfPointClasses_centerMask, candidateMaskOK] at hOK ⊢
      aesop)
    hno3
    (searchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
    (separationOK_shadowOfPointClasses_of_sepOKFor hsep)
    (searchSeparationOK_shadowOfPointClasses_of_crossSeparation hsearchSep)
    (fragmentTriggersOK_shadowOfPointClasses_of_candidateMaskOK hs hOK)

/-- Variant of the candidate-mask assembler that discharges the generated `.v`
and `.w` candidate-membership cases from exact geometric masks. -/
theorem isValidPinnedFragment_shadowOfPointClasses_of_exact_vw_candidates
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label}
    (hs : isSurplusStar sstar = true)
    (hpinned : pointMask pointOf (centerClass .v) = pinnedMaskOf sstar)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      pointMask pointOf (centerClass center) ∈ candidateMasks sstar center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    isValidPinnedFragment sstar
      (shadowOfPointClasses pointOf centerClass) = true := by
  refine isValidPinnedFragment_shadowOfPointClasses_of_candidate_masks hs ?_
    hno3 hcounts hsep hsearchSep
  intro center
  by_cases hv : center = .v
  · subst center
    exact mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf hs hpinned
  · by_cases hw : center = .w
    · subst center
      exact mem_candidateMasks_w_of_pointMask_eq_secondOppExactCapMask hs
        hwMask
    · exact hcandidate center hv hw

/-- Variant of the candidate-mask assembler that additionally discharges a
listed one-sided seed's private center from the seed table. -/
theorem isValidPinnedFragment_shadowOfPointClasses_of_exact_vw_seed_candidates
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar : Label} {seed : OneSidedSeed}
    (hs : isSurplusStar sstar = true)
    (hseed : seed ∈ oneSidedSeeds)
    (hseedStar : seed.sstar = sstar)
    (hpinned : pointMask pointOf (centerClass .v) = pinnedMaskOf sstar)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        pointMask pointOf (centerClass center) ∈ candidateMasks sstar center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    isValidPinnedFragment sstar
      (shadowOfPointClasses pointOf centerClass) = true := by
  refine isValidPinnedFragment_shadowOfPointClasses_of_candidate_masks hs ?_
    hno3 hcounts hsep hsearchSep
  intro center
  by_cases hv : center = .v
  · subst center
    exact mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf hs hpinned
  · by_cases hw : center = .w
    · subst center
      exact mem_candidateMasks_w_of_pointMask_eq_secondOppExactCapMask hs
        hwMask
    · by_cases hprivateCenter : center = seed.privateCenter
      · subst center
        simpa [hseedStar] using
          mem_candidateMasks_privateCenter_of_pointMask_eq_oneSidedSeed
            (pointOf := pointOf) (centerClass := centerClass) hseed hprivate
      · exact hcandidate center hv hw hprivateCenter

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

/-- Component-wise generated Boolean facts for a geometric shadow assemble into
the finite seeded one-sided predicate consumed by the seeded DFS bridge. -/
theorem isValidOneSidedSeedShadow_shadowOfPointClasses_of_components
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hs : isSurplusStar seed.sstar = true)
    (hclasses :
      (shadowOfPointClasses pointOf centerClass).classesShapeOK = true)
    (hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask)
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
      fragmentTriggersOK seed.sstar
        (shadowOfPointClasses pointOf centerClass) = true) :
    isValidOneSidedSeedShadow seed
      (shadowOfPointClasses pointOf centerClass) = true := by
  simp [isValidOneSidedSeedShadow, hs, shadowOfPointClasses_hasTenMasks,
    hclasses, shadowOfPointClasses_centerMask, hv, hwMask, hprivate, hw, hone,
    hcirc, hno3, hcounts, hsep, hsearchSep, htriggers]

/-- A single finite interface for turning geometric point-class masks into a
valid generated seeded one-sided shadow.  The hypotheses are exactly the
explicit mask/prefix facts needed by the generated component Booleans. -/
theorem isValidOneSidedSeedShadow_shadowOfPointClasses_of_mask_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label,
      maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label,
      maskHas (pointMask pointOf (centerClass center)) center = false)
    (hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask)
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
      (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
        uPwPuMask <= 1) :
    isValidOneSidedSeedShadow seed
      (shadowOfPointClasses pointOf centerClass) = true := by
  exact isValidOneSidedSeedShadow_shadowOfPointClasses_of_components hs
    (classesShapeOK_shadowOfPointClasses_of_maskCard_not_mem hcard hself)
    hv hwMask hprivate
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

/-- Seed candidate-mask membership supplies all local Boolean checks for the
induced one-sided seeded shadow.  The global no-three, prefix-count, and
separation checks remain explicit geometric obligations. -/
theorem isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hcandidate : ∀ center : Label,
      pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    isValidOneSidedSeedShadow seed
      (shadowOfPointClasses pointOf centerClass) = true := by
  have hOK : ∀ center : Label,
      oneSidedSeedCandidateMaskOK seed.sstar center
        (pointMask pointOf (centerClass center)) = true := by
    intro center
    exact oneSidedSeedCandidateMaskOK_of_mem_seed_candidateMasks
      (hcandidate center)
  have hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask :=
    eq_fixedMask_of_mem_seed_candidateMasks
      (seed := seed) (center := .v)
      (fixed := firstOppExactCapMask)
      (by simp [OneSidedSeed.fixedMask]) (hcandidate .v)
  have hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask :=
    eq_fixedMask_of_mem_seed_candidateMasks
      (seed := seed) (center := .w)
      (fixed := secondOppExactCapMask)
      (by simp [OneSidedSeed.fixedMask]) (hcandidate .w)
  have hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask :=
    eq_fixedMask_of_mem_seed_candidateMasks
      (oneSidedSeed_fixedMask_privateCenter_eq_some_of_mem hseed)
      (hcandidate seed.privateCenter)
  have hlocal : ∀ center : Label,
      localTriggerOKAt seed.sstar center
        (pointMask pointOf (centerClass center)) = true := by
    intro center
    exact localTriggerOKAt_of_oneSidedSeedCandidateMaskOK (hOK center)
  exact isValidOneSidedSeedShadow_shadowOfPointClasses_of_components hs
    (classesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
      (fun center => by
        have h := hOK center
        simp [oneSidedSeedCandidateMaskOK] at h
        aesop)
      (fun center => by
        have h := hOK center
        simp [oneSidedSeedCandidateMaskOK] at h
        aesop))
    hv hwMask hprivate
    (wSqueezeOK_shadowOfPointClasses_of_mask_facts
      (by
        rw [hwMask]
        exact secondOppExactCapMask_has_Q1)
      (by
        rw [hwMask]
        exact secondOppExactCapMask_has_Q2)
      (by
        rw [hwMask]
        exact secondOppExactCapMask_cuNoW)
      (by
        rw [hwMask]
        exact secondOppExactCapMask_cvNoW))
    (oneHitOK_shadowOfPointClasses_of_mask_bounds
      (by
        have h := hOK .u
        simp [oneSidedSeedCandidateMaskOK] at h
        aesop)
      (by
        have h := hOK .u
        simp [oneSidedSeedCandidateMaskOK] at h
        aesop)
      (by
        rw [hwMask]
        exact secondOppExactCapMask_cvNoW_le_one)
      (by
        rw [hwMask]
        exact secondOppExactCapMask_cuNoW_le_one))
    (circumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple
      (fun center hnonMoser => by
        have h := hOK center
        simp [oneSidedSeedCandidateMaskOK, hnonMoser] at h
        aesop))
    hno3
    (searchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
    (separationOK_shadowOfPointClasses_of_sepOKFor hsep)
    (searchSeparationOK_shadowOfPointClasses_of_crossSeparation hsearchSep)
    (fragmentTriggersOK_shadowOfPointClasses_of_trigger_interfaces hs
      (trigger_condition_of_localTriggerOKAt
        (Or.inl rfl) (hlocal .u))
      (trigger_condition_of_localTriggerOKAt
        (Or.inr (Or.inl rfl)) (hlocal .Q1))
      (trigger_condition_of_localTriggerOKAt
        (Or.inr (Or.inr (Or.inl rfl))) (hlocal .Q2))
      (by
        intro center hmem
        exact trigger_condition_of_localTriggerOKAt
          (Or.inr (Or.inr (Or.inr hmem))) (hlocal center))
      (final_trigger_bound_of_localTriggerOKAt hs (hlocal seed.sstar)))

/-- Seed candidate-mask membership plus exact fixed masks supplies all local
Boolean checks for the induced one-sided seeded shadow.  Unlike
`isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates`, this
version does not require membership in the older 18-seed bank. -/
theorem isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates_with_exact_masks
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hs : isSurplusStar seed.sstar = true)
    (hv : pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hcandidate : ∀ center : Label,
      pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    isValidOneSidedSeedShadow seed
      (shadowOfPointClasses pointOf centerClass) = true := by
  have hOK : ∀ center : Label,
      oneSidedSeedCandidateMaskOK seed.sstar center
        (pointMask pointOf (centerClass center)) = true := by
    intro center
    exact oneSidedSeedCandidateMaskOK_of_mem_seed_candidateMasks
      (hcandidate center)
  have hlocal : ∀ center : Label,
      localTriggerOKAt seed.sstar center
        (pointMask pointOf (centerClass center)) = true := by
    intro center
    exact localTriggerOKAt_of_oneSidedSeedCandidateMaskOK (hOK center)
  exact isValidOneSidedSeedShadow_shadowOfPointClasses_of_components hs
    (classesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
      (fun center => by
        have h := hOK center
        simp [oneSidedSeedCandidateMaskOK] at h
        aesop)
      (fun center => by
        have h := hOK center
        simp [oneSidedSeedCandidateMaskOK] at h
        aesop))
    hv hwMask hprivate
    (wSqueezeOK_shadowOfPointClasses_of_mask_facts
      (by
        rw [hwMask]
        exact secondOppExactCapMask_has_Q1)
      (by
        rw [hwMask]
        exact secondOppExactCapMask_has_Q2)
      (by
        rw [hwMask]
        exact secondOppExactCapMask_cuNoW)
      (by
        rw [hwMask]
        exact secondOppExactCapMask_cvNoW))
    (oneHitOK_shadowOfPointClasses_of_mask_bounds
      (by
        have h := hOK .u
        simp [oneSidedSeedCandidateMaskOK] at h
        aesop)
      (by
        have h := hOK .u
        simp [oneSidedSeedCandidateMaskOK] at h
        aesop)
      (by
        rw [hwMask]
        exact secondOppExactCapMask_cvNoW_le_one)
      (by
        rw [hwMask]
        exact secondOppExactCapMask_cuNoW_le_one))
    (circumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple
      (fun center hnonMoser => by
        have h := hOK center
        simp [oneSidedSeedCandidateMaskOK, hnonMoser] at h
        aesop))
    hno3
    (searchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
    (separationOK_shadowOfPointClasses_of_sepOKFor hsep)
    (searchSeparationOK_shadowOfPointClasses_of_crossSeparation hsearchSep)
    (fragmentTriggersOK_shadowOfPointClasses_of_trigger_interfaces hs
      (trigger_condition_of_localTriggerOKAt
        (Or.inl rfl) (hlocal .u))
      (trigger_condition_of_localTriggerOKAt
        (Or.inr (Or.inl rfl)) (hlocal .Q1))
      (trigger_condition_of_localTriggerOKAt
        (Or.inr (Or.inr (Or.inl rfl))) (hlocal .Q2))
      (by
        intro center hmem
        exact trigger_condition_of_localTriggerOKAt
          (Or.inr (Or.inr (Or.inr hmem))) (hlocal center))
      (final_trigger_bound_of_localTriggerOKAt hs (hlocal seed.sstar)))

/-- Candidate-mask obligations that remain after a one-sided seed's fixed
`.v`, `.w`, and private-center masks have been discharged geometrically. -/
abbrev OneSidedSeedCandidateRemainder
    {α : Type _} [DecidableEq α]
    (pointOf : Label → α) (centerClass : Label → Finset α)
    (seed : OneSidedSeed) : Prop :=
  ∀ center : Label, center ≠ .v → center ≠ .w →
    center ≠ seed.privateCenter →
      pointMask pointOf (centerClass center) ∈ seed.candidateMasks center

/-- Candidate remainders are unchanged when only the private mask or kind tag
changes.  Away from `.v`, `.w`, and the private center, candidate masks depend
only on the surplus-star label. -/
theorem oneSidedSeedCandidateRemainder_of_same_sstar_privateCenter
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed base : OneSidedSeed}
    (hsstar : seed.sstar = base.sstar)
    (hprivate : seed.privateCenter = base.privateCenter)
    (hbase : OneSidedSeedCandidateRemainder pointOf centerClass base) :
    OneSidedSeedCandidateRemainder pointOf centerClass seed := by
  intro center hv hw hprivateCenter
  have hbasePrivate : center ≠ base.privateCenter := by
    intro h
    exact hprivateCenter (by simpa [hprivate] using h)
  have hmem := hbase center hv hw hbasePrivate
  simpa [OneSidedSeed.candidateMasks, OneSidedSeed.fixedMask, hsstar,
    hprivate, hv, hw, hprivateCenter, hbasePrivate] using hmem

/-- At a center not fixed by a one-sided seed, the seed candidate list is just
the generated filter, so the local candidate predicate gives membership. -/
theorem mem_seed_candidateMasks_of_oneSidedSeedCandidateMaskOK_nonfixed
    {seed : OneSidedSeed} {center : Label} {mask : Nat}
    (hv : center ≠ .v) (hw : center ≠ .w)
    (hprivate : center ≠ seed.privateCenter)
    (hOK : oneSidedSeedCandidateMaskOK seed.sstar center mask = true) :
    mask ∈ seed.candidateMasks center := by
  have hfixed : seed.fixedMask center = none := by
    simp [OneSidedSeed.fixedMask, hv, hw, hprivate]
  unfold OneSidedSeed.candidateMasks
  rw [hfixed]
  exact mem_oneSidedSeedCandidateMasksByFilter_of_candidate hOK

private theorem localTriggerOKAt_pointMask_of_trigger_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {sstar center : Label}
    (hs : isSurplusStar sstar = true)
    (htriggerU :
      (maskHas (pointMask pointOf (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard (pointMask pointOf (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas (pointMask pointOf (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard (pointMask pointOf (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas (pointMask pointOf (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard (pointMask pointOf (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas (pointMask pointOf (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass sstar))
          uPwPuMask <= 1) :
    localTriggerOKAt sstar center
      (pointMask pointOf (centerClass center)) = true := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    cases center <;>
      simp [localTriggerOKAt, previousSstarCenters, htriggerU, htriggerQ1,
        htriggerQ2, hfinal, htriggerPrevious]

private theorem oneSidedSeedCandidateMaskOK_pointMask_of_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskHas (pointMask pointOf (centerClass center)) center = false)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
    (hcirc : ∀ center : Label,
      isMoserLabel center = false → center ≠ seed.privateCenter →
        (maskHas (pointMask pointOf (centerClass center)) .u &&
          maskHas (pointMask pointOf (centerClass center)) .v &&
          maskHas (pointMask pointOf (centerClass center)) .w) = false)
    (htriggerU :
      (maskHas (pointMask pointOf (centerClass .u)) seed.sstar &&
        decide
          (1 <=
            maskInterCard (pointMask pointOf (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas (pointMask pointOf (centerClass .Q1)) seed.sstar &&
        decide
          (1 <=
            maskInterCard (pointMask pointOf (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas (pointMask pointOf (centerClass .Q2)) seed.sstar &&
        decide
          (1 <=
            maskInterCard (pointMask pointOf (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters seed.sstar →
        (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
          uPwPuMask <= 1)
    {center : Label}
    (hv : center ≠ .v) (hw : center ≠ .w)
    (hprivate : center ≠ seed.privateCenter) :
    oneSidedSeedCandidateMaskOK seed.sstar center
      (pointMask pointOf (centerClass center)) = true := by
  have hcardCenter := hcard center hv hw hprivate
  have hselfCenter := hself center hv hw hprivate
  have hlocal :
      localTriggerOKAt seed.sstar center
        (pointMask pointOf (centerClass center)) = true :=
    localTriggerOKAt_pointMask_of_trigger_interfaces hs
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  cases center
  · simp [oneSidedSeedCandidateMaskOK, maskNormalized_pointMask, hcardCenter,
      hselfCenter, hlocal, huv, huw]
  · simp at hv
  · simp at hw
  · have hnotTriple := hcirc .s1 (by rfl) hprivate
    simp [oneSidedSeedCandidateMaskOK, maskNormalized_pointMask, hcardCenter,
      hselfCenter, hlocal, hnotTriple]
  · have hnotTriple := hcirc .s2 (by rfl) hprivate
    simp [oneSidedSeedCandidateMaskOK, maskNormalized_pointMask, hcardCenter,
      hselfCenter, hlocal, hnotTriple]
  · have hnotTriple := hcirc .s3 (by rfl) hprivate
    simp [oneSidedSeedCandidateMaskOK, maskNormalized_pointMask, hcardCenter,
      hselfCenter, hlocal, hnotTriple]
  · have hnotTriple := hcirc .Pw (by rfl) hprivate
    simp [oneSidedSeedCandidateMaskOK, maskNormalized_pointMask, hcardCenter,
      hselfCenter, hlocal, hnotTriple]
  · have hnotTriple := hcirc .Pu (by rfl) hprivate
    simp [oneSidedSeedCandidateMaskOK, maskNormalized_pointMask, hcardCenter,
      hselfCenter, hlocal, hnotTriple]
  · have hnotTriple := hcirc .Q1 (by rfl) hprivate
    simp [oneSidedSeedCandidateMaskOK, maskNormalized_pointMask, hcardCenter,
      hselfCenter, hlocal, hnotTriple]
  · have hnotTriple := hcirc .Q2 (by rfl) hprivate
    simp [oneSidedSeedCandidateMaskOK, maskNormalized_pointMask, hcardCenter,
      hselfCenter, hlocal, hnotTriple]

/-- The explicit local mask facts used by the older one-sided interface also
produce the candidate-remainder interface for non-fixed seed centers. -/
theorem oneSidedSeedCandidateRemainder_of_mask_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskHas (pointMask pointOf (centerClass center)) center = false)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
    (hcirc : ∀ center : Label,
      isMoserLabel center = false → center ≠ seed.privateCenter →
        (maskHas (pointMask pointOf (centerClass center)) .u &&
          maskHas (pointMask pointOf (centerClass center)) .v &&
          maskHas (pointMask pointOf (centerClass center)) .w) = false)
    (htriggerU :
      (maskHas (pointMask pointOf (centerClass .u)) seed.sstar &&
        decide
          (1 <=
            maskInterCard (pointMask pointOf (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas (pointMask pointOf (centerClass .Q1)) seed.sstar &&
        decide
          (1 <=
            maskInterCard (pointMask pointOf (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas (pointMask pointOf (centerClass .Q2)) seed.sstar &&
        decide
          (1 <=
            maskInterCard (pointMask pointOf (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters seed.sstar →
        (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
          uPwPuMask <= 1) :
    OneSidedSeedCandidateRemainder pointOf centerClass seed := by
  intro center hv hw hprivate
  exact mem_seed_candidateMasks_of_oneSidedSeedCandidateMaskOK_nonfixed
    hv hw hprivate
    (oneSidedSeedCandidateMaskOK_pointMask_of_interfaces hs hcard hself
      huv huw hcirc htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
      hv hw hprivate)

/-- Variant of the one-sided seeded candidate assembler that discharges the
fixed `.v`, `.w`, and private-center candidate memberships from exact
geometric masks. -/
theorem isValidOneSidedSeedShadow_shadowOfPointClasses_of_exact_vw_private_candidates
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hv : pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    isValidOneSidedSeedShadow seed
      (shadowOfPointClasses pointOf centerClass) = true := by
  have hs : isSurplusStar seed.sstar = true :=
    isSurplusStar_oneSidedSeed_sstar_of_mem hseed
  refine isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates
    hseed hs ?_ hno3 hcounts hsep hsearchSep
  intro center
  by_cases hvCenter : center = .v
  · subst center
    exact mem_seed_candidateMasks_v_of_pointMask_eq_firstOppExactCapMask
      hseed hv
  · by_cases hwCenter : center = .w
    · subst center
      exact mem_seed_candidateMasks_w_of_pointMask_eq_secondOppExactCapMask
        hseed hwMask
    · by_cases hprivateCenter : center = seed.privateCenter
      · subst center
        exact
          mem_seed_candidateMasks_privateCenter_of_pointMask_eq_oneSidedSeed
            hseed hprivate
      · exact hcandidate center hvCenter hwCenter hprivateCenter

/-- A listed seed cannot be realized by geometric point classes satisfying
seeded candidate-mask membership and the global prefix/separation facts. -/
theorem false_of_oneSidedSeedShadow_pointClasses_of_seed_candidates
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hcandidate : ∀ center : Label,
      pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  exact false_of_isValidOneSidedSeedShadow_of_mem_seed hseed
    (isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates
      hseed hs hcandidate hno3 hcounts hsep hsearchSep)

/-- A listed seed cannot be realized once the fixed `.v`, `.w`, and
private-center exact masks are supplied, the remaining centers satisfy seeded
candidate-mask membership, and the global prefix/separation facts hold. -/
theorem false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hv : pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  exact false_of_isValidOneSidedSeedShadow_of_mem_seed hseed
    (isValidOneSidedSeedShadow_shadowOfPointClasses_of_exact_vw_private_candidates
      hseed hv hwMask hprivate hcandidate hno3 hcounts hsep hsearchSep)

/-- A listed seed cannot be realized by geometric point classes satisfying the
finite one-sided seeded mask interface. -/
theorem false_of_oneSidedSeedShadow_pointClasses_of_mask_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label,
      maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label,
      maskHas (pointMask pointOf (centerClass center)) center = false)
    (hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask)
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
      (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
        uPwPuMask <= 1) :
    False := by
  exact false_of_isValidOneSidedSeedShadow_of_mem_seed hseed
    (isValidOneSidedSeedShadow_shadowOfPointClasses_of_mask_interfaces hs
      hcard hself hv hwMask hprivate hwQ1 hwQ2 hwcu hwcv huv huw hwv hwu
      hcirc hno3 hcounts hsep hsearchSep htrigger hfinal)

/-- Exact `.v` and `.w` cap masks discharge the finite card, self-hit, and
`w`-squeeze parts of the seeded no-survivor interface. -/
theorem false_of_oneSidedSeedShadow_pointClasses_of_exact_cap_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      maskHas (pointMask pointOf (centerClass center)) center = false)
    (hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
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
      (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
        uPwPuMask <= 1) :
    False := by
  have hcardAll : ∀ center : Label,
      maskCard (pointMask pointOf (centerClass center)) = 4 := by
    intro center
    by_cases hvCenter : center = .v
    · subst center
      rw [hv]
      exact firstOppExactCapMask_card
    · by_cases hwCenter : center = .w
      · subst center
        rw [hwMask]
        exact secondOppExactCapMask_card
      · exact hcard center hvCenter hwCenter
  have hselfAll : ∀ center : Label,
      maskHas (pointMask pointOf (centerClass center)) center = false := by
    intro center
    by_cases hvCenter : center = .v
    · subst center
      rw [hv]
      exact firstOppExactCapMask_not_v
    · by_cases hwCenter : center = .w
      · subst center
        rw [hwMask]
        exact secondOppExactCapMask_not_w
      · exact hself center hvCenter hwCenter
  exact false_of_oneSidedSeedShadow_pointClasses_of_mask_interfaces hseed hs
    hcardAll hselfAll hv hwMask hprivate
    (by
      rw [hwMask]
      exact secondOppExactCapMask_has_Q1)
    (by
      rw [hwMask]
      exact secondOppExactCapMask_has_Q2)
    (by
      rw [hwMask]
      exact secondOppExactCapMask_cuNoW)
    (by
      rw [hwMask]
      exact secondOppExactCapMask_cvNoW)
    huv huw
    (by
      rw [hwMask]
      exact secondOppExactCapMask_cvNoW_le_one)
    (by
      rw [hwMask]
      exact secondOppExactCapMask_cuNoW_le_one)
    hcirc hno3 hcounts hsep hsearchSep htrigger hfinal

/-- Exact cap masks plus the exact generated trigger interface give the seeded
no-survivor contradiction.  This is the proof-facing interface for geometric
branches: only `.u`, `.Q1`, `.Q2`, previous surplus-star centers, and the final
surplus-star bound need trigger facts. -/
theorem false_of_oneSidedSeedShadow_pointClasses_of_exact_cap_trigger_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      maskHas (pointMask pointOf (centerClass center)) center = false)
    (hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
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
    (htriggerU :
      (maskHas (pointMask pointOf (centerClass .u)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .u))
                uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas (pointMask pointOf (centerClass .Q1)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q1))
                uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas (pointMask pointOf (centerClass .Q2)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q2))
                uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters seed.sstar →
        (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
            decide
              (1 <=
                maskInterCard (pointMask pointOf (centerClass center))
                  uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
        uPwPuMask <= 1) :
    False := by
  have hcardAll : ∀ center : Label,
      maskCard (pointMask pointOf (centerClass center)) = 4 := by
    intro center
    by_cases hvCenter : center = .v
    · subst center
      rw [hv]
      exact firstOppExactCapMask_card
    · by_cases hwCenter : center = .w
      · subst center
        rw [hwMask]
        exact secondOppExactCapMask_card
      · exact hcard center hvCenter hwCenter
  have hselfAll : ∀ center : Label,
      maskHas (pointMask pointOf (centerClass center)) center = false := by
    intro center
    by_cases hvCenter : center = .v
    · subst center
      rw [hv]
      exact firstOppExactCapMask_not_v
    · by_cases hwCenter : center = .w
      · subst center
        rw [hwMask]
        exact secondOppExactCapMask_not_w
      · exact hself center hvCenter hwCenter
  exact false_of_isValidOneSidedSeedShadow_of_mem_seed hseed
    (isValidOneSidedSeedShadow_shadowOfPointClasses_of_components hs
      (classesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
        hcardAll hselfAll)
      hv hwMask hprivate
      (wSqueezeOK_shadowOfPointClasses_of_mask_facts
        (by
          rw [hwMask]
          exact secondOppExactCapMask_has_Q1)
        (by
          rw [hwMask]
          exact secondOppExactCapMask_has_Q2)
        (by
          rw [hwMask]
          exact secondOppExactCapMask_cuNoW)
        (by
          rw [hwMask]
          exact secondOppExactCapMask_cvNoW))
      (oneHitOK_shadowOfPointClasses_of_mask_bounds
        huv huw
        (by
          rw [hwMask]
          exact secondOppExactCapMask_cvNoW_le_one)
        (by
          rw [hwMask]
          exact secondOppExactCapMask_cuNoW_le_one))
      (circumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple hcirc)
      (noThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two hno3)
      (searchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
      (separationOK_shadowOfPointClasses_of_sepOKFor hsep)
      (searchSeparationOK_shadowOfPointClasses_of_crossSeparation hsearchSep)
      (fragmentTriggersOK_shadowOfPointClasses_of_trigger_interfaces hs
        htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal))

/-- Exact cap masks, a listed erased-pin fixed private seed mask, and the
generated trigger interface give the generalized fixed-seed no-survivor
contradiction.  This is the finite producer bridge for the erased-pin exact-row
census; unlike `false_of_oneSidedSeedShadow_pointClasses_of_exact_cap_trigger_interfaces`,
it consumes the 330-row generated fixed-seed bank rather than the older
18-terminal-seed bank. -/
theorem false_of_erasedPinFixedSeedShadow_pointClasses_of_exact_cap_trigger_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinFixedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      maskHas (pointMask pointOf (centerClass center)) center = false)
    (hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
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
    (htriggerU :
      (maskHas (pointMask pointOf (centerClass .u)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .u))
                uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas (pointMask pointOf (centerClass .Q1)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q1))
                uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas (pointMask pointOf (centerClass .Q2)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q2))
                uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters seed.sstar →
        (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
            decide
              (1 <=
                maskInterCard (pointMask pointOf (centerClass center))
                  uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
        uPwPuMask <= 1) :
    False := by
  have hcardAll : ∀ center : Label,
      maskCard (pointMask pointOf (centerClass center)) = 4 := by
    intro center
    by_cases hvCenter : center = .v
    · subst center
      rw [hv]
      exact firstOppExactCapMask_card
    · by_cases hwCenter : center = .w
      · subst center
        rw [hwMask]
        exact secondOppExactCapMask_card
      · exact hcard center hvCenter hwCenter
  have hselfAll : ∀ center : Label,
      maskHas (pointMask pointOf (centerClass center)) center = false := by
    intro center
    by_cases hvCenter : center = .v
    · subst center
      rw [hv]
      exact firstOppExactCapMask_not_v
    · by_cases hwCenter : center = .w
      · subst center
        rw [hwMask]
        exact secondOppExactCapMask_not_w
      · exact hself center hvCenter hwCenter
  exact false_of_isValidOneSidedSeedShadow_of_mem_erasedPinFixedSeed hseed
    (isValidOneSidedSeedShadow_shadowOfPointClasses_of_components hs
      (classesShapeOK_shadowOfPointClasses_of_maskCard_not_mem
        hcardAll hselfAll)
      hv hwMask hprivate
      (wSqueezeOK_shadowOfPointClasses_of_mask_facts
        (by
          rw [hwMask]
          exact secondOppExactCapMask_has_Q1)
        (by
          rw [hwMask]
          exact secondOppExactCapMask_has_Q2)
        (by
          rw [hwMask]
          exact secondOppExactCapMask_cuNoW)
        (by
          rw [hwMask]
          exact secondOppExactCapMask_cvNoW))
      (oneHitOK_shadowOfPointClasses_of_mask_bounds
        huv huw
        (by
          rw [hwMask]
          exact secondOppExactCapMask_cvNoW_le_one)
        (by
          rw [hwMask]
          exact secondOppExactCapMask_cuNoW_le_one))
      (circumcenterOK_shadowOfPointClasses_of_no_nonmoser_triple hcirc)
      (noThreeOK_shadowOfPointClasses_of_pointPairClassCount_le_two hno3)
      (searchPairCountsOK_shadowOfPointClasses_of_prefixes hcounts)
      (separationOK_shadowOfPointClasses_of_sepOKFor hsep)
      (searchSeparationOK_shadowOfPointClasses_of_crossSeparation hsearchSep)
      (fragmentTriggersOK_shadowOfPointClasses_of_trigger_interfaces hs
        htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal))

/-- Version of the erased-pin fixed-seed bridge where the private seed center is
removed from the card/no-self obligations.  The private mask facts come from
membership in the generated 330-seed list. -/
theorem false_of_erasedPinFixedSeedShadow_pointClasses_of_seed_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinFixedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskHas (pointMask pointOf (centerClass center)) center = false)
    (hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
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
    (htriggerU :
      (maskHas (pointMask pointOf (centerClass .u)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .u))
                uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas (pointMask pointOf (centerClass .Q1)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q1))
                uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas (pointMask pointOf (centerClass .Q2)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q2))
                uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters seed.sstar →
        (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
            decide
              (1 <=
                maskInterCard (pointMask pointOf (centerClass center))
                  uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
        uPwPuMask <= 1) :
    False := by
  exact
    false_of_erasedPinFixedSeedShadow_pointClasses_of_exact_cap_trigger_interfaces
      hseed hs
      (fun center hvCenter hwCenter => by
        by_cases hprivateCenter : center = seed.privateCenter
        · subst center
          rw [hprivate]
          exact erasedPinFixedSeed_privateMask_card_of_mem hseed
        · exact hcard center hvCenter hwCenter hprivateCenter)
      (fun center hvCenter hwCenter => by
        by_cases hprivateCenter : center = seed.privateCenter
        · subst center
          rw [hprivate]
          exact erasedPinFixedSeed_privateMask_self_false_of_mem hseed
        · exact hself center hvCenter hwCenter hprivateCenter)
      hv hwMask hprivate huv huw hcirc hno3 hcounts hsep hsearchSep
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal

/-- Version of the erased-pin fixed-seed bridge where the private seed center is
also removed from the non-Moser triple obligation. -/
theorem false_of_erasedPinFixedSeedShadow_pointClasses_of_seed_circ_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinFixedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskHas (pointMask pointOf (centerClass center)) center = false)
    (hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      center ≠ seed.privateCenter →
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
    (htriggerU :
      (maskHas (pointMask pointOf (centerClass .u)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .u))
                uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas (pointMask pointOf (centerClass .Q1)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q1))
                uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas (pointMask pointOf (centerClass .Q2)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q2))
                uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters seed.sstar →
        (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
            decide
              (1 <=
                maskInterCard (pointMask pointOf (centerClass center))
                  uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
        uPwPuMask <= 1) :
    False := by
  exact false_of_erasedPinFixedSeedShadow_pointClasses_of_seed_interfaces
    hseed hs hcard hself hv hwMask hprivate huv huw
    (fun center hnonMoser => by
      by_cases hprivateCenter : center = seed.privateCenter
      · subst center
        rw [hprivate]
        exact erasedPinFixedSeed_privateMask_no_moser_triple_of_mem hseed
      · exact hcirc center hnonMoser hprivateCenter)
    hno3 hcounts hsep hsearchSep htriggerU htriggerQ1 htriggerQ2
    htriggerPrevious hfinal

/-- Candidate-remainder form of the generated erased-pin fixed-seed producer.
The generated seed bank supplies the three fixed candidate memberships, while
the caller supplies only the non-fixed candidate memberships. -/
theorem false_of_erasedPinFixedSeedShadow_pointClasses_of_exact_vw_private_candidates
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinFixedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hv : pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have hcandidateFull : ∀ center : Label,
      pointMask pointOf (centerClass center) ∈ seed.candidateMasks center := by
    intro center
    by_cases hvCenter : center = .v
    · subst center
      rw [hv]
      exact erasedPinFixedSeeds_firstOppExactCapMask_mem_candidateMasks_v
        seed hseed
    · by_cases hwCenter : center = .w
      · subst center
        rw [hwMask]
        exact erasedPinFixedSeeds_secondOppExactCapMask_mem_candidateMasks_w
          seed hseed
      · by_cases hprivateCenter : center = seed.privateCenter
        · subst center
          rw [hprivate]
          exact
            erasedPinFixedSeeds_privateMask_mem_candidateMasks_privateCenter
              seed hseed
        · exact hcandidate center hvCenter hwCenter hprivateCenter
  exact false_of_isValidOneSidedSeedShadow_of_mem_erasedPinFixedSeed hseed
    (isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates_with_exact_masks
      hs hv hwMask hprivate hcandidateFull hno3 hcounts hsep hsearchSep)

/-- Candidate-remainder form of the generated erased-pin producer for a seed
whose kind tag may differ from the deduplicated `.own` fixed bank.  The
candidate masks and validator ignore the kind tag, so canonical fixed-bank
membership is enough to close the original seed. -/
theorem false_of_erasedPinCanonicalFixedSeedShadow_pointClasses_of_exact_vw_private_candidates
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : erasedPinCanonicalSeed seed ∈ erasedPinFixedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hv : pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have hcandidateFull : ∀ center : Label,
      pointMask pointOf (centerClass center) ∈ seed.candidateMasks center := by
    intro center
    by_cases hvCenter : center = .v
    · subst center
      rw [hv]
      simpa [erasedPinCanonicalSeed_candidateMasks] using
        erasedPinFixedSeeds_firstOppExactCapMask_mem_candidateMasks_v
          (erasedPinCanonicalSeed seed) hseed
    · by_cases hwCenter : center = .w
      · subst center
        rw [hwMask]
        simpa [erasedPinCanonicalSeed_candidateMasks] using
          erasedPinFixedSeeds_secondOppExactCapMask_mem_candidateMasks_w
            (erasedPinCanonicalSeed seed) hseed
      · by_cases hprivateCenter : center = seed.privateCenter
        · subst center
          rw [hprivate]
          simpa [erasedPinCanonicalSeed, erasedPinCanonicalSeed_candidateMasks] using
            erasedPinFixedSeeds_privateMask_mem_candidateMasks_privateCenter
              (erasedPinCanonicalSeed seed) hseed
        · exact hcandidate center hvCenter hwCenter hprivateCenter
  exact false_of_isValidOneSidedSeedShadow_of_mem_erasedPinCanonicalSeed hseed
    (isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates_with_exact_masks
      hs hv hwMask hprivate hcandidateFull hno3 hcounts hsep hsearchSep)

/-- A two-surplus, two-`.Q` row private class has the generated row mask. -/
theorem pointMask_eq_QQSurplusPairMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar other : Label}
    (hs : isSurplusStar sstar = true)
    (hother : isSurplusStar other = true)
    (hne : other ≠ sstar) :
    pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf sstar, pointOf other} :
          Finset α) =
      maskOfLabels [.Q1, .Q2, sstar, other] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  · cases other <;> simp [isSurplusStar] at hother hne ⊢
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]
  · cases other <;> simp [isSurplusStar] at hother hne ⊢
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]
  · cases other <;> simp [isSurplusStar] at hother hne ⊢
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]

/-- Swapped set-order form of `pointMask_eq_QQSurplusPairMask`. -/
theorem pointMask_eq_QQSurplusPairMask_swap
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar other : Label}
    (hs : isSurplusStar sstar = true)
    (hother : isSurplusStar other = true)
    (hne : other ≠ sstar) :
    pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf other, pointOf sstar} :
          Finset α) =
      maskOfLabels [.Q1, .Q2, sstar, other] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  · cases other <;> simp [isSurplusStar] at hother hne ⊢
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]
  · cases other <;> simp [isSurplusStar] at hother hne ⊢
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]
  · cases other <;> simp [isSurplusStar] at hother hne ⊢
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]
    · simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]

/-- A one-surplus, two-`.Q`, one-private row class has the generated mask. -/
theorem pointMask_eq_QQSurplusPrivateMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar otherPrivate : Label}
    (hs : isSurplusStar sstar = true)
    (hother : otherPrivate = .Pw ∨ otherPrivate = .Pu) :
    pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf sstar,
            pointOf otherPrivate} : Finset α) =
      maskOfLabels [.Q1, .Q2, sstar, otherPrivate] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hother with rfl | rfl <;>
      simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]

/-- Swapped set-order form of `pointMask_eq_QQSurplusPrivateMask`. -/
theorem pointMask_eq_QQSurplusPrivateMask_swap
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar otherPrivate : Label}
    (hs : isSurplusStar sstar = true)
    (hother : otherPrivate = .Pw ∨ otherPrivate = .Pu) :
    pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf otherPrivate,
            pointOf sstar} : Finset α) =
      maskOfLabels [.Q1, .Q2, sstar, otherPrivate] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hother with rfl | rfl <;>
      simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]

/-- A one-surplus, two-`.Q`, one-Moser row class has the generated mask. -/
theorem pointMask_eq_QQSurplusMoserMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar mlabel : Label}
    (hs : isSurplusStar sstar = true)
    (hmoser : mlabel = .u ∨ mlabel = .v ∨ mlabel = .w) :
    pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf sstar,
            pointOf mlabel} : Finset α) =
      maskOfLabels [.Q1, .Q2, sstar, mlabel] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hmoser with rfl | rfl | rfl <;>
      simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]

/-- Swapped set-order form of `pointMask_eq_QQSurplusMoserMask`. -/
theorem pointMask_eq_QQSurplusMoserMask_swap
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar mlabel : Label}
    (hs : isSurplusStar sstar = true)
    (hmoser : mlabel = .u ∨ mlabel = .v ∨ mlabel = .w) :
    pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf mlabel,
            pointOf sstar} : Finset α) =
      maskOfLabels [.Q1, .Q2, sstar, mlabel] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hmoser with rfl | rfl | rfl <;>
      simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
        Label.index]

/-- A one-`.Q`, one-surplus, two-Moser row class has the generated mask. -/
theorem pointMask_eq_QSurplusMoserPairMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf)
    {qlabel sstar mlabel₁ mlabel₂ : Label}
    (hq : qlabel = .Q1 ∨ qlabel = .Q2)
    (hs : isSurplusStar sstar = true)
    (hm₁ : mlabel₁ = .u ∨ mlabel₁ = .v ∨ mlabel₁ = .w)
    (hm₂ : mlabel₂ = .u ∨ mlabel₂ = .v ∨ mlabel₂ = .w)
    (hmne : mlabel₁ ≠ mlabel₂) :
    pointMask pointOf
        ({pointOf qlabel, pointOf mlabel₁, pointOf mlabel₂,
            pointOf sstar} : Finset α) =
      maskOfLabels [qlabel, sstar, mlabel₁, mlabel₂] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  rcases hq with rfl | rfl <;>
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hm₁ with rfl | rfl | rfl <;>
    rcases hm₂ with rfl | rfl | rfl <;>
      first
      | contradiction
      | simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
          Label.index]

/-- A one-`.Q`, two-surplus, one-private row class has the generated mask. -/
theorem pointMask_eq_QSurplusPairPrivateMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf)
    {qlabel sstar other otherPrivate : Label}
    (hq : qlabel = .Q1 ∨ qlabel = .Q2)
    (hs : isSurplusStar sstar = true)
    (hother : isSurplusStar other = true)
    (hne : other ≠ sstar)
    (hpriv : otherPrivate = .Pw ∨ otherPrivate = .Pu) :
    pointMask pointOf
        ({pointOf qlabel, pointOf otherPrivate, pointOf sstar,
            pointOf other} : Finset α) =
      maskOfLabels [qlabel, sstar, other, otherPrivate] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  rcases hq with rfl | rfl <;>
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    cases other <;> simp [isSurplusStar] at hother hne ⊢
    all_goals
      rcases hpriv with rfl | rfl <;>
        simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
          Label.index]

/-- Swapped surplus set-order form of
`pointMask_eq_QSurplusPairPrivateMask`. -/
theorem pointMask_eq_QSurplusPairPrivateMask_swap
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf)
    {qlabel sstar other otherPrivate : Label}
    (hq : qlabel = .Q1 ∨ qlabel = .Q2)
    (hs : isSurplusStar sstar = true)
    (hother : isSurplusStar other = true)
    (hne : other ≠ sstar)
    (hpriv : otherPrivate = .Pw ∨ otherPrivate = .Pu) :
    pointMask pointOf
        ({pointOf qlabel, pointOf otherPrivate, pointOf other,
            pointOf sstar} : Finset α) =
      maskOfLabels [qlabel, sstar, other, otherPrivate] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  rcases hq with rfl | rfl <;>
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    cases other <;> simp [isSurplusStar] at hother hne ⊢
    all_goals
      rcases hpriv with rfl | rfl <;>
        simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
          Label.index]

/-- A one-`.Q`, three-surplus row private class has the generated row mask. -/
theorem pointMask_eq_QSurplusTripleMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {qlabel : Label}
    (hq : qlabel = .Q1 ∨ qlabel = .Q2) :
    pointMask pointOf
        ({pointOf qlabel, pointOf .s1, pointOf .s2, pointOf .s3} :
          Finset α) =
      maskOfLabels [qlabel, .s1, .s2, .s3] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  rcases hq with rfl | rfl <;>
    simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
      Label.index]

/-- In row `ep_right_m0_s0_l1_r3`, the private selected class consists of
one `.Q` label and the three named surplus labels. -/
theorem erasedPinRow_ep_right_m0_s0_l1_r3_seed_mem_candidates_of_q_surplusTriple
    {sstar privateCenter qlabel : Label}
    (hs : isSurplusStar sstar = true)
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    (hq : qlabel = .Q1 ∨ qlabel = .Q2) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [qlabel, .s1, .s2, .s3] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_right_m0_s0_l1_r3_seeds_candidates := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hpriv with rfl | rfl <;>
    rcases hq with rfl | rfl <;>
      simp [erasedPinRow_ep_right_m0_s0_l1_r3_seeds_candidates,
        maskOfLabels, Label.bit, Label.index]

/-- In row `ep_left_m0_s0_l3_r1`, the private selected class consists of
one `.Q` label and the three named surplus labels. -/
theorem erasedPinRow_ep_left_m0_s0_l3_r1_seed_mem_candidates_of_q_surplusTriple
    {sstar privateCenter qlabel : Label}
    (hs : isSurplusStar sstar = true)
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    (hq : qlabel = .Q1 ∨ qlabel = .Q2) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [qlabel, .s1, .s2, .s3] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_left_m0_s0_l3_r1_seeds_candidates := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hpriv with rfl | rfl <;>
    rcases hq with rfl | rfl <;>
      simp [erasedPinRow_ep_left_m0_s0_l3_r1_seeds_candidates,
        maskOfLabels, Label.bit, Label.index]

/-- In row `ep_right_m0_s0_l2_r2`, the private selected class consists of the
two `.Q` labels and two distinct surplus labels, one of which is the erased
surplus star. -/
theorem erasedPinRow_ep_right_m0_s0_l2_r2_seed_mem_candidates_of_surplus_pair
    {sstar other privateCenter : Label}
    (hs : isSurplusStar sstar = true)
    (hother : isSurplusStar other = true)
    (hne : other ≠ sstar)
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [.Q1, .Q2, sstar, other] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates := by
  cases sstar <;> simp [isSurplusStar] at hs
  · cases other <;> simp [isSurplusStar] at hother hne
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]
  · cases other <;> simp [isSurplusStar] at hother hne
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]
  · cases other <;> simp [isSurplusStar] at hother hne
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]

/-- In row `ep_left_m0_s0_l2_r2`, the private selected class consists of the
two `.Q` labels and two distinct surplus labels, one of which is the erased
surplus star. -/
theorem erasedPinRow_ep_left_m0_s0_l2_r2_seed_mem_candidates_of_surplus_pair
    {sstar other privateCenter : Label}
    (hs : isSurplusStar sstar = true)
    (hother : isSurplusStar other = true)
    (hne : other ≠ sstar)
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [.Q1, .Q2, sstar, other] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates := by
  cases sstar <;> simp [isSurplusStar] at hs
  · cases other <;> simp [isSurplusStar] at hother hne
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]
  · cases other <;> simp [isSurplusStar] at hother hne
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]
  · cases other <;> simp [isSurplusStar] at hother hne
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]
    · rcases hpriv with rfl | rfl <;>
        simp [erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]

/-- In row `ep_right_m0_s1_l2_r1`, the private selected class consists of the
two `.Q` labels, the erased surplus star, and the other private point in the
same non-surplus cap. -/
theorem erasedPinRow_ep_right_m0_s1_l2_r1_seed_mem_candidates_of_same_pair
    {sstar privateCenter otherPrivate : Label}
    (hs : isSurplusStar sstar = true)
    (hpriv :
      (privateCenter = .Pw ∧ otherPrivate = .Pu) ∨
        (privateCenter = .Pu ∧ otherPrivate = .Pw)) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [.Q1, .Q2, sstar, otherPrivate] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_right_m0_s1_l2_r1_seeds_candidates := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hpriv with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;>
      simp [erasedPinRow_ep_right_m0_s1_l2_r1_seeds_candidates,
        maskOfLabels, Label.bit, Label.index]

/-- In row `ep_left_m0_s1_l1_r2`, the private selected class consists of the
two `.Q` labels, the erased surplus star, and the other private point in the
same non-surplus cap. -/
theorem erasedPinRow_ep_left_m0_s1_l1_r2_seed_mem_candidates_of_same_pair
    {sstar privateCenter otherPrivate : Label}
    (hs : isSurplusStar sstar = true)
    (hpriv :
      (privateCenter = .Pw ∧ otherPrivate = .Pu) ∨
        (privateCenter = .Pu ∧ otherPrivate = .Pw)) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [.Q1, .Q2, sstar, otherPrivate] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_left_m0_s1_l1_r2_seeds_candidates := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hpriv with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;>
      simp [erasedPinRow_ep_left_m0_s1_l1_r2_seeds_candidates,
        maskOfLabels, Label.bit, Label.index]

/-- In row `ep_right_m0_s1_l1_r2`, the private selected class consists of one
`.Q` label, the erased surplus star, another surplus label, and the other
private point in the same non-surplus cap. -/
theorem erasedPinRow_ep_right_m0_s1_l1_r2_seed_mem_candidates_of_q_surplus_pair_same
    {qlabel sstar other privateCenter otherPrivate : Label}
    (hq : qlabel = .Q1 ∨ qlabel = .Q2)
    (hs : isSurplusStar sstar = true)
    (hother : isSurplusStar other = true)
    (hne : other ≠ sstar)
    (hpriv :
      (privateCenter = .Pw ∧ otherPrivate = .Pu) ∨
        (privateCenter = .Pu ∧ otherPrivate = .Pw)) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [qlabel, sstar, other, otherPrivate] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates := by
  rcases hq with rfl | rfl <;>
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    cases other <;> simp [isSurplusStar] at hother hne
    all_goals
      rcases hpriv with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;>
        simp [erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]

/-- In row `ep_right_m1_s0_l2_r1`, the private selected class consists of the
two `.Q` labels, the erased surplus star, and one Moser label. -/
theorem erasedPinRow_ep_right_m1_s0_l2_r1_seed_mem_candidates_of_moser
    {sstar privateCenter mlabel : Label}
    (hs : isSurplusStar sstar = true)
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    (hmoser : mlabel = .u ∨ mlabel = .v ∨ mlabel = .w) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [.Q1, .Q2, sstar, mlabel] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_right_m1_s0_l2_r1_seeds_candidates := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hpriv with rfl | rfl <;>
    rcases hmoser with rfl | rfl | rfl <;>
      simp [erasedPinRow_ep_right_m1_s0_l2_r1_seeds_candidates,
        maskOfLabels, Label.bit, Label.index]

/-- In row `ep_left_m1_s0_l1_r2`, the private selected class consists of the
two `.Q` labels, the erased surplus star, and one Moser label. -/
theorem erasedPinRow_ep_left_m1_s0_l1_r2_seed_mem_candidates_of_moser
    {sstar privateCenter mlabel : Label}
    (hs : isSurplusStar sstar = true)
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    (hmoser : mlabel = .u ∨ mlabel = .v ∨ mlabel = .w) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [.Q1, .Q2, sstar, mlabel] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_left_m1_s0_l1_r2_seeds_candidates := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hpriv with rfl | rfl <;>
    rcases hmoser with rfl | rfl | rfl <;>
      simp [erasedPinRow_ep_left_m1_s0_l1_r2_seeds_candidates,
        maskOfLabels, Label.bit, Label.index]

/-- In row `ep_right_m2_s0_l1_r1`, the private selected class consists of one
`.Q` label, the erased surplus star, and two distinct Moser labels. -/
theorem erasedPinRow_ep_right_m2_s0_l1_r1_seed_mem_candidates_of_q_moser_pair
    {sstar privateCenter qlabel mlabel₁ mlabel₂ : Label}
    (hs : isSurplusStar sstar = true)
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    (hq : qlabel = .Q1 ∨ qlabel = .Q2)
    (hm₁ : mlabel₁ = .u ∨ mlabel₁ = .v ∨ mlabel₁ = .w)
    (hm₂ : mlabel₂ = .u ∨ mlabel₂ = .v ∨ mlabel₂ = .w)
    (hmne : mlabel₁ ≠ mlabel₂) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [qlabel, sstar, mlabel₁, mlabel₂] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_right_m2_s0_l1_r1_seeds_candidates := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hpriv with rfl | rfl <;>
    rcases hq with rfl | rfl <;>
    rcases hm₁ with rfl | rfl | rfl <;>
    rcases hm₂ with rfl | rfl | rfl <;>
      first
      | contradiction
      | simp [erasedPinRow_ep_right_m2_s0_l1_r1_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]

/-- In row `ep_left_m2_s0_l1_r1`, the private selected class consists of one
`.Q` label, the erased surplus star, and two distinct Moser labels. -/
theorem erasedPinRow_ep_left_m2_s0_l1_r1_seed_mem_candidates_of_q_moser_pair
    {sstar privateCenter qlabel mlabel₁ mlabel₂ : Label}
    (hs : isSurplusStar sstar = true)
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    (hq : qlabel = .Q1 ∨ qlabel = .Q2)
    (hm₁ : mlabel₁ = .u ∨ mlabel₁ = .v ∨ mlabel₁ = .w)
    (hm₂ : mlabel₂ = .u ∨ mlabel₂ = .v ∨ mlabel₂ = .w)
    (hmne : mlabel₁ ≠ mlabel₂) :
    ({ sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [qlabel, sstar, mlabel₁, mlabel₂] } :
      OneSidedSeed) ∈
        erasedPinRow_ep_left_m2_s0_l1_r1_seeds_candidates := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    rcases hpriv with rfl | rfl <;>
    rcases hq with rfl | rfl <;>
    rcases hm₁ with rfl | rfl | rfl <;>
    rcases hm₂ with rfl | rfl | rfl <;>
      first
      | contradiction
      | simp [erasedPinRow_ep_left_m2_s0_l1_r1_seeds_candidates,
          maskOfLabels, Label.bit, Label.index]

/-- If a point-class shadow realizes a generated row `ep_right_m0_s0_l2_r2`
seed, its private class cannot be cross-separated from the exact `.w` cap. -/
theorem false_of_erasedPinRow_ep_right_m0_s0_l2_r2_seed_private_w_crossSeparation
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have htrue := hsearchSep seed.privateCenter .w
  rw [hprivate, hwMask] at htrue
  have hfalse :=
    erasedPinRow_ep_right_m0_s0_l2_r2_seed_private_w_crossSeparation_false
      hseed
  rw [hfalse] at htrue
  exact Bool.false_ne_true htrue

/-- If a point-class shadow realizes a generated row `ep_left_m0_s0_l2_r2`
seed, its private class cannot be cross-separated from the exact `.w` cap. -/
theorem false_of_erasedPinRow_ep_left_m0_s0_l2_r2_seed_private_w_crossSeparation
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have htrue := hsearchSep seed.privateCenter .w
  rw [hprivate, hwMask] at htrue
  have hfalse :=
    erasedPinRow_ep_left_m0_s0_l2_r2_seed_private_w_crossSeparation_false
      hseed
  rw [hfalse] at htrue
  exact Bool.false_ne_true htrue

/-- If a point-class shadow realizes a generated row `ep_right_m0_s1_l2_r1`
seed, its private class cannot be cross-separated from the exact `.w` cap. -/
theorem false_of_erasedPinRow_ep_right_m0_s1_l2_r1_seed_private_w_crossSeparation
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_right_m0_s1_l2_r1_seeds_candidates)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have htrue := hsearchSep seed.privateCenter .w
  rw [hprivate, hwMask] at htrue
  have hfalse :=
    erasedPinRow_ep_right_m0_s1_l2_r1_seed_private_w_crossSeparation_false
      hseed
  rw [hfalse] at htrue
  exact Bool.false_ne_true htrue

/-- If a point-class shadow realizes a generated row `ep_right_m1_s0_l2_r1`
seed, its private class cannot be cross-separated from the exact `.w` cap. -/
theorem false_of_erasedPinRow_ep_right_m1_s0_l2_r1_seed_private_w_crossSeparation
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_right_m1_s0_l2_r1_seeds_candidates)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have htrue := hsearchSep seed.privateCenter .w
  rw [hprivate, hwMask] at htrue
  have hfalse :=
    erasedPinRow_ep_right_m1_s0_l2_r1_seed_private_w_crossSeparation_false
      hseed
  rw [hfalse] at htrue
  exact Bool.false_ne_true htrue

/-- If a point-class shadow realizes a generated row `ep_right_m2_s0_l1_r1`
seed, its private class cannot be cross-separated from the exact `.w` cap. -/
theorem false_of_erasedPinRow_ep_right_m2_s0_l1_r1_seed_private_w_crossSeparation
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_right_m2_s0_l1_r1_seeds_candidates)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have htrue := hsearchSep seed.privateCenter .w
  rw [hprivate, hwMask] at htrue
  have hfalse :=
    erasedPinRow_ep_right_m2_s0_l1_r1_seed_private_w_crossSeparation_false
      hseed
  rw [hfalse] at htrue
  exact Bool.false_ne_true htrue

/-- If a point-class shadow realizes a generated row `ep_left_m0_s1_l1_r2`
seed, its private class cannot be cross-separated from the exact `.w` cap. -/
theorem false_of_erasedPinRow_ep_left_m0_s1_l1_r2_seed_private_w_crossSeparation
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_left_m0_s1_l1_r2_seeds_candidates)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have htrue := hsearchSep seed.privateCenter .w
  rw [hprivate, hwMask] at htrue
  have hfalse :=
    erasedPinRow_ep_left_m0_s1_l1_r2_seed_private_w_crossSeparation_false
      hseed
  rw [hfalse] at htrue
  exact Bool.false_ne_true htrue

/-- If a point-class shadow realizes a generated row `ep_left_m1_s0_l1_r2`
seed, its private class cannot be cross-separated from the exact `.w` cap. -/
theorem false_of_erasedPinRow_ep_left_m1_s0_l1_r2_seed_private_w_crossSeparation
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_left_m1_s0_l1_r2_seeds_candidates)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have htrue := hsearchSep seed.privateCenter .w
  rw [hprivate, hwMask] at htrue
  have hfalse :=
    erasedPinRow_ep_left_m1_s0_l1_r2_seed_private_w_crossSeparation_false
      hseed
  rw [hfalse] at htrue
  exact Bool.false_ne_true htrue

/-- If a point-class shadow realizes a generated row `ep_left_m2_s0_l1_r1`
seed, its private class cannot be cross-separated from the exact `.w` cap. -/
theorem false_of_erasedPinRow_ep_left_m2_s0_l1_r1_seed_private_w_crossSeparation
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_left_m2_s0_l1_r1_seeds_candidates)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have htrue := hsearchSep seed.privateCenter .w
  rw [hprivate, hwMask] at htrue
  have hfalse :=
    erasedPinRow_ep_left_m2_s0_l1_r1_seed_private_w_crossSeparation_false
      hseed
  rw [hfalse] at htrue
  exact Bool.false_ne_true htrue

/-- Exact right row `(0,0,1,3)` produces one of the generated row seeds once
the three surplus-side selected points are embedded in the named surplus
triple.  This records the private-center mask equality needed by the row-level
seeded shadow contradiction. -/
theorem right_row0013_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 3)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hRtriple : SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3)
    (hxR : x ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    {privateCenter : Label}
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_right_m0_s0_l1_r3_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.right_row0013_selectedClass_eq_oppInterior2_singleton_surplusTriple
      hradius_pos hm hs hl hr hRtriple hs12 hs13 hs23 with
    ⟨q, _hLeq, hqOpp, hseleq⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  rcases exists_QLabel_rightPinnedLabelPoint_eq_of_mem_oppInterior2
      S p₁ p₂ q₁ q₂ s1 s2 s3 hqpair hqOpp with
    ⟨qlabel, hqlabel, hqlabel_eq⟩
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := privateCenter, kind := .own,
      privateMask := maskOfLabels [qlabel, .s1, .s2, .s3] }
  have hseedMem :
      seed ∈ erasedPinRow_ep_right_m0_s0_l1_r3_seeds_candidates := by
    exact
      erasedPinRow_ep_right_m0_s0_l1_r3_seed_mem_candidates_of_q_surplusTriple
        hsstar hpriv hqlabel
  refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
  let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  change pointMask pointOf (centerClass privateCenter) =
    maskOfLabels [qlabel, .s1, .s2, .s3]
  rw [hprivateClass, hseleq, ← hqlabel_eq]
  change pointMask pointOf
      ({pointOf qlabel, pointOf .s1, pointOf .s2, pointOf .s3} :
        Finset ℝ²) =
    maskOfLabels [qlabel, .s1, .s2, .s3]
  exact pointMask_eq_QSurplusTripleMask (pointOf := pointOf) hinj hqlabel

/-- Exact left row `(0,0,3,1)` produces one of the generated row seeds once
the three surplus-side selected points are embedded in the named surplus
triple.  This records the private-center mask equality needed by the row-level
seeded shadow contradiction. -/
theorem left_row0031_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 3)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hLtriple : SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3)
    (hxL : x ∈ SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    {privateCenter : Label}
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_left_m0_s0_l3_r1_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.left_row0031_selectedClass_eq_oppInterior1_singleton_surplusTriple
      hradius_pos hm hs hl hr hLtriple hs12 hs13 hs23 with
    ⟨q, _hReq, hqOpp, hseleq⟩
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hLtriple hxL
  rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  rcases exists_QLabel_leftPinnedLabelPoint_eq_of_mem_oppInterior1
      S p₁ p₂ q₁ q₂ s1 s2 s3 hqpair hqOpp with
    ⟨qlabel, hqlabel, hqlabel_eq⟩
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := privateCenter, kind := .own,
      privateMask := maskOfLabels [qlabel, .s1, .s2, .s3] }
  have hseedMem :
      seed ∈ erasedPinRow_ep_left_m0_s0_l3_r1_seeds_candidates := by
    exact
      erasedPinRow_ep_left_m0_s0_l3_r1_seed_mem_candidates_of_q_surplusTriple
        hsstar hpriv hqlabel
  refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
  let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  change pointMask pointOf (centerClass privateCenter) =
    maskOfLabels [qlabel, .s1, .s2, .s3]
  rw [hprivateClass, hseleq, ← hqlabel_eq]
  change pointMask pointOf
      ({pointOf qlabel, pointOf .s1, pointOf .s2, pointOf .s3} :
        Finset ℝ²) =
    maskOfLabels [qlabel, .s1, .s2, .s3]
  exact pointMask_eq_QSurplusTripleMask (pointOf := pointOf) hinj hqlabel

/-- Exact right row `(0,0,2,2)` produces one of the generated row seeds once
the two surplus-side selected points are embedded in the named surplus triple.
This records the private-center mask equality needed by the row-level seeded
shadow contradiction. -/
theorem right_row0022_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hRtriple : SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    {privateCenter : Label}
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.right_row0022_selectedClass_eq_oppInterior2_union_surplusPair
      hradius_pos hm hs hl hr hqpair with
    ⟨r₁, r₂, hr12, hReq, _hRsub, hseleq⟩
  have hxPair : x ∈ ({r₁, r₂} : Finset ℝ²) := by
    rw [← hReq]
    exact hxR
  simp only [Finset.mem_insert, Finset.mem_singleton] at hxPair
  rcases hxPair with hx_eq | hx_eq
  · subst x
    have hr₁Triple : r₁ ∈ ({s1, s2, s3} : Finset ℝ²) := by
      apply hRtriple
      rw [hReq]
      simp
    have hr₂Triple : r₂ ∈ ({s1, s2, s3} : Finset ℝ²) := by
      apply hRtriple
      rw [hReq]
      simp
    rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
        S p₁ p₂ q₁ q₂ s1 s2 s3 hr₁Triple with
      ⟨sstar, hsstar, hsstar_eq⟩
    rcases exists_otherSurplusStar_rightPinnedLabelPoint_eq_of_mem_triple
        S p₁ p₂ q₁ q₂ s1 s2 s3 hr₂Triple (Ne.symm hr12)
        hsstar_eq with
      ⟨other, hother, hother_ne, hother_eq⟩
    let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [.Q1, .Q2, sstar, other] }
    have hseedMem :
        seed ∈ erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates := by
      exact
        erasedPinRow_ep_right_m0_s0_l2_r2_seed_mem_candidates_of_surplus_pair
          hsstar hother hother_ne hpriv
    refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
    let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
    change pointMask pointOf (centerClass privateCenter) =
      maskOfLabels [.Q1, .Q2, sstar, other]
    rw [hprivateClass, hseleq]
    rw [← hsstar_eq, ← hother_eq]
    change pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf sstar, pointOf other} :
          Finset ℝ²) =
      maskOfLabels [.Q1, .Q2, sstar, other]
    exact pointMask_eq_QQSurplusPairMask (pointOf := pointOf) hinj hsstar
      hother hother_ne
  · subst x
    have hr₁Triple : r₁ ∈ ({s1, s2, s3} : Finset ℝ²) := by
      apply hRtriple
      rw [hReq]
      simp
    have hr₂Triple : r₂ ∈ ({s1, s2, s3} : Finset ℝ²) := by
      apply hRtriple
      rw [hReq]
      simp
    rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
        S p₁ p₂ q₁ q₂ s1 s2 s3 hr₂Triple with
      ⟨sstar, hsstar, hsstar_eq⟩
    rcases exists_otherSurplusStar_rightPinnedLabelPoint_eq_of_mem_triple
        S p₁ p₂ q₁ q₂ s1 s2 s3 hr₁Triple hr12 hsstar_eq with
      ⟨other, hother, hother_ne, hother_eq⟩
    let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [.Q1, .Q2, sstar, other] }
    have hseedMem :
        seed ∈ erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates := by
      exact
        erasedPinRow_ep_right_m0_s0_l2_r2_seed_mem_candidates_of_surplus_pair
          hsstar hother hother_ne hpriv
    refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
    let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
    change pointMask pointOf (centerClass privateCenter) =
      maskOfLabels [.Q1, .Q2, sstar, other]
    rw [hprivateClass, hseleq]
    rw [← hother_eq, ← hsstar_eq]
    change pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf other, pointOf sstar} :
          Finset ℝ²) =
      maskOfLabels [.Q1, .Q2, sstar, other]
    exact pointMask_eq_QQSurplusPairMask_swap (pointOf := pointOf) hinj
      hsstar hother hother_ne

/-- Exact right row `(0,0,2,2)` is incompatible with the finite
cross-separation interface once the private center is one of the two named
opposite-cap interior labels. -/
theorem false_of_right_row0022_private_w_crossSeparation
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hRtriple : SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    {privateCenter : Label}
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius)
    (hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases right_row0022_exists_erasedPinRowSeed_privateMask S hM44
      hradius_pos hm hs hl hr hinj hqpair hRtriple hxR hpriv
      hprivateClass with
    ⟨seed, hseed, _hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
  exact false_of_erasedPinRow_ep_right_m0_s0_l2_r2_seed_private_w_crossSeparation
    hseed hwMask hprivate hsearchSep

/-- Exact right row `(0,1,2,1)` produces one of the generated row seeds once
the surplus-side singleton is embedded in the named surplus triple.  The
same-cap singleton is the other named private point. -/
theorem right_row0121_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    {privateCenter otherPrivate : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw ∧ otherPrivate = .Pu) ∨
        (center = p₂ ∧ privateCenter = .Pu ∧ otherPrivate = .Pw))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_right_m0_s1_l2_r1_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.right_row0121_selectedClass_eq_oppInterior2_union_sameCap_surplus
      hradius_pos hm hs hl hr hqpair with
    ⟨c, r, hCeq, hReq, _hrSurplus, hseleq⟩
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  have hx_eq_r : x = r := by
    have hxR' : x ∈ ({r} : Finset ℝ²) := by
      rw [← hReq]
      exact hxR
    simpa using hxR'
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := privateCenter, kind := .own,
      privateMask := maskOfLabels [.Q1, .Q2, sstar, otherPrivate] }
  have hseedMem :
      seed ∈ erasedPinRow_ep_right_m0_s1_l2_r1_seeds_candidates := by
    exact
      erasedPinRow_ep_right_m0_s1_l2_r1_seed_mem_candidates_of_same_pair
        hsstar
        (by
          rcases hcenter with ⟨_, hpriv, hother⟩ | ⟨_, hpriv, hother⟩
          · exact Or.inl ⟨hpriv, hother⟩
          · exact Or.inr ⟨hpriv, hother⟩)
  refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
  let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  rcases hcenter with ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩
  · have hcap :
        S.capInteriorByIndex S.oppIndex1 = ({center, p₂} : Finset ℝ²) := by
      simpa [SurplusCapPacket.oppInterior1] using hpair
    have herase :
        (S.capInteriorByIndex S.oppIndex1).erase center =
          ({p₂} : Finset ℝ²) := by
      rw [hcap]
      simp [hp12]
    have hc_eq : c = p₂ := by
      have hcC : c ∈ SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex1).erase center := by
        rw [hCeq]
        simp
      have hcErase :
          c ∈ (S.capInteriorByIndex S.oppIndex1).erase center :=
        (Finset.mem_inter.mp hcC).2
      simpa [herase] using hcErase
    change pointMask pointOf (centerClass .Pw) =
      maskOfLabels [.Q1, .Q2, sstar, .Pu]
    rw [hprivateClass, hseleq, hc_eq, ← hx_eq_r, ← hsstar_eq]
    change pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf .Pu, pointOf sstar} :
          Finset ℝ²) =
      maskOfLabels [.Q1, .Q2, sstar, .Pu]
    exact pointMask_eq_QQSurplusPrivateMask_swap
      (pointOf := pointOf) hinj hsstar (Or.inr rfl)
  · have hcap :
        S.capInteriorByIndex S.oppIndex1 = ({p₁, center} : Finset ℝ²) := by
      simpa [SurplusCapPacket.oppInterior1] using hpair
    have herase :
        (S.capInteriorByIndex S.oppIndex1).erase center =
          ({p₁} : Finset ℝ²) := by
      rw [hcap]
      ext y
      constructor
      · intro hy
        simp only [Finset.mem_erase, Finset.mem_insert,
          Finset.mem_singleton] at hy
        rcases hy with ⟨hyne, hypair⟩
        rcases hypair with h | h
        · simp [h]
        · exact False.elim (hyne h)
      · intro hy
        have hyEq : y = p₁ := by
          simpa using hy
        simp only [Finset.mem_erase, Finset.mem_insert,
          Finset.mem_singleton]
        exact ⟨by simpa [hyEq] using hp12, Or.inl hyEq⟩
    have hc_eq : c = p₁ := by
      have hcC : c ∈ SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex1).erase center := by
        rw [hCeq]
        simp
      have hcErase :
          c ∈ (S.capInteriorByIndex S.oppIndex1).erase center :=
        (Finset.mem_inter.mp hcC).2
      simpa [herase] using hcErase
    change pointMask pointOf (centerClass .Pu) =
      maskOfLabels [.Q1, .Q2, sstar, .Pw]
    rw [hprivateClass, hseleq, hc_eq, ← hx_eq_r, ← hsstar_eq]
    change pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf .Pw, pointOf sstar} :
          Finset ℝ²) =
      maskOfLabels [.Q1, .Q2, sstar, .Pw]
    exact pointMask_eq_QQSurplusPrivateMask_swap
      (pointOf := pointOf) hinj hsstar (Or.inl rfl)

/-- Exact right row `(0,1,2,1)` is incompatible with the finite
cross-separation interface once the private center is one of the two named
opposite-cap interior labels. -/
theorem false_of_right_row0121_private_w_crossSeparation
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    {privateCenter otherPrivate : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw ∧ otherPrivate = .Pu) ∨
        (center = p₂ ∧ privateCenter = .Pu ∧ otherPrivate = .Pw))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius)
    (hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases right_row0121_exists_erasedPinRowSeed_privateMask S hM44
      hradius_pos hm hs hl hr hinj hp12 hpair hqpair hxTriple hxR
      hcenter hprivateClass with
    ⟨seed, hseed, _hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
  exact false_of_erasedPinRow_ep_right_m0_s1_l2_r1_seed_private_w_crossSeparation
    hseed hwMask hprivate hsearchSep

/-- Exact right row `(0,1,1,2)` produces one of the generated row seeds once
the surplus-side pair is embedded in the named surplus triple.  The private
mask records the same-cap singleton, the selected `.Q` point, and both
surplus-side selected points. -/
theorem right_row0112_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hRtriple : SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    {privateCenter otherPrivate : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw ∧ otherPrivate = .Pu) ∨
        (center = p₂ ∧ privateCenter = .Pu ∧ otherPrivate = .Pw))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.right_row0112_selectedClass_eq_oppInterior2_singleton_sameCap_surplusPair
      hradius_pos hm hs hl hr with
    ⟨q, c, r₁, r₂, hr12, hCeq, hLeq, hqOpp, hReq, _hRsub, hseleq⟩
  rcases exists_QLabel_rightPinnedLabelPoint_eq_of_mem_oppInterior2
      S p₁ p₂ q₁ q₂ s1 s2 s3 hqpair hqOpp with
    ⟨qlabel, hqLabel, hq_eq⟩
  let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hprivLabels :
      (privateCenter = .Pw ∧ otherPrivate = .Pu) ∨
        (privateCenter = .Pu ∧ otherPrivate = .Pw) := by
    rcases hcenter with ⟨_, hpriv, hother⟩ | ⟨_, hpriv, hother⟩
    · exact Or.inl ⟨hpriv, hother⟩
    · exact Or.inr ⟨hpriv, hother⟩
  have hotherPrivate : otherPrivate = .Pw ∨ otherPrivate = .Pu := by
    rcases hprivLabels with ⟨_, hother⟩ | ⟨_, hother⟩
    · exact Or.inr hother
    · exact Or.inl hother
  have hc_eq_otherPrivate : c = pointOf otherPrivate := by
    rcases hcenter with ⟨hcenter_eq, hpriv, hother⟩ |
      ⟨hcenter_eq, hpriv, hother⟩
    · subst center
      subst privateCenter
      subst otherPrivate
      have hcap :
          S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) := by
        simpa [SurplusCapPacket.oppInterior1] using hpair
      have herase :
          (S.capInteriorByIndex S.oppIndex1).erase p₁ =
            ({p₂} : Finset ℝ²) := by
        rw [hcap]
        simp [hp12]
      have hc_eq : c = p₂ := by
        have hcC : c ∈ SelectedClass A p₁ radius ∩
            (S.capInteriorByIndex S.oppIndex1).erase p₁ := by
          rw [hCeq]
          simp
        have hcErase :
            c ∈ (S.capInteriorByIndex S.oppIndex1).erase p₁ :=
          (Finset.mem_inter.mp hcC).2
        simpa [herase] using hcErase
      simpa [pointOf, rightPinnedLabelPoint] using hc_eq
    · subst center
      subst privateCenter
      subst otherPrivate
      have hcap :
          S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) := by
        simpa [SurplusCapPacket.oppInterior1] using hpair
      have herase :
          (S.capInteriorByIndex S.oppIndex1).erase p₂ =
            ({p₁} : Finset ℝ²) := by
        rw [hcap]
        ext y
        constructor
        · intro hy
          simp only [Finset.mem_erase, Finset.mem_insert,
            Finset.mem_singleton] at hy
          rcases hy with ⟨hyne, hypair⟩
          rcases hypair with h | h
          · simpa using h
          · exact False.elim (hyne h)
        · intro hy
          have hyEq : y = p₁ := by
            simpa using hy
          simp only [Finset.mem_erase, Finset.mem_insert,
            Finset.mem_singleton]
          exact ⟨by simpa [hyEq] using hp12, Or.inl hyEq⟩
      have hc_eq : c = p₁ := by
        have hcC : c ∈ SelectedClass A p₂ radius ∩
            (S.capInteriorByIndex S.oppIndex1).erase p₂ := by
          rw [hCeq]
          simp
        have hcErase :
            c ∈ (S.capInteriorByIndex S.oppIndex1).erase p₂ :=
          (Finset.mem_inter.mp hcC).2
        simpa [herase] using hcErase
      simpa [pointOf, rightPinnedLabelPoint] using hc_eq
  have hxPair : x ∈ ({r₁, r₂} : Finset ℝ²) := by
    rw [← hReq]
    exact hxR
  simp only [Finset.mem_insert, Finset.mem_singleton] at hxPair
  have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) := hRtriple hxR
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  rcases hxPair with hx_eq_r₁ | hx_eq_r₂
  · have hr₂Triple : r₂ ∈ ({s1, s2, s3} : Finset ℝ²) := by
      exact hRtriple (by
        rw [hReq]
        simp)
    rcases exists_otherSurplusStar_rightPinnedLabelPoint_eq_of_mem_triple
        S p₁ p₂ q₁ q₂ s1 s2 s3 (x := x) (y := r₂)
        hr₂Triple
        (by
          intro hr₂x
          exact hr12 (by rw [← hx_eq_r₁, ← hr₂x]))
        hsstar_eq with
      ⟨other, hother, hne, hother_eq⟩
    let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [qlabel, sstar, other, otherPrivate] }
    have hseedMem :
        seed ∈ erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates := by
      exact
        erasedPinRow_ep_right_m0_s1_l1_r2_seed_mem_candidates_of_q_surplus_pair_same
          hqLabel hsstar hother hne hprivLabels
    refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
    change pointMask pointOf (centerClass privateCenter) =
      maskOfLabels [qlabel, sstar, other, otherPrivate]
    rw [hprivateClass, hseleq, ← hq_eq, hc_eq_otherPrivate, ← hx_eq_r₁,
      ← hsstar_eq, ← hother_eq]
    change pointMask pointOf
        ({pointOf qlabel, pointOf otherPrivate, pointOf sstar,
            pointOf other} : Finset ℝ²) =
      maskOfLabels [qlabel, sstar, other, otherPrivate]
    exact pointMask_eq_QSurplusPairPrivateMask
      (pointOf := pointOf) hinj hqLabel hsstar hother hne hotherPrivate
  · have hr₁Triple : r₁ ∈ ({s1, s2, s3} : Finset ℝ²) := by
      exact hRtriple (by
        rw [hReq]
        simp)
    rcases exists_otherSurplusStar_rightPinnedLabelPoint_eq_of_mem_triple
        S p₁ p₂ q₁ q₂ s1 s2 s3 (x := x) (y := r₁)
        hr₁Triple
        (by
          intro hr₁x
          exact hr12 (by rw [hr₁x, hx_eq_r₂]))
        hsstar_eq with
      ⟨other, hother, hne, hother_eq⟩
    let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [qlabel, sstar, other, otherPrivate] }
    have hseedMem :
        seed ∈ erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates := by
      exact
        erasedPinRow_ep_right_m0_s1_l1_r2_seed_mem_candidates_of_q_surplus_pair_same
          hqLabel hsstar hother hne hprivLabels
    refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
    change pointMask pointOf (centerClass privateCenter) =
      maskOfLabels [qlabel, sstar, other, otherPrivate]
    rw [hprivateClass, hseleq, ← hq_eq, hc_eq_otherPrivate, ← hother_eq,
      ← hx_eq_r₂, ← hsstar_eq]
    change pointMask pointOf
        ({pointOf qlabel, pointOf otherPrivate, pointOf other,
            pointOf sstar} : Finset ℝ²) =
      maskOfLabels [qlabel, sstar, other, otherPrivate]
    exact pointMask_eq_QSurplusPairPrivateMask_swap
      (pointOf := pointOf) hinj hqLabel hsstar hother hne hotherPrivate

/-- Exact right row `(1,0,2,1)` produces one of the generated row seeds once
the surplus-side singleton is embedded in the named surplus triple and the
Moser singleton is matched to one of `.u/.v/.w`. -/
theorem right_row1021_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    {privateCenter : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw) ∨
        (center = p₂ ∧ privateCenter = .Pu))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_right_m1_s0_l2_r1_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.right_row1021_selectedClass_eq_moser_oppInterior2_surplus
      hradius_pos hm hs hl hr hqpair with
    ⟨m, r, _hMeq, hmVerts, hReq, _hrSurplus, hseleq⟩
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  rcases exists_moserLabel_rightPinnedLabelPoint_eq_of_mem_triangle
      S p₁ p₂ q₁ q₂ s1 s2 s3 hmVerts with
    ⟨mlabel, hmlabel, hmlabel_eq⟩
  have hx_eq_r : x = r := by
    have hxR' : x ∈ ({r} : Finset ℝ²) := by
      rw [← hReq]
      exact hxR
    simpa using hxR'
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := privateCenter, kind := .own,
      privateMask := maskOfLabels [.Q1, .Q2, sstar, mlabel] }
  have hseedMem :
      seed ∈ erasedPinRow_ep_right_m1_s0_l2_r1_seeds_candidates := by
    exact
      erasedPinRow_ep_right_m1_s0_l2_r1_seed_mem_candidates_of_moser
        hsstar
        (by
          rcases hcenter with ⟨_, hpriv⟩ | ⟨_, hpriv⟩
          · exact Or.inl hpriv
          · exact Or.inr hpriv)
        hmlabel
  refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
  let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  change pointMask pointOf (centerClass privateCenter) =
    maskOfLabels [.Q1, .Q2, sstar, mlabel]
  rw [hprivateClass, hseleq, ← hmlabel_eq, ← hx_eq_r, ← hsstar_eq]
  change pointMask pointOf
      ({pointOf .Q1, pointOf .Q2, pointOf mlabel, pointOf sstar} :
        Finset ℝ²) =
    maskOfLabels [.Q1, .Q2, sstar, mlabel]
  exact pointMask_eq_QQSurplusMoserMask_swap
    (pointOf := pointOf) hinj hsstar hmlabel

/-- Exact right row `(1,0,2,1)` is incompatible with the finite
cross-separation interface once the private center is one of the two named
opposite-cap interior labels. -/
theorem false_of_right_row1021_private_w_crossSeparation
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    {privateCenter : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw) ∨
        (center = p₂ ∧ privateCenter = .Pu))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius)
    (hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases right_row1021_exists_erasedPinRowSeed_privateMask S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxR hcenter
      hprivateClass with
    ⟨seed, hseed, _hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
  exact false_of_erasedPinRow_ep_right_m1_s0_l2_r1_seed_private_w_crossSeparation
    hseed hwMask hprivate hsearchSep

/-- Exact right row `(2,0,1,1)` produces one of the generated row seeds once
the surplus-side singleton is embedded in the named surplus triple, the
opposite-pair singleton is matched to `.Q1/.Q2`, and the two Moser points are
matched to distinct Moser labels. -/
theorem right_row2011_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 2)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    {privateCenter : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw) ∨
        (center = p₂ ∧ privateCenter = .Pu))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_right_m2_s0_l1_r1_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.right_row2011_selectedClass_eq_moserPair_oppInterior2_surplus
      hradius_pos hm hs hl hr with
    ⟨m₁, m₂, q, r, hm₁₂, _hMeq, hm₁Verts, hm₂Verts, hLeq, hqOpp,
      hReq, _hrSurplus, hseleq⟩
  rcases exists_surplusStar_rightPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  rcases exists_QLabel_rightPinnedLabelPoint_eq_of_mem_oppInterior2
      S p₁ p₂ q₁ q₂ s1 s2 s3 hqpair hqOpp with
    ⟨qlabel, hqlabel, hqlabel_eq⟩
  rcases exists_moserLabel_rightPinnedLabelPoint_eq_of_mem_triangle
      S p₁ p₂ q₁ q₂ s1 s2 s3 hm₁Verts with
    ⟨mlabel₁, hmlabel₁, hmlabel₁_eq⟩
  rcases exists_moserLabel_rightPinnedLabelPoint_eq_of_mem_triangle
      S p₁ p₂ q₁ q₂ s1 s2 s3 hm₂Verts with
    ⟨mlabel₂, hmlabel₂, hmlabel₂_eq⟩
  have hmlabel_ne : mlabel₁ ≠ mlabel₂ := by
    intro hsame
    exact hm₁₂ (by
      rw [← hmlabel₁_eq, hsame, hmlabel₂_eq])
  have hx_eq_r : x = r := by
    have hxR' : x ∈ ({r} : Finset ℝ²) := by
      rw [← hReq]
      exact hxR
    simpa using hxR'
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := privateCenter, kind := .own,
      privateMask := maskOfLabels [qlabel, sstar, mlabel₁, mlabel₂] }
  have hseedMem :
      seed ∈ erasedPinRow_ep_right_m2_s0_l1_r1_seeds_candidates := by
    exact
      erasedPinRow_ep_right_m2_s0_l1_r1_seed_mem_candidates_of_q_moser_pair
        hsstar
        (by
          rcases hcenter with ⟨_, hpriv⟩ | ⟨_, hpriv⟩
          · exact Or.inl hpriv
          · exact Or.inr hpriv)
        hqlabel hmlabel₁ hmlabel₂ hmlabel_ne
  refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
  let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  change pointMask pointOf (centerClass privateCenter) =
    maskOfLabels [qlabel, sstar, mlabel₁, mlabel₂]
  rw [hprivateClass, hseleq, ← hqlabel_eq, ← hmlabel₁_eq,
    ← hmlabel₂_eq, ← hx_eq_r, ← hsstar_eq]
  change pointMask pointOf
      ({pointOf qlabel, pointOf mlabel₁, pointOf mlabel₂,
          pointOf sstar} : Finset ℝ²) =
    maskOfLabels [qlabel, sstar, mlabel₁, mlabel₂]
  exact pointMask_eq_QSurplusMoserPairMask
    (pointOf := pointOf) hinj hqlabel hsstar hmlabel₁ hmlabel₂ hmlabel_ne

/-- Exact right row `(2,0,1,1)` is incompatible with the finite
cross-separation interface once the private center is one of the two named
opposite-cap interior labels. -/
theorem false_of_right_row2011_private_w_crossSeparation
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 2)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxR : x ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1)
    {privateCenter : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw) ∨
        (center = p₂ ∧ privateCenter = .Pu))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius)
    (hwMask :
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases right_row2011_exists_erasedPinRowSeed_privateMask S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxR hcenter
      hprivateClass with
    ⟨seed, hseed, _hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
  exact false_of_erasedPinRow_ep_right_m2_s0_l1_r1_seed_private_w_crossSeparation
    hseed hwMask hprivate hsearchSep

/-- Exact left row `(0,1,1,2)` produces one of the generated row seeds once
the surplus-side singleton is embedded in the named surplus triple.  The
same-cap singleton is the other named private point. -/
theorem left_row0112_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex2 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    {privateCenter otherPrivate : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw ∧ otherPrivate = .Pu) ∨
        (center = p₂ ∧ privateCenter = .Pu ∧ otherPrivate = .Pw))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_left_m0_s1_l1_r2_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.left_row0112_selectedClass_eq_oppInterior1_union_sameCap_surplus
      hradius_pos hm hs hl hr hqpair with
    ⟨c, l, hCeq, hLeq, _hlSurplus, hseleq⟩
  rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  have hx_eq_l : x = l := by
    have hxL' : x ∈ ({l} : Finset ℝ²) := by
      rw [← hLeq]
      exact hxL
    simpa using hxL'
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := privateCenter, kind := .own,
      privateMask := maskOfLabels [.Q1, .Q2, sstar, otherPrivate] }
  have hseedMem :
      seed ∈ erasedPinRow_ep_left_m0_s1_l1_r2_seeds_candidates := by
    exact
      erasedPinRow_ep_left_m0_s1_l1_r2_seed_mem_candidates_of_same_pair
        hsstar
        (by
          rcases hcenter with ⟨_, hpriv, hother⟩ | ⟨_, hpriv, hother⟩
          · exact Or.inl ⟨hpriv, hother⟩
          · exact Or.inr ⟨hpriv, hother⟩)
  refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
  let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  rcases hcenter with ⟨rfl, rfl, rfl⟩ | ⟨rfl, rfl, rfl⟩
  · have hcap :
        S.capInteriorByIndex S.oppIndex2 = ({center, p₂} : Finset ℝ²) := by
      simpa [SurplusCapPacket.oppInterior2] using hpair
    have herase :
        (S.capInteriorByIndex S.oppIndex2).erase center =
          ({p₂} : Finset ℝ²) := by
      rw [hcap]
      simp [hp12]
    have hc_eq : c = p₂ := by
      have hcC : c ∈ SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex2).erase center := by
        rw [hCeq]
        simp
      have hcErase :
          c ∈ (S.capInteriorByIndex S.oppIndex2).erase center :=
        (Finset.mem_inter.mp hcC).2
      simpa [herase] using hcErase
    change pointMask pointOf (centerClass .Pw) =
      maskOfLabels [.Q1, .Q2, sstar, .Pu]
    rw [hprivateClass, hseleq, hc_eq, ← hx_eq_l, ← hsstar_eq]
    change pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf .Pu, pointOf sstar} :
          Finset ℝ²) =
      maskOfLabels [.Q1, .Q2, sstar, .Pu]
    exact pointMask_eq_QQSurplusPrivateMask_swap
      (pointOf := pointOf) hinj hsstar (Or.inr rfl)
  · have hcap :
        S.capInteriorByIndex S.oppIndex2 = ({p₁, center} : Finset ℝ²) := by
      simpa [SurplusCapPacket.oppInterior2] using hpair
    have herase :
        (S.capInteriorByIndex S.oppIndex2).erase center =
          ({p₁} : Finset ℝ²) := by
      rw [hcap]
      ext y
      constructor
      · intro hy
        simp only [Finset.mem_erase, Finset.mem_insert,
          Finset.mem_singleton] at hy
        rcases hy with ⟨hyne, hypair⟩
        rcases hypair with h | h
        · simp [h]
        · exact False.elim (hyne h)
      · intro hy
        have hyEq : y = p₁ := by
          simpa using hy
        simp only [Finset.mem_erase, Finset.mem_insert,
          Finset.mem_singleton]
        exact ⟨by simpa [hyEq] using hp12, Or.inl hyEq⟩
    have hc_eq : c = p₁ := by
      have hcC : c ∈ SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex2).erase center := by
        rw [hCeq]
        simp
      have hcErase :
          c ∈ (S.capInteriorByIndex S.oppIndex2).erase center :=
        (Finset.mem_inter.mp hcC).2
      simpa [herase] using hcErase
    change pointMask pointOf (centerClass .Pu) =
      maskOfLabels [.Q1, .Q2, sstar, .Pw]
    rw [hprivateClass, hseleq, hc_eq, ← hx_eq_l, ← hsstar_eq]
    change pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf .Pw, pointOf sstar} :
          Finset ℝ²) =
      maskOfLabels [.Q1, .Q2, sstar, .Pw]
    exact pointMask_eq_QQSurplusPrivateMask_swap
      (pointOf := pointOf) hinj hsstar (Or.inl rfl)

/-- Exact left row `(0,1,1,2)` is incompatible with the finite
cross-separation interface once the private center is one of the two named
opposite-cap interior labels. -/
theorem false_of_left_row0112_private_w_crossSeparation
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex2 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    {privateCenter otherPrivate : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw ∧ otherPrivate = .Pu) ∨
        (center = p₂ ∧ privateCenter = .Pu ∧ otherPrivate = .Pw))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius)
    (hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases left_row0112_exists_erasedPinRowSeed_privateMask S hM44
      hradius_pos hm hs hl hr hinj hp12 hpair hqpair hxTriple hxL
      hcenter hprivateClass with
    ⟨seed, hseed, _hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
  exact false_of_erasedPinRow_ep_left_m0_s1_l1_r2_seed_private_w_crossSeparation
    hseed hwMask hprivate hsearchSep

/-- Exact left row `(1,0,1,2)` produces one of the generated row seeds once
the surplus-side singleton is embedded in the named surplus triple and the
Moser singleton is matched to one of `.u/.v/.w`. -/
theorem left_row1012_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    {privateCenter : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw) ∨
        (center = p₂ ∧ privateCenter = .Pu))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_left_m1_s0_l1_r2_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.left_row1012_selectedClass_eq_moser_oppInterior1_surplus
      hradius_pos hm hs hl hr hqpair with
    ⟨m, l, _hMeq, hmVerts, hLeq, _hlSurplus, hseleq⟩
  rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  rcases exists_moserLabel_leftPinnedLabelPoint_eq_of_mem_triangle
      S p₁ p₂ q₁ q₂ s1 s2 s3 hmVerts with
    ⟨mlabel, hmlabel, hmlabel_eq⟩
  have hx_eq_l : x = l := by
    have hxL' : x ∈ ({l} : Finset ℝ²) := by
      rw [← hLeq]
      exact hxL
    simpa using hxL'
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := privateCenter, kind := .own,
      privateMask := maskOfLabels [.Q1, .Q2, sstar, mlabel] }
  have hseedMem :
      seed ∈ erasedPinRow_ep_left_m1_s0_l1_r2_seeds_candidates := by
    exact
      erasedPinRow_ep_left_m1_s0_l1_r2_seed_mem_candidates_of_moser
        hsstar
        (by
          rcases hcenter with ⟨_, hpriv⟩ | ⟨_, hpriv⟩
          · exact Or.inl hpriv
          · exact Or.inr hpriv)
        hmlabel
  refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
  let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  change pointMask pointOf (centerClass privateCenter) =
    maskOfLabels [.Q1, .Q2, sstar, mlabel]
  rw [hprivateClass, hseleq, ← hmlabel_eq, ← hx_eq_l, ← hsstar_eq]
  change pointMask pointOf
      ({pointOf .Q1, pointOf .Q2, pointOf mlabel, pointOf sstar} :
        Finset ℝ²) =
    maskOfLabels [.Q1, .Q2, sstar, mlabel]
  exact pointMask_eq_QQSurplusMoserMask_swap
    (pointOf := pointOf) hinj hsstar hmlabel

/-- Exact left row `(1,0,1,2)` is incompatible with the finite
cross-separation interface once the private center is one of the two named
opposite-cap interior labels. -/
theorem false_of_left_row1012_private_w_crossSeparation
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    {privateCenter : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw) ∨
        (center = p₂ ∧ privateCenter = .Pu))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius)
    (hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases left_row1012_exists_erasedPinRowSeed_privateMask S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxL hcenter
      hprivateClass with
    ⟨seed, hseed, _hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
  exact false_of_erasedPinRow_ep_left_m1_s0_l1_r2_seed_private_w_crossSeparation
    hseed hwMask hprivate hsearchSep

/-- Exact left row `(2,0,1,1)` produces one of the generated row seeds once
the surplus-side singleton is embedded in the named surplus triple, the
opposite-pair singleton is matched to `.Q1/.Q2`, and the two Moser points are
matched to distinct Moser labels. -/
theorem left_row2011_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 2)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    {privateCenter : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw) ∨
        (center = p₂ ∧ privateCenter = .Pu))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_left_m2_s0_l1_r1_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.left_row2011_selectedClass_eq_moserPair_oppInterior1_surplus
      hradius_pos hm hs hl hr with
    ⟨m₁, m₂, q, l, hm₁₂, _hMeq, hm₁Verts, hm₂Verts, hReq, hqOpp,
      hLeq, _hlSurplus, hseleq⟩
  rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
      S p₁ p₂ q₁ q₂ s1 s2 s3 hxTriple with
    ⟨sstar, hsstar, hsstar_eq⟩
  rcases exists_QLabel_leftPinnedLabelPoint_eq_of_mem_oppInterior1
      S p₁ p₂ q₁ q₂ s1 s2 s3 hqpair hqOpp with
    ⟨qlabel, hqlabel, hqlabel_eq⟩
  rcases exists_moserLabel_leftPinnedLabelPoint_eq_of_mem_triangle
      S p₁ p₂ q₁ q₂ s1 s2 s3 hm₁Verts with
    ⟨mlabel₁, hmlabel₁, hmlabel₁_eq⟩
  rcases exists_moserLabel_leftPinnedLabelPoint_eq_of_mem_triangle
      S p₁ p₂ q₁ q₂ s1 s2 s3 hm₂Verts with
    ⟨mlabel₂, hmlabel₂, hmlabel₂_eq⟩
  have hmlabel_ne : mlabel₁ ≠ mlabel₂ := by
    intro hsame
    exact hm₁₂ (by
      rw [← hmlabel₁_eq, hsame, hmlabel₂_eq])
  have hx_eq_l : x = l := by
    have hxL' : x ∈ ({l} : Finset ℝ²) := by
      rw [← hLeq]
      exact hxL
    simpa using hxL'
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := privateCenter, kind := .own,
      privateMask := maskOfLabels [qlabel, sstar, mlabel₁, mlabel₂] }
  have hseedMem :
      seed ∈ erasedPinRow_ep_left_m2_s0_l1_r1_seeds_candidates := by
    exact
      erasedPinRow_ep_left_m2_s0_l1_r1_seed_mem_candidates_of_q_moser_pair
        hsstar
        (by
          rcases hcenter with ⟨_, hpriv⟩ | ⟨_, hpriv⟩
          · exact Or.inl hpriv
          · exact Or.inr hpriv)
        hqlabel hmlabel₁ hmlabel₂ hmlabel_ne
  refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
  let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  change pointMask pointOf (centerClass privateCenter) =
    maskOfLabels [qlabel, sstar, mlabel₁, mlabel₂]
  rw [hprivateClass, hseleq, ← hqlabel_eq, ← hmlabel₁_eq,
    ← hmlabel₂_eq, ← hx_eq_l, ← hsstar_eq]
  change pointMask pointOf
      ({pointOf qlabel, pointOf mlabel₁, pointOf mlabel₂,
          pointOf sstar} : Finset ℝ²) =
    maskOfLabels [qlabel, sstar, mlabel₁, mlabel₂]
  exact pointMask_eq_QSurplusMoserPairMask
    (pointOf := pointOf) hinj hqlabel hsstar hmlabel₁ hmlabel₂ hmlabel_ne

/-- Exact left row `(2,0,1,1)` is incompatible with the finite
cross-separation interface once the private center is one of the two named
opposite-cap interior labels. -/
theorem false_of_left_row2011_private_w_crossSeparation
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 2)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 1)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    {privateCenter : Label}
    (hcenter :
      (center = p₁ ∧ privateCenter = .Pw) ∨
        (center = p₂ ∧ privateCenter = .Pu))
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius)
    (hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases left_row2011_exists_erasedPinRowSeed_privateMask S hM44
      hradius_pos hm hs hl hr hinj hqpair hxTriple hxL hcenter
      hprivateClass with
    ⟨seed, hseed, _hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
  exact false_of_erasedPinRow_ep_left_m2_s0_l1_r1_seed_private_w_crossSeparation
    hseed hwMask hprivate hsearchSep

/-- Exact left row `(0,0,2,2)` produces one of the generated row seeds once
the two surplus-side selected points are embedded in the named surplus triple.
This records the private-center mask equality needed by the row-level seeded
shadow contradiction. -/
theorem left_row0022_exists_erasedPinRowSeed_privateMask
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hLtriple : SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    {privateCenter : Label}
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius) :
    ∃ seed : OneSidedSeed,
      seed ∈ erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates ∧
      isSurplusStar seed.sstar = true ∧
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 seed.sstar = x ∧
      seed.privateCenter = privateCenter ∧
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass seed.privateCenter) = seed.privateMask := by
  classical
  rcases hM44.left_row0022_selectedClass_eq_oppInterior1_union_surplusPair
      hradius_pos hm hs hl hr hqpair with
    ⟨l₁, l₂, hl12, hLeq, _hLsub, hseleq⟩
  have hxPair : x ∈ ({l₁, l₂} : Finset ℝ²) := by
    rw [← hLeq]
    exact hxL
  simp only [Finset.mem_insert, Finset.mem_singleton] at hxPair
  rcases hxPair with hx_eq | hx_eq
  · subst x
    have hl₁Triple : l₁ ∈ ({s1, s2, s3} : Finset ℝ²) := by
      apply hLtriple
      rw [hLeq]
      simp
    have hl₂Triple : l₂ ∈ ({s1, s2, s3} : Finset ℝ²) := by
      apply hLtriple
      rw [hLeq]
      simp
    rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
        S p₁ p₂ q₁ q₂ s1 s2 s3 hl₁Triple with
      ⟨sstar, hsstar, hsstar_eq⟩
    rcases exists_otherSurplusStar_leftPinnedLabelPoint_eq_of_mem_triple
        S p₁ p₂ q₁ q₂ s1 s2 s3 hl₂Triple (Ne.symm hl12)
        hsstar_eq with
      ⟨other, hother, hother_ne, hother_eq⟩
    let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [.Q1, .Q2, sstar, other] }
    have hseedMem :
        seed ∈ erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates := by
      exact
        erasedPinRow_ep_left_m0_s0_l2_r2_seed_mem_candidates_of_surplus_pair
          hsstar hother hother_ne hpriv
    refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
    let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
    change pointMask pointOf (centerClass privateCenter) =
      maskOfLabels [.Q1, .Q2, sstar, other]
    rw [hprivateClass, hseleq]
    rw [← hsstar_eq, ← hother_eq]
    change pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf sstar, pointOf other} :
          Finset ℝ²) =
      maskOfLabels [.Q1, .Q2, sstar, other]
    exact pointMask_eq_QQSurplusPairMask (pointOf := pointOf) hinj hsstar
      hother hother_ne
  · subst x
    have hl₁Triple : l₁ ∈ ({s1, s2, s3} : Finset ℝ²) := by
      apply hLtriple
      rw [hLeq]
      simp
    have hl₂Triple : l₂ ∈ ({s1, s2, s3} : Finset ℝ²) := by
      apply hLtriple
      rw [hLeq]
      simp
    rcases exists_surplusStar_leftPinnedLabelPoint_eq_of_mem_triple
        S p₁ p₂ q₁ q₂ s1 s2 s3 hl₂Triple with
      ⟨sstar, hsstar, hsstar_eq⟩
    rcases exists_otherSurplusStar_leftPinnedLabelPoint_eq_of_mem_triple
        S p₁ p₂ q₁ q₂ s1 s2 s3 hl₁Triple hl12 hsstar_eq with
      ⟨other, hother, hother_ne, hother_eq⟩
    let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := privateCenter, kind := .own,
        privateMask := maskOfLabels [.Q1, .Q2, sstar, other] }
    have hseedMem :
        seed ∈ erasedPinRow_ep_left_m0_s0_l2_r2_seeds_candidates := by
      exact
        erasedPinRow_ep_left_m0_s0_l2_r2_seed_mem_candidates_of_surplus_pair
          hsstar hother hother_ne hpriv
    refine ⟨seed, hseedMem, hsstar, hsstar_eq, rfl, ?_⟩
    let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
    change pointMask pointOf (centerClass privateCenter) =
      maskOfLabels [.Q1, .Q2, sstar, other]
    rw [hprivateClass, hseleq]
    rw [← hother_eq, ← hsstar_eq]
    change pointMask pointOf
        ({pointOf .Q1, pointOf .Q2, pointOf other, pointOf sstar} :
          Finset ℝ²) =
      maskOfLabels [.Q1, .Q2, sstar, other]
    exact pointMask_eq_QQSurplusPairMask_swap (pointOf := pointOf) hinj
      hsstar hother hother_ne

/-- Exact left row `(0,0,2,2)` is incompatible with the finite
cross-separation interface once the private center is one of the two named
opposite-cap interior labels. -/
theorem false_of_left_row0022_private_w_crossSeparation
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hM44 : S.IsM44)
    {center x : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 2)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj : Function.Injective
      (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hLtriple : SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hxL : x ∈ SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2)
    {privateCenter : Label}
    (hpriv : privateCenter = .Pw ∨ privateCenter = .Pu)
    {centerClass : Label → Finset ℝ²}
    (hprivateClass : centerClass privateCenter =
      SelectedClass A center radius)
    (hwMask :
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass .w) =
        secondOppExactCapMask)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases left_row0022_exists_erasedPinRowSeed_privateMask S hM44
      hradius_pos hm hs hl hr hinj hqpair hLtriple hxL hpriv
      hprivateClass with
    ⟨seed, hseed, _hsstar, _hsstar_eq, _hprivateCenter, hprivate⟩
  exact false_of_erasedPinRow_ep_left_m0_s0_l2_r2_seed_private_w_crossSeparation
    hseed hwMask hprivate hsearchSep

/-- Row-specific point-class contradiction for the erased-pin finite row
`ep_right_m0_s0_l1_r3`.  Once geometry identifies one of the row's generated
candidate seeds, the generated row no-survivor theorem closes the seeded
shadow. -/
theorem false_of_erasedPinRow_ep_right_m0_s0_l1_r3_seedShadow_pointClasses
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_right_m0_s0_l1_r3_seeds_candidates)
    (hs : isSurplusStar seed.sstar = true)
    (hv : pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have hfixed : seed ∈ erasedPinFixedSeeds :=
    erasedPinRow_ep_right_m0_s0_l1_r3_seeds_candidates_subset_fixed hseed
  have hcandidateFull : ∀ center : Label,
      pointMask pointOf (centerClass center) ∈ seed.candidateMasks center := by
    intro center
    by_cases hvCenter : center = .v
    · subst center
      rw [hv]
      exact erasedPinFixedSeeds_firstOppExactCapMask_mem_candidateMasks_v
        seed hfixed
    · by_cases hwCenter : center = .w
      · subst center
        rw [hwMask]
        exact erasedPinFixedSeeds_secondOppExactCapMask_mem_candidateMasks_w
          seed hfixed
      · by_cases hprivateCenter : center = seed.privateCenter
        · subst center
          rw [hprivate]
          exact
            erasedPinFixedSeeds_privateMask_mem_candidateMasks_privateCenter
              seed hfixed
        · exact hcandidate center hvCenter hwCenter hprivateCenter
  exact
    erasedPinRow_ep_right_m0_s0_l1_r3_seeds_candidates_false_of_isValidOneSidedSeedShadow
      hseed
      (isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates_with_exact_masks
        hs hv hwMask hprivate hcandidateFull hno3 hcounts hsep hsearchSep)

/-- Row-specific point-class contradiction for the erased-pin finite row
`ep_left_m0_s0_l3_r1`.  Once geometry identifies one of the row's generated
candidate seeds, the generated row no-survivor theorem closes the seeded
shadow. -/
theorem false_of_erasedPinRow_ep_left_m0_s0_l3_r1_seedShadow_pointClasses
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_left_m0_s0_l3_r1_seeds_candidates)
    (hs : isSurplusStar seed.sstar = true)
    (hv : pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have hfixed : seed ∈ erasedPinFixedSeeds :=
    erasedPinRow_ep_left_m0_s0_l3_r1_seeds_candidates_subset_fixed hseed
  have hcandidateFull : ∀ center : Label,
      pointMask pointOf (centerClass center) ∈ seed.candidateMasks center := by
    intro center
    by_cases hvCenter : center = .v
    · subst center
      rw [hv]
      exact erasedPinFixedSeeds_firstOppExactCapMask_mem_candidateMasks_v
        seed hfixed
    · by_cases hwCenter : center = .w
      · subst center
        rw [hwMask]
        exact erasedPinFixedSeeds_secondOppExactCapMask_mem_candidateMasks_w
          seed hfixed
      · by_cases hprivateCenter : center = seed.privateCenter
        · subst center
          rw [hprivate]
          exact
            erasedPinFixedSeeds_privateMask_mem_candidateMasks_privateCenter
              seed hfixed
        · exact hcandidate center hvCenter hwCenter hprivateCenter
  exact
    erasedPinRow_ep_left_m0_s0_l3_r1_seeds_candidates_false_of_isValidOneSidedSeedShadow
      hseed
      (isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates_with_exact_masks
        hs hv hwMask hprivate hcandidateFull hno3 hcounts hsep hsearchSep)

/-- Row-specific point-class contradiction for the erased-pin finite row
`ep_right_m0_s0_l2_r2`.  Once geometry identifies one of the row's generated
candidate seeds, the generated row no-survivor theorem closes the seeded
shadow. -/
theorem false_of_erasedPinRow_ep_right_m0_s0_l2_r2_seedShadow_pointClasses
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates)
    (hs : isSurplusStar seed.sstar = true)
    (hv : pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have hfixed : seed ∈ erasedPinFixedSeeds :=
    erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates_subset_fixed hseed
  exact
    erasedPinRow_ep_right_m0_s0_l2_r2_seeds_candidates_false_of_isValidOneSidedSeedShadow
      hseed
      (isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates_with_exact_masks
        hs hv hwMask hprivate (by
          intro center
          by_cases hvCenter : center = .v
          · subst center
            rw [hv]
            exact erasedPinFixedSeeds_firstOppExactCapMask_mem_candidateMasks_v
              seed hfixed
          · by_cases hwCenter : center = .w
            · subst center
              rw [hwMask]
              exact erasedPinFixedSeeds_secondOppExactCapMask_mem_candidateMasks_w
                seed hfixed
            · by_cases hprivateCenter : center = seed.privateCenter
              · subst center
                rw [hprivate]
                exact
                  erasedPinFixedSeeds_privateMask_mem_candidateMasks_privateCenter
                    seed hfixed
              · exact hcandidate center hvCenter hwCenter hprivateCenter)
        hno3 hcounts hsep hsearchSep)

/-- Row-specific point-class contradiction for the erased-pin finite row
`ep_right_m0_s1_l1_r2`.  Once geometry identifies one of the row's generated
candidate seeds, the generated row no-survivor theorem closes the seeded
shadow. -/
theorem false_of_erasedPinRow_ep_right_m0_s1_l1_r2_seedShadow_pointClasses
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates)
    (hs : isSurplusStar seed.sstar = true)
    (hv : pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask : pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate : pointMask pointOf (centerClass seed.privateCenter) =
      seed.privateMask)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        pointMask pointOf (centerClass center) ∈ seed.candidateMasks center)
    (hno3 : noThreeOK (shadowOfPointClasses pointOf centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses pointOf centerClass) assigned) = true)
    (hsep : ∀ c cp x y : Label,
      sepOKFor (shadowOfPointClasses pointOf centerClass) c cp x y = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
        (pointMask pointOf (centerClass cp)) = true) :
    False := by
  have hfixed : seed ∈ erasedPinFixedSeeds :=
    erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates_subset_fixed hseed
  exact
    erasedPinRow_ep_right_m0_s1_l1_r2_seeds_candidates_false_of_isValidOneSidedSeedShadow
      hseed
      (isValidOneSidedSeedShadow_shadowOfPointClasses_of_seed_candidates_with_exact_masks
        hs hv hwMask hprivate (by
          intro center
          by_cases hvCenter : center = .v
          · subst center
            rw [hv]
            exact erasedPinFixedSeeds_firstOppExactCapMask_mem_candidateMasks_v
              seed hfixed
          · by_cases hwCenter : center = .w
            · subst center
              rw [hwMask]
              exact erasedPinFixedSeeds_secondOppExactCapMask_mem_candidateMasks_w
                seed hfixed
            · by_cases hprivateCenter : center = seed.privateCenter
              · subst center
                rw [hprivate]
                exact
                  erasedPinFixedSeeds_privateMask_mem_candidateMasks_privateCenter
                    seed hfixed
              · exact hcandidate center hvCenter hwCenter hprivateCenter)
        hno3 hcounts hsep hsearchSep)

/-- Exact cap masks, the listed private seed mask, and the exact generated
trigger interface give the seeded no-survivor contradiction.  Compared with
`false_of_oneSidedSeedShadow_pointClasses_of_exact_cap_trigger_interfaces`,
this also discharges finite card/no-self obligations for the private center. -/
theorem false_of_oneSidedSeedShadow_pointClasses_of_seed_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskHas (pointMask pointOf (centerClass center)) center = false)
    (hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
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
    (htriggerU :
      (maskHas (pointMask pointOf (centerClass .u)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .u))
                uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas (pointMask pointOf (centerClass .Q1)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q1))
                uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas (pointMask pointOf (centerClass .Q2)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q2))
                uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters seed.sstar →
        (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
            decide
              (1 <=
                maskInterCard (pointMask pointOf (centerClass center))
                  uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
        uPwPuMask <= 1) :
    False := by
  exact false_of_oneSidedSeedShadow_pointClasses_of_exact_cap_trigger_interfaces
    hseed hs
    (fun center hvCenter hwCenter => by
      by_cases hprivateCenter : center = seed.privateCenter
      · subst center
        rw [hprivate]
        exact oneSidedSeed_privateMask_card_of_mem hseed
      · exact hcard center hvCenter hwCenter hprivateCenter)
    (fun center hvCenter hwCenter => by
      by_cases hprivateCenter : center = seed.privateCenter
      · subst center
        rw [hprivate]
        exact oneSidedSeed_privateMask_self_false_of_mem hseed
      · exact hself center hvCenter hwCenter hprivateCenter)
    hv hwMask hprivate huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU
    htriggerQ1 htriggerQ2 htriggerPrevious hfinal

/-- The seed-facing interface with the private seed center removed from the
remaining non-Moser triple obligation.  The private center's triple-free fact is
finite data attached to `seed ∈ oneSidedSeeds`. -/
theorem false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    {centerClass : Label → Finset α} {seed : OneSidedSeed}
    (hseed : seed ∈ oneSidedSeeds)
    (hs : isSurplusStar seed.sstar = true)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskCard (pointMask pointOf (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ seed.privateCenter →
        maskHas (pointMask pointOf (centerClass center)) center = false)
    (hv :
      pointMask pointOf (centerClass .v) = firstOppExactCapMask)
    (hwMask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask)
    (hprivate :
      pointMask pointOf (centerClass seed.privateCenter) =
        seed.privateMask)
    (huv :
      maskInterCard (pointMask pointOf (centerClass .u)) cvNoUMask <= 1)
    (huw :
      maskInterCard (pointMask pointOf (centerClass .u)) cwNoUMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      center ≠ seed.privateCenter →
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
    (htriggerU :
      (maskHas (pointMask pointOf (centerClass .u)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .u))
                uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas (pointMask pointOf (centerClass .Q1)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q1))
                uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas (pointMask pointOf (centerClass .Q2)) seed.sstar &&
          decide
            (1 <=
              maskInterCard (pointMask pointOf (centerClass .Q2))
                uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters seed.sstar →
        (maskHas (pointMask pointOf (centerClass center)) seed.sstar &&
            decide
              (1 <=
                maskInterCard (pointMask pointOf (centerClass center))
                  uPwPuMask)) = false)
    (hfinal :
      maskInterCard (pointMask pointOf (centerClass seed.sstar))
        uPwPuMask <= 1) :
    False := by
  exact false_of_oneSidedSeedShadow_pointClasses_of_seed_interfaces hseed hs
    hcard hself hv hwMask hprivate huv huw
    (fun center hnonMoser => by
      by_cases hprivateCenter : center = seed.privateCenter
      · subst center
        rw [hprivate]
        exact oneSidedSeed_privateMask_no_moser_triple_of_mem hseed
      · exact hcirc center hnonMoser hprivateCenter)
    hno3 hcounts hsep hsearchSep htriggerU htriggerQ1 htriggerQ2
    htriggerPrevious hfinal

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

/-- The first non-surplus exact cap has the generated first exact-cap mask. -/
theorem pointMask_eq_firstOppExactCapMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) :
    pointMask pointOf
        ({pointOf .u, pointOf .w, pointOf .Pw, pointOf .Pu} :
          Finset α) =
      firstOppExactCapMask := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  simp [pointMask, allLabels, firstOppExactCapMask, maskOfLabels, hpoint_eq,
    Label.bit, Label.index]

/-- The second non-surplus exact cap has the generated second exact-cap mask. -/
theorem pointMask_eq_secondOppExactCapMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) :
    pointMask pointOf
        ({pointOf .u, pointOf .v, pointOf .Q1, pointOf .Q2} :
          Finset α) =
      secondOppExactCapMask := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  simp [pointMask, allLabels, secondOppExactCapMask, maskOfLabels, hpoint_eq,
    Label.bit, Label.index]

/-- The `.Pw` own-endpoint one-sided private class has its generated seed
mask. -/
theorem pointMask_eq_ownPwSeedPrivateMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    pointMask pointOf
        ({pointOf .u, pointOf .w, pointOf sstar, pointOf .Pu} :
          Finset α) =
      maskOfLabels [.u, .w, sstar, .Pu] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
      Label.index]

/-- The `.Pu` own-endpoint one-sided private class has its generated seed
mask. -/
theorem pointMask_eq_ownPuSeedPrivateMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    pointMask pointOf
        ({pointOf .u, pointOf .w, pointOf sstar, pointOf .Pw} :
          Finset α) =
      maskOfLabels [.u, .w, sstar, .Pw] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
      Label.index]

/-- The `.Pw` opposite-`u` one-sided private class has its generated seed
mask. -/
theorem pointMask_eq_oppositeUPwSeedPrivateMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    pointMask pointOf
        ({pointOf .u, pointOf .v, pointOf sstar, pointOf .Pu} :
          Finset α) =
      maskOfLabels [.u, .v, sstar, .Pu] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
      Label.index]

/-- The `.Pu` opposite-`u` one-sided private class has its generated seed
mask. -/
theorem pointMask_eq_oppositeUPuSeedPrivateMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    pointMask pointOf
        ({pointOf .u, pointOf .v, pointOf sstar, pointOf .Pw} :
          Finset α) =
      maskOfLabels [.u, .v, sstar, .Pw] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
      Label.index]

/-- The `.Pw` opposite-`w` one-sided private class has its generated seed
mask. -/
theorem pointMask_eq_oppositeWPwSeedPrivateMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    pointMask pointOf
        ({pointOf .v, pointOf .w, pointOf sstar, pointOf .Pu} :
          Finset α) =
      maskOfLabels [.v, .w, sstar, .Pu] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
      Label.index]

/-- The `.Pu` opposite-`w` one-sided private class has its generated seed
mask. -/
theorem pointMask_eq_oppositeWPuSeedPrivateMask
    {α : Type _} [DecidableEq α] {pointOf : Label → α}
    (hinj : Function.Injective pointOf) {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    pointMask pointOf
        ({pointOf .v, pointOf .w, pointOf sstar, pointOf .Pw} :
          Finset α) =
      maskOfLabels [.v, .w, sstar, .Pw] := by
  have hpoint_eq : ∀ a b : Label, pointOf a = pointOf b ↔ a = b := by
    intro a b
    exact ⟨fun h => hinj h, fun h => by simp [h]⟩
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals
    simp [pointMask, allLabels, maskOfLabels, hpoint_eq, Label.bit,
      Label.index]

/-- In the right-oriented label map, a named first non-surplus interior pair
turns the first non-surplus closed cap into the generated first exact-cap
mask. -/
theorem rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²)) :
    pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (S.capByIndex S.oppIndex1) =
      firstOppExactCapMask := by
  have hcap :
      S.capByIndex S.oppIndex1 =
        ({S.leftOuterVertexByIndex S.oppIndex1,
            S.rightOuterVertexByIndex S.oppIndex1, p₁, p₂} :
          Finset ℝ²) :=
    capByIndex_eq_outer_vertices_insert_interior_pair S S.oppIndex1
      (by simpa [SurplusCapPacket.oppInterior1] using hpair)
  rw [hcap]
  rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx,
    S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
  simpa [rightPinnedLabelPoint] using
    pointMask_eq_firstOppExactCapMask
      (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) hinj

/-- In the right-oriented label map, a named second non-surplus interior pair
turns the second non-surplus closed cap into the generated second exact-cap
mask. -/
theorem rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²)) :
    pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (S.capByIndex S.oppIndex2) =
      secondOppExactCapMask := by
  have hcap :
      S.capByIndex S.oppIndex2 =
        ({S.leftOuterVertexByIndex S.oppIndex2,
            S.rightOuterVertexByIndex S.oppIndex2, q₁, q₂} :
          Finset ℝ²) :=
    capByIndex_eq_outer_vertices_insert_interior_pair S S.oppIndex2
      (by simpa [SurplusCapPacket.oppInterior2] using hpair)
  rw [hcap]
  rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1,
    S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
  have hset :
      ({S.oppositeVertexByIndex S.oppIndex1,
          S.oppositeVertexByIndex S.surplusIdx, q₁, q₂} : Finset ℝ²) =
        ({S.oppositeVertexByIndex S.surplusIdx,
          S.oppositeVertexByIndex S.oppIndex1, q₁, q₂} : Finset ℝ²) := by
    ext x
    simp
    tauto
  rw [hset]
  simpa [rightPinnedLabelPoint] using
    pointMask_eq_secondOppExactCapMask
      (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) hinj

/-- In the left-oriented label map, a named second non-surplus interior pair
turns the second non-surplus closed cap into the generated first exact-cap
mask. -/
theorem leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²)) :
    pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (S.capByIndex S.oppIndex2) =
      firstOppExactCapMask := by
  have hcap :
      S.capByIndex S.oppIndex2 =
        ({S.leftOuterVertexByIndex S.oppIndex2,
            S.rightOuterVertexByIndex S.oppIndex2, p₁, p₂} :
          Finset ℝ²) :=
    capByIndex_eq_outer_vertices_insert_interior_pair S S.oppIndex2
      (by simpa [SurplusCapPacket.oppInterior2] using hpair)
  rw [hcap]
  rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1,
    S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
  have hset :
      ({S.oppositeVertexByIndex S.oppIndex1,
          S.oppositeVertexByIndex S.surplusIdx, p₁, p₂} : Finset ℝ²) =
        ({S.oppositeVertexByIndex S.surplusIdx,
          S.oppositeVertexByIndex S.oppIndex1, p₁, p₂} : Finset ℝ²) := by
    ext x
    simp
    tauto
  rw [hset]
  simpa [leftPinnedLabelPoint, leftPinnedToRightLabel,
    rightPinnedLabelPoint] using
    pointMask_eq_firstOppExactCapMask
      (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) hinj

/-- In the left-oriented label map, a named first non-surplus interior pair
turns the first non-surplus closed cap into the generated second exact-cap
mask. -/
theorem leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    (hpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²)) :
    pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (S.capByIndex S.oppIndex1) =
      secondOppExactCapMask := by
  have hcap :
      S.capByIndex S.oppIndex1 =
        ({S.leftOuterVertexByIndex S.oppIndex1,
            S.rightOuterVertexByIndex S.oppIndex1, q₁, q₂} :
          Finset ℝ²) :=
    capByIndex_eq_outer_vertices_insert_interior_pair S S.oppIndex1
      (by simpa [SurplusCapPacket.oppInterior1] using hpair)
  rw [hcap]
  rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx,
    S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
  simpa [leftPinnedLabelPoint, leftPinnedToRightLabel,
    rightPinnedLabelPoint] using
    pointMask_eq_secondOppExactCapMask
      (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) hinj

private theorem triangle_pair_eq_opposite_left_or_opposite_right_of_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {m₁ m₂ : ℝ²}
    (hm₁ : m₁ ∈ S.triangle.verts)
    (hm₂ : m₂ ∈ S.triangle.verts)
    (hmne : m₁ ≠ m₂)
    (hopp : S.oppositeVertexByIndex i ∈ ({m₁, m₂} : Finset ℝ²)) :
    ({m₁, m₂} : Finset ℝ²) =
        ({S.oppositeVertexByIndex i, S.leftOuterVertexByIndex i} :
          Finset ℝ²) ∨
      ({m₁, m₂} : Finset ℝ²) =
        ({S.oppositeVertexByIndex i, S.rightOuterVertexByIndex i} :
          Finset ℝ²) := by
  fin_cases i <;>
    simp [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.leftOuterVertexByIndex,
      SurplusCapPacket.rightOuterVertexByIndex,
      MoserTriangle.verts] at hm₁ hm₂ hopp ⊢ <;>
    aesop

/-- In the right-oriented own-endpoint branch, a `Pw`-centered erased payload
has the generated `.Pw` private seed mask. -/
theorem rightOwnPwSeedPrivateMask_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₁ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₁ radius ∧
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₁ radius) :
    pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₁ radius) =
      maskOfLabels [.u, .w, sstar, .Pu] := by
  classical
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, _hL, _hR, hsel, _hcard⟩
  let M := SelectedClass A p₁ radius ∩ S.triangle.verts
  have hMcard : M.card = 2 := by
    simp [M, hM, hmne]
  have hleftM :
      S.leftOuterVertexByIndex S.oppIndex1 ∈ M := by
    exact Finset.mem_inter.mpr
      ⟨hown.1, S.leftOuterVertexByIndex_mem_triangle_verts S.oppIndex1⟩
  have hrightM :
      S.rightOuterVertexByIndex S.oppIndex1 ∈ M := by
    exact Finset.mem_inter.mpr
      ⟨hown.2, S.rightOuterVertexByIndex_mem_triangle_verts S.oppIndex1⟩
  have hleft_ne_right :
      S.leftOuterVertexByIndex S.oppIndex1 ≠
        S.rightOuterVertexByIndex S.oppIndex1 := by
    rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx,
      S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
    exact S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex2
  have hownSub :
      ({S.leftOuterVertexByIndex S.oppIndex1,
          S.rightOuterVertexByIndex S.oppIndex1} : Finset ℝ²) ⊆ M := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl
    · exact hleftM
    · exact hrightM
  have hownCard :
      ({S.leftOuterVertexByIndex S.oppIndex1,
          S.rightOuterVertexByIndex S.oppIndex1} : Finset ℝ²).card = 2 := by
    simp [hleft_ne_right]
  have hMown :
      M =
        ({S.leftOuterVertexByIndex S.oppIndex1,
            S.rightOuterVertexByIndex S.oppIndex1} : Finset ℝ²) :=
    (Finset.eq_of_subset_of_card_le hownSub (by
      rw [hMcard, hownCard])).symm
  have hMset :
      ({m₁, m₂} : Finset ℝ²) =
        ({S.leftOuterVertexByIndex S.oppIndex1,
            S.rightOuterVertexByIndex S.oppIndex1} : Finset ℝ²) := by
    calc
      ({m₁, m₂} : Finset ℝ²) = M := by
        simpa [M] using hM.symm
      _ =
          ({S.leftOuterVertexByIndex S.oppIndex1,
              S.rightOuterVertexByIndex S.oppIndex1} : Finset ℝ²) := hMown
  have hpair' :
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior1] using hpair
  have herase :
      (S.capInteriorByIndex S.oppIndex1).erase p₁ = ({p₂} : Finset ℝ²) := by
    rw [hpair']
    simp [hp12]
  have hsInter :
      s ∈ SelectedClass A p₁ radius ∩
        (S.capInteriorByIndex S.oppIndex1).erase p₁ := by
    rw [hC]
    simp
  have hs_eq : s = p₂ := by
    have hsErase :
        s ∈ (S.capInteriorByIndex S.oppIndex1).erase p₁ :=
      (Finset.mem_inter.mp hsInter).2
    simpa [herase] using hsErase
  have hselected :
      SelectedClass A p₁ radius =
        ({S.leftOuterVertexByIndex S.oppIndex1,
            S.rightOuterVertexByIndex S.oppIndex1, p₂, x} :
          Finset ℝ²) := by
    rw [hsel]
    ext y
    have hyMiff :
        (y = m₁ ∨ y = m₂) ↔
          y = S.leftOuterVertexByIndex S.oppIndex1 ∨
            y = S.rightOuterVertexByIndex S.oppIndex1 := by
      calc
        (y = m₁ ∨ y = m₂) ↔ y ∈ ({m₁, m₂} : Finset ℝ²) := by
          simp
        _ ↔ y ∈
            ({S.leftOuterVertexByIndex S.oppIndex1,
                S.rightOuterVertexByIndex S.oppIndex1} :
              Finset ℝ²) := by
          rw [hMset]
        _ ↔
            y = S.leftOuterVertexByIndex S.oppIndex1 ∨
              y = S.rightOuterVertexByIndex S.oppIndex1 := by
          simp
    simp only [Finset.mem_insert, Finset.mem_singleton, hs_eq]
    constructor
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mp (Or.inl hy) with hyLeft | hyRight
        · exact Or.inl hyLeft
        · exact Or.inr (Or.inl hyRight)
      · rcases hyMiff.mp (Or.inr hy) with hyLeft | hyRight
        · exact Or.inl hyLeft
        · exact Or.inr (Or.inl hyRight)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mpr (Or.inl hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · rcases hyMiff.mpr (Or.inr hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
  have hmaskSet :
      SelectedClass A p₁ radius =
        ({rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u,
            rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .w,
            rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
            rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pu} :
          Finset ℝ²) := by
    rw [hselected]
    rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx,
      S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
    rw [← hsstar_eq]
    ext y
    simp [rightPinnedLabelPoint]
    tauto
  rw [hmaskSet]
  exact pointMask_eq_ownPwSeedPrivateMask hinj hsstar

/-- In the right-oriented own-endpoint branch, a `Pu`-centered erased payload
has the generated `.Pu` private seed mask. -/
theorem rightOwnPuSeedPrivateMask_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₂ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₂ radius ∧
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₂ radius) :
    pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₂ radius) =
      maskOfLabels [.u, .w, sstar, .Pw] := by
  classical
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, _hL, _hR, hsel, _hcard⟩
  let M := SelectedClass A p₂ radius ∩ S.triangle.verts
  have hMcard : M.card = 2 := by
    simp [M, hM, hmne]
  have hleftM :
      S.leftOuterVertexByIndex S.oppIndex1 ∈ M := by
    exact Finset.mem_inter.mpr
      ⟨hown.1, S.leftOuterVertexByIndex_mem_triangle_verts S.oppIndex1⟩
  have hrightM :
      S.rightOuterVertexByIndex S.oppIndex1 ∈ M := by
    exact Finset.mem_inter.mpr
      ⟨hown.2, S.rightOuterVertexByIndex_mem_triangle_verts S.oppIndex1⟩
  have hleft_ne_right :
      S.leftOuterVertexByIndex S.oppIndex1 ≠
        S.rightOuterVertexByIndex S.oppIndex1 := by
    rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx,
      S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
    exact S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex2
  have hownSub :
      ({S.leftOuterVertexByIndex S.oppIndex1,
          S.rightOuterVertexByIndex S.oppIndex1} : Finset ℝ²) ⊆ M := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl
    · exact hleftM
    · exact hrightM
  have hownCard :
      ({S.leftOuterVertexByIndex S.oppIndex1,
          S.rightOuterVertexByIndex S.oppIndex1} : Finset ℝ²).card = 2 := by
    simp [hleft_ne_right]
  have hMown :
      M =
        ({S.leftOuterVertexByIndex S.oppIndex1,
            S.rightOuterVertexByIndex S.oppIndex1} : Finset ℝ²) :=
    (Finset.eq_of_subset_of_card_le hownSub (by
      rw [hMcard, hownCard])).symm
  have hMset :
      ({m₁, m₂} : Finset ℝ²) =
        ({S.leftOuterVertexByIndex S.oppIndex1,
            S.rightOuterVertexByIndex S.oppIndex1} : Finset ℝ²) := by
    calc
      ({m₁, m₂} : Finset ℝ²) = M := by
        simpa [M] using hM.symm
      _ =
          ({S.leftOuterVertexByIndex S.oppIndex1,
              S.rightOuterVertexByIndex S.oppIndex1} : Finset ℝ²) := hMown
  have hpair' :
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior1] using hpair
  have herase :
      (S.capInteriorByIndex S.oppIndex1).erase p₂ = ({p₁} : Finset ℝ²) := by
    rw [hpair']
    ext y
    constructor
    · intro hy
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton] at hy
      rcases hy with ⟨hyne, hypair⟩
      rcases hypair with h | h
      · simp [h]
      · exact False.elim (hyne h)
    · intro hy
      have hyEq : y = p₁ := by
        simpa using hy
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton]
      exact ⟨by simpa [hyEq] using hp12, Or.inl hyEq⟩
  have hsInter :
      s ∈ SelectedClass A p₂ radius ∩
        (S.capInteriorByIndex S.oppIndex1).erase p₂ := by
    rw [hC]
    simp
  have hs_eq : s = p₁ := by
    have hsErase :
        s ∈ (S.capInteriorByIndex S.oppIndex1).erase p₂ :=
      (Finset.mem_inter.mp hsInter).2
    simpa [herase] using hsErase
  have hselected :
      SelectedClass A p₂ radius =
        ({S.leftOuterVertexByIndex S.oppIndex1,
            S.rightOuterVertexByIndex S.oppIndex1, p₁, x} :
          Finset ℝ²) := by
    rw [hsel]
    ext y
    have hyMiff :
        (y = m₁ ∨ y = m₂) ↔
          y = S.leftOuterVertexByIndex S.oppIndex1 ∨
            y = S.rightOuterVertexByIndex S.oppIndex1 := by
      calc
        (y = m₁ ∨ y = m₂) ↔ y ∈ ({m₁, m₂} : Finset ℝ²) := by
          simp
        _ ↔ y ∈
            ({S.leftOuterVertexByIndex S.oppIndex1,
                S.rightOuterVertexByIndex S.oppIndex1} :
              Finset ℝ²) := by
          rw [hMset]
        _ ↔
            y = S.leftOuterVertexByIndex S.oppIndex1 ∨
              y = S.rightOuterVertexByIndex S.oppIndex1 := by
          simp
    simp only [Finset.mem_insert, Finset.mem_singleton, hs_eq]
    constructor
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mp (Or.inl hy) with hyLeft | hyRight
        · exact Or.inl hyLeft
        · exact Or.inr (Or.inl hyRight)
      · rcases hyMiff.mp (Or.inr hy) with hyLeft | hyRight
        · exact Or.inl hyLeft
        · exact Or.inr (Or.inl hyRight)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mpr (Or.inl hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · rcases hyMiff.mpr (Or.inr hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
  have hmaskSet :
      SelectedClass A p₂ radius =
        ({rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u,
            rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .w,
            rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
            rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pw} :
          Finset ℝ²) := by
    rw [hselected]
    rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx,
      S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
    rw [← hsstar_eq]
    ext y
    simp [rightPinnedLabelPoint]
    tauto
  rw [hmaskSet]
  exact pointMask_eq_ownPuSeedPrivateMask hinj hsstar

/-- In the right-oriented opposite-Moser branch, a `Pw`-centered erased payload
has one of the two generated opposite private seed masks, according to which
own endpoint is the second Moser hit. -/
theorem rightOppositePwSeedPrivateMask_cases_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₁ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex1 ∈ SelectedClass A p₁ radius) :
    pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₁ radius) =
        maskOfLabels [.u, .v, sstar, .Pu] ∨
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₁ radius) =
        maskOfLabels [.v, .w, sstar, .Pu] := by
  classical
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, _hL, _hR, hsel, _hcard⟩
  have hm₁M :
      m₁ ∈ SelectedClass A p₁ radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₂M :
      m₂ ∈ SelectedClass A p₁ radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₁Verts : m₁ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₁M).2
  have hm₂Verts : m₂ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₂M).2
  have hoppM :
      S.oppositeVertexByIndex S.oppIndex1 ∈
        SelectedClass A p₁ radius ∩ S.triangle.verts :=
    Finset.mem_inter.mpr
      ⟨hopposite, S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex1⟩
  have hoppPair :
      S.oppositeVertexByIndex S.oppIndex1 ∈
        ({m₁, m₂} : Finset ℝ²) := by
    simpa [hM] using hoppM
  have hpair' :
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior1] using hpair
  have herase :
      (S.capInteriorByIndex S.oppIndex1).erase p₁ = ({p₂} : Finset ℝ²) := by
    rw [hpair']
    simp [hp12]
  have hsInter :
      s ∈ SelectedClass A p₁ radius ∩
        (S.capInteriorByIndex S.oppIndex1).erase p₁ := by
    rw [hC]
    simp
  have hs_eq : s = p₂ := by
    have hsErase :
        s ∈ (S.capInteriorByIndex S.oppIndex1).erase p₁ :=
      (Finset.mem_inter.mp hsInter).2
    simpa [herase] using hsErase
  have hselected_of_moserPair :
      ∀ {a b : ℝ²},
        ({m₁, m₂} : Finset ℝ²) = ({a, b} : Finset ℝ²) →
          SelectedClass A p₁ radius = ({a, b, p₂, x} : Finset ℝ²) := by
    intro a b hMset
    rw [hsel]
    ext y
    have hyMiff : (y = m₁ ∨ y = m₂) ↔ y = a ∨ y = b := by
      calc
        (y = m₁ ∨ y = m₂) ↔ y ∈ ({m₁, m₂} : Finset ℝ²) := by
          simp
        _ ↔ y ∈ ({a, b} : Finset ℝ²) := by
          rw [hMset]
        _ ↔ y = a ∨ y = b := by
          simp
    simp only [Finset.mem_insert, Finset.mem_singleton, hs_eq]
    constructor
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mp (Or.inl hy) with hya | hyb
        · exact Or.inl hya
        · exact Or.inr (Or.inl hyb)
      · rcases hyMiff.mp (Or.inr hy) with hya | hyb
        · exact Or.inl hya
        · exact Or.inr (Or.inl hyb)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mpr (Or.inl hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · rcases hyMiff.mpr (Or.inr hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
  rcases triangle_pair_eq_opposite_left_or_opposite_right_of_mem
      S S.oppIndex1 hm₁Verts hm₂Verts hmne hoppPair with
    hMleft | hMright
  · left
    have hselected := hselected_of_moserPair hMleft
    have hmaskSet :
        SelectedClass A p₁ radius =
          ({rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .v,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pu} :
            Finset ℝ²) := by
      rw [hselected]
      rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
      rw [← hsstar_eq]
      ext y
      simp [rightPinnedLabelPoint]
      tauto
    rw [hmaskSet]
    exact pointMask_eq_oppositeUPwSeedPrivateMask hinj hsstar
  · right
    have hselected := hselected_of_moserPair hMright
    have hmaskSet :
        SelectedClass A p₁ radius =
          ({rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .v,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .w,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pu} :
            Finset ℝ²) := by
      rw [hselected]
      rw [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
      rw [← hsstar_eq]
      ext y
      simp [rightPinnedLabelPoint]
      tauto
    rw [hmaskSet]
    exact pointMask_eq_oppositeWPwSeedPrivateMask hinj hsstar

/-- In the right-oriented opposite-Moser branch, a `Pu`-centered erased payload
has one of the two generated opposite private seed masks, according to which
own endpoint is the second Moser hit. -/
theorem rightOppositePuSeedPrivateMask_cases_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₂ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex1 ∈ SelectedClass A p₂ radius) :
    pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₂ radius) =
        maskOfLabels [.u, .v, sstar, .Pw] ∨
      pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₂ radius) =
        maskOfLabels [.v, .w, sstar, .Pw] := by
  classical
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, _hL, _hR, hsel, _hcard⟩
  have hm₁M :
      m₁ ∈ SelectedClass A p₂ radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₂M :
      m₂ ∈ SelectedClass A p₂ radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₁Verts : m₁ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₁M).2
  have hm₂Verts : m₂ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₂M).2
  have hoppM :
      S.oppositeVertexByIndex S.oppIndex1 ∈
        SelectedClass A p₂ radius ∩ S.triangle.verts :=
    Finset.mem_inter.mpr
      ⟨hopposite, S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex1⟩
  have hoppPair :
      S.oppositeVertexByIndex S.oppIndex1 ∈
        ({m₁, m₂} : Finset ℝ²) := by
    simpa [hM] using hoppM
  have hpair' :
      S.capInteriorByIndex S.oppIndex1 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior1] using hpair
  have herase :
      (S.capInteriorByIndex S.oppIndex1).erase p₂ = ({p₁} : Finset ℝ²) := by
    rw [hpair']
    ext y
    constructor
    · intro hy
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton] at hy
      rcases hy with ⟨hyne, hypair⟩
      rcases hypair with h | h
      · simp [h]
      · exact False.elim (hyne h)
    · intro hy
      have hyEq : y = p₁ := by
        simpa using hy
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton]
      exact ⟨by simpa [hyEq] using hp12, Or.inl hyEq⟩
  have hsInter :
      s ∈ SelectedClass A p₂ radius ∩
        (S.capInteriorByIndex S.oppIndex1).erase p₂ := by
    rw [hC]
    simp
  have hs_eq : s = p₁ := by
    have hsErase :
        s ∈ (S.capInteriorByIndex S.oppIndex1).erase p₂ :=
      (Finset.mem_inter.mp hsInter).2
    simpa [herase] using hsErase
  have hselected_of_moserPair :
      ∀ {a b : ℝ²},
        ({m₁, m₂} : Finset ℝ²) = ({a, b} : Finset ℝ²) →
          SelectedClass A p₂ radius = ({a, b, p₁, x} : Finset ℝ²) := by
    intro a b hMset
    rw [hsel]
    ext y
    have hyMiff : (y = m₁ ∨ y = m₂) ↔ y = a ∨ y = b := by
      calc
        (y = m₁ ∨ y = m₂) ↔ y ∈ ({m₁, m₂} : Finset ℝ²) := by
          simp
        _ ↔ y ∈ ({a, b} : Finset ℝ²) := by
          rw [hMset]
        _ ↔ y = a ∨ y = b := by
          simp
    simp only [Finset.mem_insert, Finset.mem_singleton, hs_eq]
    constructor
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mp (Or.inl hy) with hya | hyb
        · exact Or.inl hya
        · exact Or.inr (Or.inl hyb)
      · rcases hyMiff.mp (Or.inr hy) with hya | hyb
        · exact Or.inl hya
        · exact Or.inr (Or.inl hyb)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mpr (Or.inl hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · rcases hyMiff.mpr (Or.inr hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
  rcases triangle_pair_eq_opposite_left_or_opposite_right_of_mem
      S S.oppIndex1 hm₁Verts hm₂Verts hmne hoppPair with
    hMleft | hMright
  · left
    have hselected := hselected_of_moserPair hMleft
    have hmaskSet :
        SelectedClass A p₂ radius =
          ({rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .v,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pw} :
            Finset ℝ²) := by
      rw [hselected]
      rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
      rw [← hsstar_eq]
      ext y
      simp [rightPinnedLabelPoint]
      tauto
    rw [hmaskSet]
    exact pointMask_eq_oppositeUPuSeedPrivateMask hinj hsstar
  · right
    have hselected := hselected_of_moserPair hMright
    have hmaskSet :
        SelectedClass A p₂ radius =
          ({rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .v,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .w,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
              rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pw} :
            Finset ℝ²) := by
      rw [hselected]
      rw [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
      rw [← hsstar_eq]
      ext y
      simp [rightPinnedLabelPoint]
      tauto
    rw [hmaskSet]
    exact pointMask_eq_oppositeWPuSeedPrivateMask hinj hsstar

/-- In the left-oriented own-endpoint branch, a `Pw`-centered erased payload
has the generated `.Pw` private seed mask. -/
theorem leftOwnPwSeedPrivateMask_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₁ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₁ radius ∧
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₁ radius) :
    pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₁ radius) =
      maskOfLabels [.u, .w, sstar, .Pu] := by
  classical
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, _hL, _hR, hsel, _hcard⟩
  let M := SelectedClass A p₁ radius ∩ S.triangle.verts
  have hMcard : M.card = 2 := by
    simp [M, hM, hmne]
  have hleftM :
      S.leftOuterVertexByIndex S.oppIndex2 ∈ M := by
    exact Finset.mem_inter.mpr
      ⟨hown.1, S.leftOuterVertexByIndex_mem_triangle_verts S.oppIndex2⟩
  have hrightM :
      S.rightOuterVertexByIndex S.oppIndex2 ∈ M := by
    exact Finset.mem_inter.mpr
      ⟨hown.2, S.rightOuterVertexByIndex_mem_triangle_verts S.oppIndex2⟩
  have hleft_ne_right :
      S.leftOuterVertexByIndex S.oppIndex2 ≠
        S.rightOuterVertexByIndex S.oppIndex2 := by
    rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1,
      S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
    exact S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex1.symm
  have hownSub :
      ({S.leftOuterVertexByIndex S.oppIndex2,
          S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) ⊆ M := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl
    · exact hleftM
    · exact hrightM
  have hownCard :
      ({S.leftOuterVertexByIndex S.oppIndex2,
          S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²).card = 2 := by
    simp [hleft_ne_right]
  have hMown :
      M =
        ({S.leftOuterVertexByIndex S.oppIndex2,
            S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) :=
    (Finset.eq_of_subset_of_card_le hownSub (by
      rw [hMcard, hownCard])).symm
  have hMset :
      ({m₁, m₂} : Finset ℝ²) =
        ({S.leftOuterVertexByIndex S.oppIndex2,
            S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) := by
    calc
      ({m₁, m₂} : Finset ℝ²) = M := by
        simpa [M] using hM.symm
      _ =
          ({S.leftOuterVertexByIndex S.oppIndex2,
              S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) := hMown
  have hpair' :
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior2] using hpair
  have herase :
      (S.capInteriorByIndex S.oppIndex2).erase p₁ = ({p₂} : Finset ℝ²) := by
    rw [hpair']
    simp [hp12]
  have hsInter :
      s ∈ SelectedClass A p₁ radius ∩
        (S.capInteriorByIndex S.oppIndex2).erase p₁ := by
    rw [hC]
    simp
  have hs_eq : s = p₂ := by
    have hsErase :
        s ∈ (S.capInteriorByIndex S.oppIndex2).erase p₁ :=
      (Finset.mem_inter.mp hsInter).2
    simpa [herase] using hsErase
  have hselected :
      SelectedClass A p₁ radius =
        ({S.leftOuterVertexByIndex S.oppIndex2,
            S.rightOuterVertexByIndex S.oppIndex2, p₂, x} :
          Finset ℝ²) := by
    rw [hsel]
    ext y
    have hyMiff :
        (y = m₁ ∨ y = m₂) ↔
          y = S.leftOuterVertexByIndex S.oppIndex2 ∨
            y = S.rightOuterVertexByIndex S.oppIndex2 := by
      calc
        (y = m₁ ∨ y = m₂) ↔ y ∈ ({m₁, m₂} : Finset ℝ²) := by
          simp
        _ ↔ y ∈
            ({S.leftOuterVertexByIndex S.oppIndex2,
                S.rightOuterVertexByIndex S.oppIndex2} :
              Finset ℝ²) := by
          rw [hMset]
        _ ↔
            y = S.leftOuterVertexByIndex S.oppIndex2 ∨
              y = S.rightOuterVertexByIndex S.oppIndex2 := by
          simp
    simp only [Finset.mem_insert, Finset.mem_singleton, hs_eq]
    constructor
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mp (Or.inl hy) with hyLeft | hyRight
        · exact Or.inl hyLeft
        · exact Or.inr (Or.inl hyRight)
      · rcases hyMiff.mp (Or.inr hy) with hyLeft | hyRight
        · exact Or.inl hyLeft
        · exact Or.inr (Or.inl hyRight)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mpr (Or.inl hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · rcases hyMiff.mpr (Or.inr hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
  have hmaskSet :
      SelectedClass A p₁ radius =
        ({leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u,
            leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .w,
            leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
            leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pu} :
          Finset ℝ²) := by
    rw [hselected]
    rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1,
      S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
    rw [← hsstar_eq]
    ext y
    simp [leftPinnedLabelPoint, leftPinnedToRightLabel, rightPinnedLabelPoint]
    tauto
  rw [hmaskSet]
  exact pointMask_eq_ownPwSeedPrivateMask hinj hsstar

/-- In the left-oriented own-endpoint branch, a `Pu`-centered erased payload
has the generated `.Pu` private seed mask. -/
theorem leftOwnPuSeedPrivateMask_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₂ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₂ radius ∧
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₂ radius) :
    pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₂ radius) =
      maskOfLabels [.u, .w, sstar, .Pw] := by
  classical
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, _hL, _hR, hsel, _hcard⟩
  let M := SelectedClass A p₂ radius ∩ S.triangle.verts
  have hMcard : M.card = 2 := by
    simp [M, hM, hmne]
  have hleftM :
      S.leftOuterVertexByIndex S.oppIndex2 ∈ M := by
    exact Finset.mem_inter.mpr
      ⟨hown.1, S.leftOuterVertexByIndex_mem_triangle_verts S.oppIndex2⟩
  have hrightM :
      S.rightOuterVertexByIndex S.oppIndex2 ∈ M := by
    exact Finset.mem_inter.mpr
      ⟨hown.2, S.rightOuterVertexByIndex_mem_triangle_verts S.oppIndex2⟩
  have hleft_ne_right :
      S.leftOuterVertexByIndex S.oppIndex2 ≠
        S.rightOuterVertexByIndex S.oppIndex2 := by
    rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1,
      S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
    exact S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex1.symm
  have hownSub :
      ({S.leftOuterVertexByIndex S.oppIndex2,
          S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) ⊆ M := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl
    · exact hleftM
    · exact hrightM
  have hownCard :
      ({S.leftOuterVertexByIndex S.oppIndex2,
          S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²).card = 2 := by
    simp [hleft_ne_right]
  have hMown :
      M =
        ({S.leftOuterVertexByIndex S.oppIndex2,
            S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) :=
    (Finset.eq_of_subset_of_card_le hownSub (by
      rw [hMcard, hownCard])).symm
  have hMset :
      ({m₁, m₂} : Finset ℝ²) =
        ({S.leftOuterVertexByIndex S.oppIndex2,
            S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) := by
    calc
      ({m₁, m₂} : Finset ℝ²) = M := by
        simpa [M] using hM.symm
      _ =
          ({S.leftOuterVertexByIndex S.oppIndex2,
              S.rightOuterVertexByIndex S.oppIndex2} : Finset ℝ²) := hMown
  have hpair' :
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior2] using hpair
  have herase :
      (S.capInteriorByIndex S.oppIndex2).erase p₂ = ({p₁} : Finset ℝ²) := by
    rw [hpair']
    ext y
    constructor
    · intro hy
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton] at hy
      rcases hy with ⟨hyne, hypair⟩
      rcases hypair with h | h
      · simp [h]
      · exact False.elim (hyne h)
    · intro hy
      have hyEq : y = p₁ := by
        simpa using hy
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton]
      exact ⟨by simpa [hyEq] using hp12, Or.inl hyEq⟩
  have hsInter :
      s ∈ SelectedClass A p₂ radius ∩
        (S.capInteriorByIndex S.oppIndex2).erase p₂ := by
    rw [hC]
    simp
  have hs_eq : s = p₁ := by
    have hsErase :
        s ∈ (S.capInteriorByIndex S.oppIndex2).erase p₂ :=
      (Finset.mem_inter.mp hsInter).2
    simpa [herase] using hsErase
  have hselected :
      SelectedClass A p₂ radius =
        ({S.leftOuterVertexByIndex S.oppIndex2,
            S.rightOuterVertexByIndex S.oppIndex2, p₁, x} :
          Finset ℝ²) := by
    rw [hsel]
    ext y
    have hyMiff :
        (y = m₁ ∨ y = m₂) ↔
          y = S.leftOuterVertexByIndex S.oppIndex2 ∨
            y = S.rightOuterVertexByIndex S.oppIndex2 := by
      calc
        (y = m₁ ∨ y = m₂) ↔ y ∈ ({m₁, m₂} : Finset ℝ²) := by
          simp
        _ ↔ y ∈
            ({S.leftOuterVertexByIndex S.oppIndex2,
                S.rightOuterVertexByIndex S.oppIndex2} :
              Finset ℝ²) := by
          rw [hMset]
        _ ↔
            y = S.leftOuterVertexByIndex S.oppIndex2 ∨
              y = S.rightOuterVertexByIndex S.oppIndex2 := by
          simp
    simp only [Finset.mem_insert, Finset.mem_singleton, hs_eq]
    constructor
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mp (Or.inl hy) with hyLeft | hyRight
        · exact Or.inl hyLeft
        · exact Or.inr (Or.inl hyRight)
      · rcases hyMiff.mp (Or.inr hy) with hyLeft | hyRight
        · exact Or.inl hyLeft
        · exact Or.inr (Or.inl hyRight)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mpr (Or.inl hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · rcases hyMiff.mpr (Or.inr hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
  have hmaskSet :
      SelectedClass A p₂ radius =
        ({leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u,
            leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .w,
            leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
            leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pw} :
          Finset ℝ²) := by
    rw [hselected]
    rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1,
      S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
    rw [← hsstar_eq]
    ext y
    simp [leftPinnedLabelPoint, leftPinnedToRightLabel, rightPinnedLabelPoint]
    tauto
  rw [hmaskSet]
  exact pointMask_eq_ownPuSeedPrivateMask hinj hsstar

/-- In the left-oriented opposite-Moser branch, a `Pw`-centered erased payload
has one of the two generated opposite private seed masks, according to which
own endpoint is the second Moser hit. -/
theorem leftOppositePwSeedPrivateMask_cases_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₁ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex2 ∈ SelectedClass A p₁ radius) :
    pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₁ radius) =
        maskOfLabels [.u, .v, sstar, .Pu] ∨
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₁ radius) =
        maskOfLabels [.v, .w, sstar, .Pu] := by
  classical
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, _hL, _hR, hsel, _hcard⟩
  have hm₁M :
      m₁ ∈ SelectedClass A p₁ radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₂M :
      m₂ ∈ SelectedClass A p₁ radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₁Verts : m₁ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₁M).2
  have hm₂Verts : m₂ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₂M).2
  have hoppM :
      S.oppositeVertexByIndex S.oppIndex2 ∈
        SelectedClass A p₁ radius ∩ S.triangle.verts :=
    Finset.mem_inter.mpr
      ⟨hopposite, S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex2⟩
  have hoppPair :
      S.oppositeVertexByIndex S.oppIndex2 ∈
        ({m₁, m₂} : Finset ℝ²) := by
    simpa [hM] using hoppM
  have hpair' :
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior2] using hpair
  have herase :
      (S.capInteriorByIndex S.oppIndex2).erase p₁ = ({p₂} : Finset ℝ²) := by
    rw [hpair']
    simp [hp12]
  have hsInter :
      s ∈ SelectedClass A p₁ radius ∩
        (S.capInteriorByIndex S.oppIndex2).erase p₁ := by
    rw [hC]
    simp
  have hs_eq : s = p₂ := by
    have hsErase :
        s ∈ (S.capInteriorByIndex S.oppIndex2).erase p₁ :=
      (Finset.mem_inter.mp hsInter).2
    simpa [herase] using hsErase
  have hselected_of_moserPair :
      ∀ {a b : ℝ²},
        ({m₁, m₂} : Finset ℝ²) = ({a, b} : Finset ℝ²) →
          SelectedClass A p₁ radius = ({a, b, p₂, x} : Finset ℝ²) := by
    intro a b hMset
    rw [hsel]
    ext y
    have hyMiff : (y = m₁ ∨ y = m₂) ↔ y = a ∨ y = b := by
      calc
        (y = m₁ ∨ y = m₂) ↔ y ∈ ({m₁, m₂} : Finset ℝ²) := by
          simp
        _ ↔ y ∈ ({a, b} : Finset ℝ²) := by
          rw [hMset]
        _ ↔ y = a ∨ y = b := by
          simp
    simp only [Finset.mem_insert, Finset.mem_singleton, hs_eq]
    constructor
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mp (Or.inl hy) with hya | hyb
        · exact Or.inl hya
        · exact Or.inr (Or.inl hyb)
      · rcases hyMiff.mp (Or.inr hy) with hya | hyb
        · exact Or.inl hya
        · exact Or.inr (Or.inl hyb)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mpr (Or.inl hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · rcases hyMiff.mpr (Or.inr hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
  rcases triangle_pair_eq_opposite_left_or_opposite_right_of_mem
      S S.oppIndex2 hm₁Verts hm₂Verts hmne hoppPair with
    hMleft | hMright
  · right
    have hselected := hselected_of_moserPair hMleft
    have hmaskSet :
        SelectedClass A p₁ radius =
          ({leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .v,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .w,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pu} :
            Finset ℝ²) := by
      rw [hselected]
      rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
      rw [← hsstar_eq]
      ext y
      simp [leftPinnedLabelPoint, leftPinnedToRightLabel, rightPinnedLabelPoint]
      tauto
    rw [hmaskSet]
    exact pointMask_eq_oppositeWPwSeedPrivateMask hinj hsstar
  · left
    have hselected := hselected_of_moserPair hMright
    have hmaskSet :
        SelectedClass A p₁ radius =
          ({leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .v,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pu} :
            Finset ℝ²) := by
      rw [hselected]
      rw [S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
      rw [← hsstar_eq]
      ext y
      simp [leftPinnedLabelPoint, leftPinnedToRightLabel, rightPinnedLabelPoint]
      tauto
    rw [hmaskSet]
    exact pointMask_eq_oppositeUPwSeedPrivateMask hinj hsstar

/-- In the left-oriented opposite-Moser branch, a `Pu`-centered erased payload
has one of the two generated opposite private seed masks, according to which
own endpoint is the second Moser hit. -/
theorem leftOppositePuSeedPrivateMask_cases_of_erasedPayload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₂ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex2 ∈ SelectedClass A p₂ radius) :
    pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₂ radius) =
        maskOfLabels [.u, .v, sstar, .Pw] ∨
      pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (SelectedClass A p₂ radius) =
        maskOfLabels [.v, .w, sstar, .Pw] := by
  classical
  rcases hpayload with
    ⟨m₁, m₂, s, hmne, hM, hC, _hL, _hR, hsel, _hcard⟩
  have hm₁M :
      m₁ ∈ SelectedClass A p₂ radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₂M :
      m₂ ∈ SelectedClass A p₂ radius ∩ S.triangle.verts := by
    rw [hM]
    simp
  have hm₁Verts : m₁ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₁M).2
  have hm₂Verts : m₂ ∈ S.triangle.verts := (Finset.mem_inter.mp hm₂M).2
  have hoppM :
      S.oppositeVertexByIndex S.oppIndex2 ∈
        SelectedClass A p₂ radius ∩ S.triangle.verts :=
    Finset.mem_inter.mpr
      ⟨hopposite, S.oppositeVertexByIndex_mem_triangle_verts S.oppIndex2⟩
  have hoppPair :
      S.oppositeVertexByIndex S.oppIndex2 ∈
        ({m₁, m₂} : Finset ℝ²) := by
    simpa [hM] using hoppM
  have hpair' :
      S.capInteriorByIndex S.oppIndex2 = ({p₁, p₂} : Finset ℝ²) := by
    simpa [SurplusCapPacket.oppInterior2] using hpair
  have herase :
      (S.capInteriorByIndex S.oppIndex2).erase p₂ = ({p₁} : Finset ℝ²) := by
    rw [hpair']
    ext y
    constructor
    · intro hy
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton] at hy
      rcases hy with ⟨hyne, hypair⟩
      rcases hypair with h | h
      · simp [h]
      · exact False.elim (hyne h)
    · intro hy
      have hyEq : y = p₁ := by
        simpa using hy
      simp only [Finset.mem_erase, Finset.mem_insert, Finset.mem_singleton]
      exact ⟨by simpa [hyEq] using hp12, Or.inl hyEq⟩
  have hsInter :
      s ∈ SelectedClass A p₂ radius ∩
        (S.capInteriorByIndex S.oppIndex2).erase p₂ := by
    rw [hC]
    simp
  have hs_eq : s = p₁ := by
    have hsErase :
        s ∈ (S.capInteriorByIndex S.oppIndex2).erase p₂ :=
      (Finset.mem_inter.mp hsInter).2
    simpa [herase] using hsErase
  have hselected_of_moserPair :
      ∀ {a b : ℝ²},
        ({m₁, m₂} : Finset ℝ²) = ({a, b} : Finset ℝ²) →
          SelectedClass A p₂ radius = ({a, b, p₁, x} : Finset ℝ²) := by
    intro a b hMset
    rw [hsel]
    ext y
    have hyMiff : (y = m₁ ∨ y = m₂) ↔ y = a ∨ y = b := by
      calc
        (y = m₁ ∨ y = m₂) ↔ y ∈ ({m₁, m₂} : Finset ℝ²) := by
          simp
        _ ↔ y ∈ ({a, b} : Finset ℝ²) := by
          rw [hMset]
        _ ↔ y = a ∨ y = b := by
          simp
    simp only [Finset.mem_insert, Finset.mem_singleton, hs_eq]
    constructor
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mp (Or.inl hy) with hya | hyb
        · exact Or.inl hya
        · exact Or.inr (Or.inl hyb)
      · rcases hyMiff.mp (Or.inr hy) with hya | hyb
        · exact Or.inl hya
        · exact Or.inr (Or.inl hyb)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
    · intro hy
      rcases hy with hy | hy | hy | hy
      · rcases hyMiff.mpr (Or.inl hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · rcases hyMiff.mpr (Or.inr hy) with hy₁ | hy₂
        · exact Or.inl hy₁
        · exact Or.inr (Or.inl hy₂)
      · exact Or.inr (Or.inr (Or.inl hy))
      · exact Or.inr (Or.inr (Or.inr hy))
  rcases triangle_pair_eq_opposite_left_or_opposite_right_of_mem
      S S.oppIndex2 hm₁Verts hm₂Verts hmne hoppPair with
    hMleft | hMright
  · right
    have hselected := hselected_of_moserPair hMleft
    have hmaskSet :
        SelectedClass A p₂ radius =
          ({leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .v,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .w,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pw} :
            Finset ℝ²) := by
      rw [hselected]
      rw [S.leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1]
      rw [← hsstar_eq]
      ext y
      simp [leftPinnedLabelPoint, leftPinnedToRightLabel, rightPinnedLabelPoint]
      tauto
    rw [hmaskSet]
    exact pointMask_eq_oppositeWPuSeedPrivateMask hinj hsstar
  · left
    have hselected := hselected_of_moserPair hMright
    have hmaskSet :
        SelectedClass A p₂ radius =
          ({leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .u,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .v,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar,
              leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 .Pw} :
            Finset ℝ²) := by
      rw [hselected]
      rw [S.rightOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_surplusIdx]
      rw [← hsstar_eq]
      ext y
      simp [leftPinnedLabelPoint, leftPinnedToRightLabel, rightPinnedLabelPoint]
      tauto
    rw [hmaskSet]
    exact pointMask_eq_oppositeUPuSeedPrivateMask hinj hsstar

/-- Right-oriented own-`Pw` erased payloads are refuted once the shared
seeded-shadow side-condition interface is available.  The exact-cap and private
payload mask equalities are discharged internally from the named geometric
payload. -/
theorem false_of_rightOwnPwErasedPayload_pointClasses_of_seed_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₁ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₁ radius ∧
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₁ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivateClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        maskCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      center ≠ .Pw →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 : ∀ a b : Label,
      pointPairClassCount
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) a b <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := .Pw, kind := .own,
      privateMask := maskOfLabels [.u, .w, sstar, .Pu] }
  have hseed : seed ∈ oneSidedSeeds := ownPwSeed_mem_oneSidedSeeds hsstar
  exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
    (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
    (centerClass := centerClass)
    (seed := seed)
    hseed hsstar hcard hself
    (by
      rw [hvClass]
      exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
        S hinj hpair)
    (by
      rw [hwClass]
      exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
        S hinj hqpair)
    (by
      rw [hprivateClass]
      exact rightOwnPwSeedPrivateMask_of_erasedPayload S hinj hsstar
        hsstar_eq hp12 hpair hpayload hown)
    huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
    htriggerQ2 htriggerPrevious hfinal

/-- Right-oriented own-`Pw` erased payloads are refuted from the seeded
candidate interface.  The exact `.v`, `.w`, and private-center masks are
discharged internally from the named geometric payload. -/
theorem false_of_rightOwnPwErasedPayload_pointClasses_of_seed_candidates
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₁ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₁ radius ∧
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₁ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivateClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
            OneSidedSeed).candidateMasks center)
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := .Pw, kind := .own,
      privateMask := maskOfLabels [.u, .w, sstar, .Pu] }
  have hseed : seed ∈ oneSidedSeeds := ownPwSeed_mem_oneSidedSeeds hsstar
  exact false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
    (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
    (centerClass := centerClass)
    (seed := seed)
    hseed
    (by
      rw [hvClass]
      exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
        S hinj hpair)
    (by
      rw [hwClass]
      exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
        S hinj hqpair)
    (by
      rw [hprivateClass]
      exact rightOwnPwSeedPrivateMask_of_erasedPayload S hinj hsstar
        hsstar_eq hp12 hpair hpayload hown)
    hcandidate hno3 hcounts hsep hsearchSep

/-- Right-oriented own-`Pu` erased payloads are refuted once the shared
seeded-shadow side-condition interface is available.  The exact-cap and private
payload mask equalities are discharged internally from the named geometric
payload. -/
theorem false_of_rightOwnPuErasedPayload_pointClasses_of_seed_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₂ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₂ radius ∧
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₂ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivateClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        maskCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      center ≠ .Pu →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 : ∀ a b : Label,
      pointPairClassCount
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) a b <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := .Pu, kind := .own,
      privateMask := maskOfLabels [.u, .w, sstar, .Pw] }
  have hseed : seed ∈ oneSidedSeeds := ownPuSeed_mem_oneSidedSeeds hsstar
  exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
    (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
    (centerClass := centerClass)
    (seed := seed)
    hseed hsstar hcard hself
    (by
      rw [hvClass]
      exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
        S hinj hpair)
    (by
      rw [hwClass]
      exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
        S hinj hqpair)
    (by
      rw [hprivateClass]
      exact rightOwnPuSeedPrivateMask_of_erasedPayload S hinj hsstar
        hsstar_eq hp12 hpair hpayload hown)
    huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
    htriggerQ2 htriggerPrevious hfinal

/-- Right-oriented own-`Pu` erased payloads are refuted from the seeded
candidate interface.  The exact `.v`, `.w`, and private-center masks are
discharged internally from the named geometric payload. -/
theorem false_of_rightOwnPuErasedPayload_pointClasses_of_seed_candidates
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₂ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₂ radius ∧
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p₂ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivateClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
            OneSidedSeed).candidateMasks center)
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := .Pu, kind := .own,
      privateMask := maskOfLabels [.u, .w, sstar, .Pw] }
  have hseed : seed ∈ oneSidedSeeds := ownPuSeed_mem_oneSidedSeeds hsstar
  exact false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
    (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
    (centerClass := centerClass)
    (seed := seed)
    hseed
    (by
      rw [hvClass]
      exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
        S hinj hpair)
    (by
      rw [hwClass]
      exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
        S hinj hqpair)
    (by
      rw [hprivateClass]
      exact rightOwnPuSeedPrivateMask_of_erasedPayload S hinj hsstar
        hsstar_eq hp12 hpair hpayload hown)
    hcandidate hno3 hcounts hsep hsearchSep

/-- Right-oriented opposite-Moser `Pw` erased payloads are refuted once the
shared seeded-shadow side-condition interface is available.  The private mask
adapter chooses the finite `oppositeU` or `oppositeW` seed according to the
second Moser hit. -/
theorem false_of_rightOppositePwErasedPayload_pointClasses_of_seed_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₁ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex1 ∈ SelectedClass A p₁ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivateClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        maskCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      center ≠ .Pw →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 : ∀ a b : Label,
      pointPairClassCount
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) a b <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  rcases rightOppositePwSeedPrivateMask_cases_of_erasedPayload S hinj hsstar
      hsstar_eq hp12 hpair hpayload hopposite with
    hprivate | hprivate
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pu] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeUPwSeed_mem_oneSidedSeeds hsstar
    exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
      (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (centerClass := centerClass)
      (seed := seed)
      hseed hsstar hcard hself
      (by
        rw [hvClass]
        exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
          S hinj hpair)
      (by
        rw [hwClass]
        exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
          S hinj hqpair)
      (by
        rw [hprivateClass]
        exact hprivate)
      huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
      htriggerQ2 htriggerPrevious hfinal
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pu] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeWPwSeed_mem_oneSidedSeeds hsstar
    exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
      (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (centerClass := centerClass)
      (seed := seed)
      hseed hsstar hcard hself
      (by
        rw [hvClass]
        exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
          S hinj hpair)
      (by
        rw [hwClass]
        exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
          S hinj hqpair)
      (by
        rw [hprivateClass]
        exact hprivate)
      huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
      htriggerQ2 htriggerPrevious hfinal

/-- Right-oriented opposite-Moser `Pu` erased payloads are refuted once the
shared seeded-shadow side-condition interface is available.  The private mask
adapter chooses the finite `oppositeU` or `oppositeW` seed according to the
second Moser hit. -/
theorem false_of_rightOppositePuErasedPayload_pointClasses_of_seed_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₂ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex1 ∈ SelectedClass A p₂ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivateClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        maskCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      center ≠ .Pu →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 : ∀ a b : Label,
      pointPairClassCount
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) a b <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  rcases rightOppositePuSeedPrivateMask_cases_of_erasedPayload S hinj hsstar
      hsstar_eq hp12 hpair hpayload hopposite with
    hprivate | hprivate
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pw] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeUPuSeed_mem_oneSidedSeeds hsstar
    exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
      (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (centerClass := centerClass)
      (seed := seed)
      hseed hsstar hcard hself
      (by
        rw [hvClass]
        exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
          S hinj hpair)
      (by
        rw [hwClass]
        exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
          S hinj hqpair)
      (by
        rw [hprivateClass]
        exact hprivate)
      huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
      htriggerQ2 htriggerPrevious hfinal
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pw] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeWPuSeed_mem_oneSidedSeeds hsstar
    exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
      (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (centerClass := centerClass)
      (seed := seed)
      hseed hsstar hcard hself
      (by
        rw [hvClass]
        exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
          S hinj hpair)
      (by
        rw [hwClass]
        exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
          S hinj hqpair)
      (by
        rw [hprivateClass]
        exact hprivate)
      huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
      htriggerQ2 htriggerPrevious hfinal

/-- Right-oriented opposite-Moser `Pw` erased payloads are refuted from the
seeded candidate interface.  The private-mask adapter selects either the
`oppositeU` or `oppositeW` seed, so both candidate branches are supplied. -/
theorem false_of_rightOppositePwErasedPayload_pointClasses_of_seed_candidates
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₁ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex1 ∈ SelectedClass A p₁ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivateClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hcandidateU : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
              privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
            OneSidedSeed).candidateMasks center)
    (hcandidateW : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
              privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
            OneSidedSeed).candidateMasks center)
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases rightOppositePwSeedPrivateMask_cases_of_erasedPayload S hinj hsstar
      hsstar_eq hp12 hpair hpayload hopposite with
    hprivate | hprivate
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pu] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeUPwSeed_mem_oneSidedSeeds hsstar
    exact
      false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
        (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (centerClass := centerClass)
        (seed := seed)
        hseed
        (by
          rw [hvClass]
          exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
            S hinj hpair)
        (by
          rw [hwClass]
          exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
            S hinj hqpair)
        (by
          rw [hprivateClass]
          exact hprivate)
        hcandidateU hno3 hcounts hsep hsearchSep
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pu] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeWPwSeed_mem_oneSidedSeeds hsstar
    exact
      false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
        (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (centerClass := centerClass)
        (seed := seed)
        hseed
        (by
          rw [hvClass]
          exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
            S hinj hpair)
        (by
          rw [hwClass]
          exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
            S hinj hqpair)
        (by
          rw [hprivateClass]
          exact hprivate)
        hcandidateW hno3 hcounts hsep hsearchSep

/-- Right-oriented opposite-Moser `Pu` erased payloads are refuted from the
seeded candidate interface.  The private-mask adapter selects either the
`oppositeU` or `oppositeW` seed, so both candidate branches are supplied. -/
theorem false_of_rightOppositePuErasedPayload_pointClasses_of_seed_candidates
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p₂ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex1 ∈ SelectedClass A p₂ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivateClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcandidateU : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
              privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
            OneSidedSeed).candidateMasks center)
    (hcandidateW : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
              privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
            OneSidedSeed).candidateMasks center)
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases rightOppositePuSeedPrivateMask_cases_of_erasedPayload S hinj hsstar
      hsstar_eq hp12 hpair hpayload hopposite with
    hprivate | hprivate
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pw] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeUPuSeed_mem_oneSidedSeeds hsstar
    exact
      false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
        (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (centerClass := centerClass)
        (seed := seed)
        hseed
        (by
          rw [hvClass]
          exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
            S hinj hpair)
        (by
          rw [hwClass]
          exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
            S hinj hqpair)
        (by
          rw [hprivateClass]
          exact hprivate)
        hcandidateU hno3 hcounts hsep hsearchSep
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pw] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeWPuSeed_mem_oneSidedSeeds hsstar
    exact
      false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
        (pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (centerClass := centerClass)
        (seed := seed)
        hseed
        (by
          rw [hvClass]
          exact rightPinnedLabelPoint_firstOppExactCapMask_of_oppInterior1_pair
            S hinj hpair)
        (by
          rw [hwClass]
          exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
            S hinj hqpair)
        (by
          rw [hprivateClass]
          exact hprivate)
        hcandidateW hno3 hcounts hsep hsearchSep

/-- Left-oriented own-`Pw` erased payloads are refuted once the shared
seeded-shadow side-condition interface is available.  The exact-cap and private
payload mask equalities are discharged internally from the named geometric
payload. -/
theorem false_of_leftOwnPwErasedPayload_pointClasses_of_seed_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₁ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₁ radius ∧
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₁ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivateClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        maskCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      center ≠ .Pw →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 : ∀ a b : Label,
      pointPairClassCount
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) a b <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := .Pw, kind := .own,
      privateMask := maskOfLabels [.u, .w, sstar, .Pu] }
  have hseed : seed ∈ oneSidedSeeds := ownPwSeed_mem_oneSidedSeeds hsstar
  exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
    (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
    (centerClass := centerClass)
    (seed := seed)
    hseed hsstar hcard hself
    (by
      rw [hvClass]
      exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
        S hinj hpair)
    (by
      rw [hwClass]
      exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
        S hinj hqpair)
    (by
      rw [hprivateClass]
      exact leftOwnPwSeedPrivateMask_of_erasedPayload S hinj hsstar
        hsstar_eq hp12 hpair hpayload hown)
    huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
    htriggerQ2 htriggerPrevious hfinal

/-- Left-oriented own-`Pw` erased payloads are refuted from the seeded
candidate interface.  The exact `.v`, `.w`, and private-center masks are
discharged internally from the named geometric payload. -/
theorem false_of_leftOwnPwErasedPayload_pointClasses_of_seed_candidates
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₁ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₁ radius ∧
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₁ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivateClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pw, kind := .own,
              privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
            OneSidedSeed).candidateMasks center)
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := .Pw, kind := .own,
      privateMask := maskOfLabels [.u, .w, sstar, .Pu] }
  have hseed : seed ∈ oneSidedSeeds := ownPwSeed_mem_oneSidedSeeds hsstar
  exact false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
    (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
    (centerClass := centerClass)
    (seed := seed)
    hseed
    (by
      rw [hvClass]
      exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
        S hinj hpair)
    (by
      rw [hwClass]
      exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
        S hinj hqpair)
    (by
      rw [hprivateClass]
      exact leftOwnPwSeedPrivateMask_of_erasedPayload S hinj hsstar
        hsstar_eq hp12 hpair hpayload hown)
    hcandidate hno3 hcounts hsep hsearchSep

/-- Left-oriented own-`Pu` erased payloads are refuted once the shared
seeded-shadow side-condition interface is available.  The exact-cap and private
payload mask equalities are discharged internally from the named geometric
payload. -/
theorem false_of_leftOwnPuErasedPayload_pointClasses_of_seed_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₂ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₂ radius ∧
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₂ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivateClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        maskCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      center ≠ .Pu →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 : ∀ a b : Label,
      pointPairClassCount
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) a b <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := .Pu, kind := .own,
      privateMask := maskOfLabels [.u, .w, sstar, .Pw] }
  have hseed : seed ∈ oneSidedSeeds := ownPuSeed_mem_oneSidedSeeds hsstar
  exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
    (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
    (centerClass := centerClass)
    (seed := seed)
    hseed hsstar hcard hself
    (by
      rw [hvClass]
      exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
        S hinj hpair)
    (by
      rw [hwClass]
      exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
        S hinj hqpair)
    (by
      rw [hprivateClass]
      exact leftOwnPuSeedPrivateMask_of_erasedPayload S hinj hsstar
        hsstar_eq hp12 hpair hpayload hown)
    huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
    htriggerQ2 htriggerPrevious hfinal

/-- Left-oriented own-`Pu` erased payloads are refuted from the seeded
candidate interface.  The exact `.v`, `.w`, and private-center masks are
discharged internally from the named geometric payload. -/
theorem false_of_leftOwnPuErasedPayload_pointClasses_of_seed_candidates
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₂ x radius)
    (hown :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₂ radius ∧
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p₂ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivateClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcandidate : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pu, kind := .own,
              privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
            OneSidedSeed).candidateMasks center)
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  let seed : OneSidedSeed :=
    { sstar := sstar, privateCenter := .Pu, kind := .own,
      privateMask := maskOfLabels [.u, .w, sstar, .Pw] }
  have hseed : seed ∈ oneSidedSeeds := ownPuSeed_mem_oneSidedSeeds hsstar
  exact false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
    (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
    (centerClass := centerClass)
    (seed := seed)
    hseed
    (by
      rw [hvClass]
      exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
        S hinj hpair)
    (by
      rw [hwClass]
      exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
        S hinj hqpair)
    (by
      rw [hprivateClass]
      exact leftOwnPuSeedPrivateMask_of_erasedPayload S hinj hsstar
        hsstar_eq hp12 hpair hpayload hown)
    hcandidate hno3 hcounts hsep hsearchSep

/-- Left-oriented opposite-Moser `Pw` erased payloads are refuted once the
shared seeded-shadow side-condition interface is available.  The private mask
adapter chooses the finite `oppositeU` or `oppositeW` seed according to the
second Moser hit. -/
theorem false_of_leftOppositePwErasedPayload_pointClasses_of_seed_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₁ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex2 ∈ SelectedClass A p₁ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivateClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        maskCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      center ≠ .Pw →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 : ∀ a b : Label,
      pointPairClassCount
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) a b <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  rcases leftOppositePwSeedPrivateMask_cases_of_erasedPayload S hinj hsstar
      hsstar_eq hp12 hpair hpayload hopposite with
    hprivate | hprivate
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pu] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeUPwSeed_mem_oneSidedSeeds hsstar
    exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
      (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (centerClass := centerClass)
      (seed := seed)
      hseed hsstar hcard hself
      (by
        rw [hvClass]
        exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
          S hinj hpair)
      (by
        rw [hwClass]
        exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
          S hinj hqpair)
      (by
        rw [hprivateClass]
        exact hprivate)
      huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
      htriggerQ2 htriggerPrevious hfinal
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pu] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeWPwSeed_mem_oneSidedSeeds hsstar
    exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
      (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (centerClass := centerClass)
      (seed := seed)
      hseed hsstar hcard hself
      (by
        rw [hvClass]
        exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
          S hinj hpair)
      (by
        rw [hwClass]
        exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
          S hinj hqpair)
      (by
        rw [hprivateClass]
        exact hprivate)
      huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
      htriggerQ2 htriggerPrevious hfinal

/-- Left-oriented opposite-Moser `Pu` erased payloads are refuted once the
shared seeded-shadow side-condition interface is available.  The private mask
adapter chooses the finite `oppositeU` or `oppositeW` seed according to the
second Moser hit. -/
theorem false_of_leftOppositePuErasedPayload_pointClasses_of_seed_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₂ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex2 ∈ SelectedClass A p₂ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivateClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcard : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        maskCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ center : Label, isMoserLabel center = false →
      center ≠ .Pu →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 : ∀ a b : Label,
      pointPairClassCount
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) a b <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  rcases leftOppositePuSeedPrivateMask_cases_of_erasedPayload S hinj hsstar
      hsstar_eq hp12 hpair hpayload hopposite with
    hprivate | hprivate
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pw] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeUPuSeed_mem_oneSidedSeeds hsstar
    exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
      (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (centerClass := centerClass)
      (seed := seed)
      hseed hsstar hcard hself
      (by
        rw [hvClass]
        exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
          S hinj hpair)
      (by
        rw [hwClass]
        exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
          S hinj hqpair)
      (by
        rw [hprivateClass]
        exact hprivate)
      huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
      htriggerQ2 htriggerPrevious hfinal
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pw] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeWPuSeed_mem_oneSidedSeeds hsstar
    exact false_of_oneSidedSeedShadow_pointClasses_of_seed_circ_interfaces
      (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
      (centerClass := centerClass)
      (seed := seed)
      hseed hsstar hcard hself
      (by
        rw [hvClass]
        exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
          S hinj hpair)
      (by
        rw [hwClass]
        exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
          S hinj hqpair)
      (by
        rw [hprivateClass]
        exact hprivate)
      huv huw hcirc hno3 hcounts hsep hsearchSep htriggerU htriggerQ1
      htriggerQ2 htriggerPrevious hfinal

/-- Left-oriented opposite-Moser `Pw` erased payloads are refuted from the
seeded candidate interface.  The private-mask adapter selects either the
`oppositeU` or `oppositeW` seed, so both candidate branches are supplied. -/
theorem false_of_leftOppositePwErasedPayload_pointClasses_of_seed_candidates
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₁ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex2 ∈ SelectedClass A p₁ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivateClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hcandidateU : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
              privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
            OneSidedSeed).candidateMasks center)
    (hcandidateW : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pw →
        pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
              privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
            OneSidedSeed).candidateMasks center)
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases leftOppositePwSeedPrivateMask_cases_of_erasedPayload S hinj hsstar
      hsstar_eq hp12 hpair hpayload hopposite with
    hprivate | hprivate
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pu] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeUPwSeed_mem_oneSidedSeeds hsstar
    exact
      false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
        (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (centerClass := centerClass)
        (seed := seed)
        hseed
        (by
          rw [hvClass]
          exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
            S hinj hpair)
        (by
          rw [hwClass]
          exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
            S hinj hqpair)
        (by
          rw [hprivateClass]
          exact hprivate)
        hcandidateU hno3 hcounts hsep hsearchSep
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pu] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeWPwSeed_mem_oneSidedSeeds hsstar
    exact
      false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
        (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (centerClass := centerClass)
        (seed := seed)
        hseed
        (by
          rw [hvClass]
          exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
            S hinj hpair)
        (by
          rw [hwClass]
          exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
            S hinj hqpair)
        (by
          rw [hprivateClass]
          exact hprivate)
        hcandidateW hno3 hcounts hsep hsearchSep

/-- Left-oriented opposite-Moser `Pu` erased payloads are refuted from the
seeded candidate interface.  The private-mask adapter selects either the
`oppositeU` or `oppositeW` seed, so both candidate branches are supplied. -/
theorem false_of_leftOppositePuErasedPayload_pointClasses_of_seed_candidates
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p₂ x radius)
    (hopposite :
      S.oppositeVertexByIndex S.oppIndex2 ∈ SelectedClass A p₂ radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivateClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcandidateU : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
              privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
            OneSidedSeed).candidateMasks center)
    (hcandidateW : ∀ center : Label, center ≠ .v → center ≠ .w →
      center ≠ .Pu →
        pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center) ∈
          ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
              privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
            OneSidedSeed).candidateMasks center)
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  rcases leftOppositePuSeedPrivateMask_cases_of_erasedPayload S hinj hsstar
      hsstar_eq hp12 hpair hpayload hopposite with
    hprivate | hprivate
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
        privateMask := maskOfLabels [.u, .v, sstar, .Pw] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeUPuSeed_mem_oneSidedSeeds hsstar
    exact
      false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
        (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (centerClass := centerClass)
        (seed := seed)
        hseed
        (by
          rw [hvClass]
          exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
            S hinj hpair)
        (by
          rw [hwClass]
          exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
            S hinj hqpair)
        (by
          rw [hprivateClass]
          exact hprivate)
        hcandidateU hno3 hcounts hsep hsearchSep
  · let seed : OneSidedSeed :=
      { sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
        privateMask := maskOfLabels [.v, .w, sstar, .Pw] }
    have hseed : seed ∈ oneSidedSeeds :=
      oppositeWPuSeed_mem_oneSidedSeeds hsstar
    exact
      false_of_oneSidedSeedShadow_pointClasses_of_exact_vw_private_candidates
        (pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        (centerClass := centerClass)
        (seed := seed)
        hseed
        (by
          rw [hvClass]
          exact leftPinnedLabelPoint_firstOppExactCapMask_of_oppInterior2_pair
            S hinj hpair)
        (by
          rw [hwClass]
          exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
            S hinj hqpair)
        (by
          rw [hprivateClass]
          exact hprivate)
        hcandidateW hno3 hcounts hsep hsearchSep

/-- A right one-sided erased payload centered at an arbitrary point of the
first non-surplus interior is refuted by the seeded-shadow package once the
interior has been named and the shared finite side-condition interface is
available for both possible private centers. -/
theorem false_of_rightOneSidedErasedPayload_pointClasses_of_named_pair_seed_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 p x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p x radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivatePwClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hprivatePuClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcard : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      isMoserLabel center = false → center ≠ priv →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 : ∀ a b : Label,
      pointPairClassCount
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) a b <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  exact S.rightOneSidedErasedPayload_false_of_named_oppInterior1_pair
    hpair hp
    (fun hpayload hleft hright =>
      false_of_rightOwnPwErasedPayload_pointClasses_of_seed_interfaces
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload
        ⟨hleft, hright⟩ hvClass hwClass hprivatePwClass
        (fun center hv hw hpw =>
          hcard .Pw center (Or.inl rfl) hv hw hpw)
        (fun center hv hw hpw =>
          hself .Pw center (Or.inl rfl) hv hw hpw)
        huv huw
        (fun center hmoser hpw =>
          hcirc .Pw center (Or.inl rfl) hmoser hpw)
        hno3 hcounts hsep hsearchSep htriggerU htriggerQ1 htriggerQ2
        htriggerPrevious hfinal)
    (fun hpayload hleft hright =>
      false_of_rightOwnPuErasedPayload_pointClasses_of_seed_interfaces
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload
        ⟨hleft, hright⟩ hvClass hwClass hprivatePuClass
        (fun center hv hw hpu =>
          hcard .Pu center (Or.inr rfl) hv hw hpu)
        (fun center hv hw hpu =>
          hself .Pu center (Or.inr rfl) hv hw hpu)
        huv huw
        (fun center hmoser hpu =>
          hcirc .Pu center (Or.inr rfl) hmoser hpu)
        hno3 hcounts hsep hsearchSep htriggerU htriggerQ1 htriggerQ2
        htriggerPrevious hfinal)
    (fun hpayload hopposite =>
      false_of_rightOppositePwErasedPayload_pointClasses_of_seed_interfaces
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload hopposite
        hvClass hwClass hprivatePwClass
        (fun center hv hw hpw =>
          hcard .Pw center (Or.inl rfl) hv hw hpw)
        (fun center hv hw hpw =>
          hself .Pw center (Or.inl rfl) hv hw hpw)
        huv huw
        (fun center hmoser hpw =>
          hcirc .Pw center (Or.inl rfl) hmoser hpw)
        hno3 hcounts hsep hsearchSep htriggerU htriggerQ1 htriggerQ2
        htriggerPrevious hfinal)
    (fun hpayload hopposite =>
      false_of_rightOppositePuErasedPayload_pointClasses_of_seed_interfaces
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload hopposite
        hvClass hwClass hprivatePuClass
        (fun center hv hw hpu =>
          hcard .Pu center (Or.inr rfl) hv hw hpu)
        (fun center hv hw hpu =>
          hself .Pu center (Or.inr rfl) hv hw hpu)
        huv huw
        (fun center hmoser hpu =>
          hcirc .Pu center (Or.inr rfl) hmoser hpu)
        hno3 hcounts hsep hsearchSep htriggerU htriggerQ1 htriggerQ2
        htriggerPrevious hfinal)
    hpayload

/-- Right one-sided erased payloads with an arbitrary private center are
refuted from the seeded candidate interface after the named non-surplus
interior splits the center into the `Pw`/`Pu` cases. -/
theorem false_of_rightOneSidedErasedPayload_pointClasses_of_named_pair_seed_candidates
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 p x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p x radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivatePwClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hprivatePuClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcandidateOwnPw :
      OneSidedSeedCandidateRemainder
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
          OneSidedSeed))
    (hcandidateOwnPu :
      OneSidedSeedCandidateRemainder
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
          OneSidedSeed))
    (hcandidateOppositePwU :
      OneSidedSeedCandidateRemainder
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
            privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
          OneSidedSeed))
    (hcandidateOppositePwW :
      OneSidedSeedCandidateRemainder
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
            privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
          OneSidedSeed))
    (hcandidateOppositePuU :
      OneSidedSeedCandidateRemainder
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
            privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
          OneSidedSeed))
    (hcandidateOppositePuW :
      OneSidedSeedCandidateRemainder
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
            privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
          OneSidedSeed))
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  exact S.rightOneSidedErasedPayload_false_of_named_oppInterior1_pair
    hpair hp
    (fun hpayload hleft hright =>
      false_of_rightOwnPwErasedPayload_pointClasses_of_seed_candidates
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload
        ⟨hleft, hright⟩ hvClass hwClass hprivatePwClass
        hcandidateOwnPw hno3 hcounts hsep hsearchSep)
    (fun hpayload hleft hright =>
      false_of_rightOwnPuErasedPayload_pointClasses_of_seed_candidates
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload
        ⟨hleft, hright⟩ hvClass hwClass hprivatePuClass
        hcandidateOwnPu hno3 hcounts hsep hsearchSep)
    (fun hpayload hopposite =>
      false_of_rightOppositePwErasedPayload_pointClasses_of_seed_candidates
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload hopposite
        hvClass hwClass hprivatePwClass
        hcandidateOppositePwU hcandidateOppositePwW
        hno3 hcounts hsep hsearchSep)
    (fun hpayload hopposite =>
      false_of_rightOppositePuErasedPayload_pointClasses_of_seed_candidates
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload hopposite
        hvClass hwClass hprivatePuClass
        hcandidateOppositePuU hcandidateOppositePuW
        hno3 hcounts hsep hsearchSep)
    hpayload

/-- Right one-sided erased payloads with an arbitrary private center are
refuted from local seed-mask facts and the generated Boolean no-three
interface.  Compared with the older all-label mask interface, this version
packages the remaining candidate-mask obligations through
`OneSidedSeedCandidateRemainder`. -/
theorem false_of_rightOneSidedErasedPayload_pointClasses_of_named_pair_seed_mask_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 p x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior1 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior1)
    (hpayload :
      SurplusCapPacket.RightOneSidedErasedPayload
        S S.oppIndex1 p x radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex1)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex2)
    (hprivatePwClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hprivatePuClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcard : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      isMoserLabel center = false → center ≠ priv →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  refine
    false_of_rightOneSidedErasedPayload_pointClasses_of_named_pair_seed_candidates
      S hinj hsstar hsstar_eq hp12 hpair hqpair hp hpayload
      hvClass hwClass hprivatePwClass hprivatePuClass ?_ ?_ ?_ ?_ ?_ ?_
      hno3 hcounts hsep hsearchSep
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal

/-- A left one-sided erased payload centered at an arbitrary point of the
second non-surplus interior is refuted by the seeded-shadow package once the
interior has been named and the shared finite side-condition interface is
available for both possible private centers. -/
theorem false_of_leftOneSidedErasedPayload_pointClasses_of_named_pair_seed_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 p x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p x radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivatePwClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hprivatePuClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcard : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      isMoserLabel center = false → center ≠ priv →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 : ∀ a b : Label,
      pointPairClassCount
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) a b <= 2)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  exact S.leftOneSidedErasedPayload_false_of_named_oppInterior2_pair
    hpair hp
    (fun hpayload hleft hright =>
      false_of_leftOwnPwErasedPayload_pointClasses_of_seed_interfaces
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload
        ⟨hleft, hright⟩ hvClass hwClass hprivatePwClass
        (fun center hv hw hpw =>
          hcard .Pw center (Or.inl rfl) hv hw hpw)
        (fun center hv hw hpw =>
          hself .Pw center (Or.inl rfl) hv hw hpw)
        huv huw
        (fun center hmoser hpw =>
          hcirc .Pw center (Or.inl rfl) hmoser hpw)
        hno3 hcounts hsep hsearchSep htriggerU htriggerQ1 htriggerQ2
        htriggerPrevious hfinal)
    (fun hpayload hleft hright =>
      false_of_leftOwnPuErasedPayload_pointClasses_of_seed_interfaces
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload
        ⟨hleft, hright⟩ hvClass hwClass hprivatePuClass
        (fun center hv hw hpu =>
          hcard .Pu center (Or.inr rfl) hv hw hpu)
        (fun center hv hw hpu =>
          hself .Pu center (Or.inr rfl) hv hw hpu)
        huv huw
        (fun center hmoser hpu =>
          hcirc .Pu center (Or.inr rfl) hmoser hpu)
        hno3 hcounts hsep hsearchSep htriggerU htriggerQ1 htriggerQ2
        htriggerPrevious hfinal)
    (fun hpayload hopposite =>
      false_of_leftOppositePwErasedPayload_pointClasses_of_seed_interfaces
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload hopposite
        hvClass hwClass hprivatePwClass
        (fun center hv hw hpw =>
          hcard .Pw center (Or.inl rfl) hv hw hpw)
        (fun center hv hw hpw =>
          hself .Pw center (Or.inl rfl) hv hw hpw)
        huv huw
        (fun center hmoser hpw =>
          hcirc .Pw center (Or.inl rfl) hmoser hpw)
        hno3 hcounts hsep hsearchSep htriggerU htriggerQ1 htriggerQ2
        htriggerPrevious hfinal)
    (fun hpayload hopposite =>
      false_of_leftOppositePuErasedPayload_pointClasses_of_seed_interfaces
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload hopposite
        hvClass hwClass hprivatePuClass
        (fun center hv hw hpu =>
          hcard .Pu center (Or.inr rfl) hv hw hpu)
        (fun center hv hw hpu =>
          hself .Pu center (Or.inr rfl) hv hw hpu)
        huv huw
        (fun center hmoser hpu =>
          hcirc .Pu center (Or.inr rfl) hmoser hpu)
        hno3 hcounts hsep hsearchSep htriggerU htriggerQ1 htriggerQ2
        htriggerPrevious hfinal)
    hpayload

/-- Left one-sided erased payloads with an arbitrary private center are refuted
from the seeded candidate interface after the named non-surplus interior splits
the center into the `Pw`/`Pu` cases. -/
theorem false_of_leftOneSidedErasedPayload_pointClasses_of_named_pair_seed_candidates
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 p x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p x radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivatePwClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hprivatePuClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcandidateOwnPw :
      OneSidedSeedCandidateRemainder
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pw, kind := .own,
            privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
          OneSidedSeed))
    (hcandidateOwnPu :
      OneSidedSeedCandidateRemainder
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pu, kind := .own,
            privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
          OneSidedSeed))
    (hcandidateOppositePwU :
      OneSidedSeedCandidateRemainder
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
            privateMask := maskOfLabels [.u, .v, sstar, .Pu] } :
          OneSidedSeed))
    (hcandidateOppositePwW :
      OneSidedSeedCandidateRemainder
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
            privateMask := maskOfLabels [.v, .w, sstar, .Pu] } :
          OneSidedSeed))
    (hcandidateOppositePuU :
      OneSidedSeedCandidateRemainder
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
            privateMask := maskOfLabels [.u, .v, sstar, .Pw] } :
          OneSidedSeed))
    (hcandidateOppositePuW :
      OneSidedSeedCandidateRemainder
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
        centerClass
        ({ sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
            privateMask := maskOfLabels [.v, .w, sstar, .Pw] } :
          OneSidedSeed))
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true) :
    False := by
  exact S.leftOneSidedErasedPayload_false_of_named_oppInterior2_pair
    hpair hp
    (fun hpayload hleft hright =>
      false_of_leftOwnPwErasedPayload_pointClasses_of_seed_candidates
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload
        ⟨hleft, hright⟩ hvClass hwClass hprivatePwClass
        hcandidateOwnPw hno3 hcounts hsep hsearchSep)
    (fun hpayload hleft hright =>
      false_of_leftOwnPuErasedPayload_pointClasses_of_seed_candidates
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload
        ⟨hleft, hright⟩ hvClass hwClass hprivatePuClass
        hcandidateOwnPu hno3 hcounts hsep hsearchSep)
    (fun hpayload hopposite =>
      false_of_leftOppositePwErasedPayload_pointClasses_of_seed_candidates
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload hopposite
        hvClass hwClass hprivatePwClass
        hcandidateOppositePwU hcandidateOppositePwW
        hno3 hcounts hsep hsearchSep)
    (fun hpayload hopposite =>
      false_of_leftOppositePuErasedPayload_pointClasses_of_seed_candidates
        S hinj hsstar hsstar_eq hp12 hpair hqpair hpayload hopposite
        hvClass hwClass hprivatePuClass
        hcandidateOppositePuU hcandidateOppositePuW
        hno3 hcounts hsep hsearchSep)
    hpayload

/-- Left one-sided erased payloads with an arbitrary private center are
refuted from local seed-mask facts and the generated Boolean no-three
interface.  This is the mirror of the right-oriented Boolean-no-three wrapper
for the one-sided seeded route. -/
theorem false_of_leftOneSidedErasedPayload_pointClasses_of_named_pair_seed_mask_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {p₁ p₂ q₁ q₂ s1 s2 s3 p x : ℝ²} {radius : ℝ}
    {centerClass : Label → Finset ℝ²}
    (hinj :
      Function.Injective
        (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3))
    {sstar : Label}
    (hsstar : isSurplusStar sstar = true)
    (hsstar_eq :
      leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x)
    (hp12 : p₁ ≠ p₂)
    (hpair : S.oppInterior2 = ({p₁, p₂} : Finset ℝ²))
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hp : p ∈ S.oppInterior2)
    (hpayload :
      SurplusCapPacket.LeftOneSidedErasedPayload
        S S.oppIndex2 p x radius)
    (hvClass : centerClass .v = S.capByIndex S.oppIndex2)
    (hwClass : centerClass .w = S.capByIndex S.oppIndex1)
    (hprivatePwClass : centerClass .Pw = SelectedClass A p₁ radius)
    (hprivatePuClass : centerClass .Pu = SelectedClass A p₂ radius)
    (hcard : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) = 4)
    (hself : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      center ≠ .v → center ≠ .w → center ≠ priv →
        maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass center)) center = false)
    (huv :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cvNoUMask <= 1)
    (huw :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u))
          cwNoUMask <= 1)
    (hcirc : ∀ priv center : Label,
      priv = .Pw ∨ priv = .Pu →
      isMoserLabel center = false → center ≠ priv →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .u &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .v &&
          maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) .w) = false)
    (hno3 :
      noThreeOK
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) = true)
    (hcounts : ∀ assigned : List Label,
      pairCountsOK
        (shadowPairCountsForAssigned
          (shadowOfPointClasses
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            centerClass) assigned) = true)
    (hsep : ∀ c cp a b : Label,
      sepOKFor
        (shadowOfPointClasses
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          centerClass) c cp a b = true)
    (hsearchSep : ∀ c cp : Label,
      crossSeparationOKForMasks c
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass c)) cp
        (pointMask
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
          (centerClass cp)) = true)
    (htriggerU :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .u)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .u))
              uPwPuMask)) = false)
    (htriggerQ1 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q1)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q1))
              uPwPuMask)) = false)
    (htriggerQ2 :
      (maskHas
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .Q2)) sstar &&
        decide
          (1 <=
            maskInterCard
              (pointMask
                (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                (centerClass .Q2))
              uPwPuMask)) = false)
    (htriggerPrevious : ∀ center : Label,
      center ∈ previousSstarCenters sstar →
        (maskHas
            (pointMask
              (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
              (centerClass center)) sstar &&
          decide
            (1 <=
              maskInterCard
                (pointMask
                  (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                  (centerClass center))
                uPwPuMask)) = false)
    (hfinal :
      maskInterCard
          (pointMask
            (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass sstar))
          uPwPuMask <= 1) :
    False := by
  refine
    false_of_leftOneSidedErasedPayload_pointClasses_of_named_pair_seed_candidates
      S hinj hsstar hsstar_eq hp12 hpair hqpair hp hpayload
      hvClass hwClass hprivatePwClass hprivatePuClass ?_ ?_ ?_ ?_ ?_ ?_
      hno3 hcounts hsep hsearchSep
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpw =>
        hcard .Pw center (Or.inl rfl) hv hw hpw)
      (fun center hv hw hpw =>
        hself .Pw center (Or.inl rfl) hv hw hpw)
      huv huw
      (fun center hmoser hpw =>
        hcirc .Pw center (Or.inl rfl) hmoser hpw)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal
  · exact oneSidedSeedCandidateRemainder_of_mask_interfaces hsstar
      (fun center hv hw hpu =>
        hcard .Pu center (Or.inr rfl) hv hw hpu)
      (fun center hv hw hpu =>
        hself .Pu center (Or.inr rfl) hv hw hpu)
      huv huw
      (fun center hmoser hpu =>
        hcirc .Pu center (Or.inr rfl) hmoser hpu)
      htriggerU htriggerQ1 htriggerQ2 htriggerPrevious hfinal

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

/-- The right-surplus pinned residual supplies generated candidate-mask
membership for both exact centers already determined by the payload: the pinned
`.v` class and the second non-surplus exact `.w` cap. -/
theorem pinnedRightSurplusResidual_exists_candidateMasks_vw
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1))
    {q₁ q₂ s1 s2 s3 : ℝ²}
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq12 : q₁ ≠ q₂)
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub : ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx)
    {centerClass : Label → Finset ℝ²}
    (hv : centerClass .v =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hw : centerClass .w = S.capByIndex S.oppIndex2) :
    ∃ sstar : Label, ∃ p₁ p₂ : ℝ²,
      isSurplusStar sstar = true ∧
        Function.Injective
          (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) ∧
        rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
        pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .v) ∈ candidateMasks sstar .v ∧
        pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .w) ∈ candidateMasks sstar .w := by
  classical
  rcases pinnedRightSurplusResidual_exists_pinnedPointMask S hpinned
      hxSurplus hq₁I hq₂I hq12 hxTriple hs12 hs13 hs23 hsSub with
    ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, hvmask⟩
  refine ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, ?_, ?_⟩
  · exact mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf hsstar (by
      rw [hv]
      exact hvmask)
  · have hwmask :
        pointMask (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .w) = secondOppExactCapMask := by
      rw [hw]
      exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
        S hinj hqpair
    exact mem_candidateMasks_w_of_pointMask_eq_secondOppExactCapMask hsstar
      hwmask

/-- The left-surplus mirror residual supplies generated candidate-mask
membership for the pinned `.v` class and the first non-surplus exact `.w` cap
after relabelling to the generated right-oriented convention. -/
theorem pinnedLeftSurplusResidual_exists_candidateMasks_vw
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2))
    {q₁ q₂ s1 s2 s3 : ℝ²}
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq12 : q₁ ≠ q₂)
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub : ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx)
    {centerClass : Label → Finset ℝ²}
    (hv : centerClass .v =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hw : centerClass .w = S.capByIndex S.oppIndex1) :
    ∃ sstar : Label, ∃ p₁ p₂ : ℝ²,
      isSurplusStar sstar = true ∧
        Function.Injective
          (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3) ∧
        leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x ∧
        pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .v) ∈ candidateMasks sstar .v ∧
        pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .w) ∈ candidateMasks sstar .w := by
  classical
  rcases pinnedLeftSurplusResidual_exists_pinnedPointMask S hpinned
      hxSurplus hq₁I hq₂I hq12 hxTriple hs12 hs13 hs23 hsSub with
    ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, hvmask⟩
  refine ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, ?_, ?_⟩
  · exact mem_candidateMasks_v_of_pointMask_eq_pinnedMaskOf hsstar (by
      rw [hv]
      exact hvmask)
  · have hwmask :
        pointMask (leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
            (centerClass .w) = secondOppExactCapMask := by
      rw [hw]
      exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
        S hinj hqpair
    exact mem_candidateMasks_w_of_pointMask_eq_secondOppExactCapMask hsstar
      hwmask

/-- A right-surplus pinned residual produces the generated pinned fragment once
the non-exact candidate memberships and global prefix/separation facts are
supplied for the induced geometric shadow.  The exact `.v` and `.w` candidate
cases are discharged internally from the residual payload. -/
theorem pinnedRightSurplusResidual_exists_validFragment_of_candidate_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
      (S.capByIndex S.oppIndex1 ∪ S.leftAdjacentCapByIndex S.oppIndex1))
    {q₁ q₂ s1 s2 s3 : ℝ²}
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hq12 : q₁ ≠ q₂)
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub : ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx)
    {centerClass : Label → Finset ℝ²}
    (hv : centerClass .v =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hw : centerClass .w = S.capByIndex S.oppIndex2) :
    ∃ sstar : Label, ∃ p₁ p₂ : ℝ²,
      let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      isSurplusStar sstar = true ∧
        Function.Injective pointOf ∧
        pointOf sstar = x ∧
        ((∀ center : Label, center ≠ .v → center ≠ .w →
            pointMask pointOf (centerClass center) ∈
              candidateMasks sstar center) →
          noThreeOK (shadowOfPointClasses pointOf centerClass) = true →
          (∀ assigned : List Label,
            pairCountsOK
              (shadowPairCountsForAssigned
                (shadowOfPointClasses pointOf centerClass) assigned) = true) →
          (∀ c cp a b : Label,
            sepOKFor (shadowOfPointClasses pointOf centerClass) c cp a b =
              true) →
          (∀ c cp : Label,
            crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
              (pointMask pointOf (centerClass cp)) = true) →
          isValidPinnedFragment sstar
            (shadowOfPointClasses pointOf centerClass) = true) := by
  classical
  rcases pinnedRightSurplusResidual_exists_pinnedPointMask S hpinned
      hxSurplus hq₁I hq₂I hq12 hxTriple hs12 hs13 hs23 hsSub with
    ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, hvmask⟩
  let pointOf := rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hpinnedMask :
      pointMask pointOf (centerClass .v) = pinnedMaskOf sstar := by
    rw [hv]
    exact hvmask
  have hwmask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask := by
    rw [hw]
    exact rightPinnedLabelPoint_secondOppExactCapMask_of_oppInterior2_pair
      S hinj hqpair
  refine ⟨sstar, p₁, p₂, ?_⟩
  dsimp only
  refine ⟨hsstar, hinj, hsstar_eq, ?_⟩
  intro hcandidate hno3 hcounts hsep hsearchSep
  exact isValidPinnedFragment_shadowOfPointClasses_of_exact_vw_candidates
    hsstar hpinnedMask hwmask hcandidate hno3 hcounts hsep hsearchSep

/-- The left-surplus mirror of
`pinnedRightSurplusResidual_exists_validFragment_of_candidate_interfaces`. -/
theorem pinnedLeftSurplusResidual_exists_validFragment_of_candidate_interfaces
    {A : Finset ℝ²} (S : SurplusCapPacket A) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x)
    (hxSurplus : x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
      (S.capByIndex S.oppIndex2 ∪ S.rightAdjacentCapByIndex S.oppIndex2))
    {q₁ q₂ s1 s2 s3 : ℝ²}
    (hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex1)
    (hq12 : q₁ ≠ q₂)
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²))
    (hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2) (hs13 : s1 ≠ s3) (hs23 : s2 ≠ s3)
    (hsSub : ({s1, s2, s3} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx)
    {centerClass : Label → Finset ℝ²}
    (hv : centerClass .v =
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hw : centerClass .w = S.capByIndex S.oppIndex1) :
    ∃ sstar : Label, ∃ p₁ p₂ : ℝ²,
      let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      isSurplusStar sstar = true ∧
        Function.Injective pointOf ∧
        pointOf sstar = x ∧
        ((∀ center : Label, center ≠ .v → center ≠ .w →
            pointMask pointOf (centerClass center) ∈
              candidateMasks sstar center) →
          noThreeOK (shadowOfPointClasses pointOf centerClass) = true →
          (∀ assigned : List Label,
            pairCountsOK
              (shadowPairCountsForAssigned
                (shadowOfPointClasses pointOf centerClass) assigned) = true) →
          (∀ c cp a b : Label,
            sepOKFor (shadowOfPointClasses pointOf centerClass) c cp a b =
              true) →
          (∀ c cp : Label,
            crossSeparationOKForMasks c (pointMask pointOf (centerClass c)) cp
              (pointMask pointOf (centerClass cp)) = true) →
          isValidPinnedFragment sstar
            (shadowOfPointClasses pointOf centerClass) = true) := by
  classical
  rcases pinnedLeftSurplusResidual_exists_pinnedPointMask S hpinned
      hxSurplus hq₁I hq₂I hq12 hxTriple hs12 hs13 hs23 hsSub with
    ⟨sstar, p₁, p₂, hsstar, hinj, hsstar_eq, hvmask⟩
  let pointOf := leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
  have hpinnedMask :
      pointMask pointOf (centerClass .v) = pinnedMaskOf sstar := by
    rw [hv]
    exact hvmask
  have hwmask :
      pointMask pointOf (centerClass .w) = secondOppExactCapMask := by
    rw [hw]
    exact leftPinnedLabelPoint_secondOppExactCapMask_of_oppInterior1_pair
      S hinj hqpair
  refine ⟨sstar, p₁, p₂, ?_⟩
  dsimp only
  refine ⟨hsstar, hinj, hsstar_eq, ?_⟩
  intro hcandidate hno3 hcounts hsep hsearchSep
  exact isValidPinnedFragment_shadowOfPointClasses_of_exact_vw_candidates
    hsstar hpinnedMask hwmask hcandidate hno3 hcounts hsep hsearchSep

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
