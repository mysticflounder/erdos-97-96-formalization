/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.Foundation

/-!
# Three-center finite cycle classification

When three row centers are assigned to the three available rows and no center
is assigned to its own row, the assignment contains either a directed
two-cycle or a directed three-cycle.  This is the finite combinatorial core
needed after an exact-thirteen cover has converted row membership into a
center-to-row map.
-/

namespace Problem97

attribute [local instance] Classical.propDecidable

/-- A fixed-point-free map on three explicitly named points has a two-cycle or
a directed three-cycle.  The statement does not assume injectivity: the
two-cycle alternative includes the case where the third point maps into that
cycle. -/
private theorem exists_twoCycle_or_threeCycle_of_three_choices
    {α : Type*} {a b c : α}
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (f : α → α)
    (ha : f a = b ∨ f a = c)
    (hb : f b = a ∨ f b = c)
    (hc : f c = a ∨ f c = b) :
    (∃ x y : α, x ≠ y ∧ f x = y ∧ f y = x) ∨
      (∃ x y z : α,
        x ≠ y ∧ x ≠ z ∧ y ≠ z ∧
        f x = y ∧ f y = z ∧ f z = x) := by
  rcases ha with hfa | hfa
  · rcases hb with hfb | hfb
    · exact Or.inl ⟨a, b, hab, hfa, hfb⟩
    · rcases hc with hfc | hfc
      · exact Or.inr ⟨a, b, c, hab, hac, hbc, hfa, hfb, hfc⟩
      · exact Or.inl ⟨b, c, hbc, hfb, hfc⟩
  · rcases hb with hfb | hfb
    · rcases hc with hfc | hfc
      · exact Or.inl ⟨a, c, hac, hfa, hfc⟩
      · exact Or.inr ⟨a, c, b, hac, hab, hbc.symm, hfa, hfc, hfb⟩
    · rcases hc with hfc | hfc
      · exact Or.inl ⟨a, c, hac, hfa, hfc⟩
      · exact Or.inl ⟨b, c, hbc, hfb, hfc⟩

/-- A fixed-point-free map whose values stay among three named points has a
two-cycle or a directed three-cycle.  The `hcover` field is the natural form
for row-assignment applications; the choice disjunctions are derived here
from it and fixed-point-freeness. -/
theorem exists_twoCycle_or_threeCycle_of_three
    {α : Type*} {a b c : α}
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (f : α → α)
    (hfixed : ∀ x : α, f x ≠ x)
    (hcover : ∀ x : α, f x = a ∨ f x = b ∨ f x = c) :
    (∃ x y : α, x ≠ y ∧ f x = y ∧ f y = x) ∨
      (∃ x y z : α,
        x ≠ y ∧ x ≠ z ∧ y ≠ z ∧
        f x = y ∧ f y = z ∧ f z = x) :=
  by
    have hfa : f a = b ∨ f a = c := by
      rcases hcover a with haa | hab' | hac'
      · exact False.elim (hfixed a haa)
      · exact Or.inl hab'
      · exact Or.inr hac'
    have hfb : f b = a ∨ f b = c := by
      rcases hcover b with hba | hbb | hbc'
      · exact Or.inl hba
      · exact False.elim (hfixed b hbb)
      · exact Or.inr hbc'
    have hfc : f c = a ∨ f c = b := by
      rcases hcover c with hca | hcb | hcc
      · exact Or.inl hca
      · exact Or.inr hcb
      · exact False.elim (hfixed c hcc)
    exact exists_twoCycle_or_threeCycle_of_three_choices
      hab hac hbc f hfa hfb hfc

end Problem97
