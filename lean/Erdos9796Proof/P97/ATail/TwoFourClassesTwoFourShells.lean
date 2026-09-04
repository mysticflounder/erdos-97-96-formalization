/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Two four-point classes cut by two four-point sets

This module isolates a finite-set normal form for two disjoint four-point classes and
two four-point sets. If every class--set trace has at most two points, then either a
class point lies outside both sets or all four traces have two points and give two
simultaneous partitions. In the latter case the two four-point sets are disjoint and
each is exhausted by its traces on the two classes.
-/

namespace Problem97.ATailTwoFourClassesTwoFourShells

/-- The simultaneous two-by-two partition forced when two four-point sets cover two
disjoint four-point classes and every class--set trace has at most two points. -/
structure TwoFourClassesTwoFourShellsDoublePartition
    {α : Type*} [DecidableEq α] (Kρ Kσ Cb Cc : Finset α) : Prop where
  b_rho_card : (Cb ∩ Kρ).card = 2
  c_rho_card : (Cc ∩ Kρ).card = 2
  rho_traces_disjoint : Disjoint (Cb ∩ Kρ) (Cc ∩ Kρ)
  rho_traces_union_eq : (Cb ∩ Kρ) ∪ (Cc ∩ Kρ) = Kρ
  b_sigma_card : (Cb ∩ Kσ).card = 2
  c_sigma_card : (Cc ∩ Kσ).card = 2
  sigma_traces_disjoint : Disjoint (Cb ∩ Kσ) (Cc ∩ Kσ)
  sigma_traces_union_eq : (Cb ∩ Kσ) ∪ (Cc ∩ Kσ) = Kσ
  shells_disjoint : Disjoint Cb Cc
  b_eq_traces_union : Cb = (Cb ∩ Kρ) ∪ (Cb ∩ Kσ)
  c_eq_traces_union : Cc = (Cc ∩ Kρ) ∪ (Cc ∩ Kσ)

/-- Two disjoint four-point classes cut by two four-point sets either contain a point
outside both sets, or the four traces form simultaneous two-by-two partitions of the
classes and the sets. -/
theorem two_four_classes_two_four_shells_uncovered_or_doublePartition
    {α : Type*} [DecidableEq α] (Kρ Kσ Cb Cc : Finset α)
    (hKρcard : Kρ.card = 4) (hKσcard : Kσ.card = 4)
    (hclassesDisjoint : Disjoint Kρ Kσ)
    (hCbcard : Cb.card = 4) (hCccard : Cc.card = 4)
    (hbρ : (Cb ∩ Kρ).card ≤ 2) (hcρ : (Cc ∩ Kρ).card ≤ 2)
    (hbσ : (Cb ∩ Kσ).card ≤ 2) (hcσ : (Cc ∩ Kσ).card ≤ 2) :
    (∃ z ∈ Kρ ∪ Kσ, z ∉ Cb ∧ z ∉ Cc) ∨
      TwoFourClassesTwoFourShellsDoublePartition Kρ Kσ Cb Cc := by
  by_cases huncovered : ∃ z ∈ Kρ ∪ Kσ, z ∉ Cb ∧ z ∉ Cc
  · exact Or.inl huncovered
  right
  have hcovered : Kρ ∪ Kσ ⊆ Cb ∪ Cc := by
    intro z hz
    by_contra hz'
    have hzCb : z ∉ Cb := fun h => hz' (Finset.mem_union_left Cc h)
    have hzCc : z ∉ Cc := fun h => hz' (Finset.mem_union_right Cb h)
    exact huncovered ⟨z, hz, hzCb, hzCc⟩
  have classPartition :
      ∀ K : Finset α, K.card = 4 → K ⊆ Cb ∪ Cc →
        (Cb ∩ K).card ≤ 2 → (Cc ∩ K).card ≤ 2 →
        (Cb ∩ K).card = 2 ∧ (Cc ∩ K).card = 2 ∧
          Disjoint (Cb ∩ K) (Cc ∩ K) ∧ (Cb ∩ K) ∪ (Cc ∩ K) = K := by
    intro K hKcard hKcovered hbK hcK
    have hsplit : (Cb ∩ K) ∪ (Cc ∩ K) = K := by
      apply Finset.Subset.antisymm
      · intro z hz
        rcases Finset.mem_union.mp hz with hz | hz
        · exact (Finset.mem_inter.mp hz).2
        · exact (Finset.mem_inter.mp hz).2
      · intro z hz
        rcases Finset.mem_union.mp (hKcovered hz) with hzCb | hzCc
        · exact Finset.mem_union_left _ (Finset.mem_inter.mpr ⟨hzCb, hz⟩)
        · exact Finset.mem_union_right _ (Finset.mem_inter.mpr ⟨hzCc, hz⟩)
    have hle : K.card ≤ (Cb ∩ K).card + (Cc ∩ K).card := by
      calc
        K.card = ((Cb ∩ K) ∪ (Cc ∩ K)).card := by rw [hsplit]
        _ ≤ (Cb ∩ K).card + (Cc ∩ K).card := Finset.card_union_le _ _
    have hbKcard : (Cb ∩ K).card = 2 := by omega
    have hcKcard : (Cc ∩ K).card = 2 := by omega
    have hinterCard : ((Cb ∩ K) ∩ (Cc ∩ K)).card = 0 := by
      have hcards := Finset.card_union_add_card_inter (Cb ∩ K) (Cc ∩ K)
      rw [hsplit, hKcard, hbKcard, hcKcard] at hcards
      omega
    have hdisjoint : Disjoint (Cb ∩ K) (Cc ∩ K) := by
      rw [Finset.disjoint_iff_inter_eq_empty]
      exact Finset.card_eq_zero.mp hinterCard
    exact ⟨hbKcard, hcKcard, hdisjoint, hsplit⟩
  have hKρcovered : Kρ ⊆ Cb ∪ Cc := fun z hz =>
    hcovered (Finset.mem_union_left Kσ hz)
  have hKσcovered : Kσ ⊆ Cb ∪ Cc := fun z hz =>
    hcovered (Finset.mem_union_right Kρ hz)
  rcases classPartition Kρ hKρcard hKρcovered hbρ hcρ with
    ⟨hbρcard, hcρcard, hρdisjoint, hρsplit⟩
  rcases classPartition Kσ hKσcard hKσcovered hbσ hcσ with
    ⟨hbσcard, hcσcard, hσdisjoint, hσsplit⟩
  have shellSplit :
      ∀ C : Finset α, C.card = 4 →
        (C ∩ Kρ).card = 2 → (C ∩ Kσ).card = 2 →
        C = (C ∩ Kρ) ∪ (C ∩ Kσ) := by
    intro C hCcard hCρcard hCσcard
    have htraceDisjoint : Disjoint (C ∩ Kρ) (C ∩ Kσ) := by
      refine Finset.disjoint_left.mpr ?_
      intro z hzρ hzσ
      exact Finset.disjoint_left.mp hclassesDisjoint
        (Finset.mem_inter.mp hzρ).2 (Finset.mem_inter.mp hzσ).2
    have htraceCard : ((C ∩ Kρ) ∪ (C ∩ Kσ)).card = 4 := by
      rw [Finset.card_union_of_disjoint htraceDisjoint, hCρcard, hCσcard]
    have htraceSubset : (C ∩ Kρ) ∪ (C ∩ Kσ) ⊆ C := by
      intro z hz
      rcases Finset.mem_union.mp hz with hz | hz
      · exact (Finset.mem_inter.mp hz).1
      · exact (Finset.mem_inter.mp hz).1
    exact (Finset.eq_of_subset_of_card_le htraceSubset (by omega)).symm
  have hbSplit : Cb = (Cb ∩ Kρ) ∪ (Cb ∩ Kσ) :=
    shellSplit Cb hCbcard hbρcard hbσcard
  have hcSplit : Cc = (Cc ∩ Kρ) ∪ (Cc ∩ Kσ) :=
    shellSplit Cc hCccard hcρcard hcσcard
  have hshellsDisjoint : Disjoint Cb Cc := by
    rw [hbSplit, hcSplit]
    refine Finset.disjoint_left.mpr ?_
    intro z hzb hzc
    rcases Finset.mem_union.mp hzb with hzbρ | hzbσ
    · rcases Finset.mem_union.mp hzc with hzcρ | hzcσ
      · exact Finset.disjoint_left.mp hρdisjoint hzbρ hzcρ
      · exact Finset.disjoint_left.mp hclassesDisjoint
          (Finset.mem_inter.mp hzbρ).2 (Finset.mem_inter.mp hzcσ).2
    · rcases Finset.mem_union.mp hzc with hzcρ | hzcσ
      · exact Finset.disjoint_left.mp hclassesDisjoint
          (Finset.mem_inter.mp hzcρ).2 (Finset.mem_inter.mp hzbσ).2
      · exact Finset.disjoint_left.mp hσdisjoint hzbσ hzcσ
  exact {
    b_rho_card := hbρcard
    c_rho_card := hcρcard
    rho_traces_disjoint := hρdisjoint
    rho_traces_union_eq := hρsplit
    b_sigma_card := hbσcard
    c_sigma_card := hcσcard
    sigma_traces_disjoint := hσdisjoint
    sigma_traces_union_eq := hσsplit
    shells_disjoint := hshellsDisjoint
    b_eq_traces_union := hbSplit
    c_eq_traces_union := hcSplit
  }

end Problem97.ATailTwoFourClassesTwoFourShells
