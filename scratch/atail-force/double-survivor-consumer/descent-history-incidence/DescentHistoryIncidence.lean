/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Descent-history incidence

This scratch module records the exact information retained by a descent which
erases pairs lying on common radius classes at one fixed center.

The important point is that uniqueness of a K4 radius on the terminal carrier
does not lift to the ambient carrier.  What does lift is a transversal
statement: every alternate ambient K4 radius meets the erased history.  If the
history is paired co-radially, such a radius contains a whole erased pair.

No production declaration imports this scratch file.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILDescentHistoryIncidence

attribute [local instance] Classical.propDecidable

/-- A paired erased history.  Every erased point has a distinct erased mate at
the same radius about `center`.  Involutivity records that these really are
pairs rather than merely a fixed-point-free successor relation. -/
structure PairedErasureHistory
    (A C : Finset ℝ²) (center : ℝ²) where
  mate : {x : ℝ² // x ∈ A \ C} → {x : ℝ² // x ∈ A \ C}
  mate_ne : ∀ x, (mate x).1 ≠ x.1
  mate_mate : ∀ x, mate (mate x) = x
  same_radius : ∀ x, dist center (mate x).1 = dist center x.1

/-- Restricting an ambient selected class to a subcarrier loses exactly its
points in the erased history.  Thus equality with the subcarrier class is
equivalent to disjointness from that history. -/
theorem selectedClass_eq_subcarrier_iff_disjoint_erasedHistory
    {A C : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hCsub : C ⊆ A) :
    SelectedClass A center radius = SelectedClass C center radius ↔
      Disjoint (SelectedClass A center radius) (A \ C) := by
  constructor
  · intro heq
    rw [Finset.disjoint_left]
    intro x hxAmbient hxErased
    rw [heq] at hxAmbient
    exact (Finset.mem_sdiff.mp hxErased).2
      (mem_selectedClass.mp hxAmbient).1
  · intro hdisjoint
    apply Finset.Subset.antisymm
    · intro x hxAmbient
      rcases mem_selectedClass.mp hxAmbient with ⟨hxA, hxdist⟩
      have hxC : x ∈ C := by
        by_contra hxNotC
        exact (Finset.disjoint_left.mp hdisjoint) hxAmbient
          (Finset.mem_sdiff.mpr ⟨hxA, hxNotC⟩)
      exact mem_selectedClass.mpr ⟨hxC, hxdist⟩
    · intro x hxTerminal
      rcases mem_selectedClass.mp hxTerminal with ⟨hxC, hxdist⟩
      exact mem_selectedClass.mpr ⟨hCsub hxC, hxdist⟩

private theorem exists_mem_both_of_not_disjoint
    {α : Type} [DecidableEq α] {U V : Finset α}
    (hnot : ¬ Disjoint U V) :
    ∃ x, x ∈ U ∧ x ∈ V := by
  by_cases hex : ∃ x, x ∈ U ∧ x ∈ V
  · exact hex
  · exfalso
    apply hnot
    rw [Finset.disjoint_left]
    intro x hxU hxV
    exact hex ⟨x, hxU, hxV⟩

/-- If an ambient radius class meets a paired erased history, it contains both
members of one erased pair. -/
theorem exists_erased_pair_in_ambient_class_of_not_disjoint
    {A C : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (H : PairedErasureHistory A C center)
    (hnot : ¬ Disjoint (SelectedClass A center radius) (A \ C)) :
    ∃ x : {x : ℝ² // x ∈ A \ C},
      x.1 ∈ SelectedClass A center radius ∧
      (H.mate x).1 ∈ SelectedClass A center radius ∧
      x.1 ≠ (H.mate x).1 := by
  rcases exists_mem_both_of_not_disjoint hnot with
    ⟨x, hxClass, hxHistory⟩
  let xh : {x : ℝ² // x ∈ A \ C} := ⟨x, hxHistory⟩
  have hmateA : (H.mate xh).1 ∈ A :=
    (Finset.mem_sdiff.mp (H.mate xh).2).1
  have hxdist : dist center x = radius :=
    (mem_selectedClass.mp hxClass).2
  have hmateClass :
      (H.mate xh).1 ∈ SelectedClass A center radius :=
    mem_selectedClass.mpr
      ⟨hmateA, (H.same_radius xh).trans hxdist⟩
  exact ⟨xh, hxClass, hmateClass, (H.mate_ne xh).symm⟩

/-- Exact ambient-lift alternative for every radius class: either restriction
to the terminal carrier loses nothing, or the ambient class contains an entire
erased history pair. -/
theorem ambient_class_eq_subcarrier_or_contains_erased_pair
    {A C : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hCsub : C ⊆ A)
    (H : PairedErasureHistory A C center) :
    SelectedClass A center radius = SelectedClass C center radius ∨
      ∃ x : {x : ℝ² // x ∈ A \ C},
        x.1 ∈ SelectedClass A center radius ∧
        (H.mate x).1 ∈ SelectedClass A center radius ∧
        x.1 ≠ (H.mate x).1 := by
  by_cases hdisjoint :
      Disjoint (SelectedClass A center radius) (A \ C)
  · exact Or.inl
      ((selectedClass_eq_subcarrier_iff_disjoint_erasedHistory hCsub).2
        hdisjoint)
  · exact Or.inr
      (exists_erased_pair_in_ambient_class_of_not_disjoint H hdisjoint)

/-- If `terminalRadius` is the unique K4 radius on the terminal carrier, every
different ambient K4 radius must meet the erased history. -/
theorem alternate_ambient_K4_radius_hits_erasedHistory
    {A C : Finset ℝ²} {center : ℝ²} {terminalRadius radius : ℝ}
    (hCsub : C ⊆ A)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass C center rho).card → rho = terminalRadius)
    (hradius : 0 < radius)
    (hfourAmbient : 4 ≤ (SelectedClass A center radius).card)
    (hne : radius ≠ terminalRadius) :
    ¬ Disjoint (SelectedClass A center radius) (A \ C) := by
  intro hdisjoint
  have heq :
      SelectedClass A center radius = SelectedClass C center radius :=
    (selectedClass_eq_subcarrier_iff_disjoint_erasedHistory hCsub).2
      hdisjoint
  have hfourTerminal : 4 ≤ (SelectedClass C center radius).card := by
    rw [← heq]
    exact hfourAmbient
  exact hne (hunique radius hradius hfourTerminal)

/-- Paired-history strengthening of the preceding transversal theorem: every
alternate ambient K4 radius contains a complete erased pair. -/
theorem alternate_ambient_K4_radius_contains_erased_pair
    {A C : Finset ℝ²} {center : ℝ²} {terminalRadius radius : ℝ}
    (hCsub : C ⊆ A)
    (H : PairedErasureHistory A C center)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass C center rho).card → rho = terminalRadius)
    (hradius : 0 < radius)
    (hfourAmbient : 4 ≤ (SelectedClass A center radius).card)
    (hne : radius ≠ terminalRadius) :
    ∃ x : {x : ℝ² // x ∈ A \ C},
      x.1 ∈ SelectedClass A center radius ∧
      (H.mate x).1 ∈ SelectedClass A center radius ∧
      x.1 ≠ (H.mate x).1 := by
  apply exists_erased_pair_in_ambient_class_of_not_disjoint H
  exact alternate_ambient_K4_radius_hits_erasedHistory
    hCsub hunique hradius hfourAmbient hne

#print axioms selectedClass_eq_subcarrier_iff_disjoint_erasedHistory
#print axioms ambient_class_eq_subcarrier_or_contains_erased_pair
#print axioms alternate_ambient_K4_radius_contains_erased_pair

end ATAILDescentHistoryIncidence
end Problem97
