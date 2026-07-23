/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# Universal witness-row escape from global minimality

Production already proves that a nonempty proper subset of a minimal carrier
does not retain global K4.  This file records the quantifier-strengthened
selected-row consequence: one center in the subset blocks *every* possible
ambient selected four-class, rather than merely the row chosen by one fixed
row system.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniversalWitnessClosureScratch

open ATailGlobalMinimalDeletion

attribute [local instance] Classical.propDecidable

/-- Thin adapter exposing the strongest direct subset consequence already
available from production: some center of every nonempty proper carrier
subset has no four-point positive-radius class inside that subset. -/
theorem exists_center_without_local_K4_of_minimal
    {D : CounterexampleData} (hmin : D.Minimal)
    {B : Finset ℝ²}
    (hBne : B.Nonempty)
    (hBA : B ⊆ D.A)
    (hBproper : B ≠ D.A) :
    ∃ center ∈ B, ¬ HasNEquidistantPointsAt 4 B center := by
  exact exists_local_blocker_of_not_global_K4
    (not_hasNEquidistantProperty_of_nonempty_proper_subset
      hmin hBne hBA hBproper)

/-- If K4 fails at `center` on `B`, no selected ambient four-class at that
center can have all four of its witnesses in `B`. -/
theorem selectedFourClass_not_subset_of_not_local_K4
    {A B : Finset ℝ²} {center : ℝ²}
    (hblocked : ¬ HasNEquidistantPointsAt 4 B center)
    (K : SelectedFourClass A center) :
    ¬ K.support ⊆ B := by
  intro hsupportB
  apply hblocked
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ (B.filter fun x ↦ dist center x = K.radius).card :=
      Finset.card_le_card (by
        intro x hx
        exact Finset.mem_filter.mpr
          ⟨hsupportB hx, K.support_eq_radius x hx⟩)

/-- Universal selected-row form of global minimality.

For every nonempty proper carrier subset, there is one center in that subset
such that every possible selected ambient four-class at that center has a
witness outside the subset.  The center is independent of the choice of
selected row. -/
theorem exists_center_every_selectedFourClass_escapes_of_minimal
    {D : CounterexampleData} (hmin : D.Minimal)
    {B : Finset ℝ²}
    (hBne : B.Nonempty)
    (hBA : B ⊆ D.A)
    (hBproper : B ≠ D.A) :
    ∃ center ∈ B, ∀ K : SelectedFourClass D.A center,
      ∃ target ∈ K.support, target ∉ B := by
  classical
  rcases exists_center_without_local_K4_of_minimal
      hmin hBne hBA hBproper with
    ⟨center, hcenterB, hblocked⟩
  refine ⟨center, hcenterB, ?_⟩
  intro K
  have hnotSubset : ¬ K.support ⊆ B :=
    selectedFourClass_not_subset_of_not_local_K4 hblocked K
  by_contra hnoEscape
  apply hnotSubset
  intro target htarget
  by_contra htargetB
  exact hnoEscape ⟨target, htarget, htargetB⟩

/-- Deletion-set form of the universal selected-row constraint.

For every nonempty deletion `U` that leaves at least one carrier point, there
is a remaining center at which every possible selected ambient four-class
meets `U`.  This is the finite hitting constraint supplied by minimality. -/
theorem exists_remaining_center_every_selectedFourClass_hits_deletion
    {D : CounterexampleData} (hmin : D.Minimal)
    {U : Finset ℝ²}
    (hUsub : U ⊆ D.A)
    (hUne : U.Nonempty)
    (hremaining : (D.A \ U).Nonempty) :
    ∃ center ∈ D.A \ U, ∀ K : SelectedFourClass D.A center,
      ∃ target ∈ K.support, target ∈ U := by
  classical
  have hproper : D.A \ U ≠ D.A := by
    rcases hUne with ⟨u, huU⟩
    intro heq
    have huRemaining : u ∈ D.A \ U := by
      rw [heq]
      exact hUsub huU
    exact (Finset.mem_sdiff.mp huRemaining).2 huU
  rcases exists_center_every_selectedFourClass_escapes_of_minimal
      hmin hremaining Finset.sdiff_subset hproper with
    ⟨center, hcenterRemaining, hescape⟩
  refine ⟨center, hcenterRemaining, ?_⟩
  intro K
  rcases hescape K with ⟨target, htargetK, htargetOutside⟩
  refine ⟨target, htargetK, ?_⟩
  by_contra htargetU
  exact htargetOutside (Finset.mem_sdiff.mpr
    ⟨K.support_subset_A htargetK, htargetU⟩)

#print axioms exists_center_without_local_K4_of_minimal
#print axioms selectedFourClass_not_subset_of_not_local_K4
#print axioms exists_center_every_selectedFourClass_escapes_of_minimal
#print axioms exists_remaining_center_every_selectedFourClass_hits_deletion

end ATailUniversalWitnessClosureScratch
end Problem97
