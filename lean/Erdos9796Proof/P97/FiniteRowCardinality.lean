/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Finset.Card

/-!
# Cardinality of the part of a four-point row outside a cap

Two distinct cap members saturate an upper bound of two on the intersection of
a four-point support with a cap. The remaining two support points lie outside.
This counting argument is shared by the exact-fifteen, exact-sixteen, and
exact-seventeen row models; it does not depend on a finite label enumeration.
-/

namespace Problem97.FiniteRowCardinality

/-- A four-point row with two distinct certified cap hits and at most two cap
hits has exactly two points outside the cap. -/
theorem outsideSlice_card_eq_two {α : Type*} [DecidableEq α]
    (support cap : Finset α) (a b : α)
    (hsupport : support.card = 4)
    (hcap : (support ∩ cap).card ≤ 2)
    (ha : a ∈ support ∩ cap) (hb : b ∈ support ∩ cap)
    (hab : a ≠ b) :
    (support \ cap).card = 2 := by
  have hpair : {a, b} ⊆ support ∩ cap := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact ha
    · exact hb
  have htwo : 2 ≤ (support ∩ cap).card := by
    calc
      2 = ({a, b} : Finset α).card := by simp [hab]
      _ ≤ (support ∩ cap).card := Finset.card_le_card hpair
  have hinter : (support ∩ cap).card = 2 := by omega
  have hsplit := Finset.card_sdiff_add_card_inter support cap
  omega

end Problem97.FiniteRowCardinality
