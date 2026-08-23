/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# A low-span missing pair among four vertices

This module proves a finite directed-graph lemma: if every vertex has a self-loop and
out-degree at most two, then some mutually missing pair is separated by at most one of
the other vertices in the natural order on `Fin 4`.

## Main results

* `Problem97.ATailFourVertexLowSpan.finFour_exists_nearby_mutualFalse_of_card_le_two`:
  a mutually missing pair exists whose indices differ by at most two.
-/

namespace Problem97.ATailFourVertexLowSpan

set_option maxHeartbeats 5000000 in
-- The explicit orientation split checks all 2^5 nearby-pair orientations.
/-- A directed graph on four ordered vertices, with every self-loop present and every
out-degree at most two, has a mutually missing pair whose indices differ by at most two. -/
theorem finFour_exists_nearby_mutualFalse_of_card_le_two :
    ∀ contains : Fin 4 → Fin 4 → Bool,
      (∀ i, contains i i = true) →
      (∀ i, (Finset.univ.filter fun j ↦ contains i j).card ≤ 2) →
      ∃ i j : Fin 4,
        i < j ∧ j.1 ≤ i.1 + 2 ∧ contains i j = false ∧ contains j i = false := by
  intro contains hself hbound
  have hno_two (i j k : Fin 4) (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) :
      ¬ (contains i j = true ∧ contains i k = true) := by
    intro h
    have hsub : ({i, j, k} : Finset (Fin 4)) ⊆
        Finset.univ.filter (fun x ↦ contains i x = true) := by
      intro x hx
      have hx' : x = i ∨ x = j ∨ x = k := by
        simpa only [Finset.mem_insert, Finset.mem_singleton] using hx
      rcases hx' with hxi | hxj | hxk
      · subst x
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
        exact hself i
      · subst x
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
        exact h.1
      · subst x
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
        exact h.2
    have hcard : ({i, j, k} : Finset (Fin 4)).card ≤ 2 :=
      (Finset.card_le_card hsub).trans (hbound i)
    have hthree : ({i, j, k} : Finset (Fin 4)).card = 3 := by
      simp [hij, hik, hjk]
    omega
  by_contra h
  have hpair (i j : Fin 4) (hij : i < j) (hspan : j.1 ≤ i.1 + 2) :
      contains i j = true ∨ contains j i = true := by
    by_contra hp
    push_neg at hp
    exact h ⟨i, j, hij, hspan, Bool.eq_false_of_not_eq_true hp.1,
      Bool.eq_false_of_not_eq_true hp.2⟩
  have h012 := hno_two 0 1 2 (by decide) (by decide) (by decide)
  have h013 := hno_two 0 1 3 (by decide) (by decide) (by decide)
  have h023 := hno_two 0 2 3 (by decide) (by decide) (by decide)
  have h102 := hno_two 1 0 2 (by decide) (by decide) (by decide)
  have h103 := hno_two 1 0 3 (by decide) (by decide) (by decide)
  have h123 := hno_two 1 2 3 (by decide) (by decide) (by decide)
  have h201 := hno_two 2 0 1 (by decide) (by decide) (by decide)
  have h203 := hno_two 2 0 3 (by decide) (by decide) (by decide)
  have h213 := hno_two 2 1 3 (by decide) (by decide) (by decide)
  have h301 := hno_two 3 0 1 (by decide) (by decide) (by decide)
  have h302 := hno_two 3 0 2 (by decide) (by decide) (by decide)
  have h312 := hno_two 3 1 2 (by decide) (by decide) (by decide)
  rcases hpair 0 1 (by decide) (by decide) with h01 | h10 <;>
    rcases hpair 0 2 (by decide) (by decide) with h02 | h20 <;>
    rcases hpair 1 2 (by decide) (by decide) with h12 | h21 <;>
    rcases hpair 1 3 (by decide) (by decide) with h13 | h31 <;>
    rcases hpair 2 3 (by decide) (by decide) with h23 | h32 <;>
    aesop

end Problem97.ATailFourVertexLowSpan
