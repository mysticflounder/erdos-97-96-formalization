/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Post-v37 exact-overlap adapter scratch check

This is deliberately scratch-only: it records the finite-set consequence of an
exact singleton cap trace and a two-point selected-support overlap.
-/

namespace Problem97.SelectedFourClassScratch

open scoped EuclideanGeometry

/-- A two-point overlap whose first support has singleton trace in `C` has a
unique second point, and that point is outside `C`. -/
theorem exact_overlap_of_cap_singleton
    {α : Type*} [DecidableEq α] {K L C : Finset α} {J : α}
    (hinter_le : (K ∩ L).card ≤ 2)
    (hcap : K ∩ C = {J})
    (hJ : J ∈ K ∩ L)
    (hinter_ge : 2 ≤ (K ∩ L).card) :
    ∃ x, x ∉ C ∧ K ∩ L = {J, x} ∧ (K \ C) ∩ (L \ C) = {x} := by
  classical
  have hinter_card : (K ∩ L).card = 2 := le_antisymm hinter_le hinter_ge
  have hJcap : J ∈ C := by
    have hJKC : J ∈ K ∩ C := by
      rw [hcap]
      simp
    exact (Finset.mem_inter.mp hJKC).2
  rw [Finset.card_eq_two] at hinter_card
  rcases hinter_card with ⟨a, b, hab, hinter_eq⟩
  have hJab : J = a ∨ J = b := by
    rw [hinter_eq] at hJ
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hJ
  rcases hJab with rfl | rfl
  · have hbKL : b ∈ K ∩ L := by
      rw [hinter_eq]
      simp
    have hbK : b ∈ K := (Finset.mem_inter.mp hbKL).1
    have hbnotC : b ∉ C := by
      intro hbC
      have hbKC : b ∈ K ∩ C := Finset.mem_inter.mpr ⟨hbK, hbC⟩
      rw [hcap] at hbKC
      have hbJ : b = J := by simpa using hbKC
      exact hab hbJ.symm
    refine ⟨b, hbnotC, hinter_eq, ?_⟩
    ext z
    constructor
    · intro hz
      rcases Finset.mem_inter.mp hz with ⟨hzKC, hzLC⟩
      have hzKL : z ∈ K ∩ L :=
        Finset.mem_inter.mpr ⟨(Finset.mem_sdiff.mp hzKC).1, (Finset.mem_sdiff.mp hzLC).1⟩
      rw [hinter_eq] at hzKL
      rcases (Finset.mem_insert.mp hzKL) with hzA | hzB
      · subst z
        exact False.elim ((Finset.mem_sdiff.mp hzKC).2 hJcap)
      · simpa only [Finset.mem_singleton] using hzB
    · intro hz
      have hzb : z = b := Finset.mem_singleton.mp hz
      subst z
      exact Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨(Finset.mem_inter.mp hbKL).1, hbnotC⟩,
          Finset.mem_sdiff.mpr ⟨(Finset.mem_inter.mp hbKL).2, hbnotC⟩⟩
  · have haKL : a ∈ K ∩ L := by
      rw [hinter_eq]
      simp
    have haK : a ∈ K := (Finset.mem_inter.mp haKL).1
    have hanotC : a ∉ C := by
      intro haC
      have haKC : a ∈ K ∩ C := Finset.mem_inter.mpr ⟨haK, haC⟩
      rw [hcap] at haKC
      have haJ : a = J := by simpa using haKC
      exact hab haJ
    refine ⟨a, hanotC, ?_, ?_⟩
    · simpa [Finset.pair_comm] using hinter_eq
    · ext z
      constructor
      · intro hz
        rcases Finset.mem_inter.mp hz with ⟨hzKC, hzLC⟩
        have hzKL : z ∈ K ∩ L :=
          Finset.mem_inter.mpr
            ⟨(Finset.mem_sdiff.mp hzKC).1, (Finset.mem_sdiff.mp hzLC).1⟩
        rw [hinter_eq] at hzKL
        rcases (Finset.mem_insert.mp hzKL) with hzA | hzB
        · simpa only [Finset.mem_singleton] using hzA
        · have hzJ : z = J := Finset.mem_singleton.mp hzB
          subst z
          exact False.elim ((Finset.mem_sdiff.mp hzKC).2 hJcap)
      · intro hz
        have hza : z = a := Finset.mem_singleton.mp hz
        subst z
        exact Finset.mem_inter.mpr
          ⟨Finset.mem_sdiff.mpr ⟨(Finset.mem_inter.mp haKL).1, hanotC⟩,
            Finset.mem_sdiff.mpr ⟨(Finset.mem_inter.mp haKL).2, hanotC⟩⟩

/-- Post-v37 adapter using only the carrier-level two-circle bound. -/
theorem selectedFourClass_exact_overlap_of_cap_singleton
    {A : Finset ℝ²} {C : Finset ℝ²} {c d J : ℝ²}
    (Kc : SelectedFourClass A c)
    (Kd : SelectedFourClass A d)
    (hcd : c ≠ d)
    (hcap : Kc.support ∩ C = {J})
    (hJ : J ∈ Kc.support ∩ Kd.support)
    (hoverlap_ge_two : 2 ≤ (Kc.support ∩ Kd.support).card) :
    ∃ x, x ∉ C ∧ Kc.support ∩ Kd.support = {J, x} ∧
      (Kc.support \ C) ∩ (Kd.support \ C) = {x} := by
  rcases exact_overlap_of_cap_singleton
      (SelectedFourClass.inter_card_le_two Kc Kd hcd) hcap hJ hoverlap_ge_two with
    ⟨x, hx, hinter_eq, hout_eq⟩
  exact ⟨x, hx, hinter_eq, hout_eq⟩

end Problem97.SelectedFourClassScratch
