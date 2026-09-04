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

/-- A map whose values stay among three named points and has no fixed point on
those three points has a two-cycle or a directed three-cycle.  The `hcover`
field is the natural form for row-assignment applications; the choice
disjunctions are derived here from it and fixed-point-freeness. -/
theorem exists_twoCycle_or_threeCycle_of_three
    {α : Type*} {a b c : α}
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (f : α → α)
    (hfixed : f a ≠ a ∧ f b ≠ b ∧ f c ≠ c)
    (hcover : ∀ x : α, f x = a ∨ f x = b ∨ f x = c) :
    (∃ x y : α, x ≠ y ∧ f x = y ∧ f y = x) ∨
      (∃ x y z : α,
        x ≠ y ∧ x ≠ z ∧ y ≠ z ∧
        f x = y ∧ f y = z ∧ f z = x) :=
  by
    have hfa : f a = b ∨ f a = c := by
      rcases hcover a with haa | hab' | hac'
      · exact False.elim (hfixed.1 haa)
      · exact Or.inl hab'
      · exact Or.inr hac'
    have hfb : f b = a ∨ f b = c := by
      rcases hcover b with hba | hbb | hbc'
      · exact Or.inl hba
      · exact False.elim (hfixed.2.1 hbb)
      · exact Or.inr hbc'
    have hfc : f c = a ∨ f c = b := by
      rcases hcover c with hca | hcb | hcc
      · exact Or.inl hca
      · exact Or.inr hcb
      · exact False.elim (hfixed.2.2 hcc)
    exact exists_twoCycle_or_threeCycle_of_three_choices
      hab hac hbc f hfa hfb hfc

/-- The row assignment used by the exact-cover center map: membership in the
first row wins, then membership in the second row, and the third center is the
default. -/
noncomputable def threeRowMap {α : Type*} (a b c : α)
    (rowA rowB : Finset α) : α → α :=
  fun x => if x ∈ rowA then a else if x ∈ rowB then b else c

/-- A three-row assignment with each named center omitted from its own row
has a two-cycle or a directed three-cycle.  Only the three named centers need
be covered; the map's default value handles all other points. -/
theorem exists_twoCycle_or_threeCycle_of_three_rows
    {α : Type*} {a b c : α}
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (rowA rowB rowC : Finset α)
    (hcover : ∀ x : α, x = a ∨ x = b ∨ x = c →
      x ∈ rowA ∨ x ∈ rowB ∨ x ∈ rowC)
    (ha : a ∉ rowA) (hb : b ∉ rowB) (hc : c ∉ rowC) :
    (∃ x y : α, x ≠ y ∧
      threeRowMap a b c rowA rowB x = y ∧
      threeRowMap a b c rowA rowB y = x) ∨
      (∃ x y z : α,
        x ≠ y ∧ x ≠ z ∧ y ≠ z ∧
        threeRowMap a b c rowA rowB x = y ∧
        threeRowMap a b c rowA rowB y = z ∧
        threeRowMap a b c rowA rowB z = x) := by
  let f : α → α := threeRowMap a b c rowA rowB
  have hmap : ∀ x : α, f x = a ∨ f x = b ∨ f x = c := by
    intro x
    by_cases hxa : x ∈ rowA
    · exact Or.inl (by simp [f, threeRowMap, hxa])
    by_cases hxb : x ∈ rowB
    · exact Or.inr (Or.inl (by simp [f, threeRowMap, hxa, hxb]))
    · exact Or.inr (Or.inr (by simp [f, threeRowMap, hxa, hxb]))
  have hfa : f a ≠ a := by
    intro h
    by_cases hrowA : a ∈ rowA
    · exact ha hrowA
    by_cases hrowB : a ∈ rowB
    · have hba : b = a := by simpa [f, threeRowMap, hrowA, hrowB] using h
      exact hab hba.symm
    · have hca : c = a := by simpa [f, threeRowMap, hrowA, hrowB] using h
      exact hac hca.symm
  have hfb : f b ≠ b := by
    intro h
    by_cases hrowA : b ∈ rowA
    · have hab' : a = b := by simpa [f, threeRowMap, hrowA] using h
      exact hab hab'
    by_cases hrowB : b ∈ rowB
    · exact hb hrowB
    · have hcb : c = b := by simpa [f, threeRowMap, hrowA, hrowB] using h
      exact hbc hcb.symm
  have hfc : f c ≠ c := by
    intro h
    by_cases hrowA : c ∈ rowA
    · have hac' : a = c := by simpa [f, threeRowMap, hrowA] using h
      exact hac hac'
    · rcases hcover c (Or.inr (Or.inr rfl)) with hrowA' | hrowB | hrowC
      · exact (hrowA hrowA').elim
      · have hbc' : b = c := by
          simpa [f, threeRowMap, hrowA, hrowB] using h
        exact hbc hbc'
      · exact hc hrowC
  have hresult := exists_twoCycle_or_threeCycle_of_three
    hab hac hbc f ⟨hfa, hfb, hfc⟩ hmap
  simpa [f] using hresult

/-- If the three-center assignment is injective, the two-cycle alternative is
impossible: the unused third center would have to be a fixed point.  Thus an
injective fixed-point-free assignment has a directed three-cycle. -/
theorem exists_threeCycle_of_three_of_injective
    {α : Type*} {a b c : α}
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (f : α → α)
    (hfixed : f a ≠ a ∧ f b ≠ b ∧ f c ≠ c)
    (hinjective : Function.Injective f)
    (hcover : ∀ x : α, f x = a ∨ f x = b ∨ f x = c) :
    ∃ x y z : α,
      x ≠ y ∧ x ≠ z ∧ y ≠ z ∧
      f x = y ∧ f y = z ∧ f z = x := by
  have hno_ab : ¬ (f a = b ∧ f b = a) := by
    rintro ⟨habf, hbaf⟩
    rcases hcover c with hca | hcb | hcc
    · exact hbc (hinjective (hca.trans hbaf.symm)).symm
    · exact hac (hinjective (hcb.trans habf.symm)).symm
    · exact hfixed.2.2 hcc
  have hno_ac : ¬ (f a = c ∧ f c = a) := by
    rintro ⟨hacf, hcaf⟩
    rcases hcover b with hba | hbb | hbcf
    · exact hbc (hinjective (hba.trans hcaf.symm))
    · exact hfixed.2.1 hbb
    · exact hab (hinjective (hbcf.trans hacf.symm)).symm
  have hno_bc : ¬ (f b = c ∧ f c = b) := by
    rintro ⟨hbcf, hcbf⟩
    rcases hcover a with haa | habf | hacf
    · exact hfixed.1 haa
    · exact hac (hinjective (habf.trans hcbf.symm))
    · exact hab (hinjective (hacf.trans hbcf.symm))
  rcases exists_twoCycle_or_threeCycle_of_three
      hab hac hbc f hfixed hcover with htwo | hthree
  · rcases htwo with ⟨x, y, hxy, hxyf, hyxf⟩
    have hyNamed : y = a ∨ y = b ∨ y = c := by
      rcases hcover x with hxa | hxb | hxc
      · exact Or.inl (hxyf.symm.trans hxa)
      · exact Or.inr (Or.inl (hxyf.symm.trans hxb))
      · exact Or.inr (Or.inr (hxyf.symm.trans hxc))
    have hxNamed : x = a ∨ x = b ∨ x = c := by
      rcases hcover y with hya | hyb | hyc
      · exact Or.inl (hyxf.symm.trans hya)
      · exact Or.inr (Or.inl (hyxf.symm.trans hyb))
      · exact Or.inr (Or.inr (hyxf.symm.trans hyc))
    rcases hxNamed with rfl | rfl | rfl
    · rcases hyNamed with rfl | rfl | rfl
      · exact (hxy rfl).elim
      · exact (hno_ab ⟨hxyf, hyxf⟩).elim
      · exact (hno_ac ⟨hxyf, hyxf⟩).elim
    · rcases hyNamed with rfl | rfl | rfl
      · exact (hno_ab ⟨hyxf, hxyf⟩).elim
      · exact (hxy rfl).elim
      · exact (hno_bc ⟨hxyf, hyxf⟩).elim
    · rcases hyNamed with rfl | rfl | rfl
      · exact (hno_ac ⟨hyxf, hxyf⟩).elim
      · exact (hno_bc ⟨hyxf, hxyf⟩).elim
      · exact (hxy rfl).elim
  · exact hthree

/-- The exact-cover row-map version of the injective classification.  When the
row assignment is injective, the two-cycle branch is excluded and the three
named centers contain a directed three-cycle. -/
theorem exists_threeCycle_of_three_rows_of_injective
    {α : Type*} {a b c : α}
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (rowA rowB rowC : Finset α)
    (hcover : ∀ x : α, x = a ∨ x = b ∨ x = c →
      x ∈ rowA ∨ x ∈ rowB ∨ x ∈ rowC)
    (ha : a ∉ rowA) (hb : b ∉ rowB) (hc : c ∉ rowC)
    (hinjective : Function.Injective (threeRowMap a b c rowA rowB)) :
    ∃ x y z : α,
      x ≠ y ∧ x ≠ z ∧ y ≠ z ∧
      threeRowMap a b c rowA rowB x = y ∧
      threeRowMap a b c rowA rowB y = z ∧
      threeRowMap a b c rowA rowB z = x := by
  let f : α → α := threeRowMap a b c rowA rowB
  have hmap : ∀ x : α, f x = a ∨ f x = b ∨ f x = c := by
    intro x
    by_cases hxa : x ∈ rowA
    · exact Or.inl (by simp [f, threeRowMap, hxa])
    by_cases hxb : x ∈ rowB
    · exact Or.inr (Or.inl (by simp [f, threeRowMap, hxa, hxb]))
    · exact Or.inr (Or.inr (by simp [f, threeRowMap, hxa, hxb]))
  have hfa : f a ≠ a := by
    intro h
    by_cases hrowA : a ∈ rowA
    · exact ha hrowA
    by_cases hrowB : a ∈ rowB
    · have hba : b = a := by simpa [f, threeRowMap, hrowA, hrowB] using h
      exact hab hba.symm
    · have hca : c = a := by simpa [f, threeRowMap, hrowA, hrowB] using h
      exact hac hca.symm
  have hfb : f b ≠ b := by
    intro h
    by_cases hrowA : b ∈ rowA
    · have hab' : a = b := by simpa [f, threeRowMap, hrowA] using h
      exact hab hab'
    by_cases hrowB : b ∈ rowB
    · exact hb hrowB
    · have hcb : c = b := by simpa [f, threeRowMap, hrowA, hrowB] using h
      exact hbc hcb.symm
  have hfc : f c ≠ c := by
    intro h
    by_cases hrowA : c ∈ rowA
    · have hac' : a = c := by simpa [f, threeRowMap, hrowA] using h
      exact hac hac'
    · rcases hcover c (Or.inr (Or.inr rfl)) with hrowA' | hrowB | hrowC
      · exact (hrowA hrowA').elim
      · have hbc' : b = c := by
          simpa [f, threeRowMap, hrowA, hrowB] using h
        exact hbc hbc'
      · exact hc hrowC
  have hresult := exists_threeCycle_of_three_of_injective
    hab hac hbc f ⟨hfa, hfb, hfc⟩ hinjective hmap
  simpa [f] using hresult

end Problem97
